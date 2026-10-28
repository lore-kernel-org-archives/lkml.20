Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793197145;
	b=tXvS+GR1fzExPg0qfxjP+gLrr2HKx+WN5hYsV3UDYT/CpgyBEfQSpSBkqTuh7EieoUrR
	 oMoLVaiOS8NkVq0uo2rIQe+5dc11CChwLdiIrFqvn/x1bHwqicRYJEz/I9vuBiwb9yAuV
	 GsyHjhpstQF/59ewtYM63aZkAon+bBQm8tu7CaUnIyHUgKNLEFBbKKL6nLe9vWe0VmtZb
	 Go/4/YJF5YnQBbsRqosiroaPDflxBPJVUgAqsZ6dm4POxOjg/J54E0IqhQhSSRncYsOck
	 QIpOip3GXORw55sFOuSCCbwQBOHpmjFYxkYS4QhiElQRk4gsYBeZZ2obdkL4j7/+Y9Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793197145;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=JBg8MLPlrE0fjPrOyLI8JRzxatJ5zVcZoGDssyVp73c=;
	b=RQ5zoumxWGXVr7gLLq+18meuTB5oorltSNBIhLkA1EQf7vOUSg5nnHXY1dBlCDVC+Qf9
	 SDMfuqxAtWhqIsF2z+U9p+KSOuPCzk9agtzCWpoje0iws1GxFMwcOuXr3tRjztDA9Epwm
	 dU4C8wjXXhqRHRfQnqwWGtqlQtLkJng8v9Fhu5E3gzmPGQ8r5/kK5A7UQSFnhCPyro8De
	 xaS4IJr0aLr0bNcpy+PzhRYuMB21dJAuwDlN8o6Y3oZ1pm+YTJJuLrRuFmiWPYpfsWE3U
	 pxGhplW+xzGgRGMnqCad2QomRzD8earU8hx1vsu2MxLhmj794IDY3jScHVVJVywQgaw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nVvzS0cC;
	arc=none smtp.remote-ip=209.85.215.172
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B490960A2605
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 14:19:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B490960A2605
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nVvzS0cC
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-cd6028ff33fso584027a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 07:19:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793197144; x=1793801944; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JBg8MLPlrE0fjPrOyLI8JRzxatJ5zVcZoGDssyVp73c=;
        b=nVvzS0cCAcsPi1aoEMGZ6fwt7Q1PvWG0cUwqP9ijYueVsaXUPH+RLO7Db3Qw7Paw3H
         LgzMPIOgHpmTpJ/UlWh4O9S5pgNDWOKWXvY1OLQEitXmAT53YR2xirH3EV3OTeMuYz8+
         AlE+eLRej3ixe/qmP1ooD5IrzTnll1fKVxklyAsqaY33eQYDwMygEKb33J79v2ydYkAH
         cCvFSQt32Hh20D86ytYH24x/XcllCFd9YQEQhqUhehnnHjUG/NJFV/9ufSFTtnpWgi6c
         HFZ3ElkDrfo2G9o53XQjrwZJtZ8MamNCO7OQMT9IaunybfF8PtF5B7wkiu00eguMeONP
         V9mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793197144; x=1793801944;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JBg8MLPlrE0fjPrOyLI8JRzxatJ5zVcZoGDssyVp73c=;
        b=UfuMsBI1QTdhVHRsrMucVdyPIFRVhBAQR9GDZGwykvaq3xC7q/HTyAnokGuQ7Cc8pj
         SSxdmgm0hz/IQlPPQLRHBRi5Gmb5LANMkpFof5xuEGlG70iPq4cr61bmQx+fWCTuaMQS
         TWghcDyWWpREu71PlJdnQFOCYYrTbtLEiQxq4fRe6qeXG6AvkBeu4b3f66bZ4HZZBOVX
         m+lMrAoNQSvxSPQpnvUk0bzvH8EMWj9jo1RZ2Tdwx8QBUSWrja3fIpl0hHmh9R0AzNHJ
         DNBBlZjAp5U+KuBFgLbGG2ZvXXpK7kgdvgQDjG1PoCyvLBdJUdyr/qFlsKMn5tF3isLI
         A5bw==
