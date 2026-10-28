Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.138
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793193972;
	b=Q1cygBxFMqmTzOK7L9vmdeu94QFJfJOheA+sy9so1ZUSKcYdfwE1MkTEF5kp40/WFSnv
	 nmgB/8G/oZnpCD2KO7THWXH2g43/E/2DwWZ9oP3nfLosZ5GKOoE0LP8p2wowTcqjrCvNO
	 OvPKJTZ/x3HmopAFl97ec3iSQpFx3oKmREisFGW8uNLLfCHWHgMvpqU6gV6YyT25fQXDN
	 XdM+SI9TdsOcZM1x77WBAtmbbLCl1kQAe2vkhbGFlqixS8L0kJR2YZzF8SfrvXJd6z/b/
	 LHMToY3e2DK/V+BApI/VDAO9P0o32mXJb6ktGBk9q1BUKMgonRixBk65iW7AfrkUtRA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793193972;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=J5kskPYEzVbZTmug890A+LF3utkapqU/C4c+xhUhSgg=;
	b=H6g6ILUZX/RKtguDoDtEEoVrKXAuNONuylbYa/F50ONITdG99pL4oZ4UmQWjXB4S5DHQ
	 kWq8ZRWCPtFKyl1rJePW7VWgJaXw5HE8cCsJUJ36++xSRUIuv3G3f7BS95QWGXUoj5VMn
	 BoVyjDdVuXTvKdNN4UQAq5ajy0NnPbPsfTMFS43PaKLCli80ZY2e+k8SNmHcWyAII50yy
	 ZfAhMeV0MErl9YS02s1C1/VvltkBgDykz2w6qAETILrchj0soJ6sXjvSk9/49Cx1AS3VQ
	 UIFWsZc+FZU2u+3yU6NPTOIrY8qbmCaHdnqiionfnAUW/sABEzQwW/aHRMXSkvplZIg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=r6WsFWEa;
	arc=none smtp.remote-ip=74.125.229.138
Received: from mail-dl2-f10.google.com (mail-dl2-f10.google.com [74.125.229.138])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE35E606A320
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 13:26:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CE35E606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=r6WsFWEa
Received: by mail-dl2-f10.google.com with SMTP id a92af1059eb24-175ec8c4efeso34636c88.0
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 06:26:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793193971; x=1793798771; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=J5kskPYEzVbZTmug890A+LF3utkapqU/C4c+xhUhSgg=;
        b=r6WsFWEa2G8zV5addLX27W0ggvP8OAREh4En0WMu1Mny/uaMb20H1l+KBki0mG07XY
         W6ef0N97f+Pm1z3EkxukkPYXzYItnqgz5ZeJse+ZfeFokS6P9YmYavxlzMjMGg1r9ILj
         vMXlCDtBPUk4o1xpDpxwPJmDI0KXJ8w83+AA182PNbpv77cH3/BWLQjIXi7FaogOjr6b
         TiskIs/ER1qxSLBQygcbLN3LgVxlH4VMNzvMWyY0w6LG5rFs97O0n4qgtOINVgPu/G+C
         FDvRtglAKReGnm+hzn8/eZ8Il/3bUMuaNzgaYQ9zO4fQo2dCM3xV6Or6yqBA3wCi6km8
         gcFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793193971; x=1793798771;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=J5kskPYEzVbZTmug890A+LF3utkapqU/C4c+xhUhSgg=;
        b=KvYQARqzMrUINcdCkV+G2Lohg/MRPTN0BKuDOxuqNOvbCaE7YasCJSGLWZuAVqsZoJ
         XOR7eF9sOqSBoNhfX9f99KMCgrJ0S5NMN4sAEZ+BfZPPHH9U5AQnyZres6kyhO3dCpN+
         cbSTZVZoztXfrpZCko8Q1hhmzjIlLGEFurDEnDA8p4NTK8M6yJaGymSLFgKoRzmsw8mY
         Laj+PIo64hecN/8IHUIM23KSafdvQIQlK45VIA7POoGndv8fujm9ev4z2/pjcAyPpH1C
         Q3zyEDTKaUvDFXJR1IVAPM6d816fmwSTZit8/kxlZtBLOlpqRbEeoaFIm2ljEKN/H7hC
         pKtg==
