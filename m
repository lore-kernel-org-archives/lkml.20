Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792529239;
	b=dyDOv9tlKh4NO9OV/u92RtPUvyEPKMxXX8/Nf6bM9Ra6zfcAoIhFB4IFCP51H5uMELwj
	 NJrnIVqrd21myD8KSF7tQRgj+JxL/CiXyN1hXPkStxq8GaYdwMIeZ6/Lm+R9B/IRyy1O0
	 fM367w9FwEMCeOZT/RI67DahslftkpeY1XdEqIuNUnVU+zUy73f4sgGQK055PhYKnTkvV
	 iveOKNLAnWPWA/rr/cCp7LOB47xrGK4x//NQcCrDIyfMMLEFUYiWgtDuIvI85BTzomfbS
	 vSDD99QdBh2WUE8fuaFEUEXHfxi1oPdB+3lFT8xJcN0L/syIKZtEq5hZf3BFmDelbyA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792529239;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=t9+2/srT1Yl5WnbPtJ2ZD+njESSgBUCFGexaWMTctmk=;
	b=azEo2A2e0gza9FEwWhlJpDWy2n5rF2mVwmBgqmDR4BVKcB7zCYyP9x2E8ZvUbMeWS2qI
	 QgrRsuOItcI1bSU2TdEdGfHArpcMgPg5fDSDK1fRZ9oLewFGyoXM1N9rZsBWViYTjb/PX
	 bSgcbkfl1/lnE+a8pKAtq4BJe8rpO2rS6rrEqHFJhd04+GjLCFc7zyT2nRAKDxHQELz/S
	 EA/FZflezdQl/ZIul2BhZSFFDrMUxk4kZ4Hc5ubjhr/4OzYsus3uLnOYuIFI4mPZEClh2
	 U/2PcaVgGD43+7AKsQOP1his0FILBQkbsIkohauCK+gjJjHxGFqcZ5KUcFjTFm7W5hQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=crqextMF;
	arc=none smtp.remote-ip=209.85.222.174
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2523606A32D
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 20:47:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D2523606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=crqextMF
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-93f269e335eso5907485a.3
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 13:47:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792529238; x=1793134038; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=t9+2/srT1Yl5WnbPtJ2ZD+njESSgBUCFGexaWMTctmk=;
        b=crqextMFfwmDnRvuRX6JR2gVYRyXbtV8mDsJ6NuPXSGM1mhSo/I8DO6v1oYiQ7vxmu
         lounEC1uysS+By7uGvwb6r17YxuUwgdPa0ewms3xhEebk7gO/8F8z2A3Bb9nLGgYD0i0
         8cbHVhApgKotf5X51U+KCHax7Upzr95TO7XobjOXvxoAe4w7FnYCgXo3DbEiNJ4OObu0
         ZYlwOGpcte5kzyTAbx+Se1tiPUTPrSOdL9UL7jjrOmd10R2gis8ezWF/VapA4iL8g6XW
         IsGdUbi0Jo1bmqdh24teLZKslra5kRdB+lEilwIFujPVSTXIQTRPGLMKbhww3EG3YVsk
         GICg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792529238; x=1793134038;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=t9+2/srT1Yl5WnbPtJ2ZD+njESSgBUCFGexaWMTctmk=;
        b=A+f7/0UgUvmYOdrCOql7qCK1HcvMknyQcaIcFuotbFfdrLuMFahvzOjDrMCQEo17+4
         IlD39SehENdtQJ6PLK45WKqv9prZqYB8M2ws0ZPR6Zz3NjZlaI+Z2Y4Ccy2k6+AiK95G
         AW1f7ZCsrdcMRTwX0CZhieBx56KIHuZVHhUj9i1gVuHXROC/l2NKw4coHAHQ3OeuIhPB
         m1YJVNUgof+faARhujb0FdnG3vR7T4xWN9OxzjTE3NFnyMK6J+sWtB2Vjl4/tq9UWEyy
         e0sgRyw7Rl/tkGozFVEuyFqJq7i1RFgSjnQMSfk80FJsMzpfhijNcUtDu3C8+6ihSw+U
         IBIA==
X-Forwarded-Encrypted: i=1; AKwUvByTERt8AXgrqo5PU6WV6htUbXrVStj0xriX/c+YLFTJUwdXOS3PJDTyV/Zj/6ocu6zdx42uQBphiinUXAI=@vger.kernel.org
X-Gm-Message-State: AFq9FYLYKx5k7vX3NBS0gJsQuFMWaou9KhLgx1vViCelfP17EeD1janr
	KAz4JOb5RRrEooeWYKEWtooEnMsUyxieMymzK/iHApp4R0xPeSriBagA
X-Gm-Gg: AYBFou06x257LFNIbhqDDtKHJynhx/PIAyhluzu5l3i1ygdhPcFmx5lY4rxGPsXcDdk
	wJa7kLYTu84MSr1QbBmOwlbZjVSvnOhotQfwvGlsi7/IcCSLewptoqgfx9061qKZAqLFylL1Gi+
	oRdJY83fu1FWh45FiuDxreMreUNFsjbybGxNKo6poep62lyioAW+mwF0d1j+Fk5iUTS12hrCLyo
	hZTT+NbxgY2Y7LnddemSSyndMsWTLrTWgW3G2bCPfVpV8ih12+cfNwShuVoCficImi60wYCvWSi
	kC+XIievh4UQrntfv21gjKAYy62g/jNAmY9UWcHtrsoY145Wv2LdXnJ24B9SGiyx4JsLXznW2KA
	DCnjhCGG29fT5pWWOWs537Qe5MfyZxvAca2GXYj8chyYRJYLldZ2SpQLSdJFM37SBS7gU6bYDef
	sMGGLgvOLr08EnkvdDdlXSb6B5/ehoNiWkilwE9kkgSVm31BlVMlA2IlbzgzanC9SZCXp0JNYej
	MTT
X-Received: by 2002:a05:620a:1708:b0:93e:f9ba:690f with SMTP id af79cd13be357-93f57f961cbmr81026085a.73.1792529237738;
        Tue, 20 Oct 2026 13:47:17 -0700 (PDT)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93f56c6f16dsm79336785a.4.2026.10.20.13.47.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 13:47:17 -0700 (PDT)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Ping-Ke Shih <pkshih@realtek.com>
Cc: Bitterblue Smith <rtl8821cerfe2@gmail.com>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mehmet.fide@screeningeagle.com
Subject: [PATCH rtw-next v7 1/3] wifi: rtw88: download the beacon the reserved page was built with
Date: Tue, 20 Oct 2026 22:47:10 +0200
Message-ID: <20261020204712.3252023-2-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261020204712.3252023-1-mehmet.fide@gmail.com>
References: <20261020204712.3252023-1-mehmet.fide@gmail.com>
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
Reviewed-by: Luka Gejak <luka.gejak@linux.dev>
Acked-by: Ping-Ke Shih <pkshih@realtek.com>
---

Notes:
    Changes in v7:
    - none, rebased on rtw-next
    
    Changes in v6:
    - none
    
    Changes in v5:
    - none
    
    Changes in v4:
    - none, rebased on rtw-next
    
    Changes in v3:
    - the beacon out-pointer is initialised in the caller

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

