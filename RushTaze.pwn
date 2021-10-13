// This is not to be ran as a Gamemode or Filterscript!
// This is simply an example of some coding done by Yisui Chaos
// If my comments are too long, it will be shown by me placing continuation periods(...) to the next line.

// Let's get started...
// For my Rush Taze Idea...

// First define the variable in which we'll store the time a player was last shot.
new GetTimeLastShot[MAX_PLAYERS];
// This is the variable is active for all players as defined with MAX_PLAYERS.

// We will use the callback "OnPlayerTakeDamage" to determine when a player is shot
public OnPlayerTakeDamage(playerid, issuerid, Float:amount, weaponid)
{
	if(issuerid != INVALID_PLAYER_ID) // This line makes sure whatever issued the damage is a player...
	// by comparing the issuer's ID to -1(INVALID_PLAYER_ID). -1 will only be returned if the player inflicts...
	// damage on self and some cases of world damage like falls.
	{
	    if(weaponid > 15) // This line compares the ID of the weapon to 15...
		//If the ID of the weapon is greater than 15, it will run the code in the brackets.
		{
			GetTimeLastShot[playerid] = gettime(); // This line saves uses the function "gettime"
			// to save the current server's time into a the variable we defined at the top of the script.
		}
	}
	return 1;
}

// This part is to be inserted into the /tazer command.
if(gettime() - GetTimeLastShot[playerid] < 5) // This line subtracts the time we saved in the variable
// from the servers current time. After that is done, it compares it to 5 seconds. gettime will return
// time in seconds unless defined otherwise in the function itself.
{
	SendClientMessageEx(playerid, COLOR_WHITE, "You have been shot in the last 5 seconds."); // this is self explanitory
	return 1; // returning 1 will stop the code and not allow it to continue any further.
}
