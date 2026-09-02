Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 587AD38758C;
	Wed,  2 Sep 2026 06:11:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788329509; cv=none; b=STT79MqoqYtbSmnC205q1mww+PHlJW+TGI7pqMQgWYpBkn7TqyK7vnH63Ma6H7ZipdJWC3/cvb3Ei0nOXpsH+IwWetCrUgJSAIjEslQksfM/aRRdj/ZKW20etqydsAvn4AFIurFZzRRFOhGM47El824dhRdy26AkAvSK+Eyj9fE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788329509; c=relaxed/simple;
	bh=33dF8LKWGhF1q3gakas4AqqjUTXmlhUWW27XQfar3to=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hPXZq/TJpwIld+xk8iT6XWnpGpU1kGKAq+TGi/l3DZpZ7hOyqwHav60eEJw3GKbZ8o6IpCuZGYc/yMYtcZUYTH3ME2QuKZ1moEuV7weFo6kg3VddpBD/y1EVXWdH6LUKqrcz19btck32FWreu19AIO/Mjog917suzyUZrRxKDoE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=A6QgHtwY; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="A6QgHtwY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66DA51F000E9;
	Wed,  2 Sep 2026 06:11:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788329508;
	bh=D5EvIVhXqN8QHE3Hy5zVDTIi1yifgEhdwuCRVsK2Q10=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=A6QgHtwYlUQwRQ122ETXZK4YDGHZaw0f63jjKGsU7Bv9KXl2pB3eTE/bqR8W3H4ON
	 lUvJqIgu82plknT5bryL+vmYVlXgCwn9m1Q4A3DCbrKWMuETfR3Juhc/1mft1iDqHL
	 6kUCGh5RCw1p1ZSdXGw5dgM1v9z75nq7u1N7A+1FMME99fmi6U5x5BK45Lerl2jw43
	 x/+/QsJfa8/fCwR/m2aCL+wt9ODcXAnpa8WVuK9LhAG/I7X4xHWtjnEGmfSa1Er28b
	 by7ISdv/rnkhguWwvyg+fDRVLMryrT2xuqZihHC++HOQgGim8I4MUGUG7rUHqN746D
	 zDJlIQzwZ9+qQ==
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 02 Sep 2026 08:11:36 +0200
Subject: [PATCH v2 5/5] usb: fotg210-udc: fix endpoint and resource
 handling
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260902-gemini-usb-fotg2-v2-5-0057408495d8@kernel.org>
References: <20260902-gemini-usb-fotg2-v2-0-0057408495d8@kernel.org>
In-Reply-To: <20260902-gemini-usb-fotg2-v2-0-0057408495d8@kernel.org>
To: Alan Stern <stern@rowland.harvard.edu>, 
 Daniel Palmer <daniel@thingy.jp>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Linus Walleij <linusw@kernel.org>
X-Mailer: b4 0.16.0

Use the matching DMA direction when unmapping requests, reset the
endpoint sequence before clearing its number, and update rather than
accumulate endpoint configuration fields. Only dequeue requests that
are actually queued and reject interrupts not owned by the UDC.

Keep peripheral mode from sourcing VBUS, avoid sleeping under the UDC
spinlock, and unwind the IRQ, notifier, PHY, MMIO, and gadget resources
in ownership order.

Suggested-by: Daniel Palmer <daniel@thingy.jp>
Assisted-by: LLM
Signed-off-by: Linus Walleij <linusw@kernel.org>
---
 drivers/usb/fotg210/fotg210-udc.c | 97 ++++++++++++++++++++++++---------------
 drivers/usb/fotg210/fotg210-udc.h |  2 +-
 2 files changed, 62 insertions(+), 37 deletions(-)

diff --git a/drivers/usb/fotg210/fotg210-udc.c b/drivers/usb/fotg210/fotg210-udc.c
index d9e024873a42..fdd2cf82fde5 100644
--- a/drivers/usb/fotg210/fotg210-udc.c
+++ b/drivers/usb/fotg210/fotg210-udc.c
@@ -124,6 +124,7 @@ static void fotg210_set_fifo_dir(struct fotg210_ep *ep, u32 epnum, u32 dir_in)
 	u32 val;
 
 	val = ioread32(fotg210->reg + FOTG210_FIFOMAP);
