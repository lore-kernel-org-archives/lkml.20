Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794723088;
	b=jR2bCom167HOgrIEKxoe+4ESCwgSwPfB9Xg8Id6BmLkZkseSXc1n23ihlDtYr1LU3cA5
	 IcjBZe9j/PDllgxnwXVqW/IplYEVmQVlDilnDfj8iOY1ncJ/htp0LyvMflBSvL1vZeWdE
	 kcO+t22q7KYX6JHNcXJN+g424/WrRJL2TRQgScVRUxlfOr6vrPv/Czpt0OKB7lcyRcGdN
	 mpqSkymjlCeMvN9NeBE3KDPT/2viyCQ7wNtZzBerWH7U81p1kvJX929BQxmleh1cC9KAs
	 YX1YMcApoCYHPCDRmzEHtzXBa1xUnoFw78qr8wf9fYPEoHjryLEfQ4+9Hq/z7jxJw9Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794723088;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=bKP+aWmCnAOyzY6tYN5Sieibvo/NSg7cNkXShke5YqE=;
	b=kRevz24LrjkBPFHb4IfhFlwYQ4vsK0lxRQ/HxF+E75zzyryYtllPTFZ5Bo0D4qavSFGA
	 4sBA1lnAx7dqnGZ4qAufdjuNeeYHYKYvm4wWjcAaAED+aNLXuM1l1uXXQqaOsB+h41GR5
	 pa/GbosTTr9OvA0+qYDGCGLny4GK5eGuG3WeGN0RrmFrPPryRtjFr93DXzMHdHYEoYwxS
	 vzqWs1yWEowjJQXpWYbI1Eht3eC86pHPERjT6PtqlrMN3hEumLtpDAGI6tMKWXrr5GIMp
	 qHCDFfvD5ZbqAP1eFgZ6OJScGSHjEIp09mn6ftYTP7U8G84I27gf/jijScXgiJTWAPA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=b+Lhdg4m;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB86F606A8B4
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 06:11:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DB86F606A8B4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=b+Lhdg4m
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a35a60499eso14906045e9.0
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 22:11:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794723086; x=1795327886; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bKP+aWmCnAOyzY6tYN5Sieibvo/NSg7cNkXShke5YqE=;
        b=b+Lhdg4m/dcMm9HMsUKla5IAwKClyGKG9iG+iiAEbv/eH03xVtF6QnBKP0+p9IObQR
         j5v/TXJ1h7rRqBVSL+eicw255iAnOIdl++kGNKarPEm5Vua1qOWsZd9X0hTQnA6Yg/MR
         qcxwWvU2Y3SCQ7Zp4nINUZOt1R9+ETCO5HpaU8TjiXKyEMEQu/l5QSzCliddEmO1FD/b
         AjaC2V6d7vibg4hoXndn6ZyiKPbZ3GChLe0hU3vLqCLQv1Dwr0Hpg6vXEiBv1HYa3eXK
         hRWsb5IqVRPqcXFA+fe8/t51JC1mMctaTV0x6+UJXA9oa3TbLWFGP56Y4RStVfnQPMDc
         bXRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794723086; x=1795327886;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bKP+aWmCnAOyzY6tYN5Sieibvo/NSg7cNkXShke5YqE=;
        b=m+N+AwjRKXa7L6lEDXvHq7vJ/Ua1WQeeufKym/T2ebt8SSrEXXLQoOruO3QO4+SB50
         jh/V7wX6cStARM9iGxhP0uQykCpuDwASZJ2zSEC8QEaOyHMxj8DUT8/RKEvGbtPpJtfN
         OPxz3LI5wktNiLeKugUzqMZCVYcjTM8PjqXTrhDfZWBu+83eoXGuWoOhhoHBRP27FTBa
         r3h+moXi8AT40MGHOCWji8gwn1z7Im17N42F1WxvKfg7NT7kEl3METAsjtND4aycctZr
         z4huyhXhBJjCOfN9jeDcDnxACn060pMVQIpTl2npo7ain9PB8f4EXFpfnRf34DoLCSRt
         b7Mg==
X-Forwarded-Encrypted: i=1; AL+hErFDIleTmjtsmq2bmANh3DwQNhQJLpE+sobEM2mjqH/jkuuI/poVhRcjfMaUpR23EEmonj0ch0DEsDDMt4w=@vger.kernel.org
X-Gm-Message-State: APuU4Z8bNtsaJdEdNkixTnOxSloC7jkQRT97AcSPHp0RBMpF4KCbO237
	GCQJ47fTudLn9kDqZlyjbF9uk8dIkj2VcjbIL6RqoWBMaADCH6cBml1b
