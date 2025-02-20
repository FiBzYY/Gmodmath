# Garry's Mod Math Functions Plus

MathPlus - Advanced Vector & Math Utilities for Garry's Mod
MathPlus is a powerful math utility library designed to simplify vector and angle calculations in Garry's Mod Lua. With optimized functions and an easy to-use api, it's perfect for both performance critical calculations

Features:
Vector operations: Add, Subtract, Scale, Multiply, Divide, Dot, and Cross Product
Vector normalization with SSE-like fallback
Angle-to-Vector conversions (AngleVectors)
Utility functions like cloning, comparing, and generating random vectors
Performance-friendly with minimal overhead

Installation :
Download or clone this repository:

git clone https://github.com/FiBzY/MathPlus.git
Place the folder into your GMod addons directory:

garrysmod/addons/mathplus
Ensure the script is located in the autorun directory for auto-loading:
garrysmod/addons/mathplus/lua/autorun/mathutils.lua
The library will automatically load when you start the game.

Usage:
Importing the Library
local MathUtils = MathUtils

Examples:
Vector Length
local vec = {3, 4, 5}
print("Length of vector:", MathUtils.GetVectorLength(vec))  -- Output: 7.071

Dot Product
local vec1 = {1, 2, 3}
local vec2 = {4, 5, 6}
print("Dot product:", MathUtils.DotProduct(vec1, vec2))  -- Output: 32
Vector Add

local result = {}
MathUtils.VectorAdd({1, 2, 3}, {4, 5, 6}, result)
print("Result of addition:", unpack(result))  -- Output: 5, 7, 9
Vector Normalization

local vec = {3, 4, 5}
local length = MathUtils.VectorNormalize(vec)
print("Normalized vector:", unpack(vec))       -- Output: 0.424, 0.565, 0.707
print("Original length:", length)              -- Output: 7.071

Cross Product
local vec1 = {1, 0, 0}
local vec2 = {0, 1, 0}
local result = MathUtils.CrossProduct(vec1, vec2)
print("Cross product:", unpack(result))        -- Output: 0, 0, 1

-- API Reference --
Vector Functions
MathUtils.GetVectorLength(vec)
MathUtils.VectorClone(vec)
MathUtils.VectorScale(vec, scale)
MathUtils.DotProduct(vec1, vec2)
MathUtils.VectorMA(startVec, scale, dirVec, destVec)
MathUtils.VectorCopy(fromVec, toVec)
MathUtils.VectorToArray(vec)
MathUtils.VectorNormalize(vec)
MathUtils.VectorNormalizeFallback(vec)
MathUtils.VectorSubtract(a, b, result)
MathUtils.VectorAdd(a, b, result)
MathUtils.CrossProduct(a, b)
MathUtils.RandomVector(minVal, maxVal)
MathUtils.VectorMultiply(a, b, result)
MathUtils.VectorDivide(a, b, result)

Utility Functions
MathUtils.IsEqual(a, b)
MathUtils.CloseEnough(a, b, eps)
MathUtils.AngleVectors(angles, forward, right, up)

Error Handling
Division by zero in VectorDivide will throw an assertion error with a clear message:

assert(b[1] ~= 0, "Division by zero at x")

Contributing
Pull requests are welcome! For major changes, please open an issue first to discuss what you’d like to change.

License
This project is licensed under the MIT License. Feel free to use and modify it as you wish!

Credits
Created with passion by FiBzY
