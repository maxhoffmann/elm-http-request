module Main (..) where

import StartApp
import Task
import Effects exposing (Effects, Never)
import Html exposing (Html)
import App exposing (init, update, view, Model)


--- SETUP


app : StartApp.App Model
app =
  StartApp.start
    { init = init
    , view = view
    , update = update
    , inputs = []
    }


main : Signal Html
main =
  app.html



--- PORTS


port tasks : Signal (Task.Task Never ())
port tasks =
  app.tasks
