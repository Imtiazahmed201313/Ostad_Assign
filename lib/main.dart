import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Product List',
      home: ProductList(),
    );
  }
}

class ProductList extends StatefulWidget {
  @override
  _ProductListState createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  List<Product> products = [
    Product(name: 'Product 1', price: 10),
    Product(name: 'Product 2', price: 20),
    Product(name: 'Product 3', price: 32),
    Product(name: 'Product 4', price: 81),
    Product(name: 'Product 5', price: 54),
    Product(name: 'Product 6', price: 93),
    Product(name: 'Product 7', price: 23),
    Product(name: 'Product 8', price: 59),
    Product(name: 'Product 9', price: 82),
    Product(name: 'Product 10', price: 75),
    Product(name: 'Product 11', price: 37),
    Product(name: 'Product 12', price: 30),
    Product(name: 'Product 13', price: 79),
    Product(name: 'Product 14', price: 38),
    Product(name: 'Product 15', price: 74),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product List'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          return ProductItem(
            product: products[index],
            onBuyNowPressed: () {
              setState(() {
                products[index].incrementCounter();
                if (products[index].counter == 5) {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: Text('Congratulations!'),
                      content: Text('You\'ve bought 5 ${products[index].name}!'),
                      actions: [
                        TextButton(
                          child: Text('OK'),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    ),
                  );
                }
              });
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=> CartPage(products: products)));
        },
        child: Icon(Icons.shopping_cart),
      ),
    );
  }
}

class Product {
  String name;
  double price;
  int counter;

  Product({required this.name, required this.price, this.counter = 0});

  void incrementCounter() {
    counter++;
  }
}

class ProductItem extends StatelessWidget {
  late final Product product;
  late final VoidCallback onBuyNowPressed;

  ProductItem({required this.product, required this.onBuyNowPressed});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(product.name),
      subtitle: Text('\$${product.price.toStringAsFixed(2)}'),
      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Count: ${product.counter}'),
          ElevatedButton(
            onPressed: onBuyNowPressed,
            child: Text('Buy Now'),
          ),
        ],
      ),
    );
  }
}

class CartPage extends StatelessWidget {
  final List<Product> products;

  CartPage({required this.products});

  @override
  Widget build(BuildContext context) {
    int totalProducts = products.fold(0, (sum, product) => sum + product.counter);

    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
      ),
      body: Center(
        child: Text('Total Products: $totalProducts'),
      ),
    );
  }
}
