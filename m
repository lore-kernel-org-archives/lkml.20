Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792936921;
	b=XwQisI3GCc2Sxsz3YCbursbvFqaXsdZnZ8ueKtQRj9X5nethiSWSwC44xgc7SosiD8Qb
	 uBnQcHQP+8z152EAUORTGaRCFv+iw/DizrfF5MjJnFVHBYtosW6Rx8nEDruAFj8ph0mlN
	 bANG3yy6x3X41nPAmPz5MFA527eekDSPtP2+GB8En8dT1K/jNGUS+lYs0/IJiELk8RTQ4
	 V51ykGc/VOpFgTWFy9lcpGqSAA1pO+ZMAkxBcJXFlJNI/dodbeXFKStL5YjWrXpDNUfo+
	 lEiLQbuY7RMalKoJw1xPrZ+Qw2TCaILSnsdouRDqdS3VnfVm5rgW3SbCO2BIt70yBTg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792936921;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=vrMXt1z7sqI2rPBLPoXnJ9DxZ7jNjEuTfkEKdCrv0eo=;
	b=E0dP2MFWTGStZ4YEuzFFpb98BPYyDOQvLcunol3pxXgFVrj3eNRYjuXHysIDmVv7PL56
	 AtY621R+GFHIFxN1LSlIKo7Jxl+BFoomoDFieZWhW6UYOCK2m6swGwyc9NCrRxo08KeIn
	 aWqb+wA+iXqpVyBhMJ0aCbz704XROFAg1+s5bqWZdPBAmjnylqK+8KbcH8F+I+ZTFmE/V
	 iCOjtxyDSE9oR9S3VTwIvw/sVXipCImyWeOuBe4/yxSpV8yFlPcshc9Dxy4hEOfoFJusy
	 BN85HUw4XGqYiAHF/YVU9r9FXk8f3vHJuWAgJJoMDciQiigdOSbVW1KP9HAzmpkHEIw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=qTIefrEl;
	arc=none smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62421606A32A
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 14:02:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 62421606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=qTIefrEl
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-3535a54bed9so3561396eec.1
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 07:02:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792936920; x=1793541720; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=vrMXt1z7sqI2rPBLPoXnJ9DxZ7jNjEuTfkEKdCrv0eo=;
        b=qTIefrElyFSBonKz3NWQEjyMYd2mF5liGilEmC2qnXcQs2bY8gzLi0n9lTS9i4yVw0
         IjWK+TrbICAO6Mjq4nUDMZM901xSQYWk8PCuUpR0X536VWB+2yoQcMa0lsT8Dq8FSL2j
         B2f20NHADJ2PA19gm48G1ZHuvHaoUNIBmaAZsR0TQdpzQWpNl+wY7zQe2CfC+7woBY/D
         EftUZEBtRWub5um0Ham7K+9R9HcEm247U9pswSPkDaads3zr/S1BS3NuBc5fDmh8dK0R
         T3jEXlgigFcirNCJh09dvo95zsHuICwitlsUTGlVTwzVHkt2aLo/sDUDu/QI0OZ+jxJ1
         lSoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792936920; x=1793541720;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vrMXt1z7sqI2rPBLPoXnJ9DxZ7jNjEuTfkEKdCrv0eo=;
        b=0Sug7Aq9U4s4KKqti46Ayvcxtkd+GqBNLxX2Ac+1yA3eOqt/cNjDc+o0KToRG1pB36
         rwHzfiBMd8VTJ7iOBuDBs1j+Kbkv09sTEjZ8F4tDv6zXPUa2+U+deU87RlQEp7JlNArM
         Qo8ut5lI6NEwMuDfkYeqLNoAqjwAebd3Rj7VAzGT+J8vEiOp2vo58nUwoGl+P4L6C5MK
         tkKBBOl+h8br49lgIVcMum15/SPEwF0Z1SLbGMOmXuDqSENdVjkmcaJBZhBy3x9IqK4z
         WTOJzuw8OGb7e/5SGTZA3TAz7gBi6teFDdma+yI7T72zVePLCi4MFG9mMz+Er9cCgoOr
         +xlQ==
