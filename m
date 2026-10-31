Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793430633;
	b=1caIkO33lWPTWP1JQwxLN2E7LR/GXBuVWsM1WvJ+ZCE6ixCJ16HU56bvBe55lyDCHpcW
	 4DsMtO6UlNeEwf5wiY+Tsaja63kt1WBG/EgQpfMSz3KmJ9Z4KGPy0lCzLswKpTA7643dd
	 YdUMibanTqh3P4KsV0bwvceTKnC9bF0aA9Gt4R3HKVghBBYPzgxQ6NIvBV1LeDS5+sTFP
	 xjvqML8U35h3oB+yDW+jRg+e8ii/SR67tAh2kXtsc1OkBgCyv0ybGawoZ9eFg5IYcC3sF
	 3/MXPVgKjHCovsI2UlY2O3rmAly9L6C/OqstEq5i8bjrVVLi9TNtWSSez48nm7vEw7Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793430633;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Y/L6x7XGb8xKOpXfg9i9iEynva+GW3YT10LpyrpZwYo=;
	b=jNHGCP2O9LjKhONGMYHKavImayxacbYENEPAqJ4GEn3ko4A6rAdlnY6SYM/7ZwVTM7wI
	 NsK8++IAs8i9E52+5kHfVkBFXdSSEn8s/aTyZ147NyMxFYvG/7D0cHzPMbtcgZFA3yJMo
	 cqZyipu1cNgrrtneSbCtGW1/rgtkMZl5vg5tNwENlBkyGeYSKPyHYbDUylsWfXZb8XDuM
	 pfkArnmj+OPFSLmZQICwBC2NDY9oQggN67I7aWlj/O28EWP5zFFtXiyneUj2/TB/z/B6s
	 161UMqHB503KXkMHt/IE5yp3ktoxY5ve9JKZq6aTs58ScT4zHiBK+ozEaKyQEJE82YA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0ku0DTig;
	arc=none smtp.remote-ip=209.85.215.179
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2885E606A32D
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 07:10:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2885E606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0ku0DTig
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-cd5cd8d89a7so612051a12.1
        for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 00:10:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793430631; x=1794035431; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Y/L6x7XGb8xKOpXfg9i9iEynva+GW3YT10LpyrpZwYo=;
        b=0ku0DTigO7WOvEiQWBveG4X6LFaiSuedUjK0pCBPr1XHatZPjHi2iMDW2ipop4zOl/
         AKSMV3MT0m4VXRx7SVOupkGf4/J/4nCirEgJUMPMQXIrZYSRejTuSuBoS2fJfVWfkftf
         oSadWZVYJJftHRjvP3W2crlm2Zq4cXKyNAw+WRL9MBu9u3rHZPEORgBVlhMdCsdW0EbI
         ZpxkjbAoCGqzQBqyFNJD7iRQYjFEL6E5ixnxPPo0ZPeJC1/H46r9t30yu4n2oLfMEvtU
         PoxFhGZPW1AFheXzCMEQ5GJ4NeCeMi8YdR3d4K3Wxgpt9ekaXe59mIohEvGkIB28aXal
         XPGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793430631; x=1794035431;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Y/L6x7XGb8xKOpXfg9i9iEynva+GW3YT10LpyrpZwYo=;
        b=Gcjp9XeNk+ntfbuIF2hxGKHRg0qhT/8P4voINc+sPhwXkDw1aJJQzR4mEGWoNpK+rO
         hjwPbMIQzyZXx4/1Bs1U1p8JMGVxcg3/ITKaqbj5SVC3FiP2YqtLW9OYuoXz+XsRZ7m9
         UyiyMKcWAy5VgKf9KjYVj3rjVLUrLebapR3e15bGKktdn/yp37bSZPKzzwKn4a+anghU
         a6t0Z6L5blBa79mYWULIBm3uUtzLs+qiAunvNYx8pg6D/g7x/RBaSDGOxrUtiPoSe4qs
         RGMTrgPSBs8RQz3L/4+4WBT/44bX3mdhhBQWz2NeXo9sILuXzybccVgSuCsMUFcIM7uw
         3Rng==
