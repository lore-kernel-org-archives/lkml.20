Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 473A23A5421
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 06:01:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788933664; cv=none; b=pcHihbh3MzVMU7/qZV5goUhmaL05lTjLWN3wJl1fobPeDFX26gH36mhWERh9xvScOtmCrlqprRcC8PnRb2RpCeaSg79kNZSk13Ki9kE2AbIVsouh8SLX4zhiOc2V6d+WxvdHhwxtscZ7lm0c+0K2CgwqHFaDjsVTLE5En+rnnLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788933664; c=relaxed/simple;
	bh=S/fzE7LggtKyXFVV+3o0QCAj32nkdP1715ppK3vGFKw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Zw9IKr1CYuaEZ6zRBwiOdySGdEUL06ZcXZGDXeesnGJOR6XUlcDgj6iPgyR83vyca8fT/H7+D2XzoRnmspcSV90274P1Rg73FWWXq7lT7DCK9REX3dU0DrLShrgUl0qHzZzN9Ew66Cz1OQGk2Y9Xi6PkXmzZsEFQqWOvNT0kcNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nebusec.ai; spf=pass smtp.mailfrom=nebusec.ai; dkim=pass (2048-bit key) header.d=nebusec.ai header.i=@nebusec.ai header.b=IYORCHwA; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nebusec.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nebusec.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nebusec.ai header.i=@nebusec.ai header.b="IYORCHwA"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-383b4a3755fso5124909a91.3
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 23:01:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nebusec.ai; s=google; t=1788933662; x=1789538462; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gvow6oU4iq+0a+bBr6UukoAAqBxhHL+gKoXpK7iHJCA=;
        b=IYORCHwAfNY6VX+KYA/obNIlz/YoxYfiSw+BGBZqcxHhYDgs0yCT+uObG/8pGBvtEg
         e9DJE4PVljtrJ8Q1TqZc9T6rvEuQ7uctvtMjkgNM6Rjixdb/qmsQ/+dzrmgMMfOi7G4g
         nZXoZK0H4BRRpw0yB9SFLYgYmul/rMMBDy2V135anF5lzcbGQ6YLBqDRxguV6kVWhYSr
         TRgeb/hZou+7U1Bp03fJAapz4SbsWbX1RPXqFpVXRG20BAmCaLMPDiRoov0GCzIRBbU1
         ewAUs/8soSpyEmXBPdIZWd/BN6itUKi99PwbYDw7qf7MigiSa9s+IceGQC3E94Q3c+a9
         i6lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788933662; x=1789538462;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gvow6oU4iq+0a+bBr6UukoAAqBxhHL+gKoXpK7iHJCA=;
        b=TEsFybzDDgGbGJ8WiyLZ77fUk2AnjW6LbuIQrg+WgWN1z/69bse34IzoVPcZyziImZ
         /AeB/MmgFRixWPbCexxUjDQ2S6Zihv1T33FWAkcR75tn0/Jb38XJbPanKQ8n50j31xJW
         tuJJGWisU7iL5Lkvh4HjwJD4G9n9yc0TTEDOBM2YaKCHsfGSGMHa1zF5l3Kw3cFIQpk9
         12pZ9gJSZDijNAcrh+ITCXYDCHO9aU6+zYQeA0mEqiW34k9iyLnIPfghnU43iij+tAva
         e7qkVEZ8YDnlpPwq2Exlv+bK7OH811fTx/7H/bC2+gAo71CHNIoqdCdVshHDIJATCWJx
         c2IA==
X-Forwarded-Encrypted: i=1; AKwUvBxlexdC7VD5tEh9Da1l0c0hO5c11uSPuCqnDe7XBhk6tIuLNLCSAL1tIRFrMXkfqamERGtAr3m6KqUK1tA=@vger.kernel.org
X-Gm-Message-State: AFuF++msV/k2b+JMSkUcSlA4XoQMA8zcYdWb10pvZi23QTj2Ycf6EtLO
	T+JCjEnudWWJselryFYA+M/m0S91l7LIYSQxouM0Q8AUNDYdRuzEE2ARZ2BeA8IICqil
X-Gm-Gg: AYBFou1DoHLKIGL7Rz/2zzWksb4lyq4DdTfu2miVs70Tzy9ibgLZLtrqJwQ9TooUREX
	dZlNE0QIRVVfUg6K1P4ba3mvsR5eno4M3YN1Wc+53PGvXPX+8OOoL/9GaGpR28ubEGwUnmxJouA
	iKOtluPY6Wkxj5M4vgp5SxS0kI9LFgGe5ZWB4+qKdXCT07xgmAb+1QYBOVB/zF4Hk1RhVC2tSNp
	G4cA3ckQvG9XCs0DDitXv3awkzBRrVE0SqF4ygLbOisFga3q2W7oBLE16wxuV6lYJrd336AuxZd
	MV42o4bDW6g4zKeheKY0eNwpbuOs2oDEncFetaOgma1Aj7CFPCXxNYkUFdVL/CFzrg1jG1xb1rm
	7muNOmQe9d7AhxhqDIlFryhH2B4gYwLzw3tsqeJ6CvNT7dithOUCJ6Ftnq6vCYkieZmmjjlQ1fB
	XXQjeQNJ8MpJ/IYZDbi4+t0ll338WUT+jax8HMQzkNJRtMvY2rJMEuY0bTnFwZhs5AgP4K573op
	4NTGhmpogyl0YFDwI0QaOMtopYStA==
