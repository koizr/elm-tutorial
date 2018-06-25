module Players.Utils exposing (..)

attack : Player -> Enemy -> Int
attack player enemy =
  -- record.property という構文で値を取得できる
  -- `.hp enemy` と `enemy.hp` は同じ
  enemy.hp - (player.power - enemy.defence)

-- Record という構造体みたいなものを定義できる
type alias Player =
  { name : String
  , hp : Int
  , power : Int
  , status : PlayerStatus
  }

type alias Enemy =
  { name : String
  , hp : Int
  , defence : Int
  , status : EnemyStatus
  }

-- 型エイリアス
type alias DeadTime = Int
-- Union Type
-- データ構築子とその引数を定義できる
type PlayerStatus = Active | Inactive | Dead DeadTime
type alias EnemyStatus = PlayerStatus
