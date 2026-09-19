Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E552B3876BD
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 22:35:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789857320; cv=none; b=IoH9GWVNFMvDJaYUYtGLzAQfxFWQ0f+aJUHS5ba7XIgCJ4Z+uvyI2ty+cYnRBvsNaMAi0+zlzeCHebVpp6TW3Mtw0c67LZA7ur3qNQHhd/UIoSEPSdtMiPXamkgRq0UeAsweNFKfoWCYg1Vni25xqDiG4VBRwOFhhdPFvbkcXxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789857320; c=relaxed/simple;
	bh=3IOk/NZ7VNvag9xgcU0tuFaLsIDN1eAxG55xYwvhZVY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=a/498Zpm1oZbP0iCoA8C+u6vIxmgCKouNTQ82L64uozGkUVBZ7PXGA39h9VCszGET8hZoh/SBh6u4wVRZp5VhHx8O0JrPP/Qh+teI85hnaeewYUr4ZzFr7b40OwRIQ78gG2EYGLQ3UIEgGZizDlEdD8S3ewUdgbHsusyU0evvC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Gi/SwThs; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Gi/SwThs"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-39d654f02baso1621622a91.3
        for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 15:35:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789857318; x=1790462118; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=OAx1sjiLudq3qKBE3WqnByzTHiBW3JvS52Z/aTNAKlU=;
        b=Gi/SwThs2dl/DVz8pyUs52Lzkm/UkEGKrnbGW5rFKqZ0Iq0IH+LvYq2/jeXTlWBRPa
         YbMq2aSCpLwH2WWohmYOXRpr/YCfaFKGpclxSgUI6xZGLNFUaMo6Wp1YudkLn9dGQ8cC
         2kZNTiB/xqulYDCVlcVCvaglGAnk+aR4m5OSFhNah57PNC0tK/p/ETxt8lKDI0hdbzHh
         bCtlxzPoRfS2cGzWy5Yccty5WoWJ1947nTR2ZSrRCICsY5GnmZsps9H1pyJOncTJsa3/
         CZn+IJJG0O1lvo5Ntr9N5iQv7oUU41dOG75nQ7t40Pkv1Pmys6dvhJyaMLvGKKCsind5
         7X0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789857318; x=1790462118;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OAx1sjiLudq3qKBE3WqnByzTHiBW3JvS52Z/aTNAKlU=;
        b=IsKSGNUBpmHSCCcYqK2grUxV7uNrs27kVi8rk2PJmbpoadO0DGDtyRyrxCBWyNNIK7
         6MayVL/UvwNh+lqfPsPF6KJND36Gxk6rHs2ZCDV3Ij1HZxeGwaVQif5HtT0Bm6j6ecGA
         PG62uQjkIhrLJmMv135VFwwA66M/2c3opxHPJQ4WfwQwbwlO4sm0UcVcU1ksAcrdUTW5
         wZkJ0mQAWD7Efx6hM+HHywvN799t2ISi5v+5x4XqMgRes7xDdFFtXQU1I7TfPeSX84O7
         8OrzJ81rawKySN4UEj682F6N+Uxc+m6oCdT1SsZCJrBjk06twTp+6F1SbbH6AcEHVQIY
         oP1Q==
X-Forwarded-Encrypted: i=1; AKwUvBz90GTAZwh4hS30am7Jb1baYuYua8Jl0EAP/1PFUAiRbicw8ki74bCu/Ih53dXNh4Y3p+yp1UKX4Feh0Q8=@vger.kernel.org
X-Gm-Message-State: AFuF++k5lvzCMC9qRmbmLqi6JpvUOqQQd2ETC6qAEU84hWw1XeGFtWCR
	iHkk+A3rNiMCZTpKVPMKgRA2RkEeZtr+NexbQGFZJ0ieN+pz2JSxasjd
X-Gm-Gg: AYBFou3204dBJ7VmGT28SgT5DZh1zugBAaBA0q0cpzA6po2oZaJs7GW5RmngzYOwvAa
	pmwRgcPCF3SqVYuFUfIXUmLm6v/ZgloQjXXlPRV8ClM2Z2E5Pg6OE0EI/BR1sxrUybzrxTkh609
	+pvR7QU/xJdQcgl4VZ6fpUxfftltelyaDtRnYJZemChIMH9q5o8WhibKK2Gh7/KFLfmXmzTDFNP
	j15ltjVVX36zSlNqHvFigCuUI8XMPOviG3vG6zoFTU/CIYmrZkKqV8ypQuE98GiTHY3fqftyJsE
	3oLYDhwl9oPe1hc4wxrl1wLbs+DfQei4AVNhauuTq6IcfcCeGA6+7TIUnatwi896SF2W0RK1Vk2
	e52yHZIz0RGinD2gA5gJcKal3grC4Rpc96+ybXyx+/I9J5ABw+WT6ddfctKxPEx+dyrh7goMRT9
	OfWJdjcbvgMcp7gVASjJjWF6zqrao/jmsExhSp7suYj7U6nF6I/Z4xKwhlPvkdeTC1BsWoDg48D
	Afi/YGMgA2J8r4lT8BhMspRTdeB4Orns3rfMX+9nxvw8EnoWowcyW/xKiRDTNCkTEGr5/HiiHug
	tiERNGELkflKnpFPrH/F
