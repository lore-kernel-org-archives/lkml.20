Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793332033;
	b=bTYeaCUshof6gF6lLwQRr+NvF00BIiJDcaqyhalHC5WdpwsR2ozn1byidMMn72Irs2WE
	 5um5JjOsdUt2OMh7RitDOZPBsdOhOdwH9wAZJnEh+fDWXFJ2ZK8XiJr5RsOqjcD/GxggF
	 rSyEHgUJ3aAtpHkhq1FASUBsdjDL/HL+ja0s7OaX0MmzkhNUtychdJw3lrAenKYHwcs7z
	 4dK0eofDt62CkquIyL43n768NJO5j3+PFGn2p+QzzzDeV6pM7gDIPuj0SD2v7ida6pT9m
	 swiO0JGuT/E5wbb573LnqcdLN4isx6CfSSXcH5ca5ZJ+/p9SrQiuPr+awdfk+rWsqjg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793332033;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=tLmGNIT9IaTeNDNZlYbjqo+wSUzAVTWlQnSozIZPBz0=;
	b=ZqDyMjFsNEFgOAuCCQsQuVzaJQaJRXTiE2VXuK/ShD0w/5NA5wmGmD9PlhFWO6nka8DS
	 Gbn41mDi9OXUpSA80QCkWJsH9h6hWxck+CznIYM43FoaI35FugvJQp2UUtn+9+SNLV+2o
	 2bzErA4g7wtmesIa5jdAqYWYjx7f82ddy+4CzxaC1FbqzC9Odu6cfrY+N5TbghYPkvfBx
	 LfTdAYZ2Paz/4050VJklryteEOvRolCDcfJRSBWcGHhyoGJwsm91PZ0y6q1P0Y4sRW6aO
	 5msIp+pz2nheyYJsieL2uzIdNzeTnJ85x0v+M/B3ziOrS7uU6vMHyVRzL9F2gs9qyIw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zpdBKLOn;
	arc=none smtp.remote-ip=209.85.215.170
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 201B4606A31E
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 03:47:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 201B4606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zpdBKLOn
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-ca766c1c9ccso76700a12.0
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 20:47:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793332032; x=1793936832; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=tLmGNIT9IaTeNDNZlYbjqo+wSUzAVTWlQnSozIZPBz0=;
        b=zpdBKLOnlTxgFD1X5TQcddC2DgsC+Pn1Gzbam2yYUTYdTLsB3GCkIAXj76X9KUje/t
         Iut/UgX5JgtAsOfVTphpzqIWmPPdsFPpw62FpuTQAwpkoPp9j2TgNqaJ77bC3acTIGlI
         xfp/f3FbCf2HsMrzgl7mFc51qt3pLwCp35a2Z+Oe2+sKQ9FvVgnF/pWp9wiQIVhLb12/
         IxCGHC2vEG7HyPVP7X4OdIjA5A2sWTTA1ZIN2zptc44gAyAPVHLv33zsXf0SI4XpZW57
         m30P3WcCCBgVaFTsNyoxmfcjbJnBAkgA3EpRz1Bcf/Q79kPwyTCRgXC4ZJ1n75fLxTEJ
         6fJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793332032; x=1793936832;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tLmGNIT9IaTeNDNZlYbjqo+wSUzAVTWlQnSozIZPBz0=;
        b=0bfXT4xs7LjE+PNuxFvNBlol49Nya53t5c6zAelSzUkibxmYVWhqqR6FolND1Svg0y
         APKouVnrU2BI9LrKB6oq/N9tV/OjR7aCa2gBMzTs3aDRfdkcu+0DiRx2WQVauSkWwGXx
         6RdJa5PrQSLmgAlwm5gwDV9Stp4Io+d0SezEPxtj6cy17YBhTrZVCOJK/CIOHN/64huE
         0WWxsXv6QC3rFUFITTH1NIi45cDmhLGjosL7dNy3tAnDYo2NAiJeGDm1bAMApdo8/dxn
         O5QCiMydcUSPE6UhvFGBHXN3mKPz6NoiE3yqSx2lshVFcUKyl8epSj4YQ/EcD+TePuqj
         aeCg==
X-Forwarded-Encrypted: i=1; AKwUvByl58L6t3NGSQeViu1v8/qP+Qd6uYDRq1wDEoti8eJqXBQqzH4JnNQQBzucuMjLonFIv3VXorhVWyNwlxg=@vger.kernel.org
X-Gm-Message-State: AFq9FYLI6JPQc0WOSa86Grypl6L/ECm32nrx5CfOh7iCspEK8SCBttcG
	AdEHW0BMO5VjUJ6dcXcgejok4YAU12o0PE5Q3+T4qx9/DyTEJb0IykJg
