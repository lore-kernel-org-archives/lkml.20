Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793197215;
	b=1afjgDA1BvoltsNvHOwoSs+TVnjHv40gTsQLNXvcttTkOJvCWXYYlJwbbwx1rwKVKXyn
	 qDTpQ4BcTxYPdqL0sEJfQd5lDqgWD2Pm4UQFUEYBF2HgOBMy1oS0k+YqTKazrf/evqwhb
	 kCmNX9gzj7WL+wSLHGUWIUi4/9ELGMNpsnFIpw8/klu80/CxNhixem2eZ7j70zMvfAXY/
	 m5RVC6l3xNz+xVYoaGOiwRZFAltqwKGEd7N2g0k6UYdN3vV6jidRhfU9gZ9qMYqSfhfj1
	 E2AdooDkAKU3QZ+P7QLKyxJwUgKXYZh4OOPfqtsj1IA7AbdNp+/WZRRXnUDGYGAN8Tg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793197215;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=SgNj/pzQLmQvOonHYZEQH+dwdrtpqg30CRf+0Qq4LmA=;
	b=vTdaVwHIrLgbyDyGDGRFLiKBxkHa8fOlhGaDCCz8kU5saDu1IFgsDy2zJR9Jx8+RvlcO
	 Qd8lgs3WXl8XkEn8p7RhQrs+zfoSa/CHtHiix51cnarqTfdRZcOnmjxX8CrJS9Wsa278r
	 gU1sdTigZ3752rmwfuiaL0LIQK637/LtTOjIJJZDmA4Gv4lBWs8j718U5eEjpaxq4t8+o
	 cMPAbDqmw54ZgD+pkOQd6CdvImtsLXq554FedgxHWLAiVidpc5Mj59qO1wcCNsoWmIpdg
	 2ED6YkaxkjpdsyRFuwpxmdJU05Yrr9GgTH9z4O6yJPpG5Fie7iv0DKZltrPC6ZYc+eQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Wf4mH2x+;
	arc=none smtp.remote-ip=209.85.216.41
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A8B3606A320
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 14:20:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4A8B3606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Wf4mH2x+
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-3ad41b47541so875672a91.1
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 07:20:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793197215; x=1793802015; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SgNj/pzQLmQvOonHYZEQH+dwdrtpqg30CRf+0Qq4LmA=;
        b=Wf4mH2x+hWQ9EKpKV2bo2gNtu59egwucXiOyAlIiJeteJF7EHrJwMd7VWcdrWJGXGP
         Z8W5cWyA2BuZhr0l8QLwMmslYPP7M19Luc4tD+8Halz0M8LXyROprlbV8qyK+quTKmpm
         bt7qEgkXbDTKe9ygo1FOdMzHnzdMl8q+HXAUHGID0bWEXNj9RJJ5RX8F79TFDaNc3cdw
         S05cPsgUMVLT2Mw8nNKHXnzSZq3CZPcJ69ZWki20lEgfIpywMkZznYpEqexSeqrBOynH
         yjmicmuPmIsDFGFN6K986rhcWb+FLVJzZ2oa8Q9DEDRHkECbNfZFTdP+ytcVl6uUKsoO
         KsqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793197215; x=1793802015;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SgNj/pzQLmQvOonHYZEQH+dwdrtpqg30CRf+0Qq4LmA=;
        b=04aPxiStN4MoNwnsqohcX1Czn3zF6awJeptx08cMpe3hHj3goJ+Hc9bz0QGFt/5MbA
         4czpp6BBU4jbNlB9y5cgfSWpNeXwuFPhvArEjbw3gTzW4/H3boXva22vMN39Oi1J8qfF
         s4gxj7HwNYahFOCpSS4/fRDvrG0KCKv/8TVyOt/8WwJRul0kHOfAVOfKgY7CKFjzHB61
         EmmFW7Xr8SFLCWqfWdZYQl1TMGhz/wkrf/m7VtUK71QeKF91BfihgSdsOqnAi2Ocz4Wl
         mxu0E+k8QSZO4QGo/B0g+dPPBN91gIKX1Hvcd7UlWoCPmiwrA3za3rUekgMVIuhMQNsD
         zkGA==
