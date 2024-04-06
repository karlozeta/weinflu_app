import 'package:flutter/material.dart';
import 'package:weinflu_app/config/app_routes.dart';
import 'package:weinflu_app/design/colors.dart';
import 'package:weinflu_app/design/copys.dart';
import 'package:weinflu_app/design/radius.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formLoginKey = GlobalKey<FormState>();
  var checkBoxState = false;
  var userInputController = TextEditingController();
  var pswInputController = TextEditingController();
  late String userName;
  late BoxDecoration userContainerDecoration;
  late BoxDecoration pswContainerDecoration;
  final defaultInputBorder = InputBorder.none;
  final defaultInputLabelTheme = const TextStyle(
      fontSize: 13,
      color: WeinFluColors.brandLigthDarkColor,
      fontWeight: FontWeight.normal);
  final defaultContainerInputDecoration = const BoxDecoration(
    borderRadius: BorderRadius.all(WeinFluRadius.small),
    color: WeinFluColors.brandSecondaryColor,
  );
  final activeContainerInputDecoration = BoxDecoration(
    borderRadius: const BorderRadius.all(WeinFluRadius.small),
    border: Border.all(color: WeinFluColors.brandPrimaryColor, width: 2),
    color: WeinFluColors.brandSecondaryColor,
  );

  @override
  void initState() {
    super.initState();
    userContainerDecoration = defaultContainerInputDecoration;
    pswContainerDecoration = defaultContainerInputDecoration;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 100, 16, 0),
            child: Column(
              children: [
                Text(
                  WeinfluCopys.hello,
                  style: Theme.of(context).textTheme.labelLarge,
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(16, 21, 16, 59),
                  child: Text(
                    WeinfluCopys.lorem,
                    style: Theme.of(context).textTheme.labelMedium,
                    textAlign: TextAlign.center,
                  ),
                ),
                Form(
                    key: _formLoginKey,
                    child: Column(
                      children: [
                        Container(
                          height: 70,
                          padding: const EdgeInsets.only(left: 23, bottom: 4),
                          decoration: userContainerDecoration,
                          child: TextFormField(
                            controller: userInputController,
                            style: Theme.of(context).textTheme.labelSmall,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return WeinFluErrors.userError;
                              }
                              if (value.length >= 7) {
                                return WeinFluErrors.userErrorLen;
                              }
                              return null;
                            },
                            onTap: () {
                              setState(() {
                                userContainerDecoration = activeContainerInputDecoration;
                                pswContainerDecoration = defaultContainerInputDecoration;
                              });
                            },
                            onTapOutside: (event) {
                              setState(() {
                                userContainerDecoration = defaultContainerInputDecoration;
                              });
                            },
                            onSaved: (userNameValue) {
                              userName = userNameValue!;
                            },
                            decoration: InputDecoration(
                              border: defaultInputBorder,
                              label: Text(
                                WeinfluCopys.userInputLabel,
                                style: defaultInputLabelTheme,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          height: 70,
                          padding: const EdgeInsets.only(
                            left: 23,
                            bottom: 4
                          ),
                          margin: const EdgeInsets.symmetric(vertical: 24),
                          decoration: pswContainerDecoration,
                          child: TextFormField(
                            obscureText: true,
                            obscuringCharacter: '*',
                            decoration: InputDecoration(
                                border: defaultInputBorder,
                                label: const Text(WeinfluCopys.userPswInputLabel),
                                labelStyle: defaultInputLabelTheme),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return WeinFluErrors.userPsw;
                              }
                              return null;
                            },
                            onTap: () {
                              setState(() {
                                pswContainerDecoration = activeContainerInputDecoration;
                                userContainerDecoration = defaultContainerInputDecoration;
                              });
                            },
                            onTapOutside: (event) {
                              setState(() {
                                pswContainerDecoration = defaultContainerInputDecoration;
                              });
                            },
                          ),
                        ),
                        Row(
                          children: [
                            Checkbox(
                              shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(4))),
                              value: checkBoxState,
                              onChanged: ((value) {
                                setState(() {
                                  checkBoxState = !checkBoxState;
                                });
                              }),
                              checkColor: WeinFluColors.brandLightColor,
                              activeColor: WeinFluColors.brandPrimaryColor,
                            ),
                            Expanded(
                                child: Text(
                              WeinfluCopys.rememberMe,
                              style: defaultInputLabelTheme,
                            )),
                            TextButton(
                                onPressed: () {},
                                child: Text(
                                  WeinfluCopys.recoveryPassword,
                                  style: defaultInputLabelTheme,
                                ))
                          ],
                        ),
                        Container(
                          margin: const EdgeInsets.only(bottom: 48, top: 32),
                          width: 394,
                          height: 64,
                          child: ElevatedButton(
                            onPressed: () {
                              if (_formLoginKey.currentState!.validate()) {
                                print('Todos los campos del formulario Ok!');
                                _formLoginKey.currentState!.save();
                                Navigator.of(context).pushReplacementNamed(
                                    AppRoutes.home,
                                    arguments:
                                        userName); //Quita el boton de Atras de la siguiente pantalla
                              }
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: WeinFluColors.brandPrimaryColor,
                                shape: const RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(WeinFluRadius.small))),
                            child: const Text('Log In'),
                          ),
                        ),
                        Row(
                          children: [
                            const Expanded(
                                child: Divider(
                              color: WeinFluColors.brandLightColorBorder,
                              thickness: 1.0,
                            )),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 14),
                              child: Text(
                                WeinfluCopys.orContinue,
                                style: defaultInputLabelTheme,
                              ),
                            ),
                            const Expanded(
                                child: Divider(
                              color: WeinFluColors.brandLightColorBorder,
                              thickness: 1.0,
                            )),
                          ],
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: 189,
                              height: 69,
                              decoration: const BoxDecoration(
                                  color: WeinFluColors.brandSecondaryColor,
                                  borderRadius:
                                      BorderRadius.all(WeinFluRadius.small)),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Image(
                                    image: AssetImage('assets/images/google.png'),
                                    width: 30,
                                    height: 30,
                                  ),
                                  SizedBox(
                                    width: 12,
                                  ),
                                  Text(
                                    WeinfluCopys.google,
                                    style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.bold,
                                        color: WeinFluColors.brandLigthDarkColor),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              width: 189,
                              height: 69,
                              decoration: const BoxDecoration(
                                  color: WeinFluColors.brandSecondaryColor,
                                  borderRadius:
                                      BorderRadius.all(WeinFluRadius.small)),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Image(
                                    image:
                                        AssetImage('assets/images/facebook.png'),
                                    width: 30,
                                    height: 30,
                                  ),
                                  SizedBox(
                                    width: 12,
                                  ),
                                  Text(
                                    WeinfluCopys.facebook,
                                    style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.bold,
                                        color: WeinFluColors.brandLigthDarkColor),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(WeinfluCopys.notAMember),
                            TextButton(
                              onPressed: () {
                                print('click');
                                Navigator.of(context).pushReplacementNamed(
                                    AppRoutes.singin);
                              },
                              child: const Text(
                                WeinfluCopys.registerNow,
                                style: TextStyle(
                                    color: WeinFluColors.brandPrimaryColor,
                                    fontSize: 13),
                              ),
                            ),
                          ],
                        )
                      ],
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
