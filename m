Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.251.105.195
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794618170;
	b=YSYCeAWf2t4kiGC+ArmT/x4+IM67yOCRPbu6RZw6D08DqHL74ouHYJ99clQ3PiO1ZrMe
	 MmMpTU0AELvbFWwNV2nBomUPNxDgQSrG4qERYrqPTEFb81yP7Bw1/OuBMgkHJK7GZ7w0k
	 TJwwmCao+9BlXMc6ZpCUpCnA5ETA6tuK4L7L0iQJyCKBqq/5qe7n4pB8u8lGQa6Lo71SG
	 PrqqUAPwnfuidkYqmhr5YvullWS1jK262wxj4Id4ap736lub2FZThBqEN5KVGjKuWkcyJ
	 u2LBifuO3EBPGiSXqPtocmwHnxZYMjx53VcF3XkhiHPBZ1YW9HnNQ+5RvMGld9rvsUA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794618170;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=DCOF3NCjRAnzgtO++gNbH5JnE7lsRWCDVx8OpPriKsE=;
	b=VCRzbzJwKsPan8aBEsNjVdVL/hLsRi79NxGVRxHWHjpImg4jnKiOyjKYKj+S1p7iPuTH
	 WQPJtshIVBSJpSA6Mzio4OxLIbTrFmfRtJDLdZTgLRIaesFoAFJArnPzdDqjhZjMECd4d
	 6jnWcUOqNwhXeSznvKeFRcBA2OowOiPUL9RcOQN6EfCw68ClXN7cv0dHRLI8BzFlOAonu
	 VT2bZsTR4cT0O+QY2lvy14RRUSiRquhkcY1WbsqYvaalI1kBS5zANm3WVdLIFSYwNgZPG
	 nsaLd5dYUEgosA8plefx9NOGULehHUnfyYkFXcC7HPY7SYtGt42xb8H3SU4MPSJfHtg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=VCi3Z3uf;
	arc=none smtp.remote-ip=148.251.105.195
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DAD9606A33B;
	Sat, 14 Nov 2026 01:02:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0DAD9606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=VCi3Z3uf
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1794618166;
	bh=pBZ5M59RSelm0DfioXvFjoG0yRkd8fiO0V675Mt5KOw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=VCi3Z3uf25D+yHKm30WQBA6C4GBRy8Na1Oo2fPb9E0nbqP+sXRI87+iovlkg3g6rA
	 47BHAiRlaNqg1cMzjVXyfXQBcpf+D1nfw10/xkSbq4L10mw8pXug9UqS1qK5QT16W3
	 +THcV41vNktos/bwhfrZtixGGWkMvafdcVqMYCN1uiKIwrjUEZ7l30R9UMchCOU6VT
	 K2SGNIwWppNt0/4YMGeXCnC3rYOrp1uuUElLwu3ZaMLC9yXQ5r3ixdNGLjuwObhSq6
	 fIad2D6yBx6hg5KVyoz04ZyzWZCK8Qe+SSwXj1rnsMGbkmwKB2KQo94AQq8nECRzwi
	 UbJ5jArVbxPtQ==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 0BBA417E0CD7;
	Sat, 14 Nov 2026 02:02:46 +0100 (CET)
Received: by jupiter.universe (Postfix, from userid 1000)
	id C2C20480030; Sat, 14 Nov 2026 02:02:45 +0100 (CET)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Sat, 14 Nov 2026 02:02:01 +0100
Subject: [PATCH v19 2/6] phy: rockchip: usbdp: Add reset hook support for
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
Message-Id: <20261114-b4-rockchip-dwc3-rockchip-glue-v19-2-b79fb5f4b42a@collabora.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5192;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=pBZ5M59RSelm0DfioXvFjoG0yRkd8fiO0V675Mt5KOw=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGr3szVeFBdWByBD9BEsq9b/yhWEGernkLCdb
 RPSZ8nQ9rDyhokCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJq97M1AAoJENju1/PI
 O/qaAEUP/0FGtPXm+PfPCZNsaScI/Ta1BA4p6R3l3cxb5s0mY6mU9IoHcIaR4wd60KuLDjwsIfR
 P+r9qbuKkr3VE5Lso2UcqoQ9cJRNEJ5CiQbNpNSBJ/edKuER7w2dz41/nxwcaxrL5s9ITbQ4a1W
 krWdOJ6j2GfFl8ozUPdr7sMdqDtY6nsA9Fg9a+JEZfF97ovsx3oDGkZIlav7ozEJlzFcKejkbsx
 zqla9xjTjZk/vPdBieJoHNMCBZfr69q3UqME3irjaIQiwxA2NVB8xJPCZjp74c2/v8yfCYHXtoe
 Z1LBiLIux0PnqyZflYHvhUC/7MskLt2LwOUMNNHI0oUboilrDxhRq6HZSjEhKAs57lA88Rrg8gQ
 IuYvOz2A7ndYCyx6IBajY4HE77CcgF5yEwYHPiJ4TlRxT4spKmMcIvV/0DPsAsSGB9Jdqp/xfNv
 yjQbou9Z3P1BXPyyCuj8OTBJ/2hgJ3RNr/j3JYIkRX5NHxDSFtAbbpF8m1lH4hMVQk0v54H9Cu8
 r+OV8Bsx6Nc53gLNHYobkK50eG7/h9hRb1jvLkzOwtNB+gW6MxR2gs0mA/7mfsNI+swTOpGsq8t
 KKSOx/zFslv5jhpEoEVwjRVlo4QEMEmho3fG3qKU33nAsdSgWrVwbcj31/6FqzysRNpUzN5OK0O
 2BYCUVWCoz09yAZIEQuExwg==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A

When TCPM (Type-C Port Manager) triggers an orientation or mux
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

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Tested-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-usbdp.c | 60 +++++++++++++++++++++++++++++--
 include/linux/phy/rockchip-usbdp.h        | 31 ++++++++++++++++
 2 files changed, 89 insertions(+), 2 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rockchip/phy-rockchip-usbdp.c
index cb1f455accf8..9c6d921b9191 100644
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
+EXPORT_SYMBOL_GPL(rk_udphy_unregister_reset_handler);
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
+EXPORT_SYMBOL_GPL(rk_udphy_register_reset_handler);
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

