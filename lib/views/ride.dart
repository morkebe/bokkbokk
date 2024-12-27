import 'package:flutter/material.dart';

class RidePage extends StatefulWidget {
  const RidePage({Key? key}) : super(key: key);

  @override
  _RidePageState createState() => _RidePageState();
}

class _RidePageState extends State<RidePage> {
  @override
  Widget build(BuildContext context) {
    // Liste des trajets disponibles
    final List<Map<String, String>> rides = [
      {
        'departure': 'Dakar',
        'arrival': 'Rufisque',
        'time': '08:00 AM',
        'location': 'Croisement Cambérène',
      },
      {
        'departure': 'Thiès',
        'arrival': 'Mbour',
        'time': '10:30 AM',
        'location': 'Gare de Thiès',
      },
      {
        'departure': 'Saint-Louis',
        'arrival': 'Louga',
        'time': '12:00 PM',
        'location': 'Gare de Saint-Louis',
      },
      {
        'departure': 'Kébémer',
        'arrival': 'Dakar',
        'time': '07:00 AM',
        'location': 'Gare de Kébémer',
      },
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text('Réserver un trajet'),
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.green.shade50,
              Colors.white,
            ],
          ),
        ),
        child: ListView.builder(
          padding: const EdgeInsets.all(16.0),
          itemCount: rides.length,
          itemBuilder: (context, index) {
            final ride = rides[index];
            return Card(
              elevation: 4,
              margin: const EdgeInsets.symmetric(vertical: 8.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.green,
                  child: const Icon(Icons.directions_car, color: Colors.white),
                ),
                title: Text(
                  '${ride['departure']} → ${ride['arrival']}',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                subtitle: Text(
                  'Départ : ${ride['time']}',
                  style: const TextStyle(color: Colors.black54),
                ),
                trailing: ElevatedButton(
                  onPressed: () {
                    // Ouvrir la boîte de dialogue de réservation
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        final TextEditingController nameController =
                        TextEditingController();
                        final TextEditingController phoneController =
                        TextEditingController();

                        return AlertDialog(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          title: const Text(
                            'Réserver un trajet',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.green,
                            ),
                          ),
                          content: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                '${ride['departure']} → ${ride['arrival']}',
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black87,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              const SizedBox(height: 16),
                              Text(
                                'Heure de départ : ${ride['time']}',
                                style: const TextStyle(
                                  fontSize: 16,
                                  color: Colors.black87,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              const SizedBox(height: 8),
                              Text(
                                'Lieu : ${ride['location']}',
                                style: const TextStyle(
                                  fontSize: 16,
                                  color: Colors.black54,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              const SizedBox(height: 16),
                              // Champ pour le nom
                              TextField(
                                controller: nameController,
                                decoration: const InputDecoration(
                                  labelText: 'Nom',
                                  border: OutlineInputBorder(),
                                ),
                              ),
                              const SizedBox(height: 16),
                              // Champ pour le numéro de téléphone
                              TextField(
                                controller: phoneController,
                                keyboardType: TextInputType.phone,
                                decoration: const InputDecoration(
                                  labelText: 'Numéro de téléphone',
                                  border: OutlineInputBorder(),
                                ),
                              ),
                            ],
                          ),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              style: TextButton.styleFrom(
                                foregroundColor: Colors.red,
                              ),
                              child: const Text('Annuler'),
                            ),
                            TextButton(
                              onPressed: () {
                                final name = nameController.text;
                                final phone = phoneController.text;

                                if (name.isNotEmpty && phone.isNotEmpty) {
                                  Navigator.of(context).pop();
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        'Réservation confirmée pour ${ride['departure']} → ${ride['arrival']}.\nNom : $name\nTéléphone : $phone',
                                      ),
                                      backgroundColor: Colors.green,
                                    ),
                                  );
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text(
                                        'Veuillez remplir tous les champs.',
                                      ),
                                      backgroundColor: Colors.red,
                                    ),
                                  );
                                }
                              },
                              style: TextButton.styleFrom(
                                foregroundColor: Colors.green,
                              ),
                              child: const Text('Confirmer'),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text('Réserver'),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