X-Forwarded-Encrypted: i=1; AKwUvBxXOF4GKBArz2Nni/exBXFwQhkGIQCpvIhDdJwvWsZITDL7UUlmghhij1MnQqo+Yo+OxU9of2T41ewE7e8=@vger.kernel.org
X-Gm-Message-State: AFq9FYJT1CuPnGMHc+biQZSM4YTJm01A1k/vc6wpy03VbD1Lgvze/35m
	FB0V/a+RzbnD3JzFExOv07gBTh6k0hKXE6HEzM/BYqnxCCG0ldu4rsuVROw03EOc
X-Gm-Gg: AYBFou2KC/NmUkMwbeJacFsYRsJ++8/BnC2dil+Iz9ptn4Cd6uF/cJtSNa5jfgWUTmJ
	F5TglZ+gzpPQtGl6q2v/d3jIAoHge6aHtZv50nYkwCcJl5iY6uNNMQO1y7/wwTC4Wc0RIIIu49c
	/PhF2AGvDk7FuYyI4lfrMzhrriIeyzJg0Ab3BUnywcEzlBtqtE4cjVBM42MXQXasmoDKjwHEGI6
	uDp66MBkuvGDfqv5em2caJTGJ7XS39rwC/OLpepXA2NIiyQXVEy38f/Ip111BZQojcbm17wVKtV
	EfqZwld7oDVFlXneGzR0+u5dN/SU5RStEOF8X33Upl9iBjto1ULz9Xagvldv8WY7T34B1V9dvpQ
	mY6pYxXYp21NhVcWg4uVPSIVytWcg/S8eSrEKqN1bNfhiIM/WC+gtBql9eE5MjSZH1Shy5Cz2Sf
	VpbEtezouhCynQo9QMaZ5kOFV03ug0nRUXEHRP/7NOe3xzUG7+NPcV1DAbNt4elKjohPcAq8Z8l
	5uR+pJbu+06E2vp0QAQSkMkxDzpSUHAFFWWzYHv1qE7CLrWaYu6/aHMQRiqK9eZpiaL6milrI+h
	1DogwW/eHw92+Y8+W31dNiDxFaTunUX9GGKjXn4SvkbevvzIUG9v6DiMPvI7RPbbJwKq5uZY0gx
	1ZdIP
X-Received: by 2002:a17:90b:264c:b0:3ac:9463:83e6 with SMTP id 98e67ed59e1d1-3ae896f8520mr3584364a91.10.1793430631405;
        Sat, 31 Oct 2026 00:10:31 -0700 (PDT)
Received: from hostname.tail4fb79.ts.net ([2401:7400:c804:b668:65cc:625f:9c43:1e88])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-3ae845432e4sm6670459a91.3.2026.10.31.00.10.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 00:10:31 -0700 (PDT)
From: Ho Jie Feng <hjf3108@gmail.com>
To: Ping-Ke Shih <pkshih@realtek.com>
Cc: linux-wireless@vger.kernel.org,
	Ho Jie Feng <hjf3108@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH rtw-next v2 5/7] wifi: rtw88: 88xxa: correct carrier-frequency offset
Date: Sat, 31 Oct 2026 15:09:45 +0800
Message-ID: <20261031070950.425176-6-hjf3108@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261031070950.425176-1-hjf3108@gmail.com>
References: <20261031070950.425176-1-hjf3108@gmail.com>
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
 drivers/net/wireless/realtek/rtw88/rtw8812a.c |  2 +
 drivers/net/wireless/realtek/rtw88/rtw8814a.c | 31 ++++++++++--
 drivers/net/wireless/realtek/rtw88/rtw8821a.c |  2 +
 drivers/net/wireless/realtek/rtw88/rtw88xxa.c | 47 +++++++++++++++----
 drivers/net/wireless/realtek/rtw88/rtw88xxa.h |  1 +
 6 files changed, 73 insertions(+), 15 deletions(-)

