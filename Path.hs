type Point=(Int,Double,Double)
type Route=(Point, Point)
type Stops=[Point]
type Path=([Route],[Stops])


lengthRoute::Route->Double
lengthRoute ((_,x1,y1),(_,x2,y2))=sqrt ((x1 - x2)**2 + (y1 - y2)**2)


lengthPath::Path->Double
lengthPath (l,_)= sum (map lengthRoute l) 


shortestPath::[Path]->Path
shortestPath l=head (filter(\x->lengthPath x==minimum (map lengthPath l)) l) 


id::Route->(Int, Int)
id ((x,_,_),(y,_,_))=(x,y)

idShortestPath::[Path]->[Int]
idShortestPath l= fst shortestPath l
          




path=[([((1,1,1),(2,2,2)),((3,3,3),(4,4,4)),((5,5,5),(6,6,6))],[]),([((1,1,1),(2,2,2)),((3,3,3),(4,4,4)),((5,5,5),(6,6,6))],[]),([((1,1,1),(2,2,2)),((3,3,3),(4,4,4)),((5,5,5),(6,6,6))],[])]
l= shortestPath path

 





