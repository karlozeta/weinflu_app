import 'package:flutter/material.dart';
import 'package:weinflu_app/design/colors.dart';
import 'package:weinflu_app/design/copys.dart';
import 'package:weinflu_app/design/radius.dart';
import 'package:weinflu_app/mock/transactions_mock.dart';
import 'package:weinflu_app/widgets/divider_with_text.dart';
import 'package:weinflu_app/widgets/transaction_detail.dart';

class AllTransactions extends StatelessWidget {
  const AllTransactions({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: WeinFluRadius.small,
                bottomRight: WeinFluRadius.small)),
        toolbarHeight: 97,
        backgroundColor: WeinFluColors.brandLightColor,
        leadingWidth: 77,
        leading: Container(
          height: 40,
          width: 40,
          margin: const EdgeInsets.fromLTRB(16, 45, 16, 12),
          decoration: BoxDecoration(
              border: Border.all(color: WeinFluColors.brandLightColorBorder),
              borderRadius: BorderRadius.circular(12)),
          child: IconButton(
            onPressed: () => Navigator.of(context).pop(),
            icon: const Icon(
              Icons.arrow_back,
              color: WeinFluColors.brandPrimaryColor,
            ),
          ),
        ),
        title: Padding(
          padding: const EdgeInsets.fromLTRB(0, 45, 16, 12),
          child: Text(
            WeinfluCopys.recentTrx,
            style: Theme.of(context).textTheme.headlineLarge,
          ),
        ),
        centerTitle: false,
      ),
      backgroundColor: WeinFluColors.brandLightBackgroundColor,
      body: Column(children: [
        Container(
          height: 56,
          margin: const EdgeInsets.symmetric(horizontal: 6, vertical: 32),
          child: ListView.builder(
            padding: const EdgeInsets.all(10),
            itemBuilder: (context, index) {
              var currentCategorie = TransactionsMocks.categories[index];
              return Padding(
                padding: const EdgeInsets.only(right: 12),
                child: MaterialButton(
                    padding: const EdgeInsets.all(10),
                    height: 35,
                    minWidth: 35,
                    color: index == 0
                        ? WeinFluColors.brandPrimaryColor
                        : WeinFluColors.brandLightColor,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                    onPressed: () {},
                    child: Text(
                      currentCategorie,
                      style: TextStyle(
                          fontSize: 13,
                          color: index != 0
                              ? WeinFluColors.brandPrimaryColor
                              : WeinFluColors.brandLightColor),
                    )),
              );
            },
            itemCount: TransactionsMocks.categories.length,
            scrollDirection: Axis.horizontal,
          ),
        ),
        Expanded(
            child: ListView.separated(
                itemBuilder: (context, month) {
                  return ListView.separated(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, day) {
                        var currentDay = TransactionsMocks
                            .transactionDetailByMonth[month]
                            .listofTransactions[day];
                        return Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: TransactionDetailByDay(
                              day: currentDay.day,
                              dayNumber: currentDay.dayNumber,
                              isToday: currentDay.isToday,
                              listofTransactions: currentDay.listofTransactions),
                        );
                      },
                      separatorBuilder: (context, index) => SizedBox(height: 24,),
                      itemCount: TransactionsMocks
                            .transactionDetailByMonth[month]
                            .listofTransactions.length);
                },
                separatorBuilder: (context, month) => Padding(
                  padding: const EdgeInsets.fromLTRB(16, 54, 16, 24),
                  child: DividerWithText(
                      title: TransactionsMocks
                          .transactionDetailByMonth[month + 1].month),
                ),
                itemCount: TransactionsMocks.transactionDetailByMonth.length))
      ]),
    );
  }
}
