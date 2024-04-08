import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:register/screens/signin_screen.dart';
import 'package:register/theme/theme.dart';
import 'package:register/widgets/custom_scaffold.dart';
import 'package:register/composants/custom_dropdown.dart';
import 'package:register/composants/radio_option.dart';
import 'package:register/composants/text_input_field.dart';
import 'package:register/composants/custom_button.dart';
import 'package:register/composants/custom_checkbox.dart';
import 'package:register/composants/pass_input_field.dart';
import 'package:register/composants/AutoComplete.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  String? _selectedGender = 'Oui';
  bool isDropdownEnabled = true;
  final _formSignupKey = GlobalKey<FormState>();

  final List<String> dropdownItems = ['ICAB', 'INSAM', 'TCHONANG'];

  bool agreePersonalData = true;
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confrimPasswordController = TextEditingController();
  final TextEditingController _nomController = TextEditingController();
  final TextEditingController _prenomController = TextEditingController();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _matriculeController = TextEditingController();

  @override
  void dispose() {
    _passwordController.dispose();
    _confrimPasswordController.dispose();
     _nomController.dispose();
     _prenomController.dispose();
    _firstNameController.dispose();
    _emailController.dispose();
    _matriculeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      child: Column(
        children: [
          SizedBox(height: 200),
          Expanded(
            flex: 1,
            child: Container(
              padding: const EdgeInsets.fromLTRB(25.0, 25.0, 25.0, 20.0),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40.0),
                  topRight: Radius.circular(40.0),
                ),
              ),
              child: SingleChildScrollView(
                child: Form(
                  key: _formSignupKey,

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Faites vous partir d\'un établissement scolaire? ',
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.w900,
                          color: lightColorScheme.primary,
                        ),
                      ),
                      const SizedBox(height: 25),
                      Center(
                        child:  Row(
                          mainAxisAlignment: MainAxisAlignment.center, //Alignement horizontal au centre
                          children: [
                            CustomRadioButton(
                              value: 'Oui',
                              groupValue: _selectedGender!,
                              onChanged: (value) {
                                setState(() {
                                  _selectedGender = value!;
                                  isDropdownEnabled = true;
                                });
                              },
                              text: 'Oui',
                            ),
                            Row(
                              children: [
                                const SizedBox(width: 25),
                                CustomRadioButton(
                                  value: 'Non',
                                  groupValue: _selectedGender!,
                                  onChanged: (value) {
                                    setState(() {
                                      _selectedGender = value!;
                                      isDropdownEnabled = false;
                                    });
                                  },
                                  text: 'Non',
                                ),
                              ],
                            ),
                          ],
                          ),
                      ),

                      const SizedBox(height: 25),

                      if (isDropdownEnabled)
                        AutoCompleteTextField(),

                        const SizedBox(height: 25),

                        CustomTextInputField(
                          label: 'Nom',
                          hintText: 'Entrer votre nom',
                          controller: _nomController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Veillez entrer votre nom';
                            }
                            return null;
                          },
                        ),
                      // Other form fields and buttons

                      const SizedBox(height: 25),

                      CustomTextInputField(
                        label: 'Prénom',
                        hintText: 'Entrer votre Prénom',
                        controller: _prenomController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Veillez entrer votre Prénom';
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

                      CustomPassInputField(
                        label: 'Confirmer le mot de passe',
                        hintText: 'Confirmer le mot de passe',
                        controller: _confrimPasswordController,
                        obscureText: true,
                        obscuringCharacter: '*',
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Veillez confirmer le mot de passe';
                          } else if(value != _passwordController.text){
                            return 'Le mot de passe ne correspond pas';
                          }
                          return null;
                        },
                      ),

                      const SizedBox(height: 25),

                      Row(
                        children: [
                           CustomCheckbox(
                            value: agreePersonalData, // Valeur de la checkbox
                            onChanged: (value) {
                              setState(() {
                                agreePersonalData = value!;
                              });
                            },
                            activeColor: lightColorScheme.primary, // Couleur active de la checkbox
                          ),
                          const Text(
                            'J’accepte le traitement des données',
                            style: TextStyle(
                              color: Colors.black45,
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 25),
                      
                      //Boutton de soumission du formulaire
                      CustomButton(
                        text: 'S\'inscrire',
                        onPressed: (){
                          if(_formSignupKey.currentState!.validate() && agreePersonalData){
                            // Actions à effectuer en cas de soumission valide
                            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Traitement des données'),),);
                          } else if(!agreePersonalData){
                            // Actions si l'utilisateur n'a pas accepté les conditions
                            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Veuillez accepter le traitement des données personnelles'),),);
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
                            'Vous avez déjà un compte? ',
                            style: TextStyle(
                              color: Colors.black45,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (e) => const SignInScreen(),
                                ),
                              );
                            },
                            child: Text(
                              'Se connecter',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: lightColorScheme.primary,
                              ),
                            ),
                          ),
                        ],
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