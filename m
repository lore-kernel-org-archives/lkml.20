Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BB7842464E
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 14:33:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791210809; cv=none; b=WFWkalViOSpW0xwxpiLuHETuahd4ygrNluIdh2yCTGk4S3JVTGd9DCGHtg6TB2EBKP8YSm0SodWdFU40hokFMKZBUQ03QK2tWPf+Z8htT1yKfIgNS/reYfJxI3hW5eSUqA2Mp/Ghh51tIyJ6F9h5dBzsCeV3x0ilnhQzoTaW144=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791210809; c=relaxed/simple;
	bh=ZsZHkcJx9ATC2tiTAwMr97NELUFCoYknk9e4btsEzKw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UZSwmXbTj90FiH2ZFCl9bjLFC3EfdCnWG38AiNwu7cAhI8ohFSu8nnLej4lDjqpTIaXUIVG1fmI4RVTb+wEvQVp/u6SdwRRtnVOabriud5oyBu0gWQ9Hr67HNPt/6++7zEhLpMRHnTYFuE75qs8zZhz7Yf24L7/dPdHbDEFgZx8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lc9iW8fi; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lc9iW8fi"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a1635f7c89so17151535e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 07:33:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791210797; x=1791815597; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gJBmC6lInBWlZ8zhcwEQA8KotxGA62ubikb5bUiBrQw=;
        b=lc9iW8fimeq4hVFwUKWz/LsKQETXracIEQKSAJKQ3ETILOwWq8O2xAsgUV6fbP9Lgn
         qNF9Jbk8Zg6HwGKPhNk35V/HJ6KdVIVSxwRCsMrlAg873boQ0ArO0yr+n0pWnu8jhHJG
         2jwxWaumW0y9cx2WyTrRNBK/rwQtDLibyPpq55B4JMaBoXpmZa2mPvYMAbNyl8tazxDW
         ibzUDTEyHZmH785AOtMfMGxi+n0DofvxlxH1khY96xzK3rcriHjpi+AHFdlNzLlRGedb
         q+Cw4M1robEB+/7CSagHi0YS6KhQB5yBfrKKQkI8Nbzd71qKjv+b86ZfJg43fNmBcq71
         atrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791210797; x=1791815597;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gJBmC6lInBWlZ8zhcwEQA8KotxGA62ubikb5bUiBrQw=;
        b=lYRGkgFKY1gGMzR5X/TBGYiPxELAdXImu0Akcf5hGSSkyupM7JMsflaRRkOy/SoQXV
         v5RwJT93BsVcJcMwIkGivM7lgNvO7ML0G0YjgnAQ/MMDXuPBQPltZRKIdT0qQ5qc4OZd
         5f/QEmaTLncocFrPZ4+HLYBKcCB300HkQebKQMkzoIi75A8DmRTuzEJEdI95SDeNjSF9
         jpJG9DUvQKM+8Y2o+C+kur47VzeitFEgxAIhZIjOy+KTK8/W8DZteRwhe+SduvXKQbiM
         ck8kd0hfh5aWXnJ+TFgy1zGgloccsPwNxzgKdUY0AlmkvSSB08s0QtRPWjCBwRDoYeCL
         zVDw==
X-Forwarded-Encrypted: i=1; AKwUvBwt1bp6xx3O3AGhhH8cE7h8g1nL2SHKL+OXRnnTBsp/3glLEdoZTFXetBIrA0vW7ED7aBCtl78eP9FetNo=@vger.kernel.org
X-Gm-Message-State: AFuF++l0rp7DTnsLEvAdk2nDf2eqEoguXQ6oClUFGYVTTijgjGlKuRRD
	5ZGdtt04/ELcEwoh5pESOeWsPNptA8xMoAhE1NgCTKWis4HnvP2CZdzK
