Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2B9C3B388C
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 11:11:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792321895; cv=none; b=Z1DZtMKJioL3JXAyTMsBtrrvGVV9obnTjJ697M/luuQdz9EwmFv0lGDXb9ZLJPTiI4tEadzvkbsDChjj8YI3Y/ZzCHXCg1uWdbFCXZQ6/RbqPGteeQQJO/7o18H1cyGQSHsWUyL3YwMbvUMYrcT7ZFpTfs9N0/6x+4vvJ7gXNtc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792321895; c=relaxed/simple;
	bh=7My8JmNvnhBR3H4hP1APkhv+P/R/t75wo6tfVjATvy8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=R97SJ+py06t/DMtKaAp2o1se58/hIsKEFDogATeZ/qBx3UAf+q4o+I1ZKu7tMgpLxFW9AW5603OfxpTcRXunPY8SRm9g/IC3iIHRi1WZMHeTc23twBU1evXsIUGrcgaoJRd3iO344xcXo3H9Vhbd9HKl2dZod5RnpXZPCEKBs5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=okPgIrOx; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="okPgIrOx"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a1682bff3cso5384795e9.1
        for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 04:11:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792321891; x=1792926691; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vgkxqhTApoOBhs/mRrfpjGowBj0GWwdL18OZhQTvCnI=;
        b=okPgIrOxKos/sNXwaqFsaU+n1Z/Cj7RteI3TJ5Q8mR21W6sAGQ+Bck/oZhNfvtV8xB
         TlllE+T2969gz9g2GSYSFCVVjPf9n2AcLYZr2xpNXYQRgZcHX24Q2k9VnAg7HnQR4p/h
         G4pwwKVQ/BsN+tRsImCzQhVQk8rPch3LpSbCQYegF/GPHrywbjrApxVZRKsmDvlGUQ9P
         T+nrQ/lAn+iVIn5tr5e6v1XmMHHbi55d00Ke/XU4Z2snEMMCopFBLdS65U1DdUS451OX
         vMsNwnKPW6OhuFt6zzcWsihT8gan7Mt4qk6fQM2+muuEwqDyetcf9C6mwYSoB7iNWCts
         2Q9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792321891; x=1792926691;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vgkxqhTApoOBhs/mRrfpjGowBj0GWwdL18OZhQTvCnI=;
        b=X/8Yf3sSqKhqHhpP5vj6BDUJmpgZZEdHcUh/DFxtZAuc9bBTSJLxOvqpT0kInGzBnV
         ycoWjhRHtz21aMjjXCCbJpFqIdG4s0aYctTSqUjJz47237e4NQWcSD4CdLULKMQxKcci
         Z8PJd2QSEU8he2je/o4EIs+R4QRhA2Id84biRMsSnlYy/d0bqoCd4M9Tmvd0fFQmmZWl
         5PGjmFUpakwN2KKHGBlmBO87v2TMf0Pjmapfbxxh9kPL5ku9EH0zCZwaDgYjuwmsJCA9
         NVPsnd+Fb0XWvaoE+NtPnABHFpVAjNZndM5bDZRkAvS9+RruAAT4dfRiQmFZk+UVkSEl
         TfUA==
X-Forwarded-Encrypted: i=1; AKwUvBz4GwsXpHTcXOoZ4SRz0x0XfGnBIBmtelml8LNvId4FrT1AoOptP1tGLPtQK5GGujY1+Om+LbOKfWlP2pU=@vger.kernel.org
X-Gm-Message-State: AFq9FYIuDzXxweY9n488MemZKS7IJks0v5P+4sGDrv1AKp7SM7JePa1N
	6F1mzYp//uQ7996dxN9/BhBbwqGgf1wJHP3Jn26sfvFLdUXPvAPUhj0fRfdiqci8fbqyu194Qrs
	=
X-Gm-Gg: AYBFou0/UfOola7zz1jzP9/6yV2CSchGtroy8Bj89Z3mWcFd8mlfmgc9kMbePxM0H2S
	e5YXdHP0LuNsXhJcbJhN20SIbyAZOn2r8yXs8SsWqYZAKB4G2V+fon9WoPz3ra26P2nI++Yglg9
	pfljfkl1XjBM23MBXtR0CsgWbqdTTrpuuq6OBb3fUhlcGcrtsPYsRy5hVZVu7cQ5it3tAzcXE7a
	DQP5EmX2zR9zb2TIGGyc48in4riy6nvRYr4wgP7z5HSyOAo63jtA8+mCiB8BMXrLAhG4hqa1DMF
	iIK+PZTKbdh7uhyEuOLue3Hf8374iMHnnbv8h4tRCS60Hd0iuscY8SGRrie0l6zyErNsAL1DdFs
	kk7zjDbujD3gZbkHRPR/0DpWKPOAaxrtXISwkqlAH4X8+x+TADHCZ6nC9EJRBfG1LWbqdijIY56
	nBKxnC+QdTIvftLwr+VX3nmdoNa5tlqOI5GHUmbQ4f8d6BP7a8B5RpY+9CDHWN+XCKz8/o5Kmal
	egfouw=
