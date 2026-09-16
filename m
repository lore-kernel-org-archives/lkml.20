Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC7331E5B9F
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 03:33:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789529627; cv=none; b=SGrPQA2R7AHye2kVXyUQwVkoXUw7wb5UsO4s6do2CShANzxp8j2oQkJIjN32ZucyNthVJHq5eynaIFJkZCNZKqLIMqWEoUX8VH2zgT5HHm2wfVyWUUoeHLQ5gOQ+ysH3bjiy9nUdnXwk3LPy3dh7GogghCJvOs9oR6FfYTpMmqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789529627; c=relaxed/simple;
	bh=4OYvQ72/SKMSJjpx0h+y2ofjW3s/V32EvXQ/gsEJdiM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pKhqu9uRc87JUA5VuinRSJMDblLzeK3hnrYx97wHFS0ZD3JxbOD5ZJfBxGw4uRNCysAhJEteEoyAw95cnMgqU+CHLESFk+MwgI4/Q7Kvmm5lOKuqJK8ZHtMJrq/HyQ+DcXdDjNu3l59GJ7Tmrx+65jyw31UEn19gaxM+dznIeSU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=a7fq152z; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="a7fq152z"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-398cb5615deso433663a91.3
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 20:33:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1789529625; x=1790134425; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tuWaqYdx3lVj9cpjPj9FHjq5qpjsbWLYsj0P75i5UJE=;
        b=a7fq152zP8aYiI5n15olZFPi/PajX7CBlgeB4LV+MKi309Hu9PPvvXwbht15cYVkVZ
         p9AD+/ElEd4IAOUdt5o5x3J8mVbaUlhDctW7H+M+98uUIqij1mWaxX9LI5isXVsalWIP
         UsKgB3miFfULylQopZo6db5LoOZt8jF41TBFw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789529625; x=1790134425;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tuWaqYdx3lVj9cpjPj9FHjq5qpjsbWLYsj0P75i5UJE=;
        b=xur6QycaiRhxkzaM0tBcS0cd79TN0E6CckqJeiSET6w8C5F3MwWfTRV+1AGLqeiijM
         UYwF9g0FPUq0DqwFAU9Y5q89O2OGWr6pfF51DznAY5yi4G5uuNXv6urbslENiakx+Q7R
         U1aSAWs0UzvcjpuASe9GTBbYx1W1VgotI1xsFj9/NqSGFxsMYH9iiq2Gc0QOet0rNxU2
         pnad075o7gXov1U6EU9MNy5CA+FiC3XvveAOOGC9LzE6vGOYcYGKnzX8MsF4jPKpY3LB
         zWoYKM9qYue0xHLpgff3wm7qenmeWStoexkYzgktSY0L4itRLLWJunVON96Nch4Di2iq
         eYng==
X-Forwarded-Encrypted: i=1; AKwUvBzhr86GNZIsKjO6swdpfejS1g2a2uUUT36EVQ41fM0YXL7at8Tq2n7PFL0g3A1TMyVXMRofUqNkRITM840=@vger.kernel.org
X-Gm-Message-State: AFuF++nuV3gv96XQJ53ZEPZrt1zt0YcnOpSLfLZDpUC3bRFl4yhYnKpF
	d3I3Zlr00bVrKysgci4IjGmxj4l2kNYP29KivnDvygiuQgZPG7XNx6Lc0ZYpyGMtFQ==
