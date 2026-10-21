Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.251.105.195
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792605952;
	b=3JSxnPiuHx26iuuloItGlS8gjqiat315dqJMnJV30PqhyYpRSwqACU1CPVVz21hLLtGk
	 Kpko9wUc6/qug2W5WGL/PcIVnhJgLr5koQyZpOAh3saYcNZvM7NiHpXZQnAZFEDyZnwEB
	 46q2WygffUCGGer51CRg2WPsINevcG5y1dZ3EUribLWnUvpaRqQS1FFP6wArvak0bymSZ
	 UaqqQRiU8/wfkj2DhqjSdi4A9iRRob1JRCofX6CqJIBpzl3IkNP+inM0+tY65SPURB8Qn
	 Z+TQCcOIMWtQ7I05JXrlUzA6c9WlQXJpeMuDcBleR6x9yOlUzAUyr7gCIUhDKnURuHA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792605952;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=AJCrdCDNjGUfUWfP/t17vdtV3ZAlW99PLvfAiw3Nk4g=;
	b=Ai/7jsPFeRnIJKr3hlSCKMxqT5TbsHrI5e1h6s6NaEQBB8qZATKZLHY5iZSEIecVSLga
	 Nq67CYjyyPN8nNjRTMUdzdCeIilfAhOqtyHcP1neA99aryyxFc5KSv719Ra4EkpAASW1Q
	 PK8DEHM3A7va7DOuXGXmChVW2e9HkoJlDx0p2rXodAS7EyPbUkfC/Z61IKzGjGnHSzOmv
	 7XLI8GPpZ4oe3Pj09Hszgu01wyHg7D1T3MG5UiQrUHvK0KCzkM0ihSfmE92H+QqPbdSaf
	 e+MSO+KnH7j9N+8KgrjPxutYZsxR13AZW4qia/PvsfeuVeRQ+BpWwNNanmZBjIsLPSA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=RSuf21aX;
	arc=none smtp.remote-ip=148.251.105.195
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 764A9606A325;
	Wed, 21 Oct 2026 18:05:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 764A9606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=RSuf21aX
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1792605943;
	bh=P4mI3jVORdFOS0hLbLmfPfeRfTH3pEbYoF72Q6pG7+Q=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=RSuf21aXdyPZWIyhF9vwsgBeIkdUZV60wvudJ4vRzZm1KVyrRxRJgfNngK+o0bMCA
	 zMhMYLV6ryIivoj9uWI6Cm/KrTWI4+78fd1e7YZk0wB5PO7Onq2oc/oxxR8K6++17C
	 d0LLU7g+qz3WYuYL9rU6XOE6X7dUfLcakZt6beJXwp/yz6yxKg30JGnCQYxHwJf5i4
	 /MBa0hs3rWBoDYYXBGwlZHnXJNiGeJwaCMFcMnJz82CJOTx6RvOm9TT8s7+fG+LAHt
	 vYiCoO/Bzk5K2jjlyzXZeFTvFCuuYU/vDtobujyW96YkbaUYhLb5ZzzrCNX5KKBFGH
	 bfqZNvHrA6+pQ==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id A02CE17E08D8;
	Wed, 21 Oct 2026 20:05:43 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 6357848002F; Wed, 21 Oct 2026 20:05:43 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Wed, 21 Oct 2026 20:05:27 +0200
