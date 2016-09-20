"""
```
type Turn{T} <: Segment{T}
    α::typeof(1.0°)
    r::T
    p0::Point{T}
    α0::typeof(1.0°)
    f::Function
    Turn(α, r, p0, α0) = begin
        s = new(α, r, p0, α0)
        s.f = t->begin
            cen = s.p0 + Point(s.r*cos(s.α0+sign(s.α)*π/2), s.r*sin(s.α0+sign(s.α)*π/2))
            cen + Point(s.r*cos(s.α0-sign(α)*π/2+s.α*t), s.r*sin(s.α0-sign(α)*π/2+s.α*t))
        end
        s
    end
end
```

A circular turn is parameterized by the turn angle `α` and turning radius `r`.
It begins at a point `p0` with initial angle `α0`.

The center of the circle is given by:

`cen = p0 + Point(r*cos(α0+sign(α)*π/2), r*sin(α0+sign(α)*π/2))`

The parametric function over `t ∈ [0,1]` describing the turn is given by:

`t -> cen + Point(r*cos(α0-sign(α)*π/2+α*t), r*sin(α0-sign(α)*π/2+α*t))`
"""
type Turn{T} <: Segment{T}
    α::typeof(1.0°)
    r::T
    p0::Point{T}
    α0::typeof(1.0°)
    f::Function

    Turn(α, r, p0, α0) = begin
        s = new(α, r, p0, α0)
        s.f = t->begin
            cen = s.p0 + Point(s.r*cos(s.α0+sign(s.α)*π/2), s.r*sin(s.α0+sign(s.α)*π/2))
            cen + Point(s.r*cos(s.α0-sign(α)*π/2+s.α*t), s.r*sin(s.α0-sign(α)*π/2+s.α*t))
        end
        s
    end
end

"""
```
Turn{T<:Coordinate}(α, r::T, p0::Point{T}=Point(0.0,0.0), α0=0.0°)
```

Outer constructor for `Turn` segments.
"""
Turn{T<:Coordinate}(α, r::T, p0::Point{T}=Point(zero(T),zero(T)), α0=0.0°) =
    Turn{T}(α, r, p0, α0)
convert{T}(::Type{Turn{T}}, x::Turn) =
    Turn(x.α, T(x.r), convert(Point{T}, x.p0), x.α0)
copy(s::Turn) = Turn(s.α,s.r,s.p0,s.α0)

pathlength{T}(s::Turn{T}) = T(abs(s.r*s.α))
p0(s::Turn) = s.p0
α0(s::Turn) = s.α0
summary(s::Turn) = "Turn by $(s.α) with radius $(s.r)"

"""
```
setp0!(s::Turn, p::Point)
```

Set the p0 of a turn.
"""
setp0!(s::Turn, p::Point) = s.p0 = p

"""
```
setα0!(s::Turn, α0′)
```

Set the starting angle of a turn.
"""
setα0!(s::Turn, α0′) = s.α0 = α0′

α1(s::Turn) = s.α0 + s.α
