part of 'joke_bloc.dart';

abstract class JokeEvent extends Equatable {
  const JokeEvent();

  @override
  List<Object> get props => [];
}

class JokeEventFetchJoke extends JokeEvent {}

class JokeEventVote extends JokeEvent {
  final JokeVoteType voteType;

  const JokeEventVote({
    required this.voteType,
  });
}
