Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9AD846C83F
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 09:21:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791365097; cv=none; b=airfK6dSV18YENl0yad3tMNuem6DhK7zgfiLI1CWYLDuEw9DZv+GQr0zr6hxMyPVlxEXdofC98zbyOpD4u3cMIGfIFMN91OUMJ+IHZJf9QIRbzgw4hcfkF92t2vVt115wf3b3tLVpgreVWGpDnb1R7COL/Q5sPeoNRCOYZqqEWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791365097; c=relaxed/simple;
	bh=XPVC37A5YQX+CfIAgkiFTX3kzSFv7t/CkcRVOzlm5z8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=qCGJcnwYJRJBLPkMes5W4U7I3XxGjwIcKr2Qo/89Lkw65DY1rzD1PVopzSZyG8TpAs/QJ113c0zPyUW5tMRc+e2iLa3xT3s5q2qXXqXQ3vn2zEfW6jFC2fxHvBgOYd5wX20tKuLKeXElcUJ2ktY9H1trztFoBomr6EAj/YXZI5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oVpJOQcP; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oVpJOQcP"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2e4a341d177so21884795ad.0
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 02:21:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791364909; x=1791969709; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=q/ye4PePSaKCljvbrnJ/SyPJF/9LtNk+qowE/XThTu0=;
        b=oVpJOQcPUFd+gzO4yL/Jhmh+dG4yVyzsQQ8aTOVcfUWGj33JS/5M8dhNXWEaFqYkkU
         lSxd1RhiB0iOzmBJXYQ9Mdm4NwAComeUJoVbgbkA0VRn/9i1h1JC+ziNNTw5jGNxq+bi
         z6FHT65G1Zxqt5xe4BUFXe1M/Fi524BCMEHrCrFK9kHCFyIcE9DCpM/hqUTFycCuEm0Y
         AEr2g/8x5Jfbf4m2e9ylhbStz96gK2DJ+qnMnhhbWv/RdiSFJT2xs9W/VGmyaArGofMx
         2j0+cCCoWkrJrbRfPQ5lqszMu0bl/z/836ZfYUfcuAmKXAK2nVn+6HRorz1QH9HJby7u
         FDIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791364909; x=1791969709;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=q/ye4PePSaKCljvbrnJ/SyPJF/9LtNk+qowE/XThTu0=;
        b=df6/4gJ5vBMPByKlVbeeB2uIBpJJj17eT60WHorYmyjw6uOXMnE2pHJX0fHjd3XOxV
         Wbd7hf7BtWBacuhxkE2+64Ll7Mwbr1Cu2oIYYUhb7Rnsv08HFojnfjvhU4yhpSYUy4je
         y6Ra1UgcICLRMseUDyuMoheIXkcqals/oo7Cqfz6iAYDP83xtpMV8gJx20w4oxvx9HiQ
         3pvi/D7wUpwgNHio7zJ4oWmaoif8IWJ2VY1I9MY/m0LwjhxySemK2pCsRMrTZL9G8xHF
         iiVAOiIueLFFsXWwlglqtL9xJTcRrKTDkkSvj0piCZ0pZpMGe9EvREHutS6bmBZYQiBq
         UOPA==
X-Gm-Message-State: AFq9FYI3B0tUhmS6UUx/DBv6/HTr5ZQbRg9m2xv0bMladBZeRWaVShO6
	OPOapxT8NfJijsRLLxMB7Mx4/PtaCjlpjZD981oq259YThuxjeUUcFjb
