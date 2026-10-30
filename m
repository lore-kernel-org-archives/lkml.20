Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793379312;
	b=2W3wh0qkkWa/bFyBQDF/+hGu1MgcMG+BxsbbfTHHww8uUTmSQIgPbmjgqtAHY8pKgWkz
	 z+htfz9Kf9sVbWZaJDCFH1M8d5SWgv4hBbzlobZJbpD9pGDNVzoXjSx6cZOlBez9Eo4aN
	 T7C9bXzDlx06UuEkLwYiHhERqBuwAD0IBB4gzmB87je6F39IbzIDgl/AQB/W4zDd0CfL+
	 6xaBXNTl6/UQVfrAoYRa6tpv7w0mRIdtJxzpzxtWPOpb8O5qHdySPqVDO7HpL5pP+Yjsn
	 p3JeRnh3VfWs4vFF0kBo1Is+yoJY3eDUlwbTgPjC+DL3148gNmHHKwUxaKwTU8rlpCQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793379312;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=GctUwbYvSK3roB7Vn59UFzSO9QPBJxnr3dgZFkrkbz0=;
	b=oL2K8fBOH+RQbEx2026WACSSZ5alzxut0WiYi2eoRYElP9IG/yZl/DJe9v6owycyFgby
	 M1Vw/XAQPzUQ4R0z5nyPMh/5qyT72qpMOcxCZKvLkE/lDawOY9DcNyJCoExKX6ZORffjl
	 cj/oP5oFqkwp0Lnr8JXfF47T3pt1QAaen9w8WMjh/ndJWLDTrcXEl4l5NEq64eJpTdhxn
	 dp7Q9FgUmQMzPlnQjFswHp3x4qoPf3J/C7kOXnySoiItnPch0K6CwCS5UItJLuiNEoje4
	 7crHfN3z9Ulw9KwY9Hus015/TzjoZVvyf2YJh5MYEe58IsIHkMNjXJGK7f76TX47GlQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aIK1O+sA;
	arc=none smtp.remote-ip=209.85.210.171
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82DDB60A2620
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 16:55:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 82DDB60A2620
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aIK1O+sA
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-8a0880a46e7so574386b3a.1
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 09:55:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793379312; x=1793984112; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=GctUwbYvSK3roB7Vn59UFzSO9QPBJxnr3dgZFkrkbz0=;
        b=aIK1O+sAVUXAbQJ39O4mLW7XWKjeuGi69KLNSqe7baImJ641MkuB5xHEj4vC2xQ3RM
         CvkIF0XU3kPDe+1UrmUZEVjvV/vKFn16F1awRkok93DTriChkXpHosIe+fS+1DpHmPEq
         Ij3l3NffXixugYs1KPAYf+h10uE/Kr1YulcKhVy69X3pV7KweOpsQdBBEouG51MQCzIv
         e2Uv0VdIN01ktblRX2xMic4Aqo2hWKRJNKnt4M7d20YW1zxUcYEmsQSBOBwkMIH9Q6+d
         T/2YCthH2KyLvgfQ6iBQnYjEZyym6z7K/7aHZWJ/Kdj9c3l4+OsH6ikBGs0vQYFK4Pki
         l5aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793379312; x=1793984112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GctUwbYvSK3roB7Vn59UFzSO9QPBJxnr3dgZFkrkbz0=;
        b=ZM2nXQ8VeBywNjJzX8WSkpCSl1BEJ5uxpGTb3SE5JlnjETPmMGoUmG+pmxWnE60ahv
         5B4clzUCRrLSNvp7B760il+528wBSiZapAQTYWZ59So3ryHxmfNapK2Df1x3P6YJVoXO
         x7oWXlTz0yLb9oQetZBOeJwDSo/k0dUd7Mj5o8UWBuqBVxIfqBysn3jX0gY3ZN3fHHcf
         H6UuKzqRkrP4raaO6jxMKEN/5GWLSgwwFM3kISP7Jim/WkogWXNFDV3WWwYsHZFmwSVj
         6kkyQSbU6BKuJRaX1KlkolfsAWo3YdiT4gOASC0Utio0tDL+UclpHOyw2W/ubG7X6/yP
         569Q==
