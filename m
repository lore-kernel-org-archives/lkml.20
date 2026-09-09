Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8BDF390CB0
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 18:59:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788980382; cv=none; b=Ci2rdXenQj8ycME3eBTI5zJhSIciGThWgu2ymayT4QDKKkEB3HoHHDOsZTI/Y2KHbL/fWzBJPpWSIoWRXn6zaAarGUNNEczFLATkaX6iclL5oQa2Q7GhEx8wyiSCOvIaLJqeZU+WbsTawuVKGwUHYCZ6/fcUVgStXRN84esEMQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788980382; c=relaxed/simple;
	bh=A3bchGY+kz0lZgkCyyDioMWnheewJPx79xZCrOEZtsY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KjXyjT5z4AyQsm2yHMKbk9AzIt/qTN089S6uqpGOeErRunRsu98sa0Og9FEAW/fcEBPT1H27KIXQKHw8tPdyyBqGHYb8X1xI7o4ED9JgicVkW4mtp1/VytxynXS2XDErIlQDqUhw7wMTipfOHL9RT2zajHGqibxYfbwyXg6/Ugk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eWpDceV6; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eWpDceV6"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49ccfd61ecaso6804665e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 11:59:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788980378; x=1789585178; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EW3QQwRMlnzoZrrbBdGZDRMb7oY2hJNihqkm8pyQ76g=;
        b=eWpDceV6uCT7HpUl+xI5a4uSGu5oTiaYbPLR8dRV/RPKbKnlzehrZ4GR9Ul288avwX
         1wiWRbXP9eQI6PZNClThF/nLak5AFnJ2Vjf2pw8nwT09/J+B2xj7FaiLcU9Pns3TKER5
         Dsa8/DFaaKjq1Uzv++n3Hi1bxA4wfVsx5Rsy2ukniR8i0r/fo/SWBNsVtI+1C3tJF3d7
         U9WmGp02X/jXd4vjqf1Op5EA5jKp00SwdxQTBiu/Lq9b9FKrTuLsQ+affGHY2FcwYVBC
         u0GeuWB/KLALqZwY8wzxszsCCQRtIInZXUMfZX0k7i02N+bwgXOndOVQgu2kGU2YZC6x
         US0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788980378; x=1789585178;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=EW3QQwRMlnzoZrrbBdGZDRMb7oY2hJNihqkm8pyQ76g=;
        b=rcgI5xi0fs5/g5hY8IWDMBEoL4xURTJshWNLSbXOz7mXw89jAofEqe7YQdBWdUjUWu
         8/o/8Y41dcHG/8tUydN4ydQO221UXgqExif3jLWZhtRsR1NQkI/gLOuNuKIez0q2ifFe
         3GeDWdQy6E8YxZ77/4QlQ8m2xy5u3C+zJKE0GD7IY6OSjTzkpv/LCdJSqnYEGDc13rbP
         XPff66NyCieGVh46vwlfII4lpzCjvyhk2Z5+CUyUWTjwdOThIc7arxuQsN52dx5dYvzP
         uX4ArwE98yK3RuteKy75tVtyE5usDSCkJgeSR+eOYt3kr8jV+e0IG5c2IruMqSjOixu4
         ++IQ==
X-Forwarded-Encrypted: i=1; AKwUvBys2wnZCNuHCs6vbak9TiR+DZvMa13sk+MOpGiGS/D0c1ZYu4N4bPUylEwrf9Y1hnYuvbHaoXd7pw+T+CY=@vger.kernel.org
X-Gm-Message-State: AFuF++k546yfiKsoc6ZnljkvZx8l52vD8FUNJW9TedV7rto9wOsrGDgx
	pA8nDaVSnFhyodVduNlXvFdJbyBuX2jIi7QpTc5fWoQAhHiQbwQ7VJaQ
