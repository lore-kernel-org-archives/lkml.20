Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.251.105.195
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794618169;
	b=QqqoahRjjoGkkcTLxd0dT+yfImptKa1mI+Gvevnr7iWEzrAlpJAORcTLlLB7bX7f+Nd2
	 fJcw1rWPPdwUSODqdeOQIyFA0x4r93GhXydV9liXkWQV8ZwxYo4LF31GOz1oil7q1yqCu
	 jXXMHoc0lg4uBHV3Jc01Qa3potd+lnTdIXo8oznN1szdjv7216gaIjBmSbcbtIzNF0xoZ
	 bqpAlVEvsyU9biXtY3mTmiWpoiRBsPAhMD2V1pGFd2QKVdKwbjD81jk6ryb/5Rg6gqhK1
	 bMwPTh1kTwK/i6YqI0TAiT/6Uss0SFC6HOUUZDi5SK8a5DjZm2BlAMHtNvEpgoFaF4Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794618169;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=G7gtJ7EFpopetofcaPZ+USpXdKxyt9IPghvMVKuyNu0=;
	b=lSRX+pztAr4ztS5qP2epSwXCqq1ni6IRhFYy1roGJ5iBBCum2P18ZVes+ZoyG3TxUF6A
	 L4aOB9HDiAsNTtELl0woSVU/EQX4SbrfmD5M0moV0LPBzS4xQRZdQ28FG6508ddd2Y8If
	 +Vhr+7R0N1ZqjnVgVhu96tb7ctB9C5S7UHmeFsOoRhmdkc8206QEI29H6BdtlmSVg2VcM
	 dfB5WMIikxi0c0R2fPix33DYg7j2KXWwhzXoSDPggjRSYJ29amnjl7934pCMMRHKqz/QJ
	 ELZmITHjC3Oam5UtWpv+zjHFLad0yMacW20BYohbo9/ic+i/UroLL5Z6beIdtU7GpLg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=Z36M9yIb;
	arc=none smtp.remote-ip=148.251.105.195
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DB79606A33E;
	Sat, 14 Nov 2026 01:02:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0DB79606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=Z36M9yIb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1794618166;
	bh=xnlO9in6Z1+Bk+onYHPVFQSnxIJtGXyd6zhQkeV69kQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Z36M9yIbOlpBt32GRm2yENOoo3rLJtTIATZHwTfnukEJqVVFULBpL8jHUEULAxmtT
	 KCsZAxEkuK+je4drdIKfGc1X6YZQAoH2nFY0b3OzLhwa7Ci/VuScQWpXYUSHZR+rLG
	 WaPIFOtvogAV+BGMoi4XoluI0SEnuERdiQ7RyT/aMtC8XWGLaud2wy5Zz7bkwajZE1
	 ux6M74zeprPqeJ3oUk6ubNRU6lYPvUF3ta7yXlR1f/OuymqmUQ0NEhzcEe2imoJad+
	 ILmintbnWhkzt44KF3JxqazTHia6MN/xCFqXK6f7kLXsglOBIKVAuH30RsJ+CZw+0S
	 2g0kHF77/Iexg==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 0CE8B17E0F70;
	Sat, 14 Nov 2026 02:02:46 +0100 (CET)
Received: by jupiter.universe (Postfix, from userid 1000)
	id C481E480031; Sat, 14 Nov 2026 02:02:45 +0100 (CET)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Sat, 14 Nov 2026 02:02:02 +0100
