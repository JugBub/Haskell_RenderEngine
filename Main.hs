module Main where

import Graphics.UI.GLUT

myPoints :: [(GLfloat,GLfloat,GLfloat)]
myPoints = [(1,1,0), (1,0,0), (0,1,0)] -- [ (sin (2*pi*k/12), cos (2*pi*k/12), 0) | k <- [1..12] ]

main :: IO ()
main = do
  (_progName, _args) <- getArgsAndInitialize
  _window <- createWindow "Hello World"
  displayCallback $= display
  mainLoop

display :: DisplayCallback
display = do 
  clear [ColorBuffer]
  renderPrimitive Polygon $
     mapM_ (\(x, y, z) -> vertex $ Vertex3 x y z) myPoints
  flush