X-Gm-Gg: AYBFou0JwnAUYsl3Ur0kIFs0rTZHN8dFmOGQDjXOsNRAtSnrs1GW3/vov2P5wpv2Q3d
	Bl2p+VSH4jKQxDY0YYCJZUR4UB/xJmgZvnlPtggpDe18ofPTjqbaRpWEWrFwIffsPRchCI9ThiZ
	SzkoIkW2Gdex+UiQXEaasg8AdpsLwcXm5zzXxo3iYONbfD+A8dOOfA7Gsj0WEDaTwpZPu2SsqCZ
	sxOjK99OfwDusGhqhg3mH30BiiBBhtPYlMeuCZcWgAZfZNug5xGPGIhKSjQM5AS+HmxsYbyelKB
	bE2jLpBStLBnpb+2BFgYlownL2dErLVOsZNEhUWRXnWep6fYXKUjFwuNtxB5A/tndLfUYkN9Wre
	PxYNkYGY3KnGw3nnXCTraaZ+m2NQHntznJTXt6aSRdmRCxY1EVgwj49K8MnDWb+gj/lIbuSmofE
	zaYVlWeds7hZ9/KDS7ltOvg3wpEJOKs0k4gmwKDDjpbW4UzLnQ/Zk9po8qCwi0ykzRvVT2oFaBy
	fVpx9pbDfzQf77k/UEDaCbMJ6brwcSdUwrjw5PNYg==
X-Received: by 2002:a17:903:2c0f:b0:2e1:2ce5:677a with SMTP id d9443c01a7336-2e6003b5d0emr15642485ad.16.1791364908770;
        Wed, 07 Oct 2026 02:21:48 -0700 (PDT)
