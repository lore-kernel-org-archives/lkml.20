Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B5D3499F12
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 15:12:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791817936; cv=none; b=njB9nX+iB42v4daStgdoO502JqZ5IYEL/gD1AlxSNEUAf0WUeXGn2jZXJqR3L+wJxGm8spnmldSqRJXV3SQrSggVvXDIS/u6Zd9x3WMMgQdBWInc4lRGpJrDTQGolsboftpiKBAEzWSh8uaIACWhcLa7Vrb5OeiF1G7JNExljbM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791817936; c=relaxed/simple;
	bh=FXJ7NeMWkgC3IcuelHHXMrwzFiRbf2V6hx0iLsaOCoI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Y8DqvdDUa1To2YHMIWlgIi83oRiAj+ngqPdfEfYYl27rJ42AFLDhnHlfhMXwwetWm3+dqT+YmVltzvXA3Riof6bFlPaWmhuinKrhXnNc8e5Bq6NpKqrzRW3yL6Cll/XBG7lR2ufmH1VqcSJtUfRui6PY+vSo95+LET1aHD5NOQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=TGgCMtlj; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="TGgCMtlj"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 8E4951A11EB;
	Mon, 12 Oct 2026 15:12:13 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 60EC2601A6;
	Mon, 12 Oct 2026 15:12:13 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1287311D70211;
	Mon, 12 Oct 2026 17:12:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1791817931; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=CY/snekrJ2jbr2xcfeIZ0vrbUr9dIQOslPzIssPtkas=;
	b=TGgCMtlj91Z2mqCWy754IMuKuubSH3Ua67cehuDX7NW1UO/8VFgTMslXLtwnN/H0PW1Og5
	Ty9F9hCQAVguEwm2UIHIuYYlXBQ2CR+3QQlGu2lZ56FvfMSNsx5+stEesFPRRoFzaVDM/d
	fem6gGcP69WhmRIhKmubEw3Aq3116Gn2hNcLdnkWvXF9ZoFNaJNWHHF4KpEgTdKHAr1WKI
	+C/TKcm3hKLswDgqXceAN9j4SOgVEJKdu1J7SnW6uSD2Je0t1hstj7LyYDczPBM50YjQ1t
	Sb+I3fqpEca0Agu5QZo+siPiHLiShO4sTpQGIM6k6zkYJA7mi1mkh3ZN2GXycw==
From: Kory Maincent <kory.maincent@bootlin.com>
Date: Mon, 12 Oct 2026 17:11:02 +0200
Subject: [PATCH RFC v3 7/8] drm/analogix/anx7625: Use dp_connector helpers
 to expose link training state
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261012-feat_link_cap-v3-7-7517f4aba0f3@bootlin.com>
References: <20261012-feat_link_cap-v3-0-7517f4aba0f3@bootlin.com>
In-Reply-To: <20261012-feat_link_cap-v3-0-7517f4aba0f3@bootlin.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, 
 Tvrtko Ursulin <tursulin@ursulin.net>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, Daniel Stone <daniels@collabora.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Mark Yacoub <markyacoub@google.com>, Sean Paul <seanpaul@google.com>, 
 Manasi Navare <navaremanasi@google.com>, 
 Drew Davenport <ddavenport@google.com>, 
 Louis Chauvet <louis.chauvet@bootlin.com>, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, intel-gfx@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, 
 Kory Maincent <kory.maincent@bootlin.com>
X-Mailer: b4 0.16.1-dev-17221
X-Last-TLS-Session-Version: TLSv1.3

Adopt the DRM core DisplayPort helpers by setting DRM_BRIDGE_OP_DP and
populating the bridge dp_link_caps at probe time. Report the sink
capabilities on hotplug, reset them on disconnect, and report the link
parameters once link training succeeds.

Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
---
Change in v3:
- New patch
---
 drivers/gpu/drm/bridge/analogix/anx7625.c | 68 +++++++++++++++++++++++++++++++
 drivers/gpu/drm/bridge/analogix/anx7625.h |  1 +
 2 files changed, 69 insertions(+)

diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
index c3af88e14f8b2..2b1235efc9fa4 100644
--- a/drivers/gpu/drm/bridge/analogix/anx7625.c
+++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
@@ -2558,6 +2558,31 @@ static int anx7625_bridge_atomic_check(struct drm_bridge *bridge,
 	return 0;
 }
 
