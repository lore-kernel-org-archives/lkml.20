Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C18441A6800
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 10:07:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788948466; cv=none; b=jQ6EC4W/qPsLXDyPloLVqKTzm1oDMpZW5z+XNGpDa+ZZ3t2rNXuKYkVmqlk08yayt6NiKpkZyGNpaDAR8Y63HxTvHkPUmgTk10YPFLhE7H3zmzsgz4ZM3wL2w37KYEhm7t3NxJeQp7greIN7xd0vHVjEOOrbWYMCQg9QJNHgC6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788948466; c=relaxed/simple;
	bh=P/A9xF34cMNRqPX8bQ1TQRUfetY+lBI5Fu6wFeEvcLk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nrfx3n5wGGglgqSAj2MWkVR8qQr9mO4GLY2+jr68VnSJ0w+gPDnbCA9sE/t46fQnbl7Dfo6RPr8lNGbbHucqX+qWlDJTtEu4IfLsEWPkede1zIAgj854CSzBDK+W/mQzakAiDmDbsZl3cb5dz/pOzJYy9u+Y3h29Zt76ziCt/3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GD7rCqOT; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GD7rCqOT"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-49ccfbe062eso54980105e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 03:07:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788948463; x=1789553263; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cbb3Uw3ukKqnxH5JeLiUaWg1blYZdACAN4qfjZCbhzc=;
        b=GD7rCqOTY6VsG/aerJBoeAT8JJPuZ9KwRTO2CKgVN4nkn20sOikTwPV5zigUxl/vMa
         OdAK3w6tba6KRdUnR7XtQUOjUJy1tDOXfihwCVGN1rZ/JGWGFamrVl0F+qmrNHY9oUAX
         XNb0XIZUzXCrH/vFo1CsiEEECg0tRQGgeXdg/cztz9Oyu4g6QkhLXDlBUGhr/Vi3qzHw
         pk4razFI/DnquQ4wUCEZlEfJwCxYKvL9XmlUFB2+GXMA0zC8wXrRggL7B5Cn5J6vLimL
         foeoD+EgoImCzerTV04dQSmlFpRz0+wX0OlLqJLB6rLocvzGE7AXgBx5gS3s8neamCiu
         vc9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788948463; x=1789553263;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cbb3Uw3ukKqnxH5JeLiUaWg1blYZdACAN4qfjZCbhzc=;
        b=retaRdO4a41Gymzf2+d29wcgB7qnR0Ny8wZNhZbX1ED/8roi1L+RmvJE5l+cURVXTV
         SwQU6ClOYKzI1vxE7Uz1ZVDH5KucU7bl+lJQfmyilmJSaoLlfR+MGfYIcbKjxQmQ87yC
         GdRZEKZnEld3FngCSsjwWUgvZ3sRF0R/X7KT9xr2ynQ6bjzTu4f2WHjwnpy7BVGXnodM
         OFZSSyfQsDkZNS6WRKHj+3kpwmH9/R1K28QRuiiFtbJrmWWnY+V+F/qAlDNC7koG5ahH
         553NDOLWQEGPx6mRC82y/i9TwWfesxd6WpWMsTnAzYd2LXpBr2MSAUnnEdPFXhcIPJO7
         nSSA==
X-Forwarded-Encrypted: i=1; AKwUvByX+WdLWW/s4mlI+AiiPmDiCBFuAfOqDCUHHFEs52MtU2Q4869TPk/fdnUhG98L5zYCOJKaaPYN55w1Jco=@vger.kernel.org
X-Gm-Message-State: AFuF++mfuahWHbwvO3XZCd/Yv/VeEFHesDWOhceE5B4vbZU16HVBCGo6
	P7SEEXqvuCpUqm8RM2MfMXH9SbCyYzLxwidMJB79/wJX9OQ4qtXaLxMP
