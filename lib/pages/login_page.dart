import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool checkboxValue;
  List<bool> packageValues = [false, false, false];
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void initState() {
    prepareFormWidgets();
    super.initState();
  }

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  prepareFormWidgets() {
    usernameController.text = "DemoUser";
    passwordController.text = "123456";
    checkboxValue = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.limeAccent.shade100,
      appBar: AppBar(
        title: Text('Login Page'),
      ),
      body: Center(
          child: Form(
        child: formWidgets(),
      )),
    );
  }

  Widget formWidgets() {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          TextFormField(
            controller: usernameController,
            decoration: InputDecoration(labelText: "Kullanıcı Adı"),
          ),
          TextFormField(
            controller: passwordController,
            decoration: InputDecoration(labelText: "Şifre"),
            obscureText: true,
          ),
          Center(
            child: Container(
              color: Colors.yellowAccent.shade200,
              margin: const EdgeInsets.all(8.0),
              child: ToggleButtons(
                children: toggleButtons(),
                isSelected: packageValues,
                fillColor: Colors.white,
                onPressed: (int index) {
                  for (var i = 0; i < packageValues.length; i++) {
                    packageValues[i] = false;
                  }

                  setState(() {
                    packageValues[index] = !packageValues[index];
                  });
                },
              ),
            ),
          ),
          Row(
            children: [
              Checkbox(
                value: checkboxValue,
                onChanged: (value) {
                  setState(() {
                    checkboxValue = value;
                  });
                },
              ),
              Text("Onaylıyor musunuz"),
            ],
          ),
          RaisedButton.icon(
            color: Colors.white,
            icon: Icon(Icons.login_rounded),
            label: SelectableText("Giriş"),
            onPressed: () {
              Navigator.pushNamed(context, "/home/${usernameController.text}");
            },
          )
        ],
      ),
    );
  }

  toggleButtons() {
    return [
      Container(
        padding: EdgeInsets.all(3),
        alignment: Alignment.center,
        child: Text("Altın"),
      ),
      Container(
        padding: EdgeInsets.all(3),
        alignment: Alignment.center,
        child: Text("Gümüş"),
      ),
      Container(
        padding: EdgeInsets.all(3),
        alignment: Alignment.center,
        child: Text("Bronz"),
      )
    ];
  }
}
