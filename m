Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F1C42EEE86
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 05:02:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788843763; cv=none; b=IBGptfIfW96wTWaRECAqgDqjqgqgQkLETsKBwiM2ySbTZi/8rYFUusbrZVO2L57cG/AUysNFlF1oMudFcUeWTfSLCn2t6fdgrnal4KNc9IW28k2irMCtM+mENUA6qpUm+7PHOhrwF/4Cmi6qJbCgfOqxvOF11oIwKxkiVRjyIOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788843763; c=relaxed/simple;
	bh=9Gz680K5QSslTUHGxRWjVgzzejSc0xlqkZhFGg8h0K0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SPvamSRRW6OEO6nUWniIAt7StAvB3S5+wYO3cWlzGAZZ3dpkbIudhYBxyLWa/slE71/A9btmTsGCun5Yo6eaxvHiV+bK7ekKmSJ6WcJCBtCiyB6WBsz8PkE+j7b5IrhYME5KjFSCYmxcmc91EMOU65uMre8L/ZAuzDrsTNlzhhs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=nUig8c/B; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="nUig8c/B"
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-cb5b8572b70so3971749a12.2
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 22:02:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1788843761; x=1789448561; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Q5Plj4uGj3BvxxxoyuAGWT0KJk9RqOTiZJAPsoPxBFY=;
        b=nUig8c/B2GPd6/HtcgXxxbrSKUCV0Tvx0EGmWoP/AFc095diJFjNQy6KdD6WeVrMNz
         3/50KXyFO7jGFyM5xk4EoQuI2zmvcGtMkX+T/XB67/+hxeU/7IqffdsoH7fHIqxu2oO1
         rOA3GynEYU2oUv7Xxyy3lvw5Lr83eGDjUy8mg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788843761; x=1789448561;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Q5Plj4uGj3BvxxxoyuAGWT0KJk9RqOTiZJAPsoPxBFY=;
        b=F8E6ECsM3QJjrHLiNy4jdYS3V8eh7OCqeoffqGitiNCBg+QK8gTgVg469BRcbZ7HDA
         0aZDvAJqNeJwWVi6plhl00UHU6VXhpgrZFHVmKUerto+89IkkIex8Oi1AZCyw82f17un
         dfHu9pQw9NeeoF+fjvWCshNQe6sJfxpvxlKBhJsKxos8NR0casMWAzRxYkJtIIV0mXiZ
         ffPhhH/RlsSYfNSF35ua8I+mLuvZen3TxSV0+gI8Aqr0Ohb+q7brp1nTKi6BHCj2ohRF
         +g7GWxoEQGpHVEECV8YmqViGvtvU5Q4g35N5OA04hYHQDWt1pqh6GS0jqoYg1WIFyrXI
         lm1g==
X-Forwarded-Encrypted: i=1; AKwUvBymJBjaByWQUax7Aetbjm3JBUtXAiJVxZlnmsV2y49Cp+/yZ4x7GTuam+hiCJtUnifGHA2O8IrXoqnM7t0=@vger.kernel.org
X-Gm-Message-State: AFuF++nG6Bg2gxAwv0HjCZMTG2ec9CbAF+ART3sHnXRcZJmUJLcJlmm2
	aztnU4/ye9Kyj/wY22R/ra0u2C0XGxliM20/PA8xDyk1TuX7RSb5vLnDXIurgOO8sA==
