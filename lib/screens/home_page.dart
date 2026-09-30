import 'package:flutter/material.dart';
import '../core/app_colors.dart';
import '../services/pokemon_repository.dart';
import '../widgets/neo_box.dart';
import 'pokemon_detail_page.dart';

class PokemonImage extends StatelessWidget {
  final String imageUrl;
  final double width;
  final double height;

  const PokemonImage({
    super.key,
    required this.imageUrl,
    required this.width,
    required this.height, required BoxFit fit,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Image.network(
        imageUrl,
        width: width,
        height: height,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) {
          return Container(
            width: width,
            height: height,
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Icon(
              Icons.image_not_supported,
              color: AppColors.ink,
            ),
          );
        },
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  final String username;
  const HomePage({super.key, required this.username});

  @override
  Widget build(BuildContext context) {
    final pokemons = PokemonRepository.getAll();

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: pokemons.length,
      itemBuilder: (context, index) {
        final pokemon = pokemons[index];
        return Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => pokemonDetailPage(pokemon : pokemon),
                ),
              );
            },
            child: NeoBox(
              padding: const EdgeInsets.all(12),
              child: Row(
                children: [
                  PokemonImage(
                    imageUrl: pokemon.image,
                    width: 96,
                    height: 72, fit: BoxFit.cover,
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          pokemon.name,
                          style: const TextStyle(
                            fontWeight: FontWeight.w800,
                            fontSize: 16,
                            color: AppColors.ink,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 4),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 2,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.accent,
                            borderRadius: BorderRadius.circular(4),
                            border: Border.all(color: AppColors.ink, width: 2),
                          ),
                          child: Text(
                            '${pokemon.types}',
                            style: const TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 12,
                              color: AppColors.ink,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Icon(
                    Icons.pets,
                    color: AppColors.ink,
                    size: 28,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
