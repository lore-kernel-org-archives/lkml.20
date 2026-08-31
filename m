Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04C5B439F87
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 17:39:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788197989; cv=none; b=n3WEjAc9xouUtowoQuJUiJMmgUIIyMGZKytKR+s5rSTSmApWnCkq/1O8X8KIsLvIIS3I41ZC5mXCszhq075E7xuaLT8Of2tsfT5sh/rP0BMvdelP0Ott94qcExcx08zATJC1UPaq8uE0CkDEPA1Q3w+xW23E/MYphZiRI3Egb4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788197989; c=relaxed/simple;
	bh=9mEPRNORGEsWlSkrt74aGVDx72yctD38G82rJmY7P38=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=d1/Sh3sMErt+k22jBOSv7A8AIMHNjEkDDqNPoT/GLyI1D0KKmgGsLFeE8MYVRobFZW156eL5STL05cbuI/o/XfRWG8aDkJwQSh2Y4YbCc271TWE4Lcblu2KQckIf9cTppG5htAHrF8DS7504g+VNPqUgFSvWmPY06xeYQC7P/I4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a/qN/p4X; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a/qN/p4X"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-48436216a98so969828f8f.0
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 10:39:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788197986; x=1788802786; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=pE5lwOeG+dorblBGAN65Wk3d3m+gua2JMLbC6fc1KiU=;
        b=a/qN/p4XhmyaIzxx2wfBxApGizf3Lqeh/egMoVb/zaoyERM1iU8Z+lfDktmGEuRKtw
         XJYcbq/IMC83Hf2BNs5QnH1pTNrJmEEpAztuoORI9GCPayB2ACnl5ADaIq9XGKg4E+FA
         S7BlDYvRpv+m6+wmRIxq0ZEa4/5uVeXxxqQHYcujob6TljsRmL6OQxZh/o6L4LalnsKX
         GWs+Rp8YIgGJ+IJ9ixp6H9K+U+x+tlWaBWoTgi6epeczuf/XW2ACmD8xHUpVbHSEVWRG
         ShSUSNftTisJVy/dE3tCql45Tiikdq1UoahXePfi51hfu4u+SzlxPV1IxejcflmQJFTC
         Wv2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788197986; x=1788802786;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pE5lwOeG+dorblBGAN65Wk3d3m+gua2JMLbC6fc1KiU=;
        b=bxvXI8CLlXsgwZX0LD3TzyezpRdXiUnnREGHwCy3rhjXocijYPVTBimlztuRWpOVOU
         YbHb9T3GvXWfegJnTOh3abg4w6dj9rTvUXMYbofPxWW7/FNvo2w3mdS9ESaUntV6ppVM
         M+/9BY5h+vBSxhQvmbhtAuZX9mvKPrYYuBmguSaO2WStIm1/A7b1VBSjJhzTkP9xWyT8
         Z/nU7/qOJh6rXk86y3tbHI+eN/kdCAZXmTyJuV82Vehl5Icjgj6e4KJyCaILAbLjAbUg
         OXfWz+WoO7G/O7NOVAhT//CtVI2pkwHNVbV/znXRhPRyPy40xb0iYSTZiXHG5bKA5Uon
         M5hg==
X-Forwarded-Encrypted: i=1; AKwUvBz8W4byanfWioeXcJ6CNf3Ltjat8HxfuNERNssa+AhSUp4PcfMvZ7bgGVJWn4xx4VGkqx+mBDL3DSpW9co=@vger.kernel.org
X-Gm-Message-State: AFuF++lsfas75W/SwZVBrtDiiWoPHuhHU4M+f/RSBPp+SeDamBwY72Le
	SkE9ouRZAQiVezDQMstJmxKJqhQi4VVQSOTWHiYlvJzBodiMUsFuirrY
X-Gm-Gg: AYBFou1m1Wme691zFrAe4MtzJWjt8yydQjmek4GFleuZ/NIgl70BkQAMvf35Pau0vxr
	XpUUx3l3cInl8vQTQtI7iRJt8cOXvWzSikvPpQNdBdjRq7G2kdIKQyvcT6Y8hSrlvVJjoJs271K
	dyq7C9rOKb7vvTpIswke8K/lOp2x63ykWqWAZBchJihvi93/fB6FWiewL6HjNEbu6ggi3qiL2Wl
	haTHWVqqwRqMQc9ZiyNOoJ/ZZuX2Ih3JThtvhpP2jfQ4jHY4BWuFwJi5r0SC4d80bBdJSDrG7Vh
	Peg23SJpV8KnKiV5l8p6fpU/SHNDWNChTjoFb7fnttRQvF7ajPZKtxrfHXgF7hzL2KAlZU1XMLq
	fz2SrPb9pJaLN2qEbOXDxacguK85bG8yH7RhcObgBuA2RiSl12+nntjl5E7ZJzDPC5jLtD0rjYi
	PrWk4/bUB7C1bPTPXxX93NxWJRvqY+sCwFK1wg9uLTBqIhQT7uJaA3UQ+gIJyzNy5T1PFmeOKKR
	uFnJ4Y3g/eNxjR/XkU0
