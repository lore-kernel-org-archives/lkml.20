Received: from smtp.inf.ufrgs.br (smtp.inf.ufrgs.br [143.54.11.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82018344DAE
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 00:55:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=143.54.11.23
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790556936; cv=none; b=l7B8wgyhhYo0G46S3qdayDz+TPGKEALnzU5YTJsD2DJ8f9tYWtle5A3A9PInYcONWyRg+tIc5AofKXDUA2u1FzPvWTNZx4y/OKt/hmALi0K1oiWKxWQ/Wu+gIArKzABdOwxH5DNEjsELRazIWXJVtrHNMY4YGBf2+Q+oSUC4Usc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790556936; c=relaxed/simple;
	bh=2pM3Nu1tt9Idi+7V2X81FkOpqXq7f1ePsyFcXZJ400Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=em67oit6wZAZWhBR3VKReIY+PP3Gi5LkisXibPV+PxPYiSJFVoBPOoS/HFUANwj+DGMaurdn1hrYj0I/l18m75Z5FL4wXNgWuhLgmko13dPeme6uKF5oFWrGL6Q+quSlfWIKKeF5YXl+6v7kcENx/gB4IEhDMhhzIrw65GWiUR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inf.ufrgs.br; spf=pass smtp.mailfrom=inf.ufrgs.br; dkim=pass (2048-bit key) header.d=inf.ufrgs.br header.i=@inf.ufrgs.br header.b=PmMoJTc4; arc=none smtp.client-ip=143.54.11.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inf.ufrgs.br
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inf.ufrgs.br
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=inf.ufrgs.br header.i=@inf.ufrgs.br header.b="PmMoJTc4"
Received: from LAPTOP-R01LEAQM.localdomain (unknown [189.112.40.71])
	by smtp.inf.ufrgs.br (Postfix) with ESMTPSA id 9D1C212111F;
	Sun, 27 Sep 2026 21:54:53 -0300 (-03)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=inf.ufrgs.br;
	s=dkim2026; t=1790556893;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=D19fqv261MzzzeIRV2U6y+pS9yH8+bjHlaQKvLA8LmE=;
	b=PmMoJTc4/pL22BkmxS5cJaydZzf3+cYA0CpTPHT2rbz4KS4LzFm3Va7+1LbGG6xxrJMnT6
	K632yV1H9VXZLBojzcukJkAyQs4/O3vZ2ITJKCBuvnpplL9Ewn7H5lD5XMPHqiuO5IwQRL
	uWUyxXZaCYkGqit1P23Vts3REJhKRafajRh/YQ2BvfF48lTyEmN4swzH6Tzcc2ANZYyqNs
	RszB5a44WfM2bPSYjII6Ne2Qzs8FYrDlUHbVNmAJDOtYLsj2WM2eB+3xhw90iyHdoyFCdK
	07r99MNfULOCI40wmwWTrx3gX8tCTpQy1ciQRId2cB7+/eMb/cL9IqRao+g4kw==
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
Subject: [PATCH 5/5] drm/vkms: add support for BGR233
Date: Sun, 27 Sep 2026 21:53:01 -0300
Message-ID: <20260928005301.367977-6-matheus.aalmeida@inf.ufrgs.br>
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

Add support for reading and writing the BGR233 pixel format.

Signed-off-by: Matheus Alves de Almeida <matheus.aalmeida@inf.ufrgs.br>
---
 drivers/gpu/drm/vkms/vkms_formats.c   | 20 ++++++++++++++++++++
 drivers/gpu/drm/vkms/vkms_plane.c     |  1 +
 drivers/gpu/drm/vkms/vkms_writeback.c |  3 ++-
 3 files changed, 23 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vkms/vkms_formats.c b/drivers/gpu/drm/vkms/vkms_formats.c
index 0c3bb0618..de25c8a19 100644
--- a/drivers/gpu/drm/vkms/vkms_formats.c
+++ b/drivers/gpu/drm/vkms/vkms_formats.c
@@ -273,6 +273,12 @@ static struct pixel_argb_u16 argb_u16_from_RGB332(u8 pixel)
 				    pixel & 0x3, 0xffff, 3, 3, 2, 0);
 }
 