diff --git a/drivers/net/wireless/realtek/rtw88/phy.c b/drivers/net/wireless/realtek/rtw88/phy.c
index d0c1fb65be9563c5fc29a7d18a1c9e8589730b10..69998c0d7c1f851bb30d2702233d62e14b305bf0 100644
--- a/drivers/net/wireless/realtek/rtw88/phy.c
+++ b/drivers/net/wireless/realtek/rtw88/phy.c
@@ -687,13 +687,14 @@ static void rtw_phy_parsing_cfo_iter(void *data, u8 *mac,
 	struct rtw_rx_pkt_stat *pkt_stat = iter_data->pkt_stat;
 	struct rtw_dm_info *dm_info = &rtwdev->dm_info;
 	struct rtw_cfo_track *cfo = &dm_info->cfo_track;
+	u8 path_num = min_t(u8, rtwdev->hal.rf_path_num, 2);
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
+	u8 path_num = min_t(u8, rtwdev->hal.rf_path_num, 2);
 	s8 crystal_cap = cfo->crystal_cap;
 	s32 cfo_avg = 0;
 
diff --git a/drivers/net/wireless/realtek/rtw88/rtw8812a.c b/drivers/net/wireless/realtek/rtw88/rtw8812a.c
index 5d58dff4fcee7c4b3194794266cb48cd472014f9..c8008cf43da9df68a8c1dfb277d529a1191bda01 100644
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
index 2db05a83766d65123edc95f50a40d3f93bfb1dba..3c65cd838ce15f0149852cd488e88f78e709efe1 100644
--- a/drivers/net/wireless/realtek/rtw88/rtw8814a.c
+++ b/drivers/net/wireless/realtek/rtw88/rtw8814a.c
@@ -145,7 +145,7 @@ static int rtw8814a_read_efuse(struct rtw_dev *rtwdev, u8 *log_map)
 	efuse->usb_mode_switch = u8_get_bits(map->usb_mode, BIT(4));
 	efuse->rfe_option = map->rfe_option;
 	efuse->rf_board_option = map->rf_board_option;
-	efuse->crystal_cap = map->xtal_k;
+	efuse->crystal_cap = map->xtal_k & 0x3f;
 	efuse->channel_plan = map->channel_plan;
 	efuse->country_code[0] = map->country_code[0];
 	efuse->country_code[1] = map->country_code[1];
@@ -284,9 +284,15 @@ static void rtw8814a_config_cck_rx_antenna_init(struct rtw_dev *rtwdev)
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
@@ -308,9 +314,7 @@ static void rtw8814a_phy_set_param(struct rtw_dev *rtwdev)
 	rtw_load_table(rtwdev, rtwdev->chip->bb_tbl);
 	rtw_load_table(rtwdev, rtwdev->chip->agc_tbl);
 
-	crystal_cap = rtwdev->efuse.crystal_cap & 0x3F;
-	crystal_cap |= crystal_cap << 6;
-	rtw_write32_mask(rtwdev, REG_AFE_CTRL3, 0x07ff8000, crystal_cap);
+	rtw8814a_set_crystal_cap(rtwdev, rtwdev->efuse.crystal_cap);
 
 	rtw8814a_config_trx_path(rtwdev);
 
@@ -1269,6 +1273,8 @@ static void rtw8814a_query_phy_status(struct rtw_dev *rtwdev, u8 *phy_status,
 			pkt_stat->cfo_tail[i] = cfo[i];
 			dm_info->cfo_tail[i] = (cfo[i] * 5) >> 1;
 		}
+
+		rtw_phy_parsing_cfo(rtwdev, pkt_stat);
 	}
 }
 
@@ -2068,6 +2074,19 @@ static void rtw8814a_bf_config_bfee(struct rtw_dev *rtwdev,
 		rtw_bf_remove_bfee_su(rtwdev, bfee);
 }
 
