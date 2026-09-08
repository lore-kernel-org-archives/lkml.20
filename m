Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB246503BEB
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 09:07:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788858481; cv=none; b=T9oJB3CgiiARBoEO9L7f4WpIBOIVsW3M71V0n5PsyXg4rJ2fy48JcLUlMdYQeHqVYsDUR/LeEKr8DUpr67CacryqXEGVFHAqnclaX+e9s1PlLYbeeR21skPXdkXhhPW+9FJAgvZBwJOJVIVTuq7sCkPG2Y7yi7cxMRUjTcEGYGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788858481; c=relaxed/simple;
	bh=h38nWmHGokmgNrF8M7H1ZEOsIaWfmOwXRv9fJbwDAq0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=f6vO1nC88tCy+EsoNbuEcSrgpL2alQOOS+yxVmY8nAjFFq+UzZnMMbJtwSlPRDMZmxMLsKs0pc5X7OBNu7IrH15ZaI9KWZjmkBHu2Lz84188sWGZPNCclEI+xxhVneBbT9qJ4pTuVKohdxOxhSPezL837nRDucrOleCZiZG3xpY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=BQnjgMjb; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="BQnjgMjb"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2db59f54ccfso10163525ad.2
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 02:07:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1788858479; x=1789463279; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=htcWMQzzIdN2OMq/lgGMWw6WmNo5HAqJQi0+KH0X9Sk=;
        b=BQnjgMjbD86T/yCETa42VP+ODESR27OSsnSbZlAAMfxc/XlebaTeZKnPN0dvGrBuEj
         tDX4AMbUJbJYWvcWFTw2mp9JAGrW8HtiGYIcpwX2Lr84Frt88TrZlmkYKe8m7Xc5hO6F
         /pKWkIHRMQ0jcMt/vwx0fEyb9r1/q6JlbpYAs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788858479; x=1789463279;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=htcWMQzzIdN2OMq/lgGMWw6WmNo5HAqJQi0+KH0X9Sk=;
        b=J+OJU8lPoSk/7sXzWY41OuziR6RtNfEyEPbfbjIUaPz7ipQ2pJbpFkFqN9HV00d7Ei
         1mWA1EFi246qT9ZbuRoG/YbfwEuDPF/kLabJ/iXUq93eQTjV+ejav4W3fajBj+Ghn30q
         HOIoS6fd3VzI2LbhHxkdQZ5gMj41WCxU+ZoFBWDiy//VjpMyKCTHq7kUjJt2wbL6VJz8
         Ze29SGgltkT+U48kQ61NFtJM3nf+XDtjiGAMfs/2jqLnTD6opQYc5gWIBCgVPG+BTbdv
         FZHmAxImhde3ov9dMzfi5lUsy4vTqU6OaUR7YralWLiI+GecwvgmDEDVPr1kqT3FUWyP
         lFfg==
X-Forwarded-Encrypted: i=1; AKwUvBy3+Ot/Ef5DUro9/NP6tmez2N/u4mCXuqt6ZlQ0/nci2YV4IDmJj9S9nuHClaiSiGZigfbQ59CJX+4iIiM=@vger.kernel.org
X-Gm-Message-State: AFuF++mmHL1jPspg+KVc1rYTHtTGyFFhhuyih0PyZKGecPb7RXhlRrE4
	gE9u6+YpSiA8dhJJsGDFXbEgLljjTZIFmpOfHZG/kHIJpd2dyDXd0VQC0iSpmf7uDg==
X-Gm-Gg: AYBFou3Hd8UwJ4gHhvPV7Z01DzttCIyPN2eDFEz8qKPkN/gQ64ncTuRH4pAhesxmxGL
	xWIvc04CNOx78myMv6vTINfMCmp7Rctt3NVhFFY3YKGrNlh/YIoylOg5B3OWSwyXkQGb2WHhMs+
	9P58OidmGoHGFt7e2QYm5xfbY6spZjT4sqqqpY1IiY5gamFSDwcXtCoy1Y2+P02vLLRbDXYU/RE
	seKE0aMvb3cwSp/sMAMVXZHjuw6rn5LtnPNsl2GZji0KLAAx0HZJcJZXSJbBK6pin0thPeUROoT
	FDtAlrC51iwneRe8r+YlTDgtE0GXsPJKW2blvLWqblYmc99CcwVVJ+ISpx4xTJYIhefDKOw6RI3
	/Iy93reAclS3qht71bjG6URhapR19qRTeZx3z5M88UEkvZv5OUu6MPWGrqRrR57FW3NUfjG3XfP
	yOq4uUJ+al6Qgdr3d9q8SYsHoKhxB9azA9VlTlle4LUzc+9Ja0y4B6tYKzsmqX0kawVIE9Etqei
	NeGfh1cez3cIAELWufxurjLoNscet8uHXhbFTgftUNA+nA=
X-Received: by 2002:a17:90b:2784:b0:395:4de5:1054 with SMTP id 98e67ed59e1d1-39b26272bdcmr47233218a91.16.1788858479259;
        Tue, 08 Sep 2026 02:07:59 -0700 (PDT)
Received: from wenst-7875.tpe.corp.google.com ([2a00:79e0:201d:8:e541:8c2f:4ce9:823a])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b4b72f62esm19718804a91.5.2026.09.08.02.07.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 02:07:58 -0700 (PDT)
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
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH 1/4] drm/fb-dma-helper: Add drm_fb_dma_get_gem_clipped_addr()
Date: Tue,  8 Sep 2026 17:07:40 +0800
Message-ID: <20260908090745.1089143-2-wenst@chromium.org>
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