+	val &= ~FIFOMAP_NA(epnum - 1);
 	val |= (dir_in ? FIFOMAP_DIRIN(epnum - 1) : FIFOMAP_DIROUT(epnum - 1));
 	iowrite32(val, fotg210->reg + FOTG210_FIFOMAP);
 }
@@ -134,6 +135,7 @@ static void fotg210_set_tfrtype(struct fotg210_ep *ep, u32 epnum, u32 type)
 	u32 val;
 
 	val = ioread32(fotg210->reg + FOTG210_FIFOCF);
+	val &= ~FIFOCF_TYPE(3, epnum - 1);
 	val |= FIFOCF_TYPE(type, epnum - 1);
 	iowrite32(val, fotg210->reg + FOTG210_FIFOCF);
 }
@@ -147,6 +149,7 @@ static void fotg210_set_mps(struct fotg210_ep *ep, u32 epnum, u32 mps,
 				FOTG210_OUTEPMPSR(epnum);
 
 	val = ioread32(fotg210->reg + offset);
+	val &= ~INOUTEPMPSR_MPS(~0);
 	val |= INOUTEPMPSR_MPS(mps);
 	iowrite32(val, fotg210->reg + offset);
 }
@@ -209,12 +212,13 @@ static int fotg210_ep_release(struct fotg210_ep *ep)
 {
 	if (!ep->epnum)
 		return 0;
+
+	fotg210_reset_tseq(ep->fotg210, ep->epnum);
+
 	ep->epnum = 0;
 	ep->stall = 0;
 	ep->wedged = 0;
 
-	fotg210_reset_tseq(ep->fotg210, ep->epnum);
-
 	return 0;
 }
 
