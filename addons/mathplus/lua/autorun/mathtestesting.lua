-- Math functions testing --
local vec1 = {3, 4, 5}
local vec2 = {1, 2, 3}
local result = {}

print("input vectors:")
print("vec1:", unpack(vec1))
print("vec2:", unpack(vec2))
print("-----------------------------------")

-- GetVectorLength --
print("GetVectorLength(vec1)")
print("expected: ~7.071")
print("result: ", MathUtils.GetVectorLength(vec1))
print("-----------------------------------")

-- VectorClone --
print("VectorClone(vec1)")
print("expected: {1, 2, 5}")
print("result: ", unpack(MathUtils.VectorClone(Vector(1, 2, 5))))
print("-----------------------------------")

-- VectorScale --
print("VectorScale(vec1, 2)")
print("expected: {6, 8, 10}")
print("result: ", (MathUtils.VectorScale(vec1, 2)))
print("-----------------------------------")

-- DotProduct --
print("DotProduct(vec1, vec2)")
print("expected: 26")
print("result: ", MathUtils.DotProduct(vec1, vec2))
print("-----------------------------------")

-- AngleVectors  --
local forward, right, up = {}, {}, {}
MathUtils.AngleVectors(Angle(0, 90, 0), forward, right, up)
print("forward: Expected: {0, 1, 0}, Result:", unpack(forward))
print("right: Expected: {0, 0, -1}, Result:", unpack(right))
print("up: Expected: {1, 0, 0}, Result: ", unpack(up))

-- DotProductVector --
print("DotProductVector(Vector(1, 0, 0), Vector(0, 1, 0))")
print("expected: 0")
print("result: ", MathUtils.DotProductVector(Vector(1, 0, 0), Vector(0, 1, 0)))
print("-----------------------------------")

-- VectorMA --
print("VectorMA(vec1, 2, vec2, result)")
MathUtils.VectorMA(vec1, 2, vec2, result)
print("expected: {5, 8, 11}")
print("result: ", unpack(result))
print("-----------------------------------")

-- VectorCopy --
print("VectorCopy(vec1, result)")
MathUtils.VectorCopy(vec1, result)
print("expected: {3, 4, 5}")
print("result: ", unpack(result))
print("-----------------------------------")

-- VectorToArray --
print("VectorToArray(Vector(1, 2, 3))")
print("expected: {1, 2, 3}")
print("result: ", unpack(MathUtils.VectorToArray(Vector(1, 2, 3))))
print("-----------------------------------")

-- IsEqual --
print("IsEqual({1, 2, 3}, {1, 2, 3})")
print("expected: true")
print("result: ", MathUtils.IsEqual({1, 2, 3}, {1, 2, 3}))
print("-----------------------------------")

-- CloseEnough --
print("CloseEnough({1, 2, 3}, {1.0000001, 2, 3})")
print("expected: true")
print("result: ", MathUtils.CloseEnough({1, 2, 3}, {1.0000001, 2, 3}))
print("-----------------------------------")

-- RSqrt internal test --
print("RSqrt(25)")
print("expected: 0.2")
print("result: ", 1 / math.sqrt(25))
print("-----------------------------------")

-- VectorNormalize --
print("VectorNormalize(vec1)")
local vec3 = {3, 4, 5}
local length = MathUtils.VectorNormalize(vec3)
print("normalized vector expected: {0.424, 0.565, 0.707}")
print("result:  ", unpack(vec3))
print("original length expected: 7.071..")
print("result: ", length)
print("-----------------------------------")

-- VectorNormalizeFallback --
print("VectorNormalizeFallback(vec1)")
local vec4 = {3, 4, 5}
local lengthFallback = MathUtils.VectorNormalizeFallback(vec4)
print("normalized vector expected: {0.424, 0.565, 0.707}")
print("result: ", unpack(vec4))
print("original length expected: 7.071..")
print("result: ", lengthFallback)
print("-----------------------------------")

-- VectorSubtract --
print("VectorSubtract(vec1, vec2)")
local vec1 = {5, 7, 9}
local vec2 = {2, 3, 4}
local result = {}

MathUtils.VectorSubtract(vec1, vec2, result)
print("expected: {3, 4, 5}")
print("result: ", unpack(result))
print("-----------------------------------")

-- VectorAdd --
print("VectorAdd(vec1, vec2)")
local vec1 = {1, 2, 3}
local vec2 = {4, 5, 6}
local result = {}

MathUtils.VectorAdd(vec1, vec2, result)
print("expected: {5, 7, 9}")
print("result: ", unpack(result))
print("-----------------------------------")

-- CrossProduct --
print("CrossProduct(vec1, vec2)")
local vec1 = {1, 0, 0}
local vec2 = {0, 1, 0}

local result = MathUtils.CrossProduct(vec1, vec2)
print("expected: {0, 0, 1}")
print("result: ", unpack(result))
print("-----------------------------------")

-- RandomVector --
print("RandomVector(-5, 5)")
local result = MathUtils.RandomVector(-5, 5)
print("result: ", unpack(result))
print("-----------------------------------")

-- VectorMultiply --
print("VectorMultiply(vec1, vec2)")
local vec1 = {2, 3, 4}
local vec2 = {1, 2, 3}
local result = {}
MathUtils.VectorMultiply(vec1, vec2, result)
print("expected: {2, 6, 12}")
print("result: ", unpack(result))
print("-----------------------------------")

-- VectorDivide --
print("VectorDivide(vec1, vec2)")
local vec1 = {6, 8, 10}
local vec2 = {2, 4, 5}
local result = {}
MathUtils.VectorDivide(vec1, vec2, result)
print("expected: {3, 2, 2}")
print("result: ", unpack(result))
print("-----------------------------------")

-- division by Zero error test --
local vecZero = {0, 0, 0}
-- MathUtils.VectorDivide(vec1, vecZero, result) 