X-Forwarded-Encrypted: i=1; AKwUvBztV/+zhqLKzVDRlqGfu/bmOhkhs3PH+sXKQ4XhIZQPfNBWn1PQziR322IDqJKnQtkCxvopMu0fLoVbVNI=@vger.kernel.org
X-Gm-Message-State: AFq9FYK281I2w3IIJ9hRFzIlT2bXbNAwPU+o5PDeBXg2afeeMT0LXLUM
	Esq7+q3kZ6P6SpM3NDmWWN2nK0ZtAC9WKMZJww619L3QWOX58TXgk2dq
X-Gm-Gg: AYBFou0SGR7OS6NVS2cuEoTaIagSJwUY1R/7z/LUiwpzWP3e2fe3Kp6g07pToIEsNC8
	oBz+DZxohvFF/5L3yXGfADJO646LFWOwAiEIoJT1clRYU05AJbXUuf3IP829Azvx2RDM/2AQ3gw
	F97VpGvmAUhgWx1IK/4kmYZsld99NnpwQTO2jHHet48QQwb3cQFpnrgbcF7qpY0vWJVKLe8on/L
	EbuZilxvRI7EmQLcdzOPFOQE9L9YCUttr2EntSkdvgsS+wsJApkNAdVNgtELPOnRA5qbaz+Q7+M
	szTHB2Mjoydkta2rvI48/yGg3ZepTuif3b5mGoITc6VEDurd4DR4gB481BURTAgZ8pU1gQBEiT5
	F8T4Kkcjppg2xe/gveqWMG3Y1g8Mg65R6ha7V1XLAEr4+AA2pegN/c/FSNuRej0aAo2QMjTTvtj
	vygzPxLv5vrB/RUHs96uB8XTXyQA0PdYfDvtfCB809N9FotrL1Hzv+Wr3MW8YnmPku5r2Wy4KvE
	EdmfcAwymt1cAWaQBqZc5ZgtAqi8OjttBLHagntd6fbc65ZUUu1x4wIFKbkKPG8sukxbyfFaPeu
	4WPOM/nFiyrv1bGwaeNExMGupMOnN9ZAVXY6n1M=
X-Received: by 2002:a05:7300:8aa0:b0:35c:ceb0:8bf9 with SMTP id 5a478bee46e88-369e84e00acmr6241494eec.38.1792936920256;
        Sun, 25 Oct 2026 07:02:00 -0700 (PDT)
Received: from Gris-Laptop (gia.grisge.info. [67.230.185.89])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369f4164886sm9280272eec.7.2026.10.25.07.01.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 07:01:59 -0700 (PDT)
From: Gris Ge <cnfourt@gmail.com>
To: Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Gris Ge <cnfourt@gmail.com>,
	stable@vger.kernel.org,
	Shayne Chen <shayne.chen@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Ming Yen Hsieh <mingyen.hsieh@mediatek.com>,
	Devin Wittmayer <lucid_duck@justthetip.ca>,
	Stella Liu <yu-ching.liu@mediatek.com>,
	Leon Yen <leon.yen@mediatek.com>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH] wifi: mt76: mt7925: fix NULL dereference in CSA worker
Date: Sun, 25 Oct 2026 22:01:18 +0800
Message-ID: <20261025140123.12056-1-cnfourt@gmail.com>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

`mt7925_csa_work()` checks `dev->new_ctx` before taking `dev->mt76.mutex`,
but the pointer is re-read and dereferenced after
`mt792x_mutex_acquire()`. That check and the later use are not serialized
against a concurrent teardown, which can clear the pointer in between:

  BUG: kernel NULL pointer dereference, address: 0000000000000000
  RIP: 0010:mt7925_csa_work+0x83/0x160 [mt7925_common]
  RAX: 0000000000000000

`mt7925_remove_chanctx()` clears `dev->new_ctx` without synchronization
against the worker. During a channel switch mac80211 frees the reserved
channel context (calling `drv_remove_chanctx()`) before
`drv_abort_channel_switch()`/unassign can cancel the worker, so it can run
with a context that was just cleared.

