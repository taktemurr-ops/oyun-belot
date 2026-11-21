import 'package:flutter_test/flutter_test.dart';
import 'package:kart_motoru/kart_motoru.dart';
import 'package:oyun_belot/oyun_belot.dart';
import 'package:studio_core/core/level_plan.dart';

void main() {
  test('33 dilde ad ve anlatım', () {
    expect(beloteConfig.title.length, 33);
    expect(beloteConfig.tagline.length, 33);
    for (final s in beloteConfig.tutorial) {
      expect(s.text.length, 33);
    }
  });

  test('bölümler kazanılabilir ve el sonuna kadar oynanır', () {
    final planner = LevelPlanner(gameId: beloteId, optionalMechanics: const []);
    for (final lv in [1, 77, 1500, 33333, 49999]) {
      final gl = beloteRules.build(planner.spec(lv));
      expect(gl.validation.ok, isTrue, reason: 'bölüm $lv');
      final end = TrickGameRules.simulate(gl.puzzle);
      expect(end.phase, TrickPhase.over, reason: 'bölüm $lv');
    }
  });
}
