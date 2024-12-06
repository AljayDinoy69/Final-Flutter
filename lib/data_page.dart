// lib/data_page.dart
import 'package:flutter/material.dart';
import 'data_model.dart';  // Import MedicalRecord
import 'record_detail_page.dart';  // Import RecordDetailPage

class DataPage extends StatefulWidget {
  @override
  _DataPageState createState() => _DataPageState();
}

class _DataPageState extends State<DataPage> {
  List<MedicalRecord> records = [
    MedicalRecord(
      patientName: "John Doe",
      diagnosis: "Hypertension",
      doctorName: "Dr. Smith",
      dateOfBirth: "1990-02-15",
      prescription: "Amlodipine 10mg",
    ),
    MedicalRecord(
      patientName: "Jane Doe",
      diagnosis: "Diabetes Type 2",
      doctorName: "Dr. Williams",
      dateOfBirth: "1985-11-22",
      prescription: "Metformin 500mg",
    ),
    MedicalRecord(
      patientName: "Alice Johnson",
      diagnosis: "Asthma",
      doctorName: "Dr. Brown",
      dateOfBirth: "2000-08-03",
      prescription: "Salbutamol Inhaler",
    ),
  ];

  void _deleteRecord(int index) {
    setState(() {
      records.removeAt(index);
    });
  }

  void _editRecord(int index) {
    TextEditingController nameController = TextEditingController(text: records[index].patientName);
    TextEditingController diagnosisController = TextEditingController(text: records[index].diagnosis);
    TextEditingController doctorController = TextEditingController(text: records[index].doctorName);
    TextEditingController dobController = TextEditingController(text: records[index].dateOfBirth);
    TextEditingController prescriptionController = TextEditingController(text: records[index].prescription);

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Edit Medical Record'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: nameController,
                decoration: InputDecoration(labelText: 'Patient Name'),
              ),
              TextField(
                controller: diagnosisController,
                decoration: InputDecoration(labelText: 'Diagnosis'),
              ),
              TextField(
                controller: doctorController,
                decoration: InputDecoration(labelText: 'Doctor Name'),
              ),
              TextField(
                controller: dobController,
                decoration: InputDecoration(labelText: 'Date of Birth'),
              ),
              TextField(
                controller: prescriptionController,
                decoration: InputDecoration(labelText: 'Prescription'),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                setState(() {
                  records[index].patientName = nameController.text;
                  records[index].diagnosis = diagnosisController.text;
                  records[index].doctorName = doctorController.text;
                  records[index].dateOfBirth = dobController.text;
                  records[index].prescription = prescriptionController.text;
                });
                Navigator.of(context).pop();
              },
              child: Text('Save'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
          ],
        );
      },
    );
  }

  void _addRecord() {
    TextEditingController nameController = TextEditingController();
    TextEditingController diagnosisController = TextEditingController();
    TextEditingController doctorController = TextEditingController();
    TextEditingController dobController = TextEditingController();
    TextEditingController prescriptionController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Add New Medical Record'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: nameController,
                decoration: InputDecoration(labelText: 'Patient Name'),
              ),
              TextField(
                controller: diagnosisController,
                decoration: InputDecoration(labelText: 'Diagnosis'),
              ),
              TextField(
                controller: doctorController,
                decoration: InputDecoration(labelText: 'Doctor Name'),
              ),
              TextField(
                controller: dobController,
                decoration: InputDecoration(labelText: 'Date of Birth'),
              ),
              TextField(
                controller: prescriptionController,
                decoration: InputDecoration(labelText: 'Prescription'),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                setState(() {
                  records.add(MedicalRecord(
                    patientName: nameController.text,
                    diagnosis: diagnosisController.text,
                    doctorName: doctorController.text,
                    dateOfBirth: dobController.text,
                    prescription: prescriptionController.text,
                  ));
                });
                Navigator.of(context).pop();
              },
              child: Text('Add'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Medical Records')),
      floatingActionButton: FloatingActionButton(
        onPressed: _addRecord,
        child: Icon(Icons.add),
        tooltip: 'Add Medical Record',
      ),
      body: ListView.builder(
        itemCount: records.length,
        itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.all(8),
            child: ListTile(
              title: Text(records[index].patientName),
              subtitle: Text("Diagnosis: ${records[index].diagnosis}"),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // View Record Button
                  IconButton(
                    icon: Icon(Icons.visibility),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => RecordDetailPage(record: records[index]),
                        ),
                      );
                    },
                  ),
                  // Edit Button
                  IconButton(
                    icon: Icon(Icons.edit),
                    onPressed: () => _editRecord(index),
                  ),
                  // Delete Button
                  IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () => _deleteRecord(index),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