Subject: [PATCH v18 2/7] phy: rockchip: usbdp: Add reset hook support for
 dwc3
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
Message-Id: <20261021-b4-rockchip-dwc3-rockchip-glue-v18-2-60000d03fca2@collabora.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5053;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=P4mI3jVORdFOS0hLbLmfPfeRfTH3pEbYoF72Q6pG7+Q=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGrY/vfJ60A/eFrS1inhBnPWu50D0qonUw6jS
 RzZy2yoUNxjC4kCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJq2P73AAoJENju1/PI
 O/qaQKQP/jeggayT5hQ8EMcCSEr5qB9OuapKcw6neMxNBT7BoOnCUIU3yobpKeOXIrxf9puRX0Q
 KEaQko0sVkWQXVeqLIPuA/qif2YNh1IfONiBdypGmXdw8QYPzy41zENlFRNEo076AGk/xHx+b5a
 g02hInf5Oixt2PQi3iR7cw/TFXk36oLHZCxHnXW55RdLeFbXr16Eo3IONIpFNVEHyQxExyYa8AR
 c367B9SKKbpkbC/DGewnBsRhnvbUZDO1n6s9XVtXgiLeLjetE9KeExZERcvuzbFfAPX25PrnihE
 QgvGgpIcsKa4pXuXUJr4apPxQ6CAnf2uw3HJjN6nOsCLHsZs33FbnVbyPMsd79qKtDgI4XqI4Uh
 MkofvMS3L6o5zuaZkP8oI5Kh30BQ5IRKAFhdJqiDXvRZ41j5KKKJ9R9QxXwMAy0YKMbvtPq5Xma
 2VPxDD6ExErAc2jnSO4Cfg9dQT1BUbfa3qq1CmpqxhIqOUNEsIAJavz4xtK++hhS/ZMMyEONBUs
 I6xP0rSxo/Rpc2IqS5NE0AISgZjaHETxNkmP8b7SbDA2+nxOBaqUQkczyQ9kcJVh7nqyOBY/tf9
 CeiORhWiDNW73HiRw6XyLPQNWBPqdcPEtMiShXcfFFN8PbBA40qmGgdlixbnAK9ajbE9vNVIBq6
 jicWoPXLZaI5q7M5GbAAxeA==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A

When TCPM (Type-C Port Manager) triggers a orientation or mux
change, the PHY needs to reset. This results in the PHY no longer
providing a clock to the USB controller. If the USB controller
registers are accessed without the clock, SErrors are generated.

This can be avoided by switching the clock provider for the USB
controller. But after switching the clock, the USB PHY sometimes does
not succeed to lock its "cmn ana lcpll" PLLs again. I suspect this is
due to a clock glitch and after some debugging figured out that this
can be avoided by disabling the USB controller's PIPE interface while
the PHY reset is ongoing.

Implement an API that allows the USBDP to actively request a reset
from DWC3 as a quirk.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-usbdp.c | 60 +++++++++++++++++++++++++++++--
 include/linux/phy/rockchip-usbdp.h        | 31 ++++++++++++++++
 2 files changed, 89 insertions(+), 2 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rockchip/phy-rockchip-usbdp.c
index cb1f455accf8..6fb6b0c0860b 100644
--- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
+++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
@@ -19,6 +19,7 @@
 #include <linux/module.h>
 #include <linux/mutex.h>
 #include <linux/phy/phy.h>
+#include <linux/phy/rockchip-usbdp.h>
 #include <linux/platform_device.h>
 #include <linux/property.h>
 #include <linux/regmap.h>
@@ -179,6 +180,9 @@ struct rk_udphy {
 
 	/* utilized for USB */
 	bool hs; /* flag for high-speed */
+	void (*dwc3_reset_handler)(void *data, int port, bool pre);
+	void *dwc3_reset_data;
+	int dwc3_reset_port;
 
 	/* utilized for DP */
 	struct gpio_desc *sbu1_dc_gpio;
@@ -995,6 +999,46 @@ static int rk_udphy_parse_dt(struct rk_udphy *udphy)
 	return rk_udphy_reset_init(udphy, dev);
 }
 
