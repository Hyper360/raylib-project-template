#include "../include/test.hpp"
#include "../include/raylib/raylib.h"

TestEntity::TestEntity(std::string name) { this->name = name; }

void TestEntity::draw() {
  DrawRectangle(GetScreenWidth() / 2 - 150, GetScreenHeight() / 2 - 150, 300,
                300, RED);

  float width = MeasureText(foo().c_str(), 12);
  DrawText(foo().c_str(), (GetScreenWidth() / 2) - (width / 2),
           GetScreenHeight() / 2, 12, RED);
}
