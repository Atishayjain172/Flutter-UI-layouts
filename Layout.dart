class HotDeals extends StatefulWidget {
  String title;
  HotDeals(this.title);
  @override
  State<StatefulWidget> createState() {
    return _HotDeals(title);
  }
}
class _HotDeals extends State<HotDeals> {
  List<Product> data=[];
  String title;
  _HotDeals(this.title);
  void initState() {
    super.initState();
  }

  Future<List<Product>> _getdata() async {
   //add data to the list in this function
    Product pr=new Product('Tomato Sauce','180','https://images-na.ssl-images-amazon.com/images/I/81LYS6x%2BD6L._SL1500_.jpg','230','500 gm','23');
    data.add(pr);
    return data;
  }


  Widget build(BuildContext context) {
    return
       Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              sectionHeader(title),
           SizedBox(
             height: 250,
             child: FutureBuilder(
              future: _getdata(),
              builder: (BuildContext context, AsyncSnapshot snapshot){
                if(data.length==0){
                  return Container(
                    child: Center(
                      child: Text("Loading..."),
                    ),
                  );
                }
                else{
                  return SizedBox(
                    height: 250,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: snapshot.data.length,
                      itemBuilder: (BuildContext context,int index){
                        return Container(
                          width: 180,
                          height: 180,
                          // color: Colors.red,
                          margin: EdgeInsets.only(left: 20),
                          child: Stack(
                            children: <Widget>[
                              Container(
                                  width: 180,
                                  height: 180,
                                  child: RaisedButton(
                                      color: white,
                                      elevation: 20,
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(5)),
                                      onPressed: (){
                                        //on tap functionality add here
                                      },
                                      child: Image.network(snapshot.data[index].image,
                                          width: 100))),
                              Positioned(
                                bottom: 0,
                                left: 10,
                                child:
                                     Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                     Text(snapshot.data[index].name, style: foodNameText),
                                    Text("\u20B9"+snapshot.data[index].price, style: priceText),
                                  ],
                                )

                              ),
                              Positioned(
                                  top: 10,
                                  left: 10,
                                  child: (snapshot.data[index].discount != null)
                                      ? Container(
                                    padding:
                                    EdgeInsets.only(top: 5, left: 10, right: 10, bottom: 5),
                                    decoration: BoxDecoration(
                                        color: Colors.grey[600],
                                        borderRadius: BorderRadius.circular(50)),
                                    child: Text('-' + snapshot.data[index].discount.toString() + '%',
                                        style: TextStyle(
                                            color: Colors.white, fontWeight: FontWeight.w700)),
                                  )
                                      : SizedBox(width: 0))
                            ],
                          ),
                        );
                      },
                    ),
                  );
                }
              },
          ),
           ),
      ]
        ),
      );
  }
Widget sectionHeader(String headerTitle) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Container(
        margin: EdgeInsets.only(left: 15, top: 10),
        child: Text(headerTitle, style: h4),
      ),
    ],
  );
}
}


class Product
{
  String name,
        price,
        image,
        cutprice,
        quantity;
  String discount;

  Product(
    this.name,
    this.price,
    this.discount,
    this.image,
    this.cutprice,
      this.quantity
  );

}


