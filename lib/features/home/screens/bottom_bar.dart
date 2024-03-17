import 'package:flutter/material.dart';

class CustomNavItem {
  final IconData iconName;
  final bool selected;

  CustomNavItem({
    required this.iconName,
    required this.selected,
  });
}

class CustomNavBar extends StatelessWidget {
  final List<CustomNavItem> navItems;
  final Function(int) onItemSelected;

  const CustomNavBar({
    super.key,
    required this.navItems,
    required this.onItemSelected,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      selectedFontSize: 0,
      unselectedFontSize: 0,
      items: navItems
          .map(
            (item) => BottomNavigationBarItem(
              icon: Icon(
                item.iconName,
                color:
                    item.selected ? Colors.black : Colors.black.withOpacity(.3),
              ),
              label: '',
            ),
          )
          .toList(),
      onTap: onItemSelected,
    );
  }
}
