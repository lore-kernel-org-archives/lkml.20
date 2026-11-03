Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793745751;
	b=1OmL+WmvWZ3lOluGjewGMxFjW/gpBFNJdCANa/zpEp2OPwz95aiOzLVQSshEryd1Ius6
	 sde6nPi1jHnxAvKmhfw001wLTIN3EBlqqFo6aX+wEv0dEEWgPfRJ+/prAAulVDPqoX13j
	 LWLIcmASQtlD9jFhPHdVrdf9+hQnJYD+zW/WJontgVYv6G6KAfpWCUrFPySKuXFRCHwEF
	 8Cc4U0PJWTsqww6OVtDzFB8Qt9e464EE6svs1t4eEeLJcGTecf/XidgLI9lUNnGPz43Rq
	 14KEQyS4/2/aEOR/Ec3NAkbOnv6l8sUaAyxcKtVTdGPPRdjLTp+SdUOUbH6UgGPWHXA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793745751;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer;
	bh=fvn4+ks21SRxa0VzR/PJnePhk9H00+N90WHNmNwJuzg=;
	b=m2YNpqd4+P9J1oz2ijGyurDq0LHAM/RbqtFzSyJGhTwDeo5dn9QJ0hHgdPcSH/cvD6VJ
	 oPnXSsj5VN5YzWNx/vtW7MVBzG2zf7OGx8FvGofBHxnARM43Z0h8gv41QBa0OaEEnDVCB
	 qAKl+Hy29Nx27oG1sTgQAbjx2eUSzketXNuht2zFhl2o59On+lEKvLatXt3FqSnPO1bT5
	 pHFW8b2Z0BhqoUXO4EW528+NBkR8wJmOPsi32wmPT4Pl3543dgMOS7paYLIEvKFYyR2Fy
	 y4tw8dav98kRgDNF0xVRJE1odoych0II+HRdBbmHn7oTlLzNN17ERSN+ilW0ryjG2Zw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="Asgd9/r9";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09E8E606A330
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 22:42:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Asgd9/r9
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E85861F0093A;
	Tue,  3 Nov 2026 22:42:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793745750;
	bh=fvn4+ks21SRxa0VzR/PJnePhk9H00+N90WHNmNwJuzg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=Asgd9/r90J3R8FJI73oD19Ga27Kg5F5In/D4tHRbxAIur5Bar5CAJ9TEBXUCA0eBI
	 OpGmg48RJComZWu5vg+M+wvcpwqVHSdcdKcbtxcrCTEwjxMNLJUTCQ5artxEFQG/Q2
	 shor6Q8/o2M09k0GBA/gxIQiPHu6yQqRk99/fGT2ZMEw6UsyFnGIU9K+E/yq4FlR8s
	 ChNfOfLiYYkQEhWExaUALO/+8lUBVpIgtQdd9MVfBKrtMBTrPjIsN4nJqxiDQMKboZ
	 QIETuRfN8axk4ULDKl5czLgT0aj/JTumQRhtSIgBtR9z7ZAxP4PxSZ1N/yBDLhRgeL
	 4muKao+gO11Sg==
From: "Mario Limonciello (AMD)" <superm1@kernel.org>
Date: Tue, 03 Nov 2026 16:42:09 -0600
Subject: [PATCH v11 08/12] drm/bridge_connector: add luminance support
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
Message-Id: <20261103-superm1-backlight-property-v11-8-00cce7b2ba22@kernel.org>
References: <20261103-superm1-backlight-property-v11-0-00cce7b2ba22@kernel.org>
In-Reply-To: <20261103-superm1-backlight-property-v11-0-00cce7b2ba22@kernel.org>
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

Discover the last bridge in a chain that owns brightness control, attach
its relative luminance range to the connector, and forward atomic
luminance updates to it.

Do not infer panel luminance support from a terminal panel bridge. Panels
still have direct consumers, so their connector integration must remain
explicit.

Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
v11:
 * Drop .disable_luminance, it clobbered the bridge's saved level; the
   bridge disable path already turns the panel off
 * Fix checkpatch line length
v10:
 * Split bridge connector integration into a separate patch
 * Do not special-case panels in the generic bridge connector