X-Received: by 2002:a05:600c:6749:b0:4a1:e51d:9244 with SMTP id 5b1f17b1804b1-4a1e51d93f4mr16785525e9.25.1792321890988;
        Sun, 18 Oct 2026 04:11:30 -0700 (PDT)
Received: from fedora.domain.name ([217.218.152.67])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd4f5177sm15928100f8f.30.2026.10.18.04.11.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 04:11:30 -0700 (PDT)
From: Muhammad Mahdi Amirpour <ampr.mhd@gmail.com>
To: stern@rowland.harvard.edu
Cc: gregkh@linuxfoundation.org,
	linux-usb@vger.kernel.org,
	linux-omap@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Muhammad Mahdi Amirpour <ampr.mhd@gmail.com>
Subject: [PATCH v2] usb: ohci-omap: handle root hub overcurrent
Date: Sun, 18 Oct 2026 14:41:24 +0330
Message-ID: <20261018111124.32979-1-ampr.mhd@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261018015747.246611-1-ampr.mhd@gmail.com>
References: <20261018015747.246611-1-ampr.mhd@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Handle overcurrent GPIO interrupts, disable port power when
overcurrent is detected, and report the status through the
root hub port status.

Signed-off-by: Muhammad Mahdi Amirpour <ampr.mhd@gmail.com>
---
 drivers/usb/host/ohci-omap.c | 212 +++++++++++++++++++++++++++++++----
 1 file changed, 191 insertions(+), 21 deletions(-)

diff --git a/drivers/usb/host/ohci-omap.c b/drivers/usb/host/ohci-omap.c
index f6e56c4b9914..2a08147dc5fa 100644
--- a/drivers/usb/host/ohci-omap.c
+++ b/drivers/usb/host/ohci-omap.c
@@ -15,6 +15,7 @@
  * This file is licenced under the GPL.
  */
 
+#include <linux/irqreturn.h>
 #include <linux/clk.h>
 #include <linux/dma-mapping.h>
 #include <linux/err.h>
@@ -33,6 +34,9 @@
 #include <linux/signal.h>
 #include <linux/usb.h>
 #include <linux/usb/hcd.h>
+#include <linux/interrupt.h>
+#include <linux/spinlock.h>
+#include <linux/usb/ch11.h>
 
 #include "ohci.h"
 
@@ -46,6 +50,10 @@ struct ohci_omap_priv {
 	struct clk *usb_dc_ck;
 	struct gpio_desc *power;
 	struct gpio_desc *overcurrent;
+	spinlock_t overcurrent_lock;
+	bool overcurrent_status;
+	bool overcurrent_changed;
+	int overcurrent_irq;
 };
 
 static const char hcd_name[] = "ohci-omap";
@@ -181,11 +189,110 @@ static int ohci_omap_reset(struct usb_hcd *hcd)
 	return 0;
 }
 
