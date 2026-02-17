url = {
    "https://raw.githubusercontent.com/KayzDev-VN/SETUP-BUILD-ACCOUNT-BLF/refs/heads/main/body/boostfps.lua",
    "https://raw.githubusercontent.com/KayzDev-VN/SETUP-BUILD-ACCOUNT-BLF/refs/heads/main/body/autochat.lua",
    "https://raw.githubusercontent.com/KayzDev-VN/SETUP-BUILD-ACCOUNT-BLF/refs/heads/main/body/nearplayer.lua",
    "https://raw.githubusercontent.com/KayzDev-VN/SETUP-BUILD-ACCOUNT-BLF/refs/heads/main/body/autorequestfriend.lua",
    "https://raw.githubusercontent.com/KayzDev-VN/SETUP-BUILD-ACCOUNT-BLF/refs/heads/main/body/ignoreadmin.lua"
}
for index, link in ipairs(url) do
    loadstring(game:HttpGet(link))()
end