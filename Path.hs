type Point'=(Int,Double,Double)
type Route=(Point', Point')
type Stops=[Point']
type Path=([Route],Stops)


lengthRoute::Route->Double
lengthRoute ((_,x1,y1),(_,x2,y2))=sqrt ((x1 - x2)**2 + (y1 - y2)**2)


lengthPath::Path->Double
lengthPath (l,_)= sum (map lengthRoute l) 


shortestPath::[Path]->Path
shortestPath l=head (filter(\x->lengthPath x==minimum (map lengthPath l)) l) 


rid::Route->(Int, Int)
rid ((x,_,_),(y,_,_))=(x,y)

idShortestPath::[Path]->[(Int,Int)]
idShortestPath l= map rid (fst (shortestPath l))

enumerateAllStops::Path->Stops
enumerateAllStops path=snd path

filterPathsWithStops::[Path]->[Path]
filterPathsWithStops l=filter (\p -> length (enumerateAllStops p)>0) l

          
path :: [Path]
path = [([((1, 1.0, 1.0), (2, 2.0, 2.0)), ((3, 3.0, 3.0), (4, 4.0, 4.0)), ((5, 5.0, 5.0), (6, 6.0, 6.0))], []),
        ([((1, 1.0, 1.0), (2, 2.0, 2.0)), ((3, 3.0, 3.0), (4, 4.0, 4.0)), ((5, 5.0, 5.0), (6, 6.0, 6.0))], [(1, 2.0, 2.0)])]

l= filterPathsWithStops path
v=idShortestPath l








