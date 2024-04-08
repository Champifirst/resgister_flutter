import 'package:flutter/material.dart';
import 'package:register/screens/signup_screen.dart';
import 'package:register/widgets/custom_scaffold.dart';
import 'package:register/composants/text_input_field.dart';
import 'package:register/composants/custom_dropdown.dart';
import 'package:register/composants/custom_checkbox.dart';
import 'package:register/composants/custom_button.dart';
import 'package:register/composants/pass_input_field.dart';
import '../theme/theme.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _formSignInKey = GlobalKey<FormState>();

  final List<String> dropdownItems = ['ICAB', 'INSAM', 'TCHONANG'];
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  bool rememberPassword = true;

  @override
  void dispose(){
    _passwordController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
          
      child: Column(
        children: [

         SizedBox(
            height: 200
          ),
          Expanded(
            flex: 10,
            child: Container(
              padding: const EdgeInsets.fromLTRB(25.0, 35.0, 25.0, 25.0),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40.0),
                  topRight: Radius.circular(40.0),
                ),
              ),
              child: SingleChildScrollView(
                child: Form(
                  key: _formSignInKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Bienvenue',
                        style: TextStyle(
                          fontSize: 30.0,
                          fontWeight: FontWeight.w900,
                          color: lightColorScheme.primary,
                        ),
                      ),

                      const SizedBox(
                        height: 40.0,
                      ),

                      CustomDropdown(
                        label: 'Etablissement',
                        items: dropdownItems,
                        value: null,
                        onChanged: (value) {
                          // Do something with the selected value
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Veuillez choisir un établissement';
                          }
                          return null;
                        },
                      ),

                      const SizedBox(height: 25),

                      CustomTextInputField(
                        label: 'Email',
                        hintText: 'Entrer votre addresse email',
                        controller: _emailController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Veillez entrer addresse email';
                          }
                          return null;
                        },
                      ),

                      const SizedBox(height: 25),

                      CustomPassInputField(
                        label: 'Mot de passe',
                        hintText: 'Entrer votre Mot de passe',
                        controller: _passwordController,
                        obscureText: true,
                        obscuringCharacter: '*',
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Veillez entrer un Mot de passe';
                          }
                          return null;
                        },
                      ),

                      const SizedBox(height: 25),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              CustomCheckbox(
                                value: rememberPassword, // Valeur de la checkbox
                                onChanged: (value) {
                                  setState(() {
                                    rememberPassword = value!;
                                  });
                                },
                                activeColor: lightColorScheme.primary, // Couleur active de la checkbox
                              ),
                              const Text(
                                'Rappeler-moi',
                                style: TextStyle(
                                  color: Colors.black45,
                                ),
                              ),
                            ],
                          ),
                          GestureDetector(
                            child: Text(
                              'Mot de passe oublié?',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: lightColorScheme.primary,
                              ),
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(
                        height: 25.0,
                      ),

                      CustomButton(
                        text: 'S\'inscrire',
                        onPressed: (){
                          if(_formSignInKey.currentState!.validate()){
                            // Actions à effectuer en cas de soumission valide
                            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Encours de connexion...'),),);
                          }
                        },
                        color: lightColorScheme.primary, //couleur du bouton
                        width: double.infinity, // largeur personnalisée du bouton
                       // height: 50, // hauteur personnalisée du bouton
                       
                      ),

                      const SizedBox(
                        height: 25.0,
                      ),

                      // don't have an account
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Vous n’avez pas de compte? ',
                            style: TextStyle(
                              color: Colors.black45,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (e) => const SignUpScreen(),
                                ),
                              );
                            },
                            child: Text(
                              'S’enregistrer',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: lightColorScheme.primary,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
