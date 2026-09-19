Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB4BD38D3FD
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 21:52:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789854759; cv=none; b=Sx1Ve0mjYGFsE796C0vmEfI1uFICvtdJFAp9Dc5rZg0tQ5Sar5QTxMtiPeWM4RRoplJR6jNpABMCTdkPGPPDSe71MYgJQBhdG6VKyZ8XnvlqYJ5C9P6iwLHBHevW2o4F7Bl43NI2AiiZAznkA0sbKSWRgBw/eDLqdfiHEEk+QRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789854759; c=relaxed/simple;
	bh=NE6kyRSM9D9+ObNWClCJeHTHbyuytLFmTKruJmNdFlc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZhwQjbd8rIM5PU9E58cO3FL1OF0wjfHdfZLdZqtcETWsHA5lcz2vTBBhOHBsUyiRIeiv3PSjCAHtobgflKcYuUaBnIIufFNcqzI0yhJJ9spBIRPtSQgD8OaeYOXem/Tuzm6JyjaD/7Op0mh0m2siEsY+w0kCviS2c5Nj7TFEGao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XFOLFGTl; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XFOLFGTl"
Received: by mail-pj2-f13.google.com with SMTP id d9443c01a7336-2d747f05ffcso14157585ad.0
        for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 14:52:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789854753; x=1790459553; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=4UB+obLd5sZwu+zoy2b+DbkHvLbMMvfZd67jH6/qC/s=;
        b=XFOLFGTlN/MqkJjULLZyEiOITrl8CrIt1RTvky9eLkzCpWW77zggBwV0Gd55u2YaVk
         dBD6bEY4c2RQ4aHsm05YGhiY7mImvxdmZAmRb+WoFBIrkFvmW/PjWEQbe3eX3iHq0URU
         nCHtZY4NKPd+/UxfHhWvE2Bud9g7oVHQAwWLlH25YnO0+0iCoNU40fx0h3CXY8YpTh8L
         WF6oQR9Ru/7DRObAHvT5iWwy1lyJTIUkOTpaqQKUMpNvRGmXOW3Rr5ETxMmBuQGz6A7c
         amV4kXrG5gLNPE/3UtRWPZHSjjQQ89lGxfFhBtnQF3gHEJItIXhxDGSGfsjgV87FfBRW
         6THw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789854753; x=1790459553;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4UB+obLd5sZwu+zoy2b+DbkHvLbMMvfZd67jH6/qC/s=;
        b=LCpYvmixUjUT0n6+jrnVuHifvX/JEd821Xa32wImM2/YtVCdIswSCdMqSKrXX4hziG
         OiXN/lr4uFEr8KKwCHhUadIGVGstBEMcLl3iYdYf+fH4D40yGmMO1sFdNe0kEvk3BB41
         63pmPFYpAF7S5aRQ13uqZps/3ejl/uvrl7N6I2t2kLrfuxFZrh/Dx5HdXpL1k/XAWDD+
         aoyt73lUtgwcM8KbUGWPRgJUREMV+/2wj2yG21PjV1pTy0jIISeZpq/F+AUiCKcbWGV/
         cZQV9fFrmarzFWYdTKQn2yRexKy6GDki90+cT7kOYOWD75NOrhHRdeUboVlCiOJALuS+
         NidQ==
X-Forwarded-Encrypted: i=1; AKwUvBzWVSFZlh9c/SPNw5s1QLjQy5CS8RFoLkPDH2gU9IRfyoIhdNWGHfu0NorJSBUpRMfX100demQm+On2UQs=@vger.kernel.org
X-Gm-Message-State: AFuF++n9DEVzVm9JlSg0XlcoFZEdTaL4VApTjpUVhVn79hhjlZsXvlWt
	psa2VQJepVv6MPpL448yaSHUY9PSEdzNs2vifpJAtFkbmrhM0PdX8cCE
