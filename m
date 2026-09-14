Received: from mail-oo2-f42.google.com (mail-oo2-f42.google.com [74.125.231.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8298226A0A7
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 03:01:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789354903; cv=none; b=ePY6gjOhHl3/ns3+iuQ8WyPEIqBRyzBOY7XtBikZdqBZd5uSXJopbNoKnu9TNIoQPGco0R1CGMLdUVYKiYsfCEmlAsZ2YsEj7b+ODK3ZkLQM6qL+farJVOLbZfVgBAvT+nYInmV/JxcKUXnmv5f4WgSQWmz6iWoV1B/HP7yOBA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789354903; c=relaxed/simple;
	bh=Lpu8BYiYZNteYXFlDSxlBr4C2CnU/Gx0SiTFgcn6nP0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pW+a8ljyTNdIh7y2bScqoH9kF347OddognNxWOEF18dixUbb7xWs5vMRs/FOnFgW6kW9lCDfggXTJDDA1dT2n0RFmXL5nvQHTv5BU3wq608jCJr0RMP7qAVDN/wX/6fVBQm6z0/Fh0ADKazR0ayVDE38kJWrucBBm2IlCu37W7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XboecROT; arc=none smtp.client-ip=74.125.231.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XboecROT"
Received: by mail-oo2-f42.google.com with SMTP id 46e09a7af769-7f4f0d298ccso453882a34.3
        for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 20:01:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789354898; x=1789959698; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EsI+dpw6vMR742jYDR1gddCVyVHs7LTF48bPd8UEx9g=;
        b=XboecROTiiF/twGa3ijeSfV3GI9qYzxHiizXpeYKaNNYEozshQN7YpoqR5QuZyHp9F
         qGjRb7Cm7TW/45XLJnHDpXnEJ6dSxml+ZFo0J/I9uQ4Sl1CcCuLMWho3zR2Nr4gexS5r
         ILu6960jwe1ayy+QyledRYw6OomzOGjE3ic/3nlNgHcjMkeKEvoAwV0A2A7dNmJpFsOk
         14QyoLMQwEfJ7pMYl363Wm+j+FITaeQF/jXNESG8H4Nuqo69HV/Q0sV2NtsZUotLTI+L
         chFPWHoDlN2JdgQY+RUjlrQMCAp7FFTYufJGeo9FmYtoDW4pnO2TUQV+jYgutLiHqJQf
         X//w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789354898; x=1789959698;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EsI+dpw6vMR742jYDR1gddCVyVHs7LTF48bPd8UEx9g=;
        b=a9WgkTQsA6j30wYpDFs8OdbhM7NV4fJ2cDaTmDvwgHA8cU4a0MZuOjXYeLyZwdTFuY
         hKhVLZVEoshUfai9jo2ODbtSBtiGUsVkbkYtZz/bKQnEMesbQ6rjuzDwXNRaP3pzPQRm
         aZF6I0gZe8nj9Hzt7ro2mMOQ3yAl9x6zjbiVrjh6ztJXk1JnqzUPukUc0HmIwiJ70wB4
         RbUHD6YWWHmyWtofwyGIALqg4qFrsZVI0TpSKXnaLMnqUV5VeexFxJ/pRJAlPsUI56fM
         M9RIldIyC59cMvcUwmzI0EmNFmKcMaDPiWYUWyIisN/NySV0KokjHW28jst8cEFRD/0J
         4yKQ==
X-Forwarded-Encrypted: i=1; AKwUvBxTLwkvKyGLwLDzE5yPa6/ypzqDV+6HJuQpOhqp/pUum/9umn3VEpJXf3Zrgb0oIlZZ58HsFvBdmONTyto=@vger.kernel.org
X-Gm-Message-State: AFuF++miSNBvi6oC2l5xGqkJurvAZ5aUJNFAZf3Rp01QHzc3EPu/zHj3
	1GpgVxejDgSe2yVWUrDztGuYCAb4S3yFg6Zl88pDXD5nnR3ldKCWjD2q
X-Gm-Gg: AYBFou3SWSAjF/Q8vp1GT8Y8k8NedbjYU198MQl72mrDrNzYIroLP9sCwapdPazjDjg
	HkvpNed8SUxi/1A6+LLn+peere7116cwpq1v6Uk025BRSjPq4cPJI4tBS2AK8Rrw5lZ+VKH9PXe
	195eyNx/U0CmX/lBbMie1kOxFGMbTuPv+auLr2OEFgIVPS50WR/XqIwIEbLWhgNST4OjusmA7eL
	DoLqX0XRdUUY+jMure/NIRbjpRjcRee0zuvyIQx2DntnSvEvLsBIKArYirBToalTnIFFPLYyFf8
	Ea7Oq+0soNe+lmfIeSqrr3Ec6TQDcpJsDc1GXfbuxOfxbnRCnzPjTFmPAVAHS+XRTzgp8Lk4aL6
	KIHieix/cv/72uRBr9bXA0qgjzTTK/rKw2oNDYfur95SJKEKrc4nrG20WEgBI2w2ObR+dJjvAP3
	ct8i2m2gjWTS1H2tkFVs7nqmapFFfKAlomMpQxorfNOANK8q1q+LDuUPF2eZxbIzzFORDF9ctrd
	pSe3iwYntJwJ23ZmTh8ymXJoc4hZJOT92dJ3PG5zOC+Bk/kipLbJbvY/iJ4FmqsDzSThL2ND+jo
	3oDltehIEalTwjeJ06auM0hfQJ3Bcu1zGxTl23eH2fjTnldcJgFpuuc5TlvoGX+c0PzqwPLu7Tr
	WfPxeah56EW3ERbqVNaL+BVNZNxHQX79QfqqUJO2V
X-Received: by 2002:a05:6830:81fb:b0:7fb:547f:98bc with SMTP id 46e09a7af769-80897394cd9mr261168a34.5.1789354898430;
        Sun, 13 Sep 2026 20:01:38 -0700 (PDT)
Received: from [127.0.1.1] (184-96-157-145.hlrn.qwest.net. [184.96.157.145])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-803f60feba1sm10619014a34.13.2026.09.13.20.01.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 20:01:37 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 13 Sep 2026 21:01:07 -0600
Subject: [PATCH v5 01/18] mtd: rawnand: sunxi: drain interrupts before
 reusing the completion
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260913-submit-sunxi-nand-vendor-oob-layout-v1-v5-1-7d711076a6f7@gmail.com>
References: <20260913-submit-sunxi-nand-vendor-oob-layout-v1-v5-0-7d711076a6f7@gmail.com>
In-Reply-To: <20260913-submit-sunxi-nand-vendor-oob-layout-v1-v5-0-7d711076a6f7@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>, 
 Richard Genoud <richard.genoud@bootlin.com>, 
 Masahiro Yamada <yamada.masahiro@socionext.com>, 
 Boris Brezillon <bbrezillon@kernel.org>, 
 Brian Norris <computersforpeace@gmail.com>
Cc: linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, James Hilliard <james.hilliard1@gmail.com>, 
 stable@vger.kernel.org
X-Mailer: b4 0.15.2

A timed-out wait can return while the interrupt handler is still using
the previous operation's interrupt status and enable mask. Starting the
next wait calls init_completion() on the same object, which can reset its
waitqueue lock while the old handler calls complete(). The old handler
can also complete the new wait or restore an obsolete interrupt mask.

Initialize the completion once in probe and use reinit_completion() for
each interrupt-driven wait. On timeout, disable and synchronize the IRQ
before masking controller interrupts and acknowledging the waited-for
events. Draining the handler first also prevents a partial-event handler
from rewriting the enable mask after it has been cleared. Flush these
register writes before re-enabling the IRQ line, leaving the controller's
interrupt sources masked.

For successful waits, move complete() after the handler's register updates
so that the next operation cannot race with those updates. Keep polling
unchanged and leave controller and DMA abort handling to the existing
callers.

Fixes: 1fef62c1423b ("mtd: nand: add sunxi NAND flash controller support")
Cc: stable@vger.kernel.org
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 26 ++++++++++++++++++++------
 1 file changed, 20 insertions(+), 6 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index f41feebe4257..e50cf5b6a730 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -374,6 +374,7 @@ struct sunxi_nfc_caps {
  * @chips: a list containing all the NAND chips attached to this NAND
  *	   controller
  * @complete: a completion object used to wait for NAND controller events
+ * @irq: NAND controller interrupt
  * @dmac: the DMA channel attached to the NAND controller
  * @use_mdma: use an internal MBUS DMA backend
  * @mdma_desc: H6-style MBUS DMA descriptor
@@ -393,6 +394,7 @@ struct sunxi_nfc {
 	unsigned long clk_rate;
 	struct list_head chips;
 	struct completion complete;
+	int irq;
 	struct dma_chan *dmac;
 	bool use_mdma;
 	struct sunxi_nfc_mdma_desc *mdma_desc;
@@ -414,12 +416,13 @@ static irqreturn_t sunxi_nfc_interrupt(int irq, void *dev_id)
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
 
@@ -435,16 +438,19 @@ static int sunxi_nfc_wait_events(struct sunxi_nfc *nfc, u32 events,
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
@@ -457,6 +463,12 @@ static int sunxi_nfc_wait_events(struct sunxi_nfc *nfc, u32 events,
 
 	writel(events & NFC_INT_MASK, nfc->regs + NFC_REG_ST);
 
+	if (!use_polling && ret) {
+		/* Flush the mask and acknowledgment before re-enabling the IRQ. */
+		readl(nfc->regs + NFC_REG_INT);
+		enable_irq(nfc->irq);
+	}
+
 	if (ret)
 		dev_err(nfc->dev, "wait interrupt timedout\n");
 
@@ -2617,6 +2629,7 @@ static int sunxi_nfc_probe(struct platform_device *pdev)
 	nfc->dev = dev;
 	nand_controller_init(&nfc->controller);
 	INIT_LIST_HEAD(&nfc->chips);
+	init_completion(&nfc->complete);
 
 	nfc->regs = devm_platform_get_and_ioremap_resource(pdev, 0, &r);
 	if (IS_ERR(nfc->regs))
@@ -2625,6 +2638,7 @@ static int sunxi_nfc_probe(struct platform_device *pdev)
 	irq = platform_get_irq(pdev, 0);
 	if (irq < 0)
 		return irq;
+	nfc->irq = irq;
 
 	nfc->caps = of_device_get_match_data(dev);
 	if (!nfc->caps)

-- 
2.53.0