@@ -338,6 +342,7 @@ static void fotg210_start_dma(struct fotg210_ep *ep,
 			struct fotg210_request *req)
 {
 	struct device *dev = &ep->fotg210->gadget.dev;
+	enum dma_data_direction direction;
 	dma_addr_t d;
 	u8 *buffer;
 	u32 length;
@@ -361,8 +366,8 @@ static void fotg210_start_dma(struct fotg210_ep *ep,
 			length = req->req.length - req->req.actual;
 	}
 
-	d = dma_map_single(dev, buffer, length,
-			ep->dir_in ? DMA_TO_DEVICE : DMA_FROM_DEVICE);
+	direction = ep->dir_in ? DMA_TO_DEVICE : DMA_FROM_DEVICE;
+	d = dma_map_single(dev, buffer, length, direction);
 
 	if (dma_mapping_error(dev, d)) {
 		pr_err("dma_mapping_error\n");
@@ -379,7 +384,7 @@ static void fotg210_start_dma(struct fotg210_ep *ep,
 	/* update actual transfer length */
 	req->req.actual += length;
 
-	dma_unmap_single(dev, d, length, DMA_TO_DEVICE);
+	dma_unmap_single(dev, d, length, direction);
 }
 
 static void fotg210_ep0_queue(struct fotg210_ep *ep,
@@ -445,7 +450,7 @@ static int fotg210_ep_dequeue(struct usb_ep *_ep, struct usb_request *_req)
 	req = container_of(_req, struct fotg210_request, req);
 
 	spin_lock_irqsave(&ep->fotg210->lock, flags);
-	if (!list_empty(&ep->queue))
+	if (!list_empty(&req->queue))
 		fotg210_done(ep, req, -ECONNRESET);
 	spin_unlock_irqrestore(&ep->fotg210->lock, flags);
 
@@ -886,6 +891,8 @@ static irqreturn_t fotg210_irq(int irq, void *_fotg210)
 	u32 int_msk = ioread32(fotg210->reg + FOTG210_DMIGR);
 
 	int_grp &= ~int_msk;
+	if (!int_grp)
+		return IRQ_NONE;
 
 	spin_lock(&fotg210->lock);
 
@@ -1002,6 +1009,14 @@ static void fotg210_disable_unplug(struct fotg210_udc *fotg210)
 	iowrite32(reg, fotg210->reg + FOTG210_PHYTMSR);
 }
 
+static void fotg210_enable_unplug(struct fotg210_udc *fotg210)
+{
+	u32 reg = ioread32(fotg210->reg + FOTG210_PHYTMSR);
+
+	reg |= PHYTMSR_UNPLUG;
+	iowrite32(reg, fotg210->reg + FOTG210_PHYTMSR);
+}
+
 static int fotg210_udc_start(struct usb_gadget *g,
 		struct usb_gadget_driver *driver)
 {
@@ -1009,20 +1024,23 @@ static int fotg210_udc_start(struct usb_gadget *g,
 	u32 value;
 	int ret;
 
-	/* hook up the driver */
+	/* Hook up the driver before enabling device interrupts. */
 	fotg210->driver = driver;
 	fotg210->gadget.dev.of_node = fotg210->dev->of_node;
 	fotg210->gadget.speed = USB_SPEED_UNKNOWN;
 
-	dev_info(fotg210->dev, "bound driver %s\n", driver->driver.name);
-
 	if (!IS_ERR_OR_NULL(fotg210->phy)) {
 		ret = otg_set_peripheral(fotg210->phy->otg,
 					 &fotg210->gadget);
-		if (ret)
-			dev_err(fotg210->dev, "can't bind to phy\n");
+		if (ret) {
+			fotg210->driver = NULL;
+			return dev_err_probe(fotg210->dev, ret,
+					     "can't bind to PHY\n");
+		}
 	}
 
+	dev_info(fotg210->dev, "bound driver %s\n", driver->driver.name);
+
 	/* chip enable */
 	value = ioread32(fotg210->reg + FOTG210_DMCR);
 	value |= DMCR_CHIP_EN;
@@ -1076,20 +1094,23 @@ static void fotg210_init(struct fotg210_udc *fotg210)
 static int fotg210_udc_stop(struct usb_gadget *g)
 {
 	struct fotg210_udc *fotg210 = gadget_to_fotg210(g);
-	unsigned long	flags;
+	unsigned long flags;
+	int ret = 0;
 
 	if (!IS_ERR_OR_NULL(fotg210->phy))
-		return otg_set_peripheral(fotg210->phy->otg, NULL);
+		ret = otg_set_peripheral(fotg210->phy->otg, NULL);
+
+	/* fotg210_init() sleeps, so it must run outside the spinlock. */
+	fotg210_init(fotg210);
 
 	spin_lock_irqsave(&fotg210->lock, flags);
 
-	fotg210_init(fotg210);
 	fotg210->driver = NULL;
 	fotg210->gadget.speed = USB_SPEED_UNKNOWN;
 
 	spin_unlock_irqrestore(&fotg210->lock, flags);
 
-	return 0;
+	return ret;
 }
 
 /**
@@ -1103,8 +1124,12 @@ static int fotg210_vbus_session(struct usb_gadget *g, int is_active)
 {
 	struct fotg210_udc *fotg210 = gadget_to_fotg210(g);
 
-	/* Call down to core integration layer to drive or disable VBUS */
-	fotg210_vbus(fotg210->fotg, is_active);
+	/* A peripheral must never source VBUS; only control its pull-up. */
+	if (is_active)
+		fotg210_disable_unplug(fotg210);
+	else
+		fotg210_enable_unplug(fotg210);
+
 	return 0;
 }
 
@@ -1144,28 +1169,24 @@ static int fotg210_phy_event(struct notifier_block *nb, unsigned long action,
 	}
 }
 
-static struct notifier_block fotg210_phy_notifier = {
-	.notifier_call = fotg210_phy_event,
-};
-
 int fotg210_udc_remove(struct platform_device *pdev)
 {
 	struct fotg210_udc *fotg210 = platform_get_drvdata(pdev);
 	int i;
 
 	usb_del_gadget_udc(&fotg210->gadget);
-	if (!IS_ERR_OR_NULL(fotg210->phy)) {
-		usb_unregister_notifier(fotg210->phy, &fotg210_phy_notifier);
-		usb_put_phy(fotg210->phy);
-	}
-	iounmap(fotg210->reg);
+	if (!IS_ERR_OR_NULL(fotg210->phy))
+		usb_unregister_notifier(fotg210->phy,
+					&fotg210->phy_notifier);
 	free_irq(platform_get_irq(pdev, 0), fotg210);
+	usb_phy_shutdown(fotg210->phy);
 
 	fotg210_ep_free_request(&fotg210->ep[0]->ep, fotg210->ep0_req);
 	for (i = 0; i < FOTG210_MAX_NUM_EP; i++)
 		kfree(fotg210->ep[i]);
 
 	kfree(fotg210);
+	platform_set_drvdata(pdev, NULL);
 
 	return 0;
 }
@@ -1188,7 +1209,6 @@ int fotg210_udc_probe(struct platform_device *pdev, struct fotg210 *fotg)
 		return -ENOMEM;
 
 	fotg210->dev = dev;
-	fotg210->fotg = fotg;
 
 	fotg210->phy = devm_usb_get_phy_by_phandle(dev, "usb-phy", 0);
 	if (IS_ERR(fotg210->phy)) {
@@ -1216,8 +1236,6 @@ int fotg210_udc_probe(struct platform_device *pdev, struct fotg210 *fotg)
 
 	spin_lock_init(&fotg210->lock);
 
-	platform_set_drvdata(pdev, fotg210);
-
 	fotg210->gadget.ops = &fotg210_gadget_ops;
 
 	fotg210->gadget.max_speed = USB_SPEED_HIGH;
@@ -1267,38 +1285,45 @@ int fotg210_udc_probe(struct platform_device *pdev, struct fotg210 *fotg)
 
 	fotg210_disable_unplug(fotg210);
 
-	ret = request_irq(irq, fotg210_irq, IRQF_SHARED,
-			  udc_name, fotg210);
+	ret = request_irq(irq, fotg210_irq, 0, udc_name, fotg210);
 	if (ret < 0) {
 		dev_err_probe(dev, ret, "request_irq error\n");
 		goto err_req;
 	}
 
-	if (!IS_ERR_OR_NULL(fotg210->phy))
-		usb_register_notifier(fotg210->phy, &fotg210_phy_notifier);
+	if (!IS_ERR_OR_NULL(fotg210->phy)) {
+		fotg210->phy_notifier.notifier_call = fotg210_phy_event;
+		ret = usb_register_notifier(fotg210->phy,
+					    &fotg210->phy_notifier);
+		if (ret)
+			goto err_notifier;
+	}
 
 	ret = usb_add_gadget_udc(dev, &fotg210->gadget);
 	if (ret)
 		goto err_add_udc;
 
+	platform_set_drvdata(pdev, fotg210);
+
 	dev_info(dev, "version %s\n", DRIVER_VERSION);
 
 	return 0;
 
 err_add_udc:
 	if (!IS_ERR_OR_NULL(fotg210->phy))
-		usb_unregister_notifier(fotg210->phy, &fotg210_phy_notifier);
+		usb_unregister_notifier(fotg210->phy,
+					&fotg210->phy_notifier);
+err_notifier:
 	free_irq(irq, fotg210);
 
 err_req:
 	fotg210_ep_free_request(&fotg210->ep[0]->ep, fotg210->ep0_req);
 
 err_map:
-	iounmap(fotg210->reg);
-
 err_alloc:
 	for (i = 0; i < FOTG210_MAX_NUM_EP; i++)
 		kfree(fotg210->ep[i]);
+	usb_phy_shutdown(fotg210->phy);
 
 err_free:
 	kfree(fotg210);
diff --git a/drivers/usb/fotg210/fotg210-udc.h b/drivers/usb/fotg210/fotg210-udc.h
index 252cb2b8e2fe..11fe67802537 100644
--- a/drivers/usb/fotg210/fotg210-udc.h
+++ b/drivers/usb/fotg210/fotg210-udc.h
@@ -237,8 +237,8 @@ struct fotg210_udc {
 	unsigned long		irq_trigger;
 
 	struct device			*dev;
-	struct fotg210			*fotg;
 	struct usb_phy			*phy;
+	struct notifier_block		phy_notifier;
 	struct usb_gadget		gadget;
 	struct usb_gadget_driver	*driver;
 

-- 
2.55.0

