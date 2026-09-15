Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC96647D462;
	Tue, 15 Sep 2026 13:50:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789480212; cv=none; b=HrEiI+soAFkzcGnL7fhkMEOfCXnlWh/t6EJyG60DY3i1c79lxcJuEyX/Lv1AGYWGFxFZjsELEV5QI/R1HDXvLPfJjxzxe5qpB+wEmIHLjbhUJWo8RsD0IZ5VuifdVAUIKxBaL1zHEeXNpSKoN+y1KYuPu9ApRK1uQ0pYGysywd0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789480212; c=relaxed/simple;
	bh=Er006dVNCN0LpRq6BA3LJv12AT3lwxcOksbg6+oxy6Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eDWnLlVctLRO45rzAk4Up9lKnYYvXULgS7uRbQNAwb8DvE+qK88y3KX4bRorzwnUcwxy55ywmz1lEJpby3VeCnEHVlAlCIvgQiLXolf9byiRFsYywMsFTiQOwcJm0WUJxWo5DDeSKqnSUHTKor8MdvU5aD+lBsVh9kUkZWI78js=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=H/6ZCMwa; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="H/6ZCMwa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1789480199;
	bh=Er006dVNCN0LpRq6BA3LJv12AT3lwxcOksbg6+oxy6Y=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=H/6ZCMwa5TGZXo5AVY5zHnWSjGZOfU2wfUmtf8VSdW4Npg2fK6iAujnH/dCYzKh0P
	 /KXCjVgjC/ishcT0Q0ALPGb0lrhI0sWhDgnouBE/cufoY+bRWkl1AtK2SYM+uF4BiD
	 pOY+uhQFIcDylECQljoTjuQGgRit40iUXm/Yes/XrIOOZykEXbOswWihsdF2wrYJe4
	 2WKAN+Tw3yF3Ldiz/oTl9GB35VVBlWCf3hcw3XogbDI28B9OJ2hPEE+J3ZTgARFL3t
	 vfTS9xEtMlcNAbFacuLXjj0VMbmDCmDmb6+yxHDQ3Q7+NwPogsAVwQaInKfpFF/ePn
	 YGxT5uefg8c1Q==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 2F2C417E0EF0;
	Tue, 15 Sep 2026 15:49:59 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 42E29480062; Tue, 15 Sep 2026 15:49:58 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Tue, 15 Sep 2026 15:50:03 +0200
Subject: [PATCH v15 16/16] phy: rockchip: usbdp: Register DP aux bridge
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260915-rockchip-usbdp-cleanup-v15-16-80e2c11d1ce8@collabora.com>
References: <20260915-rockchip-usbdp-cleanup-v15-0-80e2c11d1ce8@collabora.com>
In-Reply-To: <20260915-rockchip-usbdp-cleanup-v15-0-80e2c11d1ce8@collabora.com>
To: Vinod Koul <vkoul@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Heiko Stuebner <heiko@sntech.de>, Frank Wang <frank.wang@rock-chips.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: Andy Yan <andy.yan@rock-chips.com>, Dmitry Baryshkov <lumag@kernel.org>, 
 Yubing Zhang <yubing.zhang@rock-chips.com>, 
 Alexey Charkov <alchark@flipper.net>, Igor Paunovic <royalnet026@gmail.com>, 
 linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 kernel@collabora.com, devicetree@vger.kernel.org, 
 Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3258;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=Er006dVNCN0LpRq6BA3LJv12AT3lwxcOksbg6+oxy6Y=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGqpTQb9J2jpv5abw+bajDNMJE/vG4t4bhXKV
 94xqY4clMc8tYkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqqU0GAAoJENju1/PI
 O/qadeEP+waqIvOpgvQmD4ds2gHNUsiKUSXilQruRbjPn3rG1t+eeScOG32XevUeoii/384lHXR
 tprurPFkaSElZnfA93PcZtsQOEl331N/h2zEfKT2uo9DmP+YCqoQw0tggwgfDOUtciPpvzp+aE/
 Z7UspmIiE7EEo22i5EytpXoGvnBWl1seH8BKpM+g/w2zv/Mhj7R5aubvTHqJtpCUPwduWjLsF1G
 mgAuMA9rphT3ldEqzi/0I+sZ56S9h/GFarpBqyybx7GTj52VPe0TnogwsQwtM5sa9ahvjTAOLV8
 XD42OWbpEelgWarLbUzroCsZrFV3w9ULl3kAOx4KuNEOogiLc+mXRxCO603727MR0ofiwquNqPI
 NpMp6rl+s3CXIu7mqQnq9IYkJvGuT+uIbD+2vqiCQo31/RFVI+iKkCRJzJjlmy6mzV/kWMjx7ZY
 x2wAMs8tAyHC/RGe8hpFPPRVptIHJfSTK7Zk/X0bkYX8Ct3AHnMl4Hr58lTtEY+17pP7E8RLtqA
 Un/rEojYYKPi9wzCmxtc2XUGQ30s50dcQvXvz/LLy9stD3dtkFYxdGotTjdqGIdiiBxP+gQgyi5
 eT8SSdTAWZxZ/twME1xY2w2Ebcy3IQiwVAsOEfJycG9mitnRq87h1Kk5qQOxvOP5kqU84B9NiGl
 rnt31+WjYYHNaJiN2kIothQ==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A

