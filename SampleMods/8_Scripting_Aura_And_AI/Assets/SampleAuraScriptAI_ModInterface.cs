using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class SampleNewSpell_ModInterface : IModInterface {

    private bool b_doOnce;

    public override void OnIngameUpdate()
    {
        if (b_doOnce)
            return;

        b_doOnce = true;

        if (!GameMgr.HaveItem(853005))
            GameMgr.ModInventory(853005, 1);
    }
}
