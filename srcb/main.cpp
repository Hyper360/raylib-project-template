#include "../include/config.hpp"
#include "../include/game.hpp"
#include "../include/raylib/raylib.h"
#include <cstdio>

int main() {
  InitWindow(Config::WIDTH, Config::HEIGHT, Config::TITLE);
  SetTargetFPS(Config::FPS);

  Game game = Game();

  while (!WindowShouldClose()) {
    game.stateManager();
  }

  // Uncomment code below if you want the game to handle closing Raylib
  // if (game.getState() != GameState::EXIT) {
  //  printf("WARNING: Unusual exit pattern. Quitting application now.");
  //  game.exit();
  //}

  game.exit();
  CloseWindow();
}
