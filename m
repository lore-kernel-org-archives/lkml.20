Received: from smtpbguseast2.qq.com (smtpbguseast2.qq.com [54.204.34.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9429E3E9C3A
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 08:48:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.204.34.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787906922; cv=none; b=kS4oBOyg3yRtqJ+D91Wut8SYJtnp9i7W9Y8L2nuGr+Du836hyp5kj0MQrM7fc45/CfhgA8JPQlvmyt/f6Zuup8Y32WRxQxwYjzIbudAnC8NgMCkwvUvoNQp8dShQBOneVCq/GGB6TcpbtXG0q3n2lpB0q5NOmLqJfNof/YSNeCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787906922; c=relaxed/simple;
	bh=HmqU/yF1WHT7McoNWyBANu3omr6KnsrjF+SmFCJUV50=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=jS8Gm1+SQh3vjlp2tJb/MSbMzOtdt59SGyiPU5MbXezlHOc7WgmWC6EwEale8DURGo2TYux4Dbf8boa3sHE94MR5LP83EDVbny6jQ3xPPPbCqOnY7fbhutn3gyL5afuG4Mg7ClzONF+ZwuNCGKRcegykZeqxSg+RWdy5Cn1s5xY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=airkyi.com; spf=pass smtp.mailfrom=airkyi.com; dkim=pass (1024-bit key) header.d=airkyi.com header.i=@airkyi.com header.b=Ax1LbDvB; arc=none smtp.client-ip=54.204.34.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=airkyi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=airkyi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=airkyi.com header.i=@airkyi.com header.b="Ax1LbDvB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=airkyi.com;
	s=altu2504; t=1787906903;
	bh=bunO2t7dsNCTFo7jX/DDz1zCMJsJEq2YOzLyo3nYWTM=;
	h=From:To:Subject:Date:Message-Id;
	b=Ax1LbDvBPJY7WtMnZHNJx9FYPIPDf+w5USgPhZ34xWWYW3rTXohhnrk4lgoIwNxy0
	 wpsH5x1ydsLLCCSA/0vL4C5inrVxQCrvy1IYUXDN5HrmQAxaZUvlr1HVtX0wP/u8xR
	 E85y2RYPrbE/CoDgyaZe5TQUU5pRUGnznfLa4nos=
X-QQ-mid: zesmtpgz6t1787906902t94a8ccf7
X-QQ-Originating-IP: ePzt+A5uepZSdMsOn0wfVfxlDaG2UaMeos7mmM/yUWg=
Received: from DESKTOP-8BT1A2O.localdomain ( [61.154.14.86])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 28 Aug 2026 16:48:17 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 339802763641425583
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
	Chaoyi Chen <chaoyi.chen@rock-chips.com>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-phy@lists.infradead.org
Subject: [PATCH v7 6/7] drm/rockchip: cdn-dp: Support handle lane info without extcon
Date: Fri, 28 Aug 2026 16:47:36 +0800
Message-Id: <20260828084737.565-7-kernel@airkyi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20260828084737.565-1-kernel@airkyi.com>
References: <20260828084737.565-1-kernel@airkyi.com>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:airkyi.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: N9ponxXGLTJp2xiZqtP41BfCtkPmqVBS3llieXmFyUmERgM1hquRaGxk
	hSoqC3HRtW33bR7QClce9eA1uihutngkUmKpAPjSoPXTOkDNDSM9rovrFaGs6uznpz5zEF6
	LeTkjTSt3fypy2clZAgHM+mzV4qpd5+t0mPtwNKHxVILkFnWLtAABB63iIZaZ0fkpmsdqdF
	isB9IHa34SQdgBDN5UBQaUi5ynNUXAmsWMQGRUEbYadLXy82c84468yT04kP8Hs4yUiI4Wv
	BGgmnhPBOrkZI2FKYH5J1ywGSWk+wMBK6fGoGpU0wJBmJbomz6Vy7CzR7m0fsXZGrXV6On6
	JRNVkguCgBC75IAAZhgFWcLI2nK9JiTuUNxFtrChpXKoR3FbPxsgXiW6OIG410wtB/FzRyI
	0WqXY3BLHWSQ6+fV86b63HiItFo+s7HzosQKVwgcGmi8nx5fJDY2i/JLPh5z+4zEic/xUJo
	Yyc7y+xjcq1sBdCWTyft7U6dERmVkYy9fYapQuCDX1I67EdeYjgFz7tunbl+DU8ON/dT71W
	FBp4Tw2mCTTtBKXMqM/74svnffzrQmdxGC6W9FnlmuscUZKR+xce5Hks2bkAKqBuUyhlj4h
	qXQKC0STEuBPd0G4AFU+oM5/LsNrqTpiJ7m2IpZkhVK/NK+DqyXZwCQsokryjVFzOKxmgd3
	lKuYJ/ioaCMVI6SpeD84z+MTkL/ahT959muw0gKv4YWErg4ttpnEZ+GKS5OZ7BmmcajGYiV
	taoczSiqStwxTawB6TtNc9lOziqnMXw0xgauO5v1RqHdBp9oybsghz7RazFDQm6U4YRnWiu
	UndaNh1epuEAan5RaeWcFn/ZYcLdBizavv76I8cwgFPam+CjiMHKfy2KtpvQT75dvOdvQSL
	p6VvrL1R56+vqdOupUX1efp5lf4QQ2KrjImqN3Qv9AzhPgGK+9mPF4ytQKqGrZbOxWx4MNq
	bUsJ/9Pfde9/0dTO+2tiVNf/iQZw7I4/uHLTL6YwxDWhKonHvWcxeYdVGa69lvosegurUmE
	h87DRAGm5VQRQlXknIh5zPV+X9DrM=
X-QQ-XMRINFO: NyFYKkN4Ny6FuXrnB5Ye7Aabb3ujjtK+gg==
X-QQ-RECHKSPAM: 0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

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
index 190cce9530c8..74e1f5422a6e 100644
--- a/drivers/gpu/drm/rockchip/cdn-dp-core.c
+++ b/drivers/gpu/drm/rockchip/cdn-dp-core.c
@@ -157,6 +157,9 @@ static int cdn_dp_get_port_lanes(struct cdn_dp_port *port)
 	int dptx;
 	u8 lanes;
 
+	if (!edev)
+		return phy_get_bus_width(port->phy);
+
 	dptx = extcon_get_state(edev, EXTCON_DISP_DP);
 	if (dptx > 0) {
 		extcon_get_property(edev, EXTCON_DISP_DP,
@@ -220,7 +223,7 @@ static bool cdn_dp_check_sink_connection(struct cdn_dp_device *dp)
 	 * some docks need more time to power up.
 	 */
 	while (time_before(jiffies, timeout)) {
-		if (!extcon_get_state(port->extcon, EXTCON_DISP_DP))
+		if (port->extcon && !extcon_get_state(port->extcon, EXTCON_DISP_DP))
 			return false;
 
 		if (!cdn_dp_get_sink_count(dp, &sink_count))
@@ -386,11 +389,14 @@ static int cdn_dp_enable_phy(struct cdn_dp_device *dp, struct cdn_dp_port *port)
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
@@ -1027,6 +1033,9 @@ static int cdn_dp_bind(struct device *dev, struct device *master, void *data)
 	for (i = 0; i < dp->ports; i++) {
 		port = dp->port[i];
 
+		if (!port->extcon)
+			continue;
+
 		port->event_nb.notifier_call = cdn_dp_pd_event;
 		ret = devm_extcon_register_notifier(dp->dev, port->extcon,
 						    EXTCON_DISP_DP,
@@ -1119,14 +1128,14 @@ static int cdn_dp_probe(struct platform_device *pdev)
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