X-Forwarded-Encrypted: i=1; AKwUvBxh+cEhtRDfiEoOmaXmxTGF19uwRf7K58Bgi54YuLJU46I5+GdP38/gR2YjSnO8FXMpOXciHNuqHpMTke0=@vger.kernel.org
X-Gm-Message-State: AFq9FYLjSH34eUnyJCHUCFR7Ou2PPp/vD4gmWWOE2iMEBSMJOPf3pvd4
	WXw4dVLtOms3gNuujS/bGm6FktM5V8ti/klqBsdQHTAST3+sg6H2Saeb
X-Gm-Gg: AYBFou274tSTJzUQiEIlCVmnt1Jc+NeNVb72GfIn0E/ZN9WdhlEPFFq1v8hZcQGLN9T
	cbYdKfEB73tTfwygH+cm1sBKItHEPkxObhO/7MpTC9OhsAoq6UJF2+6YVXU4OaNMdkTWyPyhu8U
	BuC2meLB3W/AqgbuiytyHNU2JkpZnCh7kP39oLB/rBGpqcyKNjBcRL5GDDVO/RJRdVUdTiPV+bt
	LY0EnrgmtrZ/CnBPbG2qZ9VXcqd6+T9Q0tmYic+Vjt50x+NqPEJeP1WQeCJjuMRPC9pS6OVEVQr
	nR3T8AMwMumM/P6UvUkIZ6l9pyIV5IgBDe8ttd9cACkn/Xa0ekLm/8aSvNbnhYMjc+rctNHGFJi
	jgtARj7fzoS7023e+hOaNzkA/AZIBuZ8mWbmydU7fqxgTqKWe+LU1AF26+FuBml7I0//YZqj5VC
	VQwccW7znnP86E6ffEJgixnrLIwjy4COTWqEDZnE0C6KM4H6o6qlUUm2lv1TEzTFXaPLx22etBN
	DSVeBYLFthEhmDIWuGkf76bfA1p4GLC7shCIrdJylDoccXPU+nZUqK/bbxzzr8VFM9y9OazeV81
	6CZLEr+iu7+xuYcHkOGbLW5xRP0a3VIIqqKUhcHE954Tq52hGpKmW8QZ7oxQyhAa4oGO
X-Received: by 2002:a17:90b:54c5:b0:3ac:9c37:9430 with SMTP id 98e67ed59e1d1-3ae5819e5a4mr1948616a91.21.1793197214381;
        Wed, 28 Oct 2026 07:20:14 -0700 (PDT)
Received: from KRHW1CJW23.bytedance.net ([139.177.225.227])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae5a9f286fsm3290141a91.15.2026.10.28.07.20.06
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 28 Oct 2026 07:20:13 -0700 (PDT)
From: Zhao Li <enderaoelyther@gmail.com>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>,
	Arend van Spriel <arend.vanspriel@broadcom.com>,
	Ville Nummela <ville.nummela@kempower.com>,
	Jiangshan Yi <yijiangshan@kylinos.cn>,
	Marek Vasut <marex@nabladev.com>,
	=?UTF-8?q?Toke=20H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>,
	Stefan Hansson <newbyte@postmarketos.org>,
	Ping-Ke Shih <pkshih@realtek.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Ethan Nelson-Moore <enelsonmoore@gmail.com>,
	Pengpeng Hou <pengpeng@iscas.ac.cn>,
	Prameela Rani Garnepudi <prameela.j04cs@gmail.com>,
	Siva Rebbagondla <siva.rebbagondla@redpinesignals.com>,
	Kalle Valo <kvalo@kernel.org>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH 3/3] wifi: rsi: serialize background scan state
