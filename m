Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=54.206.34.216
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792481351;
	b=07u3ErRBbTXSCjtE+KdK/jNn/+buqE4veUleJ2eq7uO6p6t0tBHf2bcOf0HTxQkbB1yE
	 ebFF+/lbh9lLqFtpnIxWoYv+LYYa2Bmui1a8qpGzLY4mktZPEYQLHrNj/JPxPQV4IGpX1
	 mamPskWuaOTgjKcOgZYn1y0HTIO0z7SARh7pH0a6eUVhxZPSSyyGAHLxiyCwhu/42T1YU
	 uTDF3cdphLks7Q3o/017YCIXGNLjqcQlbMIxHJr/jyT+zHYCpvI/FWeGmp1hWvo6LVRxc
	 2jT2iKLidKRu39xH0Nx5mR4Jo4SwVtblxWMVqIPTVNtAvZSNfZv45WwWhBnLuilazdQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792481351;
	h=DMARC-Filter:DKIM-Signature:X-QQ-mid:X-QQ-Originating-IP:Received:
	 X-QQ-SSF:X-QQ-GoodBg:X-BIZMAIL-ID:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:In-Reply-To:References:X-QQ-SENDSIZE:Feedback-ID:
	 X-QQ-XMAILINFO:X-QQ-XMRINFO:X-QQ-RECHKSPAM;
	bh=zucQVzSIUw03oJCE6b3rhFHV2mvKBR8XAIBKZOC9G3s=;
	b=Wx1mknQniU+9VP0S4oLBe88tsiHdF1+fXWAQujp4pcXFNSbg7Z9Cw5/3+eA73iOkCqjQ
	 sU9CvMj8iOn7GoghJfgqlOfcfigdySdT9SOfVLPsmAhrlWUyL2Ccm4Db3Q2Qu5gH08lB+
	 vV2iITUdXvgApjIuCp8AfJa94Fb7FWQlQZz0Ggz4nZdzU2VGR6HR75YAWzy+kyFbmEO9C
	 haYtWDu9odfR6eWjqwLsrccKoDPbj6Srr/+tGrStqF7z3tzVHMIIU0yp9Sm6F8wgLOuc+
	 aQKvfqWT/8DP4dzkj+yMYpP06toUkUDCn/wnKw3GqcEJwC9+eeKFLyB3rviqaS48zng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=airkyi.com;
	spf=pass smtp.mailfrom=airkyi.com;
	dkim=pass header.d=airkyi.com header.i=@airkyi.com header.a=rsa-sha256 header.s=altu2504 header.b=jnTTEaZZ;
	arc=none smtp.remote-ip=54.206.34.216
Received: from smtpbgau2.qq.com (smtpbgau2.qq.com [54.206.34.216])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A26B6606A31D
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 07:29:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A26B6606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=airkyi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=airkyi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=airkyi.com header.i=@airkyi.com header.a=rsa-sha256 header.s=altu2504 header.b=jnTTEaZZ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=airkyi.com;
	s=altu2504; t=1792481330;
	bh=zucQVzSIUw03oJCE6b3rhFHV2mvKBR8XAIBKZOC9G3s=;
	h=From:To:Subject:Date:Message-Id;
	b=jnTTEaZZgIfJ04DaD6PtJIG75Y5A6w4kObK/NPlErOXlsS48qqk9SkGcvFXtzjQII
	 z9cu0mY6Tcw/xvjLNxKNSqSzhbXon+wqJnkB03PQFbW33ae618dubqZPZM1oFIpaR2
	 AUXx9P9mEsg8scujbsxnw2LGytzwvVsieuSZwNEM=
X-QQ-mid: zesmtpsz4t1792481329ta1e1f4ab
X-QQ-Originating-IP: sJwipE1O7diWFwQRtlG8p3SLGNUGaH/9cyjMchI0jJw=
Received: from DESKTOP-8BT1A2O.localdomain ( [61.154.14.86])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 20 Oct 2026 15:28:43 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 10529716609256406642
From: Chaoyi Chen <kernel@airkyi.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Sandy Huang <hjc@rock-chips.com>,
	=?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
	Andy Yan <andy.yan@rock-chips.com>,
	Vinod Koul <vkoul@kernel.org>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-phy@lists.infradead.org,
	Chaoyi Chen <chaoyi.chen@rock-chips.com>
