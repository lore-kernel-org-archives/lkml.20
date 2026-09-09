Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE4115328C2
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 10:43:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788950621; cv=none; b=f5m3vrLDIyjl1dxpiOP3Fx3u+YNDrBBql1DqzF2MaGr0oOytaDVp+h2lTOAELTWv9xwNibjA+ud64sCPn/7/VNVz18DUyKiyY49/BMQ9JW7C/3vIXmY/6llYuit7YkdR5EzHJM7jLkf3vsSKNW2Ih4neK7tichxT8LSY+XgWv0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788950621; c=relaxed/simple;
	bh=b6NX9IgJq8/RMZJENRW3roDGhiq0lMYNc8TT6EVTfu4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=X5OPzEe8GRaviafuchpKk0R/aqTZTB2DzU3FRhkxGS1jk9WAbZVMQIEJDGLMRy6PAU2j9KiXdQviqOYq+f9GThMXkD4Tp70EpxmTgYwuGbRSwj+7ugw2AG+/iWP35v0AXM+tK+G85Tm/x/T8y085D/X29RTxydW4QLOJTRu49x0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BVVNDhR9; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BVVNDhR9"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-49ccfbe062eso55298295e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 03:43:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788950617; x=1789555417; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cX6hUHd/z6skmGXAVWD46kL3C+gbYudzElbs+F1trTE=;
        b=BVVNDhR9Mw0mmyhUrOcuMc872Ykkh/YdiF2/SEpYBaDSyClWJzIT8C586sjqquppWw
         7WmnEC5aBafH7fuLwA2U+pWHfG6Wl8uOOXROccFLRt//wPD0HdwZX6tvvppTqQlVZD0V
         Z5bOWyIwTS+qECU7Qyp2W5iHZgn1eA/CH65y2fS7Hasn8F9Y+zACrIH82HO0EbAso1Wf
         r8tSq4IJ44CKLfDlmu55h5WwX0Ehcb2zzJ8kRRyKCdgqNwc8g/S9wnlcn8JwJD9/PjB2
         OM0cYsPbYepAcm9cabQ3e9wp0p/ApqPrmi0dQ74f6+d1PF3vxA/OEKX/nLBHqsOntpCX
         xBjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788950617; x=1789555417;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cX6hUHd/z6skmGXAVWD46kL3C+gbYudzElbs+F1trTE=;
        b=oHYTlZKJjQlmnbJTAy7Ikc19+CGr38lbkbKwqeubkKKtFlLKFBKyLWTkO67I40fkaF
         9oLp1119gniWgN6iDSRSfz8Xme9Y9MJz3zDEthbRZpdGmY6RxIZmPhbBrQl7YnoA4Y/Q
         mvS7/FM2SLlwJisuxd2OWTSz1QzpWoydxWOUQZRbMdTjZIgyjVxZ8Owi4C2IZOfu8uUk
         OSbakVaWu6pU72aSvKGyFEMBAyJBV2QXcP6v3xvW+aJmpAYpD8Ecw6wl46Uautx0E6jP
         Z4O82oqsymmb+UoeW8H2J/u1dc/BR+0EVlDdyh5oSDSgpwFD0cKZ+/kiLwcwO4hD1hMH
         X2lg==
X-Forwarded-Encrypted: i=1; AKwUvBxfyZOp2/eTNnf7t5sPpkvMHajk/HOQBc7S8CwYdZ/h1p5ECiH+b+7mNCiXakrWlG9zvC8+JpMM+gnsCk4=@vger.kernel.org
X-Gm-Message-State: AFuF++lQPytNNilN4FQF2soaJ/jn6C/LftDgbo+6IVEbx9vgzdN4lcS4
	+lCEIAGmyQgjrRmgFx7w66DEsKEgx1eoxv53DI2ZSy1b+DRxvpcRFXdp
