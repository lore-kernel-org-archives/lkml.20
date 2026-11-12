Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794504789;
	b=Emne+mLwgZkT44wibj/6F94CzJS9zMh7kOwtQSNysqMO3ebUZ6c1BkhPfONU+odLjb1a
	 s+44y6Fxi19N0Tcs/CuxgPG3cqSPEAij3g4TzbGp0oR0b4cZ6LSZgttFjt1ScchX/kQd0
	 jpJhpp2DDjWN1/ZvAEduO48x/YMWcCFxIGPKF6Fi+WUFT8Xli5iS71tpqriFyoDa91dQ0
	 4/OcMtGyqejy4wtQHLxDg6th9ETsSG6peaD+FdaoOBx/2F9xCH6nLh5/PSHVYn/Id8Hk/
	 9xhsueLHIFixltb0XTsE/7dRmOBn7MMFrX2jtwOfYqAD7vjhQvwl8+YTPx4bHzVz87A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794504789;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Bi9izper4hhzVGDMuEBOOUEjObfUjf3Mhvpg/zT4k3A=;
	b=jCYdoo/PFUP7G6St1QtjNuPFxXwfbhU25T6sZZLjVsuTCTE9UL+W5z2iTP0D3nTH1nc6
	 vogBHhBdxFvF6ifGRehdvLHMJcNZl2vA165ZaofZFh5ygOaCcmNglUiest0M9+KUkH0S4
	 SDtY+PlZH5JmkTMpw1qdFp9PsI03WcvjLebyRcOjEq9GSSMR/4zyubcrEVu57+rEIUxCw
	 CC3qwSNICwGS4AZyU2nxZiVuBPqViXJjECd4jr3DSh0wk+CMb3c+bkhE3khK5GBEBduIL
	 2/GtPyiBe0tmDiGqo0S2Hj+em5NIkdHakEb3Ey2uPeB4tP6I1ASJyEhfZ99UcnJDIiQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="FTMt/huU";
	arc=none smtp.remote-ip=209.85.216.41
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B98BE606A338
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 17:33:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B98BE606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FTMt/huU
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-3ae691283ecso37965a91.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 09:33:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794504788; x=1795109588; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Bi9izper4hhzVGDMuEBOOUEjObfUjf3Mhvpg/zT4k3A=;
        b=FTMt/huUXEfLvXkoxiRsga2h+M6+IaVfmsnLYZA0LVzzcswoqnfhQCTMYVdm8fntQF
         hAyCr873R0OukT7xdhlHypjV9xU97gXGOIrnmScHXhmzPUPnwUSHCB4Om9DvDrflcXTP
         Gy5eOlPaYxmEw6+X8LoLjVLwh/vmHQevFhodSjkYXPthcR8OndKvLhMpzlQo8Vii+epU
         uG0XaWAwOyu8kfMEwPD9n3+RvT1rupZKMIKmj41hMX2Tr7yKPC5lto2hKfrnjGbj47wK
         D+iR0jYxtPJ+62usYc3wjyrvLSwOt9eAoZDsvPkLBoqp0c24JuY2NMN8kSyC9C1iUa6Z
         7IJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794504788; x=1795109588;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Bi9izper4hhzVGDMuEBOOUEjObfUjf3Mhvpg/zT4k3A=;
        b=Ef1fjT/g+YcUVivOw1ixgt4ZxPBp4cQqthGdKcBASnU9miuR13j6rcA+MP13X1UzrD
         CVjaET9IQfPBLmvmuZrRsUb3+oSiYajlvGtWxwLkciMkT7WngzH7C/wBMeyWvTnk5i6/
         c2ME6BXHxaZUtlHYSxq9UlOE9+6rLhhtim2dB0dzvUUPpraSryHVhTBPFYxWWMDBU6t7
         G85nEVX7/9KMKGZfujrQXf5e+qqTaXOvSqjDKj2o+BzI1qwuetiFPR6uHf1v2H7lBRkl
         XFD96hIQGZgDjmfXTnnMRrTYqM4JN6opIlOjOnnaCAaIX955Nppx1/ySEWdgBrS6VLeN
         fvRg==
