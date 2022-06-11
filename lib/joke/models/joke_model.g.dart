// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'joke_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

JokeModel _$JokeModelFromJson(Map<String, dynamic> json) => JokeModel(
      content: json['content'] as String,
      type: $enumDecodeNullable(_$JokeVoteTypeEnumMap, json['type']),
    );

Map<String, dynamic> _$JokeModelToJson(JokeModel instance) => <String, dynamic>{
      'content': instance.content,
      'type': _$JokeVoteTypeEnumMap[instance.type],
    };

const _$JokeVoteTypeEnumMap = {
  JokeVoteType.funny: 'funny',
  JokeVoteType.notFunny: 'notFunny',
};
