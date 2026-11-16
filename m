Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794835636;
	b=Wvzc1g36g4VT1GiVCcB8/OI435Jqe8tia5cVssbsBwDEhVgmPixiI73pIHuE/28ypuQq
	 0GL+9Lj8u5l0x5EWPT3Q/GQQU2U2MZ5NKkU4bHrGAfBUgUZrjrq1oiz8DNw2CMtDCPjKn
	 mzZe9xlyw9hLA1FOn1pL1eieTMEH8A+EuyP0IoBWutleecsh8H1sP0f00tWE6gatNdF9K
	 j1OS30qt8nMJwDIOGwMgOkOZrAzZxESO1DAvWwI0rJ+x4QjVHT6PDOAmDAAgKVJ2/9tYv
	 dJjbDLwXr/T64jMas/AnrDarH9dLhaH5q27BfXcZJP1Is30CtjtK+L44AhmTH/zduvg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794835636;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=qnR50NHSzbJZeR3bRCn/LqR9OGvdrFlstj/3NEkqIu4=;
	b=HrbvAwa3cld/m7NqLui4MnxMKTA6cIcSVO+CjtdOJhcElSri055o4zHK8naQ2exe8nIF
	 1ZCjEFECGv1Xzt8g5GTl9dPsNs1UF8YdXvoAh+a03I/bk4+OEsC0ZBEK0SMHaNTUIX49f
	 D3b1Q3MCzo8q76yxuPpW50z+mSL0Wa8c52NaGg3IPQXuNg0kzeA9pZUzV5L5bDaobmA/g
	 Vj/is2KpiHOUMGlQJtyWGOi/vQG698lgMOWNbz1u94vSrJkBg4rO29+KusUl+F4Cbpb5N
	 B0IWy2CWEI9PFvRxekHtNAgUUUVhg4Fz1IK0eh9yVIuHSWPqPtIvZy5ayAiZJnc2UfA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="wf/cJnDT";
	arc=none smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AAAA606A885
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 13:27:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3AAAA606A885
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wf/cJnDT
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-491aaed7565so1604120f8f.2
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 05:27:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794835635; x=1795440435; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qnR50NHSzbJZeR3bRCn/LqR9OGvdrFlstj/3NEkqIu4=;
        b=wf/cJnDT/XGcZHaV6KmOCV8hT/lQonPLxc5d4DZWKa/bv6PDYc1X1fkJ/i4NnNAcF8
         xf1AAeThx6PXA+3JAuFMGFwZVKRxj3nWpV0MYxfKtpt0xWU6kNfjIsUIn/Mlref5TaWi
         Q43hUESAcE4kYUuBFo5SXvGFx+9I8BonWqnmDFJWVCLHiXVaBdhs4MIT50+/tmPSzbtR
         mnzJJeO1bsPT34wAnVslM9J4RrGKjiDXLqY064LBF0Rx5nL4dyRxvJog3/37bHBvYGub
         wlHldMkBPAtCIJW1Nbz/R71UWDe3Ukavg7vnaTS6ZBiQ0afrfMe9aNeO8caEXV2Sjhn9
         mI5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794835635; x=1795440435;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qnR50NHSzbJZeR3bRCn/LqR9OGvdrFlstj/3NEkqIu4=;
        b=uO+dy5mcyShnDWFRzDghbwEA/SIhYssuHIJc9PUrx5r8akFsr0U3zUNm65Wa4jDIPL
         2oxikEO2CJL45XpbrEhJPeNjbXhg265eheH91/kcTZzt5o/NqW+PZt/PEHfTyNbqTEnj
         6ZpZ7VhAb0uikJQG8BlaN4aMfOe52UXpj5TXoQn20Y91m/MVfkyzESIJPaWPjyP9fzj6
         lbC+l2ma6TxIhKoS5IuJyQJRv1neEFxpVzvBvUjx6lkvUEPQ++aOpljqD5N7ZoXLAIOw
         CyTWaXe1Ds9RLeWQ6v3dQvr4pza04TGFnyTy/Q17gsirK89npSo7zgrcXLjwI/CdhZ2j
         3Ekw==
X-Forwarded-Encrypted: i=1; AL+hErHG0WkqfYGEXz1roo9sRe1alESVzI0PS95CJ6Iuv6Mq0QdsTsurdlyoSYtqQbR3wZb9Gd2kQheRTFb7iPs=@vger.kernel.org
X-Gm-Message-State: APuU4Z/EwHGa0BQ1XlMh96RLouvZ9HQINrEXdj9liOuWjWeH0WWxxVaZ
	8EI30VuNF+u4iNNyuWzt5fAYn47aiElIZiFPDL7BB69Tvn+elfpfuMaD