X-Gm-Gg: AYBFou0cfNvPkzab25mjGr3OYmq7iVy0uaYbfUX81n7F9xZgqiVsEpFeNNpUvHp0b7C
	vHCMbZ15O/ofxphblB7FbFanGrbftVFyBsAr6BXKRwNTXEsbjZsFC1kUX6yojlgCm4JUhPO5vsz
	xUmN5PboflRq8tttIMgjBx/n50dF0qmKfK1J3vrYZG7ure5h8LakDRwjqCN4D2+HO+wfzVst5Gh
	RvZq0+g7U02AudO9a9XQ1BxQ2it9JVQTOykeNf/NUGpXqozUlngb1vCAAwb3QFp4sF7kaD0oKOn
	N6mPw8FxTgjGaD7/JgfWIPZzSyaXC/gWZbqpDaECbuGw+TXptRYqH+XqTPGcsuwq+qtGI28flzC
	9lJqO715evunxr4K4Y3EwC7ZIOqUVTCPxoBHAc52lclZOI1tFu6L+fmUfev3zvBvFQOR6JL/cdN
	BczQpMEqtKNvkwNX3MpyjUdmbHqvLb9AUoUX4pBV4Z8+T/a513geYsQ+COPD09yqejQ6DZMvkNs
	8o2fzGxXLqyb77y9LF3bQidqmBNmA==
X-Received: by 2002:a05:600c:4f44:b0:49d:e0c:e55e with SMTP id 5b1f17b1804b1-49d25914e45mr27116285e9.23.1788980377829;
        Wed, 09 Sep 2026 11:59:37 -0700 (PDT)
Received: from gkaran.home ([2a02:587:4e00:af00:4405:590b:435f:6c05])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d26c38e3asm11305025e9.9.2026.09.09.11.59.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 11:59:37 -0700 (PDT)
From: Georgios Karantzas <gck.kara@gmail.com>
To: toke@toke.dk
Cc: linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Georgios Karantzas <gck.kara@gmail.com>
Subject: [PATCH v2] wifi: ath9k_htc: bound TX aggregation to MAX_TX_BUF_SIZE
Date: Wed,  9 Sep 2026 21:59:21 +0300
Message-ID: <20260909185921.1757-1-gck.kara@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260831173931.1672-1-gck.kara@gmail.com>
References: <20260831173931.1672-1-gck.kara@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Bound the TX batch by cumulative byte length, not just record count.

Fixes: fb9987d0f748c983 ("ath9k_htc: Support for AR9271 chipset.")
Signed-off-by: Georgios Karantzas <gck.kara@gmail.com>
---
v2:
- 72-col wrap + Fixes: tag.
- Accounting kept: deferred len += offset never fires on early break.
- (!i) guard dropped per review.

 drivers/net/wireless/ath/ath9k/hif_usb.c | 18 ++++++++----------
 1 file changed, 8 insertions(+), 10 deletions(-)

diff --git a/drivers/net/wireless/ath/ath9k/hif_usb.c b/drivers/net/wireless/ath/ath9k/hif_usb.c
index 0a3d2190b..533e74565 100644
--- a/drivers/net/wireless/ath/ath9k/hif_usb.c
+++ b/drivers/net/wireless/ath/ath9k/hif_usb.c
@@ -328,11 +328,14 @@ static int __hif_usb_tx(struct hif_device_usb *hif_dev)
 	tx_skb_cnt = min_t(u16, hif_dev->tx.tx_skb_cnt, MAX_TX_AGGR_NUM);
 
 	for (i = 0; i < tx_skb_cnt; i++) {
-		nskb = __skb_dequeue(&hif_dev->tx.tx_skb_queue);
+		nskb = skb_peek(&hif_dev->tx.tx_skb_queue);
+		if (!nskb)
+			break;
 
-		/* Should never be NULL */
-		BUG_ON(!nskb);
+		if (tx_buf->offset + nskb->len + 4 > MAX_TX_BUF_SIZE)
+			break;
 
+		nskb = __skb_dequeue(&hif_dev->tx.tx_skb_queue);
 		hif_dev->tx.tx_skb_cnt--;
 
 		buf = tx_buf->buf;
@@ -342,13 +345,8 @@ static int __hif_usb_tx(struct hif_device_usb *hif_dev)
 		*hdr++ = cpu_to_le16(ATH_USB_TX_STREAM_MODE_TAG);
 		buf += 4;
 		memcpy(buf, nskb->data, nskb->len);
-		tx_buf->len = nskb->len + 4;
-
-		if (i < (tx_skb_cnt - 1))
-			tx_buf->offset += (((tx_buf->len - 1) / 4) + 1) * 4;
-
-		if (i == (tx_skb_cnt - 1))
-			tx_buf->len += tx_buf->offset;
+		tx_buf->len = tx_buf->offset + nskb->len + 4;
+		tx_buf->offset += (((nskb->len + 3) / 4) + 1) * 4;
 
 		__skb_queue_tail(&tx_buf->skb_queue, nskb);
 		TX_STAT_INC(hif_dev, skb_queued);
-- 
2.47.3

