import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weinflu_app/design/colors.dart';
import 'package:weinflu_app/models/transaction_detail_model.dart';
import 'package:weinflu_app/models/transaction_model.dart';
import 'package:weinflu_app/utils/weinflu_date_utils.dart';
import 'package:weinflu_app/widgets/custom_money_display.dart';

enum TypeTransactionDetailCard { incomes, outcomes }

class TransactionDetail extends StatelessWidget {
  final TransactionModel transactionModel;

  const TransactionDetail({super.key, required this.transactionModel});

  @override
  Widget build(BuildContext context) {
    var isCurrentDay = transactionModel.isCurrentDay;
    var dateTransaction = transactionModel.dateTransaction;
    var listTransactionDetail = transactionModel.transactionDetails;
    var currentDayColor = isCurrentDay
        ? WeinFluColors.brandOnSuccessColor
        : Theme.of(context).colorScheme.onBackground;
    var date = DateFormat('dd/MM/yyyy').parse(dateTransaction);
    int onlyDay = date.day;
    String weekDay = DateFormat('EEE').format(date).toUpperCase();

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.only(left: 8, right: 8, top: 8),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(2),
                child: Text(weekDay,
                    style: const TextStyle(
                        color: WeinFluColors.brandLigthDarkColor,
                        fontFamily: 'RobotoMono',
                        fontSize: 12)),
              ),
              Padding(
                padding: const EdgeInsets.all(2),
                child: Text(onlyDay.toString(),
                    style: const TextStyle(
                        color: WeinFluColors.brandDarkColor,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'RobotoMono',
                        fontSize: 15)),
              ),
              Padding(
                padding: const EdgeInsets.all(2),
                child: Container(
                  height: 10,
                  width: 30,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: currentDayColor,
                  ),
                ),
              )
            ],
          ),
        ),
        TransactionDetailCard(
          dateTransaction: dateTransaction,
          listTransactionDetail: listTransactionDetail,
        ),
      ],
    );
  }
}

class TransactionDetailCard extends StatelessWidget {
  final String dateTransaction;
  final List<TransactionDetailModel> listTransactionDetail;
  const TransactionDetailCard({
    super.key,
    required this.dateTransaction,
    required this.listTransactionDetail,
  });

  @override
  Widget build(BuildContext context) {
    var date = DateFormat('dd/MM/yyyy').parse(dateTransaction);
    String fullDate = DateFormat(
            'EEEE \'${WeinFluDateUtils.getOrdinalDay(date)}\', MMMM yyyy')
        .format(date);
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(top: 10, right: 12),
        child: Container(
          padding: const EdgeInsets.only(top: 10, bottom: 10, right: 12),
          decoration: const BoxDecoration(
            shape: BoxShape.rectangle,
            color: WeinFluColors.brandLightColor,
            borderRadius: BorderRadius.all(Radius.circular(16)),
          ),
          child: Column(
            children:
                getMovementsDetail(fullDate, listTransactionDetail),
          ),
        ),
      ),
    );
  }

  List<Widget> getMovementsDetail(
      String fullDate, List<TransactionDetailModel> listTransactionDetail) {
    List<Widget> widgetResult = [];
    int countDetail = 0;
    int countTransactionDetail = listTransactionDetail.length;
    for (var transaction in listTransactionDetail) {
      var iconIncomes = const Icon(
        Icons.expand_less,
        size: 30,
        color: WeinFluColors.brandOnSuccessColor,
      );
      var iconSpending = const Icon(
        Icons.expand_more,
        size: 30,
        color: WeinFluColors.brandOnErrorColor,
      );
      var currentBgIconColor = WeinFluColors.brandSuccessColor;
      var currentIcon = iconIncomes;
      // if (transaction.typeTransactionDetailCard ==
      //     TypeTransactionDetailCard.outcomes) {
      //   currentBgIconColor = WeinFluColors.brandErrorColor;
      //   currentIcon = iconSpending;
      // }

      // var typeTransactionDetailCard = transaction.typeTransactionDetailCard;
      var amountStyle = const TextStyle(
          color: WeinFluColors.brandDarkColor,
          fontWeight: FontWeight.bold,
          fontSize: 20);
      var amountStyleSmall = const TextStyle(
          color: WeinFluColors.brandDarkColor,
          fontWeight: FontWeight.bold,
          fontSize: 10);
      // if (typeTransactionDetailCard == TypeTransactionDetailCard.outcomes) {
      //   amountStyle = const TextStyle(
      //       color: WeinFluColors.brandOnErrorColor,
      //       fontWeight: FontWeight.bold,
      //       fontSize: 20);
      //   amountStyleSmall = const TextStyle(
      //       color: WeinFluColors.brandOnErrorColor,
      //       fontWeight: FontWeight.bold,
      //       fontSize: 10);
      // }
      widgetResult.add(
        MovementDetailsWidget(
          currentBgIconColor: currentBgIconColor,
          currentIcon: currentIcon,
          movementName: transaction.movementName,
          amount: transaction.amount,
          fullDate: fullDate,
          amountStyle: amountStyle,
          amountStyleSmall: amountStyleSmall)
        );
      countDetail++;
      if (countDetail < countTransactionDetail) {
        widgetResult.add(const Divider(
          color: WeinFluColors.brandPrimaryColor,
          height: 12,
          indent: 16,
        ));
      }
    }
    return widgetResult;
  }
}

class MovementDetailsWidget extends StatelessWidget {
  const MovementDetailsWidget({
    super.key,
    required this.currentBgIconColor,
    required this.currentIcon,
    required this.movementName,
    required this.amount,
    required this.fullDate,
    required this.amountStyle,
    required this.amountStyleSmall,
  });

  final Color currentBgIconColor;
  final Icon currentIcon;
  final String movementName;
  final String fullDate;
  final double amount;
  final TextStyle amountStyle;
  final TextStyle amountStyleSmall;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
            margin: const EdgeInsets.only(left: 16),
            height: 35,
            width: 35,
            decoration: BoxDecoration(
              color: currentBgIconColor,
              borderRadius: const BorderRadius.all(Radius.circular(10)),
            ),
            child: currentIcon),
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(movementName,
                    textAlign: TextAlign.left,
                    style: const TextStyle(
                        color: WeinFluColors.brandDarkColor,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'RobotoMono',
                        fontSize: 12)),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text(
                    fullDate,
                    style: const TextStyle(
                        color: WeinFluColors.brandLigthDarkColor,
                        fontFamily: 'RobotoMono',
                        fontSize: 10),
                  ),
                ),
              ],
            ),
          ),
        ),
        CustomMoneyDisplay(
          padding: const EdgeInsets.only(top: 4, right: 2),
          amount: amount,
          amountStyle: amountStyle,
          amountStyleSmall: amountStyleSmall,
        )
      ],
    );
  }
}
