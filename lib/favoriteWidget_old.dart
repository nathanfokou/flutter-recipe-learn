import 'package:flutter/material.dart';


class Favoritewidget   extends StatefulWidget {
  final  bool isFavorited;
  final  int favoriteCount;

  const Favoritewidget ({ Key? key ,required this.isFavorited, required this.favoriteCount}): super(key: key);
  @override
  State<Favoritewidget> createState() => _FavoritewidgetState( this.isFavorited,  this.favoriteCount);
}

class _FavoritewidgetState extends State<Favoritewidget> {
  bool _isFavorited ;
  int _favoriteCount  ;

  void _toggleFqvorite(){
    setState(() {
        if(_isFavorited){
          _isFavorited = !_isFavorited;
          _favoriteCount -= 1;
        } else{
          _isFavorited = !_isFavorited;
          _favoriteCount += 1;
        }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          icon: _isFavorited ? Icon(Icons.favorite) :Icon(Icons.favorite_border),
          color: Colors.red,
          onPressed: _toggleFqvorite,
        ),
        Text('$_favoriteCount')
      ],
    );
  }

  _FavoritewidgetState(this._isFavorited, this._favoriteCount);
}
