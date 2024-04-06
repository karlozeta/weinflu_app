import 'package:flutter/material.dart';
import 'package:weinflu_app/config/app_routes.dart';
import 'package:weinflu_app/design/colors.dart';
import 'package:weinflu_app/design/radius.dart';
import 'package:weinflu_app/models/transaction_detail_model.dart';
import 'package:weinflu_app/models/transaction_model.dart';
import 'package:weinflu_app/pages/new_page.dart';
import 'package:weinflu_app/widgets/custom_money_display.dart';
import 'package:weinflu_app/widgets/home_app_bar_title.dart';
import 'package:weinflu_app/widgets/product_detail_card.dart';
import 'package:weinflu_app/widgets/transaction_detail.dart';

import '../widgets/summary_card.dart';

class HomePage extends StatefulWidget {
  final String storeName;
  const HomePage({super.key, required this.storeName});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var buttonStyleActive = ElevatedButton.styleFrom(
      foregroundColor: WeinFluColors.brandDarkColor,
      backgroundColor: WeinFluColors.brandSecondaryColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)));
  var buttonStyleInactive = ElevatedButton.styleFrom(
      elevation: 0,
      foregroundColor: WeinFluColors.brandLigthDarkColor,
      backgroundColor: WeinFluColors.brandLightColor,
      shadowColor: WeinFluColors.brandLightColor);

  Widget currentDetailWidget = const CategoriesWidget();
  late ButtonStyle categorieBtnStyle;
  late ButtonStyle recentTransactionBtnStyle;

  @override
  void initState() {
    super.initState();
    categorieBtnStyle = buttonStyleActive;
    recentTransactionBtnStyle = buttonStyleInactive;
  }

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
        title: Padding(
          padding: const EdgeInsets.fromLTRB(16, 45, 16, 12),
          child: HomeAppbarTitle(
            storeName: widget.storeName,
          ),
        ),
      ),
      body: Column(
        children: [
          const TopHomePageBody(),
          MidHomePageBody(
            categorieBtnStyle: categorieBtnStyle,
            recentTransactionBtnStyle: recentTransactionBtnStyle,
            categorieBtnAction: () {
              setState(() {
                currentDetailWidget = const CategoriesWidget();
                categorieBtnStyle = buttonStyleActive;
                recentTransactionBtnStyle = buttonStyleInactive;
              });
            },
            recentTransactionBtnAction: () {
              setState(() {
                currentDetailWidget = const RecentTransaction();
                categorieBtnStyle = buttonStyleInactive;
                recentTransactionBtnStyle = buttonStyleActive;
              });
            },
          ),
          Expanded(child: currentDetailWidget)
        ],
      ),
    );
  }
}

class TopHomePageBody extends StatelessWidget {
  const TopHomePageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      width: MediaQuery.of(context).size.width,
      transform: Matrix4.translationValues(0, -12, 0),
      decoration: const BoxDecoration(
        color: WeinFluColors.brandPrimaryColor,
        borderRadius: BorderRadius.only(
          bottomLeft: WeinFluRadius.small,
          bottomRight: WeinFluRadius.small,
        ),
      ),
      height: 389,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 56),
            child: Text(
              'You Budget',
              style: Theme.of(context).textTheme.displaySmall,
            ),
          ),
          CustomMoneyDisplay(
              amount: 2868000.12,
              padding: const EdgeInsets.only(top: 8, right: 4),
              amountStyle: Theme.of(context).textTheme.displayLarge!,
              amountStyleSmall: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: WeinFluColors.brandLightColor)),
          SummaryCard(
            typeSummaryCard: TypeSummaryCard.incomes,
            amount: 700000,
            period: 'From January 1 to January 31',
            action: () => print('incomes'),
          ),
          SummaryCard(
            typeSummaryCard: TypeSummaryCard.spending,
            amount: 900000,
            period: 'From January 1 to January 31',
            action: () => print('spending'),
          ),
        ],
      ),
    );
  }
}

