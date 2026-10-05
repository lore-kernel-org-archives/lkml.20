Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D31A4ACC9B
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 14:35:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791210937; cv=none; b=CW4/+pqw574jzrLoII0nfDnzEKE3eB/eTsjix4/KKDd71OAGC0JItT6lqTu+mtummXOQGXC5bZIIvLDJDkch/ZGJwl0H8mBa46HAo1DAjM0RtERXMKvPRz3cXChKdvdRPC26vBdnP8eHMYY8HcPtZlYhGrIrQSzNWMm5GOwra0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791210937; c=relaxed/simple;
	bh=ZsZHkcJx9ATC2tiTAwMr97NELUFCoYknk9e4btsEzKw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LyD6cpLH76NE0VacQAUDnS87EQkYGybLD878yaTJgHLD2X/abkCf7fVpc9PwMFxeqL+PgLPekecr4NUnt+aKHdeHpHoRLxdrtRhHYiFgxnqQ2gzWDfXjcEajRqJ0RZeDRtCVc3gGrghEmqAjgBinZYpsp6CMkkYmnCxNm319cqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mUHkZ3c9; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mUHkZ3c9"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4998b5a63e2so18041485e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 07:35:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791210926; x=1791815726; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gJBmC6lInBWlZ8zhcwEQA8KotxGA62ubikb5bUiBrQw=;
        b=mUHkZ3c9/Mn0cQRvSerSwvOmfMsgHic8DwideBM2HEfkG8BP55kE9ljzk2/1Htsj2M
         afLSTmuS01BmLbyrs5Jlj/WDX1Wek7pisqHlub2S2s0fpc5+U/+lasc8wCIJUjrQv5xE
         7QbAvineLMWDrluqHOLmQwqB3XtVIYf+d22y62Vt/dvCPQeMcTCYOVjdAN6qJMa0eo6O
         z6VDx26RQku84yEgTh4UYNTkTpFh4oMyJy5kRU9/No5g6s5IsctqwJ83hvleVmckWOdN
         ULvo9uKZoULf/dOM4Ag6F6KyxbRRHjVJ7GxuLR1BX3tfoAGacSJ3cEIR24OPtY4YerV7
         DX/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791210926; x=1791815726;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gJBmC6lInBWlZ8zhcwEQA8KotxGA62ubikb5bUiBrQw=;
        b=wvTAIw7EKpYvX4JZw3lg08AP68Ep4fEXpxv4T0087dATnrqdubYjnDybhBoB3aueaC
         qXuNcZTeXsAFM7eEvn6Ejvbm3dhgFfNw2maN6KgbJZtgYKySVaEGEjoG4B14ZCXX6LE4
         tybf4puzU4EbaDuxzgmmZPGPq7gAwwrLe+k75I+uZDZAVkIptF2xj9Ah+R+PMrvd/5KK
         qzAK3vFy8bNMhK+uMhfWDOfP3U2XC3YQIKzhY788J1FKWNmBB1SK75/RJRDFc/Fx9dnd
         R7rTcM2e++EyKTzZuwwhWyKfm3OkbtzOX/zAUBUXu4Lu1U3AIGuTDMmYJUEZIr9HKMAN
         Uxhg==
X-Forwarded-Encrypted: i=1; AKwUvBzkFyaoiI0WaiGM/d3HQlMWN7pwmYKdu5l9vOWwK93vg/FqpspDbRzm0XTtQJI1VwVt9+EzBavlfcVn4nw=@vger.kernel.org
X-Gm-Message-State: AFuF++k1XUvGVNNSoEpJqU8z7zKu9hPYjbxnLbsaj8q9VhUa57hEOKOT
	Yr7CjNDg21rcqTVhHwnELPp1HcEIB45aKQcg+JgWxaY3PL+scab9m4gx
X-Gm-Gg: AYBFou28oZHBpJtDZ4BfdQADvX1J+hItqdxb6la9BTnCAq5NUgzOHKMneMipO01rbu0
	wjhzPMKTRlBY5wdUE7nILXrvvWVd9wtR+b5m66X2/ul2gXIDaavNTiTMpYnmAef/yIG4PMLKtsD
	36uPv+USB9BWOYtMJb4IJeCNda6bCVFQaCMqsBVe8TjAh+dy7aLGGcXoJr/e3zQ7RIMJF4WWQl2
	1mG+kunpjZIm6Gj+gr5clXnTMrUGqgaNxcawgcWhfir+INpkXpEFPTzma/Ggf2Cz3Oyxp6OtgoY
	nEJLvcLzIWa6un8EMgWHHNnNcfuUf4jRl8GNsvZBcUbEVIi2Vke38hKptLHfFJ/8lFuiOo9xWyF
	G1pSSx1IKgbEvTXCdQINBJc0GhfXMyul8mN4qG/0pK8VQmAbre75RAzD8MzhpygG0YGhCfDYcFF
	Y/66qV+q34f+L7tpsWGkxC7AN9arJEpgv6Xth9LBbGJ5zI3M/wXoRdHpDUGq39o3O/I5lm5uY3b
	Lhf
X-Received: by 2002:a05:600c:4ed0:b0:4a1:77dd:8e6a with SMTP id 5b1f17b1804b1-4a177dd9252mr4744075e9.6.1791210926245;
        Mon, 05 Oct 2026 07:35:26 -0700 (PDT)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a027725c6asm396901835e9.8.2026.10.05.07.35.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 07:35:25 -0700 (PDT)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Ping-Ke Shih <pkshih@realtek.com>
Cc: Luka Gejak <luka.gejak@linux.dev>,
	Bitterblue Smith <rtl8821cerfe2@gmail.com>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mehmet.fide@screeningeagle.com
Subject: [PATCH rtw-next v3 1/2] wifi: rtw88: download the beacon the reserved page was built with
Date: Mon,  5 Oct 2026 16:35:22 +0200
Message-ID: <20261005143523.130287-2-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261005143523.130287-1-mehmet.fide@gmail.com>
References: <20261005143523.130287-1-mehmet.fide@gmail.com>
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

