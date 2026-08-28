Received: from smtpbgjp3.qq.com (smtpbgjp3.qq.com [54.92.39.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 949D43E6DEB
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 08:48:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.92.39.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787906902; cv=none; b=jdOjaZPxA+aEEuuibc1pvtGeYRu+YIF15LEikv+wmKK5pe79FZDm94UBDfR1JeG689fJt95bgb2ES5LsNba/WoVgbKU9geJMvHUaYVbLlzJXqNs1pm3w0A2yNE03LubXqfJ/mcWRjREulUIk/z90XUKjX190P4a+1ymrzlJ2w3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787906902; c=relaxed/simple;
	bh=n0vihTnAb2IrmDGaMWU8fgHcATScRlf7XF7nt65nmdU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=rH1HnQCPby5JSz6B3JAzEBkYaYIVJhp3hU1jmrPEWSwOwvTK2n0eFnLuEsXL6nZV/MCgZ/BgEyvEEpAvSBLMS5Yg7mRIMApQFw5J2+j1w6l4DYAAeTRfe2eVhk4nM3A/kMn5khZv1H64Jw/rHE2T5yPmbcnxGomrbyZ6hYKl+dE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=airkyi.com; spf=pass smtp.mailfrom=airkyi.com; dkim=pass (1024-bit key) header.d=airkyi.com header.i=@airkyi.com header.b=hFOJGeq8; arc=none smtp.client-ip=54.92.39.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=airkyi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=airkyi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=airkyi.com header.i=@airkyi.com header.b="hFOJGeq8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=airkyi.com;
	s=altu2504; t=1787906872;
	bh=92lwE17e0FOpQsP6OniGlzehqwbaj82P3AEnE+KFgZY=;
	h=From:To:Subject:Date:Message-Id;
	b=hFOJGeq8tp+fHbez7X+nfUShR2b8D7SyiokkoAUTlljO8fZs14ahJUsB/f3ZW/YXJ
	 s+P1ccr1NV6Y6FwSUKgQTM1eQpb/CKKZRY87Sj8YMPkvZ702Giuhbkgszmi//tuMfW
	 iAe/jO9mR12ltromIuyBJ2P3qFReCRkNZJLMDyIs=
X-QQ-mid: zesmtpgz6t1787906871t6f8f5f8b
X-QQ-Originating-IP: 3JGdevLTu8iXxaqXX2RzHlTwRgpYv/D9UneAY+H2Hqc=
Received: from DESKTOP-8BT1A2O.localdomain ( [61.154.14.86])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 28 Aug 2026 16:47:46 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 8549069541952634456
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
Subject: [PATCH v7 1/7] drm/bridge: aux-hpd-bridge: Add drm_dev_has_dp_hpd_bridge()
Date: Fri, 28 Aug 2026 16:47:31 +0800
Message-Id: <20260828084737.565-2-kernel@airkyi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20260828084737.565-1-kernel@airkyi.com>
References: <20260828084737.565-1-kernel@airkyi.com>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:airkyi.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: Nt4eoHGnUdqyKXXPE31b6Qx/NeZ+JnzmateFrjaUpXA3B1LtQjPedxRa
	hX3ysFGpf6UX3B/OxhE2MSch7DCdwOGqGymYdaJEBWgVGIgOKsap702MAfv7daVV9rx6HPy
	sNDvWDuEGL9biL3b4SSeBppHf1e9l7DdbyX9PKcXQfd8RgcpoGrRsId6MiTEXRAtn5NprzH
	mFOoIc2v3c979UEVkF7vQ4TB7lUFh3xzJCkoQ8/kDjWqFpQaILR4IRCAGXlSyj7o2UNgbFu
	bEuoOFuOUoJPpHUGn2UjeFFamjYfCy9btuUoVYvLHszpyzg+9wL7Tau/p9QyQtlYYyUV8gf
	tfp5hjJTxk58oiiKx36w8UriYE3GYb/bxVGRJ32Plm3tavBCFeGrAslL9osI0juGXPlM3W0
	4vIH+S6hV/tbmi0qRBmsUzXhmFkyDdB7kAnKQ/28wuWgRv4DBuF8dJcRE4pnvnSGx6isWxO
	armhRayTnX9x7OO2i64LhH2+zPlj3Lp2wTK3wiZNhVivIeJfAmfJQan2Z+jR4UE85diTsmr
	y2Dmzhi29kqpJAAO268S+vnhynRmExBUKEeFz1uNuLX7zaCQMb7PPP/ImSxWQTJIJMy8QMo
	Att4RvU3nxxOPhJ29u1TWe5H0vwYgVHN8TzVFn54U9I0JY4ccEaO+5YycbL8GB1qG4vVDN2
	Wnef8NDFcGV3naTk262U7YSVAzgxCV86ZvlqRJ5aFLHOKxFGSO/1Y5fycukGb7tfGQR3aIY
	b3gaA5NDPPPrTkR6po8WKKa79sFzwqXVtNXme2CRd+fxvKhmqTJW+65yDwxgwZUDL/71DTQ
	/zR/aQi9a8NAQ03DkYi55wu7MIr0p2RW7t7bjlUhpZoEv13BWybqut0rDZZ2h9vFtActuES
	KmYTJA0vXSHcPQomADeKLzfP9LQ/2aiXSTPQhbn2kkvG/E9fB/9GLAh2MCg3FJfwsKkRY41
	YMT3TeWPWObbJf/+Wy0fTvZYwOoWvjVDWeJLZqdKs0uGLrYOSe7OFalEfJXw2FIMHfaE=
X-QQ-XMRINFO: MPJ6Tf5t3I/ylTmHUqvI8+Wpn+Gzalws3A==
X-QQ-RECHKSPAM: 0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

From: Chaoyi Chen <chaoyi.chen@rock-chips.com>

Add a new API to check whether a DisplayPort HPD bridge has already
been registered. This helps avoid duplicate registration of the same
HPD bridge, although the current framework allows doing so.

Suggested-by: Sebastian Reichel <sebastian.reichel@collabora.com>
Reviewed-by: Sebastian Reichel <sebastian.reichel@collabora.com>
Tested-by: Sebastian Reichel <sebastian.reichel@collabora.com>
Signed-off-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>
---
(no changes since v7)
---
 drivers/gpu/drm/bridge/aux-hpd-bridge.c | 42 ++++++++++++++++++++++++-
 include/drm/bridge/aux-bridge.h         |  6 ++++
 2 files changed, 47 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/aux-hpd-bridge.c b/drivers/gpu/drm/bridge/aux-hpd-bridge.c
index f02a38a2638a..a56c88eba005 100644
--- a/drivers/gpu/drm/bridge/aux-hpd-bridge.c
+++ b/drivers/gpu/drm/bridge/aux-hpd-bridge.c
@@ -12,6 +12,8 @@
 #include <drm/drm_bridge.h>
 #include <drm/bridge/aux-bridge.h>
 
+#define DRM_AUX_HPD_BRIDGE_NAME	"dp_hpd_bridge"
+
 static DEFINE_IDA(drm_aux_hpd_bridge_ida);
 
 struct drm_aux_hpd_bridge_data {
@@ -36,6 +38,44 @@ static void drm_aux_hpd_bridge_free_adev(void *_adev)
 	auxiliary_device_uninit(_adev);
 }
 
+static int hpd_bridge_match(struct device *dev, const void *data)
+{
+	const struct device_node *np = data;
+	struct auxiliary_device *adev;
+
+	if (!dev_is_auxiliary(dev))
+		return 0;
+
+	adev = to_auxiliary_dev(dev);
+	if (strcmp(adev->name, DRM_AUX_HPD_BRIDGE_NAME))
+		return 0;
+
+	return adev->dev.platform_data == np;
+}
+
+/**
+ * drm_dev_has_dp_hpd_bridge - check whether a HPD DisplayPort bridge is registered
+ * @parent: device instance providing this bridge
+ * @np: device node pointer corresponding to this bridge instance
+ *
+ * Walk the children of @parent and check whether a HPD DisplayPort bridge for
+ * the given @np has already been registered via devm_drm_dp_hpd_bridge_add().
+ *
+ * Return: true if a HPD bridge for @parent / @np already exists, false otherwise
+ */
+bool drm_dev_has_dp_hpd_bridge(struct device *parent, struct device_node *np)
+{
+	struct device *child;
+
+	child = device_find_child(parent, np, hpd_bridge_match);
+	if (child) {
+		put_device(child);
+		return true;
+	}
+	return false;
+}
+EXPORT_SYMBOL_GPL(drm_dev_has_dp_hpd_bridge);
+
 /**
  * devm_drm_dp_hpd_bridge_alloc - allocate a HPD DisplayPort bridge
  * @parent: device instance providing this bridge
@@ -63,7 +103,7 @@ struct auxiliary_device *devm_drm_dp_hpd_bridge_alloc(struct device *parent, str
 	}
 
 	adev->id = ret;
-	adev->name = "dp_hpd_bridge";
+	adev->name = DRM_AUX_HPD_BRIDGE_NAME;
 	adev->dev.parent = parent;
 	adev->dev.release = drm_aux_hpd_bridge_release;
 	adev->dev.platform_data = of_node_get(np);
diff --git a/include/drm/bridge/aux-bridge.h b/include/drm/bridge/aux-bridge.h
index c2f5a855512f..cca07a8e2d45 100644
--- a/include/drm/bridge/aux-bridge.h
+++ b/include/drm/bridge/aux-bridge.h
@@ -25,6 +25,7 @@ struct auxiliary_device *devm_drm_dp_hpd_bridge_alloc(struct device *parent, str
 int devm_drm_dp_hpd_bridge_add(struct device *dev, struct auxiliary_device *adev);
 struct device *drm_dp_hpd_bridge_register(struct device *parent,
 					  struct device_node *np);
+bool drm_dev_has_dp_hpd_bridge(struct device *parent, struct device_node *np);
 void drm_aux_hpd_bridge_notify(struct device *dev, enum drm_connector_status status);
 #else
 static inline struct auxiliary_device *devm_drm_dp_hpd_bridge_alloc(struct device *parent,
@@ -44,6 +45,11 @@ static inline struct device *drm_dp_hpd_bridge_register(struct device *parent,
 	return NULL;
 }
 
+static inline bool drm_dev_has_dp_hpd_bridge(struct device *parent, struct device_node *np)
+{
+	return false;
+}
+
 static inline void drm_aux_hpd_bridge_notify(struct device *dev, enum drm_connector_status status)
 {
 }
-- 
2.53.0

