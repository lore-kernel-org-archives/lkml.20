Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0100E4B8277
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 17:09:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791824964; cv=none; b=Jx1ivPb2+OQFne/Z6MS0RtdMaf6Mrdmnat4YhQOD81g2QAU2VP74wGul2L9GLtK2/DMIfIoxjZFPM+KVCcOoHH7ClXea5kdYHK+sNd2ePB1J8Rd9Auub4iuCmoMybgVgP/qBmkJHZrORFrrtjvsv3YuE9lwk/gddGG5chCbXRLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791824964; c=relaxed/simple;
	bh=Q6gIKPqj8anYRc6051kENzQy0gHsqxRKKVwDl3vVaHQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jqT4vn4BH6iz4wyQwJG1pioDeLaMeSmzSFLx9/P8Qil1AlYeWQW9nGPG3WILc67u8LP5A1Jeitd91WbRqJ8hC6QZOriuXurWKrEjRkKvm+F4X84S8/H9lajJ0LmTgADdJdXVlyNpHWbuEnjYBX7ZP0Ka0uh0mAEQp/vTeNDcK8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ohelf7Eb; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ohelf7Eb"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-3ab450c0873so1718331a91.3
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 10:09:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791824962; x=1792429762; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1xB7LeXBPWjQ/Fkq/Ig7agIfN32e6x+w4jhSajkeZwQ=;
        b=Ohelf7Eb7/6AMNaadHDBLnH6VnRSlWTNQKw8l8ZYz1Ji6uBRr8B6miGP2XvMjhCk+z
         Pv6Imup0XwZXVhc91MtsV0TnNwgNYu8fNSLZQk+wSH3e8MPX2eMddT5/5Z2E1rGtVp1/
         okl/7vD5hL8IBkoVb0a1ZEzprBKY8abn2DAwVnQjnE82WxmbooehNM7vaZkbNEbhchL2
         w//+IISAA+SicDAzhz10YCwC5b1tXDR+UtqO3YRiVBMB4qQkWON7mr+EEJqOdHytgQx4
         UEqZE6Fwv78oxahgJGGL0zywkT3BuyscNYptYo7v3xUx+pOQSAVEg2QOD72s2gAifNVL
         /dLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791824962; x=1792429762;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1xB7LeXBPWjQ/Fkq/Ig7agIfN32e6x+w4jhSajkeZwQ=;
        b=Pn3alxp7HaV1qSyDOk4kOTh3G7idGhGy0LOra/uLi8vC2tXBB/KRet6LsndnbzupTB
         +EBugAGIV5DLo9N7P+P3F/3aI6lwn2cqZ82iaF5Ri1nQLwvZwELCxMY0KC9v3AC6F/fW
         lwxIcw/GGi1621NmwPjGbhd2yG7BZBB+6EVH2EqcIE1k2349hYbLz45DYDij94aLc+bQ
         gqziCg5D2EH8+j/V4ChTI+Fd2qGTWmi3osw26PRWqYsy6GFI20premc8YsDF7j8BaXwp
         9e09tyRtD3sfUrmegAIbK1ZkslLA3y3Rg6fZ7g7nHTZf0QKOZYfV2qYw53977G4yhHTx
         F9CQ==
X-Forwarded-Encrypted: i=1; AKwUvBw7RD7ua4xHwIJi84+iUnqoltHQ/GJ+ub4W6su5rYOMlMsUynPINsyOfeVNTqEahaiHBXbsXbAjiDE5BDg=@vger.kernel.org
X-Gm-Message-State: AFq9FYKMK8E1rVwxJI51pqUNG9eP8ilp6k4n/RdkAy3psfImjNB/foeW
	dDUD7+g60mdzRVElYZg5GZSAqMhbMeTdJ045s3cZOh+Q/4ojg857PoNc