+static void anx7625_report_link_train(struct anx7625_data *ctx,
+				      struct drm_connector *connector)
+{
+	int bw_code, rate, nlanes;
+
+	/*
+	 * The DP link training is handled by the internal OCM firmware, read
+	 * back the negotiated link rate and lane count.
+	 */
+	bw_code = anx7625_reg_read(ctx, ctx->i2c.tx_p0_client,
+				   SP_TX_LINK_BW_SET_REG);
+	if (bw_code < 0)
+		return;
+
+	rate = drm_dp_bw_code_to_link_rate(bw_code & SP_TX_LINK_BW_SET_MASK);
+
+	nlanes = anx7625_reg_read(ctx, ctx->i2c.tx_p0_client,
+				  SP_TX_LANE_COUNT_SET_REG);
+	if (nlanes < 0)
+		return;
+	nlanes &= DP_MAX_LANE_COUNT_MASK;
+
+	drm_dp_set_cur_link_params(connector, rate, nlanes, false);
+}
+
 static void anx7625_bridge_atomic_enable(struct drm_bridge *bridge,
 					 struct drm_atomic_commit *state)
 {
@@ -2565,6 +2590,7 @@ static void anx7625_bridge_atomic_enable(struct drm_bridge *bridge,
 	struct device *dev = ctx->dev;
 	struct drm_connector *connector;
 	struct drm_connector_state *conn_state;
+	int ret;
 
 	dev_dbg(dev, "drm atomic enable\n");
 
@@ -2580,6 +2606,17 @@ static void anx7625_bridge_atomic_enable(struct drm_bridge *bridge,
 
 	anx7625_dp_start(ctx);
 
+	/* On DisplayPort case, the caps are set in the detect callback. */
+	if (bridge->type == DRM_MODE_CONNECTOR_eDP) {
+		ret = drm_dp_sink_sync_caps(connector, &ctx->aux, NULL);
+		if (ret)
+			DRM_DEV_DEBUG_DRIVER(dev,
+					     "error sink caps synchronisation (%d)\n",
+					     ret);
+	}
+
+	anx7625_report_link_train(ctx, connector);
+
 	conn_state = drm_atomic_get_new_connector_state(state, connector);
 
 	if (WARN_ON(!conn_state))
@@ -2616,6 +2653,12 @@ static void anx7625_bridge_atomic_disable(struct drm_bridge *bridge,
 		dev_dbg(dev, "update CP to DESIRE\n");
 	}
 
+	/* On DisplayPort unplug, the caps are already reset in the detect
+	 * callback.
+	 */
+	if (bridge->type == DRM_MODE_CONNECTOR_eDP)
+		drm_dp_sink_reset_caps(ctx->connector);
+
 	ctx->connector = NULL;
 	anx7625_dp_stop(ctx);
 
@@ -2634,11 +2677,25 @@ anx7625_bridge_detect(struct drm_bridge *bridge, struct drm_connector *connector
 	struct anx7625_data *ctx = bridge_to_anx7625(bridge);
 	struct device *dev = ctx->dev;
 	enum drm_connector_status status;
+	int ret;
 
 	DRM_DEV_DEBUG_DRIVER(dev, "drm bridge detect\n");
 
 	status = anx7625_sink_detect(ctx);
 	anx7625_audio_update_connector_status(ctx, status);
+
+	if (status == connector_status_connected) {
+		ret = drm_dp_sink_sync_caps(connector, &ctx->aux, NULL);
+		if (ret)
+			DRM_DEV_DEBUG_DRIVER(dev,
+					     "error sink caps synchronisation (%d)\n",
+					     ret);
+
+		anx7625_report_link_train(ctx, connector);
+	} else {
+		drm_dp_sink_reset_caps(connector);
+	}
+
 	return status;
 }
 
@@ -2765,6 +2822,14 @@ static const struct dev_pm_ops anx7625_pm_ops = {
 			   anx7625_runtime_pm_resume, NULL)
 };
 
+static int anx7625_dp_rates[] = {162000, 270000, 540000, 675000};
+
+static struct drm_connector_dp_link_caps anx7625_dp_link_caps = {
+	.nlanes = 2,
+	.nlink_rates = ARRAY_SIZE(anx7625_dp_rates),
+	.link_rates = anx7625_dp_rates,
+};
+
 static int anx7625_link_bridge(struct drm_dp_aux *aux)
 {
 	struct anx7625_data *platform = container_of(aux, struct anx7625_data, aux);
@@ -2787,6 +2852,9 @@ static int anx7625_link_bridge(struct drm_dp_aux *aux)
 				    DRM_MODE_CONNECTOR_DisplayPort;
 	platform->bridge.support_hdcp = true;
 
+	platform->bridge.dp_link_caps = &anx7625_dp_link_caps;
+	platform->bridge.ops |= DRM_BRIDGE_OP_DP;
+
 	drm_bridge_add(&platform->bridge);
 
 	if (!platform->pdata.is_dpi) {
diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.h b/drivers/gpu/drm/bridge/analogix/anx7625.h
index 957d234ec07c8..b9a0f62f6398c 100644
--- a/drivers/gpu/drm/bridge/analogix/anx7625.h
+++ b/drivers/gpu/drm/bridge/analogix/anx7625.h
@@ -90,6 +90,7 @@
 #define HDCP2TX_FW_EN			BIT(4)
 
 #define SP_TX_LINK_BW_SET_REG		0xA0
+#define SP_TX_LINK_BW_SET_MASK		0x1F
 #define SP_TX_LANE_COUNT_SET_REG	0xA1
 
 #define M_VID_0 0xC0

-- 
2.43.0

