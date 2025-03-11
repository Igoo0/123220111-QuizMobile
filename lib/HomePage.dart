import 'package:flutter/material.dart';
import 'AboutPage.dart';
import 'OrderPage.dart';
import 'listmenu.dart';
import 'main.dart';

class HomePage extends StatelessWidget {
  final String username;

  const HomePage({Key? key, required this.username}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
        actions: [
          IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => LoginPage()),
                (route) => false,
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Selamat Datang, $username!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AboutPage()),
                );
              },
              child: Text(
                'Klik untuk ke halaman About',
                style: TextStyle(color: Colors.green, fontSize: 16),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'Daftar Menu:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: menuList.length,
                itemBuilder: (context, index) {
                  final menu = menuList[index];
                  return Card(
                    child: ListTile(
                      leading: Image.asset(
                        'assets/piring.jfif',
                        width: 100,
                        height: 100,
                      ),
                      title: Text(menu.name),
                      subtitle: Text('Rp ${menu.price}'),
                      trailing: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => OrderPage(menu: menu)),
                          );
                        },
                        child: Text('Pesan'),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}