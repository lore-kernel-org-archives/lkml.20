Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794122385;
	b=iT3lwu+CVKBrFjCjpHWyPVCbhdGEcU4iXTvzc6D/tca9ayKiq6+5tddMLX8STSxqLjTL
	 cYE5gy/HRel3lwtR75oEKQ8ckOF0gHXzHlu52QmLtWyyLmtu+XPVOtmN+twRReANFqyDz
	 3zfnqevXMvgyPsEPhWxI2Tjz1pAgyUoxWds1+xIBgJNapWuL7ZM5aEr0cmWJzMwlyEYDz
	 t1igarn38OLd0JEvi0wIQtaEjfrdSxw1EXwYqMWg/YKV4pkzF3R6Qa6xW7GD6iEXKF5uf
	 7m+qKFcmDHjlW6NIQZXsf9KOTZMI13blPvvce4Y/H/fk6TWWJlfHC0uZm17K3QEEP6w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794122385;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=kq/pBnPAAVkr3tVitWJ2EsieKSmgkTn09+Ghh1ZSyG0=;
	b=v8XtVTqY1QmC+eONr8Wec6eflaBP7Mf3sCe+ZPCG3nA8GaycavICXMk15RXybVlrwh9H
	 9A+p2MDKlQVH4xynMnwmBDrTtCIR281mYNQhbEsEdR54OrSoxABa2qrqM26Y3jCL9ibB2
	 JUXU+0CuQlsDtiG/MZFaYc9Qs2uBCe1A18ZiTXUbpNupH350Y9PwxF+nQehnKC5jAnCmv
	 EDq0115CM4DGifEdtewtXBdRM2l7B4rcDQ7YRCHEO2RNeCG61+ax8v+mHQDSfNj8k4GF9
	 roGiAwNFIC5fZevUkx5EXjHog+VluWv0D+18LYiVx3f0/zN3Rkf7N7KKwTCA0SRS8Mw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ilcHyeDb;
	arc=none smtp.remote-ip=74.125.82.52
Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E21E3606A31C
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 07:19:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E21E3606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ilcHyeDb
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-1a8cc11ac42so64578c88.0
        for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 23:19:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794122384; x=1794727184; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kq/pBnPAAVkr3tVitWJ2EsieKSmgkTn09+Ghh1ZSyG0=;
        b=ilcHyeDb2oKKezCDlr/ryC1sRYPUV1ih1gYlXKertPlPpogoF1zU2HW3eUvbteIufZ
         BZNuWV8YCNwzonlg81F3eHb/428n1GraRRP+3/1ptDW65bkUCstnxW5q3h4YEiqFbRBO
         bekuJq9QpOG4aoZzDDVSV5pLw8RyjgWv/xwu0p7NcH0teyRhMT0CYQ4qPT6pGnx3Xz7d
         Sj+LRTgxCSZ8huiflqVFNs57yfMAmIR+QfZvzruRi5FuSTsWf/nQe9w9RIAoqU3Hmx0l
         nUraWIIdfIe7ZdU/gwznZ6SOUU5dD49kpkDta0rGUZDpVC5qwoOQx63Bw5Y8YTMpgSSn
         UVZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794122384; x=1794727184;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kq/pBnPAAVkr3tVitWJ2EsieKSmgkTn09+Ghh1ZSyG0=;
        b=ap4hjaGSJXEgFgrASV8VwTWNkz3AF4B3WjvzcR+o4VhjpTCyfzvKywQumG7HsaHlvj
         Kk3m9iM2bdTe+vQoPlGXjuw9ibNUfu788OODv5+IBsLnXv4YIhT9/SeoJncrx47+wYeS
         0iM6pVBEQ2NGNNYW/joaw3ANu4jefJI4toeQRVTdOqJYzBvkYEnoR0L6AHHH3+wepRSA
         V0i2wLuQrY89SSJwlbK+PPnsUMvtms4+/4X5iUNmSkC0WLtgpCgFZUhYefDJ9kEbcG4a
         9T1gNZSYGWR9X7Ls8pZwR8gy0XxHxx5TR7HLQ30vjiod5YbqhWdUEAIQHWWpAYcYJ6a3
         LpEQ==
X-Forwarded-Encrypted: i=1; AL+hErEsXtEvIuOSaIwi6/iGzlT+AoW7tWZd7R9XjcA9COMegoI5T6kuvyD3wTzfxnYXmgHrFcJVnY75JwWtSZM=@vger.kernel.org
X-Gm-Message-State: APuU4Z8y25oVKlCENU6KOUmhSLWvPYiNvyqjlUP/HnzMVKkkeR5/35Cd
	dxW7uUU2ZPxNgRplrWvwVy/8DbegciW9JX8TCbBJwBqv0mLgislFF8pd
X-Gm-Gg: AYBFou1JfuMorq3Wcz607zB1vv5TJymoV7AS0kBEEE2P6aDvD0aBIsbyiTbc5/KxOkl
	YuCWB3z7M/Jq5XgQ0b2V5Jlysz8nw8lRE7TT1XMHVjVf82Rwx1su6RTOPTIPXJAoxTIbU0D0vMy
	kVzhfESpcbIBWhx1+wKwqAJTh2ShduDgiHCiDWN/cIdfV3YcND/i9JFI+LeUwtbDjVAA4sA4LXI
	vxuQDnE+J1wG+NCmWGnprUR0bgU+5kLopM6gB2qvFwTsUziWaB2+uvkacaXX+ogWKMVoTyj+D5b
	AEnSNyjBaeZfsPBOfcorYi81Lwjz9aBvINzY6cMqXo2gH62a5cdRh+qun+znJ+vGWoDJk30nxWk
	3FzTWmIkac3dIvWgqx0FwkpONlKaytxJC5iFjQAwwEHDQhpkVbS4a2tOcIhA94EW2zn/5BItYCU
	67VZSMKVE6PFgiiWg4nrKArCDkICGCLh8PS0SqLawCQ7E3LKFqx/shBXXQPhILP/T4qlXu1En3u
	UiJgAZYSkSQL6YeKj5tPilChO/FVxylEVeHA6/U8f6OEVX1a/s3vV+Yea8TZXFGw5acc+vDvby7
	2LNSl42fk0TNEQMU3e2eBqb97/QyoxECV3F3AviFnFIEme0=