X-Gm-Gg: AYBFou2PYfiyINpH3ZnGJKpWBdo+jW1fAWWR6DlDI4uQu93UvwP7oZgpycrdTll2Y5B
	bTjQYAC5FahvqRhCKveAKzmjt+8GTv9U6kufWL//c5aIJAYwqWIfzSXOX1DLp4c9ppYMdifpt87
	CmDQK9Ewft8qAVuIatxKmUiVpif0KbQr49SS5wHSj0l6NB7A8YhRoob0+sQl3BXQJzECGPEwkco
	iVZt1tCRc/4MooCkyisay3nHC2lQHLN16SRS2AAJajEtpk52IzP3a26RaHDVMSLLL1zZthP85pt
	uBrn4pqjfHz0V0tUJaI16/vJR6usevlF4N+63dmSS5wb2hEh0vXFaZ5coJyrujSYIiNiOTrh9fo
	pHktz0VTJFoJWqfiuVnWyRos+WIk2imY3MC8HIY/XtoyJnipBN9IbWyP4CqxprHjMk7d3kt9n4d
	A+3rZiXd/8oaF0FlZuXeKJubIXHZcyKnA2eLBBiK6Ef36D//3++9xB0hcA17mY/GnUvfscn9tTR
	0URDOGGo78ODN2JtkGd/QLWAoK4Gma4SqIITv/IJ4HZoJAV57ABCdL9DdfJM+7RsnAMuA46RHVk
	BwbcTGzVpQ==
X-Received: by 2002:a17:902:fc45:b0:2dd:c100:80b1 with SMTP id d9443c01a7336-2ddc100811dmr48563035ad.44.1789854753097;
        Sat, 19 Sep 2026 14:52:33 -0700 (PDT)
Received: from phui-2.c.googlers.com.com (67.51.127.34.bc.googleusercontent.com. [34.127.51.67])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ddc180395fsm12881915ad.81.2026.09.19.14.52.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 14:52:32 -0700 (PDT)
From: Hui Peng <benquike@gmail.com>
To: airlied@redhat.com,
	kraxel@redhat.com,
	dmitry.osipenko@collabora.com,
	gurchetansingh@chromium.org,
	olvaffe@gmail.com,
	tzimmermann@suse.de
Cc: dri-devel@lists.freedesktop.org,
	virtualization@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] drm/virtio: fix 0-byte blob ZERO_SIZE_PTR, GEM leak, and context_init rollback
Date: Sat, 19 Sep 2026 21:52:32 +0000
Message-ID: <20260919215232.3470178-1-benquike@gmail.com>
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix multiple issues in virtio-gpu VRAM mapping, blob creation, and context
initialization:

1. In virtio_gpu_vram_mmap(), set vram->map_state = STATE_ERR if deferred
   virtio_gpu_vram_map() fails so callers do not treat an unmapped VRAM
   node as valid.
2. In verify_blob(), reject rc_blob->size == 0 or size values that wrap
   PAGE_ALIGN() to prevent kvmalloc_array(0, ...) from returning
   ZERO_SIZE_PTR.
3. In virtio_gpu_gem_create(), virtio_gpu_resource_create_ioctl(), and
   virtio_gpu_resource_create_blob_ioctl(), use drm_gem_object_put()
   instead of drm_gem_object_release() on error so the BO's free callback
   is properly invoked.
4. In virtio_gpu_context_init_ioctl(), stage context parameters into local
   variables and only commit them to vfpriv after all parameters and
   ring_idx_mask have been validated.

