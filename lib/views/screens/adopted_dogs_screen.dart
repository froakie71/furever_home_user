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
                      trailing: IconButton(
                        icon: const Icon(Icons.more_vert),
                        onPressed: () {
                          _showDogOptions(context, index);
                        },
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
                            () {},
                          ),
                          _buildActionButton(
                            Icons.calendar_month,
                            'Schedule Checkup',
                            () {},
                          ),
                          _buildActionButton(
                            Icons.photo_library,
                            'Photos',
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

  void _showDogOptions(BuildContext context, int index) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: const Icon(Icons.edit),
                title: const Text('Edit Details'),
                onTap: () {
                  Navigator.pop(context);
                  // TODO: Navigate to edit screen
                },
              ),
              ListTile(
                leading: const Icon(Icons.share),
                title: const Text('Share Story'),
                onTap: () {
                  Navigator.pop(context);
                  // TODO: Implement share functionality
                },
              ),
              ListTile(
                leading: const Icon(Icons.report),
                title: const Text('Report Issue'),
                onTap: () {
                  Navigator.pop(context);
                  // TODO: Navigate to report screen
                },
              ),
            ],
          ),
        );
      },
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