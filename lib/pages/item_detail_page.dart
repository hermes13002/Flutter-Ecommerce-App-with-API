// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:ecom_api/models/item_model.dart';
import 'package:ecom_api/pages/cart.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ItemDetailPage extends StatefulWidget {
  final Product product;
  const ItemDetailPage({super.key, required this.product});

  @override
  State<ItemDetailPage> createState() => _ItemDetailPageState();
}

class _ItemDetailPageState extends State<ItemDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Details', style: GoogleFonts.poppins(fontSize: 25, color: Colors.blue, fontWeight: FontWeight.bold),),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: ListView(
                children: [
                  SizedBox(height: 15,),
                  Center(child: Image.network(widget.product.image, height: 200,)),
                  SizedBox(height: 20,),
                  Row(
                    children: [
                      Icon(Icons.star_rounded, color: Colors.yellow,),
                      const SizedBox(width: 5,),
                      Text(
                        '4.9',
                        style: GoogleFonts.poppins(fontSize: 20, color: Colors.blue, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20,),
                  Text(
                    widget.product.title,
                    style: GoogleFonts.poppins(fontSize: 23, color: Colors.blue, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 20,),
                  Text(
                    'Description',
                    style: GoogleFonts.poppins(fontSize: 20, color: Colors.grey[800], fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10,),
                  Text(
                    widget.product.description,
                    style: GoogleFonts.poppins(fontSize: 18, color: Colors.grey[800]),
                  ),
                  
                ],
              ),
            ),
          ),

          Container(
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.only(topLeft: Radius.circular(40), topRight: Radius.circular(40))
            ),
            padding: EdgeInsets.all(25),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("\$${widget.product.price}",
                      style: TextStyle(
                        fontFamily: 'Poppins-Bold', 
                        color: Colors.blue,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
      
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          shape: BoxShape.circle
                        ),
                        child: IconButton(onPressed: decrementQuantity, 
                          icon: Icon(Icons.remove),
                          color: Colors.white,
                          ),
                      ),
      
                      SizedBox(
                        width: 20,
                        child: Center(
                          child: Text(
                            quantityCount.toString(),
                            style: TextStyle(
                              fontFamily: 'Poppins-Bold', 
                              color: Colors.blue,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
      
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          shape: BoxShape.circle
                        ),
                        child: IconButton(
                          onPressed: incrementQuantity, 
                          icon: Icon(Icons.add),
                          color: Colors.white,
                          ),
                      )
                    ],)
                  ],
                ),
      
                SizedBox(height: 25,),
      
                GestureDetector(
                  onTap: (){
                    Provider.of<Cart>(context, listen: false).addToCart(widget.product);
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Added to cart'),
                        duration: Duration(seconds: 1),
                      ),
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(20)
                    ),
                    padding: EdgeInsets.all(15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Add to Cart',
                          style: TextStyle(
                            fontFamily: 'Poppins-Bold',
                            fontSize: 18,
                            color: Colors.white
                          ),
                        ),
                        SizedBox(width: 10,),
                        Icon(Icons.shopping_cart_checkout, color: Colors.white, size: 30,)
                      ],
                    ),
                  ),
                )

              ],
            ),
          )
        ],
      ),
    );
  }

  // quantity
  int quantityCount = 0;

// decrement quantity
  void decrementQuantity(){
    setState(() {
      if (quantityCount > 0){
         quantityCount--;
      }
    });
  }

  // increment quantity
  void incrementQuantity(){
    setState(() {
      quantityCount++;
    });
  }


}


