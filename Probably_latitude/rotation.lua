-- ProbablyEngine Rotation Packager
-- Custom Demonology Warlock Rotation
-- Created on Dec 26th 2013 2:20 pm
ProbablyEngine.rotation.register_custom(266, "|r[|cff9482C9Latitude|r][|cffFF7D0AWarlock-Demonology|r]", {

--Mana Management
{ "Life Tap", { "player.mana < 30", "player.health > 70", }},
-- defensive CD --

-- offensive CD --
{ "33702"},								-- Racial
{ "#gloves" }, 							-- gloves
{ "113861"},							-- dark soul dès que up

--Rotation Shared

{ "1490", 	{ -- Curse of Elements
		"!modifier.last(1490)",
		"!target.debuff(1490).any",
		"!target.debuff(34889).any",
		"!target.debuff(24844).any",
		"!target.debuff(93068).any",
		"target.level = -1"
			}},



{ "!172", 	"target.debuff(146739).duration < 3" },     	-- Corruption Refresh
{ "172", 	"!target.debuff(146739)" },						-- Corruption
{ "111898"},												-- GoServ



---- Metha Pull ----
{ "!/cancelaura Metamorphosis", { "target.debuff(Doom).duration > 61", "target.debuff(146739)", "player.buff(103958)", "player.demonicfury <= 200" }}, -- Cancel Meta After Doom Dotting at the pull

{{
	{ "103958", 		"!player.buff(103958)" } ,												-- Meta
	{ "!/cast Doom", 	{ "!target.debuff(Doom)", "target.debuff(Doom).duration < 61" }},		-- Doom
	{ "!/cast Doom", 	"target.debuff(Doom).duration < 61" },									-- Doom Dotting x2 for pandemic effect
}, { "!target.debuff(Doom)", "target.debuff(146739)" }},


------ Meta ---------
{ "103958", 	{ "!player.buff(103958)", "player.demonicfury >= 950" }}, 
{ "!/cancelaura Metamorphosis", { "player.demonicfury <= 100", "player.buff(103958)" }},	    -- Cancel Meta

----Meta Cycle ---------
{{
	{ "!/cast Doom", "!target.debuff(Doom)" },
	{ "!/cast Doom", "target.debuff(Doom).duration <= 30" },
	{ "!/cast Doom", "player.demonicfury < 200" },
	{ "112092", "target.debuff(Corruption).duration <= 15" },    -- Touch of Chaos Refresh Corruption before fade
	{ "112092", "player.moving" }, 								 -- Touch of Chaos when moving to skip SoulFire
	{ "6353",	"player.buff(122355).count >= 2" },				 -- soufire with proc +25% target life--
	{ "112092" }, 												 -- Touch of Chaos
}, "player.buff(103958)" },

----- filer forme humaine -----
{{
    { "105174" },												-- guld'an --
	{ "77799",  "player.moving" },								-- Moving Human Form --
	{ "6353",	"target.health < 25"},							-- soulfire
	{ "6353",	"player.buff(122355).count >= 2" },				-- soufire with proc +25% target life--
	{ "112092"}, 							                    -- shadowblot si la cible a plus de 25% de vie
}, "!player.buff(103958)" },



-- Out Of Combat
},
{
--Buffs
{ "6201", {"@demofunc.HealthstoneCharges()","!player.moving", "!modifier.last(6201)" }},
{ "109773", "!player.buff(109773)" },
{ "30146",  "!pet.alive" },
{ "!/cancelaura Metamorphosis" },
})