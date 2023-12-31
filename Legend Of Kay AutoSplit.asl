// AutoSplitter created by MashSRL
// For questions or bug reports, send me a message on Discord @MashSRL
// With love to GlitchesAndStuff, Muffin42 and Epicdudeguy who helped shape this Speedrun&Community in it's early days
state("legendofkay")
{
    int levelValue: 0x485A30, 0x24, 0x538;
    int cutsceneValue: 0x44EC50;
    int gameState: 0x4401F8;
    int loadState: 0x457D24;
    int location: 0x485A34, 0xCC, 0x88, 0x384, 0x64, 0x2AC, 0x718, 0x24;
}

startup
{
    settings.Add("load_remover", true, "Load Remover");
    settings.SetToolTip("load_remover", "Pauses the timer during loading screens. Make sure to compare against ''Game Time'' when using this setting.");
    settings.Add("split_settings", true, "Split Settings");
    settings.CurrentDefaultParent = "split_settings";
    settings.Add("croc_entry", false, "Split on Crocodile Temple entry");
    settings.SetToolTip("croc_entry", "Splits upon entering Crocodile Temple");
    settings.Add("croc_exit", false, "Split on Crocodile Temple exit");
    settings.SetToolTip("croc_exit", "Splits upon exiting Crocodile Temple");
    settings.Add("turtle_entry", false, "Split on Turtle Fort entry");
    settings.SetToolTip("turtle_entry", "Splits upon entering Turtle Fort");
    settings.Add("turtle_exit", false, "Split on Turtle Fort exit");
    settings.SetToolTip("turtle_exit", "Splits upon exiting Turtle Fort");
}

start
{
    if(current.gameState == 10009 && current.cutsceneValue < old.cutsceneValue){
        return true;
    }
}

split
{
    if (current.levelValue != old.levelValue && current.levelValue != 0 && current.levelValue != 10 && current.levelValue != 9 && old.levelValue != 10 && old.levelValue != 9){
       return true;
    } else if (current.levelValue == 25 && current.cutsceneValue == 15){
       return true;     
    } else if (settings["croc_entry"] && current.levelValue == 9 && old.levelValue == 7){
        return true;
    } else if (settings["croc_exit"] && current.levelValue == 7 && old.levelValue == 9){
        return true;
    } else if (settings["turtle_entry"] && current.levelValue == 10 && old.levelValue == 7){
        return true;
    } else if (settings["turtle_exit"] && current.levelValue == 7 && old.levelValue == 10){
        return true;
    }
}

reset
{
    if(current.levelValue == 0 && current.location == 1954047348 && current.cutsceneValue == 15){
        return true;
    }
}

isLoading
{
    if(settings["load_remover"] && current.loadState == 0){
        return true;
    } else {
        return false;
    }
}