X-Gm-Gg: AYBFou0usaJjHIBswfkNgHFkRa4KH+6LYYwFYwjOilmR41iiC+FHRwoLdi7nH8tZYg8
	GkX3WJlAXzasgr0+Skvi2xlPP9Zom2uNAPAmvOfxfa6SI+h/mMYda8NgZCniI3uFRD95ChQjN3O
	d6Q/cnQKl5+No/zkSKHMm2ccE6Y1VYNk66y+Z1nkZY1Nnfhnv5qrl+mJl9ByDCUoBrG/xAeyEON
	q9SGLRIfwsAyWeQA4V2q/9R+ZQnciExWc6F2MCCDDfTei1VyyBTdTSeHurHaBWOZUifg1bOi5kq
	vWKWlNDRv8qUesBuIrIhdhRbFCTrzqXAsThocU7EWnGUnKdd/PMbjU+J0lGgPI2jloqGnbh4xQ9
	dfVvHcT7N5LijQWiXDrUIWNXnyTxDOTSX+nzZI7+cQ1gw0H8+cB0RPzJTEg/hvZWW5rxzlcPrZs
	CXUKtJo9MR5mRWCV4LgDIMAbh0gl1LByBbExxOEnM07rQjS97elZQjWhnZGIQ4TCvu7XWC6hGLh
	ZxY09DbvmoTQc3U3i+va8jBEsGfyGZpQsStvovy03LFI91GWZxpwhYrHEZ9YV2CqNs/Yc+n2sCp
	y8zbYF67YCEkn3VtFrIHJh3aet4+v1IqrwuoadolR3Kw3a0gFQRqsmW0PMo5sRPoQgq+sgI8+6J
	HeCdD
X-Received: by 2002:a17:90b:53c7:b0:3ac:7e3a:1033 with SMTP id 98e67ed59e1d1-3ae897c5e5dmr867247a91.59.1793332032143;
        Thu, 29 Oct 2026 20:47:12 -0700 (PDT)
Received: from hostname.tail4fb79.ts.net ([2401:7400:c804:b668:65cc:625f:9c43:1e88])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-3ae880a46f1sm561699a91.3.2026.10.29.20.47.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 20:47:11 -0700 (PDT)
From: Ho Jie Feng <hjf3108@gmail.com>
To: Ping-Ke Shih <pkshih@realtek.com>
Cc: linux-wireless@vger.kernel.org,
	Ho Jie Feng <hjf3108@gmail.com>,
	Kalle Valo <kvalo@kernel.org>,
	Hans Ulli Kroll <linux@ulli-kroll.de>,
	neo_jou <neo_jou@realtek.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	linux-kernel@vger.kernel.org
Subject: [PATCH rtw-next v2] wifi: rtw88: usb: don't report the aggregation buffer as a frame
Date: Fri, 30 Oct 2026 11:46:49 +0800
Message-ID: <20261030034649.300288-1-hjf3108@gmail.com>
X-Mailer: git-send-email 2.55.0
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

When rtw_usb_tx_agg_skb() has more than one frame queued, it copies them
into a new buffer. That buffer was also handed to mac80211, as one
additional TX completion.

Report TX status only for the original frames, and free the aggregate
buffer without passing it to mac80211.

Fixes: a82dfd33d123 ("wifi: rtw88: Add common USB chip support")
Signed-off-by: Ho Jie Feng <hjf3108@gmail.com>
---
 drivers/net/wireless/realtek/rtw88/usb.c | 9 +++++++++
 drivers/net/wireless/realtek/rtw88/usb.h | 1 +
 2 files changed, 10 insertions(+)

diff --git a/drivers/net/wireless/realtek/rtw88/usb.c b/drivers/net/wireless/realtek/rtw88/usb.c
index 715a2ce342d92..d6ad0770657d7 100644
--- a/drivers/net/wireless/realtek/rtw88/usb.c
+++ b/drivers/net/wireless/realtek/rtw88/usb.c
@@ -342,6 +342,11 @@ static void rtw_usb_write_port_tx_complete(struct urb *urb)
 
 		skb_pull(skb, rtwdev->chip->tx_pkt_desc_sz);
 
+		if (tx_data->drv_frame) {
+			dev_kfree_skb_any(skb);
+			continue;
+		}
+
 		/* enqueue to wait for tx report */
 		if (info->flags & IEEE80211_TX_CTL_REQ_TX_STATUS) {
 			rtw_tx_report_enqueue(rtwdev, skb, tx_data->sn);
@@ -431,6 +436,9 @@ static bool rtw_usb_tx_agg_skb(struct rtw_usb *rtwusb, struct sk_buff_head *list
 		goto queue;
 	}
 
+	/* report TX status only for the original frames */
+	rtw_usb_get_tx_data(skb_head)->drv_frame = true;
+
 	while (skb_iter) {
 		unsigned long flags;
 
@@ -655,6 +663,7 @@ static int rtw_usb_tx_write(struct rtw_dev *rtwdev,
 	rtw_tx_fill_txdesc_checksum(rtwdev, pkt_info, skb->data);
 	tx_data = rtw_usb_get_tx_data(skb);
 	tx_data->sn = pkt_info->sn;
+	tx_data->drv_frame = false;
 
 	skb_queue_tail(&rtwusb->tx_queue[ep], skb);
 
diff --git a/drivers/net/wireless/realtek/rtw88/usb.h b/drivers/net/wireless/realtek/rtw88/usb.h
index 94ff21dd08463..e861e9a66ab22 100644
--- a/drivers/net/wireless/realtek/rtw88/usb.h
+++ b/drivers/net/wireless/realtek/rtw88/usb.h
@@ -59,6 +59,7 @@ struct rx_usb_ctrl_block {
 
 struct rtw_usb_tx_data {
 	u8 sn;
+	bool drv_frame;
 };
 
 struct rtw_usb {

base-commit: 9b0be45d4d52fd223994e151f169743a97abd290
-- 
2.55.0

