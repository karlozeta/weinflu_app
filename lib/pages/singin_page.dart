import 'package:flutter/material.dart';
import 'package:weinflu_app/config/app_routes.dart';
import 'package:weinflu_app/design/colors.dart';
import 'package:weinflu_app/design/copys.dart';
import 'package:weinflu_app/design/radius.dart';

class SingInPage extends StatefulWidget {
  const SingInPage({super.key});

  @override
  State<SingInPage> createState() => _SingInPageState();
}

class _SingInPageState extends State<SingInPage> {
  final _formLoginKey = GlobalKey<FormState>();
  late String userName;
  var checkBoxState = false;
  var userInputController = TextEditingController();
  var userNameInputController = TextEditingController();
  var pswInputController = TextEditingController();
  late BoxDecoration userContainerDecoration;
  late BoxDecoration userNameContainerDecoration;
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
    userNameContainerDecoration = defaultContainerInputDecoration;
    pswContainerDecoration = defaultContainerInputDecoration;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.fromLTRB(16, 55, 16, 0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 36.0, right: 340),
              child: Container(
                  //margin: const EdgeInsets.only(bottom: 36),
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(WeinFluRadius.small),
                    border:
                        Border.all(color: WeinFluColors.brandLightColorBorder),
                    color: WeinFluColors.brandSecondaryColor,
                  ),
                  child: IconButton(
                    icon: const Icon(Icons.arrow_back,
                        color: WeinFluColors.brandPrimaryColor),
                    onPressed: () {
                      Navigator.of(context)
                                .pushReplacementNamed(AppRoutes.loginPage);
                    },
                  )),
            ),
            Container(
              padding: const EdgeInsets.only(right: 280, bottom: 11),
              child: Text(
                WeinfluCopys.singIn,
                style: Theme.of(context).textTheme.labelLarge,
              ),
            ),
            Container(
              padding: const EdgeInsets.only(bottom: 26),
              child: const Text(
                WeinfluCopys.lorem,
                style: TextStyle(
                    fontSize: 16, color: WeinFluColors.brandLigthDarkColor),
                textAlign: TextAlign.left,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 189,
                  height: 69,
                  decoration: const BoxDecoration(
                      color: WeinFluColors.brandSecondaryColor,
                      borderRadius: BorderRadius.all(WeinFluRadius.small)),
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
                      borderRadius: BorderRadius.all(WeinFluRadius.small)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Image(
                        image: AssetImage('assets/images/facebook.png'),
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
              height: 24,
            ),
            Row(
              children: const [
                Expanded(
                    child: Divider(
                  color: WeinFluColors.brandLightColorBorder,
                  thickness: 1.0,
                )),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24),
                  child: Text(
                    WeinfluCopys.or,
                    style: TextStyle(color: WeinFluColors.brandLigthDarkColor),
                  ),
                ),
                Expanded(
                    child: Divider(
                  color: WeinFluColors.brandLightColorBorder,
                  thickness: 1.0,
                )),
              ],
            ),
            const SizedBox(
              height: 24,
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
                            userContainerDecoration =
                                activeContainerInputDecoration;
                            userNameContainerDecoration =
                                defaultContainerInputDecoration;
                            pswContainerDecoration =
                                defaultContainerInputDecoration;
                          });
                        },
                        onTapOutside: (event) {
                          setState(() {
                            userContainerDecoration =
                                defaultContainerInputDecoration;
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
                      padding: const EdgeInsets.only(left: 23, bottom: 4),
                      margin: const EdgeInsets.symmetric(vertical: 24),
                      decoration: userNameContainerDecoration,
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
                            userContainerDecoration =
                                defaultContainerInputDecoration;
                            userNameContainerDecoration =
                                activeContainerInputDecoration;
                            pswContainerDecoration =
                                defaultContainerInputDecoration;
                          });
                        },
                        onTapOutside: (event) {
                          setState(() {
                            userNameContainerDecoration =
                                defaultContainerInputDecoration;
                          });
                        },
                        onSaved: (userNameValue) {
                          // userName = userNameValue!;
                        },
                        decoration: InputDecoration(
                          border: defaultInputBorder,
                          label: Text(
                            WeinfluCopys.userNameInputLabel,
                            style: defaultInputLabelTheme,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: 70,
                      padding: const EdgeInsets.only(left: 23, bottom: 4),
                      //margin: const EdgeInsets.symmetric(vertical: 24),
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
                            pswContainerDecoration =
                                activeContainerInputDecoration;
                            userContainerDecoration =
                                defaultContainerInputDecoration;
                            userNameContainerDecoration =
                                defaultContainerInputDecoration;
                          });
                        },
                        onTapOutside: (event) {
                          setState(() {
                            pswContainerDecoration =
                                defaultContainerInputDecoration;
                          });
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Checkbox(
                          shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(4))),
                          value: checkBoxState,
                          onChanged: ((value) {
                            setState(() {
                              checkBoxState = !checkBoxState;
                            });
                          }),
                          checkColor: WeinFluColors.brandLightColor,
                          activeColor: WeinFluColors.brandPrimaryColor,
                        ),
                        Text(
                          WeinfluCopys.iAgree,
                          style: defaultInputLabelTheme,
                        ),
                        TextButton(
                            onPressed: () {},
                            child: const Text(
                              WeinfluCopys.terms,
                              style: TextStyle(
                                  color: WeinFluColors.brandPrimaryColor,
                                  fontSize: 13),
                            )),
                        Text(
                          WeinfluCopys.and,
                          style: defaultInputLabelTheme,
                        ),
                        TextButton(
                            onPressed: () {},
                            child: const Text(
                              WeinfluCopys.privacy,
                              style: TextStyle(
                                  color: WeinFluColors.brandPrimaryColor,
                                  fontSize: 13),
                            ))
                      ],
                    ),
                    Container(
                      margin: const EdgeInsets.only(bottom: 30, top: 25),
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
                        child: const Text(
                          WeinfluCopys.getStarted,
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                    ),
                    const Divider(
                      color: WeinFluColors.brandLightColorBorder,
                      thickness: 1.0,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(WeinfluCopys.alredyAccount),
                        TextButton(
                          onPressed: () {
                            print('click');
                            Navigator.of(context)
                                .pushReplacementNamed(AppRoutes.loginPage);
                          },
                          child: const Text(
                            WeinfluCopys.logIn,
                            style: TextStyle(
                                color: WeinFluColors.brandPrimaryColor,
                                fontSize: 13),
                          ),
                        ),
                      ],
                    )
                  ],
                ))
          ],
        ),
      ),
    ));
  }
}
