import 'package:farmclick/Controller/game_controller.dart';
import 'package:farmclick/Utils/colors.dart';
import "package:flutter/material.dart";
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:percent_indicator/percent_indicator.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  GameController controller = new GameController();

  @override
  void initState() {
    controller.readyGame();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      return Scaffold(
        backgroundColor: VERY_LIGHT_GREEN,
        appBar: AppBar(
          automaticallyImplyLeading: false, // Don't show the leading button

          title:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Column(children: [
              Row(
                children: [
                  profileIcon(),
                  SizedBox(
                    width: 15,
                  ),
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Emmily guedes",
                          style: _appBarProfileTextStyle,
                        ),
                        Text(
                          "Level " + controller.level.toString(),
                          style: _appBarProfileTextStyle,
                        ),
                      ])
                ],
              ),
              SizedBox(
                height: 10,
              ),
              progressBar(
                  currentXp:
                      controller.currentExperience / controller.maxExperience)
            ]),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                iconAndText(controller.life.toString(),
                    controller.maxLife.toString(), Icons.favorite, RED),
                iconAndText(controller.money.toStringAsFixed(2), null,
                    Icons.payments, Color.fromRGBO(16, 192, 94, 1)),
                iconAndText(
                    controller.currentStorage.toString(),
                    controller.maxStorage.toString(),
                    Icons.breakfast_dining,
                    YELLOW),
              ],
            )
          ]),
          backgroundColor: DARK_GREEN,
          toolbarHeight: 100,
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.shopping_bag), label: "Loja"),
            BottomNavigationBarItem(
                icon: Icon(Icons.scatter_plot_outlined), label: "Opções"),
          ],
        ),
        body: Center(
          child: Column(
            children: [
              Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                elevation: 10,
                margin: EdgeInsets.all(20),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                  child: _farmerCard(
                      seconds: controller.farmer_controller.productionTime,
                      production:
                          controller.farmer_controller.productionQuantity,
                      quantity: controller.farmer_controller.quantity,
                      hapinness: controller.farmerHappiness),
                ),
              ),
              Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                elevation: 10,
                margin: EdgeInsets.all(20),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                  child: _consumerCard(
                      seconds: controller.consumer_controller.consumerTime,
                      consume: controller.consumer_controller.consumerQuantity,
                      quantity: controller.consumer_controller.quantity,
                      hapinness: controller.consumerHappiness),
                ),
              ),
              SizedBox(height: 20),
              Text("Vendar/Comprar Fazendeiros"),
              SizedBox(height: 20),
              increaseDecreaseButton(controller.increaseFarmer,
                  controller.decreaseFarmer, controller.costPerFarmer),
              SizedBox(height: 20),
              Text("Vendar/Comprar Consumidores"),
              SizedBox(height: 20),
              increaseDecreaseButton(controller.increaseConsumer,
                  controller.decreaseConsumer, controller.costPerConsumer),
              SizedBox(height: 20),
            ],
          ),
        ),
      );
    });
  }
}

Widget progressBar({double currentXp}) {
  return LinearPercentIndicator(
    width: 200.0,
    lineHeight: 14.0,
    percent: currentXp,
    backgroundColor: VERY_DARK_GREEN,
    progressColor: Colors.greenAccent,
  );
}

Widget iconAndText(String current, String max, IconData icon, Color color) {
  return Row(
    children: [
      max == null
          ? Text(
              current,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            )
          : Text(
              current + "/" + max,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
      SizedBox(width: 2),
      Icon(
        icon,
        color: color,
      )
    ],
  );
}

Widget profileIcon() {
  return Container(
      padding: EdgeInsets.only(left: 20),
      margin: EdgeInsets.only(left: 5),
      width: 60,
      height: 60,
      decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
          image:
              DecorationImage(image: AssetImage("assets/images/woman.png"))));
}

Widget _farmerCard({
  int seconds,
  int production,
  int quantity,
  double hapinness = 1,
}) {
  return Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
    Image.asset("assets/images/Fazendeiro.png"),
    Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text("Fazendeiros", style: _cardFarmerTitleStyle),
      Text(
        "Tempo: " + seconds.toString() + " segundos",
        style: _cardFarmerSubtitleStyle,
      ),
      Text("Felicidade: " + (hapinness * 100).toStringAsFixed(2),
          style: _cardFarmerSubtitleStyle),
      Text("Produção: " + production.toString() + " pães",
          style: _cardFarmerSubtitleStyle),
    ]),
    Text(quantity.toString(), style: _cardFarmerNumberStyle)
  ]);
}

Widget _consumerCard({
  int seconds,
  int consume,
  int quantity,
  double hapinness = 1,
}) {
  return Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
    Image.asset("assets/images/Consumidor.png"),
    Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(
        "Consumidor",
        style: TextStyle(
            fontSize: 24, color: DARK_GREEN, fontWeight: FontWeight.bold),
      ),
      Text(
        "Tempo: " + seconds.toString() + " segundos",
        style: _cardFarmerSubtitleStyle,
      ),
      Text("Felicidade: " + (hapinness * 100).toStringAsFixed(2),
          style: _cardFarmerSubtitleStyle),
      Text("Consumo: " + consume.toString() + " pães",
          style: _cardFarmerSubtitleStyle),
    ]),
    Text(quantity.toString(), style: _cardFarmerNumberStyle)
  ]);
}

Widget increaseDecreaseButton(Function increase, Function decrease, int cost) {
  return Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
    Container(
      width: 142,
      height: 42,
      child: ElevatedButton(
        onPressed: decrease,
        child: Text("+" + (cost * 0.4).toStringAsFixed(2)),
        style:
            ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.red)),
      ),
    ),
    Container(
      width: 142,
      height: 42,
      child: ElevatedButton(
          onPressed: increase, child: Text("-" + cost.toStringAsFixed(2))),
    ),
  ]);
}

AppBar costumNavbar = new AppBar(
  title: Row(
    children: [
      CircleAvatar(
        radius: 20,
        backgroundColor: Colors.white,
        backgroundImage: AssetImage("assets/images/woman.png"),
      )
    ],
  ),
);

TextStyle _appBarProfileTextStyle =
    TextStyle(fontSize: 16, fontWeight: FontWeight.bold); //

TextStyle _cardFarmerNumberStyle =
    TextStyle(fontSize: 26, color: DARK_GREEN, fontWeight: FontWeight.bold);

TextStyle _cardFarmerTitleStyle =
    TextStyle(fontSize: 24, color: DARK_GREEN, fontWeight: FontWeight.bold);
TextStyle _cardFarmerSubtitleStyle =
    TextStyle(fontSize: 14, color: DARK_GREEN, fontWeight: FontWeight.bold);

TextStyle _cardConsumerNumberStyle =
    TextStyle(fontSize: 26, color: DARK_GREEN, fontWeight: FontWeight.bold);

TextStyle _cardConsumerTitleStyle =
    TextStyle(fontSize: 24, color: DARK_GREEN, fontWeight: FontWeight.bold);
TextStyle _cardConsumerSubtitleStyle =
    TextStyle(fontSize: 14, color: DARK_GREEN, fontWeight: FontWeight.bold);
