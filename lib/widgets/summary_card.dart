import 'package:flutter/material.dart';
import 'package:weinflu_app/design/colors.dart';
import 'package:weinflu_app/design/radius.dart';
import 'package:weinflu_app/widgets/custom_money_display.dart';

enum TypeSummaryCard { incomes, spending }

class SummaryCard extends StatelessWidget {
  final TypeSummaryCard typeSummaryCard;
  final double amount;
  final String period;
  final void Function()? action;

  const SummaryCard(
      {super.key,
      required this.typeSummaryCard,
      required this.amount,
      required this.period,
      this.action});

  @override
  Widget build(BuildContext context) {
    var incomesIcon = const Icon(
      Icons.arrow_upward,
      color: WeinFluColors.brandOnSuccessColor,
    );
    var spendingIcon = const Icon(
      Icons.arrow_downward,
      color: WeinFluColors.brandOnErrorColor,
    );
    return Container(
      height: 92,
      margin: const EdgeInsets.only(top: 8),
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          Container(
            height: 40,
            width: 40,
            margin: const EdgeInsets.only(right: 8),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.all(WeinFluRadius.xs),
                border: Border.all(color: WeinFluColors.brandPrimaryColor)),
            child: typeSummaryCard == TypeSummaryCard.incomes
                ? incomesIcon
                : spendingIcon,
          ),
          Expanded(
            child: Text(
              typeSummaryCard == TypeSummaryCard.incomes
                  ? 'Incomes'
                  : 'Spending',
              style: Theme.of(context).textTheme.displaySmall,
            ),
          ),
          Container(
            margin: const EdgeInsets.only(right: 16),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              CustomMoneyDisplay(
                  padding: const EdgeInsets.only(top: 2, right: 5),
                  amount: amount,
                  amountStyle: Theme.of(context).textTheme.displayMedium!,
                  amountStyleSmall: Theme.of(context).textTheme.displaySmall!),
              Padding(
                padding: const EdgeInsets.all(2.0),
                child: Text(
                  period,
                  style: const TextStyle(
                      color: WeinFluColors.brandLightColor,
                      fontFamily: 'RobotoMono',
                      fontSize: 10),
                ),
              ),
            ]),
          ),
          Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(12)),
                border: Border.all(color: WeinFluColors.brandLightColorBorder)),
            child: IconButton(
              icon: const Icon(
                Icons.chevron_right,
                color: Colors.white,
              ),
              onPressed: action,
            ),
          ),
        ],
      ),
    );
  }
}
