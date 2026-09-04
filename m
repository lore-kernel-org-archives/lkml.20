Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F52E3B9D9A
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 22:26:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788560776; cv=none; b=PpSV+gG49No9Up/lEEl50CfCJHvpcDqdQbBLIviNFg62bSCE+R6ftPbG/FyhRMY1upwKGjnt3rD/qXor9bk+GcDHe++vv6xSl2KPn/Ztyy7Og18Dob+dHsAN6r0GmT3xJAcOLf6mryl4HqVLOwOWHE5Kd4CKOAv6UVlV6Gjfo/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788560776; c=relaxed/simple;
	bh=QXDjziV5jsAxFD0i2Nz836vwk9NS4JhR6oQGqwf4nK0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UjVGv7p/aTzfqzdmIPT1af8GI0yGQ6Nuzl3mgiv0ICxZA/V2jjURpvnzoSXew0Lq14XsE9W7zIaJ/Q+5ct/CpcbmnkXMKlGimXJVKfiF+0ZdupC6biQzvrX8+4tb3IjzTexjkkBi2oiaDZIQolvAAOeSgBJOPSfamB2nfJvdqlI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N4X7V0Ft; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N4X7V0Ft"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5b15dcaca31so1481539e87.0
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 15:26:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788560772; x=1789165572; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=6crAb0tNhcnqWfdHiB+qm3RL/vD3R/3sYirXmsIa7Kg=;
        b=N4X7V0FtLGtanNAV32ss4IxCrUEK3liVUYamjXxR3eDO+yIQ/Wj42p4+67p0YM0AF4
         bYRvRfyq6/iBuejxecE25S4j0SpDQLhM37RmqClWERA4U3Cs04lades9CTMwDizh8OH7
         ZYggfIuUX3aZQbMh+/6HWzSPRxPJfxPtpzrzYkxqnWfDL/97oK4W2VWbGzpb2HBbLfNQ
         bGBCYYpqEfsS2+JYcr25jWbli+Ii6L5tBeqNzw/HoUyFhsC6iC9DmPG8VsdWG8ptasOU
         Wso2yVIeUFoM5fRYPfYd+NnBSvxBCVy7D9IkQASgRtuJMyoJ8OsN+Ck5l8CthqPqLVt/
         sEpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788560772; x=1789165572;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6crAb0tNhcnqWfdHiB+qm3RL/vD3R/3sYirXmsIa7Kg=;
        b=ohphcrtbLRxbNiOpnsOmdrNWLZr5/Zjh9fFvuFLZKSV0qcy4St/Cv6ytE/DPWY8Lnm
         BK+jHtYSiM2/edX+vcrjNmooQWKzoSs2EpxVWyAUzOBZd1rOFtEmqA3tO/cdqe2mEk3B
         6CNH8+rIvHHDjWznpDgtP5EcqrsdpVgQWPQN1fhiSpaTBmxaWeyViT5scRY/wKJRImGr
         E2xucrEi3v6LY9fO3wzI+ggjWWlalzSeOjgYrDcaEUKRQPsi8DJ4ci0bIC1OeiNUSB+L
         1Ou//cyvhu+1pH/EPWsqJVAPjq4IAcbHlmZnEmbPuv+hvqBVl4jsBjV2QB+LCU6E6CQG
         Y0lA==
X-Forwarded-Encrypted: i=1; AKwUvBys4wmB1NUaEX0Jdr7Lvo7aeAb8J+AUe2wPS7aX4xbU8CdCntA1MP/AChZAhNZ23wXoZYs0wROCOOhoDhk=@vger.kernel.org
X-Gm-Message-State: AFuF++n0umazztKfZHrwdwnEWFpSfvH5I557IQZd3v1qNFxKcNl6dXf3
	hjo1I97+r5rPXHsHcjxPYX43lLYNp1xKrDrGDKam7e30zu4RaPh6bixb
X-Gm-Gg: AYBFou2X27UKWku7vOqnGr9ZQ26btSSQNyot3mTb3JDmQneb1tKDNIWTkHIsqqD5xh9
	DY6fQ/CUUATV7lfBL1klPXzQQDBFfFW6PKKAD1qUVwOvsLGSd/ABDH6Pw7rYU8ngegR4kboDkjO
	RTh6iEZuPitcSPwApJjo92i+Aa1oUDTiqsSCSIRIMmGBVn1xB9adKyg0aKx5LixsBMoGVYkL0p/
	9H4IhCk4lFjLNKHnpFf5PCiQnZffbn4Md6xaW5cKa6TSfnqvCOkF1qc/klhQ7E/3iwkgrV+LEyM
	wZz+7M07R8IwI3GCT1le5JLn1gAnaCUZTuo9Sjg9TIMVVWpPbAwh6+OxgbrNC1RsZoUEGWrDvMD
	JsGucgMeo54CpkGWKBHyw51j9XCeoIhJN6TxtzpQuNgWUiXBt4AWybJgD5j8tzTn8hXG04b0lBi
	hmMTUFuVTGO/UXtW3fv3SxkL3s937zcNoazLUAGMB32sVHUeQZnKJ/7GSG8zU6Eali9tfd2vQdV
	0jW
X-Received: by 2002:a05:6512:3d07:b0:5b1:58d6:4542 with SMTP id 2adb3069b0e04-5b616eec9fdmr2723564e87.14.1788560771955;
        Fri, 04 Sep 2026 15:26:11 -0700 (PDT)
