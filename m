Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.251.105.195
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792605964;
	b=wCjjd1s+YdYbEuH28wrs39acqnGjX8fN6a/5q7hU9rQgDxBqa74lKZdkwV0/EPcmwFsv
	 oUrqJaglMAaeIHM8IwYAhESrj0DjAcHhd7F436wtRxh8D6YAZMOfCFkTOl/dub3xoHLdP
	 T82fxl4Fym0ynbHQPSHrOul+kWFCI4p2BAjctycdkl/zDhcVrg6qcA4/Mtxnmmz2nnFvJ
	 5fPeY2nvRtarg02RcKsSCMU+B+mF2r3C6XM8WzsPA7GY3e0oBJtoiRZeM3ikmH/iH5VB2
	 B0fLWc3WVXLV30J6AWYnXV1RhvNsIkXg0pRTJNcg7cZDATTi7vOOmq6xahpUe7sO58w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792605964;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=q8G0zoKO5ovjy5z+eB9OIlV9JUGqwNY8eilqJ4aVXDc=;
	b=oFfU59qtB/oSOiTf/ZrAVYEDw8a26qdy7XGRYGNzPjh2mDqi6oKsUap0JdoF/sQMhldc
	 CRLLcAL6vVu0PcDGLfSClM5HGUL6khM4DmpQDPBHNIp9o986y3WPinkei6oKMjhkbdvXz
	 Io/IaDxgs5FWIHgwPNy0pfAccAa4T/2YmD3SO/pukxR4VgwQR/18JM7854jZrIPeR5Cjv
	 thz6iYTbIEBWJmYDTgb6RNkwD9AzSylq2hi2MbXGc/Mcy/gfqh1K4/lF4a8cFMq0WiSyH
	 3F9xW4/ufxdbfu6/v3OCqk0KutpDLhNSSaToVh10BCfavcJ81CfvdzZFkGpQpYmio4g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=Tu725F5S;
	arc=none smtp.remote-ip=148.251.105.195
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA60C60A260C;
	Wed, 21 Oct 2026 18:05:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BA60C60A260C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=Tu725F5S
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1792605944;
	bh=H9yZY2oMjhME61aWYgFG+y3QHZrD67XIjzHa4/yVzXg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Tu725F5SI/lq8ej53kiVMPUHv9CMIAHmMFCQjBK+XD4ihRq1ifvkej4qU6/A5D8XK
	 22C+ysn9SzdIFNP/0bYysr6KsSCYmC59p1TINGAoAkdjJOzkI5lkRcDc1PQT9RrZHC
	 swV1lbHERScvSCQ4aruvFJMZNdfuBDKv+uHhmqXFfFyaTajfvuNMZA9cKNwM4RD+Cu
	 KGZYA22MAXVjKYj4mn3xDo18yvKcKtCiNXZlpTQzcZCUAzcOK+JrX9DK/sS5io5Yly
	 y3lnXlXhQeXlAWzS23xYvFDhznnGYMaQpSXIlQLOFpqtHrecES9B2QGjSkDFL4FqMi
	 ySmLMtk1mGpVQ==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id EBFF317E0A5D;
	Wed, 21 Oct 2026 20:05:43 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 6896D480035; Wed, 21 Oct 2026 20:05:43 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Wed, 21 Oct 2026 20:05:30 +0200
