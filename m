Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793197139;
	b=HwGXI/O2BprvV9ftk5Z9ebEm6bghd8tvgRkd1QbN/JI/cd37DozGrOA636uJaHBnamiL
	 p9liBwWaJEXeQOiCkdscVoDImZBgF97hlsdMK7KDyIfZo+eHGGnXCtEE/qfQK/bRAzVaw
	 DRyUpcWrN6JUd+bI+oUf7OKZPfpr36T0HkMD9ekIbWHx5904Tct36M2MwmlVVubHSIE94
	 k+YveY9CoWNMFEkLtSQJbZedSowcN0YhL318XsO3GFJcP5IsZefk9k61Dy+gTMJcfOlN1
	 08hsSKdUU4WwQKcgG4DgdLpMQWFjdWMdZ+EgZsCQtZ8s5vP5cP2P1IOvi5qvgYzV3lw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793197139;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=LHr+5LuPUH4WKhQvQe23ezYiQzLi+DWK96XgKvgjPTk=;
	b=XC+lB1xvo8wE+Jl3lu63F3j/CvpXc8Z4FRRJkiQ/vrX+blQRaegjXI+hShbxLLZ/sq0m
	 pR5oTnYq+R4KGgJmMN34/IIj4a69Z8QpL4TUqLzpjm+cPZdZqtwq/usT/UAAQY/ljML8C
	 knTo6jTIRXvodvSft0WWbwG4KjNosbNvIueswMOkfjA3DdMwl7mhj4F6XYGM90BCOb3W4
	 LoQFfStN8hRw7bAKd0aN6qiAqqADvqyrdDcacDGpDPX+4900qtN0GiEu7mv8HFZPS8zT2
	 426Nyr8fShHjCliE2Cp0x15AwyCpoOJ7zFP4GeP2Y89yX6rJSqtK/3DuGas7/fS89ng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KtIXE1DX;
	arc=none smtp.remote-ip=209.85.216.45
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7150606A33A
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 14:18:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B7150606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KtIXE1DX
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-3ab2cb8d577so850364a91.1
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 07:18:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793197138; x=1793801938; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LHr+5LuPUH4WKhQvQe23ezYiQzLi+DWK96XgKvgjPTk=;
        b=KtIXE1DX1F0tWyx0hE/bzSbzeEIRA3/jLysQt5rcxEmvt5hNDqlv8GbEKvs98gXhfY
         58an67A54fFwn4WH8Uy51JC4QR9nmzu8NpO+o1+gZ6KITro3O3M3qG452tWh1uuHXDWC
         1lgQ4oeT3cGB6CKTQKDn6BLVL3O6PhlNSlNM8buS9JXXfJ4M+zg0BEtL5ww+SkI0+WdQ
         YtHNhq3pOoc0w31id3m+ryUmvVPAJ57nCxJXbtYUEtknVB41Euiwc9FCRQVKKlY+VLU0
         /scO48u1FoPAxzCVwXrzas/Q3rl1Tx/HAfecB0oGn/cwgEAyUSDBsQUeF7GKd5qOgDMi
         B21w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793197138; x=1793801938;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=LHr+5LuPUH4WKhQvQe23ezYiQzLi+DWK96XgKvgjPTk=;
        b=lFz234t7r67oj4jWf3IlNHKwdz7mxliraaKhmP5tGl2aHaVG/p9tCCK74J2O9cFX3h
         YSAKYInNAnzHYwivR2wqo1j8/Xk/Cg23BI+YMt5jE2x+kxYOMSs73c/GXa+BI9ZkHQuu
         lhRx3vgkYnlkSgs1NhMegtgTjntSbLSZHkOX+Na+lbg8Pa8nEcLDU8nNdQWhmIeE5Fm9
         9P9UveQAInIlVNfM28fOHjDX1Drt/YLmKch+2aob5DfKZgQO9dr0cyFF+EQS5TDxuqIq
         ysU942uqzPjDx6Q/PbQHG3aO9whyR9pnk3wqD2zSCjgTN/mxEZElZM0PYUPNiB1TOcYk
         So6Q==
