import 'package:weinflu_app/widgets/transaction_detail.dart';

class TransactionDetailModel {
  late String movementName;
  // late TypeTransactionDetailCard typeTransactionDetailCard;
  late double amount;

  TransactionDetailModel(
    this.movementName,
    // this.typeTransactionDetailCard, 
    this.amount
  );
}