class MidHomePageBody extends StatelessWidget {
  final ButtonStyle categorieBtnStyle;
  final ButtonStyle recentTransactionBtnStyle;
  final void Function()? categorieBtnAction;
  final void Function()? recentTransactionBtnAction;
  const MidHomePageBody(
      {super.key,
      required this.categorieBtnStyle,
      required this.recentTransactionBtnStyle,
      required this.categorieBtnAction,
      required this.recentTransactionBtnAction});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 16, right: 16),
      height: 104,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
          shape: BoxShape.rectangle,
          color: WeinFluColors.brandLightColor,
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(16),
              bottomRight: Radius.circular(16))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ElevatedButton(
              style: categorieBtnStyle,
              onPressed: categorieBtnAction,
              child: const Padding(
                padding: EdgeInsets.symmetric(vertical: 16, horizontal: 40),
                child: Text(
                  'Categories',
                  style: TextStyle(
                      /*color: WeinFluColors.brandDarkColor, */ fontSize: 14),
                ),
              )),
          ElevatedButton(
              style: recentTransactionBtnStyle,
              onPressed: recentTransactionBtnAction,
              child: const Padding(
                padding: EdgeInsets.symmetric(vertical: 16, horizontal: 20),
                child: Text(
                  'Recent transaction',
                  style: TextStyle(
                      /*color: WeinFluColors.brandLigthDarkColor, */ fontSize:
                          14),
                ),
              )),
        ],
      ),
    );
  }
}

class CategoriesWidget extends StatelessWidget {
  const CategoriesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        TextButton(
          style: const ButtonStyle(alignment: Alignment.centerRight),
          child: const Text('View All',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: WeinFluColors.brandPrimaryColor)),
          onPressed: () => {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => const NewPage()))
          },
        ),
        const ProductDetailCard(
          pathToProductImage: 'assets/images/pizza.png',
          amount: 391254.01,
          productName: 'Food & Drink',
          currentSells: '2250',
          percentage: '1.8',
          typeProductDetailCard: TypeProductDetailCard.incomes,
        ),
        const ProductDetailCard(
          typeProductDetailCard: TypeProductDetailCard.incomes,
          pathToProductImage: 'assets/images/tv.png',
          amount: 3176254.01,
          productName: 'Electronics',
          currentSells: '2250',
          percentage: '43.6',
        ),
        const ProductDetailCard(
          typeProductDetailCard: TypeProductDetailCard.outcomes,
          pathToProductImage: 'assets/images/health.png',
          amount: 38.01,
          productName: 'Health',
          currentSells: '110',
          percentage: '25.8',
        ),
      ],
    );
  }
}

class RecentTransaction extends StatelessWidget {
  const RecentTransaction({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListView(
        children: [
          TextButton(
              onPressed: () {
                Navigator.of(context).pushNamed(AppRoutes.allTransactions);
              },
              style: const ButtonStyle(alignment: Alignment.centerRight),
              child: const Text(
                'View All',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 13,
                    color: Color.fromRGBO(53, 97, 254, 1)),
              )),
          TransactionDetailByDay(
              day: 'TUE',
              dayNumber: 4,
              isToday: true,
              listofTransactions: [
                TransactionDetail(
                    movementName: 'Movement Name',
                    transactionDate: 'Monday 3th, September 2023',
                    typeTransaction: TypeTransaction.negative,
                    amount: 420.16),
                TransactionDetail(
                    movementName: 'Movement Name',
                    transactionDate: 'Monday 3th, September 2023',
                    typeTransaction: TypeTransaction.positive,
                    amount: 433.35),
              ]),
          const SizedBox(
            height: 24,
          ),
          TransactionDetailByDay(
              day: 'MON',
              dayNumber: 4,
              isToday: false,
              listofTransactions: [
                TransactionDetail(
                    movementName: 'Movement Name',
                    transactionDate: 'Monday 3th, September 2023',
                    typeTransaction: TypeTransaction.positive,
                    amount: 720.92),
                TransactionDetail(
                    movementName: 'Movement Name',
                    transactionDate: 'Monday 3th, September 2023',
                    typeTransaction: TypeTransaction.negative,
                    amount: 84.45),
                TransactionDetail(
                    movementName: 'Movement Name',
                    transactionDate: 'Monday 3th, September 2023',
                    typeTransaction: TypeTransaction.positive,
                    amount: 137.26),
              ]),
        ],
      ),
    );
  }
}
