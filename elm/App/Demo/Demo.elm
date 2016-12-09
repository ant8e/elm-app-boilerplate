module App.Demo.Demo exposing
  ( init, update, urlUpdate, view, subscriptions
  , Model, Msg
  )

{-| The main demo component. Handles the demo section routing.
-}

import Html exposing (text, Html)
import App.Demo.DemoRoute exposing (Route(..))

type Model = Model
  { routeModel: Route
  }

type Msg =
  Noop

init : Route -> (Model, Cmd Msg)
init route =
  ( Model
      { routeModel = route
      }
  , Cmd.none
  )

update : Msg -> Model -> (Model, Cmd Msg)
update msg (Model model) =
  ( Model model, Cmd.none )

urlUpdate : Route -> Model -> (Model, Cmd Msg)
urlUpdate route (Model model) =
  ( Model { model | routeModel = route }
  , Cmd.none
  )

view : Model -> Html Msg
view (Model model) =
  text <| "Demo: " ++ case model.routeModel of
    DemoRoute ->
      "Main Page"
    AccordionDemoRoute ->
      "Accordion Page"
    CheckboxDemoRoute ->
      "Checkbox Page"
    OtherDemoRoute ->
      "Other Demo Page"

subscriptions : Model -> Sub Msg
subscriptions (Model model) =
  Sub.none
