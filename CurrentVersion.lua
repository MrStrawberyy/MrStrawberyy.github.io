local LastestVersion = 1.3

function TestVersion(Version)
   if Version ~= LastestVersion then
       game.StarterGui:SetCore("SendNotification", {
          Title = "Version: "..CurrentVersion;
          Text = "You are Running the Newest Version of Bestieee!";
          Duration = 5
       })
   end
end