Fixes: 16845c5d5409 ("drm/virtio: implement blob resources: implement vram object")
Fixes: 85c83ea915ed ("drm/virtio: implement context init: allocate an array of fence contexts")
Assisted-by: LLM
Signed-off-by: Hui Peng <benquike@gmail.com>
---
diff --git a/drivers/gpu/drm/virtio/virtgpu_gem.c b/drivers/gpu/drm/virtio/virtgpu_gem.c
index 66c3f6f74e9c..d2f0b8a3f172 100644
--- a/drivers/gpu/drm/virtio/virtgpu_gem.c
+++ b/drivers/gpu/drm/virtio/virtgpu_gem.c
@@ -45,7 +45,7 @@ static int virtio_gpu_gem_create(struct drm_file *file,
 
 	ret = drm_gem_handle_create(file, &obj->base.base, &handle);
 	if (ret) {
-		drm_gem_object_release(&obj->base.base);
+		drm_gem_object_put(&obj->base.base);
 		return ret;
 	}
 
diff --git a/drivers/gpu/drm/virtio/virtgpu_ioctl.c b/drivers/gpu/drm/virtio/virtgpu_ioctl.c
index 3d8e4ccdb7c1..fb7225d91752 100644
--- a/drivers/gpu/drm/virtio/virtgpu_ioctl.c
+++ b/drivers/gpu/drm/virtio/virtgpu_ioctl.c
@@ -185,7 +185,7 @@ static int virtio_gpu_resource_create_ioctl(struct drm_device *dev, void *data,
 
 	ret = drm_gem_handle_create(file, obj, &handle);
 	if (ret) {
-		drm_gem_object_release(obj);
+		drm_gem_object_put(obj);
 		return ret;
 	}
 
@@ -490,6 +490,9 @@ static int verify_blob(struct virtio_gpu_device *vgdev,
 			return -EINVAL;
 	}
 
+	if (rc_blob->size == 0 || rc_blob->size > ULONG_MAX - PAGE_SIZE + 1)
+		return -EINVAL;
+
 	params->blob_mem = rc_blob->blob_mem;
 	params->size = rc_blob->size;
 	params->blob = true;
@@ -557,14 +560,14 @@ static int virtio_gpu_resource_create_blob_ioctl(struct drm_device *dev,
 	if (params.blob_flags & VIRTGPU_BLOB_FLAG_USE_CROSS_DEVICE) {
 		ret = virtio_gpu_resource_assign_uuid(vgdev, bo);
 		if (ret) {
-			drm_gem_object_release(obj);
+			drm_gem_object_put(obj);
 			return ret;
 		}
 	}
 
 	ret = drm_gem_handle_create(file, obj, &handle);
 	if (ret) {
-		drm_gem_object_release(obj);
+		drm_gem_object_put(obj);
 		return ret;
 	}
 
@@ -616,6 +619,15 @@ static int virtio_gpu_context_init_ioctl(struct drm_device *dev,
 		goto out_unlock;
 	}
 
+	u32 context_init = vfpriv->context_init;
+	u32 num_rings = vfpriv->num_rings;
+	u64 ring_idx_mask = vfpriv->ring_idx_mask;
+	bool explicit_debug_name = vfpriv->explicit_debug_name;
+	bool num_rings_set = (vfpriv->base_fence_ctx != 0);
+	char debug_name[DEBUG_NAME_MAX_LEN];
+
+	memcpy(debug_name, vfpriv->debug_name, sizeof(debug_name));
+
 	for (i = 0; i < num_params; i++) {
 		param = ctx_set_params[i].param;
 		value = ctx_set_params[i].value;
@@ -633,16 +645,16 @@ static int virtio_gpu_context_init_ioctl(struct drm_device *dev,
 			}
 
 			/* Context capset ID already set */
-			if (vfpriv->context_init &
+			if (context_init &
 			    VIRTIO_GPU_CONTEXT_INIT_CAPSET_ID_MASK) {
 				ret = -EINVAL;
 				goto out_unlock;
 			}
 
-			vfpriv->context_init |= value;
+			context_init |= value;
 			break;
 		case VIRTGPU_CONTEXT_PARAM_NUM_RINGS:
-			if (vfpriv->base_fence_ctx) {
+			if (num_rings_set) {
 				ret = -EINVAL;
 				goto out_unlock;
 			}
@@ -652,30 +664,31 @@ static int virtio_gpu_context_init_ioctl(struct drm_device *dev,
 				goto out_unlock;
 			}
 
-			vfpriv->base_fence_ctx = dma_fence_context_alloc(value);
-			vfpriv->num_rings = value;
+			num_rings = value;
+			num_rings_set = true;
 			break;
 		case VIRTGPU_CONTEXT_PARAM_POLL_RINGS_MASK:
-			if (vfpriv->ring_idx_mask) {
+			if (ring_idx_mask) {
 				ret = -EINVAL;
 				goto out_unlock;
 			}
 
-			vfpriv->ring_idx_mask = value;
+			ring_idx_mask = value;
 			break;
 		case VIRTGPU_CONTEXT_PARAM_DEBUG_NAME:
-			if (vfpriv->explicit_debug_name) {
+			if (explicit_debug_name) {
 				ret = -EINVAL;
 				goto out_unlock;
 			}
 
-			ret = strncpy_from_user(vfpriv->debug_name,
+			memset(debug_name, 0, sizeof(debug_name));
+			ret = strncpy_from_user(debug_name,
 						u64_to_user_ptr(value),
 						DEBUG_NAME_MAX_LEN - 1);
 			if (ret < 0)
 				goto out_unlock;
 
-			vfpriv->explicit_debug_name = true;
+			explicit_debug_name = true;
 			ret = 0;
 			break;
 		default:
@@ -684,17 +697,28 @@ static int virtio_gpu_context_init_ioctl(struct drm_device *dev,
 		}
 	}
 
-	if (vfpriv->ring_idx_mask) {
+	if (ring_idx_mask) {
 		valid_ring_mask = 0;
-		for (i = 0; i < vfpriv->num_rings; i++)
+		for (i = 0; i < num_rings; i++)
 			valid_ring_mask |= 1ULL << i;
 
-		if (~valid_ring_mask & vfpriv->ring_idx_mask) {
+		if (~valid_ring_mask & ring_idx_mask) {
 			ret = -EINVAL;
 			goto out_unlock;
 		}
 	}
 
+	vfpriv->context_init = context_init;
+	if (num_rings_set && !vfpriv->base_fence_ctx) {
+		vfpriv->base_fence_ctx = dma_fence_context_alloc(num_rings);
+		vfpriv->num_rings = num_rings;
+	}
+	vfpriv->ring_idx_mask = ring_idx_mask;
+	if (explicit_debug_name && !vfpriv->explicit_debug_name) {
+		memcpy(vfpriv->debug_name, debug_name, sizeof(vfpriv->debug_name));
+		vfpriv->explicit_debug_name = true;
+	}
+
 	virtio_gpu_create_context_locked(vgdev, vfpriv);
 	virtio_gpu_notify(vgdev);
 
diff --git a/drivers/gpu/drm/virtio/virtgpu_vram.c b/drivers/gpu/drm/virtio/virtgpu_vram.c
index 5b4a3ab81cd5..aaeae38afc0e 100644
--- a/drivers/gpu/drm/virtio/virtgpu_vram.c
+++ b/drivers/gpu/drm/virtio/virtgpu_vram.c
@@ -248,7 +248,10 @@ void virtio_gpu_vram_map_deferred(struct virtio_gpu_object_vram *vram)
 		return;
 
 	mutex_lock(&map_lock);
-	if (!drm_mm_node_allocated(&vram->vram_node))
-		virtio_gpu_vram_map(&vram->base);
+	if (!drm_mm_node_allocated(&vram->vram_node)) {
+		vram->map_state = STATE_INITIALIZING;
+		if (virtio_gpu_vram_map(&vram->base))
+			vram->map_state = STATE_ERR;
+	}
 	mutex_unlock(&map_lock);
 }
