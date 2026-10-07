Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8D5C3812F6
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 06:11:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791353479; cv=none; b=Y6g2EqHNrrUM7owSXFCk0CImJcSmskUR3V3RpQQDR5EtlaYR0ycycwCidnW3ST9xPU9etIblCM0yu3fFasCe+cAOTvsUDAFhwUsPTDEelOxj/+hwHCRzTdVx66jz5li3rex72jtxNR8UiFxX8nmhP5+AdMGUamjLXMH7L5euWOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791353479; c=relaxed/simple;
	bh=bsLDRyl0aAGyDLXnNq1ocy9lVC2yGRvfVfbGSNSB7os=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BFs+qaTFtTmjWi2GgUWEiDJGB0L5hbDj/nk0n3sSM4BX8MyfUytibawnPfFEpUv/KoooTAEWGjz1NR0DAADWTDnxR8RC6sweEKq54/KjfnU5BknuXs0RHYQsedr/pyUVTe9oScsmvU7q1vCCfki0kLnHbV+totqPEYUkOZHdo7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QHD/S+R6; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QHD/S+R6"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a018dc1f98so12560415e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 23:11:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791353476; x=1791958276; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zSjbzlFloq9QXjkiUjFLP1ZspHUOtztmi3mM6sYoevs=;
        b=QHD/S+R68pM0SGOTHxc5PIb3wf9jLNxGa750vhoUR3ACyXLM93qcxk0suTEziLYw69
         lIBK7I1dgEFBTNWyFQbUrBNYDUMMcJ8lKCtZmrPZyROWTEOBFQmWV9qkzrag+2y8Macf
         AY6KnEEki1Fhwl6npVP8hpepqhRcfkRFXrHoPZ0/vQMbgaAIcB8/qzqGFo1oJEEiFULe
         +7cfWAQFuKeeXBj0w7q74Hw/3ahXPxTgspEG/Wd4NuIc0lWfBUgkButULpamu4xYebWq
         LMvEG/LFFGfONdwpmR7+sKkSVCdUendhJvA+IeZVQZiUAQPf+FT454prFGThY0Fq886c
         Rq2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791353476; x=1791958276;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zSjbzlFloq9QXjkiUjFLP1ZspHUOtztmi3mM6sYoevs=;
        b=2vk5Fu7SBHb0PQJwzBQdWY+9m1m+kiAEZoLS3qQVuqfZbBrqts3R3nVWlgorOxe5AM
         NSy4ijeoZ8EOdFasBUdWVN9gge9GiCFxMEy280tp3xE1MNf0m2ORPp5LKYZ++dzUCjqE
         Z+N/OkuiDds2rd2G8R2qjUFZpzgJDKzX8Da2FiL4LFu5lhk3rbCwuEgwQ/S04BQDaq3B
         oDpxOzgqOfN54fBxA1Gsyvgd6oPVhs0EltXD2EnDExZm4txw7SgpR8XByHKaUnS6xXl7
         96IR2/gmEJwojNZBUXMuY5J2P3o4t8i5k1ZwFtcsjpODTIZkuOS6gwS4dYQgBxGUm003
         dh4w==
X-Forwarded-Encrypted: i=1; AKwUvBzjlfbe5Q2L/Iawro79TF+XrJGFvz6kdZDd3ydO3PI0R1XrOypCsPlqC+XZvDW1BbZuSFgEMnasBBpkHLQ=@vger.kernel.org
X-Gm-Message-State: AFuF++mjzyFMoDeys1nZPYo4MXAFqlTOYygiiZ63t+wCjrIJ0fmkd7eZ
	VUv4n1qtRq2ZcNnuM12wmOiHrw4rMn1xtqfNgZr1n9Gk68r618vb+oinnhtPp9QO
X-Gm-Gg: AYBFou0k5S3mIdVEE6TnJQBdJ5MaPsaepG92SCOd2AhU2TNowNn6qc7bU2uGekA0mLP
	1u8Q6Zl7QW6Uwth7ahMeP0TI5nzYZazi0r54uFB2kBL+z6wy6TgWg0PuSMni5P6XmGo9fxofVuT
	sW1+chIxlJVF0Y0ewPPwpzA9w7Ni5M/Zo/8ys+nUmiGNdpjk9p2INy4DlVd/Rt+bkSn+a4O3z0A
	CU2L+nODAJb7uBXZWvE8/x9E5DYGLMPITNJsBFtbhEUC6DkOZPcsrnSBwX2pOJXJjkSIbKCrTbM
	1XykvSJ06/0C/fhfQx3ic2iU/E2x8ITY77fpb/PSGZr8T6YDoRetdXSZV1oxT5Fz/N2rmApuJ+5
	ouKsBka1YjzbLGKwFun0U7BkbrhgU27MRmqvXT9FNaOODv2Fy/7KfzNNswIrJS5704SQoHUp7A8
	Xq3Mf5K7Jxy9KL/70THemBuHhhGlcqhilo4RnaOf3zX622kDq2mcByWWc+2kFgzktQIS6IptNZn
	hsx
X-Received: by 2002:a05:600c:821a:b0:4a0:1a7f:2abf with SMTP id 5b1f17b1804b1-4a1802f6338mr14969335e9.7.1791353475813;
        Tue, 06 Oct 2026 23:11:15 -0700 (PDT)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a17fce07a3sm18949995e9.1.2026.10.06.23.11.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 23:11:15 -0700 (PDT)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Ping-Ke Shih <pkshih@realtek.com>
Cc: Luka Gejak <luka.gejak@linux.dev>,
	Bitterblue Smith <rtl8821cerfe2@gmail.com>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mehmet.fide@screeningeagle.com
Subject: [PATCH rtw-next v4 1/2] wifi: rtw88: download the beacon the reserved page was built with
Date: Wed,  7 Oct 2026 08:11:12 +0200
Message-ID: <20261007061113.2083449-2-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261007061113.2083449-1-mehmet.fide@gmail.com>
References: <20261007061113.2083449-1-mehmet.fide@gmail.com>
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

