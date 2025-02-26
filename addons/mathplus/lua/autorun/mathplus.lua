--------------------------------------------------------------------
--  MathUtils -- Math utilities by FiBzY						  --
--  this file adds useful math functions for vectors and angles   --
--------------------------------------------------------------------

MathUtils = {}
FLT_EPSILON = 1.192092896e-07

function MathUtils.GetVectorLength(v)
    return math.sqrt(v[1] * v[1] + v[2] * v[2] + v[3] * v[3])
end

function MathUtils.VectorClone(vec)
    return vec[1], vec[2], vec[3]
end

function MathUtils.VectorScale(vec, scale)
    return vec[1] * scale, vec[2] * scale, vec[3] * scale
end

function MathUtils.DotProduct(vec1, vec2)
    return vec1[1] * vec2[1] + vec1[2] * vec2[2] + vec1[3] * vec2[3]
end

function MathUtils.AngleVectors(angles, forward, right, up)
    local angle
    local sr, sp, sy, cr, cp, cy

    angle = angles.y * (math.pi * 2 / 360)
    sy = math.sin(angle)
    cy = math.cos(angle)

    angle = angles.p * (math.pi * 2 / 360)
    sp = math.sin(angle)
    cp = math.cos(angle)

    angle = angles.r * (math.pi * 2 / 360)
    sr = math.sin(angle)
    cr = math.cos(angle)

    if forward then
        forward.x = cp * cy
        forward.y = cp * sy
        forward.z = -sp
    end

    if right then
        right.x = (-1 * sr * sp * cy) + (-1 * cr * -sy)
        right.y = (-1 * sr * sp * sy) + (-1 * cr * cy)
        right.z = -1 * sr * cp
    end

    if up then
        up.x = (cr * sp * cy) + (-sr * -sy)
        up.y = (cr * sp * sy) + (-sr * cy)
        up.z = cr * cp
    end
end

function MathUtils.DotProductVector(vec1, vec2)
    return vec1:Dot(vec2)
end

function MathUtils.VectorMA(startVec, scale, dirVec, destVec)
    destVec[1] = startVec[1] + dirVec[1] * scale
    destVec[2] = startVec[2] + dirVec[2] * scale
    destVec[3] = startVec[3] + dirVec[3] * scale
end

function MathUtils.VectorCopy(fromVec, toVec)
    toVec[1] = fromVec[1]
    toVec[2] = fromVec[2]
    toVec[3] = fromVec[3]
end

function MathUtils.VectorToArray(vec)
    return vec[1], vec[2], vec[3]
end

function MathUtils.IsEqual(a, b)
    return a[1] == b[1] and a[2] == b[2] and a[3] == b[3]
end

function MathUtils.CloseEnough(a, b, eps)
    eps = eps or FLT_EPSILON
    return math.abs(a[1] - b[1]) <= eps
        and math.abs(a[2] - b[2]) <= eps
        and math.abs(a[3] - b[3]) <= eps
end

local function RSqrt(a)
    return 1 / math.sqrt(a)  -- no sse so we do this
end

function MathUtils.VectorNormalize(vec)
    local sqrlen = vec[1] * vec[1] + vec[2] * vec[2] + vec[3] * vec[3] + FLT_EPSILON

    local invlen = RSqrt(sqrlen)

    vec[1] = vec[1] * invlen
    vec[2] = vec[2] * invlen
    vec[3] = vec[3] * invlen

    return sqrlen * invlen
end

function MathUtils.VectorNormalizeFallback(vec)
    local length = math.sqrt(vec[1] * vec[1] + vec[2] * vec[2] + vec[3] * vec[3])

    if length ~= 0.0 then
        vec[1] = vec[1] / length
        vec[2] = vec[2] / length
        vec[3] = vec[3] / length
    else
        vec[1], vec[2], vec[3] = 0, 0, 1
    end

    return length
end

function MathUtils.VectorSubtract(a, b, result)
    result[1] = a[1] - b[1]
    result[2] = a[2] - b[2]
    result[3] = a[3] - b[3]
end

function MathUtils.VectorAdd(a, b, result)
    result[1] = a[1] + b[1]
    result[2] = a[2] + b[2]
    result[3] = a[3] + b[3]
end

function MathUtils.CrossProduct(a, b)
    return a[2] * b[3] - a[3] * b[2],
           a[3] * b[1] - a[1] * b[3],
           a[1] * b[2] - a[2] * b[1]
end

function MathUtils.RandomVector(minVal, maxVal)
    return math.random() * (maxVal - minVal) + minVal,
        math.random() * (maxVal - minVal) + minVal,
        math.random() * (maxVal - minVal) + minVal
end

function MathUtils.VectorMultiply(a, b, result)
    result[1] = a[1] * b[1]
    result[2] = a[2] * b[2]
    result[3] = a[3] * b[3]
end

function MathUtils.VectorDivide(a, b, result)
    assert(b[1] ~= 0, "Division by zero at x")
    assert(b[2] ~= 0, "Division by zero at y")
    assert(b[3] ~= 0, "Division by zero at z")

    result[1] = a[1] / b[1]
    result[2] = a[2] / b[2]
    result[3] = a[3] / b[3]
end

-- New --
function MathUtils.IsVectorZero(vec)
    return vec[1] == 0 and vec[2] == 0 and vec[3] == 0
end

function MathUtils.SimpleSpline(value)
    return value * value * (3 - 2 * value)
end

function MathUtils.ClipVelocity(input, normal, out, overbounce)
    local blocked = 0x00
    local angle = normal[3]

    if angle > 0 then blocked = bit.bor(blocked, 0x01) end  -- 1 Floor
    if angle == 0 then blocked = bit.bor(blocked, 0x02) end -- 2 Wall Step

    local backoff = MathUtils.DotProduct(input, normal) * overbounce

    for i = 1, 3 do
        local change = normal[i] * backoff
        out[i] = input[i] - change
    end

    local adjust = MathUtils.DotProduct(out, normal)
    if adjust < 0.0 then
        for i = 1, 3 do
            out[i] = out[i] - normal[i] * adjust
        end
    end

    return blocked
end

print("MathUtils | Loaded successfully.")
return MathUtils
