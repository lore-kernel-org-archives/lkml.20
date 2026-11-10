Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=60.244.123.138
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794311391;
	b=P5pzW7JLR7qzCPxNd1eSFZjTt1N2EqzW11VI1G8HUc+fWOYT4mCkBpipOxf2UTKzGn9N
	 mVpVSC6QR1mX2KY+uC0pp5xqoGZTjSBMK61Rj9OqZn6/creTMyIA5U0i/1ENAonfbhSnu
	 IPNxmwgymJnerJHykK81IAXmbH5/7GUlDDwJsHw+OpPHfSbv1UGuvwIihla/XnL1mkKax
	 M99QmyZ2AlXf1iZ78G6NEzrFbSwAY4NZxQSxlVZXMolFDTI7u/Zcu2LdLQcSVa5tlI/zZ
	 Jox0S4nSG6MNwz9plqIGwQWOA0jha+JpSpRnT6A+AadglzZ9mKf1PBpZ/33r4ppRgAA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794311391;
	h=DMARC-Filter:X-UUID:DKIM-Signature:X-CID-P-RULE:X-CID-O-INFO:
	 X-CID-META:X-CID-BVR:X-CID-BAS:X-CID-FACTOR:X-CID-RHF:X-UUID:Received:
	 Received:Received:From:To:CC:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:
	 Content-Type:X-MTK;
	bh=9bPyGKj5EoonbYmsf3p5oTJawnP3BXim6BPgdU5RcTo=;
	b=cN/msdUF+FrMGtOJKFxMYzT3/M3r9qXNkQJclhJTm/NMRXpBnd2CRFKkGPqRaoAzD0Rz
	 9gE/FHzCXdPY2f6eHzTCl+PnS+Y2XgvfZ9xOInmDPvoyDotNgjQ25mSMjkF8NWawZX0Wr
	 JryLP+d21kTN26fnik445i7TIqTnjuxGmXeaoH+HOe9+0piVYJa+arwnKlTqMTMRUwsVi
	 wVp44QCG76H/7aXUa6OoWDqumc6rmsSrgiYivBda+rW95dHRAx6jMT3gjMBshx2xmsWm6
	 qG98WvjVMVnhe14R0QsahZbYtI4p7VBcylm0xM5xXQysbeSWvIY+SrOx8FRULdC7jqQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mediatek.com;
	spf=pass smtp.mailfrom=mediatek.com;
	dkim=pass header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b="Rm/5N78V";
	arc=none smtp.remote-ip=60.244.123.138
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45316606A32E;
	Tue, 10 Nov 2026 11:49:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 45316606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=Rm/5N78V
X-UUID: d2a7cd72dcfc11f1b1788b6acf885367-20261110
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=9bPyGKj5EoonbYmsf3p5oTJawnP3BXim6BPgdU5RcTo=;
	b=Rm/5N78VkzL00bJxgDT0XSOpyaqv2XvBZ/9CXvwsVPqOyuUCEilYcTvycdBH4EgXvha58OvtA6pzqUzvIIffxNhd6HszqMRlhC1BgOe4MWt6bUeNAUERDrV1u6ZR2jf2aBgaAf/wzzUAsADQ9fo5pujtmR40aLp/Yv9wnbVH1Lo=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.21,REQID:05858302-5bc3-47cc-922b-669ae7e5b612,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:b0318ac,CLOUDID:04221966-4b51-4c95-bb1b-80ac6aad9c96,B
	ulkID:nil,BulkQuantity:0,SF:81|82|102|836|865|888|898,TC:-5,Content:0|15|5
	0|99,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0
	,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: d2a7cd72dcfc11f1b1788b6acf885367-20261110
