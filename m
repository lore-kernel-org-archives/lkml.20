Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=60.244.123.138
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793348759;
	b=4b5kqAr8pylxSwOVUudF4gBRLLkGGUGH2totpUd8UWRSKeD784dRE+LwcAKy6UMkMp8m
	 TGYjsRM51Mlx89l3orHsYedSfT6TgT/m1CnPs0nuHsnNasUuX8RYqIMeRGZTwbdNB41Jy
	 g5fJ0j4fEeZ5za55PWm8vuC6fWFRStKqkCzPpXZG93doN+1U7XasB21K5+MtJuKnHOS8K
	 mX3oxxNQqlHC2eaFZSHnlB+Hw9cjQOt9MbtuKkPpY/6yoAoVgj5yTV207kKAPOvRtLiHK
	 4toKnlnb0viAmRPn+Wd5pYUFFGUzVkgmIwJYerA41FUd0R6fABmv/UIa37OA2si3DHg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793348759;
	h=DMARC-Filter:X-UUID:DKIM-Signature:X-CID-P-RULE:X-CID-O-INFO:
	 X-CID-META:X-CID-BVR:X-CID-BAS:X-CID-FACTOR:X-CID-RHF:X-UUID:Received:
	 Received:Received:From:To:CC:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:
	 Content-Type:X-MTK;
	bh=1LeFAfMU9NZYycu0fcvlcNgS70+2S/48cLLq8mOuriM=;
	b=gNYOKcDH0xc06KkM/hHv5YQ9YlioM4ild/TOp4aw/5WBKAY9QHVWFNQVGigtZzsCGyAB
	 t/G9XhbGTPlRIkTaMh4RmidlBouKTP/wC+ifJyCeH41i96tGLdZp6RfOdhnwOrvC7aLh7
	 ntkoZ9xl+jPrAOBSjBJRB1//4mfrDz1HUoSPRXCSTZgYUjO0ZSBqUkoFbQboEG1JuHetb
	 juhLqiQ5nzBrQF+/m26x8lBoBYF7BZ9gTxKBGMoQ6uw3ikMaUEoaW8sPRgrNAX/A7hWN+
	 ipu2y+IyfpYf7aT2Sx++pvWLCAWr6l90WtIN0XO1RTVVsUS3LmOG0Hzql/jTrWlIIMA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mediatek.com;
	spf=pass smtp.mailfrom=mediatek.com;
	dkim=pass header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=f2SPwYlI;
	arc=none smtp.remote-ip=60.244.123.138
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF7E5606A325;
	Fri, 30 Oct 2026 08:25:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AF7E5606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=f2SPwYlI
