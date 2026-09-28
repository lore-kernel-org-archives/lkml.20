Received: from smtp.inf.ufrgs.br (smtp.inf.ufrgs.br [143.54.11.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A85F3333439
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 00:55:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=143.54.11.23
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790556929; cv=none; b=bpcIZ3OKdxSAeU8f582lllhHDgIBa5jeTdXnCVwvigNxgTgOO9UVfsyrW3LiBbZjmgye/wajaYmuxzPmF3BlJxzfyrV20Ya0rfGlCtSnlU1YyWxn6sSDblKbAsdOW0DsiLXN1j+04Amk+xZlXOSrPzrzcmVkIwcSLGPVAS7SaYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790556929; c=relaxed/simple;
	bh=qJqZWWbb7a84fXURmaP+iHcJXDswRD5OGv4key6WaB8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CtWOxX5k2bCKjKDUSrWtoKELD+m+DcKDv3wuvaTvx1PT+Tu3upnr+lQ2NCv6ClSnlIViH184t+VQHXauIQl9wXtYBY2tulR8wn9SZiulSJMQQ4tlcjYoMFfSqwv+ByUkSfwTE+Pv5khLjBWCGZbwRAXtqrrATochYbDCFrKeEs0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inf.ufrgs.br; spf=pass smtp.mailfrom=inf.ufrgs.br; dkim=pass (2048-bit key) header.d=inf.ufrgs.br header.i=@inf.ufrgs.br header.b=au0W8mM/; arc=none smtp.client-ip=143.54.11.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inf.ufrgs.br
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inf.ufrgs.br
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=inf.ufrgs.br header.i=@inf.ufrgs.br header.b="au0W8mM/"
Received: from LAPTOP-R01LEAQM.localdomain (unknown [189.112.40.71])
	by smtp.inf.ufrgs.br (Postfix) with ESMTPSA id 3801E12111E;
	Sun, 27 Sep 2026 21:54:53 -0300 (-03)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=inf.ufrgs.br;
	s=dkim2026; t=1790556893;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Rk010YFNP6xdHl0B/2fFxrfz0atJPrmkJdgzHM5G8kw=;
	b=au0W8mM/hFxjGQEOPr23Y/AIxcrbq6765jSmrJIZACwLnvCr1LVuNW++gPIKsWelafVslm
	6IQ7BpEJKO7Rpd8wAYiFqPmneQuBwBwpExphj/55H6BnR8sD6txocHhQUcIRsMpnOAcsst
	bmZLewJ8dZwTuqQ8UQdm3s7AgeFIgY3Th7loqX9M1ld1evZ0FUQtvqrs+YQz5XJtwMoz8m
	+/Mioig8rPEbHS58OmRIgeAqEiGoHMhg35urijESkQphFIa1tMjPO2zEviLuThtvepFWze
	gyh+WZv91eUnva0r5HNcmWzeK7UZyhzpNdeW0AhAy6flizYTIFDdm03ml6VFuQ==
From: Matheus Alves de Almeida <matheus.aalmeida@inf.ufrgs.br>
To: Louis Chauvet <louis.chauvet@bootlin.com>,
	Haneen Mohammed <hamohammed.sa@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Melissa Wen <melissa.srw@gmail.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Matheus Alves de Almeida <matheus.aalmeida@inf.ufrgs.br>
Subject: [PATCH 4/5] drm/vkms: add support for RGB332
Date: Sun, 27 Sep 2026 21:53:00 -0300
Message-ID: <20260928005301.367977-5-matheus.aalmeida@inf.ufrgs.br>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260928005301.367977-1-matheus.aalmeida@inf.ufrgs.br>
References: <20260928005301.367977-1-matheus.aalmeida@inf.ufrgs.br>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for reading and writing the RGB332 pixel format.

Signed-off-by: Matheus Alves de Almeida <matheus.aalmeida@inf.ufrgs.br>
---
 drivers/gpu/drm/vkms/vkms_formats.c   | 21 +++++++++++++++++++++
 drivers/gpu/drm/vkms/vkms_plane.c     |  1 +
 drivers/gpu/drm/vkms/vkms_writeback.c |  3 ++-
 3 files changed, 24 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vkms/vkms_formats.c b/drivers/gpu/drm/vkms/vkms_formats.c
index 6e4f58207..0c3bb0618 100644
--- a/drivers/gpu/drm/vkms/vkms_formats.c
+++ b/drivers/gpu/drm/vkms/vkms_formats.c
@@ -267,6 +267,12 @@ static struct pixel_argb_u16 argb_u16_from_BGR565(const __le16 *pixel)
 				    (bgr_565 >> 11) & 0x1f, 0xffff, 5, 6, 5, 0);
 }
 
