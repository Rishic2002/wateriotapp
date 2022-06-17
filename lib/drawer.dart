import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    const imageUrl =
        "https://3.bp.blogspot.com/-LY0pQ6kEtm8/XmHx3p6ht7I/AAAAAAAAMaI/NQZdZInooPgoDpHde_u1c3Kf83Oo5PlZwCK4BGAYYCw/s113/IMG_20190927_131410.jpg";
    return Drawer(
      child: Container(
        color: Colors.blue,
        child: ListView(
          children: [
            ListTile(
              onTap: () {
                Navigator.of(context).pushNamed("/home");
              },
              leading: const Icon(
                CupertinoIcons.home,
                color: Colors.white,
              ),
              title: const Text(
                "Home",
                textScaleFactor: 1.2,
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            ListTile(
              onTap: () {
                Navigator.of(context).pushNamed("/Apartments");
              },
              leading: const Icon(
                CupertinoIcons.device_laptop,
                color: Colors.white,
              ),
              title: const Text(
                "Apartments",
                textScaleFactor: 1.2,
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            ListTile(
              onTap: () {
                Navigator.of(context).pushNamed("/Water Level");
              },
              leading: const Icon(
                CupertinoIcons.calendar,
                color: Colors.white,
              ),
              title: const Text(
                "Water Level",
                textScaleFactor: 1.2,
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            ListTile(
              onTap: () {
                Navigator.of(context).pushNamed("/WaterQuality");
              },
              leading: const Icon(
                CupertinoIcons.list_bullet_below_rectangle,
                color: Colors.white,
              ),
              title: const Text(
                "Water Quality",
                textScaleFactor: 1.2,
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            ListTile(
              onTap: () {
                Navigator.of(context).pushNamed("/PowerConsumption");
              },
              leading: const Icon(
                CupertinoIcons.link_circle,
                color: Colors.white,
              ),
              title: const Text(
                "Power Consumption",
                textScaleFactor: 1.2,
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            ListTile(
              onTap: () {
                Navigator.of(context).pushNamed("/backupRestore");
              },
              leading: const Icon(
                CupertinoIcons.book_circle_fill,
                color: Colors.white,
              ),
              title: const Text(
                "Backup / Restore",
                textScaleFactor: 1.2,
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            // SizedBox(
            //   height: 300.0,
            // ),
            const Spacer(),
            Divider(
              color: Colors.blue.shade600,
              thickness: 4,
            ),

            ListTile(
              onTap: () {
                Navigator.of(context).pushNamed("/signup");
              },
              leading: const Icon(
                CupertinoIcons.fullscreen_exit,
                color: Colors.white,
              ),
              title: const Text(
                "Log Out",
                textScaleFactor: 1.2,
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
