Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 011003F328A;
	Tue, 15 Sep 2026 15:18:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789485492; cv=none; b=GelSqaeBT/vIzZaDc3On2MUY17RA8uLlpBVLxdwEoPSoco1OkfJUHsV3kXi1D9Ti2NKhKuTk3qObDJzapy+3pCL9CHs5p9GjTRBVhrbi9D+33+PQLnXGNCiWBRk53ypK45K8qf4FbPygBFja3oV4XmA8EEkphq774fRpSHuurL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789485492; c=relaxed/simple;
	bh=1qqONXOemSn7He65qwULu6DrX02TyhWC24CD6FQO7Ak=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=A2q1uBcl5U1QiB5PNRVR2Zk7E91S4Bdki+CU6WrVP9fObs6kK5c7l5G2u2rDSZzcMiseM6LzV9zEgWTNAjt+5FzfXIfhpNJaw9ReWxjy3ztvin5Ejhe56NcnAFMfCCHpgR494euZImZHqDMx/XIsbMMENrg2pKr94JQznWT2Cq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=WXTKfdBl; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="WXTKfdBl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1789485488;
	bh=1qqONXOemSn7He65qwULu6DrX02TyhWC24CD6FQO7Ak=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=WXTKfdBlHKIhqHu3UrIxxwyNHKFC6LJmk0XMml5G7mRwVc2Fl2feSI5TIg27SqBEH
	 6gwZ6Xw8mdEGnn2qo3K86PdHcPZEJ5DWUTM/Zsdh1jsWeis3GjIYh0Gqd7vWNVxGvh
	 hl38rNBGmyPpfs5k9jMl0aKt+279yVhvm77vR0Hz4c5wyKWYffI6wpETZ6VrFsh+o/
	 MP/fzinMrnaD2qTF2cKEFLGlFwjG2oq4M7qGdnKHPWo56NqPsKBjs39ofNc3qk+gaQ
	 PTe8EFtvhvI0PC7A2mjs6onntliv05V3cSgtrCveatgLAO7cqkbIVTy/wamb1b0LEY
	 +lJmPVhiyXJOw==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 0C85A17E09B5;
	Tue, 15 Sep 2026 17:18:08 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id BE93248002F; Tue, 15 Sep 2026 17:18:07 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Tue, 15 Sep 2026 17:17:42 +0200
Subject: [PATCH 2/5] usb: dwc3: rockchip: introduce glue driver
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260915-b4-rockchip-dwc3-rockchip-glue-v1-2-763bb546824e@collabora.com>
References: <20260915-b4-rockchip-dwc3-rockchip-glue-v1-0-763bb546824e@collabora.com>
In-Reply-To: <20260915-b4-rockchip-dwc3-rockchip-glue-v1-0-763bb546824e@collabora.com>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Heiko Stuebner <heiko@sntech.de>, Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-phy@lists.infradead.org, kernel@collabora.com, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Igor Paunovic <royalnet026@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=6083;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=1qqONXOemSn7He65qwULu6DrX02TyhWC24CD6FQO7Ak=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGqpYa/JJ9w9aQnhgmVTQAuHXkZ8esQSCTokU
 3ORYYK9bnWPBIkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqqWGvAAoJENju1/PI
 O/qar3UP/3EynYkLoRhGdNTU+rlVMJU/f495eMF5+uDehXkzZbBYVDtuZdV/njy7hkrSfEje4fZ
 eKAkdQp3XanoGcKsHIY26MJOETNXhiCXagEv8j6hnmTYTFfL3c21J0tOsJJq23+5g3EM+WZX80w
 XsqYxRx5rLSiOeiWt5ou/m5eWnXDfFDKMqsBItdNg1Q3ECGhyfySZ9obE+oHSd1D/c3OvYadcvB
 s4BNist5n3EPwMrE+IxDaH7742rlC5ytVEoXEToToDuWQR9t9zkYRC4R9XB9mOu2E1cwjlKHe4L
 qiVSi7q1Paf2y9ywz2zxlIUjfGVUQ9Vkx0Nrqr//YdCYG1svNrFexnAv6xsqE9cuahGN5pYKU77
 S5PbUCw1uxW4aWgd5IZajlg0GmEItAobZYPl9cM9ySWm/OZ+8s1X1eRpokH+Xl5MwL8mr0ZfwrV
 DyWf+/0o5DmtogqkXzcq1ARCnpTRzK2xYcgPPAT0B3BGVBvXpQANx55uXKFuw08jrHFUCZmfmud
 XEqGRTSoAEN1+ptBYj5I2+AS29F749bfTk+Tqgte4LuI42rdimWPle+kojtNbByBUJo9WAdyM7r
 aAEg/f72jwR3Sryjmr8bwDi4ksW4LSclesuoenIv3gf1PlLCClbnmozr0RIkF2ScipH5VccBe0f
 guE9dwSTKtY0zMSbHOi4sNQ==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A

