import 'package:flutter/material.dart';

class MapPage extends StatelessWidget {
  const MapPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Liste des trajets avec lieux précis et heures de départ
    final List<Map<String, String>> rides = [
      {
        'departure': 'Dakar',
        'arrival': 'Kebemer',
        'time': '07h:00 ',
        'location': 'Croisement Cambérène',
      },
      {
        'departure': 'Dakar',
        'arrival': 'Touba',
        'time': '07h:30',
        'location': 'Croisement Cambérène',
      },
      {
        'departure': 'Kebemer',
        'arrival': 'Dakar',
        'time': '04h:00 ',
        'location': 'Gare de Kébémer',
      },
      {
        'departure': 'Kébémer',
        'arrival': 'TOuba',
        'time': '07h:00 ',
        'location': 'Gare de Kébémer',
      },
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text('Trajets disponibles'),
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
                    // Affiche une boîte de dialogue avec les détails du trajet
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          title: const Text(
                            'Détails du trajet',
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
                            ],
                          ),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              style: TextButton.styleFrom(
                                foregroundColor: Colors.green,
                              ),
                              child: const Text('OK'),
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
                  child: const Text('Détails'),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
