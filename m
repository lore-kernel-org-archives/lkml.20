Received: from mail-pj2-f43.google.com (mail-pj2-f43.google.com [74.125.227.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFC0C387359
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 03:33:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789529623; cv=none; b=h1LmHpt0lD8ssKMd9yMp8ydB5Mg11vvLxg+QIec9Y9Vwhx+gCG10LONcO9e+MSI5uJ692QtpkUft1IK0P5p0Zq3iPNSs/92VYxDOq9GUTAx/TUI7anPpn0uX9bPTDJEhys4DROoSDLLI5C50sbC+X23E42PorIw9QpQX4oPPelg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789529623; c=relaxed/simple;
	bh=es80KIPm6d34RQhtEPnuboKLoKRoUcyHS9QbOTgsSi8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=biUYWbaCUEikznJWRl4yX2/2c1DIMNgaZ0AQlNSkENjOg+w0fWk5/CGyrAbjkuC36Rik1LShp0Hb5YO8FDIhTJHcU0Idlz3/l+Xn6MZBcavjy/ZrK0AKZN6n6/2KUgVthhuEjiMZMHD7H6TlZU/ivnJG7hhC8+521vG8FSp/P+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=h+cj7Ioh; arc=none smtp.client-ip=74.125.227.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="h+cj7Ioh"
Received: by mail-pj2-f43.google.com with SMTP id 98e67ed59e1d1-396ccb1a98fso345479a91.1
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 20:33:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1789529621; x=1790134421; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JETOMAWav2dfMHsWYPyuoNMSTDJN0FsRCfFHE94te6U=;
        b=h+cj7IohmiY5dt0xckNsQXn1L/xnMTAYDxkkQ4gVp+ZpKfQixS4xuc1ebN5XyzQlbN
         YmiM99fN8N00RVQtHFo3RwcY3Ir8y3eUQMSPobAIgX8+cY2nvHXo0vOtykh9eQVFK88d
         2PmE/t5xv/qW4N1PXiMMsj1nU0knL4ogt/1PQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789529621; x=1790134421;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JETOMAWav2dfMHsWYPyuoNMSTDJN0FsRCfFHE94te6U=;
        b=Q2VehOkyZkL+sNfgAP9r3C8EK219yfcdZh/6AmAJG9yZpV4pO7Tu5ZI/kL10hD/MFB
         kSEHAlBPtmJYZ2THd5JbSMWSp8N6VMWKzSzGGQ0btyYOc7it9ZFHstZ+cH4pM9XaNXMY
         4WNZifmI1VlDNddzA5txaIw+2dKZL3KUFGGOrIUksKfUgqD7QHmwY/EB5tOW8J259Zpt
         Y1fUsGwYq4pkY3r9ILnsMYsSUs4Xw1jskTHD8UyddR9VoD1rVuVz0NkB/+AvYM/D54iM
         N7qh14YUBRkCTjbgKXdHhleyf0ayOvxgKbCEhvu+tnccy+OMvN9bRWN/J54xJwRn9Ola
         ME0Q==
X-Forwarded-Encrypted: i=1; AKwUvBxL1PNAk5EO3iRvws6Dhp8ovsfHOa94NcyXs/ID4adYzub7dc7413xMX+6M6ko0S7SfjfIfh6hWc6vsiws=@vger.kernel.org
X-Gm-Message-State: AFuF++l1LZADHET/3X/+H/KuLMDyc99tSYokFDeMZHrav3VyCP5dn7mD
	YwRVqL7zCG3KXZ5ebTznEj7mPX/3qNgRxBRmwNd+DFwZQ9JHFCL7JpU2yBX+7h3m4A==
X-Gm-Gg: AYBFou0c4bm/uIvS5LY29LEdvx5qeebnkzO0h0A3PfaqrROr+YVKYbTGypK8ZOUwSUv
	5sLZsb1+VICBE7ELAPdZH9UGNobgE+zX/2G3/lXx475uEmg18tg1oILMc/IjRIZ/t+JT0VKSfod
	ttSoyHJcbo6zkNf6U2Ht8UpJ5Xb+p7mixzUix9Pt/p8yLhAETytnfVHiv8PKWzYQSF3Qi13EDgc
	mqamqLZaTHHr6GvjCIaPq7pq32HUqfoIVq8npCk9OdJG+RxdYrOeEdQTvow+g4JdooJRQqSU4mw
	3HSNZ1AufPzSZuFimcNPQvAGxMzFOquzlcPM1toSYYAV24ErR2/C7+pOCpBfXdqA73y6pTHm50H
	0iTMFilJuG2OmABCKXdk10JmBbhdXeduq9/5Wzh469syzEsPw1GDlS+ojMVUc5Q+NvfglxUzOdk
	T3/L8tHUt82ezFJ/ONno57kbzsBi3RUKhRBueq4ClMNSbliegGijRg0e7CfuOmQkpoX8vN2+Ya5
	skJutEYgEsELmasEn2AlwmuUZe6fJDerXrD7TKaRiH69sV165O0YO3qiA==
X-Received: by 2002:a17:90b:2604:b0:38e:659b:f366 with SMTP id 98e67ed59e1d1-39e1df6c05dmr2364892a91.0.1789529621075;
        Tue, 15 Sep 2026 20:33:41 -0700 (PDT)
Received: from wenst-7875.tpe.corp.google.com ([2a00:79e0:203d:7:1f62:7622:5d61:2578])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e1bbe3e62sm1833477a91.10.2026.09.15.20.33.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 20:33:40 -0700 (PDT)
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
Subject: [PATCH RFT v2 1/5] drm: Split framebuffer pixel offset calculation from drm_fb_dma_get_gem_addr()
Date: Wed, 16 Sep 2026 11:33:22 +0800
Message-ID: <20260916033327.3054126-2-wenst@chromium.org>
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

Currently drm_fb_dma_get_gem_addr() calculates the offset into the
framebuffer memory for the framebuffer's unclipped source coordinates,
adds that to the framebuffer's backing storage, and returns the result.

We are about to add a variant that uses the clipped source coordinates,
so there is already some reuse of code. However, calculating the data
offset for a given pixel is not specific to the DMA FB helpers. The
offset is only related to the framebuffer.

Split out the offset calculation into a new framebuffer helper so that
non-DMA users can also reuse the same code.

Suggested-by: Thomas Zimmermann <tzimmermann@suse.de>
Cc: <stable@vger.kernel.org> # dependency for next patch
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Changes since v1:
- New patch
---
 drivers/gpu/drm/drm_fb_dma_helper.c | 28 ++----------------
 drivers/gpu/drm/drm_framebuffer.c   | 45 +++++++++++++++++++++++++++++
 include/drm/drm_framebuffer.h       |  3 ++
 3 files changed, 51 insertions(+), 25 deletions(-)

diff --git a/drivers/gpu/drm/drm_fb_dma_helper.c b/drivers/gpu/drm/drm_fb_dma_helper.c
index fd71969d2fb1..ab0f37d8a5ff 100644
--- a/drivers/gpu/drm/drm_fb_dma_helper.c
+++ b/drivers/gpu/drm/drm_fb_dma_helper.c
@@ -75,36 +75,14 @@ dma_addr_t drm_fb_dma_get_gem_addr(struct drm_framebuffer *fb,
 				   unsigned int plane)
 {
 	struct drm_gem_dma_object *obj;
-	dma_addr_t dma_addr;
-	u8 h_div = 1, v_div = 1;
-	u32 block_w = drm_format_info_block_width(fb->format, plane);
-	u32 block_h = drm_format_info_block_height(fb->format, plane);
-	u32 block_size = fb->format->char_per_block[plane];
-	u32 sample_x;
-	u32 sample_y;
-	u32 block_start_y;
-	u32 num_hblocks;
 
 	obj = drm_fb_dma_get_gem_obj(fb, plane);
 	if (!obj)
 		return 0;
 
-	dma_addr = obj->dma_addr + fb->offsets[plane];
-
-	if (plane > 0) {
-		h_div = fb->format->hsub;
-		v_div = fb->format->vsub;
-	}
-
-	sample_x = (state->src_x >> 16) / h_div;
-	sample_y = (state->src_y >> 16) / v_div;
-	block_start_y = (sample_y / block_h) * block_h;
-	num_hblocks = sample_x / block_w;
-
-	dma_addr += fb->pitches[plane] * block_start_y;
-	dma_addr += block_size * num_hblocks;
-
-	return dma_addr;
+	return obj->dma_addr + drm_framebuffer_get_block_offset(fb, plane,
+								state->src_x >> 16,
+								state->src_y >> 16);
 }
 EXPORT_SYMBOL_GPL(drm_fb_dma_get_gem_addr);
 
diff --git a/drivers/gpu/drm/drm_framebuffer.c b/drivers/gpu/drm/drm_framebuffer.c
index d32aceb6ca9b..9e1231162047 100644
--- a/drivers/gpu/drm/drm_framebuffer.c
+++ b/drivers/gpu/drm/drm_framebuffer.c
@@ -1208,6 +1208,51 @@ void drm_framebuffer_print_info(struct drm_printer *p, unsigned int indent,
 	}
 }
 
+/**
+ * drm_framebuffer_get_block_offset() - Get offset to start of pixel block for
+ * the given framebuffer and coordinates.
+ * @fb: The framebuffer
+ * @plane: Which plane
+ * @x: x coordinate for pixel
+ * @y: y coordinate for pixel
+ *
+ * This function will usually be called from the PLANE callback functions,
+ * or from one of the helpers that calculates the framebuffer's DMA address.
+ *
+ * Return: offset from start of framebuffer to start of pixel block
+ */
+u32 drm_framebuffer_get_block_offset(struct drm_framebuffer *fb, unsigned int plane,
+				     unsigned int x, unsigned int y)
+{
+	u8 h_div = 1, v_div = 1;
+	u32 block_w = drm_format_info_block_width(fb->format, plane);
+	u32 block_h = drm_format_info_block_height(fb->format, plane);
+	u32 block_size = fb->format->char_per_block[plane];
+	u32 sample_x;
+	u32 sample_y;
+	u32 block_start_y;
+	u32 num_hblocks;
+	u32 offset;
+
+	offset = fb->offsets[plane];
+
+	if (plane > 0) {
+		h_div = fb->format->hsub;
+		v_div = fb->format->vsub;
+	}
+
+	sample_x = x / h_div;
+	sample_y = y / v_div;
+	block_start_y = (sample_y / block_h) * block_h;
+	num_hblocks = sample_x / block_w;
+
+	offset += fb->pitches[plane] * block_start_y;
+	offset += block_size * num_hblocks;
+
+	return offset;
+}
+EXPORT_SYMBOL(drm_framebuffer_get_block_offset);
+
 #ifdef CONFIG_DEBUG_FS
 static int drm_framebuffer_info(struct seq_file *m, void *data)
 {
diff --git a/include/drm/drm_framebuffer.h b/include/drm/drm_framebuffer.h
index 38b24fc8978d..c07aea1cc59f 100644
--- a/include/drm/drm_framebuffer.h
+++ b/include/drm/drm_framebuffer.h
@@ -220,6 +220,9 @@ void drm_framebuffer_remove(struct drm_framebuffer *fb);
 void drm_framebuffer_cleanup(struct drm_framebuffer *fb);
 void drm_framebuffer_unregister_private(struct drm_framebuffer *fb);
 
+u32 drm_framebuffer_get_block_offset(struct drm_framebuffer *fb, unsigned int plane,
+				     unsigned int x, unsigned int y);
+
 /**
  * drm_framebuffer_get - acquire a framebuffer reference
  * @fb: DRM framebuffer
-- 
2.55.0.1032.g73a4cd73de-goog

