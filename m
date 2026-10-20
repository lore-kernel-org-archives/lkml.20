Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=54.206.16.166
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792481371;
	b=ZU2zgwhYPRMtJqDaymdT6sw91aswmuvvaC7Hrv4Cgdz83ORhxp0iDUjQi3SVahrM3q34
	 4fYKVZH3CSWaEVp0dO23DT37rfvBDmJHg1nf73iHBabcXHzB+W+QK9P/QCMHshiBOFWs/
	 aW06O+A5a09O7LhxcE03oxbXU0j3XSZSN3Y8Km3P7y6ASS0LXF3c8wyEI7VcqGXlntcV2
	 Ok9oYTQWTHIbmE+stg3oT4Elu+FvVQxcoQEPCPUXbEDv4BAKLDakJeKXEIajkbHWgjTpD
	 j0urpADNTZYwuxLB0k4NNqiQpZsBsfH5dJt6J7rEfRp+FRedSZbKFhLcUDsCAURSXHg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792481371;
	h=DMARC-Filter:DKIM-Signature:X-QQ-mid:X-QQ-Originating-IP:Received:
	 X-QQ-SSF:X-QQ-GoodBg:X-BIZMAIL-ID:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:In-Reply-To:References:X-QQ-SENDSIZE:Feedback-ID:
	 X-QQ-XMAILINFO:X-QQ-XMRINFO:X-QQ-RECHKSPAM;
	bh=6sfgVQRfPeZB9Hqtz18Dzql0K28fc/y+GbntbfCgIfE=;
	b=49oXL/8NO/SnQQWsJt59RmePZ31Ch62IYl5uuYURUq282craXNhEH9CAidHapmyswuSt
	 rx6Gjj/njVZIQSyWVLg7dV3qqbcQf3s+JdC9527YSRMPGtnedPG8KU7LJxIagnAakLsQT
	 mmckhkRNVgetaVi8AHlkjPxB/3qMW5l447yrhZ1Mr8BnBTMGUjj+l0pcirlyEg2mfIhXD
	 SRsNaXZAXkF09SuLUqp/0eiYpmV3Lk4CoW55UGY4q8QqGjo6or7xe5raQQlSd4hS7BU2J
	 ZexoxxMAGd13KdonUdUwBhaDWC0rwR7XFDzWETR01l3p5Kw454kEm/ZSEg4XT7bZ9nQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=airkyi.com;
	spf=pass smtp.mailfrom=airkyi.com;
	dkim=pass header.d=airkyi.com header.i=@airkyi.com header.a=rsa-sha256 header.s=altu2504 header.b="WT6M/EEs";
	arc=none smtp.remote-ip=54.206.16.166
Received: from smtpbgau1.qq.com (smtpbgau1.qq.com [54.206.16.166])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D425606A31E
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 07:29:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0D425606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=airkyi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=airkyi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=airkyi.com header.i=@airkyi.com header.a=rsa-sha256 header.s=altu2504 header.b=WT6M/EEs
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=airkyi.com;
	s=altu2504; t=1792481357;
	bh=6sfgVQRfPeZB9Hqtz18Dzql0K28fc/y+GbntbfCgIfE=;
	h=From:To:Subject:Date:Message-Id;
	b=WT6M/EEsTu+08B7cJ5zQbVxVyWnWuSfe9WH43N0wEmglhPh0ttjJ7HahuSjrfIzEo
	 NgUKkIVnZQ0vZV+lHBUcrp/glzqZ2UJ6kYMydbzo6p5hNspsrBD9dONQ9MAJzkMG8G
	 44M1tI/U4WdKJc2PqHxO6mNrZdNL36oxH4cX3BQQ=
X-QQ-mid: zesmtpsz4t1792481356t7b55ba3e
X-QQ-Originating-IP: PoqMp8+AGb8p9Ii/rbgBGbxueQB7iyGiD+n5xnkg/z8=
Received: from DESKTOP-8BT1A2O.localdomain ( [61.154.14.86])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 20 Oct 2026 15:29:10 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 9572358570521721433
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
Subject: [PATCH v8 6/7] drm/rockchip: cdn-dp: Support handle lane info without extcon
Date: Tue, 20 Oct 2026 15:28:15 +0800
Message-Id: <20261020072816.180-7-kernel@airkyi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20261020072816.180-1-kernel@airkyi.com>
References: <20261020072816.180-1-kernel@airkyi.com>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:airkyi.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: MJ6jNhKcfW6R3v6PMslEjS4Ucgmtk3fxIbs0sX9Fh0AEvgILYysUQUa4
	SOFUOQ4izeEqXR7uSHS1LaO1aR9AynQzg7hflkwTr7Xxo8QE1OFyjFLCxjOiruqxAp0lU36
	9fX5BClBOxUb/Wh+65gQz65b4GcZesEBQQc+pp7WJy0hRamqf5ePiSwTfJB2mOCKwTseabB
	XMgOxRZBaj8pUbzDYUi9KMMC3yBA55h8B2b01Qors2MUZZErL2tgE39El6H9/1+310LFXgY
	RpLs9uxK+13j7Fcg+njLlfrTQCSblgf1l8o2tvLE/X+9g9jxjz4TiV9Nlxx9CCcFfz7DK0j
	Iz1c6pUiMznMJ7UQgAbmFeIRCWd4tuOPEP2Nu6V9XwbxKMoybCada55gp5Xgpb61v+K5FlE
	LJme9+4xHy0o5Kaw1qVkf+NgzdHBywPAgA0z3vmU6l7LooV+cha8/SuACG9l/d5aFHEooDA
	mii60NtJZu1vpJKuGiQafIcqZYwVNEaewC7xSXWtlP13jZiEfcD3JPQ/tqpC3UVis0lC08P
	iJkOhI1uriGVEvUIkLXC4ni5TYurvzL65kU2ldy73PAW72dQEhLiPS2QW111q+PWB6PhuOE
	kwTeGzWGdWQDWEKhlZO+u+lbA1UiYqjve/XJw4Xr9jP86EtwbeQZcslSzNnAvyuWyWqqVG4
	FKLCLbTU67Cfs94enQPT3NwWt7wcUde+1M5MyuQT8RX3oLPjTvcGtKNSHPZQcYWSI5uDLWj
	kd0ZIJ2FKbmIY++bN3/btEvzsbuHIFcbLS1RxU5hduAaNwADBGFEqP0wXf5Z4LxNg8JdGIq
	HNg2EO8GxAVYsezJYJceNTVY4pQEj1NZMRz9dOaRSE/MZa4AXAaZ+ClKTTHrYzjJ20mx5de
	d4vC9WPxQ3TYxEDYMCeSCACkfHtBBGJWXZ2za30WxcT/SmHG9yxldKJa4BEuss9MjqrzLss
	4hYD41d0y5zGwCMT9sdimQ6OteJ7lVb2e/p5vMv+vfSw5NKUizb1KRZKfvJZD/Q5+8aL7hU
	UYlo09iP0xs1GWnjDA
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

