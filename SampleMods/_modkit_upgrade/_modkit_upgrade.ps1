$source = @"
using System;
using System.IO;

public static class ProjectUpgrader
{
    public static void UpgradePath(string Path)
    {
        UpgradeScripts(Path);
        UpgradeDatabank(Path);
        UpgradeDocumentation(Path);
        UpgradePathes(Path);
    }

    public static void UpgradeScripts(string Path)
    {
        File.Copy("plugins/EOEModsToolkitd.dll", Path + "/Assets/Plugins/EOEModsToolkitd.dll", true);
    }

    public static void UpgradeDatabank(string Path)
    {

    }

    public static void UpgradeDocumentation(string Path)
    {
        var SourcePath = "documentation";
        var DestinationPath = Path + "/Assets/ModToolkitDocumentation";

        foreach (string dirPath in Directory.GetDirectories(SourcePath, "*",
            SearchOption.AllDirectories))
			{
				try{
					Directory.CreateDirectory(dirPath.Replace(SourcePath, DestinationPath).Replace("\\", "/"));
				}catch(System.Exception){}
			}

        foreach (string newPath in Directory.GetFiles(SourcePath, "*.*",
            SearchOption.AllDirectories))
			{
				try{
					File.Copy(newPath, newPath.Replace(SourcePath, DestinationPath).Replace("\\", "/"), true);
				}catch(System.Exception){}
			}
    }
	
    public static void UpgradePathes(string Path)
    {
        File.Copy("jsons/BuiltinGamePathes.json", Path + "/Assets/BuiltinGamePathes.json", true);
        File.Copy("jsons/BuiltinScenePathes.json", Path + "/Assets/BuiltinScenePathes.json", true);
		File.Copy("jsons/BuiltinGraphs.json", Path + "/Assets/BuiltinGraphs.json", true);
		File.Copy("jsons/BuiltinDatabases.json", Path + "/Assets/BuiltinDatabases.json", true);
    }
}
"@

Add-Type -TypeDefinition $source
[ProjectUpgrader]::UpgradePath("../0_Empty_Project")
[ProjectUpgrader]::UpgradePath("../1_Model_Swap")
[ProjectUpgrader]::UpgradePath("../2_New_Spell")
[ProjectUpgrader]::UpgradePath("../3_New_Item")
[ProjectUpgrader]::UpgradePath("../4_New_Quest_And_Npc")
[ProjectUpgrader]::UpgradePath("../5_New_Dungeon")
[ProjectUpgrader]::UpgradePath("../7_New_Playable_Character")
[ProjectUpgrader]::UpgradePath("../8_Scripting_Aura_And_AI")
[Environment]::Exit(1)