Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=54.254.200.92
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792481359;
	b=HkLyEnC5EWR9/JI7ctDqKU3ZjZFI9Xa4aLs0ociYNcDttTYIQ4f1VxfchqQCBI6ysQW+
	 eFo3nYlP4uKGdcr4mgeimVWLHG7lJ7HZ1Bj2U//b0Lzjgw3hoelPVEjahyDMXlQFG1eMg
	 N94Q7WibJ4PfDxrlGq6aeo6yQsZm6Pe5h1VPD924Q9mUAp4ZEJBVvIU4wGp+6P11N4Q7z
	 71FzhlJ8nv9XZtycEqa+sy34UIZRLh6tHOAn8OU0lepqaV8vaAjRYTebSW/T7Du0IEeHu
	 YKT7D+ts1mcJVuTwsVCwuBDcF1/GXuPymPYmatMdXafktOg+D+Rs7vUHFNUZTtEtL/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792481359;
	h=DMARC-Filter:DKIM-Signature:X-QQ-mid:X-QQ-Originating-IP:Received:
	 X-QQ-SSF:X-QQ-GoodBg:X-BIZMAIL-ID:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:In-Reply-To:References:X-QQ-SENDSIZE:Feedback-ID:
	 X-QQ-XMAILINFO:X-QQ-XMRINFO:X-QQ-RECHKSPAM;
	bh=DJanm14+a4oEERJIEwsqr6UMMmk0UfftGh/0a/Q8LT4=;
	b=JZzAKcsJCpc+ER8Uo2sDcIfRU+9c045fR6JfHx8IEAApzXiVpVsE71LNdgSuHIh3/mtn
	 06HTIYYGz105wxYJbyNx+F2QjVrnw42gEMv3sHgMeNz79zqjG1tTOcaqT5/snCnbdfYxB
	 S02MMP+LTLCtTBmFv/CklIvUGZDmSXr3ZdrGRV+qrRFvnaI/tV9sEEXweO/kIw9yt3IFA
	 6XDfAkePAFtVOFyogTHxfyPuNM7P25E6vfGLvWR7W1u5qP/rDb/4MG/WYnoKaOJMPn5Vt
	 hqtD5oMNdIUxNblHnH6wxtFVICqhLZqRxKMGSpXmBcpuKMmi2ZTPZeJY2ZYhQBj9DEQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=airkyi.com;
	spf=pass smtp.mailfrom=airkyi.com;
	dkim=pass header.d=airkyi.com header.i=@airkyi.com header.a=rsa-sha256 header.s=altu2504 header.b="tzk2/1RX";
	arc=none smtp.remote-ip=54.254.200.92
Received: from smtpbgsg1.qq.com (smtpbgsg1.qq.com [54.254.200.92])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A915E606A321
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 07:29:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A915E606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=airkyi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=airkyi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=airkyi.com header.i=@airkyi.com header.a=rsa-sha256 header.s=altu2504 header.b=tzk2/1RX
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=airkyi.com;
	s=altu2504; t=1792481342;
	bh=DJanm14+a4oEERJIEwsqr6UMMmk0UfftGh/0a/Q8LT4=;
	h=From:To:Subject:Date:Message-Id;
	b=tzk2/1RXw/VHXRLFAH+ArQkWpRnFzPepo/f+iGWP/Hk2Hz+c2rAvS7BH5c2q/ex3R
	 v9PQqx+e4tC/UoCPz4MnIG/PgoLi8DgL+E9+edhj3x4JrFg0WA7Jmtdey7OZiOoGup
	 ffUNcJxnoPa4g2ZqrnogivUWaOH4wYZQJwZWNngk=
X-QQ-mid: zesmtpsz4t1792481341t855129f9
X-QQ-Originating-IP: i939nXwO2ei7d/m1loVbZw6nbt7HmJycrjDREFVFMnQ=
Received: from DESKTOP-8BT1A2O.localdomain ( [61.154.14.86])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 20 Oct 2026 15:28:56 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 14835207740460632704
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
Subject: [PATCH v8 4/7] drm/bridge: aux: Add drm_aux_bridge_register_from_node()
Date: Tue, 20 Oct 2026 15:28:13 +0800
Message-Id: <20261020072816.180-5-kernel@airkyi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20261020072816.180-1-kernel@airkyi.com>
References: <20261020072816.180-1-kernel@airkyi.com>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:airkyi.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: OZZSS56D9fAj5yWqEuc+hgEWM7o1VuiGY+B36f30Che9ZzBQLzgTH8/B
	LWj/Qu4nfhf9Y3cPXOJVIUBOM7Fvh+E9TuDYnt4ThIZ/y4p/eZEXkxF6x/mVkaguvOcgQTE
	VAzgst51Y83koSRR3yuzVbrIP7+WeO/bYs+hgL4ZYwufun3v+MGiKZ4xFREQKIGBW30f8Pi
	SMycmj425q8n1uXdy9/nCIPIM6tPRQkov9jUKgSNm95e1OxkSj0cOyyvXwxSpcZc4QHm9yO
	YPJn5aHj0Bawjc7Ws+7WnWjSP/j0eh0q+bdAGTw/5cm/asHehItD9B3jgfEJl5fBhR1cW/O
	tJ4b2641NHQMy3+2y0kf2wxxmS8nVIJ0ulGRT3XSfFSoAn2mwczN1mfUKbNlQV5BaYjNqyB
	wkUcnBn3vHNdqP9vvVty+mbzPwKxCb/CsDiOcRL+w+lbeL7lrIXyiaODMggJamYJLRo6NcW
	bHbrtrjBEXcfoGOLflJN7rdovmCPldYZEVcNTrJ3H4y3AGshYnB9svQH2XocIJoUWv5daMC
	Udjyx+apBbYlTvW0VyDIlvCSwjKIghqw3NV6LjXjBsSb7qAndDSIxNdYVCFU2Kl/A9DKbV9
	ULa3NXwmBapVB3wtaSOxK4ipbpUcxpxGQLKyCMiSIqxzNtIXHmYImEl4mMxLVEQfuc3qok6
	iiSOCTBsoWqfmiwyQRIBz7cKm57nlQwjk7zr7w4/79S5+O8iaFBPnVl1tDqcKNc+gpVpyHb
	ilOLHhzfhEw5vSrGiPPTPb1FOa0EBxtDruYD1X+IgELf+UZhz80NGWCC+qguH805CjAiQaO
	JZo19okUeWlA/cAeowANjRYVZ00HXcJR1oOFIvUgtMB8YcrJvWw73F5Zo4nrzdhM1hBp+fQ
	3Ttvqa9ZNZw3PToNVVijaAi6Qbb5r5AfUHwFInb+2l/GAKXUlZ030jK8wWT5A721od0zJEN
	8T+eGmNUPtdkCicWCbKLH53QlBWSP2FQ1kqoAHr2S6jukg5l2AYZX6O/Pl0SG8mXyYLHaVv
	Lk+fyN1xBQ+EdyC0YfmQOQtLs4+0/zdsVr4AFm9Q==
