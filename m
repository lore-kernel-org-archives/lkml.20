Received: from mail-yx2-f13.google.com (mail-yx2-f13.google.com [74.125.224.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E6D047F3D8
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 20:59:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790197147; cv=none; b=l3ZeMXZitTyO79n3/+GdQzEOwqP7RtIJmbv+nixTbmoBgB9yHw1ofX6rRZ7+y+DAM2sU3gjZwvXyq5fdr+QQ3lZE+YtTSOFbQud/FrvrnXQCz5aMWbyuIuYZ+rQuvDgr4Ne4/WCF95RWb5MBVpGO32xhtbWxn0YceFBTGL3nGXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790197147; c=relaxed/simple;
	bh=8JREQkLVGNW/V6YBNEl1nDP06ooU4XDJt9RQvxEZqSk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HrKneI43AfhfOwWGHELgPkn3xnt8sxIQvqgO+FYAlYKLUaihDeCjR7bp2/tVSbcihWO09SRPjmBjBWo5111d42dEu20Fn2E8OMiUCo1QNdcUgPjEUz7a5RGK89ivcJCDkV2VAm3X9XxFV9xwjC9JdbnTYyNkmqQ1/rBm4RotXdU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WpsuOl3Z; arc=none smtp.client-ip=74.125.224.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WpsuOl3Z"
Received: by mail-yx2-f13.google.com with SMTP id 00721157ae682-85d46e4cdcdso17293357b3.2
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 13:59:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790197143; x=1790801943; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OI+RXS7AWef0aTId53Kef6aofXdoW+lQEP5J9ptA3JM=;
        b=WpsuOl3ZPBEudrXlgXRD+dDN8CmSjRTajGPhccyNQ358WJj5Yx7zvZkc241hfH7ms7
         w9JUadW8rfNtb/ONo+HTJbhQwPsf7f/12ptqsNYK0ZnW7i21V0ZpTyYiV6mMUjRVblEp
         FWP/og3ikk4HdVCVtfBQFFHC+iK3gNQvAH+NMRlX3whFaCFgfYuB/OOW6h0+qkrzvek7
         fjhS95GSt0eXS0V/uZK+dJiVg+nJMTYP48an2XYTuid9cu0+NWMZfHIjf9fMvWcLu9QJ
         BN8tY/VD9WuZ1NszytJAzr9Zc/LGWVvqsfkpPtjoRCVcaoUxS+hw9xUQE0y6RMOejQrP
         684g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790197143; x=1790801943;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OI+RXS7AWef0aTId53Kef6aofXdoW+lQEP5J9ptA3JM=;
        b=WCdtAxVb0bvRDK4uqA3yJ4rmyXDxmAEL32bQTHK7GCigidYjq+mN4BDtrn1tq26/sm
         lgjQgAgwQil0R3fTYQRfIrpopWleqKoQYCy3KwLxRgdV5aKGkuJeN0b9EoIL6wutvqsm
         z87fYwGMjITk3fykc1WT7Mh6NlC4lXpxKUuWeQbQtOtqblNerEW017ML7TsrgzS80wbl
         R06p5oZGfar/W/Wrt0PrQp6C3uGJi2UY4my7pO2o54s0mtH61FiFUbgwsBGLKsNUQ7h0
         /neH5z9bWCYeBR69sVt8gkSn2Y/kqs9R/JVGymBVkTGrhvsPFNLrTxTb/hgOrebg0WEp
         GQeA==
X-Forwarded-Encrypted: i=1; AKwUvBwCVmCWVZ82X7FDo9Fjob+sr9mDIo0Ka4mOa1gjwFBPW4d0sVGJDHINRTXYP7iDGSo9Wu7qu3ta/weg+tI=@vger.kernel.org
X-Gm-Message-State: AFuF++mqsV722tjSXetsda5kLJSA66Dor7Urgv94tgiisuRJB8P5P/On
	WkVYiMWr22LhcK1CUGYP0zxNbrb6Zoqd3DvLJpK6asqENwoTyBAO9rXr
X-Gm-Gg: AYBFou0BpZaYx+yCMy9A7d4V6RFUJG9Q9yQexzY8gww8r+boCchT/68W2Mb1KJEkZv8
	kumltPFPCrdZZGnMZnQrTY3ZAUC7Qz9nf4PfVpQU6PqQPFd60Ski7a3oPgIxST6EqEcvtoReSdB
	CQqbiw5/eB29UzNWpxGQt+qPY9aMofoz/AD6KF5HBOFObyGTVjM4jTJEmFwLfy4MrN5531euoVO
	saE68Y2o7uAATgq1HL6Qrz4IcSNqywiTpLqN6peG8nKQ5XE6MyiivXCUT19YY/dB1iMwRjlBuaL
	9Ks7EKu71vMsJ+Ulylst79hDzAHRQK83h1XvJfNmpkLGrAjTm+BgxvVHDUQMvxdvH2lmvslFFQu
	HTQiENrqqE/AglouqsnlmGT67CE760keyHR7KiLru3ti5ra29NJbykDZmJy7Q0lqRszFcebUSE8
	Dxh+tJDGf6KITx1U0FDK8B6PdaXTTmhtcFbia82pkD5QifwNB7INxFDuhJVt9wofO+exliIEm5Q
	XyeHCMNaQ==
X-Received: by 2002:a05:690c:39b:b0:882:b4b2:c49 with SMTP id 00721157ae682-8a646e8848bmr3505747b3.18.1790197142862;
        Wed, 23 Sep 2026 13:59:02 -0700 (PDT)
Received: from DESKTOP-TLFH1MG ([76.255.203.42])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8a65270b1e2sm1073467b3.41.2026.09.23.13.59.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 13:59:02 -0700 (PDT)
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
Subject: [PATCH v3 1/2] drm/mipi-dbi: honour the plane source offset when flushing
Date: Wed, 23 Sep 2026 15:58:33 -0500
Message-ID: <20260923205835.3505-2-frazinjonathan@gmail.com>
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

A damage clip can also lie entirely within that one-pixel sliver past
the panel edge - the damage iterator clips only against the exact
fixed-point bound, not the whole-pixel one used here - collapsing the
clamped rectangle to zero width or height. Skip the flush in that case
rather than program an inverted (start past end) address window, which
is undefined behaviour per the MIPI DCS spec.

Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>
Signed-off-by: Jonathan Frazin <frazinjonathan@gmail.com>
---
Changes since v2:
- A damage clip lying entirely within the one-pixel sliver the v2 clamp
  cuts off collapses the clamped rectangle to zero width or height,
  which was still reaching mipi_dbi_set_window_address() as an inverted
  (start past end) address window ahead of a zero-length write - skip
  the flush when the clamped rectangle is empty. Thanks again to the
  automated review for catching this on v2.

Changes since v1:
- Clamp the damage rectangle to the panel's fixed mode before using it,
  as described above. Thanks to the automated review for catching this.

 drivers/gpu/drm/drm_mipi_dbi.c | 43 ++++++++++++++++++++++++++++++----
 1 file changed, 38 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/drm_mipi_dbi.c b/drivers/gpu/drm/drm_mipi_dbi.c
index 25cf04d02..bb557fab1 100644
--- a/drivers/gpu/drm/drm_mipi_dbi.c
+++ b/drivers/gpu/drm/drm_mipi_dbi.c
@@ -271,19 +271,45 @@ static void mipi_dbi_set_window_address(struct mipi_dbi_dev *dbidev,
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
+	 *
+	 * A damage clip can lie entirely in that one-pixel sliver past the
+	 * panel edge -- the iterator above clips only against the exact
+	 * fixed-point bound, not the whole-pixel one used here -- in which
+	 * case the clamp collapses @rect to zero width or height. Nothing in
+	 * it was ever visible on the panel, so skip the flush rather than
+	 * program an inverted (start past end) address window.
+	 */
+	rect->x2 = min_t(int, rect->x2, src_x + dbidev->mode.hdisplay);
+	rect->y2 = min_t(int, rect->y2, src_y + dbidev->mode.vdisplay);
+
+	if (rect->x2 <= rect->x1 || rect->y2 <= rect->y1)
+		return;
+
+	height = rect->y2 - rect->y1;
+	width = rect->x2 - rect->x1;
+
 	full = width == fb->width && height == fb->height;
 
 	DRM_DEBUG_KMS("Flushing [FB:%d] " DRM_RECT_FMT "\n", fb->base.id, DRM_RECT_ARG(rect));
@@ -298,8 +324,13 @@ static void mipi_dbi_fb_dirty(struct iosys_map *src, struct drm_framebuffer *fb,
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
@@ -390,6 +421,8 @@ void drm_mipi_dbi_plane_helper_atomic_update(struct drm_plane *plane,
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