X-Gm-Gg: AYBFou3w5NxYChun9j/BJ+aqHrk+mxTLLaL7qRIobt/FRjwB5S32/i6WMNjdunq4y1B
	i9b/RPRuMU9Kbu1dGRD/MjNhUvd7GdIn4TOll6MQCYlZk8H3F4JlWQUXumf/GEX2unoPpQ4o31C
	4hhQz9Im2rbvu3LldHAXrBYhYYSgMDJf4/Ns7k6EWJz4rRSJ02YYmV13koKz03mfvoFIemPdd4F
	14nDiyBYc3K3sQHT/AL/xipY4HnTwcKwcULqk8uNGsNx+iEoRoVvfkkMhDpc2RY7g2A/2mfYhNe
	OhlJPfQWBiKtvztptpGH/Vc+T0KnSQbswzS9mENeesqN5lyJpVI0sUtg8kqA68Omo1F//3zrmJQ
	LQ9aWZISRA7QhKPzB1efKTlfxh5B+SNkfY2giQDlJOzT4uWouFFIy4lXX1KiESrwaT9iOp1/xgy
	GdCRb0Gg2XrN+iT8cG5mjGyyBIe5D8UYi8J9/SWu8Xww1WUu2u0T1LdWtyobV8sgirMQcFIzanv
	rso7VVSHClaQ9Nwu7s9uoefjD4u2FtI4ww7gaKY8iR7etHSO6TsuszHCQ==
X-Received: by 2002:a17:90b:2604:b0:39d:f114:8f7d with SMTP id 98e67ed59e1d1-39e1e27ad34mr2355684a91.3.1789529625104;
        Tue, 15 Sep 2026 20:33:45 -0700 (PDT)
Received: from wenst-7875.tpe.corp.google.com ([2a00:79e0:203d:7:1f62:7622:5d61:2578])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e1bbe3e62sm1833477a91.10.2026.09.15.20.33.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 20:33:44 -0700 (PDT)
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
Subject: [PATCH RFT v2 2/5] drm/fb-dma-helper: Add drm_fb_dma_get_gem_clipped_addr()
Date: Wed, 16 Sep 2026 11:33:23 +0800
Message-ID: <20260916033327.3054126-3-wenst@chromium.org>
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
Changes since v1:
- Use new drm_framebuffer_get_block_offset() helper
---
 drivers/gpu/drm/drm_fb_dma_helper.c | 37 +++++++++++++++++++++++++----
 include/drm/drm_fb_dma_helper.h     |  4 ++++
 2 files changed, 37 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/drm_fb_dma_helper.c b/drivers/gpu/drm/drm_fb_dma_helper.c
index ab0f37d8a5ff..0aaf4926db4e 100644
--- a/drivers/gpu/drm/drm_fb_dma_helper.c
+++ b/drivers/gpu/drm/drm_fb_dma_helper.c
@@ -60,15 +60,16 @@ struct drm_gem_dma_object *drm_fb_dma_get_gem_obj(struct drm_framebuffer *fb,
 EXPORT_SYMBOL_GPL(drm_fb_dma_get_gem_obj);
 
 /**
- * drm_fb_dma_get_gem_addr() - Get DMA (bus) address for framebuffer, for pixel
- * formats where values are grouped in blocks this will get you the beginning of
- * the block
+ * drm_fb_dma_get_gem_addr() - Get DMA (bus) address for unclipped framebuffer,
+ * for pixel formats where values are grouped in blocks this will get you the
+ * beginning of the block
  * @fb: The framebuffer
  * @state: Which state of drm plane
  * @plane: Which plane
- * Return the DMA GEM address for given framebuffer.
  *
  * This function will usually be called from the PLANE callback functions.
+ *
+ * Return: GEM DMA address for given framebuffer, unclipped.
  */
 dma_addr_t drm_fb_dma_get_gem_addr(struct drm_framebuffer *fb,
 				   struct drm_plane_state *state,
@@ -86,6 +87,34 @@ dma_addr_t drm_fb_dma_get_gem_addr(struct drm_framebuffer *fb,
 }
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
+	struct drm_gem_dma_object *obj;
+
+	obj = drm_fb_dma_get_gem_obj(fb, plane);
+	if (!obj)
+		return 0;
+
+	return obj->dma_addr + drm_framebuffer_get_block_offset(fb, plane,
+								state->src.x1 >> 16,
+								state->src.y1 >> 16);
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
2.55.0.1032.g73a4cd73de-goog

