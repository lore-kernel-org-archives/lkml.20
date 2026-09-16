Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C94E93B19B9
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 03:33:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789529639; cv=none; b=PVQhmJ6DcUxAv+aafvW83XbpEafxz7scITs2LJRMTuSOJN5DF1yeFB3/EDD1owHwKUFJZjh1DN+1s2oSSqmvJSPrqstAtQP+Ix06Ho4g602nVKWH/sT0nzHROAqr2K6CZ+ibNVDP7uggZYb2fpAesTW02BySKhow+vrn8Lqm8XY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789529639; c=relaxed/simple;
	bh=XSW9igf1s/bJdUF9oLEzsVWFCgbqu1FOjjmLMSk9d1c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sdOy9AyLPEXqrgvdUr+94RAenZnI9UIRdBIKNwnCsbU0VcFhZ49oM3TjCm4NixkO3Zf7ny2yw9PtRJiIaF5yqIMrCOVVBzHrwi3henQwHTefYBkNOFG4ob0K9a+jod2TQhFqN3EPJ12Q2Fe60ebYfO+5rtI6e/0VwlYFFkByExY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=ktpLK7lj; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ktpLK7lj"
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2d8fbef5018so5082145ad.0
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 20:33:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1789529637; x=1790134437; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kBFRPVKNIBD0KQtZ9pcxiREtmRb8PGXwbQL+UCfrWrI=;
        b=ktpLK7lj8sPrUXdQkdDMXfqONRmX/I0dGvYQ0aovXakXJZEXWn59gJhDYuPtoQuPoE
         /DSaZObWybgdZYgQVN2hyjc+4HHPNUPaxbkQkVZuLxB6IFjkgAvfKpS3jZgXCHLHU3kt
         B/rR51I6jfmH40k1mLCo4hpYf2fbnwlcAdSOc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789529637; x=1790134437;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kBFRPVKNIBD0KQtZ9pcxiREtmRb8PGXwbQL+UCfrWrI=;
        b=LRHNvKZzNhl9KvQE2IcXoW4w9w1/TAIrj0eZy3C0s+HLs+A+WO0ds5xABVHLju9OpH
         OChRCSGuFEhDUySU5kk0pusJSxTGhTjlXHWd5h+v2mC47YpE0yCkbeAazRQseGn04UiI
         lrv+mQYfvNMDN+R5VCJm+knk97eoNcLe86ptLalNJLIeHps9iwQl5Q5cbB/P/LJbp8nZ
         AD/Lxa+wGAjKDVohH9Ccs8uH71TOLlcvxhWdvA4hJ2QdmKJw+/YPaFbeogxM4sOplBX8
         FP3SABV1PLDV8LcKE8hMy9+Dv/bAaw9JKdk3Ssbx7U4ZIrgd/nqhfSUVW9XLdJB1v4Dj
         M3VQ==
X-Forwarded-Encrypted: i=1; AKwUvBxIYRvWnc6iD0QN3SM4PuP/T8QNf9ER+E0sGTOGy23cD/M5+HSM3/GX1Z7fBX4EKKfWLqUCwy3AmeCtEwg=@vger.kernel.org
X-Gm-Message-State: AFuF++mL+4kw352GlHqgnj4BQHYt3GliBljwvoVahwpspZIOF4c9ApRB
	5eGg/mHHFpk1JCNUOw9Q9TZUQIxc2Xn7/DIVG6LTfvIgR62578+vA26mJA6Kf9+wEw==
X-Gm-Gg: AYBFou3X05mBRV9o7qneD14/qTT7OIDPWTZXCVk1zEQna36TPi9HIqKD6WMB7IVcMcB
	R90QrpqQtJdJGHr7XtgbUttuqNoMWPhjmRoT52L45V1kVFnjGA5b4NYb7lhGiZB4Y35rAB05cxT
	MtJY2ti3w/ZlcxrlL8TlBzZRkAUUzDm34snWKDJzK+xRqQgWCu5n5wP2M64dbGuw94ut+Tc+rSJ
	fqP6IE0RGyh18/idE4v7Aj1xgqBQY9GvOJtyGKNkrdLdnwiMMSIcvVLZu+6h1tcL72ipmxG2OwG
	Iet4V/ADfXxNaZZfURtWr8y/hwEydwrlRDyJR/ZmtDCw6PKowbl9IgqASbWw2dR6kuIJzCXmR1s
	0AcEFvvj+m2bmnvRiQo1AY0X6pZ9euwqNYNbRJm7hdLJbyVHrVgg3vy9RwTgw4M5oTL5tw6pFfc
	AAeKyrNyqqRrEcNAfcwXiSF1+q/XSOdewQAnl7x42IPc1K9hf5QOrYd0cJ5rttedj6C9Y73V2mv
	d4DSUcaJn/O23Ed1qH1URJ+CU/E87BOl9HDiCpoJ/qlu6cFUZSWEXuErg==
X-Received: by 2002:a17:90b:4c49:b0:39d:fd60:caba with SMTP id 98e67ed59e1d1-39e1e485dddmr2368694a91.14.1789529637188;
        Tue, 15 Sep 2026 20:33:57 -0700 (PDT)
Received: from wenst-7875.tpe.corp.google.com ([2a00:79e0:203d:7:1f62:7622:5d61:2578])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e1bbe3e62sm1833477a91.10.2026.09.15.20.33.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 20:33:56 -0700 (PDT)
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
Subject: [PATCH RFT v2 5/5] drm/imx/dcss: plane: Switch to drm_fb_dma_get_gem_clipped_addr()
Date: Wed, 16 Sep 2026 11:33:26 +0800
Message-ID: <20260916033327.3054126-6-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.1032.g73a4cd73de-goog
In-Reply-To: <20260916033327.3054126-1-wenst@chromium.org>
References: <20260916033327.3054126-1-wenst@chromium.org>
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
2.55.0.1032.g73a4cd73de-goog

