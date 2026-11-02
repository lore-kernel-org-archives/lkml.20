Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793638183;
	b=N5XLmdXZRGKEqvidOacL9tDSpdAJ8gyKxZpdtl5Kfd+FoTXPcrS24pqLH2M7AIOvl7g8
	 N0y6OKKcQRTkjcrjNk+cyVF8Mi/KkTjY1iJ/sdhqvffHhyTJrfMZyPNJXKJ8Vvm1PJud+
	 aJxUAMcQGmiv9ZDTOJyluUzA0/zIOXS9/oZp3TU09uwRoHY38mmBI4Q4abuVg76C5E2kP
	 0TxC1PKR/u5WOqwL+4pzjnknPlA86C8SkF5+BUkPFpgAgU1d4vDSYDeVCRDP+EGdNEM4Q
	 bTykvtpvmnhCNQPc6p/ipOi1PzuuX7UQjAZqsS380tx29yoSqvdV7PR3UhvuA2LLxnA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793638183;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer;
	bh=hI1MJq4K8L5jI0+LOV3XfRn/TD9k2MaKrMvKNdRDEoU=;
	b=3LBKklQeF+H/9JF2Exvfz7BLifdh8qa6Va3D6eASIaF/nAZ2pj2umcs/ZN+rFnJufzAQ
	 5KTnIHtp1sTd2UymCWcGZNCPvo2H5OxK4j7Ryp2/p3v2EzvVtdjRN3Lng/YjUqQo53pcQ
	 7sCD2TMifSpzBk6DUzqKwLvpdGdjrBHilHOm2nfrDjHN9rCRViuVVDGhHorWJvIDrbGbg
	 kXdA8y4dhptdyyPawiCuVPO3ze1dS2S5t0Qh7WTlKi1Mqju3a6ObuXNyK0s8Nz+eLDXVG
	 1IB8+XS/ImjBdxAWAe8zhXQbkajd3px2c3YmdbcQMNYmGVFS0OX+yHi9JVEGW7WR9yQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Bak8PR33;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAA016072C7B
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 16:49:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Bak8PR33
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9D691F00A1A;
	Mon,  2 Nov 2026 16:49:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793638182;
	bh=hI1MJq4K8L5jI0+LOV3XfRn/TD9k2MaKrMvKNdRDEoU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=Bak8PR33p6oWgFybUkZoLevJ2evrRwZLe86BX79lDY+3foHj7EE2Zs6nlKZ+K67oc
	 wAKdmTFo/LotMoKeXC8KRqSpoEIpQSpngubonYVfJFzWda/yf9YOoUX8ZPDE7mVlx/
	 OxAV6pAhOPgcn+TNQ1MN+S9ZULeDUAFTET1VqaDy4e+mqQNMOWhrNbPuFvdwh9LKHb
	 1jwmW4azVC+VLAC3G1H9PN8k8MiftCEX0zrFmGJaj6XZlBKsTiF3qiK2JXyuQ35Y6Q
	 ijGETtfoKU8JQGt3bV694yhBfUToAYTd3wh0NdIOFX8SJ/FE8TSXq5qgO/Dy7S9EjE
	 EXmHIhbwKy6Zg==
From: "Mario Limonciello (AMD)" <superm1@kernel.org>
Date: Mon, 02 Nov 2026 10:49:23 -0600
Subject: [PATCH v10 07/15] drm/bridge: add connector luminance operations
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
Message-Id: <20261102-superm1-backlight-property-v10-7-b2a6f24131f5@kernel.org>
References: <20261102-superm1-backlight-property-v10-0-b2a6f24131f5@kernel.org>
In-Reply-To: <20261102-superm1-backlight-property-v10-0-b2a6f24131f5@kernel.org>
To: Maxime Ripard <mripard@kernel.org>, 
 Alex Deucher <alexander.deucher@amd.com>, 
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Javier Martinez Canillas <javierm@redhat.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Harry Wentland <harry.wentland@amd.com>, 
 Leo Li <sunpeng.li@amd.com>, Rodrigo Siqueira <siqueira@igalia.com>
Cc: Mario Limonciello <superm1@kernel.org>, 
 Xaver Hugl <xaver.hugl@gmail.com>, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org, 
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org, 
 nouveau@lists.freedesktop.org, 
 Mario Limonciello <mario.limonciello@amd.com>
X-Mailer: b4 0.16.0

From: Mario Limonciello <mario.limonciello@amd.com>

Allow bridges that own brightness control to advertise a luminance
operation and its supported relative range.

Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
v10:
 * Split bridge operations out of the combined panel and bridge patch