Received: from mtkmbs09n1.mediatek.inc [(172.21.101.35)] by mailgw01.mediatek.com
	(envelope-from <chunfeng.yun@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1136918857; Tue, 10 Nov 2026 19:49:44 +0800
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 10 Nov 2026 19:49:43 +0800
Received: from gcnsap21.gcn.mediatek.inc (10.17.81.22) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Tue, 10 Nov 2026 19:49:43 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Mika Westerberg <westeri@kernel.org>
CC: Andreas Noever <andreas.noever@gmail.com>, Konrad Dybcio
	<konrad.dybcio@oss.qualcomm.com>, Sven Peter <sven@kernel.org>, Yehezkel
 Bernat <YehezkelShB@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, <linux-kernel@vger.kernel.org>,
	<linux-usb@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, Chunfeng Yun
	<chunfeng.yun@mediatek.com>
Subject: [PATCH v2 4/7] thunderbolt: add platform NHI driver
Date: Tue, 10 Nov 2026 19:48:52 +0800
Message-ID: <20261110114925.722014-5-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261110114925.722014-1-chunfeng.yun@mediatek.com>
References: <20261110114925.722014-1-chunfeng.yun@mediatek.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N

Historically, the Thunderbolt/USB4 Native Host Interface (NHI)
controller has been exposed as a PCI device handled by
drivers/thunderbolt/pci.c. However, some SoCs (such as MediaTek
mt8901/mt8992) integrate the NHI as a memory-mapped platform device
described via Device Tree or ACPI.

To support platform-attached NHI controllers:

Introduce platform.c to register a platform driver matching
"usb4-nhi-platform" (OF) and "ACPI0015" (ACPI);
Implement platform tb_nhi_ops hooks for pm, interrupts related;

Support an optional dedicated wake interrupt: on integrated SoCs,
the MAC/PHY reside in a power domain whose clocks and power can be
gated during sleep, preventing the primary NHI interrupt from
acting as a wakeup source; so add an optional dedicated wakeup
interrupt which comes from the always-on power domain.

Clean up the unused nhi_enable_int_throttling() prototype.

Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
v2 changes:
* Added CONFIG_USB4_PLATFORM to build the platform driver as a separate
  module (thunderbolt_platform.ko), instead of statically embedding it
  into thunderbolt.o.
* Renamed plat.c to platform.c, renamed internal functions from nhi_plat_*
  to nhi_platform_*, and updated the Device Tree compatible string from
  "thunderbolt-platform" to "usb4-nhi-platform".
* Removed domain lifecycle changes (domain.c) and PCI driver cleanups
  (pci.c) from this patch, handled by previous patches.
* Squashed the optional dedicated wake IRQ support (previously a separate
  patch in v1) directly into this patch.
* Replaced the custom local ISR with the shared tb_nhi_isr(), adopted
  the renamed tb_nhi_probe() / tb_nhi_shutdown() / tb_nhi_pm_ops
  interfaces, and added -EPROBE_DEFER handling for the wake IRQ.
---
 drivers/thunderbolt/Kconfig    |   9 ++
 drivers/thunderbolt/Makefile   |   3 +
 drivers/thunderbolt/nhi.h      |   1 -
 drivers/thunderbolt/pci.c      |   1 +
 drivers/thunderbolt/platform.c | 172 +++++++++++++++++++++++++++++++++
 include/linux/thunderbolt.h    |   4 +
 6 files changed, 189 insertions(+), 1 deletion(-)
 create mode 100644 drivers/thunderbolt/platform.c

diff --git a/drivers/thunderbolt/Kconfig b/drivers/thunderbolt/Kconfig
index 605af440457a..846ab51df7ab 100644
--- a/drivers/thunderbolt/Kconfig
+++ b/drivers/thunderbolt/Kconfig
@@ -27,6 +27,15 @@ config USB4_PCI
 	  To compile this driver a module, choose M here. The module will be
 	  called thunderbolt_pci.
 
+config USB4_PLATFORM
+	tristate "Support for platform USB4 and Thunderbolt controllers"
+	help
+	  Say Y here to add support the USB4 and Thunderbolt host routers
+	  for a platform device on such as ARM64 SoCs.
+
+	  To compile this driver a module, choose M here. The module will be
+	  called thunderbolt_platform.
+
 config USB4_CONFIGFS
 	def_tristate USB4
 	depends on CONFIGFS_FS && !(USB4=y && CONFIGFS_FS=m)
diff --git a/drivers/thunderbolt/Makefile b/drivers/thunderbolt/Makefile
index a563bf2b0345..334fa4ebdfc8 100644
--- a/drivers/thunderbolt/Makefile
+++ b/drivers/thunderbolt/Makefile
@@ -8,6 +8,9 @@ thunderbolt-objs += usb4_port.o nvm.o retimer.o quirks.o clx.o
 obj-${CONFIG_USB4_PCI} += thunderbolt_pci.o
 thunderbolt_pci-y := pci.o icm.o
 
+obj-${CONFIG_USB4_PLATFORM} += thunderbolt_platform.o
+thunderbolt_platform-y := platform.o
+
 thunderbolt-${CONFIG_ACPI} += acpi.o
 thunderbolt-$(CONFIG_DEBUG_FS) += debugfs.o
 thunderbolt-$(CONFIG_USB4_CONFIGFS) += configfs.o
diff --git a/drivers/thunderbolt/nhi.h b/drivers/thunderbolt/nhi.h
index 65f9daf36068..ef5d24d81251 100644
--- a/drivers/thunderbolt/nhi.h
+++ b/drivers/thunderbolt/nhi.h
@@ -27,7 +27,6 @@ enum nhi_mailbox_cmd {
 	NHI_MAILBOX_ALLOW_ALL_DEVS = 0x23,
 };
 
-void nhi_enable_int_throttling(struct tb_nhi *nhi);
 void nhi_disable_interrupts(struct tb_nhi *nhi);
 irqreturn_t tb_nhi_isr(int irq, void *data);
 irqreturn_t tb_ring_msix(int irq, void *data);
diff --git a/drivers/thunderbolt/pci.c b/drivers/thunderbolt/pci.c
index 9379c598a221..698f47ec63da 100644
--- a/drivers/thunderbolt/pci.c
+++ b/drivers/thunderbolt/pci.c
@@ -736,4 +736,5 @@ static struct pci_driver nhi_driver = {
 	.shutdown = nhi_pci_shutdown,
 	.driver.pm = &tb_nhi_pm_ops,
 };
+
 module_pci_driver(nhi_driver);
diff --git a/drivers/thunderbolt/platform.c b/drivers/thunderbolt/platform.c
new file mode 100644
index 000000000000..3562b6c7ea7d
--- /dev/null
+++ b/drivers/thunderbolt/platform.c
@@ -0,0 +1,172 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Thunderbolt driver - NHI driver (Platform bus specific implementation)
+ *
+ * Author: Chunfeng Yun <chunfeng.yun@mediatek.com>
+ */
+
+#include <linux/acpi.h>
+#include <linux/interrupt.h>
+#include <linux/errno.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
+#include <linux/pm_wakeirq.h>
+#include <linux/slab.h>
+
+#include "nhi.h"
+#include "tb.h"
+
+static int nhi_platform_init(struct tb_nhi *nhi)
+{
+	/* avoid device link fail for pcie tunnel */
+	pm_runtime_set_active(nhi->dev);
+	pm_runtime_get_noresume(nhi->dev);
+	pm_runtime_enable(nhi->dev);
+
+	device_set_wakeup_capable(nhi->dev, true);
+	device_enable_async_suspend(nhi->dev);
+
+	return 0;
+}
+
+static void nhi_platform_clear_wake_irq(void *dev)
+{
+	dev_pm_clear_wake_irq(dev);
+}
+
+static int nhi_platform_init_irq(struct tb_nhi *nhi)
+{
+	struct device *dev = nhi->dev;
+	int ret;
+
+	ret = devm_request_irq(dev, nhi->irq, tb_nhi_isr, IRQF_NO_SUSPEND,
+			       dev_name(dev), nhi);
+	if (ret)
+		return dev_err_probe(dev, ret, "request irq failed\n");
+
+	if (nhi->wake_irq) {
+		ret = dev_pm_set_dedicated_wake_irq(dev, nhi->wake_irq);
+		if (ret) {
+			return dev_err_probe(dev, ret, "set wake irq %d failed\n", nhi->wake_irq);
+		}
+
+		dev_info(dev, "wake irq %d\n", nhi->wake_irq);
+
+		ret = devm_add_action_or_reset(dev, nhi_platform_clear_wake_irq, dev);
+	}
+
+	return ret;
+}
+
+static void nhi_platform_exit(struct tb_nhi *nhi)
+{
+	devm_free_irq(nhi->dev, nhi->irq, nhi);
+	flush_work(&nhi->interrupt_work);
+
+	pm_runtime_put_noidle(nhi->dev);
+	pm_runtime_disable(nhi->dev);
+	pm_runtime_set_suspended(nhi->dev);
+}
+
+static const struct tb_nhi_ops nhi_platform_default_ops = {
+	.init = nhi_platform_init,
+	.shutdown = nhi_platform_exit,
+	.init_interrupts = nhi_platform_init_irq,
+};
+
+static int nhi_platform_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct tb_nhi *nhi;
+
+	nhi = devm_kzalloc(dev, sizeof(*nhi), GFP_KERNEL);
+	if (!nhi)
+		return -ENOMEM;
+
+	nhi->dev = dev;
+	nhi->ops = &nhi_platform_default_ops;
+
+	nhi->iobase = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(nhi->iobase))
+		return PTR_ERR(nhi->iobase);
+
+	nhi->irq = platform_get_irq(pdev, 0);
+	if (nhi->irq < 0)
+		return nhi->irq;
+
+	/* ignore error */
+	nhi->wake_irq = platform_get_irq_optional(pdev, 1);
+	if (nhi->wake_irq == -EPROBE_DEFER)
+		return nhi->wake_irq;
+	else if (nhi->wake_irq < 0)
+		nhi->wake_irq = 0;
+
+	return tb_nhi_probe(nhi);
+}
+
+static void nhi_platform_do_remove(struct platform_device *pdev, bool reset)
+{
+	struct device *dev = &pdev->dev;
+	struct tb *tb = platform_get_drvdata(pdev);
+	struct tb_nhi *nhi = tb->nhi;
+
+	/*
+	 * On system shutdown/reboot force a host router reset so the
+	 * CM asserts DPR on connected tbt3 devices before the router tree
+	 * is removed (see tb_stop()).
+	 */
+	if (reset)
+		nhi->host_reset = true;
+
+	pm_runtime_get_sync(dev);
+	pm_runtime_dont_use_autosuspend(dev);
+
+	tb_domain_remove(tb);
+	wait_for_completion(&nhi->domain_released);
+	tb_nhi_shutdown(nhi);
+}
+
+static void nhi_platform_remove(struct platform_device *pdev)
+{
+	nhi_platform_do_remove(pdev, false);
+}
+
+static void nhi_platform_shutdown(struct platform_device *pdev)
+{
+	nhi_platform_do_remove(pdev, true);
+}
+
+
+#ifdef CONFIG_OF
+static const struct of_device_id nhi_platform_of_match[] = {
+	{ .compatible = "usb4-nhi-platform" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, nhi_platform_of_match);
+#endif
+
+#ifdef CONFIG_ACPI
+static const struct acpi_device_id nhi_platform_acpi_match[] = {
+	{ "ACPI0015", 0 },
+	{ }
+};
+MODULE_DEVICE_TABLE(acpi, nhi_platform_acpi_match);
+#endif
+
+static struct platform_driver nhi_platform_driver = {
+	.probe = nhi_platform_probe,
+	.remove = nhi_platform_remove,
+	.shutdown = nhi_platform_shutdown,
+	.driver = {
+		.name = "thunderbolt",
+		.of_match_table = of_match_ptr(nhi_platform_of_match),
+		.acpi_match_table = ACPI_PTR(nhi_platform_acpi_match),
+		.pm = &tb_nhi_pm_ops,
+	},
+};
+
+module_platform_driver(nhi_platform_driver);
+MODULE_ALIAS("platform:thunderbolt");
+MODULE_DESCRIPTION("Thunderbolt/USB4 platform host interface driver");
+MODULE_LICENSE("GPL v2");
diff --git a/include/linux/thunderbolt.h b/include/linux/thunderbolt.h
index 57502da29080..72497acac254 100644
--- a/include/linux/thunderbolt.h
+++ b/include/linux/thunderbolt.h
@@ -511,6 +511,8 @@ void tb_service_properties_changed(struct tb_service *svc);
  * @going_away: The host controller device is about to disappear so when
  *		this flag is set, avoid touching the hardware anymore.
  * @iommu_dma_protection: An IOMMU will isolate external-facing ports.
+ * @irq: interrupt number of NHI.
+ * @wake_irq: optional dedicated wakeup interrupt.
  * @interrupt_work: Work scheduled to handle ring interrupt when no
  *		    MSI-X is used.
  * @hop_count: Number of rings (end point hops) supported by NHI.
@@ -532,6 +534,8 @@ struct tb_nhi {
 	u32 *interrupt_mask;
 	bool going_away;
 	bool iommu_dma_protection;
+	int irq;
+	int wake_irq;
 	struct work_struct interrupt_work;
 	u32 hop_count;
 	unsigned long quirks;
-- 
2.45.2

