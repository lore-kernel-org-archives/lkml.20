Received: from mail-pz2-f41.google.com (mail-pz2-f41.google.com [74.125.228.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCA743A383A
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 22:34:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789857280; cv=none; b=HYGHeHOLLzZ45B2HWYybJw9bsae+CKgO7GsOwDh+HYLUvlssgLS1qzYQtiMw5BGeV1E0m+n514+Tu7MmVQu+tO1ld8E1/+Xb9u1zMBj8pfJycyiCG4od2kTzQkr143oMgHWKJO4fH18qhQ4jpGIIr9ALLtH+a0YpXdKFjaUBlFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789857280; c=relaxed/simple;
	bh=YJzIm5QA/CHQO6n6vteWNo/Y1kHnMLjMisvbzcEtMco=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VP3xCrX19SY+5ZfkO1FBrmQlh0V5ifvwqhGtpFd+YLB6numKlC60oAUqi1L3OQgeFyCudNUpYtF9EytOUXDIUfnetrdcOUFDKGl3ZNtwMxliVT7MemJMMLnmGkaK3Om/jJ+50YUX/w/YVp6b0RSoLPUswbxC+w3BDxwavr16udo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pFFLTC2I; arc=none smtp.client-ip=74.125.228.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pFFLTC2I"
Received: by mail-pz2-f41.google.com with SMTP id d2e1a72fcca58-85469e211a3so1625039b3a.2
        for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 15:34:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789857278; x=1790462078; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZPaps3uZw3+pSOsVulPRPw9JNmYOgWQLZSyhTH36qMY=;
        b=pFFLTC2INjED/CG7b4vrIABeK9tfcCeOqbsqZRsl0IlL1uFKuZk4S7pLCGC6+cWLp3
         Rs8x2D9I1QEmVN/PLwoeXseHE6AYP1z87CmL/4Bo22EjBE8A9BDlqxvHYXTJjoz4Awd9
         KYKoGIWC6yd3fJgv6q0rO5OYiCe8ijSOO241gdvxaX++AH2BVVv8i5eZ5MB1IrLXGLsZ
         QFGLRo2Xouj8MyXJb3ak+r+ApwYpeMIU4FT5MEiBARnChf9qJI8HjvbZ88rkgzSz7tT8
         5cfmYE8JOwRE+dN/PDLDkvr8eI8+pO6h8zWZ9vWvxpQWEplrkVoZwsPGb1yOdnUwtu+D
         VS5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789857278; x=1790462078;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZPaps3uZw3+pSOsVulPRPw9JNmYOgWQLZSyhTH36qMY=;
        b=sPlKMKPdwwXroWfWBdctdwvaYLbGyXpJAzRQO4CKgoWcQXLdwyQ9o5je+DLnXtUDD1
         TiRpjABTHagQJ9fesrZjyc7tvlXijEfR40+0LjzlVPQXILZEQd632dPSCPCOjcZqaVLH
         SioyMR0gbr7DZpKk+mfbb7H0XjF+kL69FFyP+MM0hpyDR+GQQ7FY6qTz2LhDcA039rpI
         PUy+qGYl8Y5Tux1BVRMGdmrYut+dND02DevjQXcljK51w7GLTftK03qWA8fBLKYSPaV0
         ux58X+9UtfqvnYhD6WYOLSemKZPHB5EU4i1+zLQb8ldtgcTmZ23ltu7J82bcA2pXQ+n1
         zHGQ==
X-Forwarded-Encrypted: i=1; AKwUvBxHtwLUMraUJkZ//YZzY9SdNHioi91FwAPhpmo73C8UCqxQROcuPlgpNKpElRhpYMiwuB9IUNK0q49d5g4=@vger.kernel.org
X-Gm-Message-State: AFuF++n+wTbmUHebU9UuVCCq6/DSzzTEVpuhWlK383x/HvIvF6TBEHPC
	O8SXGkMAHcPROIPNGIuls2mbgw5iYnhAubKUd5IittQ2Mmi6CWoCANnY
X-Gm-Gg: AYBFou3rHLDYuaaDdLt6EdPjskEVFGCQ/00hkTu4ywkeoC/ZxTRh9Soco7Aggv4vBkb
	LCsKfD6f11Yo+VQCh4Hr5OnlAksXJ+z0dWuDyp7rdVmx0ysR7C3+qn8Ao7IODe81xBlXsfvAZ6v
	VY75zMd1uRWv+dt3BB04JV/Hfjamq/weUNSChivD8exkd7OKQlu7M1WiHiJxXnfn9Rm+oZlM5md
	5bND51mQwLJGwf/Q+TEIXTAoTeckSprAsKT3K5qfV71VtR4yDd++hbpzyLcenC+bbAqrqOw37CM
	NUMmJ6cMJDKInrKIX0q+KKiGPYyOyRadgzSIPmRoZXIwWbx9tymfUcd8t8waf1SaQJ15ADu6rpu
	O83+cD110PT421K7lKI/8A5C6i6j+PERnwn1qTw50/dXTr6ji8yYylCAhzkRc4RQInfUIsmKSLy
	WvZCESjgKY+pmskJHY+1clM5K2PSw7q8k4jOTzRvMM6CqAtPgHgM2p1+aR4jabEZxiODc5Yb9C0
	8heS7LNL1XF+vU882eOhaeLA9MVp6SD4OaKOgi8984C9zZCmv/KpUbCGTfb64KgaAalAisDp8Yl
	t8aKtGfGmg==
X-Received: by 2002:a05:6a00:3982:b0:878:3811:237 with SMTP id d2e1a72fcca58-87838110992mr2854371b3a.51.1789857278259;
        Sat, 19 Sep 2026 15:34:38 -0700 (PDT)
Received: from phui-2.c.googlers.com.com (78.123.83.34.bc.googleusercontent.com. [34.83.123.78])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-877a94f4a10sm1362241b3a.22.2026.09.19.15.34.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 15:34:37 -0700 (PDT)
From: Hui Peng <benquike@gmail.com>
To: alex.aring@gmail.com,
	stefan@datenfreihafen.org,
	miquel.raynal@bootlin.com,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com
Cc: linux-wpan@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ieee802154: cc2520, mcr20a: reject invalid RX frame lengths from SPI FIFO
Date: Sat, 19 Sep 2026 22:34:37 +0000
Message-ID: <20260919223437.3883127-1-benquike@gmail.com>
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In drivers/net/ieee802154/cc2520.c and drivers/net/ieee802154/mcr20a.c,
validate the RX frame length byte read from the radio FIFO before
subtracting the 2-byte FCS or allocating/trimming the skb so len < 2
cannot underflow.

Fixes: 0da6bc8cc341 ("ieee802154: cc2520: adds driver for TI CC2520 radio")
Assisted-by: LLM
Signed-off-by: Hui Peng <benquike@gmail.com>
---
diff --git a/drivers/net/ieee802154/cc2520.c b/drivers/net/ieee802154/cc2520.c
index abfcfe07246a..d2c8484d8fea 100644
--- a/drivers/net/ieee802154/cc2520.c
+++ b/drivers/net/ieee802154/cc2520.c
@@ -482,8 +482,14 @@ cc2520_tx(struct ieee802154_hw *hw, struct sk_buff *skb)
 	 * values on RX. This means we need to manually add the CRC on TX.
 	 */
 	if (priv->promiscuous) {
-		u16 crc = crc_ccitt(0, skb->data, skb->len);
+		u16 crc;
 
+		if (skb_tailroom(skb) < 2 &&
+		    pskb_expand_head(skb, 0, 2, GFP_KERNEL)) {
+			rc = -ENOMEM;
+			goto err_tx;
+		}
+		crc = crc_ccitt(0, skb->data, skb->len);
 		put_unaligned_le16(crc, skb_put(skb, 2));
 		pkt_len = skb->len;
 	} else {
@@ -1147,8 +1153,8 @@ static int cc2520_probe(struct spi_device *spi)
 	return 0;
 
 err_hw_init:
-	mutex_destroy(&priv->buffer_mutex);
 	flush_work(&priv->fifop_irqwork);
+	mutex_destroy(&priv->buffer_mutex);
 	return ret;
 }
 
diff --git a/drivers/net/ieee802154/mcr20a.c b/drivers/net/ieee802154/mcr20a.c
index 020d392a98b6..d7e076397550 100644
--- a/drivers/net/ieee802154/mcr20a.c
+++ b/drivers/net/ieee802154/mcr20a.c
@@ -790,7 +790,8 @@ mcr20a_handle_rx_read_buf_complete(void *context)
 
 	if (!ieee802154_is_valid_psdu_len(len)) {
 		dev_vdbg(&lp->spi->dev, "corrupted frame received\n");
-		len = IEEE802154_MTU;
+		mcr20a_request_rx(lp);
+		return;
 	}
 
 	len = len - 2;  /* get rid of frame check field */
@@ -866,8 +867,7 @@ mcr20a_handle_tx(struct mcr20a_local *lp)
 	/* add 2 bytes of FCS */
 	lp->tx_len[0]		= lp->tx_skb->len + 2;
 	lp->tx_xfer_buf.tx_buf	= lp->tx_skb->data;
-	/* add 1 byte psduLength */
-	lp->tx_xfer_buf.len	= lp->tx_skb->len + 1;
+	lp->tx_xfer_buf.len	= lp->tx_skb->len;
 
 	ret = spi_async(lp->spi, &lp->tx_buf_msg);
 	if (ret) {
