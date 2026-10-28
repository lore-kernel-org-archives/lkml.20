Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793197207;
	b=R/fYZJGhqMnFkDEZ1q3A7LIw9SkFNxg4RQtclm+jaMBp7cUoLXLfZiyKVlhA3k/+XImQ
	 QvwyToAU6yrhTSky+AKhtjBjIsshadEC4Fo6D0cK0hnIRx8u3Lrd5x//I9gfewh6gcXi7
	 YQs+UT+oV4pHL+xr962IY+egyyXwC19avQcBV6K6CrqjDze0+g6tX7Fcr3ZCVch264kT8
	 qIQiMudC4ukLJheLCvt6c0Eqp5dNUhNo6H34yvx48MKDT0LP1YFZTqHjqD7XAP/yzGBZC
	 FjWaoiXNWw1cbw3U0D+u9bBhtSENn0Jve91lHKWL5VTRM9yhRYFABOkQFkrwAoCt2oQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793197207;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=w0FuKmqjAAxc2G36lErL/3fM5DHNQeeC+jY9FSXhzZU=;
	b=5T4sgDYgxfMx8zoUaJxDUmafaxdS+w9LAturKEdyK9ZAXWygA60hvptXQ2z29R+u+bQx
	 AxD1HocbCkhXCUe5YcLH3ILCSUYBbA1P55QRrcLwC0PkNjlRqJVsI5/R8GEhemgqqB+rV
	 lz4sVeJc55IidZtlci5MCe8/Fbwhmh/Bsn6txOtvfUw9VXFpPXPpkuUD6qVDzUC6ZRmAp
	 Db5FYsf9lRvabb92SohjCcj/0Jk3+ni/4bRkrajOko13Ts7aYeMG/qBvsjXWAdg5YoGbF
	 FUdEQYoMQ/j6nAAh4qUngesfUKY0br4bIlzmi7m47r/Wzih9iL24fHNhdt53ZsACPzg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yCc+nva5;
	arc=none smtp.remote-ip=209.85.216.50
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52E44606A320
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 14:20:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 52E44606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yCc+nva5
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-3ae691283ecso145351a91.0
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 07:20:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793197207; x=1793802007; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=w0FuKmqjAAxc2G36lErL/3fM5DHNQeeC+jY9FSXhzZU=;
        b=yCc+nva5YiTEVaq1YUYP+cS7RYAm+YZnTgtCkpztxgFAzXPaQCUPS11qNaxU1ZJdDx
         mZQ9zZfEXvr4Oj8rXA413TUukEUjPx8KNgURIik6NBj4r7lfhYwE7X2oKrBL1dFM6cYi
         coLoKkiB3zzWvTHYWNG/AGTvRcm9zq7iMwJtyU2kciUOIE1HYo9HpSbDQvf3bToytnkh
         70LX2PQNSUGFNyYI3283IjlFu4XyOyxCMNMQBhBesmzXgRL/FephHrFIH5eEYuX9D9BE
         8d1nvq+QDrSiJTr4PxFa/4HaC7CUTYIB24uNkh17lrDNwRpBnWeH89F2tXlSLgfUWzeZ
         EiXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793197207; x=1793802007;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=w0FuKmqjAAxc2G36lErL/3fM5DHNQeeC+jY9FSXhzZU=;
        b=PEXEriQAkEJKQybZetiyEC6LK6H6ExHcaFK2X7SQKWZylE5xqUd1hxe2iSO3Py4KVR
         Fs/7dcwL98mZbh1GG52cOyJWVs1BA2rP4mfgMcgcuDbL6ViS2/17tX4zQh4WC+BZj3z8
         udPFRDvVXT/NmRisuViKFizQHFg6ouu1iYbTPHky02754w7G/6GlGmje+rXY4BXrZCe5
         AlE8c5Cd1/wkXKp2Vp4WQMgrRv17OUUpexNMu8TlGkEW7U2gqqlQJ/VLSZz+G4WbbZcI
         WWTJtHoRKf1ImF1QizztIDzJW3Di/HQKmGyaTsjCmDiFpg4Xlm5tLSs1/Ufc/q/SUAX3
         L92A==
