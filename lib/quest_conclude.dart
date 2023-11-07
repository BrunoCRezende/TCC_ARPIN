import 'package:ar_pin/tutoriais/led/tutorial_led.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'home_page.dart';
import 'user_profile.dart';
import 'tutoriais/led/quest_led.dart';

class QuestConcluido extends StatelessWidget {
  final int score;
  final int question;
  @override
  const QuestConcluido({super.key, required this.score, required this.question});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
            appBar: AppBar(
        elevation: 1,
        backgroundColor: Colors.white,
        actions: <Widget>[
          IconButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => UserProfile()));
              },
              icon: Image.asset('assets/images/user.png')),
        ],
        title: IconButton(
            iconSize: 40,
            onPressed: () {
              Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const HomePage()));
            },
            icon: Image.asset('assets/images/led.png')),
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Image.asset('assets/images/arrow.png')),
      ),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          double baseWidth = 1040;
          double fem = constraints.maxWidth / baseWidth;
          double ffem = fem * 0.97;
          double result = (score * 100) / question;
          bool pass;
          if (result < 70) {
            pass = false;
          } else {
            pass = true;
          }
          return SizedBox(
            width: double.infinity,
            child: Column(
              children: [
                _conclude(fem, ffem, pass),
                _result(fem, ffem, pass),
                Expanded(
                    child: Container(
                  margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 0 * fem, 50 * fem),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xffe51f43),
                        minimumSize: Size(919 * fem, 125 * fem),
                        elevation: 0,
                        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(50))),
                      ),
                      onPressed: pass
                          ? () {
                              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Tutorial()));
                            }
                          : () {
                              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const Quest()));
                            },
                      child: Text(
                        pass ? 'Concluido' : 'Tentar Novamente',
                        style: GoogleFonts.poppins(
                          fontSize: 48 * ffem,
                          fontWeight: FontWeight.w400,
                          height: 1.5 * ffem / fem,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                )),
              ],
            ),
          );
        },
      ),
    );
  }

  _conclude(double fem, double ffem, bool pass) {
    return Column(
      children: [
        Container(
          // questionarioBTd (296:116)
          margin: EdgeInsets.fromLTRB(0 * fem, 75 * fem, 0 * fem, 50 * fem),
          child: Text(
            pass ? 'Parabéns!' : 'Que pena!',
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(
              fontSize: 70 * ffem,
              fontWeight: FontWeight.w700,
              height: 1.5 * ffem / fem,
              fontStyle: FontStyle.italic,
              color: const Color(0xff000000),
            ),
          ),
        ),
        SizedBox(
          width: 400 * fem,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () {},
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50 * fem),
                  color: const Color(0xffffffff),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0x82615b69),
                      offset: Offset(0 * fem, 7 * fem),
                      blurRadius: 8 * fem,
                    ),
                  ],
                ),
                child: Container(
                  margin: EdgeInsets.fromLTRB(100 * fem, 100 * fem, 100 * fem, 100 * fem),
                  child: Image.asset(
                    'assets/images/led.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  _result(double fem, double ffem, bool pass) {
    return Column(children: [
      Center(
        child: Container(
          margin: EdgeInsets.fromLTRB(0 * fem, 100 * fem, 0 * fem, 50 * fem),
          constraints: BoxConstraints(
            maxWidth: 500 * fem,
          ),
          child: Text(
            pass ? 'Questionario concluido com sucesso!' : 'Foi quase lá!\nEstude mais um pouco ou tente novamente',
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(
              fontSize: 52 * ffem,
              fontWeight: FontWeight.w400,
              height: 1.5 * ffem / fem,
              color: const Color(0xff000000),
            ),
          ),
        ),
      ),
      Container(
        margin: EdgeInsets.fromLTRB(0 * fem, 100 * fem, 0 * fem, 50 * fem),
        child: Text(
          'Pontuação:',
          textAlign: TextAlign.center,
          style: GoogleFonts.poppins(
            fontSize: 54 * ffem,
            fontWeight: FontWeight.w700,
            height: 1.5 * ffem / fem,
            fontStyle: FontStyle.italic,
            color: const Color(0xff000000),
          ),
        ),
      ),
      Container(
        margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 0 * fem, 0 * fem),
        child: Text(
          '$score/${question + 1}',
          textAlign: TextAlign.center,
          style: GoogleFonts.poppins(
            fontSize: 150 * ffem,
            fontWeight: FontWeight.w300,
            height: 1.5 * ffem / fem,
            color: const Color(0xff000000),
          ),
        ),
      ),
      Center(
        // muitobomrkX (312:62)
        child: Text(
          pass ? 'Muito bom!' : 'Foi por pouco!',
          textAlign: TextAlign.center,
          style: GoogleFonts.poppins(
            fontSize: 52 * ffem,
            fontWeight: FontWeight.w400,
            height: 1.5 * ffem / fem,
            color: const Color(0xff000000),
          ),
        ),
      ),
    ]);
  }
}
