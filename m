Received: from mail-pj2-f21.google.com (mail-pj2-f21.google.com [74.125.227.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FDDC3AAF5F
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 22:34:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789857285; cv=none; b=TQkOQ+CeO5ducsoUhVOUIo+aTw38T3B0XuP1eg/0Y7VwD33A7AC3zCspKHNo08V+jDVN/K9b0gi6skt3oiUH2BWjw+B5uzLfJH/n6tvNGUtYZouRLm5Da072kG05f2xM8QLxYrrBzsu6PUJ5WaIUpfNTAbXgCsYha0PPvYyx74A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789857285; c=relaxed/simple;
	bh=qCFcfLF8EZRY82jbZeLkPocEbc2LHbSNlLTzZ2T/BMM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kT0FKBWTUUEHSLQ3ofITDlQ73+vmZVy7uvy7SK9JyA3yKzBZx25MCASHk4qogsePIdQefj3Kk+o2NpnROcOneasyrYW9/acDDMwawqiDCAkD0L2kvxV01/A/LQfLW8LrYTJcbF6dLmuzv15jkoWT3REtlMkEgoQM8gCPQCkYT38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nLz8X8Re; arc=none smtp.client-ip=74.125.227.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nLz8X8Re"
Received: by mail-pj2-f21.google.com with SMTP id d9443c01a7336-2d747f0b25dso20580085ad.2
        for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 15:34:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789857283; x=1790462083; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=7hePZhOSnen3stmEQKdmfJfV/rWkem/5+3T/F6pvXcQ=;
        b=nLz8X8RedBNm1KJ0drk0CaPgHeV2UfHHe+KgMo0QxPSgO7LdqW5QkrGNcyBsE7EFfA
         JOdd0J25udn5Mw8SsFQtrC033duYs3K8ju0JDEFwOqzO80AAwH6fpx9QjkTwj3reaZTb
         UqqnU//cocNjxebLB+4GIP0SIDt0Uy4kjyhqIhVSIlb22/hKdD9KggqElwJg5HiBL3dM
         io7BF7FCexcQv7Yar6XMs14/M5Fnk3N+/X6HMnleG20NGtRPc9LcMTJL+mQMT8hmIl6+
         8ouKvM5Hzt2dgavW7uTcl3rrj2QkGiS9A3WfCvW9ifH+7puw1zXJEAY1VwFp2+86CY7R
         5zxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789857283; x=1790462083;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7hePZhOSnen3stmEQKdmfJfV/rWkem/5+3T/F6pvXcQ=;
        b=TpOvxzsj4yosDHplcDg1xSnEhI16kW4pyFb+Gu5uVXYmc3VT7w7NYjYCyZe4sElSzE
         EnK+jf7mvhya++7uZNrnyKBhmsIx4jaxioLXCJ+WNE/XxLxOxeEGQ8xzVBtD5h9xB9oP
         eqtNMEnsc9Py3psIFrSQ5MhP7E2nEbU58cjhWgXT2+sVYCge6mkyd7A7LTL4qD5UWFl/
         x7Gp4/9XeYWKGcke3RwDftMDcUpVFZhWYubkldWAwApWJUGl/sjHkzZ4MgASrZH9JHDv
         D8ykh4RctKsndgNoymuN4dnIztZmgB8MYBvS+GEVvqpjbT4VAC7xLkd0qiTnUvgZQdeP
         CKbA==
X-Forwarded-Encrypted: i=1; AKwUvBxyaL3hwUkVUIyHwaOPqTwnN5v6n+4/83ux9GdfZ+IRu9w6etVSJ13MGo32PjR9JJ+Vc2L/w0aweMW+HnY=@vger.kernel.org
X-Gm-Message-State: AFuF++mLuo61OMThZphYWnXrDuC0zpCZaIma9JMbkepisRen0FCg/xKq
	4QCFwBSYBZ+Ej+Df0GNb0MUuyJ74VSdLFWWd9/ergReljpRC7po37ewK
X-Gm-Gg: AYBFou3+dDs9w+q/gwhBf0i+KI+JxTKFf3oNWvn3VnveEP3kA5OTQqgHmmTRbT8b6fP
	GkZmUd5rxCVTcmjeMWbhdYq3TVmubIVtERFwrYKyPWe+rHBr9Vdibn5XcU0bTcgursCVG9W7Gqy
	KdWIBH+ncyt2dPaKegbRO9IRuTtJCYpdxz/nx2QDCiD/X0MI79nlWvoGR/NN4QCRL7VjUjRF0qw
	lrilI5p9ImlMlHGt2lslFtGqVZOCR/PUEWmcoJkCcuX2tMLcIBgnC6TC6qppZJVur4sCk6Q5x/Q
	/xepgAyVuiImqBUSaFLiuNu2MO07qD2PjeVhhOtSoQulh7/g2dlRvv0a/Pjsv3dzGMfDEp5Lkgm
	WBWg5aW8q3IIsRJBIMluWpdEH6ZaoAxHXLQMpiku+9axyROMkfWKrEzJx+WH11K1OA5QbtEHjS8
	bzlOsy5rethml85BQMfgxSenIqWcDwfOAzW0yEssMOoBfBB+Sglb3IzzHHx91Rk8XVta+olUdHl
	SwavdIvJ7zg9FTmzxAOKyh4+c3lALuwk2zN5wTQMPl6LPD2Okl0kHJNSn6Edya/3EjSOqlLZszC
	3djGjZt5Xw==
X-Received: by 2002:a17:902:d4cb:b0:2dd:278c:5eb with SMTP id d9443c01a7336-2ddb1b7ac4amr110121625ad.14.1789857282637;
        Sat, 19 Sep 2026 15:34:42 -0700 (PDT)
Received: from phui-2.c.googlers.com.com (78.123.83.34.bc.googleusercontent.com. [34.83.123.78])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ddc1788da5sm13265185ad.24.2026.09.19.15.34.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 15:34:42 -0700 (PDT)
From: Hui Peng <benquike@gmail.com>
To: zack.rusin@broadcom.com,
	airlied@redhat.com,
	tzimmermann@suse.de,
	simona@ffwll.ch
Cc: bcm-kernel-feedback-list@broadcom.com,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] drm/vmwgfx: fix surface size overflow, execbuf bounds, and cursor/msg leaks
Date: Sat, 19 Sep 2026 22:34:41 +0000
Message-ID: <20260919223441.3884374-1-benquike@gmail.com>
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix multiple integer overflows, out-of-bounds accesses, and resource
leaks across drivers/gpu/drm/vmwgfx/ (vmwgfx_surface.c,
vmwgfx_execbuf.c, vmwgfx_msg.c, vmwgfx_fence.c, vmwgfx_cursor_plane.c,
vmwgfx_cotable.c, vmwgfx_bo.c, and vmw_surface_cache.h).

Fixes: fb1d9738ca05 ("drm/vmwgfx: Add DRM driver for VMware Virtual GPU")
Assisted-by: LLM
Signed-off-by: Hui Peng <benquike@gmail.com>
---
diff --git a/drivers/gpu/drm/vmwgfx/vmw_surface_cache.h b/drivers/gpu/drm/vmwgfx/vmw_surface_cache.h
index 1ac3cb151b11..bc5f7facf728 100644
--- a/drivers/gpu/drm/vmwgfx/vmw_surface_cache.h
+++ b/drivers/gpu/drm/vmwgfx/vmw_surface_cache.h
@@ -100,7 +100,7 @@ vmw_surface_calculate_pitch(const SVGA3dSurfaceDesc *desc,
 
 	vmw_surface_get_size_in_blocks(desc, size, &blocks);
 
-	pitch = blocks.width * desc->pitchBytesPerBlock;
+	pitch = clamped_umul32(blocks.width, desc->pitchBytesPerBlock);
 
 	return pitch;
 }
@@ -159,11 +159,13 @@ vmw_surface_get_serialized_size(SVGA3dSurfaceFormat format,
 	for (mip = 0; mip < num_mip_levels; mip++) {
 		struct drm_vmw_size size =
 			vmw_surface_get_mip_size(base_level_size, mip);
-		total_size += vmw_surface_get_image_buffer_size(desc,
-								  &size, 0);
+		total_size = min_t(u64,
+			(u64)total_size +
+			vmw_surface_get_image_buffer_size(desc, &size, 0),
+			U32_MAX);
 	}
 
-	return total_size * num_layers;
+	return clamped_umul32(total_size, num_layers);
 }
 
 /**
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c b/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c
index 9c7a73c0b0dc..53b3ecfc476b 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c
@@ -535,7 +535,8 @@ static int vmw_user_bo_synccpu_release(struct drm_file *filp,
 
 	if (!ret) {
 		if (!(flags & drm_vmw_synccpu_allow_cs)) {
-			atomic_dec(&vmw_bo->cpu_writers);
+			if (!atomic_add_unless(&vmw_bo->cpu_writers, -1, 0))
+				ret = -EINVAL;
 		}
 		vmw_user_bo_unref(&vmw_bo);
 	}
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_cotable.c b/drivers/gpu/drm/vmwgfx/vmwgfx_cotable.c
index 091f1039a052..4273be7ac1ac 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_cotable.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_cotable.c
@@ -481,6 +481,10 @@ static int vmw_cotable_resize(struct vmw_resource *res, size_t new_size)
 		goto out_wait;
 	}
 
+	ret = dma_resv_reserve_fences(bo->base.resv, 1);
+	if (unlikely(ret))
+		goto out_wait;
+
 	vmw_resource_mob_detach(res);
 	res->guest_memory_bo = buf;
 	res->guest_memory_size = new_size;
@@ -505,10 +509,6 @@ static int vmw_cotable_resize(struct vmw_resource *res, size_t new_size)
 	vmw_user_bo_unref(&old_buf);
 	res->id = vcotbl->type;
 
-	ret = dma_resv_reserve_fences(bo->base.resv, 1);
-	if (unlikely(ret))
-		goto out_wait;
-
 	/* Release the pin acquired in vmw_bo_create */
 	ttm_bo_unpin(bo);
 
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_cursor_plane.c b/drivers/gpu/drm/vmwgfx/vmwgfx_cursor_plane.c
index d1e7df500190..e6776ed6cfd4 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_cursor_plane.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_cursor_plane.c
@@ -116,6 +116,12 @@ static void vmw_cursor_update_mob(struct vmw_private *vmw,
 	u32 *image = vmw_bo_map_and_cache(bo);
 	const u32 image_size = vps->base.crtc_w * vps->base.crtc_h * sizeof(*image);
 
+	if (!bo || !vps->cursor.mob)
+		return;
+	if (image_size > bo->tbo.base.size ||
+	    sizeof(*header) + image_size > vps->cursor.mob->tbo.base.size)
+		return;
+
 	header = vmw_bo_map_and_cache(vps->cursor.mob);
 	alpha_header = &header->header.alphaHeader;
 
@@ -359,7 +365,9 @@ void vmw_kms_cursor_snoop(struct vmw_surface *srf,
 	    box->x != 0    || box->y != 0    || box->z != 0    ||
 	    box->srcx != 0 || box->srcy != 0 || box->srcz != 0 ||
 	    box->d != 1    || box_count != 1 ||
-	    box->w > VMW_CURSOR_SNOOP_WIDTH || box->h > VMW_CURSOR_SNOOP_HEIGHT) {
+	    box->w == 0    || box->h == 0    ||
+	    box->w > VMW_CURSOR_SNOOP_WIDTH || box->h > VMW_CURSOR_SNOOP_HEIGHT ||
+	    cmd->dma.guest.pitch > image_pitch) {
 		/* TODO handle none page aligned offsets */
 		/* TODO handle more dst & src != 0 */
 		/* TODO handle more then one copy */
@@ -375,6 +383,9 @@ void vmw_kms_cursor_snoop(struct vmw_surface *srf,
 	kmap_offset = cmd->dma.guest.ptr.offset >> PAGE_SHIFT;
 	kmap_num = (VMW_CURSOR_SNOOP_HEIGHT * image_pitch) >> PAGE_SHIFT;
 
+	if (bo->base.size < ((kmap_offset + kmap_num) << PAGE_SHIFT))
+		return;
+
 	ret = ttm_bo_reserve(bo, true, false, NULL);
 	if (unlikely(ret != 0)) {
 		DRM_ERROR("reserve failed\n");
@@ -393,7 +404,7 @@ void vmw_kms_cursor_snoop(struct vmw_surface *srf,
 	} else {
 		/* Image is unsigned pointer. */
 		for (i = 0; i < box->h; i++)
-			memcpy(srf->snooper.image + i * image_pitch,
+			memcpy((u8 *)srf->snooper.image + i * image_pitch,
 			       virtual + i * cmd->dma.guest.pitch,
 			       box->w * desc->pitchBytesPerBlock);
 	}
@@ -548,7 +559,9 @@ vmw_cursor_buffer_changed(struct vmw_plane_state *new_vps,
 			old_image = vmw_bo_map_and_cache(old_bo);
 			new_image = vmw_bo_map_and_cache(new_bo);
 
-			if (old_image && new_image && old_image != new_image)
+			if (old_image && new_image && old_image != new_image &&
+			    size <= old_bo->tbo.base.size &&
+			    size <= new_bo->tbo.base.size)
 				changed = memcmp(old_image, new_image, size) !=
 					  0;
 
@@ -728,6 +741,14 @@ int vmw_cursor_plane_atomic_check(struct drm_plane *plane,
 	if (!fb)
 		return 0;
 
+	if (new_state->crtc_w <= 0 || new_state->crtc_h <= 0 ||
+	    new_state->crtc_w > vmw->fb_max_width ||
+	    new_state->crtc_h > vmw->fb_max_height) {
+		drm_warn(&vmw->drm, "Invalid cursor dimensions (%d, %d)\n",
+			 new_state->crtc_w, new_state->crtc_h);
+		return -EINVAL;
+	}
+
 	update_type = vmw_cursor_update_type(vmw, vps);
 	if (update_type == VMW_CURSOR_UPDATE_LEGACY) {
 		if (new_state->crtc_w != VMW_CURSOR_SNOOP_WIDTH ||
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c b/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c
index a9136a6523cb..92c12d6e98d6 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c
@@ -1511,6 +1511,10 @@ static int vmw_cmd_dma(struct vmw_private *dev_priv,
 
 	cmd = container_of(header, typeof(*cmd), header);
 
+	if (unlikely(header->size < sizeof(cmd->body) + sizeof(*suffix))) {
+		VMW_DEBUG_USER("Invalid DMA command size.\n");
+		return -EINVAL;
+	}
 	if (unlikely(header->size < sizeof(cmd->body) + sizeof(*suffix))) {
 		VMW_DEBUG_USER("Illegal SVGA_3D_CMD_SURFACE_DMA size.\n");
 		return -EINVAL;
@@ -1572,6 +1576,10 @@ static int vmw_cmd_draw(struct vmw_private *dev_priv,
 	VMW_DECLARE_CMD_VAR(*cmd, SVGA3dCmdDrawPrimitives);
 	SVGA3dVertexDecl *decl = (SVGA3dVertexDecl *)(
 		(unsigned long)header + sizeof(*cmd));
+	if (unlikely(header->size < sizeof(cmd->body))) {
+		VMW_DEBUG_USER("Draw command size too small.\n");
+		return -EINVAL;
+	}
 	SVGA3dPrimitiveRange *range;
 	uint32_t i;
 	uint32_t maxnum;
@@ -1931,6 +1939,11 @@ static int vmw_cmd_shader_define(struct vmw_private *dev_priv,
 	if (unlikely(!dev_priv->has_mob))
 		return 0;
 
+	if (unlikely(cmd->header.size < sizeof(cmd->body))) {
+		VMW_DEBUG_USER("Invalid shader define command size.\n");
+		return -EINVAL;
+	}
+
 	size = cmd->header.size - sizeof(cmd->body);
 	ret = vmw_compat_shader_add(dev_priv, vmw_context_res_man(ctx),
 				    cmd->body.shid, cmd + 1, cmd->body.type,
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_fence.c b/drivers/gpu/drm/vmwgfx/vmwgfx_fence.c
index 384c6736cf6b..f8cabbe9868a 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_fence.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_fence.c
@@ -703,6 +703,7 @@ int vmw_fence_event_ioctl(struct drm_device *dev, void *data,
 			if (unlikely(ret != 0)) {
 				DRM_ERROR("Failed to reference a fence "
 					  "object.\n");
+				ttm_base_object_unref(&base);
 				goto out_no_ref_obj;
 			}
 			handle = base->handle;
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_msg.c b/drivers/gpu/drm/vmwgfx/vmwgfx_msg.c
index fd77ab6568cb..f0f2dbb66cdc 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_msg.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_msg.c
@@ -431,7 +431,7 @@ int vmw_host_get_guestinfo(const char *guest_info_param,
 		/* Remove reply code, which are the first 2 characters of
 		 * the reply
 		 */
-		reply_len = max(reply_len - 2, (size_t) 0);
+		reply_len = reply_len > 2 ? reply_len - 2 : 0;
 		reply_len = min(reply_len, *length);
 
 		if (reply_len > 0)
@@ -572,7 +572,8 @@ int vmw_msg_ioctl(struct drm_device *dev, void *data,
 			goto out_msg;
 		}
 		if (reply && reply_len > 0) {
-			if (copy_to_user((void __user *)((unsigned long)arg->receive),
+			if (reply_len > arg->receive_len ||
+			    copy_to_user((void __user *)((unsigned long)arg->receive),
 					 reply, reply_len)) {
 				DRM_ERROR("Failed to copy message to userspace.\n");
 				kfree(reply);
@@ -1045,7 +1046,7 @@ int vmw_mksstat_add_ioctl(struct drm_device *dev, void *data,
 	hypervisor_ppn_add((PPN64)page_to_pfn(page));
 
 	dev_priv->mksstat_user_pages[slot] = page;
-	atomic_set(&dev_priv->mksstat_user_pids[slot], task_pgrp_vnr(current));
+	atomic_set(&dev_priv->mksstat_user_pids[slot], pid_nr(task_pgrp(current)));
 
 	arg->id = slot;
 
@@ -1104,7 +1105,7 @@ int vmw_mksstat_remove_ioctl(struct drm_device *dev, void *data,
 
 	DRM_DEV_INFO(dev->dev, "pid=%d arg.id=%zu\n", current->pid, slot);
 
-	pgid = task_pgrp_vnr(current);
+	pgid = pid_nr(task_pgrp(current));
 	pid = atomic_cmpxchg(&dev_priv->mksstat_user_pids[slot], pgid, MKSSTAT_PID_RESERVED);
 
 	if (!pid)
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_surface.c b/drivers/gpu/drm/vmwgfx/vmwgfx_surface.c
index bd0563741e89..0104e73b69de 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_surface.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_surface.c
@@ -785,14 +785,26 @@ int vmw_surface_define_ioctl(struct drm_device *dev, void *data,
 
 	for (i = 0; i < DRM_VMW_MAX_SURFACE_FACES; ++i) {
 		for (j = 0; j < metadata->mip_levels[i]; ++j) {
-			uint32_t stride = vmw_surface_calculate_pitch(
-						  desc, cur_size);
+			uint32_t stride;
 
+			if (unlikely(cur_size->width == 0 ||
+				     cur_size->height == 0 ||
+				     cur_size->depth == 0)) {
+				ret = -EINVAL;
+				goto out_no_copy;
+			}
+			stride = vmw_surface_calculate_pitch(desc, cur_size);
 			cur_offset->face = i;
 			cur_offset->mip = j;
 			cur_offset->bo_offset = cur_bo_offset;
-			cur_bo_offset += vmw_surface_get_image_buffer_size
-				(desc, cur_size, stride);
+			if (unlikely(check_add_overflow(cur_bo_offset,
+							vmw_surface_get_image_buffer_size(desc,
+											  cur_size,
+											  stride),
+							&cur_bo_offset))) {
+				ret = -EINVAL;
+				goto out_no_copy;
+			}
 			++cur_offset;
 			++cur_size;
 		}
@@ -967,12 +979,14 @@ static int vmw_buffer_prime_to_surface_base(struct vmw_private *dev_priv,
 	if (ret) {
 		drm_warn(&dev_priv->drm,
 			 "Couldn't add an object ref for the buffer (%d).\n", *handle);
+		ttm_base_object_unref(&base);
 		goto out;
 	}
 
 	*base_p = base;
 out:
 	vmw_user_bo_unref(&bo);
+	drm_gem_handle_delete(file_priv, *handle);
 
 	return ret;
 }
@@ -1440,7 +1454,7 @@ int vmw_gb_surface_reference_ioctl(struct drm_device *dev, void *data,
 	    (union drm_vmw_gb_surface_reference_arg *)data;
 	struct drm_vmw_surface_arg *req = &arg->req;
 	struct drm_vmw_gb_surface_ref_rep *rep = &arg->rep;
-	struct drm_vmw_gb_surface_ref_ext_rep rep_ext;
+	struct drm_vmw_gb_surface_ref_ext_rep rep_ext = {};
 	int ret;
 
 	ret = vmw_gb_surface_reference_internal(dev, req, &rep_ext, file_priv);
@@ -1720,6 +1734,7 @@ vmw_gb_surface_reference_internal(struct drm_device *dev,
 	srf = &user_srf->srf;
 	if (!srf->res.guest_memory_bo) {
 		DRM_ERROR("Shared GB surface is missing a backup buffer.\n");
+		ret = -EINVAL;
 		goto out_bad_resource;
 	}
 	metadata = &srf->metadata;
@@ -1755,9 +1770,13 @@ vmw_gb_surface_reference_internal(struct drm_device *dev,
 		SVGA3D_FLAGS_UPPER_32(metadata->flags);
 	rep->creq.multisample_pattern = metadata->multisample_pattern;
 	rep->creq.quality_level = metadata->quality_level;
+	rep->creq.buffer_byte_stride = metadata->buffer_byte_stride;
 	rep->creq.must_be_zero = 0;
 
 out_bad_resource:
+	if (unlikely(ret != 0))
+		ttm_ref_object_base_unref(vmw_fpriv(file_priv)->tfile,
+					  base->handle);
 	ttm_base_object_unref(&base);
 
 	return ret;
