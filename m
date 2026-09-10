Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A33E58FD06
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 18:51:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789066298; cv=none; b=VTmimgb1VU7J/cvcc03xCjXDwzU2f4TE9M84In0mJNiH26LHS1VA1SCQ5tz+43RtOr184+I7Nzo5qUazEZTaKTZwPuz2ZcdG6CLhtvNmSG66AhMhTWSK9NCx/UYz1v5s2bynCqam2ZgrGLjgqD0qoVqkARiir/QJIw2bE+gYEDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789066298; c=relaxed/simple;
	bh=L+2ZhQGcjhpHfRCkNGkXqSTUy81ieP0Y8o2V0ExHZBw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ipLdFjrPpFI6inzCgFT9loEqhNylPKW9eMXgFS6p9lQvRTAsvD9DcxQxm3O4Umzz/ASPGsMUnCewUsSeW/KKeczT4a5GeNP2QO7COqyRzSeaecdOXSA0nosNnLhAQtui31UeSNO29BUt0VyvqmlAADusT8L7RaB3xNdP7PwoBgw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RHG/kJ8B; arc=none smtp.client-ip=209.85.128.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RHG/kJ8B"
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-86162c086f8so754197b3.1
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 11:51:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789066265; x=1789671065; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6m8h8p8x3swINqHznguOqnp4bmSBliy9kDD6omjjK2s=;
        b=RHG/kJ8Bcrb0KjnhApceJphsDreV45eQzKpQcK3QkE/cBFjqzqfZkTmRPhifezsgX4
         ZYBK+JUUEbMY43bQhXGU3Se3/KvoGsu4qi/A4dVKr7BlcgMb4xM/tglRUjwi3BUW/5GS
         UFj95LLMPZUvmtT+tXIJsaeZQ86aqdxrV7P3NRjnio6dyNNfZndwUTP42iefkwUZ7pHD
         zChoJ4yOR1ncRQOdYpjT3UGeH/5VRN5PQJMb6jcUkpF7sqhtDIcaitsuR7XDr9ImR078
         ZobP/22+hiS+ZoIJNYsrxPTkaIXnoY7AWA5ih5vvXAh0r5RQ119zoX5fuFPtPp5HdEj0
         0F9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789066265; x=1789671065;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6m8h8p8x3swINqHznguOqnp4bmSBliy9kDD6omjjK2s=;
        b=rLWk2roxs4h149qbMkCby6BnJmMlmqb+wziVXLfVhSO2LGPvSEjLRzBcbodfd3sgAC
         gM6MjwYZQyCY3TbN9F6wX5Cuh8jvNtORpClu4X9pQwF6SDN5ocSi7U5ojt5bwfwsX7EU
         Hc0N/yuSpZ0oRnuuOe4HynefeWoJo1RnH8Myl1tCzgm4T5j4ISn+b+IuweXj9s0es/mg
         Rd9kdlDUnq39FDzKyde1EjznLj+hN8MNTiT8WPqDPgj703SdkUCweerAyxctyeUzd2ZC
         2sNMzEZVFcEZki/CbXEFNbxabesO/McLfRq+k3T9M2RPeFPYGrn5vb7qWw8+r8XxI+YQ
         Y3Ow==
X-Forwarded-Encrypted: i=1; AKwUvBwoVjKS0UOdYzeNsCqgeYJtc7rHrjsshlJraGYAY/idZsfuTGadX4wrtu7q33BB2mEaGVLjPUbhcvWPM2k=@vger.kernel.org
X-Gm-Message-State: AFuF++njX49k9Wdn80GpDCqCtqhxxYJM6i9hL7dPWIgmzbATszMJMyNh
	5C9TdXX4/ljvvxvh6o/9BdaXw3F9mVVxZSrM5UDhgTk2UN+o87miBx8f
X-Gm-Gg: AYBFou0NWQtY6MBAX0ZzN0lmDfNGZ6T0W7QbHiKDbRH8sb7FjvkLiR6Nny5g0xMGeeR
	JCBpcdvNzN8EVOrTjDSqU1E+vj6WFPRriiMN9Wa6Rmi7PEFjdQiN+4hPXApbnpqf5uKPEFahQBF
	oQLHqWRrtvRgcfvZjX7sD7lQ1cxx0HBhk4l/cJAp2MWuPl8IVLYW7BFXBpRiWN0EEErOyjPJlQI
	Wlj24yT7Gk+u79G19e+MTFy7GDgMd6vR0gsK/GJ2G7hV6JNp9KJ0Iuwj8Dsa7Fs+6Av14CrgMDr
	Tj6u+4XnrLS97VGELs9ReG5jAo3/7Zs8ooIX3aAXG0fFO1lL6QAHh3TSScVg3PwOzADySmdayeI
	LxdnfgdT8SRtSLXTdKF5eggPBuh9RZWn31ovVyFDILRwjjziJ5Wxx8YK4dfAZsz2f4w9Gcuwd1m
	51BpvaE4UBIrzc2k7Bcdo87pp6gjrJQjzN6S4Fb4wkHpbM3bC/f0TC/YYX/Sb4LAXDmgtwO3gj4
	8UnpVonRQ==
X-Received: by 2002:a05:690c:9c04:b0:861:7cb6:5790 with SMTP id 00721157ae682-88200ebff7cmr20543767b3.4.1789066265217;
        Thu, 10 Sep 2026 11:51:05 -0700 (PDT)
Received: from DESKTOP-TLFH1MG ([76.255.203.42])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-88486086a50sm3291707b3.17.2026.09.10.11.51.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 11:51:04 -0700 (PDT)
From: Jonathan Frazin <frazinjonathan@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: Thomas Zimmermann <tzimmermann@suse.de>,
	Maxime Ripard <mripard@kernel.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Kamlesh Gurudasani <kamlesh.gurudasani@gmail.com>,
	Alex Lanzano <lanzano.alex@gmail.com>,
	linux-kernel@vger.kernel.org,
	Jonathan Frazin <frazinjonathan@gmail.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: [PATCH v1 2/2] drm/tiny: allow a framebuffer larger than the panel on MIPI DBI drivers
Date: Thu, 10 Sep 2026 13:48:57 -0500
Message-ID: <20260910185030.870-3-frazinjonathan@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260910185030.870-1-frazinjonathan@gmail.com>
References: <20260910185030.870-1-frazinjonathan@gmail.com>
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

