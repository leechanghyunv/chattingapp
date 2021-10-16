import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:untitled7chat2/config/palette.dart';

class LoginSignupScreen extends StatefulWidget {
  const LoginSignupScreen({Key? key}) : super(key: key);

  @override
  _LoginSignupScreenState createState() => _LoginSignupScreenState();
}

class _LoginSignupScreenState extends State<LoginSignupScreen> {
  bool isSignupScreen = true;  //
  final _formKey = GlobalKey<FormState>();
  String userName ='';
  String userEmail ='';
  String userPassword = '';

  void _tryValidation(){
    final isValid = _formKey.currentState!.validate();
    if(isValid){
      _formKey.currentState!.save();
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.backgroundColor,
      body: GestureDetector(
        onTap: (){
          FocusScope.of(context).unfocus();
          },
        child: Stack(
          children: [
            Positioned(
                top: 0,
                right: 0,
                left: 0,
                child: Container(
                  height: 300,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('image/red.jpg'),
                      fit: BoxFit.fill
                    ),
                  ),
                  child: Container(
                    padding: const EdgeInsets.only(top: 90, left: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RichText(
                            text:  TextSpan(
                              text: 'Welcome',
                              style: TextStyle(
                                letterSpacing: 1.0,
                                fontSize: 25,
                                color: Colors.white),
                              children: [
                                TextSpan(
                                text: isSignupScreen ? ' to chat!' : ' back',
                                style: TextStyle(
                                    letterSpacing: 1.0,
                                    fontSize: 25,
                                    color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                                ),
                              ],
                            ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                         Text(
                           isSignupScreen ? 'Signup to continue' : 'Signin to continue',
                        style: TextStyle(
                          letterSpacing: 1.0,
                          color: Colors.white,
                        ),
                        ),
                      ],
                    ),
                  ),
                ),
            ),
            //배경
            AnimatedPositioned(
              duration: Duration(milliseconds: 500),
              curve: Curves.easeIn,
              top: 180,
              child: AnimatedContainer(
                duration: Duration(milliseconds: 500),
                curve: Curves.easeIn,
                padding: EdgeInsets.all(20),
                height: isSignupScreen ? 300.0 : 250,
                  width: MediaQuery.of(context).size.width-40,
                margin: EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 15,
                        spreadRadius: 5
                      ),
                    ],
                ),
                child: SingleChildScrollView(
                  padding: EdgeInsets.only(bottom: 20 ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          GestureDetector(
                            onTap: (){
                              setState(() {
                                isSignupScreen = false;
                              });
                            },
                            child: Column(
                              children: [
                                Text('LOGIN',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: !isSignupScreen ? Palette.activeColor : Palette.textColor1
                                    // isSignupScreen이 아닐결우 active 그렇지 않을경우 textcolor1 . 3항조건연산자
                                ),
                                ),
                                if(!isSignupScreen)
                                Container(
                                  margin: EdgeInsets.only(top: 3),
                                  height: 2,
                                  width: 55,
                                  color: Colors.orange,
                                )
                              ],
                            ),
                          ),
                          GestureDetector(
                            onTap: (){
                              setState(() {
                                isSignupScreen = true;
                              });
                            },
                            child: Column(
                              children: [
                                Text('SIGNUP',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: isSignupScreen ? Palette.activeColor :
                                      Palette.textColor1
                                  ),
                                ),
                                if(isSignupScreen)
                                Container(
                                  margin: EdgeInsets.only(top: 3),
                                  height: 2,
                                  width: 55,
                                  color: Colors.orange,
                                )
                              ],
                            ),
                          ),

                        ],
                      ),
                      if(isSignupScreen)
                      Container(
                        margin: EdgeInsets.only(top: 20),
                        child: Form(
                          key: _formKey,
                          child: Column(
                            children:  [
                              TextFormField(
                                key: ValueKey(1),
                                validator: (value){
                                  if(value!.isEmpty || value!.length < 4){
                                    return 'Please enter at least 4 characters';
                                  }
                                  return null;
                                },
                                // onSaved 사용자가 입력한 value 값을 저장하는 기능
                                onSaved: (value){
                                  userName = value!;
                                },
                                decoration: const InputDecoration(
                                  prefixIcon: Icon(
                                    Icons.account_circle,
                                    color: Palette.iconColor,
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Palette.textColor1
                                    ),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(35),
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Palette.textColor1
                                    ),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(35),
                                    ),
                                  ),
                                  hintText: 'User name',
                                  hintStyle: TextStyle(
                                    fontSize: 14,
                                    color: Palette.textColor1,
                                  ),
                                  contentPadding: EdgeInsets.all(10)
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              TextFormField(
                                key: ValueKey(2),
                                validator: (value){
                                  if(value!.isEmpty || !value.contains('@')){
                                    return 'Please enter a vaild email address.';
                                  }
                                  return null;
                                },
                                onSaved: (value){
                                  userEmail = value!;
                                },
                                decoration: const InputDecoration(
                                    prefixIcon: Icon(
                                      Icons.mail_rounded,
                                      color: Palette.iconColor,
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Palette.textColor1
                                      ),
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(35),
                                      ),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Palette.textColor1
                                      ),
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(35),
                                      ),
                                    ),
                                    hintText: 'mail adress',
                                    hintStyle: TextStyle(
                                      fontSize: 14,
                                      color: Palette.textColor1,
                                    ),
                                    contentPadding: EdgeInsets.all(10)
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              TextFormField(
                                key: ValueKey(3),
                                validator: (value){
                                  if(value!.isEmpty || value.length < 6){
                                    return 'password must be at lease 7 charactoers long';
                                  }
                                  return null;
                                },
                                onSaved: (value){
                                  userPassword = value!;
                                },
                                decoration: const InputDecoration(
                                    prefixIcon: Icon(
                                      Icons.password,
                                      color: Palette.iconColor,
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Palette.textColor1
                                      ),
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(35),
                                      ),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Palette.textColor1
                                      ),
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(35),
                                      ),
                                    ),
                                    hintText: 'password',
                                    hintStyle: TextStyle(
                                      fontSize: 14,
                                      color: Palette.textColor1,
                                    ),
                                    contentPadding: EdgeInsets.all(10)
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      if(!isSignupScreen)
                      Container(
                        margin: EdgeInsets.only(top: 20),
                        child: Form(
                          child: Column(
                            key: _formKey,
                            children: [
                              TextFormField(
                                key: ValueKey(4),
                                validator: (value){
                                  if(value!.isEmpty || !value.contains('@') ) {
                                    return 'Please enter a valid email address.';
                                  }
                                  return null;
                                },
                                onSaved: (value){
                                  userEmail = value!;
                                  },
                                decoration: const InputDecoration(
                                    prefixIcon: Icon(
                                      Icons.account_circle,
                                      color: Palette.iconColor,
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Palette.textColor1
                                      ),
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(35),
                                      ),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Palette.textColor1
                                      ),
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(35),
                                      ),
                                    ),
                                    hintText: 'username',
                                    hintStyle: TextStyle(
                                      fontSize: 14,
                                      color: Palette.textColor1,
                                    ),
                                    contentPadding: EdgeInsets.all(10)
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              TextFormField(
                                key: ValueKey(5),
                                validator: (value){
                                  if(value!.isEmpty || value.length < 6){
                                    return 'Password must be at least 7 characters long.';
                                  }
                                  return null;
                                },
                                onSaved: (value){
                                  userPassword = value!;
                                  },
                                decoration: const InputDecoration(
                                    prefixIcon: Icon(
                                      Icons.password_sharp,
                                      color: Palette.iconColor,
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Palette.textColor1
                                      ),
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(35),
                                      ),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Palette.textColor1
                                      ),
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(35),
                                      ),
                                    ),
                                    hintText: 'password',
                                    hintStyle: TextStyle(
                                      fontSize: 14,
                                      color: Palette.textColor1,
                                    ),
                                    contentPadding: EdgeInsets.all(10)
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                ),

              ),
            // 텍스트 폼 필드
            AnimatedPositioned(
              duration: Duration(milliseconds: 500),
              top: isSignupScreen ? 430 : 390,
              right: 0,
              left: 0,
              child: Center(
                child: Container(
                  padding: EdgeInsets.all(15),
                  height: 90,
                  width: 90,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(50)
                  ),
                  child: GestureDetector(
                    onTap: (){
                      _tryValidation();
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [
                            Colors.orange,
                            Colors.red,
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        borderRadius: BorderRadius.circular(30),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.3),
                            spreadRadius: 1,
                            blurRadius: 1,
                            offset: Offset(0,1),
                          ),
                        ],
                      ),
                      child: Icon(Icons.arrow_forward,
                      color: Colors.white,
                      ),

                    ),
                  ),
                ),
              ),
            ),
            // 중앙버튼
            AnimatedPositioned(
              duration: Duration(milliseconds: 500),
              curve: Curves.easeIn,
              top: isSignupScreen ? MediaQuery.of(context).size.height - 125
                :MediaQuery.of(context).size.height - 165,
                right: 0,
                left: 0,
                child: Column(
                  children: [
                    Text(isSignupScreen ? 'or Signup with' : 'or Signin with'),
                    SizedBox(
                      height: 10,
                    ),
                    TextButton.icon(
                        onPressed: (){},
                      style: TextButton.styleFrom(
                        primary: Colors.white,
                        minimumSize: Size(155,40),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)
                        ),
                        backgroundColor: Palette.googleColor
                      ),
                      icon: Icon(Icons.add),
                      label: Text('Google'),
                    )
                  ],
                ),
            ),
            // google 로그인 버튼

          ],
        ),
      ),

    );
  }
}