import 'package:flutter/material.dart';
import 'package:flutter_hive/new_contact_form.dart';

class ContactPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text("Hive Contact Page"),
      ),

      body: Column(
        children: [
          Expanded(child: _buildListView()),
          NewContactForm(),
        ],
      ),
    );
  }

  ListView _buildListView(){
    return ListView(
      children: [
        ListTile(
          title:  Text("Name"),
          subtitle: Text("Age"),
        ),
      ],
    );
  }
}
