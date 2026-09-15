Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBE8F434E35;
	Tue, 15 Sep 2026 17:04:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789491888; cv=none; b=pxt88T3WTVb61uUMuAXC5LmcXeWARApx+AIWtKPBBvUikEMDu7z7iRCQoD+bneSfQDUmXxwZENTOzWQpLUtJveoQNjs43iWTrIAETdM2GiB8oY80mVrUqmDGKkVfUj/Qn1jASS1Gc9gGUWikg8pDVUTlHmesT7x4n9xbJo7N8w4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789491888; c=relaxed/simple;
	bh=ZvdrOwwqXYaJ4nLjoBjjGsTwiAEfBe98pzyaZYatofs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=CQShBG+/U0y7mjthWNPePhlA7URGrfHusrJjHQq2sA2KjZ6naMVtOQZvLhiCO/Hh2U4aV8XfBK1g56dazIDTqX5EudCCSvUShY1hE2XcEXXT/JEfQTKnP72UEwJPOehQXPd6umowzvRfChinFCcyv9B/Tge4Twtbjv5m4kTfeT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=D4YUgcnX; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="D4YUgcnX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05AB81F000FF;
	Tue, 15 Sep 2026 17:04:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789491886;
	bh=ZMOe9jQZORyDutDHoepdFMs2501GlHON/WDUE2nY8s4=;
	h=From:Date:Subject:To:Cc;
	b=D4YUgcnXcQqVCPq4ShIL/mmOmAwu8Fmb2/koPIH7qP8rDCuhg7lBGSJiYTS2U0Xrx
	 W30ZDNXpMHYTof8qHp+2Dfw0MeiIZPplvB3kRhPqXgm6qtSt67ZG0dkswuS2hvafiL
	 oVQIXdgq2iRg/6Yx8Q6MKs5U2IU1p7a6UOo8Mjt0F7vsiIqZ2YYIgqRN1iEJSmM2y5
	 8CXo8QJ0aYLMy93GiSBGgZDQdUtCrpoSKlHFY2oaIfHYlwEYc9WYkdxx3Req4G+N8N
	 tGHFnF/h4u0ylFr1bjB+i00CYQwwpoSfI/Y19xI+aPxYfxlspgICfCiQQzcHq7Xsrd
	 HutQEict20Dww==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Tue, 15 Sep 2026 19:04:10 +0200
Subject: [PATCH] thunderbolt: Make PCIe NHI support opt-in
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260915-topic-tbt_pcie_optional-v1-1-47c4a3d129bd@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQqDMBBG4avIrBvQWJX2KkUkxj/tlGJCMoog3
 r1pXX6L93ZKiIxE92KniJUT+zmjuhRkX2Z+QvGUTbrUbXmrGiU+sFUyyhAsY/BBcmE+ShvXTuh
 w7VxNuQ4Rjrf/+dGfTsv4hpXfjo7jC5hsf5J7AAAA
X-Change-ID: 20260915-topic-tbt_pcie_optional-2af6de7e47f3
To: Andreas Noever <andreas.noever@gmail.com>, 
 Mika Westerberg <westeri@kernel.org>, 
 Yehezkel Bernat <YehezkelShB@gmail.com>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
 usb4-upstream@oss.qualcomm.com, 
 Raghavendra Thoorpu <rthoorpu@qti.qualcomm.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789491883; l=16531;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=Q4lGGUIVmpG6Yn4ZRFhLRWKmZPRO4PZMoZSUDGVKubU=;
 b=Rj2uWyzMztemKqmCT8h0lLuDN8ORn1tLy5PGz76dMFcYzSSn1fOpOj1FAVWWS7FrgY0O3ls1O
 jmE0nulVFXrAhRMbjYRe8avSYV03jeiT5MHSUkl2W+pZN1h4zL0rpjm
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

With more implementations coming in, one may desire not to enable
support for the PCIe-attached NHIs. Allow it to be built as a module
atop the framework.

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
The diff came out a little messy.. compile-tested with CONFIG_PCI=n and
tested USB4_PCIE=m/=y on a NUC with an Alpine Ridge controller
---
 drivers/thunderbolt/Kconfig   | 11 ++++++++++-
 drivers/thunderbolt/Makefile  |  7 +++++--
 drivers/thunderbolt/ctl.c     |  6 +++++-
 drivers/thunderbolt/domain.c  | 14 ++++++++++++--
 drivers/thunderbolt/nhi.c     | 18 +++++++++++-------
 drivers/thunderbolt/nhi.h     |  2 ++
 drivers/thunderbolt/pci.c     | 39 ++++++++++++++-------------------------
 drivers/thunderbolt/switch.c  |  9 +++++++++
 drivers/thunderbolt/tb.h      |  2 --
 drivers/thunderbolt/tunnel.c  |  1 +
 drivers/thunderbolt/xdomain.c |  5 +++++
 11 files changed, 74 insertions(+), 40 deletions(-)

