Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794122402;
	b=TU/60uW6q2DsK5prA+yxFGOMdAfmMr9r4mdC/U8l7BUfEtTfqz0TbfXZX4lFzTx889wi
	 6h3fIsdIFtOGrQQEP95mPPpwV+FcJuZ5mIxaOe0Lwv7HRCMto3+P5Vk/m+DR3CHjPZpys
	 GiuPl6dbrGxKClEfMYKVwf2hxLZPAs05/GkWcWeelv7Tp1Z0hlbdqvbry5bI2ZXBAy4LK
	 +DVtedmjZMDjkjbEnJmoBCM17rpSQOd7G/leEDq0v0n+p2lZBe9LbXg0AAtVRAMN4qltR
	 G3HJH5pIuD+W3VadJzvI1yAiWFzfgaaXsQHGvY1X9bviPQuYMA+bNvRIxY2sKjkRFfg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794122402;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=+BAEkxNvBHvI4oVXleZQzH89SgumnMLG6pLMtheddDc=;
	b=WBWAX2Cx4N+6WBtnOsQtjUB4E8tq9Mh7yTVZH1bzAJF8hhtqT6DENRW+ql972yeOLdzl
	 9vO0oxW8KqW/k/+7owAkKOTuv3TFyt/DvWduPWgxzrkypRQaWZDgMKndy8u1gsfjv25dD
	 yVGAPYtaTE2Emn9ZH599gbpCvO54Q8aah+x8jsG2FMlux+v/H8UO539bWkKXbgOZO83XF
	 EdNq7F6fnCQL7tM3dlX3iiYwqHQubrIXXsyoH+Rq3oX9F3dYnmC38/011bqaeEOWI9c5B
	 zRa7SOJJRyigRsJgzex0oTQEqfIFCqDfQg+GazpIqne5OlvNepwH3BNeSZaCT0qkXNA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sfktjfN3;
	arc=none smtp.remote-ip=74.125.82.176
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C9FB606A323
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 07:20:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4C9FB606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sfktjfN3
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-36e99cf7bb3so473454eec.0
        for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 23:20:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794122400; x=1794727200; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+BAEkxNvBHvI4oVXleZQzH89SgumnMLG6pLMtheddDc=;
        b=sfktjfN3V37CCy+hrbdEGwDMcQIioSmKt9TB+5jZ2nAWD43mk6QhkJKsqYQAAfMCON
         r/juE6uGaHSB4UZB2luTxhKhlk1zTpl4K01yrIjnCMKvJT9agskrvkF6NtftyMGeiled
         xhjzvplkwq63f8B8TRDysndylgpKERvoJbwQ3ZISBIjRkX9EGsWUg7bw0XoBgFeDuSyI
         MZSLZJ9C95YlE6mrS1oiuD1BIZw928vu7kXTqrjDWiGfD+XBecjtmoqp5g9pWQZBPbp+
         eehUHqKLQAEFoOojc4JULc/UC8i+5M/5EfQnj3SAkcCBnktMK2By/KE8rAO56m97T/fO
         zmWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794122400; x=1794727200;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+BAEkxNvBHvI4oVXleZQzH89SgumnMLG6pLMtheddDc=;
        b=YyzJJjOm5oJi2L4eeOqkdtNuj4Idgm4wiRlFFgw1cVafz0wiaWpeN11o7h9AxLD6lH
         0uhc1wd+/up1Rdw6O+cAqLCQwI26grTY39gVz2iYobCMFkOekXeDvsBekyhJJGEJUhAF
         331VIQo5Gn4Pq+ODgZY3Jx6zjslP6S6+wO/Ve+VKsh9Fk8Wdq1/qgcfXdt6wtVqAlnHE
         VE9rnSuizYWklGOynPzAa0yHEkdxguKav+Ith5U1Ohl5/kKkCB9RVhEyOZkR0rl8+Ot2
         l4kFRtBkm0+zG6izjXVKhpw64mQch71oW/ob6KwPHc+8rkZhZCI4deIpG2Xf2if9mOvX
         oV0w==
