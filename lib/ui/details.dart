import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:spots_discovery/data/endpoint/spot_endpoint.dart';
import 'package:spots_discovery/infrastructure/viewmodel/details_viewmodel.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({Key? key, required this.index}) : super(key: key);

  final int index;
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<DetailsViewModel>(
      create: (context) => DetailsViewModel(SpotEndpoint(GetIt.I.get<Dio>()), index),
      builder: (_, __) => Scaffold(
        appBar: AppBar(
          title: const Text("Détail du lieu"),
        ),
        body: Consumer<DetailsViewModel>(
          builder: (context, viewModel, child) => SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                viewModel.spots?.title ?? "",
                style: const TextStyle(fontSize: 20),
              ),

              viewModel.spots?.isRecommended == true || viewModel.spots?.isClosed == true ? 
              Banner(
                message: viewModel.spots?.isRecommended == true
                    ? "Recommendé"
                    : "Fermé",
                location: BannerLocation.topStart,
                
                color: Colors.red,
                child: Container(
                  height: 200,
                  width: 150,
                  margin: const EdgeInsets.all(16),
                  child: Image.network(
                    viewModel.spots?.imageFullsize ?? "",
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) =>
                        const SizedBox(),
                  ),
                ),
              ) :
              Image.network(
                viewModel.spots?.imageFullsize ?? "",
                height: 200,
                width: 150,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => const SizedBox(),
              ),
              Text(viewModel.spots?.address ?? ""),
              Text(viewModel.spots?.trainStation ?? ""),
              Text(viewModel.spots?.description ?? ""),
            ],
          )),
        ),
      ),
      lazy: false,
    );
  }
}
