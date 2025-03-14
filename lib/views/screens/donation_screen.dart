import 'package:flutter/material.dart';
import 'donation_screen.dart';

class DonationScreen extends StatefulWidget {
  const DonationScreen({super.key});

  @override
  State<DonationScreen> createState() => _DonationScreenState();
}

class _DonationScreenState extends State<DonationScreen> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Donate'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Top Donators Section
            Container(
              padding: const EdgeInsets.all(16),
              color: Colors.orange.shade50,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Top Donators',
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
                        margin: const EdgeInsets.only(bottom: 8),
                        child: ListTile(
                          leading: CircleAvatar(
                            backgroundColor: Colors.orange.shade100,
                            child: Text(
                              '${index + 1}',
                              style: TextStyle(
                                color: Colors.orange.shade800,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          title: Text(_getTopDonator(index)),
                          subtitle: Text(_getDonationAmount(index)),
                          trailing: _getBadge(index),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),

            // Donation Form
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Make a Donation',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: Stack(
                            children: [
                              Container(
                                width: 120,
                                height: 120,
                                decoration: BoxDecoration(
                                  color: Colors.grey[200],
                                  shape: BoxShape.circle,
                                ),
                                child: const Icon(
                                  Icons.pets,
                                  size: 50,
                                  color: Colors.grey,
                                ),
                              ),
                              Positioned(
                                bottom: 0,
                                right: 0,
                                child: CircleAvatar(
                                  backgroundColor:
                                      Theme.of(context).primaryColor,
                                  radius: 18,
                                  child: IconButton(
                                    icon: const Icon(
                                      Icons.add_a_photo,
                                      size: 18,
                                      color: Colors.white,
                                    ),
                                    onPressed: () {
                                      // TODO: Implement image picker
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 32),
                        TextFormField(
                          decoration: InputDecoration(
                            labelText: 'Pet Name',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            prefixIcon: const Icon(Icons.pets),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter pet name';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 16),
                        Row(
                          children: [
                            Expanded(
                              child: TextFormField(
                                decoration: InputDecoration(
                                  labelText: 'Age',
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  prefixIcon: const Icon(Icons.calendar_today),
                                ),
                                keyboardType: TextInputType.number,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter age';
                                  }
                                  return null;
                                },
                              ),
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: TextFormField(
                                decoration: InputDecoration(
                                  labelText: 'Breed',
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  prefixIcon: const Icon(Icons.category),
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter breed';
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        TextFormField(
                          decoration: InputDecoration(
                            labelText: 'Location',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            prefixIcon: const Icon(Icons.location_on),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter location';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 16),
                        TextFormField(
                          maxLines: 3,
                          decoration: InputDecoration(
                            labelText: 'Description',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            prefixIcon: const Icon(Icons.description),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter description';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 32),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                // TODO: Implement form submission
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text('Processing Data')),
                                );
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            child: const Text(
                              'Submit',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _getTopDonator(int index) {
    final donators = [
      'Maria Santos',
      'John Smith',
      'Anna Garcia',
    ];
    return donators[index];
  }

  String _getDonationAmount(int index) {
    final amounts = [
      '₱50,000 - 20 dogs helped',
      '₱35,000 - 15 dogs helped',
      '₱25,000 - 10 dogs helped',
    ];
    return amounts[index];
  }

  Widget _getBadge(int index) {
    final badges = [
      {'icon': Icons.stars, 'color': Colors.amber},
      {'icon': Icons.workspace_premium, 'color': Colors.grey},
      {'icon': Icons.volunteer_activism, 'color': Colors.brown},
    ];

    return Icon(
      badges[index]['icon'] as IconData,
      color: badges[index]['color'] as Color,
    );
  }
}
