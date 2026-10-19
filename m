Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792424920;
	b=hLVslgEr12MR9no4jx5DjDAKxrsC1PtiBu+/6h+Z1d4LRtEcO6mg3RBs1bSJtF+f4//Q
	 TCjd9wqOjLW7jqY1f+xcRPRE+w7n10V4oI1Tuz8AgK0z/SBsOmwSa8lSqwC+hVYXzz/Ns
	 yanwVfEYNlg9SB4uWJs6nIw8fJGf3PxZ61P0Z1Bn2dIgfXAd2Qsymvjzf7u7nMAhoMfSm
	 8GXw4ySEZbxvIEaSxoaW4rkRwhfsE5pBXJdB//RHYas+uyMltqOQ+o8eymAB40T1Oi1Y8
	 whkOQj3tbX/Mqj+dC9wH+IPgzc3csXCZTxYbE4hZ4zGLeK2h6b3Qjh/8e3uPr/J5Z/Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792424920;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=D8+K0yhFOMML8+Q3O7sLPxhD4rnWfCrAJQplUYe0Ock=;
	b=hmCJtJyqnDdIPaVr7CGSnF1iMLGVf+E1mWPbLrrJ+pX52I1dP5goacA2v+MwR2pwj6IS
	 g9TSYEDNDJkcPbg67SMkdWh5SxfJO438wWE1hw2EbMS05WKjMPmZQLSw5O36CLebtSfNN
	 Vg9S3ru2wFSVXGadh1G99wo4daIGKyOHQLm0lookmo9PTm4VgriSMFu/Nidu4aovgMpuA
	 JgubjMccHXBv/8KPlBXWL6qnl9deW2yo1hXUAGUaZZCe6jl6xcvHk68+2t+11jfxrWzAe
	 gg6cU7/s/YUmdoFI4ZlLCZ3sHVdvv5rmPBWQUympuNOtBXuzG3E+YnJRazHPGz2ZLcQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="mofkbr/B";
	arc=none smtp.remote-ip=209.85.216.51
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7D576080AA2
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 15:48:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A7D576080AA2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=mofkbr/B
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-3ac78f4c10bso1074130a91.1
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 08:48:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792424919; x=1793029719; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=D8+K0yhFOMML8+Q3O7sLPxhD4rnWfCrAJQplUYe0Ock=;
        b=mofkbr/BxXsPG/9MGUh6UlF95pFjH2gNSmjUtY00Tw3cfmkl3qt8h/gBKTobKKoTJt
         H/YS0roQzAxl/H3H4GRpExZPQZRYVk6JR/ZM/M9N889kx9V8AFjnAOMkwzt9mrrNZHjD
         gYzerXgTfVnUxlYoXSDt2s9u9ey5g8zVqtYHYPvN5wohp7g/5F7jZjJVcc83wqg7KJXs
         h4PEDv29KqdWGIywV8WnUaLPLLo4I5KOvJmQRYKYpEHzpD8DnE9Sfb+SG6qNsbg22bJM
         XB3rWsEll9FSP50IJMhOzF3IZ5qeN5kgQ1z9AgrmCow1FBd1WpiO/DAuQndvEPlNunzU
         HYow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792424919; x=1793029719;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=D8+K0yhFOMML8+Q3O7sLPxhD4rnWfCrAJQplUYe0Ock=;
        b=bqvMd0e0O+5PG/HwuSGqYiV1Eg/PIemjN0VxtZfXovDXS+jVwsi/pbcX+2AwKCsYAI
         LGptvRVEjuVbL5Phy8ZDBbWhfCUeS1RbsJLIUJSzzEtF/KyQpttGqKiGtKCofvTwLWAQ
         +AwSy0UNitot1VAbez9+ourhob+EQ+VBaHFvUCJr/xEZnCaNRncopl9px/nBQYWLQQyi
         H3NSdfHNCY1fcRzzl++njdUAo44BFdk0gtHP+vAzYWa8MVTOKDZ+DNfiAX/a9KmCKvF8
         tSsHL0Bae3uz25K9EheyBITA7JBsQNxAeyc7dNgAiqIrxStucvz6MoEvj7i4BCn63lwK
         ziDA==
