using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class SampleNewItem_ModInterface : IModInterface {

    private bool b_doOnce;

    public override void OnIngameUpdate()
    {
        if (b_doOnce)
            return;

        b_doOnce = true;

        if (!GameMgr.HaveItem(853001))
            GameMgr.ModInventory(853001, 1);
    }
}
