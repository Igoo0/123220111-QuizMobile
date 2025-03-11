import 'package:flutter/material.dart';
import 'listmenu.dart';

class OrderPage extends StatefulWidget {
  final MenuItem menu;

  OrderPage({required this.menu});

  @override
  _OrderPageState createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  final TextEditingController _quantityController = TextEditingController();
  int _totalPrice = 0;

  void _calculateTotalPrice() {
    int quantity = int.tryParse(_quantityController.text) ?? 0;
    setState(() {
      _totalPrice = widget.menu.price * quantity;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Order'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Center(
              child: Column(
                children: [
                  Image.asset(
                    'assets/piring.jfif',
                    height: 180,
                  ),
                  const SizedBox(height: 20),
                  Text(
                    widget.menu.name,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Harga: Rp ${widget.menu.price}',
                    style: TextStyle(fontSize: 13),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _quantityController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Masukkan Jumlah',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              onChanged: (value) {
                _calculateTotalPrice();
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _calculateTotalPrice,
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              child: const Text('Submit'),
            ),
            const SizedBox(height: 20),
            Text(
              'Total Harga: Rp $_totalPrice',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}