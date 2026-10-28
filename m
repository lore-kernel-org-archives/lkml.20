Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.5
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793209595;
	b=jt6LgI5eOzKYdKQoHL3IJOoD8+Mhi1rM9kI/EBR5vD0kfYTVnh3sMlWP20/27G0hKiWQ
	 Tiim94FyRnQYLobnbN3IyQIK4UVZ6Fw/pXPh1Te5JljNuyzJe0/2wA4mxzD9GDPbFoP1X
	 NiFeGSh36Bzy8A59uXan6fng5eovSH6mt4r8all7xNB1qx4/7ftCCEuJAr8epNBjbyJFW
	 pnUWAB2Hv3vt5xcpzDm2jZaQm6UdUmAq/oN4+ucEbY9Fi50maK4A/oKnlp1hjC/9IZ05+
	 RebKYgWkmKECwvFJ9gToIXJRC6A/xsdfYpf0RqQOlEDQ9CYo01qDTuMs/wFCZWWgB/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793209595;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=J5kskPYEzVbZTmug890A+LF3utkapqU/C4c+xhUhSgg=;
	b=Gx9GoDYBrBqPmnkWt42daa3ZFn6r4spx/qL5HQ/Ap4oHy0LCtUkdjnOCN6h09qXnLIcS
	 QT4uSE2RyVV0+GNlZGa9DBvcaF+eKILL03QsMwZ+/PONFWHFdTFyUV3IZVwOvWR4N2aiI
	 5002udsJu8Bbi8NEMHLqpIcHNHnHU3Y6kFC7RlmSd2bR1EgIFGsnnIlvxPkHRuET/LF3b
	 rF6JOp/5qOTU3UXbRbq/j2Qy9gNBaQfUyH7GzQExeIy2P4tJRGUr0Wputz3suf6VoWjwm
	 y38E7PsE5ko2JCNDzsKH9q/HaNgN+puxucIy4yAUlDJSdwdjpwFPXV/yxRc3g0F5KEA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FgVX207s;
	arc=none smtp.remote-ip=74.125.229.5
Received: from mail-dy2-f5.google.com (mail-dy2-f5.google.com [74.125.229.5])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E818C606A323
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 17:46:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E818C606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FgVX207s
Received: by mail-dy2-f5.google.com with SMTP id 5a478bee46e88-3535a54c09bso968061eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 10:46:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793209594; x=1793814394; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=J5kskPYEzVbZTmug890A+LF3utkapqU/C4c+xhUhSgg=;
        b=FgVX207sAmYgfzO5j1TFzznJMZD7QCIdqHykxIoAc7DMa+CEMtSlQGshx8M1kRjntH
         TQPAGd/dPctAgTG+sixeQzQanrO8KVJO+xrG0ytAH5d6V3rcFluTO5yiOiAIsWLeCreu
         B2dVrgxEMQzf4qHi11feIUQlI/jr5MqnFNm0sdI1qHERaVL02XfFe/qaVK8G8MidGt/B
         oIlxrs9jVLMO2XBD07g+CEYQndPN6lSKPP1C2oWrNr4HxWyChOO3OkOSGQMhJV5S9PwP
         LIQP8m8pVo4S44S/xdeawr355UTTaBh26ZW/2dg5jR3LE2db/4/I68Fx9bSSx7fkJeyI
         Ajqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793209594; x=1793814394;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=J5kskPYEzVbZTmug890A+LF3utkapqU/C4c+xhUhSgg=;
        b=Aq13MDxf7wAApyLgI++r1eID5Hrvyc4I7rl4h6ClPUwJd9J1wlLL5Fw+7XiVUtqRZ2
         0MfeYl+3YX7NpRSbopJTcqBUax9tEbLztmAE49UzjGuuZVGaoFhomlTBX+1PQTus4J23
         P3WxQida1z+h1zenuzKnGQYiL++/oGuWK7/Jx9Wo92bqlAd0j73TL55d4hbkHYhTQ2ZY
         jVhrRg236+DtERUVnNtYvWZabEM+jhPncBxYIXzGS9biP8O73G5Q54+t8B2yKRXS+g41
         IZwKXucz512zEbXKoAbFGwFqeruHiKDzz7qzDxnXoYiBvs1QsQk5rgtPRZ/DQh+eK+at
         tQHA==