X-Gm-Gg: AYBFou0lL8wrIIjed/C2+bmJrSVuxodA4vFrOnqr3qAOTLWLuh7dKroser4sr3qxVI7
	hBNXIeB8OpnZhx2k1Uj6vShiuJonKEmejWh0flT87bhBpzRzhHuBVgc6yT6mf03hkgosUiBKzdo
	LLUAZLTMqTUJ3vs7ws7LW7GqD/4fmhgblnIBlCFZ4T3EKBQvLcSn3SzJMoHppXREE0VfzJnsGjk
	qtE7F3ObtVXwCh+Ng2TFMxFzs2a5RK7yBL0xj9+EkZe2FT9SrXj5YJ2Tjo9QnLeYjygjXhld7Fo
	CTe2GMER9UKOPrbu7H8990WskJdI2R2S6yHh1ABWikOT+UEFq20leRwm/uvV2dsLdUUNmFrLeis
	EHv0GBrZuqXvM9S+engQVZq8y6WpRDHAqqAHhBoUzbNOpEmUBYEnHUla8HGpoKfhlTVpYOsoFNI
	qNMXdAngTrOu+kNrTQBLkA5pRCJv5uLK90BMQjTRiq0+Nz07XMPr7y62tpMHjBaPhmkKW0auTuU
	DAzSSV7HWcPGio2xMr6I+rTrv1ZmLLAX02u+YXnQUxQEBg+f+QkQEJnbrjw91ZtZzkNcbeOXn/j
	h6c6RoIvlGT04H8UllD0RVFYIWU/ENkj+gWuaB/uuUr9xdSUIpEcXheXljmxohHnoAHuUZHpEb9
	3OMbZvB0O/jtYYrUk33dQ5A3x8EZekX8MY+oRP4B0MqRWsgGo1J3dNuC1ZYKQ8gVhqWhzRHb4lb
	nUI22CAOEE7GbRrec1jKxB8M4mgxezrjOOkuwo3KvcYFbob8G/if+xEjBMwCQuqAjuBFQSrbW9m
	W83mvucNsUy1w==
X-Received: by 2002:a05:600c:3487:b0:4a2:526b:d410 with SMTP id 5b1f17b1804b1-4bb55a4f1b4mr151025935e9.13.1794723086291;
        Sat, 14 Nov 2026 22:11:26 -0800 (PST)