X-Gm-Gg: AYBFou3N1Urw1UkMHocvFEuY4Qm13b04WvCvLu3eTOD0ZxoBFDI8f4k23VjgAJU4skY
	bxYa/nGjE0hxfYLjjV0A1w5rIHZHaii0NXe231MkNFRsvAZ3D363jt4pNXHTStUI99SA2x+6p5Y
	8HdVt1RUENSOrCRUTk0AbBhbFqv5oUE18qpg81RhyDk/9dSfYew0e0T0JBB6hDOR/TSrRxF3YBp
	pLAEi2ZzQIY7F/EQAdDQSPm9tcUZXhETWGT2oBBvhUylm5WDuF0oI51xzuhcwO5LkgB7tO9UkbT
	+R5eNRoI4I6oVmMoAeo1gk4GgSs7T9ETSsJlACoav1U0bT0crOKo1J0kQLZS/FwZeCr1RhIqRaC
	B9WmJyf3fBa052GueItwxAvoq3GiE8G8T34FXmdFA3hnu338PSFLhHrROm/vHQ4Rndmit5rnuY5
	6SdO5b8/PPbaRYa6UpcC0Jz3yZFxL0dqW9y0mB5LfAiGlrLjCeSgXMb6424CbqEWE0lQReygG1H
	JNS0rtsAFQd2RetyytLpAnyKciYoWSM5IcgYVWB9K3ZwUZnVzw=
X-Received: by 2002:a17:90b:4fd0:b0:3a0:9640:8039 with SMTP id 98e67ed59e1d1-3ab3a778837mr8843817a91.30.1791824962173;
        Mon, 12 Oct 2026 10:09:22 -0700 (PDT)
Received: from hostname.tail4fb79.ts.net ([2401:7400:c804:b668:a144:150d:733a:5ba2])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-3ab38ff0d34sm18056092a91.14.2026.10.12.10.09.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 10:09:21 -0700 (PDT)
From: Ho Jie Feng <hjf3108@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: Ho Jie Feng <hjf3108@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	linux-kernel@vger.kernel.org
Subject: [PATCH] drm/format-helper: Add XRGB8888 to UYVY conversion
Date: Tue, 13 Oct 2026 01:08:56 +0800
Message-ID: <20261012170857.199561-1-hjf3108@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a helper for devices that use packed UYVY but accept XRGB8888
framebuffers.

Signed-off-by: Ho Jie Feng <hjf3108@gmail.com>
---
This is used for a driver, ms912x that I will be submitting. It only
supports uyvy framebuffers.

 drivers/gpu/drm/drm_format_helper.c   | 73 +++++++++++++++++++++++++++
 drivers/gpu/drm/drm_format_internal.h | 21 ++++++++
 include/drm/drm_format_helper.h       |  4 ++
 3 files changed, 98 insertions(+)

diff --git a/drivers/gpu/drm/drm_format_helper.c b/drivers/gpu/drm/drm_format_helper.c
index 6cddf05c493bd..606733ca43fb4 100644
--- a/drivers/gpu/drm/drm_format_helper.c
+++ b/drivers/gpu/drm/drm_format_helper.c
@@ -1379,3 +1379,76 @@ void drm_fb_xrgb8888_to_gray2(struct iosys_map *dst, const unsigned int *dst_pit
 }
 EXPORT_SYMBOL(drm_fb_xrgb8888_to_gray2);
 
