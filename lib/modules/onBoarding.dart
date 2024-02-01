import 'package:delivery/componants/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class onBoarding extends StatefulWidget {
  const onBoarding({super.key});
  @override
  State<onBoarding> createState() => _onBoardingState();
}

class _onBoardingState extends State<onBoarding> {
  int currentPage=0;
  final controller=PageController();
  List <OnBoardingData> onBoardingItems=[
    OnBoardingData(image: 'assets/Free shipping.gif', headText: 'نجهز الطلبات فى وقت قصير', mainText: 'من خلال التطبق تسطيع طلب الطعام من اكبر المطاعم و يتم تجهيز الطلب و وصوله اليك فى وقت قصير'),
    OnBoardingData(image: 'assets/Take Away.gif', headText: 'يتحرك المندوب الى مكانك', mainText: 'يتجه المندوب الى مكانك و يمكنك تتبع مسار المندوب حتى يصل اليك و معرفة الوقت الذى يحتاجة للوصل'),
    OnBoardingData(image: 'assets/Delivery.gif', headText: 'استلم طلبك من المندوب', mainText: 'يصلك طلبك الى المكانك الحالى او اى مكان اخر تريد ارسال الطلب اليه')
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          controller.nextPage(duration: const Duration(microseconds: 300), curve: Curves.easeIn);
        },
        child: Icon(Icons.arrow_forward_ios_rounded,color: floatActionColor,),
        backgroundColor: mainColor,
      ),
      body: SafeArea(child: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Column(
          children: [
            Row(
              children: [
                 BackButton(
                  onPressed: () => Navigator.of(context).pop(),
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: TextButton(
                      onPressed: (){}, child: Text('تخطى',style: TextStyle(color: mainColor),)),
                ),
              ],
            ),
          const SizedBox(height: 25,),
            Expanded(
              child: PageView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: onBoardingItems.length,
                  controller: controller,
                  onPageChanged: (value){
                    setState(() {
                      currentPage=value;
                    });
                  },
                  itemBuilder: (context,index){
                    final items=onBoardingItems[index];
                return Column(
                  children: [
                  Image(image: AssetImage(items.image)),
                  Text(items.headText,style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 28
                  ),),
                  Align(
                    child: Text(items.mainText,
                      textAlign: TextAlign.right,
                      style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                        color: Colors.black,
                        fontSize: 18
                    ),),
                  ),
                ],);
              }),
            ),
            Row(children: List.generate(3, (index) {
              return Padding(
                padding: const EdgeInsets.only(right: 10.0,bottom: 10),
                child: AnimatedContainer(
                    duration: const Duration(microseconds: 100),
                    height: 10,
                    width: currentPage==index ?30:10,
                    decoration: BoxDecoration(
                      color: currentPage==index? mainColor:Colors.grey.shade400,
                      borderRadius: BorderRadius.circular(5)
                    ),),
              );
            }),)
          ],),
      )),
    );
  }
}
class OnBoardingData{
  final image;
  final headText;
  final mainText;
  OnBoardingData({required this.image,required this.headText,required this.mainText});
}