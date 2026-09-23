Received: from mail-yx2-f12.google.com (mail-yx2-f12.google.com [74.125.224.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 462CC57EDA4
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 20:59:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790197152; cv=none; b=PNgZLJ1dgMlJuxaDTPn/Cm8U9xJtZfOWduCcS9H43CAaBHJ8u/2plUu2w+gYHqQPuFm7O1+QbYnuvU2cAt0FeN+3Zf2ohxeHnmO6ye6GbkCj81bZrG1KhLc5vNJjcNxajXg39JeaAandJAABWmhxZa2eI67CsHfaVmhT1wmb3FA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790197152; c=relaxed/simple;
	bh=GMD+L9rkwITPj+/7F7oAO8xahOstS3wY3JMvvdRI0cI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AsNMNNicy85yGwpzMGHS4fT30JxElsu+0CDYrm1W4vidge5LJrGsUbkXEmlpN5/uv7DpIIEwbfpsViGxrAkfHmsdffbi/uKBruOCWppgIaTwsGWuAQaWiIK7AQfESqghEc/Clz/0jTBkKBm9t9HXzjIH9XsQeBedSru/YSd6lh4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e+lMWHPX; arc=none smtp.client-ip=74.125.224.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e+lMWHPX"
Received: by mail-yx2-f12.google.com with SMTP id 00721157ae682-8716a5baf64so18990417b3.3
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 13:59:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790197145; x=1790801945; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SjUwon+Xf+9yJ/mOuCEt+pLNo2N/EnsMcHazZxAI2W0=;
        b=e+lMWHPXg3z6H4H0akclOXRVvgfDbMt6vixaPTQMGsUNVi3ANgkMm2r3nwN48mMWmv
         Y+E6e7vXtl1vC04pxfsJnQYURmbIx3HidOkmtAiHyaEqSwZjbi5gNwEJ+BgnBU1G9tPU
         y9cC4sP/+izSZHP7CF9b4yjiItUskGzYcjdoqhYEsGjONQYbjvgHbhksr4u7nKKYf2Qi
         iSfiGtthAnPgIarzZO/HyToYmeuaOqWj/SZGGfrlr/Kl7tMoaho0t38RICIhmbsX0KJF
         aGq4o+APUdwaZz1Vl/MXct89EQSk9Yye7PDPWtbbRzja/befIKRX4Oc1Mq61Oq13HGsG
         UZVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790197145; x=1790801945;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SjUwon+Xf+9yJ/mOuCEt+pLNo2N/EnsMcHazZxAI2W0=;
        b=zYH5ldwhil5A+ibcAc9fbXKNklR8SGIzMsb1yMyGwLihfrQtI2nzOyvaeKd2/EvfxA
         wdAbWxqbgS041osqRQzn6HU4Uik7lQrL3iR2A/NsOaeeY3dGgVGhiKlxZKeBWJhJSbay
         P6KeNVMPjxFqqnN391S2M5P2sP2CAQdfUZrh/JCbtsixhb0WI9l9zIjsQuB8Kv91s7s2
         WDQwKAbkp6hffy/DRd4uV4v708pGmiaLZZU4ihQ9RuOtsPYfB0FzoFO8OOnQWfmPhK86
         eAEoiGFm4nMV4CT9jhgGpkefglB3Blra2o1I+EPz05P3+7xV3IO72CG1KvP+LYWjJwT9
         V2/A==
X-Forwarded-Encrypted: i=1; AKwUvBxLXzql5XxM9Wit/vv4LwQKfUbr2BxARGjzgnYEZOjVKZ3/MtxYx5WxgemFNo4xjbmzPKBzL8GSzf1PgNU=@vger.kernel.org
X-Gm-Message-State: AFuF++k2aIyCLCxXkuNTy9crLt30x4W2/lPqBj0pPR3EHeLcewulmDI9
	vm/GKxfbNsHl4ClJJLRgJp+VuiXqh792UoDYIzn0d829n1rhPU86SjhJ
X-Gm-Gg: AYBFou1xPDm+MGqCvsc5aWn6J5nJxOHlU/6BP8Jw++DhA3PHA4rPWKTAKj1mDemsw6q
	IDRL5HEN8HFEG34P65hgbQcjZaAoA5qrHs/rcUC7hk2JphBN+9d4yp/4XFLu8PolB3vCwNLRSbf
	LYtXF5mBV44DW/cXmgCIz3kcFbarFyFHk8gA1ZeKcN0ywETLV1WKFIKiexloF48aRAp2IheJLZU
	kBUMLm3q7ij8kCNQb3DY0GSmJBWoKGgtj3EDgxc4P8uJGt9h+xyBLF68qL/eHz4b/+aSpooe7O6
	9IIEMpU+oTPXVw2GFPm4g5TJ59uJidiT+UQ9p6RnaBZpG5C3Fii2msWdGVAXbsn3Ooi4Eq2YjxT
	BoTHKk4zQ7p9FWBpos/ynmYr8/wGxU662i7y5mcO5lUNiktjC+KytxSCFQ8+uqqzim0TiZOoUdM
	RaFYfSI7Ym0bFa0nTab2389MllOPZiMUJt+qqZDgFYqhHgedZ1TrIlGpv/59T0czOIAqYBox6wR
	d7/+baU5rcbhGBK9UB9
X-Received: by 2002:a05:690c:6d82:b0:845:1064:5c03 with SMTP id 00721157ae682-8a64bc39bb2mr2852547b3.23.1790197144917;
        Wed, 23 Sep 2026 13:59:04 -0700 (PDT)
Received: from DESKTOP-TLFH1MG ([76.255.203.42])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8a65270b1e2sm1073467b3.41.2026.09.23.13.59.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 13:59:04 -0700 (PDT)
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
Subject: [PATCH v3 2/2] drm/tiny: allow a framebuffer larger than the panel on MIPI DBI drivers
Date: Wed, 23 Sep 2026 15:58:34 -0500
Message-ID: <20260923205835.3505-3-frazinjonathan@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260923205835.3505-1-frazinjonathan@gmail.com>
References: <20260923205835.3505-1-frazinjonathan@gmail.com>
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

    ili9341, hx8357d, ili9486, mi0283qt, ili9163, panel-mipi-dbi,
    st7735r

The fixed mode, the minimums and the connector are unchanged. The plane
check (drm_mipi_dbi_plane_helper_atomic_check) still forbids scaling and
repositioning, and the transfer buffer is sized from the display mode,
so the flushed rectangle stays bounded by the panel regardless of the
framebuffer dimensions.

ili9225 is left out: it has its own atomic_update / ili9225_fb_dirty()
that addresses the panel from the damage rectangle without the source
offset, so raising its limits would let a mispositioned buffer through.

st7735r lives under drivers/gpu/drm/sitronix/ rather than
drivers/gpu/drm/tiny/ and was missed in the original pass over this
list; confirmed by grepping the whole tree for
DRM_MIPI_DBI_PLANE_HELPER_FUNCS, which finds exactly these seven
drivers and no others.

Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>
Signed-off-by: Jonathan Frazin <frazinjonathan@gmail.com>
---
Changes since v2:
- Add st7735r, missed from the original list because it lives under
  drivers/gpu/drm/sitronix/ rather than drivers/gpu/drm/tiny/. Confirmed
  by grepping the whole tree for DRM_MIPI_DBI_PLANE_HELPER_FUNCS that no
  other driver shares this flush path. Thanks to the automated review
  for catching this.

Changes since v1: unchanged.

 drivers/gpu/drm/sitronix/st7735r.c    | 8 ++++++--
 drivers/gpu/drm/tiny/hx8357d.c        | 8 ++++++--
 drivers/gpu/drm/tiny/ili9163.c        | 8 ++++++--
 drivers/gpu/drm/tiny/ili9341.c        | 8 ++++++--
 drivers/gpu/drm/tiny/ili9486.c        | 8 ++++++--
 drivers/gpu/drm/tiny/mi0283qt.c       | 8 ++++++--
 drivers/gpu/drm/tiny/panel-mipi-dbi.c | 8 ++++++--
 7 files changed, 42 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/sitronix/st7735r.c b/drivers/gpu/drm/sitronix/st7735r.c
index bd763871d..e78bd2da3 100644
--- a/drivers/gpu/drm/sitronix/st7735r.c
+++ b/drivers/gpu/drm/sitronix/st7735r.c
@@ -295,9 +295,13 @@ static int st7735r_probe(struct spi_device *spi)
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
 	drm->mode_config.funcs = &st7735r_mode_config_funcs;
 	drm->mode_config.preferred_depth = 16;
 	drm->mode_config.helper_private = &st7735r_mode_config_helper_funcs;
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