X-UUID: 85656318d43b11f1b1788b6acf885367-20261030
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=1LeFAfMU9NZYycu0fcvlcNgS70+2S/48cLLq8mOuriM=;
	b=f2SPwYlIZ0fTcslgABBizYaqJDY42mTwU+3TP2GxoY+a4UZthl9KPcj5Z0pY9iWtzxU8ixVWg8wygJSARjEbLIZL6bjS2+TJyvYU8e2V7J+BRdV+Mlj5casnK3+sydc0grFmLNwCZaBn+ePiiJhTFD1SD4f9o8FfCw7EJ1HNp64=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.21,REQID:5fbc0e4c-8775-4527-a70e-2a7021e50c11,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:b0318ac,CLOUDID:58df246a-d611-4807-b4ca-f57cab7f3164,B
	ulkID:nil,BulkQuantity:0,SF:81|82|102|836|865|888|898,TC:-5,Content:0|15|5
	0|99,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,OSI:0,
	OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 85656318d43b11f1b1788b6acf885367-20261030
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by mailgw01.mediatek.com
	(envelope-from <chunfeng.yun@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 890868289; Fri, 30 Oct 2026 16:25:53 +0800
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 30 Oct 2026 16:25:51 +0800
Received: from gcnsap21.gcn.mediatek.inc (10.17.81.22) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Fri, 30 Oct 2026 16:25:51 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Mika Westerberg <westeri@kernel.org>
CC: Andreas Noever <andreas.noever@gmail.com>, Yehezkel Bernat
	<YehezkelShB@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, <linux-kernel@vger.kernel.org>,
	<linux-usb@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, Chunfeng Yun
	<chunfeng.yun@mediatek.com>
Subject: [PATCH 1/4] thunderbolt: add platform nhi driver
Date: Fri, 30 Oct 2026 16:25:36 +0800
Message-ID: <20261030082539.1208733-2-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261030082539.1208733-1-chunfeng.yun@mediatek.com>
References: <20261030082539.1208733-1-chunfeng.yun@mediatek.com>
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

Add a new file plat.c to register platform NHI driver for MediaTek
mt8901/mt8992 SoCs.

Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
 drivers/thunderbolt/Makefile |   2 +-
 drivers/thunderbolt/domain.c |  10 ++-
 drivers/thunderbolt/nhi.c    |   2 +
 drivers/thunderbolt/nhi.h    |   1 -
 drivers/thunderbolt/pci.c    |  26 +-----
 drivers/thunderbolt/plat.c   | 155 +++++++++++++++++++++++++++++++++++
 drivers/thunderbolt/tb.h     |   2 -
 include/linux/thunderbolt.h  |   1 +
 8 files changed, 169 insertions(+), 30 deletions(-)
 create mode 100644 drivers/thunderbolt/plat.c

diff --git a/drivers/thunderbolt/Makefile b/drivers/thunderbolt/Makefile
index beb054c3126b..9c941682f3d6 100644
--- a/drivers/thunderbolt/Makefile
+++ b/drivers/thunderbolt/Makefile
@@ -3,7 +3,7 @@ ccflags-y := -I$(src)
 obj-${CONFIG_USB4} := thunderbolt.o
 thunderbolt-objs := nhi.o ctl.o tb.o switch.o cap.o pci.o path.o tunnel.o eeprom.o
 thunderbolt-objs += domain.o dma_port.o icm.o property.o xdomain.o lc.o tmu.o usb4.o
-thunderbolt-objs += usb4_port.o nvm.o retimer.o quirks.o clx.o
+thunderbolt-objs += usb4_port.o nvm.o retimer.o quirks.o clx.o plat.o
 
 thunderbolt-${CONFIG_ACPI} += acpi.o
 thunderbolt-$(CONFIG_DEBUG_FS) += debugfs.o
diff --git a/drivers/thunderbolt/domain.c b/drivers/thunderbolt/domain.c
index 24611f05b3cd..bec7e6ebc4a8 100644
--- a/drivers/thunderbolt/domain.c
+++ b/drivers/thunderbolt/domain.c
@@ -881,7 +881,7 @@ int tb_domain_unregister_unplugged_xdomains(struct tb *tb)
 	return ctx.n;
 }
 
-int tb_domain_init(void)
+static int __init tb_domain_init(void)
 {
 	int ret;
 
@@ -907,7 +907,7 @@ int tb_domain_init(void)
 	return ret;
 }
 
-void tb_domain_exit(void)
+static void __exit tb_domain_exit(void)
 {
 	bus_unregister(&tb_bus_type);
 	ida_destroy(&tb_domain_ida);
@@ -917,3 +917,9 @@ void tb_domain_exit(void)
 	tb_debugfs_exit();
 	tb_configfs_exit();
 }
+
+subsys_initcall(tb_domain_init);
+module_exit(tb_domain_exit);
+
+MODULE_DESCRIPTION("Thunderbolt/USB4 domain driver");
+MODULE_LICENSE("GPL");
diff --git a/drivers/thunderbolt/nhi.c b/drivers/thunderbolt/nhi.c
index e99a3fcc4a29..c0f9f1855e8f 100644
--- a/drivers/thunderbolt/nhi.c
+++ b/drivers/thunderbolt/nhi.c
@@ -1379,8 +1379,10 @@ int nhi_probe(struct tb_nhi *nhi)
 	device_wakeup_enable(dev);
 
 	pm_runtime_allow(dev);
