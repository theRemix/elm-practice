-- elm-live is looking for this
-- |------------------v


module Main exposing (main)

import Html exposing (..)
import Html.Attributes exposing (..)
import String exposing (contains)


main =
    noSportoView model


model =
    { query = "tutorial"
    , results =
        [ { id = 1
          , name = "TheSeamau5/elm-checkerboardgrid-tutorial"
          , stars = 66
          }
        , { id = 2
          , name = "grzegorzbalcerek/elm-by-example"
          , stars = 41
          }
        , { id = 3
          , name = "sporto/elm-tutorial-app"
          , stars = 35
          }
        , { id = 4
          , name = "jvoigtlaender/Elm-Tutorium"
          , stars = 10
          }
        , { id = 5
          , name = "sporto/elm-tutorial-assets"
          , stars = 7
          }
        ]
    }


elmHubHeader =
    header []
        [ h1 [] [ text "ElmHub" ]
        , span [ class "tagline" ] [ text "Like GitHub, but for Elm things." ]
        ]


allRecordsView model =
    div [ class "content" ]
        [ elmHubHeader
        , ul [ class "results" ] (List.map viewSearchResult model.results)
        ]


viewSearchResult result =
    li []
        [ span [ class "star-count", id ("result-" ++ toString result.id) ] [ text (toString result.stars) ]
        , a [ href ("https://github.com/" ++ result.name), target "_blank" ]
            [ text result.name ]
        ]


onlyOddsView model =
    div [ class "content" ]
        [ elmHubHeader
        , ul [ class "results" ]
            (List.map
                viewSearchResult
                (List.filter
                    (\result -> result.id % 2 /= 0)
                    model.results
                )
            )
        ]


noSportoView model =
    div [ class "content" ]
        [ elmHubHeader
        , ul [ class "results" ]
            (List.map
                viewSearchResult
                (List.filter
                    (\result -> contains "sporto" result.name)
                    model.results
                )
            )
        ]
