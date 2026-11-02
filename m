Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793590378;
	b=DPvvIOjq0Th4zprmShPs0DCDxoAdy6M4kZj9JAo5VvhqCKly+ds5KCjtK1K9B926zUNa
	 0sesCPmPFJrOfMfW3Dc0EQcl8aTSPR+yU71fbF6SnvyFNzM3EgCKeKvnKe+oimoMFkh26
	 kzUrAaxiDe1Vq9Eqd+8nSAHFJHI3RvjLWqStnapIl78GLogPG7MbRf40HDpPav4TsLVs1
	 oN0xz1LvtJbbJJGkF7V6vhQCIjvYipI3/mVwfRGWuWQMoRvuQ1s0NCNOsEBkUCaIfwHXu
	 0myGv2tErxX1c+orH5lhXXDO+uX42lRBSBgq22LRVLmFirL+Mbip6khpxStfqMEAWiw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793590378;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=S7SJ5Fy16dS9ma34ZFjczTKK5q3vqU0jFNFBbWoQo8U=;
	b=xJEsqslDzjH06K5eaZkH00zUdSJLbY5CdcuL8Kh4T5Zs4gsdg22q7oOGgCaCoXG8jeps
	 08r8pI5Nl9uWcwyA/UxI89MbU4P9uX2iZAKjix+MrvcmjJ33p9D2p/b6a+WPsXeoo1RWR
	 /bTYhakogl+80alw6aOZBwg8LQdlAxJN75Y/hUj6K0FtFx9Zzn8inxptzZ23gV+WeFfrI
	 qkSy2skmw/ulgABpLYsc6P8iTHtEiTF5Xg+YC0CupjnC2ZNKSeAj1/ntsV1MFHlZjtXA4
	 /I0AV/GdaBZDMQTOlh8yl7D+rqPJjfOzBaQ6+XhvoB40PHteM04MCEQDoZUSYfbDCvA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EIswVT3q;
	arc=none smtp.remote-ip=209.85.215.172
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0134606A330
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 03:32:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D0134606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EIswVT3q
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-cdb1199bfd8so575409a12.1
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 19:32:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793590377; x=1794195177; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=S7SJ5Fy16dS9ma34ZFjczTKK5q3vqU0jFNFBbWoQo8U=;
        b=EIswVT3qttYkfY9/tRLTww5O5jMBDZAu5CwAHtMCuf6zhej3VJ/hWrxg3193ECgw+/
         RMJ13Pzv8RHtT1dgJ8mtOXuKIlgD3IvHObYFPm+JmkYVswDwe3k/u5BPQemTuOD9mk3J
         4MykYhFepS5AETp+V/LMYZ5RQwFMC6IiXZoreZM5nXWtyRZtaAUK8ikU41oQACPtIsaH
         rnH0chzUxzRosOi/I5F58mMgTugt9QIjDrpYYaCQViVkxELjXNTIeIZbqWcIHXOsUvu1
         jUsdCmIcda5SO/SeLmjPePe/ETORYZMSrBYpAi2oWVk0eh0hy6J7y2YLQfrnhtFIlRv0
         A9GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793590377; x=1794195177;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=S7SJ5Fy16dS9ma34ZFjczTKK5q3vqU0jFNFBbWoQo8U=;
        b=CT2F2ha8omA8dvAtUG5vLLvUqPiH13v/4IsL6FoqwU6VzMY1qjgspwjjGRpGsGYd8E
         eIVdb6Ir+i+jzk9EZfEll/4L5jUN8DtehmNkShQfWwQl2jhNArBYa0UYocsJuu7ndjC1
         GvnMg/CsToW+59PX/SMTeift1EPFKtekkvCYJ5Pw1d3fDqadDARvoj0C5/T737VxkP33
         cso3XjArj7dSXe+XlSBjTPcVDPWa86KVlTVLSHRiO7I6GmW8+O8dgw18ZFj90vVgSYTD
         XazOFu0dfeGidzYQQ7cIqs3TOqUWifVBWWl3sVfqqkNk4PJ+HGK16qXZp0WkBzBJhmmy
         xwzw==
X-Forwarded-Encrypted: i=1; AKwUvBzbcw1wULp5o9A2izwLjHK0o4cM490nEV7YtzT3S0gKyOoo5JVsmmwEV+FDO8yrLGwqOYf9KQAPFYRVMJE=@vger.kernel.org
X-Gm-Message-State: APuU4Z8X+TJ9ZlHswjohueZzk2s5pZuXEH3OqrZ3fJOjJkj8DaVG6Nri
	xM2fRofOMsIw9LxCJk+a0eUUQEmDDIKlyFD3SQ/WoNoz93bKcWIYdlbrhMo+U1Tq