Introduce Rockchip specific glue code for the Synopsys DWC3 USB driver.
For now this handles things identical to the default glue.

Tested-by: Igor Paunovic <royalnet026@gmail.com> # Orange Pi 5 Plus
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/usb/dwc3/Kconfig         |  11 ++++
 drivers/usb/dwc3/Makefile        |   1 +
 drivers/usb/dwc3/core.c          |  15 ++++++
 drivers/usb/dwc3/dwc3-rockchip.c | 106 +++++++++++++++++++++++++++++++++++++++
 4 files changed, 133 insertions(+)

diff --git a/drivers/usb/dwc3/Kconfig b/drivers/usb/dwc3/Kconfig
index 18169727a413..3c120ea9746d 100644
--- a/drivers/usb/dwc3/Kconfig
+++ b/drivers/usb/dwc3/Kconfig
@@ -190,6 +190,17 @@ config USB_DWC3_OCTEON
 	  Only the host mode is currently supported.
 	  Say 'Y' or 'M' here if you have one such device.
 
+config USB_DWC3_ROCKCHIP
+	tristate "Rockchip DWC3 Platform Driver"
+	depends on ARCH_ROCKCHIP || COMPILE_TEST
+	depends on OF
+	default USB_DWC3
+	help
+	  Rockchip SoCs with DesignWare Core USB3 IP inside,
+	  and IP Core configured for USB 2.0 and USB 3.0 in host
+	  or dual-role mode.
+	  Say 'Y' or 'M' if you have such device.
+
 config USB_DWC3_RTK
 	tristate "Realtek DWC3 Platform Driver"
 	depends on OF && ARCH_REALTEK
diff --git a/drivers/usb/dwc3/Makefile b/drivers/usb/dwc3/Makefile
index f37971197203..444e7e7f34b2 100644
--- a/drivers/usb/dwc3/Makefile
+++ b/drivers/usb/dwc3/Makefile
@@ -58,6 +58,7 @@ obj-$(CONFIG_USB_DWC3_IMX8MP)		+= dwc3-imx8mp.o
 obj-$(CONFIG_USB_DWC3_IMX)		+= dwc3-imx.o
 obj-$(CONFIG_USB_DWC3_XILINX)		+= dwc3-xilinx.o
 obj-$(CONFIG_USB_DWC3_OCTEON)		+= dwc3-octeon.o
+obj-$(CONFIG_USB_DWC3_ROCKCHIP)		+= dwc3-rockchip.o
 obj-$(CONFIG_USB_DWC3_RTK)		+= dwc3-rtk.o
 obj-$(CONFIG_USB_DWC3_GENERIC_PLAT)	+= dwc3-generic-plat.o
 obj-$(CONFIG_USB_DWC3_GOOGLE)		+= dwc3-google.o
diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
index fd5c2cd36c59..4b7132887a03 100644
--- a/drivers/usb/dwc3/core.c
+++ b/drivers/usb/dwc3/core.c
@@ -2448,11 +2448,26 @@ int dwc3_core_probe(const struct dwc3_probe_data *data)
 }
 EXPORT_SYMBOL_GPL(dwc3_core_probe);
 
