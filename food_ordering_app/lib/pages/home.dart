import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:food_ordering_app/config/config.dart';
import 'package:food_ordering_app/models/item_model.dart';
import 'package:food_ordering_app/models/offerslidermodel.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var offersSlider = [
    OfferSliderItem(
        "https://www.landolakes.com/RecipeManagementSystem/media/Recipe-Media-Files/Recipes/Retail/x17/2018_Avocado-and-Bacon-Grilled-Cheese_2644_600x600.jpg?ext=.jpg",
        "Italian Sandwhich",
        "Italian Restaurant"),
    OfferSliderItem(
        "https://www.qsrmagazine.com/sites/default/files/styles/story_page/public/story/red-roofs-are-haunting-pizza-huts-sales.jpg?itok=z0D4czud",
        "Pizza",
        "DuBuque - Fahey"),
    OfferSliderItem(
        "https://www.washingtonpost.com/resizer/Kv8laiHtDM2ZOMNV4eP3lUTN8HA=/767x0/smart/arc-anglerfish-washpost-prod-washpost.s3.amazonaws.com/public/2KL6JYQYH4I6REYMIWBYVUGXPI.jpg",
        "Package",
        "Bogan Group"),
  ];


  var items = [
    ItemModel(
      itemId: "1",
      itemImage: "https://images.pexels.com/photos/1633578/pexels-photo-1633578.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940",
      itemName: "Burger",
      itemPrice: "1.99",
      itemRating: "4.4",
      itemRestaurantAddress: "Times Square, NY, California",
      itemRestaurantName: "Will's Pizza Shop"
    ),
    ItemModel(
      itemId: "2",
      itemImage: "https://images.pexels.com/photos/132694/pexels-photo-132694.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
      itemName: "Cake",
      itemPrice: "10",
      itemRating: "4.9",
      itemRestaurantAddress: "65187 Rosenbaum Rest",
      itemRestaurantName: "Have More 🙃"
    ),
    ItemModel(
      itemId: "3",
      itemImage: "https://images.pexels.com/photos/982612/pexels-photo-982612.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
      itemName: "Coffee",
      itemPrice: "1.99",
      itemRating: "4.0",
      itemRestaurantAddress: "4795 Susie Throughway",
      itemRestaurantName: "Star Cafe"
    ),
    ItemModel(
      itemId: "4",
      itemImage: "https://images.pexels.com/photos/1279330/pexels-photo-1279330.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
      itemName: "Salad",
      itemPrice: "2",
      itemRating: "4.5",
      itemRestaurantAddress: "212 Lisandro Harbor",
      itemRestaurantName: "Grandpa's Restaurant"
    ),
    ItemModel(
      itemId: "5",
      itemImage: "https://images.pexels.com/photos/1600711/pexels-photo-1600711.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
      itemName: "Sandwhich",
      itemPrice: "2.99",
      itemRating: "4.6",
      itemRestaurantAddress: "45414 O'Kon Haven",
      itemRestaurantName: "John's Sandwhich"
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Container(
        child: Column(
          children: <Widget>[
            _buildOffersSlider(),
            SizedBox(height: 20,),
            Divider(),
            
            Container(
              margin: EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text("Items"),
                  FlatButton.icon(
                    icon: Icon(FontAwesomeIcons.filter),
                    label: Text("Filter"),
                    onPressed: () {},
                  )
                ],
              ),
            ),
            _buildItemList(),
            
          ],
        ),
      ),
    );
  }

  Widget _buildOffersSlider() {
    return CarouselSlider(
      height: 200,
      items: offersSlider.map((i) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
              ),
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.symmetric(horizontal: 5.0),
              child: Stack(
                children: <Widget>[
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: FadeInImage(
                      width: MediaQuery.of(context).size.width,
                      height: 200,
                      fit: BoxFit.cover,
                      placeholder: AssetImage("assets/placeholder.jpg"),
                      image: NetworkImage(i.image),
                    ),
                  ),
                  Container(
                    alignment: Alignment.bottomLeft,
                    child: Text(i.itemName),
                    margin: EdgeInsets.all(10),
                  ),
                ],
              ),
            );
          },
        );
      }).toList(),
    );
  }

  // widget for the items
  Widget _buildItemList() {
    return Container(
      margin: EdgeInsets.all(10),
      child: ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        itemCount: items.length,
        shrinkWrap: true,
        itemBuilder: (ctx, i) {
          return InkWell(
            onTap: () {},
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 5,),
              child: Row(
                children: <Widget>[
                  
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: FadeInImage(
                      placeholder: AssetImage("assets/placeholder.jpg"),
                      image: NetworkImage(items[i].itemImage),
                      width: 150,
                      height: 150,
                      fit: BoxFit.cover,
                    ),
                  ),

                  Container(
                    margin: EdgeInsets.only(left: 10,),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          items[i].itemName,
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),

                        Text(
                          items[i].itemRestaurantName
                        ),

                        Text(
                          items[i].itemRestaurantAddress
                        ),

                        Text(
                          items[i].itemRating,
                        ),

                        Text(
                          "\$${items[i].itemPrice}",
                          style: TextStyle(
                            color: primaryColor,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  )


                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