X-Gm-Gg: AYBFou1FUEJyMEfHIghdSAwgiLxSpEqA0lr/V1ed4PB7LX5UlUC1RNtRIIFif75ts5v
	SP6Us0RVC0d9xDzp/SBdx99bH1x6I3S5NeXPC5OPkLE8BYIdWHCKh2zyoFWb0ZsjTinQBGRfLEY
	ayMFq8ZuYk6u98ysAxWUp1Z7rRkxraoNr++9GlWeJp9Bol1HNZ9nhOIko1AVQKnKZ3f1CZB8NsX
	W5vJteVnAX1L98BOWESljhqlg4oLGNf7tEoIunLB0VnGSPKYkYeDPhuuBuAEW3vfbPJqSNE5Kw2
	uXxJpX/Fm/VGTEvpeZWKl4abnI6w2MPQueNHt/gpuiYdttmlTkgkm0kNakNSusE7/9sxBJ2edKU
	VL9lDEpUZwpocK1V2X1KQbq5IFsns/Bz7q2YvouNpEyJqBRmr12z2cVGlD4mhiFaW1bWimvM8Q1
	r7420ELAzbohFUrzh3sEmLLn8/wmkvyNIQsdD6R8Ctr6t7gv2OmxfDmggtgE83gLt/i3gskjmqZ
	anr/G8y68u/pcVre/TK6+STYfuvzRMMsEroYsJ7sCPspZ0u/N/eT2kTwA==
X-Received: by 2002:a17:90b:4fcb:b0:381:a766:efcb with SMTP id 98e67ed59e1d1-39b26100e5dmr38830828a91.4.1788843761523;
        Mon, 07 Sep 2026 22:02:41 -0700 (PDT)
Received: from wenst-7875.tpe.corp.google.com ([2a00:79e0:201d:8:e541:8c2f:4ce9:823a])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b813fb4ddsm6342730a91.10.2026.09.07.22.02.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 22:02:40 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	dri-devel@lists.freedesktop.org,
	linux-sunxi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH v2] drm/sun4i: Align VI buffer addresses for subsampled formats
Date: Tue,  8 Sep 2026 13:02:28 +0800
Message-ID: <20260908050229.754977-1-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.979.g7e5102b832-goog
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit 79ac1c945ab8 ("drm/sun4i: layers: Use drm_fb_dma_get_gem_addr() to
get display memory") dropped the code to calculate the framebuffer's DMA
address in favor of drm_fb_dma_get_gem_addr().

This turned out to be wrong in a couple ways. The hardware can handle
pixel offsets within a sub-sampling block, but the buffer address must
start at the beginning of the subsampled block for all planes. The
hardware then does the interpolation internally. However the helper
gives the address exact pixel for luma, which messes up the result.

Instead of reverting the commit, calculate the intra-block offset and
adjust the buffer address so that it points to the start of the block.

Fixes: 79ac1c945ab8 ("drm/sun4i: layers: Use drm_fb_dma_get_gem_addr() to get display memory")
Cc: <stable@vger.kernel.org> # 7.1+
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
This is an alternative to Jernej's original revert:
https://lore.kernel.org/all/3980ea1aeb3f7fe8b4700e36560deeba3d050664.1785772659.git.jernej.skrabec@gmail.com/
---
 drivers/gpu/drm/sun4i/sun8i_vi_layer.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
index 2e9cda45c04e..185e9e5211c1 100644
--- a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
@@ -207,6 +207,20 @@ static void sun8i_vi_layer_update_buffer(struct sun8i_layer *layer,
 		/* Get the start of the displayed memory */
 		dma_addr = drm_fb_dma_get_gem_addr(fb, state, i);
 
+		/*
+		 * The mixer can handle odd offsets into sub-sampled YUV
+		 * planes, but needs the address of the first pixel in each
+		 * sub-sampled block. Adjust the luma buffer address backwards.
+		 */
+		if (i == 0) {
+			u32 x_diff, y_diff;
+
+			x_diff = (state->src.x1 >> 16) & (format->hsub - 1);
+			y_diff = (state->src.y1 >> 16) & (format->vsub - 1);
+			dma_addr -= y_diff * fb->pitches[i];
+			dma_addr -= x_diff * format->cpp[i];
+		}
+
 		/* Set the line width */
 		DRM_DEBUG_DRIVER("Layer %d. line width: %d bytes\n",
 				 i + 1, fb->pitches[i]);
-- 
2.55.0.979.g7e5102b832-goog

