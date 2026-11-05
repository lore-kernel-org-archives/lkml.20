Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793904945;
	b=u6NV0J/Ki/2ec/pkHXwHHj2lIniDjOoZMovNJ+kchQfQ2FmbRgnTtRkzn0rqXuPEBOSq
	 aJoSItfqX8ZT1S9RFCwfstzcIEHIKqhgZ2756kLu0CnXFck40Pwg0umFlGK1hAEshtJCN
	 O+27K9nS7JMBMPltRH5lprtIw0t/1fA6GAruRWNsLtQibU0UDR71nqywaGxVS1TO06ijd
	 C0IoSSJjvPGEF7I2KSZYz3eWSuZDTTNNlHyvU6O0ZdJY98wY2R+WASkQ9jKXGx6kK9K7N
	 g2M2mrAf05xgtdc0WvxtPAMR9OTqz/IOzr0ttsiWaPAs6qJHDFTiUbpQUfsNdozgRbA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793904945;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=nG4n6RbhRtbsAmKm5luV95OTsd5m2vOsTQEC1Oq46ng=;
	b=y8NmkpyxJS8jawt1a/PycGS8nlGb8yvFxUA7A2/AnWgurLP9gEr9EKUV+HPNXVyQPTO9
	 tEuBifSjL4XUDO4woNYJEHpCq9U0OC5MqNRKvZQCUST4/ywl1GDBL+jr5RtyoUZ/oHuqI
	 U5tycGqZOlwC3XfDaawe+AjHhIsZnfKsSDdrJfbHpdarPjZl8pDu2CAExTXDtT4QAuPqt
	 00IbX33NFl4eVxeDy6wLiJPDwGer7k8zexEJ4S3Gp9vqW9IdyiWTDxkCO47o7gRPI6URp
	 TW3btW9MVOIMIsqHniv7u6oCukFCcqWROpN9bASv/OulWJ+Kw3eHs4owTTcDOttozXQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dg1er8r7;
	arc=none smtp.remote-ip=209.85.161.41
