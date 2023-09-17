import './psiholozi.dart';
import'./psiholozi_data.dart'
import 'package:flutter/material.dart';

class PsychologistWidget extends StatelessWidget {
  final Psychologist psychologist;
  PsychologistWidget(this.psychologist);
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(psychologist.name),
      subtitle: Text(psychologist.surname),
      trailing: Text(psychologist.contact),
    );
  }
}

// 4. Create a screen to display the list of psychologists.
class PsychologistsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Psychologists"),
      ),
      body: ListView.builder(
        itemCount: psychologists.length,
        itemBuilder: (context, index) {
          return PsychologistWidget(psychologist: psychologists[index]);
        },
      ),
    );
  }
}