X-QQ-XMRINFO: NS+P29fieYNwqS3WCnRCOn9D1NpZuCnCRA==
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

The drm_aux_bridge_register() uses the device->of_node as the
bridge->of_node.

This patch adds drm_aux_bridge_register_from_node() to allow
specifying the of_node corresponding to the bridge.

Signed-off-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Reviewed-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Reviewed-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
(no changes since v3)

Changes in v2:
- Fix incorrect function names in the documentation comments.
---
 drivers/gpu/drm/bridge/aux-bridge.c | 26 +++++++++++++++++++++++---
 include/drm/bridge/aux-bridge.h     |  6 ++++++
 2 files changed, 29 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/bridge/aux-bridge.c b/drivers/gpu/drm/bridge/aux-bridge.c
index 169939d23310..2b48612d6d1b 100644
--- a/drivers/gpu/drm/bridge/aux-bridge.c
+++ b/drivers/gpu/drm/bridge/aux-bridge.c
@@ -34,8 +34,9 @@ static void drm_aux_bridge_unregister_adev(void *_adev)
 }
 
 /**
- * drm_aux_bridge_register - Create a simple bridge device to link the chain
+ * drm_aux_bridge_register_from_node - Create a simple bridge device to link the chain
  * @parent: device instance providing this bridge
+ * @np: device node pointer corresponding to this bridge instance
  *
  * Creates a simple DRM bridge that doesn't implement any drm_bridge
  * operations. Such bridges merely fill a place in the bridge chain linking
@@ -43,7 +44,7 @@ static void drm_aux_bridge_unregister_adev(void *_adev)
  *
  * Return: zero on success, negative error code on failure
  */
-int drm_aux_bridge_register(struct device *parent)
+int drm_aux_bridge_register_from_node(struct device *parent, struct device_node *np)
 {
 	struct auxiliary_device *adev;
 	int ret;
@@ -63,7 +64,10 @@ int drm_aux_bridge_register(struct device *parent)
 	adev->dev.parent = parent;
 	adev->dev.release = drm_aux_bridge_release;
 
-	device_set_of_node_from_dev(&adev->dev, parent);
+	if (np)
+		device_set_node(&adev->dev, of_fwnode_handle(np));
+	else
+		device_set_of_node_from_dev(&adev->dev, parent);
 
 	ret = auxiliary_device_init(adev);
 	if (ret) {
@@ -81,6 +85,22 @@ int drm_aux_bridge_register(struct device *parent)
 
 	return devm_add_action_or_reset(parent, drm_aux_bridge_unregister_adev, adev);
 }
+EXPORT_SYMBOL_GPL(drm_aux_bridge_register_from_node);
+
+/**
+ * drm_aux_bridge_register - Create a simple bridge device to link the chain
+ * @parent: device instance providing this bridge
+ *
+ * Creates a simple DRM bridge that doesn't implement any drm_bridge
+ * operations. Such bridges merely fill a place in the bridge chain linking
+ * surrounding DRM bridges.
+ *
+ * Return: zero on success, negative error code on failure
+ */
+int drm_aux_bridge_register(struct device *parent)
+{
+	return drm_aux_bridge_register_from_node(parent, NULL);
+}
 EXPORT_SYMBOL_GPL(drm_aux_bridge_register);
 
 struct drm_aux_bridge_data {
diff --git a/include/drm/bridge/aux-bridge.h b/include/drm/bridge/aux-bridge.h
index cca07a8e2d45..67f74ed287d9 100644
--- a/include/drm/bridge/aux-bridge.h
+++ b/include/drm/bridge/aux-bridge.h
@@ -13,11 +13,17 @@ struct auxiliary_device;
 
 #if IS_ENABLED(CONFIG_DRM_AUX_BRIDGE)
 int drm_aux_bridge_register(struct device *parent);
+int drm_aux_bridge_register_from_node(struct device *parent, struct device_node *np);
 #else
 static inline int drm_aux_bridge_register(struct device *parent)
 {
 	return 0;
 }
+
+static inline int drm_aux_bridge_register_from_node(struct device *parent, struct device_node *np)
+{
+	return 0;
+}
 #endif
 
 #if IS_ENABLED(CONFIG_DRM_AUX_HPD_BRIDGE)
-- 
2.53.0

