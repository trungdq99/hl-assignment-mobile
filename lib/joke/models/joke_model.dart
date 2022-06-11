import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'joke_model.g.dart';

enum JokeVoteType {
  funny,
  notFunny,
}

@JsonSerializable()
class JokeModel extends Equatable {
  final String content;
  final JokeVoteType? type;

  const JokeModel({
    required this.content,
    this.type,
  });

  static const JokeModel empty = JokeModel(content: '');

  JokeModel copyWith({
    String? content,
    JokeVoteType? type,
  }) =>
      JokeModel(
        content: content ?? this.content,
        type: type ?? this.type,
      );

  factory JokeModel.fromJson(Map<String, dynamic> json) =>
      _$JokeModelFromJson(json);

  Map<String, dynamic> toJson() => _$JokeModelToJson(this);

  @override
  String toString() => toJson().toString();

  @override
  List<Object?> get props => [
        content,
        type,
      ];
}
