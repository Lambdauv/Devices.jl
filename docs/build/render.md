
<a id='Rendering-1'></a>

## Rendering

<a id='Devices.render!' href='#Devices.render!'>#</a>
**`Devices.render!`** &mdash; *Function*.



```
render!(c::Cell, r::Rectangle, ::Rectangles.Plain; kwargs...)
```

Render a rectangle `r` to cell `c` with plain styling.

Returns an array with the rectangle in it.


```
render!(c::Cell, r::Rectangle, s::Rectangles.Rounded; kwargs...)
```

Render a rounded rectangle `r` to cell `c`. This is accomplished by rendering a path around the outside of a (smaller than requested) solid rectangle. The bounding box of `r` is preserved.

Returns an array of the AbstractPolygons added to the cell.


```
render!(c::Cell, r::Rectangle, s::Rectangles.Undercut;
    layer=0, uclayer=0, kwargs...)
```

Render a rectangle `r` to cell `c`. Additionally, put a hollow border around the rectangle with layer `uclayer`. Useful for undercut structures.

Returns an array of the AbstractPolygons added to the cell.


```
render!(c::Cell, r::Rectangle, s::Rectangles.Style=Rectangles.Plain(); kwargs...)
```

Render a rectangle `r` to cell `c`, defaulting to plain styling.

Returns an array of the AbstractPolygons added to the cell.


```
render!(c::Cell, r::Polygon, s::Polygons.Style=Polygons.Plain(); kwargs...)
```

Render a polygon `r` to cell `c`, defaulting to plain styling.

Returns an array of the polygons added to the cell.


```
render!(c::Cell, p::Path; kwargs...)
```

Render a path `p` to a cell `c`.

Returns an array of the polygons added to the cell.


```
render!(c::Cell, segment::Paths.Segment, s::Paths.DecoratedStyle; kwargs...)
```

Render a `segment` with decorated style `s` to cell `c`. This method draws the decorations before the path itself is drawn.


```
render!(c::Cell, segment::Paths.Segment, s::Paths.Style; kwargs...)
```

Render a `segment` with style `s` to cell `c`.
