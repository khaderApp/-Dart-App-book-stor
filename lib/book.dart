

class Book {

  int? _id ;
  String? _name ;
  int? _quantity ;
  int? _price ;

  /*----------------constructor-----------------------*/
  Book();

  Book.info(this._id, this._name, this._quantity, this._price);

/*-------------set----get------------------------*/

  int get price => _price!;

  set price(int value) {
    if(value>0){
      _price = value;}

  }

  int get quantity => _quantity!;

  set quantity(int value) {
    (value>0)?_quantity = value: print('cant enter quantity by mines');

  }

  String get name => _name! ;

  set name(String value) {
    _name = value;
  }

  int get id => _id! ;

  set id(int value) {
    (value>0)?_id = value:print('enter value more than 3 dget ');
  }


  /*----------------display-------------------------*/

  @override
  String toString() {
    return 'Book{ id: $_id,  name: $_name, quantity: $_quantity, price: $_price}';
  }


}