Received: from localhost.localdomain ([80.66.93.26])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b61669b199sm767505e87.2.2026.09.04.15.26.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 15:26:11 -0700 (PDT)
From: Maxim Skokov <skokovmaksimevg@gmail.com>
To: Ping-Ke Shih <pkshih@realtek.com>
Cc: linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Maxim Skokov <skokovmaksimevg@gmail.com>
Subject: [PATCH] wifi: rtw89: fix typos in comments, debug messages and struct field
Date: Sat,  5 Sep 2026 01:25:33 +0300
Message-ID: <20260904222548.19732-1-skokovmaksimevg@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Correct several misspellings found by codespell:

  moniter   -> monitor     (struct rtw89_btc_wl_role_info_bpos field)
  serach    -> search      (comment)
  Unsupport -> Unsupported (error message)
  nofity    -> notify      (comment)
  updat     -> update      (debug message)
  lagacy    -> legacy      (comment)

The renamed struct field has no users, so no further changes are
needed. No functional changes.

Signed-off-by: Maxim Skokov <skokovmaksimevg@gmail.com>
---

Notes:
    Found with codespell. Patch prepared with AI assistance; all changes reviewed by me.

 drivers/net/wireless/realtek/rtw89/core.h | 4 ++--
 drivers/net/wireless/realtek/rtw89/fw.c   | 4 ++--
 drivers/net/wireless/realtek/rtw89/phy.c  | 4 ++--
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/net/wireless/realtek/rtw89/core.h b/drivers/net/wireless/realtek/rtw89/core.h
index 2b21d969e..814f3b94c 100644
--- a/drivers/net/wireless/realtek/rtw89/core.h
+++ b/drivers/net/wireless/realtek/rtw89/core.h
@@ -1904,7 +1904,7 @@ struct rtw89_btc_wl_role_info_bpos {
 	u16 adhoc: 1;
 	u16 adhoc_master: 1;
 	u16 mesh: 1;
-	u16 moniter: 1;
+	u16 monitor: 1;
 	u16 p2p_device: 1;
 	u16 p2p_gc: 1;
 	u16 p2p_go: 1;
@@ -3925,7 +3925,7 @@ struct rtw89_btc_fddr_cell {
 struct rtw89_btc_fddr_result {
 	u8 wl_rx_limit;
 	u8 wl_rx_limit_step[6]; /* record search process */
-	u8 search_cnt; /* the rx-limit serach count */
+	u8 search_cnt; /* the rx-limit search count */
 	u32 wl_tp;
 	u32 wl_tp_step[6]; /* record search process */
 };
diff --git a/drivers/net/wireless/realtek/rtw89/fw.c b/drivers/net/wireless/realtek/rtw89/fw.c
index 0099c5c03..ecedfd6f6 100644
--- a/drivers/net/wireless/realtek/rtw89/fw.c
+++ b/drivers/net/wireless/realtek/rtw89/fw.c
@@ -306,7 +306,7 @@ static int __parse_formatted_mssc(struct rtw89_dev *rtwdev,
 		if (mss_hdr->defen)
 			rmp_tbl_size += FWDL_MSS_POOL_DEFKEYSETS_SIZE;
 	} else {
-		rtw89_err(rtwdev, "[ERR] MSS Key Pool Remap Table Format Unsupport:%X\n",
+		rtw89_err(rtwdev, "[ERR] MSS Key Pool Remap Table Format Unsupported:%X\n",
 			  mss_hdr->rmpfmt);
 		return -EINVAL;
 	}
@@ -11214,7 +11214,7 @@ int rtw89_fw_h2c_wow_request_aoac(struct rtw89_dev *rtwdev)
 
 	skb_put(skb, len);
 
-	/* This H2C only nofity firmware to generate AOAC report C2H,
+	/* This H2C only notify firmware to generate AOAC report C2H,
 	 * no need any parameter.
 	 */
 	rtw89_h2c_pkt_set_hdr(rtwdev, skb, FWCMD_TYPE_H2C,
diff --git a/drivers/net/wireless/realtek/rtw89/phy.c b/drivers/net/wireless/realtek/rtw89/phy.c
index c78107e92..43b3552f5 100644
--- a/drivers/net/wireless/realtek/rtw89/phy.c
+++ b/drivers/net/wireless/realtek/rtw89/phy.c
@@ -525,7 +525,7 @@ void rtw89_phy_ra_update_sta_link(struct rtw89_dev *rtwdev,
 		ra->upd_bw_nss_mask = 1;
 
 	rtw89_debug(rtwdev, RTW89_DBG_RA,
-		    "ra updat: macid = %d, bw = %d, nss = %d, gi = %d %d",
+		    "ra update: macid = %d, bw = %d, nss = %d, gi = %d %d",
 		    ra->macid,
 		    ra->bw_cap,
 		    ra->ss_num,
@@ -659,7 +659,7 @@ void __rtw89_phy_rate_pattern_vif(struct rtw89_dev *rtwdev,
 					  0, true))
 			goto out;
 
-	/* lagacy cannot be empty for nl80211_parse_tx_bitrate_mask, and
+	/* legacy cannot be empty for nl80211_parse_tx_bitrate_mask, and
 	 * require at least one basic rate for ieee80211_set_bitrate_mask,
 	 * so the decision just depends on if all bitrates are set or not.
 	 */
-- 
2.47.3

