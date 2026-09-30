import 'package:flutter/material.dart';
import 'package:powwkemon/screens/home_page.dart';
import '../core/app_colors.dart';
import '../models/pokemon.dart';
import '../widgets/neo_box.dart';

class pokemonDetailPage extends StatelessWidget {
  final Pokemon pokemon;
  const pokemonDetailPage({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          pokemon.title,
          style: const TextStyle(
            fontWeight: FontWeight.w800,
            color: AppColors.ink,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Gambar Besar dengan Hard Shadow
            NeoBox(
              padding: EdgeInsets.zero,
              child: PokemonImage(
                imageUrl: pokemon.image,
                width: double.infinity,
                height: 220,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 24),
            // Judul Detail
            Text(
              '${pokemon.name}',
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w800,
                color: AppColors.ink,
              ),
            ),
            const SizedBox(height: 16),
            // Baris Info
            NeoBox(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'types',
                        style: TextStyle(fontWeight: FontWeight.w800),
                      ),
                      Text(
                        pokemon.types,
                        style: const TextStyle(fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                  const Divider(color: AppColors.ink, thickness: 2),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'name',
                        style: TextStyle(fontWeight: FontWeight.w800),
                      ),
                      Text(
                        pokemon.name,
                        style: const TextStyle(fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                  const Divider(color: AppColors.ink, thickness: 2),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'ability',
                        style: TextStyle(fontWeight: FontWeight.w800),
                      ),
                      Text(
                        pokemon.ability,
                        style: const TextStyle(fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                  const Divider(color: AppColors.ink, thickness: 2),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'height',
                        style: TextStyle(fontWeight: FontWeight.w800),
                      ),
                      Text(
                        pokemon.height.toString(),
                        style: const TextStyle(fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                  const Divider(color: AppColors.ink, thickness: 2),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'weight',
                        style: TextStyle(fontWeight: FontWeight.w800),
                      ),
                      Text(
                        pokemon.weight.toString(),
                        style: const TextStyle(fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            // Deskripsi
            const Text(
              'DESKRIPSI',
              style: TextStyle(
                fontWeight: FontWeight.w800,
                fontSize: 16,
                color: AppColors.ink,
              ),
            ),
            const SizedBox(height: 8),
            NeoBox(
              padding: const EdgeInsets.all(16),
              child: Text(
                pokemon.description,
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  color: AppColors.ink,
                  fontSize: 14,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
