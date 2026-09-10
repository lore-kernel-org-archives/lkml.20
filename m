Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8A9558F099
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 18:51:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789066276; cv=none; b=BloF58uycEVvtzB9CTlputAH38Ga39+E699v19u34cKVhpwK7MKzb+tkTewVevXiMZXDXNRluAhBslbz96OyphBSO+wv+u0QU4HG3WtdLguAmKvNCZW804AIxDOJQ6LTYev+3LntChFLC4w9tKdWzdYFjPFGyCaGdPRHnxQYcXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789066276; c=relaxed/simple;
	bh=VYAlhDTEhQ8Z55RInU+qw8dimHrq60IQ+94YrUUz7Zw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=S61xQE8ZjwRKGm3u/luYJ82+bxhZ2YY8GAXeraSNzgdO4gj3tZk2x3dkiYfiPyo9/xpXtpX8mP1OlUARa87imOKRJpvDPkdSp83KosozmYnswjawQsB5QcaH2aAXMv2cPgZ4nf/5sFHvmkE3mr+TaFECoM+emtQLhRDsgWZmHLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Wg2+on1e; arc=none smtp.client-ip=209.85.128.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Wg2+on1e"
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-87c938111a7so860777b3.0
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 11:51:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789066262; x=1789671062; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7ze+3Q1Zghvt73AjvM76sYvoFHG3lXKdzLgSKzynkjs=;
        b=Wg2+on1ePjz9OIr68sstr51txPFUVq7BCDp6JsmLfcqli5CyPmu5U0Lec3RLYPe07T
         qXANna/9TEJNKovnJha8KLTuiPNP4dq8fMQD+YcTgCiCNDorJUSc0Cvr7HmFYa05KWCX
         pxDK1i/MXYuQK0umfucikd7SdvjKur+Yjo4m+N5SxiPmdafb/+k6/vQvQDKeGPHROpxx
         7tIf+x34qSvbANtEbS0dbEGq+auowtvPVh/Ue4uPknAjMRUWSKmWyJN7nf0Ig+d9MjfP
         ZkFcmELwDELGbjbjOrxpzuI11BRVjVDIfPxB/73YyV5Hj5lTdTVtqdxfNoyMty19/LPz
         dhXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789066262; x=1789671062;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7ze+3Q1Zghvt73AjvM76sYvoFHG3lXKdzLgSKzynkjs=;
        b=F/GlDAfbCBY57LR5z1TSINBl8W/s/POkPB+A8S4Z0Jt6HrJMa7/PFQ2FISm0tuO2A7
         KP305H230/iCnM7b3EL6TUet2L2iek4LOQsU4+PypTV5RXXVau8IrIUVfNkODEFzZc42
         cItgp9/119MRPV/MXnk65tdf39akcd7c0qKGuuBPY8pwPhYaA18b8aQgkMdQP4r7VzEo
         XcPprz67Vp4uVr6K/FHZP2B5lTZ2Dgn59pNUZYlR9dIuPrTnpr1SDaaxaRsO58dmigqV
         gnJxLU8F3mhD4jPG4b45QfRVVMh8u8DMh2toZaxNX7pmKXvmbvERtvevnOW0jv4ytHxx
         QsWQ==
X-Forwarded-Encrypted: i=1; AKwUvByeELZNUUFo/T+DVhjUUq94gI2b3FI575KsuzDoBWCsQrnDNtU8gy/MB+gIHu3Ia7vqKsCLulYds1Y9PFc=@vger.kernel.org
X-Gm-Message-State: AFuF++kNw8qAaF9g5W/IlaB5gK+BByd/kpOOlLsZYz9NGIo8p14osve2
	+fN2xdii6aRXf2gmT4DPB3iRRCKPyqF2yMNmR9WCc3+nT/ndgBQUloYk
X-Gm-Gg: AYBFou3TIxaD6im2bZx6lvEdUBnnYRWTzQjgsdwbfOGZDoGGS+EjC4a48ifqV0HG2ho
	1luPC9/rCe9DNojx8U1JSExVvpT5aOWSREgYLMMLXkgwSPkdy/WniDe43QGqVubu/zMgwC/wbX0
	Ri44EdWOethzErxIc98bH/k5ifBkEANfYzJK+jt5WGFRAFmmlffvOfzboP1tIm85MzYA/gN8+ys
	lTeJAxVNCy0hoFMIksqqwOWJuUUlB7Jw67+bwho847ayfReqvZeNHbf9NwhiT5aMnJTRMubdRW/
	86HsrpQqQiqQtf6XZ+QAHnwB7auaGsBdmb2qiI+WB9GLYwB0UUaIWneh0huW2wuFoZrBoS+il8X
	JxynRKUq64F3OFEIhrHiIm0RvkiLOlc/tTX4Y0VULmPo9aR7YAp0nVuIAbO3WIBW5Rfc6U4iMGk
	L7Xs5n7SxnUh59P5JLJiEZxz5CNjZE8A1ZQ3pt9LxXQH/s0wpVkdHRCEeK7fqcTD1XFcd78iFeH
	f69MKTsbrM=
X-Received: by 2002:a05:690c:387:b0:873:5c7b:c13b with SMTP id 00721157ae682-88206b7b4b9mr20143737b3.35.1789066261756;
        Thu, 10 Sep 2026 11:51:01 -0700 (PDT)
Received: from DESKTOP-TLFH1MG ([76.255.203.42])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-88486086a50sm3291707b3.17.2026.09.10.11.51.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 11:51:01 -0700 (PDT)
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
Subject: [PATCH v1 1/2] drm/mipi-dbi: honour the plane source offset when flushing
Date: Thu, 10 Sep 2026 13:48:56 -0500
Message-ID: <20260910185030.870-2-frazinjonathan@gmail.com>
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

Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>
Signed-off-by: Jonathan Frazin <frazinjonathan@gmail.com>
---
 drivers/gpu/drm/drm_mipi_dbi.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/drm_mipi_dbi.c b/drivers/gpu/drm/drm_mipi_dbi.c
index 25cf04d02..38db45a9d 100644
--- a/drivers/gpu/drm/drm_mipi_dbi.c
+++ b/drivers/gpu/drm/drm_mipi_dbi.c
@@ -271,7 +271,8 @@ static void mipi_dbi_set_window_address(struct mipi_dbi_dev *dbidev,
 }
 
 static void mipi_dbi_fb_dirty(struct iosys_map *src, struct drm_framebuffer *fb,
-			      struct drm_rect *rect, struct drm_format_conv_state *fmtcnv_state)
+			      struct drm_rect *rect, unsigned int src_x, unsigned int src_y,
+			      struct drm_format_conv_state *fmtcnv_state)
 {
 	struct mipi_dbi_dev *dbidev = drm_to_mipi_dbi_dev(fb->dev);
 	unsigned int height = rect->y2 - rect->y1;
@@ -298,8 +299,13 @@ static void mipi_dbi_fb_dirty(struct iosys_map *src, struct drm_framebuffer *fb,
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
@@ -390,6 +396,8 @@ void drm_mipi_dbi_plane_helper_atomic_update(struct drm_plane *plane,
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

