import 'package:weinflu_app/models/transaction_detail_model.dart';

class TransactionModel {
  late bool isCurrentDay;
  late String dateTransaction;
  late List<TransactionDetailModel> transactionDetails;

  TransactionModel(
    this.isCurrentDay, 
    this.dateTransaction, 
    this.transactionDetails
  );
  
}

/*
{
  "isCurrentDay": false,
  "dateTransaction": "01/05/2023",
  "transactionDetails": [
    {
      "movementName": "Movement name",
      "typeTransactionDetailCard": "uncoming",
      "amount": 456.16
    },
    {
      "movementName": "Movement name",
      "typeTransactionDetailCard": "outcoming",
      "amount": 456.16
    },
  ]
},
{
  "isCurrentDay": false,
  "dateTransaction": "01/05/2023",
  "transactionDetails": [
    {
      "movementName": "Movement name",
      "typeTransactionDetailCard": "uncoming",
      "amount": 456.16
    },
    {
      "movementName": "Movement name",
      "typeTransactionDetailCard": "outcoming",
      "amount": 456.16
    },
  ]
}
*/