Received: from mail-oo1-f41.google.com (mail-oo1-f41.google.com [209.85.161.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12DA1606A33F
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 18:55:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 12DA1606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dg1er8r7
Received: by mail-oo1-f41.google.com with SMTP id 006d021491bc7-6de1fd5f572so1017544eaf.3
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 10:55:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793904944; x=1794509744; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nG4n6RbhRtbsAmKm5luV95OTsd5m2vOsTQEC1Oq46ng=;
        b=dg1er8r7N2ztSQE5zHQF5T+hSZg888y0y0Icn50SABwYdEO0z4Qij/TekP5w4C1wzA
         aiVzLhWdmScW9iDKRRAEX+qUsafr48Od5GxjP7QH22p1xDwSR31Nltwm54uS0m/901ib
         iDd4efD2esOOH+Kq4qt9ymWNkQPnvFPNmD2hSDvqKs8e4CK60Ho9KexL1WKmUKy5Kq8f
         KGOJJ3ae2EGGfXAdGXnELSBFqZO+wC6dsOsEAM4i1KxEBK9sKN4w32kNfkgzTptBpyrj
         8WkgKhHjS2d0PJ8E98KnBajFeYGhHB+wCJcWVrlN+GvwQhatb+M2pCGbhd9CJl57V7jW
         NPNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793904944; x=1794509744;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nG4n6RbhRtbsAmKm5luV95OTsd5m2vOsTQEC1Oq46ng=;
        b=Iw9jy6GOBwYUHkfebKnSrGvjR6grsc2NvUBqJ0pJgaud10kwLPzsXqMeLsdnu5JKGQ
         zxYfc5F1g3B4GrpIkWWd74S4S3Y0WCkEPlNCQqJvuukRfTCgsErUXrkC7Q7aCUmneZkH
         Cr3Z0iGMa4ZOk/Axn9mZ3k/PqlPUVxuO3fY6r7LjdkVNWXt3NDgxwSJ70P7vTCG6WX1l
         IoytBO6RQcOoVyb6ORwGiXF6OKbI077DbCK5+EPYznXUBi7NiyzNBwBTz3Kya7ZoxWoo
         EpXXeBx+F2kJzSvn3kMlzZcXgoFm2yfTGt06YCMQpsptlBwwTL3cmoN2hNmE3inFVw/W
         qPIw==
X-Forwarded-Encrypted: i=1; AKwUvBy3NkZ3+w4Cac5CtEhfGSWrwv+7rgULrozBI2qs6/HMyKDNA1nhKqjzn7WY7jJ9yS6e67d+VMGbn7p5wBY=@vger.kernel.org
X-Gm-Message-State: APuU4Z9zI7cGtZWtVZ9Ll/eXNfnnkC5WxN2dEC1F+2NcN/dro14PFqKs
	qKVPRLMqIXcRDRaFXAdo62qZePpnnjKu8LFnMoeByNRxWuBxMqRgeI+Q
X-Gm-Gg: AYBFou1Pbyq9vvAhauz39+lTGpnN3YLO7jm2V0ZPwuil1D9XHDo7pTv8fwhR2JaCKxB
	6lQ3Eg7gIHYtW6Wlb74/6hLwW2Uj1Es16nQqgMkcr2WU7lIKNe3/KxgJVfGGeoBvM7zlJU5pFbd
	Yd+L/nVvOjcOvVzGm83IPfYFBaXtdgHI0Je08/ITDy602sZAEdYT/5q3znWHxmxXU9dOWVLHiHv
	pEJR09Ito3oJpK98n/UDz1HUS1QwoFx0/FTTMRorsBXAAKsb5tFjfdHXNEtZ/z6Hs1k1N9w2Ywq
	voD8DKoaRqkcfROyYPd4TasJoSmpXuXLQgTIduWKK4PaZDCgtq7rB3gdmbwg0SSfIxYWtjjE2AC
	5Wm9zOv2sJxlI1CV91H8wJ7fZr7kYhafdUxtvotM2qp/7NN5Si6YnXDt9XmPlLLA6G3L37G/kbG
	V8G1kPveKkAq6S5LOxyxUMpFuMFEBGNIOhMvJqyXSx8+beSA+dWEDh8PaCL8IittBxO2kx3+YUD
	OGwjkCKwS1J+DHDz0Oswzn5JPHgRBTa0iHwMsmpQDUFviWCP8RdeSxUBdUjZQc81HJENmqeqi3F
	cnUFn0jZhMYTVwf5iLblG/ul5N4+g1bv36J/e4S5i99OKtXAvH1J5xJq/aRgBLkZCkf/SfaeRU8
	LuJS8uIZP0ML5pifkLJNNvbfbvtUJALe0LAm+TYfNXDHx8Ttne1WndCbDDgI5lvhZnCOniDYSsw
	FsMc8xTYZkJk2okG/Gn9LieCpc/uMxg0rW02XzNSKer1MoqntgC/Sd
X-Received: by 2002:a05:6820:1c8b:b0:712:c751:22eb with SMTP id 006d021491bc7-716e73dea8fmr352195eaf.11.1793904943944;
        Thu, 05 Nov 2026 10:55:43 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-716e99465dbsm115897eaf.0.2026.11.05.10.55.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 10:55:42 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 05 Nov 2026 11:55:23 -0700
Subject: [PATCH v10 07/26] mtd: rawnand: sunxi: drain interrupts before
 reusing the completion
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261105-submit-sunxi-nand-vendor-oob-layout-v1-v10-7-dca1f6ed29a8@gmail.com>
References: <20261105-submit-sunxi-nand-vendor-oob-layout-v1-v10-0-dca1f6ed29a8@gmail.com>
In-Reply-To: <20261105-submit-sunxi-nand-vendor-oob-layout-v1-v10-0-dca1f6ed29a8@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
 Clark Williams <clrkwllms@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 James Hilliard <james.hilliard1@gmail.com>
Cc: Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>, 
 Richard Genoud <richard.genoud@bootlin.com>, 
 Boris Brezillon <bbrezillon@kernel.org>, 
 Masahiro Yamada <yamada.masahiro@socionext.com>, 
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-rt-devel@lists.linux.dev, 
 devicetree@vger.kernel.org, Sashiko <sashiko-bot@kernel.org>
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
Reviewed-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 38 +++++++++++++++++++++++++++++++-------
 1 file changed, 31 insertions(+), 7 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index 9a7b365e998e..111094b1c64c 100644
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
 
@@ -2657,6 +2679,7 @@ static int sunxi_nfc_probe(struct platform_device *pdev)
 	nfc->dev = dev;
 	nand_controller_init(&nfc->controller);
 	INIT_LIST_HEAD(&nfc->chips);
+	init_completion(&nfc->complete);
 
 	nfc->regs = devm_platform_get_and_ioremap_resource(pdev, 0, &r);
 	if (IS_ERR(nfc->regs))
@@ -2665,6 +2688,7 @@ static int sunxi_nfc_probe(struct platform_device *pdev)
 	irq = platform_get_irq(pdev, 0);
 	if (irq < 0)
 		return irq;
+	nfc->irq = irq;
 
 	nfc->caps = of_device_get_match_data(dev);
 	if (!nfc->caps)

-- 
2.53.0

