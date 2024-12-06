// lib/record_detail_page.dart
import 'package:flutter/material.dart';
import 'data_model.dart';  // Import MedicalRecord

class RecordDetailPage extends StatelessWidget {
  final MedicalRecord record;

  // Constructor to receive the medical record
  RecordDetailPage({required this.record});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${record.patientName} - Medical Record'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Patient Name: ${record.patientName}', style: TextStyle(fontSize: 20)),
            SizedBox(height: 10),
            Text('Diagnosis: ${record.diagnosis}', style: TextStyle(fontSize: 18)),
            SizedBox(height: 10),
            Text('Doctor: ${record.doctorName}', style: TextStyle(fontSize: 18)),
            SizedBox(height: 10),
            Text('Date of Birth: ${record.dateOfBirth}', style: TextStyle(fontSize: 18)),
            SizedBox(height: 10),
            Text('Prescription: ${record.prescription}', style: TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}
