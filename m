Received: from mail-oo1-f53.google.com (mail-oo1-f53.google.com [209.85.161.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D280B33C198
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 01:34:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792028060; cv=none; b=ZDQ8BePjTW3GYhaMFscdhRrWsNcrbwAod8G7B0loXZ3bkoBkAbXDNOy3n1YP0CD5SGVUMFwL6/w6/6Il9Gk7Tqv0vv8fbMjiWgcpgZ4rmea8sTYn39X3jB3EjHTFRIWVAHqzm/u1FjgHpVup+XTueAe6XdSfFSGB1T0Gj8fW40E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792028060; c=relaxed/simple;
	bh=eu782ZILQEt1gvhW41qEkk/lHnvXY0oqpsX4MnquLe0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TUumAbyCYGUHKridEbajkWaorgYpwVa90MOxcacd8X3RpzOaOA3Q0fAyHU8U2rolNcA2OQjz3duCxfkpqqnn7TXVWmyJzYZx2e7a5xtnbyVjD7n6hAQdteTmslgPudIZ38/7quYQ8U5s/VQqKNo6RJVNJ8iEJtB3QAVAfiHySjc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UP/XaoVJ; arc=none smtp.client-ip=209.85.161.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UP/XaoVJ"
Received: by mail-oo1-f53.google.com with SMTP id 006d021491bc7-6c8f6a53fabso5890260eaf.1
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 18:34:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792028058; x=1792632858; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UnbuymXcTtfKlGuvgEcxzPNrCMdjSx6DCt9Jhk4Q3PI=;
        b=UP/XaoVJopd15WZYxZ9sAYIrrctInI+M0k6cCzyfgonGe2IIHBqQk29MK6ZBWqVQq4
         LTTaY8DaIX7XziJbiOPPaX6CnsgrmmSw/emq9uoxjVAtiyfOjHJwxGiWcZZaI4sJi3fW
         PEA9GgiYrdy0Y715b9a04+QJ/+k5AGHgUsXs+NrRdsdgDIMKTp1wJ3tjXC7ebKH97ZQF
         6GegtIaNphPHNpn27ADjHWIwLqwC+o39TK6goaVpYjB2mEoLAwc+H8VSXN1dkEJq7+EV
         3lVe+DLC2fY5f6jFAFaJM3EImFKitGOlPpm3LNV+wK+LhpFYGObtlHvHLfOCK7A/FLtI
         BQWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792028058; x=1792632858;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UnbuymXcTtfKlGuvgEcxzPNrCMdjSx6DCt9Jhk4Q3PI=;
        b=Gs7HDYcYD2lgtpKbmzQ6GO0ZI9RJJAmsGdvhdCZyfcOki8RfWM9B29vNucNx5smEoq
         b7YYT2bRYdv8MTVUddRWbPW6YL7oyVcMNk2wH+OBiyhhGVUo3F4MyMtQf0EuvPW7R9KP
         +Zl/owV3+ZLuQpmddvSV/1fkFfCXSqin8J7lLiEFkAr6NraiWlwRhw5pnP5tLw/t3zxn
         y9Use1iH/cFRqv/mYVb7c2Bg7kFL1mTDa3rHwBfejdz5v7cXWCqxgB/vvxrIrOEY+pR7
         ikqiNYmYY6RyElZxMQKOvT8/QT2O9JxENkFhTHYPlw3Z7yGoK+kiT79DvWKOtdZkuxJA
         k3rQ==
X-Forwarded-Encrypted: i=1; AKwUvBz5KpIDqm6eizLnCSGhVWuveDH28gdWTS7WfMnDI7PkM6MiXUlgjBhxU8H5Ts+VYO+RFCJrlDiwELHmHMQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYJuiGvSpBGYwyQ6vD7SyuSMGIbtUriok5kg+3Dg9mqWcuP1AsIL
	kvBF5zYhAv78Ho5zsnV5hWcBXgjYi9sCFaqkjxv2VRAxP9Q8e2xpHupBruLQXV4l
X-Gm-Gg: AYBFou1+FlMegaS66YzCkcleqeFW9vsRu5KTzAF69eFJmnEnNvs8GVYh5VCcWPVEpOE
	nr6hqzZoXrCfYu2trk0595bt/tETafJxPPP6kis0Xu494LlKLLevObp5v4Cwp3Dt6anDAmJsYKp
	wD1ohrAAIAnJYjmCkiJtFi2p9JBiLNrUH+OICbEN0ej+NKY+DAbwWE6OTt5a00CW0/UyukhFJs0
	pKVxXMqzTc8exwWjxXUKvCM/FYYGpw0s6McQ557fEpJWYoi+T4FGjMGKWi8wZqGoQmCLVS7Gn/F
	fJaqNUnHj5PT/ezQL19P1kO7INaRqotrbokrBcYnxo2HqvMfgOyhv1/364uYeRlnSx0mLb0MjvG
	EgOn3yxGo8uS/v82kZFT5bd5otQ+gA4b3OI3EJV77zIE19GGj96UKVvLBgKDda07pBsUdjBgfaG
	UiFqFQrJNLgaLu5PlcK+FeFmOP1cXFFBy8IVtmCJtid/ZeGXdTUXBpkPmqCnJu8+NVbrSUdTp49
	7FuHGmN4VP9S3YS+s/9R4KYKqkEcxLi/SgIAGlG8NZU2jLgGsNN8dFrNl8GvXXigJZWRDn+enSt
	nWtdvaF1QGGxEWQmrm2rm+JsffCJrf2ePW54ckBTnAOvrlr2dnubUZgSqrhYVp3Krupp+8jHjd/
	9styqayzEipDlP5PPa5Ld
X-Received: by 2002:a05:6820:5056:b0:6f5:a844:b12 with SMTP id 006d021491bc7-6f5a84410admr7628975eaf.57.1792028057776;
        Wed, 14 Oct 2026 18:34:17 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4a6dfb41452sm3428139fac.4.2026.10.14.18.34.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 18:34:17 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 14 Oct 2026 19:33:51 -0600
Subject: [PATCH v7 04/16] mtd: rawnand: sunxi: drain interrupts before
 reusing the completion
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261014-submit-sunxi-nand-vendor-oob-layout-v1-v7-4-5d3fc6ad2da1@gmail.com>
References: <20261014-submit-sunxi-nand-vendor-oob-layout-v1-v7-0-5d3fc6ad2da1@gmail.com>
In-Reply-To: <20261014-submit-sunxi-nand-vendor-oob-layout-v1-v7-0-5d3fc6ad2da1@gmail.com>
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
 devicetree@vger.kernel.org, James Hilliard <james.hilliard1@gmail.com>
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
cleanup. Then mask and acknowledge the events, read back the mask to
flush those writes, and re-enable the IRQ line. Keep partial-event
handling in the IRQ handler and leave polling and controller/DMA abort
handling unchanged.

This keeps additional synchronization on the timeout path, without a
driver lock in every interrupt and wait. The caller can sleep, this IRQ
is not registered as shared, and the handler does not acquire the
controller mutex held by the caller. The tradeoff is unbounded cleanup
latency and no priority inheritance: a starved IRQ thread can prevent
timeout cleanup from returning and block other operations on the
controller. This is a handler-lifetime boundary, not an RT
recovery-latency guarantee.

Fixes: 1fef62c1423b ("mtd: nand: add sunxi NAND flash controller support")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 26 ++++++++++++++++++++------
 1 file changed, 20 insertions(+), 6 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index 6c0d3e2d2be2..bc38330c0e36 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -393,6 +393,7 @@ struct sunxi_nfc_caps {
  * @chips: a list containing all the NAND chips attached to this NAND
  *	   controller
  * @complete: a completion object used to wait for NAND controller events
+ * @irq: NAND controller interrupt
  * @dmac: the DMA channel attached to the NAND controller
  * @use_mdma: use an internal MBUS DMA backend
  * @mdma_desc: H6-style MBUS DMA descriptor
@@ -412,6 +413,7 @@ struct sunxi_nfc {
 	unsigned long clk_rate;
 	struct list_head chips;
 	struct completion complete;
+	int irq;
 	struct dma_chan *dmac;
 	bool use_mdma;
 	struct sunxi_nfc_mdma_desc *mdma_desc;
@@ -433,12 +435,13 @@ static irqreturn_t sunxi_nfc_interrupt(int irq, void *dev_id)
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
 
@@ -454,16 +457,19 @@ static int sunxi_nfc_wait_events(struct sunxi_nfc *nfc, u32 events,
 		timeout_ms = NFC_DEFAULT_TIMEOUT_MS;
 
 	if (!use_polling) {
-		init_completion(&nfc->complete);
+		reinit_completion(&nfc->complete);
 
 		writel(events, nfc->regs + NFC_REG_INT);
 
 		ret = wait_for_completion_timeout(&nfc->complete,
 						msecs_to_jiffies(timeout_ms));
-		if (!ret)
+		if (!ret) {
+			/* Drain the handler before it can restore an old IRQ mask. */
+			disable_irq(nfc->irq);
 			ret = -ETIMEDOUT;
-		else
+		} else {
 			ret = 0;
+		}
 
 		writel(0, nfc->regs + NFC_REG_INT);
 	} else {
@@ -476,6 +482,12 @@ static int sunxi_nfc_wait_events(struct sunxi_nfc *nfc, u32 events,
 
 	writel(events & NFC_INT_MASK, nfc->regs + NFC_REG_ST);
 
+	if (!use_polling && ret) {
+		/* Flush the mask and acknowledgment before re-enabling the IRQ. */
+		readl(nfc->regs + NFC_REG_INT);
+		enable_irq(nfc->irq);
+	}
+
 	if (ret)
 		dev_err(nfc->dev, "wait interrupt timedout\n");
 
@@ -2650,6 +2662,7 @@ static int sunxi_nfc_probe(struct platform_device *pdev)
 	nfc->dev = dev;
 	nand_controller_init(&nfc->controller);
 	INIT_LIST_HEAD(&nfc->chips);
+	init_completion(&nfc->complete);
 
 	nfc->regs = devm_platform_get_and_ioremap_resource(pdev, 0, &r);
 	if (IS_ERR(nfc->regs))
@@ -2658,6 +2671,7 @@ static int sunxi_nfc_probe(struct platform_device *pdev)
 	irq = platform_get_irq(pdev, 0);
 	if (irq < 0)
 		return irq;
+	nfc->irq = irq;
 
 	nfc->caps = of_device_get_match_data(dev);
 	if (!nfc->caps)

-- 
2.53.0

