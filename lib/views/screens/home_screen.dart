import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lesson44/controllers/users_controller.dart';
import 'package:lesson44/models/user.dart';
import 'package:lesson44/views/screens/products_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final usersController = UsersController();
  bool isLoading = false;
  @override
  void initState() {
    super.initState();

    isLoading = true;
    usersController.getUsers().then((_) {
      isLoading = false;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Screen"),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (ctx) {
                    return const ProductsScreen();
                  },
                ),
              );
            },
            icon: const Badge(
              label: Text("4"),
              child: Icon(CupertinoIcons.cart),
            ),
          )
        ],
      ),
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : usersController.list.isEmpty
              ? const Center(
                  child: Text("Foydalanuvchilar mavjud emas"),
                )
              : ListView.builder(
                  itemCount: usersController.list.length,
                  itemBuilder: (ctx, index) {
                    User user = usersController.list[index];
                    return ListTile(
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(user.imageUrl),
                      ),
                      title: Text("${user.firstName} ${user.lastName}"),
                      subtitle: Text(user.email),
                    );
                  },
                ),
    );
  }
}
