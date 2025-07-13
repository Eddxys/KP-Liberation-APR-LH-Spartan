/*
    File: allowedExtension.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2020-05-11
    Last Update: 2020-05-11
    License: MIT License - http://www.opensource.org/licenses/MIT

    Description:
        List of classnames which will be always added to the allowed gear list.
        This is used to add let's name it "generic classnames".

        E.g. if you've an available weapon "myMod_weap_M16" and an available grip "myMod_acc_coolGrip"
        some mods transform this combination to a weapon "myMod_weap_M16_coolGrip".
        That classname is used internally and wouldn't be listed in the arsenal and can cause issues to be
        detected as not allowed weapon, even if the weapon and the grip is whitelisted.
        So add this "generic classname" here afterwards to avoid this.

        The classnames of blacklisted items on a player are logged in the server rpt for a later lookup.
*/

// Extension list of allowed arsenal gear
KPLIB_arsenalAllowedExtension = [
    "ACE_PreloadedMissileDummy_CUP",
    "ACE_PreloadedMissileDummy_Igla_CUP",
    "ACE_PreloadedMissileDummy_M72A6_CUP",
    "ACE_PreloadedMissileDummy_NLAW_CUP",
    "ACE_PreloadedMissileDummy_RPG18_CUP",
    "ACE_PreloadedMissileDummy_Stinger_CUP",
    "ACE_PreloadedMissileDummy_Strela_2_CUP",
    "ACE_ReserveParachute",
    //ACE Start
    "ACE_adenosine",
    "acex_intelitems_notepad",
    "ACE_Fortify",
    "ACE_CableTie",
    "ACE_EarPlugs",
    "ACE_wirecutter",
    "ACE_MapTools",
    "ACE_fieldDressing",
    "ACE_bodyBag",
    "ACE_epinephrine",
    "ACE_morphine",
    "ACE_Sandbag_empty",
    "ACE_tourniquet",
    "ACE_EntrenchingTool",
    "ACE_EHP",
    "ACE_IR_Strobe_Item",
    "ACE_rope12", 
    "ACE_rope15",
    "ACE_rope18",
    "ACE_rope27",
    "ACE_rope36",
    "ACE_elasticBandage",
    "ACE_packingBandage",
    "ACE_quikclot",
    "ItemMap",
    "ItemCompass",
    "ItemGPS",
    "ACE_Altimeter",
    "ChemicalDetector_01_watch_F",
    "ACE_Banana",
    "ACE_Canteen",
    "ACE_Sunflower_Seeds",
    "ACE_artilleryTable",                                           // Artillery Rangetable
    "ACE_RangeCard",                                                // Range Card
    "ACE_RangeTable_82mm",                                          // 82 mm Rangetable
    "ACE_LIB_FireCord",
    "ACE_PlottingBoard",
    "ACE_WaterBottle",
    
    //ACE End

    // Binoculars
    "CUP_SOFLAM",
    "Binocular",
    "rhsusf_bino_m24",
    "rhsusf_bino_m24_ARD",
    "rds_pdu2",
    "ace_dragon_sight",
    "ACE_VectorDay",
    "ACE_Vector",
    "ACE_Yardage450",
    "rhssaf_zrak_rd7j",

    //CUP Start
    "CUP_NVG_GPNVG_black",
    "CUP_NVG_GPNVG_black_WP",
    "CUP_NVG_GPNVG_green",
    "CUP_NVG_GPNVG_green_WP",
    "CUP_NVG_GPNVG_tan",
    "CUP_NVG_GPNVG_tan_WP",
    "CUP_NVG_GPNVG_winter",
    "CUP_NVG_GPNVG_winter_WP",

    //CUP End

    //USP Start    
    "USP_ACC_GPNVG18_BLK",
    "USP_ACC_GPNVG18_TAN",
    "USP_ACC_GPNVG18_CB_BLK",
    "USP_ACC_GPNVG18_CB_TAN",
    "USP_GPNVG18_BLK",
    "USP_GPNVG18_BLK2",
    "USP_GPNVG18_TAN",
    "USP_GPNVG18_TAN2",
    "USP_GPNVG18_TAR_BLK",
    "USP_GPNVG18_TAR_BLK2",
    "USP_GPNVG18_TAR_TAN",
    "USP_GPNVG18_TAR_TAN2",
    "USP_GPNVG18_CB_BLK",
    "USP_GPNVG18_CB_TAN",
    "USP_GPNVG18_CB2_BLK",
    "USP_GPNVG18_CB2_TAN",
    "USP_GPNVG18_CB3_BLK",
    "USP_GPNVG18_CB3_TAN",
    "USP_GPNVG18_CB_TAR_BLK",
    "USP_GPNVG18_CB_TAR_TAN",
    "USP_GPNVG18_CB2_TAR_BLK",
    "USP_GPNVG18_CB2_TAR_TAN",
    "USP_GPNVG18_CB3_TAR_BLK",
    "USP_GPNVG18_CB3_TAR_TAN",
    "USP_GPNVG18_GM_BLK",
    "USP_GPNVG18_GM_TAN",
    "USP_GPNVG18_GM_TAR_BLK",
    "USP_GPNVG18_GM_TAR_TAN",
    "USP_GPNVG18_WP_BLK",
    "USP_GPNVG18_WP_BLK2",
    "USP_GPNVG18_WP_TAN",
    "USP_GPNVG18_WP_TAN2",
    "USP_GPNVG18_WP_CB_BLK",
    "USP_GPNVG18_WP_CB_TAN",
    "USP_GPNVG18_WP_CB2_BLK",
    "USP_GPNVG18_WP_CB2_TAN",
    "USP_GPNVG18_WP_CB3_BLK",
    "USP_GPNVG18_WP_CB3_TAN",
    "USP_GPNVG18_WP_CB_TAR_BLK",
    "USP_GPNVG18_WP_CB_TAR_TAN",
    "USP_GPNVG18_WP_CB2_TAR_BLK",
    "USP_GPNVG18_WP_CB2_TAR_TAN",
    "USP_GPNVG18_WP_CB3_TAR_BLK",
    "USP_GPNVG18_WP_CB3_TAR_TAN",
    "USP_GPNVG18_WP_TAR_BLK",
    "USP_GPNVG18_WP_TAR_BLK2",
    "USP_GPNVG18_WP_TAR_TAN",
    "USP_GPNVG18_WP_TAR_TAN2",
    "USP_GPNVG18_WP_GM_BLK",
    "USP_GPNVG18_WP_GM_TAN",
    "USP_GPNVG18_WP_GM_TAR_BLK",
    "USP_GPNVG18_WP_GM_TAR_TAN"

    //Vanilla Start


    //Vanilla End

];