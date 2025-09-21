import 'package:flutter/material.dart';
import 'package:flutter_edit_lab/providers/items_provider.dart';
import 'package:flutter_edit_lab/providers/user_profile.dart';
import 'package:flutter_edit_lab/screens/edit_item_screen.dart';
import 'package:flutter_edit_lab/screens/items_list_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ItemProvider()),
        ChangeNotifierProvider(create: (context) => UserProfileProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      initialRoute: ItemListScreen.routeName,
      routes: {
        ItemListScreen.routeName: (context) => const ItemListScreen(),
        EditItemScreen.routeName: (context) => const EditItemScreen(),
      },
    );
  }
}