diff --git a/drivers/thunderbolt/Kconfig b/drivers/thunderbolt/Kconfig
index 294b3227a545..81fca3bfcdd7 100644
--- a/drivers/thunderbolt/Kconfig
+++ b/drivers/thunderbolt/Kconfig
@@ -1,7 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0-only
 menuconfig USB4
 	tristate "Unified support for USB4 and Thunderbolt"
-	depends on PCI
 	select APPLE_PROPERTIES if EFI_STUB && X86
 	select CRC32
 	select CRYPTO_LIB_SHA256
@@ -18,6 +17,16 @@ menuconfig USB4
 
 if USB4
 
+config USB4_PCIE
+	depends on PCI
+	tristate "Support for PCIe-attached USB4 and Thunderbolt controllers"
+	help
+	  Say Y here to add support for the USB4 and Thunderbolt host
+	  routers attached over the PCIe bus, commonly found on x86 PCs.
+
+	  To compile this driver a module, choose M here. The module will be
+	  called thunderbolt_pcie.
+
 config USB4_CONFIGFS
 	def_tristate USB4
 	depends on CONFIGFS_FS && !(USB4=y && CONFIGFS_FS=m)
diff --git a/drivers/thunderbolt/Makefile b/drivers/thunderbolt/Makefile
index beb054c3126b..fc808c6b23e6 100644
--- a/drivers/thunderbolt/Makefile
+++ b/drivers/thunderbolt/Makefile
@@ -1,10 +1,13 @@
 # SPDX-License-Identifier: GPL-2.0-only
 ccflags-y := -I$(src)
 obj-${CONFIG_USB4} := thunderbolt.o
-thunderbolt-objs := nhi.o ctl.o tb.o switch.o cap.o pci.o path.o tunnel.o eeprom.o
-thunderbolt-objs += domain.o dma_port.o icm.o property.o xdomain.o lc.o tmu.o usb4.o
+thunderbolt-objs := nhi.o ctl.o tb.o switch.o cap.o path.o tunnel.o eeprom.o
+thunderbolt-objs += domain.o dma_port.o property.o xdomain.o lc.o tmu.o usb4.o
 thunderbolt-objs += usb4_port.o nvm.o retimer.o quirks.o clx.o
 
+obj-${CONFIG_USB4_PCIE} += thunderbolt_pcie.o
+thunderbolt_pcie-y := pci.o icm.o
+
 thunderbolt-${CONFIG_ACPI} += acpi.o
 thunderbolt-$(CONFIG_DEBUG_FS) += debugfs.o
 thunderbolt-$(CONFIG_USB4_CONFIGFS) += configfs.o
diff --git a/drivers/thunderbolt/ctl.c b/drivers/thunderbolt/ctl.c
index 965988b18608..96717a0a94b1 100644
--- a/drivers/thunderbolt/ctl.c
+++ b/drivers/thunderbolt/ctl.c
@@ -9,7 +9,6 @@
 #include <linux/crc32.h>
 #include <linux/delay.h>
 #include <linux/slab.h>
-#include <linux/pci.h>
 #include <linux/dmapool.h>
 #include <linux/workqueue.h>
 
@@ -96,6 +95,7 @@ struct tb_cfg_request *tb_cfg_request_alloc(void)
 
 	return req;
 }
+EXPORT_SYMBOL_GPL(tb_cfg_request_alloc);
 
 /**
  * tb_cfg_request_get() - Increase refcount of a request
@@ -128,6 +128,7 @@ void tb_cfg_request_put(struct tb_cfg_request *req)
 	kref_put(&req->kref, tb_cfg_request_destroy);
 	mutex_unlock(&tb_cfg_request_lock);
 }
+EXPORT_SYMBOL_GPL(tb_cfg_request_put);
 
 static int tb_cfg_request_enqueue(struct tb_ctl *ctl,
 				  struct tb_cfg_request *req)
@@ -575,6 +576,7 @@ int tb_cfg_request(struct tb_ctl *ctl, struct tb_cfg_request *req,
 	tb_cfg_request_dequeue(req);
 	return ret;
 }
+EXPORT_SYMBOL_GPL(tb_cfg_request);
 
 /**
  * tb_cfg_request_cancel() - Cancel a control request
@@ -634,6 +636,7 @@ struct tb_cfg_result tb_cfg_request_sync(struct tb_ctl *ctl,
 
 	return req->result;
 }
+EXPORT_SYMBOL_GPL(tb_cfg_request_sync);
 
 /* public interface, alloc/start/stop/free */
 