+static void drm_fb_xrgb8888_to_uyvy_line(void *dbuf, const void *sbuf, unsigned int width)
+{
+	u8 *transfer_buffer = dbuf;
+	const __le32 *temp_buffer = sbuf;
+	unsigned int i, dst_offset = 0;
+	unsigned int pixel1, pixel2;
+	unsigned int r1, g1, b1, r2, g2, b2;
+	unsigned int r, g, b;
+	unsigned int v, y1, u, y2;
+
+	for (i = 0; i < width; i += 2) {
+		pixel1 = le32_to_cpup(&temp_buffer[i]);
+		pixel2 = le32_to_cpup(&temp_buffer[i + 1]);
+
+		r1 = (pixel1 & 0x00ff0000) >> 16;
+		g1 = (pixel1 & 0x0000ff00) >> 8;
+		b1 =  pixel1 & 0x000000ff;
+		r2 = (pixel2 & 0x00ff0000) >> 16;
+		g2 = (pixel2 & 0x0000ff00) >> 8;
+		b2 =  pixel2 & 0x000000ff;
+
+		y1 = drm_pixel_rgb_to_y_bt601(r1, g1, b1);
+		y2 = drm_pixel_rgb_to_y_bt601(r2, g2, b2);
+
+		r = r1 + r2;
+		g = g1 + g2;
+		b = b1 + b2;
+
+		v = drm_pixel_rgb2_to_v_bt601(r, g, b);
+		u = drm_pixel_rgb2_to_u_bt601(r, g, b);
+
+		transfer_buffer[dst_offset++] = u;
+		transfer_buffer[dst_offset++] = y1;
+		transfer_buffer[dst_offset++] = v;
+		transfer_buffer[dst_offset++] = y2;
+	}
+}
+
+/**
+ * drm_fb_xrgb8888_to_uyvy - Convert XRGB8888 to UYVY clip buffer
+ * @dst: Array of UYVY destination buffers
+ * @dst_pitch: Array of numbers of bytes between the start of two consecutive scanlines
+ *             within @dst; can be NULL if scanlines are stored next to each other.
+ * @src: Array of XRGB8888 source buffers
+ * @fb: DRM framebuffer
+ * @clip: Clip rectangle area to copy; x1 and x2 must be even
+ * @state: Transform and conversion state
+ *
+ * This function copies parts of a framebuffer to display memory and converts the
+ * color format during the process. The parameters @dst, @dst_pitch and @src refer
+ * to arrays. Each array must have at least as many entries as there are planes in
+ * @fb's format. Each entry stores the value for the format's respective color plane
+ * at the same index.
+ *
+ * This function does not apply clipping on @dst (i.e. the destination is at the
+ * top-left corner).
+ *
+ * Drivers can use this function for UYVY devices that don't support XRGB8888
+ * natively. ITU BT.601 is being used for the RGB -> YUV conversion.
+ */
+void drm_fb_xrgb8888_to_uyvy(struct iosys_map *dst, const unsigned int *dst_pitch,
+			     const struct iosys_map *src, const struct drm_framebuffer *fb,
+			     const struct drm_rect *clip, struct drm_format_conv_state *state)
+{
+	static const u8 dst_pixsize[DRM_FORMAT_MAX_PLANES] = {
+		2,
+	};
+
+	drm_fb_xfrm(dst, dst_pitch, dst_pixsize, src, fb, clip, false, state,
+		    drm_fb_xrgb8888_to_uyvy_line);
+}
+EXPORT_SYMBOL(drm_fb_xrgb8888_to_uyvy);
+
diff --git a/drivers/gpu/drm/drm_format_internal.h b/drivers/gpu/drm/drm_format_internal.h
index ce29dd05bcc55..7a4cfb0d188cb 100644
--- a/drivers/gpu/drm/drm_format_internal.h
+++ b/drivers/gpu/drm/drm_format_internal.h
@@ -159,6 +159,27 @@ static inline u32 drm_pixel_xrgb8888_to_abgr2101010(u32 pix)
 	       drm_pixel_xrgb8888_to_xbgr2101010(pix);
 }
 
+static inline u32 drm_pixel_rgb_to_y_bt601(u32 r, u32 g, u32 b)
+{
+	const u32 luma = (16U << 16) + 16829 * r + 33039 * g + 6416 * b + 32768;
+
+	return luma >> 16;
+}
+
+static inline u32 drm_pixel_rgb2_to_u_bt601(u32 r2, u32 g2, u32 b2)
+{
+	const u32 u = (128U << 17) - 9714 * r2 - 19071 * g2 + 28784 * b2 + 65536;
+
+	return u >> 17;
+}
+
+static inline u32 drm_pixel_rgb2_to_v_bt601(u32 r2, u32 g2, u32 b2)
+{
+	const u32 v = (128U << 17) + 28784 * r2 - 24103 * g2 - 4681 * b2 + 65536;
+
+	return v >> 17;
+}
+
 /*
  * Conversion from ARGB8888
  */
diff --git a/include/drm/drm_format_helper.h b/include/drm/drm_format_helper.h
index 2b5c1aef80b0e..e50f96e07484c 100644
--- a/include/drm/drm_format_helper.h
+++ b/include/drm/drm_format_helper.h
@@ -136,4 +136,8 @@ void drm_fb_xrgb8888_to_gray2(struct iosys_map *dst, const unsigned int *dst_pit
 			      const struct iosys_map *src, const struct drm_framebuffer *fb,
 			      const struct drm_rect *clip, struct drm_format_conv_state *state);
 
+void drm_fb_xrgb8888_to_uyvy(struct iosys_map *dst, const unsigned int *dst_pitch,
+			     const struct iosys_map *src, const struct drm_framebuffer *fb,
+			     const struct drm_rect *clip, struct drm_format_conv_state *state);
+
 #endif /* __LINUX_DRM_FORMAT_HELPER_H */
-- 
2.55.0

