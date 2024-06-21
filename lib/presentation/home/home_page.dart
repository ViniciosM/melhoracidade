import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:melhoracidade/core/enums/manifestation_category_enum.dart';
import 'package:melhoracidade/core/enums/manifestation_status_enum.dart';
import 'package:melhoracidade/data/dto/manifestation_dto.dart';
import 'package:melhoracidade/design_system/space/vz_space.dart';
import 'package:melhoracidade/presentation/home/widgets/filter_manifestations.dart';
import 'package:melhoracidade/presentation/home/widgets/header_user.dart';
import 'package:melhoracidade/presentation/home/widgets/manifestation_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              VZSpace.y24,
              HeaderUser(
                key: UniqueKey(),
              ),
              VZSpace.y24,
              FilterManifestations(key: UniqueKey()),
              VZSpace.y24,
              Expanded(
                child: ListView.separated(
                  //shrinkWrap: true,
                  itemCount: 10,
                  itemBuilder: (_, index) {
                    return ManifestationCard(
                      manifestationDTO: ManifestationDTO(
                        idManifestation: index.toString(),
                        idAuthor: '1',
                        category: ManifestationCategoryEnum.infraestrutura,
                        title: 'Ruas universitárias sem asfasto',
                        description:
                            'A logística para a Universidade X precisa ser melhorada. Os ônibus têm dificuldades no trajeto...',
                        images: '',
                        status: ManifestationStatusEnum.notSolved,
                        supportters: [],
                        createdAt: DateTime.now(),
                        updatedAt: DateTime.now(),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) => VZSpace.y16,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