X-Gm-Gg: AYBFou2q31aFhWPssA6SemLn9NlG2lnI3Yj3I6baj1p91UQPf/dx/4WprGq5txtKqQj
	gZEieQvmAaezB9E+Ve+71ZiFbwOeYVuGVG0Z62OMDSKGdw+ndGrFommvOpE345+IMKVTxPxeWyj
	OJY56aT4zXThfA8eXjf7KT7dweivce/flkcK2FYTvw6kUt0M6sy8PFlSiLen6037rKz9Pp7Jd0c
	/rEtIDa8xRJ5RDiQJ0mAeh0TeAx0/YEBo4WVXpjXVSTTbAJIKz/MVxk8VmdXTRUgQzyswpWU02y
	0JN0Gum1MYesz9bxtMAxjgVCTRJOv1Af2+ulR7djGbU3IBqbgsTxu02ONretN5uVkKSMKZaPqhr
	ttHDR6xrZTg68cClyE06vt5ZsPBQemd/2HLJCAiZcED7/1mkzXG1+hPBSAW1in3RUsx62YTKxuI
	W68GZ0XaCP0VeIplG0IauCz7fTpjC6tWImo5x4V2kCh6xzl/GeNNJzAsiyulibdtWYizJJf5flV
	ijXOQ==
X-Received: by 2002:a05:600c:4593:b0:4a1:6dc3:f5e2 with SMTP id 5b1f17b1804b1-4a16dc3f679mr78929545e9.33.1791210796871;
        Mon, 05 Oct 2026 07:33:16 -0700 (PDT)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a027f2a4c4sm363011895e9.2.2026.10.05.07.33.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 07:33:16 -0700 (PDT)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Ping-Ke Shih <pkshih@realtek.com>
Cc: Luka Gejak <luka.gejak@linux.dev>,
	Bitterblue Smith <rtl8821cerfe2@gmail.com>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mehmet.fide@screeningeagle.com
Subject: [PATCH rtw-next v3 1/2] wifi: rtw88: download the beacon the reserved page was built with
Date: Mon,  5 Oct 2026 16:33:12 +0200
Message-ID: <20261005143313.129670-2-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261005143313.129670-1-mehmet.fide@gmail.com>
References: <20261005143313.129670-1-mehmet.fide@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mehmet Fide <mehmet.fide@screeningeagle.com>

rtw_fw_download_rsvd_page() downloads the beacon twice: once as part of
the reserved page and once more on its own, so that the firmware ends up
with a TX descriptor that describes the beacon rather than the whole
page. The second download fetched a new beacon from mac80211 instead of
downloading the one the page already holds.

Besides the extra work, every beacon fetch advances the DTIM count and,
while a channel switch is announced, the CSA countdown; doing it twice
per update lets a countdown that starts at 2 reach 0, which mac80211
warns about. Hand the beacon skb out of the page build and download
that. The hw scan, which downloads the beacon without a page build,
keeps fetching its own.

Signed-off-by: Mehmet Fide <mehmet.fide@screeningeagle.com>
Acked-by: Ping-Ke Shih <pkshih@realtek.com>
---
 drivers/net/wireless/realtek/rtw88/fw.c | 34 +++++++++++++++----------
 1 file changed, 21 insertions(+), 13 deletions(-)

diff --git a/drivers/net/wireless/realtek/rtw88/fw.c b/drivers/net/wireless/realtek/rtw88/fw.c
index 945fedcd375b..3cd17a3bb494 100644
--- a/drivers/net/wireless/realtek/rtw88/fw.c
+++ b/drivers/net/wireless/realtek/rtw88/fw.c
@@ -1622,7 +1622,8 @@ static int  __rtw_build_rsvd_page_from_vifs(struct rtw_dev *rtwdev)
 	return 0;
 }
 