Received: from jernej-laptop ([2a00:ee2:6a02:9300:bb69:6bcf:1b11:e85b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb5ba25b50sm139331075e9.14.2026.11.14.22.11.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 22:11:25 -0800 (PST)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: Chen-Yu Tsai <wens@kernel.org>,
	Samuel Holland <samuel@sholland.org>
Cc: mripard@kernel.org,
	maarten.lankhorst@linux.intel.com,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	bmasney+clk@redhat.com,
	jbrunet+clk@baylibre.com,
	sboyd@kernel.org,
	Andre Przywara <andre.przywara@arm.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: [PATCH v3 4/8] drm/sun4i: vi_layer: Limit formats for DE33
Date: Sun, 15 Nov 2026 07:10:58 +0100
Message-ID: <20261115061102.229680-5-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261115061102.229680-1-jernej.skrabec@gmail.com>
References: <20261115061102.229680-1-jernej.skrabec@gmail.com>
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

YUV formats need scaler support due to chroma upscaling, but that's not
yet supported in the driver. Remove them from supported list until
DE33 scaler is properly supported.

Reviewed-by: Chen-Yu Tsai <wens@kernel.org>
Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/gpu/drm/sun4i/sun8i_vi_layer.c | 72 ++++++++++++++++++++------
 1 file changed, 56 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
index 6b19fafd50ad..09d94f7f9977 100644
--- a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
@@ -380,6 +380,33 @@ static const u32 sun8i_vi_layer_de3_formats[] = {
 	DRM_FORMAT_YVU422,
 };
 
+static const u32 sun8i_vi_layer_de3_no_yuv_formats[] = {
+	DRM_FORMAT_ABGR1555,
+	DRM_FORMAT_ABGR2101010,
+	DRM_FORMAT_ABGR4444,
+	DRM_FORMAT_ABGR8888,
+	DRM_FORMAT_ARGB1555,
+	DRM_FORMAT_ARGB2101010,
+	DRM_FORMAT_ARGB4444,
+	DRM_FORMAT_ARGB8888,
+	DRM_FORMAT_BGR565,
+	DRM_FORMAT_BGR888,
+	DRM_FORMAT_BGRA1010102,
+	DRM_FORMAT_BGRA5551,
+	DRM_FORMAT_BGRA4444,
+	DRM_FORMAT_BGRA8888,
+	DRM_FORMAT_BGRX8888,
+	DRM_FORMAT_RGB565,
+	DRM_FORMAT_RGB888,
+	DRM_FORMAT_RGBA1010102,
+	DRM_FORMAT_RGBA4444,
+	DRM_FORMAT_RGBA5551,
+	DRM_FORMAT_RGBA8888,
+	DRM_FORMAT_RGBX8888,
+	DRM_FORMAT_XBGR8888,
+	DRM_FORMAT_XRGB8888,
+};
+
 static const uint64_t sun8i_layer_modifiers[] = {
 	DRM_FORMAT_MOD_LINEAR,
 	DRM_FORMAT_MOD_INVALID
@@ -395,6 +422,7 @@ struct sun8i_layer *sun8i_vi_layer_init_one(struct drm_device *drm,
 	u32 supported_encodings, supported_ranges;
 	unsigned int format_count;
 	struct sun8i_layer *layer;
+	bool yuv_support = true;
 	const u32 *formats;
 	int ret;
 
@@ -410,8 +438,18 @@ struct sun8i_layer *sun8i_vi_layer_init_one(struct drm_device *drm,
 	layer->cfg = cfg;
 
 	if (layer->cfg->de_type >= SUN8I_MIXER_DE3) {
-		formats = sun8i_vi_layer_de3_formats;
-		format_count = ARRAY_SIZE(sun8i_vi_layer_de3_formats);
+		/*
+		 * TODO: DE33 drivers doesn't support scaling yet, which is a
+		 * requirement for YUV support.
+		 */
+		yuv_support = layer->cfg->scaler_mask & BIT(phy_index);
+		if (yuv_support) {
+			formats = sun8i_vi_layer_de3_formats;
+			format_count = ARRAY_SIZE(sun8i_vi_layer_de3_formats);
+		} else {
+			formats = sun8i_vi_layer_de3_no_yuv_formats;
+			format_count = ARRAY_SIZE(sun8i_vi_layer_de3_no_yuv_formats);
+		}
 	} else {
 		formats = sun8i_vi_layer_formats;
 		format_count = ARRAY_SIZE(sun8i_vi_layer_formats);
@@ -443,22 +481,24 @@ struct sun8i_layer *sun8i_vi_layer_init_one(struct drm_device *drm,
 		return ERR_PTR(ret);
 	}
 
-	supported_encodings = BIT(DRM_COLOR_YCBCR_BT601) |
-			      BIT(DRM_COLOR_YCBCR_BT709);
-	if (layer->cfg->de_type >= SUN8I_MIXER_DE3)
-		supported_encodings |= BIT(DRM_COLOR_YCBCR_BT2020);
+	if (yuv_support) {
+		supported_encodings = BIT(DRM_COLOR_YCBCR_BT601) |
+				      BIT(DRM_COLOR_YCBCR_BT709);
+		if (layer->cfg->de_type >= SUN8I_MIXER_DE3)
+			supported_encodings |= BIT(DRM_COLOR_YCBCR_BT2020);
 
-	supported_ranges = BIT(DRM_COLOR_YCBCR_LIMITED_RANGE) |
-			   BIT(DRM_COLOR_YCBCR_FULL_RANGE);
+		supported_ranges = BIT(DRM_COLOR_YCBCR_LIMITED_RANGE) |
+				   BIT(DRM_COLOR_YCBCR_FULL_RANGE);
 
-	ret = drm_plane_create_color_properties(&layer->plane,
-						supported_encodings,
-						supported_ranges,
-						DRM_COLOR_YCBCR_BT709,
-						DRM_COLOR_YCBCR_LIMITED_RANGE);
-	if (ret) {
-		dev_err(drm->dev, "Couldn't add encoding and range properties!\n");
-		return ERR_PTR(ret);
+		ret = drm_plane_create_color_properties(&layer->plane,
+							supported_encodings,
+							supported_ranges,
+							DRM_COLOR_YCBCR_BT709,
+							DRM_COLOR_YCBCR_LIMITED_RANGE);
+		if (ret) {
+			dev_err(drm->dev, "Couldn't add encoding and range properties!\n");
+			return ERR_PTR(ret);
+		}
 	}
 
 	drm_plane_helper_add(&layer->plane, &sun8i_vi_layer_helper_funcs);
-- 
2.43.0

