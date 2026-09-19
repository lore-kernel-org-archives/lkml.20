Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEFE439A04A
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 22:35:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789857316; cv=none; b=ZwN9YChEUTVXZI9ICvkUiZhTdqgYzgZZNV3wOw9Tn0nc45iFaF/49oQ81taZUsBEaCkfKJC7VnL8skEYWp5uTpwPIt0/UZokkZYJI3r2Iurnhn0cUfQH/Wt4vsQvrwQT1zhA/kePbvQzyd4FhaRlfoqPah86+clrxToyXdBua/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789857316; c=relaxed/simple;
	bh=hSDfzvA6ORylld4pRzQ7MxxOcTQw2g5PLMKMpe1mpqs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=sbexoIlxZN0rlXPlmbzFkXAJkbaem8iusN6Um8YYqWxcLsa9On5mX7jOK0SmMjFtGqUM/hqGbH96N5d/2/88M5b+HvTGmipQ0gWFaaRgZxXlNLjDpUALDHN4ZctekyaCWEmRxyOj8fjkJaOS9wr4MGvw/vZ1X1ViSlPrERI9FBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ePOMo3l+; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ePOMo3l+"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-396ccd66bb4so1655831a91.1
        for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 15:35:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789857314; x=1790462114; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=kyS13joyy5JXOuXWzEcFnGwNzI5fcdKO60kKLkXIRKw=;
        b=ePOMo3l+FOAfjPRdQw17cZOlkd33hsD/IsrhnAP+id/c15WrvfLdaiyvXM+oraC8GQ
         E0EAQcyUPL7sRT7fvfkkFfpkqgEe8jfwwDPn1BAxYiDFZw8vNR01M0X1TR+d+GPTTs3J
         ZC+tMlGN70o0/pvra95IpzmGhkO7VlAsiX/m7UPWRATKRBdSYvVUBk6gK36X99vyrCh9
         OB81jPQa78sOhREQAtDiLS5uznwW3Pr1Jrwqf4kGLVDdGYnDTdXO1/CBvNT5GHfR1iTd
         C2VdLwdph9UXUMTEtARC7Vb7nW/neEZdSYlKxNCPFsxZMLDPv6nEKm+33JRikqMNcWgR
         IH5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789857314; x=1790462114;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kyS13joyy5JXOuXWzEcFnGwNzI5fcdKO60kKLkXIRKw=;
        b=rWNbbX+M5DzpCBbeC2WKkKEzhy08ufhPln6GteZwbZXiNmVXiKp/qr7A3KR4yqWW1g
         QVcfwVVmbfxRxTJost9OGULQJhoyphJDahqi3Gj1if1egjImfIZzN2YMsc7qZwdvJGnD
         Ih48EffhBWQ/Xtv9rt2jUE2h02x1RkmYNQsNajOetgVEsS3twfwLXBDKG1nLzFiWjaNV
         aiue27uMWAI8WeYJWvgphhke467HTrw1uFnuA6keKsD8+I9cbDe+eIZvHsCRQAxo8tL7
         64rcHEFXLb0B5pmtH8570FTnSIDivpOExqkmiWr+3SYLqxiOk825WbrOqpw1nJCiCTFO
         Wsaw==
X-Forwarded-Encrypted: i=1; AKwUvBy4I8yxGctiNoNYK7kHWEGEYVe8MbM9OM5rYs/Em34Ahqx5FWqVxReeRxqB8DVjvQGr64kcZGg76bj3Tg8=@vger.kernel.org
X-Gm-Message-State: AFuF++kNDMqD4tT8dxzBmXZz3yVQ3TFWxrhyOaBCehncpTe3d/XCxvhj
	6hbhOe0gBlPYsS6SgUOe1dmzBZPnkP0BBZ8ziUY4yQVP1w4wT3ZFV0gT
X-Gm-Gg: AYBFou0ymeJ92HiipNK+HEF8zAcDAiipDB6muQ97cmKbJfzu/2qZyPOLTA3wOlUVXLz
	RDOx0u1nTNnwyxol1XBr7SQP16dL47kI2XT4FNcBUgF6/6wZWoYOT8RhyCWulV7XJavQFvnuhQj
	RFUqY9y/J6Ed5mLMRPWsCQC0tH66mCiKdnnv+bKP3blyICLMdXzdwSb6pSLi17kBMsSCcDljhGb
	tKWBvP1fcqW8OmxWAMLmNjahwLM61+GKUAEGPzTUoET1KSlZYE8xTKa2Fggpfb7Y6UIpGF3acSx
	LSnSJwBEeMTJdrgYcReG2VzvIU9RJfHcVSAQTAQ9sLm7UT7ne9G6G+Ik6DsRH+BTHuOMHyEv8wB
	BjFrvAIJYlDlSII73UO67qObAGy/MNWzLy/fcUtklxMsAt4C9XH9LEXv/Q0LRDieY/NMRHOym2p
	iw3OteMyb2+b893yl8l2AEmhyaKN8cNgKnEVmyW1B/eDh+RAUH4+mcdeLwk8s2iLCPRDtDXFvgV
	b/9W/CH4hYeg0YYNjg3AaqBB5JLBbuKm50fFj8Az8AMTflclGpvo4UzuiTVx61pCR6FSHOB3VyW
	6plWrfMXug==
