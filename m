Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794743790;
	b=xqcfwRlRszqwN3XhBAW1+E8r3a8aiT4IrNh4qm1+B3ovshG9NBeaaf0KDj1xlsAkwK6K
	 CrRoxBn4UEZ9Oh/LF1XUoQkFdDuCXpaWCAZZ9aMBygiicbCS3UnzjxfZHBGw7KXtAMAsJ
	 hqI5FHc2o70R5f2EhZXuLe/93bvfaf0n3jj5+sLJeqscWChPDBKk3562nGRt7rvo0W41+
	 DZE57IJvhmz4e4g+hYxu+a9pZ9BCY2EbV0+rARmiy9jb84dGZawhfwoIMrQspfa+3tGnv
	 SbjA6TR9+3PpwFopqq/GAn5SYOQhWwG27ZKqD8S9fH+OYzyK87aJ9h63OlokOPbeoWA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794743790;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=NEBu8LkV8RJy5R2nSqGmgmPJ9hpnPl945GtGLNpCzTA=;
	b=QPFTJ1zhQCjvmdR75fgFLZslB22oTeyesEYgBS2wnVqlXsC2K6D5DTXEvmNO+L5pfhoU
	 P1FNMjrAps2B2Xj2ZN16TejFP+Ej6qJUjZnxaHtU/ofCME04rHeJpfANOBSohRU9wKQi/
	 a6vPors3/W5NRfAOiuu65fwQ/EoJfXbM3gJ1CBVrPoGZm3QEh2Tey/GdYhgvk8tXmow9m
	 9mba+03E7oT0Tdgm094CJtoVd3vLu7KthMOauOgnMYLsIRw8zn4oBh5xmoeHy5NpqbWg5
	 NL+NLqtP3HUuI8QCs2LpZ47s+T9V370P0YmqeNi2wOUYINbRMPWAZBchJd3S30FcdHg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QpQZRaMI;
	arc=none smtp.remote-ip=209.85.215.181
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93271606A32C
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 11:56:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 93271606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QpQZRaMI
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-cd61cef87f1so1037359a12.0
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 03:56:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794743790; x=1795348590; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NEBu8LkV8RJy5R2nSqGmgmPJ9hpnPl945GtGLNpCzTA=;
        b=QpQZRaMIuj9OjT/Udn4oAXpISneU+ViGL5hDyBxEOiB2fpFQv+OJCwyglY7GYwoQQb
         EW8xEv0TLGx1pfSvvN/xI3Hq57Cv5WM85iJE30vvhKZKT+/3dP8c4g1SyT8+yl55ZXMq
         u4QsduHH+Q0oXt/7MfWSqBE/CqvZ9G47PYd6P1jQ3SwsXL4KH/Lsp0CCO9bCm9yjd1wi
         FuaooaCX+j3OxUYMRUs9bRxf58N3aydo9GCTxW4GW9KYjZ/eWt9JqXOx6NHIAEtZFerN
         2ym6YaTFKKqsawReL8kltUS2RuCMt3LEmtyjdwHS+Lu0IYgp1DaGgz3/Fmsag9ILEKn3
         othQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794743790; x=1795348590;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NEBu8LkV8RJy5R2nSqGmgmPJ9hpnPl945GtGLNpCzTA=;
        b=JVYeXaKeEwFRZ9fY1tjvL1z92omC2q3I7g7ps1FbA0/iH2R6cRq6Tc9Bj1YDclZO7P
         fZ07SWjQthx/4XP1HAJjSXYoRzpY0ysCFTg19LUXIwQcWHjGoNMInnVOqpTeqqDDESIG
         pWDctffbAzXl1ppPXsu/kmi53cYCXwvbv4Cb5J2FtugAf2NdJXfRpRFB+RWeg30zSYhU
         kRLnO2xS23SCX4Lqym5tgzUrAxNJwtqHYDCgyPC7KGhcl1IfE9/bbpsKoDH+VNotaOY9
         C5PXzGy3/XrU144E7eVtBbi55/VWKZhSKLk395Tu/XmmpyGhd7mGS7v0C5k8vv0+UdPY
         jTBA==