Date: Wed, 28 Oct 2026 22:19:27 +0800
Message-ID: <20261028141927.9306-4-enderaoelyther@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261028141927.9306-1-enderaoelyther@gmail.com>
References: <20261028141927.9306-1-enderaoelyther@gmail.com>
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

The firmware completion event runs in the RX thread without
common->mutex, while scan cancellation can clear hwscan under that mutex.
Both paths test bgscan_en before sending STOP and reporting completion.
An interleaving can therefore dereference a NULL or freed request in
rsi_send_bgscan_params(), or report the scan twice.

The RX path cannot take common->mutex: rsi_mac80211_start() holds it while
waiting for that path to finish firmware initialization after
hibernation.

Add a scan-specific mutex and use it to serialize start, cancellation,
and firmware completion. Clear bgscan_en and hwscan together even when
STOP cannot be queued so a later event cannot report the same scan again.

LLM assistance was used to find the bug and review.

Fixes: 7fdcb8e12660 ("rsi: add support for hardware scan offload")
Cc: stable@vger.kernel.org
Signed-off-by: Zhao Li <enderaoelyther@gmail.com>
---
Validation: W=1 module builds with MODPOST passed with CONFIG_RSI_COEX
enabled and disabled. Not reproduced; RS9113/RS9116 hardware was
unavailable.
Sparse C=2 passed. Targeted Smatch introduced no new diagnostics.
Host state is serialized, but no hardware or protocol evidence established
how a late event from a scan whose STOP command was not queued is attributed
after a later scan starts.

 drivers/net/wireless/rsi/rsi_91x_mac80211.c | 31 +++++++++++++++------
 drivers/net/wireless/rsi/rsi_91x_main.c     |  1 +
 drivers/net/wireless/rsi/rsi_91x_mgmt.c     | 16 +++++++----
 drivers/net/wireless/rsi/rsi_main.h         |  2 ++
 4 files changed, 36 insertions(+), 14 deletions(-)

diff --git a/drivers/net/wireless/rsi/rsi_91x_mac80211.c b/drivers/net/wireless/rsi/rsi_91x_mac80211.c
index a2e981e261d6..5617c7ef6196 100644
--- a/drivers/net/wireless/rsi/rsi_91x_mac80211.c
+++ b/drivers/net/wireless/rsi/rsi_91x_mac80211.c
@@ -249,15 +249,21 @@ static int rsi_mac80211_hw_scan_start(struct ieee80211_hw *hw,
 	    scan_req->n_channels == 0)
 		return -EINVAL;
 
+	mutex_lock(&common->scan_mutex);
+
 	/* Scan already in progress. So return */
-	if (common->bgscan_en)
-		return -EBUSY;
+	if (common->bgscan_en) {
+		ret = -EBUSY;
+		goto out;
+	}
 
 	/* If STA is not connected, return with special value 1, in order
 	 * to start sw_scan in mac80211
 	 */
-	if (!vif->cfg.assoc)
-		return 1;
+	if (!vif->cfg.assoc) {
+		ret = 1;
+		goto out;
+	}
 
 	mutex_lock(&common->mutex);
 	common->hwscan = scan_req;
@@ -270,6 +276,9 @@ static int rsi_mac80211_hw_scan_start(struct ieee80211_hw *hw,
 	}
 	mutex_unlock(&common->mutex);
 
+out:
+	mutex_unlock(&common->scan_mutex);
+
 	return ret;
 }
 
@@ -283,16 +292,20 @@ static void rsi_mac80211_cancel_hw_scan(struct ieee80211_hw *hw,
 	};
 
 	rsi_dbg(INFO_ZONE, "***** Hardware scan stop *****\n");