X-Gm-Gg: AZFdTZeD6Il0LFNYY3mj3J0jaNj0xP01RP3kIV8bvsv9JFe1zeJOKFO5EapXEFcMVcP
	d8nunZo4ginjGziDxA8RNtq/1MNS7vLHPMi9yKGeZogVHblcyT/+rA5pGJKCpRfS8zsy66U4dJP
	os80EmB13E2D+itkQhWc52ElPIYlHmrsqRQyZI0dV6aBa6CCTt5ugl/Zb28VcBXmEO0gl0gr9RE
	jRbrOJ6HdHeTkD7QjdvCrsfv+SVrZR5Rk6sjdO7Twsb+cgLJH15ziBLxzxyuxGKT/y5EoD14hDN
	Bc4R3ibt3vB94jSWJ4H9IVywlY8/vE8mtkejOgKWLMb+dJzNu3itW0uBPTF8gbsssLMXPvj+CCY
	EILeLAq3JrIeD+ILwULTRXLets10X+G+/iVV+0vo4zfFWO1YASR6wHfBYNQPDb+rw879jNJCV/H
	N43wiZVPNkvpKoQpm239UG+NzRzqWEdZG1Nghsd3LVJbkOCIFljlRxizfgVeFCsKF8/z8AC0jmy
	aXHvBbXMKA97C7wSx8cOuHwGpGAT6hnQ2Om2L1FyRUnGCmIy9sTQb7zL7XrSnP7Z4dIaH7t8RCN
	526mgolmtf+yL1WL3mPIkKkiaT3ACqoVF/KEPX+b+yM7wMC+Bly2qwU=
X-Received: by 2002:a05:6000:2f81:b0:48e:62a9:1a65 with SMTP id ffacd0b85a97d-49c73a05861mr23918000f8f.49.1794835634472;
        Mon, 16 Nov 2026 05:27:14 -0800 (PST)
Received: from ingenieria31.oficinasStQ.local ([79.117.0.220])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c8d286480sm40370240f8f.7.2026.11.16.05.27.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 05:27:13 -0800 (PST)
From: =?UTF-8?q?M=C3=A0xim=20Pedraza=20Padilla?= <maximpedraza@gmail.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Jyri Sarha <jyri.sarha@iki.fi>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH 2/4] drm/panel: Implement state readout in the panel bridge
Date: Mon, 16 Nov 2026 15:27:05 +0100
Message-Id: <20261116142707.1299360-3-maximpedraza@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20261116142707.1299360-1-maximpedraza@gmail.com>
References: <20261116142707.1299360-1-maximpedraza@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The state readout core gives up if a private object doesn't implement
readout, so a driver using a panel bridge can't adopt the firmware state,
even if it implements readout itself.

A panel has no state to read back: it's part of the pipeline if the CRTC
feeding its encoder is active. Implement the connector and bridge readout
on that assumption, relying on the encoder's
atomic_sro_get_current_crtc hook, and fill the bus configuration with what
the commit negotiation would give.

When the state is installed, prepare and enable the panel, since nothing
else would until the first modeset.

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Màxim Pedraza Padilla <maximpedraza@gmail.com>
---
 drivers/gpu/drm/drm_panel.c | 92 ++++++++++++++++++++++++++++++++++++-
 1 file changed, 91 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_panel.c b/drivers/gpu/drm/drm_panel.c
index c00529bfb706..7cee228f798b 100644
--- a/drivers/gpu/drm/drm_panel.c
+++ b/drivers/gpu/drm/drm_panel.c
@@ -9,10 +9,14 @@
 #include <linux/debugfs.h>
 #include <linux/err.h>
 #include <linux/export.h>
+#include <linux/media-bus-format.h>
 #include <linux/module.h>
 #include <linux/of.h>
 
+#include <drm/drm_atomic.h>
 #include <drm/drm_atomic_helper.h>
+#include <drm/drm_atomic_state_readout.h>
+#include <drm/drm_atomic_state_readout_helper.h>
 #include <drm/drm_bridge.h>
 #include <drm/drm_connector.h>
 #include <drm/drm_crtc.h>
@@ -216,6 +220,88 @@ static void panel_bridge_debugfs_init(struct drm_bridge *bridge,
 		panel->funcs->debugfs_init(panel, root);
 }
 
