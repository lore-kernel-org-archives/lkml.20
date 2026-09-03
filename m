Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80A95360EF5
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 06:31:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788417111; cv=none; b=uidWxEya2R4CN9rAHgRoAnz+bOMWW/gL3OoqzPitD19PZfVDznvQHKRQoSZsiNJMOgcHUL5lpQMnuhUViLAPmL/Ty+9YV6YAe05jAwVehBMc/MQHcB/S2KMQkcV8bwpp4CKQMFGOGtOZHhzaym2FXxnxWFmTGtPZSeCWBOTMJ74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788417111; c=relaxed/simple;
	bh=QC0H+qZECm6EZl/wBSVx/tJdT7fPE9pHk3Zk+/F/zV4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=F8ScbBKwl/8jVR0eBm+7WlNPvrwJApQaz0XkYFRpQY7Ijs/RGHRcMfi7A4BcjjSzcAZcsbrLG9OAvjqMUrDFk3FRa1GUub/R03Ra+ijb3o/1IaDhZtOmstB/aiAQINFndG+Y3KZpcIs36cKThr7u9clhUguipGkwWbFWcb9Bo/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=jnP1H8os; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="jnP1H8os"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2d8f265cbe6so18699505ad.0
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 23:31:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1788417109; x=1789021909; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=aiO7Hl1ZhbHbwTakJqGhQbolHtOn10e//zMl8Skl9JQ=;
        b=jnP1H8oskwTrnjCOL1ZphWlNFwiXgFjwlEFtFo0+MPeskx9GC2Oco9U9aLuVm4IAjD
         TVbMOzAb3BBrVr+DR9UfEGioPb5zOijDbwZpEYOPoa2T1pT8mCZWn2P6cNAXWLjgjF3f
         pVL2SD4uVZ6fQeYO/Egl/pVCQCRpNOWebCQ9w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788417109; x=1789021909;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aiO7Hl1ZhbHbwTakJqGhQbolHtOn10e//zMl8Skl9JQ=;
        b=l7GZzNAIvxBz3EOKkMV8AcQAJ6fWsZrzPqgyGjWXbHUUyNyQlaN3sasWveqhB6zFAA
         MS61Yf3tsKBLyem+ghI2zmikVVG3FfQKYpFbB44lxH4l+LXXs5odvKPi+FKvn/taGe6t
         hUy7i4p11fEbmTmgMY1568uXMTG8LZ/nBF/aQr4qJzaYkABx6QSXVDXkd+JP+vhmRMNV
         LLizzetoUb54WjibtwhPiGqIKE12W4d9QtKL1ZdozUwpOXN6JHOW7I1k7XzZVIwn01Jg
         CfkefMShIInAjHLEFqnoWgx5eKymyexnLsuyu5Ashki2lGqsnpPWzE+uqVMUKUkNRVLE
         rxFw==
X-Forwarded-Encrypted: i=1; AKwUvBzoH1yCN9mPzGcw4K9QJ72Shj9exTiBAb7MhtGjwyQxaBDA6mIZkHiU5cH9gqyqQyCu4bozVFAkhYuf9Fs=@vger.kernel.org
X-Gm-Message-State: AFuF++mHQ8W3DzoJgANzQgdi73hkqsIUkF69Kk/Wd5OGGi4kCT/q8p0x
	6tbYiGhdWJa3XWH47DkoS9RF2Et/l3V713OR0fDHR3u7jF/FN3PSfBqw/gz7in3FLg==
X-Gm-Gg: AYBFou1CZlkEo6k3Npr5V1I07muEn5IIc+UY4KHmjKGAiCZnird+AbG3u/6l6DC7aKg
	WWvALfSMzv+npN+6W6xKohdOMUhcHLpIsZUHK9L8uImJVySPAY3KbBmS1qqLMoYxat9W4qSnNh4
	tlEAt80yHCNI3gH6toIsazR9mIM8BtgKNW5U8LiLGiNff7Uz2yW+Pd9muJTC8BPZmLXEXmr0Rlt
	hBy2ii+gtWw1JnRliX1zPCG2UkD8mASd4F0SwLW+9GYi+fdnzO884Wxk9q91YzxoNrSkFt0snqT
	Rl5Q26vbgzaSu3mfqlnMa8UbdPuGrHTt4ilgz9em/i8PBW53pIJaYqRyzuxO65WUlWeUaIspaaY
	xyQWIcxPlr0AQ2j3sHWNt/COvND0+/WhvfLvTaEjzjyjdzNJT4G4/nwwG6jkjA8hVUjsXqhCrgI
	JQbBBWk8NEoS36pzxAF7QJiZKaFCvmnJa/iqzN2gVBOFuk1CBmub2+uIYSngXXi+7EJhvaCpW0R
	P9MlI+DtMaVVv5FNbHjV19k4On04R0aZ+0s8UXIeTOWubovMuzQ7EEV
X-Received: by 2002:a17:903:1b44:b0:2d3:78c2:1f19 with SMTP id d9443c01a7336-2daec60aefbmr146320265ad.9.1788417108828;
        Wed, 02 Sep 2026 23:31:48 -0700 (PDT)
