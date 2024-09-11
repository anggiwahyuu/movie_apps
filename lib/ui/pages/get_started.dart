import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GetStarted extends StatelessWidget {
  GetStarted({super.key});

  final formKey = GlobalKey<FormState>().obs;
  final username = TextEditingController().obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: Center(
        child: Container(
          padding: const EdgeInsets.fromLTRB(0, 90, 0, 10),
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width:300,
                height: 300,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/hero_img.png"),
                    fit: BoxFit.cover
                  ),
                ),
              ),

              const SizedBox(height: 20,),

              SizedBox(
                width: MediaQuery.of(context).size.width / 1.5,
                child: const Text(
                  "Yuk, Lihat Film Kesukaanmu",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 21,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              const SizedBox(height: 20,),

              const Text(
                "Situs Film Terpercaya, Bisa Anda Jangkau Kapan Saja dan Dimana Saja",
                style: TextStyle(
                  fontSize: 15,
                ),
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 30,),

              Obx(() => 
                Form(
                  key: formKey.value,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30.0),
                    child: Column(
                      children: [
                        TextFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Username harus diisi!";
                            }
                            return null;
                          },
                          controller: username.value,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(10)),
                            ),
                            hintText: "Username"
                          ),
                        ),

                        const SizedBox(height: 30,),
                    
                        Card(
                          elevation: 5,
                          color: const Color.fromARGB(255, 52, 152, 219),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)
                          ),
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width,
                            height: 52,
                            child: InkWell(
                              onTap: () {
                                if (formKey.value.currentState!.validate()) {
                                  Get.offNamed("/home", arguments: username.value.text);
                                }
                              },
                              child: const Center(
                                child: Text(
                                  "Masuk",
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}