drm_fb_dma_get_gem_addr() returns the DMA address to the "unclipped"
framebuffer. However some display drivers want the "clipped" framebuffer
instead, as they are also using the clipped coordinates to program the
hardware.

Some of these drivers are open-coding drm_fb_dma_get_gem_addr() with
the source coordinates replaced, while others have been incorrectly
converted to using drm_fb_dma_get_gem_addr(), which would end up
causing incorrect parts of the framebuffer to be displayed if it were
somehow clipped.

Add drm_fb_dma_get_gem_clipped_addr(), a "clipped" version of
drm_fb_dma_get_gem_addr() for these drivers to use.

Cc: <stable@vger.kernel.org> # dependency for next patch
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/gpu/drm/drm_fb_dma_helper.c | 63 +++++++++++++++++++++--------
 include/drm/drm_fb_dma_helper.h     |  4 ++
 2 files changed, 51 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/drm_fb_dma_helper.c b/drivers/gpu/drm/drm_fb_dma_helper.c
index fd71969d2fb1..a260e7cd5667 100644
--- a/drivers/gpu/drm/drm_fb_dma_helper.c
+++ b/drivers/gpu/drm/drm_fb_dma_helper.c
@@ -59,20 +59,10 @@ struct drm_gem_dma_object *drm_fb_dma_get_gem_obj(struct drm_framebuffer *fb,
 }
 EXPORT_SYMBOL_GPL(drm_fb_dma_get_gem_obj);
 
-/**
- * drm_fb_dma_get_gem_addr() - Get DMA (bus) address for framebuffer, for pixel
- * formats where values are grouped in blocks this will get you the beginning of
- * the block
- * @fb: The framebuffer
- * @state: Which state of drm plane
- * @plane: Which plane
- * Return the DMA GEM address for given framebuffer.
- *
- * This function will usually be called from the PLANE callback functions.
- */
-dma_addr_t drm_fb_dma_get_gem_addr(struct drm_framebuffer *fb,
-				   struct drm_plane_state *state,
-				   unsigned int plane)
+static dma_addr_t _drm_fb_dma_get_gem_addr(struct drm_framebuffer *fb,
+					   unsigned int plane,
+					   unsigned int x,
+					   unsigned int y)
 {
 	struct drm_gem_dma_object *obj;
 	dma_addr_t dma_addr;
@@ -96,8 +86,8 @@ dma_addr_t drm_fb_dma_get_gem_addr(struct drm_framebuffer *fb,
 		v_div = fb->format->vsub;
 	}
 
-	sample_x = (state->src_x >> 16) / h_div;
-	sample_y = (state->src_y >> 16) / v_div;
+	sample_x = x / h_div;
+	sample_y = y / v_div;
 	block_start_y = (sample_y / block_h) * block_h;
 	num_hblocks = sample_x / block_w;
 
@@ -106,8 +96,49 @@ dma_addr_t drm_fb_dma_get_gem_addr(struct drm_framebuffer *fb,
 
 	return dma_addr;
 }
+
+/**
+ * drm_fb_dma_get_gem_addr() - Get DMA (bus) address for unclipped framebuffer,
+ * for pixel formats where values are grouped in blocks this will get you the
+ * beginning of the block
+ * @fb: The framebuffer
+ * @state: Which state of drm plane
+ * @plane: Which plane
+ *
+ * This function will usually be called from the PLANE callback functions.
+ *
+ * Return: GEM DMA address for given framebuffer, unclipped.
+ */
+dma_addr_t drm_fb_dma_get_gem_addr(struct drm_framebuffer *fb,
+				   struct drm_plane_state *state,
+				   unsigned int plane)
+{
+	return _drm_fb_dma_get_gem_addr(fb, plane, state->src_x >> 16,
+					state->src_y >> 16);
+}
 EXPORT_SYMBOL_GPL(drm_fb_dma_get_gem_addr);
 
+/**
+ * drm_fb_dma_get_gem_clipped_addr() - Get DMA (bus) address for clipped
+ * framebuffer, for pixel formats where values are grouped in blocks this
+ * will get you the beginning of the block
+ * @fb: The framebuffer
+ * @state: Which state of drm plane
+ * @plane: Which plane
+ *
+ * This function will usually be called from the PLANE callback functions.
+ *
+ * Return: GEM DMA address for given framebuffer, clipped.
+ */
+dma_addr_t drm_fb_dma_get_gem_clipped_addr(struct drm_framebuffer *fb,
+					   struct drm_plane_state *state,
+					   unsigned int plane)
+{
+	return _drm_fb_dma_get_gem_addr(fb, plane, state->src.x1 >> 16,
+					state->src.y1 >> 16);
+}
+EXPORT_SYMBOL_GPL(drm_fb_dma_get_gem_clipped_addr);
+
 /**
  * drm_fb_dma_sync_non_coherent - Sync GEM object to non-coherent backing
  *	memory
diff --git a/include/drm/drm_fb_dma_helper.h b/include/drm/drm_fb_dma_helper.h
index c950732c6d36..b2a0bd7ef9d0 100644
--- a/include/drm/drm_fb_dma_helper.h
+++ b/include/drm/drm_fb_dma_helper.h
@@ -17,6 +17,10 @@ dma_addr_t drm_fb_dma_get_gem_addr(struct drm_framebuffer *fb,
 				   struct drm_plane_state *state,
 				   unsigned int plane);
 
+dma_addr_t drm_fb_dma_get_gem_clipped_addr(struct drm_framebuffer *fb,
+					   struct drm_plane_state *state,
+					   unsigned int plane);
+
 void drm_fb_dma_sync_non_coherent(struct drm_device *drm,
 				  struct drm_plane_state *old_state,
 				  struct drm_plane_state *state);
-- 
2.55.0.979.g7e5102b832-goog