X-Forwarded-Encrypted: i=1; AKwUvBwfzn6a3+2Ds7kxYVBgCV0RnlSb9DRzsWLT8bxckzKynJy5njtMMMR26be2bp29o6ocscIkC6HDi5TnM/o=@vger.kernel.org
X-Gm-Message-State: AFq9FYKxV7keGDa3DZi2nGlGGA0vY5kopy3CueH9024oDvykItfhRS+C
	Ml2erxBI/DsFOUVReb+MH31lCNwFBebZG34+uQcaxqicFAW7ygRqlrBtCCvjQgboKvWCHw==
X-Gm-Gg: AYBFou0uMRu7/7wx9QVEpGZ+/T9Yi2jzIYKPTdE6ft4tQ7AQ8+Yb9WEg/3XVtoVmjtB
	OVnzLRLt/q+wGcOKQ5GdPTF4UepsNmZJ4HgnPdpgo3m6FU2fE1QSV+aevEEcW+YqV/55EfsZ2e1
	P3ZZDPiw57riQLv4kcF6naPFmv9k5IOxKA8VCN05l57vn42Yal2doRKkerqwdQGDgSbJHFm6akL
	cTueKYIw/WPEywDO/QoxWLAObbz0LRvrmJmRqCdcphT6bKeVx4oiwOStirUiOOsZEhc0ComQm2i
	DXegwTexyjY6+5Uxg0X0ku4SnAyINLit9HyZUT8lFequeDElV7UPpwDQT8AuWDi7qhDnHxJcnOS
	Gk6nIgwithNUEAtQ5QNBYop6bs9QvWOv7AzyyUsneZqJuG80T2AU44NHZb+/Au20yCK8+DSCQzY
	lDLrz4dGaJWrssIUtDB6XAr5XkrkfWde2G6hQpC4OdIQVYIaiQqlyABgZPN22aKMoHkw+5u9nEj
	IVc5dvYIo0tVd/7ynaBTwADG/fjOugrtS6O8aQBcywbhvsDkyZf82NkZYeGk4mE+ulqIl2k/xQK
	ZN5Om5kJM+KSTXGnGPm5IHEnHd83DI15r/T9rE3ihOuhSiDhfXjeHUrQCWpcdNJoMl5xaw+dFtY
	ABaDDI9ucj2oYxQ==
X-Received: by 2002:a05:693c:41c8:20b0:351:5cb5:53f7 with SMTP id 5a478bee46e88-36a2027e717mr4970207eec.3.1793209593900;
        Wed, 28 Oct 2026 10:46:33 -0700 (PDT)
Received: from toolbx (2607-8700-5500-3d9a-0000-0000-0000-0003.16clouds.com. [2607:8700:5500:3d9a::3])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a237be80csm17883633eec.2.2026.10.28.10.46.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 10:46:33 -0700 (PDT)
From: ZiAo Wang <ziaowang2007@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	linux-kernel@vger.kernel.org,
	Ho Jie Feng <hjf3108@gmail.com>,
	ZiAo Wang <ziaowang2007@gmail.com>
Subject: [PATCH v2 1/2] drm/format-helper: Add XRGB8888 to UYVY conversion
Date: Thu, 29 Oct 2026 01:44:24 +0800
Message-ID: <20261028174425.21704-2-ziaowang2007@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261028174425.21704-1-ziaowang2007@gmail.com>
References: <20261028174425.21704-1-ziaowang2007@gmail.com>
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

