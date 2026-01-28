import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'favoriteChangeNontifier.dart';

class FavoriteIconWidget   extends StatefulWidget {

  _FavoriteIconWidgetState createState() => _FavoriteIconWidgetState();
}

class _FavoriteIconWidgetState extends State<FavoriteIconWidget> {
  bool _isFavorited= false ;

  void _toggleFqvorite( FavoriteChangeNontifier _notifier ){
    setState(() {
        if(_isFavorited){
          _isFavorited = !_isFavorited;
        } else{
          _isFavorited = !_isFavorited;
        }
        _notifier.isFavorited = _isFavorited;
    });
  }

  @override
  Widget build(BuildContext context) {
    FavoriteChangeNontifier _notifier = Provider.of<FavoriteChangeNontifier>(context);
    _isFavorited = _notifier.isFavorited;
    return IconButton(
          icon: _isFavorited ? Icon(Icons.favorite) :Icon(Icons.favorite_border),
          color: Colors.red,
          onPressed: () => _toggleFqvorite(_notifier),
        );
  }

}



class FavoriteTextWidget   extends StatefulWidget {

  @override
  State<FavoriteTextWidget> createState() => _FavoriteTextWidgetState( );
}

class _FavoriteTextWidgetState extends State<FavoriteTextWidget> {

  @override
  Widget build(BuildContext context) {
    return Consumer<FavoriteChangeNontifier>(
        builder: (context, notifier, _)  => Text(notifier.favoriteCount.toString())
    ) ;

  }

}
