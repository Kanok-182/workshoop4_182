import 'package:flutter/material.dart';

// 1. Enum สำหรับประเภทคาเฟ่
enum CafeType {
  type1(ty: 'กาแฟ'),
  type2(ty: 'ชาเขียว'),
  type3(ty: 'เบเกอรี่');

  const CafeType({required this.ty});
  final String ty;
}

// 2. Enum สำหรับรูปภาพและชื่อเมนู
enum Cafepic {
  menu1(namecafe: 'ลาเต้เย็น', image: 'assets/images/1.png'),
  menu2(namecafe: 'มัทฉะลาเต้', image: 'assets/images/2.png'),
  menu3(namecafe: 'ครัวซองต์', image: 'assets/images/3.png');

  const Cafepic({required this.image, required this.namecafe});
  final String image;
  final String namecafe;
}

// 3. Class โครงสร้างข้อมูลร้านคาเฟ่
class CafeModel {
  String name;
  String review;
  int price;
  Cafepic cafepic;
  CafeType cafeType;

  CafeModel({
    required this.name,
    required this.review,
    required this.price,
    required this.cafepic,
    required this.cafeType,
  });
}

// 4. List เก็บข้อมูลเริ่มต้นสำหรับแสดงผลในหน้าแรก
List<CafeModel> cafeList = [
  CafeModel(
    name: 'Cafe De Ora',
    review: 'บรรยากาศดี กาแฟหอมละมุน',
    price: 85,
    cafepic: Cafepic.menu1,
    cafeType: CafeType.type1,
  ),
];