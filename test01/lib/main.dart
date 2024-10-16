import 'package:carousel_slider/carousel_slider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:test01/firebase_options.dart';
import 'carrousel.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MaterialApp(
    home: LandingPage(),
    debugShowCheckedModeBanner: false, 
  ));
}


class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // encabezado
            Stack(
              children: [
                Container(
                  height: 300,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/red.jpg'), // imagen
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  top: 80,
                  left: 20,
                  child: Text(
                    ' ',
                    style: TextStyle(
                      fontSize: 23,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                Positioned(
                  top: 40,
                  left: 10,
                 child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => CarouselDemo()), // redireccion
                      );
                    },
                    style: ElevatedButton.styleFrom(
                
                      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    ),
                    
                    child: const Text(
                      'CARRERAS',
                      style: TextStyle(fontSize: 18, color: Color.fromARGB(255, 12, 12, 12)),
                    ),
                  ),

                ),
              ],
            ),

            const SizedBox(height: 40),

            // informacion
            Container(
              width: double.infinity, // ocupa todo el ancho disponible
              padding: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: const Color.fromARGB(153, 238, 234, 234), 
                borderRadius: BorderRadius.circular(30), //para bordes redondos
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'UNIVERSIDAD PRIVADA DOMINGO SAVIO ',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Orgullosos de conformar la red universitaria mas grande de todo el pais. , '
                    'PROFESIONALES + HUMANOS. ',
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
             const SizedBox(height: 20),

            Container(
              width: double.infinity, 
              padding: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: Colors.blue.shade50, 
                borderRadius: BorderRadius.circular(40),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  
                  Text(
                    'VISION',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Ser la red de educación universitaria referente a '
                    'nivel nacional por su formación académica de  '
                    'excelencia basada en la investigación científica y su '
                    'con la Internacionalización. ',
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
             const SizedBox(height: 10),

            Container(
              width: double.infinity, 
              padding: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: Colors.blue.shade100, 
                borderRadius: BorderRadius.circular(40), 
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
               children: const [
                  Text(
                    'MISION',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Generar cambios en las personas para '
                    'desarrollar emprendedores socialmente responsables '
                    'capaces de responder a desafíos emergentes.',
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
             const SizedBox(height: 40),

            //carrousel
            CarouselSlider(
              options: CarouselOptions(
                height: 200.0,
                autoPlay: true,
                enlargeCenterPage: true,
              ),
              items: [
                'assets/images/administrativos.jpg',
                'assets/images/red.jpg',
                'assets/images/universidad.jpg',
              ].map((imagePath) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                      margin: const EdgeInsets.symmetric(horizontal: 5.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        image: DecorationImage(
                          image: AssetImage(imagePath),
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  },
                );
              }).toList(),
            ),
            const SizedBox(height: 30),

            // boton accion
            ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Contactate con: +591 63388912 para mas informacion')),
                );
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                    horizontal: 32, vertical: 16),
                backgroundColor: Colors.blue.shade400,
              ),
              child: const Text(
                'MAS INFORMACION',
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),

            const SizedBox(height: 20),

            // pie de pagina
            Container(
              color: Colors.blue.shade400,
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: const Center(
                child: Text(
                  '© 2024 - Todos los derechos reservados',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}



