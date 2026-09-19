Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4154374A0B
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 22:35:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789857313; cv=none; b=mJjJMmRHFBXIxgDzzacq4fM+aDewIpaPWoPuPtXCJ9CC00oDqmfgrEiXsAJkXzkqtL40H3/FUivo49lK4uOrFAPmLkudom/DiNMvLZ+iOOUp5td3t+1Nh/QnIszuaA4uv9dXmTbi/FkD8fnrtFn//nQCVzMdhqyHZdaM5jCfPIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789857313; c=relaxed/simple;
	bh=fBWptGqm922MC1AvQaFfxuRsf+NZ4pzO5Oe+hFw8TAw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OQzpcuTcC8dZS+b6B10OvvyCikLruK85hQW+hGW6D63SJK0mVU9WgmgHnfmW2PY+pB4JK4j84oFo4Ju197re/xq03Iv3HmiS7mfGkrzlpYsfifaN6gIKYZ38DuvH4R5XuZenGxLIpPD+mJyv9hOa6O0A/vubOGxw0AF4uZA6OJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K+f+6Eew; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K+f+6Eew"
Received: by mail-pj2-f13.google.com with SMTP id d9443c01a7336-2d91a931f66so11951735ad.0
        for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 15:35:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789857311; x=1790462111; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=7QY4l784EYoqdUGrD39yyvJt2inDbru1rDCO3703wPU=;
        b=K+f+6EewnXLetxqR1gM3CimAR5dT08uKOYnNre9cY4pgBiAWo9CED6XEGbiLHXFfD8
         TrqRSvCY+IEil52t1rqWBIHH8PFdvUq1fU9Bp9f944qHpyyyw2xW4pnmxkMh87hEaaJi
         zDMn4wvzGGG3/4rGGHyZ+N+cDxn7iducF3lUa/0EFgdd/NuglgFNMCCrNB+ydYXURevk
         z+hUXmJP9xD5nPbKU6XL+yPoxadHzG6VZmeUl8oK9WAzG0a5rBwDjAipd/EUg69Iiwbd
         rgT1WoTNDfgLtvwX7pwDniT+0EjiiLEmM322LIWeRrppYAyZRHo2uIl4rpGmAuaZiuPV
         FDnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789857311; x=1790462111;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7QY4l784EYoqdUGrD39yyvJt2inDbru1rDCO3703wPU=;
        b=qorsZT3XMmC/sAajsECQ/jepE5j8s9ZXozcRGyO1kV45Js6ymplsPp51aa7M63AlZ3
         i5e0RXRqdgj1xSdNrny/Zjkem8uqOAjNtMSLdp+A2bV8qQnJDtUcEA3Bx/I3s2eZiG02
         qxWU74ZrhitDLqlt0RETVgRVGnQpUCqhpZLvEsUjmkNn+v/IAta5td8sh6PUo6jKroB4
         fK1NjwzSFb21dSvaWfquRgUQd5iFCGIAG+F19aOy+ZSHC9IfWpz02b1OEY4tQqq1l//C
         1AePkbFgyjUuELjE1hhdvbjo99fIhpR0h/gPDIhrKe8FpHWSEXJklswNsiVZaSyYycJB
         R6WQ==
X-Forwarded-Encrypted: i=1; AKwUvBxV8axho6uiZX/YSduoG6QNJHdk6OfzmCWwxwuF5e0Seap4bJvP2oBgQnNo35qq/SbdJIly22tRQTSyhhU=@vger.kernel.org
X-Gm-Message-State: AFuF++kSvJIgfkH9bzzxOHt7uakbmWKuz3GyaVocErGpYbRTxANW+Ix+
	Jb6fIyabBJLzwGt2A92/uVNpuk9xVUZMA90KVGTZ1s8RP/67hbORt6Zt