X-Gm-Gg: AYBFou3RFs9z5VGBMH1rvGDAWsXJbtgmDFF5O1rULaFIh9v24m20sRPWarxu16ouprZ
	tsnE0hirnXfSVys0f5OUBOAgup8MFwsqahdyQSBiqxfuxc7NU3xEU/hGjDEc0aSKXMUl9vOkAc1
	MyJdi5rMhOWfwYBy3eR0nCjwfL6pB260RIxUKWL20LxO4GB7WZuwCJ4b/2GNlBcnFN5dy9CTT2U
	GcU6psu2OGQ2y1U3tH2JENurfvY7pMtwZYYkwN+rSLkIr1KEzUHIY1pm89vjRVBKaoq4thkkB6f
	aJxcZd7svFavvh4cuWoevGq8fY/oUclyk6TibcaynlVu3oOwnt6bq5Jldkv7g3rddu12wltJbap
	+4yUN+4bUUROqJVhXLW/puu9ElyVjF7b4I0BGdbPk+594cwS/NQIA1dChVGO8MUqj0tlwwG0UPr
	IPPEjApyVCa+fj3IGWm4pDX1WlJ4nZrbgJl80i5Yd49HvpesdBD21LvLn7YU/3ThkcD+Cw77tmB
	Spx4a1I/vsrlSlHj5a37XxVqRHbirR+LuCjvVdZVO76UJwe263HERl3fLpQAgEJM7URRB7kFYB/
	y/5Z5ONItSe5tdML3a/cQ1RYDfSMb1+paqAlddIcsGBitQTtUrwjBoYgXC7DSKJ3asHuKtd1bkc
	bxAbO
X-Received: by 2002:a17:90a:e7cf:b0:3ac:9a54:e3ce with SMTP id 98e67ed59e1d1-3ae8986e718mr7841574a91.63.1793590377119;
        Sun, 01 Nov 2026 19:32:57 -0800 (PST)
Received: from hostname.tail4fb79.ts.net ([2401:7400:c804:b668:65cc:625f:9c43:1e88])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-3ae845432e4sm12087044a91.3.2026.11.01.19.32.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 19:32:56 -0800 (PST)
From: Ho Jie Feng <hjf3108@gmail.com>
To: Ping-Ke Shih <pkshih@realtek.com>
Cc: linux-wireless@vger.kernel.org,
	Ho Jie Feng <hjf3108@gmail.com>,
	Luka Gejak <luka.gejak@linux.dev>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Hans Ulli Kroll <linux@ulli-kroll.de>,
	Kalle Valo <kvalo@kernel.org>,
	neo_jou <neo_jou@realtek.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH rtw-next v4] wifi: rtw88: usb: don't report the aggregation buffer as a frame
Date: Mon,  2 Nov 2026 11:32:44 +0800
Message-ID: <20261102033244.9330-1-hjf3108@gmail.com>
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

In the case the ieee80211_purge_tx_queue is called, the frame is
passed to ieee80211_report_used_skb. Since it fulfills none of the
conditions within the function, the frame is freed as normal without
a TX status in that case too

Fixes: a82dfd33d123 ("wifi: rtw88: Add common USB chip support")
Signed-off-by: Ho Jie Feng <hjf3108@gmail.com>
Reviewed-by: Luka Gejak <luka.gejak@linux.dev>
---
Changes in v4:
- Add reviewed by
- Add description for ieee80211_purge_tx_queue
Changes in v3:
- Change to dev_consume_skb_any from a suggestion by Luka Gejak
Changes in v2:
- Remove unused drv_frame members in structs drivers/net/wireless/realtek/rtw88/usb.c | 9 +++++++++
 drivers/net/wireless/realtek/rtw88/usb.h | 1 +
 2 files changed, 10 insertions(+)

diff --git a/drivers/net/wireless/realtek/rtw88/usb.c b/drivers/net/wireless/realtek/rtw88/usb.c
index 715a2ce342d92..10f6d3bea0dfd 100644
--- a/drivers/net/wireless/realtek/rtw88/usb.c
+++ b/drivers/net/wireless/realtek/rtw88/usb.c
@@ -342,6 +342,11 @@ static void rtw_usb_write_port_tx_complete(struct urb *urb)
 
 		skb_pull(skb, rtwdev->chip->tx_pkt_desc_sz);
 
+		if (tx_data->drv_frame) {
+			dev_consume_skb_any(skb);
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