+/*
+ * List of compatibles, which have "synopsys,dwc3" as a fallback
+ * compatible, but have a vendor specific glue driver that should
+ * be used instead of this one.
+ */
+static const char *const dwc3_compatible_blocklist[] = {
+	"rockchip,rk3588-dwc3",
+	"rockchip,rk3576-dwc3",
+};
+
 static int dwc3_probe(struct platform_device *pdev)
 {
 	struct dwc3_probe_data probe_data = {};
 	struct resource *res;
 	struct dwc3 *dwc;
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(dwc3_compatible_blocklist); i++)
+		if (device_is_compatible(&pdev->dev, dwc3_compatible_blocklist[i]))
+			return -ENODEV;
 
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	if (!res) {
diff --git a/drivers/usb/dwc3/dwc3-rockchip.c b/drivers/usb/dwc3/dwc3-rockchip.c
new file mode 100644
index 000000000000..62f2a03b08a2
--- /dev/null
+++ b/drivers/usb/dwc3/dwc3-rockchip.c
@@ -0,0 +1,106 @@
+// SPDX-License-Identifier: GPL-2.0
+/* Copyright (c) 2026, Collabora Ltd. */
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
+#include "glue.h"
+
+struct dwc3_rockchip {
+	struct dwc3		dwc;
+};
+
+static int dwc3_rockchip_probe(struct platform_device *pdev)
+{
+	struct dwc3_probe_data probe_data = {};
+	struct resource *res;
+	struct dwc3_rockchip *dwc_rk;
+
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	if (!res) {
+		dev_err(&pdev->dev, "missing memory resource\n");
+		return -ENODEV;
+	}
+
+	dwc_rk = devm_kzalloc(&pdev->dev, sizeof(*dwc_rk), GFP_KERNEL);
+	if (!dwc_rk)
+		return -ENOMEM;
+
+	dwc_rk->dwc.dev = &pdev->dev;
+	dwc_rk->dwc.glue_ops = NULL;
+
+	probe_data.dwc = &dwc_rk->dwc;
+	probe_data.res = res;
+	probe_data.properties = DWC3_DEFAULT_PROPERTIES;
+
+	return dwc3_core_probe(&probe_data);
+}
+
+static void dwc3_rockchip_remove(struct platform_device *pdev)
+{
+	dwc3_core_remove(platform_get_drvdata(pdev));
+}
+
+static int __maybe_unused dwc3_rockchip_runtime_suspend(struct device *dev)
+{
+	return dwc3_runtime_suspend(dev_get_drvdata(dev));
+}
+
+static int __maybe_unused dwc3_rockchip_runtime_resume(struct device *dev)
+{
+	return dwc3_runtime_resume(dev_get_drvdata(dev));
+}
+
+static int __maybe_unused dwc3_rockchip_runtime_idle(struct device *dev)
+{
+	return dwc3_runtime_idle(dev_get_drvdata(dev));
+}
+
+static int __maybe_unused dwc3_rockchip_suspend(struct device *dev)
+{
+	return dwc3_pm_suspend(dev_get_drvdata(dev));
+}
+
+static int __maybe_unused dwc3_rockchip_resume(struct device *dev)
+{
+	return dwc3_pm_resume(dev_get_drvdata(dev));
+}
+
+static void __maybe_unused dwc3_rockchip_complete(struct device *dev)
+{
+	dwc3_pm_complete(dev_get_drvdata(dev));
+}
+
+static int __maybe_unused dwc3_rockchip_prepare(struct device *dev)
+{
+	return dwc3_pm_prepare(dev_get_drvdata(dev));
+}
+
+static const struct dev_pm_ops dwc3_rockchip_dev_pm_ops = {
+	SET_SYSTEM_SLEEP_PM_OPS(dwc3_rockchip_suspend, dwc3_rockchip_resume)
+	SET_RUNTIME_PM_OPS(dwc3_rockchip_runtime_suspend, dwc3_rockchip_runtime_resume,
+			   dwc3_rockchip_runtime_idle)
+	.complete = pm_sleep_ptr(dwc3_rockchip_complete),
+	.prepare = pm_sleep_ptr(dwc3_rockchip_prepare),
+};
+
+static const struct of_device_id dwc3_rockchip_of_match[] = {
+	{ .compatible = "rockchip,rk3588-dwc3" },
+	{ .compatible = "rockchip,rk3576-dwc3" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, dwc3_rockchip_of_match);
+
+static struct platform_driver dwc3_rockchip_driver = {
+	.probe		= dwc3_rockchip_probe,
+	.remove		= dwc3_rockchip_remove,
+	.driver		= {
+		.name	= "dwc3-rockchip",
+		.pm	= pm_ptr(&dwc3_rockchip_dev_pm_ops),
+		.of_match_table	= dwc3_rockchip_of_match,
+	},
+};
+
+module_platform_driver(dwc3_rockchip_driver);
+
+MODULE_LICENSE("GPL");
+MODULE_DESCRIPTION("DesignWare DWC3 Rockchip Glue Driver");

-- 
2.53.0

