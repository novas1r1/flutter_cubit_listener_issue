import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weird_bloc/bloc/documents2_bloc.dart';
import 'package:weird_bloc/cubit/documents_cubit.dart';
import 'package:weird_bloc/my_bloc_observer.dart';

void main() {
  Bloc.observer = const MyBlocObserver();

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: BlocProvider(
          create: (context) => DocumentsCubit(),
          child: const _MainAppCubitView(),
          // create: (context) => Documents2Bloc(),
          // child: const _MainAppBlocView(),
        ),
      ),
    );
  }
}

class _MainAppCubitView extends StatefulWidget {
  const _MainAppCubitView();

  @override
  State<_MainAppCubitView> createState() => _MainAppViewState();
}

class _MainAppViewState extends State<_MainAppCubitView> {
  @override
  void initState() {
    super.initState();
    context.read<DocumentsCubit>().load();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DocumentsCubit, DocumentsState>(
      listener: (context, state) {
        if (state.status == DocumentsStatus.loading) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Loading...')),
          );
        } else if (state.status == DocumentsStatus.data) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Data!')),
          );
        }
      },
      builder: (context, state) {
        switch (state.status) {
          case DocumentsStatus.initial:
            return const Center(child: Text('INITIAL!'));
          case DocumentsStatus.loading:
            // Does go in here
            return const Center(child: Text('LOADING!'));
          case DocumentsStatus.data:
            return const Center(child: Text('DATA'));
          case DocumentsStatus.error:
            return const Center(child: Text('ERROR!'));
        }
      },
    );
  }
}

class _MainAppBlocView extends StatefulWidget {
  const _MainAppBlocView();

  @override
  State<_MainAppBlocView> createState() => _MainAppBlocViewState();
}

class _MainAppBlocViewState extends State<_MainAppBlocView> {
  @override
  void initState() {
    super.initState();
    context.read<Documents2Bloc>().add(Documents2Load());
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<Documents2Bloc, Documents2State>(
      listener: (context, state) {
        if (state.status == Documents2Status.loading) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Loading...')),
          );
        } else if (state.status == Documents2Status.data) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Data!')),
          );
        }
      },
      builder: (context, state) {
        switch (state.status) {
          case Documents2Status.initial:
            return const Center(child: Text('INITIAL!'));
          case Documents2Status.loading:
            return const Center(child: Text('LOADING!'));
          case Documents2Status.data:
            return const Center(child: Text('DATA'));
          case Documents2Status.error:
            return const Center(child: Text('ERROR!'));
        }
      },
    );
  }
}