X-Forwarded-Encrypted: i=1; AKwUvByCUfAnMd3A7VEtxobjZl3Kx+Yt+gGB8JBvJTqQHBoVLbOdZvsfq+Kj+76jdtT7NAEHWG+T11SEqGULfrE=@vger.kernel.org
X-Gm-Message-State: AFq9FYLOBRrqvrERrI6CnzgXtfyj4M0hOC8j774XiJEidp48VEdjkNJb
	If/tEhmzbQh9LH1LcLs98iz3+HNmii0MH+Ej1H1qRrJJxfMreeL2g7WM
X-Gm-Gg: AYBFou1I3ClMAVE+lmppm+V1Pd7Uk8E/+4Chr0GwzQLHvAewykwoGvAmOCQlxg89sKa
	0AqXQQ8+MVVvaLbxCoMZx64OVMyebz3SYivobKjr+mlIVsCiDj746gYSAmh1XEya3oYvJYz9T9v
	uEVxQk1mzDeEK4dvVTinuMx80TaLtBG7LR7FkLMkV9JYyOdloF8NwJU9l8eWmYQRFnr+Ivg5DOL
	0r4sMNVek3uxAN9eEj6t/5mjikpv/T43zlVzn2BEWdcsdeVDJGx010PNsumVqxNEyzLSP3LqQL5
	ZNsgPetD/ohwvaoZbpcmdXQMWMyRKUYRcHq3O0h9GYXxotY/j4dBeA0Ndyxc4sjDw9SPIBVxvhg
	1DF5Oy+1C1xfzfwXSXO8Z5NN7Goq9VGl4c2S1Kqm2f707Dfbb7mJbzEWvlv5VzHH/W0yB3GPaZ2
	uzW9TnW0zYd5O+WW+FS3AcDNfOAq6nG5CxvoxqmNzp0e+rPhiuvdwoFmPJlD3hKVQrJfxuKOsVr
	DPDOLlrYE3m2wikKNf7O/wWdl7KVQnfzgQ6if1wSFm4HxgEnA==
X-Received: by 2002:a17:90a:2d0:b0:3ad:43c1:7d41 with SMTP id 98e67ed59e1d1-3ad43c17f6cmr1295554a91.33.1792424918943;
        Mon, 19 Oct 2026 08:48:38 -0700 (PDT)
Received: from hostname.tail4fb79.ts.net ([2401:7400:c804:b668:a144:150d:733a:5ba2])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-3ad5cc13658sm63271a91.4.2026.10.19.08.48.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 08:48:38 -0700 (PDT)
From: Ho Jie Feng <hjf3108@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: Ho Jie Feng <hjf3108@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 1/4] drm/format-helper: Add XRGB8888 to UYVY conversion
Date: Mon, 19 Oct 2026 23:48:05 +0800
Message-ID: <20261019154820.68659-2-hjf3108@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261019154820.68659-1-hjf3108@gmail.com>
References: <20261019154820.68659-1-hjf3108@gmail.com>
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
 drivers/gpu/drm/drm_format_helper.c   | 52 +++++++++++++++++++++++++++
 drivers/gpu/drm/drm_format_internal.h | 19 ++++++++++
 include/drm/drm_format_helper.h       |  4 +++
 3 files changed, 75 insertions(+)

diff --git a/drivers/gpu/drm/drm_format_helper.c b/drivers/gpu/drm/drm_format_helper.c
index 6cddf05c493bd..3cdfb4c68bfbf 100644
--- a/drivers/gpu/drm/drm_format_helper.c
+++ b/drivers/gpu/drm/drm_format_helper.c
@@ -11,6 +11,7 @@
 #include <linux/export.h>
 #include <linux/io.h>
 #include <linux/iosys-map.h>
+#include <linux/math.h>
 #include <linux/module.h>
 #include <linux/slab.h>
 
@@ -1379,3 +1380,54 @@ void drm_fb_xrgb8888_to_gray2(struct iosys_map *dst, const unsigned int *dst_pit
 }
 EXPORT_SYMBOL(drm_fb_xrgb8888_to_gray2);
 
+static void drm_fb_xrgb8888_to_uyvy_line(void *dbuf, const void *sbuf, unsigned int pixels)
+{
+	__le32 *dbuf32 = dbuf;
+	const __le32 *sbuf32 = sbuf;
+	const __le32 *send32 = sbuf32 + round_down(pixels, 2);
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
+
diff --git a/drivers/gpu/drm/drm_format_internal.h b/drivers/gpu/drm/drm_format_internal.h
index ce29dd05bcc55..41875656e59e4 100644
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

