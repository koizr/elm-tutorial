module Main exposing (..)

import Html exposing (Html, div, program)
import Widget


-- Model


type alias AppModel =
    { widgetModel : Widget.Model }


initialModel : AppModel
initialModel =
    { widgetModel = Widget.initialModel }


init : ( AppModel, Cmd Msg )
init =
    ( initialModel, Cmd.none )


-- Message


type Msg
    = WidgetMsg Widget.Msg


-- View


view : AppModel -> Html Msg
view model = 
    div []
        [ Html.map WidgetMsg (Widget.view model.widgetModel)
        ]


-- update


update : Msg -> AppModel -> ( AppModel, Cmd Msg )
update msg model =
    case msg of
        WidgetMsg subMsg ->
            let
                ( updateWidgetModel, widgetCmd ) =
                    Widget.update subMsg model.widgetModel
            in
                ( { model | widgetModel = updateWidgetModel }, Cmd.map WidgetMsg widgetCmd )

-- subscription


subscriptions : AppModel -> Sub Msg
subscriptions model =
    Sub.none


-- main


main : Program Never AppModel Msg
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
