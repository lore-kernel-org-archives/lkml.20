Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com [209.85.167.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D209490BF6
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 19:46:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792266387; cv=none; b=RwoK8+HumLWvUcLcXHmxy6Ia0U/yIOYzwd7vG8W88wRK+cK8ibadlE8ZKQ6TxNTaqkfh+Ymq3ZC4YrUD9MwKiiXsC20b4o1+e2lBMYqy/Y5vIdANZkvnMAmpyr7CGLpOFJCvB4mPkIZhC1UQrrocSezKIsj+cAFM/Y2g5B7QGik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792266387; c=relaxed/simple;
	bh=ONUCfWg8eM4/OtI3jBJJ3OP+uv5/g7o8HsUMHh6rAVg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=R6A3f/A8u0fLqW20ml9AJOd0az2fNtDNC2h2KCnrZ8/u9En9EZnEjV2lz/TnCzX+D6U9noDHZr9fzbXDJnFC8MTClWLuu6s96M1uBNGGJqnH9pqbn2XAniX8r7PLx+4vZoVuEOi1D3mVqdqpKiS4Vvtdhxg2ZJtjjje9YME3Jtk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MFhIkSyp; arc=none smtp.client-ip=209.85.167.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MFhIkSyp"
Received: by mail-oi1-f175.google.com with SMTP id 5614622812f47-4f699fe49b3so728243b6e.3
        for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 12:46:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792266380; x=1792871180; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=S+Qvi+dU4vtXa5pndLAyH0EZ9I1y6W0niIp108EHDPk=;
        b=MFhIkSypkwW5vfGSYGnUwbUNor9abFnK1QMNqpYhlZIiZooKqdNvAO8P3aAdNHm2X6
         AO5/ogLd7Qd5Ii17OSiG6Tdpg+4KXMmBJQhB3sHaybZ0A0i1CcivdBuI6hDG0+39U2mi
         fXNp7L3cTTeByDQw1AcTNaQQiOjPKZC6q6SGaIVaI+/D9V5rTHLV8YDPSGq8zfFQGvIO
         Q+kX8R68dkcKDhgR/gTJnH2iFkN8+BabP1p/XAmkdBTFZNpuEGylClOia+0EyF0WkOYg
         ahicPfWgu821sHbL4D5s8EyMqq8rswYIjzEEN8UnzJROzo2sJ8heunxPwHnyoiGBv3ko
         ZqYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792266380; x=1792871180;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=S+Qvi+dU4vtXa5pndLAyH0EZ9I1y6W0niIp108EHDPk=;
        b=dPCnh1VNjPOHsQkHZbYXfnVdvNIb7OadsJk3/kLRhtplecae1GurgkGOyDXFo3VTCy
         3dA9gNp6f5D7s3G4tsxW6Ri51UmilztGpvyD9RwUC1IrEOuH8j0G4mZedMVLRk7UJ0xF
         lUDVS9WeVqQqwta6/kjkD3XPu2CuGoOR3ZsbaruvROPKnMVtj5uafods5f58CbXzPJIY
         zgkDUveYjBBZmSsuSL+Q5lqBXmV1c0/3lkX3gQN2/GMgx9OApLcEDUTKtVkHbjnsAXYW
         yOhU9Tbne5IEBRoJC+4cLof7CYF051Q2eeQO6OmFMANeIGcCzLPKonLa6tucM1rxvgKC
         2lJg==
X-Forwarded-Encrypted: i=1; AKwUvBxgbto274S0RvTVA3KRIGM/uaqYaV7tizJD/slzZXSRw/8T+Ctq5+CF1sduloj2XJ+hvd8pRjgsELE0oP0=@vger.kernel.org
X-Gm-Message-State: AFq9FYJSw//11opuQbLtQtuFD8Fi48YPeFraZ47Hnlik9eSZjTVDbqEY
	AnkJ3htTlg5ZyTDDEYeHRu34ygLPSuSRw7954Qt9BZ911UOl/yDNoYxo
X-Gm-Gg: AYBFou0rCxDQD1BsHR5XjwIHQjGWf2cUGOEP6G75cseU9b8ps0ruuzp832bj+yVjehp
	lgRtjG4V1yEL2bd3QRGklFNXj8neYpomuK7zNZVWfg9xQE/jjwhekJYCeLGiWSrj7ZFzv4WkKKC
	2qZ2XR5efHxuMQAbj/9ymA/NkkOvO7P5tOxxTna+jU1QD3HfgHNb4FMoNBeeuneJ+t4kY/8ukmo
	U+J7YaeJQUDyDoQZo6WnUsMIcNyjKIybZ07YUKmI89mpAD4Uw1N1Bz0FFbdxEO+PowSPPeHjLEP
	nKWfwjLdGHeRbWCN6rgdkJ0PoOXnuNQmw+uOc7EqccUdif4lSXCgf/mM2XD1RQHEzoGcIBOn5Mz
	5MI/0BTgKJCjJfrDriqXB/cMUDoJRYwuEP9QppRO9j5vmERwgCvUoqkGLaGalkqs/kTQff8KbZG
	6r0eKZG13AhKwFsdmF+5GDqGIXxWJUHmcB1gEsoxf/gBDz4kmIFer2RX1MXDQANXJySZldw403N
	dMIgNyFcpL4oXXkLTZ3Y8uEXd27ooRSb39Qqv/EC7W8NU+RsWeShFY5CK+LyP4XiBXU3Fy5u5ED
	eW/RCRl8m1g07POjOT6Yeuc/ZWnb9TVmiEJVhqc1lJsS2RZ5ZtE8DG2jQU1IjrvK/Lv7y96Yq0r
	c4M0wmNs9fLvLxs3JavtO8A==
X-Received: by 2002:a05:6808:4f28:b0:4f3:e98f:fa26 with SMTP id 5614622812f47-53cd1cb5c49mr3420662b6e.58.1792266379933;
        Sat, 17 Oct 2026 12:46:19 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-5388dd8b5a2sm4025321b6e.12.2026.10.17.12.46.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 12:46:19 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 17 Oct 2026 13:46:00 -0600
Subject: [PATCH v9 05/18] mtd: rawnand: sunxi: drain interrupts before
 reusing the completion
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261017-submit-sunxi-nand-vendor-oob-layout-v1-v9-5-b624c09e3ee5@gmail.com>
References: <20261017-submit-sunxi-nand-vendor-oob-layout-v1-v9-0-b624c09e3ee5@gmail.com>
In-Reply-To: <20261017-submit-sunxi-nand-vendor-oob-layout-v1-v9-0-b624c09e3ee5@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
 Clark Williams <clrkwllms@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>, 
 Richard Genoud <richard.genoud@bootlin.com>, 
 Boris Brezillon <bbrezillon@kernel.org>, 
 Masahiro Yamada <yamada.masahiro@socionext.com>, 
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-rt-devel@lists.linux.dev, 
 devicetree@vger.kernel.org, James Hilliard <james.hilliard1@gmail.com>, 
 Sashiko <sashiko-bot@kernel.org>
X-Mailer: b4 0.15.2

The controller uses one completion for successive interrupt-driven
waits. Some transfers wait for both command completion and DMA
completion. The handler acknowledges each event and masks it, leaving
any outstanding event enabled; it calls complete() when all requested
events have arrived.

sunxi_nfc_interrupt() currently calls complete() before updating those
registers. A successful waiter can wake on another CPU and start the
next operation before the old handler acknowledges status or rewrites
the mask. Move complete() after those updates so waking the waiter
cannot precede the handler's last controller access.

A timeout also needs to exclude an unfinished handler. With PREEMPT_RT,
the flags-zero IRQ request is forced threaded. Near the timeout
boundary, that thread can be preempted after reading status and enable
bits while the waiter times out, clears the device mask and rearms the
next wait. The saved snapshot can then restore an obsolete
remaining-event mask or, if it satisfies the old wait, complete the new
wait. Masking the device does not invalidate the running handler's local
values. Repeating init_completion() can also reset its waitqueue lock
during complete(). This lifetime problem was identified by code
inspection during review.

Initialize the completion once in probe and use reinit_completion() for
each wait. On timeout, call disable_irq() before clearing controller
state so existing handling finishes and no new handler can enter during
cleanup.

The hardware may have finished before the delayed handler runs, or the
handler may complete the wait while disable_irq() drains it. Recheck
status against the remaining enabled events before clearing either
register. Events already acknowledged by the handler no longer appear
in that mask; if none remain, the wait has completed. This also handles
command and DMA events arriving separately without requiring an
already acknowledged status bit to be set again.

Then mask and acknowledge the events, read back the mask to flush those
writes, and re-enable the IRQ line even if the recheck changed the
timeout to success. Keep partial-event handling in the IRQ handler and
leave polling and controller/DMA abort handling unchanged.

This keeps additional synchronization on the timeout path, without a
driver lock in every interrupt and wait. The caller can sleep, this IRQ
is not registered as shared, and the handler does not acquire the
controller mutex held by the caller. The tradeoff is unbounded cleanup
latency and no priority inheritance: a starved IRQ thread can prevent
timeout cleanup from returning and block other operations on the
controller. This is a handler-lifetime boundary, not an RT
recovery-latency guarantee.

Fixes: 1fef62c1423b ("mtd: nand: add sunxi NAND flash controller support")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/r/20260909085434.C8F201F00A3A@smtp.kernel.org
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 38 +++++++++++++++++++++++++++++++-------
 1 file changed, 31 insertions(+), 7 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index 29715d179d22..5b736a4a7fe9 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -401,6 +401,7 @@ struct sunxi_nfc_caps {
  * @chips: a list containing all the NAND chips attached to this NAND
  *	   controller
  * @complete: a completion object used to wait for NAND controller events
+ * @irq: NAND controller interrupt
  * @dmac: the DMA channel attached to the NAND controller
  * @use_mdma: use an internal MBUS DMA backend
  * @mdma_desc: H6-style MBUS DMA descriptor
@@ -420,6 +421,7 @@ struct sunxi_nfc {
 	unsigned long clk_rate;
 	struct list_head chips;
 	struct completion complete;
+	int irq;
 	struct dma_chan *dmac;
 	bool use_mdma;
 	struct sunxi_nfc_mdma_desc *mdma_desc;
@@ -441,18 +443,20 @@ static irqreturn_t sunxi_nfc_interrupt(int irq, void *dev_id)
 	if (!(ien & st))
 		return IRQ_NONE;
 
-	if ((ien & st) == ien)
-		complete(&nfc->complete);
-
+	/* Finish updating the interrupt state before waking the next operation. */
 	writel(st & NFC_INT_MASK, nfc->regs + NFC_REG_ST);
 	writel(~st & ien & NFC_INT_MASK, nfc->regs + NFC_REG_INT);
 
+	if ((ien & st) == ien)
+		complete(&nfc->complete);
+
 	return IRQ_HANDLED;
 }
 
 static int sunxi_nfc_wait_events(struct sunxi_nfc *nfc, u32 events,
 				 bool use_polling, unsigned int timeout_ms)
 {
+	bool irq_disabled = false;
 	int ret;
 
 	if (events & ~NFC_INT_MASK)
@@ -462,16 +466,28 @@ static int sunxi_nfc_wait_events(struct sunxi_nfc *nfc, u32 events,
 		timeout_ms = NFC_DEFAULT_TIMEOUT_MS;
 
 	if (!use_polling) {
-		init_completion(&nfc->complete);
+		reinit_completion(&nfc->complete);
 
 		writel(events, nfc->regs + NFC_REG_INT);
 
 		ret = wait_for_completion_timeout(&nfc->complete,
 						msecs_to_jiffies(timeout_ms));
-		if (!ret)
-			ret = -ETIMEDOUT;
-		else
+		if (!ret) {
+			u32 pending, status;
+
+			/* Drain the handler before it can restore an old IRQ mask. */
+			disable_irq(nfc->irq);
+			irq_disabled = true;
+			/*
+			 * The handler removes acknowledged events from the mask.
+			 * An empty mask means all requested events were acknowledged.
+			 */
+			pending = readl(nfc->regs + NFC_REG_INT) & events;
+			status = readl(nfc->regs + NFC_REG_ST);
+			ret = (status & pending) == pending ? 0 : -ETIMEDOUT;
+		} else {
 			ret = 0;
+		}
 
 		writel(0, nfc->regs + NFC_REG_INT);
 	} else {
@@ -484,6 +500,12 @@ static int sunxi_nfc_wait_events(struct sunxi_nfc *nfc, u32 events,
 
 	writel(events & NFC_INT_MASK, nfc->regs + NFC_REG_ST);
 
+	if (irq_disabled) {
+		/* Flush the mask and acknowledgment before re-enabling the IRQ. */
+		readl(nfc->regs + NFC_REG_INT);
+		enable_irq(nfc->irq);
+	}
+
 	if (ret)
 		dev_err(nfc->dev, "wait interrupt timedout\n");
 
@@ -2664,6 +2686,7 @@ static int sunxi_nfc_probe(struct platform_device *pdev)
 	nfc->dev = dev;
 	nand_controller_init(&nfc->controller);
 	INIT_LIST_HEAD(&nfc->chips);
+	init_completion(&nfc->complete);
 
 	nfc->regs = devm_platform_get_and_ioremap_resource(pdev, 0, &r);
 	if (IS_ERR(nfc->regs))
@@ -2672,6 +2695,7 @@ static int sunxi_nfc_probe(struct platform_device *pdev)
 	irq = platform_get_irq(pdev, 0);
 	if (irq < 0)
 		return irq;
+	nfc->irq = irq;
 
 	nfc->caps = of_device_get_match_data(dev);
 	if (!nfc->caps)

-- 
2.53.0

