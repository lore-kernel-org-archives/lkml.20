Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793253172;
	b=pkLGO/GNqGedFny+YDYQyyyqNNRDIOQFs10jIYererOO0TADe/bdovdG4uGyCnH9piW8
	 MLLLFQ5o1mUn25p3fgHBo9NS6+N+ZBtU2yMZH6+hBSuK1jtI5o6wBoUAMnKTZejbrRcIW
	 7KaSIEhQgxCyzE21OASc6YJ8SDSaQND26bo5SlZIhSW+HxKpaJHEEV6Fjjw1R/zfFxm1J
	 zbzODgL9oVtsVKCpru/yg+utXP1xjnUUTyBmVllB8mOOmu/BdId5qlzKp8Bky9nZpLfzo
	 2rV5JSjQlZfYx3W3BS+eQMkC+X5vFj7Xcq7kFDB5Pp4mXeQPuJNnZVXvqByjg9HSJLw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793253172;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=wqnw2SVFICJmyB2CE6aJCeG34DwAkjqaL2ooV287fPo=;
	b=4Ts6A9+nfXFpO+JMu7tbGjU8frUEBY/5tUtix3dqRNXJ9b6atxoKCy+D5ir3Sqd4zRV9
	 0yAJ01nLchoBo8YxMm+//lo4UxwD+ZhD8q3ulmm+toUQWJ595/CI+tWpMYV96CCpPsUri
	 8SX+BB1Em0aKRmQZgxqUcP4yqhdYtK7oG6JgLFwMUANfHs5TMxwxDibIT4LaQAKDk6A3f
	 cwLFj5d7bKubz7woJAQy+mzOBz1WxikukQz8x4v5AUaDTrX7ixq5WGV6a1jN/bg0U6AM1
	 rJGVlV86/A2Rsm3n1ROJG/cWk1oMH+KmdM8LnLodfBepvmbljN3l6sFOwf4HJZeXIHw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DACRyT9m;
	arc=none smtp.remote-ip=209.85.215.175
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA4CB606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 05:52:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DA4CB606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DACRyT9m
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-cd6a7b62ce8so829777a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 22:52:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793253171; x=1793857971; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wqnw2SVFICJmyB2CE6aJCeG34DwAkjqaL2ooV287fPo=;
        b=DACRyT9mI9NZXe4q91GANwaV50un6tB5ky/XHmVYUi458RYcv+MOcCqjLdmKW6aYq7
         gXC+T2wbtsH81I6GigF0upVP5g87HX1JWYkrJUULe2L0JbZyErRUnSQcvGJrWI/iwmv+
         0z+OcZ/ULYRohmo6/gRhcxPQA0fKWmzg96OWNlXLAGSlxXMF2l51N1QlBXYYLxSulZtt
         WlcKmONb9KH/HFD0jEVLmRujibsNfg8VRDXiziALBNabmE0GWNd9qecjQAm1AHtMiyMe
         8cvcdwf5gOwXZ+M/6F6iX7f3t2apWWTPyG8va4k+AuhhSE3yEru+is5/yuc1+qCC1OGp
         zC5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793253171; x=1793857971;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wqnw2SVFICJmyB2CE6aJCeG34DwAkjqaL2ooV287fPo=;
        b=TXlnO+cG0+Tf3rcY+5YuNXfzSUZNvBisGNO17Io1Ifm4iUc4/7A3kk3TyR6G5a9y77
         EhaatVkV36+15Srpku+H+DpQKTw4Rw4a8knctPoLYrW2QwOFa/ihSA9NfZuoKRZJvno+
         tMpX0utaA4Ecm/7rV96DuqUh00Qb+naxgqdrA4zi6zxjD2CGkt0FFpYQWzYS37q9swwl
         rSpVopvqCRnYUp18W4ncVSI7urUYiDQfVfLm3+pQaR9+FSil3MMIRVw1XugfFmTmOfzd
         hU+SqjqHwikxQkxzH4BFSUJjP3ELyXVvRDT25mPogUIOuwcyQqrmOJYBIA+YvL5VCMr2
         1slA==
