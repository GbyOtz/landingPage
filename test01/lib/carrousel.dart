import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:url_launcher/url_launcher.dart'; 

class CarouselDemo extends StatelessWidget {
  const CarouselDemo({Key? key}) : super(key: key);

  // metodo para abrir enlaces
  Future<void> _abrirEnlace(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication); //abre en el navegador
    } else {
      throw 'No se pudo abrir $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CARRERAS UPDS'),
        backgroundColor: Colors.blue.shade700,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            // Carrusel de imágenes
            CarouselSlider(
              options: CarouselOptions(
                height: 200.0,
                autoPlay: true,
                enlargeCenterPage: true,
              ),
              items: [
                'assets/images/red.jpg',
                'assets/images/medicina.jpg',
                'assets/images/inscripcion.jpg',
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
            const SizedBox(height: 20),

            // contenedor
            _buildInfoCard('PSICOLOGÍA',
                'El Licenciado en Psicología de la UPDS es aquel profesional que desarrolla '
                'actuaciones integrales para resolver problemas del contexto a través de los saberes conocer, hacer, ser y convivir.'),

            _buildInfoCard('DERECHO',
                'El Abogado graduado de la UPDS desarrolla actuaciones integrales para resolver problemas del contexto a través '
                'de los saberes conocer, hacer, ser y convivir.'),

            _buildInfoCard('MARKETING Y PUBLICIDAD',
                'El Licenciado en Marketing y Publicidad desarrolla actuaciones integrales para resolver problemas del contexto '
                'a través de los saberes conocer, hacer, ser y convivir.'),

            _buildInfoCard('INGENIERÍA EN SISTEMAS',
                'Un Ingeniero de Sistemas graduado de la UPDS desarrolla actuaciones integrales para resolver problemas del contexto '
                'a través de los saberes conocer, hacer, ser y convivir.'),

            const SizedBox(height: 20),

            // iconos de redes
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: const Icon(Icons.facebook, color: Colors.blue),
                  onPressed: () => _abrirEnlace('https://www.facebook.com/UPDS.bo/?locale=es_LA'),
                ),
                IconButton(
                  icon: const Icon(Icons.camera_alt, color: Colors.pink),
                  onPressed: () => _abrirEnlace('https://www.instagram.com/upds_santacruz/?hl=es'),
                ),
                IconButton(
                  icon: const Icon(Icons.message, color: Colors.lightBlue),
                  onPressed: () => _abrirEnlace('https://x.com/UPDSPOSTGRADO'),
                ),
                IconButton(
                  icon: const Icon(Icons.video_call, color: Colors.red),
                  onPressed: () => _abrirEnlace('https://youtube.com/@universidadprivadadomingos3411?si=w8Euxvs-q_6Xh6UW'),
                ),
              ],
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  // metodo para crear los contenedores de carreras
  Widget _buildInfoCard(String title, String content) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white60,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 5,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            content,
            style: const TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}