X-Forwarded-Encrypted: i=1; AL+hErEOQrAwyZGfizjkWtTQusZ+O58F11vQG913E9HoPSHPT1U12UvpITjE/5a9e2NtUpbjzlfErncSJ5PRNZ0=@vger.kernel.org
X-Gm-Message-State: APuU4Z8g4cv3lFDv54oRo7PtG0uFpdKq92o+8ybn64qk6RrKkDwInVF8
	jFrinkNxC8maNL1tcmwwgA3lirOyFcZHK0Or69P2Ez/k2nKF+VVBUlTj
X-Gm-Gg: AYBFou0LI29kV216xjW5y7puVwtt6ak6wXiSi7Ymj6lqkB/g7xqaJSRvuPVl6gCZ0w5
	0qITrfwt3hVehZj+RSdy/dlmVUC6Pypdoi677FJ3YyoGuHfAr9n8b2Tj6Yzy9wMQIBaw2VTmVvE
	8XH+rfVPrUqEuyT5ymyppucIRKs61R8HSqUkuLYRa+hLVo5zrcOzJ5aq0RjFhMXbRv0DK0Ky37X
	Xlb2mstzXn0bhID5Evny+lIzqT8ejp9Izjsd6ANDFk7wdALb2MxCDj7Zmblni/FJ/pXGxpu9VFI
	Vunv3QSHEUETZjD8NkR5pVBQkGvBMUeVLCE3plfFzMkA8b0FHsR61rQPwQRG8667zgmMjmZZUUf
	soLW5x7bpJiPaYnMejD+hvPIvQeJPg9lFh0nxR/ORdglzgRHA8nD4Xyj7ILmMyNpHRluVBAmNpl
	rCjMoXPvYfM2ju2H6/aUYcj29yMVL+qWesdoV5b/2onesnJIaHczINikJ6czyZkhiwetUPsNnPn
	vBzdpL9DxAb2G2EWwr2wfpfpIh2FK4pYuWM0AvmdLRP3WHoePGBjk2NXajBcd5kueDpn7CblTtx
	0zA5d5SrrRadf/OMUhWqeZmglbl4+Y5VAXcgc0GM3vWOrV3PAV4W8zbdsd4ZmkOq+dur6Lcwf+H
	nIfSg23Da61/6SU+c4k9Oc0oSDWAFwfPO+ltzFTUn5Lc=
X-Received: by 2002:a17:90b:35c6:b0:3b0:e2a9:345a with SMTP id 98e67ed59e1d1-3b1b0b9b782mr6404026a91.64.1794743789748;
        Sun, 15 Nov 2026 03:56:29 -0800 (PST)
Received: from acemagic-m1.tail4fb79.ts.net ([2401:7400:c804:b668:5ade:5fb:5602:326b])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1b3ac294bsm5853901a91.2.2026.11.15.03.56.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 03:56:29 -0800 (PST)
From: Ho Jie Feng <hjf3108@gmail.com>
To: Ping-Ke Shih <pkshih@realtek.com>
Cc: linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bitterblue Smith <rtl8821cerfe2@gmail.com>,
	Luka Gejak <luka.gejak@linux.dev>,
	Ho Jie Feng <hjf3108@gmail.com>
Subject: [PATCH rtw-next v4 6/7] wifi: rtw88: 88xxa: correct carrier-frequency offset
Date: Sun, 15 Nov 2026 19:43:32 +0800
Message-ID: <20261115114336.1739863-7-hjf3108@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261115114336.1739863-1-hjf3108@gmail.com>
References: <20261115114336.1739863-1-hjf3108@gmail.com>
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

Use the newly promoted helpers to implement support for 88xxa

