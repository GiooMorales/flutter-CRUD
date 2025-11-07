import 'package:flutter/material.dart';
import 'package:ola_mundo/models/user.dart';
import 'package:ola_mundo/provider/users.dart' show Users;
import 'package:ola_mundo/routes/app_routes.dart';
import 'package:provider/provider.dart';

class UserTile extends StatelessWidget {

  final User user;

const UserTile(this.user);

  @override
  Widget build(BuildContext context) {

    final avatar = user.avatarUrl == null || user.avatarUrl.isEmpty
    ? CircleAvatar(child: Icon(Icons.person) )
      : CircleAvatar(
        backgroundImage: NetworkImage(user.avatarUrl),
      );
    return ListTile(
      leading: avatar,
      title: Text(user.name),
      subtitle: Text(user.email),
      trailing: Container(
        width: 100,
        child: Row(
        children: <Widget> [
          IconButton(
            icon: Icon(Icons.edit),
            color: Colors.blue,
            onPressed: () {
              Navigator.of(context).pushNamed(
                AppRoutes.USER_FORM, 
                arguments: user,
              );
            },
          ),
          IconButton(
            icon: Icon(Icons.delete),
            color: Colors.red,
            onPressed: () {
              showDialog(context: context,
              builder: (ctx) => AlertDialog(
                title: Text('Excluir Usuário'),
                content: Text('Tem certeza que deseja excluir o usuário ${user.name}?'),
                actions: <Widget>[
                  TextButton(
                    onPressed: () {
                      Provider.of<Users>(context, listen: false).remove(user);
                      Navigator.of(ctx).pop();
                    },
                    child: Text('Sim'),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.of(ctx).pop();
                    },
                    child: Text('Não'),
                  ),
                ],
              ),
            );
            },
          ),
        ],
      ),
      ),
    );
  }
}