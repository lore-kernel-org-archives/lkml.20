Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.251.105.195
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793996351;
	b=4B+tvlLU5SlPQ/funmAglWRCe+OmXfXPnClU8gWGIt5FEgozUGXf6L37nWNX9xZ2PAzO
	 YqsyxkPFrxn7/ERM1aleS2RKZLfjlrWMKYLsYLYTjrw+tqvZJ/m/Bd/+OSJ7PgOpSWFGI
	 DkXIpZqO8rRRLcMrgHFS8AXtYqE+EFds3xdWyNcKDG7B7kQtzkT91OsmQVMnIjWUO0Z3f
	 uoLaLhiizN4AAzUzy3NkxMrH0lwTo1hJHVj8yOF0PdOvi2UnuQaq87kLAatGE3qslFEK7
	 nAN9fMe9KNOnb0OGWEIPeBmDLj11t0l0ncx+leh/Vl3GCa5Wv25Ru9inc9MH55jqZKw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793996351;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=dJp15xE7vH/rnQ5hzAO7wS5KPC4GSC5TAQix7sSJLl4=;
	b=m8snGbUmq8bNZGF+V4tdb95ZBr2qhWhqpTYhCWcUzc/Tjr9+C3rr7Lf60thnImOzozhc
	 51ExASt2XjxFpCLm/sMCX9AnqbgeoEGbUhXhHwcaqX8+bXcNXdvyj8B+D8bAaqsoXYZ0u
	 GcAD0T9sn+2BmpkqtZv0mK0dxVeG/ZTQ2hGpYcKarfu5+WsOs+dVGvVAas2uLgBhNNIYz
	 qnH46NNX8vllEjCtJku59fySGGLAn2fOO+rFetqIuQSTg2KcYixdurslN0i6+TKTJMQJW
	 5xEsAfSch4/Lm8ZwTk6Q7iBb7/pJl/K7yrYz77kECZnUyVisMwtPD3dyC9oZyql3zRQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=ljobCUNp;
	arc=none smtp.remote-ip=148.251.105.195
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04182606A32C
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 20:19:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 04182606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=ljobCUNp
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1793996349;
	bh=I+apwHNvDJ9qzV547nI9iSVA0rcQuBlDAab2hFi4Omw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ljobCUNpLhrLdQFhdiUNZplL8k6j9eFU20waLtDpbEUAf7DZX3hMP5OMF5KpaCC0k
	 iNowMxP8v7Aw4LyPAYtVqJwN+RZBkusFgu9j8BBkIP7ShdOpg+EXgvKTl31fgc8TJH
	 nNpo64HErYHGwgNUJPvjNUdit/uHj8GnVsLLkElOoneKNArtWmVjmQe7IxH24JF00E
	 R7tFVW/UvHJTsua7fChGeCcZZRaL+HvnJvE4ywCJ/zjDP8ImTTJMMVjwHToyPCmFp6
	 4mTKWbSw6Y7K9/ag6LIxX6Lf5J6tPyMvqmY5S/KmX/pAE1b6bbMVqPYgOWAsvxq32u
	 VCC5mlYpGsrKA==
Received: from archlinux (unknown [100.64.1.80])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: leandrohrb)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id EE28217E0885;
	Fri, 06 Nov 2026 21:19:04 +0100 (CET)
From: Leandro Ribeiro <leandro.ribeiro@collabora.com>
To: louis.chauvet@bootlin.com
Cc: airlied@gmail.com,
	alex.hung@amd.com,
	daniel@fooishbar.org,
	hamohammed.sa@gmail.com,
	harry.wentland@amd.com,
	maarten.lankhorst@linux.intel.com,
	melissa.srw@gmail.com,
	mripard@kernel.org,
	pekka.paalanen@collabora.com,
	robert.mader@collabora.com,
	simona@ffwll.ch,
	tzimmermann@suse.de,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 06/12] drm/vkms: improve the way in which we access LUT member
Date: Fri,  6 Nov 2026 17:18:07 -0300
Message-ID: <20261106201813.129911-7-leandro.ribeiro@collabora.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261106201813.129911-1-leandro.ribeiro@collabora.com>
References: <20261106201813.129911-1-leandro.ribeiro@collabora.com>
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

