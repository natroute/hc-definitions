---@meta

---
---Base class for all shapes.
---
---@class HC.Shape
local Shape = {}

---
---Move the shape _by_ a distance.
---
---@see HC.Shape.moveTo
---
---@param dx number
---@param dy number
function Shape:move(dx, dy) end

---
---Move the shape to a point.
---
---Most shapes will be _centered_ on the point `(x, y)`.
---
---@see HC.Shape.move
---
---@param x number
---@param y number
function Shape:moveTo(x, y) end

---
---Get the shape's center.
---@return number x, number y The center of the shape.
function Shape:center() end

---
---Rotate the shape _by_ an angle.
---
---A rotation center can be specified. If no center is given, rotate around the center of the shape.
---
---@see HC.Shape.setRotation
---
---@overload fun(angle: number)
---@overload fun(angle: number, cx: number, cy: number)
---@param angle number Angle to rotate by in radians.
---@param cx number The rotation center (x-axis).
---@param cy number The rotation center (y-axis).
function Shape:rotate(angle, cx, cy) end

---
---Set the rotation of the shape.
---
---A rotation center can be specified. If no center is given, rotate around the center of the shape.
---
---Equivalent to `shape:rotate(angle - shape:rotation(), cx, cy)`.
---
---@see HC.Shape.rotate
---
---@overload fun(angle: number)
---@overload fun(angle: number, cx: number, cy: number)
---@param angle number New rotation in radians.
---@param cx number The rotation center (x-axis).
---@param cy number The rotation center (y-axis).
function Shape:setRotation(angle, cx, cy) end

---
---Get the rotation of the shape.
---
---@return number -- The rotation of the shape in radians.
function Shape:rotation() end

---
---Scale the shape relative to its center.
---
---**Note:** There is no way to query the scale of a shape.
---
---@param s number Scale factor; must be > 0.
function Shape:scale(s) end

---
---Get the parameters of the circle that fully encloses the shape.
---
---@return number x, number y, number r
function Shape:outcircle() end

---
---Get the axis aligned bounding box of the shape.
---
---@return number x1, number y1, number x2, number y2 The bounding box. `x1` and `y1` define the upper left corner, while `x2` and `y2` define the lower right corner.
function Shape:bbox() end

---
---Draw the shape. Mostly for debugging purposes.
---
---@param mode? love.DrawMode How to draw the shape (default: `'line'`).
function Shape:draw(mode) end

---
---Get furthest vertex of the shape with respect to a direction.
---
---@param dx number The direction (x-axis).
---@param dy number The direction (y-axis).
---@return number x, number y -- The furthest vertex in the direction.
function Shape:support(dx, dy) end

---
---Test if two shapes collide.
---
---The separating vector `dx, dy` will only be returned if `collides` is true. If returned, the separating vector will point in the direction of `other`, i.e. `dx, dy` is the direction and magnitude to move `other` so that the shapes do not collide anymore.
---
---@param other HC.Shape
---@return boolean collides Whether or not the shapes collide.
---@return number? dx, number? dy The separating vector, if the shapes collide.
function Shape:collidesWith(other) end

---
---Test if a point lies within the interior of the shape.
---
---@param x number The position of the point (x-axis).
---@param y number The position of the point (y-axis).
---@return boolean
function Shape:contains(x, y) end

---
---Test if the shape intersects the given ray.
---
---The ray parameters of the intersections are returned as a table. The points of intersection can be computed as `(x, y) + ray_parameter * (dx, dy)`.
---
---@param x number The starting point of the ray (x-axis).
---@param y number The starting point of the ray (y-axis).
---@param dx number The direction of the ray (x-axis).
---@param dy number The direction of the ray (y-axis).
---@return number[] -- The ray parameters.
function Shape:intersectionsWithRay(x, y, dx, dy) end

---
---Test if the shape intersects the given ray.
---
---If the shape intersects the ray, the point of intersection can be computed as `(x, y) + ray_parameter * (dx, dy)`.
---
---@param x number The starting point of the ray (x-axis).
---@param y number The starting point of the ray (y-axis).
---@param dx number The direction of the ray (x-axis).
---@param dy number The direction of the ray (y-axis).
---@return boolean intersects Whether or not the shape intersects the ray.
---@return number? rayParameter The ray parameter, if the shape intersects the ray.
function Shape:intersectsRay(x, y, dx, dy) end

---@class HC.ConvexPolygonShape: HC.Shape
---@field _type 'polygon'
local ConvexPolygonShape = {}

---@class HC.ConcavePolygonShape: HC.Shape
---@field _type 'compound'
local ConcavePolygonShape = {}

---
---Draw the shape. Mostly for debugging purposes.
---
---@param mode? love.DrawMode How to draw the shape (default: `'line'`).
---@param wireframe? boolean If `true`, draw the convex polygons that make up the shape individually.
function ConcavePolygonShape:draw(mode, wireframe) end

---@alias HC.PolygonShape HC.ConvexPolygonShape | HC.ConcavePolygonShape

---@class HC.CircleShape: HC.Shape
---@field _type 'circle'
local CircleShape = {}

---
---Draw the shape. Mostly for debugging purposes.
---
---@param mode? love.DrawMode How to draw the shape (default: `'line'`).
---@param segments? number The number of segments to draw the circle with.
function CircleShape:draw(mode, segments) end

---@class HC.PointShape: HC.Shape
---@field _type 'point'
local PointShape = {}

---
---Shape classes with collision detection methods.
---
---This module defines methods to move, rotate and draw shapes created with the main module.
---
---As each shape is at its core a Lua table, you can attach values and add functions to it. Be careful not to use keys that name a function or start with an underscore, e.g. `move` or `_rotation`, since these are used internally. Everything else is fine.
---
---If you don't want to use the full blown module, you can still use these classes to test for colliding shapes. This may be useful for scenes where the shapes don’t move very much and only few collisions are of interest - for example graphical user interfaces.
---
---@class HC.shapes
local module = {
    ConcavePolygonShape = ConcavePolygonShape,
	ConvexPolygonShape = ConvexPolygonShape,
	CircleShape = CircleShape,
	PointShape = PointShape,
}

---
---Create a [`PolygonShape`](lua://HC.PolygonShape) without adding it to a scene.
---
---@see HC.polygon
---@param ... number The vertices of the polygon.
---@return HC.PolygonShape
---@nodiscard
function module.newPolygonShape(...) end

---
---Create a [`CircleShape`](lua://HC.CircleShape) without adding it to a scene.
---
---@param cx number
---@param cy number
---@param radius number
---@return HC.CircleShape
---@nodiscard
function module.newCircleShape(cx, cy, radius) end

---
---Create a [`PointShape`](lua://HC.PointShape) without adding it to a scene.
---
---@param cx number
---@param cy number
---@param radius number
---@return HC.CircleShape
---@nodiscard
function module.newCircleShape(cx, cy, radius) end

return module