X-Gm-Gg: AYBFou27KyR0lqx/21iN0emjgYkOY7vCBYNyncFNeBZXjsvs06n3BkNCQkboQfCsFXJ
	s5U8RQ0SfsWbK/JO0ASHArtwE+wbhK9T+WwxXtD9GS/b/M+0b9693VHSYZMTA/DcJxLiZcKxND+
	018jv+/ybGiS3K3mSzVEJ4cwfpGPL7heiT4SIpEtVzNmf5sMDhIk8IJU/7EAGIkKiza5O9H1my0
	dX59oTOerOcFghEEV7H5lQivwGpI9chgekO40mE7XwDDzKyH924ORI4aMAluSFPjEUkjITl3Wp+
	ii9AGEYa88m7bWn0/0Eb+WyRFsU2gUxXsNg+tRA5V0nTBcTsuva0QeL8H9li+0oPP26VHR6/0xZ
	1Fqg5wiUo/Eoa/ne3z/lJvSQMgYCNNFAA6niBo1AGS4h5NiNlWHvY0uwThszyA3ORiU9Lg48X0o
	SfL2+tTQAMAEAVs7Xtd/jN63pqkrs+8S5QWaJmlbGYSklWaZeNG9H5bLN3xPIBg7oBG/19pF9DO
	iGp90YaxI8pfa0uWtVI5VFRUoHMIYF8hZHt8kWE6Ly++FcqjcI70gZPmcRyDlQTOGvGoC0hnOtG
	SjcduuCSAXuE77lz1ZC5y7E3XXJpi/WSAasXKA==
X-Received: by 2002:a05:600c:3115:b0:49c:e1b5:b2bf with SMTP id 5b1f17b1804b1-49cf7f48645mr343996735e9.0.1788950616748;
        Wed, 09 Sep 2026 03:43:36 -0700 (PDT)
Received: from PC-Davide.homenet.telecomitalia.it (host-79-24-252-102.retail.telecomitalia.it. [79.24.252.102])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485883c81c3sm43822886f8f.26.2026.09.09.03.43.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 03:43:36 -0700 (PDT)
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
Subject: [PATCH v3] drm/tiny: arcpgu: Replace simple display pipe with regular atomic helpers
Date: Wed,  9 Sep 2026 12:43:29 +0200
Message-ID: <20260909104332.160612-1-bonatto.davide@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260909092455.131962-1-bonatto.davide@gmail.com>
References: <20260909092455.131962-1-bonatto.davide@gmail.com>
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
v3:
  - Add CRTC .atomic_check hook to validate primary plane presence
    and avoid NULL pointer dereference in arc_pgu_set_pxl_fmt().
  - Pass framebuffer explicitly to arc_pgu_mode_set() and read plane
    state via drm_atomic_get_new_plane_state() in CRTC enable to prevent UAF.
  - Keep CRTC global enable bit intact during plane disable to avoid
    hardware state desync.
v2:
  - Add .prepare_fb callback to support implicit synchronization.
  - Add .atomic_check using drm_atomic_helper_check_plane_state()
    to validate hardware scaling/clipping constraints.
  - Implement arc_pgu_plane_atomic_disable() to stop DMA and clear
    buffer address register, preventing hardware DMA scanout UAF.

 drivers/gpu/drm/tiny/arcpgu.c | 191 +++++++++++++++++++++++++++-------
 1 file changed, 153 insertions(+), 38 deletions(-)

diff --git a/drivers/gpu/drm/tiny/arcpgu.c b/drivers/gpu/drm/tiny/arcpgu.c
index c93d61ac0bb7..b66b9562df10 100644
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
@@ -115,14 +123,19 @@ static const u32 arc_pgu_supported_formats[] = {
 	DRM_FORMAT_ARGB8888,
 };
 