X-Received: by 2002:a5d:5e8d:0:b0:484:3317:a16 with SMTP id ffacd0b85a97d-48433170baamr30663815f8f.23.1788197986040;
        Mon, 31 Aug 2026 10:39:46 -0700 (PDT)
Received: from gkaran.home ([2a02:587:4e00:af00:4405:590b:435f:6c05])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482fbab3f3asm24281056f8f.3.2026.08.31.10.39.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 10:39:45 -0700 (PDT)
From: Georgios Karantzas <gck.kara@gmail.com>
To: toke@toke.dk
Cc: linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Georgios Karantzas <gck.kara@gmail.com>
Subject: [PATCH] wifi: ath9k_htc: bound TX aggregation to MAX_TX_BUF_SIZE
Date: Mon, 31 Aug 2026 20:39:31 +0300
Message-ID: <20260831173931.1672-1-gck.kara@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

__hif_usb_tx() dequeues up to MAX_TX_AGGR_NUM (20) frames into a single tx_buf of MAX_TX_BUF_SIZE (32768) bytes, limiting the batch by record count but never by cumulative byte length.

With large frames (MTU 2304), 20 aggregated frames of 2292 bytes each exceed the allocation (20 * 2296 = 45920 bytes), so the memcpy() in the loop writes up to 13152 bytes past tx_buf->buf before usb_submit_urb().

Peek the queue head and stop before copying any record that would cross MAX_TX_BUF_SIZE, then dispatch the current batch. Leftover skbs remain queued and are drained on the next URB completion.

Signed-off-by: Georgios Karantzas <gck.kara@gmail.com>
---
 drivers/net/wireless/ath/ath9k/hif_usb.c | 29 +++++++++++++-----------
 1 file changed, 16 insertions(+), 13 deletions(-)

diff --git a/drivers/net/wireless/ath/ath9k/hif_usb.c b/drivers/net/wireless/ath/ath9k/hif_usb.c
index 0a3d2190b..3e9d0c59b 100644
--- a/drivers/net/wireless/ath/ath9k/hif_usb.c
+++ b/drivers/net/wireless/ath/ath9k/hif_usb.c
@@ -328,32 +328,35 @@ static int __hif_usb_tx(struct hif_device_usb *hif_dev)
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
 
-		buf = tx_buf->buf;
-		buf += tx_buf->offset;
+		buf = tx_buf->buf + tx_buf->offset;
 		hdr = (__le16 *)buf;
 		*hdr++ = cpu_to_le16(nskb->len);
 		*hdr++ = cpu_to_le16(ATH_USB_TX_STREAM_MODE_TAG);
-		buf += 4;
-		memcpy(buf, nskb->data, nskb->len);
-		tx_buf->len = nskb->len + 4;
-
-		if (i < (tx_skb_cnt - 1))
-			tx_buf->offset += (((tx_buf->len - 1) / 4) + 1) * 4;
+		memcpy(buf + 4, nskb->data, nskb->len);
 
-		if (i == (tx_skb_cnt - 1))
-			tx_buf->len += tx_buf->offset;
+		tx_buf->len = tx_buf->offset + nskb->len + 4;
+		tx_buf->offset += (((tx_buf->len - 1) / 4) + 1) * 4;
 
 		__skb_queue_tail(&tx_buf->skb_queue, nskb);
 		TX_STAT_INC(hif_dev, skb_queued);
 	}
 
+	if (!i) {
+		list_move_tail(&tx_buf->list, &hif_dev->tx.tx_buf);
+		hif_dev->tx.tx_buf_cnt++;
+		return 0;
+	}
+
 	usb_fill_bulk_urb(tx_buf->urb, hif_dev->udev,
 			  usb_sndbulkpipe(hif_dev->udev, USB_WLAN_TX_PIPE),
 			  tx_buf->buf, tx_buf->len,
-- 
2.47.3

