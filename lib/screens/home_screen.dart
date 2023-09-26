import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreen createState() => _HomeScreen();
}

class _HomeScreen extends State<HomeScreen> {

  String _text = '';

   @override
   void initState() {
     super.initState();
   }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFeeedf2),
      body: ListView(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                            "Opa Pula pros outros componentes por favor"
                        ),
                        Text(
                          "Em manutenção!"
                        )
                      ],
                    ),
                    Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: const DecorationImage(
                            image: AssetImage(
                                "assets/images/img_1.png"
                            ),
                        )
                      ),
                    )
                  ],
                ),
                const SizedBox(height:100),
                TextField(
                  onChanged: (value) {
                    setState(() => _text = value);
                  },
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Escreve aqui',
                  ),
                ),
                const SizedBox(height: 100),
                Text(
                    _text,
                  style: const TextStyle(
                    fontSize: 20,
                    color: Colors.deepOrange,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