X-Forwarded-Encrypted: i=1; AL+hErGcSMfkNjd/uoBCiL1/XMXWHZG1ZRp2be+DorSVHzGvJ83+q5XyIzH8M/iMc6zdHMtvoyQmKCrguOF+j6A=@vger.kernel.org
X-Gm-Message-State: APuU4Z/r7xLs36QZ8D9EFQNzBlbKJRMnHMGBQr36ljHfuupe9caflS94
	XbUkt58VahMXkIm8pvwuEBibhglnbW2LZn6t2yNzozuUTgcozUEbXyQU
X-Gm-Gg: AYBFou0lPZtE4N1GACyX2ry4wHpkEN1Q3k/lpqzdFelm2IAHV35MU/xUoB/oSfuQqTx
	GtA+Dr5RcE4qYaJn9PZtjwu4Dbny5YGcTI+tLCW7xY3yMOMj5+QgTaiSPWMDNNMh8TjNKxNRHw0
	FtU8gqj5C1N5Jj00XP27WwDEyztbXll1zQ8pSHpS41fjbP0/2i/0VnvI+q1/axz7uHNRyBw5rcP
	M5moFxu7R83m0CVCzckRzM9H2kYQMEHuvRgwRloCoaxXXZ5zGNq/L8WHP9haxY/VMWeoFZiLIYO
	fPydN5dN/r9X03B3GoTbThI/SxP4I3fBOrZhfU7jHua++WQGY3pVZuAEfaFgH1cYxIBAL+DLSRp
	JH3NLdsKV0lYxy9sBfT1ui7TLSgnYsU0nzhBlfq7/FgWFFPqcm8wVD0Ist7b2YLJgbjl0bHdFdj
	Xt5ZeIusnVzUleqBmH0mbJPHA1DHEC4HDt/AYAAiuDLLrK27P3QQ4/ibsFmIFSIAGX7LIaYV+c6
	PA6w8hBBupkh6XJxGSkWtqzkwho7GIZLxjNm9eWxB9vdS/wuH1wUf+1D8ODLak8dGMdHzpsAwXx
	cxovBOW60FwgjHcXaFqvaWxl10dLzTQ2ZLryqfH10WJOlageTy37JcWIoyOlrGw14mw=
X-Received: by 2002:a05:7022:7e8e:b0:188:e51:e86a with SMTP id a92af1059eb24-1b39fe307e4mr1220936c88.2.1794122400254;
        Sat, 07 Nov 2026 23:20:00 -0800 (PST)
Received: from cachyos-x8664.nitc.ac.in ([61.1.180.57])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3755e8911sm4207262c88.5.2026.11.07.23.19.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 23:19:59 -0800 (PST)
From: John Robin <johnrobin044@gmail.com>
To: linux-wireless@vger.kernel.org
Cc: kuba@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	John Robin <johnrobin044@gmail.com>
Subject: [PATCH v2 4/4] wifi: mt7601u: optimize management frame routing and queues
Date: Sun,  8 Nov 2026 12:47:46 +0530
Message-ID: <20261108071820.35303-5-johnrobin044@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261108071820.35303-1-johnrobin044@gmail.com>
References: <7ededd2f-98d0-41ac-91b4-2977963c4637@gmail.com>
 <20261108071820.35303-1-johnrobin044@gmail.com>
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

Route management and injected frames specifically to the Voice (VO)
hardware queue. This bypasses potential firmware queue suspension
issues. Furthermore, avoid requesting ACKs for multicast frames and
skip the standard data rate fallback logic for management frames to
ensure stable transmission.

Signed-off-by: John Robin <johnrobin044@gmail.com>
---
 drivers/net/wireless/mediatek/mt7601u/tx.c | 19 ++++++++++++++++---
 1 file changed, 16 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt7601u/tx.c b/drivers/net/wireless/mediatek/mt7601u/tx.c