X-Gm-Gg: AYBFou2s2blzN8n1OsB0UctQzH+3pPvBpPh4uA4KH2UmR5FIm/inX1mnmTEEBk9KmGc
	eQHZYdLSFDKc+d3c7/lDxo6xyJp6E5GpjY5iM5aVK/eEcuuJl+KUnmFHkKtL/XP1z+cNcC0rHtA
	apuPF3/r4kySxfB8Uq4MAvPMdxUyrOEpYyZFHbaRBqkXoS+u7KTB5xJVvPcdSwqsp6gnqVPJTMX
	WQfPysmSkmn+LPgK5vnY8f245KXWzoUTJz+49lRvqzt1DDe3c8J0fedClXpemksEWlaWi4apLFE
	t/MZkhshfBaLu5xLQJLe8WIpDtKsxwFg9LH+TEZtH8QwjqJASjWsG8NM4NSoSH8vPqXAfiuo6DR
	xYdbO8X6UmcjRjdjYJQNaGXD06p7EBJGEQp5j0OIDbtQzYPnjCKBt2XWqLAkEy9B7rssS6ATTD8
	tziJ1lRefj7HZI8+AAW1ZKBchzeEmhFKrRcE7EBOPS6Gh44we0/TNnp75650pXT5hBGQ9POQos6
	yUovjDQmuro6EWwLj3n1PMSTZnVu7BB3EUgWkzKebK4DOAwJy+tX9pBvuVtoTSfpORjhqPiuguW
	jKs8DkR6xakN+ufbFgtADvxjt/ueB+65kG7stA==
X-Received: by 2002:a05:600c:3f08:b0:49c:fa20:cc04 with SMTP id 5b1f17b1804b1-49cfa20cd10mr298178875e9.27.1788948462779;
        Wed, 09 Sep 2026 03:07:42 -0700 (PDT)
Received: from PC-Davide.homenet.telecomitalia.it (host-79-24-252-102.retail.telecomitalia.it. [79.24.252.102])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d20da3354sm37813545e9.2.2026.09.09.03.07.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 03:07:42 -0700 (PDT)
From: Davide Bonatto <bonatto.davide@gmail.com>
To: Alexey Brodkin <abrodkin@synopsys.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	dri-devel@lists.freedesktop.org (open list:DRM DRIVERS),
	linux-kernel@vger.kernel.org (open list)
Cc: Davide Bonatto <bonatto.davide@gmail.com>
Subject: [PATCH v2] drm/tiny: arcpgu: Replace simple display pipe with regular atomic helpers
Date: Wed,  9 Sep 2026 12:07:36 +0200
Message-ID: <20260909100741.147859-1-bonatto.davide@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260909092455.13.19.62-1-bonatto.davide@gmail.com>
References: <20260909092455.13.19.62-1-bonatto.davide@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The drm_simple_display_pipe helper is considered legacy/deprecated in
favor of explicitly managing individual plane, CRTC, and encoder objects
using standard atomic helpers.

Migrate arcpgu to initialize its primary plane, CRTC, and encoder
explicitly, and route mode validation, enable, and disable hooks
through drm_crtc_helper_funcs, and plane updates through
drm_plane_helper_funcs.

Signed-off-by: Davide Bonatto <bonatto.davide@gmail.com>
---
v2:
  - Add .prepare_fb callback to support implicit synchronization.
  - Add .atomic_check using drm_atomic_helper_check_plane_state()
    to validate hardware scaling/clipping constraints.
  - Implement arc_pgu_plane_atomic_disable() to stop DMA and clear
    buffer address register, preventing hardware DMA scanout UAF.

 drivers/gpu/drm/tiny/arcpgu.c | 159 ++++++++++++++++++++++++++--------
 1 file changed, 125 insertions(+), 34 deletions(-)

diff --git a/drivers/gpu/drm/tiny/arcpgu.c b/drivers/gpu/drm/tiny/arcpgu.c
index c93d61ac0bb7..e500e6e52b66 100644
--- a/drivers/gpu/drm/tiny/arcpgu.c
+++ b/drivers/gpu/drm/tiny/arcpgu.c
@@ -5,6 +5,8 @@
  * Copyright (C) 2016 Synopsys, Inc. (www.synopsys.com)
  */
 
+#include "drm/drm_gem_atomic_helper.h"
+
 #include <linux/clk.h>
 
 #include <drm/clients/drm_client_setup.h>
@@ -23,6 +25,8 @@
 #include <drm/drm_of.h>
 #include <drm/drm_probe_helper.h>
 #include <drm/drm_simple_kms_helper.h>
+#include <drm/drm_atomic.h>
+#include <drm/drm_bridge.h>
 #include <linux/dma-mapping.h>
 #include <linux/module.h>
 #include <linux/of_reserved_mem.h>