X-Forwarded-Encrypted: i=1; AKwUvByzl9jNOJVU3AKLxHqY74DbH0EB/5Ut/C3QAcZ+e3YaFpjwWRctrKlOgzumms/MT5pokVHKhS32NIIHr/Q=@vger.kernel.org
X-Gm-Message-State: AFq9FYIrfrqPWy818f8LKOl+hr1Y6EQx9yZIgNZY/d77XzFQMIeGRXK6
	8MRknPZ6nxMy6rAA1+0dec69uicIWqLf89h3CkoeA7dsTU9m26CzOl9U
X-Gm-Gg: AYBFou0Py8lfroxUgnntKezFUHgEqBmGWVsCl/micyHzfhQ5WKSfzi3oQnxNaYEC4vh
	fJRxtTxidMMgNoie45nKBXJTcRI/bwx3P9vGZ+ynEcsnTuHdAWDnaODf27MXg4aMYIkzMursYhG
	6kdyITXPO1xzAN0UFCI+aY8rBY5/6latNekhjfjBES2jr4QZ0eJwU5LWJxs+4g4DLqGbEEP/rxk
	gEEFS1msKqiZE4isdwK2hFncgTa47YGSKaFCktw38DQHCFwT6baS9XQp+pzZCSc8BknziXd7ObG
	8EMGjAjdDQmHZIs3bvcsELrNDO2CbPEUlvdBGLRnv10g5BOck7Ybwb6iy9LcWCeuCDmVqskrG84
	+Ulou4TkB36D6qvkgesE5OcxzV49Iez8vsXZN0aJAlAsgSXiajwmvDGaosVOQCw7HmO/6gl6c3i
	m2NI+B35PInU4UxtY2R9kvU7eCnhSiK66sSDzyanWasIRc05RSU4XDhFLGQ6KPpHySUQ0yO7LqO
	G9TmQOCatf3zQTHBw4FzEmpg2d9zRhYwDisl+oSnzOIs2gimRArbneTReEgEsKW3eRYHMG7T1FV
	mkPiU8LCAB79xhO+bpMxOvFn1WknCDM6cgL2XbcYAErQZ7JctFLNiP/kbhJPybUIw1ZC
X-Received: by 2002:a17:90b:5150:b0:3ac:a6a5:5757 with SMTP id 98e67ed59e1d1-3ae5c801c2emr953367a91.11.1793197206400;
        Wed, 28 Oct 2026 07:20:06 -0700 (PDT)
Received: from KRHW1CJW23.bytedance.net ([139.177.225.227])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae5a9f286fsm3290141a91.15.2026.10.28.07.19.58
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 28 Oct 2026 07:20:06 -0700 (PDT)
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
Subject: [PATCH 2/3] wifi: rsi: report background scan start failures
Date: Wed, 28 Oct 2026 22:19:26 +0800
Message-ID: <20261028141927.9306-3-enderaoelyther@gmail.com>
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

rsi_mac80211_hw_scan_start() returns success when a background-scan
command cannot be prepared. The driver never marks the scan active in
that case, so neither cancellation nor the firmware-event path reports
completion and mac80211 keeps the request pending.

Build the probe request before queueing the start parameters, propagate
preparation errors, and clear the saved request before mac80211 frees it.
Successful scans keep the existing firmware command order.

LLM assistance was used to find the bug and review.

Fixes: 7fdcb8e12660 ("rsi: add support for hardware scan offload")
Cc: stable@vger.kernel.org
Signed-off-by: Zhao Li <enderaoelyther@gmail.com>
---
Validation: W=1 module builds with MODPOST passed with CONFIG_RSI_COEX
enabled and disabled. Not reproduced; RS9113/RS9116 hardware was
unavailable.
Sparse C=2 passed. Targeted Smatch introduced no new diagnostics.

 drivers/net/wireless/rsi/rsi_91x_mac80211.c | 14 ++++++++------
 drivers/net/wireless/rsi/rsi_91x_mgmt.c     | 13 ++++++++-----
 drivers/net/wireless/rsi/rsi_mgmt.h         |  3 +--
 3 files changed, 17 insertions(+), 13 deletions(-)