-static u8 *rtw_build_rsvd_page(struct rtw_dev *rtwdev, u32 *size)
+static u8 *rtw_build_rsvd_page(struct rtw_dev *rtwdev, u32 *size,
+			       struct sk_buff **beacon)
 {
 	const struct rtw_chip_info *chip = rtwdev->chip;
 	struct ieee80211_hw *hw = rtwdev->hw;
@@ -1702,13 +1703,15 @@ static u8 *rtw_build_rsvd_page(struct rtw_dev *rtwdev, u32 *size)
 	list_for_each_entry(rsvd_pkt, &rtwdev->rsvd_page_list, build_list) {
 		rtw_rsvd_page_list_to_buf(rtwdev, page_size, page_margin,
 					  page, buf, rsvd_pkt);
-		if (page == 0)
+		if (page == 0) {
 			page += rtw_len_to_page(rsvd_pkt->skb->len +
 						tx_desc_sz, page_size);
-		else
+			/* the caller downloads it once more on its own */
+			*beacon = rsvd_pkt->skb;
+		} else {
 			page += rtw_len_to_page(rsvd_pkt->skb->len, page_size);
-
-		kfree_skb(rsvd_pkt->skb);
+			kfree_skb(rsvd_pkt->skb);
+		}
 		rsvd_pkt->skb = NULL;
 	}
 
@@ -1723,11 +1726,12 @@ static u8 *rtw_build_rsvd_page(struct rtw_dev *rtwdev, u32 *size)
 	return NULL;
 }
 
-static int rtw_download_beacon(struct rtw_dev *rtwdev)
+/* the beacon the page was built with, or a fresh one for the hw scan */
+static int rtw_download_beacon(struct rtw_dev *rtwdev, struct sk_buff *beacon)
 {
 	struct ieee80211_hw *hw = rtwdev->hw;
 	struct rtw_rsvd_page *rsvd_pkt;
-	struct sk_buff *skb;
+	struct sk_buff *skb = beacon;
 	int ret = 0;
 
 	rsvd_pkt = list_first_entry_or_null(&rtwdev->rsvd_page_list,
@@ -1744,7 +1748,8 @@ static int rtw_download_beacon(struct rtw_dev *rtwdev)
 		return -EINVAL;
 	}
 
-	skb = rtw_get_rsvd_page_skb(hw, rsvd_pkt);
+	if (!skb)
+		skb = rtw_get_rsvd_page_skb(hw, rsvd_pkt);
 	if (!skb) {
 		rtw_err(rtwdev, "failed to get beacon skb\n");
 		return -ENOMEM;
@@ -1754,18 +1759,20 @@ static int rtw_download_beacon(struct rtw_dev *rtwdev)
 	if (ret)
 		rtw_err(rtwdev, "failed to download drv rsvd page\n");
 
-	dev_kfree_skb(skb);
+	if (!beacon)
+		dev_kfree_skb(skb);
 
 	return ret;
 }
 
 int rtw_fw_download_rsvd_page(struct rtw_dev *rtwdev)
 {
-	u8 *buf;
+	struct sk_buff *beacon = NULL;
 	u32 size;
+	u8 *buf;
 	int ret;
 
-	buf = rtw_build_rsvd_page(rtwdev, &size);
+	buf = rtw_build_rsvd_page(rtwdev, &size, &beacon);
 	if (!buf) {
 		rtw_err(rtwdev, "failed to build rsvd page pkt\n");
 		return -ENOMEM;
@@ -1782,13 +1789,14 @@ int rtw_fw_download_rsvd_page(struct rtw_dev *rtwdev)
 	 * the beacon again to replace the TX desc header, and we will get
 	 * a correct tx_desc for the beacon in the rsvd page.
 	 */
-	ret = rtw_download_beacon(rtwdev);
+	ret = rtw_download_beacon(rtwdev, beacon);
 	if (ret) {
 		rtw_err(rtwdev, "failed to download beacon\n");
 		goto free;
 	}
 
 free:
+	dev_kfree_skb(beacon);
 	kfree(buf);
 
 	return ret;
@@ -2345,7 +2353,7 @@ int rtw_hw_scan_offload(struct rtw_dev *rtwdev, struct ieee80211_vif *vif,
 	rtw_fw_set_scan_offload(rtwdev, &cs_option, rtwvif, &chan_list);
 out:
 	if (rtwdev->ap_active) {
-		ret = rtw_download_beacon(rtwdev);
+		ret = rtw_download_beacon(rtwdev, NULL);
 		if (ret)
 			rtw_err(rtwdev, "HW scan download beacon failed\n");
 	}
-- 
2.55.0

