Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793805535;
	b=MIcXxgMGjyaHiW9VHSsIGzo8o001SlO7sEG0l6EA3zB5WZYn+guA1waiBDtGT+YEF3uZ
	 apS9hcH8A7dyIYyabWldZ978a8ffBe84LmVudWU6FxXX3v51pxiSx6Jv4dNOjmdWZ0rlR
	 M5Opk/dslQqpdb+A6tYslfvsz4BoGaRLjeif1MJU6G7TWl+fh2KbzfJquLjsk+y4IWn0Q
	 j9VkGPviI+5aNOSwTixTLAHX/PLoPh++YUl4Jchm6QMJQjtAiYjM9mzjp9JckYOEvMVnp
	 IJWQpj+NDbyUSIzwms1ZEU8+wp9VZF9Hpz07ajoMLUjImdR9TKSGj4kI203Rk2usivA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793805535;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Oa7wmpPw7j3ZiDjIECjj/f+/lMAKhUceS0WKlo1NXtc=;
	b=LxP7Y8iSB9OfhFW+UaZRJHPVX/op94fADKkr2GQp+/Tg82OILs+v1KJNLV0rDKMQuCuh
	 /ZYOjg0CBzTI5U/WRAoviQLj9Ia+fY8UvYs6makv74k2M53kKXH7flmdRDJJZQ40Uonxt
	 6ivG4c7kLdGZC85aMusagoWbjw/dH2//fWqXcukOZl39aZWvmUEDGziy2J69csMYfb05u
	 PcDY1+kHs5CpkrpRWfhLm/iWuWbk0vL1fNhCQb/oESY2LCHD/V81rPxX/oFUKaf9MBy/x
	 JuKNVRnIXtKd4Af2A/tnpL16uOZDPoQi6rvSJKCONopUSGKa5dce8HvNnSg6xTPYZag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ynz+KK4+;
	arc=none smtp.remote-ip=209.85.210.177
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB0C3606A7CD
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 15:18:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EB0C3606A7CD
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ynz+KK4+
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-8a052aff9e9so730694b3a.0
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 07:18:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793805534; x=1794410334; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Oa7wmpPw7j3ZiDjIECjj/f+/lMAKhUceS0WKlo1NXtc=;
        b=ynz+KK4+qZMspgUgw2Myzwx7S4HhjxrUeL0fYfV9hytFvwO1bEZFzsQSa+tKBQmkLg
         9J7713FNk7v8m2+bD+zXUdaC5UiKVkhdHzO+IDwCaSWCLmWEO81ZsXiTRXZZIJXP9UHL
         akLMl3P8bIwMRuEVKWT9za66ZTOcAzT33p64SvPoubqQLdfr8e27n9r+xmDiJ81ITUYK
         OBhzpdOknPyxDCJUIwGcnCX1GI5x9flfSGbzsK597nZXL9y6n7XCa4rH8xz6+yiR+m9C
         s2iSXh/coXfFJE5T3WsY8f8O73nr5r+7XOrNujin14iufDoMxrWvmk7PhUu5s2EhmA9/
         04ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793805534; x=1794410334;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Oa7wmpPw7j3ZiDjIECjj/f+/lMAKhUceS0WKlo1NXtc=;
        b=KLbZouhsJJXt2OrrMPG/qf0tM0S3pTpX8PJugaCUGLxjw7PTM5gL2U9ycK9K7M+6Lg
         XdtUIUSo2+oZ7smFqx9Fwv+2zQ/HW6kA9oGqnfwU7MIOeD8DhK2PdVbqy3JcCU2kx7s9
         G1sYcRTDJDE9ZIUCfdUEyTgLzEtr/dAVOu2BpdRUrliKYBif+Dlkrn1BDOXBnfL90Wsk
         adubZlg2hlUCGvaCc2YOB4Qbl27dJePjC96OPKXk99m9X0CNsYrvPW+kOj/YyYCI9KXI
         7po//Sze1izXhds8DY80JtnNrio4AueyezFMtjj/5lB8VmBHvgFDyYbkVa1yZ/aUmCJb
         DaVw==
X-Forwarded-Encrypted: i=1; AKwUvBw7SG/r6ErK+LX6QxOQIgzMDdFBJHjSAx/hO/qNk+oZpdY0e/ciYQz8jFVVgE+eWKk7itRjIhRwFEOdXRY=@vger.kernel.org
X-Gm-Message-State: APuU4Z/hu2PF3pDYqZ1gqz2jawuFVWcM5SerlpqtW+MrpPSDuOa3f4Ly
	FjPPYSfIKm/fvhuC245+XJ9CZHZA2wdqlBPz0hgpCjp4ZHIZKWHmAUaW
