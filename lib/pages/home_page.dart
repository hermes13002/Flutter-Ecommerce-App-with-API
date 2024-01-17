import 'package:ecom_api/models/api_service.dart';
import 'package:ecom_api/models/item_model.dart';
import 'package:ecom_api/pages/cart.dart';
import 'package:ecom_api/pages/item_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';


class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final apiService = ApiService();

    return Scaffold(
      appBar: AppBar(
        title: Text('EXCELSIOR', style: GoogleFonts.rubikBurned(fontSize: 25, color: Colors.blue),),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CartScreen(),
                ),
              );
            },
          ),
        ],
      ),
      body: FutureBuilder<List<Product>>(
        future: apiService.getProducts(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            // return Center(child: Text('Error: ${snapshot.error}'));
            return Center(child: Text('Failed to load data, check internet connection'),);
          } else {
            final products = snapshot.data!;
            return SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Column(
                  children: [
                    SizedBox(height: 7,),
                    TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        suffixIcon:  Icon(Icons.search),
                        hintText: 'Search'
                      ),
                      style: TextStyle(),
                    ),
                    SizedBox(height: 30,),

                    SizedBox(
                      height: 170,
                      width: 400,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: products.length,
                        itemBuilder: (context, index) {
                          final product = products[index];

                          return Container(
                            width: 300,
                            margin: EdgeInsets.only(left: 15),
                            padding: EdgeInsets.all(15),
                            decoration: BoxDecoration(
                              color: Colors.lightBlue[300],
                              border: Border.all(width: 2, color: Colors.lightBlue),
                              borderRadius: BorderRadius.circular(25)
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  width: 120,
                                  height: 140,
                                  child: Container(
                                    padding: EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(25)
                                    ),
                                    child: Image.network(product.image)
                                    ),
                                ),
                                Center(child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(height: 20,),
                                    Icon(
                                      Icons.favorite_outline,
                                      color: Colors.white,
                                      size: 23,
                                    ),
                                    SizedBox(height: 8,),
                                    Expanded(child: Text('\$${product.price.toString()}',
                                      style: GoogleFonts.poppins(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 25),
                                      maxLines: 3,
                                      overflow: TextOverflow.fade,
                                    )),
                                  ],
                                ))
                              ],
                            )
                          );
                        },
                      ),
                    ),
                    SizedBox(height:40,),


                    Column(
                      children: [
                        Padding( 
                          padding: const EdgeInsets.symmetric(horizontal: 25.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Featured', style: GoogleFonts.poppins(color: Colors.blue, fontWeight: FontWeight.w600, fontSize: 20),),
                              Text("See All", style: GoogleFonts.poppins(color: Colors.blue, fontWeight: FontWeight.w600, fontSize: 20),)
                            ],
                          ),
                        ),
                        SizedBox(height: 15,),

                        SizedBox(
                          height: 300,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: products.length,
                            itemBuilder: (context, index) {
                              final product = products[index];
                        
                                return GestureDetector(
                                  onTap: (){
                                    Navigator.push(context, 
                                      MaterialPageRoute(builder: (context) => ItemDetailPage(
                                        product: product,
                                        )
                                      )
                                    );
                                  },
                                  child: Container(
                                  margin: EdgeInsets.only(left: 15),
                                  decoration: BoxDecoration(
                                    // boxShadow: [BoxShadow(blurRadius: 20)],
                                    // border: Border.all(width: 2, color: Colors.lightBlue),
                                    borderRadius: BorderRadius.circular(25)
                                  ),
                                  child: SizedBox(
                                    width: 200,
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Center(
                                          child: SizedBox(
                                            width: 120,
                                            height: 160,
                                            child: Container(
                                              decoration: BoxDecoration(
                                              image: DecorationImage(image: NetworkImage(product.image),
                                              fit: BoxFit.contain),
                                              ),
                                            ), 
                                          ),
                                        ),
                                        SizedBox(height: 16,),
                                        SizedBox(
                                          width: 240,
                                          height: 120,
                                          child: Container(
                                            padding: EdgeInsets.all(10),
                                            decoration: BoxDecoration(
                                              color: Colors.lightBlue[300],
                                              // border: Border.all(width: 2),
                                              borderRadius: BorderRadius.all(Radius.circular(25))
                                            ),
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment. start,
                                              children: [
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  children: [
                                                  Text('\$${product.price.toString()}', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 17, fontFamily: 'Poppins-Light'),),
                                                  Text(product.category, style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 14, fontFamily: 'Poppins-Light'),),
                                                ],),
                                                SizedBox(height: 10,),
                                                Expanded(
                                                  child: Text(
                                                    product.title,
                                                    style: GoogleFonts.poppins(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 15),
                                                    // softWrap: true,
                                                    maxLines: 3,
                                                    overflow: TextOverflow.fade,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              );
                              
                              // ListTile(
                              //   leading: CircleAvatar(
                              //     backgroundImage: NetworkImage(product.image),
                              //   ),
                              //   title: Text(product.title),
                              //   subtitle: Text('\$${product.price.toString()}'),
                              //   trailing: IconButton(
                              //     icon: const Icon(Icons.add_shopping_cart),
                              //     onPressed: () {
                              //       Provider.of<Cart>(context, listen: false)
                              //           .addToCart(product);
                              //       ScaffoldMessenger.of(context).showSnackBar(
                              //         const SnackBar(
                              //           content: Text('Added to cart'),
                              //           duration: Duration(seconds: 1),
                              //         ),
                              //       );
                              //     },
                              //   ),
                              // );
                            },
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            );
            
            
          }
        },
      ),
    );
  }
}

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Cart', style: GoogleFonts.poppins(color: Colors.blue, fontWeight: FontWeight.bold),),
        centerTitle: true,
        surfaceTintColor: Colors.white,
      ),
      body: cart.items.isEmpty
          ? Center(child: Text('Your cart is empty.', style: GoogleFonts.poppins(color: Colors.blue, fontWeight: FontWeight.bold),))
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: cart.items.length,
                    itemBuilder: (context, index) {
                      final product = cart.items[index];
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListTile(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
                          tileColor: Colors.grey[300],
                          leading: CircleAvatar(
                            backgroundImage: NetworkImage(product.image),
                            backgroundColor: Colors.white,
                          ),
                          title: Text(product.title, style: GoogleFonts.poppins(color: Colors.blue, fontWeight: FontWeight.bold),),
                          subtitle: Text('\$${product.price.toString()}', style: GoogleFonts.poppins(color: Colors.blue, fontWeight: FontWeight.bold),),
                          trailing: IconButton(
                            icon: const Icon(Icons.remove_shopping_cart),
                            onPressed: () {
                              Provider.of<Cart>(context, listen: false)
                                  .removeFromCart(product);
                            },
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Container(
                  width: 400,
                  decoration: BoxDecoration(
                    color: Colors.blue[300],
                    borderRadius: const BorderRadius.only(topLeft: Radius.circular(40), topRight: Radius.circular(40))
                  ),
                  padding: const EdgeInsets.all(25),
                  child: Center(
                    child: Text(
                      'Total: \$${cart.totalPrice.round().toString()}',
                      style: GoogleFonts.poppins(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}
