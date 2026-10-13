Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 031394B8296
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 06:34:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791873249; cv=none; b=pRMK9U2ZTPCf748xSZyV5v2sbQ40bJCq1fVPd26bn+rM5x6Ur1y8cRQkWra5/MtQ5UOPhcptinIFQ/tQPpKsBmPkZ+8nK4svGbWOnkXQu2XpvZjdhNGGWw1Z19ZlBDIOqC+vqw6MBe/Zg2mSy9jx5JpUpGAl508qS6h2B5vBGJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791873249; c=relaxed/simple;
	bh=JjQkJblCxLEHJoYTnXXjJcEx2GuB3AABA3Ysd5Cg+Jo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=faGUX4Yz9TwOGVo/huUO7vvnZpWm3pmD0GJ8yISaTHEEJYoWhPnCU2h6QhUUAknVS8zQKG60F0wj+ZYt4AO8sSfi375SNBRc7rUgrnvyKg/G/CYe2+4xAO9WRONM6Zus6MrTQsa6bCiJT7AJJvgbpD/u7h4HNW4SSCtMdZC0Teg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PNEOI1QR; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PNEOI1QR"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2e5d0ee1951so16103025ad.0
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 23:34:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791873244; x=1792478044; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jSE5EP4Nv3Z2vM7Pj2yM4ay0TXqhMS/NF1UDQfbXKOg=;
        b=PNEOI1QRgH5xAInPGvPk6raeaRdk/2ENjFPCRF/PPvmXw2d7cIHRr8mXRfQDrG3lHM
         kZWjaGiBanvBZpFObC0OaQ9u2VBT1qXbYwQOSU54W7KvJyPOl30ZU08v4vyxl5AkXAgt
         eHBV9JcfCsiAn1u6g6p0GiOU3F85RKKVR8DotYtAUuiajr41EFqEI34yvzrOja8ayAnM
         zCrWBCvLn5h8RBtKdV2ew9/HPE32To51Vx0iLLSLuEHECORPcB6w4BbEfwfKaT1Gi0/j
         G4uChwlc13b8uhaW8jV5KJ9aojGB/lG6zMw+inU55wydoQw5DSKKkSos+jLcz6SxTY9e
         W0+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791873244; x=1792478044;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jSE5EP4Nv3Z2vM7Pj2yM4ay0TXqhMS/NF1UDQfbXKOg=;
        b=XKK+aqfpf7mnt9/a/XS7ANfyf33pxcvWwtmtMJ4iDMnbNWmJso6wgffGDqYJAXHXWt
         cL0fPD0rByUO5FBtsxbHD2JmxVc4SPT4uiL2fQJEMIIcrJtGP2R1qWfAf5xLprTrn3sS
         AYmVq8oLSHqNAkwK+4RcwHiINf4eONVGwd8LVSocIidYrcMsxzRdsPWiOqRS4AuJRJ4u
         VCt+nIrarJEA4WbCmuv0MLzccAzOVr3SJY0feMSC4JD6VVm3z9Ex7cJdH4maqy3gG8JT
         OoLyDXBmYhxKc2tuBYFRc7xkhEL0jrAWtRjXWrjvUQNMbrjbq9dqJZOiXPYu18CYj5Xg
         1rZw==
X-Gm-Message-State: AFq9FYIw9mmzkdvxJXAhswzrkJ7yL0PVYqViBEeSKecye3lvhmEtE9/3
	mLP+bvZZkPUtaAVIYDDN36EquSDwQIUtpsaObOiqhgi6TLfTH7b8aeAn
X-Gm-Gg: AYBFou0uiiDuVTHyqMl0ztYO+5bSTVXKgTAej70OgCjmQ1ghhVDDYfxbxxKcX3tAs5S
	aGHSBJgfx/UJhYgrjvcRwt/X6UwHt+yM+n1kAHZNfGt3UUa/UrKJXIkWCx5JLbJPPEyyZoalGmU
	W9mXQt3ayUgpOkgdWl+0MiqCpkIEHNDWYy6veYvH6kUPOte4g9RdnBKAuf24xzGYaJcu63gWOzi
	UG7XJegqzititz5kHjI1jCM8c0iSQdZKw56iu7P2ijWRuj0YvwItn6hxW3z+X8M0WZ3wkLbAhWl
	ija2vNK11JecRPD4yoEPteZg7EzLQtV3Yjn/lvFTRuN2kik+yFjEG1LmSjIhwYzgluUjQTUgVk8
	WEsib2QXHE33zVLEBes7EIsD23qEcWicvjkon6JrujoKTafEpQjG8mkA9ZgPSBG4tg1c2beNshI
	2VxfweSR6+ARcdSLtrfQv2us2TzMLS4BlWd4GueiN+k5Nhm+79o6DVwqBT2DMMElpExh6Fxs3Kj
	x6ySJIT4phMVQqvLs8APd2QqZbTXIZ8dsE5LM7N
X-Received: by 2002:a17:90b:384a:b0:3ab:39a5:1b5b with SMTP id 98e67ed59e1d1-3ab3a90e9ffmr10301058a91.17.1791873244102;
        Mon, 12 Oct 2026 23:34:04 -0700 (PDT)
Received: from hcdev-d520mt2.. (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab38f4863esm23169595a91.11.2026.10.12.23.34.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 23:34:03 -0700 (PDT)
From: a0282524688@gmail.com
To: lee@kernel.org,
	Ming Yu <tmyu0@nuvoton.com>
Cc: linux-kernel@vger.kernel.org,
	Ming Yu <a0282524688@gmail.com>,
	mfd@lists.linux.dev
Subject: [PATCH v9 09/12] mfd: nct6694: Extract core device management into a separate module
Date: Tue, 13 Oct 2026 14:32:55 +0800
Message-Id: <20261013063259.2734757-10-a0282524688@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261013063259.2734757-1-a0282524688@gmail.com>
References: <20261013063259.2734757-1-a0282524688@gmail.com>
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
Changes in v9:
- None.

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
index 737b17c917bb..bb60c711591e 100644
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