X-Forwarded-Encrypted: i=1; AKwUvByg54tNSCay+WTx855xyxWG79k0Yc8KB1xK6SdUJWS4G3nTpYLiPyL2PUZexgcySxi8svSVoAy7sGAb0so=@vger.kernel.org
X-Gm-Message-State: AFq9FYKXo0i6xjFAVods1RFQBC/xMh5zKH0MmlA3b5nhEhwoFi7qVNt9
	nV9ArBJyWWeUsiyfvjf3hHMvED2C3uXErslNlQz5KzNS5RFDY6k4hBJr
X-Gm-Gg: AYBFou0UNtRIEG4G30QnnFUjnlS+7AYtHm2ARQ1/FW8CemRNWu6cD+YK8RKgoFLj94u
	wlM5EK0GjG7OYLg5nFDeOoWL9xEAHurphJuRKMbbwkr/KiQ5xbCOnD8u3w9pRIr70GtWRr/Ch0W
	lXUR1+06mlPUfiurBjPRXUfUEj5E6HbVwd88J78qd7aboRjAo7R6jn8lwt4B+sQlDgB+JrpSC4v
	3mrM11IRvLgsRavN8YYPkIVsZMj75EekrNhENgj2Q+RpA3vpHYhHQAicMheYzFND8KqEcQMvYKF
	m9ZOQW76ltSep7WcM7ImORBFLGL5oiSsY0Es8jJVKcFG1qe1i8JtQh+Tnq2LpM1KTxh3KsaSACm
	MhdFC4Rtv6wO1z1tpH3pzzOhgdD5Xx/D7vQyDoVz8ccqrg4Qi3Vg1vxRfQQcdoBCEdLifX3cfIL
	LCAskGfqjPcMMalAgzl5ZD6j89sjxBYT96+eNBIhgTNS5OLIoRP8PKMQlk3cMnnu3VyX5A8zBn6
	wtvN3HuWUOqjmY6EBERwMrua4mAmLvRxrcaD2yxp0OsvvfIPrxIGIPBysw9caCwEbNOC3V+GqyI
	kAngPElV7WiIPTYxhjNc8pXeW2ky+78q4NYxk4nm5xDW+W4B/a0CL52CGrAae1FgEbzy
X-Received: by 2002:a17:90b:528d:b0:3a8:c0cd:57fa with SMTP id 98e67ed59e1d1-3ae57f65a72mr1968312a91.11.1793197137721;
        Wed, 28 Oct 2026 07:18:57 -0700 (PDT)
Received: from KRHW1CJW23.bytedance.net ([139.177.225.227])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae5a0482e9sm3437223a91.0.2026.10.28.07.18.52
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 28 Oct 2026 07:18:57 -0700 (PDT)
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
Subject: [PATCH 3/4] wifi: nxpwifi: own beacon data used by channel switch work
Date: Wed, 28 Oct 2026 22:18:18 +0800
Message-ID: <20261028141819.7556-4-enderaoelyther@gmail.com>
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

Channel-switch work passes beacon data to nxpwifi_set_mgmt_ies() after
the cfg80211 callback returns, but the driver retains only a shallow copy
of pointers into the request. The request storage can be freed before the
delayed work runs.

The IE parser can then read freed memory. Stale bytes that pass its
element checks can be copied into management-IE commands sent to firmware.

Deep-copy the four beacon buffers consumed by nxpwifi_set_mgmt_ies() into
an owned cfg80211_ap_update. Keep the existing change_beacon path, reject
overlapping switches while the update is owned, and release it when the
work finishes or is canceled.

LLM assistance was used to find the bug and review.

Fixes: 73b01e57ed3e ("wifi: nxp: add nxpwifi driver for IW61x")
Cc: <stable+noautosel@kernel.org> # needs a smaller backport
Signed-off-by: Zhao Li <enderaoelyther@gmail.com>
---
Validation: A W=1 module build with MODPOST passed. Not
reproduced; IW61x hardware was unavailable.
Sparse C=2 passed. Targeted Smatch introduced no new diagnostics.
All four patches apply without changes to v7.3.
This 144-line hunk-body diff exceeds the stable tree's 100-line limit, so a
smaller reviewed backport is needed.

 drivers/net/wireless/nxp/nxpwifi/11h.c      | 14 +++--
 drivers/net/wireless/nxp/nxpwifi/cfg80211.c | 58 ++++++++++++++++++++-
 drivers/net/wireless/nxp/nxpwifi/main.h     |  2 +-
 3 files changed, 66 insertions(+), 8 deletions(-)

