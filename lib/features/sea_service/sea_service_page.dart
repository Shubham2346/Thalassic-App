import 'package:flutter/material.dart';

class SeaServicePage extends StatefulWidget {
  const SeaServicePage({super.key});

  @override
  State<SeaServicePage> createState() => _SeaServicePageState();
}

class _SeaServicePageState extends State<SeaServicePage> {
  final _formKey = GlobalKey<FormState>();

  // First Sea Service controllers
  final firstRpslName = TextEditingController();
  final firstRpslNumber = TextEditingController();
  final firstVesselName = TextEditingController();
  final firstVesselType = TextEditingController();
  final firstImo = TextEditingController();
  final firstRank = TextEditingController();
  final firstSignOn = TextEditingController();
  final firstSignOff = TextEditingController();

  // Reference controllers
  final firstRefName = TextEditingController();
  final firstRefContact = TextEditingController();
  final firstRefDesignation = TextEditingController();
  final firstRefRelation = TextEditingController();

  // Second Sea Service controllers
  final secondRpslName = TextEditingController();
  final secondRpslNumber = TextEditingController();
  final secondVesselName = TextEditingController();
  final secondVesselType = TextEditingController();
  final secondImo = TextEditingController();
  final secondRank = TextEditingController();
  final secondSignOn = TextEditingController();
  final secondSignOff = TextEditingController();

  // Reference controllers
  final secondRefName = TextEditingController();
  final secondRefContact = TextEditingController();
  final secondRefDesignation = TextEditingController();
  final secondRefRelation = TextEditingController();

  @override
  void dispose() {
    for (final c in [
      firstRpslName, firstRpslNumber, firstVesselName, firstVesselType,
      firstImo, firstRank, firstSignOn, firstSignOff,
      firstRefName, firstRefContact, firstRefDesignation, firstRefRelation,
      secondRpslName, secondRpslNumber, secondVesselName, secondVesselType,
      secondImo, secondRank, secondSignOn, secondSignOff,
      secondRefName, secondRefContact, secondRefDesignation, secondRefRelation,
    ]) {
      c.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Sea Service")),
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                _buildSeaServiceCard(
                  title: "Sea Service Experience (Only Master Checker Approved)",
                  subtitle: "a. First Sea Service",
                  rpslName: firstRpslName,
                  rpslNumber: firstRpslNumber,
                  vesselName: firstVesselName,
                  vesselType: firstVesselType,
                  imo: firstImo,
                  rank: firstRank,
                  signOn: firstSignOn,
                  signOff: firstSignOff,
                  refName: firstRefName,
                  refContact: firstRefContact,
                  refDesignation: firstRefDesignation,
                  refRelation: firstRefRelation,
                ),
                const SizedBox(height: 16),
                _buildSeaServiceCard(
                  title: "Sea Service Experience (Only Master Checker Approved)",
                  subtitle: "b. Second Sea Service",
                  rpslName: secondRpslName,
                  rpslNumber: secondRpslNumber,
                  vesselName: secondVesselName,
                  vesselType: secondVesselType,
                  imo: secondImo,
                  rank: secondRank,
                  signOn: secondSignOn,
                  signOff: secondSignOff,
                  refName: secondRefName,
                  refContact: secondRefContact,
                  refDesignation: secondRefDesignation,
                  refRelation: secondRefRelation,
                ),
                const SizedBox(height: 24),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        debugPrint("First Sea Service: ${firstRpslName.text}, ${firstVesselName.text}");
                        debugPrint("Second Sea Service: ${secondRpslName.text}, ${secondVesselName.text}");
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

  Widget _buildSeaServiceCard({
    required String title,
    required String subtitle,
    required TextEditingController rpslName,
    required TextEditingController rpslNumber,
    required TextEditingController vesselName,
    required TextEditingController vesselType,
    required TextEditingController imo,
    required TextEditingController rank,
    required TextEditingController signOn,
    required TextEditingController signOff,
    required TextEditingController refName,
    required TextEditingController refContact,
    required TextEditingController refDesignation,
    required TextEditingController refRelation,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.green[50],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,
              style: const TextStyle(
                  fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black87)),
          const SizedBox(height: 12),
          Text(subtitle,
              style: const TextStyle(
                  fontSize: 16, fontWeight: FontWeight.w600, color: Colors.black87)),
          const SizedBox(height: 12),

          _buildTextField("RPSL Name", rpslName),
          _buildTextField("RPSL Number", rpslNumber),
          _buildTextField("Vessel Name", vesselName),
          _buildTextField("Vessel Type", vesselType),
          _buildTextField("IMO Number", imo),
          _buildTextField("Rank Served on the Vessel", rank),
          _buildTextField("Sign On Date", signOn),
          _buildTextField("Sign Off Date", signOff),

          const Divider(height: 32),
          const Text(
            "• Reference from which you joined that Company",
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 12),
          _buildTextField("Name", refName),
          _buildTextField("Contact Number", refContact),
          _buildTextField("Designation", refDesignation),
          _buildTextField("Relation with the Person", refRelation),

          const SizedBox(height: 16),
          Align(
            alignment: Alignment.centerRight,
            child: OutlinedButton.icon(
              onPressed: () {
                // implement upload
              },
              icon: const Icon(Icons.upload_file),
              label: const Text("Upload"),
            ),
          ),
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
}
