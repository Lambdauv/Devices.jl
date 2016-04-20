
<a id='Devices.jl-1'></a>

# Devices.jl


A [Julia](http://julialang.org) package for designing CAD files for superconducting devices.


<a id='Installation-1'></a>

## Installation


  * Install [gdspy](http://gdspy.readthedocs.org), which is currently used as the backend for rendering GDS files and previewing them. Ensure that it is accessible from the Python installation that PyCall.jl is using.


  * `Pkg.clone("https://github.com/ajkeller34/Devices.jl.git")`


<a id='Quick-start-1'></a>

## Quick start


```
using Devices

p = Path()
style = launch!(p)
straight!(p,500,style)
turn!(p,π/2,150)
straight!(p,500)
launch!(p)
render(p)
view()
```
