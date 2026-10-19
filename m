Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.9
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792429310;
	b=Rd+EV/tB3BUxFnIPQW8fP7atHvSjEA7wVhoBgLglSc9HucitWuZnqajwKpbQdNpnnCrf
	 RsSzoF05rqDApVmfXO7sAa8nP43J8n4uNOpieTyc31YXFzizUWz830vIUg2Ghdpe3tJAg
	 XMRmxuChk4oRzW9qtq8y/IX/v4ortdTEvjC5cJhd0D6URYaJMpwM+5t7kMPuhNKDszvDY
	 EVnnwdsDFUWP20Xsi8B6lgDdELbTBhlzfX8SierlODkyVMT5nGAGKht7H4jg7ETmzsuvP
	 oG9y/7/DM8Mi8qsltIZmR3lkmHBF1wgQ9o5DVV+ydQx+RMPeAihA90QqGtNkcYwX1pw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792429310;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=zgt+mU6G66DdJESP7PBT5F43QMVoZCobZpjIWBiHJS0=;
	b=HyvAa1CME8gki1ARCqBBWMCiRlKAiG5NsKmRV/bdKVwOnoEmfetJ3LvoBDkyb3f3mTH8
	 pOD9D/NpDRv97peDXwcJp/c16Ho4kyoJvFLgcXETW791AoCGq36Is0uZ39yMzEC8+RfVF
	 Kt4Y8EP0JfO+vtVuSJqCZFOXu8tmni33S04rbIW5nsNjGOc/yyJ0ALgeFVcuFtrh30O+2
	 dJBPnMRzwhr33VRfhNYcIz7GM2zraQqs/D933JBlDGjE9DyvoE/Tq1ko2I/SHNxheCUMi
	 F4gCWL85yjp46h+mOJH2mXa0vWJCNOeTKGXIxHgVgSSCV+KkmWe7LdjR4plAWl5sB2g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=m+cl5aD9;
	arc=none smtp.remote-ip=74.125.229.9
Received: from mail-dy2-f9.google.com (mail-dy2-f9.google.com [74.125.229.9])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AD3F60A2619
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 17:01:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4AD3F60A2619
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=m+cl5aD9
Received: by mail-dy2-f9.google.com with SMTP id 5a478bee46e88-35eaf84cc66so2089403eec.0
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 10:01:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792429309; x=1793034109; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=zgt+mU6G66DdJESP7PBT5F43QMVoZCobZpjIWBiHJS0=;
        b=m+cl5aD92Mijfn2SvERNlR707N94YKxIHz23ACoAkT0gZXTz23HIcdu8HOPuIvAzts
         Ncivv/QC50oyp+MSO66PpBTLeAy4v2i4oaAWoaScJkUN60ZhmPm8XoolLEZ67Pngrckg
         RnQV1heFz+CSJIZp5PcSTkzkqxRRz9V4jPK4wiPIYUxynjrEU86TTW3tJqnMH3JFmTkr
         KhqQECW1P0dzg+BhGDzeTIBbG+PJE8jImNSFIusc7jLnU9PJ9e1ENorjoEil2vDKiLzO
         nB+/XRjD3Psq2G9KH2uokQDBE+tzAxARCsRcBjsgY5E6RS+1ZD/sc2BSCSsvmczbyugG
         m5yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792429309; x=1793034109;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zgt+mU6G66DdJESP7PBT5F43QMVoZCobZpjIWBiHJS0=;
        b=Gc+WBLx0dhGf1om3LhK18Dzmf4+4h9/N0Dh3R64q6seYvI0F3dyCICiy3BNVT9pzPt
         Z+ZqLyx/muC6kP+S8z7Acz9os8LEATHKTNH9cKV+mADw22Gw4DUkTMBtXHM0RJBBxHNi
         d6S5kduBF7bJAuAWLtIMp5/HRvFiTauYTHapKtgp2u7P9doCmyz/DV2knDKKvyuvcz6j
         2XD7rgOi3ZpoHwxPa7OMsPiNWN+5NE39gWjhN3PzRUg/mWanO1cR20Cc6kPQoMs0kxr5
         7DJ/vY7JSwc79is7+7Ai4an3aUjqPGr9qUf+qdueNCjU4HgpBHX9YlbWy97mDKcVty58
         9HwA==
X-Forwarded-Encrypted: i=1; AKwUvBx6n0zH2C5m+2emnoJ+JJClWclRZVGY8zHVC8i37UM3gMAYvcK14CFJYjdiRD6fy4l1L0CkMCd2wih+zhc=@vger.kernel.org
X-Gm-Message-State: AFq9FYLRKxyEmIgMpxHuTkFwtaWtsdU8NsSmbA5/trSo1vpLk3J/YZHp
	TponoivaK6tnDVpJ+SH5ur/TvwZZgVvX8wagYvNAuTuUBCgIcc3BMjJH
