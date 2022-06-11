import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../utils/utils.dart';
import '../joke.dart';

class JokeContent extends StatelessWidget {
  const JokeContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<JokeBloc, JokeState>(
      builder: (_, state) {
        /// Case loading content
        if (state.status == JokeStatus.loading) {
          return const Center(
            child: SizedBox(
              height: 50,
              width: 50,
              child: CircularProgressIndicator(),
            ),
          );
        }

        /// Case current joke has no content
        if (state.currentJoke.content.isEmpty) {
          return const Text(
            'That\'s all the jokes for today! Come back another day!',
            style: TextStyle(
              color: ColorUtil.black,
              fontSize: 14,
            ),
          );
        }
        return SingleChildScrollView(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: Text(
            state.currentJoke.content,
            style: const TextStyle(
              color: ColorUtil.black,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        );
      },
    );
  }
}
