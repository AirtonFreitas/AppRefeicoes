import 'package:flutter/material.dart';
import '../components/main_drawer.dart';
import '../models/settings.dart';

class SettingsScreen extends StatefulWidget {

  final Settings settings;
  final Function(Settings) onSettingsChanged;
  const SettingsScreen(this.settings, this.onSettingsChanged);

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {

  late Settings set , settings;

  @override
  void initState(){
    super.initState();
    settings = widget.settings;
  }

  Widget _createSwitch(String title,
      String subtitle,
      bool value,
      Function(bool) onChanged,) {
    return SwitchListTile.adaptive(
      title: Text(title),
      subtitle: Text(subtitle),
      value: value,
      onChanged: (value){
        onChanged(value);
        widget.onSettingsChanged(settings);
      },);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Configurações'),
      ),
      drawer: MainDrawer(),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Configurações',
              style: Theme
                  .of(context)
                  .textTheme
                  .headline6,),

          ),
          Expanded(child: ListView(
            children: [
              _createSwitch('Sem Glúten', 'Exibir somente refeições sem Glutén',
                settings.isGlutenFree, (value) =>
                    setState(() => settings.isGlutenFree = value),),
              _createSwitch('Sem Lactose', 'Exibir somente refeições sem Lactose',
                settings.isLactoseFree, (value) =>
                    setState(() => settings.isLactoseFree = value),),
              _createSwitch('Vegana', 'Exibir somente refeições Veganas',
                settings.isVegan, (value) =>
                    setState(() => settings.isVegan = value),),
              _createSwitch('Vegetariana', 'Exibir somente refeições Vegetarianas',
                settings.isVegetarian, (value) =>
                    setState(() => settings.isVegetarian = value),),
            ],
          ))
        ],
      ),
    );
  }
}
