// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'joke_bloc.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

JokeState _$JokeStateFromJson(Map<String, dynamic> json) => JokeState(
      status: $enumDecodeNullable(_$JokeStatusEnumMap, json['status']) ??
          JokeStatus.initial,
      currentJoke: json['currentJoke'] == null
          ? JokeModel.empty
          : JokeModel.fromJson(json['currentJoke'] as Map<String, dynamic>),
      listJoke: (json['listJoke'] as List<dynamic>?)
              ?.map((e) => JokeModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <JokeModel>[],
    );

Map<String, dynamic> _$JokeStateToJson(JokeState instance) => <String, dynamic>{
      'status': _$JokeStatusEnumMap[instance.status],
      'listJoke': instance.listJoke,
      'currentJoke': instance.currentJoke,
    };

const _$JokeStatusEnumMap = {
  JokeStatus.initial: 'initial',
  JokeStatus.loading: 'loading',
  JokeStatus.loaded: 'loaded',
  JokeStatus.failure: 'failure',
  JokeStatus.voting: 'voting',
};
