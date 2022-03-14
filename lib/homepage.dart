import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController imageLink = TextEditingController();
  String? pasteUrl;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,

          children: [
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 10,vertical: 30),
                child: Text("Image Loader",style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.w600),)),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40,vertical: 5),
                  child: Container(
                    width: 350,
                    child: TextField(
                      controller: imageLink,
                      cursorHeight: 20,
                      autofocus: false,

                      decoration: InputDecoration(
                        labelText: 'paste link',
                        hintText: "Enter Image Url",

                        contentPadding: const EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide(color: Colors.grey, width: 2),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide(color: Colors.grey, width: 1.5),
                        ),
                        focusedBorder: OutlineInputBorder(
                          gapPadding: 0.0,
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide(color: Colors.lightBlueAccent, width: 1.5),
                        ),
                      ),
                    ),
                  ),
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(120, 45),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15))
                    ),
                    onPressed: (){
                    setState(() {
                      pasteUrl = imageLink.text;
                    });
                    }, child: Text("Search"))
              ],
            ),
            SizedBox(
              height: 50,
            ),
            Center(
              child:pasteUrl!=null? Container(
                width: width*0.64,
                height: height*0.70,
                decoration: BoxDecoration(

                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(pasteUrl.toString())),
                  borderRadius: BorderRadius.circular(18)
                )
              ):null
            )
          ],
        ),
      ),

    );
  }
}