X-Forwarded-Encrypted: i=1; AKwUvBzrAyb8HeGfGsu7Z1yd3U3eGPHVu20v7aHPZGSSF8b8fXgCiiOfIwpm83UNsXrcnNiUDbQtC+5MsvHGbwg=@vger.kernel.org
X-Gm-Message-State: AFq9FYLIcvDmD2RPBtbqA9C9WOJhwRhL/VWOe8LyfGUDbOQVt69LFEu0
	dZO7p/vXhbpEsTh3au7DbihuKOCdyuZUMuH/n3Yk88x5wIdZFKO/gv+l
X-Gm-Gg: AYBFou3w7K0jldacyZB48BCwbeDU5t5ZxL4KmmUXB+++0bzLvc5A4dLoVBgZkWaeTu/
	pzCjbmGi7z2WQvhVEpjx+bqB6/hmBNRmKcpwWJbJUDjNpJoBY0b8i4c6I6n+XJ1iZHptJ304ZI7
	PJ3bgRUh4PX/g4Xmwuml9oTVlVjftS9jJreqMOxRAwL36zTR/Lw2JPT61z1y6LfQbZPRIcBmrME
	LiVRQYfqNyB91J7Xw/fvwxZFnKUQ3c4RRqko43F5XOeP++e39uha//BEcbjk7B3J4e+yED67q/1
	mNgMBTOLl3+Zafmy2Vh26TlRfFxyWvb0IwHc8OXzbD4ejeuj02qnMkvHn2Phz3sieZg7FsQCBli
	vX7pr2kmnIcFo/1AEFlLgpqeyqnDPEIFBddNsz12Q2qD2kLZzNywlHk63d+kGI3haRRQpmpLGV6
	Pg9JDrJsBmYz9lRTKhLOMtFTTVmYMKlqdbnHisYbg89Op4DmLpW7zcDvlRcpA2C6Goo9E+Yj+1i
	EvFoc7VqrrmK2OWDDEj7sTzNRlrDfAEx91MJkT5It8pwaqeGPbOhWeoFj5Hbr01YSps8oDa2YpV
	v4D9atuXqlvv/Msj5KrucdTL2gTAZBZny7skoj0rM9io7AuFsid2ZBU=
X-Received: by 2002:a05:7022:e883:b0:1a7:2ce7:ad10 with SMTP id a92af1059eb24-1a72ce7aeefmr2980468c88.44.1793193970280;
        Wed, 28 Oct 2026 06:26:10 -0700 (PDT)
Received: from toolbx (2607-8700-5500-3d9a-0000-0000-0000-0003.16clouds.com. [2607:8700:5500:3d9a::3])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1a75c814aa1sm10708639c88.7.2026.10.28.06.26.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 06:26:10 -0700 (PDT)
From: ZiAo Wang <ziaowang2007@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	jikos@kernel.org,
	bentiss@kernel.org,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ho Jie Feng <hjf3108@gmail.com>,
	ZiAo Wang <ziaowang2007@gmail.com>
Subject: [PATCH 1/3] drm/format-helper: Add XRGB8888 to UYVY conversion
Date: Wed, 28 Oct 2026 21:25:34 +0800
Message-ID: <20261028132536.375927-2-ziaowang2007@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261028132536.375927-1-ziaowang2007@gmail.com>
References: <20261028132536.375927-1-ziaowang2007@gmail.com>
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

From: Ho Jie Feng <hjf3108@gmail.com>

Add a helper for devices that use packed UYVY but accept XRGB8888
framebuffers.

Signed-off-by: Ho Jie Feng <hjf3108@gmail.com>
Signed-off-by: ZiAo Wang <ziaowang2007@gmail.com>
---
 drivers/gpu/drm/drm_format_helper.c   | 73 +++++++++++++++++++++++++++
 drivers/gpu/drm/drm_format_internal.h | 21 ++++++++
 include/drm/drm_format_helper.h       |  4 ++
 3 files changed, 98 insertions(+)

diff --git a/drivers/gpu/drm/drm_format_helper.c b/drivers/gpu/drm/drm_format_helper.c
index 6cddf05c49..606733ca43 100644
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
index ce29dd05bc..7a4cfb0d18 100644
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
index 2b5c1aef80..e50f96e074 100644
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
2.56.0

