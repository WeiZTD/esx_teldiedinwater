local inWater = false

Citizen.CreateThread(
    function()
        while ESX == nil do
            TriggerEvent(
                "esx:getSharedObject",
                function(obj)
                    ESX = obj
                end
            )
            Citizen.Wait(0)
        end
    end
)

local coastsCoord={
{x=-1865.1162109375,y=4811.0795898438,z=2.8297996520996},
{x=-2498.2788085938,y=4187.958984375,z=2.4582040309906},
{x=-2884.44140625,y=3081.3269042969,z=2.7619037628174},
{x=-3270.2585449219,y=1263.0329589844,z=1.6268373727798},
{x=-3101.0124511719,y=560.42120361328,z=2.7980375289917},
{x=-2939.6225585938,y=-38.845600128174,z=2.3921431303024},
{x=-2011.7170410156,y=-668.18109130859,z=3.1716525554657},
{x=-1532.4324951172,y=-1310.5227050781,z=1.8918626308441},
{x=-1739.7098388672,y=-2537.4670410156,z=3.0862920284271},
{x=-1421.5546875,y=-3435.7314453125,z=2.9853143692017},
{x=1254.9515380859,y=-2725.3930664063,z=2.1499525308609},
{x=2313.7121582031,y=-2137.8962402344,z=1.7644766569138},
{x=2833.1721191406,y=-672.70495605469,z=1.7397125959396},
{x=3831.4118652344,y=4512.5795898438,z=2.3677036762238},
{x=1541.6358642578,y=6644.3764648438,z=2.3896576166153},
{x=-372.31665039063,y=6508.302734375,z=3.4416878223419},
{x=-2564.0556640625,y=3771.8852539063,z=2.4149557352066},
{x=-3279.27734375,y=1208.0378417969,z=1.9698642492294}}


AddEventHandler('esx:onPlayerDeath', function(data)
    if IsEntityInWater(GetPlayerPed(-1)) then
        local dis = 10000
        local tempdis
        local nearCoast
        for i,coasts in ipairs(coastsCoord) do
            tempdis = GetDistanceBetweenCoords(coasts["x"],coasts["y"],coasts["z"],GetEntityCoords(GetPlayerPed(-1)), true)
            if tempdis < dis then
            nearCoast=coasts
            dis=tempdis
            end
        end
        ESX.Game.Teleport(GetPlayerPed(-1),nearCoast)
        ESX.ShowNotification("你被海浪沖到最近的岸邊")
    end
end)