Subject: [PATCH v8 2/7] drm/bridge: Implement generic USB Type-C DP HPD bridge
Date: Tue, 20 Oct 2026 15:28:11 +0800
Message-Id: <20261020072816.180-3-kernel@airkyi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20261020072816.180-1-kernel@airkyi.com>
References: <20261020072816.180-1-kernel@airkyi.com>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:airkyi.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: NiOJPUCsZYq4TBT0dEnL9o4WUPis8EN4GyVl6ei4NWxPjnN2C3luhk6U
	8YLpMeaxQQw0NrFK/wCnWZjHe1yAVT/toFnHv4EZHFzFvLz5gvL03WK4ECFMqbCdGYcJiCw
	+rZ357sl0PU5cnP0nqmzmWqlg+NN7/pRfYdZ1fxPUMLyPe3NnI6X4ynryQFHfahYze4wuvZ
	V8RjlD3WaWiNYMF6R0KKAnCH8qxuwm+yeg0+iu753U+iqcNMmslSgvVAHIZwSUNJ3M9rJjm
	BdQvCyOBwUWStblC4YKoyrsZ8xCkcjUbVtuXOg3X+UY2bX7ukIwsWdeuIPHVGfVoy/buclg
	546UxGLj/joLTlswla9KlYLJ/UjN2pYBTRM0HOWnIzUCAxOvs+wZJjEfJyOviHo0LZsC0cw
	ODuwhaRCW8/Z3CGNx9jzWoie62hI4rSCS/FEX2ogAOIAxfU6FZRFKVShI9C7LGZZD2uasUf
	bJ5w3mlfXeYF4A/+jnGrhUSFQ5I3qlwh9TtCdLQLjZ34OHppSh52Ce44QmTp2AgKvhObF0C
	bXt6pVrGdQLdVosvgkwhJ1sl9UbCQLeTYc2bmKOsC/Q8V3ik9abbY38/fTXysjwpaFzYLZ5
	CbeNsP4inVlwISTaHtAOewqbI2Sl9Iuu3Lhsqn774/ltk87ivJ7sIluvgV/4GkzqDa3r8Ba
	/YW5CAaqkbjrj8K/NCavTd2DX+qzZYskEy57oY6J1bnBw9XVIfZV8xJXiMessvBmiu0+zfk
	UM+DWSnWDTevdet3UEe0tfg6IT73pqzjzkqFedXZGX4wetIpLe1pp+khXuKhc/if02yjz3A
	KAha7S34xU5T9wj6JeWaqBCIae1GktFvfymtoaSNEDE/m6CE8BVan3a/4aEwCNPdPNOIGto
	pprHEbn4j4nuHHwPgfPqB1bIOO+hSa+tSk6POWB40UAsR1nsLeZ2IAHD9WMXlPfsuGKyqiy
	mQFK+mtzuvD9y1yjAulKAeKM5UHDd/ubNZBGhiuy0KdJEqIiBqmVrPslK5xZDZhiRDRrbM6
	6XByt68b5rKLJCb8MikFTC3s5DQa/w+KrNVqPo7xZbdseO/xjK
X-QQ-XMRINFO: OD9hHCdaPRBwH5bRRRw8tsiH4UAatJqXfg==
X-QQ-RECHKSPAM: 0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list

From: Chaoyi Chen <chaoyi.chen@rock-chips.com>

The HPD function of Type-C DP is implemented through
drm_connector_oob_hotplug_event(). For embedded DP, it is required
that the DRM connector fwnode corresponds to the Type-C port fwnode.

To describe the relationship between the DP controller and the Type-C
port device, we usually using drm_bridge to build a bridge chain.

Now several USB-C controller drivers have already implemented the DP
HPD bridge function provided by aux-hpd-bridge.c, it will build a DP
HPD bridge on USB-C connector port device.

But this requires the USB-C controller driver to manually register the
HPD bridge. If the driver does not implement this feature, the bridge
will not be create.

So this patch implements a generic DP HPD bridge based on
aux-hpd-bridge.c. It will monitor Type-C bus events, and when a
Type-C port device containing the DP svid is registered, it will
create an HPD bridge for it without the need for the USB-C controller
driver to implement it.

Signed-off-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>
Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Reviewed-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Reviewed-by: Sebastian Reichel <sebastian.reichel@collabora.com>
Tested-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
(no changes since v7)

Changes in v6:
- Avoid duplicate registration of the same DisplayPort HPD bridge. 

(no changes since v5)

Changes in v4:
- Scan the entire typec_bus and attempt to register the hpd bridge,
  so as not to miss devices that were already added during initialization.

(no changes since v3)

Changes in v2:
- Add copyright text.
- Remove useless goto.
---
 drivers/gpu/drm/bridge/Kconfig                | 10 +++
 drivers/gpu/drm/bridge/Makefile               |  1 +
 .../gpu/drm/bridge/aux-hpd-typec-dp-bridge.c  | 67 +++++++++++++++++++
 3 files changed, 78 insertions(+)
 create mode 100644 drivers/gpu/drm/bridge/aux-hpd-typec-dp-bridge.c

diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kconfig
index 4a57d49b4c6d..9739b2a19758 100644
--- a/drivers/gpu/drm/bridge/Kconfig
+++ b/drivers/gpu/drm/bridge/Kconfig
@@ -30,6 +30,16 @@ config DRM_AUX_HPD_BRIDGE
 	  Simple bridge that terminates the bridge chain and provides HPD
 	  support.
 
+if DRM_AUX_HPD_BRIDGE
+config DRM_AUX_HPD_TYPEC_BRIDGE
+	tristate
+	depends on TYPEC || !TYPEC
+	default TYPEC
+	help
+	  Simple bridge that terminates the bridge chain and provides HPD
+	  support. It build bridge on each USB-C connector device node.
+endif
+
 menu "Display Interface Bridges"
 	depends on DRM && DRM_BRIDGE
 
diff --git a/drivers/gpu/drm/bridge/Makefile b/drivers/gpu/drm/bridge/Makefile
index 15cc821d85b7..d88a9e1ccc9a 100644
--- a/drivers/gpu/drm/bridge/Makefile
+++ b/drivers/gpu/drm/bridge/Makefile
@@ -1,6 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0
 obj-$(CONFIG_DRM_AUX_BRIDGE) += aux-bridge.o
 obj-$(CONFIG_DRM_AUX_HPD_BRIDGE) += aux-hpd-bridge.o
+obj-$(CONFIG_DRM_AUX_HPD_TYPEC_BRIDGE) += aux-hpd-typec-dp-bridge.o
 obj-$(CONFIG_DRM_CHIPONE_ICN6211) += chipone-icn6211.o
 obj-$(CONFIG_DRM_CHRONTEL_CH7033) += chrontel-ch7033.o
 obj-$(CONFIG_DRM_CROS_EC_ANX7688) += cros-ec-anx7688.o
diff --git a/drivers/gpu/drm/bridge/aux-hpd-typec-dp-bridge.c b/drivers/gpu/drm/bridge/aux-hpd-typec-dp-bridge.c
new file mode 100644
index 000000000000..682bc192e093
--- /dev/null
+++ b/drivers/gpu/drm/bridge/aux-hpd-typec-dp-bridge.c
@@ -0,0 +1,67 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright (C) 2026 Rockchip Electronics Co., Ltd.
+ *
+ * Author: Chaoyi Chen <chaoyi.chen@rock-chips.com>
+ */
+#include <linux/of.h>
+#include <linux/usb/typec_altmode.h>
+#include <linux/usb/typec_dp.h>
+
+#include <drm/bridge/aux-bridge.h>
+
+static int drm_typec_bus_event(struct notifier_block *nb, unsigned long action,
+			       void *data)
+{
+	struct device *dev = (struct device *)data;
+	struct typec_altmode *alt = to_typec_altmode(dev);
+	struct device_node *np;
+
+	if (action != BUS_NOTIFY_ADD_DEVICE)
+		return NOTIFY_OK;
+
+	/*
+	 * alt->dev.parent->parent : USB-C controller device
+	 * alt->dev.parent         : USB-C connector device
+	 */
+	if (is_typec_port_altmode(&alt->dev) && alt->svid == USB_TYPEC_DP_SID) {
+		np = to_of_node(alt->dev.parent->fwnode);
+		if (!drm_dev_has_dp_hpd_bridge(alt->dev.parent->parent, np))
+			drm_dp_hpd_bridge_register(alt->dev.parent->parent, np);
+	}
+
+	return NOTIFY_OK;
+}
+
+static struct notifier_block drm_typec_event_nb = {
+	.notifier_call = drm_typec_bus_event,
+};
+
+static int check_device_already_added(struct device *dev, void *data)
+{
+	drm_typec_bus_event(NULL, BUS_NOTIFY_ADD_DEVICE, dev);
+	return 0;
+}
+
+static void drm_aux_hpd_typec_dp_bridge_module_exit(void)
+{
+	bus_unregister_notifier(&typec_bus, &drm_typec_event_nb);
+}
+
+static int __init drm_aux_hpd_typec_dp_bridge_module_init(void)
+{
+	bus_register_notifier(&typec_bus, &drm_typec_event_nb);
+	/*
+	 * Before module initialization, some devices may have already been added.
+	 * Register the HPD bridge for these devices.
+	 */
+	bus_for_each_dev(&typec_bus, NULL, NULL, check_device_already_added);
+	return 0;
+}
+
+module_init(drm_aux_hpd_typec_dp_bridge_module_init);
+module_exit(drm_aux_hpd_typec_dp_bridge_module_exit);
+
+MODULE_AUTHOR("Chaoyi Chen <chaoyi.chen@rock-chips.com>");
+MODULE_DESCRIPTION("DRM TYPEC DP HPD BRIDGE");
+MODULE_LICENSE("GPL");
-- 
2.53.0