Subject: [PATCH v18 5/7] usb: dwc3: rockchip: add USBDP PHY reset quirk
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
Message-Id: <20261021-b4-rockchip-dwc3-rockchip-glue-v18-5-60000d03fca2@collabora.com>
References: <20261021-b4-rockchip-dwc3-rockchip-glue-v18-0-60000d03fca2@collabora.com>
In-Reply-To: <20261021-b4-rockchip-dwc3-rockchip-glue-v18-0-60000d03fca2@collabora.com>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Heiko Stuebner <heiko@sntech.de>, Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>
Cc: Igor Paunovic <royalnet026@gmail.com>, linux-kernel@vger.kernel.org, 
 linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-phy@lists.infradead.org, 
 kernel@collabora.com, Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=5469;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=H9yZY2oMjhME61aWYgFG+y3QHZrD67XIjzHa4/yVzXg=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGrY/vcbTkq3txhiMaKGyQpz1p328LEZE2MXE
 Ao0uszgjtR8I4kCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJq2P73AAoJENju1/PI
 O/qaGZYP/214dQ4W7Z+xdnrXwkYOXDl1Fbo4g+WpYL7xOj6W1oWs/dWeDW9ufzmGIExboDJm2IY
 TRge3sZyQI5d2Blr3XNsT+A4IJVVFm/ppURLZr6ETxZh40XetGOL5bpvHEmYENaAK9tAXS15YVX
 E9cCrJbf6JfDBXrLooRgPEpwqUQN60Lv/k2D+S0k424133xdP2zEIFiMZZfvMeASY5TBFbZ6pUT
 EDt/MHos0hl8dkBLGGpA8ARoOrbIcH4+5Z1stPK1iBYxGSsTWroDrD22uzqdJRNuZMvQnu5q65w
 Dv4lp1IY95igecJyjZoe4MejQikGck0J3S3hLnm4DgxPj+/gGDp+reR+B4f/hiPPITv5zN84fRA
 bZVABLoSDSmciK8x3JUXix09lJoDnUySWvkATQJKTCaDsiZ1bqZ/dZJ4rOwwyLKs8qd/Znm4JX9
 UCVabi6espDrrNUpegQ7t+Ks2beclHQX52ynA/Xp6MfhAmjbHlcTryzCIyka4z/ZxaMHqOcZ4z8
 cOEOlK/LHqoIpQO9oN5tPdGJ9fkA7hc2N/ieavnedWb3f9l7JDL9w8ObaZFSThn2tkKbF/M30bn
 VJlbmseejl1c8LEYDj+N+bLJ/FICBPrjQS9JGy3TaRZazevyeWZmGpoDQUNwjdgEInCXq7g4s0x
 oduEd4fPAP0ifF+EFq+Mt+w==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A

On recent Rockchip platforms (at least RK3588 & RK3576), DWC3 IP is used
with a USBDP PHY providing USB3 and DP. This PHY needs to be reset when
the mode changes, which may happen when plugging in different USB-C
devices.

If the USBDP PHY resets with the DWC3 IP running, its internal state
corrupts resulting in the USBDP PHY not being able to lock some PLL
clocks, which effectively renders USB3 unusable.

To fix the issue this adds a Rockchip USBDP specific quirk, which will
assert PHYSOFTRST before the actual PHY is disabled and will deassert it
once the PHY returns.

Note, that the same platforms also use DWC3 with a different PHY
(rockchip-naneng-combphy), so the PHY calls are protected by a
driver name check.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/usb/dwc3/Kconfig         |  1 +
 drivers/usb/dwc3/dwc3-rockchip.c | 96 +++++++++++++++++++++++++++++++++++++++-
 drivers/usb/dwc3/trace.c         |  3 ++
 3 files changed, 99 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/dwc3/Kconfig b/drivers/usb/dwc3/Kconfig
index 3c120ea9746d..c86c1ac293bf 100644
--- a/drivers/usb/dwc3/Kconfig
+++ b/drivers/usb/dwc3/Kconfig
@@ -193,6 +193,7 @@ config USB_DWC3_OCTEON
 config USB_DWC3_ROCKCHIP
 	tristate "Rockchip DWC3 Platform Driver"
 	depends on ARCH_ROCKCHIP || COMPILE_TEST
+	depends on PHY_ROCKCHIP_USBDP || !PHY_ROCKCHIP_USBDP
 	depends on OF
 	default USB_DWC3
 	help
diff --git a/drivers/usb/dwc3/dwc3-rockchip.c b/drivers/usb/dwc3/dwc3-rockchip.c
index 4129aefd6a8b..75e647e04cc5 100644
--- a/drivers/usb/dwc3/dwc3-rockchip.c
+++ b/drivers/usb/dwc3/dwc3-rockchip.c
@@ -2,11 +2,105 @@
 /* Copyright (c) 2026, Collabora Ltd. */
 #include <linux/module.h>
 #include <linux/platform_device.h>
+#include <linux/phy/rockchip-usbdp.h>
 #include <linux/pm_runtime.h>
 #include "glue.h"