X-Received: by 2002:a05:701b:20ce:10b0:1b2:3b5b:b80b with SMTP id a92af1059eb24-1b39fe87af9mr1150003c88.8.1794122383860;
        Sat, 07 Nov 2026 23:19:43 -0800 (PST)
Received: from cachyos-x8664.nitc.ac.in ([61.1.180.57])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3755e8911sm4207262c88.5.2026.11.07.23.19.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 23:19:43 -0800 (PST)
From: John Robin <johnrobin044@gmail.com>
To: linux-wireless@vger.kernel.org
Cc: kuba@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	John Robin <johnrobin044@gmail.com>
Subject: [PATCH v2 2/4] wifi: mt7601u: enable AP and Wi-Fi Direct interface modes
Date: Sun,  8 Nov 2026 12:47:44 +0530
Message-ID: <20261108071820.35303-3-johnrobin044@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261108071820.35303-1-johnrobin044@gmail.com>
References: <7ededd2f-98d0-41ac-91b4-2977963c4637@gmail.com>
 <20261108071820.35303-1-johnrobin044@gmail.com>
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

Register the AP, P2P_GO, P2P_CLIENT, and ADHOC interface modes in
mac80211 to allow for concurrent Station and AP operation. This
defines an interface combination supporting up to 2 concurrent modes
and sets NEEDS_UNIQUE_STA_ADDR so mac80211 can automatically generate
MAC addresses for the virtual interfaces.

Signed-off-by: John Robin <johnrobin044@gmail.com>
---
 drivers/net/wireless/mediatek/mt7601u/init.c | 31 ++++++++++++++++++--
 1 file changed, 29 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt7601u/init.c b/drivers/net/wireless/mediatek/mt7601u/init.c
index 5d9e952b29664..e871f7b63cb35 100644
--- a/drivers/net/wireless/mediatek/mt7601u/init.c
+++ b/drivers/net/wireless/mediatek/mt7601u/init.c
@@ -12,6 +12,25 @@
 
 #include "initvals.h"
 
+static const struct ieee80211_iface_limit if_limits[] = {
+	{ .max = 1, .types = BIT(NL80211_IFTYPE_ADHOC) },
+	{ .max = 8,
+	  .types = BIT(NL80211_IFTYPE_STATION) |
+#ifdef CONFIG_MAC80211_MESH
+		   BIT(NL80211_IFTYPE_MESH_POINT) |
+#endif
+		   BIT(NL80211_IFTYPE_P2P_CLIENT) | BIT(NL80211_IFTYPE_P2P_GO) |
+		   BIT(NL80211_IFTYPE_AP) },
+};
+
+static const struct ieee80211_iface_combination if_comb[] = { {
+	.limits = if_limits,
+	.n_limits = ARRAY_SIZE(if_limits),
+	.max_interfaces = 2,
+	.num_different_channels = 1,
+	.beacon_int_infra_match = true,
+} };
+
 static void
 mt7601u_set_wlan_state(struct mt7601u_dev *dev, u32 val, bool enable)
 {
@@ -599,6 +618,7 @@ int mt7601u_register_device(struct mt7601u_dev *dev)
 	ieee80211_hw_set(hw, AMPDU_AGGREGATION);
 	ieee80211_hw_set(hw, SUPPORTS_RC_TABLE);
 	ieee80211_hw_set(hw, MFP_CAPABLE);
+	ieee80211_hw_set(hw, NEEDS_UNIQUE_STA_ADDR);
 	hw->max_rates = 1;
 	hw->max_report_rates = 7;
 	hw->max_rate_tries = 1;
@@ -607,9 +627,16 @@ int mt7601u_register_device(struct mt7601u_dev *dev)
 	hw->vif_data_size = sizeof(struct mt76_vif);
 
 	SET_IEEE80211_PERM_ADDR(hw, dev->macaddr);
-
+	wiphy->interface_modes =
+		BIT(NL80211_IFTYPE_STATION) | BIT(NL80211_IFTYPE_AP) |
+#ifdef CONFIG_MAC80211_MESH
+		BIT(NL80211_IFTYPE_MESH_POINT) |
+#endif
+		BIT(NL80211_IFTYPE_P2P_CLIENT) | BIT(NL80211_IFTYPE_P2P_GO) |
+		BIT(NL80211_IFTYPE_ADHOC);
+	wiphy->iface_combinations = if_comb;
+	wiphy->n_iface_combinations = ARRAY_SIZE(if_comb);
 	wiphy->features |= NL80211_FEATURE_ACTIVE_MONITOR;
-	wiphy->interface_modes = BIT(NL80211_IFTYPE_STATION);
 	wiphy->flags |= WIPHY_FLAG_SUPPORTS_TDLS;
 
 	wiphy_ext_feature_set(wiphy, NL80211_EXT_FEATURE_CQM_RSSI_LIST);
-- 
2.56.0

