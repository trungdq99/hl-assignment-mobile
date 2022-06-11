import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../utils/utils.dart';
import '../joke.dart';

class JokeVoteButton extends StatelessWidget {
  const JokeVoteButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<JokeBloc, JokeState>(
      builder: (_, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 40,
          ),
          child: Row(
            children: [
              /// Button for voting funny
              Expanded(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: ColorUtil.blue,
                    elevation: 0,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.zero,
                    ),
                    padding: const EdgeInsets.all(10),
                  ),
                  onPressed: state.status == JokeStatus.voting ||
                          state.currentJoke.content.isEmpty
                      ? null
                      : () {
                          context.read<JokeBloc>().add(const JokeEventVote(
                              voteType: JokeVoteType.funny));
                        },
                  child:  const FittedBox(
                    child: Text(
                      'This is Funny!',
                      style: TextStyle(
                        color: ColorUtil.white,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ),
              ),

              /// Spacing
              const SizedBox(width: 25),

              /// Button for voting not funny
              Expanded(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: ColorUtil.green,
                    elevation: 0,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.zero,
                    ),
                    padding: const EdgeInsets.all(10),
                  ),
                  onPressed: state.status == JokeStatus.voting ||
                          state.currentJoke.content.isEmpty
                      ? null
                      : () {
                          context.read<JokeBloc>().add(const JokeEventVote(
                              voteType: JokeVoteType.notFunny));
                        },
                  child: const FittedBox(
                    child: Text(
                      'This is not funny.',
                      style: TextStyle(
                        color: ColorUtil.white,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