X-Forwarded-Encrypted: i=1; AL+hErG0fO81wgPFRIk30vjONHcvSWAWWAwWUykClqwHgI+un3My9FfhERwax2h8Y+UafjDG0EM6G8elTpoPl90=@vger.kernel.org
X-Gm-Message-State: APuU4Z+AadbxzZO/gV2tHj18wJoljIBnaK7fszZm8euslImIGvwzs4XB
	U2z+5csGFmZomz+tadGy4js0LldmQ+TGwUwsS0DOiiw02WlB5vVjZPA4
X-Gm-Gg: AYBFou09axGfSohhLMg1ZtQ1mVjLUfhPrPNBapL5yI35NgK4OzZyVKKtLFiodSWLCDp
	hsvz07/Ex+BnUa/GeeJ6tMc4100l1dv+Wrt+SY+GafiO6b0xyvx1obDF9P5C9Q9VEkywqypZ5re
	mhKziCi6j17wbtMKXBfswCjJcN47pvfev/a/qmXxDTXnE+todLqYrW2aN0Uq1AaZO40FZLyDC1R
	AV6YYD3ZLZBOLKCffbRKWypRlSp1TIWiUWuDetclsbPwh4dLkrvdh5QjDTSWM5unS+9FXyeXcWG
	n7JwlZIe39eP8hDdNhdSFeepW6TeOxJ2sItHix/gbMvP6xZJKdNPTw34d9Gxcnw2Jia/InnuclM
	ObAsC72BCRTuKUIdcpi07abVAS3IdMSCNy5BvXn2gW1JT1BtgG4MHzbvE0FRp4eJnhKKT5vm9HA
	4ONZBjtbMryVHI79rUlFv/Qo7LcQvPKY3bgeBBUAMk1+GbFOB6u8Do1wOiwA2mRIzZ9+Io8H1St
	l6q50gc1waLsu22+/WH5o4CwcuPxgBNp/nC0M/C8ftoBh+9hNgHp4FjSI0JNieH8jh0Han+P3jh
	48vf+qUK7dj68K1Qp7x3jBIuoQteI7IO+rp4fYuxcXmV7iz/mQMiIChF5PZUPdg8ioKfUSta5uF
	1A0N+r1pCNksmhnOfNq0rBDSp8HO+znOCLzWvdewchWqy
X-Received: by 2002:a17:90b:1dc7:b0:3a0:e568:ed63 with SMTP id 98e67ed59e1d1-3b197c81836mr2094024a91.8.1794504787846;
        Thu, 12 Nov 2026 09:33:07 -0800 (PST)
Received: from acemagic-m1.tail4fb79.ts.net ([2401:7400:c804:b668:2c54:4647:b67e:c94c])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1ae8be5adsm383532a91.0.2026.11.12.09.33.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 09:33:07 -0800 (PST)
From: Ho Jie Feng <hjf3108@gmail.com>
To: Ping-Ke Shih <pkshih@realtek.com>
Cc: linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bitterblue Smith <rtl8821cerfe2@gmail.com>,
	Luka Gejak <luka.gejak@linux.dev>,
	Ho Jie Feng <hjf3108@gmail.com>
Subject: [PATCH rtw-next v3 3/5] wifi: rtw88: prepare frequency-offset correction for more chips
Date: Fri, 13 Nov 2026 01:32:42 +0800
Message-ID: <20261112173246.3201729-4-hjf3108@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261112173246.3201729-1-hjf3108@gmail.com>
References: <20261112173246.3201729-1-hjf3108@gmail.com>
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

Promote chip specific functions into the common core for cfo tracking.
These become helpers which can be used by the other drivers.

Signed-off-by: Ho Jie Feng <hjf3108@gmail.com>
---
 drivers/net/wireless/realtek/rtw88/phy.c      | 106 ++++++++++++++++++
 drivers/net/wireless/realtek/rtw88/phy.h      |   2 +
 drivers/net/wireless/realtek/rtw88/rtw8822c.c | 100 +----------------
 drivers/net/wireless/realtek/rtw88/rtw8822c.h |   3 -
 4 files changed, 113 insertions(+), 98 deletions(-)

diff --git a/drivers/net/wireless/realtek/rtw88/phy.c b/drivers/net/wireless/realtek/rtw88/phy.c
index e2515a662b..d0c1fb65be 100644
--- a/drivers/net/wireless/realtek/rtw88/phy.c
+++ b/drivers/net/wireless/realtek/rtw88/phy.c
@@ -720,6 +720,112 @@ void rtw_phy_parsing_cfo(struct rtw_dev *rtwdev,
 }
 EXPORT_SYMBOL(rtw_phy_parsing_cfo);
 
