import 'package:flutter/material.dart';

class DocumentsPage extends StatefulWidget {
  const DocumentsPage({super.key});

  @override
  State<DocumentsPage> createState() => _DocumentsPageState();
}

class _DocumentsPageState extends State<DocumentsPage> {
  final _formKey = GlobalKey<FormState>();

  // Passport Controllers
  final passportNumber = TextEditingController();
  final passportIssueDate = TextEditingController();
  final passportExpiryDate = TextEditingController();
  final passportPlace = TextEditingController();
  final passportCountry = TextEditingController();

  // INDOS Controllers
  final indosNumber = TextEditingController();
  final indosIssueDate = TextEditingController();
  final indosExpiryDate = TextEditingController();
  final indosPlace = TextEditingController();
  final indosAuthority = TextEditingController();

  // CDC Controllers
  final cdcNumber = TextEditingController();
  final cdcIssueDate = TextEditingController();
  final cdcExpiryDate = TextEditingController();
  final cdcPlace = TextEditingController();
  final cdcAuthority = TextEditingController();

  @override
  void dispose() {
    for (final c in [
      passportNumber, passportIssueDate, passportExpiryDate, passportPlace, passportCountry,
      indosNumber, indosIssueDate, indosExpiryDate, indosPlace, indosAuthority,
      cdcNumber, cdcIssueDate, cdcExpiryDate, cdcPlace, cdcAuthority,
    ]) {
      c.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Documents")),
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                // Passport Section
                _buildDocCard(
                  title: "Passport Details",
                  color: Colors.blue[50]!,
                  children: [
                    Row(
                      children: [
                        Expanded(child: _buildTextField("Passport Number", passportNumber)),
                        const SizedBox(width: 12),
                        Expanded(child: _buildTextField("Issue Date", passportIssueDate)),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(child: _buildTextField("Expiry Date", passportExpiryDate)),
                        const SizedBox(width: 12),
                        Expanded(child: _buildTextField("Place of Issue", passportPlace)),
                      ],
                    ),
                    _buildTextField("Country", passportCountry),
                    Align(alignment: Alignment.centerLeft, child: _buildUploadButton()),
                  ],
                ),
                const SizedBox(height: 16),

                // INDOS Section
                _buildDocCard(
                  title: "INDOS Details",
                  color: Colors.purple[50]!,
                  children: [
                    Row(
                      children: [
                        Expanded(child: _buildTextField("INDOS Number", indosNumber)),
                        const SizedBox(width: 12),
                        Expanded(child: _buildTextField("Issue Date", indosIssueDate)),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(child: _buildTextField("Expiry Date", indosExpiryDate)),
                        const SizedBox(width: 12),
                        Expanded(child: _buildTextField("Place of Issue", indosPlace)),
                      ],
                    ),
                    _buildTextField("Issue Authority", indosAuthority),
                  ],
                ),
                const SizedBox(height: 16),

                // CDC Section
                _buildDocCard(
                  title: "CDC Details",
                  color: Colors.green[50]!,
                  children: [
                    Row(
                      children: [
                        Expanded(child: _buildTextField("CDC Number", cdcNumber)),
                        const SizedBox(width: 12),
                        Expanded(child: _buildTextField("Issue Date", cdcIssueDate)),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(child: _buildTextField("Expiry Date", cdcExpiryDate)),
                        const SizedBox(width: 12),
                        Expanded(child: _buildTextField("Place of Issue", cdcPlace)),
                      ],
                    ),
                    _buildTextField("Issue Authority", cdcAuthority),
                    Align(alignment: Alignment.centerLeft, child: _buildUploadButton()),
                  ],
                ),
                const SizedBox(height: 24),

                // Save Button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        debugPrint("Passport: ${passportNumber.text}, ${passportCountry.text}");
                        debugPrint("INDOS: ${indosNumber.text}, ${indosAuthority.text}");
                        debugPrint("CDC: ${cdcNumber.text}, ${cdcAuthority.text}");
                      }
                    },
                    icon: const Icon(Icons.save),
                    label: const Text("Save & Next"),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDocCard({
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
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black87)),
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
        validator: (value) => (value == null || value.isEmpty) ? "Please enter $label" : null,
      ),
    );
  }

  Widget _buildUploadButton() {
    return OutlinedButton.icon(
      onPressed: () {
        // File picker or upload logic
      },
      icon: const Icon(Icons.upload_file),
      label: const Text("Upload"),
    );
  }
}
