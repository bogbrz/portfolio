import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/features/pages/savings_page/cubit/savings_page_cubit.dart';
import 'package:portfolio/features/pages/savings_page/set_goal_page.dart';

class SavingGoalWidget extends StatelessWidget {
  const SavingGoalWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SavingsPageCubit, SavingsPageState>(
      builder: (context, state) {
        double progress = 0;
        if (state.saldo == null) {
          progress = 0;
        } else {
          progress = state.saldo![0].worth / state.saldo![0].savingsGoal;
        }

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: InkWell(
            borderRadius: BorderRadius.circular(10),
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => SetGoalPage()));
            },
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: const Color.fromARGB(55, 146, 146, 146),
              ),
              child: Column(
                spacing: 16,
                children: [
                  Row(
                    children: [
                      Text(
                        "Goal > ${state.saldo?[0].goalDate.toDate().toString()}",
                        textAlign: TextAlign.left,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        "2137.00zł out of ${state.saldo?[0].savingsGoal}",
                        textAlign: TextAlign.left,
                      ),
                    ],
                  ),
                  LinearProgressIndicator(
                    minHeight: MediaQuery.of(context).size.height * 0.0075,
                    borderRadius: BorderRadius.circular(5),
                    value: progress,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
