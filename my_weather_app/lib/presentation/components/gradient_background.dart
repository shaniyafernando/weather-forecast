import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubits/theme_cubit.dart';

class GradiantBackground extends StatelessWidget{
  final Widget child;

  const GradiantBackground({super.key, required this.child,});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
        gradient: LinearGradient(
          colors: context.watch<ThemeCubit>().isDark() ? [
            Colors.deepOrange.shade700,
            Colors.brown.shade900
          ]:[
            Colors.deepOrange.shade50,
            Colors.deepOrange.shade100,
            Colors.deepOrange.shade200
          ],
          begin: Alignment.bottomRight,
          end: Alignment.topLeft,
        ),
      ),
      child: child,
    );
  }

}