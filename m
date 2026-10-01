Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CFC15111AA
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 12:43:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790858628; cv=none; b=baQpOSUUCZVxRTuB0Ms94VHBityCBlffc/tu4gdDVOgSpfmoAxVlSXHM7gQNWWkgNAolcTfiUd3qhCaxqdVfvvrRLGv3uBLGoBN2ff3/ZXNo9R2cMbMbyiJB086WSWDAXmYaV6d1Ev7FcycQF76lM/PYyCrs6yvxhQTtMfeg/GY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790858628; c=relaxed/simple;
	bh=1hLi18TgA72HlMYsS8SNx7rsafoU5yP7jLOcO5+oIns=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=U23F4MEhc9jngohXu3G7JmqZwEKAmPKFKPYdG4U1t4EVzQK8x+vdhMd1DnZP3hOiumUB0jTpHBExjzYMqPlnh2ffZ/lrswsdtEdO/IiXVRU0T5LT5snVKc1rvrkthuGF8JWTt/13qKApo6K/L55kXB8hyJtjRvDqp1ZK1XNBe1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=iZmIuRuw; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="iZmIuRuw"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 02A251A24DD;
	Thu,  1 Oct 2026 12:43:43 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C986960341;
	Thu,  1 Oct 2026 12:43:42 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3E9A110328112;
	Thu,  1 Oct 2026 14:43:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790858620; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=0XTtfuZMf/px2Gzgaw2H+GrIyxEhvdX74xCMTddevdQ=;
	b=iZmIuRuwWoly8Yq/YGcvocO2Sh1+h8k4Kp25aR/WIyDgzyn118jJvJMXd+W2no6kLX+nGg
	S79Pn337JFilco5no50DOGFSjMvUdw4Qg/JVibC1IL2PF0szWnYwzq8m0u3APfkQl9oJ9w
	Q7dCzE5LHmaQGxwbycpDwqyl3q9zMaFw4gyJ5FVmGIu8e6hzNn/OAQUzV8k8Vgs+qf7I7h
	7VQpKzSr55brH1B7jjHzJ9ERpceVnv5DEW9bvSWWKPleozJlzu3bRD7RdF5NE2cSy3h2bv
	xZFFcqHZsBnMgdqDxz9i2qjQmuufDWP5bs6dQNhsg3cXZc6ROStjOwJn7qWkAQ==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Thu, 01 Oct 2026 14:42:32 +0200
Subject: [PATCH RFC v2 10/24] drm/encoder: add drm_encoder_cleanup_from()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261001-drm-bridge-hotplug-v2-10-8e34986dcb68@bootlin.com>
References: <20261001-drm-bridge-hotplug-v2-0-8e34986dcb68@bootlin.com>
In-Reply-To: <20261001-drm-bridge-hotplug-v2-0-8e34986dcb68@bootlin.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Inki Dae <inki.dae@samsung.com>, Jagan Teki <jagan@amarulasolutions.com>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Jessica Zhang <jesszhan0024@gmail.com>, 
 Douglas Anderson <dianders@chromium.org>, Marek Vasut <marex@denx.de>, 
 Stefan Agner <stefan@agner.ch>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: Hui Pu <Hui.Pu@gehealthcare.com>, Ian Ray <ian.ray@gehealthcare.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.16.0
X-Last-TLS-Session-Version: TLSv1.3

Supporting hardware whose final part of the DRM pipeline can be physically
removed requires the ability to detach all bridges from a given point to
the end of the pipeline.

Introduce a variant of drm_encoder_cleanup() for this.

Take particular care to not try to detach non-attached bridges. This is
needed because when 2 or more bridges are removed not in the backwards
order, drm_encoder_cleanup_from() is called more than once for bridges
closer to the panel.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

---

Note: in theory drm_encoder_cleanup() is now a superset of
drm_encoder_cleanup_from() and may be simplified to jut call
drm_encoder_cleanup_from() and then do the extra actions. However the
common code is subtly different in terms of locking and checks, so this
would complicate the code in this patch and has thus been kept separate for
the time being. Reimplementing drm_encoder_cleanup() by using
drm_encoder_cleanup_from() is still an option, either in a new iteration of
this patch or as a future patch.

A much simpler and now obsolete version of this patch (missing locking and
checks) previously appeared in
https://lore.kernel.org/lkml/20250206-hotplug-drm-bridge-v6-13-9d6f2c9c3058@bootlin.com/
---
 drivers/gpu/drm/drm_encoder.c | 38 ++++++++++++++++++++++++++++++++++++++
 include/drm/drm_encoder.h     |  1 +
 2 files changed, 39 insertions(+)

diff --git a/drivers/gpu/drm/drm_encoder.c b/drivers/gpu/drm/drm_encoder.c
index 0d5dbed06db4..40ece477b302 100644
--- a/drivers/gpu/drm/drm_encoder.c
+++ b/drivers/gpu/drm/drm_encoder.c
@@ -179,6 +179,44 @@ int drm_encoder_init(struct drm_device *dev,
 }
 EXPORT_SYMBOL(drm_encoder_init);
 
+/**
+ * drm_encoder_cleanup_from - remove a given bridge and all the following
+ * @encoder: encoder whole list of bridges shall be pruned
+ * @bridge: first bridge to remove
+ *
+ * Removes from an encoder all the bridges starting with a given bridge
+ * and until the end of the chain.
+ *
+ * Does nothing if the bridge is not attached to an encoder chain.
+ *
+ * This should not be used in "normal" DRM pipelines. It is only useful for
+ * devices whose final part of the DRM chain can be physically removed and
+ * later reconnected (possibly with different hardware).
+ */
+void drm_encoder_cleanup_from(struct drm_encoder *encoder, struct drm_bridge *bridge)
+{
+	struct drm_bridge *next;
+	LIST_HEAD(tmplist);
+
+	/*
+	 * We need the bridge_chain_mutex to modify the chain, but
+	 * drm_bridge_detach() will call DRM_MODESET_LOCK_ALL_BEGIN() (in
+	 * drm_modeset_lock_fini()), resulting in a possible ABBA circular
+	 * deadlock. Avoid it by first moving all the bridges to a
+	 * temporary list holding the lock, and then calling
+	 * drm_bridge_detach() without the lock.
+	 */
+	mutex_lock(&encoder->bridge_chain_mutex);
+	if (!list_empty(&bridge->chain_node))
+		list_for_each_entry_safe_from(bridge, next, &encoder->bridge_chain, chain_node)
+			list_move_tail(&bridge->chain_node, &tmplist);
+	mutex_unlock(&encoder->bridge_chain_mutex);
+
+	while (!list_empty(&tmplist))
+		drm_bridge_detach(list_first_entry(&tmplist, struct drm_bridge, chain_node));
+}
+EXPORT_SYMBOL(drm_encoder_cleanup_from);
+
 /**
  * drm_encoder_cleanup - cleans up an initialised encoder
  * @encoder: encoder to cleanup
diff --git a/include/drm/drm_encoder.h b/include/drm/drm_encoder.h
index eded7c34481a..d2a59f95692f 100644
--- a/include/drm/drm_encoder.h
+++ b/include/drm/drm_encoder.h
@@ -324,6 +324,7 @@ static inline struct drm_encoder *drm_encoder_find(struct drm_device *dev,
 }
 
 void drm_encoder_cleanup(struct drm_encoder *encoder);
+void drm_encoder_cleanup_from(struct drm_encoder *encoder, struct drm_bridge *bridge);
 
 /**
  * drm_for_each_encoder_mask - iterate over encoders specified by bitmask

-- 
2.55.0

