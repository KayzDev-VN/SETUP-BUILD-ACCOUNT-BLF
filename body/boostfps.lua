local Lighting = game:GetService("Lighting")
local Terrain = workspace:FindFirstChildOfClass("Terrain")
if Terrain then
    Terrain.WaterWaveSize = 0
    Terrain.WaterWaveSpeed = 0
    Terrain.WaterReflectance = 0
    Terrain.WaterTransparency = 0
end
Lighting.GlobalShadows = false
Lighting.FogEnd = 9e9
Lighting.Brightness = 1
settings().Rendering.QualityLevel = Enum.QualityLevel.Level01 -- Forces low quality
for _, effect in ipairs(Lighting:GetChildren()) do
    if effect:IsA("PostEffect") or effect:IsA("BloomEffect") or effect:IsA("BlurEffect") or effect:IsA("SunRaysEffect") then
        effect.Enabled = false
    end
end
local function Optimize(obj)
    -- Disable heavy emitters
    if obj:IsA("ParticleEmitter") or obj:IsA("Trail") or obj:IsA("Smoke") or obj:IsA("Fire") or obj:IsA("Sparkles") then
        obj.Enabled = false
    -- Simplify Geometry
    elseif obj:IsA("BasePart") then
        obj.Material = Enum.Material.SmoothPlastic
        obj.Reflectance = 0
        obj.CastShadow = false
        -- Optional: obj.CollisionGroup = "Debris" (To save physics)
    -- Remove Textures
    elseif obj:IsA("Decal") or obj:IsA("Texture") then
        obj.Transparency = 1 -- Safer than Destroy() for some game systems
    end
end

for _, child in ipairs(workspace:GetDescendants()) do
    Optimize(child)
end

workspace.DescendantAdded:Connect(Optimize)
