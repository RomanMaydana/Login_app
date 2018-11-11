import 'package:flutter/material.dart';

// 1. Crear una clase StatefulWidget llamada LoginPage
class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // valueEmail, almacenará el usuario introducido
  String valueEmail = '';

  // controlador para el password
  TextEditingController valuePass = TextEditingController();

  _onchanged(String value) {
    // función setState() para guardar el valor de la entrada de correo en valueEmail
    setState(() {
      valueEmail = value;
    });
  }

  // 10. función donde nos mostrará el widget showDialog
  _registrarse(BuildContext context) {
    var alert = Container(
      height: MediaQuery
          .of(context)
          .size
          .height / 1.5,
      child: AlertDialog(
        contentPadding: EdgeInsets.all(32.0),
        title: Text('Registro'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[TextField()],
        ),
        actions: <Widget>[
          FlatButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('ok'),
          )
        ],
      ),
    );
    showDialog(context: context, builder: (BuildContext context) => alert);
  }

  @override
  Widget build(BuildContext context) {
    // 4. imagen para el login
    final logo = Center(
      // Image.asset requiere la localización de la imagen
      child: Image.asset(
        'assets/logo.png',
        height: 200.0,
      ),
    );
    // 5. userInput, se usará TextField para la entrada de datos
    final userInput = Padding(
      padding: const EdgeInsets.only(left: 32.0, right: 32.0, top: 16.0),
      child: TextField(
        // Una de las formas de obtener los datos es la prop onChanged,
        // se llamará a la funcion _onChanged localizada en la parte superior
        onChanged: _onchanged,
        decoration: InputDecoration(
            labelText: 'EMAIL',
            labelStyle:
            TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
            focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.red))),
      ),
    );
    // 6. userInput, se usará TextField para la entrada de datos
    final passInput = Padding(
      padding: const EdgeInsets.only(left: 32.0, right: 32.0, top: 16.0),
      child: TextField(
        // otra manera de almacenar los datos insertados, controller
        controller: valuePass,
        decoration: InputDecoration(
          labelText: 'PASSWORD',
          labelStyle:
          TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
          focusedBorder:
          UnderlineInputBorder(borderSide: BorderSide(color: Colors.red)),
        ),
        // no se visualice el texto insertado
        obscureText: true,
      ),
    );

    final forgot = Container(
      alignment: Alignment.bottomRight,
      padding: const EdgeInsets.only(right: 32.0, top: 8.0),
      child: InkWell(
        onTap: () {
          print('');
        },
        child: Text(
          'Forgot Password',
          style: TextStyle(
              color: Colors.red,
              fontWeight: FontWeight.bold,
              decoration: TextDecoration.underline),
        ),
      ),
    );
    // 7. loginButton, será un boton personalizado
    final loginButton = Container(
      padding: const EdgeInsets.only(left: 32.0, right: 32.0, top: 16.0),
      height: 50.0,
      child: Material(
        borderRadius: BorderRadius.circular(20.0),
        shadowColor: Colors.redAccent,
        color: Colors.red,
        elevation: 7.0,
        // InkWell nos proporciona la propiedad onTap, para poder hacer click
        // InkWell necesita el widget Material para poder tener un efecto spash
        // en el boton
        child: InkWell(
          borderRadius: BorderRadius.circular(20.0),
          onTap: () {
            // en caso de loguearse nos dirigirá a otra pantalla
            if (valueEmail.contains('@')) {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (BuildContext context) {
                return Scaffold(
                  appBar: AppBar(
                    title: Text('Contenido'),
                  ),
                  body: Container(
                    child: Text(valueEmail),
                  ),
                );
              }));
            }
          },
          child: Center(
            child: Text(
              'LOGIN',
              style:
              TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
    // 8. otra manera de realizar un boton personalizado usando GestureDetector,
    // que es un detector de gestos
    final faceButton = GestureDetector(
      onTap: () {},
      child: Container(
        padding: const EdgeInsets.only(left: 32.0, right: 32.0, top: 16.0),
        height: 50.0,
        color: Colors.transparent,
        child: Container(
          decoration: BoxDecoration(
              border: Border.all(
                  color: Colors.black, style: BorderStyle.solid, width: 1.0),
              borderRadius: BorderRadius.circular(20.0)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Center(
                child: Image.asset(
                  'assets/face.png',
                  height: 30.0,
                  color: Colors.black,
                ),
              ),
              Center(
                child: Text(
                  'Login in with Facebook',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              )
            ],
          ),
        ),
      ),
    );
    // 9. un fragmento de texto, que tenga la propiedad onTap
    final registrar = Container(
      padding: const EdgeInsets.only(left: 32.0, right: 32.0, top: 32.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'New to?',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          InkWell(
            onTap: () {
              // llamará a la función que se encuentra en la parte superior
              _registrarse(context);
            },
            child: Text(
              'Registrer ',
              style: TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.underline),
            ),
          )
        ],
      ),
    );
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
        centerTitle: true,
      ),

      // 3. las variables logo, userInput, passInput , etc
      // se encuentran instanciadas en la parte superior
      body: ListView(
        addAutomaticKeepAlives: true,
        children: <Widget>[
          logo,
          userInput,
          passInput,
          forgot,
          loginButton,
          faceButton,
          registrar
        ],
      ),
    );
  }
}
