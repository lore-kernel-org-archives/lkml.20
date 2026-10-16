Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29FCA5AEC71;
	Fri, 16 Oct 2026 18:43:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792176225; cv=none; b=HVcYDKm/9vZX4cnYVPHiEn10CZ09ut15NTCpEKd7nHlycPOr4k2+LEWb+YyzlN8ZRLCMk4GDKFr+9SrZ/vuyQsLUqGFdVjAtbnpDOsL10Qqxr0HBPNDQ0wFDf6R03aqJ5axBs1QFT24D/STcxrIuhhdgrw8R2THAz4HiI8pmHHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792176225; c=relaxed/simple;
	bh=zy489m54ItwztWJy4TiNrj9fEHuFy31irrGRxqZ0+Uo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Bo5bTNHy7JjNxl1kykzlr3O4KuTBM4/UhDnDWvvt5ZltwcmBCIno+RKiN+iqEMiAr4HE1dMLpgKzOmNuSyeHxYCarIwBNoBSDIXckUNqNBelw4bx6UGJqGh+KKjXPXzuMzjM9jrkTvvkLRyiQs1U8MHFJnUg5pKtFu2tfYO981U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=Tg2OdxEf; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="Tg2OdxEf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1792176215;
	bh=zy489m54ItwztWJy4TiNrj9fEHuFy31irrGRxqZ0+Uo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Tg2OdxEfqlu9/rWqqkhTBBUatKnQA/gh/AbXWM8uqS3eWR2Xaa/dEmIpMZ8lTkL07
	 5JZSyPmTb+ODltiAyh3NutkRPjYlwIq1ytHouk3QT5reLeXHBAx0GJQINYILhnpfvn
	 +tQJlwK9/0Yc6uU54baNwyke1u9tulzLUtPUTMB3JtWIhogNfNTBWFPyM534ZqwFH+
	 7Sz1VdneEhAbJLFMMrCMevzAR5A/hnJ88EP91w8u/su+eilTy+bJQu4eio9ywTgmPa
	 xnKaR97B40VPyScdPHDOQodzTTR9ZImaQv0jZ4cV+hT/bKFWGBSAzLi4PKTCaEEUmz
	 tPd48nl5XgvgA==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 06F5B17E1509;
	Fri, 16 Oct 2026 20:43:35 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 67531480035; Fri, 16 Oct 2026 20:43:34 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Fri, 16 Oct 2026 20:43:21 +0200
Subject: [PATCH v17 5/7] usb: dwc3: rockchip: add USBDP PHY reset quirk
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261016-b4-rockchip-dwc3-rockchip-glue-v17-5-876f96893e2f@collabora.com>
References: <20261016-b4-rockchip-dwc3-rockchip-glue-v17-0-876f96893e2f@collabora.com>
In-Reply-To: <20261016-b4-rockchip-dwc3-rockchip-glue-v17-0-876f96893e2f@collabora.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=6670;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=zy489m54ItwztWJy4TiNrj9fEHuFy31irrGRxqZ0+Uo=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGrScFYXpzBl5CMLODu0itj7DvApZWDd0aBgE
 5rG9ICSfzWZ5okCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJq0nBWAAoJENju1/PI
 O/qaiEMP/i0vmKa+2Vqy14rXKQGZKJ2CbPJ24j5OHUjgSNlcFbVN72VIBl5Rr9J37V+9jOsE76v
 VjUTtFN6pkKjRQyWNLDUET89PPvQ+w0kb8yRTVDk3h7hhxdLsjbdlE/R5zCqya9ZBpozc2UKhhA
 zgHT+SDbNIqz1yFYaX4vnYTAUZn9e5UVywu6yrlktKOmfvFxiPtKzuuGkbLuHlBCorJb0HX5A4n
 zW7do6pnXEI7wFBhUDNv+Vr4+toSqIlIV5XancszSECAQZoKrCNHeyFIvFAlk6HoGXY0nKINOb7
 m1ukOW07dpZidtzpUEFSFuWNplqj7U4A3MxZs5Kbk4TAHNq9zsWuiwHlwlgiWIESlONLeVe/82n
 RD0w2hDHwd1n7MMxctg00BJbMXM5JHLIhcOOctOFv/P6oU4tOe07lQ2mQOauoacbPbfJRUHro7f
 cIbS625tB1jDpxmIk07/91CBtKeM6RHUdHlOcUWHm6Yz9FxEdT+RkzylDZ2F0VsGjMctJwDi2lF
 pZyQhUflbw2/KiF9zMM6a/ZTNq8y8NRQPal73gOX2OLZHwMkz2bsdFrq3CMKQcNewulxSUX72Qp
 If35Zl7LHrigdmf2VAsKXDc340Cu9siI6A5G9bJdCTsDRWLnJsdmRdhQHoECsDYEGTyYnDteznB
 k2qQeqTaAM406NZWd0copkQ==
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
 drivers/usb/dwc3/Kconfig         |   1 +
 drivers/usb/dwc3/dwc3-rockchip.c | 135 ++++++++++++++++++++++++++++++++++++++-
 drivers/usb/dwc3/trace.c         |   3 +
 3 files changed, 138 insertions(+), 1 deletion(-)

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
index 4129aefd6a8b..1f32150caa09 100644
--- a/drivers/usb/dwc3/dwc3-rockchip.c
+++ b/drivers/usb/dwc3/dwc3-rockchip.c
@@ -2,11 +2,144 @@
 /* Copyright (c) 2026, Collabora Ltd. */
 #include <linux/module.h>
 #include <linux/platform_device.h>
