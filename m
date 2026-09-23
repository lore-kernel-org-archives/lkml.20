Received: from mail-yx2-f42.google.com (mail-yx2-f42.google.com [74.125.224.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6103D53CA8F
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 20:07:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790194063; cv=none; b=Y0KGXT7g6UmU8RMAtDoW1HKbMm/y9NN7khCe/uECJBFW4t6oClxBgabmZ1Fy2RJLrOwcSGqN1YN6ZQIuiloUJmfutkMAWDO0/g3V9K3yfaeNuFzQH2cSpnFYnbfwsuOBN063Nl5DoJF+xJV2Gssrq5J0Rb84L9A5W/6k3qCvPxs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790194063; c=relaxed/simple;
	bh=Lc+KtvfXqLwZw0YV5QnPNCVJAjIU/o1vyWNdLC0yiCY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kS2fVVaqOP3jDBDqbgAmF1RlbobE75RpWrdjEItY4AEjK9D9ZqVIdDLCm/g3Kl8yinW8GJQ8u6IMoaeALkG/oT3chRibX9YTm4A4j9ECwJ9Q4EBb1JJKE4A6ALlnyn2jQn/iWnqZogVFHJnKeO45t5TA6TJ7FbHIxp0Bltq/9ts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Xr5jeWwO; arc=none smtp.client-ip=74.125.224.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Xr5jeWwO"
Received: by mail-yx2-f42.google.com with SMTP id 956f58d0204a3-672c2880f58so1227014d50.3
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 13:07:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790194053; x=1790798853; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=A9+ovGuYBvMVBjRl4lW40mH855ce4DQy0r96l5cCvso=;
        b=Xr5jeWwOr3AjY9xq9cApyAPPcZzmp4CtHhlGmt7I41RJO2oVyfDwM6EV/jTUkauW0L
         B+6g4F4MamiahOx3Ky7d4y8ml1a4IqkPlcoH3ggHZ9H7lQ5kR+VY/Y2sgr0k5YQkDpci
         WGUVkbRzaGSFCCtULj4+s8hMjAAdcKW4wU873lFvHeLOXWQauGSlwFRY4CuklOt1R4/b
         ij4oSvmpvZtqfakJBIlZ+M/CUDGK6Y+K+Q4DGJyEJnI+fgAF9hFHykx1GK+xEUyoqTVk
         h3T2YMcpSBNTb5V4zeyW7XWsPkclqQjt1fm5iDaJAnr5zkPH2buLx4dwjceSGoWKjfWH
         II6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790194053; x=1790798853;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=A9+ovGuYBvMVBjRl4lW40mH855ce4DQy0r96l5cCvso=;
        b=xiuEAzS4+NOdbnMtht2vt47u7CXoeM4w8/9hoendeEuTIfVChqs+QBf5v8fwe6UedF
         XkNn8c+siTjEldl5i2xc1Jo3UYuSnFSOJOHX2PJbd5AN5GOeSWRQshIOQt9btjnYn/FH
         AOiJ0Rz5vIViLdfHXPF5QavocWuSh9TXw1Ghab9V8o88LazndqGNZAmAKjFoEE0IxXRx
         HWmlm5qGC90rnYXcngcxyMYXZKMsvnNZwnl5ZgMCpcVgbzEhd80BJFk4fB2OCJ2gfqlN
         dx2KUd1wZ6DyVRQohvuLUOLTGL5bXQJccGKpsdjMlZeFsja3iKDENZv9rnJTwF+b8/fZ
         NeAQ==
X-Forwarded-Encrypted: i=1; AKwUvBy8ohmhjbKiqH1ECSP3MvBMeJF4Nkxz6tXW/eM4EYK828T8TW2gI/PoUSWSR2Nj9gFJJQ4/ylIWeSI1n2Y=@vger.kernel.org
X-Gm-Message-State: AFuF++k2I/XBA428GABTotGWvgve+TaAgu1Mi8N2R2ZM8A/XUzYrp82u
	8T5xFYcNrn6t5p468z6OVZi5A/cHB/bgczTdrG39ly3mM5uQWpFDJ/dM
X-Gm-Gg: AYBFou1UL7V4yYyYxhTbMWAkUYt/H74/HQzqRFEwDnGlxX5cI0O8nxzdmPEUiubujX4
	gQmnl4GS031Dii66jh6CgNG1LTnzN7o+fk68jKc1AGvco0hB9h98Mn2/Vz7qQO1aGzM7+SvXuu/
	ZPepxCYZmbCOD524cN0LyHhqpyBfeOHVphK2ROTupEAaHNJ+YOVaU/f6ZLxX39UjdUSUTVUyCRg
	q4Ikiz1uc4g0U9z3WKWWCN5C7XZ3z2lLqpGQKS2KO7C9XxcAxGq7zJDjd/P2+S/Ivun906IoGdY
	1OXORaLL7rjWQk1Q30ua6njcsBFy7sLJCy/LFgjejkR2d5vAz9ezvYz5LoWA1cHYepWONxha8X8
	1ucnqvAVTxkgXtNPXFhv45JLvQQsuDSV+hs05gv7FS9n9tnpjY8iFygEKSiCe75F5iCJ+Q2a4R5
	WScsiGoDXfEqVGtiIj7YbcrAdmYrcE4h8UGb7+U4c5V08PyuNHEAJvDkyO/V9YwnpabFiy6xcFT
	6PC0IxC1gUzqMzxlGsg
X-Received: by 2002:a05:690e:43cc:10b0:672:d32d:8ee with SMTP id 956f58d0204a3-672ed42d6aemr182037d50.50.1790194052859;
        Wed, 23 Sep 2026 13:07:32 -0700 (PDT)
Received: from DESKTOP-TLFH1MG ([76.255.203.42])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-672d80bea23sm1221915d50.10.2026.09.23.13.07.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 13:07:32 -0700 (PDT)
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
Subject: [PATCH v2 1/2] drm/mipi-dbi: honour the plane source offset when flushing
Date: Wed, 23 Sep 2026 14:57:11 -0500
Message-ID: <20260923195713.88-2-frazinjonathan@gmail.com>
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

mipi_dbi_fb_dirty() takes the damage rectangle from
drm_atomic_helper_damage_merged(), which is expressed in framebuffer
coordinates and already clipped to the plane's source rectangle.  It
then passed that rectangle straight to mipi_dbi_set_window_address(),
which is correct only while the source rectangle starts at (0,0) - i.e.
while the framebuffer is exactly panel-sized.

If a driver allows a framebuffer larger than the panel and the plane
selects a sub-region with a non-zero src_x/src_y, the controller was
still addressed in framebuffer coordinates, so the wrong part of the
panel was written and an out-of-range window could be programmed.

Pass the integer plane source origin down to mipi_dbi_fb_dirty() and
subtract it when programming the column/page address.  The copy into the
transfer buffer still uses the framebuffer-coordinate rectangle, so it
keeps reading the correct pixels from an oversized source.  With a
panel-sized framebuffer src_x/src_y are zero and behaviour is unchanged.

The rectangle from drm_atomic_helper_damage_merged() is clipped against
the src rectangle's exact 16.16 fixed-point bounds, while src_x/src_y
above are that same origin truncated to whole pixels. When the origin
has a fractional part, the truncation can leave the rectangle's far
edge up to a pixel past where a whole-pixel origin would place the
panel's own width/height - and tx_buf is sized for exactly the panel,
with no slack for that overshoot. Clamp the rectangle to the panel's
fixed mode before using it for the window address or the transfer
length.

Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>
Signed-off-by: Jonathan Frazin <frazinjonathan@gmail.com>
---
Changes since v1:
- Clamp the damage rectangle to the panel's fixed mode before using it.
  src_x/src_y are the plane source origin truncated to whole pixels, but
  the rectangle from drm_atomic_helper_damage_merged() is clipped against
  that origin's exact 16.16 fixed-point value - when the origin has a
  fractional part, the rectangle's far edge could land up to a pixel past
  where the truncated origin would place the panel's own width/height,
  overflowing the panel-sized tx_buf. Thanks to the automated review for
  catching this.

 drivers/gpu/drm/drm_mipi_dbi.c | 33 ++++++++++++++++++++++++++++-----
 1 file changed, 28 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/drm_mipi_dbi.c b/drivers/gpu/drm/drm_mipi_dbi.c
index 25cf04d02..1263dce91 100644
--- a/drivers/gpu/drm/drm_mipi_dbi.c
+++ b/drivers/gpu/drm/drm_mipi_dbi.c
@@ -271,19 +271,35 @@ static void mipi_dbi_set_window_address(struct mipi_dbi_dev *dbidev,
 }
 
 static void mipi_dbi_fb_dirty(struct iosys_map *src, struct drm_framebuffer *fb,
-			      struct drm_rect *rect, struct drm_format_conv_state *fmtcnv_state)
+			      struct drm_rect *rect, unsigned int src_x, unsigned int src_y,
+			      struct drm_format_conv_state *fmtcnv_state)
 {
 	struct mipi_dbi_dev *dbidev = drm_to_mipi_dbi_dev(fb->dev);
-	unsigned int height = rect->y2 - rect->y1;
-	unsigned int width = rect->x2 - rect->x1;
 	const struct drm_format_info *dst_format;
 	struct mipi_dbi *dbi = &dbidev->dbi;
 	bool swap = dbi->swap_bytes;
+	unsigned int height, width;
 	int ret = 0;
 	size_t len;
 	bool full;
 	void *tr;
 
+	/*
+	 * @rect is in framebuffer coordinates, clipped to the plane's src
+	 * rectangle by the damage iterator against that rectangle's exact
+	 * 16.16 fixed-point bounds. @src_x/@src_y are that same origin
+	 * truncated to whole pixels. When the origin has a fractional part,
+	 * that truncation can leave @rect's far edge up to a pixel past
+	 * where a whole-pixel @src_x/@src_y would place the panel's own
+	 * width/height -- and tx_buf is sized for exactly the panel, with no
+	 * slack for that overshoot. Clamp before using @rect for anything.
+	 */
+	rect->x2 = min_t(int, rect->x2, src_x + dbidev->mode.hdisplay);
+	rect->y2 = min_t(int, rect->y2, src_y + dbidev->mode.vdisplay);
+
+	height = rect->y2 - rect->y1;
+	width = rect->x2 - rect->x1;
+
 	full = width == fb->width && height == fb->height;
 
 	DRM_DEBUG_KMS("Flushing [FB:%d] " DRM_RECT_FMT "\n", fb->base.id, DRM_RECT_ARG(rect));
@@ -298,8 +314,13 @@ static void mipi_dbi_fb_dirty(struct iosys_map *src, struct drm_framebuffer *fb,
 		tr = src->vaddr; /* TODO: Use mapping abstraction properly */
 	}
 
-	mipi_dbi_set_window_address(dbidev, rect->x1, rect->x2 - 1, rect->y1,
-				    rect->y2 - 1);
+	/*
+	 * @rect is in framebuffer coordinates and has been clipped to the plane
+	 * src rectangle by the damage iterator. The panel is addressed relative
+	 * to the src origin, so subtract it here.
+	 */
+	mipi_dbi_set_window_address(dbidev, rect->x1 - src_x, rect->x2 - 1 - src_x,
+				    rect->y1 - src_y, rect->y2 - 1 - src_y);
 
 	if (fb->format->format == DRM_FORMAT_XRGB8888)
 		dst_format = drm_format_info(dbidev->pixel_format);
@@ -390,6 +411,8 @@ void drm_mipi_dbi_plane_helper_atomic_update(struct drm_plane *plane,
 	if (drm_dev_enter(plane->dev, &idx)) {
 		if (drm_atomic_helper_damage_merged(old_plane_state, plane_state, &rect))
 			mipi_dbi_fb_dirty(&shadow_plane_state->data[0], fb, &rect,
+					  plane_state->src_x >> 16,
+					  plane_state->src_y >> 16,
 					  &shadow_plane_state->fmtcnv_state);
 		drm_dev_exit(idx);
 	}
-- 
2.53.0

