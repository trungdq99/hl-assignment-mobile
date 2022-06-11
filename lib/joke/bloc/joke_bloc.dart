import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:logger/logger.dart';
import '../joke.dart';

part 'joke_bloc.g.dart';

part 'joke_event.dart';
part 'joke_state.dart';

class JokeBloc extends HydratedBloc<JokeEvent, JokeState> {
  final JokeRepository repository;
  JokeBloc({
    required this.repository,
  }) : super(const JokeState()) {
    on<JokeEventFetchJoke>(_onJokeEventFetchJoke);
    on<JokeEventVote>(_onJokeEventVote);
  }

  @override
  JokeState fromJson(Map<String, dynamic> json) => JokeState.fromJson(json);

  @override
  Map<String, dynamic> toJson(JokeState state) => state.toJson();

  Future<void> _onJokeEventFetchJoke(
      JokeEventFetchJoke event, Emitter<JokeState> emit) async {
    try {
      emit(state.copyWith(status: JokeStatus.loading));

      /// Fetch list of joke
      List<String> fetchDataResult = await repository.fetchJoke();

      JokeModel? joke;

      final listJoke = <JokeModel>[...state.listJoke];
      if (listJoke.isNotEmpty) {
        /// Remove joke that is showed before
        fetchDataResult = fetchDataResult
            .where((e) => !listJoke.any((element) => element.content == e))
            .toList();
      }

      if (fetchDataResult.isNotEmpty) {
        joke = JokeModel(content: fetchDataResult.first);
        listJoke.add(joke);
      }

      emit(state.copyWith(
        status: JokeStatus.loaded,
        currentJoke: joke ?? JokeModel.empty,
        listJoke: listJoke,
      ));
    } catch (e) {
      Logger().e(e);
      emit(state.copyWith(
        status: JokeStatus.failure,
      ));
    }
  }

  Future<void> _onJokeEventVote(
      JokeEventVote event, Emitter<JokeState> emit) async {
    if (state.currentJoke.content.isNotEmpty == true) {
      try {
        emit(state.copyWith(
          status: JokeStatus.voting,
        ));

        final List<JokeModel> listJoke = <JokeModel>[...state.listJoke];
        JokeModel joke = state.currentJoke.copyWith(type: event.voteType);

        listJoke
          ..removeWhere((element) => element.content == joke.content)
          ..add(joke);

        /// Update data
        emit(state.copyWith(
          listJoke: listJoke,
        ));

        /// Fetch new joke
        add(JokeEventFetchJoke());
      } catch (e) {
        Logger().e(e);
        emit(state.copyWith(
          status: JokeStatus.failure,
        ));
      }
    }
  }
}