Signed-off-by: Ho Jie Feng <hjf3108@gmail.com>
---
 drivers/net/wireless/realtek/rtw88/phy.c      |  5 +-
 drivers/net/wireless/realtek/rtw88/phy.h      |  6 +++
 drivers/net/wireless/realtek/rtw88/rtw8812a.c |  2 +
 drivers/net/wireless/realtek/rtw88/rtw8814a.c | 32 +++++++++++--
 drivers/net/wireless/realtek/rtw88/rtw8821a.c |  2 +
 drivers/net/wireless/realtek/rtw88/rtw88xxa.c | 47 +++++++++++++++----
 drivers/net/wireless/realtek/rtw88/rtw88xxa.h |  1 +
 7 files changed, 81 insertions(+), 14 deletions(-)

diff --git a/drivers/net/wireless/realtek/rtw88/phy.c b/drivers/net/wireless/realtek/rtw88/phy.c
index d0c1fb65be..b01601d707 100644
--- a/drivers/net/wireless/realtek/rtw88/phy.c
+++ b/drivers/net/wireless/realtek/rtw88/phy.c
@@ -687,13 +687,14 @@ static void rtw_phy_parsing_cfo_iter(void *data, u8 *mac,
 	struct rtw_rx_pkt_stat *pkt_stat = iter_data->pkt_stat;
 	struct rtw_dm_info *dm_info = &rtwdev->dm_info;
 	struct rtw_cfo_track *cfo = &dm_info->cfo_track;
+	u8 path_num = min_t(u8, rtwdev->hal.rf_path_num, RTW_CFO_PATH_NUM_MAX);
 	u8 *bssid = iter_data->bssid;
 	u8 i;
 
 	if (!ether_addr_equal(vif->bss_conf.bssid, bssid))
 		return;
 
-	for (i = 0; i < rtwdev->hal.rf_path_num; i++) {
+	for (i = 0; i < path_num; i++) {
 		cfo->cfo_tail[i] += pkt_stat->cfo_tail[i];
 		cfo->cfo_cnt[i]++;
 	}
@@ -794,7 +795,7 @@ u8 rtw_phy_cfo_xcap_track(struct rtw_dev *rtwdev, u8 xcap_max, bool bt_hold)
 {
 	struct rtw_dm_info *dm_info = &rtwdev->dm_info;
 	struct rtw_cfo_track *cfo = &dm_info->cfo_track;
-	u8 path_num = rtwdev->hal.rf_path_num;
+	u8 path_num = min_t(u8, rtwdev->hal.rf_path_num, RTW_CFO_PATH_NUM_MAX);
 	s8 crystal_cap = cfo->crystal_cap;
 	s32 cfo_avg = 0;
 
diff --git a/drivers/net/wireless/realtek/rtw88/phy.h b/drivers/net/wireless/realtek/rtw88/phy.h
index b551cb860d..52e6546b52 100644
--- a/drivers/net/wireless/realtek/rtw88/phy.h
+++ b/drivers/net/wireless/realtek/rtw88/phy.h
@@ -204,4 +204,10 @@ enum rtw_phy_cck_pd_lv {
 #define RRSR_RATE_ORDER_MAX	0xfffff
 #define RRSR_RATE_ORDER_CCK_LEN	4
 
+/* crystal cap width of all chips except RTL8822C */
+#define RTW_XCAP_MASK		GENMASK(5, 0)
+
+/* RTL8814A has 4 paths, but only paths A and B report CFO */
+#define RTW_CFO_PATH_NUM_MAX	2
+
 #endif
diff --git a/drivers/net/wireless/realtek/rtw88/rtw8812a.c b/drivers/net/wireless/realtek/rtw88/rtw8812a.c
index 5d58dff4fc..c8008cf43d 100644
--- a/drivers/net/wireless/realtek/rtw88/rtw8812a.c
+++ b/drivers/net/wireless/realtek/rtw88/rtw8812a.c
@@ -943,6 +943,8 @@ static const struct rtw_chip_ops rtw8812a_ops = {
 	.coex_set_rfe_type	= rtw8821a_coex_cfg_rfe_type,
 	.coex_set_wl_tx_power	= rtw8821a_coex_cfg_wl_tx_power,
 	.coex_set_wl_rx_gain	= rtw8821a_coex_cfg_wl_rx_gain,
+	.cfo_init		= rtw_phy_cfo_xcap_init,
+	.cfo_track		= rtw88xxa_cfo_track,
 };
 
 static const struct rtw_page_table page_table_8812a[] = {
diff --git a/drivers/net/wireless/realtek/rtw88/rtw8814a.c b/drivers/net/wireless/realtek/rtw88/rtw8814a.c
index 13c22d2e50..74c548cb5c 100644
--- a/drivers/net/wireless/realtek/rtw88/rtw8814a.c
+++ b/drivers/net/wireless/realtek/rtw88/rtw8814a.c
@@ -146,6 +146,9 @@ static int rtw8814a_read_efuse(struct rtw_dev *rtwdev, u8 *log_map, u8 *phy_map)
 	efuse->rfe_option = map->rfe_option;
 	efuse->rf_board_option = map->rf_board_option;
 	efuse->crystal_cap = map->xtal_k;
+	if (efuse->crystal_cap == 0xff)
+		efuse->crystal_cap = 0x20;
+	efuse->crystal_cap &= RTW_XCAP_MASK;
 	efuse->channel_plan = map->channel_plan;
 	efuse->country_code[0] = map->country_code[0];
 	efuse->country_code[1] = map->country_code[1];
@@ -284,9 +287,15 @@ static void rtw8814a_config_cck_rx_antenna_init(struct rtw_dev *rtwdev)
 	rtw_write32_mask(rtwdev, REG_CCKTX, BIT_CMB_CCA_2R, 1);
 }
 
+static void rtw8814a_set_crystal_cap(struct rtw_dev *rtwdev, u8 crystal_cap)
+{
+	rtw_write32_mask(rtwdev, REG_AFE_CTRL3, 0x07ff8000,
+			 crystal_cap | (crystal_cap << 6));
+}
+
 static void rtw8814a_phy_set_param(struct rtw_dev *rtwdev)
 {
-	u32 crystal_cap, val32;
+	u32 val32;
 	u8 val8, rf_path;
 
 	/* power on BB/RF domain */
@@ -308,9 +317,7 @@ static void rtw8814a_phy_set_param(struct rtw_dev *rtwdev)
 	rtw_load_table(rtwdev, rtwdev->chip->bb_tbl);
 	rtw_load_table(rtwdev, rtwdev->chip->agc_tbl);
 
-	crystal_cap = rtwdev->efuse.crystal_cap & 0x3F;
-	crystal_cap |= crystal_cap << 6;
-	rtw_write32_mask(rtwdev, REG_AFE_CTRL3, 0x07ff8000, crystal_cap);
+	rtw8814a_set_crystal_cap(rtwdev, rtwdev->efuse.crystal_cap);
 
 	rtw8814a_config_trx_path(rtwdev);
 
@@ -1269,6 +1276,8 @@ static void rtw8814a_query_phy_status(struct rtw_dev *rtwdev, u8 *phy_status,
 			pkt_stat->cfo_tail[i] = cfo[i];
 			dm_info->cfo_tail[i] = (cfo[i] * 5) >> 1;
 		}
+
+		rtw_phy_parsing_cfo(rtwdev, pkt_stat);
 	}
 }
 
@@ -2074,6 +2083,19 @@ static void rtw8814a_bf_config_bfee(struct rtw_dev *rtwdev,
 		rtw_bf_remove_bfee_su(rtwdev, bfee);
 }
 
+static void rtw8814a_cfo_track(struct rtw_dev *rtwdev)
+{
+	struct rtw_cfo_track *cfo = &rtwdev->dm_info.cfo_track;
+	u8 crystal_cap;
+
+	crystal_cap = rtw_phy_cfo_xcap_track(rtwdev, RTW_XCAP_MASK, false);
+	if (crystal_cap == cfo->crystal_cap)
+		return;
+
+	cfo->crystal_cap = crystal_cap;
+	rtw8814a_set_crystal_cap(rtwdev, crystal_cap);
+}
+
 static void rtw8814a_fill_txdesc_checksum(struct rtw_dev *rtwdev,
 					  struct rtw_tx_pkt_info *pkt_info,
 					  u8 *txdesc)
@@ -2108,6 +2130,8 @@ static const struct rtw_chip_ops rtw8814a_ops = {
 	.cfg_csi_rate		= NULL,
 	.led_set		= rtw8814a_led_set,
 	.fill_txdesc_checksum	= rtw8814a_fill_txdesc_checksum,
+	.cfo_init		= rtw_phy_cfo_xcap_init,
+	.cfo_track		= rtw8814a_cfo_track,
 
 	.coex_set_init		= rtw8814a_coex_cfg_init,
 	.coex_set_ant_switch	= rtw8814a_coex_cfg_ant_switch,
diff --git a/drivers/net/wireless/realtek/rtw88/rtw8821a.c b/drivers/net/wireless/realtek/rtw88/rtw8821a.c
index 6d106ae70d..17d3677ca4 100644
--- a/drivers/net/wireless/realtek/rtw88/rtw8821a.c
+++ b/drivers/net/wireless/realtek/rtw88/rtw8821a.c
@@ -889,6 +889,8 @@ static const struct rtw_chip_ops rtw8821a_ops = {
 	.coex_set_rfe_type	= rtw8821a_coex_cfg_rfe_type,
 	.coex_set_wl_tx_power	= rtw8821a_coex_cfg_wl_tx_power,
 	.coex_set_wl_rx_gain	= rtw8821a_coex_cfg_wl_rx_gain,
+	.cfo_init		= rtw_phy_cfo_xcap_init,
+	.cfo_track		= rtw88xxa_cfo_track,
 };
 
 static const struct rtw_page_table page_table_8821a[] = {
diff --git a/drivers/net/wireless/realtek/rtw88/rtw88xxa.c b/drivers/net/wireless/realtek/rtw88/rtw88xxa.c
index 9780999a9b..68a4ca8069 100644
--- a/drivers/net/wireless/realtek/rtw88/rtw88xxa.c
+++ b/drivers/net/wireless/realtek/rtw88/rtw88xxa.c
@@ -290,6 +290,7 @@ int rtw88xxa_read_efuse(struct rtw_dev *rtwdev, u8 *log_map, u8 *phy_map)
 	efuse->crystal_cap = map->xtal_k;
 	if (efuse->crystal_cap == 0xff)
 		efuse->crystal_cap = 0x20;
+	efuse->crystal_cap &= RTW_XCAP_MASK;
 	efuse->pa_type_2g = map->pa_type;
 	efuse->pa_type_5g = map->pa_type;
 	efuse->lna_type_2g = map->lna_type_2g;
@@ -643,9 +644,19 @@ static void rtw88xxa_init_beacon_parameters(struct rtw_dev *rtwdev)
 	rtw_write16(rtwdev, REG_BCNTCFG, 0x4413);
 }
 
+static void rtw88xxa_set_crystal_cap(struct rtw_dev *rtwdev, u8 crystal_cap)
+{
+	if (rtwdev->chip->id == RTW_CHIP_TYPE_8812A)
+		rtw_write32_mask(rtwdev, REG_AFE_CTRL3, 0x7FF80000,
+				 crystal_cap | (crystal_cap << 6));
+	else
+		rtw_write32_mask(rtwdev, REG_AFE_CTRL3, 0x00FFF000,
+				 crystal_cap | (crystal_cap << 6));
+}
+
 static void rtw88xxa_phy_bb_config(struct rtw_dev *rtwdev)
 {
-	u8 val8, crystal_cap;
+	u8 val8;
 
 	/* power on BB/RF domain */
 	val8 = rtw_read8(rtwdev, REG_SYS_FUNC_EN);
@@ -664,13 +675,7 @@ static void rtw88xxa_phy_bb_config(struct rtw_dev *rtwdev)
 	rtw_load_table(rtwdev, rtwdev->chip->bb_tbl);
 	rtw_load_table(rtwdev, rtwdev->chip->agc_tbl);
 
-	crystal_cap = rtwdev->efuse.crystal_cap & 0x3F;
-	if (rtwdev->chip->id == RTW_CHIP_TYPE_8812A)
-		rtw_write32_mask(rtwdev, REG_AFE_CTRL3, 0x7FF80000,
-				 crystal_cap | (crystal_cap << 6));
-	else
-		rtw_write32_mask(rtwdev, REG_AFE_CTRL3, 0x00FFF000,
-				 crystal_cap | (crystal_cap << 6));
+	rtw88xxa_set_crystal_cap(rtwdev, rtwdev->efuse.crystal_cap);
 }
 
 static void rtw88xxa_phy_rf_config(struct rtw_dev *rtwdev)
@@ -1632,6 +1637,17 @@ void rtw88xxa_query_phy_status(struct rtw_dev *rtwdev, u8 *phy_status,
 			power_b = power_a;
 
 		pkt_stat->signal_power = max3(power_a, power_b, min_rx_power);
+
+		pkt_stat->cfo_tail[RF_PATH_A] =
+			(s8)le32_get_bits(rpt->w2, RTW_JGRPHY_W2_CFO_TAIL_A);
+		pkt_stat->cfo_tail[RF_PATH_B] =
+			(s8)le32_get_bits(rpt->w2, RTW_JGRPHY_W2_CFO_TAIL_B);
+
+		/* convert to kHz (used only for debugfs) */
+		for (i = RF_PATH_A; i < rtwdev->hal.rf_path_num; i++)
+			dm_info->cfo_tail[i] = (pkt_stat->cfo_tail[i] * 5) >> 1;
+
+		rtw_phy_parsing_cfo(rtwdev, pkt_stat);
 	}
 }
 EXPORT_SYMBOL(rtw88xxa_query_phy_status);
@@ -2020,6 +2036,21 @@ void rtw88xxa_phy_pwrtrack(struct rtw_dev *rtwdev,
 }
 EXPORT_SYMBOL(rtw88xxa_phy_pwrtrack);
 
+void rtw88xxa_cfo_track(struct rtw_dev *rtwdev)
+{
+	struct rtw_cfo_track *cfo = &rtwdev->dm_info.cfo_track;
+	bool bt_hold = rtwdev->efuse.btcoex && !rtw_coex_disabled(rtwdev);
+	u8 crystal_cap;
+
+	crystal_cap = rtw_phy_cfo_xcap_track(rtwdev, RTW_XCAP_MASK, bt_hold);
+	if (crystal_cap == cfo->crystal_cap)
+		return;
+
+	cfo->crystal_cap = crystal_cap;
+	rtw88xxa_set_crystal_cap(rtwdev, crystal_cap);
+}
+EXPORT_SYMBOL(rtw88xxa_cfo_track);
+
 MODULE_AUTHOR("Realtek Corporation");
 MODULE_DESCRIPTION("Realtek 802.11ac wireless 8821a/8811a/8812a common code");
 MODULE_LICENSE("Dual BSD/GPL");
diff --git a/drivers/net/wireless/realtek/rtw88/rtw88xxa.h b/drivers/net/wireless/realtek/rtw88/rtw88xxa.h
index 150e86ea74..188b8f3a4b 100644
--- a/drivers/net/wireless/realtek/rtw88/rtw88xxa.h
+++ b/drivers/net/wireless/realtek/rtw88/rtw88xxa.h
@@ -172,5 +172,6 @@ void rtw88xxa_phy_pwrtrack(struct rtw_dev *rtwdev,
 			   void (*do_iqk)(struct rtw_dev *rtwdev));
 void rtw88xxa_bf_config_bfee(struct rtw_dev *rtwdev, struct rtw_vif *vif,
 			     struct rtw_bfee *bfee, bool enable);
+void rtw88xxa_cfo_track(struct rtw_dev *rtwdev);
 
 #endif
-- 
2.53.0

