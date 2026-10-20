Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=54.207.22.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792481341;
	b=FSj1vJ4wMubUvWWbM8wD/T4kQkmXEosWhaBJkR6fuZBRc9RNT9Z1qKo+XbQc6HLfyGZb
	 3ABLLQE33Kgs+a6gRUqXeeGKcjzXn3nnEVZxbMuJSNJ4CJ51+1swvG+U2+Cmf0YKJB75m
	 HmWDXkyIzImtvmfvzE+HR0TBc6w8K0KHbNCHXidOk/r5qmkTzRjzUaedobVZvuupDXzFN
	 ltUgW1fk4EFWpyjuXH83xhoL1vlTjN0p5x8IPjDq1rkeIBzJaYBqmJIsk/Jp1J1WwXi4+
	 2kETZysqvd0je751sFN/XHP//mUPuihawvm5AtLCilitqbtj019/pLP5/LT+I8SSjBw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792481341;
	h=DMARC-Filter:DKIM-Signature:X-QQ-mid:X-QQ-Originating-IP:Received:
	 X-QQ-SSF:X-QQ-GoodBg:X-BIZMAIL-ID:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:In-Reply-To:References:X-QQ-SENDSIZE:Feedback-ID:
	 X-QQ-XMAILINFO:X-QQ-XMRINFO:X-QQ-RECHKSPAM;
	bh=00DSnvQSLlU7c2a5io39bkdl0ItMeQnbkaYseBDyixg=;
	b=xZXwHlSiaCgMSIv11/x/HJKez2r3aqNfJiUfh5p0m1VdYGgraRf3ARNPy/9vhNK2+k56
	 O2mlMgwMU+SgekZratGMHC4zhh9VA4MFj0nI/SNKMi/Rx84j0MAFiqZlhlBq/k4nsBSq0
	 yJBUUbsOZZJneMj0yih6oDWVjOKWAOyrne7tYvI4fI8t3C6F/I4w1Ntmer3iss0Xiq1vd
	 5To8uHAh/oKE4p8d4bakYMeKPJftl3y1CTR31e6eV/3n6ejarZE9VzqGG70iwnx6mzbxU
	 asevbeVqBh1HJ4efsehXvdFuq6/t9I6iddCnXS9urNi/C56fKBsDdVlFgwZ3dEkTAsA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=airkyi.com;
	spf=pass smtp.mailfrom=airkyi.com;
	dkim=pass header.d=airkyi.com header.i=@airkyi.com header.a=rsa-sha256 header.s=altu2504 header.b=AaUYCEow;
	arc=none smtp.remote-ip=54.207.22.56
Received: from smtpbgbr2.qq.com (smtpbgbr2.qq.com [54.207.22.56])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44B7B606A31D
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 07:28:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 44B7B606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=airkyi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=airkyi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=airkyi.com header.i=@airkyi.com header.a=rsa-sha256 header.s=altu2504 header.b=AaUYCEow
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=airkyi.com;
	s=altu2504; t=1792481323;
	bh=00DSnvQSLlU7c2a5io39bkdl0ItMeQnbkaYseBDyixg=;
	h=From:To:Subject:Date:Message-Id;
	b=AaUYCEowi17G6TEcZn6drDzlOh+xe/RPZle2BbnrJ3BVO3WbQ5W/lgzvtXrxJQMYK
	 ND80H9QnybGas58JJtc2PIxsptSmnLIb6IHwGHui1fM8MEslzIypDjRrdtfD5T2VvN
	 jOMLHpD5aobZrBB6213vbysZEhI9Mzsv6X7RLdS4=
