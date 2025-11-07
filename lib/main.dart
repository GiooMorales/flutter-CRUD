import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ola_mundo/views/user_list.dart';
import 'package:ola_mundo/provider/users.dart';
import 'package:ola_mundo/routes/app_routes.dart';
import 'package:ola_mundo/views/user_form.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(  
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => Users(),
        ),
      ],
     

      child: MaterialApp(
      routes: {
        AppRoutes.HOME: (_) => UserList(),
        AppRoutes.USER_FORM: (_) => UserForm(),
      },
    ));
  }
  }