`mt7925_channel_switch_rx_beacon()` is serialized with the writers by the
wiphy mutex; the worker is not.

Protect `dev->new_ctx` with `dev->mt76.mutex` in add_chanctx() and
remove_chanctx(), and validate it under the lock in `mt7925_csa_work()`.
Keep a local pointer for both firmware calls so the context can neither
become NULL nor be freed while it is being used.

Reproduced the panic by injecting CSA-less "abort" beacon, works well
after patched.

Fixes: 7900da40e315 ("wifi: mt76: mt7925: introduce CSA support in non-MLO mode")
Cc: stable@vger.kernel.org # 7.1+
Signed-off-by: Gris Ge <cnfourt@gmail.com>
---
 .../net/wireless/mediatek/mt76/mt7925/main.c  | 30 +++++++++++--------
 1 file changed, 18 insertions(+), 12 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/main.c b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
index 15d95ad32636..fb5f9aa3534d 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
@@ -2020,7 +2020,9 @@ mt7925_add_chanctx(struct ieee80211_hw *hw,
 {
 	struct mt792x_dev *dev = mt792x_hw_dev(hw);
 
+	mutex_lock(&dev->mt76.mutex);
 	dev->new_ctx = ctx;
+	mutex_unlock(&dev->mt76.mutex);
 
 	return 0;
 }
@@ -2031,9 +2033,10 @@ mt7925_remove_chanctx(struct ieee80211_hw *hw,
 {
 	struct mt792x_dev *dev = mt792x_hw_dev(hw);
 
+	mutex_lock(&dev->mt76.mutex);
 	if (dev->new_ctx == ctx)
 		dev->new_ctx = NULL;
-
+	mutex_unlock(&dev->mt76.mutex);
 }
 
 static void
@@ -2509,11 +2512,13 @@ static int mt7925_switch_vif_chanctx(struct ieee80211_hw *hw,
 
 void mt7925_csa_work(struct work_struct *work)
 {
+	struct ieee80211_chanctx_conf *ctx;
 	struct mt792x_vif *mvif;
 	struct mt792x_dev *dev;
 	struct ieee80211_vif *vif;
 	struct ieee80211_bss_conf *link_conf;
 	struct mt792x_bss_conf *mconf;
+	bool roc_started;
 	u8 link_id, roc_rtype;
 	int ret = 0;
 
@@ -2525,26 +2530,27 @@ void mt7925_csa_work(struct work_struct *work)
 	if (ieee80211_vif_is_mld(vif))
 		return;
 
-	if (!dev->new_ctx)
-		return;
-
 	link_id = 0;
 	mconf = &mvif->bss_conf;
 	link_conf = &vif->bss_conf;
 	roc_rtype = MT7925_ROC_REQ_JOIN;
 
 	mt792x_mutex_acquire(dev);
-	ret = mt7925_set_roc(mvif->phy, mconf, dev->new_ctx->def.chan,
-			     4000, roc_rtype);
-	mt792x_mutex_release(dev);
-	if (!ret) {
-		mt792x_mutex_acquire(dev);
-		ret = mt7925_mcu_set_chctx(mvif->phy->mt76, &mconf->mt76, link_conf,
-					   dev->new_ctx);
+	ctx = dev->new_ctx;
+	if (!ctx) {
 		mt792x_mutex_release(dev);
+		return;
+	}
 
+	ret = mt7925_set_roc(mvif->phy, mconf, ctx->def.chan, 4000, roc_rtype);
+	roc_started = !ret;
+	if (!ret)
+		ret = mt7925_mcu_set_chctx(mvif->phy->mt76, &mconf->mt76, link_conf,
+					   ctx);
+	mt792x_mutex_release(dev);
+
+	if (roc_started)
 		mt7925_abort_roc(mvif->phy, mconf);
-	}
 
 	ieee80211_chswitch_done(vif, !ret, link_id);
 }
-- 
2.56.0

