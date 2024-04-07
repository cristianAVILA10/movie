import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:movie_2/models/popular.dart';


class MovieSlider extends StatelessWidget {
  
  final List<Popular> populares;

  const MovieSlider({
    Key? key,
    required this.populares
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 290,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _Title(),
          SizedBox(height: 3,),
          Expanded(
            child: ListView.builder(
              itemCount: populares.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (_, int index){
                final Popular popular = populares[index];
                return Container(
                  width: 130,
                  height: 190,
                  margin: EdgeInsets.only(right: 20),
                  child: Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: FadeInImage(
                          placeholder: AssetImage('assets/placeholder_image.jpg'),
                          image: NetworkImage('https://image.tmdb.org/t/p/w500'+popular.posterPath!),
                          height: 190,
                          width: 130,
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(height: 5,),
                      Text(popular.title ?? "",
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        textAlign: TextAlign.center,
                      )
                    ],
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}


class _Title extends StatelessWidget {
  const _Title({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 20, top: 5),
      child: Text('Popular', style: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.bold
      ),)
    );
  }
}
