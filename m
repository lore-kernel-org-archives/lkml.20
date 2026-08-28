Received: from smtpbgsg1.qq.com (smtpbgsg1.qq.com [54.254.200.92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 562EC3ED3B4
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 08:48:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.254.200.92
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787906919; cv=none; b=nfzqT/4mOBl0pUzCsrG6hV1VJyIo11oEYewGRHPgf1aLXgtJ+DVOZr8A/XXlcTt76RyNhs7pQGiUFN4hGc+F0vy/n9nJ3PKkkF9y4/rpbTMlrSlPAKcA//X0M500rXF+dDCZV6kp9GXPqrcc3Dpz7kqqD2QTB2Js+ecb9Duvn9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787906919; c=relaxed/simple;
	bh=VbpJ93LXbGdQ+BXobxbnLmskw86kv29aRVWL0VYGk9Y=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=kqjQmy//J14l8lsz5zrAkvwi4c6K+T9eHRq7p3UpJNB+tNL6a2Oa836ZliFWhp6dbeDxdqUb1my2zxtyFEe8ig+KsdB/7k/1/M0am6UOb7EeZwI5lLNxx8lYd/oGP3M/fIuuTLlxmB8bqxjkojSMjK/scHhMUPA7La7loeURV08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=airkyi.com; spf=pass smtp.mailfrom=airkyi.com; dkim=pass (1024-bit key) header.d=airkyi.com header.i=@airkyi.com header.b=b8ePwLWc; arc=none smtp.client-ip=54.254.200.92
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=airkyi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=airkyi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=airkyi.com header.i=@airkyi.com header.b="b8ePwLWc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=airkyi.com;
	s=altu2504; t=1787906892;
	bh=uyMGZMKc5y1SgmgDY/tsuzKbkVlmYjdT8Q636L6W9/0=;
	h=From:To:Subject:Date:Message-Id;
	b=b8ePwLWcWOI+xkIw62G815/sIHuDwlzG+vJi5gr+zMYBTdgS7p1q+N6ebgu8dBQYl
	 m3ZF0Cx/kFC3PoNRVWupDibx1mkbEe5bnmTlwfEisqgUeIcSV8MNFh5JQip+cGZFu7
	 vA+JPQyxfO6bMh19id16ZkYHl1c3kKUWcu6uHMuU=
X-QQ-mid: zesmtpgz6t1787906891t1bc82087
X-QQ-Originating-IP: OxvB8j0RZYuReQ0OYIUUtJayIysb859IsfVqPvUZV9Q=
Received: from DESKTOP-8BT1A2O.localdomain ( [61.154.14.86])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 28 Aug 2026 16:48:05 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 7758792601423077606
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
Subject: [PATCH v7 4/7] drm/bridge: aux: Add drm_aux_bridge_register_from_node()
Date: Fri, 28 Aug 2026 16:47:34 +0800
Message-Id: <20260828084737.565-5-kernel@airkyi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20260828084737.565-1-kernel@airkyi.com>
References: <20260828084737.565-1-kernel@airkyi.com>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:airkyi.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: MyIXMys/8kCtyIOyauqTnT2FdFECnE5zDhFWh9iDGXkAWPdVFLmXnVFx
	FlFc0GuaA4bKKi1Lb/hh9063WcoYAGw3nPu5F0dPQqqH2rsqCGjF5nzlSZUNMdjhcooI1+L
	aLoKVVGkKvzuWnF8Ka3xxEr9Su9cUhODz6XzNhh49mVqALFGQ91X/8H09Syc+1JKxOCTdGS
	iL4mOEZ+yu4JsWxAVSs4CaffwPVKTaftoPc1CMshUgVIE0Q1XjlE1njKVkkM99/NI5bVCgo
	+e9ySs0B+2u5owjD7OQK442KLO83RqzrgCuzd2BMQoxrMGmrywU+6rzTtiJZ+nJicMAE5We
	/LNj8KtYATEccKQhBrFTTGD/ioW05l9c4Is/SAVPHIXV/RMtaYve4W+T5lqaIRt37n3ZkC4
	PxMGffQE1/IYP2pC6nw30T1q/oOJ44rUUc2jLRtCUynFx7QWx4kuFJgjFO7ctCDh0gqgSKW
	k0ku5Mm6KzZQilnqW8RA1J7tcrkrVtdfDl90z67QBRYm/KJ9tZJl/yIblya7AB5CM3CMBDu
	KQJ0BbtAvzWMEoljK3IB/UMj50GUXpn/P6LKFmBkFTb6SFgt48dklR5JQYRURYtUeX49zBC
	BzKXi+bzHh+pBEvdYPhcNubw+4K2lT7XtRXIM//INMKYRabmXAohkoGJnYn5YzRMHcPP30u
	3ailkAVCK65M+8yvO0k5HfrLw8NQ5KTW0IX6nO8QekDmXF8656ZMCOKvHxaeesqs36Obx6D
	P2nJFV/IGtFzfrkIBFGs07L7tH5qnBnA0tJtP406uVnfI4fgeU4d9GxXKdvi8b14TxkavAY
	T7nrwAQN3QrtGqfwpLPk7yngudfp13AI4nOK2DamFdf0JrJQgEOji9zFN/AQubNr4+nlxQL
	k/Qt+3bDkgRBDzTMpbqY9dxu9MmA3dlbDe1M9c6LCJECygA+yeJsaug7wfU3m8SYWKwV07k
	VHFF3imxJ2wCBLxfSqA8uJfTZNissN9AZrcv7a46ahotfDR5BnEvwAOUxTVYBCR8hWMoP5b
	jRvnuBAw==
X-QQ-XMRINFO: Nq+8W0+stu50tPAe92KXseR0ZZmBTk3gLg==
X-QQ-RECHKSPAM: 0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

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
index 1ed21a8713bf..06a1466f49bd 100644
--- a/drivers/gpu/drm/bridge/aux-bridge.c
+++ b/drivers/gpu/drm/bridge/aux-bridge.c
@@ -33,8 +33,9 @@ static void drm_aux_bridge_unregister_adev(void *_adev)
 }
 
 /**
- * drm_aux_bridge_register - Create a simple bridge device to link the chain
+ * drm_aux_bridge_register_from_node - Create a simple bridge device to link the chain
  * @parent: device instance providing this bridge
+ * @np: device node pointer corresponding to this bridge instance
  *
  * Creates a simple DRM bridge that doesn't implement any drm_bridge
  * operations. Such bridges merely fill a place in the bridge chain linking
@@ -42,7 +43,7 @@ static void drm_aux_bridge_unregister_adev(void *_adev)
  *
  * Return: zero on success, negative error code on failure
  */
-int drm_aux_bridge_register(struct device *parent)
+int drm_aux_bridge_register_from_node(struct device *parent, struct device_node *np)
 {
 	struct auxiliary_device *adev;
 	int ret;
@@ -62,7 +63,10 @@ int drm_aux_bridge_register(struct device *parent)
 	adev->dev.parent = parent;
 	adev->dev.release = drm_aux_bridge_release;
 
-	device_set_of_node_from_dev(&adev->dev, parent);
+	if (np)
+		device_set_node(&adev->dev, of_fwnode_handle(np));
+	else
+		device_set_of_node_from_dev(&adev->dev, parent);
 
 	ret = auxiliary_device_init(adev);
 	if (ret) {
@@ -80,6 +84,22 @@ int drm_aux_bridge_register(struct device *parent)
 
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