-static void arc_pgu_set_pxl_fmt(struct arcpgu_drm_private *arcpgu)
+static void arc_pgu_set_pxl_fmt(struct arcpgu_drm_private *arcpgu,
+				const struct drm_framebuffer *fb)
 {
-	const struct drm_framebuffer *fb = arcpgu->pipe.plane.state->fb;
-	uint32_t pixel_format = fb->format->format;
+	u32 pixel_format;
 	u32 format = DRM_FORMAT_INVALID;
 	int i;
 	u32 reg_ctrl;
 
+	if (!fb)
+		return;
+
+	pixel_format = fb->format->format;
+
 	for (i = 0; i < ARRAY_SIZE(arc_pgu_supported_formats); i++) {
 		if (arc_pgu_supported_formats[i] == pixel_format)
 			format = arc_pgu_supported_formats[i];
@@ -139,10 +152,10 @@ static void arc_pgu_set_pxl_fmt(struct arcpgu_drm_private *arcpgu)
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
 
@@ -153,9 +166,10 @@ static enum drm_mode_status arc_pgu_mode_valid(struct drm_simple_display_pipe *p
 	return MODE_NOCLOCK;
 }
 
-static void arc_pgu_mode_set(struct arcpgu_drm_private *arcpgu)
+static void arc_pgu_mode_set(struct arcpgu_drm_private *arcpgu,
+			     const struct drm_framebuffer *fb)
 {
-	struct drm_display_mode *m = &arcpgu->pipe.crtc.state->adjusted_mode;
+	struct drm_display_mode *m = &arcpgu->crtc.state->adjusted_mode;
 	u32 val;
 
 	arc_pgu_write(arcpgu, ARCPGU_REG_FMT,
@@ -189,54 +203,130 @@ static void arc_pgu_mode_set(struct arcpgu_drm_private *arcpgu)
 	arc_pgu_write(arcpgu, ARCPGU_REG_STRIDE, 0);
 	arc_pgu_write(arcpgu, ARCPGU_REG_START_SET, 1);
 
-	arc_pgu_set_pxl_fmt(arcpgu);
+	arc_pgu_set_pxl_fmt(arcpgu, fb);
 
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
+	struct drm_plane_state *plane_state =
+		drm_atomic_get_new_plane_state(state, &arcpgu->plane);
+	const struct drm_framebuffer *fb = plane_state ? plane_state->fb : NULL;
 
-	arc_pgu_mode_set(arcpgu);
+	arc_pgu_mode_set(arcpgu, fb);
 
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
+static int arc_pgu_crtc_atomic_check(struct drm_crtc *crtc,
+				     struct drm_atomic_commit *state)
+{
+	struct drm_crtc_state *crct_state = drm_atomic_get_new_crtc_state(state, crtc);
+	struct arcpgu_drm_private *arcpgu = crtc_to_arcpgu_priv(crtc);
+	struct drm_plane_state *plane_state;
+
+	if (!crct_state->enable)
+		return 0;
+
+	plane_state = drm_atomic_get_new_plane_state(state, &arcpgu->plane);
+	if (!plane_state || !plane_state->fb)
+		return -EINVAL;
+
+	return 0;
+}
+
+static const struct drm_crtc_helper_funcs arc_pgu_crtc_helper_funcs = {
+	.mode_valid	= arc_pgu_crtc_mode_valid,
+	.atomic_enable	= arc_pgu_crtc_atomic_enable,
+	.atomic_disable = arc_pgu_crtc_atomic_disable,
+	.atomic_check	= arc_pgu_crtc_atomic_check,
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
+	.atomic_update	= arc_pgu_plane_atomic_update,
+	.prepare_fb	= drm_gem_plane_helper_prepare_fb,
+	.atomic_check	= arc_pgu_plane_atomic_check,
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
@@ -301,13 +391,38 @@ static int arcpgu_load(struct arcpgu_drm_private *arcpgu)
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
 	if (ret)
 		return ret;
 
+	drm_plane_helper_add(&arcpgu->plane, &arc_pgu_plane_helper_funcs);
+
+	ret = drm_crtc_init_with_planes(drm, &arcpgu->crtc, &arcpgu->plane, NULL,
+					&arc_pgu_crtc_funcs, NULL);
+
+	if (ret)
+		return ret;
+
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
@@ -315,7 +430,7 @@ static int arcpgu_load(struct arcpgu_drm_private *arcpgu)
 		if (!bridge)
 			return -EPROBE_DEFER;
 
-		ret = drm_simple_display_pipe_attach_bridge(&arcpgu->pipe, bridge);
+		ret = drm_bridge_attach(&arcpgu->encoder, bridge, NULL, 0);
 		if (ret)
 			return ret;
 	}
@@ -342,7 +457,7 @@ static int arcpgu_show_pxlclock(struct seq_file *m, void *arg)
 	struct drm_device *drm = node->minor->dev;
 	struct arcpgu_drm_private *arcpgu = dev_to_arcpgu(drm);
 	unsigned long clkrate = clk_get_rate(arcpgu->clk);
-	unsigned long mode_clock = arcpgu->pipe.crtc.mode.crtc_clock * 1000;
+	unsigned long mode_clock = arcpgu->crtc.mode.crtc_clock * 1000;
 
 	seq_printf(m, "hw  : %lu\n", clkrate);
 	seq_printf(m, "mode: %lu\n", mode_clock);
-- 
2.43.0