X-Forwarded-Encrypted: i=1; AKwUvBzW2B3SLe9yRBoEM+K88vfPtjYftraZhvaCIKlKZ4I28OmPpK5BZK7itPMTdJnOQa+dCiaETJGxQsUsaDw=@vger.kernel.org
X-Gm-Message-State: AFq9FYK75mZ95QMgCkBZopFjOKXEUWNa+1rgZx3ZOWinDg7050zd8sat
	sgkLT1y9h3KpZkbgj/3DwMlhiu/RXBJDhsghpewtqoa6tBiIsj8SPRVX
X-Gm-Gg: AYBFou07IUD4BOBeHhf/Ih4oqmFSLUfgIh3Hx2gvD2r0jBtm4ZSVJU/pzRruhZjeX4e
	j8xdtiGOZeMkh3mzDPbyWHvuG2WTH4htEc+jOJPhrWfXufopEtB5Qk4UtNbOT+4wdmVbqkVe7l5
	UJ6cpM4rNydEpUBsll7SM4ySV5+HsEVU5xhiCSOFuV1JzD64OGugG4zSWMZ5HwCsg4dAvP3TR18
	ohrZq2eb5/IfSD7yDO8T8HCnIxjvfCbRyo+eQGfuRv0BYHnZhYF/1Idb/AKq7iXOZsqoidGQqhT
	XMmNmWa0UDsOiTIugHWK3A5KP5y1cZw6ISY0czV+eWCrqXtjXhN5JwWvkCu/AUno58uZvybQvnh
	QTVXD/ATU9atq/7BHFlFJOggiLwSRBQP8JdINAWeNfnSezXnVjTO8QbDGz8+DeVyj70NMTyahm1
	N7jxZc73zTflDUSFLzX7tsd+e2vkBbjmQu/4a9zToaygmcW8iLtF1+b1xrHulVFqCHQqqfKYRs2
	8+iM9T6e47y15hvPAhduW+3Is+x3p3i7o1Cru9NVfY7uNKuM40d15lMrZVGOI6+nEGYub4LxFR9
	5XR9Qp7Ar8QRaNuV4jlf6CX7BpyWScdw46AGn0nXkvXiRzUrv8bHifjihI+T9BWAVNRs
X-Received: by 2002:a17:90b:5628:b0:3ad:6781:da66 with SMTP id 98e67ed59e1d1-3ae5816f4e2mr1764279a91.23.1793197143876;
        Wed, 28 Oct 2026 07:19:03 -0700 (PDT)
Received: from KRHW1CJW23.bytedance.net ([139.177.225.227])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae5a0482e9sm3437223a91.0.2026.10.28.07.18.58
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 28 Oct 2026 07:19:03 -0700 (PDT)
From: Zhao Li <enderaoelyther@gmail.com>
To: Jeff Chen <jeff.chen_1@nxp.com>
Cc: Francesco Dolcini <francesco@dolcini.it>,
	Johannes Berg <johannes@sipsolutions.net>,
	Arend van Spriel <arend.vanspriel@broadcom.com>,
	Jiangshan Yi <yijiangshan@kylinos.cn>,
	Linmao Li <lilinmao@kylinos.cn>,
	Kees Cook <kees+treewide@kernel.org>,
	Rosen Penev <rosenp@gmail.com>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable+noautosel@kernel.org
Subject: [PATCH 4/4] wifi: nxpwifi: stop AP when delayed channel switch fails
Date: Wed, 28 Oct 2026 22:18:19 +0800
Message-ID: <20261028141819.7556-5-enderaoelyther@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261028141819.7556-1-enderaoelyther@gmail.com>
References: <20261028141819.7556-1-enderaoelyther@gmail.com>
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

