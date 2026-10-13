import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'cafemenu.dart';
import 'addcafe.dart';

class CafeApp extends StatefulWidget {
  const CafeApp({super.key});

  @override
  State<CafeApp> createState() => _CafeAppState();
}

class _CafeAppState extends State<CafeApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Cafe Diary - บันทึกคาเฟ่",
          style: GoogleFonts.kanit(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.brown,
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: cafeList.length,
              itemBuilder: (context, index) {
                var cafe = cafeList[index];
                return Card(
                  margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                  elevation: 4,
                  child: ListTile(
                    leading: Image.asset(cafe.cafepic.image, width: 50, height: 50),
                    title: Text(cafe.name, style: GoogleFonts.kanit(fontSize: 18, fontWeight: FontWeight.bold)),
                    subtitle: Text(
                      "${cafe.review}\nประเภท: ${cafe.cafeType.ty} | ราคา: ${cafe.price} บาท",
                      style: GoogleFonts.kanit(fontSize: 14),
                    ),
                    isThreeLine: true,
                  ),
                );
              },
            ),
          ),
          // ปุ่มเครื่องหมายบวกสำหรับเปิดหน้าเพิ่มข้อมูล
          Container(
            padding: const EdgeInsets.all(10),
            child: SizedBox(
              width: 120,
              height: 50,
              child: IconButton.filled(
                style: IconButton.styleFrom(backgroundColor: Colors.brown),
                icon: const Icon(Icons.add, size: 30, color: Colors.white),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AddCafeForm()),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}