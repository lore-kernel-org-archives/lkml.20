Received: from mail-ej2-f20.google.com (mail-ej2-f20.google.com [74.125.228.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80D34524B1F
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 14:19:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789654752; cv=none; b=RFq3x28D4mjtAGiexiRNwhYe9dNWUtAcjiCwxd2qb4rgBtE6Btn2/aNnrQ7iDZj/xPSVAof98vneZuvt/x/xmFbWWoyI0c6nwkkk7ZkU3rcN8aGHizZpfTokFpAoWJppPh+pZEpwRIgfTi8CKdUevcpxLf/V3ui3QDWKe6F99us=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789654752; c=relaxed/simple;
	bh=IxZyFnXliePRWCcIjxvmQV7E1mil2sax5/JRYLkSQRg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jdWJUq4YeAmWsvbNtOONqjHkc6auCz6N/Ia4PGwKIAWDPup6Mxh3wYsZPetCG56/IRJIri2Cc+g7xfPUmSz+VyJEVTTVUYSlWC2XDgBTeI6KOISr2Lv70Zp5GrYPN50wMm7+zM6wSZBHx6zlVe65lHBKq5mLkrObgw6Nq5akbHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Sq4kpmY2; arc=none smtp.client-ip=74.125.228.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Sq4kpmY2"
Received: by mail-ej2-f20.google.com with SMTP id a640c23a62f3a-c293c683202so139834066b.3
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 07:19:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789654748; x=1790259548; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=WyqQtjAVff76GSnCqr88eQwTvGpuf0/qYf/L0/lVgGg=;
        b=Sq4kpmY2mK+lVyFWenkKYXnzc8/0pMWn2btoxaShD+2P1JXo1N2pTYcLko8SA4HIFI
         yH5UvEVxmy1BRyMHdxZOF7ADqJTAKII5B/W2vBbPlraN/Sm6dUnD0P35EOENi8a+uNJg
         lGCM26/jXX3f30jE6aEQpX5s2P4p6H07W+uE59fA0sc8ur65AlQaby1nkmBbkHMeeGg8
         D/KThZYv/zqz9K2C0zItaK5c5iiuGrmgaKM13/mBblJwXdxQQJh+HmvKESDPZKj3iqvr
         hwqbVkByQrqMEWCegLIW4295Gerrl2JbBH7ySS3UVwRLpWD2Q5nXxeiPgwFhjzNyVKnU
         chIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789654748; x=1790259548;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WyqQtjAVff76GSnCqr88eQwTvGpuf0/qYf/L0/lVgGg=;
        b=c2RG6gigCvV+P4riBiApUapfSq9V08PnmQGZRDkBmUlbg5yYMjeazPPUXcG7RzI/4b
         IavZXhc4QloE9jsY1bp00KyFPA4GVREzDTjWgZgywXLJyD2uGt+5mZFn8Zn13aasg5Tv
         TFWW6fOConiRi/y9dZGR7RS42bRPo4wvI3eCwscjGXMRplMW8L4/Bnd0R0HgkGLgKCBA
         I9DCYRwzmFhMOBYPO23bKXS/y13SH+0Y6PqOQ2b2FMK+eBhhQlt95zxmXdtfEpM7bgx/
         y/ufjb8hayvuIINF9zDLUGCowLs5BQULqRYXGEyCgYDUivA/IPuOl/dA8br2URegoAOY
         hETA==
X-Forwarded-Encrypted: i=1; AKwUvBwrOCy2Ue96R42t5TKLaKfJHOr24zbFXMvjNYESW6J0a6B2svR0VUV9/Rv+cNlxDP2aUeplbgZ0SqLYVJg=@vger.kernel.org
X-Gm-Message-State: AFuF++kfra3q9qFLGoP4SkC9Gj7pTQM36LkniD11mvfKLY3/8rNd8XGv
	AqtKyx+jaYgW6oBGtOpMuKP/XoJIas8xhrnyoX8peeoKejHrY+0Hl1oA
X-Gm-Gg: AYBFou0Sdb19PK/sPRNaxJP7aRDxrU9lfzbdzqye9jiWJ776yLsAY/isJDJQauVTIjb
	utYT+nUxAAqqzaN+nn5FWsv5CJ7QDfze5I1gPf8w6QfZ9b7YYH/daf/MTfjU3NhykwJul7RuudM
	ISE18fkx2Ozbyzi7GUDTvDjNFK9Rs3Z38Ucw7dhjBKcAQOzRuUKP+Ldt6SC3rZgYjy5c49cxoMX
	uBgJrqXyztM/hDoxH6gfOV395XsnefIi8jzgnn0MSGc6/tEZ23MoLMjexM8FPjHUlWgZfoW0AY2
	x9MlOqLun5Cv8pOpyCYAsNAOvy0SxXURWoXFzX9GMvY37jY39c2Ok2LG6vQaQ0W3euQsqTSzmlc
	NmZUn9pXMcPqqvC6rrjkuAr+RfCsWdjk8KkueIx7iMOjoUjuSNtk9ZTSYI9SdzA14jgBIeArCla
	i0oNooDDOGjc4SUNpDPCGia0MAMXzixORY1kHK3e5kb8PChVlQTSV08mxEk1odCD/nDO1zgMr/f
	dK2
X-Received: by 2002:a17:907:1c01:b0:c29:555e:bf9 with SMTP id a640c23a62f3a-c29e5207acdmr502901166b.18.1789654747961;
        Thu, 17 Sep 2026 07:19:07 -0700 (PDT)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c29de63a7c8sm299898466b.51.2026.09.17.07.19.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 07:19:07 -0700 (PDT)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Ping-Ke Shih <pkshih@realtek.com>
Cc: Bitterblue Smith <rtl8821cerfe2@gmail.com>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mehmet.fide@screeningeagle.com
Subject: [PATCH rtw-next] wifi: rtw88: honour the transmit power mac80211 asks for
Date: Thu, 17 Sep 2026 16:19:06 +0200
Message-ID: <20260917141906.1361197-1-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mehmet Fide <mehmet.fide@screeningeagle.com>

The per-rate power index is the by-rate value capped by the regulatory
limit and the SAR limit; the level mac80211 hands over in conf.power_level
is never looked at, so "iw phy <phy> set txpower fixed <mBm>" is accepted
and silently ignored. Devices that share a small enclosure with their
client, or that must back off for coexistence, have no way to run below
the regulatory maximum.

Treat the requested level like the SAR limit: convert the dBm value to
the by-rate offset domain with the chip's gain index granularity and use
it as one more ceiling on the offset, then program the indices again
whenever the level changes. The level is the total the device may
radiate, so with two, three or four transmit paths each path gets 3, 5
or 6 dB less, the way ath9k and the vendor driver share it. mac80211
hands over the minimum of the regulatory maximum and the user's request,
so a channel's maximum is respected as well; before the first
configuration there is no request and nothing is capped, which keeps the
behaviour of a driver that does not honour the level at all.

Tested on RTL8822BU (2T) and RTL8821CU (1T) in AP mode: "fixed 1000"
moves every rate that sat above 10 dBm down to the 10 dBm index, less
the 3 dB path share on the 8822BU, while the rates already below stay,
"auto" restores the tables and the client stays associated through the
changes; a second radio saw the beacons drop by the requested amount.

Signed-off-by: Mehmet Fide <mehmet.fide@screeningeagle.com>
---
 drivers/net/wireless/realtek/rtw88/mac80211.c |  3 +++
 drivers/net/wireless/realtek/rtw88/phy.c      | 26 +++++++++++++++++++
 drivers/net/wireless/realtek/rtw88/phy.h      |  1 +
 3 files changed, 30 insertions(+)

diff --git a/drivers/net/wireless/realtek/rtw88/mac80211.c b/drivers/net/wireless/realtek/rtw88/mac80211.c
index 2a9b09fa76e7..e0462e934438 100644
--- a/drivers/net/wireless/realtek/rtw88/mac80211.c
+++ b/drivers/net/wireless/realtek/rtw88/mac80211.c
@@ -3,6 +3,7 @@
  */
 
 #include "main.h"
+#include "phy.h"
 #include "sec.h"
 #include "tx.h"
 #include "fw.h"
@@ -94,6 +95,8 @@ static int rtw_ops_config(struct ieee80211_hw *hw, int radio_idx, u32 changed)
 
 	if (changed & IEEE80211_CONF_CHANGE_CHANNEL)
 		rtw_set_channel(rtwdev);
+	else if (changed & IEEE80211_CONF_CHANGE_POWER)
+		rtw_phy_set_tx_power_level(rtwdev, rtwdev->hal.current_channel);
 
 	if ((changed & IEEE80211_CONF_CHANGE_IDLE) &&
 	    (hw->conf.flags & IEEE80211_CONF_IDLE) &&
diff --git a/drivers/net/wireless/realtek/rtw88/phy.c b/drivers/net/wireless/realtek/rtw88/phy.c
index e2ac5c6fd500..0dfcd0739423 100644
--- a/drivers/net/wireless/realtek/rtw88/phy.c
+++ b/drivers/net/wireless/realtek/rtw88/phy.c
@@ -2236,6 +2236,29 @@ static s8 rtw_phy_get_tx_power_sar(struct rtw_dev *rtwdev, u8 sar_band,
 	return (s8)rtwdev->chip->max_power_index;
 }
 
+static s8 rtw_phy_get_tx_power_user(struct rtw_dev *rtwdev, u8 band, u8 path,
+				    u8 rate)
+{
+	struct rtw_hal *hal = &rtwdev->hal;
+	const struct rtw_chip_info *chip = rtwdev->chip;
+	static const u8 path_share_dbm[] = { 0, 0, 3, 5, 6 };
+	int power_level = rtwdev->hw->conf.power_level;
+	u8 rs = rtw_phy_rate_to_rate_section(rate);
+	u8 paths = clamp_t(u8, hweight8(hal->antenna_tx), 1, 4);
+	s32 idx;
+	s8 base;
+
+	if (power_level <= 0 || rs == RTW_RATE_SECTION_NUM)
+		return (s8)chip->max_power_index;
+
+	idx = (power_level - path_share_dbm[paths]) << chip->txgi_factor;
+	base = band == PHY_BAND_2G ? hal->tx_pwr_by_rate_base_2g[path][rs] :
+				     hal->tx_pwr_by_rate_base_5g[path][rs];
+
+	return (s8)clamp_t(s32, idx, -chip->max_power_index - 1,
+			   chip->max_power_index) - base;
+}
+
 void rtw_get_tx_power_params(struct rtw_dev *rtwdev, u8 path, u8 rate, u8 bw,
 			     u8 ch, u8 regd, struct rtw_power_params *pwr_param)
 {
@@ -2248,6 +2271,7 @@ void rtw_get_tx_power_params(struct rtw_dev *rtwdev, u8 path, u8 rate, u8 bw,
 	s8 *limit = &pwr_param->pwr_limit;
 	s8 *remnant = &pwr_param->pwr_remnant;
 	s8 *sar = &pwr_param->pwr_sar;
+	s8 *user = &pwr_param->pwr_user;
 
 	pwr_idx = &rtwdev->efuse.txpwr_idx_table[path];
 	group = rtw_get_channel_group(ch, rate);
@@ -2272,6 +2296,7 @@ void rtw_get_tx_power_params(struct rtw_dev *rtwdev, u8 path, u8 rate, u8 bw,
 	*remnant = rate <= DESC_RATE11M ? dm_info->txagc_remnant_cck :
 					  dm_info->txagc_remnant_ofdm[path];
 	*sar = rtw_phy_get_tx_power_sar(rtwdev, hal->sar_band, path, rate);
+	*user = rtw_phy_get_tx_power_user(rtwdev, band, path, rate);
 }
 
 u8
@@ -2289,6 +2314,7 @@ rtw_phy_get_tx_power_index(struct rtw_dev *rtwdev, u8 rf_path, u8 rate,
 	offset = min3(pwr_param.pwr_offset,
 		      pwr_param.pwr_limit,
 		      pwr_param.pwr_sar);
+	offset = min(offset, pwr_param.pwr_user);
 
 	if (rtwdev->chip->en_dis_dpd)
 		offset += rtw_phy_get_dis_dpd_by_rate_diff(rtwdev, rate);
diff --git a/drivers/net/wireless/realtek/rtw88/phy.h b/drivers/net/wireless/realtek/rtw88/phy.h
index 8449936497bb..c26f18348709 100644
--- a/drivers/net/wireless/realtek/rtw88/phy.h
+++ b/drivers/net/wireless/realtek/rtw88/phy.h
@@ -155,6 +155,7 @@ struct rtw_power_params {
 	s8 pwr_limit;
 	s8 pwr_remnant;
 	s8 pwr_sar;
+	s8 pwr_user;
 };
 
 void
-- 
2.55.0

