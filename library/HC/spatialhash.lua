---@meta

-- TODO: add docs

---@class HC.Spatialhash: HC._Spatialhash<HC.Shape>

---@class HC._Spatialhash<T>
---@overload fun(cell_size: number?): HC._Spatialhash<T>
local Spatialhash = {}

---@param x number
---@param y number
---@return number cell_x, number cell_y
function Spatialhash:cellCoords(x, y) end

---@generic T
---@param self HC._Spatialhash<T>
---@param i integer
---@param k integer
---@return {[T]: T}
function Spatialhash:cell(i, k) end

---@generic T
---@param self HC._Spatialhash<T>
---@param x number
---@param y number
---@return {[T]: T}
function Spatialhash:cellAt(x, y) end

---@generic T
---@param self HC._Spatialhash<T>
---@return {[T]: T}
function Spatialhash:shapes() end

---@generic T
---@param self HC._Spatialhash<T>
---@param x1 number
---@param y1 number
---@param x2 number
---@param y2 number
---@return {[T]: T}
function Spatialhash:inSameCells(x1, y1, x2, y2) end

---@generic T
---@param self HC._Spatialhash<T>
---@param obj T
---@param x1 number
---@param y1 number
---@param x2 number
---@param y2 number
function Spatialhash:register(obj, x1, y1, x2, y2) end

---@generic T
---@overload fun(self: HC._Spatialhash<T>, obj: T)
---@overload fun(self: HC._Spatialhash<T>, obj: T, x1: number, y1: number)
---@overload fun(self: HC._Spatialhash<T>, obj: T, x1: number, y1: number, x2: number, y2: number)
---@param self HC._Spatialhash<T>
---@param obj T
---@param x1 number
---@param y1 number
---@param x2 number
---@param y2 number
function Spatialhash:remove(obj, x1, y1, x2, y2) end

---@generic T
---@param self HC._Spatialhash<T>
---@param obj T
---@param x1 number
---@param y1 number
---@param x2 number
---@param y2 number
---@param x3 number
---@param y3 number
---@param x4 number
---@param y4 number
function Spatialhash:update(obj, x1, y1, x2, y2, x3, y3, x4, y4) end

---@param draw_mode love.DrawMode
---@param show_empty? boolean
---@param print_key? boolean
function Spatialhash:draw(draw_mode, show_empty, print_key) end