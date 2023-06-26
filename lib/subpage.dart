import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Subpage extends StatefulWidget {
  const Subpage({super.key});

  @override
  State<Subpage> createState() => _SubpageState();
}

class _SubpageState extends State<Subpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(
            'エアコンのお手入れ方法',
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
          ),
          leading: BackButton(
            color: Colors.black,
          )
        ),
        body: SingleChildScrollView(
            child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            ListTile(
              title: Text(
                '1.電源を切る',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                '作業の安全のため、掃除前に必ずエアコンの電源を切りましょう。',
                style: TextStyle(color: Colors.black, fontSize: 15),
              ),
              trailing: Image.network(
                  'https://3.bp.blogspot.com/-Hkg-eoCIePc/Ugsxi3ZN5II/AAAAAAAAXZg/LoOE32BKvUs/s400/setsuden_airconditioner.png'),
            ),
            SizedBox(
              height: 15,
            ),
            ListTile(
              title: Text(
                '2.フィルターの取り外し',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                'エアコンの前面パネルを開け、フィルターを取り外します。フィルターの取り外し方は機種により異なるので、取扱説明書を参照してください。',
                style: TextStyle(color: Colors.black, fontSize: 15),
              ),
              trailing: Image.network(
                  'https://4.bp.blogspot.com/-t5gJQ_VDxVY/Wge7xfx-TyI/AAAAAAABIDQ/Ts4-AYfNYw8k-YDfqDr9Ek78nCs5unS8ACLcBGAs/s400/eakon_kouji.png'),
            ),
            SizedBox(
              height: 15,
            ),
            ListTile(
              title: Text(
                '3.フィルターの掃除',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                'フィルターについているホコリは、掃除機で吸い取ります。頑固な汚れがある場合は、ぬるま湯で洗い、自然乾燥させましょう。',
                style: TextStyle(color: Colors.black, fontSize: 15),
              ),
              trailing: Image.network(
                  'https://2.bp.blogspot.com/-D9KZPxgFpRI/VPEnRSQIooI/AAAAAAAAr50/YN2zoM7kvJs/s400/eakon_souji.png'),
            ),
            SizedBox(
              height: 15,
            ),
            ListTile(
              title: Text(
                '4.エアコン本体の掃除',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                'フィルターを取り外したエアコン本体の中も、ホコリが溜まりやすいので、掃除機のノズルを使って清掃します。特に、風が出る部分は丁寧に清掃しましょう。',
                style: TextStyle(color: Colors.black, fontSize: 15),
              ),
              trailing: Image.network(
                  'https://3.bp.blogspot.com/-cH7aLQA9NoQ/XGjycZO8CvI/AAAAAAABRg4/Quy2xn-KOdkRV5Bmv3-ylW0hytm6700_wCLcBGAs/s500/eakon_cleaning_senjou.png'),
            ),
            SizedBox(
              height: 15,
            ),
            ListTile(
              title: Text(
                '5.フィルターの取り付け',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                'フィルターが乾いたら、本体に戻します。エアコンのパネルを閉じて電源を入れ、正常に動作することを確認しましょう。',
                style: TextStyle(color: Colors.black, fontSize: 15),
              ),
              trailing: Image.network(
                  'https://2.bp.blogspot.com/-5bNXcjt_dhs/VsGsA7eqYcI/AAAAAAAA36A/V1TfyPavppE/s400/eakon_reibou.png'),
            ),
            SizedBox(
              height: 25,
            ),
            Container(
              width: 350,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(10.0),
              ),
              padding: EdgeInsets.all(10.0),
              child: Column(
                children: [
                  Text(
                    "自身で行うエアコンの掃除は、月に1回程度が望ましいとされています。\n最低でも年に1回は専門業者による点検や清掃をお勧めします。",
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  ),
                  TextButton(
                    child: Text(
                      '詳しいお手入れ方法はこちら',
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                      ),
                    ),
                    onPressed: () {
                      final url =
                          Uri.parse('https://www.osoujihonpo.com/guide/aircon/181029-01#section10');
                      launchUrl(url);
                    },
                  ),
                ],
              ),
            ),
          ],
        )));
  }
}
