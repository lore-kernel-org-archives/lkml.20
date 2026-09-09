Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 991E43D1AB3
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 09:25:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788945902; cv=none; b=c3FgYQVs9+u8rM3OdSaVPSNtp1V5lkfhatesmVO51pWZl5wsPnb1MWOnx2Fup4iCFELi0mvZF8j1XDgNbZrQiYI8uKPXisg9Pl53oGuGJoG/X5bwq5niMHcPILNCOpzMlBbZDJVGVXadp/SiMtH5De1Z/nyU1MfcOF50L+va0UA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788945902; c=relaxed/simple;
	bh=LiwzCv5SYYjQEMYEjTlWn+3yvhsOI3AVag5K9ViLDvg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cBQ+TfD0IxGuKdqZa5U+9JlhqpMU5eG9cI5FHrVNncpb+b5L6PyYGHKKFHJXJHi1neMkuP6LMUOrN2d+ojyWYia/LdFMq/MET2i3PPh683R/DJi21Bs7dSl/lKjE8GkRMX/tQza6PAn/GshSA1iT4gPW5n4C3NpSehw7NxX8P9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y8QnNYkS; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y8QnNYkS"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-49b392ccaacso81783305e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 02:25:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788945899; x=1789550699; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=uW8e13fLmaOUq+ENkx3+OyQ8aiaAEP5oYemn6Ymb3kI=;
        b=Y8QnNYkSM5hrTf4s/7Vq6wWvTgN88NtJsxLWw8jjvL3q4qPoIzbXLWob5Cadi6dsmI
         rtca4MRDRI0Ra439aIz/ySV4pq/RT4YWB6uHUfUpmv3Rk8IojI05/UkBn2hx3wbdw7Vj
         FKj75u5GZpEsTs5Ac+Ujh1RRaHhb+3KeReT9mHCGigbHTfcluf2UJw52I/MzzIkFz5O1
         pQqSUdWxppY8wBfLRr0KDdukORFUDfWIPZOCyiXJMf/tEWdvTMgZAjtFJDE0JpVL4mTy
         CZ1PSsQq2B77P3kt6od+nGgGIhxwBpuWYrFE8rIbNot1ZW0QBv5A9ZRQ3z/NRZyfvtSR
         aK9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788945899; x=1789550699;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uW8e13fLmaOUq+ENkx3+OyQ8aiaAEP5oYemn6Ymb3kI=;
        b=KQ5oa3z6Q5u0BC9y2idP/jt6j40Am//fjQNvt2OMLVgpxak4itr3qsUGw0MVXdn+91
         c80HtaIzkTNymu0ifc23vIZwWtzxndydCM4z5TIL4JaQJIU0mT3d/RMp7nq3I4sNEJb1
         rqsel0kYQTYEPLdDTx6cEtDQ8WUPDfkEcoat0AJv+7wDPRC35VAtE7onDXIQ5AXKHMPu
         ywEIvIJYot880Yy0N9/nAN7z2Iq/WTHYFcOUNrKTx7MF0f7SxZ+5zCCvGLuT2G26QqTt
         RBWRA9aehf+zCved+dy2hyz6xDhIzTKoTGzz8PHX5tfaoo9RPNhfn1PEB7Y1NSZudIm+
         DWjg==
X-Forwarded-Encrypted: i=1; AKwUvBwbK4N7rD5YAUk+nmCHx8k1aUsRYIwjtf0kG+e28rLdryOlVzGM3JryO3ZWC9Wbda8YmiAozRp/eI1OQY4=@vger.kernel.org
X-Gm-Message-State: AFuF++mZpPKAdOgGsbFwdi4TArw7mPP1AWPrH/IuU5T99pCETeadqQi7
	26v9qPdqZvZujAwFDURP7KYCa8x3X0zURaBkNUF+X71nY0XblCjWIltv
X-Gm-Gg: AYBFou3K1JlDXbF5lPM0DnRKATsVTz0lKBMxEXv0klVHzIx0R0Ix8ajToSQ0UbZedX7
	LSKS54eApxmEqUmvdWMuNPKVKR7xzkQgo7nHqSqidtqF1Oo/Cy6CrCk6mNPEPcLfltKm70nuQgG
	GFLPG6iTWMFjB/WkIAzchj/GD5QTTqYS76Ch/UcRUjA2M4GAwfyZHYcTRZJeSeqnjIQDMETO4AJ
	dFgv75typACi1pZHC/MMDhNagSHGHEPtrweQt9sq7XKHxqJJt+hJZLbOCCBW7NMGlz2eEQOXskz
	SnWI+fZhgldtviF4lWCL7IiDH7gdLSNN9RJ8XCEpgsW15WktX/oL0r3RetCmOplI3byjFYURQVH
	EPL08b3kfpTNbEgTSG3QHdrwrlSr+qG/+bf8Q8rHVFHN5buf74scpgpwIdMI8hQDrOwJKUw+R4p
	EPcZiSjCf8UzZiiS4sbnwUgM9Fbs8bpZA3UrrCb/x77lwL87l5l1meCqMRBVUDxXc6HLX5nyFRn
	tnwH9Wea/Biq0QwvSTOsrAsOVPfg+n1sBzrMSQhhXo3a+6387FMpDD19oLJJLzLvObK7VvghoeU
	dCn1BjOpWSk1RbXmvG/4bwkoNcneKZttgBanPw==
