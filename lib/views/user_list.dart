import 'package:flutter/material.dart';
import 'package:ola_mundo/components/user_tile.dart';
import 'package:ola_mundo/routes/app_routes.dart';
import 'package:provider/provider.dart';
import 'package:ola_mundo/provider/users.dart';

class UserList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Users users = Provider.of(context);


    return  Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 59, 132, 193),
        title: Text('Lista de Usuarios'),
        actions: <Widget> [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).pushNamed(
                AppRoutes.USER_FORM);
            },
          ),
        ],
      ),
      body: ListView.builder(
      itemCount: users.count,
      itemBuilder: (ctx, i) => UserTile(users.byIndex(i)),
    ),
    );
  }
}