+static irqreturn_t ohci_omap_overcurrent_irq(int irq, void *data)
+{
+	struct usb_hcd *hcd = data;
+	struct ohci_omap_priv *priv = hcd_to_ohci_omap_priv(hcd);
+	unsigned long flags;
+	int status;
+
+	status = gpiod_get_value_cansleep(priv->overcurrent);
+	if (status < 0)
+		return IRQ_HANDLED;
+
+	if (status && priv->power)
+		gpiod_set_value_cansleep(priv->power, 0);
+
+	spin_lock_irqsave(&priv->overcurrent_lock, flags);
+	if (!!status != priv->overcurrent_status)
+		priv->overcurrent_changed = true;
+	priv->overcurrent_status = !!status;
+	spin_unlock_irqrestore(&priv->overcurrent_lock, flags);
+
+	usb_hcd_poll_rh_status(hcd);
+
+	return IRQ_HANDLED;
+}
+
+static int ohci_omap_hub_status_data(struct usb_hcd *hcd, char *buf)
+{
+	struct ohci_omap_priv *priv = hcd_to_ohci_omap_priv(hcd);
+	unsigned long flags;
+	bool changed;
+	int length;
+
+	length = ohci_hub_status_data(hcd, buf);
+
+	spin_lock_irqsave(&priv->overcurrent_lock, flags);
+	changed = priv->overcurrent_changed;
+	spin_unlock_irqrestore(&priv->overcurrent_lock, flags);
+
+	if (changed) {
+		if (!length) {
+			buf[0] = 0;
+			length = 1;
+		}
+		buf[0] |= BIT(1);
+	}
+
+	return length;
+}
+
+static int ohci_omap_hub_control(struct usb_hcd *hcd, u16 typeReq, u16 wValue,
+				 u16 wIndex, char *buf, u16 wLength)
+{
+	struct ohci_omap_priv *priv = hcd_to_ohci_omap_priv(hcd);
+	unsigned long flags;
+	bool status, changed;
+	__le32 *portstatus;
+	u32 value;
+	int ret;
+
+	ret = ohci_hub_control(hcd, typeReq, wValue, wIndex, buf, wLength);
+	if (ret)
+		return ret;
+
+	if (typeReq == ClearPortFeature && wIndex == 1 &&
+	    wValue == USB_PORT_FEAT_C_OVER_CURRENT) {
+		unsigned long flags;
+
+		spin_lock_irqsave(&priv->overcurrent_lock, flags);
+		priv->overcurrent_changed = false;
+		spin_unlock_irqrestore(&priv->overcurrent_lock, flags);
+		return 0;
+	}
+
+	if (typeReq != GetPortStatus || wIndex != 1)
+		return ret;
+
+	spin_lock_irqsave(&priv->overcurrent_lock, flags);
+	status = priv->overcurrent_status;
+	changed = priv->overcurrent_changed;
+	spin_unlock_irqrestore(&priv->overcurrent_lock, flags);
+
+	portstatus = (__le32 *)buf;
+	value = le32_to_cpu(*portstatus);
+
+	if (status)
+		value |= USB_PORT_STAT_OVERCURRENT;
+	else
+		value &= ~USB_PORT_STAT_OVERCURRENT;
+
+	if (changed)
+		value |= USB_PORT_STAT_C_OVERCURRENT;
+	else
+		value &= ~USB_PORT_STAT_C_OVERCURRENT;
+
+	*portstatus = cpu_to_le32(value);
+
+	return 0;
+}
+
 /*-------------------------------------------------------------------------*/
 
 /**
  * ohci_hcd_omap_probe - initialize OMAP-based HCDs
- * @pdev:	USB controller to probe
+ * @pdev: USB controller to probe
  *
  * Context: task context, might sleep
  *
@@ -196,50 +303,53 @@ static int ohci_omap_reset(struct usb_hcd *hcd)
 static int ohci_hcd_omap_probe(struct platform_device *pdev)
 {
 	int retval, irq;
-	struct usb_hcd *hcd = 0;
+	struct usb_hcd *hcd;
 	struct ohci_omap_priv *priv;
 
 	if (pdev->num_resources != 2) {
 		dev_err(&pdev->dev, "invalid num_resources: %i\n",
-		       pdev->num_resources);
+			pdev->num_resources);
 		return -ENODEV;
 	}
 
-	if (pdev->resource[0].flags != IORESOURCE_MEM
-			|| pdev->resource[1].flags != IORESOURCE_IRQ) {
+	if (pdev->resource[0].flags != IORESOURCE_MEM ||
+	    pdev->resource[1].flags != IORESOURCE_IRQ) {
 		dev_err(&pdev->dev, "invalid resource type\n");
 		return -ENODEV;
 	}
 
 	hcd = usb_create_hcd(&ohci_omap_hc_driver, &pdev->dev,
-			dev_name(&pdev->dev));
+			     dev_name(&pdev->dev));
 	if (!hcd)
 		return -ENOMEM;
 
 	hcd->rsrc_start = pdev->resource[0].start;
-	hcd->rsrc_len = pdev->resource[0].end - pdev->resource[0].start + 1;
+	hcd->rsrc_len = pdev->resource[0].end -
+			pdev->resource[0].start + 1;
 	priv = hcd_to_ohci_omap_priv(hcd);
 
-	/* Obtain two optional GPIO lines */
-	priv->power = devm_gpiod_get_optional(&pdev->dev, "power", GPIOD_ASIS);
+	spin_lock_init(&priv->overcurrent_lock);
+	priv->overcurrent_status = false;
+	priv->overcurrent_changed = false;
+	priv->overcurrent_irq = -1;
+
+	priv->power = devm_gpiod_get_optional(&pdev->dev, "power",
+					      GPIOD_ASIS);
 	if (IS_ERR(priv->power)) {
 		retval = PTR_ERR(priv->power);
 		goto err_put_hcd;
 	}
+
 	if (priv->power)
 		gpiod_set_consumer_name(priv->power, "OHCI power");
 
