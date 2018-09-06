using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class SampleNewPlayableCharacter_ModInterface : IModInterface {

    public override void OnIngameUpdate()
    {
        if (!GameMgr.IsInParty(80001))
            GameMgr.ActorJoinParty(80001, 5);
    }
}
