Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6184511218
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 09:08:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788858496; cv=none; b=YDNyxNRluaq+UCS0WV/3IQBCR77beFx1mvCo5r/qBHsR35/AZUAi8/NnEnTZmO/3QTC+6fge1Q+voBibGhXvQAwAeNh2pUYqGAtFaYASD97yCWgT1dzazgkPz63XKtiV1VxPZmSyAbM+upJdw93Bf7QZNu0IhpFC7AyJZtdOXgc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788858496; c=relaxed/simple;
	bh=qJDTSQf3mOWj1wTBmShDO4bnN0jyzbEKQlcjgoU7YP0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=A+5IMaiUxYaFn0voD9ofKpms6KNE2rzC0rtH+ZeVjozbQwL8wH/bBfVGimxqvK/NDpelp9qwFHNO/PJTBPa1gwk3lbdNsdf7FM7jZip1QAJ2+wzJpLrxBv02OTH2Y3S4XSM27/aq2dHb2CKJ4PlBaWFXHZVrVDKxDZE/7NeyoU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=dw2D+4Rx; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="dw2D+4Rx"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-38d489b6b71so5015003a91.0
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 02:08:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1788858494; x=1789463294; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KZyOo+ygFnvVbouyZiGeNffeUNQ7tsTzDFqw1u+OtP0=;
        b=dw2D+4RxSgAAbjSIqrQeO8JCTJ7eGdQUkjzKiTTmyJMdugBKbXa8hP5ypaYq817CyY
         QYXtee0LTuell4gQ1aZB3iBQn7kJu4ulVQjHLIAqsyWa9JVeX1/MTnsRAFo1aLbQ3IO/
         glNsKXamPZTdEP+RCQSdVX1KKCdfEsSVhOUKs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788858494; x=1789463294;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KZyOo+ygFnvVbouyZiGeNffeUNQ7tsTzDFqw1u+OtP0=;
        b=Wh/K1adStvU99+zjQxVOYUjq/zOhrjL57Cj1+i1ekCbHlgMZI9QpBsPWtz0Q1Vki2l
         PwUuplqVAEUC2AfHrjIredkTB/jFo0wZXEY+CVS8f1XDPTrvGvZ1iRPJ6NUWjyR+RX3K
         yx0neWugkX+4vBW6jBKWwxXpuFqBAaasJ9dFzw9CZlCUj0g5hZLjIUV4cJU/0RtuX5zn
         jjtRViQpndBMxRl+glgbtwGUXBPaq4ijSa2HiYwXZURkCL5NvHqHTyVE6+Gqv5mbvhab
         zKmvLuvhwyZAkOPlwFIZhR1v1wNkT+ggHQEHfnWBRFzJ3/2sRRIZCoUsGcW1n9uPH7YU
         /wKQ==
X-Forwarded-Encrypted: i=1; AKwUvBwk7iZm0lD8u6aBv/BSPCJz1aVdS2UYmcglwry2/DNfEiNrfg176ElIt5fE39uqn15CdVN+Eg3LpkuyNN8=@vger.kernel.org
X-Gm-Message-State: AFuF++lVhhoHS7laKAclAUD3gi6m2z2XtRxPejSk3UpUb0vWypz+++vR
	ZHH3yRcrfPkwD3bprDpvaIBfWWcChN6hC9/QJCMJZCnmvLZTVUJJkpy+A+RictYF/g==
X-Gm-Gg: AYBFou3CXwDkA4w8kaK0/A83CJG+wKY5dvHoekHLalLMGH8tKIiZk38KD6dKlSExG1o
	WWUKruYDB2YId0pVhnn8Bcw1skcl+IGYC1bdPuhHY+RrdtZgUmrhjTTPikCehSue4GT/YlPTKMg
	/vC0S43ROxfx499ePA5MwF8IkW3+CS5gabpJg4YY66i8rUzmKufNIkqrZ/lODTzDzM5V2oBcxOi
	L1EV5bftR0FZRFYK061I2YwsQYpANx0Ow++H7dWe+HMQjxK0SCANFssTz9SHY2OHWbzs2uE7nSz
	k3Yrz1xqcYFM2fdYetwOtFWRvuf02MiUM6kUQUpMyn8MkO31TjH+hc7CmeOdnM5WpURInPP+HcU
	M+pLy2yksq0w+FPmz7tE0922Fw2H9CyaGECXN+SSydb8GIXolEgITHNocAulxuFAP4CvrUN8Lnx
	4ffvHmw7apFIs5hLv36Uo/e4pDHrA9V8BqzwJegMgrCtvrynAcYPeJzmMBejGGpbFYiw4xPo3qQ
	9cRYTvVXGFLhtEGm7N22q2ES9EbalA/57O/rQQABfTb9JE=