This patch add support for get PHY lane info without help of extcon.

There is no extcon needed if the Type-C controller is present. In this
case, the lane info can be get from PHY instead of extcon.

The extcon device should still be supported if Type-C controller is
not present.

Signed-off-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>
Reviewed-by: Heiko Stuebner <heiko@sntech.de>
---
(no changes since v1)
---
 drivers/gpu/drm/rockchip/cdn-dp-core.c | 25 +++++++++++++++++--------
 1 file changed, 17 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/cdn-dp-core.c b/drivers/gpu/drm/rockchip/cdn-dp-core.c
index 68aa66915e8a..1c1c1116b5eb 100644
--- a/drivers/gpu/drm/rockchip/cdn-dp-core.c
+++ b/drivers/gpu/drm/rockchip/cdn-dp-core.c
@@ -156,6 +156,9 @@ static int cdn_dp_get_port_lanes(struct cdn_dp_port *port)
 	int dptx;
 	u8 lanes;
 
+	if (!edev)
+		return phy_get_bus_width(port->phy);
+
 	dptx = extcon_get_state(edev, EXTCON_DISP_DP);
 	if (dptx > 0) {
 		extcon_get_property(edev, EXTCON_DISP_DP,
@@ -219,7 +222,7 @@ static bool cdn_dp_check_sink_connection(struct cdn_dp_device *dp)
 	 * some docks need more time to power up.
 	 */
 	while (time_before(jiffies, timeout)) {
-		if (!extcon_get_state(port->extcon, EXTCON_DISP_DP))
+		if (port->extcon && !extcon_get_state(port->extcon, EXTCON_DISP_DP))
 			return false;
 
 		if (!cdn_dp_get_sink_count(dp, &sink_count))
@@ -385,11 +388,14 @@ static int cdn_dp_enable_phy(struct cdn_dp_device *dp, struct cdn_dp_port *port)
 		goto err_power_on;
 	}
 
-	ret = extcon_get_property(port->extcon, EXTCON_DISP_DP,
-				  EXTCON_PROP_USB_TYPEC_POLARITY, &property);
-	if (ret) {
-		DRM_DEV_ERROR(dp->dev, "get property failed\n");
-		goto err_power_on;
+	property.intval = 0;
+	if (port->extcon) {
+		ret = extcon_get_property(port->extcon, EXTCON_DISP_DP,
+					  EXTCON_PROP_USB_TYPEC_POLARITY, &property);
+		if (ret) {
+			DRM_DEV_ERROR(dp->dev, "get property failed\n");
+			goto err_power_on;
+		}
 	}
 
 	port->lanes = cdn_dp_get_port_lanes(port);
@@ -1030,6 +1036,9 @@ static int cdn_dp_bind(struct device *dev, struct device *master, void *data)
 	for (i = 0; i < dp->ports; i++) {
 		port = dp->port[i];
 
+		if (!port->extcon)
+			continue;
+
 		port->event_nb.notifier_call = cdn_dp_pd_event;
 		ret = devm_extcon_register_notifier(dp->dev, port->extcon,
 						    EXTCON_DISP_DP,
@@ -1122,14 +1131,14 @@ static int cdn_dp_probe(struct platform_device *pdev)
 		    PTR_ERR(phy) == -EPROBE_DEFER)
 			return -EPROBE_DEFER;
 
-		if (IS_ERR(extcon) || IS_ERR(phy))
+		if (IS_ERR(phy) || PTR_ERR(extcon) != -ENODEV)
 			continue;
 
 		port = devm_kzalloc(dev, sizeof(*port), GFP_KERNEL);
 		if (!port)
 			return -ENOMEM;
 
-		port->extcon = extcon;
+		port->extcon = IS_ERR(extcon) ? NULL : extcon;
 		port->phy = phy;
 		port->dp = dp;
 		port->id = i;
-- 
2.53.0

