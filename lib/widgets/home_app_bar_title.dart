import 'package:flutter/material.dart';
import 'package:weinflu_app/design/colors.dart';

class ContainerHeaderIcon extends StatelessWidget {
  final IconButton iconButton;
  final EdgeInsets? configMargin;
  const ContainerHeaderIcon(
      {super.key, required this.iconButton, this.configMargin});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 40,
      margin: configMargin,
      decoration: BoxDecoration(
          border: Border.all(color: WeinFluColors.brandLightColorBorder),
          borderRadius: const BorderRadius.all(Radius.circular(12))),
      child: iconButton,
    );
  }
}

class HomeAppbarTitle extends StatelessWidget {
  final String storeName;
  const HomeAppbarTitle({super.key, required this.storeName});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 40,
          height: 40,
          margin: const EdgeInsets.only(right: 12),
          decoration: const BoxDecoration(
              color: Colors.black,
              image:
                  DecorationImage(image: AssetImage('assets/images/user.png')),
              borderRadius: BorderRadius.all(Radius.circular(12))),
        ),
        Expanded(
          child: Text(
            storeName,
            style: Theme.of(context).textTheme.headlineLarge,
          ),
        ),
        ContainerHeaderIcon(
          iconButton: IconButton(
              onPressed: () => print('Presionaron Icono notificaciones'),
              icon: const Icon(
                Icons.notifications,
                color: WeinFluColors.brandPrimaryColor,
              )),
          configMargin: const EdgeInsets.only(right: 12),
        ),
        ContainerHeaderIcon(
            iconButton: IconButton(
                onPressed: () => print('Presionaron Icono notificaciones'),
                icon: const Icon(
                  Icons.more_vert,
                  color: WeinFluColors.brandPrimaryColor,
                ))),
      ],
    );
  }
}