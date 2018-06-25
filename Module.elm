module Module exposing (..)

import Players.Utils exposing (attack, Player, Enemy, PlayerStatus, EnemyStatus)
import Html exposing (text)

main =
  attack (Player "p1" 10 20 Players.Utils.Active) (Enemy "e1" 100 5 Players.Utils.Active)
    |> toString
    |> text