@@ -1009,6 +1012,7 @@ struct tb_cfg_result tb_cfg_read_raw(struct tb_ctl *ctl, void *buffer,
 		memcpy(buffer, &reply.data, 4 * length);
 	return res;
 }
+EXPORT_SYMBOL_GPL(tb_cfg_read_raw);
 
 /**
  * tb_cfg_write_raw() - write from buffer into config space
diff --git a/drivers/thunderbolt/domain.c b/drivers/thunderbolt/domain.c
index 12c88509a54f..1c76fd8151ca 100644
--- a/drivers/thunderbolt/domain.c
+++ b/drivers/thunderbolt/domain.c
@@ -313,6 +313,7 @@ const struct bus_type tb_bus_type = {
 	.remove = tb_service_remove,
 	.shutdown = tb_service_shutdown,
 };
+EXPORT_SYMBOL_GPL(tb_bus_type);
 
 static void tb_domain_release(struct device *dev)
 {
@@ -421,6 +422,7 @@ struct tb *tb_domain_alloc(struct tb_nhi *nhi, int timeout_msec, size_t privsize
 
 	return NULL;
 }
+EXPORT_SYMBOL_GPL(tb_domain_alloc);
 
 /**
  * tb_domain_add() - Add domain to the system
@@ -514,6 +516,7 @@ void tb_domain_remove(struct tb *tb)
 
 	device_unregister(&tb->dev);
 }
+EXPORT_SYMBOL_GPL(tb_domain_remove);
 
 /**
  * tb_domain_suspend_noirq() - Suspend a domain
@@ -904,8 +907,9 @@ int tb_domain_unregister_unplugged_xdomains(struct tb *tb)
 
 	return ctx.n;
 }
+EXPORT_SYMBOL_GPL(tb_domain_unregister_unplugged_xdomains);
 
-int tb_domain_init(void)
+static int __init tb_domain_init(void)
 {
 	int ret;
 
@@ -931,7 +935,7 @@ int tb_domain_init(void)
 	return ret;
 }
 
-void tb_domain_exit(void)
+static void __exit tb_domain_exit(void)
 {
 	bus_unregister(&tb_bus_type);
 	ida_destroy(&tb_domain_ida);
@@ -941,3 +945,9 @@ void tb_domain_exit(void)
 	tb_debugfs_exit();
 	tb_configfs_exit();
 }
+
+postcore_initcall(tb_domain_init);
+module_exit(tb_domain_exit);
+
+MODULE_DESCRIPTION("Thunderbolt/USB4 core driver");
+MODULE_LICENSE("GPL");
diff --git a/drivers/thunderbolt/nhi.c b/drivers/thunderbolt/nhi.c
index 020db5a1f029..9b1165b2a484 100644
--- a/drivers/thunderbolt/nhi.c
+++ b/drivers/thunderbolt/nhi.c
@@ -548,6 +548,7 @@ irqreturn_t ring_msix(int irq, void *data)
 
 	return IRQ_HANDLED;
 }
+EXPORT_SYMBOL_GPL(ring_msix);
 
 static int nhi_alloc_hop(struct tb_nhi *nhi, struct tb_ring *ring)
 {
@@ -1001,6 +1002,7 @@ int nhi_mailbox_cmd(struct tb_nhi *nhi, enum nhi_mailbox_cmd cmd, u32 data)
 
 	return 0;
 }
+EXPORT_SYMBOL_GPL(nhi_mailbox_cmd);
 
 /**
  * nhi_mailbox_mode() - Return current firmware operation mode
@@ -1021,6 +1023,7 @@ enum nhi_fw_mode nhi_mailbox_mode(struct tb_nhi *nhi)
 
 	return (enum nhi_fw_mode)val;
 }
+EXPORT_SYMBOL_GPL(nhi_mailbox_mode);
 
 void nhi_interrupt_work(struct work_struct *work)
 {
@@ -1071,6 +1074,7 @@ void nhi_interrupt_work(struct work_struct *work)
 	}
 	spin_unlock_irq(&nhi->lock);
 }
+EXPORT_SYMBOL_GPL(nhi_interrupt_work);
 
 irqreturn_t nhi_msi(int irq, void *data)
 {
@@ -1078,6 +1082,7 @@ irqreturn_t nhi_msi(int irq, void *data)
 	schedule_work(&nhi->interrupt_work);
 	return IRQ_HANDLED;
 }
+EXPORT_SYMBOL_GPL(nhi_msi);
 
 static int __nhi_suspend_noirq(struct device *dev, bool wakeup)
 {
@@ -1235,6 +1240,7 @@ void nhi_shutdown(struct tb_nhi *nhi)
 	if (nhi->ops->shutdown)
 		nhi->ops->shutdown(nhi);
 }
+EXPORT_SYMBOL_GPL(nhi_shutdown);
 
 static void nhi_reset(struct tb_nhi *nhi)
 {
@@ -1292,6 +1298,7 @@ void nhi_reset_interface(struct tb_nhi *nhi)
 	/* Wait for tHIReset (10 ms) to complete */
 	usleep_range(10000, 20000);
 }
