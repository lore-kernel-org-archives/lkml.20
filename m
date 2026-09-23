Received: from mail-yx2-f13.google.com (mail-yx2-f13.google.com [74.125.224.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20BFC57C72B
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 20:07:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790194069; cv=none; b=W7RHG8pEwGXs2h0YQ/Hkfc4SAqsThfsURc4QPDSJCDTcQRWtHAx1QgL0zwAP4w53nDCzYtVx/rRnsacJXqdidgznxKxS2F9AkmtebYRRgqcwezuHLFZAJMrLxXQSrqvG4QjUHSa4GG65gjl6SRZMZN6o/Phi1R+8vUjHJzJ12Nk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790194069; c=relaxed/simple;
	bh=L+2ZhQGcjhpHfRCkNGkXqSTUy81ieP0Y8o2V0ExHZBw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NGOS4WGUW2c7TwHfq9q1HaGtypVy0F1EYqOb/QkGh30bHl3TsDUJqHmTnnLwyFb6H+Dn1vEhq1rrtHVrxlVdg+TH0OSblb6VUWECT4uXup5fdw9RBzw8aVuI5W0LYPPTRaK7PeJJVKYUgjM3qAAwiehPW7utWlgzgCjr6D+5c7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UioG6BhS; arc=none smtp.client-ip=74.125.224.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UioG6BhS"
Received: by mail-yx2-f13.google.com with SMTP id 956f58d0204a3-66e4ab20f4bso1614767d50.0
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 13:07:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790194055; x=1790798855; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6m8h8p8x3swINqHznguOqnp4bmSBliy9kDD6omjjK2s=;
        b=UioG6BhSi0G1LoCCz5kh15hOSwmeUkjyy/elifyTk1BMqgyq/8cIClyoCeDjTxiTUb
         gx+8oc0o2CgGbxIA3oh2aKCnVwG48EhzbG7mZ/okC7pHEmp3dRQyS0GkmIkn0VoG8W2a
         GHXGL4F9u0gJD8crgQq+Hhsj2xMVbyQ0nI0uxOUpQcgF3aMxLpCvLft2oYyyESSxnsup
         NN68GK1327d1TLf5FYUddVL1fp2MHl7ut6xztfKc0m04d2WqIYq9oOpGe9vvTwVx/sM2
         1ZIjzzwXnsb1haZF4x895l1dUqHhprR/mFj0joO2SRN/0N17uU2RoUrWUp77fywZtvxM
         0Mpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790194055; x=1790798855;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6m8h8p8x3swINqHznguOqnp4bmSBliy9kDD6omjjK2s=;
        b=YYrvxgW8PmHOZLcJ19iDpX4MIk24i/ZKTixbUNhKdOpHDHL2MTmbvR+qpJ9mvUXUHj
         mQbbadXfBauJmmqVv+A/B3itHkg3gykZoL82jJD5fTXfxK1+h/cZgLPdCtUAMmBdFc+F
         JsQe5BKjvAoyeHkIzffluNIbxKWlLNeWG854NdpPsscagntjox7AHaoW8pnP+CwKy0zg
         ePib3n2e2hqKKsk+XwDA9blUUFcz5VoLJpLlOerymuklncfuYeQjk6IfexSPoOWUP4wk
         SBP+Opy66f33DwncuM816HYy7gXZ5jTCKzaj4c85B1wGAZ7RWyuAMLOL9d+fxeb33Z5u
         q49w==
X-Forwarded-Encrypted: i=1; AKwUvBwkNqkAyCWgkrQbSlnqZOqUz6hYtwxnodsyXDbRgMkTi72+jHIJ4zxJum82oAjo3E2V9Rw1l/TneyD9MDs=@vger.kernel.org
X-Gm-Message-State: AFuF++mRgC3Qg5ccrB83JTCjbVz7gx/ZoI96julYMOYWOEuphU+/hIMF
	YgHalSe26obN08QzgZ6734SXpHm7c3VasqkVB9uzVmdC31OpNDydcOoO
X-Gm-Gg: AYBFou2+vVIJ/98r0jUK0zL1DRT4NLFJWZvXKlH9JWY6phRFCxB28BxmmzXoU1ds8Gd
	SvYA7XbfWP0SruDeqZRE+gXQf3PDo8uYXYvtSnAPHL+25FvAjOCLSzE4qtH/T6SwrDUsEwTdhp9
	KGsBMpqBpiVXyN/d764SvR8TrghzRLvTx+ZD/Mf8kbq7if7q7kKP6HT0xQe7CiR+bMa0OZvGfLM
	PII0QjsgTmIAlF3kG8kI4PFKvOLnqKULPByHVKUiCfCZ+F7941fGSTh/V1hl9+vSUTc5HVIEjDE
	zS5t1dricIEBUr7BOMarVOWKijk+YqBwG3Ias6MyLffJ8mj13QJ7Hc95i/89eSYL0tqjPeBsp9N
	dBKln9d8AWU3Pd7aWXF9bOCT2k/9C+zYfB6/ZpjhQH21Uqctyvrrvwcprq/lWd4wmGoZlTqZFAL
	d+yMIOeizyEKA7J6LMQt7qN24eeLTTb0yY0PkobBdsHFgLGGotaF1xklHEE4Q88Kw3P6EvtuCri
	prE9SAC4cJwNJfT4kQA
X-Received: by 2002:a05:690e:144f:b0:66f:c1bc:408d with SMTP id 956f58d0204a3-672ed3e7bd8mr217573d50.80.1790194055472;
        Wed, 23 Sep 2026 13:07:35 -0700 (PDT)
Received: from DESKTOP-TLFH1MG ([76.255.203.42])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-672d80bea23sm1221915d50.10.2026.09.23.13.07.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 13:07:35 -0700 (PDT)
From: Jonathan Frazin <frazinjonathan@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	kamlesh.gurudasani@gmail.com,
	lanzano.alex@gmail.com,
	phil@raspberrypi.com,
	linux-kernel@vger.kernel.org,
	Jonathan Frazin <frazinjonathan@gmail.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: [PATCH v2 2/2] drm/tiny: allow a framebuffer larger than the panel on MIPI DBI drivers
Date: Wed, 23 Sep 2026 14:57:12 -0500
Message-ID: <20260923195713.88-3-frazinjonathan@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260923195713.88-1-frazinjonathan@gmail.com>
References: <20260923195713.88-1-frazinjonathan@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Every drm/tiny MIPI DBI driver pins mode_config.max_width/max_height to
the panel size, so KMS rejects any framebuffer that is not exactly
panel-sized:

    ili9341 spi0.0: bad framebuffer width 480, should be >= 240 && <= 240

Raise the maximums to DRM_SHADOW_PLANE_MAX_WIDTH/HEIGHT (which its
kerneldoc recommends for shadow-plane drivers) on the drivers that flush
through the shared drm_mipi_dbi_plane_helper_atomic_update(), so a client
can allocate a larger framebuffer and pick the displayed region through
the plane source rectangle - a crop / pan with no scaling, now that
drm_mipi_dbi honours the source offset (previous patch):

    ili9341, hx8357d, ili9486, mi0283qt, ili9163, panel-mipi-dbi

The fixed mode, the minimums and the connector are unchanged. The plane
check (drm_mipi_dbi_plane_helper_atomic_check) still forbids scaling and
repositioning, and the transfer buffer is sized from the display mode,
so the flushed rectangle stays bounded by the panel regardless of the
framebuffer dimensions.

ili9225 is left out: it has its own atomic_update / ili9225_fb_dirty()
that addresses the panel from the damage rectangle without the source
offset, so raising its limits would let a mispositioned buffer through.

Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>
Signed-off-by: Jonathan Frazin <frazinjonathan@gmail.com>
---
 drivers/gpu/drm/tiny/hx8357d.c        | 8 ++++++--
 drivers/gpu/drm/tiny/ili9163.c        | 8 ++++++--
 drivers/gpu/drm/tiny/ili9341.c        | 8 ++++++--
 drivers/gpu/drm/tiny/ili9486.c        | 8 ++++++--
 drivers/gpu/drm/tiny/mi0283qt.c       | 8 ++++++--
 drivers/gpu/drm/tiny/panel-mipi-dbi.c | 8 ++++++--
 6 files changed, 36 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/tiny/hx8357d.c b/drivers/gpu/drm/tiny/hx8357d.c
index f942a8d09..0599b8ccf 100644
--- a/drivers/gpu/drm/tiny/hx8357d.c
+++ b/drivers/gpu/drm/tiny/hx8357d.c
@@ -320,9 +320,13 @@ static int hx8357d_probe(struct spi_device *spi)
 		return ret;
 
 	drm->mode_config.min_width = dbidev->mode.hdisplay;
-	drm->mode_config.max_width = dbidev->mode.hdisplay;
+	/*
+	 * Allow a framebuffer larger than the panel so a sub-region can be
+	 * displayed via the plane source rectangle (crop / pan, no scaling).
+	 */
+	drm->mode_config.max_width = DRM_SHADOW_PLANE_MAX_WIDTH;
 	drm->mode_config.min_height = dbidev->mode.vdisplay;
-	drm->mode_config.max_height = dbidev->mode.vdisplay;
+	drm->mode_config.max_height = DRM_SHADOW_PLANE_MAX_HEIGHT;
 	drm->mode_config.funcs = &hx8357d_mode_config_funcs;
 	drm->mode_config.preferred_depth = 16;
 	drm->mode_config.helper_private = &hx8357d_mode_config_helper_funcs;
diff --git a/drivers/gpu/drm/tiny/ili9163.c b/drivers/gpu/drm/tiny/ili9163.c
index 884242450..fe6c13056 100644
--- a/drivers/gpu/drm/tiny/ili9163.c
+++ b/drivers/gpu/drm/tiny/ili9163.c
@@ -251,9 +251,13 @@ static int ili9163_probe(struct spi_device *spi)
 		return ret;
 
 	drm->mode_config.min_width = dbidev->mode.hdisplay;
-	drm->mode_config.max_width = dbidev->mode.hdisplay;
+	/*
+	 * Allow a framebuffer larger than the panel so a sub-region can be
+	 * displayed via the plane source rectangle (crop / pan, no scaling).
+	 */
+	drm->mode_config.max_width = DRM_SHADOW_PLANE_MAX_WIDTH;
 	drm->mode_config.min_height = dbidev->mode.vdisplay;
-	drm->mode_config.max_height = dbidev->mode.vdisplay;
+	drm->mode_config.max_height = DRM_SHADOW_PLANE_MAX_HEIGHT;
 	drm->mode_config.funcs = &ili9163_mode_config_funcs;
 	drm->mode_config.preferred_depth = 16;
 	drm->mode_config.helper_private = &ili9163_mode_config_helper_funcs;
diff --git a/drivers/gpu/drm/tiny/ili9341.c b/drivers/gpu/drm/tiny/ili9341.c
index 003381aa2..1e4bb56e3 100644
--- a/drivers/gpu/drm/tiny/ili9341.c
+++ b/drivers/gpu/drm/tiny/ili9341.c
@@ -282,9 +282,13 @@ static int ili9341_probe(struct spi_device *spi)
 		return ret;
 
 	drm->mode_config.min_width = dbidev->mode.hdisplay;
-	drm->mode_config.max_width = dbidev->mode.hdisplay;
+	/*
+	 * Allow a framebuffer larger than the panel so a sub-region can be
+	 * displayed via the plane source rectangle (crop / pan, no scaling).
+	 */
+	drm->mode_config.max_width = DRM_SHADOW_PLANE_MAX_WIDTH;
 	drm->mode_config.min_height = dbidev->mode.vdisplay;
-	drm->mode_config.max_height = dbidev->mode.vdisplay;
+	drm->mode_config.max_height = DRM_SHADOW_PLANE_MAX_HEIGHT;
 	drm->mode_config.funcs = &ili9341_mode_config_funcs;
 	drm->mode_config.preferred_depth = 16;
 	drm->mode_config.helper_private = &ili9341_mode_config_helper_funcs;
diff --git a/drivers/gpu/drm/tiny/ili9486.c b/drivers/gpu/drm/tiny/ili9486.c
index fab8bd7ce..de33d702a 100644
--- a/drivers/gpu/drm/tiny/ili9486.c
+++ b/drivers/gpu/drm/tiny/ili9486.c
@@ -309,9 +309,13 @@ static int ili9486_probe(struct spi_device *spi)
 		return ret;
 
 	drm->mode_config.min_width = dbidev->mode.hdisplay;
-	drm->mode_config.max_width = dbidev->mode.hdisplay;
+	/*
+	 * Allow a framebuffer larger than the panel so a sub-region can be
+	 * displayed via the plane source rectangle (crop / pan, no scaling).
+	 */
+	drm->mode_config.max_width = DRM_SHADOW_PLANE_MAX_WIDTH;
 	drm->mode_config.min_height = dbidev->mode.vdisplay;
-	drm->mode_config.max_height = dbidev->mode.vdisplay;
+	drm->mode_config.max_height = DRM_SHADOW_PLANE_MAX_HEIGHT;
 	drm->mode_config.funcs = &ili9486_mode_config_funcs;
 	drm->mode_config.preferred_depth = 16;
 	drm->mode_config.helper_private = &ili9486_mode_config_helper_funcs;
diff --git a/drivers/gpu/drm/tiny/mi0283qt.c b/drivers/gpu/drm/tiny/mi0283qt.c
index b0121e89e..df3801914 100644
--- a/drivers/gpu/drm/tiny/mi0283qt.c
+++ b/drivers/gpu/drm/tiny/mi0283qt.c
@@ -290,9 +290,13 @@ static int mi0283qt_probe(struct spi_device *spi)
 		return ret;
 
 	drm->mode_config.min_width = dbidev->mode.hdisplay;
-	drm->mode_config.max_width = dbidev->mode.hdisplay;
+	/*
+	 * Allow a framebuffer larger than the panel so a sub-region can be
+	 * displayed via the plane source rectangle (crop / pan, no scaling).
+	 */
+	drm->mode_config.max_width = DRM_SHADOW_PLANE_MAX_WIDTH;
 	drm->mode_config.min_height = dbidev->mode.vdisplay;
-	drm->mode_config.max_height = dbidev->mode.vdisplay;
+	drm->mode_config.max_height = DRM_SHADOW_PLANE_MAX_HEIGHT;
 	drm->mode_config.funcs = &mi0283qt_mode_config_funcs;
 	drm->mode_config.preferred_depth = 16;
 	drm->mode_config.helper_private = &mi0283qt_mode_config_helper_funcs;
diff --git a/drivers/gpu/drm/tiny/panel-mipi-dbi.c b/drivers/gpu/drm/tiny/panel-mipi-dbi.c
index 60cd65cae..a0a098b0d 100644
--- a/drivers/gpu/drm/tiny/panel-mipi-dbi.c
+++ b/drivers/gpu/drm/tiny/panel-mipi-dbi.c
@@ -448,9 +448,13 @@ static int panel_mipi_dbi_spi_probe(struct spi_device *spi)
 		return ret;
 
 	drm->mode_config.min_width = dbidev->mode.hdisplay;
-	drm->mode_config.max_width = dbidev->mode.hdisplay;
+	/*
+	 * Allow a framebuffer larger than the panel so a sub-region can be
+	 * displayed via the plane source rectangle (crop / pan, no scaling).
+	 */
+	drm->mode_config.max_width = DRM_SHADOW_PLANE_MAX_WIDTH;
 	drm->mode_config.min_height = dbidev->mode.vdisplay;
-	drm->mode_config.max_height = dbidev->mode.vdisplay;
+	drm->mode_config.max_height = DRM_SHADOW_PLANE_MAX_HEIGHT;
 	drm->mode_config.funcs = &panel_mipi_dbi_mode_config_funcs;
 	drm->mode_config.preferred_depth = bpp;
 	drm->mode_config.helper_private = &panel_mipi_dbi_mode_config_helper_funcs;
-- 
2.53.0