+static struct pixel_argb_u16 argb_u16_from_BGR233(u8 pixel)
+{
+	return channels_to_argb_u16(pixel & 0x7, (pixel >> 3) & 0x7,
+				    (pixel >> 6) & 0x3, 0xffff, 3, 3, 2, 0);
+}
+
 static struct pixel_argb_u16 argb_u16_from_gray8(u8 gray)
 {
 	return argb_u16_from_u8888(255, gray, gray, gray);
@@ -482,6 +488,7 @@ READ_LINE(RGB565_read_line, px, __le16, argb_u16_from_RGB565, px)
 READ_LINE(BGR565_read_line, px, __le16, argb_u16_from_BGR565, px)
 
 READ_LINE(RGB332_read_line, px, u8, argb_u16_from_RGB332, *px)
+READ_LINE(BGR233_read_line, px, u8, argb_u16_from_BGR233, *px)
 
 READ_LINE(R8_read_line, px, u8, argb_u16_from_gray8, *px)
 
@@ -707,6 +714,15 @@ static void argb_u16_to_RGB332(u8 *out_pixel, const struct pixel_argb_u16 *in_pi
 	*out_pixel = r << 5 | g << 2 | b;
 }
 
+static void argb_u16_to_BGR233(u8 *out_pixel, const struct pixel_argb_u16 *in_pixel)
+{
+	u16 r, g, b;
+
+	argb_u16_to_channels(&r, &g, &b, NULL, 3, 3, 2, 0, in_pixel);
+
+	*out_pixel = b << 6 | g << 3 | r;
+}
+
 /**
  * vkms_writeback_row() - Generic loop for all supported writeback format. It is executed just
  * after the blending to write a line in the writeback buffer.
@@ -771,6 +787,8 @@ pixel_read_line_t get_pixel_read_line_function(u32 format)
 		return &BGR565_read_line;
 	case DRM_FORMAT_RGB332:
 		return &RGB332_read_line;
+	case DRM_FORMAT_BGR233:
+		return &BGR233_read_line;
 	case DRM_FORMAT_NV12:
 	case DRM_FORMAT_NV16:
 	case DRM_FORMAT_NV24:
@@ -1013,6 +1031,8 @@ pixel_write_t get_pixel_write_function(u32 format)
 		return &argb_u16_to_BGR565;
 	case DRM_FORMAT_RGB332:
 		return &argb_u16_to_RGB332;
+	case DRM_FORMAT_BGR233:
+		return &argb_u16_to_BGR233;
 	default:
 		/*
 		 * This is a bug in vkms_writeback_atomic_check. All the supported
diff --git a/drivers/gpu/drm/vkms/vkms_plane.c b/drivers/gpu/drm/vkms/vkms_plane.c
index fff2d4eb5..89beda57e 100644
--- a/drivers/gpu/drm/vkms/vkms_plane.c
+++ b/drivers/gpu/drm/vkms/vkms_plane.c
@@ -30,6 +30,7 @@ static const u32 vkms_formats[] = {
 	DRM_FORMAT_RGB565,
 	DRM_FORMAT_BGR565,
 	DRM_FORMAT_RGB332,
+	DRM_FORMAT_BGR233,
 	DRM_FORMAT_NV12,
 	DRM_FORMAT_NV16,
 	DRM_FORMAT_NV24,
diff --git a/drivers/gpu/drm/vkms/vkms_writeback.c b/drivers/gpu/drm/vkms/vkms_writeback.c
index 54330803e..37042445d 100644
--- a/drivers/gpu/drm/vkms/vkms_writeback.c
+++ b/drivers/gpu/drm/vkms/vkms_writeback.c
@@ -23,7 +23,8 @@ static const u32 vkms_wb_formats[] = {
 	DRM_FORMAT_ARGB16161616,
 	DRM_FORMAT_RGB565,
 	DRM_FORMAT_BGR565,
-	DRM_FORMAT_RGB332
+	DRM_FORMAT_RGB332,
+	DRM_FORMAT_BGR233
 };
 
 static const struct drm_connector_funcs vkms_wb_connector_funcs = {
-- 
2.43.0

