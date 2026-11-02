Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793589890;
	b=GGIzE1KGV3Atmd1qgQ4PeHKH8gvVlwdYQsIt9pabiPNnV160yS934U4NIjRCP5noEvQ6
	 uA3fWlKhg5Ys3ZP3EGIWIbLHZQZmhTm/0bltquH5UgsnZYbU5maKmOdPVSWbjaAZQ0kTw
	 j9HhV+VXphxa02PW2Z8RGp21S2XMRVR7NlhPjhQ4/9vXPsv6HQIQG61HeOeDNvVhbKOe4
	 nz5+W9Wpv2OGnqm294oJ/KnC8X6F2g+lSTxsKzoVNrOCwTW9tg7Cymtk3bAw6hrQqF558
	 5MN20xA1JnTR1jqqweEwvxjVt7GGBa7wP5wxI2bReq3OsNGvu16HdyzUJxqn8ncc5ug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793589890;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=5Oyg7MidDkH2XnR8LERs6tT7rPX18G6kuPdnqFHnUfU=;
	b=x1yX/0SkPaQp+4CyVTGHLjTO6JKbOBAL8uxz/iCl+YEEteJgSGdI9xUl7n0+kaU7LrfT
	 jZBb4IN/LHK7YwclRUhw/aWN81LUbsomrHWCH8ogGYX9dYP+Ec4QEBTpqrW2GRWlgnpAa
	 dZtoOJ6JhE7XVjCc0DZvTj0pSuiV+Rw6t6dNmC+Yd4ePj5r1Ocyf3Tc0iyXY7gKEOdE5r
	 5b83TGfbiJpQHBI6/oFB/fbKdQmYd5wTufjbTkSJKmABqnpoYKhIteeRrErRUtXCXGqKH
	 JYOqrRqGJ/SAdDZQyMgG1DfVx+eB5UTfdNEKoSjbEXCs6QuLBUrV7vAHTWT8HKgYAuA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xqC2vHhV;
	arc=none smtp.remote-ip=209.85.214.178
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 867DB606A324
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 03:24:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 867DB606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xqC2vHhV
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2e60f9af6e6so23568275ad.3
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 19:24:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793589884; x=1794194684; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=5Oyg7MidDkH2XnR8LERs6tT7rPX18G6kuPdnqFHnUfU=;
        b=xqC2vHhVsxX6SVptTr/KXC/b0NnZcdD1e+gWluYRmb67gA6b3oN71/gF6ofaxo957E
         U6d2hA8N27/gmt+wr8UvkFpM8Rlof+c4kXYVx4UBreJUjAxlKU3SrgNEaBdLUzLK/Pr7
         JPHvylia3OGckBslOKygGlsRGraHmPmfK1jjcAUC71kpwe8ZaN2Xg+O6xDZg8GsMK4DS
         z4Cd47NuRrnJcuZySA76BHi8/fO0Qbh2NS7T4RcFzmpR3jkkOUf/d62ubjIxoVqJUkgE
         sLexWNPc9ILOkNUCnO1MxM21GplY5BAdzfBjePmySkOitJ1JICt0l3LQK0YHYdynzwcp
         /geg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793589884; x=1794194684;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5Oyg7MidDkH2XnR8LERs6tT7rPX18G6kuPdnqFHnUfU=;
        b=1aFUM7nb/Z9O1A8DIzC6QMQGNSUet6NQl+owcBk+Cy+WeiGQ1vYKVzGdHw7eDaoPmK
         DN97+vDYK+Ar8xEBCA1I+JruoDQw8Adx/bw+MOSO0IqgAR6aJ6RP1wTlZ0cLADxpke5c
         N5niv53c0LmBM8FNi/CElygrxTu3grwVJwMV2qhHkhL+iEyRuA9Wxi1G9PG+QhwUK2Ld
         BI2UOXZfPv2M4+Zv7lGFWM+QZPumhqT3c9aAEo0zt0VgWMNP5uDQAqM+zfZgmgO31CHz
         Q2atqGGwylvZ6tXClskXCzhrEPULo7K5AE8DVaa9CPiO1GmG2XXis4zIOfnzHPhkwp6O
         Gd9Q==
X-Forwarded-Encrypted: i=1; AKwUvBxznKLx5xe0x8tPUALQBKbcxuy6okKGpTzZVg0XnkAgIaQ3XbvGewaAHXsdXfVEbmF0MH4YsnP9SJH9IjI=@vger.kernel.org
X-Gm-Message-State: APuU4Z9gV3J5YYAv6DHGzYjNaPb4l0nAmpDDeUt+xY0jP2Np4mLy0MUd
	Mqp4QmNzniQhFGyzE0n6Om9mh+uPSMCFCGMp/AtVdWsXcea5/gWIJYMa
X-Gm-Gg: AYBFou3K9m7Ckgpy4DOb3zPK6PXMwXfzhhHd9B8+/Vx4brA1iQNYBgqQZ5oVomCaHBX
	rgv5dsvBryX/kckEqYzcsAzI+DqDXq4ZHKXppo7VRhf/yS8M9G6ZuwkXBVu1IvmfFqJgzF0haHi
	uxgGQgZa1DlwOPtznp84dRzCnK3jvd69OWdt3ljfctpdAM5iSYVZOiM4751CetSFE5paJM9XrR/
	GSlhKuL0m5BfFKGjbr8IGddK8nah6nQZ3I8Afke9ncQ7F7/VoZjUlGogGUe+MNpg2TGFsGcOwBz
	IbVqugbT22Ha89dnz/LOVdUJKBdwDu1TkUAiAUt1jzsa6zfaNFa1/DdC0Qh148E52asYGcYgwKM
	UE2c7cjvYKxCiukNGaKrHqnHOlzpBCldA3VPY5h94zKeDXh1UlpqP3vuF3cy+E7QNjbJiNiyrdj
	uGS5ZfMrrl/Z7sXuTGjhi6vRfwB1dtzCGkUEi2liS3uMmxSNRqI43d5eTrbPSMOmCcSRyNdEW7S
	wK9OL9A7IvBW65nRE0eCNMCSCRAKQewv8U2JTKbwX6fB4oouZBoPuk1HvfbKC8Rkj6lCLdFeauc
	jx4ZtRP30zd1moq/pIlZOEYK16HfGgFx8GqpYVE+BZE60NAqtes9mbCgR6yj06NHAn3EO9zZJhg
	vaJQ3gw==
X-Received: by 2002:a17:902:ec85:b0:2e9:a23b:643d with SMTP id d9443c01a7336-2eb364d253fmr80430915ad.35.1793589883793;
        Sun, 01 Nov 2026 19:24:43 -0800 (PST)
Received: from hostname.tail4fb79.ts.net ([2401:7400:c804:b668:65cc:625f:9c43:1e88])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-2eb392b15f0sm21822195ad.73.2026.11.01.19.24.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 19:24:43 -0800 (PST)
From: Ho Jie Feng <hjf3108@gmail.com>
To: Ping-Ke Shih <pkshih@realtek.com>
Cc: linux-wireless@vger.kernel.org,
	Ho Jie Feng <hjf3108@gmail.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	neo_jou <neo_jou@realtek.com>,
	Hans Ulli Kroll <linux@ulli-kroll.de>,
	Kalle Valo <kvalo@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH rtw-next v4] wifi: rtw88: usb: don't report the aggregation buffer as a frame
Date: Mon,  2 Nov 2026 11:24:25 +0800
Message-ID: <20261102032425.8249-1-hjf3108@gmail.com>
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
---
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

