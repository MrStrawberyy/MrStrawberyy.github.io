local LastestVersion = 1.3

function TestVersion(Version)
   if Version ~= LastestVersion then
       game.StarterGui:SetCore("SendNotification", {
          Title = "Version: "..Version;
          Text = "You are not running the Lastest Version of BestEEE";
          Duration = 5
       })
   end
end