X-Received: by 2002:a17:90a:ec88:b0:39e:6c69:34dd with SMTP id 98e67ed59e1d1-39e6c6936f4mr4837765a91.65.1789857314235;
        Sat, 19 Sep 2026 15:35:14 -0700 (PDT)
Received: from phui-2.c.googlers.com.com (78.123.83.34.bc.googleusercontent.com. [34.83.123.78])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e6c4bc0d2sm6194633a91.12.2026.09.19.15.35.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 15:35:13 -0700 (PDT)
From: Hui Peng <benquike@gmail.com>
To: hansg@kernel.org,
	tzimmermann@suse.de,
	simona@ffwll.ch,
	airlied@redhat.com
Cc: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] drm/tiny: fix VRAM/EDID/transfer bounds in bochs, gm12u320, pixpaper, and sharp-memory
Date: Sat, 19 Sep 2026 22:35:13 +0000
Message-ID: <20260919223513.3889412-1-benquike@gmail.com>
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix framebuffer size, EDID extension count, and transfer buffer bounds
checks across drivers/gpu/drm/tiny/ (bochs.c, gm12u320.c, pixpaper.c,
and sharp-memory.c).

Fixes: 77b8cabf3d52 ("drm/gm12u320: Move driver to drm/tiny")
Assisted-by: LLM
Signed-off-by: Hui Peng <benquike@gmail.com>
---
diff --git a/drivers/gpu/drm/tiny/bochs.c b/drivers/gpu/drm/tiny/bochs.c
index e2d957e51505..19d0af677321 100644
--- a/drivers/gpu/drm/tiny/bochs.c
+++ b/drivers/gpu/drm/tiny/bochs.c
@@ -422,6 +422,8 @@ static int bochs_primary_plane_helper_atomic_check(struct drm_plane *plane,
 						   struct drm_atomic_commit *state)
 {
 	struct drm_plane_state *new_plane_state = drm_atomic_get_new_plane_state(state, plane);
+	struct drm_framebuffer *fb = new_plane_state->fb;
+	struct bochs_device *bochs = to_bochs_device(plane->dev);
 	struct drm_crtc *new_crtc = new_plane_state->crtc;
 	struct drm_crtc_state *new_crtc_state = NULL;
 	int ret;
@@ -438,6 +440,9 @@ static int bochs_primary_plane_helper_atomic_check(struct drm_plane *plane,
 	else if (!new_plane_state->visible)
 		return 0;
 
+	if (fb && (u64)fb->pitches[0] * fb->height > bochs->fb_size)
+		return -EINVAL;
+
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/tiny/gm12u320.c b/drivers/gpu/drm/tiny/gm12u320.c
index 4ad074337af0..9dfbfc6bb1b6 100644
--- a/drivers/gpu/drm/tiny/gm12u320.c
+++ b/drivers/gpu/drm/tiny/gm12u320.c
@@ -268,12 +268,18 @@ static void gm12u320_copy_fb_to_blocks(struct gm12u320_device *gm12u320)
 	x2 = gm12u320->fb_update.rect.x2;
 	y1 = gm12u320->fb_update.rect.y1;
 	y2 = gm12u320->fb_update.rect.y2;
-	vaddr = gm12u320->fb_update.src_map.vaddr; /* TODO: Use mapping abstraction properly */
+
+	ret = drm_gem_fb_vmap(fb, &gm12u320->fb_update.src_map, NULL);
+	if (ret) {
+		GM12U320_ERR("drm_gem_fb_vmap err: %d\n", ret);
+		goto put_fb;
+	}
+	vaddr = gm12u320->fb_update.src_map.vaddr;
 
 	ret = drm_gem_fb_begin_cpu_access(fb, DMA_FROM_DEVICE);
 	if (ret) {
 		GM12U320_ERR("drm_gem_fb_begin_cpu_access err: %d\n", ret);
-		goto put_fb;
+		goto vunmap_fb;
 	}
 
 	src = vaddr + y1 * fb->pitches[0] + x1 * 4;
@@ -311,6 +317,8 @@ static void gm12u320_copy_fb_to_blocks(struct gm12u320_device *gm12u320)
 	}
 
 	drm_gem_fb_end_cpu_access(fb, DMA_FROM_DEVICE);
+vunmap_fb:
+	drm_gem_fb_vunmap(fb, &gm12u320->fb_update.src_map);
 put_fb:
 	drm_framebuffer_put(fb);
 	gm12u320->fb_update.fb = NULL;
@@ -418,6 +426,7 @@ static void gm12u320_fb_mark_dirty(struct drm_framebuffer *fb,
 	} else {
 		struct drm_rect *rect = &gm12u320->fb_update.rect;
 
+		gm12u320->fb_update.src_map = *map;
 		rect->x1 = min(rect->x1, dirty->x1);
 		rect->y1 = min(rect->y1, dirty->y1);
 		rect->x2 = max(rect->x2, dirty->x2);
@@ -583,8 +592,17 @@ static void gm12u320_pipe_update(struct drm_simple_display_pipe *pipe,
 	struct drm_shadow_plane_state *shadow_plane_state = to_drm_shadow_plane_state(state);
 	struct drm_rect rect;
 
-	if (drm_atomic_helper_damage_merged(old_state, state, &rect))
+	if (!state->fb) {
+		gm12u320_stop_fb_update(to_gm12u320(pipe->crtc.dev));
+		return;
+	}
+
+	if (drm_atomic_helper_damage_merged(old_state, state, &rect)) {
 		gm12u320_fb_mark_dirty(state->fb, &shadow_plane_state->data[0], &rect);
+	} else if (old_state->fb != state->fb) {
+		drm_rect_init(&rect, 0, 0, state->fb->width, state->fb->height);
+		gm12u320_fb_mark_dirty(state->fb, &shadow_plane_state->data[0], &rect);
+	}
 }
 
 static const struct drm_simple_display_pipe_funcs gm12u320_pipe_funcs = {
diff --git a/drivers/gpu/drm/tiny/pixpaper.c b/drivers/gpu/drm/tiny/pixpaper.c
index d02ac26d007c..475e92c3410e 100644
--- a/drivers/gpu/drm/tiny/pixpaper.c
+++ b/drivers/gpu/drm/tiny/pixpaper.c
@@ -865,7 +865,7 @@ static void pixpaper_plane_atomic_update(struct drm_plane *plane,
 	struct drm_shadow_plane_state *shadow_plane_state =
 		to_drm_shadow_plane_state(plane_state);
 	struct drm_crtc *crtc = plane_state->crtc;
-	struct pixpaper_panel *panel = to_pixpaper_panel(crtc->dev);
+	struct pixpaper_panel *panel = to_pixpaper_panel(plane->dev);
 
 	struct drm_device *drm = &panel->drm;
 	struct drm_framebuffer *fb = plane_state->fb;
@@ -875,6 +875,9 @@ static void pixpaper_plane_atomic_update(struct drm_plane *plane,
 	__le32 *src_pixels = NULL;
 	struct pixpaper_error_ctx err = { .errno_code = 0 };
 
+	if (!crtc || !fb)
+		return;
+
 	if (!drm_dev_enter(drm, &idx))
 		return;
 
diff --git a/drivers/gpu/drm/tiny/sharp-memory.c b/drivers/gpu/drm/tiny/sharp-memory.c
index 7efd7b567f3b..b365e7549666 100644
--- a/drivers/gpu/drm/tiny/sharp-memory.c
+++ b/drivers/gpu/drm/tiny/sharp-memory.c
@@ -595,6 +595,9 @@ static int sharp_memory_probe(struct spi_device *spi)
 		smd->vcom_mode = SHARP_MEMORY_SOFTWARE_VCOM;
 		smd->sw_vcom_signal = kthread_run(sharp_memory_sw_vcom_signal_thread,
 						  smd, "sw_vcom_signal");
+		if (IS_ERR(smd->sw_vcom_signal))
+			return dev_err_probe(dev, PTR_ERR(smd->sw_vcom_signal),
+					     "Failed to start sw_vcom_signal thread\n");
 
 	} else if (!strcmp("external", vcom_mode_str)) {
 		smd->vcom_mode = SHARP_MEMORY_EXTERNAL_VCOM;
@@ -616,15 +619,21 @@ static int sharp_memory_probe(struct spi_device *spi)
 	ret = sharp_memory_pipe_init(drm, smd, sharp_memory_formats,
 				     ARRAY_SIZE(sharp_memory_formats),
 				     NULL);
-	if (ret)
+	if (ret) {
+		if (smd->sw_vcom_signal)
+			kthread_stop(smd->sw_vcom_signal);
 		return dev_err_probe(dev, ret, "Failed to initialize display pipeline.\n");
+	}
 
 	drm_plane_enable_fb_damage_clips(&smd->plane);
 	drm_mode_config_reset(drm);
 
 	ret = drm_dev_register(drm, 0);
-	if (ret)
+	if (ret) {
+		if (smd->sw_vcom_signal)
+			kthread_stop(smd->sw_vcom_signal);
 		return dev_err_probe(dev, ret, "Failed to register drm device.\n");
+	}
 
 	drm_client_setup(drm, NULL);
 