X-Gm-Gg: AYBFou0XZlw/NJa6/XOTWfNUPZ8pYWl13Zyt/s0gzvQw0CM2D95OJTPTwuhpxUWZ4Ib
	LJeK0GzzJ07Zw0u7JpKz+ZXyPs3xIgTiiEZUALbkYUfjkCo0Wt9I+JqzCG46ymS3wxboiOGf3YG
	350bSh7qTS7810qP6m8YdlphEYJnxaA0Syi/nLecYNlRimYF58YlYCikNFBTNauqs6bbyLgRHEb
	hR7FUx2pJXNmtkJr3Rl/jWp9UIBwc1ci+4iwd+eD2wIvqJ8NGjBz5A5jqflGXMJdsHY2dgwkYRR
	v1SH+2rRux++Te5sagC5y1mwmH+LTT1ZV3lyh+cJVw8AdnNaKUgRymGbacfC+wZK71CwzjqHX9E
	LMI6IHlWvQ+6P8zS2UkqxkY3wM6f648KAWJk/6vutoLNFDcTe9DD4Rjbuu4JeWYZoUlvz9PcwoR
	cZvJ85azDtEv0jSE99QhYtWEqjNfIWZsBdlIYy+xs6sygxTXWCiAW4CXt1onHWQgnrBsUA457aZ
	eakKZli71gfI428jCdx37rmGHhQExN/HLUraP0S5VJ7mSMaJ97J+jxFRsEUR/Hm3ciL5IbH9vAL
	bkGsO17R
X-Received: by 2002:a05:693c:65d5:b0:343:9eb1:9940 with SMTP id 5a478bee46e88-361a1f48482mr12961659eec.26.1792429309185;
        Mon, 19 Oct 2026 10:01:49 -0700 (PDT)
Received: from localhost.localdomain ([98.148.34.5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-360813b6ca5sm31748945eec.9.2026.10.19.10.01.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 10:01:48 -0700 (PDT)
From: Hungyu Lin <dennylin0707@gmail.com>
To: pkshih@realtek.com
Cc: linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	reza1234khan1234@gmail.com,
	Hungyu Lin <dennylin0707@gmail.com>
Subject: [PATCH] wifi: rtw88: allow key removal when the CAM table is full
Date: Mon, 19 Oct 2026 16:51:03 +0000
Message-ID: <20261019165103.5990-1-dennylin0707@gmail.com>
X-Mailer: git-send-email 2.43.0
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

rtw_ops_set_key() looks for a free CAM entry before checking the
command. When all pairwise entries are in use, DISABLE_KEY returns
-ENOSPC without clearing the existing entry.

Move the allocation and bounds check into SET_KEY. DISABLE_KEY uses
the existing key->hw_key_idx.

Fixes: 10d58823cb44 ("wifi: rtw88: fix out-of-bounds CAM write when key table is full")
Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
---
 drivers/net/wireless/realtek/rtw88/mac80211.c | 24 +++++++++----------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/net/wireless/realtek/rtw88/mac80211.c b/drivers/net/wireless/realtek/rtw88/mac80211.c
index 2a9b09fa76e7..5e40cf06a9e3 100644
--- a/drivers/net/wireless/realtek/rtw88/mac80211.c
+++ b/drivers/net/wireless/realtek/rtw88/mac80211.c
@@ -598,20 +598,20 @@ static int rtw_ops_set_key(struct ieee80211_hw *hw, enum set_key_cmd cmd,
 
 	rtw_leave_lps_deep(rtwdev);
 
-	if (key->flags & IEEE80211_KEY_FLAG_PAIRWISE) {
-		hw_key_idx = rtw_sec_get_free_cam(sec);
-	} else {
-		/* multiple interfaces? */
-		hw_key_idx = key->keyidx;
-	}
-
-	if (hw_key_idx >= sec->total_cam_num) {
-		ret = -ENOSPC;
-		goto out;
-	}
-
 	switch (cmd) {
 	case SET_KEY:
+		if (key->flags & IEEE80211_KEY_FLAG_PAIRWISE) {
+			hw_key_idx = rtw_sec_get_free_cam(sec);
+		} else {
+			/* multiple interfaces? */
+			hw_key_idx = key->keyidx;
+		}
+
+		if (hw_key_idx >= sec->total_cam_num) {
+			ret = -ENOSPC;
+			goto out;
+		}
+
 		/* need sw generated IV */
 		key->flags |= IEEE80211_KEY_FLAG_GENERATE_IV;
 		key->hw_key_idx = hw_key_idx;
