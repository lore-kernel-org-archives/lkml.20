Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86B4C39B48F
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 07:30:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791876619; cv=none; b=l8IqQ5brj/Jpn6Lhaa0FA0p8CPlS8Gbi3vb+H7uEho1yu679ATxe16lu2Gq+MzCVvzIr0OjP3YXpU8Wp5xwH4YujaXuFQ8gsk52S8AGgICnsfs/DZ94zsPBDtSPvc4woNE0o+3X2bq4nV1coYdycftT4IVDkVYmYew4r74gRREA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791876619; c=relaxed/simple;
	bh=IhHHxMRnwSEgWXopXk515FvewKyc1IW4ManUQm/7Hv8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fugcH9LD/Bx0yCItaw660tWaez7Lxs+9JIOoQHgSePk1QHp19tKzYhtntnRnjceEG8BWwGhGJVANT1769Aa8KfulfxKidCvtzbbo13sbK8y3qtnH8FAqmqbQoV8rlZs5efTHl7DK5Lx0VNd0xKzL+MhouILiXlcgRCUiVEpt048=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L2aao2Qy; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L2aao2Qy"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a061a13884so22444475e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 00:30:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791876616; x=1792481416; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7Ri4R1UXTRQK7xdc7p6tjsrqNIY/0TFrXDEYcdoAilQ=;
        b=L2aao2QymCA1AJiwrLy7PoGYRtmbwKZGbQrWK5BnNHBBM9PitSrO2iJSo4P4p7DHT6
         wwJoxk3TGrU29sak5NBrUvP/b5zxCnFGhvW3qJe/A00Cq1UsHRN3iMeDMV5ivVHkcHHj
         gz4Y/nVolJtRcHe3JXUfIz2XMcKrN5av0nUYPxusi4DlJGDj2MW6HF2omEMl+TYrZM+n
         vHNjEfeDVHVk21uFTwOL/MkAb5IuP96FZXqRceNBw2dZzSuyYWGspKpYmsKfDyVh//4z
         LjrVY2QPlfOIFGJ/wwEeWKuu+lXhflw84y+gpqRhjB78KIEym6m24273/tNaVHn6OKeO
         6wrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791876616; x=1792481416;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7Ri4R1UXTRQK7xdc7p6tjsrqNIY/0TFrXDEYcdoAilQ=;
        b=It0/bw9/FdWv+nT6jWu/BkPzPryNyguoe0+lMxTHySAKryNPeE+MN214NJu+jq89u9
         tFJbLKJ3lhp7pbRjj6mvvA+P5ilBLuSOCfMPDw9WvMsorzqeFR4b0aPH930aOuND8z55
         SoDKBsBmJ75U0AVeNqADE2IU1jtGMA9rADbgJbr0h/03McH2MxtvgCAA6osewOWsu6lk
         YyMNPy+cL/a+lwi5bijbOiMpMJsBADa3BQuv8EEiFM4R+PDsBYFjm+ZjSuCog3wu1dW/
         uEyOE+Vh/AL9BQ5Ve6uTIWvDSi5/JhJwcY16pFLyus/NFAzV/BzbEr6ugWF3Iio0aDaK
         BcpA==
X-Forwarded-Encrypted: i=1; AKwUvBwJk1uqQSyDUKpxO0s6tfc2qsEi4hncfq62UDX0tkcH1avQB9H0rkKLFobR16mcYhF08DfwTK7LkXAeHgA=@vger.kernel.org
X-Gm-Message-State: AFq9FYJP2E74zg4QOmM7YLEXUayDWlNhsBsFZiAwG3wRq5fDrPnIEH1R
	E2jAJmM9yAHEBDHK+iL6HKYxw05yhPpRDMZO6eAM6dREN6MlAARhEX6TW8Xwtg0J
X-Gm-Gg: AYBFou2TptGtXCKKPIXjcWhCgn8ThRXU4KrhbGkGyKspHp1GRjF7tvKgSAKsLnRLO7s
	CUk8+afMAn1DwWkom8ABdBW6gcTt0CNpVBkBHHFnx4psU4Ehur40iSzZ8JeBCqxsXAkcbouE7jW
	XwnBKFY3xQxXHzGequlJQnMxRcp+8gDzCKhXL3BMUiSP/raa5I8WuVv4HMQM/U2JAKKUYSVlGIw
	YW10zCp0oipbdDnCZ4IGdOZxLdViO9qb5mOXr5Os5t5OT4nSOk70mBUoaC02bLqLe56MKCCdRP9
	EfstMGvyIk6WtONnBI4CaQPzb7oFcV7oNHqIT9qgBofiUJoEgb4NIsWjNOMPOSc5+SK2BhhLQAN
	UoCtIAmpDZGAnH3w6s/GYjfFE5w7Cgq++KnD5KIbp8Zwj48A2ayWKPhiiSOdgb9q4fUzsj7hfm4
	D5IVFSks7NuF3BlFX7mO3af7G4c9dlldsde6db1Qyn3QeWWFTWRFLeYfxd3MigVJZSKvZ/WxCUb
	Qq0
X-Received: by 2002:a05:600c:630f:b0:4a1:9f59:ee7 with SMTP id 5b1f17b1804b1-4a19f5911f4mr99120815e9.0.1791876615576;
        Tue, 13 Oct 2026 00:30:15 -0700 (PDT)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18bf3e044sm332839925e9.14.2026.10.13.00.30.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 00:30:15 -0700 (PDT)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Ping-Ke Shih <pkshih@realtek.com>
Cc: Bitterblue Smith <rtl8821cerfe2@gmail.com>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mehmet.fide@screeningeagle.com
Subject: [PATCH rtw-next v6 1/2] wifi: rtw88: download the beacon the reserved page was built with
Date: Tue, 13 Oct 2026 09:30:09 +0200
Message-ID: <20261013073010.358756-2-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261013073010.358756-1-mehmet.fide@gmail.com>
References: <20261013073010.358756-1-mehmet.fide@gmail.com>
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
Reviewed-by: Luka Gejak <luka.gejak@linux.dev>
Acked-by: Ping-Ke Shih <pkshih@realtek.com>
---

Notes:
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