X-Gm-Gg: AYBFou3c2I2VadovUr1ZCHJYXUyQ9SEMbaCyYBHKik7OSbHhhcMSEEX07GfpgK346sC
	rgfzdiK1V3NlLu9LQBeVMsMTpMaEnORzh9BQw2Qon4K7yi5KB2IQZG9EvhLUNK9OKKF8H52vnMe
	TQ+CzJXhbAlSaGAwjgktdgLiXG6x/8IRLfaSKzYUnP7eFSYIDb7GkXasEcD7TmyGU7QkCnUoLdk
	MK95smHIdj63ulrrXEFpxFT3smr4kkfE2l4M9HRnQD5Zu/r+RXCljJ1mkXTfeKiP+EgX7589sVn
	QWKpouJYbYOot4cLM6esSdAhD3iqnUTH469c7BpFoklJwDDkg/N8Jkn2tbB4UPtOKpvYCCirseu
	eZiL/9412Mk84kPDcBrLorRRov8diPAfUckpmdhaijCrXaMh3KVcvYQRExOHf1QIZJaMvgSM0Dq
	iVoVwkq96/ZKiIqX0ukl+3eGt4X5r2BGs63dFd6zO2vTwJzsSyqiKxaLi9Beff5+6/ve+pIw5Q/
	I/lVw3emzbdR8LJ+Fx/94Y/6nQ1lPI5xg+/PBE2NNo7/OZqvLEPz/FuhLe8JUJ1pUoeYvQLEcMv
	VQ0t6ppNB38h7dpH8FHsFg==
X-Received: by 2002:a17:903:3c4f:b0:2dd:ad74:6d1e with SMTP id d9443c01a7336-2ddbe4726a8mr69623095ad.27.1789857311009;
        Sat, 19 Sep 2026 15:35:11 -0700 (PDT)
Received: from phui-2.c.googlers.com.com (78.123.83.34.bc.googleusercontent.com. [34.83.123.78])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ddc16b471fsm13290885ad.3.2026.09.19.15.35.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 15:35:10 -0700 (PDT)
From: Hui Peng <benquike@gmail.com>
To: rubenru09@aol.com,
	tzimmermann@suse.de,
	simona@ffwll.ch,
	airlied@redhat.com
Cc: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] drm/gud: fix bulk_len divide-by-zero, connector bitmap OOB, and short USB reads
Date: Sat, 19 Sep 2026 22:35:10 +0000
Message-ID: <20260919223510.3888975-1-benquike@gmail.com>
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In drivers/gpu/drm/gud/ (gud_drv.c, gud_pipe.c, gud_connector.c), ensure
gdrm->bulk_len >= max_pitch so lines = bulk_len / pitch cannot be 0 in
gud_flush_damage(), cap num_connectors to GUD_CONNECTORS_MAX, and reject
short USB control transfers in gud_usb_get().