diff --git a/drivers/net/wireless/nxp/nxpwifi/11h.c b/drivers/net/wireless/nxp/nxpwifi/11h.c
index 058c319ff910..a6c87dfad9ee 100644
--- a/drivers/net/wireless/nxp/nxpwifi/11h.c
+++ b/drivers/net/wireless/nxp/nxpwifi/11h.c
@@ -301,21 +301,21 @@ void nxpwifi_dfs_chan_sw_work(struct wiphy *wiphy, struct wiphy_work *work)
 	if (!bss_cfg->beacon_period) {
 		nxpwifi_dbg(adapter, ERROR,
 			    "channel switch: AP already stopped\n");
-		return;
+		goto out;
 	}
 
 	if (nxpwifi_send_cmd(priv, HOST_CMD_UAP_BSS_STOP,
 			     HOST_ACT_GEN_SET, 0, NULL, true)) {
 		nxpwifi_dbg(adapter, ERROR,
 			    "channel switch: Failed to stop the BSS\n");
-		return;
+		goto out;
 	}
 
 	if (nxpwifi_cfg80211_change_beacon(adapter->wiphy, priv->netdev,
-					   &priv->ap_update_info)) {
+					   priv->ap_update_info)) {
 		nxpwifi_dbg(adapter, ERROR,
 			    "channel switch: Failed to set beacon\n");
-		return;
+		goto out;
 	}
 
 	nxpwifi_uap_set_channel(priv, bss_cfg, priv->dfs_chandef);
@@ -323,7 +323,7 @@ void nxpwifi_dfs_chan_sw_work(struct wiphy *wiphy, struct wiphy_work *work)
 	if (nxpwifi_config_start_uap(priv, bss_cfg)) {
 		nxpwifi_dbg(adapter, ERROR,
 			    "Failed to start AP after channel switch\n");
-		return;
+		goto out;
 	}
 
 	nxpwifi_dbg(adapter, MSG,
@@ -336,4 +336,8 @@ void nxpwifi_dfs_chan_sw_work(struct wiphy *wiphy, struct wiphy_work *work)
 		nxpwifi_wake_up_net_dev_queue(priv->netdev, adapter);
 		priv->uap_stop_tx = false;
 	}
+
+out:
+	kfree(priv->ap_update_info);
+	priv->ap_update_info = NULL;
 }