X-QQ-mid: zesmtpsz4t1792481322t514923e1
X-QQ-Originating-IP: /TJ000w8y8vwIxYHjlAvlKq+mX/nB5pqqfq7aEdXmZY=
Received: from DESKTOP-8BT1A2O.localdomain ( [61.154.14.86])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 20 Oct 2026 15:28:37 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 6990828045487407985
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
Subject: [PATCH v8 1/7] drm/bridge: aux-hpd-bridge: Add drm_dev_has_dp_hpd_bridge()
Date: Tue, 20 Oct 2026 15:28:10 +0800
Message-Id: <20261020072816.180-2-kernel@airkyi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20261020072816.180-1-kernel@airkyi.com>
References: <20261020072816.180-1-kernel@airkyi.com>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:airkyi.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: M4afFXlZrPyBiC6UULLsbTLemqI7xA+KMy6SvSGLPhxiQYd8p+mNJKpH
	pPgyX3VdvAZWza6Nh9ZoFO6co6wEAclUar7qwQMH6iOgl6ZM5k5sCX6VE47OiEfysbObvRw
	RuV2QxSc+4oSs6X1aoDxq92kz/KOQjEQQ1YW4rPtb/PqIVnYz3VebUWOy2/IVVGsQ+Sp1Tk
	jvkICPv8AUcMssIfdOI7dCPF3m+GBGGEsFgQum2Prng+VBX5aRVlgCYvr8OF25OGIN+q8OX
	19cxh1LUH7MpfCLkk4iHtLopos3oJqZC9s6Z7qn4p14S2Wx6pZIokzyWXXifVX9T0eZZacl
	xf2AmxgfUg6yEN4u8EkB5vW1tnRFnP+i7cbzO/OxtXb1gM+YXZJ63/ujK6qVeblj/wwmJXE
	uWKdoku1fS4V+DWL3X68Eu94I798Z1cX7ytj9Dj86RU2ATh+m2lTjtYUIVs/3iVdHvUrK7t
	5qwSQRNed1zpLrEpL0qlXc8BJdKjdGoaR7q5qd+KDxDsCh/ArjboqXIXI9AdkF8r/PqALw+
	u+iGzPtSLCpOwjxbfXZhjgw6VaN9XsbunQPemKJrhd//dF6jvJcAS4N7dzOIVnU06RwRq7Q
	ZiNjVCG4RP/H0IpvBVPVvLlXarwLY2qWosVnExNA9qHOTyQKnqbpDPp4zXMfL7q73UUpRmo
	vr/d2nFtfcFzkgCeT2IjGj2cbPdNP7uX0l/BAiZTI0l9le4+HNF7PqRnYHE73kfSuanTWcx
	1f4U1Y7Tq5bHBMl4E+/WQYvXqVDcwZy6elc2R6DqjORgSbUCixWgjUEV+J/sBR5dBB1PsBw
	+/VNpw35/ZtFNldjnwcmZLrA8Ng0zG3jrtuLkt3bZkx8g1uJ7ujkkbehnDG+2zS6kEz5n25
	Z2YjxK8t0vcWvp5ASuImqKxy6/qEjePdhCG9R7I+4RCZoVDudYVBPB1004mXVKfq5MpzEfA
	ogCK3LYhHwtTrAa2WBLQy2ovzZOEudzs6+XyAvnavzoamURsJDXAdRTKMopysidaaEK7tRj
	A+VfaPRg==
X-QQ-XMRINFO: MSVp+SPm3vtSI1QTLgDHQqIV1w2oNKDqfg==
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
index a2e525aa5788..7aa630fcf735 100644
--- a/drivers/gpu/drm/bridge/aux-hpd-bridge.c
+++ b/drivers/gpu/drm/bridge/aux-hpd-bridge.c
@@ -13,6 +13,8 @@
 #include <drm/drm_bridge.h>
 #include <drm/bridge/aux-bridge.h>
 
+#define DRM_AUX_HPD_BRIDGE_NAME	"dp_hpd_bridge"
+
 static DEFINE_IDA(drm_aux_hpd_bridge_ida);
 
 struct drm_aux_hpd_bridge_data {
@@ -37,6 +39,44 @@ static void drm_aux_hpd_bridge_free_adev(void *_adev)
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
@@ -64,7 +104,7 @@ struct auxiliary_device *devm_drm_dp_hpd_bridge_alloc(struct device *parent, str
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