+/*
+ * A panel has no state to read back: it's part of the pipeline if the CRTC
+ * feeding its encoder is active.
+ */
+static int panel_bridge_connector_readout(struct drm_bridge *bridge,
+					  struct drm_atomic_sro_state *state,
+					  struct drm_connector_state *conn_state)
+{
+	struct drm_connector *connector = conn_state->connector;
+	struct drm_encoder *encoder = bridge->encoder;
+	struct drm_crtc_state *crtc_state;
+	struct drm_crtc *crtc;
+
+	if (!encoder->funcs || !encoder->funcs->atomic_sro_get_current_crtc)
+		return -ENODEV;
+
+	crtc = encoder->funcs->atomic_sro_get_current_crtc(encoder);
+	if (!crtc)
+		return -ENODEV;
+
+	crtc_state = drm_atomic_sro_get_crtc_state(state, crtc);
+	if (!crtc_state)
+		return -ENODEV;
+
+	if (!crtc_state->active)
+		return 0;
+
+	crtc_state->encoder_mask |= drm_encoder_mask(encoder);
+	crtc_state->connector_mask |= drm_connector_mask(connector);
+
+	/* Released by __drm_atomic_helper_connector_destroy_state(). */
+	drm_connector_get(connector);
+	conn_state->crtc = crtc;
+	conn_state->best_encoder = encoder;
+
+	return 0;
+}
+
+/*
+ * Same result as the bus format negotiation of a commit, which doesn't run
+ * during readout: the panel asks for its first format and flags, and passes
+ * them on through drm_atomic_helper_bridge_propagate_bus_fmt().
+ */
+static int panel_bridge_readout_state(struct drm_bridge *bridge,
+				      struct drm_atomic_sro_state *state,
+				      struct drm_bridge_state *bridge_state,
+				      struct drm_crtc_state *crtc_state,
+				      struct drm_connector_state *conn_state)
+{
+	const struct drm_display_info *di = &conn_state->connector->display_info;
+	u32 format = di->num_bus_formats ? di->bus_formats[0] : MEDIA_BUS_FMT_FIXED;
+
+	bridge_state->input_bus_cfg.format = format;
+	bridge_state->input_bus_cfg.flags = di->bus_flags;
+	bridge_state->output_bus_cfg.format = format;
+	bridge_state->output_bus_cfg.flags = di->bus_flags;
+
+	return 0;
+}
+
+/*
+ * The firmware left the pipeline running, so the panel is taken as part of it.
+ * Without this it would stay off until the first modeset.
+ */
+static void panel_bridge_install_state(struct drm_bridge *bridge,
+				       struct drm_bridge_state *state)
+{
+	struct drm_panel *panel = drm_bridge_to_panel(bridge);
+	struct drm_encoder *encoder = bridge->encoder;
+	struct drm_crtc *crtc;
+
+	if (!encoder->funcs || !encoder->funcs->atomic_sro_get_current_crtc)
+		return;
+
+	crtc = encoder->funcs->atomic_sro_get_current_crtc(encoder);
+	if (!crtc || !crtc->state->active)
+		return;
+
+	drm_panel_prepare(panel);
+	drm_panel_enable(panel);
+}
+
 static const struct drm_bridge_funcs panel_bridge_bridge_funcs = {
 	.attach = panel_bridge_attach,
 	.detach = panel_bridge_detach,
@@ -228,6 +314,10 @@ static const struct drm_bridge_funcs panel_bridge_bridge_funcs = {
 	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
 	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
 	.atomic_get_input_bus_fmts = drm_atomic_helper_bridge_propagate_bus_fmt,
+	.atomic_sro_readout_state = panel_bridge_readout_state,
+	.atomic_sro_compare_state = drm_atomic_helper_bridge_compare_state,
+	.atomic_sro_connector_readout = panel_bridge_connector_readout,
+	.atomic_sro_install_state = panel_bridge_install_state,
 	.debugfs_init = panel_bridge_debugfs_init,
 };
 
@@ -600,7 +690,7 @@ void drm_panel_add(struct drm_panel *panel)
 	mutex_unlock(&panel_lock);
 
 	panel->bridge.of_node = panel->dev->of_node;
-	panel->bridge.ops = DRM_BRIDGE_OP_MODES;
+	panel->bridge.ops = DRM_BRIDGE_OP_MODES | DRM_BRIDGE_OP_CONNECTOR_HW_READOUT;
 	panel->bridge.type = panel->connector_type;
 	panel->bridge.pre_enable_prev_first = panel->prepare_prev_first;
 
-- 
2.39.5