X-Received: by 2002:a17:90a:dfcd:b0:396:4cbf:45a2 with SMTP id 98e67ed59e1d1-39b84cce5a8mr18859182a91.14.1788933662174;
        Tue, 08 Sep 2026 23:01:02 -0700 (PDT)
Received: from b6ad5085b32f.. ([122.51.212.64])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39cfa44aee7sm662709a91.3.2026.09.08.23.00.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 23:01:01 -0700 (PDT)
From: Zihan Xi <zihanx@nebusec.ai>
To: linux-wireless@vger.kernel.org
Cc: Johannes Berg <johannes@sipsolutions.net>,
	Felix Fietkau <nbd@nbd.name>,
	Ryder Lee <ryder.lee@mediatek.com>,
	linux-kernel@vger.kernel.org,
	Zihan Xi <zihanx@nebusec.ai>,
	stable@vger.kernel.org,
	Vega <vega@nebusec.ai>,
	Luxing Yin <root@tr0jan.top>
Subject: [PATCH wireless v2 1/1] wifi: mac80211: fix mesh fast xmit path deletion UAF
Date: Wed,  9 Sep 2026 06:00:46 +0000
Message-ID: <f0c01d0a6d7bdc3497dd62b69a884c00f0d8b78b.1788930567.git.zihanx@nebusec.ai>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1788930567.git.zihanx@nebusec.ai>
References: <cover.1788930567.git.zihanx@nebusec.ai>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

mesh_fast_tx_cache() stores raw mesh_path pointers. Path deletion
flushes the cache and then frees the path with kfree_rcu(), but a
lookup that already holds the path can insert a new cache entry
after the flush. The cache then points at freed memory.

Set MESH_PATH_DELETED before flushing, and skip inserting a cache
entry if the path or MPP path is already deleted. Check this under
the cache walk lock so it is ordered with the flush.

Fixes: d5edb9ae8d56 ("wifi: mac80211: mesh fast xmit support")
Cc: stable@vger.kernel.org
Reported-by: Vega <vega@nebusec.ai>
Assisted-by: LLM
Co-developed-by: Luxing Yin <root@tr0jan.top>
Signed-off-by: Luxing Yin <root@tr0jan.top>
Signed-off-by: Zihan Xi <zihanx@nebusec.ai>
---
changes in v2:
  - Rewrite the commit message.
  - v1 Link: https://lore.kernel.org/all/94174303640c5e1022b31836770bad75f741afbf.1788845030.git.zihanx@nebusec.ai/

 net/mac80211/mesh_pathtbl.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/net/mac80211/mesh_pathtbl.c b/net/mac80211/mesh_pathtbl.c
index 03171cf008557..dfcc4f3a7088e 100644
--- a/net/mac80211/mesh_pathtbl.c
+++ b/net/mac80211/mesh_pathtbl.c
@@ -577,6 +577,12 @@ void mesh_fast_tx_cache(struct ieee80211_sub_if_data *sdata,
 		goto unlock_sta;
 
 	spin_lock(&cache->walk_lock);
+	if ((READ_ONCE(mpath->flags) & MESH_PATH_DELETED) ||
+	    (mppath && (READ_ONCE(mppath->flags) & MESH_PATH_DELETED))) {
+		kfree(entry);
+		goto unlock_cache;
+	}
+
 	prev = rhashtable_lookup_get_insert_fast(&cache->rht,
 						 &entry->rhash,
 						 fast_tx_rht_params);
@@ -812,6 +818,9 @@ static void __mesh_path_del(struct mesh_table *tbl, struct mesh_path *mpath)
 {
 	hlist_del_rcu(&mpath->walk_list);
 	rhashtable_remove_fast(&tbl->rhead, &mpath->rhash, mesh_rht_params);
+	spin_lock_bh(&mpath->state_lock);
+	mpath->flags |= MESH_PATH_DELETED;
+	spin_unlock_bh(&mpath->state_lock);
 	if (tbl == &mpath->sdata->u.mesh.mpp_paths)
 		mesh_fast_tx_flush_addr(mpath->sdata, mpath->dst);
 	else
-- 
2.43.0

