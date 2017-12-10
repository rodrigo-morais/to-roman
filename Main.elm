import Html exposing (text)

-- COMBINATIONS
combinations = [ (1000, "M")
          , (900, "CM")
          , (500, "D")
          , (400, "CD")
          , (100, "C")
          , (90, "XC")
          , (50, "L")
          , (40, "XL")
          , (10, "X")
          , (9, "IX")
          , (5, "V")
          , (4, "IV")
          , (1, "I")
          ]

-- FUNCTION
toRoman : Int -> List (Int, String) -> String
toRoman arabic combinations =
  let
    times x =
      arabic // x
  in
    case combinations of
      (num, sym) :: tail -> String.repeat (times num) sym ++ toRoman (arabic - num * (times num)) tail
      _ -> ""

-- MAIN
arabics = [2119, 539, 4949, 3221, 1, 2, 4, 9, 90, 123]
main =
  List.map (\arabic -> "(" ++ toString arabic ++ ", " ++ (toRoman arabic combinations) ++ ")" ++ ", ") arabics
  |> String.concat
  |> text