@@ -52,13 +56,17 @@ struct arcpgu_drm_private {
 	struct drm_device	drm;
 	void __iomem		*regs;
 	struct clk		*clk;
-	struct drm_simple_display_pipe pipe;
+	struct drm_plane	plane;
+	struct drm_crtc		crtc;
+	struct drm_encoder	encoder;
 	struct drm_connector	sim_conn;
 };
 
 #define dev_to_arcpgu(x) container_of(x, struct arcpgu_drm_private, drm)
 
-#define pipe_to_arcpgu_priv(x) container_of(x, struct arcpgu_drm_private, pipe)
+#define crtc_to_arcpgu_priv(x) container_of(x, struct arcpgu_drm_private, crtc)
+
+#define plane_to_arcpgu(x) container_of(x, struct arcpgu_drm_private, plane)
 
 static inline void arc_pgu_write(struct arcpgu_drm_private *arcpgu,
 				 unsigned int reg, u32 value)
@@ -117,8 +125,8 @@ static const u32 arc_pgu_supported_formats[] = {
 
 static void arc_pgu_set_pxl_fmt(struct arcpgu_drm_private *arcpgu)
 {
-	const struct drm_framebuffer *fb = arcpgu->pipe.plane.state->fb;
-	uint32_t pixel_format = fb->format->format;
+	const struct drm_framebuffer *fb = arcpgu->plane.state->fb;
+	u32 pixel_format = fb->format->format;
 	u32 format = DRM_FORMAT_INVALID;
 	int i;
 	u32 reg_ctrl;
@@ -139,10 +147,10 @@ static void arc_pgu_set_pxl_fmt(struct arcpgu_drm_private *arcpgu)
 	arc_pgu_write(arcpgu, ARCPGU_REG_CTRL, reg_ctrl);
 }
 
-static enum drm_mode_status arc_pgu_mode_valid(struct drm_simple_display_pipe *pipe,
-					       const struct drm_display_mode *mode)
+static enum drm_mode_status arc_pgu_crtc_mode_valid(struct drm_crtc *crtc,
+						    const struct drm_display_mode *mode)
 {
-	struct arcpgu_drm_private *arcpgu = pipe_to_arcpgu_priv(pipe);
+	struct arcpgu_drm_private *arcpgu = crtc_to_arcpgu_priv(crtc);
 	long rate, clk_rate = mode->clock * 1000;
 	long diff = clk_rate / 200; /* +-0.5% allowed by HDMI spec */
 
@@ -155,7 +163,7 @@ static enum drm_mode_status arc_pgu_mode_valid(struct drm_simple_display_pipe *p
 
 static void arc_pgu_mode_set(struct arcpgu_drm_private *arcpgu)
 {
-	struct drm_display_mode *m = &arcpgu->pipe.crtc.state->adjusted_mode;
+	struct drm_display_mode *m = &arcpgu->crtc.state->adjusted_mode;
 	u32 val;
 
 	arc_pgu_write(arcpgu, ARCPGU_REG_FMT,
@@ -194,49 +202,107 @@ static void arc_pgu_mode_set(struct arcpgu_drm_private *arcpgu)
 	clk_set_rate(arcpgu->clk, m->crtc_clock * 1000);
 }
 
-static void arc_pgu_enable(struct drm_simple_display_pipe *pipe,
-			   struct drm_crtc_state *crtc_state,
-			   struct drm_plane_state *plane_state)
+static void arc_pgu_crtc_atomic_enable(struct drm_crtc *crtc,
+				       struct drm_atomic_commit *state)
 {
-	struct arcpgu_drm_private *arcpgu = pipe_to_arcpgu_priv(pipe);
+	struct arcpgu_drm_private *arcpgu = crtc_to_arcpgu_priv(crtc);
 
 	arc_pgu_mode_set(arcpgu);
 
 	clk_prepare_enable(arcpgu->clk);
 	arc_pgu_write(arcpgu, ARCPGU_REG_CTRL,
 		      arc_pgu_read(arcpgu, ARCPGU_REG_CTRL) |
-		      ARCPGU_CTRL_ENABLE_MASK);
+		ARCPGU_CTRL_ENABLE_MASK);
 }
 
-static void arc_pgu_disable(struct drm_simple_display_pipe *pipe)
+static void arc_pgu_crtc_atomic_disable(struct drm_crtc *crtc,
+					struct drm_atomic_commit *state)
 {
-	struct arcpgu_drm_private *arcpgu = pipe_to_arcpgu_priv(pipe);
+	struct arcpgu_drm_private *arcpgu = crtc_to_arcpgu_priv(crtc);
 
 	clk_disable_unprepare(arcpgu->clk);
 	arc_pgu_write(arcpgu, ARCPGU_REG_CTRL,
-			      arc_pgu_read(arcpgu, ARCPGU_REG_CTRL) &
-			      ~ARCPGU_CTRL_ENABLE_MASK);
+		      arc_pgu_read(arcpgu, ARCPGU_REG_CTRL) &
+		~ARCPGU_CTRL_ENABLE_MASK);
 }
 
-static void arc_pgu_update(struct drm_simple_display_pipe *pipe,
-			   struct drm_plane_state *state)
+static void arc_pgu_plane_atomic_update(struct drm_plane *plane,
+					struct drm_atomic_commit *state)
 {
-	struct arcpgu_drm_private *arcpgu;
+	struct arcpgu_drm_private *arcpgu = plane_to_arcpgu(plane);
+	struct drm_plane_state *new_plane_state = drm_atomic_get_new_plane_state(state, plane);
 	struct drm_gem_dma_object *gem;
 
-	if (!pipe->plane.state->fb)
+	if (!new_plane_state->fb)
 		return;
 
-	arcpgu = pipe_to_arcpgu_priv(pipe);
-	gem = drm_fb_dma_get_gem_obj(pipe->plane.state->fb, 0);
+	gem = drm_fb_dma_get_gem_obj(new_plane_state->fb, 0);
 	arc_pgu_write(arcpgu, ARCPGU_REG_BUF0_ADDR, gem->dma_addr);
 }
 
-static const struct drm_simple_display_pipe_funcs arc_pgu_pipe_funcs = {
-	.update = arc_pgu_update,
-	.mode_valid = arc_pgu_mode_valid,
-	.enable	= arc_pgu_enable,
-	.disable = arc_pgu_disable,
+static void arc_pgu_plane_atomic_disable(struct drm_plane *plane,
+					 struct drm_atomic_commit *state)
+{
+	struct arcpgu_drm_private *arcpgu = plane_to_arcpgu(plane);
+
+	arc_pgu_write(arcpgu, ARCPGU_REG_BUF0_ADDR, 0);
+	arc_pgu_write(arcpgu, ARCPGU_REG_CTRL,
+		      arc_pgu_read(arcpgu, ARCPGU_REG_CTRL) &
+		      ~ARCPGU_CTRL_ENABLE_MASK);
+}
+
+static int arc_pgu_plane_atomic_check(struct drm_plane *plane,
+				      struct drm_atomic_commit *state)
+{
+	struct drm_plane_state *new_plane_state = drm_atomic_get_new_plane_state(state, plane);
+	struct drm_crtc_state *crtc_state;
+
+	if (!new_plane_state->crtc)
+		return 0;
+
+	crtc_state = drm_atomic_get_new_crtc_state(state, new_plane_state->crtc);
+	if (!crtc_state)
+		return -EINVAL;
+
+	return drm_atomic_helper_check_plane_state(new_plane_state, crtc_state,
+						   DRM_PLANE_NO_SCALING,
+						   DRM_PLANE_NO_SCALING,
+						   false, true);
+}
+
+static const struct drm_crtc_helper_funcs arc_pgu_crtc_helper_funcs = {
+	.mode_valid	= arc_pgu_crtc_mode_valid,
+	.atomic_enable	= arc_pgu_crtc_atomic_enable,
+	.atomic_disable = arc_pgu_crtc_atomic_disable,
+};
+
+static const struct drm_crtc_funcs arc_pgu_crtc_funcs = {
+	.reset			= drm_atomic_helper_crtc_reset,
+	.destroy		= drm_crtc_cleanup,
+	.set_config		= drm_atomic_helper_set_config,
+	.page_flip		= drm_atomic_helper_page_flip,
+	.atomic_duplicate_state = drm_atomic_helper_crtc_duplicate_state,
+	.atomic_destroy_state	= drm_atomic_helper_crtc_destroy_state,
+};
+
+static const struct drm_plane_helper_funcs arc_pgu_plane_helper_funcs = {
+	.atomic_update = arc_pgu_plane_atomic_update,
+	.prepare_fb = drm_gem_plane_helper_prepare_fb,
+	.atomic_check = arc_pgu_plane_atomic_check,
+	.atomic_disable = arc_pgu_plane_atomic_disable,
+};
+
+static const struct drm_plane_funcs arc_pgu_plane_funcs = {
+	.update_plane = drm_atomic_helper_update_plane,
+	.disable_plane = drm_atomic_helper_disable_plane,
+	.destroy = drm_plane_cleanup,
+	.reset = drm_atomic_helper_plane_reset,
+	.atomic_duplicate_state = drm_atomic_helper_plane_duplicate_state,
+	.atomic_destroy_state = drm_atomic_helper_plane_destroy_state,
+};
+
+static const struct drm_encoder_funcs arc_pgu_encoder_funcs = {
+	.destroy = drm_encoder_cleanup
 };
 
 static const struct drm_mode_config_funcs arcpgu_drm_modecfg_funcs = {
@@ -301,13 +367,38 @@ static int arcpgu_load(struct arcpgu_drm_private *arcpgu)
 			return ret;
 	}
 
-	ret = drm_simple_display_pipe_init(drm, &arcpgu->pipe, &arc_pgu_pipe_funcs,
-					   arc_pgu_supported_formats,
-					   ARRAY_SIZE(arc_pgu_supported_formats),
-					   NULL, connector);
+	ret = drm_universal_plane_init(drm, &arcpgu->plane, 0,
+				       &arc_pgu_plane_funcs, arc_pgu_supported_formats,
+				       ARRAY_SIZE(arc_pgu_supported_formats), NULL,
+				       DRM_PLANE_TYPE_PRIMARY, NULL);
+
+	if (ret)
+		return ret;
+
+	drm_plane_helper_add(&arcpgu->plane, &arc_pgu_plane_helper_funcs);
+
+	ret = drm_crtc_init_with_planes(drm, &arcpgu->crtc, &arcpgu->plane, NULL,
+					&arc_pgu_crtc_funcs, NULL);
+
 	if (ret)
 		return ret;
 
+	drm_crtc_helper_add(&arcpgu->crtc, &arc_pgu_crtc_helper_funcs);
+
+	ret = drm_encoder_init(drm, &arcpgu->encoder, &arc_pgu_encoder_funcs,
+			       DRM_MODE_ENCODER_NONE, NULL);
+
+	if (ret)
+		return ret;
+
+	arcpgu->encoder.possible_crtcs = drm_crtc_mask(&arcpgu->crtc);
+
+	if (connector) {
+		ret = drm_connector_attach_encoder(connector, &arcpgu->encoder);
+		if (ret)
+			return ret;
+	}
+
 	if (encoder_node) {
 		/* Locate drm bridge from the hdmi encoder DT node */
 		struct drm_bridge *bridge __free(drm_bridge_put) =
@@ -315,7 +406,7 @@ static int arcpgu_load(struct arcpgu_drm_private *arcpgu)
 		if (!bridge)
 			return -EPROBE_DEFER;
 
-		ret = drm_simple_display_pipe_attach_bridge(&arcpgu->pipe, bridge);
+		ret = drm_bridge_attach(&arcpgu->encoder, bridge, NULL, 0);
 		if (ret)
 			return ret;
 	}
@@ -342,7 +433,7 @@ static int arcpgu_show_pxlclock(struct seq_file *m, void *arg)
 	struct drm_device *drm = node->minor->dev;
 	struct arcpgu_drm_private *arcpgu = dev_to_arcpgu(drm);
 	unsigned long clkrate = clk_get_rate(arcpgu->clk);
-	unsigned long mode_clock = arcpgu->pipe.crtc.mode.crtc_clock * 1000;
+	unsigned long mode_clock = arcpgu->crtc.mode.crtc_clock * 1000;
 
 	seq_printf(m, "hw  : %lu\n", clkrate);
 	seq_printf(m, "mode: %lu\n", mode_clock);
-- 
2.43.0

