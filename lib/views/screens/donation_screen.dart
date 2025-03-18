import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class DonationScreen extends StatefulWidget {
  const DonationScreen({super.key});

  @override
  State<DonationScreen> createState() => _DonationScreenState();
}

class _DonationScreenState extends State<DonationScreen> {
  final _formKey = GlobalKey<FormState>();
  File? _image;
  final ImagePicker _picker = ImagePicker();

  Future<void> _uploadImage() async {
    try {
      // Request permission first
      final permissionStatus = await Permission.storage.request();

      if (permissionStatus.isGranted) {
        final XFile? pickedFile = await _picker.pickImage(
          source: ImageSource.gallery,
          maxWidth: 1800,
          maxHeight: 1800,
        );

        if (pickedFile != null) {
          setState(() {
            _image = File(pickedFile.path);
          });
        }
      } else {
        throw Exception('Storage permission denied');
      }
    } catch (e) {
      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(e.toString()),
          backgroundColor: Colors.red,
          duration: const Duration(seconds: 3),
          action: SnackBarAction(
            label: 'Retry',
            textColor: Colors.white,
            onPressed: _uploadImage,
          ),
        ),
      );
    }
  }

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
                    itemCount: 5,
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
                              // Container(
                              //   width: 120,
                              //   height: 120,
                              //   decoration: BoxDecoration(
                              //     color: Colors.grey[200],
                              //     shape: BoxShape.circle,
                              //   ),
                              //   child: _image != null
                              //       ? ClipOval(
                              //           child: Image.file(
                              //             _image!,
                              //             width: 120,
                              //             height: 120,
                              //             fit: BoxFit.cover,
                              //           ),
                              //         )
                              //       : const Icon(
                              //           Icons.pets,
                              //           size: 50,
                              //           color: Colors.grey,
                              //         ),
                              // ),
                              // Positioned(
                              //   bottom: 0,
                              //   right: 0,
                              //   child: CircleAvatar(
                              //     backgroundColor:
                              //         Theme.of(context).primaryColor,
                              //     radius: 18,
                              //     child: IconButton(
                              //       icon: const Icon(
                              //         Icons.add_a_photo,
                              //         size: 18,
                              //         color: Colors.white,
                              //       ),
                              //       onPressed: _uploadImage,
                              //     ),
                              //   ),
                              // ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 32),
                        TextFormField(
                          decoration: InputDecoration(
                            labelText: 'Amount',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            prefixIcon: const Icon(Icons.attach_money),
                          ),
                          keyboardType: TextInputType.number,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter amount';
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
      'Luis Cruz',
      'Sarah Lee',
    ];
    return donators[index];
  }

  String _getDonationAmount(int index) {
    final amounts = [
      '₱50,000',
      '₱35,000',
      '₱25,000',
      '₱20,000',
      '₱18,000',
    ];
    return amounts[index];
  }

  Widget _getBadge(int index) {
    final badges = [
      {'icon': Icons.stars, 'color': Colors.amber},
      {'icon': Icons.workspace_premium, 'color': Colors.grey},
      {'icon': Icons.volunteer_activism, 'color': Colors.brown},
      {'icon': Icons.thumb_up, 'color': Colors.blue},
      {'icon': Icons.favorite, 'color': Colors.pink},
    ];

    return Icon(
      badges[index]['icon'] as IconData,
      color: badges[index]['color'] as Color,
    );
  }
}
