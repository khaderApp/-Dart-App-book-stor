import 'book.dart';
import 'dart:io';

void main() {
  final String userName = 'khader';
  final String usrePassword = '1234';
  bool SystemOff = true;
  List<Book> bookData = [];
  List<Book> bookBill = [];
  var booke = Book();
  bool logins = login(userName, usrePassword);
  if(logins) {
    print('''
   *******************************************************
   *     welcome $userName , the System is read now   *
   *******************************************************
   ''');

    do {
      print('''
   ==== main menu ===
   1- Dashboard
   2- customer shopping cart
   3- exit
   ''');
      stdout.write('Enter your choice :');
      int userChoice = int.parse(stdin.readLineSync()!);

      switch (userChoice) {
        case 1:
          dashBoard(bookData,booke);
          break;

        case 2:
          customerShopping(bookBill, bookData);
          break;

        case 3:
          SystemOff = false;
          break;

        default:
          print('please choice from the menu !!');
      }
    } while (SystemOff);

    print('''
   *******************************************************
   *     good day  $userName , the System is Off now   *
   *******************************************************
   ''');
  }else{ print('XXXX the System is locked XXXXX');}

  }


/*login */
 bool login (String userName, String usrePassword) {
   bool? reslt;
  stdout.write('Enter user name : ');
  String userNameInpot = stdin.readLineSync()!;
  stdout.write('Enter user password : ');
  String userPasswordInpot = stdin.readLineSync()!;

  for (int i = 0; i <= 4; i++) {
    if (userName == userNameInpot && usrePassword == userPasswordInpot) {
      print('login Success');
       reslt = true;
       break;

    } else {
      if (userName == userNameInpot && usrePassword != userPasswordInpot) {
        print('the password is not true try again :');
        userPasswordInpot = stdin.readLineSync()!;

      } else {
        print('the user name is not true try again: ');
        userNameInpot = stdin.readLineSync()!;
      }
    }
    if ( i == 4 ){

      reslt = false ; }
  }
  return reslt!;
}



/*--------DASH BOARD METHOD---------------*/
dashBoard(List<Book> bookData,booke) {
  bool dashBOff = true;
  do {
    print('''
  ====Dash Board Menu ====
  1- add book in store
  2- show all books available in store 
  3- searching for a book by name in store
  4- Exit
  ''');
    stdout.write('Enter your choice :');
    int userChoiceDash = int.parse(stdin.readLineSync()!);

    switch (userChoiceDash) {
      case 1:
        addBookStore(bookData, booke);
        break;

      case 2:
        showAllBooks(bookData);
        break;
      case 3:
        searchBookName(bookData, booke);
        break;
      case 4:
        dashBOff =false;
        break;

      default:
        print('please choice from the Dash Board Menu');
    }
  } while (dashBOff);
}

/*----add book--*/
addBookStore(List<Book> bookData, booke ){

  stdout.write('Enter book ID here :');
  int id = int.parse(stdin.readLineSync()!);
  stdout.write('Enter book name here :');
  String name = stdin.readLineSync()!;
  stdout.write('Enter book quantity here :');
  int quantity = int.parse(stdin.readLineSync()!);
  stdout.write('Enter book price here :');
  int price = int.parse(stdin.readLineSync()!);

  bookData.add(Book.info(id, name, quantity, price));
  print(bookData[bookData.length-1].toString());

}

showAllBooks(List<Book>bookData, ){

  for(int i = 0 ; i<bookData.length;i++){
    print(bookData[i].toString());
  }

}

searchBookName(List<Book>bookData, booke){

  stdout.write('Enter Book name to search : ');
  String bookSearch = stdin.readLineSync()!;
  int? indexS ;
  bool ishere = false;
  for(int i = 0 ; i<bookData.length ; i++) {
    if (bookSearch==bookData[i].name){
      indexS= i;
      ishere= true;
    }
  }
  if(ishere){
    print(bookData[indexS!].toString());
  }else{print('the book is not found !!');}
}
/*--------------------------------------------*/
/* ******************************************** */
/*------------------customer shopping--METHOD----------------*/
customerShopping(List<Book>bookBill,List<Book>bookData){

  bool customerOff = true ;
  do {
    print('''
  === customer menu ====
  1- add book
  2- show all books purchased by the customer 
  3- Delete book 
  4- update bill book
  5- calculate Total Price
  6- Exit to main
  ''');

    stdout.write('Enter your choice :');
    int userChoiceCustom = int.parse(stdin.readLineSync()!);

    switch (userChoiceCustom) {
      case 1 :
        addBookBill(bookBill, bookData);
        break;

      case 2 :
        showBookCustomer(bookBill);
        break;

      case 3 :
        deleteBook(bookBill);
        break;

      case 4 :
        updateBill(bookBill);
        break;

      case 5 :
        calculateTotalPrice(bookBill);
        break;

      case 6 :
        customerOff = false ;
        break;

      default:
        print('please choice from customer menu !!');
    }
  }while(customerOff);
}
/*-----------customer-method------------*/
showBookCustomer(List<Book>bookBill,){

  for(int i = 0 ; i<bookBill.length ; i++){
    print(bookBill[i].toString());

  }

}

addBookBill(List<Book>bookBill, List<Book>bookData){

  showBookCustomer(bookBill);
  /* ************************************* */
  stdout.write('Enter book name to add to Bill :');
  String bookNBill = stdin.readLineSync()!;
  stdout.write('Enter book ID to add to Bill :');
  int bookIdBill = int.parse(stdin.readLineSync()!);
  stdout.write('Enter book quantity to add to Bill :');
  int bookQuantityBill = int.parse(stdin.readLineSync()!);
  int? pprice;
 for(int i = 0 ; i<bookData.length;i++){
   if(bookData[i].id == bookIdBill  ){
     pprice = bookData[i].price ;
   }
 }


   bookBill.add(Book.info(bookIdBill , bookNBill , bookQuantityBill , pprice));
   print(bookBill[bookBill.length-1].toString());
}

deleteBook(List<Book>bookBill){
  int? indexD ;
  stdout.write('enter name to delete :');
  String bookNameDelete = stdin.readLineSync()!;
  for(int i =0 ; i<bookBill.length;i++){
    if(bookBill[i].name == bookNameDelete){
      indexD = i;
      print('Delete is success ');
      break;
    }
  }
  bookBill.removeAt(indexD!);

}

updateBill(List<Book>bookBill){

  stdout.write('enter name of book to update:');
  String newBookName = stdin.readLineSync()!;
  stdout.write('enter the new Price of book to update:');
  int newBookQuantity = int.parse(stdin.readLineSync()!);

  for(int i=0; i<bookBill.length;i++){
    if(newBookName == bookBill[i].name){
      bookBill[i].quantity = newBookQuantity;
      print('update quantity is Success !!');
      break;
    }
  }


}

calculateTotalPrice(List<Book>bookBill){

  double total = 0 ;

  for(int i=0; i<bookBill.length;i++){

    double quantity = bookBill[i].quantity.toDouble();
    double price = bookBill[i].price.toDouble();
    total += quantity*price ;
  }
  print('The Total Bill of book is: $total \$ ');

}

