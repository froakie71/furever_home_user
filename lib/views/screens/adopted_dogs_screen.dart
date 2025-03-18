import 'package:flutter/material.dart';

class AdoptedDogsScreen extends StatelessWidget {
  const AdoptedDogsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Adopted Dogs'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // Stats Section
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.orange.shade50,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildStatItem('3', 'Dogs\nAdopted'),
                _buildStatItem('2', 'Years as\nAdopter'),
                _buildStatItem('12', 'Vet Visits\nMade'),
              ],
            ),
          ),
          const SizedBox(height: 24),

          // Adopted Dogs List
          const Text(
            'Your Furry Family',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 3,
            itemBuilder: (context, index) {
              return Card(
                margin: const EdgeInsets.only(bottom: 16),
                child: Column(
                  children: [
                    ListTile(
                      contentPadding: const EdgeInsets.all(16),
                      leading: CircleAvatar(
                        radius: 30,
                        backgroundImage: NetworkImage(
                          'https://placedog.net/100/100?id=${index + 20}',
                        ),
                      ),
                      title: Text(
                        _getDogName(index),
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 4),
                          Text(_getDogBreed(index)),
                          const SizedBox(height: 4),
                          Text(
                            'Adopted on ${_getAdoptionDate(index)}',
                            style: TextStyle(
                              color: Colors.orange.shade800,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Divider(height: 0),
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          _buildActionButton(
                            Icons.medical_services,
                            'Medical Records',
                            () => _showMedicalRecords(context, index),
                          ),
                          _buildActionButton(
                            Icons.calendar_month,
                            'Schedule Checkup',
                            () {},
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.pop(context); // Return to home
          // TODO: Navigate to available dogs screen
        },
        backgroundColor: Colors.orange,
        icon: const Icon(Icons.add, color: Colors.white),
        label: const Text(
          'Adopt Another',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  Widget _buildStatItem(String value, String label) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Colors.black54,
          ),
        ),
      ],
    );
  }

  Widget _buildActionButton(IconData icon, String label, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: Colors.grey[600]),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              color: Colors.grey[600],
            ),
          ),
        ],
      ),
    );
  }

  void _showMedicalRecords(BuildContext context, int index) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.all(16),
                child: Text(
                  '${_getDogName(index)}\'s Medical Records',
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const Divider(),
              Expanded(
                child: ListView(
                  children: [
                    _buildMedicalRecord(
                      date: 'Mar 15, 2024',
                      procedure: 'First Vaccination',
                      notes: 'DHPP vaccine administered',
                    ),
                    _buildMedicalRecord(
                      date: 'Feb 20, 2024',
                      procedure: 'Initial Checkup',
                      notes: 'General health assessment - All healthy',
                    ),
                    _buildMedicalRecord(
                      date: 'Feb 10, 2024',
                      procedure: 'Deworming',
                      notes: 'Preventive deworming treatment',
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
    );
  }

  Widget _buildMedicalRecord({
    required String date,
    required String procedure,
    required String notes,
  }) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      title: Text(
        procedure,
        style: const TextStyle(
          fontWeight: FontWeight.w600,
        ),
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 4),
          Text(notes),
          const SizedBox(height: 4),
          Text(
            date,
            style: const TextStyle(
              color: Colors.grey,
              fontSize: 12,
            ),
          ),
        ],
      ),
      leading: const CircleAvatar(
        backgroundColor: Colors.orange,
        child: Icon(
          Icons.medical_services,
          color: Colors.white,
          size: 20,
        ),
      ),
    );
  }

  String _getDogName(int index) {
    final names = ['Buddy', 'Luna', 'Max'];
    return names[index];
  }

  String _getDogBreed(int index) {
    final breeds = ['Golden Retriever', 'Aspin', 'German Shepherd'];
    return breeds[index];
  }

  String _getAdoptionDate(int index) {
    final dates = ['Jan 15, 2024', 'Mar 3, 2024', 'Feb 20, 2024'];
    return dates[index];
  }
}
