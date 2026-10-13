import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'cafemenu.dart';
import 'cafelist.dart';

class AddCafeForm extends StatefulWidget {
  const AddCafeForm({super.key});

  @override
  State<AddCafeForm> createState() => _AddCafeFormState();
}

class _AddCafeFormState extends State<AddCafeForm> {
  final _formKey = GlobalKey<FormState>();
  String _name = '';
  String _review = '';
  int _price = 0;
  CafeType _cafeType = CafeType.type1;
  Cafepic _cafepic = Cafepic.menu1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "เพิ่มร้านคาเฟ่โปรด",
          style: GoogleFonts.kanit(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.brown,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                // ช่องกรอกชื่อร้าน
                TextFormField(
                  maxLength: 30,
                  decoration: InputDecoration(
                    label: Text("ชื่อร้านคาเฟ่", style: GoogleFonts.kanit(fontSize: 18)),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "กรุณาป้อนชื่อร้านคาเฟ่";
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _name = value!;
                  },
                ),
                const SizedBox(height: 15),

                // ช่องกรอกรีวิว
                TextFormField(
                  maxLength: 100,
                  decoration: InputDecoration(
                    label: Text("รีวิวสั้นๆ", style: GoogleFonts.kanit(fontSize: 18)),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "กรุณาป้อนรีวิว";
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _review = value!;
                  },
                ),
                const SizedBox(height: 15),

                // ช่องกรอกราคา (รับค่าเฉพาะตัวเลข)
                TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    label: Text("ราคาเฉลี่ย (บาท)", style: GoogleFonts.kanit(fontSize: 18)),
                  ),
                  onSaved: (value) {
                    _price = int.parse(value.toString());
                  },
                ),
                const SizedBox(height: 20),

                // Dropdown เลือกประเภทคาเฟ่
                DropdownButtonFormField<CafeType>(
                  initialValue: _cafeType,
                  decoration: InputDecoration(
                    label: Text("ประเภทคาเฟ่", style: GoogleFonts.kanit(fontSize: 18)),
                  ),
                  items: CafeType.values.map((key) {
                    return DropdownMenuItem(
                      value: key,
                      child: Text(key.ty, style: GoogleFonts.kanit()),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      _cafeType = value!;
                    });
                  },
                ),
                const SizedBox(height: 20),

                // Dropdown เลือกรูปภาพและแสดงไอคอนคู่ข้อความ
                DropdownButtonFormField<Cafepic>(
                  initialValue: _cafepic,
                  decoration: InputDecoration(
                    label: Text("เลือกเมนูแนะนำ", style: GoogleFonts.kanit(fontSize: 18)),
                  ),
                  items: Cafepic.values.map((pic) {
                    return DropdownMenuItem(
                      value: pic,
                      child: Row(
                        children: [
                          Text(pic.namecafe, style: GoogleFonts.kanit()),
                          const SizedBox(width: 10),
                          SizedBox(
                            width: 30,
                            height: 30,
                            child: Image.asset(
                              pic.image,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      _cafepic = value!;
                    });
                  },
                ),
                const SizedBox(height: 30),

                // ปุ่มบันทึกข้อมูล
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: FilledButton(
                    style: FilledButton.styleFrom(backgroundColor: Colors.brown),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                        cafeList.add(CafeModel(
                          name: _name,
                          review: _review,
                          price: _price,
                          cafepic: _cafepic,
                          cafeType: _cafeType,
                        ));
                        _formKey.currentState!.reset();

                        // Routing กลับไปยังหน้าแสดงรายการหลัก
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => CafeApp()),
                        );
                      }
                    },
                    child: Text(
                      "บันทึกข้อมูล",
                      style: GoogleFonts.kanit(fontSize: 20, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}