+static void rtw8814a_cfo_track(struct rtw_dev *rtwdev)
+{
+	struct rtw_cfo_track *cfo = &rtwdev->dm_info.cfo_track;
+	u8 crystal_cap;
+
+	crystal_cap = rtw_phy_cfo_xcap_track(rtwdev, 0x3f, false);
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
@@ -2102,6 +2121,8 @@ static const struct rtw_chip_ops rtw8814a_ops = {
 	.cfg_csi_rate		= NULL,
 	.led_set		= rtw8814a_led_set,
 	.fill_txdesc_checksum	= rtw8814a_fill_txdesc_checksum,
+	.cfo_init		= rtw_phy_cfo_xcap_init,
+	.cfo_track		= rtw8814a_cfo_track,
 
 	.coex_set_init		= rtw8814a_coex_cfg_init,
 	.coex_set_ant_switch	= rtw8814a_coex_cfg_ant_switch,
diff --git a/drivers/net/wireless/realtek/rtw88/rtw8821a.c b/drivers/net/wireless/realtek/rtw88/rtw8821a.c
index 6d106ae70d9142b45337057311dc423158e7dabc..17d3677ca463cf633d8c138612deaa676bc02986 100644
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
index 87253fffe78cd6f5b58a325eef42b58b968e2d46..851d198f76f3b10d5ba77c7e07e4be9d7fd54e4b 100644
--- a/drivers/net/wireless/realtek/rtw88/rtw88xxa.c
+++ b/drivers/net/wireless/realtek/rtw88/rtw88xxa.c
@@ -279,6 +279,7 @@ int rtw88xxa_read_efuse(struct rtw_dev *rtwdev, u8 *log_map)
 	efuse->crystal_cap = map->xtal_k;
 	if (efuse->crystal_cap == 0xff)
 		efuse->crystal_cap = 0x20;
+	efuse->crystal_cap &= 0x3F;
 	efuse->pa_type_2g = map->pa_type;
 	efuse->pa_type_5g = map->pa_type;
 	efuse->lna_type_2g = map->lna_type_2g;
@@ -632,9 +633,19 @@ static void rtw88xxa_init_beacon_parameters(struct rtw_dev *rtwdev)
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
@@ -653,13 +664,7 @@ static void rtw88xxa_phy_bb_config(struct rtw_dev *rtwdev)
 	rtw_load_table(rtwdev, rtwdev->chip->bb_tbl);
 	rtw_load_table(rtwdev, rtwdev->chip->agc_tbl);
 
-	crystal_cap = rtwdev->efuse.crystal_cap & 0x3F;
-	if (rtwdev->chip->id == RTW_CHIP_TYPE_8812A)
-		rtw_write32_mask(rtwdev, REG_AFE_CTRL3, 0x7FF80000,
-				 crystal_cap | (crystal_cap << 6));
-	else
-		rtw_write32_mask(rtwdev, REG_AFE_CTRL3, 0x00FFF000,
-				 crystal_cap | (crystal_cap << 6));
+	rtw88xxa_set_crystal_cap(rtwdev, rtwdev->efuse.crystal_cap & 0x3F);
 }
 
 static void rtw88xxa_phy_rf_config(struct rtw_dev *rtwdev)
@@ -1621,6 +1626,17 @@ void rtw88xxa_query_phy_status(struct rtw_dev *rtwdev, u8 *phy_status,
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
@@ -2009,6 +2025,21 @@ void rtw88xxa_phy_pwrtrack(struct rtw_dev *rtwdev,
 }
 EXPORT_SYMBOL(rtw88xxa_phy_pwrtrack);
 
+void rtw88xxa_cfo_track(struct rtw_dev *rtwdev)
+{
+	struct rtw_cfo_track *cfo = &rtwdev->dm_info.cfo_track;
+	bool bt_hold = rtwdev->efuse.btcoex && !rtw_coex_disabled(rtwdev);
+	u8 crystal_cap;
+
+	crystal_cap = rtw_phy_cfo_xcap_track(rtwdev, 0x3F, bt_hold);
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
index 0aaf7aa4aafdd396bff25a8fcd880a5514e589ba..09b72d33f62e1e99a2ac5af23ac1630dabb38ef9 100644
--- a/drivers/net/wireless/realtek/rtw88/rtw88xxa.h
+++ b/drivers/net/wireless/realtek/rtw88/rtw88xxa.h
@@ -172,5 +172,6 @@ void rtw88xxa_phy_pwrtrack(struct rtw_dev *rtwdev,
 			   void (*do_iqk)(struct rtw_dev *rtwdev));
 void rtw88xxa_bf_config_bfee(struct rtw_dev *rtwdev, struct rtw_vif *vif,
 			     struct rtw_bfee *bfee, bool enable);
+void rtw88xxa_cfo_track(struct rtw_dev *rtwdev);
 
 #endif
-- 
2.55.0

