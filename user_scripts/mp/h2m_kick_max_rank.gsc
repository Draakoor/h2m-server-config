init()
{
    level thread onplayerconnect();
}

onplayerconnect()
{
    while(true)
    {
        level waittill("connected", player);
        player thread onplayerspawned();
    }
}

onplayerspawned()
{
    while(true)
    {
        self waittill("spawned_player");
        if(self.first)
        {
            if(isMaxLevel(self))
            {
                self thread kickMaxLevel(); 
            }
            else if(!isMaxLevel(self))
            {
                self iprintln("Welcome: "+self.name);
            }
            self.first = false;
        }
    }
}

kickMaxLevel()
{
    self iprintln("Players with unlock all is ^1NOT PERMITTED^7 to be playing this server. Goodbye.");
    wait 10;
    kick( self getentitynumber(), "EXE_PLAYERKICKED" );
}

isMaxLevel(player)
{
    if(self.pers["prestige"] == 10 && self.pers["rank"] == 999)
    {
        return true;
    }
    else
        return false;
}