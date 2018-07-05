module Main exposing (..)

import Html exposing (Html, button, div, text, program)
import Html.Events exposing(onClick)


-- Model


type alias Model =
    Int


init : ( Model, Cmd Msg )
init =
    ( 0, Cmd.none )


-- Message


type Msg
    = Increment Int


-- View


view : Model -> Html Msg
view model = 
    div []
        [ button [ onClick (Increment 2)] [text "+"]
        , text (toString model)
        ]


-- update


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Increment n -> -- case 文ではパターンマッチが使える
            ( model + n, Cmd.none)

-- subscription


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none


-- main


main =
    -- Html.program が唯一状態を保持しており、受け取ったレコードを使ってアプリケーションをオーケストレーションしている
    program
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }
    -- view がユーザのアクション等によって Msg を投げ
    -- update 関数が走り
    -- update された Model を使って view を実行することで画面が更新される