Add support to use USB-C connectors with the DP altmode helper code on
devicetree based platforms. To get this working there must be a DRM
bridge chain from the DisplayPort controller to the USB-C connector.
E.g. on Rockchip RK3576:

root@rk3576 # cat /sys/kernel/debug/dri/0/encoder-0/bridges
bridge[0]: dw_dp_bridge_funcs
        refcount: 7
        type: [10] DP
        OF: /soc/dp@27e40000:rockchip,rk3576-dp
        ops: [0x47] detect edid hpd
bridge[1]: drm_aux_bridge_funcs
        refcount: 4
        type: [0] Unknown
        OF: /soc/phy@2b010000:rockchip,rk3576-usbdp-phy
        ops: [0x0]
bridge[2]: drm_aux_hpd_bridge_funcs
        refcount: 5
        type: [10] DP
        OF: /soc/i2c@2ac50000/typec-portc@22/connector:usb-c-connector
        ops: [0x4] hpd

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Tested-by: Igor Paunovic <royalnet026@gmail.com> # Orange Pi 5 Plus
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/phy/rockchip/Kconfig              |  2 ++
 drivers/phy/rockchip/phy-rockchip-usbdp.c | 17 +++++++++++++++++
 2 files changed, 19 insertions(+)

diff --git a/drivers/phy/rockchip/Kconfig b/drivers/phy/rockchip/Kconfig
index 14698571b607..39759bb2fa1d 100644
--- a/drivers/phy/rockchip/Kconfig
+++ b/drivers/phy/rockchip/Kconfig
@@ -136,8 +136,10 @@ config PHY_ROCKCHIP_USBDP
 	tristate "Rockchip USBDP COMBO PHY Driver"
 	depends on ARCH_ROCKCHIP && OF
 	depends on TYPEC
+	depends on DRM || DRM=n
 	select GENERIC_PHY
 	select USB_COMMON
+	select DRM_AUX_BRIDGE if DRM_BRIDGE
 	help
 	  Enable this to support the Rockchip USB3.0/DP combo PHY with
 	  Samsung IP block. This is required for USB3 support on RK3588.
diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rockchip/phy-rockchip-usbdp.c
index 8874f8429a67..fa8324879a97 100644
--- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
+++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
@@ -6,6 +6,7 @@
  * Copyright (C) 2024 Collabora Ltd
  */
 
+#include <drm/bridge/aux-bridge.h>
 #include <dt-bindings/phy/phy.h>
 #include <linux/bitfield.h>
 #include <linux/bits.h>
@@ -1413,6 +1414,7 @@ static int rk_udphy_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct phy_provider *phy_provider;
+	struct fwnode_handle *dp_aux_ep;
 	struct resource *res;
 	struct rk_udphy *udphy;
 	void __iomem *base;
@@ -1467,6 +1469,21 @@ static int rk_udphy_probe(struct platform_device *pdev)
 			return ret;
 	}
 
+	/*
+	 * Only register the DRM bridge, if the DP aux channel is connected.
+	 * Some boards use the USBDP PHY only for its USB3 capabilities. The
+	 * aux bridge itself will be registered using port 0, endpoint 0, which
+	 * is fine as that is the actual superspeed data connection shared by
+	 * USB3 and DP based on the mux config.
+	 */
+	dp_aux_ep = fwnode_graph_get_endpoint_by_id(dev_fwnode(dev), 3, 0, 0);
+	if (dp_aux_ep) {
+		ret = drm_aux_bridge_register(dev);
+		fwnode_handle_put(dp_aux_ep);
+		if (ret)
+			return ret;
+	}
+
 	udphy->phy_u3 = devm_phy_create(dev, dev->of_node, &rk_udphy_usb3_phy_ops);
 	if (IS_ERR(udphy->phy_u3)) {
 		ret = PTR_ERR(udphy->phy_u3);

-- 
2.53.0

