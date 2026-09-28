Received: from smtp.inf.ufrgs.br (smtp.inf.ufrgs.br [143.54.11.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C8DD3368B0
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 00:55:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=143.54.11.23
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790556915; cv=none; b=d9HjRdhyI1UR7fIRU0PW+OhbpXcvgDRGFVemqTNW/eVpjC4ut4BMKF/m9m00b/FbcNHJWggJr/UZfUzSM+AUJGeyQDgbS3s1qjGsnOZkkz9ZNRbPeeQcM04w7N1H8Shk4ydEKy+EbhQQqf7EodkHt4Se9kS+gCunRO0z+U9zZaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790556915; c=relaxed/simple;
	bh=hRbcdhbw4jwDJ4vZ1WqKJ89XLwGszz8UGrUoxyMgsho=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rJfUTQeBfF/MASg+HasrGlFSot9ZGjX8gl+t8jjHVMRizy9mOIYaG6QaPOcFfySBDw/79xCLrpwmtJoR5Pz2SWfXfpRWcV5P3oHZivuqM7kUas+00ZqDGT37Dcy1keEU7eBunnd4qtUC62MDQm22aQqk5wogPnb5wL6FHEf2mxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inf.ufrgs.br; spf=pass smtp.mailfrom=inf.ufrgs.br; dkim=pass (2048-bit key) header.d=inf.ufrgs.br header.i=@inf.ufrgs.br header.b=P9d5DmEH; arc=none smtp.client-ip=143.54.11.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inf.ufrgs.br
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inf.ufrgs.br
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=inf.ufrgs.br header.i=@inf.ufrgs.br header.b="P9d5DmEH"
Received: from LAPTOP-R01LEAQM.localdomain (unknown [189.112.40.71])
	by smtp.inf.ufrgs.br (Postfix) with ESMTPSA id 17DBF12111B;
	Sun, 27 Sep 2026 21:54:49 -0300 (-03)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=inf.ufrgs.br;
	s=dkim2026; t=1790556892;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KRqeYdT+e92AT1sMf1n6YaU59DvHxp9vqjbSDGu7MUc=;
	b=P9d5DmEHWYLXyXHAj0RlY0xgn+LuEihBPj9sqsGHz4t27yjIZUPF2hj7cCUJEiMwWa7QWh
	NxMuX7TmQtgKoaPQE/otZjdXBXgpzGbYE1QW1sDzDcgEtxTjHqX7HNBgd5n5WYbgV+Sh9O
	KWnCnfTYjvAIMRL5sLu7XWesWeuFddAnCpYWJ73veZU1vx4zqqu77UJQZYJP1CLJxEgv8Y
	r4gul4JfN6XFJ9k7LKBiCtT7IC9uieyJLVnE3lUMpw7rCJls59Hw3woAtD94noWFlZLHk+
	ST38Vq079RUaUjtU43ma66tiJODp24BTtEHVjOStXarlhN9R1ZFSxkRPCOf6TA==
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
Subject: [PATCH 2/5] drm/vkms: support BGR565 writeback
Date: Sun, 27 Sep 2026 21:52:58 -0300
Message-ID: <20260928005301.367977-3-matheus.aalmeida@inf.ufrgs.br>
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

While BGR565 read is currently supported, the format code is missing
support for BGR565 write.

Implement argb_u16_to_BGR565(), add it to get_pixel_write_function()
and advertise BGR565 support in vkms_wb_formats.

Signed-off-by: Matheus Alves de Almeida <matheus.aalmeida@inf.ufrgs.br>
---
 drivers/gpu/drm/vkms/vkms_formats.c   | 12 ++++++++++++
 drivers/gpu/drm/vkms/vkms_writeback.c |  3 ++-
 2 files changed, 14 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vkms/vkms_formats.c b/drivers/gpu/drm/vkms/vkms_formats.c
index 6d7853e87..b44900761 100644
--- a/drivers/gpu/drm/vkms/vkms_formats.c
+++ b/drivers/gpu/drm/vkms/vkms_formats.c
@@ -672,6 +672,16 @@ static void argb_u16_to_RGB565(u8 *out_pixel, const struct pixel_argb_u16 *in_pi
 	*pixel = cpu_to_le16(r << 11 | g << 5 | b);
 }
 
+static void argb_u16_to_BGR565(u8 *out_pixel, const struct pixel_argb_u16 *in_pixel)
+{
+	__le16 *pixel = (__le16 *)out_pixel;
+	u16 r, g, b;
+
+	argb_u16_to_channels(&r, &g, &b, NULL, 5, 6, 5, 0, in_pixel);
+
+	*pixel = cpu_to_le16(b << 11 | g << 5 | r);
+}
+
 /**
  * vkms_writeback_row() - Generic loop for all supported writeback format. It is executed just
  * after the blending to write a line in the writeback buffer.
@@ -972,6 +982,8 @@ pixel_write_t get_pixel_write_function(u32 format)
 		return &argb_u16_to_XRGB16161616;
 	case DRM_FORMAT_RGB565:
 		return &argb_u16_to_RGB565;
+	case DRM_FORMAT_BGR565:
+		return &argb_u16_to_BGR565;
 	default:
 		/*
 		 * This is a bug in vkms_writeback_atomic_check. All the supported
diff --git a/drivers/gpu/drm/vkms/vkms_writeback.c b/drivers/gpu/drm/vkms/vkms_writeback.c
index ecf29a2c0..f64b90908 100644
--- a/drivers/gpu/drm/vkms/vkms_writeback.c
+++ b/drivers/gpu/drm/vkms/vkms_writeback.c
@@ -21,7 +21,8 @@ static const u32 vkms_wb_formats[] = {
 	DRM_FORMAT_ABGR8888,
 	DRM_FORMAT_XRGB16161616,
 	DRM_FORMAT_ARGB16161616,
-	DRM_FORMAT_RGB565
+	DRM_FORMAT_RGB565,
+	DRM_FORMAT_BGR565
 };
 
 static const struct drm_connector_funcs vkms_wb_connector_funcs = {
-- 
2.43.0