+#include "io.h"
 
 struct dwc3_rockchip {
 	struct dwc3		dwc;
+	u8			phy_reset_active;
+};
+
+static void dwc3_rockchip_phy_pre_reset(struct dwc3_rockchip *dwc_rk, int port)
+{
+	struct dwc3 *dwc = &dwc_rk->dwc;
+	u32 reg;
+
+	/*
+	 * If the device is runtime suspended, there is nothing to do and RPM
+	 * resume will do the necessary things. There is no need for a RPM
+	 * reference either, since DWC3 runtime suspend/resume will call phy
+	 * init/exit and that is synchronized against ongoing resets.
+	 */
+	if (!pm_runtime_active(dwc->dev))
+		return;
+
+	/*
+	 * Assert USB3 PHY soft reset within DWC3 before the external
+	 * PHY resets. This disconnects the PIPE interface, preventing
+	 * the DWC3 from interfering with PHY reinitialization and
+	 * avoiding LCPLL lock failures.
+	 */
+	scoped_guard(spinlock_irqsave, &dwc->lock) {
+		dwc_rk->phy_reset_active |= BIT(port);
+		reg = dwc3_readl(dwc, DWC3_GUSB3PIPECTL(port));
+		reg |= DWC3_GUSB3PIPECTL_PHYSOFTRST;
+		dwc3_writel(dwc, DWC3_GUSB3PIPECTL(port), reg);
+	}
+}
+
+static void dwc3_rockchip_phy_post_reset(struct dwc3_rockchip *dwc_rk, int port)
+{
+	struct dwc3 *dwc = &dwc_rk->dwc;
+	u32 reg;
+
+	scoped_guard(spinlock_irqsave, &dwc->lock) {
+		if (!(dwc_rk->phy_reset_active & BIT(port)))
+			return;
+
+		dwc_rk->phy_reset_active &= ~BIT(port);
+
+		/* Restore normal operation */
+		reg = dwc3_readl(dwc, DWC3_GUSB3PIPECTL(port));
+		reg &= ~DWC3_GUSB3PIPECTL_PHYSOFTRST;
+		dwc3_writel(dwc, DWC3_GUSB3PIPECTL(port), reg);
+	}
+}
+
+static void dwc3_rockchip_phy_reset(void *data, int port, bool pre)
+{
+	struct dwc3_rockchip *dwc_rk = data;
+
+	if (pre)
+		dwc3_rockchip_phy_pre_reset(dwc_rk, port);
+	else
+		dwc3_rockchip_phy_post_reset(dwc_rk, port);
+}
+
+static void dwc3_rk_phy_unregister_notifiers(void *data)
+{
+	struct dwc3_rockchip *dwc_rk = data;
+	struct dwc3 *dwc = &dwc_rk->dwc;
+	int i;
+
+	for (i = 0; i < dwc->num_usb3_ports; i++) {
+		struct phy *phy = dwc->usb3_generic_phy[i];
+
+		if (phy && !strcmp(dev_driver_string(phy->dev.parent), "rockchip-usbdp-phy"))
+			rk_udphy_unregister_reset_handler(phy);
+	}
+
+	WARN_ON(dwc_rk->phy_reset_active);
+}
+
+static int dwc3_rk_phy_register_reset_handler(struct dwc3 *dwc)
+{
+	struct dwc3_rockchip *dwc_rk = container_of(dwc, struct dwc3_rockchip, dwc);
+	int i;
+
+	for (i = 0; i < dwc->num_usb3_ports; i++) {
+		struct phy *phy = dwc->usb3_generic_phy[i];
+
+		if (phy && !strcmp(dev_driver_string(phy->dev.parent), "rockchip-usbdp-phy"))
+			rk_udphy_register_reset_handler(phy, dwc3_rockchip_phy_reset, dwc_rk, i);
+	}
+
+	return devm_add_action_or_reset(dwc->dev, dwc3_rk_phy_unregister_notifiers, dwc_rk);
+}
+
+static struct dwc3_glue_ops dwc3_rockchip_glue_ops = {
+	.post_phy_registration = dwc3_rk_phy_register_reset_handler,
 };
 
 static int dwc3_rockchip_probe(struct platform_device *pdev)
@@ -26,7 +120,7 @@ static int dwc3_rockchip_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	dwc_rk->dwc.dev = &pdev->dev;
-	dwc_rk->dwc.glue_ops = NULL;
+	dwc_rk->dwc.glue_ops = &dwc3_rockchip_glue_ops;
 
 	probe_data.dwc = &dwc_rk->dwc;
 	probe_data.res = res;
diff --git a/drivers/usb/dwc3/trace.c b/drivers/usb/dwc3/trace.c
index 088995885678..8c4e2a7b142e 100644
--- a/drivers/usb/dwc3/trace.c
+++ b/drivers/usb/dwc3/trace.c
@@ -9,3 +9,6 @@
 
 #define CREATE_TRACE_POINTS
 #include "trace.h"
+
+EXPORT_TRACEPOINT_SYMBOL_GPL(dwc3_readl);
+EXPORT_TRACEPOINT_SYMBOL_GPL(dwc3_writel);

-- 
2.53.0