Received: from wenst-7875.tpe.corp.google.com ([2a00:79e0:201d:8:59de:d2d:e1ec:bf86])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dafec1d449sm5006775ad.44.2026.09.02.23.31.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 23:31:47 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Jyri Sarha <jyri.sarha@iki.fi>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] drm/tidss: dispc: Switch to drm_fb_dma_get_gem_addr() for framebuffer addresses
Date: Thu,  3 Sep 2026 14:31:10 +0800
Message-ID: <20260903063142.3770509-1-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.970.g62bdec98f9-goog
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

dispc_plane_state_dma_addr() and dispc_plane_state_p_uv_addr() are
basically the same as drm_fb_dma_get_addr(), without the support for
formats with block parameters. Since the driver doesn't support any of
those formats, the result is the same.

Switch to drm_fb_dma_get_gem_addr() for getting the framebuffer addresses.
Drop the const modifier on "struct drm_plane_state *state" for
dispc_plane_setup() so that the state can be passed to
drm_fb_dma_get_gem_addr().

Using the helper also future proofs the driver in case block parameters
are added for more formats, especially the common sub-sampled YUV
formats.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/gpu/drm/tidss/tidss_dispc.c | 38 +++--------------------------
 drivers/gpu/drm/tidss/tidss_dispc.h |  2 +-
 2 files changed, 4 insertions(+), 36 deletions(-)

diff --git a/drivers/gpu/drm/tidss/tidss_dispc.c b/drivers/gpu/drm/tidss/tidss_dispc.c
index 58d5eb033bdb..2a0ec11a6c90 100644
--- a/drivers/gpu/drm/tidss/tidss_dispc.c
+++ b/drivers/gpu/drm/tidss/tidss_dispc.c
@@ -2157,47 +2157,15 @@ int dispc_plane_check(struct dispc_device *dispc, u32 hw_plane,
 	return 0;
 }
 
-static
-dma_addr_t dispc_plane_state_dma_addr(const struct drm_plane_state *state)
-{
-	struct drm_framebuffer *fb = state->fb;
-	struct drm_gem_dma_object *gem;
-	u32 x = state->src_x >> 16;
-	u32 y = state->src_y >> 16;
-
-	gem = drm_fb_dma_get_gem_obj(state->fb, 0);
-
-	return gem->dma_addr + fb->offsets[0] + x * fb->format->cpp[0] +
-		y * fb->pitches[0];
-}
-
-static
-dma_addr_t dispc_plane_state_p_uv_addr(const struct drm_plane_state *state)
-{
-	struct drm_framebuffer *fb = state->fb;
-	struct drm_gem_dma_object *gem;
-	u32 x = state->src_x >> 16;
-	u32 y = state->src_y >> 16;
-
-	if (WARN_ON(state->fb->format->num_planes != 2))
-		return 0;
-
-	gem = drm_fb_dma_get_gem_obj(fb, 1);
-
-	return gem->dma_addr + fb->offsets[1] +
-		(x * fb->format->cpp[1] / fb->format->hsub) +
-		(y * fb->pitches[1] / fb->format->vsub);
-}
-
 void dispc_plane_setup(struct dispc_device *dispc, u32 hw_plane,
-		       const struct drm_plane_state *state,
+		       struct drm_plane_state *state,
 		       u32 hw_videoport)
 {
 	bool lite = dispc->feat->vid_info[hw_plane].is_lite;
 	u32 fourcc = state->fb->format->format;
 	u16 cpp = state->fb->format->cpp[0];
 	u32 fb_width = state->fb->pitches[0] / cpp;
-	dma_addr_t dma_addr = dispc_plane_state_dma_addr(state);
+	dma_addr_t dma_addr = drm_fb_dma_get_gem_addr(state->fb, state, 0);
 	struct dispc_scaling_params scale;
 
 	dispc_vid_calc_scaling(dispc, state, &scale, lite);
@@ -2229,7 +2197,7 @@ void dispc_plane_setup(struct dispc_device *dispc, u32 hw_plane,
 	if (state->fb->format->num_planes == 2) {
 		u16 cpp_uv = state->fb->format->cpp[1];
 		u32 fb_width_uv = state->fb->pitches[1] / cpp_uv;
-		dma_addr_t p_uv_addr = dispc_plane_state_p_uv_addr(state);
+		dma_addr_t p_uv_addr = drm_fb_dma_get_gem_addr(state->fb, state, 1);
 
 		dispc_vid_write(dispc, hw_plane,
 				DISPC_VID_BA_UV_0, p_uv_addr & 0xffffffff);
diff --git a/drivers/gpu/drm/tidss/tidss_dispc.h b/drivers/gpu/drm/tidss/tidss_dispc.h
index 739d211d0018..2183254f1ab7 100644
--- a/drivers/gpu/drm/tidss/tidss_dispc.h
+++ b/drivers/gpu/drm/tidss/tidss_dispc.h
@@ -140,7 +140,7 @@ int dispc_plane_check(struct dispc_device *dispc, u32 hw_plane,
 		      const struct drm_plane_state *state,
 		      u32 hw_videoport);
 void dispc_plane_setup(struct dispc_device *dispc, u32 hw_plane,
-		       const struct drm_plane_state *state,
+		       struct drm_plane_state *state,
 		       u32 hw_videoport);
 void dispc_plane_enable(struct dispc_device *dispc, u32 hw_plane, bool enable);
 const u32 *dispc_plane_formats(struct dispc_device *dispc, unsigned int *len);
-- 
2.55.0.970.g62bdec98f9-goog