+static void rk_udphy_run_reset_handler(struct rk_udphy *udphy, bool pre)
+{
+	if (!udphy->dwc3_reset_handler)
+		return;
+
+	if (!(udphy->sw_mode & UDPHY_MODE_USB))
+		return;
+
+	if (udphy->hs)
+		return;
+
+	udphy->dwc3_reset_handler(udphy->dwc3_reset_data, udphy->dwc3_reset_port, pre);
+}
+
+void rk_udphy_unregister_reset_handler(struct phy *phy)
+{
+	struct rk_udphy *udphy = phy_get_drvdata(phy);
+
+	guard(mutex)(&udphy->mutex);
+
+	udphy->dwc3_reset_handler = NULL;
+	udphy->dwc3_reset_data = NULL;
+	udphy->dwc3_reset_port = 0;
+}
+EXPORT_SYMBOL(rk_udphy_unregister_reset_handler);
+
+void rk_udphy_register_reset_handler(struct phy *phy,
+				     void (*reset_handler)(void *data, int port, bool pre),
+				     void *data, int port)
+{
+	struct rk_udphy *udphy = phy_get_drvdata(phy);
+
+	guard(mutex)(&udphy->mutex);
+
+	udphy->dwc3_reset_handler = reset_handler;
+	udphy->dwc3_reset_data = data;
+	udphy->dwc3_reset_port = port;
+}
+EXPORT_SYMBOL(rk_udphy_register_reset_handler);
+
 static int rk_udphy_power_on(struct rk_udphy *udphy, u8 mode)
 {
 	int ret;
@@ -1005,24 +1049,36 @@ static int rk_udphy_power_on(struct rk_udphy *udphy, u8 mode)
 	}
 
 	if (udphy->status == UDPHY_MODE_NONE) {
+		rk_udphy_run_reset_handler(udphy, true);
+
 		ret = rk_udphy_setup(udphy);
-		if (ret)
+		if (ret) {
+			rk_udphy_run_reset_handler(udphy, false);
 			return ret;
+		}
 
 		if (!udphy->hs && udphy->mode & UDPHY_MODE_USB)
 			rk_udphy_u3_port_disable(udphy, false);
 		udphy->phy_needs_reinit = false;
+
+		rk_udphy_run_reset_handler(udphy, false);
 	} else if (udphy->phy_needs_reinit) {
+		rk_udphy_run_reset_handler(udphy, true);
+
 		rk_udphy_u3_port_disable(udphy, true);
 		udelay(10);
 
 		ret = rk_udphy_init(udphy);
-		if (ret)
+		if (ret) {
+			rk_udphy_run_reset_handler(udphy, false);
 			return ret;
+		}
 
 		if (!udphy->hs && udphy->mode & UDPHY_MODE_USB)
 			rk_udphy_u3_port_disable(udphy, false);
 		udphy->phy_needs_reinit = false;
+
+		rk_udphy_run_reset_handler(udphy, false);
 	}
 
 	udphy->status |= mode;
diff --git a/include/linux/phy/rockchip-usbdp.h b/include/linux/phy/rockchip-usbdp.h
new file mode 100644
index 000000000000..44e0bc7d1d40
--- /dev/null
+++ b/include/linux/phy/rockchip-usbdp.h
@@ -0,0 +1,31 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * Rockchip USBDP Combo PHY with Samsung IP block driver
+ *
+ * Copyright (C) 2026 Collabora Ltd
+ */
+
+#ifndef __ROCKCHIP_USBDP
+#define __ROCKCHIP_USBDP
+
+#include <linux/phy/phy.h>
+
+#if IS_ENABLED(CONFIG_PHY_ROCKCHIP_USBDP)
+
+void rk_udphy_unregister_reset_handler(struct phy *phy);
+void rk_udphy_register_reset_handler(struct phy *phy,
+				     void (*reset_handler)(void *data, int port, bool pre),
+				     void *data, int port);
+
+#else
+
+static inline void rk_udphy_unregister_reset_handler(struct phy *phy)
+{ }
+static inline void rk_udphy_register_reset_handler(struct phy *phy,
+					    void (*reset_handler)(void *data, int port, bool pre),
+					    void *data, int port)
+{ }
+
+#endif
+
+#endif

-- 
2.53.0