Subject: [PATCH v19 3/6] usb: dwc3: rockchip: introduce glue driver
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261114-b4-rockchip-dwc3-rockchip-glue-v19-3-b79fb5f4b42a@collabora.com>
References: <20261114-b4-rockchip-dwc3-rockchip-glue-v19-0-b79fb5f4b42a@collabora.com>
In-Reply-To: <20261114-b4-rockchip-dwc3-rockchip-glue-v19-0-b79fb5f4b42a@collabora.com>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Heiko Stuebner <heiko@sntech.de>, Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>, 
 Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>, 
 Chaoyi Chen <chaoyi.chen@rock-chips.com>, 
 Igor Paunovic <royalnet026@gmail.com>, Alexey Charkov <alchark@flipper.net>, 
 linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-phy@lists.infradead.org, kernel@collabora.com, 
 Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=6276;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=xnlO9in6Z1+Bk+onYHPVFQSnxIJtGXyd6zhQkeV69kQ=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGr3szX4/VVcHSguS7oy9qSMstwb6RCISJYF3
 V1hwH24L2hOUokCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJq97M1AAoJENju1/PI
 O/qaGL0P/iW1z/JRuqqFXNn9aiW0cZMW3Onlw+3U5hlM45Y7R3BEwy8gUewu5kkyI6KuPv1jUtX
 Li+vPZPDEZq58XU/30hMps0kLVtUd8+b5Qe/TOKl5ObzjC2K5sYRLfu0WgdVVk7jMkx36gVyZOR
 Ict1v80Rs57k7A5mCbCb4zOy/t42dA8dx9mcYqDegJiP4SQ4PLi/u+AoX+rGYJoshlpW2QHNX6c
 fLDb4+ooQLhY65ZS6eQktUnRbKRTc/WM5tr3k417ihsHyWtxFOFnfVaMdfas+zN+8AyGTS5QbZN
 1RUYJhRL6mk0AOR9zEu33wDCgGW8g5MnSioitph83MQm5NEVGhi2s0e6Qnl2yQCZ/haYD3w+rA8
 eC9RDqWciQnd1itNl6UKuqTvyrcmPNugHydcJ0zNHkxgIQBOfEzpmguWTth/GqW/Ha3ctzOGi8e
 21OuaohrSJ0X5dXiXIHdeTQ3P7ho1AXRpOc/CoV+PHT7HF5f/rcpc6ErADqhnd8pZUn3auSMfud
 wabFC4OCQutoOCdgnepwGOS+M3n6FjloN5UEsMDUJJmHMw++Yq/JVkXaDrVqJJ+hHWRRAvbuSpX
 loBNR6I/nufDtOb9z9GRIcAvrtArHJminTGhQjVJiCuP8rabQ36idN8040Kfm2LmxBC2kTdgV1o
 qvBz0YR7bsodC6naz3OU4dA==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A

Introduce Rockchip specific glue code for the Synopsys DWC3 USB driver.
For now this handles things identical to the default glue.

After this change the glue driver is mandatory for Rockchip RK3588 and
RK3576; it does not make sense to fallback to the core driver as the
whole purpose of the glue driver is fixing race conditions resulting in
SErrors and non-functional USB.

Tested-by: Igor Paunovic <royalnet026@gmail.com> # Orange Pi 5 Plus
Tested-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>
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
index 000000000000..4129aefd6a8b
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
+static int dwc3_rockchip_runtime_suspend(struct device *dev)
+{
+	return dwc3_runtime_suspend(dev_get_drvdata(dev));
+}
+
+static int dwc3_rockchip_runtime_resume(struct device *dev)
+{
+	return dwc3_runtime_resume(dev_get_drvdata(dev));
+}
+
+static int dwc3_rockchip_runtime_idle(struct device *dev)
+{
+	return dwc3_runtime_idle(dev_get_drvdata(dev));
+}
+
+static int dwc3_rockchip_suspend(struct device *dev)
+{
+	return dwc3_pm_suspend(dev_get_drvdata(dev));
+}
+
+static int dwc3_rockchip_resume(struct device *dev)
+{
+	return dwc3_pm_resume(dev_get_drvdata(dev));
+}
+
+static void dwc3_rockchip_complete(struct device *dev)
+{
+	dwc3_pm_complete(dev_get_drvdata(dev));
+}
+
+static int dwc3_rockchip_prepare(struct device *dev)
+{
+	return dwc3_pm_prepare(dev_get_drvdata(dev));
+}
+
+static const struct dev_pm_ops dwc3_rockchip_dev_pm_ops = {
+	SYSTEM_SLEEP_PM_OPS(dwc3_rockchip_suspend, dwc3_rockchip_resume)
+	RUNTIME_PM_OPS(dwc3_rockchip_runtime_suspend, dwc3_rockchip_runtime_resume,
+		       dwc3_rockchip_runtime_idle)
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