Received: from hcdev-d520mt2.. (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e6046fe0e8sm7180675ad.25.2026.10.07.02.21.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 02:21:48 -0700 (PDT)
From: a0282524688@gmail.com
To: lee@kernel.org,
	Ming Yu <tmyu0@nuvoton.com>
Cc: linux-kernel@vger.kernel.org,
	Ming Yu <a0282524688@gmail.com>,
	mfd@lists.linux.dev
Subject: [PATCH v8 10/13] mfd: nct6694: Extract core device management into a separate module
Date: Wed,  7 Oct 2026 17:20:59 +0800
Message-Id: <20261007092102.3768818-11-a0282524688@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261007092102.3768818-1-a0282524688@gmail.com>
References: <20261007092102.3768818-1-a0282524688@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ming Yu <a0282524688@gmail.com>

Move the IRQ domain and IDA handling, which do not depend on the
transport, from the USB driver into a new nct6694-core module. The
core retrieves struct nct6694 from the driver data of the transport
device, and the transport keeps registering its own MFD cells.

The USB driver now creates the IRQ domain before submitting the
interrupt URB, and kills the URB before the domain is removed.

No functional change.

Signed-off-by: Ming Yu <a0282524688@gmail.com>
---
Changes in v8:
- Pass only the transport device to the core and retrieve struct nct6694
  from its driver data.
- Let the transport register its own MFD cells.
- Rename nct6694_core_{probe,remove}() to nct6694_device_{init,exit}().
- Return -ENOMEM when the IRQ domain cannot be created.
- Folded in the v7 patch "Submit the interrupt URB after the core is
  registered", whose issue no longer arises.
- Moved the Kconfig split to a later patch.

Changes in v7:
- None.

Changes in v6:
- Reordered to sit before the transport-abstraction patch; no functional
  change.

Changes in v5:
- Split from the monolithic v4 patch to follow the single logical change
  principle.

 MAINTAINERS                 |   2 +-
 drivers/mfd/Makefile        |   1 +
 drivers/mfd/nct6694-core.c  | 111 ++++++++++++++++++++++++++++++++++++
 drivers/mfd/nct6694-usb.c   |  98 +++++--------------------------
 include/linux/mfd/nct6694.h |   3 +
 5 files changed, 130 insertions(+), 85 deletions(-)
 create mode 100644 drivers/mfd/nct6694-core.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 1f00fd84365a..3dadc6e8105a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -19539,7 +19539,7 @@ S:	Supported
 F:	drivers/gpio/gpio-nct6694.c
 F:	drivers/hwmon/nct6694-hwmon.c
 F:	drivers/i2c/busses/i2c-nct6694.c
-F:	drivers/mfd/nct6694-usb.c
+F:	drivers/mfd/nct6694-*.c
 F:	drivers/net/can/usb/nct6694_canfd.c
 F:	drivers/rtc/rtc-nct6694.c
 F:	drivers/watchdog/nct6694_wdt.c
diff --git a/drivers/mfd/Makefile b/drivers/mfd/Makefile
index 5ff440fb75bf..dfd81356b485 100644
--- a/drivers/mfd/Makefile
+++ b/drivers/mfd/Makefile
@@ -124,6 +124,7 @@ obj-$(CONFIG_MFD_MC13XXX_I2C)	+= mc13xxx-i2c.o
 
 obj-$(CONFIG_MFD_PF1550)	+= pf1550.o
 
+obj-$(CONFIG_MFD_NCT6694)	+= nct6694-core.o
 obj-$(CONFIG_MFD_NCT6694)	+= nct6694-usb.o
 
 obj-$(CONFIG_MFD_CORE)		+= mfd-core.o
diff --git a/drivers/mfd/nct6694-core.c b/drivers/mfd/nct6694-core.c
new file mode 100644
index 000000000000..4b100882ae07
--- /dev/null
+++ b/drivers/mfd/nct6694-core.c
@@ -0,0 +1,111 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2026 Nuvoton Technology Corp.
+ *
+ * Nuvoton NCT6694 core driver providing the IRQ domain and IDA pools
+ * shared by all transport drivers.
+ */
+
+#include <linux/bits.h>
+#include <linux/device.h>
+#include <linux/idr.h>
+#include <linux/irq.h>
+#include <linux/irqdomain.h>
+#include <linux/mfd/nct6694.h>
+#include <linux/module.h>
+#include <linux/spinlock.h>
+
+static void nct6694_irq_enable(struct irq_data *data)
+{
+	struct nct6694 *ddata = irq_data_get_irq_chip_data(data);
+	irq_hw_number_t hwirq = irqd_to_hwirq(data);
+
+	guard(spinlock_irqsave)(&ddata->irq_lock);
+
+	ddata->irq_enable |= BIT(hwirq);
+}
+
+static void nct6694_irq_disable(struct irq_data *data)
+{
+	struct nct6694 *ddata = irq_data_get_irq_chip_data(data);
+	irq_hw_number_t hwirq = irqd_to_hwirq(data);
+
+	guard(spinlock_irqsave)(&ddata->irq_lock);
+
+	ddata->irq_enable &= ~BIT(hwirq);
+}
+
+static const struct irq_chip nct6694_irq_chip = {
+	.name = "nct6694-irq",
+	.flags = IRQCHIP_SKIP_SET_WAKE,
+	.irq_enable = nct6694_irq_enable,
+	.irq_disable = nct6694_irq_disable,
+};
+
+static int nct6694_irq_domain_map(struct irq_domain *d, unsigned int irq, irq_hw_number_t hw)
+{
+	struct nct6694 *ddata = d->host_data;
+
+	irq_set_chip_data(irq, ddata);
+	irq_set_chip_and_handler(irq, &nct6694_irq_chip, handle_simple_irq);
+
+	return 0;
+}
+
+static void nct6694_irq_domain_unmap(struct irq_domain *d, unsigned int irq)
+{
+	irq_set_chip_and_handler(irq, NULL, NULL);
+	irq_set_chip_data(irq, NULL);
+}
+
+static const struct irq_domain_ops nct6694_irq_domain_ops = {
+	.map	= nct6694_irq_domain_map,
+	.unmap	= nct6694_irq_domain_unmap,
+};
+
+/**
+ * nct6694_device_init() - Set up the resources shared by all transports
+ * @dev: transport device whose driver data points to the struct nct6694
+ *
+ * Return: 0 on success or negative errno on failure.
+ */
+int nct6694_device_init(struct device *dev)
+{
+	struct nct6694 *ddata = dev_get_drvdata(dev);
+
+	spin_lock_init(&ddata->irq_lock);
+
+	ida_init(&ddata->gpio_ida);
+	ida_init(&ddata->i2c_ida);
+	ida_init(&ddata->canfd_ida);
+	ida_init(&ddata->wdt_ida);
+
+	ddata->domain = irq_domain_create_simple(NULL, NCT6694_NR_IRQS, 0,
+						 &nct6694_irq_domain_ops,
+						 ddata);
+	if (!ddata->domain)
+		return -ENOMEM;
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(nct6694_device_init);
+
+/**
+ * nct6694_device_exit() - Release the resources set up by nct6694_device_init()
+ * @dev: transport device passed to nct6694_device_init()
+ */
+void nct6694_device_exit(struct device *dev)
+{
+	struct nct6694 *ddata = dev_get_drvdata(dev);
+
+	ida_destroy(&ddata->wdt_ida);
+	ida_destroy(&ddata->canfd_ida);
+	ida_destroy(&ddata->i2c_ida);
+	ida_destroy(&ddata->gpio_ida);
+	irq_domain_remove(ddata->domain);
+}
+EXPORT_SYMBOL_GPL(nct6694_device_exit);
+
+MODULE_DESCRIPTION("Nuvoton NCT6694 core driver");
+MODULE_AUTHOR("Ming Yu <tmyu0@nuvoton.com>");
+MODULE_LICENSE("GPL");
diff --git a/drivers/mfd/nct6694-usb.c b/drivers/mfd/nct6694-usb.c
index 83e9c7ac9bee..455eeed62dce 100644
--- a/drivers/mfd/nct6694-usb.c
+++ b/drivers/mfd/nct6694-usb.c
@@ -11,7 +11,6 @@
 
 #include <linux/bits.h>
 #include <linux/interrupt.h>
-#include <linux/idr.h>
 #include <linux/irq.h>
 #include <linux/irqdomain.h>
 #include <linux/kernel.h>
@@ -19,7 +18,6 @@
 #include <linux/mfd/nct6694.h>
 #include <linux/module.h>
 #include <linux/slab.h>
-#include <linux/spinlock.h>
 #include <linux/usb.h>
 
 #define NCT6694_VENDOR_ID	0x0416
@@ -284,54 +282,6 @@ static void nct6694_usb_int_callback(struct urb *urb)
 		dev_warn(ddata->dev, "Failed to resubmit urb, status %pe",  ERR_PTR(ret));
 }
 
-static void nct6694_irq_enable(struct irq_data *data)
-{
-	struct nct6694 *ddata = irq_data_get_irq_chip_data(data);
-	irq_hw_number_t hwirq = irqd_to_hwirq(data);
-
-	guard(spinlock_irqsave)(&ddata->irq_lock);
-
-	ddata->irq_enable |= BIT(hwirq);
-}
-
-static void nct6694_irq_disable(struct irq_data *data)
-{
-	struct nct6694 *ddata = irq_data_get_irq_chip_data(data);
-	irq_hw_number_t hwirq = irqd_to_hwirq(data);
-
-	guard(spinlock_irqsave)(&ddata->irq_lock);
-
-	ddata->irq_enable &= ~BIT(hwirq);
-}
-
-static const struct irq_chip nct6694_irq_chip = {
-	.name = "nct6694-irq",
-	.flags = IRQCHIP_SKIP_SET_WAKE,
-	.irq_enable = nct6694_irq_enable,
-	.irq_disable = nct6694_irq_disable,
-};
-
-static int nct6694_irq_domain_map(struct irq_domain *d, unsigned int irq, irq_hw_number_t hw)
-{
-	struct nct6694 *ddata = d->host_data;
-
-	irq_set_chip_data(irq, ddata);
-	irq_set_chip_and_handler(irq, &nct6694_irq_chip, handle_simple_irq);
-
-	return 0;
-}
-
-static void nct6694_irq_domain_unmap(struct irq_domain *d, unsigned int irq)
-{
-	irq_set_chip_and_handler(irq, NULL, NULL);
-	irq_set_chip_data(irq, NULL);
-}
-
-static const struct irq_domain_ops nct6694_irq_domain_ops = {
-	.map	= nct6694_irq_domain_map,
-	.unmap	= nct6694_irq_domain_unmap,
-};
-
 static int nct6694_usb_probe(struct usb_interface *iface,
 			     const struct usb_device_id *id)
 {
@@ -376,28 +326,12 @@ static int nct6694_usb_probe(struct usb_interface *iface,
 		return -ENOMEM;
 
 	ddata = &usb_data->core;
-
-	ddata->domain = irq_domain_create_simple(NULL, NCT6694_NR_IRQS, 0,
-						 &nct6694_irq_domain_ops,
-						 ddata);
-	if (!ddata->domain) {
-		ret = -ENODEV;
-		goto err_urb;
-	}
-
 	ddata->dev = dev;
 	usb_data->usb_dev = usb_dev;
 
-	ida_init(&ddata->gpio_ida);
-	ida_init(&ddata->i2c_ida);
-	ida_init(&ddata->canfd_ida);
-	ida_init(&ddata->wdt_ida);
-
-	spin_lock_init(&ddata->irq_lock);
-
 	ret = devm_mutex_init(dev, &usb_data->access_lock);
 	if (ret)
-		goto err_ida;
+		goto err_free_urb;
 
 	int_pipe = usb_rcvintpipe(usb_dev, NCT6694_INT_IN_EP);
 	usb_fill_int_urb(usb_data->int_urb, usb_dev, int_pipe,
@@ -405,27 +339,27 @@ static int nct6694_usb_probe(struct usb_interface *iface,
 			 nct6694_usb_int_callback, ddata,
 			 usb_pipe_endpoint(usb_dev, int_pipe)->desc.bInterval);
 
-	ret = usb_submit_urb(usb_data->int_urb, GFP_KERNEL);
+	usb_set_intfdata(iface, ddata);
+
+	ret = nct6694_device_init(dev);
 	if (ret)
-		goto err_ida;
+		goto err_free_urb;
 
-	usb_set_intfdata(iface, ddata);
+	ret = usb_submit_urb(usb_data->int_urb, GFP_KERNEL);
+	if (ret)
+		goto err_device_exit;
 
 	ret = mfd_add_hotplug_devices(dev, nct6694_usb_devs, ARRAY_SIZE(nct6694_usb_devs));
 	if (ret)
-		goto err_mfd;
+		goto err_kill_urb;
 
 	return 0;
 
-err_mfd:
+err_kill_urb:
 	usb_kill_urb(usb_data->int_urb);
-err_ida:
-	ida_destroy(&ddata->wdt_ida);
-	ida_destroy(&ddata->canfd_ida);
-	ida_destroy(&ddata->i2c_ida);
-	ida_destroy(&ddata->gpio_ida);
-	irq_domain_remove(ddata->domain);
-err_urb:
+err_device_exit:
+	nct6694_device_exit(dev);
+err_free_urb:
 	usb_free_urb(usb_data->int_urb);
 	return ret;
 }
@@ -437,11 +371,7 @@ static void nct6694_usb_disconnect(struct usb_interface *iface)
 
 	mfd_remove_devices(ddata->dev);
 	usb_kill_urb(usb_data->int_urb);
-	ida_destroy(&ddata->wdt_ida);
-	ida_destroy(&ddata->canfd_ida);
-	ida_destroy(&ddata->i2c_ida);
-	ida_destroy(&ddata->gpio_ida);
-	irq_domain_remove(ddata->domain);
+	nct6694_device_exit(ddata->dev);
 	usb_free_urb(usb_data->int_urb);
 }
 
diff --git a/include/linux/mfd/nct6694.h b/include/linux/mfd/nct6694.h
index 61155f9832b0..03296132ad34 100644
--- a/include/linux/mfd/nct6694.h
+++ b/include/linux/mfd/nct6694.h
@@ -91,6 +91,9 @@ struct nct6694 {
 	unsigned int irq_enable;
 };
 
+int nct6694_device_init(struct device *dev);
+void nct6694_device_exit(struct device *dev);
+
 int nct6694_usb_read_msg(struct nct6694 *ddata,
 			 const struct nct6694_cmd_header *cmd_hd,
 			 void *buf);
-- 
2.34.1