apply_lut_to_channel_value() indexes a struct drm_color_lut array, and
then cast to (__u16 *) and index with the channel (r -> index 0, g ->
index 1, b -> index 2). This is a bit fragile and prone to issues.

Instead, add a more robust helper lut_channel_value() such that, given a
struct drm_color_lut and a color channel, it retrives the value.

Reviewed-by: Robert Mader <robert.mader@collabora.com>
Tested-by: Robert Mader <robert.mader@collabora.com>
Signed-off-by: Leandro Ribeiro <leandro.ribeiro@collabora.com>
---
 drivers/gpu/drm/vkms/vkms_composer.c | 30 ++++++++++++++++++++++------
 1 file changed, 24 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/vkms/vkms_composer.c b/drivers/gpu/drm/vkms/vkms_composer.c
index 0fc915a954ba..b4a433be1b2d 100644
--- a/drivers/gpu/drm/vkms/vkms_composer.c
+++ b/drivers/gpu/drm/vkms/vkms_composer.c
@@ -75,6 +75,24 @@ VISIBLE_IF_KUNIT u16 lerp_u16(u16 a, u16 b, s64 t)
 }
 EXPORT_SYMBOL_IF_KUNIT(lerp_u16);
 
+static inline u16 lut_channel_value(const struct drm_color_lut *lut,
+				    enum lut_channel channel)
+{
+	switch (channel) {
+	case LUT_RED:
+		return lut->red;
+	case LUT_BLUE:
+		return lut->blue;
+	case LUT_GREEN:
+		return lut->green;
+	case LUT_RESERVED:
+		DRM_DEBUG_DRIVER("LUT_RESERVED channel should not be accessed");
+		return 0;
+	}
+	DRM_DEBUG_DRIVER("unknown LUT channel");
+	return 0;
+}
+
 VISIBLE_IF_KUNIT s64 get_lut_index(const struct vkms_color_lut *lut, u16 channel_value)
 {
 	s64 color_channel_fp = drm_int2fixp(channel_value);
@@ -86,8 +104,8 @@ EXPORT_SYMBOL_IF_KUNIT(get_lut_index);
 VISIBLE_IF_KUNIT u16 apply_lut_to_channel_value(const struct vkms_color_lut *lut, u16 channel_value,
 						enum lut_channel channel)
 {
+	const struct drm_color_lut *lut_y_floor, *lut_y_ceil;
 	s64 lut_index = get_lut_index(lut, channel_value);
-	u16 *floor_lut_value, *ceil_lut_value;
 	u16 floor_channel_value, ceil_channel_value;
 
 	/*
@@ -96,15 +114,15 @@ VISIBLE_IF_KUNIT u16 apply_lut_to_channel_value(const struct vkms_color_lut *lut
 	 */
 	static_assert(sizeof(struct drm_color_lut) == sizeof(__u16) * 4);
 
-	floor_lut_value = (__u16 *)&lut->base[drm_fixp2int(lut_index)];
+	lut_y_floor = &lut->base[drm_fixp2int(lut_index)];
 	if (drm_fixp2int(lut_index) == (lut->lut_length - 1))
 		/* We're at the end of the LUT array, use same value for ceil and floor */
-		ceil_lut_value = floor_lut_value;
+		lut_y_ceil = lut_y_floor;
 	else
-		ceil_lut_value = (__u16 *)&lut->base[drm_fixp2int_ceil(lut_index)];
+		lut_y_ceil = &lut->base[drm_fixp2int_ceil(lut_index)];
 
-	floor_channel_value = floor_lut_value[channel];
-	ceil_channel_value = ceil_lut_value[channel];
+	floor_channel_value = lut_channel_value(lut_y_floor, channel);
+	ceil_channel_value = lut_channel_value(lut_y_ceil, channel);
 
 	return lerp_u16(floor_channel_value, ceil_channel_value,
 			lut_index & DRM_FIXED_DECIMAL_MASK);
-- 
2.56.0