X-Gm-Gg: AYBFou2RWG4mhxmHvdSeeww8k3FUylgtl4xXotiVlY8XCTOdyHY9hr6tIjL8qs0xjfy
	/bGXYsDZC36dUSymKgDgSATWBJTwqfsqaW2BuuBMs29UTUq6ktqjgYGhg/mXV3dEQ1lgDPkqJRN
	BZa3b5qsXRjSpbnmtTzsRrA3VEzGBSKBMBsLlr7BI+r3phzKwv/SzFaKPCGNp4O7IyK73+HdvCy
	Bzk25xYFt032qvWTsAsmWrlodOGV850cWtC9RPzQJjF8xadkel/hUmmWVJ50T4XU9w/0d/+h31D
	3tS98wIH/00iRhZkT6vKCEldOPlxFrvhAaIsalEo3ILOYi0lmhfZrboGzssQ3mcdntv86tJH8fC
	iyQaajP1m4zPNOJJ6aE9FO7iSVeegDx3m0n0PoJJABFHrAqfqqOVs85p+X2cz7nVEft48nHKKXY
	r9az76fR7nFL0GEoOm1E8znok8b4QN5BVFSkzWfUaepuPeWmKLMAyHoObtKwfvQehU7ic1x4Jzn
	Y3VYDh9nEMu+at2saQ8hyOScejCeYM+7LX/hYgj5YFTpMA+aqhFF7+CfmptIW+yikPL5tnS8OiY
	MEp4Ua8t76zoKB/9Ai1HN+L0W5/KF9e/bcqHI9OfluZ78mDDEbsoHSrP3YZ8x+y/qrknJHocPV5
	8mNhl
X-Received: by 2002:a05:6a00:6c9d:b0:89f:ed19:f093 with SMTP id d2e1a72fcca58-8a9beb684f0mr13888333b3a.34.1793805533961;
        Wed, 04 Nov 2026 07:18:53 -0800 (PST)
Received: from hostname.tail4fb79.ts.net ([2401:7400:c804:b668:65cc:625f:9c43:1e88])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-8b097fdf9bdsm1110555b3a.7.2026.11.04.07.18.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 07:18:53 -0800 (PST)
From: Ho Jie Feng <hjf3108@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: Ho Jie Feng <hjf3108@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/4] drm/format-helper: Add XRGB8888 to UYVY conversion
Date: Wed,  4 Nov 2026 23:16:47 +0800
Message-ID: <20261104151652.59135-2-hjf3108@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261104151652.59135-1-hjf3108@gmail.com>
References: <20261104151652.59135-1-hjf3108@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a helper for devices that use packed UYVY but accept XRGB8888
framebuffers.

Signed-off-by: Ho Jie Feng <hjf3108@gmail.com>
---
 drivers/gpu/drm/drm_format_helper.c   | 50 +++++++++++++++++++++++++++
 drivers/gpu/drm/drm_format_internal.h | 19 ++++++++++
 include/drm/drm_format_helper.h       |  4 +++
 3 files changed, 73 insertions(+)

diff --git a/drivers/gpu/drm/drm_format_helper.c b/drivers/gpu/drm/drm_format_helper.c
index 6cddf05c4..7e5cbb605 100644
--- a/drivers/gpu/drm/drm_format_helper.c
+++ b/drivers/gpu/drm/drm_format_helper.c
@@ -1379,3 +1379,53 @@ void drm_fb_xrgb8888_to_gray2(struct iosys_map *dst, const unsigned int *dst_pit
 }
 EXPORT_SYMBOL(drm_fb_xrgb8888_to_gray2);
 
+static void drm_fb_xrgb8888_to_uyvy_line(void *dbuf, const void *sbuf, unsigned int pixels)
+{
+	__le32 *dbuf32 = dbuf;
+	const __le32 *sbuf32 = sbuf;
+	const __le32 *send32 = sbuf32 + pixels;
+
+	while (sbuf32 < send32) {
+		u32 pix1 = le32_to_cpup(sbuf32);
+		u32 pix2 = le32_to_cpup(sbuf32 + 1);
+		u32 val32 = drm_pixel_xrgb8888_to_uyvy_bt601(pix1, pix2);
+
+		*dbuf32++ = cpu_to_le32(val32);
+		sbuf32 += 2;
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
diff --git a/drivers/gpu/drm/drm_format_internal.h b/drivers/gpu/drm/drm_format_internal.h
index ce29dd05b..41875656e 100644
--- a/drivers/gpu/drm/drm_format_internal.h
+++ b/drivers/gpu/drm/drm_format_internal.h
@@ -159,6 +159,25 @@ static inline u32 drm_pixel_xrgb8888_to_abgr2101010(u32 pix)
 	       drm_pixel_xrgb8888_to_xbgr2101010(pix);
 }
 
+static inline u32 drm_pixel_xrgb8888_to_uyvy_bt601(u32 pix1, u32 pix2)
+{
+	u32 r1 = (pix1 & 0x00ff0000) >> 16;
+	u32 g1 = (pix1 & 0x0000ff00) >> 8;
+	u32 b1 =  pix1 & 0x000000ff;
+	u32 r2 = (pix2 & 0x00ff0000) >> 16;
+	u32 g2 = (pix2 & 0x0000ff00) >> 8;
+	u32 b2 =  pix2 & 0x000000ff;
+	u32 r = r1 + r2;
+	u32 g = g1 + g2;
+	u32 b = b1 + b2;
+	u32 y1 = ((16U << 16) + 16829 * r1 + 33039 * g1 + 6416 * b1 + 32768) >> 16;
+	u32 y2 = ((16U << 16) + 16829 * r2 + 33039 * g2 + 6416 * b2 + 32768) >> 16;
+	u32 u = ((128U << 17) - 9714 * r - 19071 * g + 28784 * b + 65536) >> 17;
+	u32 v = ((128U << 17) + 28784 * r - 24103 * g - 4681 * b + 65536) >> 17;
+
+	return u | (y1 << 8) | (v << 16) | (y2 << 24);
+}
+
 /*
  * Conversion from ARGB8888
  */
diff --git a/include/drm/drm_format_helper.h b/include/drm/drm_format_helper.h
index 2b5c1aef8..e50f96e07 100644
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

