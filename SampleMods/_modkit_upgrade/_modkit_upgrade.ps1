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
				Directory.CreateDirectory(dirPath.Replace(SourcePath, DestinationPath).Replace("\\", "/"));

        foreach (string newPath in Directory.GetFiles(SourcePath, "*.*",
            SearchOption.AllDirectories))
            File.Copy(newPath, newPath.Replace(SourcePath, DestinationPath).Replace("\\", "/"), true);
    }
	
    public static void UpgradePathes(string Path)
    {
        File.Copy("jsons/BuiltinGamePathes.json", Path + "/Assets/BuiltinGamePathes.json", true);
        File.Copy("jsons/BuiltinScenePathes.json", Path + "/Assets/BuiltinScenePathes.json", true);
    }
}
"@

Add-Type -TypeDefinition $source
[ProjectUpgrader]::UpgradePath("../0_Empty_Project")
[ProjectUpgrader]::UpgradePath("../1_Model_Swap")
[ProjectUpgrader]::UpgradePath("../2_New_Spell")
[Environment]::Exit(1)