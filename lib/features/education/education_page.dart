import 'package:flutter/material.dart';

class EducationPage extends StatefulWidget {
  const EducationPage({super.key});

  @override
  State<EducationPage> createState() => _EducationPageState();
}

class _EducationPageState extends State<EducationPage> {
  final _formKey = GlobalKey<FormState>();

  // Form controllers
  final tenthBoard = TextEditingController();
  final tenthYear = TextEditingController();
  final tenthPercentage = TextEditingController();

  final twelfthBoard = TextEditingController();
  final twelfthYear = TextEditingController();
  final twelfthPercentage = TextEditingController();

  final degreeCourse = TextEditingController();
  final degreeUniversity = TextEditingController();
  final degreeYear = TextEditingController();
  final degreePercentage = TextEditingController();

  final mastersCourse = TextEditingController();
  final mastersUniversity = TextEditingController();
  final mastersYear = TextEditingController();
  final mastersPercentage = TextEditingController();

  final extraCurricular = TextEditingController();

  @override
  void dispose() {
    // Dispose controllers to prevent memory leaks
    tenthBoard.dispose();
    tenthYear.dispose();
    tenthPercentage.dispose();
    twelfthBoard.dispose();
    twelfthYear.dispose();
    twelfthPercentage.dispose();
    degreeCourse.dispose();
    degreeUniversity.dispose();
    degreeYear.dispose();
    degreePercentage.dispose();
    mastersCourse.dispose();
    mastersUniversity.dispose();
    mastersYear.dispose();
    mastersPercentage.dispose();
    extraCurricular.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Education"),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                _buildEducationCard(
                  title: "10th Standard",
                  color: Colors.blue[100]!,
                  children: [
                    _buildTextField("Board", tenthBoard),
                    _buildTextField("Year", tenthYear, keyboardType: TextInputType.number),
                    _buildTextField("Percentage", tenthPercentage, keyboardType: TextInputType.number),
                    _buildUploadButton(),
                  ],
                ),
                const SizedBox(height: 16),
                _buildEducationCard(
                  title: "12th Standard",
                  color: Colors.green[100]!,
                  children: [
                    _buildTextField("Board", twelfthBoard),
                    _buildTextField("Year", twelfthYear, keyboardType: TextInputType.number),
                    _buildTextField("Percentage", twelfthPercentage, keyboardType: TextInputType.number),
                    _buildUploadButton(),
                  ],
                ),
                const SizedBox(height: 16),
                _buildEducationCard(
                  title: "Degree / Diploma",
                  color: Colors.purple[100]!,
                  children: [
                    _buildTextField("Course", degreeCourse),
                    _buildTextField("University", degreeUniversity),
                    _buildTextField("Year", degreeYear, keyboardType: TextInputType.number),
                    _buildTextField("Percentage", degreePercentage, keyboardType: TextInputType.number),
                    _buildUploadButton(),
                  ],
                ),
                const SizedBox(height: 16),
                _buildEducationCard(
                  title: "Masters Degree",
                  color: Colors.orange[100]!,
                  children: [
                    _buildTextField("Course", mastersCourse),
                    _buildTextField("University", mastersUniversity),
                    _buildTextField("Year", mastersYear, keyboardType: TextInputType.number),
                    _buildTextField("Percentage", mastersPercentage, keyboardType: TextInputType.number),
                    _buildUploadButton(),
                  ],
                ),
                const SizedBox(height: 16),
                _buildEducationCard(
                  title: "Extra Curricular Activity",
                  color: Colors.teal[100]!,
                  children: [
                    _buildTextField(
                      "Describe activities, achievements, hobbies...",
                      extraCurricular,
                      maxLines: 4,
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        // Collect form data
                        debugPrint("Tenth: ${tenthBoard.text}, ${tenthYear.text}, ${tenthPercentage.text}");
                        debugPrint("Twelfth: ${twelfthBoard.text}, ${twelfthYear.text}, ${twelfthPercentage.text}");
                        debugPrint("Degree: ${degreeCourse.text}, ${degreeUniversity.text}, ${degreeYear.text}, ${degreePercentage.text}");
                        debugPrint("Masters: ${mastersCourse.text}, ${mastersUniversity.text}, ${mastersYear.text}, ${mastersPercentage.text}");
                        debugPrint("Extra Curricular: ${extraCurricular.text}");
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

  Widget _buildEducationCard({
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

  Widget _buildTextField(
    String label,
    TextEditingController controller, {
    TextInputType keyboardType = TextInputType.text,
    int maxLines = 1,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        maxLines: maxLines,
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
        // implement upload logic
      },
      icon: const Icon(Icons.upload_file),
      label: const Text("Upload"),
    );
  }
}