X-Received: by 2002:a17:90b:2d47:b0:39d:f4fd:8075 with SMTP id 98e67ed59e1d1-39e54c9c7b7mr11455984a91.19.1789857318170;
        Sat, 19 Sep 2026 15:35:18 -0700 (PDT)
Received: from phui-2.c.googlers.com.com (78.123.83.34.bc.googleusercontent.com. [34.83.123.78])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e6c4bc0d2sm6194773a91.12.2026.09.19.15.35.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 15:35:17 -0700 (PDT)
From: Hui Peng <benquike@gmail.com>
To: javierm@redhat.com,
	tzimmermann@suse.de,
	simona@ffwll.ch,
	airlied@redhat.com
Cc: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] drm: ssd130x, st7586, sysfb: fix damage clip and buffer allocation bounds
Date: Sat, 19 Sep 2026 22:35:17 +0000
Message-ID: <20260919223517.3890003-1-benquike@gmail.com>
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Validate damage rectangle coordinates and buffer sizes in
drivers/gpu/drm/solomon/ssd130x.c, drivers/gpu/drm/sitronix/st7586.c,
and drivers/gpu/drm/sysfb/drm_sysfb_modeset.c.

Fixes: a61732e80867 ("drm: Add driver for Solomon SSD130x OLED displays")
Assisted-by: LLM
Signed-off-by: Hui Peng <benquike@gmail.com>
---
diff --git a/drivers/gpu/drm/sitronix/st7586.c b/drivers/gpu/drm/sitronix/st7586.c
index 28b2245f6b79..ef69f1eb8ead 100644
--- a/drivers/gpu/drm/sitronix/st7586.c
+++ b/drivers/gpu/drm/sitronix/st7586.c
@@ -380,7 +380,7 @@ static int st7586_probe(struct spi_device *spi)
 	dbi = &dbidev->dbi;
 	drm = &dbidev->drm;
 
-	bufsize = (st7586_mode.vdisplay + 2) / 3 * st7586_mode.hdisplay;
+	bufsize = (st7586_mode.hdisplay + 2) / 3 * st7586_mode.vdisplay;
 
 	dbi->reset = devm_gpiod_get(dev, "reset", GPIOD_OUT_HIGH);
 	if (IS_ERR(dbi->reset))
diff --git a/drivers/gpu/drm/solomon/ssd130x.c b/drivers/gpu/drm/solomon/ssd130x.c
index 0b0fc6fe3df2..bae080b12e7e 100644
--- a/drivers/gpu/drm/solomon/ssd130x.c
+++ b/drivers/gpu/drm/solomon/ssd130x.c
@@ -802,7 +802,7 @@ static int ssd132x_update_rect(struct ssd130x_device *ssd130x,
 		/* Process pair of pixels and combine them into a single byte */
 		for (j = 0; j < width; j += segment_width) {
 			u8 n1 = buf[i * width + j];
-			u8 n2 = buf[i * width + j + 1];
+			u8 n2 = (j + 1 < width) ? buf[i * width + j + 1] : 0;
 
 			data_array[array_idx++] = (n2 & 0xf0) | (n1 >> 4);
 		}
diff --git a/drivers/gpu/drm/sysfb/drm_sysfb_modeset.c b/drivers/gpu/drm/sysfb/drm_sysfb_modeset.c
index d2de29caf89e..2909cb7581d0 100644
--- a/drivers/gpu/drm/sysfb/drm_sysfb_modeset.c
+++ b/drivers/gpu/drm/sysfb/drm_sysfb_modeset.c
@@ -376,17 +376,21 @@ void drm_sysfb_plane_helper_atomic_disable(struct drm_plane *plane,
 	struct drm_device *dev = plane->dev;
 	struct drm_sysfb_device *sysfb = to_drm_sysfb_device(dev);
 	struct iosys_map dst = sysfb->fb_addr;
-	struct drm_plane_state *plane_state = drm_atomic_get_new_plane_state(state, plane);
+	struct drm_plane_state *old_plane_state = drm_atomic_get_old_plane_state(state, plane);
 	void __iomem *dst_vmap = dst.vaddr_iomem; /* TODO: Use mapping abstraction */
 	unsigned int dst_pitch = sysfb->fb_pitch;
 	const struct drm_format_info *dst_format = sysfb->fb_format;
-	struct drm_rect dst_clip;
+	struct drm_rect dst_clip, fb_rect;
 	unsigned long lines, linepixels, i;
 	int idx;
 
-	drm_rect_init(&dst_clip,
-		      plane_state->src_x >> 16, plane_state->src_y >> 16,
-		      plane_state->src_w >> 16, plane_state->src_h >> 16);
+	if (!old_plane_state || !old_plane_state->visible)
+		return;
+
+	dst_clip = old_plane_state->dst;
+	drm_rect_init(&fb_rect, 0, 0, sysfb->fb_mode.hdisplay, sysfb->fb_mode.vdisplay);
+	if (!drm_rect_intersect(&dst_clip, &fb_rect))
+		return;
 
 	lines = drm_rect_height(&dst_clip);
 	linepixels = drm_rect_width(&dst_clip);
