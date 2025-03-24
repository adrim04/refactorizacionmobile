import 'package:flutter/material.dart';

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final List<Map<String, dynamic>> _productos = [];
  double _total = 0.0;

  void _agregarProducto(String nombre, double precio, int cantidad) {
    setState(() {
      _productos.add({"nombre": nombre, "precio": precio, "cantidad": cantidad});
      _calcularTotal();
    });
  }

  void _calcularTotal() {
    _total = _productos.fold(0, (suma, producto) => suma + producto["precio"] * producto["cantidad"]);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("Mi App")),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Total: \$${_total.toStringAsFixed(2)}", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: _productos.length,
                itemBuilder: (context, index) {
                  final producto = _productos[index];
                  return ListTile(
                    title: Text(producto["nombre"]),
                    subtitle: Text("Precio: \$${producto["precio"]} x ${producto["cantidad"]}"),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MyApp());
}