-	/*
-	 * This "overcurrent" GPIO line isn't really used in the code,
-	 * but has a designated hardware function.
-	 * TODO: implement proper overcurrent handling.
-	 */
-	priv->overcurrent = devm_gpiod_get_optional(&pdev->dev, "overcurrent",
-						    GPIOD_IN);
+	priv->overcurrent = devm_gpiod_get_optional(&pdev->dev,
+						    "overcurrent", GPIOD_IN);
 	if (IS_ERR(priv->overcurrent)) {
 		retval = PTR_ERR(priv->overcurrent);
 		goto err_put_hcd;
 	}
+
 	if (priv->overcurrent)
 		gpiod_set_consumer_name(priv->overcurrent, "OHCI overcurrent");
 
@@ -277,23 +387,77 @@ static int ohci_hcd_omap_probe(struct platform_device *pdev)
 	if (!hcd->regs) {
 		dev_err(&pdev->dev, "can't ioremap OHCI HCD\n");
 		retval = -ENOMEM;
-		goto err2;
+		goto err_release_mem;
 	}
 
 	irq = platform_get_irq(pdev, 0);
 	if (irq < 0) {
 		retval = irq;
-		goto err3;
+		goto err_iounmap;
 	}
+
 	retval = usb_add_hcd(hcd, irq, 0);
 	if (retval)
-		goto err3;
+		goto err_iounmap;
+
+	if (priv->overcurrent) {
+		int status;
+		unsigned long flags;
+
+		priv->overcurrent_irq = gpiod_to_irq(priv->overcurrent);
+		if (priv->overcurrent_irq < 0) {
+			retval = priv->overcurrent_irq;
+			goto err_remove_hcd;
+		}
+
+		retval = request_threaded_irq(priv->overcurrent_irq, NULL,
+					      ohci_omap_overcurrent_irq,
+					      IRQF_ONESHOT |
+					      IRQF_TRIGGER_RISING |
+					      IRQF_TRIGGER_FALLING,
+					      "ohci-omap-overcurrent", hcd);
+		if (retval) {
+			priv->overcurrent_irq = -1;
+			goto err_remove_hcd;
+		}
+
+		/*
+		 * Synchronize the initial GPIO sample with the threaded
+		 * handler so it cannot overwrite the sampled state.
+		 */
+		disable_irq(priv->overcurrent_irq);
+
+		status = gpiod_get_value_cansleep(priv->overcurrent);
+		if (status < 0) {
+			retval = status;
+			enable_irq(priv->overcurrent_irq);
+			goto err_remove_hcd;
+		}
+
+		spin_lock_irqsave(&priv->overcurrent_lock, flags);
+		priv->overcurrent_status = !!status;
+		priv->overcurrent_changed = true;
+		spin_unlock_irqrestore(&priv->overcurrent_lock, flags);
+
+		if (status && priv->power)
+			gpiod_set_value_cansleep(priv->power, 0);
+
+		enable_irq(priv->overcurrent_irq);
+		usb_hcd_poll_rh_status(hcd);
+	}
 
 	device_wakeup_enable(hcd->self.controller);
 	return 0;
-err3:
+
+err_remove_hcd:
+	if (priv->overcurrent_irq >= 0) {
+		free_irq(priv->overcurrent_irq, hcd);
+		priv->overcurrent_irq = -1;
+	}
+	usb_remove_hcd(hcd);
+err_iounmap:
 	iounmap(hcd->regs);
-err2:
+err_release_mem:
 	release_mem_region(hcd->rsrc_start, hcd->rsrc_len);
 err_unprepare_dc_ck:
 	clk_unprepare(priv->usb_dc_ck);
@@ -327,6 +491,10 @@ static void ohci_hcd_omap_remove(struct platform_device *pdev)
 	struct ohci_omap_priv *priv = hcd_to_ohci_omap_priv(hcd);
 
 	dev_dbg(hcd->self.controller, "stopping USB Controller\n");
+	if (priv->overcurrent_irq >= 0) {
+		free_irq(priv->overcurrent_irq, hcd);
+		priv->overcurrent_irq = -1;
+	}
 	usb_remove_hcd(hcd);
 	omap_ohci_clock_power(priv, 0);
 	if (!IS_ERR_OR_NULL(hcd->usb_phy)) {
@@ -413,6 +581,8 @@ static int __init ohci_omap_init(void)
 		return -ENODEV;
 
 	ohci_init_driver(&ohci_omap_hc_driver, &omap_overrides);
+	ohci_omap_hc_driver.hub_status_data = ohci_omap_hub_status_data;
+	ohci_omap_hc_driver.hub_control = ohci_omap_hub_control;
 	return platform_driver_register(&ohci_hcd_omap_driver);
 }
 module_init(ohci_omap_init);
-- 
2.55.0

