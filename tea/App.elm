module App exposing (..)

import Html exposing (Html, div, text, program)


-- MODEL


type alias Model =
    String


-- アプリケーションの初期値を設定する
init : ( Model, Cmd Msg ) -- ( 初期値, 最初に実行するコマンド)
init =
    ( "Hello", Cmd.none )


-- MESSAGES


-- アプリケーションの応答を表す
type Msg
    = NoOp -- 今回は何もしないので NoOp


-- VIEW


-- view 関数は html 要素のレンダリングを行う関数
view : Model -> Html Msg
view model =
    div []
        [ text model ]


-- UPDATE


-- メッセージを受信するたびに呼び出される関数
-- 更新後の model と cmd を返す
update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        NoOp -> -- NoOp メッセージを受信したときに実行される
            ( model, Cmd.none )


-- SUBSCRIPTIONS


-- 外部入力を監視する
subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none


-- MAIN


main : Program Never Model Msg
main =
    program
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }
