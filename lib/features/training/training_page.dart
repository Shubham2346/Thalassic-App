import 'package:flutter/material.dart';

class TrainingPage extends StatefulWidget {
  const TrainingPage({super.key});

  @override
  State<TrainingPage> createState() => _TrainingPageState();
}

class _TrainingPageState extends State<TrainingPage> {
  final _formKey = GlobalKey<FormState>();

  // Controllers for Pre Sea Training
  final preSeaInstitute = TextEditingController();
  final preSeaMti = TextEditingController();
  final preSeaFrom = TextEditingController();
  final preSeaTo = TextEditingController();
  final preSeaIssueDate = TextEditingController();
  final preSeaIssuePlace = TextEditingController();

  // Controllers for Basic Course
  final basicCourseName = TextEditingController();
  final basicInstitute = TextEditingController();
  final basicMti = TextEditingController();
  final basicFrom = TextEditingController();
  final basicTo = TextEditingController();
  final basicIssueDate = TextEditingController();

  // Controllers for Advanced Course
  final advCourseName = TextEditingController();
  final advInstitute = TextEditingController();
  final advMti = TextEditingController();

  // Controllers for Refresher Course
  final refCourseName = TextEditingController();
  final refInstitute = TextEditingController();
  final refMti = TextEditingController();
  final refFrom = TextEditingController();
  final refTo = TextEditingController();
  final refIssueDate = TextEditingController();

  // Controllers for Other Course
  final otherCourseName = TextEditingController();
  final otherInstitute = TextEditingController();
  final otherMti = TextEditingController();
  final otherFrom = TextEditingController();
  final otherTo = TextEditingController();
  final otherIssueDate = TextEditingController();

  // Controllers for DG Approved Course
  final dgCourseName = TextEditingController();
  final dgInstitute = TextEditingController();
  final dgMti = TextEditingController();
  final dgFrom = TextEditingController();
  final dgTo = TextEditingController();
  final dgIssueDate = TextEditingController();
  final dgIssuePlace = TextEditingController();

  @override
  void dispose() {
    // Dispose controllers (best practice)
    for (final c in [
      preSeaInstitute, preSeaMti, preSeaFrom, preSeaTo, preSeaIssueDate, preSeaIssuePlace,
      basicCourseName, basicInstitute, basicMti, basicFrom, basicTo, basicIssueDate,
      advCourseName, advInstitute, advMti,
      refCourseName, refInstitute, refMti, refFrom, refTo, refIssueDate,
      otherCourseName, otherInstitute, otherMti, otherFrom, otherTo, otherIssueDate,
      dgCourseName, dgInstitute, dgMti, dgFrom, dgTo, dgIssueDate, dgIssuePlace,
    ]) {
      c.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Training")),
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                _buildTrainingCard(
                  title: "Pre Sea Training",
                  color: Colors.blue[50]!,
                  children: [
                    _buildTextField("Institute Name", preSeaInstitute),
                    _buildTextField("MTI Number", preSeaMti),
                    _buildTextField("Date From", preSeaFrom),
                    _buildTextField("Date To", preSeaTo),
                    _buildTextField("Issue Date", preSeaIssueDate),
                    _buildTextField("Issue Place", preSeaIssuePlace),
                    _buildUploadButton(),
                  ],
                ),
                const SizedBox(height: 16),
                _buildTrainingCard(
                  title: "Basic Courses (DGS Approved)",
                  color: Colors.green[50]!,
                  children: [
                    _buildTextField("Course Name", basicCourseName),
                    _buildTextField("Institute Name", basicInstitute),
                    _buildTextField("MTI Number", basicMti),
                    _buildTextField("Date From", basicFrom),
                    _buildTextField("Date To", basicTo),
                    _buildTextField("Issue Date", basicIssueDate),
                    _buildUploadButton(),
                  ],
                ),
                const SizedBox(height: 16),
                _buildTrainingCard(
                  title: "Advanced Course",
                  color: Colors.purple[50]!,
                  children: [
                    _buildTextField("Course Name", advCourseName),
                    _buildTextField("Institute Name", advInstitute),
                    _buildTextField("MTI Number", advMti),
                    _buildUploadButton(),
                  ],
                ),
                const SizedBox(height: 16),
                _buildTrainingCard(
                  title: "Refresher Course",
                  color: Colors.yellow[50]!,
                  children: [
                    _buildTextField("Course Name", refCourseName),
                    _buildTextField("Institute Name", refInstitute),
                    _buildTextField("MTI Number", refMti),
                    _buildTextField("Date From", refFrom),
                    _buildTextField("Date To", refTo),
                    _buildTextField("Issue Date", refIssueDate),
                    _buildUploadButton(),
                  ],
                ),
                const SizedBox(height: 16),
                _buildTrainingCard(
                  title: "Other Additional Course",
                  color: Colors.green[100]!,
                  children: [
                    _buildTextField("Course Name", otherCourseName),
                    _buildTextField("Institute Name", otherInstitute),
                    _buildTextField("MTI Number", otherMti),
                    _buildTextField("Date From", otherFrom),
                    _buildTextField("Date To", otherTo),
                    _buildTextField("Issue Date", otherIssueDate),
                    _buildUploadButton(),
                  ],
                ),
                const SizedBox(height: 16),
                _buildTrainingCard(
                  title: "DG Approved Course",
                  color: Colors.blue[100]!,
                  children: [
                    _buildTextField("Course Name", dgCourseName),
                    _buildTextField("Institute Name", dgInstitute),
                    _buildTextField("MTI Number", dgMti),
                    _buildTextField("Date From", dgFrom),
                    _buildTextField("Date To", dgTo),
                    _buildTextField("Issue Date", dgIssueDate),
                    _buildTextField("Issue Place", dgIssuePlace),
                    _buildUploadButton(),
                  ],
                ),
                const SizedBox(height: 24),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        debugPrint("Pre Sea Training: ${preSeaInstitute.text}, ${preSeaMti.text}");
                        // print other sections as well
                      }
                    },
                    icon: const Icon(Icons.save),
                    label: const Text("Save & Next"),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTrainingCard({
    required String title,
    required Color color,
    required List<Widget> children,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,
              style: const TextStyle(
                  fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black87)),
          const SizedBox(height: 12),
          ...children,
        ],
      ),
    );
  }

  Widget _buildTextField(String label, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
        ),
        validator: (value) =>
            (value == null || value.isEmpty) ? "Please enter $label" : null,
      ),
    );
  }

  Widget _buildUploadButton() {
    return OutlinedButton.icon(
      onPressed: () {
        // implement upload functionality
      },
      icon: const Icon(Icons.upload_file),
      label: const Text("Upload"),
    );
  }
}