+EXPORT_SYMBOL_GPL(nhi_reset_interface);
 
 static struct tb *nhi_select_cm(struct tb_nhi *nhi)
 {
@@ -1302,13 +1309,8 @@ static struct tb *nhi_select_cm(struct tb_nhi *nhi)
 	 * USB4 case is simple. If we got control of any of the
 	 * capabilities, we use software CM.
 	 */
-	if (!tb_acpi_is_native()) {
-		/*
-		 * Either firmware based CM is running (we did not get
-		 * control from the firmware) or this is pre-USB4 PC so
-		 * try first firmware CM and then fallback to software CM.
-		 */
-		tb = icm_probe(nhi);
+	if (!tb_acpi_is_native() && nhi->ops->select_cm) {
+		tb = nhi->ops->select_cm(nhi);
 		if (tb)
 			return tb;
 	}
@@ -1411,6 +1413,7 @@ int nhi_probe(struct tb_nhi *nhi)
 
 	return 0;
 }
+EXPORT_SYMBOL_GPL(nhi_probe);
 
 /*
  * The tunneled pci bridges are siblings of us. Use resume_noirq to reenable
@@ -1433,3 +1436,4 @@ const struct dev_pm_ops nhi_pm_ops = {
 	.runtime_suspend = nhi_runtime_suspend,
 	.runtime_resume = nhi_runtime_resume,
 };
+EXPORT_SYMBOL_GPL(nhi_pm_ops);
diff --git a/drivers/thunderbolt/nhi.h b/drivers/thunderbolt/nhi.h
index b2e2e2c413b2..475ee8615edf 100644
--- a/drivers/thunderbolt/nhi.h
+++ b/drivers/thunderbolt/nhi.h
@@ -56,6 +56,7 @@ extern const struct dev_pm_ops nhi_pm_ops;
  * @is_present: Whether the device is currently present on the parent bus
  * @init_interrupts: NHI specific interrupt initialization hook
  * @reset_interface: Resets the host interface
+ * @select_cm: optional hook to select a custom CM
  */
 struct tb_nhi_ops {
 	int (*init)(struct tb_nhi *nhi);
@@ -72,6 +73,7 @@ struct tb_nhi_ops {
 	bool (*is_present)(struct tb_nhi *nhi);
 	int (*init_interrupts)(struct tb_nhi *nhi);
 	void (*reset_interface)(struct tb_nhi *nhi);
+	struct tb * (*select_cm)(struct tb_nhi *nhi);
 };
 
 /*
diff --git a/drivers/thunderbolt/pci.c b/drivers/thunderbolt/pci.c
index e40d4d6af071..f215ef7aa336 100644
--- a/drivers/thunderbolt/pci.c
+++ b/drivers/thunderbolt/pci.c
@@ -348,6 +348,16 @@ static bool nhi_pci_is_present(struct tb_nhi *nhi)
 	return pci_device_is_present(to_pci_dev(nhi->dev));
 }
 
+static struct tb *nhi_pci_select_cm(struct tb_nhi *nhi)
+{
+	/*
+	 * Either the firmware-based CM is running (we did not get
+	 * control from the firmware) or this is a pre-USB4 PC, so
+	 * first try using the firmware CM and then fallback to software CM.
+	 */
+	return icm_probe(nhi);
+}
+
 static const struct tb_nhi_ops pci_nhi_default_ops = {
 	.add_links = nhi_pci_add_links,
 	.pre_nvm_auth = nhi_pci_start_dma_port,
@@ -358,6 +368,7 @@ static const struct tb_nhi_ops pci_nhi_default_ops = {
 	.is_present = nhi_pci_is_present,
 	.init_interrupts = nhi_pci_init_msi,
 	.reset_interface = nhi_reset_interface,
+	.select_cm = nhi_pci_select_cm,
 };
 
 /* Ice Lake specific NHI operations */
@@ -577,6 +588,7 @@ static const struct tb_nhi_ops icl_nhi_ops = {
 	.is_present = nhi_pci_is_present,
 	.init_interrupts = nhi_pci_init_msi,
 	.reset_interface = nhi_reset_interface,
+	.select_cm = nhi_pci_select_cm,
 };
 
 static int nhi_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
@@ -738,7 +750,7 @@ static struct pci_device_id nhi_ids[] = {
 };
 
 MODULE_DEVICE_TABLE(pci, nhi_ids);
-MODULE_DESCRIPTION("Thunderbolt/USB4 core driver");
+MODULE_DESCRIPTION("PCIe-attached Thunderbolt/USB4 host interface driver");
 MODULE_LICENSE("GPL");
 
 static struct pci_driver nhi_driver = {
@@ -749,27 +761,4 @@ static struct pci_driver nhi_driver = {
 	.shutdown = nhi_pci_shutdown,
 	.driver.pm = &nhi_pm_ops,
 };
-
-static int __init nhi_init(void)
-{
-	int ret;
-
-	ret = tb_domain_init();
-	if (ret)
-		return ret;
-
-	ret = pci_register_driver(&nhi_driver);
-	if (ret)
-		tb_domain_exit();
-
-	return ret;
-}
-
-static void __exit nhi_unload(void)
-{
-	pci_unregister_driver(&nhi_driver);
-	tb_domain_exit();
-}
-
-rootfs_initcall(nhi_init);
-module_exit(nhi_unload);
+module_pci_driver(nhi_driver)
diff --git a/drivers/thunderbolt/switch.c b/drivers/thunderbolt/switch.c
index d22d8db8f890..7ff3da79da76 100644
--- a/drivers/thunderbolt/switch.c
+++ b/drivers/thunderbolt/switch.c
@@ -2396,6 +2396,7 @@ const struct device_type tb_switch_type = {
 	.uevent = tb_switch_uevent,
 	.pm = &tb_switch_pm_ops,
 };
+EXPORT_SYMBOL_GPL(tb_switch_type);
 
 static int tb_switch_get_generation(struct tb_switch *sw)
 {
@@ -2571,6 +2572,7 @@ struct tb_switch *tb_switch_alloc(struct tb *tb, struct device *parent,
 
 	return ERR_PTR(ret);
 }
+EXPORT_SYMBOL_GPL(tb_switch_alloc);
 
 /**
  * tb_switch_alloc_safe_mode() - allocate a switch that is in safe mode
@@ -2610,6 +2612,7 @@ tb_switch_alloc_safe_mode(struct tb *tb, struct device *parent, u64 route)
 
 	return sw;
 }
+EXPORT_SYMBOL_GPL(tb_switch_alloc_safe_mode);
 
 /**
  * tb_switch_configure() - Uploads configuration to the switch
@@ -3438,6 +3441,7 @@ int tb_switch_add(struct tb_switch *sw)
 
 	return ret;
 }
+EXPORT_SYMBOL_GPL(tb_switch_add);
 
 /**
  * tb_switch_remove() - Remove and release a switch
@@ -3483,6 +3487,7 @@ void tb_switch_remove(struct tb_switch *sw)
 		dev_info(&sw->dev, "device disconnected\n");
 	device_unregister(&sw->dev);
 }
+EXPORT_SYMBOL_GPL(tb_switch_remove);
 
 /**
  * tb_sw_set_unplugged() - set is_unplugged on switch and downstream switches
@@ -3828,6 +3833,7 @@ struct tb_switch *tb_switch_find_by_link_depth(struct tb *tb, u8 link, u8 depth)
 
 	return NULL;
 }
+EXPORT_SYMBOL_GPL(tb_switch_find_by_link_depth);
 
 /**
  * tb_switch_find_by_uuid() - Find switch by UUID
@@ -3854,6 +3860,7 @@ struct tb_switch *tb_switch_find_by_uuid(struct tb *tb, const uuid_t *uuid)
 
 	return NULL;
 }
+EXPORT_SYMBOL_GPL(tb_switch_find_by_uuid);
 
 /**
  * tb_switch_find_by_route() - Find switch by route string
@@ -3883,6 +3890,7 @@ struct tb_switch *tb_switch_find_by_route(struct tb *tb, u64 route)
 
 	return NULL;
 }
+EXPORT_SYMBOL_GPL(tb_switch_find_by_route);
 
 /**
  * tb_switch_find_port() - return the first port of @type on @sw or NULL
@@ -3903,6 +3911,7 @@ struct tb_port *tb_switch_find_port(struct tb_switch *sw,
 
 	return NULL;
 }
+EXPORT_SYMBOL_GPL(tb_switch_find_port);
 
 /*
  * Can be used for read/write a specified PCIe bridge for any Thunderbolt 3
diff --git a/drivers/thunderbolt/tb.h b/drivers/thunderbolt/tb.h
index c112954ce3fd..12dad4097a8f 100644
--- a/drivers/thunderbolt/tb.h
+++ b/drivers/thunderbolt/tb.h
@@ -768,8 +768,6 @@ extern const struct device_type tb_retimer_type;
 extern const struct device_type tb_switch_type;
 extern const struct device_type usb4_port_device_type;
 
-int tb_domain_init(void);
-void tb_domain_exit(void);
 int tb_xdomain_init(void);
 void tb_xdomain_exit(void);
 
diff --git a/drivers/thunderbolt/tunnel.c b/drivers/thunderbolt/tunnel.c
index ffd2d04b3bfa..fdaff55baead 100644
--- a/drivers/thunderbolt/tunnel.c
+++ b/drivers/thunderbolt/tunnel.c
@@ -273,6 +273,7 @@ void tb_tunnel_event(struct tb *tb, enum tb_tunnel_event event,
 	kfree(envp[1]);
 	kfree(envp[0]);
 }
+EXPORT_SYMBOL_GPL(tb_tunnel_event);
 
 static inline void tb_tunnel_set_active(struct tb_tunnel *tunnel, bool active)
 {
diff --git a/drivers/thunderbolt/xdomain.c b/drivers/thunderbolt/xdomain.c
index b187a60663f5..af82b86a0348 100644
--- a/drivers/thunderbolt/xdomain.c
+++ b/drivers/thunderbolt/xdomain.c
@@ -86,6 +86,7 @@ bool tb_is_xdomain_enabled(void)
 {
 	return tb_xdomain_enabled && tb_acpi_is_xdomain_allowed();
 }
+EXPORT_SYMBOL_GPL(tb_is_xdomain_enabled);
 
 static bool tb_xdomain_match(const struct tb_cfg_request *req,
 			     const struct ctl_pkg *pkg)
@@ -2196,6 +2197,7 @@ struct tb_xdomain *tb_xdomain_alloc(struct tb *tb, struct device *parent,
 
 	return NULL;
 }
+EXPORT_SYMBOL_GPL(tb_xdomain_alloc);
 
 /**
  * tb_xdomain_add() - Add XDomain to the bus
@@ -2211,6 +2213,7 @@ void tb_xdomain_add(struct tb_xdomain *xd)
 	/* Start exchanging properties with the other host */
 	start_handshake(xd);
 }
+EXPORT_SYMBOL_GPL(tb_xdomain_add);
 
 static int unregister_service(struct device *dev, void *data)
 {
@@ -2270,6 +2273,7 @@ void tb_xdomain_unregister(struct tb_xdomain *xd)
 	dev_info(&xd->dev, "host disconnected\n");
 	device_unregister(&xd->dev);
 }
+EXPORT_SYMBOL_GPL(tb_xdomain_remove);
 
 /**
  * tb_xdomain_lane_bonding_enable() - Enable lane bonding on XDomain
@@ -2593,6 +2597,7 @@ struct tb_xdomain *tb_xdomain_find_by_link_depth(struct tb *tb, u8 link,
 	xd = switch_find_xdomain(tb->root_switch, &lookup);
 	return tb_xdomain_get(xd);
 }
+EXPORT_SYMBOL_GPL(tb_xdomain_find_by_link_depth);
 
 /**
  * tb_xdomain_find_by_route() - Find an XDomain by route string

---
base-commit: 1a1de54f7369cd2b5bac0f265910e60ad3a6b4c3
change-id: 20260915-topic-tbt_pcie_optional-2af6de7e47f3

Best regards,
--  
Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

