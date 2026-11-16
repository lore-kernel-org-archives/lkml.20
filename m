Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794813597;
	b=Bxk3mFTpCk/Yg2WoGSZ1nX6OoO2miqVedZa08kzNhrr9OwdIcGO708VboxfPVKTVj10u
	 aSKwZkZjWwc/DnQbBOW0/ib/iMLPwz7t6HKezHVoFBVGE52ThAiavX2T51/1Fl/wugvl/
	 9gpgAika9X3h7rmUg1iIa/V9gOftYZs5g84oPNVjgzHWvQybWlAjbhxE5POf3Xb5bmYqX
	 WMsy54v3vaXQTAWXs+akuLiCV4H+/nycBkkZKGrzjr3rpfiaWw8k8CTbNd2G1k3qFcFO2
	 957V4IHLFfRlvdZ9LzIYvYIHHxj05HiCA3X5pWRfAnF0ANdi0TCg6rg8WGajaOq2jWg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794813597;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=sU5T1xP7DUproec0DboEvKks+MNwjAq3XsA1UaAtqhk=;
	b=fYfjZHEUumAkNOx0Nl+smAViUJ+ZOqt++Gfwk6Y0AGwVYTq96PVYfUgbwB1VNbrynmD/
	 dyOivspZaVsDDcZpVh7/gQr+0Kr3ZbIN91Gjp/WGXqX5A7U+AfRZFSyc6l2Rfh5+Lusuq
	 MXJSyCWw5LrzadC2cPIeyCXQn9NyHUB+8pC/DjW5PSgaeDFxuR80BalRKS1xBrg9XoRAF
	 jnkT0HVsu349f50MvaRshoaZWYUXMDc5g6ZLoQBTnUipby4cXzOUvkAvBUSUWyl70ZLe3
	 yGL5iDEj8Tr8enQyRIh25ZkACl0gSERMa+1FvGdDieprJJ898HikHTcdasM4+7tpQPg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=j8hX0Zq9;
	arc=none smtp.remote-ip=209.85.221.41
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 209B8606A32F
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 07:19:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 209B8606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=j8hX0Zq9
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-49412eb1474so1426774f8f.3
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 23:19:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794813596; x=1795418396; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sU5T1xP7DUproec0DboEvKks+MNwjAq3XsA1UaAtqhk=;
        b=j8hX0Zq9ONnFll1pWRtqcs2TSCIUU4kzDpinIXNHBdpfTy4XFa6DA4cz+7aQS6uaVa
         e4bUsj38IfxM4YP6dgt38jR0sdVzDXZuUNwdCiMCCBS8PG59OxM8XaysoKp8TfZY4Dn1
         vcjkEyQKAiQQjMgrZop0+xWWT0Zi1yCcIMJbRi803Ww6FnOECu5v3K5QM6GsamF1o5jn
         cx8CGHnOnMRDh2Ca8RHtqjcfJRf6sLVyY49ImleP5bZU6HdcnCQi8riVY+2nDR++KmrX
         CmMhseMnoC+abGKGlQepl0ekhaPWdBNIofVR7ELtodc7fRBMU+b9wSwdpeWBUCAE8JjO
         3NUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794813596; x=1795418396;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=sU5T1xP7DUproec0DboEvKks+MNwjAq3XsA1UaAtqhk=;
        b=0mJWp0As2lEw4FVQ0F/OA9A5ZFRB5eEAF588rYyTViU9p1Ze66/2IV0zqXJ2WOvNwO
         OMFCYwARoDfKBMIKN+VYwqOGVG5qN5BGzU60jWyljDZE+1peEzYcZtIvj/IlQjexlKoQ
         QxjD4VWZoaCOxzH/Bgnlb9vjfrNi/yvZK+EBDjo9pawcLbilDGeqtpldG9A+wcVxMTpY
         zBp+aCA+LjLwVv/gJ9F+RKvllJkcOUcMSuMbo/gZ3Q+eZQKQpy8ntS/oRAsojsdaL3Op
         spsc+9/uJHLlof+L17vb7ph3R11Q8XEn/MVo7VlWGJJ5e0YwefKQ3s3bt3il1XqJ+e5Q
         nwQg==
X-Forwarded-Encrypted: i=1; AL+hErH3A9mptuo5xwS3juhIrBSkjUIZMuKUr0VjRbA+mpfrVmnMWkby1HIstRXWS8HdlpKp/Av2FmX7/zE9TFg=@vger.kernel.org
X-Gm-Message-State: APuU4Z/eBHow6X2xoaAerHQBeZPYiXMTn5FlS9Ksdgj9/X1HMT7yNKYE
	Sp+MkGmeBSGe1/aeYeEFwS76U7sRk0i+mL0/u/DBJ7FbiIZBAVUPN7mD
X-Gm-Gg: AYBFou24VbWWG1Uno5CK164tz0xZPG88QR3xBIT3zPbRJeZRF7Xs7bd2aMUHMkOwbFj
	BlOIGe7wzo9akSPZ99DWpm5VOTVkMAw+fxGGmx1KVvJSQhRvvsRB0Hk5D63SqX21kQXEg7D/TcG
	H7VhMa239CYxBcRxpt7de34M4kPkBS+LKH2M7Yb0X+5waHOWNxhRVT53eI6FqZmgWInk84NbhXz
	2fKAELUXpSQW1dY/Yfy9wISz0LbovUPDe1p4KSOCuwVQcdlLx0y+7HmYc7nXg6PtYkZHN+rF5/O
	GJJEAVClMOaplyVFjdKP22F963HWST57cxkU/8igsoF4BsWeqNvxt+uV+1qVi2G1u765ZEQ99kP
	xN+jCTjAgkkIoi7hRmKBGQMIwK5refHH0yKZ6clx0QJ2jLKQ1p4IXd6fT70OT3478IJ2sQQj90+
	mT35xO+ZyIHpsAa7mMovmel2o3+hKlu1k5vxe9nfeWKRe+2RopjSAARspbqSjiOfFH8d94dSvhs
	Og4EkFaiaMcro9wzbPHxixy/xCPmo75wVjDQahbffsh/Th0sGMade3dvwqe1qhRrxpUGhboTF13
	Tt+P9oOvrDKtTD4tuBCJ7ukGwmt1Mk9sp4WcqbgslappjIo812UkB1xS
X-Received: by 2002:a05:6000:29d2:b0:498:38b3:55a1 with SMTP id ffacd0b85a97d-49c71e3e27amr12116326f8f.15.1794813595436;
        Sun, 15 Nov 2026 23:19:55 -0800 (PST)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5f1c1968sm20756980f8f.10.2026.11.15.23.19.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 23:19:55 -0800 (PST)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Ping-Ke Shih <pkshih@realtek.com>
Cc: Luka Gejak <luka.gejak@linux.dev>,
	Bitterblue Smith <rtl8821cerfe2@gmail.com>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mehmet.fide@screeningeagle.com
Subject: [PATCH rtw-next v11 1/3] wifi: rtw88: download the beacon the reserved page was built with
Date: Mon, 16 Nov 2026 08:19:50 +0100
Message-ID: <20261116071952.1142013-2-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261116071952.1142013-1-mehmet.fide@gmail.com>
References: <20261116071952.1142013-1-mehmet.fide@gmail.com>
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
    Changes in v11:
    - none, rebased on rtw-next
    
    Changes in v10:
    - none, rebased on rtw-next
    
    Changes in v9:
    - none
    
    Changes in v8:
    - none
    
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
2.56.0