-	mutex_lock(&common->mutex);
+	mutex_lock(&common->scan_mutex);
 
 	if (common->bgscan_en) {
-		if (!rsi_send_bgscan_params(common, RSI_STOP_BGSCAN))
-			common->bgscan_en = false;
+		mutex_lock(&common->mutex);
+		if (rsi_send_bgscan_params(common, RSI_STOP_BGSCAN))
+			rsi_dbg(ERR_ZONE, "Failed to stop background scan\n");
+		mutex_unlock(&common->mutex);
+		common->bgscan_en = false;
+		common->hwscan = NULL;
 		ieee80211_scan_completed(adapter->hw, &info);
 		rsi_dbg(INFO_ZONE, "Back ground scan cancelled\n");
 	}
-	common->hwscan = NULL;
-	mutex_unlock(&common->mutex);
+
+	mutex_unlock(&common->scan_mutex);
 }
 
 /**
diff --git a/drivers/net/wireless/rsi/rsi_91x_main.c b/drivers/net/wireless/rsi/rsi_91x_main.c
index 2ce514766620..16f57c964ca3 100644
--- a/drivers/net/wireless/rsi/rsi_91x_main.c
+++ b/drivers/net/wireless/rsi/rsi_91x_main.c
@@ -325,6 +325,7 @@ struct rsi_hw *rsi_91x_init(u16 oper_mode)
 
 	rsi_init_event(&common->tx_thread.event);
 	mutex_init(&common->mutex);
+	mutex_init(&common->scan_mutex);
 	mutex_init(&common->tx_lock);
 	mutex_init(&common->rx_lock);
 	mutex_init(&common->tx_bus_mutex);
diff --git a/drivers/net/wireless/rsi/rsi_91x_mgmt.c b/drivers/net/wireless/rsi/rsi_91x_mgmt.c
index 165423313c5f..5f11de44f880 100644
--- a/drivers/net/wireless/rsi/rsi_91x_mgmt.c
+++ b/drivers/net/wireless/rsi/rsi_91x_mgmt.c
@@ -2107,17 +2107,23 @@ static int rsi_handle_ta_confirm_type(struct rsi_common *common,
 		rsi_dbg(INFO_ZONE, "Wakeup/Sleep confirmation.\n");
 		return rsi_handle_ps_confirm(adapter, msg);
 
-	case BG_SCAN_PROBE_REQ:
+	case BG_SCAN_PROBE_REQ: {
+		struct cfg80211_scan_info info = {};
+
 		rsi_dbg(INFO_ZONE, "BG scan complete event\n");
+		mutex_lock(&common->scan_mutex);
 		if (common->bgscan_en) {
-			struct cfg80211_scan_info info = {};
-
-			if (!rsi_send_bgscan_params(common, RSI_STOP_BGSCAN))
-				common->bgscan_en = 0;
+			if (rsi_send_bgscan_params(common, RSI_STOP_BGSCAN))
+				rsi_dbg(ERR_ZONE,
+					"Failed to stop background scan\n");
+			common->bgscan_en = false;
+			common->hwscan = NULL;
 			ieee80211_scan_completed(adapter->hw, &info);
 		}
+		mutex_unlock(&common->scan_mutex);
 		rsi_dbg(INFO_ZONE, "Background scan completed\n");
 		break;
+	}
 
 	default:
 		rsi_dbg(INFO_ZONE, "%s: Invalid TA confirm pkt received\n",
diff --git a/drivers/net/wireless/rsi/rsi_main.h b/drivers/net/wireless/rsi/rsi_main.h
index dcf8fb40698b..5fa8fd93a17e 100644
--- a/drivers/net/wireless/rsi/rsi_main.h
+++ b/drivers/net/wireless/rsi/rsi_main.h
@@ -250,6 +250,8 @@ struct rsi_common {
 	struct completion wlan_init_completion;
 	/* Mutex declaration */
 	struct mutex mutex;
+	/* Protect background scan state. */
+	struct mutex scan_mutex;
 	/* Mutex used for tx thread */
 	struct mutex tx_lock;
 	/* Mutex used for rx thread */
-- 
2.56.0

