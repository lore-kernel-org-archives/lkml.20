Received: from smtp.inf.ufrgs.br (smtp.inf.ufrgs.br [143.54.11.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B256333439
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 00:55:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=143.54.11.23
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790556922; cv=none; b=D3m9TwfSO3xaW5B3OxQrUcmXi+1JA0a5sqgyy7LlVxgt3DqPV/AwKOg+SLBfTUVKG24X+mkoQsgcbOgi3Ed2/9TOpmVtZ+0bvSWEbK4r6Aa9JpqQ2wG50nS0zIXJwR+CBsj1FWnzVYGUkKxYeiLESvyHor+5Y5YMBarMmlWwQhU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790556922; c=relaxed/simple;
	bh=IZpgYpTzNuzCSazFhnmq2ik6Kkf0jJi/aOZzVn+yIOQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EUrYjcDj3+Ni0Aok53VMf+D7SjWrA4tsGs2gUZrRreHJLdZCD5xGevFm+HpG7yR0nUAXyrS3dUqajQYrr/q/WsJsgsX+5AdO9B8fB7T2jTQzU9UYK8cC6yvEFO9ykKBEhf/Nx7ENt4el+HI/Btgl1qeclbo8+KIrYrngBOOA2kY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inf.ufrgs.br; spf=pass smtp.mailfrom=inf.ufrgs.br; dkim=pass (2048-bit key) header.d=inf.ufrgs.br header.i=@inf.ufrgs.br header.b=QIGeP145; arc=none smtp.client-ip=143.54.11.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inf.ufrgs.br
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inf.ufrgs.br
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=inf.ufrgs.br header.i=@inf.ufrgs.br header.b="QIGeP145"
Received: from LAPTOP-R01LEAQM.localdomain (unknown [189.112.40.71])
	by smtp.inf.ufrgs.br (Postfix) with ESMTPSA id 8B7B212111D;
	Sun, 27 Sep 2026 21:54:52 -0300 (-03)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=inf.ufrgs.br;
	s=dkim2026; t=1790556893;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=B8ccYN2Olkio/VgRZYmOT00d5tYZYi0SFblVjv+81wo=;
	b=QIGeP145hV/CVwX6TrQfKYND0Tv0I3bE2SkTpnXHQc7mUICDbgTzEMlCCwt2k8JKd53vOg
	PVaoZgLqdKA22x9+Di9AtJ7onzPtPD+1fAUNpbtLA3DjPG6BEWZwmBIGO09gMYKG+LZ5lX
	RDMD8jeO+Q+E3zKAviSm4JLWXS3aSyPI9wBsGFiQjlFh8yhxEb9yc1knZHWPEyZLvax/YS
	mvE+CAsYUfHFyiFMYYkKWCfyjDvkua5ol27WALEdme9LMHDSji6bEpqCNbVf/T+WrkpKzC
	AK7AkmdvVIVs+o1fT4obdkisI6IAeIHw8NcRR4sUNlYRbn3X1vCTHFqrVEK2PQ==
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
Subject: [PATCH 3/5] drm/vkms: add a helper for channel to argb_u16 conversion
Date: Sun, 27 Sep 2026 21:52:59 -0300
Message-ID: <20260928005301.367977-4-matheus.aalmeida@inf.ufrgs.br>
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

Other pixel formats have similar conversions to the one implemented in
the RGB565 helper.

Add a channels_to_argb_u16() helper to convert individual channels into
the internal representation, and use it in argb_u16_from_BGR565() and
argb_u16_from_RGB565().

Signed-off-by: Matheus Alves de Almeida <matheus.aalmeida@inf.ufrgs.br>
---
 drivers/gpu/drm/vkms/vkms_formats.c | 50 +++++++++++++++++------------
 1 file changed, 29 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/vkms/vkms_formats.c b/drivers/gpu/drm/vkms/vkms_formats.c
index b44900761..6e4f58207 100644
--- a/drivers/gpu/drm/vkms/vkms_formats.c
+++ b/drivers/gpu/drm/vkms/vkms_formats.c
@@ -229,24 +229,42 @@ static struct pixel_argb_u16 argb_u16_from_le16161616(__le16 a, __le16 r, __le16
 				       le16_to_cpu(b));
 }
 
-static struct pixel_argb_u16 argb_u16_from_RGB565(const __le16 *pixel)
+static u16 channel_to_u16(unsigned int size, u16 in)
+{
+	s64 fp_ratio = drm_fixp_div(drm_int2fixp(65535), drm_int2fixp((1 << size) - 1));
+	s64 fp_channel = drm_int2fixp(in);
+
+	return drm_fixp2int_round(drm_fixp_mul(fp_channel, fp_ratio));
+}
+
+static struct pixel_argb_u16 channels_to_argb_u16(u16 in_r, u16 in_g, u16 in_b, u16 in_a,
+						  unsigned int size_r, unsigned int size_g,
+						  unsigned int size_b, unsigned int size_a)
 {
 	struct pixel_argb_u16 out_pixel;
 
-	s64 fp_rb_ratio = drm_fixp_div(drm_int2fixp(65535), drm_int2fixp(31));
-	s64 fp_g_ratio = drm_fixp_div(drm_int2fixp(65535), drm_int2fixp(63));
+	out_pixel.r = size_r ? channel_to_u16(size_r, in_r) : in_r;
+	out_pixel.g = size_g ? channel_to_u16(size_g, in_g) : in_g;
+	out_pixel.b = size_b ? channel_to_u16(size_b, in_b) : in_b;
+	out_pixel.a = size_a ? channel_to_u16(size_a, in_a) : in_a;
 
+	return out_pixel;
+}
+
+static struct pixel_argb_u16 argb_u16_from_RGB565(const __le16 *pixel)
+{
 	u16 rgb_565 = le16_to_cpu(*pixel);
-	s64 fp_r = drm_int2fixp((rgb_565 >> 11) & 0x1f);
-	s64 fp_g = drm_int2fixp((rgb_565 >> 5) & 0x3f);
-	s64 fp_b = drm_int2fixp(rgb_565 & 0x1f);
 
-	out_pixel.a = (u16)0xffff;
-	out_pixel.r = drm_fixp2int_round(drm_fixp_mul(fp_r, fp_rb_ratio));
-	out_pixel.g = drm_fixp2int_round(drm_fixp_mul(fp_g, fp_g_ratio));
-	out_pixel.b = drm_fixp2int_round(drm_fixp_mul(fp_b, fp_rb_ratio));
+	return channels_to_argb_u16((rgb_565 >> 11) & 0x1f, (rgb_565 >> 5) & 0x3f,
+				    rgb_565 & 0x1f, 0xffff, 5, 6, 5, 0);
+}
 
-	return out_pixel;
+static struct pixel_argb_u16 argb_u16_from_BGR565(const __le16 *pixel)
+{
+	u16 bgr_565 = le16_to_cpu(*pixel);
+
+	return channels_to_argb_u16(bgr_565 & 0x1f, (bgr_565 >> 5) & 0x3f,
+				    (bgr_565 >> 11) & 0x1f, 0xffff, 5, 6, 5, 0);
 }
 
 static struct pixel_argb_u16 argb_u16_from_gray8(u8 gray)
@@ -259,16 +277,6 @@ static struct pixel_argb_u16 argb_u16_from_grayu16(u16 gray)
 	return argb_u16_from_u16161616(0xFFFF, gray, gray, gray);
 }
 
-static struct pixel_argb_u16 argb_u16_from_BGR565(const __le16 *pixel)
-{
-	struct pixel_argb_u16 out_pixel;
-
-	out_pixel = argb_u16_from_RGB565(pixel);
-	swap(out_pixel.r, out_pixel.b);
-
-	return out_pixel;
-}
-
 VISIBLE_IF_KUNIT
 struct pixel_argb_u16 argb_u16_from_yuv161616(const struct conversion_matrix *matrix,
 					      u16 y, u16 channel_1, u16 channel_2)
-- 
2.43.0

