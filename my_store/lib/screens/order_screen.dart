import 'package:flutter/material.dart';
import 'package:mystore/providers/orders.dart' show Orders;
import 'package:mystore/widgets/app_drawer.dart';
import 'package:provider/provider.dart';
import 'package:mystore/widgets/order_item.dart';

class OrderScreen extends StatelessWidget {
  static const routeName = './orders';
  @override
  Widget build(BuildContext context) {
    final orderData = Provider.of<Orders>(context);
    return Scaffold(
        appBar: AppBar(
          title: Text('Your orders'),
        ),
        drawer: AppDrawer(),
        body: ListView.builder(
            itemCount: orderData.orders.length,
            itemBuilder: (ctx, i) => OrderItem(orderData.orders[i])));
  }
}
