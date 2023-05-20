import Prelude (last)
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


first (x,_,_)=x
last(_,_,z)=z



idShortestPath::[Path]->[(Int,Int)]
idShortestPath l= map rid (fst (shortestPath l))

enumerateAllStops::Path->Stops
enumerateAllStops path=snd path

filterPathsWithStops::[Path]->[Path]
filterPathsWithStops l=filter (\p -> length (enumerateAllStops p)>0) l



theShortestPathWithStops::[Path]->Path
theShortestPathWithStops paths= shortestPath (filterPathsWithStops paths)


          
path :: [Route]
path = [((0 ,0.5 ,10.2), (1 ,10.1 ,10.5)), ((1 ,10.1, 10.5),(2, 10.5 ,20.3)) ,((2 ,10.5 ,20.3),(0, 0.5 ,10.2))]


getRouteStartWith::Point'->[Route]->[Route]
getRouteStartWith start routes=filter(\r->(fst r)==start) routes
p=(0 ,0.5 ,10.2)
l=getRoutStartWith p path




-- findAllPossiblePaths :: Point' -> Point' -> [Route] -> [Path]
-- findAllPossiblePaths start end routes = bfs [([r], []) | 
-- r <- getRouteStartWith start routes]