index 5aeeac0dd9fe7..47c78c4ff5144 100644
--- a/drivers/net/wireless/mediatek/mt7601u/tx.c
+++ b/drivers/net/wireless/mediatek/mt7601u/tx.c
@@ -27,6 +27,14 @@ static u8 q2hwq(u8 q)
 static u8 skb2q(struct sk_buff *skb)
 {
 	int qid = skb_get_queue_mapping(skb);
+	struct ieee80211_tx_info *info = IEEE80211_SKB_CB(skb);
+	struct ieee80211_hdr *hdr = (struct ieee80211_hdr *)skb->data;
+
+	if (ieee80211_is_mgmt(hdr->frame_control) ||
+	    (info->flags & IEEE80211_TX_CTL_INJECTED)) {
+		skb_set_queue_mapping(skb, MT_TXQ_VO);
+		return q2hwq(MT_TXQ_VO);
+	}
 
 	if (WARN_ON(qid >= MT_TXQ_PSD)) {
 		qid = MT_TXQ_BE;
@@ -134,6 +142,9 @@ mt7601u_push_txwi(struct mt7601u_dev *dev, struct sk_buff *skb,
 	struct ieee80211_tx_info *info = IEEE80211_SKB_CB(skb);
 	struct ieee80211_tx_rate *rate = &info->control.rates[0];
 	struct mt76_txwi *txwi;
+	struct ieee80211_hdr *hdr = (struct ieee80211_hdr *)skb->data;
+	bool is_mgmt = ieee80211_is_mgmt(hdr->frame_control);
+	bool is_mcast = is_multicast_ether_addr(hdr->addr1);
 	unsigned long flags;
 	bool is_probe;
 	u32 pkt_id;
@@ -148,14 +159,14 @@ mt7601u_push_txwi(struct mt7601u_dev *dev, struct sk_buff *skb,
 				       info->control.rates, 1);
 
 	spin_lock_irqsave(&dev->lock, flags);
-	if (rate->idx < 0 || !rate->count)
+	if (!is_mgmt && (rate->idx < 0 || !rate->count))
 		rate_ctl = wcid->tx_rate;
 	else
 		rate_ctl = mt76_mac_tx_rate_val(dev, rate, &nss);
 	spin_unlock_irqrestore(&dev->lock, flags);
 	txwi->rate_ctl = cpu_to_le16(rate_ctl);
 
-	if (!(info->flags & IEEE80211_TX_CTL_NO_ACK))
+	if (!(info->flags & IEEE80211_TX_CTL_NO_ACK) && sta && !is_mcast)
 		txwi->ack_ctl |= MT_TXWI_ACK_CTL_REQ;
 	if (info->flags & IEEE80211_TX_CTL_ASSIGN_SEQ)
 		txwi->ack_ctl |= MT_TXWI_ACK_CTL_NSEQ;
@@ -197,6 +208,8 @@ void mt7601u_tx(struct ieee80211_hw *hw, struct ieee80211_tx_control *control,
 	struct mt76_sta *msta = NULL;
 	struct mt76_wcid *wcid = dev->mon_wcid;
 	struct mt76_txwi *txwi;
+	struct ieee80211_hdr *hdr = (struct ieee80211_hdr *)skb->data;
+	bool is_mcast = is_multicast_ether_addr(hdr->addr1);
 	int pkt_len = skb->len;
 	int hw_q = skb2q(skb);
 
@@ -211,7 +224,7 @@ void mt7601u_tx(struct ieee80211_hw *hw, struct ieee80211_tx_control *control,
 	if (sta) {
 		msta = (struct mt76_sta *) sta->drv_priv;
 		wcid = &msta->wcid;
-	} else if (vif) {
+	} else if (vif && is_mcast) {
 		struct mt76_vif *mvif = (struct mt76_vif *)vif->drv_priv;
 
 		wcid = &mvif->group_wcid;
-- 
2.56.0