---
 drivers/gpu/drm/display/drm_bridge_connector.c | 39 ++++++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/drivers/gpu/drm/display/drm_bridge_connector.c b/drivers/gpu/drm/display/drm_bridge_connector.c
index 2202e60444449..18927fed83732 100644
--- a/drivers/gpu/drm/display/drm_bridge_connector.c
+++ b/drivers/gpu/drm/display/drm_bridge_connector.c
@@ -125,6 +125,13 @@ struct drm_bridge_connector {
 	 */
 	struct drm_bridge *bridge_hdmi_cec;
 
+	/**
+	 * @bridge_luminance:
+	 *
+	 * The last bridge in the chain that controls panel luminance.
+	 */
+	struct drm_bridge *bridge_luminance;
+
 	/**
 	 * @hdmi_funcs:
 	 *
@@ -421,6 +428,17 @@ static int drm_bridge_connector_atomic_check(struct drm_connector *connector,
 	return 0;
 }
 
+static void
+drm_bridge_connector_set_luminance(const struct drm_connector_state *conn_state)
+{
+	struct drm_bridge_connector *bridge_connector =
+		to_drm_bridge_connector(conn_state->connector);
+	struct drm_bridge *bridge = bridge_connector->bridge_luminance;
+
+	if (bridge)
+		bridge->funcs->set_luminance(bridge, conn_state->luminance);
+}
+
 static const struct drm_connector_helper_funcs drm_bridge_connector_helper_funcs = {
 	.get_modes = drm_bridge_connector_get_modes,
 	.detect_ctx = drm_bridge_connector_detect_ctx,
@@ -429,6 +447,7 @@ static const struct drm_connector_helper_funcs drm_bridge_connector_helper_funcs
 	.enable_hpd = drm_bridge_connector_enable_hpd,
 	.disable_hpd = drm_bridge_connector_disable_hpd,
 	.atomic_check = drm_bridge_connector_atomic_check,
+	.set_luminance = drm_bridge_connector_set_luminance,
 };
 
 static enum drm_mode_status
@@ -835,6 +854,7 @@ static void drm_bridge_connector_put_bridges(struct drm_device *dev, void *data)
 	drm_bridge_put(bridge_connector->bridge_hdmi_audio);
 	drm_bridge_put(bridge_connector->bridge_dp_audio);
 	drm_bridge_put(bridge_connector->bridge_hdmi_cec);
+	drm_bridge_put(bridge_connector->bridge_luminance);
 }
 
 /**
@@ -918,6 +938,13 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
 			drm_bridge_put(bridge_connector->bridge_detect);
 			bridge_connector->bridge_detect = drm_bridge_get(bridge);
 		}
+		if (bridge->ops & DRM_BRIDGE_OP_LUMINANCE) {
+			if (!bridge->funcs->set_luminance)
+				return ERR_PTR(-EINVAL);
+
+			drm_bridge_put(bridge_connector->bridge_luminance);
+			bridge_connector->bridge_luminance = drm_bridge_get(bridge);
+		}
 		if (bridge->ops & DRM_BRIDGE_OP_HDMI) {
 			if (bridge_connector->bridge_hdmi)
 				return ERR_PTR(-EBUSY);
@@ -1144,6 +1171,18 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
 	if (panel_bridge)
 		drm_panel_bridge_set_orientation(connector, panel_bridge);
 
+	if (IS_ENABLED(CONFIG_DRM_LUMINANCE) &&
+	    bridge_connector->bridge_luminance &&
+	    !connector->luminance_property) {
+		struct drm_bridge *bridge = bridge_connector->bridge_luminance;
+
+		ret = drm_connector_attach_luminance_property(connector, 0,
+							      bridge->luminance_max,
+							      bridge->luminance);
+		if (ret)
+			return ERR_PTR(ret);
+	}
+
 	if (support_hdcp && IS_REACHABLE(CONFIG_DRM_DISPLAY_HELPER) &&
 	    IS_ENABLED(CONFIG_DRM_DISPLAY_HDCP_HELPER))
 		drm_connector_attach_content_protection_property(connector, true);

-- 
2.53.0