---
 include/drm/drm_bridge.h | 74 ++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 74 insertions(+)

diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
index 1981d24a700d2..95f5c2b8656cd 100644
--- a/include/drm/drm_bridge.h
+++ b/include/drm/drm_bridge.h
@@ -62,6 +62,15 @@ enum drm_bridge_attach_flags {
  * struct drm_bridge_funcs - drm_bridge control functions
  */
 struct drm_bridge_funcs {
+	/**
+	 * @set_luminance:
+	 *
+	 * Apply a relative luminance level to a bridge that controls panel
+	 * emission. Bridges implementing this callback shall set
+	 * @DRM_BRIDGE_OP_LUMINANCE.
+	 */
+	void (*set_luminance)(struct drm_bridge *bridge, unsigned int luminance);
+
 	/**
 	 * @attach:
 	 *
@@ -1021,6 +1030,11 @@ enum drm_bridge_ops {
 	 * &drm_bridge_funcs->hdmi_clear_spd_infoframe callbacks.
 	 */
 	DRM_BRIDGE_OP_HDMI_SPD_INFOFRAME = BIT(10),
+
+	/**
+	 * @DRM_BRIDGE_OP_LUMINANCE: The bridge controls panel luminance.
+	 */
+	DRM_BRIDGE_OP_LUMINANCE = BIT(11),
 };
 
 /**
@@ -1071,6 +1085,12 @@ struct drm_bridge {
 	void *driver_private;
 	/** @ops: bitmask of operations supported by the bridge */
 	enum drm_bridge_ops ops;
+
+	/** @luminance_max: Maximum relative luminance level. */
+	unsigned int luminance_max;
+
+	/** @luminance: Current relative luminance level. */
+	unsigned int luminance;
 	/**
 	 * @type: Type of the connection at the bridge output
 	 * (DRM_MODE_CONNECTOR_*). For bridges at the end of this chain this
@@ -1522,6 +1542,60 @@ void drm_bridge_hpd_disable(struct drm_bridge *bridge);
 void drm_bridge_hpd_notify(struct drm_bridge *bridge,
 			   enum drm_connector_status status);
 
+#ifdef CONFIG_DRM_PANEL_BRIDGE
+bool drm_bridge_is_panel(const struct drm_bridge *bridge);
+struct drm_bridge *drm_panel_bridge_add(struct drm_panel *panel);
+struct drm_bridge *drm_panel_bridge_add_typed(struct drm_panel *panel,
+					      u32 connector_type);
+void drm_panel_bridge_remove(struct drm_bridge *bridge);
+int drm_panel_bridge_set_orientation(struct drm_connector *connector,
+				     struct drm_bridge *bridge);
+struct drm_bridge *devm_drm_panel_bridge_add(struct device *dev,
+					     struct drm_panel *panel);
+struct drm_bridge *devm_drm_panel_bridge_add_typed(struct device *dev,
+						   struct drm_panel *panel,
+						   u32 connector_type);
+struct drm_bridge *drmm_panel_bridge_add(struct drm_device *drm,
+					     struct drm_panel *panel);
+struct drm_connector *drm_panel_bridge_connector(struct drm_bridge *bridge);
+#else
+static inline bool drm_bridge_is_panel(const struct drm_bridge *bridge)
+{
+	return false;
+}
+
+static inline int drm_panel_bridge_set_orientation(struct drm_connector *connector,
+						   struct drm_bridge *bridge)
+{
+	return -EINVAL;
+}
+
+#endif
+
+#if defined(CONFIG_OF) && defined(CONFIG_DRM_PANEL_BRIDGE)
+struct drm_bridge *devm_drm_of_get_bridge(struct device *dev, struct device_node *node,
+					  u32 port, u32 endpoint);
+struct drm_bridge *drmm_of_get_bridge(struct drm_device *drm, struct device_node *node,
+					  u32 port, u32 endpoint);
+#else
+static inline struct drm_bridge *devm_drm_of_get_bridge(struct device *dev,
+							struct device_node *node,
+							u32 port,
+							u32 endpoint)
+{
+	return ERR_PTR(-ENODEV);
+}
+
+static inline struct drm_bridge *drmm_of_get_bridge(struct drm_device *drm,
+						     struct device_node *node,
+						     u32 port,
+						     u32 endpoint)
+{
+	return ERR_PTR(-ENODEV);
+}
+#endif
+
+void devm_drm_put_bridge(struct device *dev, struct drm_bridge *bridge);
 void drm_bridge_debugfs_params(struct dentry *root);
 void drm_bridge_debugfs_encoder_params(struct dentry *root, struct drm_encoder *encoder);
 

-- 
2.53.0