+	device_enable_async_suspend(dev);
 	pm_runtime_set_autosuspend_delay(dev, TB_AUTOSUSPEND_DELAY);
 	pm_runtime_use_autosuspend(dev);
+	pm_runtime_mark_last_busy(dev);
 	pm_runtime_put_autosuspend(dev);
 
 	return 0;
diff --git a/drivers/thunderbolt/nhi.h b/drivers/thunderbolt/nhi.h
index 88af9ab9fde7..37c11de167ad 100644
--- a/drivers/thunderbolt/nhi.h
+++ b/drivers/thunderbolt/nhi.h
@@ -29,7 +29,6 @@ enum nhi_mailbox_cmd {
 
 int nhi_mailbox_cmd(struct tb_nhi *nhi, enum nhi_mailbox_cmd cmd, u32 data);
 enum nhi_fw_mode nhi_mailbox_mode(struct tb_nhi *nhi);
-void nhi_enable_int_throttling(struct tb_nhi *nhi);
 void nhi_disable_interrupts(struct tb_nhi *nhi);
 void nhi_interrupt_work(struct work_struct *work);
 irqreturn_t nhi_msi(int irq, void *data);
diff --git a/drivers/thunderbolt/pci.c b/drivers/thunderbolt/pci.c
index 4408229d8ac7..91d236300703 100644
--- a/drivers/thunderbolt/pci.c
+++ b/drivers/thunderbolt/pci.c
@@ -715,7 +715,7 @@ static struct pci_device_id nhi_ids[] = {
 };
 
 MODULE_DEVICE_TABLE(pci, nhi_ids);
-MODULE_DESCRIPTION("Thunderbolt/USB4 core driver");
+MODULE_DESCRIPTION("Thunderbolt/USB4 PCI host interface driver");
 MODULE_LICENSE("GPL");
 
 static struct pci_driver nhi_driver = {
@@ -727,26 +727,4 @@ static struct pci_driver nhi_driver = {
 	.driver.pm = &nhi_pm_ops,
 };
 
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
+module_pci_driver(nhi_driver);
diff --git a/drivers/thunderbolt/plat.c b/drivers/thunderbolt/plat.c
new file mode 100644
index 000000000000..85a00cd391d4
--- /dev/null
+++ b/drivers/thunderbolt/plat.c
@@ -0,0 +1,155 @@
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
+#include <linux/slab.h>
+
+#include "nhi.h"
+#include "tb.h"
+
+static int nhi_plat_init(struct tb_nhi *nhi)
+{
+	/*
+	 * avoid device link fail for pcie tunnel
+	 */
+	pm_runtime_set_active(nhi->dev);
+	pm_runtime_get_noresume(nhi->dev);
+	devm_pm_runtime_enable(nhi->dev);
+
+	return 0;
+}
+
+static irqreturn_t nhi_plat_isr(int irq, void *data)
+{
+	struct tb_nhi *nhi = data;
+	schedule_work(&nhi->interrupt_work);
+	return IRQ_HANDLED;
+}
+
+static int nhi_plat_init_irq(struct tb_nhi *nhi)
+{
+	int ret;
+
+	INIT_WORK(&nhi->interrupt_work, nhi_interrupt_work);
+
+	ret = devm_request_irq(nhi->dev, nhi->irq, nhi_plat_isr, IRQF_NO_SUSPEND,
+			       dev_name(nhi->dev), nhi);
+	if (ret)
+		return dev_err_probe(nhi->dev, ret, "request irq failed\n");
+
+	return 0;
+}
+
+static void nhi_plat_exit(struct tb_nhi *nhi)
+{
+	devm_free_irq(nhi->dev, nhi->irq, nhi);
+	flush_work(&nhi->interrupt_work);
+
+	pm_runtime_put_noidle(nhi->dev);
+	pm_runtime_disable(nhi->dev);
+	pm_runtime_set_suspended(nhi->dev);
+}
+
+static const struct tb_nhi_ops nhi_plat_default_ops = {
+	.init = nhi_plat_init,
+	.shutdown = nhi_plat_exit,
+	.init_interrupts = nhi_plat_init_irq,
+};
+
+static int nhi_plat_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct tb_nhi *nhi;
+
+	nhi = devm_kzalloc(dev, sizeof(*nhi), GFP_KERNEL);
+	if (!nhi)
+		return -ENOMEM;
+
+	nhi->dev = dev;
+	nhi->ops = &nhi_plat_default_ops;
+
+	nhi->iobase = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(nhi->iobase))
+		return PTR_ERR(nhi->iobase);
+
+	nhi->irq = platform_get_irq(pdev, 0);
+	if (nhi->irq < 0)
+		return dev_err_probe(dev, nhi->irq, "get irq failed\n");
+
+	return nhi_probe(nhi);
+}
+
+static void nhi_plat_do_remove(struct platform_device *pdev, bool reset)
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
+	nhi_shutdown(nhi);
+}
+
+static void nhi_plat_remove(struct platform_device *pdev)
+{
+	nhi_plat_do_remove(pdev, false);
+}
+
+static void nhi_plat_shutdown(struct platform_device *pdev)
+{
+	nhi_plat_do_remove(pdev, true);
+}
+
+
+#ifdef CONFIG_OF
+static const struct of_device_id nhi_plat_of_match[] = {
+	{ .compatible = "thunderbolt-platform" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, nhi_plat_of_match);
+#endif
+
+#ifdef CONFIG_ACPI
+static const struct acpi_device_id nhi_plat_acpi_match[] = {
+	{ "ACPI0015", 0 },
+	{ }
+};
+MODULE_DEVICE_TABLE(acpi, nhi_plat_acpi_match);
+#endif
+
+static struct platform_driver nhi_plat_driver = {
+	.probe = nhi_plat_probe,
+	.remove = nhi_plat_remove,
+	.shutdown = nhi_plat_shutdown,
+	.driver = {
+		.name = "thunderbolt",
+		.of_match_table = of_match_ptr(nhi_plat_of_match),
+		.acpi_match_table = ACPI_PTR(nhi_plat_acpi_match),
+		.pm = &nhi_pm_ops,
+	},
+};
+
+module_platform_driver(nhi_plat_driver);
+MODULE_ALIAS("platform:thunderbolt");
+MODULE_DESCRIPTION("Thunderbolt/USB4 platform host interface driver");
+MODULE_LICENSE("GPL v2");
diff --git a/drivers/thunderbolt/tb.h b/drivers/thunderbolt/tb.h
index e86845762e22..6dfdc47e05d2 100644
--- a/drivers/thunderbolt/tb.h
+++ b/drivers/thunderbolt/tb.h
@@ -768,8 +768,6 @@ extern const struct device_type tb_retimer_type;
 extern const struct device_type tb_switch_type;
 extern const struct device_type usb4_port_device_type;
 
-int tb_domain_init(void);
-void tb_domain_exit(void);
 int tb_xdomain_init(void);
 void tb_xdomain_exit(void);
 
diff --git a/include/linux/thunderbolt.h b/include/linux/thunderbolt.h
index 57502da29080..212c8fea6571 100644
--- a/include/linux/thunderbolt.h
+++ b/include/linux/thunderbolt.h
@@ -532,6 +532,7 @@ struct tb_nhi {
 	u32 *interrupt_mask;
 	bool going_away;
 	bool iommu_dma_protection;
+	int irq;
 	struct work_struct interrupt_work;
 	u32 hop_count;
 	unsigned long quirks;
-- 
2.43.0