+static struct pixel_argb_u16 argb_u16_from_RGB332(u8 pixel)
+{
+	return channels_to_argb_u16((pixel >> 5) & 0x7, (pixel >> 2) & 0x7,
+				    pixel & 0x3, 0xffff, 3, 3, 2, 0);
+}
+
 static struct pixel_argb_u16 argb_u16_from_gray8(u8 gray)
 {
 	return argb_u16_from_u8888(255, gray, gray, gray);
@@ -475,6 +481,8 @@ READ_LINE_le16161616(XBGR16161616_read_line, px, cpu_to_le16(0xFFFF), px[0], px[
 READ_LINE(RGB565_read_line, px, __le16, argb_u16_from_RGB565, px)
 READ_LINE(BGR565_read_line, px, __le16, argb_u16_from_BGR565, px)
 
+READ_LINE(RGB332_read_line, px, u8, argb_u16_from_RGB332, *px)
+
 READ_LINE(R8_read_line, px, u8, argb_u16_from_gray8, *px)
 
 /*
@@ -690,6 +698,15 @@ static void argb_u16_to_BGR565(u8 *out_pixel, const struct pixel_argb_u16 *in_pi
 	*pixel = cpu_to_le16(b << 11 | g << 5 | r);
 }
 
+static void argb_u16_to_RGB332(u8 *out_pixel, const struct pixel_argb_u16 *in_pixel)
+{
+	u16 r, g, b;
+
+	argb_u16_to_channels(&r, &g, &b, NULL, 3, 3, 2, 0, in_pixel);
+
+	*out_pixel = r << 5 | g << 2 | b;
+}
+
 /**
  * vkms_writeback_row() - Generic loop for all supported writeback format. It is executed just
  * after the blending to write a line in the writeback buffer.
@@ -752,6 +769,8 @@ pixel_read_line_t get_pixel_read_line_function(u32 format)
 		return &RGB565_read_line;
 	case DRM_FORMAT_BGR565:
 		return &BGR565_read_line;
+	case DRM_FORMAT_RGB332:
+		return &RGB332_read_line;
 	case DRM_FORMAT_NV12:
 	case DRM_FORMAT_NV16:
 	case DRM_FORMAT_NV24:
@@ -992,6 +1011,8 @@ pixel_write_t get_pixel_write_function(u32 format)
 		return &argb_u16_to_RGB565;
 	case DRM_FORMAT_BGR565:
 		return &argb_u16_to_BGR565;
+	case DRM_FORMAT_RGB332:
+		return &argb_u16_to_RGB332;
 	default:
 		/*
 		 * This is a bug in vkms_writeback_atomic_check. All the supported
diff --git a/drivers/gpu/drm/vkms/vkms_plane.c b/drivers/gpu/drm/vkms/vkms_plane.c
index 68cb2a333..fff2d4eb5 100644
--- a/drivers/gpu/drm/vkms/vkms_plane.c
+++ b/drivers/gpu/drm/vkms/vkms_plane.c
@@ -29,6 +29,7 @@ static const u32 vkms_formats[] = {
 	DRM_FORMAT_ABGR16161616,
 	DRM_FORMAT_RGB565,
 	DRM_FORMAT_BGR565,
+	DRM_FORMAT_RGB332,
 	DRM_FORMAT_NV12,
 	DRM_FORMAT_NV16,
 	DRM_FORMAT_NV24,
diff --git a/drivers/gpu/drm/vkms/vkms_writeback.c b/drivers/gpu/drm/vkms/vkms_writeback.c
index f64b90908..54330803e 100644
--- a/drivers/gpu/drm/vkms/vkms_writeback.c
+++ b/drivers/gpu/drm/vkms/vkms_writeback.c
@@ -22,7 +22,8 @@ static const u32 vkms_wb_formats[] = {
 	DRM_FORMAT_XRGB16161616,
 	DRM_FORMAT_ARGB16161616,
 	DRM_FORMAT_RGB565,
-	DRM_FORMAT_BGR565
+	DRM_FORMAT_BGR565,
+	DRM_FORMAT_RGB332
 };
 
 static const struct drm_connector_funcs vkms_wb_connector_funcs = {
-- 
2.43.0

