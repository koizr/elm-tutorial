module Players.Utils exposing (..)

attack : Int -> Int -> Int
attack power enemy_hp =
  enemy_hp - power