X-Forwarded-Encrypted: i=1; AKwUvBze/Wqu3xL9L+qeVRrE5wAS4Ldwg4C7Z9OuApAFAtidtzlmH3Mhgf8KMfdSIgQOwq1m80k+GowcP2L8OGk=@vger.kernel.org
X-Gm-Message-State: AFq9FYKLB++BjKQXwBHAJKE6DwgQWztS5bwOzQRXasR9xKGH7EVNs2Gb
	Qszxbg2d5V2eUqL4cpx65xrwetrE46d9TqwtgvFo9NX/Md2k9VM8M7C0
X-Gm-Gg: AYBFou1Pb/yC0gAocderLK4VaPeXOGDcW9nmfxi2NrFjPfeev7YqdQM7hWiBEkc2ZLy
	7va2fFIdosxyKhCgYeBiK9bZloiPOhOkAcEPCBYnL382ymCM+R4I2NqfTLYpNkSV5fh49BAWIF0
	bnx+3waFv8a3V8Eq/TnpIx4iWIQ6HxueV9r/wGxne1Y5m2fKxplMjJ6fXFdO0g/4dIOSoZJW/ia
	GMvS3SI9lATCOsKqiZjzxSBblZWLdENVrEvFFodQp18voxQ+8Q+N9YJodr4bw9C0wHuW89Sg/yf
	3TA+sh+oglPvoys9Vw47K5IzgRsPtAjYdz5MKjeavu6ki/fH8kGsLZ/MeW/FWiIGXJdt2Ht03Hz
	yH7Yv/5EIso8xgzNcfbcrYly7LNWvqycVVL/R/SYWg3EOStpuRzR3saUcjaaecrmq8rdudsy3xi
	VspNduUWoEQHobcvgx/uv+QdH7Kun3hspRk0bsP1PI6QibsCeoaReuDD8EpxmblhDr7FvnupEVm
	WK8HvAgGASmbBXwSdAmWNVHEpFr5gQpEFoVjmxPPXpIGAlIcXNb6NyWjyPRPI8Ymz1NQbRB9Lm3
	BxbRM6iWpZP+5mjDgen9ulyMTRk4P3jzAlof0vLQFa/3WUle/wnpnlzl+u1Yt1LmGTR8ENhKhwZ
	rQPDoVg==
X-Received: by 2002:a17:90b:35cb:b0:3ac:8897:7b9f with SMTP id 98e67ed59e1d1-3ae5817ae3fmr3202592a91.43.1793253171072;
        Wed, 28 Oct 2026 22:52:51 -0700 (PDT)
Received: from hostname.tail4fb79.ts.net ([2401:7400:c804:b668:65cc:625f:9c43:1e88])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-3ae6e2a703esm2523531a91.0.2026.10.28.22.52.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 22:52:50 -0700 (PDT)
From: Ho Jie Feng <hjf3108@gmail.com>
To: Ping-Ke Shih <pkshih@realtek.com>
Cc: linux-wireless@vger.kernel.org,
	Ho Jie Feng <hjf3108@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 4/6] wifi: rtw88: 88xxa: correct carrier-frequency offset
Date: Thu, 29 Oct 2026 13:52:06 +0800
Message-ID: <20261029055212.84711-5-hjf3108@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261029055212.84711-1-hjf3108@gmail.com>
References: <20261029055212.84711-1-hjf3108@gmail.com>
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
index d0c1fb65be956..69998c0d7c1f8 100644
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
index 5d58dff4fcee7..c8008cf43da9d 100644
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
index 2db05a83766d6..3c65cd838ce15 100644
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
index 6d106ae70d914..17d3677ca463c 100644
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
index d3dd0ebfb4024..586bb57a10061 100644
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
index 0aaf7aa4aafdd..09b72d33f62e1 100644
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

