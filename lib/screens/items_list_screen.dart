import 'package:flutter/material.dart';
import 'package:flutter_edit_lab/providers/items_provider.dart';
import 'package:flutter_edit_lab/providers/user_profile.dart';
import 'package:flutter_edit_lab/screens/edit_item_screen.dart';
import 'package:provider/provider.dart';

class ItemListScreen extends StatelessWidget {
  static const routeName = '/';
  const ItemListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Consumer<UserProfileProvider>(
          builder: (context, userProfileProvider, child) {
            return Text(
              'รายการสินค้า (ผู้ใช้: ${userProfileProvider.username})',
            );
          },
        ),
      ),

      body: Consumer<ItemProvider>(
        builder: (context, itemProvider, chid) {
          return ListView.builder(
            itemCount: itemProvider.items.length,
            itemBuilder: (context, ind) {
              final item = itemProvider.items[ind];
              return ListTile(
                title: Text('${item.name}'),
                subtitle: Text('${item.description}'),
                trailing: Text('${item.price} บาท'),
                onTap: () {
                  Navigator.of(
                    context,
                  ).pushNamed(EditItemScreen.routeName, arguments: item.id);
                },
              );
            },
          );
        },
      ),
    );
  }
}