diff --git a/drivers/net/wireless/nxp/nxpwifi/cfg80211.c b/drivers/net/wireless/nxp/nxpwifi/cfg80211.c
index 0f7720df0304..5305eda83fa0 100644
--- a/drivers/net/wireless/nxp/nxpwifi/cfg80211.c
+++ b/drivers/net/wireless/nxp/nxpwifi/cfg80211.c
@@ -1639,6 +1639,8 @@ static int nxpwifi_cfg80211_stop_ap(struct wiphy *wiphy, struct net_device *dev,
 	int ret;
 
 	wiphy_delayed_work_cancel(wiphy, &priv->dfs_chan_sw_work);
+	kfree(priv->ap_update_info);
+	priv->ap_update_info = NULL;
 	nxpwifi_abort_cac(priv);
 
 	if (nxpwifi_del_mgmt_ies(priv))
@@ -3066,6 +3068,50 @@ static int nxpwifi_cfg80211_set_coalesce(struct wiphy *wiphy,
 	return nxpwifi_coalesce_cfg(priv, &coalesce_cfg);
 }
 
+/* Keep only the beacon buffers consumed by nxpwifi_set_mgmt_ies(). */
+static struct cfg80211_ap_update *
+nxpwifi_dup_csa_update(const struct cfg80211_beacon_data *beacon)
+{
+	struct cfg80211_ap_update *update;
+	struct cfg80211_beacon_data *copy;
+	u8 *pos;
+	size_t len = beacon->tail_len + beacon->beacon_ies_len +
+		     beacon->proberesp_ies_len + beacon->assocresp_ies_len;
+
+	/* Each length comes from a bounded netlink attribute. */
+	update = kzalloc(sizeof(*update) + len, GFP_KERNEL);
+	if (!update)
+		return NULL;
+
+	copy = &update->beacon;
+	pos = (u8 *)(update + 1);
+	if (beacon->tail_len) {
+		copy->tail = pos;
+		copy->tail_len = beacon->tail_len;
+		memcpy(pos, beacon->tail, beacon->tail_len);
+		pos += beacon->tail_len;
+	}
+	if (beacon->beacon_ies_len) {
+		copy->beacon_ies = pos;
+		copy->beacon_ies_len = beacon->beacon_ies_len;
+		memcpy(pos, beacon->beacon_ies, beacon->beacon_ies_len);
+		pos += beacon->beacon_ies_len;
+	}
+	if (beacon->proberesp_ies_len) {
+		copy->proberesp_ies = pos;
+		copy->proberesp_ies_len = beacon->proberesp_ies_len;
+		memcpy(pos, beacon->proberesp_ies, beacon->proberesp_ies_len);
+		pos += beacon->proberesp_ies_len;
+	}
+	if (beacon->assocresp_ies_len) {
+		copy->assocresp_ies = pos;
+		copy->assocresp_ies_len = beacon->assocresp_ies_len;
+		memcpy(pos, beacon->assocresp_ies, beacon->assocresp_ies_len);
+	}
+
+	return update;
+}
+
 static int
 nxpwifi_cfg80211_uap_add_station(struct nxpwifi_private *priv, const u8 *mac,
 				 struct station_parameters *params)
@@ -3099,9 +3145,13 @@ nxpwifi_cfg80211_channel_switch(struct wiphy *wiphy, struct net_device *dev,
 				struct cfg80211_csa_settings *params)
 {
 	struct nxpwifi_private *priv = nxpwifi_netdev_get_priv(dev);
+	struct cfg80211_ap_update *update;
 	int chsw_msec;
 	int ret;
 
+	if (priv->ap_update_info)
+		return -EBUSY;
+
 	if (priv->adapter->scan_processing) {
 		nxpwifi_dbg(priv->adapter, ERROR,
 			    "radar detection: scan in process...\n");
@@ -3115,6 +3165,10 @@ nxpwifi_cfg80211_channel_switch(struct wiphy *wiphy, struct net_device *dev,
 				       &priv->dfs_chandef))
 		return -EINVAL;
 
+	update = nxpwifi_dup_csa_update(&params->beacon_after);
+	if (!update)
+		return -ENOMEM;
+
 	ret = nxpwifi_del_mgmt_ies(priv);
 	if (ret)
 		nxpwifi_dbg(priv->adapter, ERROR,
@@ -3124,12 +3178,12 @@ nxpwifi_cfg80211_channel_switch(struct wiphy *wiphy, struct net_device *dev,
 	if (ret) {
 		nxpwifi_dbg(priv->adapter, ERROR,
 			    "%s: setting mgmt ies failed\n", __func__);
+		kfree(update);
 		goto done;
 	}
 
 	memcpy(&priv->dfs_chandef, &params->chandef, sizeof(priv->dfs_chandef));
-	memcpy(&priv->ap_update_info.beacon, &params->beacon_after,
-	       sizeof(priv->ap_update_info.beacon));
+	priv->ap_update_info = update;
 
 	if (params->block_tx) {
 		netif_carrier_off(priv->netdev);
diff --git a/drivers/net/wireless/nxp/nxpwifi/main.h b/drivers/net/wireless/nxp/nxpwifi/main.h
index b25a6a4f2936..4d5718ed5031 100644
--- a/drivers/net/wireless/nxp/nxpwifi/main.h
+++ b/drivers/net/wireless/nxp/nxpwifi/main.h
@@ -619,7 +619,7 @@ struct nxpwifi_private {
 	struct wiphy_delayed_work dfs_cac_work;
 	struct wiphy_delayed_work dfs_chan_sw_work;
 	bool uap_stop_tx;
-	struct cfg80211_ap_update ap_update_info;
+	struct cfg80211_ap_update *ap_update_info;
 	struct nxpwifi_11h_intf_state state_11h;
 	struct nxpwifi_ds_mem_rw mem_rw;
 	struct sk_buff_head bypass_txq;
-- 
2.56.0

