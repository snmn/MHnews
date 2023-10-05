
import 'package:flutter/material.dart';
import 'package:newsproject/pages/dashboard.dart';
import 'package:shared_preferences/shared_preferences.dart';
class loginpage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return loginpagestate();
  }

}
class loginpagestate extends State<loginpage>{

  TextEditingController textcontrolleremail =  TextEditingController();
  TextEditingController textcontrollerpsw =  TextEditingController();

  var error = false;
  bool isloading = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getfromstorage();
  }

  NavigatetoDashboard(){
    Navigator.pushAndRemoveUntil(context,
      MaterialPageRoute(builder: (context)=> Dashboard()),
          (route) => false,);
  }

  getfromstorage() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var email =  prefs.get('email');
    var psw = prefs.get('psw');
    if(email == null ){
      //
    }else{
      //loading
      setState(() {
        textcontrolleremail.text = email.toString();
        textcontrollerpsw.text = psw.toString();
        isloading = true;
      });
      NavigatetoDashboard();
    }
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width: size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //icon or image
            Image.network("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS3Lmq1cpBUiRrf3mCH5Pr4EMg44o3jRRnPSZgFL0XDWSZkSu9Ofn0zHvG52JHNE-gSoAE&usqp=CAU"
              ,height: 100,width: 150,fit: BoxFit.fitWidth,
            ),

            error==true?const Text(" Error loggin in"):Container(),
            const SizedBox(height: 30,),
            Container(
              padding: const EdgeInsets.only(left: 15),
              decoration: BoxDecoration(
                  color: const Color(0xfffbaf43),
                  borderRadius: BorderRadius.circular(30)
              ),
              height: size.height/3,
              width: size.width/1.3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  const Padding(
                    padding: EdgeInsets.all(15.0),
                    child: Text("Sign in",style: TextStyle(fontSize: 18,color: Colors.black),),
                  ),

                  Container(height: 45,width: size.width/1.5,
                    margin: const EdgeInsets.only(bottom: 15),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30)
                    )
                    ,child: TextField(
                        controller: textcontrolleremail,
                      )
                  ),

                  Container(height: 45,width: size.width/1.5,
                    margin: const EdgeInsets.only(top: 15,bottom: 15),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30)
                    )
                    ,child: TextField(
                        controller: textcontrollerpsw,
                        obscureText: true,
                      )
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () async {
                          setState(() {
                            isloading = true;
                          });
                          // navigate
                          if(textcontrolleremail.text.contains("@")
                              && textcontrollerpsw.text.length > 5){
                            final SharedPreferences prefs = await SharedPreferences.getInstance();
                            // email , password sharedpreference / storage store
                            await prefs.setString('email', textcontrolleremail.text);
                            await prefs.setString("psw", textcontrollerpsw.text);

                            Future.delayed(const Duration(seconds: 1)).whenComplete(() {
                              setState(() {
                                error = false;
                                isloading = false;
                              });
                              NavigatetoDashboard();
                            } );
                          }else{
                            setState(() {
                              isloading = false;
                              error=true;
                            });
                          }
                          //
                        },
                        child:isloading==false? Container(
                          height: 50,width: 150,
                          decoration: BoxDecoration(color: Colors.orange,
                              borderRadius: BorderRadius.circular(30)),
                          child: Center(
                            child: Text("Login".toUpperCase(),
                              style: const TextStyle(color: Colors.white,
                                  fontSize: 14,fontWeight: FontWeight.bold),),
                          )
                        ) :Container(height: 30,width: 30,
                            child: const CircularProgressIndicator(
                              color: Colors.white,value: 1,
                              strokeWidth: 0.5,backgroundColor: Colors.blue,)),

                      ),
                    ],
                  )

                ],
              ),
            )
            //container
          ],
        ),
      ),
    );
  }

}