X-Forwarded-Encrypted: i=1; AKwUvByBHNn1rfyJBNzM/98WaH9OpLFXkW7uRe9JPQfc2H1hE96dnykmYwAidPJwd3nzUUPBje+Kq+gstE1rBOE=@vger.kernel.org
X-Gm-Message-State: AFq9FYKBgXUXlFKJUr+XVHXpUNs+NzLTRP5daUm7qCgScMf5AXp5ho2C
	Hocn798OYvbBH2yitYSOLYuoa+LuiGZUxuuVzKl0MWiWXKvkwkEm7Undc0rNqQCd
X-Gm-Gg: AYBFou2G8EOjkzktd5kcWNvDV/9cW2FBDNi7AvMuskLYPZ0jmkhOET+Xe1UZEbAo77I
	1b/YewM8I40/9rd1DrCmo+ISN/dmZe1S63mFf++bqM87Qbkkvabkiu8FBi42XSBICMHz7eYWvSS
	KovrZVvqDrECrmmOT5xKqx+n89OJPUMweJjFwWooL9+IAIKIGvTlL1a1dxVM0PF0VipPwx3zuXd
	/3cMJF1Aeg6WXafa8rPPp7Md2QiHaCz2Q21LVvkp5gX2LnOsxQyot5NjHL6i4IT3zaTn8OswGxu
	zulxrm6mDKS1L82BIn/PqAwrVv1UEzpwBxttM4pjTNT0fDnctl7fxpmvdzv6LlyZnAprIs3ng4c
	JVsYn/9KlupOiQ4Te0O9JBweKKDMx4GHjVrfMgqesmeIwY/lojAJj78Ybid5MeYS8gheQacvaG3
	qTtmML/Go9qf2a+lLbXhaafEbUYF7FcN1G7niP45jzAUSfIDaazo0ipSAdA9w1vTli/QeeA6dW+
	5q4unmcBT2pmEgxDRtbpxwYkvu8+UqzdtBqbVo/rRAMsSn31FdXXqo/7maz+abx7zbTusWBy/Jd
	h4z6X+elNBgLFoEDBPkmx/JufRgtmjPCZHpU0fdm/q+XkIs4fWid/Ov2y3HVg431j52yzdkTHol
	UtKc/XA==
X-Received: by 2002:a05:6a00:2906:b0:886:5eb6:dea4 with SMTP id d2e1a72fcca58-8a8317dd93amr4216703b3a.17.1793379311688;
        Fri, 30 Oct 2026 09:55:11 -0700 (PDT)
Received: from hostname.tail4fb79.ts.net ([2401:7400:c804:b668:65cc:625f:9c43:1e88])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-8aad963d6acsm272873b3a.18.2026.10.30.09.55.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 09:55:11 -0700 (PDT)
From: Ho Jie Feng <hjf3108@gmail.com>
To: Ping-Ke Shih <pkshih@realtek.com>
Cc: linux-wireless@vger.kernel.org,
	Ho Jie Feng <hjf3108@gmail.com>,
	Kalle Valo <kvalo@kernel.org>,
	neo_jou <neo_jou@realtek.com>,
	Hans Ulli Kroll <linux@ulli-kroll.de>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	linux-kernel@vger.kernel.org
Subject: [PATCH rtw-next v3] wifi: rtw88: usb: don't report the aggregation buffer as a frame
Date: Sat, 31 Oct 2026 00:54:50 +0800
Message-ID: <20261030165451.365591-1-hjf3108@gmail.com>
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
Changes in v3:
- Change to dev_consume_skb_any from a suggestion by Luka Gejak
Changes in v2:
- Remove unused drv_frame members in structs

 drivers/net/wireless/realtek/rtw88/usb.c | 9 +++++++++
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