+#define CFO_TRK_ENABLE_TH	20
+#define CFO_TRK_STOP_TH		10
+#define CFO_TRK_ADJ_TH		10
+
+static u8 rtw_phy_cfo_tracking_reset(struct rtw_dev *rtwdev)
+{
+	struct rtw_dm_info *dm_info = &rtwdev->dm_info;
+	struct rtw_cfo_track *cfo = &dm_info->cfo_track;
+
+	cfo->is_adjust = true;
+
+	if (cfo->crystal_cap > rtwdev->efuse.crystal_cap)
+		return cfo->crystal_cap - 1;
+	else if (cfo->crystal_cap < rtwdev->efuse.crystal_cap)
+		return cfo->crystal_cap + 1;
+
+	return cfo->crystal_cap;
+}
+
+void rtw_phy_cfo_xcap_init(struct rtw_dev *rtwdev)
+{
+	struct rtw_dm_info *dm_info = &rtwdev->dm_info;
+	struct rtw_cfo_track *cfo = &dm_info->cfo_track;
+
+	cfo->crystal_cap = rtwdev->efuse.crystal_cap;
+	cfo->is_adjust = true;
+}
+EXPORT_SYMBOL(rtw_phy_cfo_xcap_init);
+
+#define REPORT_TO_KHZ(val) ({typeof(val) _v = (val); (_v << 1) + (_v >> 1); })
+static s32 rtw_phy_cfo_calc_avg(struct rtw_dev *rtwdev, u8 path_num)
+{
+	struct rtw_dm_info *dm_info = &rtwdev->dm_info;
+	struct rtw_cfo_track *cfo = &dm_info->cfo_track;
+	s32 cfo_avg, cfo_path_sum = 0, cfo_rpt_sum;
+	u8 i;
+
+	for (i = 0; i < path_num; i++) {
+		cfo_rpt_sum = REPORT_TO_KHZ(cfo->cfo_tail[i]);
+
+		if (cfo->cfo_cnt[i])
+			cfo_avg = cfo_rpt_sum / cfo->cfo_cnt[i];
+		else
+			cfo_avg = 0;
+
+		cfo_path_sum += cfo_avg;
+	}
+
+	for (i = 0; i < path_num; i++) {
+		cfo->cfo_tail[i] = 0;
+		cfo->cfo_cnt[i] = 0;
+	}
+
+	return cfo_path_sum / path_num;
+}
+
+static void rtw_phy_cfo_need_adjust(struct rtw_dev *rtwdev, s32 cfo_avg)
+{
+	struct rtw_dm_info *dm_info = &rtwdev->dm_info;
+	struct rtw_cfo_track *cfo = &dm_info->cfo_track;
+
+	if (!cfo->is_adjust) {
+		if (abs(cfo_avg) > CFO_TRK_ENABLE_TH)
+			cfo->is_adjust = true;
+	} else {
+		if (abs(cfo_avg) <= CFO_TRK_STOP_TH)
+			cfo->is_adjust = false;
+	}
+}
+
+u8 rtw_phy_cfo_xcap_track(struct rtw_dev *rtwdev, u8 xcap_max, bool bt_hold)
+{
+	struct rtw_dm_info *dm_info = &rtwdev->dm_info;
+	struct rtw_cfo_track *cfo = &dm_info->cfo_track;
+	u8 path_num = rtwdev->hal.rf_path_num;
+	s8 crystal_cap = cfo->crystal_cap;
+	s32 cfo_avg = 0;
+
+	if (rtwdev->sta_cnt != 1)
+		return rtw_phy_cfo_tracking_reset(rtwdev);
+
+	if (cfo->packet_count == cfo->packet_count_pre)
+		return cfo->crystal_cap;
+
+	cfo->packet_count_pre = cfo->packet_count;
+	cfo_avg = rtw_phy_cfo_calc_avg(rtwdev, path_num);
+	rtw_phy_cfo_need_adjust(rtwdev, cfo_avg);
+
+	if (bt_hold) {
+		cfo->is_adjust = false;
+		return rtwdev->efuse.crystal_cap;
+	}
+
+	if (cfo->is_adjust) {
+		if (cfo_avg > CFO_TRK_ADJ_TH)
+			crystal_cap++;
+		else if (cfo_avg < -CFO_TRK_ADJ_TH)
+			crystal_cap--;
+
+		crystal_cap = clamp_t(s8, crystal_cap, 0, xcap_max);
+	}
+
+	return (u8)crystal_cap;
+}
+EXPORT_SYMBOL(rtw_phy_cfo_xcap_track);
+
 static void rtw_phy_cfo_track(struct rtw_dev *rtwdev)
 {
 	const struct rtw_chip_info *chip = rtwdev->chip;
diff --git a/drivers/net/wireless/realtek/rtw88/phy.h b/drivers/net/wireless/realtek/rtw88/phy.h
index 8a843aac73..b551cb860d 100644
--- a/drivers/net/wireless/realtek/rtw88/phy.h
+++ b/drivers/net/wireless/realtek/rtw88/phy.h
@@ -68,6 +68,8 @@ void rtw_phy_adaptivity_set_mode(struct rtw_dev *rtwdev);
 void rtw_phy_cck_pd_set(struct rtw_dev *rtwdev, u8 new_lvl);
 void rtw_phy_parsing_cfo(struct rtw_dev *rtwdev,
 			 struct rtw_rx_pkt_stat *pkt_stat);
+void rtw_phy_cfo_xcap_init(struct rtw_dev *rtwdev);
+u8 rtw_phy_cfo_xcap_track(struct rtw_dev *rtwdev, u8 xcap_max, bool bt_hold);
 void rtw_phy_tx_path_diversity(struct rtw_dev *rtwdev);
 
 struct rtw_txpwr_lmt_cfg_pair {
diff --git a/drivers/net/wireless/realtek/rtw88/rtw8822c.c b/drivers/net/wireless/realtek/rtw88/rtw8822c.c
index 09315d23e2..d7b0204e6d 100644
--- a/drivers/net/wireless/realtek/rtw88/rtw8822c.c
+++ b/drivers/net/wireless/realtek/rtw88/rtw8822c.c
@@ -4243,103 +4243,13 @@ static void rtw8822c_set_crystal_cap(struct rtw_dev *rtwdev, u8 crystal_cap)
 	rtw8822c_set_crystal_cap_reg(rtwdev, crystal_cap);
 }
 
-static void rtw8822c_cfo_tracking_reset(struct rtw_dev *rtwdev)
-{
-	struct rtw_dm_info *dm_info = &rtwdev->dm_info;
-	struct rtw_cfo_track *cfo = &dm_info->cfo_track;
-
-	cfo->is_adjust = true;
-
-	if (cfo->crystal_cap > rtwdev->efuse.crystal_cap)
-		rtw8822c_set_crystal_cap(rtwdev, cfo->crystal_cap - 1);
-	else if (cfo->crystal_cap < rtwdev->efuse.crystal_cap)
-		rtw8822c_set_crystal_cap(rtwdev, cfo->crystal_cap + 1);
-}
-
-static void rtw8822c_cfo_init(struct rtw_dev *rtwdev)
-{
-	struct rtw_dm_info *dm_info = &rtwdev->dm_info;
-	struct rtw_cfo_track *cfo = &dm_info->cfo_track;
-
-	cfo->crystal_cap = rtwdev->efuse.crystal_cap;
-	cfo->is_adjust = true;
-}
-
-#define REPORT_TO_KHZ(val) ({typeof(val) _v = (val); (_v << 1) + (_v >> 1); })
-static s32 rtw8822c_cfo_calc_avg(struct rtw_dev *rtwdev, u8 path_num)
-{
-	struct rtw_dm_info *dm_info = &rtwdev->dm_info;
-	struct rtw_cfo_track *cfo = &dm_info->cfo_track;
-	s32 cfo_avg, cfo_path_sum = 0, cfo_rpt_sum;
-	u8 i;
-
-	for (i = 0; i < path_num; i++) {
-		cfo_rpt_sum = REPORT_TO_KHZ(cfo->cfo_tail[i]);
-
-		if (cfo->cfo_cnt[i])
-			cfo_avg = cfo_rpt_sum / cfo->cfo_cnt[i];
-		else
-			cfo_avg = 0;
-
-		cfo_path_sum += cfo_avg;
-	}
-
-	for (i = 0; i < path_num; i++) {
-		cfo->cfo_tail[i] = 0;
-		cfo->cfo_cnt[i] = 0;
-	}
-
-	return cfo_path_sum / path_num;
-}
-
-static void rtw8822c_cfo_need_adjust(struct rtw_dev *rtwdev, s32 cfo_avg)
-{
-	struct rtw_dm_info *dm_info = &rtwdev->dm_info;
-	struct rtw_cfo_track *cfo = &dm_info->cfo_track;
-
-	if (!cfo->is_adjust) {
-		if (abs(cfo_avg) > CFO_TRK_ENABLE_TH)
-			cfo->is_adjust = true;
-	} else {
-		if (abs(cfo_avg) <= CFO_TRK_STOP_TH)
-			cfo->is_adjust = false;
-	}
-
-	if (!rtw_coex_disabled(rtwdev)) {
-		cfo->is_adjust = false;
-		rtw8822c_set_crystal_cap(rtwdev, rtwdev->efuse.crystal_cap);
-	}
-}
-
 static void rtw8822c_cfo_track(struct rtw_dev *rtwdev)
 {
-	struct rtw_dm_info *dm_info = &rtwdev->dm_info;
-	struct rtw_cfo_track *cfo = &dm_info->cfo_track;
-	u8 path_num = rtwdev->hal.rf_path_num;
-	s8 crystal_cap = cfo->crystal_cap;
-	s32 cfo_avg = 0;
-
-	if (rtwdev->sta_cnt != 1) {
-		rtw8822c_cfo_tracking_reset(rtwdev);
-		return;
-	}
-
-	if (cfo->packet_count == cfo->packet_count_pre)
-		return;
-
-	cfo->packet_count_pre = cfo->packet_count;
-	cfo_avg = rtw8822c_cfo_calc_avg(rtwdev, path_num);
-	rtw8822c_cfo_need_adjust(rtwdev, cfo_avg);
-
-	if (cfo->is_adjust) {
-		if (cfo_avg > CFO_TRK_ADJ_TH)
-			crystal_cap++;
-		else if (cfo_avg < -CFO_TRK_ADJ_TH)
-			crystal_cap--;
+	u8 crystal_cap;
 
-		crystal_cap = clamp_t(s8, crystal_cap, 0, XCAP_MASK);
-		rtw8822c_set_crystal_cap(rtwdev, (u8)crystal_cap);
-	}
+	crystal_cap = rtw_phy_cfo_xcap_track(rtwdev, XCAP_MASK,
+					     !rtw_coex_disabled(rtwdev));
+	rtw8822c_set_crystal_cap(rtwdev, crystal_cap);
 }
 
 static const struct rtw_phy_cck_pd_reg
@@ -4985,7 +4895,7 @@ static const struct rtw_chip_ops rtw8822c_ops = {
 	.cfg_csi_rate		= rtw_bf_cfg_csi_rate,
 	.adaptivity_init	= rtw8822c_adaptivity_init,
 	.adaptivity		= rtw8822c_adaptivity,
-	.cfo_init		= rtw8822c_cfo_init,
+	.cfo_init		= rtw_phy_cfo_xcap_init,
 	.cfo_track		= rtw8822c_cfo_track,
 	.config_tx_path		= rtw8822c_config_tx_path,
 	.config_txrx_mode	= rtw8822c_config_trx_mode,
diff --git a/drivers/net/wireless/realtek/rtw88/rtw8822c.h b/drivers/net/wireless/realtek/rtw88/rtw8822c.h
index fc62b67a15..c27e4c394a 100644
--- a/drivers/net/wireless/realtek/rtw88/rtw8822c.h
+++ b/drivers/net/wireless/realtek/rtw88/rtw8822c.h
@@ -181,9 +181,6 @@ const struct rtw_table name ## _tbl = {			\
 #define REG_ANAPARLDO_POW_MAC	0x0029
 #define BIT_LDOE25_PON		BIT(0)
 #define XCAP_MASK		GENMASK(6, 0)
-#define CFO_TRK_ENABLE_TH	20
-#define CFO_TRK_STOP_TH		10
-#define CFO_TRK_ADJ_TH		10
 
 #define REG_TXDFIR0		0x808
 #define REG_DFIRBW		0x810
-- 
2.53.0