X-Received: by 2002:a05:600c:4e89:b0:49c:fa21:1c81 with SMTP id 5b1f17b1804b1-49cfa211d6bmr305239225e9.22.1788945898598;
        Wed, 09 Sep 2026 02:24:58 -0700 (PDT)
Received: from PC-Davide.homenet.telecomitalia.it (host-79-24-252-102.retail.telecomitalia.it. [79.24.252.102])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485958f1493sm31191342f8f.37.2026.09.09.02.24.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 02:24:58 -0700 (PDT)
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
Subject: [PATCH] drm/tiny: arcpgu: Replace simple display pipe with regular atomic helpers
Date: Wed,  9 Sep 2026 11:24:49 +0200
Message-ID: <20260909092455.131962-1-bonatto.davide@gmail.com>
X-Mailer: git-send-email 2.43.0
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
 drivers/gpu/drm/tiny/arcpgu.c | 124 ++++++++++++++++++++++++----------
 1 file changed, 90 insertions(+), 34 deletions(-)

diff --git a/drivers/gpu/drm/tiny/arcpgu.c b/drivers/gpu/drm/tiny/arcpgu.c
index c93d61ac0bb7..bd2404984535 100644
--- a/drivers/gpu/drm/tiny/arcpgu.c
+++ b/drivers/gpu/drm/tiny/arcpgu.c
@@ -23,6 +23,8 @@
 #include <drm/drm_of.h>
 #include <drm/drm_probe_helper.h>
 #include <drm/drm_simple_kms_helper.h>
+#include <drm/drm_atomic.h>
+#include <drm/drm_bridge.h>
 #include <linux/dma-mapping.h>
 #include <linux/module.h>
 #include <linux/of_reserved_mem.h>
@@ -52,13 +54,17 @@ struct arcpgu_drm_private {
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
@@ -117,8 +123,8 @@ static const u32 arc_pgu_supported_formats[] = {
 
 static void arc_pgu_set_pxl_fmt(struct arcpgu_drm_private *arcpgu)
 {
-	const struct drm_framebuffer *fb = arcpgu->pipe.plane.state->fb;
-	uint32_t pixel_format = fb->format->format;
+	const struct drm_framebuffer *fb = arcpgu->plane.state->fb;
+	u32 pixel_format = fb->format->format;
 	u32 format = DRM_FORMAT_INVALID;
 	int i;
 	u32 reg_ctrl;
@@ -139,10 +145,10 @@ static void arc_pgu_set_pxl_fmt(struct arcpgu_drm_private *arcpgu)
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
 
@@ -155,7 +161,7 @@ static enum drm_mode_status arc_pgu_mode_valid(struct drm_simple_display_pipe *p
 
 static void arc_pgu_mode_set(struct arcpgu_drm_private *arcpgu)
 {
-	struct drm_display_mode *m = &arcpgu->pipe.crtc.state->adjusted_mode;
+	struct drm_display_mode *m = &arcpgu->crtc.state->adjusted_mode;
 	u32 val;
 
 	arc_pgu_write(arcpgu, ARCPGU_REG_FMT,
@@ -194,49 +200,74 @@ static void arc_pgu_mode_set(struct arcpgu_drm_private *arcpgu)
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
@@ -301,13 +332,38 @@ static int arcpgu_load(struct arcpgu_drm_private *arcpgu)
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
@@ -315,7 +371,7 @@ static int arcpgu_load(struct arcpgu_drm_private *arcpgu)
 		if (!bridge)
 			return -EPROBE_DEFER;
 
-		ret = drm_simple_display_pipe_attach_bridge(&arcpgu->pipe, bridge);
+		ret = drm_bridge_attach(&arcpgu->encoder, bridge, NULL, 0);
 		if (ret)
 			return ret;
 	}
@@ -342,7 +398,7 @@ static int arcpgu_show_pxlclock(struct seq_file *m, void *arg)
 	struct drm_device *drm = node->minor->dev;
 	struct arcpgu_drm_private *arcpgu = dev_to_arcpgu(drm);
 	unsigned long clkrate = clk_get_rate(arcpgu->clk);
-	unsigned long mode_clock = arcpgu->pipe.crtc.mode.crtc_clock * 1000;
+	unsigned long mode_clock = arcpgu->crtc.mode.crtc_clock * 1000;
 
 	seq_printf(m, "hw  : %lu\n", clkrate);
 	seq_printf(m, "mode: %lu\n", mode_clock);
-- 
2.43.0

