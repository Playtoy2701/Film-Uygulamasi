import 'package:film_uygulamasi/Filmler.dart';
import 'package:flutter/material.dart';

class Detaysayfa extends StatefulWidget {
  final Filmler film;

  const Detaysayfa({required this.film, Key? key}) : super(key: key);

  @override
  State<Detaysayfa> createState() => _DetaysayfaState();
}

class _DetaysayfaState extends State<Detaysayfa> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurpleAccent,
        title: Text(widget.film.film_adi),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset("resimler/${widget.film.film_resim_adi}"),
            Text(
              "${widget.film.film_fiyat.toStringAsFixed(2)} ₺",
              style: const TextStyle(fontSize: 48),
            ),
            SizedBox(
              width: 200,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  foregroundColor: Colors.white,
                ),
                onPressed: () {
                  // SnackBar göster
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text("${widget.film.film_adi} kiralandı!"),
                      backgroundColor: Colors.green,
                      duration: const Duration(seconds: 2),
                    ),
                  );

                  // 2 saniye bekle, sonra ana sayfaya dön
                  Future.delayed(const Duration(seconds: 2), () {
                    Navigator.pop(context);
                  });
                },
                child: const Text("KİRALA"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