+#include <linux/phy/phy.h>
+#include <linux/phy/rockchip-usbdp.h>
 #include <linux/pm_runtime.h>
 #include "glue.h"
+#include "io.h"
+
+struct dwc3_rockchip;
+
+/**
+ * struct dwc3_rk_phy_nb - wrapper for PHY notifier block
+ * @nb: notifier block
+ * @dwc: back-pointer to the DWC3 controller
+ * @port_index: USB3 port index this notifier is registered for
+ */
+struct dwc3_rk_phy_nb {
+	struct notifier_block	nb;
+	struct dwc3_rockchip	*dwc_rk;
+	u8			port_index;
+};
 
 struct dwc3_rockchip {
 	struct dwc3		dwc;
+	u8			phy_reset_active;
+};
+
+static int dwc3_rockchip_phy_pre_reset(struct dwc3_rockchip *dwc_rk, int port)
+{
+	struct dwc3 *dwc = &dwc_rk->dwc;
+	unsigned long flags;
+	u32 reg;
+	int ret;
+
+	/*
+	 * If already suspended, the resume path will reinit GUSB3PIPECTL
+	 * via dwc3_core_init(). A forced resume is not possible as that
+	 * would call phy_init() resulting in a deadlock. Due to the
+	 * phy_init() in the resume path there is also no need to block
+	 * async RPM resume on our side, since the PHY synchronizes it
+	 * for us.
+	 *
+	 * pm_runtime_get_if_active() returns 0 when suspended (skip),
+	 * 1 when active (ref held), or -EINVAL when PM is disabled
+	 * (device always active). In the -EINVAL case PM ref counting
+	 * is a no-op, so the unconditional put in POST_RESET is safe.
+	 */
+	ret = pm_runtime_get_if_active(dwc->dev);
+	if (!ret)
+		return ret;
+
+	/*
+	 * Assert USB3 PHY soft reset within DWC3 before the external
+	 * PHY resets. This disconnects the PIPE interface, preventing
+	 * the DWC3 from interfering with PHY reinitialization and
+	 * avoiding LCPLL lock failures.
+	 */
+	spin_lock_irqsave(&dwc->lock, flags);
+	dwc_rk->phy_reset_active |= BIT(port);
+	reg = dwc3_readl(dwc, DWC3_GUSB3PIPECTL(port));
+	reg |= DWC3_GUSB3PIPECTL_PHYSOFTRST;
+	dwc3_writel(dwc, DWC3_GUSB3PIPECTL(port), reg);
+	spin_unlock_irqrestore(&dwc->lock, flags);
+
+	return 0;
+}
+
+static int dwc3_rockchip_phy_post_reset(struct dwc3_rockchip *dwc_rk, int port)
+{
+	struct dwc3 *dwc = &dwc_rk->dwc;
+	unsigned long flags;
+	u32 reg;
+
+	spin_lock_irqsave(&dwc->lock, flags);
+	if (!(dwc_rk->phy_reset_active & BIT(port))) {
+		spin_unlock_irqrestore(&dwc->lock, flags);
+		return 0;
+	}
+
+	dwc_rk->phy_reset_active &= ~BIT(port);
+
+	/* Restore normal operation */
+	reg = dwc3_readl(dwc, DWC3_GUSB3PIPECTL(port));
+	reg &= ~DWC3_GUSB3PIPECTL_PHYSOFTRST;
+	dwc3_writel(dwc, DWC3_GUSB3PIPECTL(port), reg);
+	spin_unlock_irqrestore(&dwc->lock, flags);
+
+	pm_runtime_put_autosuspend(dwc->dev);
+
+	return 0;
+}
+
+static int dwc3_rockchip_phy_reset(void *data, int port, bool pre)
+{
+	struct dwc3_rockchip *dwc_rk = data;
+
+	if (pre)
+		return dwc3_rockchip_phy_pre_reset(dwc_rk, port);
+	else
+		return dwc3_rockchip_phy_post_reset(dwc_rk, port);
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
+		if (!strcmp(dev_driver_string(phy->dev.parent), "rockchip-usbdp-phy"))
+			rk_udphy_unregister_reset_handler(dwc->usb3_generic_phy[i]);
+	}
+
+	/* Release any PM references from in-flight resets */
+	for (i = 0; i < dwc->num_usb3_ports; i++) {
+		if (dwc_rk->phy_reset_active & BIT(i))
+			pm_runtime_put_autosuspend(dwc->dev);
+	}
+	dwc_rk->phy_reset_active = 0;
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
+		if (!strcmp(dev_driver_string(phy->dev.parent), "rockchip-usbdp-phy"))
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
@@ -26,7 +159,7 @@ static int dwc3_rockchip_probe(struct platform_device *pdev)
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