A delayed AP channel switch can fail while stopping the BSS, programming
the new beacon, or restarting the AP. The worker returns without notifying
cfg80211, and traffic can remain enabled over a stopped BSS when the
request did not set block_tx.

An earlier stop failure can also clear the driver's AP configuration while
cfg80211 still considers the AP running. A following channel switch then
reaches the worker without a beacon period and is discarded.

Disable carrier and the TX queues, retain the channel-switch state, and
request interface shutdown on all four failures. Keeping the state until
the stop path cancels it prevents another switch from starting while
shutdown is pending.

LLM assistance was used to find the bug and review.

Fixes: 73b01e57ed3e ("wifi: nxp: add nxpwifi driver for IW61x")
Cc: <stable+noautosel@kernel.org> # depends on the beacon ownership backport
Signed-off-by: Zhao Li <enderaoelyther@gmail.com>
---
Validation: A W=1 module build with MODPOST passed. Not
reproduced; IW61x hardware was unavailable.
Sparse C=2 passed. Targeted Smatch introduced no new diagnostics.
All four patches apply without changes to v7.3.
Stable pickup is disabled because this patch depends on that backport.
Persistent firmware-command failure recovery was not exercised. The patch
disables TX and requests interface shutdown; it does not prove that cfg80211
and firmware state converge if stop_ap() also fails.

 drivers/net/wireless/nxp/nxpwifi/11h.c | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/drivers/net/wireless/nxp/nxpwifi/11h.c b/drivers/net/wireless/nxp/nxpwifi/11h.c
index a6c87dfad9ee..1341c9015ea4 100644
--- a/drivers/net/wireless/nxp/nxpwifi/11h.c
+++ b/drivers/net/wireless/nxp/nxpwifi/11h.c
@@ -300,22 +300,22 @@ void nxpwifi_dfs_chan_sw_work(struct wiphy *wiphy, struct wiphy_work *work)
 	bss_cfg = &priv->bss_cfg;
 	if (!bss_cfg->beacon_period) {
 		nxpwifi_dbg(adapter, ERROR,
-			    "channel switch: AP already stopped\n");
-		goto out;
+			    "channel switch: AP configuration is missing\n");
+		goto stop_iface;
 	}
 
 	if (nxpwifi_send_cmd(priv, HOST_CMD_UAP_BSS_STOP,
 			     HOST_ACT_GEN_SET, 0, NULL, true)) {
 		nxpwifi_dbg(adapter, ERROR,
 			    "channel switch: Failed to stop the BSS\n");
-		goto out;
+		goto stop_iface;
 	}
 
 	if (nxpwifi_cfg80211_change_beacon(adapter->wiphy, priv->netdev,
 					   priv->ap_update_info)) {
 		nxpwifi_dbg(adapter, ERROR,
 			    "channel switch: Failed to set beacon\n");
-		goto out;
+		goto stop_iface;
 	}
 
 	nxpwifi_uap_set_channel(priv, bss_cfg, priv->dfs_chandef);
@@ -323,7 +323,7 @@ void nxpwifi_dfs_chan_sw_work(struct wiphy *wiphy, struct wiphy_work *work)
 	if (nxpwifi_config_start_uap(priv, bss_cfg)) {
 		nxpwifi_dbg(adapter, ERROR,
 			    "Failed to start AP after channel switch\n");
-		goto out;
+		goto stop_iface;
 	}
 
 	nxpwifi_dbg(adapter, MSG,
@@ -337,7 +337,13 @@ void nxpwifi_dfs_chan_sw_work(struct wiphy *wiphy, struct wiphy_work *work)
 		priv->uap_stop_tx = false;
 	}
 
-out:
 	kfree(priv->ap_update_info);
 	priv->ap_update_info = NULL;
+	return;
+
+stop_iface:
+	netif_carrier_off(priv->netdev);
+	nxpwifi_stop_net_dev_queue(priv->netdev, adapter);
+	priv->uap_stop_tx = true;
+	cfg80211_stop_iface(wiphy, &priv->wdev, GFP_KERNEL);
 }
-- 
2.56.0

