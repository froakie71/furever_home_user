import 'package:flutter/material.dart';

class DogScreen extends StatelessWidget {
  const DogScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Available Dogs'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.filter_list),
            onPressed: () {
              // TODO: Implement filtering
            },
          ),
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              // TODO: Implement search
            },
          ),
        ],
      ),
      body: Column(
        children: [
          // Filter chips
          SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                FilterChip(
                  label: const Text('All'),
                  selected: true,
                  onSelected: (bool selected) {},
                ),
                const SizedBox(width: 8),
                FilterChip(
                  label: const Text('Puppies'),
                  selected: false,
                  onSelected: (bool selected) {},
                ),
                const SizedBox(width: 8),
                FilterChip(
                  label: const Text('Adult Dogs'),
                  selected: false,
                  onSelected: (bool selected) {},
                ),
                const SizedBox(width: 8),
                FilterChip(
                  label: const Text('Special Needs'),
                  selected: false,
                  onSelected: (bool selected) {},
                ),
              ],
            ),
          ),
          
          // Dog list
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: 10,
              itemBuilder: (context, index) {
                return Card(
                  margin: const EdgeInsets.only(bottom: 16),
                  child: InkWell(
                    onTap: () {
                      // TODO: Navigate to dog details
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Stack(
                          children: [
                            ClipRRect(
                              borderRadius: const BorderRadius.vertical(
                                top: Radius.circular(4),
                              ),
                              child: Image.network(
                                'https://placedog.net/500/300?id=${index + 10}',
                                height: 200,
                                width: double.infinity,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Positioned(
                              top: 12,
                              right: 12,
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 12,
                                  vertical: 6,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.black54,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    const Icon(
                                      Icons.pets,
                                      color: Colors.white,
                                      size: 16,
                                    ),
                                    const SizedBox(width: 4),
                                    Text(
                                      _getAge(index),
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    _getDogName(index),
                                    style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Icon(
                                    Icons.favorite_border,
                                    color: Colors.grey[400],
                                  ),
                                ],
                              ),
                              const SizedBox(height: 8),
                              Text(
                                _getDogBreed(index),
                                style: TextStyle(
                                  color: Colors.grey[600],
                                  fontSize: 16,
                                ),
                              ),
                              const SizedBox(height: 16),
                              Row(
                                children: [
                                  _buildInfoChip(Icons.male, 'Male'),
                                  const SizedBox(width: 8),
                                  _buildInfoChip(
                                    Icons.straighten,
                                    'Medium',
                                  ),
                                  const SizedBox(width: 8),
                                  _buildInfoChip(
                                    Icons.check_circle_outline,
                                    'Trained',
                                  ),
                                ],
                              ),
                              const SizedBox(height: 16),
                              Row(
                                children: [
                                  Expanded(
                                    child: ElevatedButton(
                                      onPressed: () {},
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.orange,
                                        foregroundColor: Colors.white,
                                      ),
                                      child: const Text('Adopt Me'),
                                    ),
                                  ),
                                  const SizedBox(width: 8),
                                  IconButton(
                                    onPressed: () {},
                                    icon: const Icon(Icons.share),
                                    style: IconButton.styleFrom(
                                      backgroundColor: Colors.grey[200],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoChip(IconData icon, String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 16, color: Colors.grey[600]),
          const SizedBox(width: 4),
          Text(
            label,
            style: TextStyle(
              color: Colors.grey[600],
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }

  String _getDogName(int index) {
    final names = [
      'Max', 'Luna', 'Charlie', 'Bella', 'Rocky',
      'Lucy', 'Bailey', 'Cooper', 'Daisy', 'Milo'
    ];
    return names[index];
  }

  String _getDogBreed(int index) {
    final breeds = [
      'Golden Retriever', 'German Shepherd', 'Labrador', 'Aspin',
      'Husky', 'Beagle', 'Poodle', 'Rottweiler', 'Shih Tzu', 'Corgi'
    ];
    return breeds[index];
  }

  String _getAge(int index) {
    final ages = [
      '2y', '6m', '1y', '3y', '8m',
      '4y', '1y', '2y', '5m', '3y'
    ];
    return ages[index];
  }
}