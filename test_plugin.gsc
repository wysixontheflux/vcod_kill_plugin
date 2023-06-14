//1. Put this file in the "codam" folder of the "main" server folder.
//2. Add the below line to "modlist.gsc":
//[[register]]("Kill plugin", codam\kill_plugin::main);

main(phase, register)
{
	switch(phase)
	{
		case "init": _init(register); break;
	}
}
_init(register)
{
	if (isdefined(level.testplugin))
		return;
	level.testplugin = true;

	if (getCvar("g_gametype") == "sd")
	{
		[[register]]("finishPlayerKilled", ::finishPlayerKilled, "thread");
	}
}
finishPlayerKilled(eInflictor, eAttacker, iDamage, sMeansOfDeath, sWeapon, vDir, sHitLoc, a7, a8, a9, b0, b1, b2, b2, b4, b5, b6, b7, b8, b9)
{
	codam\utils::_debug(self.name + "IS DEAD.");
}