diff --git a/drivers/net/wireless/rsi/rsi_91x_mac80211.c b/drivers/net/wireless/rsi/rsi_91x_mac80211.c
index 27bfdb6affaf..a2e981e261d6 100644
--- a/drivers/net/wireless/rsi/rsi_91x_mac80211.c
+++ b/drivers/net/wireless/rsi/rsi_91x_mac80211.c
@@ -237,6 +237,7 @@ static int rsi_mac80211_hw_scan_start(struct ieee80211_hw *hw,
 	struct cfg80211_scan_request *scan_req = &hw_req->req;
 	struct rsi_hw *adapter = hw->priv;
 	struct rsi_common *common = adapter->priv;
+	int ret;
 
 	rsi_dbg(INFO_ZONE, "***** Hardware scan start *****\n");
 	common->mac_ops_resumed = false;
@@ -260,15 +261,16 @@ static int rsi_mac80211_hw_scan_start(struct ieee80211_hw *hw,
 
 	mutex_lock(&common->mutex);
 	common->hwscan = scan_req;
-	if (!rsi_send_bgscan_params(common, RSI_START_BGSCAN)) {
-		if (!rsi_send_bgscan_probe_req(common, vif)) {
-			rsi_dbg(INFO_ZONE, "Background scan started...\n");
-			common->bgscan_en = true;
-		}
+	ret = rsi_start_bgscan(common, vif);
+	if (ret) {
+		common->hwscan = NULL;
+	} else {
+		rsi_dbg(INFO_ZONE, "Background scan started...\n");
+		common->bgscan_en = true;
 	}
 	mutex_unlock(&common->mutex);
 
-	return 0;
+	return ret;
 }
 
 static void rsi_mac80211_cancel_hw_scan(struct ieee80211_hw *hw,
diff --git a/drivers/net/wireless/rsi/rsi_91x_mgmt.c b/drivers/net/wireless/rsi/rsi_91x_mgmt.c
index 9ceb6cba3546..165423313c5f 100644
--- a/drivers/net/wireless/rsi/rsi_91x_mgmt.c
+++ b/drivers/net/wireless/rsi/rsi_91x_mgmt.c
@@ -1862,11 +1862,8 @@ int rsi_send_bgscan_params(struct rsi_common *common, int enable)
 	return rsi_send_internal_mgmt_frame(common, skb);
 }
 
-/* This function sends the probe request to be used by firmware in
- * background scan
- */
-int rsi_send_bgscan_probe_req(struct rsi_common *common,
-			      struct ieee80211_vif *vif)
+/* Send the firmware commands that start a background scan. */
+int rsi_start_bgscan(struct rsi_common *common, struct ieee80211_vif *vif)
 {
 	struct cfg80211_scan_request *scan_req = common->hwscan;
 	struct rsi_bgscan_probe *bgscan;
@@ -1875,6 +1872,7 @@ int rsi_send_bgscan_probe_req(struct rsi_common *common,
 	u16 frame_len = sizeof(*bgscan);
 	size_t ssid_len = 0;
 	u8 *ssid = NULL;
+	int ret;
 
 	rsi_dbg(MGMT_TX_ZONE,
 		"%s: Sending bgscan probe req frame\n", __func__);
@@ -1928,6 +1926,11 @@ int rsi_send_bgscan_probe_req(struct rsi_common *common,
 	skb_put(skb, frame_len + probereq_skb->len);
 
 	dev_kfree_skb(probereq_skb);
+	ret = rsi_send_bgscan_params(common, RSI_START_BGSCAN);
+	if (ret) {
+		dev_kfree_skb(skb);
+		return ret;
+	}
 
 	return rsi_send_internal_mgmt_frame(common, skb);
 }
diff --git a/drivers/net/wireless/rsi/rsi_mgmt.h b/drivers/net/wireless/rsi/rsi_mgmt.h
index 236b21482f38..6a4907e6bca9 100644
--- a/drivers/net/wireless/rsi/rsi_mgmt.h
+++ b/drivers/net/wireless/rsi/rsi_mgmt.h
@@ -753,6 +753,5 @@ int rsi_send_ps_request(struct rsi_hw *adapter, bool enable,
 			struct ieee80211_vif *vif);
 void init_bgscan_params(struct rsi_common *common);
 int rsi_send_bgscan_params(struct rsi_common *common, int enable);
-int rsi_send_bgscan_probe_req(struct rsi_common *common,
-			      struct ieee80211_vif *vif);
+int rsi_start_bgscan(struct rsi_common *common, struct ieee80211_vif *vif);
 #endif
-- 
2.56.0