Fixes: 40e1a70b4aed ("drm: Add GUD USB Display driver")
Assisted-by: LLM
Signed-off-by: Hui Peng <benquike@gmail.com>
---
diff --git a/drivers/gpu/drm/gud/gud_connector.c b/drivers/gpu/drm/gud/gud_connector.c
index 8141c3a1e30a..1bf0495bf43f 100644
--- a/drivers/gpu/drm/gud/gud_connector.c
+++ b/drivers/gpu/drm/gud/gud_connector.c
@@ -569,7 +569,7 @@ static int gud_connector_add_properties(struct gud_device *gdrm, struct gud_conn
 			continue; /* not a DRM property */
 
 		property = gud_connector_property_lookup(connector, prop);
-		if (drm_WARN_ON(drm, IS_ERR(property)))
+		if (drm_WARN_ON(drm, IS_ERR_OR_NULL(property)))
 			continue;
 
 		state_val = gud_connector_tv_state_val(prop, &gconn->initial_tv_state);
diff --git a/drivers/gpu/drm/gud/gud_drv.c b/drivers/gpu/drm/gud/gud_drv.c
index 3a1b9e2a2eaa..f69b0e6e2ee0 100644
--- a/drivers/gpu/drm/gud/gud_drv.c
+++ b/drivers/gpu/drm/gud/gud_drv.c
@@ -328,7 +328,7 @@ static int gud_stats_debugfs(struct seq_file *m, void *data)
 		seq_puts(m, " none");
 	seq_puts(m, "\n");
 
-	if (gdrm->compression) {
+	if (gdrm->compression && gdrm->stats_actual_length) {
 		u64 remainder;
 		u64 ratio = div64_u64_rem(gdrm->stats_length, gdrm->stats_actual_length,
 					  &remainder);
@@ -427,6 +427,8 @@ static void gud_free_buffers_and_mutex(void *data)
 {
 	struct gud_device *gdrm = data;
 
+	vfree(gdrm->shadow_buf);
+	gdrm->shadow_buf = NULL;
 	vfree(gdrm->compress_buf);
 	gdrm->compress_buf = NULL;
 	sg_free_table(&gdrm->bulk_sgt);
@@ -443,7 +445,7 @@ static int gud_probe(struct usb_interface *intf, const struct usb_device_id *id)
 	struct usb_endpoint_descriptor *bulk_out;
 	struct gud_display_descriptor_req desc;
 	struct device *dev = &intf->dev;
-	size_t max_buffer_size = 0;
+	size_t max_buffer_size = 0, max_pitch = 0;
 	struct gud_device *gdrm;
 	struct drm_device *drm;
 	struct device *dma_dev;
@@ -495,6 +497,10 @@ static int gud_probe(struct usb_interface *intf, const struct usb_device_id *id)
 		put_device(dma_dev);
 	} else {
 		dev_warn(dev, "buffer sharing not supported"); /* not an error */
+	if (!drm->mode_config.min_width || !drm->mode_config.min_height ||
+	    drm->mode_config.max_width < drm->mode_config.min_width ||
+	    drm->mode_config.max_height < drm->mode_config.min_height)
+		return -EINVAL;
 	}
 
 	/* Mode config init */
@@ -523,7 +529,7 @@ static int gud_probe(struct usb_interface *intf, const struct usb_device_id *id)
 	num_formats_dev = ret;
 	for (i = 0; i < num_formats_dev; i++) {
 		const struct drm_format_info *info;
-		size_t fmt_buf_size;
+		size_t fmt_buf_size, fmt_pitch;
 		u32 format;
 
 		format = gud_to_fourcc(formats_dev[i]);
@@ -562,8 +568,9 @@ static int gud_probe(struct usb_interface *intf, const struct usb_device_id *id)
 			break;
 		}
 
-		fmt_buf_size = drm_format_info_min_pitch(info, 0, drm->mode_config.max_width) *
-			       drm->mode_config.max_height;
+		fmt_pitch = drm_format_info_min_pitch(info, 0, drm->mode_config.max_width);
+		fmt_buf_size = fmt_pitch * drm->mode_config.max_height;
+		max_pitch = max(max_pitch, fmt_pitch);
 		max_buffer_size = max(max_buffer_size, fmt_buf_size);
 
 		if (format == GUD_DRM_FORMAT_R1 || format == GUD_DRM_FORMAT_XRGB1111)
@@ -588,9 +595,13 @@ static int gud_probe(struct usb_interface *intf, const struct usb_device_id *id)
 
 	if (desc.max_buffer_size)
 		max_buffer_size = le32_to_cpu(desc.max_buffer_size);
+	if (max_buffer_size < max_pitch)
+		max_buffer_size = max_pitch;
 	/* Prevent a misbehaving device from allocating loads of RAM. 4096x4096@XRGB8888 = 64 MB */
 	if (max_buffer_size > SZ_64M)
 		max_buffer_size = SZ_64M;
+	if (max_buffer_size < max_pitch)
+		return -EINVAL;
 
 	gdrm->bulk_pipe = usb_sndbulkpipe(interface_to_usbdev(intf), usb_endpoint_num(bulk_out));
 	gdrm->bulk_len = max_buffer_size;
diff --git a/drivers/gpu/drm/gud/gud_pipe.c b/drivers/gpu/drm/gud/gud_pipe.c
index 5ef887d8485a..1f08226b23b2 100644
--- a/drivers/gpu/drm/gud/gud_pipe.c
+++ b/drivers/gpu/drm/gud/gud_pipe.c
@@ -156,10 +156,14 @@ static int gud_prep_flush(struct gud_device *gdrm, struct drm_framebuffer *fb,
 			  struct drm_format_conv_state *fmtcnv_state)
 {
 	u8 compression = gdrm->compression;
+	unsigned int block_width = drm_format_info_block_width(format, 0);
 	struct iosys_map dst;
 	void *vaddr, *buf;
 	size_t pitch, len;
 
+	if (block_width > 1)
+		rect->x1 = ALIGN_DOWN(rect->x1, block_width);
+
 	pitch = drm_format_info_min_pitch(format, 0, drm_rect_width(rect));
 	len = pitch * drm_rect_height(rect);
 	if (len > gdrm->bulk_len)
@@ -327,7 +331,7 @@ static void gud_flush_damage(struct gud_device *gdrm, struct drm_framebuffer *fb
 {
 	struct drm_format_conv_state fmtcnv_state = DRM_FORMAT_CONV_STATE_INIT;
 	const struct drm_format_info *format;
-	unsigned int i, lines;
+	unsigned int i, lines, block_width;
 	size_t pitch;
 	int ret;
 
@@ -335,12 +339,21 @@ static void gud_flush_damage(struct gud_device *gdrm, struct drm_framebuffer *fb
 	if (format->format == DRM_FORMAT_XRGB8888 && gdrm->xrgb8888_emulation_format)
 		format = gdrm->xrgb8888_emulation_format;
 
+	block_width = drm_format_info_block_width(format, 0);
+	if (block_width > 1)
+		damage->x1 = ALIGN_DOWN(damage->x1, block_width);
+
 	/* Split update if it's too big */
 	pitch = drm_format_info_min_pitch(format, 0, drm_rect_width(damage));
 	lines = drm_rect_height(damage);
 
+	if (!pitch || !lines)
+		return;
+
 	if (gdrm->bulk_len < lines * pitch)
 		lines = gdrm->bulk_len / pitch;
+	if (!lines)
+		return;
 
 	for (i = 0; i < DIV_ROUND_UP(drm_rect_height(damage), lines); i++) {
 		struct drm_rect rect = *damage;
@@ -399,6 +412,13 @@ static int gud_fb_queue_damage(struct gud_device *gdrm, struct drm_framebuffer *
 
 	mutex_lock(&gdrm->damage_lock);
 
+	if (gdrm->shadow_buf && gdrm->fb &&
+	    (fb->pitches[0] != gdrm->fb->pitches[0] || fb->height != gdrm->fb->height)) {
+		vfree(gdrm->shadow_buf);
+		gdrm->shadow_buf = NULL;
+		gud_clear_damage(gdrm);
+	}
+
 	if (!gdrm->shadow_buf) {
 		gdrm->shadow_buf = vcalloc(fb->pitches[0], fb->height);
 		if (!gdrm->shadow_buf) {
@@ -562,8 +582,8 @@ int gud_plane_atomic_check(struct drm_plane *plane,
 			goto out;
 		}
 
-		req->properties[num_properties + i].prop = cpu_to_le16(prop);
-		req->properties[num_properties + i].val = cpu_to_le64(val);
+		req->properties[num_properties].prop = cpu_to_le16(prop);
+		req->properties[num_properties].val = cpu_to_le64(val);
 		num_properties++;
 	}
 