X-Received: by 2002:a17:90b:586c:b0:398:a2ed:7b5c with SMTP id 98e67ed59e1d1-39b2623ef65mr47890193a91.24.1788858493952;
        Tue, 08 Sep 2026 02:08:13 -0700 (PDT)
Received: from wenst-7875.tpe.corp.google.com ([2a00:79e0:201d:8:e541:8c2f:4ce9:823a])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b4b72f62esm19718804a91.5.2026.09.08.02.08.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 02:08:11 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Liu Ying <victor.liu@nxp.com>,
	Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
	Lucas Stach <l.stach@pengutronix.de>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	linux-sunxi@lists.linux.dev,
	imx@lists.linux.dev,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 4/4] drm/imx/dcss: plane: Switch to drm_fb_dma_get_gem_clipped_addr()
Date: Tue,  8 Sep 2026 17:07:43 +0800
Message-ID: <20260908090745.1089143-5-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.979.g7e5102b832-goog
In-Reply-To: <20260908090745.1089143-1-wenst@chromium.org>
References: <20260908090745.1089143-1-wenst@chromium.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The i.MX DCSS driver is open coding drm_fb_dma_get_gem_clipped_addr(),
with only a slight difference of rounding down the X offset for the
first plane if the format is packed, sub-sampled YUV. This is likely
to correct the buffer address to the first pixel of the 2-pixel group.
Otherwise the hardware will start the scan-out from the second pixel,
which leads to the U/V components getting swapped around, and the
chroma component of the next pixel group being used.

Switch to drm_fb_dma_get_gem_clipped_addr(), and offset the address by
a pixel if the X offset is odd.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/gpu/drm/imx/dcss/dcss-plane.c | 34 +++++++++++----------------
 1 file changed, 14 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/imx/dcss/dcss-plane.c b/drivers/gpu/drm/imx/dcss/dcss-plane.c
index 303e93fd036c..580d9cfb4053 100644
--- a/drivers/gpu/drm/imx/dcss/dcss-plane.c
+++ b/drivers/gpu/drm/imx/dcss/dcss-plane.c
@@ -219,28 +219,22 @@ static void dcss_plane_atomic_set_base(struct dcss_plane *dcss_plane)
 	struct dcss_dev *dcss = plane->dev->dev_private;
 	struct drm_framebuffer *fb = state->fb;
 	const struct drm_format_info *format = fb->format;
-	struct drm_gem_dma_object *dma_obj = drm_fb_dma_get_gem_obj(fb, 0);
 	unsigned long p1_ba = 0, p2_ba = 0;
 
-	if (!format->is_yuv ||
-	    format->format == DRM_FORMAT_NV12 ||
-	    format->format == DRM_FORMAT_NV21)
-		p1_ba = dma_obj->dma_addr + fb->offsets[0] +
-			fb->pitches[0] * (state->src.y1 >> 16) +
-			format->char_per_block[0] * (state->src.x1 >> 16);
-	else if (format->format == DRM_FORMAT_UYVY ||
-		 format->format == DRM_FORMAT_VYUY ||
-		 format->format == DRM_FORMAT_YUYV ||
-		 format->format == DRM_FORMAT_YVYU)
-		p1_ba = dma_obj->dma_addr + fb->offsets[0] +
-			fb->pitches[0] * (state->src.y1 >> 16) +
-			2 * format->char_per_block[0] * (state->src.x1 >> 17);
-
-	if (format->format == DRM_FORMAT_NV12 ||
-	    format->format == DRM_FORMAT_NV21)
-		p2_ba = dma_obj->dma_addr + fb->offsets[1] +
-			(((fb->pitches[1] >> 1) * (state->src.y1 >> 17) +
-			(state->src.x1 >> 17)) << 1);
+	p1_ba = drm_fb_dma_get_gem_clipped_addr(fb, state, 0);
+
+	/*
+	 * TODO fix address until helpers know packed, sub-sampled YUV format block size
+	 *
+	 * The buffer address for packed, sub-sampled YUV formats such as DRM_FORMAT_UYVY
+	 * need to be on the first pixel of each pixel group or block. Otherwise the first
+	 * pixel of the next pixel group is read and the U/V values get swapped around.
+	 */
+	if (drm_format_info_is_yuv_packed(format))
+		p1_ba -= ((state->src.x1 >> 16) & 1) * format->cpp[0];
+
+	if (format->num_planes > 1)
+		p2_ba = drm_fb_dma_get_gem_clipped_addr(fb, state, 1);
 
 	dcss_dpr_addr_set(dcss->dpr, dcss_plane->ch_num, p1_ba, p2_ba,
 			  fb->pitches[0]);
-- 
2.55.0.979.g7e5102b832-goog

