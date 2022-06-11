part of 'joke_bloc.dart';

enum JokeStatus {
  initial,
  loading,
  loaded,
  failure,
  voting,
}

@JsonSerializable()
class JokeState extends Equatable {
  /// Status of state
  final JokeStatus status;

  /// List of Joke
  final List<JokeModel> listJoke;

  /// Current Joke that is showing
  final JokeModel currentJoke;

  const JokeState({
    this.status = JokeStatus.initial,
    this.currentJoke = JokeModel.empty,
    this.listJoke = const <JokeModel>[],
  });

  JokeState copyWith({
    JokeStatus? status,
    List<JokeModel>? listJoke,
    JokeModel? currentJoke,
  }) =>
      JokeState(
        status: status ?? this.status,
        listJoke: listJoke ?? this.listJoke,
        currentJoke: currentJoke ?? this.currentJoke,
      );

  @override
  List<Object?> get props => [
        status,
        listJoke,
        currentJoke,
      ];

  factory JokeState.fromJson(Map<String, dynamic> json) =>
      _$JokeStateFromJson(json);

  Map<String, dynamic> toJson() => _$JokeStateToJson(this);
}
