Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7044438D3E2
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 21:52:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789854755; cv=none; b=Bf1pWJzj7rc8W6wg63UX4X5Sa8T35id5ul/cSaRgO1/tEzyU9Fe5Go3P5gHmTokNv6fRTh9VNE4pYkVRYLjPmSA4UlWFgwMbJOT/DB0SyMwBxfDCowH2QzVSK6iuOrBcuEpIwdag3yAYZrjQTaLVdDEY2dSCHOo4QhzbBNgum3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789854755; c=relaxed/simple;
	bh=9yuO5KXbOK/08p3RlNO1K7/NdhOb1G/L6OYxmV8Wr4Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jJR5BpFQI7wYx0DEXMeOX/rq6r8JVveU+KeIKE/rk1BPyULTZcd9CTdp031EJjMJOa5uZ/j2UpMrR3TIALIaaI/6e+1NoAgyLk0KtZhOWMjtf4qYvMfutu4WdsJmNDT9/lobWRj43nNeKnLiikuahUqFZwdM9zqP/B4A0OptRNo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R5y0RHqc; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R5y0RHqc"
Received: by mail-pz2-f12.google.com with SMTP id 41be03b00d2f7-cc1cea4bfd1so1259712a12.0
        for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 14:52:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789854750; x=1790459550; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=yZR1kJTIFhYaQpHtrWrOMcaguRcRLF/FBEkvIPgknSM=;
        b=R5y0RHqcGHMIkFrJvXe6bam3FkECu71SOIb4+16GgNWAH/XaqNbStPDa10tiOpWbN/
         WLZavGmM8D8T7Fp8WAUEYcAfe7S7eLNxTYpn5vmZUHzanb42bqShzNmWjjioe4FNKYGj
         FK1mC+jhG15OQqz5u+9YY9il8bZZ7MjS+zzdTOq9RpZqHi+7/a52txgWkB+QcPTKBYXQ
         H6rTOjTIM0p5vQqpzvRp2wgoNWF4mEr3p53eIFhSeD1kUMsHpLiuBhneGfft8a2wA4XH
         6HDo0IrUAA8RFpFgyRxlcDD0Q7CxfDz8eQ2JjE6hOx4XEb0hGCQ8X0T9WNgRGUhkMxHe
         E9RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789854750; x=1790459550;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yZR1kJTIFhYaQpHtrWrOMcaguRcRLF/FBEkvIPgknSM=;
        b=NQAEnOEUWXxjb5MfYwpBkZuvpjEm6NLlm5ZOE4xp4pSTg3AqyJDXwWCt5QdEYme+Mz
         6yBqHxcj/ekRLd78IMXXVO70MTIkafcnRCiDsECnYWYbzcUiEwTL0o27z6dQL69XxJ0H
         /R7nIqGotMy4/xFup1D8LQ7y73ghz6PXlj43rKJEm2rHbfjJBTBohLLCfeNhWZzkg13E
         cfBLe2fyNG9xfeKEBQiqYPKrxnY/Z3kaNcyRS4oQr3p71W/T0zSBG6DlkS+uqgvuU7fb
         alGoy/MLDq7kh9wllt5lJDXw+uhK+ZkuYCxf6a6wjKp8FQ6HYa+c4wM7I+B5lEOJUXe6
         JO/A==
X-Forwarded-Encrypted: i=1; AKwUvBz0gZbv66HtiHZRIJZ56326B6KVQmtL9yZMVb/mgIeD5IzpYJ+7/BDX4yXXF+7Li6N8AxF1UkfdOjNHgwY=@vger.kernel.org
X-Gm-Message-State: AFuF++lbYjNu419X7fAaiuXuQF1DPMSohEN78fD38oug9Fe/ZMm8L6QG
	7hDqCjcX80kv5EKPWuh68C1OgTxC8AvSdjahbxSv5qxgG0GcjyoqT+LT
X-Gm-Gg: AYBFou2ta9ZdJZRwYRzkDl/INH2ZUzdLTR2CejsHA0mB40gwR40fRHCjuOAhYGcspr1
	OshLyP40PcXnvbi3wnPnAacgry/yIdDxAlJbCRkbTCb2DFHTcjngCJQ5/xYqi80YLW+4kTwRfnA
	AF7YxXD6HOLbRNemztj5XXUZR7yxZfCAIGCtfxf6AgtaYcNzsFdUTBjn6BufzSE4QMv0qpg8V69
	PJZzSxJ8GwWvJa2waUufSPKt4bq/0pZilNxAprktwXXLgCHha/Za36zPppPWOtEf+rQryJCWLyp
	vyr8D8Igr5ZOEFb90DRwXTZ3nLPYi/kta1EN3nwxfs7GGvq+SIsi6IUQh9rf9D3ACaOXLRDvjLX
	juLBdMxc2GJWYumP2AmMEO6k2OPvoQOruD1+O+4QcqJza6HJ3YjrE+Bzh5kkzFUl0mGpHD9ZnMD
	N3PmeUf+vTLnc/jD+pCwzY6QYBJjmIyMAUcWhg9vwsgtQkBlAMPcqLLqHIuKJ96L8RXOThuzZ3z
	kxvYce7L4allwgMBRZEssHpcO7lfWver67aX/0PgbKrKkJpJ/XbDjsZsV6811kXqSA/NFDqVyyL
	Ma7EKlrytA==
X-Received: by 2002:a05:6a21:7a96:b0:3dd:a00a:7ac2 with SMTP id adf61e73a8af0-3dda00a9eb0mr4646460637.47.1789854750278;
        Sat, 19 Sep 2026 14:52:30 -0700 (PDT)
Received: from phui-2.c.googlers.com.com (67.51.127.34.bc.googleusercontent.com. [34.127.51.67])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc72ae724dasm1280357a12.9.2026.09.19.14.52.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 14:52:29 -0700 (PDT)
From: Hui Peng <benquike@gmail.com>
To: airlied@redhat.com,
	kraxel@redhat.com,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	simona@ffwll.ch
Cc: virtualization@lists.linux.dev,
	spice-devel@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] drm/qxl: fix vmalloc OOB write, surface size overflow, and BO reloc leaks
Date: Sat, 19 Sep 2026 21:52:28 +0000
Message-ID: <20260919215228.3469508-1-benquike@gmail.com>
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix multiple memory safety and resource management bugs in the QXL ioctl
and buffer object paths:

1. In qxl_bo_kmap_atomic_page(), page_offset is already a byte offset
   (reloc_info->dst_offset & PAGE_MASK), yet the fallback kptr and
   ttm_bo_vmap paths multiply page_offset by PAGE_SIZE a second time,
   causing a +16 MiB out-of-bounds kernel vmalloc write when applying
   relocations in qxl_process_single_command(). Add page_offset directly
   and validate reloc.dst_offset against dst_bo->tbo.base.size and
   cmd->command_size.
2. In qxl_alloc_surf_ioctl(), param->stride * param->height is computed
   using 32-bit signed arithmetic and param->stride == INT_MIN overflows
   on negation, allowing a 4 GiB surface to wrap to a 4 KiB GEM BO. Use
   check_mul_overflow() and check_add_overflow() with size_t.
3. In qxl_process_single_command(), prevent overwriting the union
   qxl_release_info header at offset 0 of cmd_bo, and reserve/unreserve
   non-command dst_bo buffers around apply_reloc()/apply_surf_reloc().
4. In qxl_bo_create(), reject size == 0 or size > ULONG_MAX - PAGE_SIZE + 1
   before roundup(), and in qxl_bo_check_id(), deallocate bo->surface_id
   if qxl_hw_surface_alloc() fails.

Fixes: f64122c1f6ad ("drm: add new QXL driver. (v1.4)")
Assisted-by: LLM
Signed-off-by: Hui Peng <benquike@gmail.com>
---
diff --git a/drivers/gpu/drm/qxl/qxl_drv.h b/drivers/gpu/drm/qxl/qxl_drv.h
index cc02b5f10ad9..4978208ce80b 100644
--- a/drivers/gpu/drm/qxl/qxl_drv.h
+++ b/drivers/gpu/drm/qxl/qxl_drv.h
@@ -297,7 +297,7 @@ int qxl_destroy_monitors_object(struct qxl_device *qdev);
 /* qxl_gem.c */
 void qxl_gem_init(struct qxl_device *qdev);
 void qxl_gem_fini(struct qxl_device *qdev);
-int qxl_gem_object_create(struct qxl_device *qdev, int size,
+int qxl_gem_object_create(struct qxl_device *qdev, size_t size,
 			  int alignment, int initial_domain,
 			  bool discardable, bool kernel,
 			  struct qxl_surface *surf,
diff --git a/drivers/gpu/drm/qxl/qxl_gem.c b/drivers/gpu/drm/qxl/qxl_gem.c
index 4939b57a2a48..bcd4d0b6c4fc 100644
--- a/drivers/gpu/drm/qxl/qxl_gem.c
+++ b/drivers/gpu/drm/qxl/qxl_gem.c
@@ -43,7 +43,7 @@ void qxl_gem_object_free(struct drm_gem_object *gobj)
 	ttm_bo_fini(tbo);
 }
 
-int qxl_gem_object_create(struct qxl_device *qdev, int size,
+int qxl_gem_object_create(struct qxl_device *qdev, size_t size,
 			  int alignment, int initial_domain,
 			  bool discardable, bool kernel,
 			  struct qxl_surface *surf,
@@ -60,7 +60,7 @@ int qxl_gem_object_create(struct qxl_device *qdev, int size,
 	if (r) {
 		if (r != -ERESTARTSYS)
 			DRM_ERROR(
-			"Failed to allocate GEM object (%d, %d, %u, %d)\n",
+			"Failed to allocate GEM object (%zu, %d, %u, %d)\n",
 				  size, initial_domain, alignment, r);
 		return r;
 	}
diff --git a/drivers/gpu/drm/qxl/qxl_ioctl.c b/drivers/gpu/drm/qxl/qxl_ioctl.c
index 591b026ceff9..6bb609bc6a7e 100644
--- a/drivers/gpu/drm/qxl/qxl_ioctl.c
+++ b/drivers/gpu/drm/qxl/qxl_ioctl.c
@@ -89,6 +89,8 @@ apply_reloc(struct qxl_device *qdev, struct qxl_reloc_info *info)
 	void *reloc_page;
 
 	reloc_page = qxl_bo_kmap_atomic_page(qdev, info->dst_bo, info->dst_offset & PAGE_MASK);
+	if (!reloc_page)
+		return;
 	*(uint64_t *)(reloc_page + (info->dst_offset & ~PAGE_MASK)) = qxl_bo_physical_address(qdev,
 											      info->src_bo,
 											      info->src_offset);
@@ -105,6 +107,8 @@ apply_surf_reloc(struct qxl_device *qdev, struct qxl_reloc_info *info)
 		id = info->src_bo->surface_id;
 
 	reloc_page = qxl_bo_kmap_atomic_page(qdev, info->dst_bo, info->dst_offset & PAGE_MASK);
+	if (!reloc_page)
+		return;
 	*(uint32_t *)(reloc_page + (info->dst_offset & ~PAGE_MASK)) = id;
 	qxl_bo_kunmap_atomic_page(qdev, info->dst_bo, reloc_page);
 }
@@ -161,7 +165,7 @@ static int qxl_process_single_command(struct qxl_device *qdev,
 		return -EINVAL;
 	}
 
-	if (cmd->command_size > PAGE_SIZE - sizeof(union qxl_release_info))
+	if (cmd->command_size > 256 - sizeof(union qxl_release_info))
 		return -EINVAL;
 
 	if (!access_ok(u64_to_user_ptr(cmd->command),
@@ -188,7 +192,8 @@ static int qxl_process_single_command(struct qxl_device *qdev,
 		 u64_to_user_ptr(cmd->command), cmd->command_size);
 
 	{
-		struct qxl_drawable *draw = fb_cmd;
+		struct qxl_drawable *draw =
+			fb_cmd + (release->release_offset & ~PAGE_MASK);
 
 		draw->mm_time = qdev->rom->mm_clock;
 	}
@@ -204,6 +209,7 @@ static int qxl_process_single_command(struct qxl_device *qdev,
 	for (i = 0; i < cmd->relocs_num; ++i) {
 		struct drm_qxl_reloc reloc;
 		struct drm_qxl_reloc __user *u = u64_to_user_ptr(cmd->relocs);
+		size_t reloc_size;
 
 		if (copy_from_user(&reloc, u + i, sizeof(reloc))) {
 			ret = -EFAULT;
@@ -219,14 +225,29 @@ static int qxl_process_single_command(struct qxl_device *qdev,
 			goto out_free_bos;
 		}
 		reloc_info[i].type = reloc.reloc_type;
+		reloc_size = (reloc.reloc_type == QXL_RELOC_TYPE_BO) ?
+			     sizeof(uint64_t) : sizeof(uint32_t);
 
 		if (reloc.dst_handle) {
 			ret = qxlhw_handle_to_bo(file_priv, reloc.dst_handle, release,
 						 &reloc_info[i].dst_bo);
 			if (ret)
 				goto out_free_bos;
+			if (reloc.dst_offset > reloc_info[i].dst_bo->tbo.base.size ||
+			    reloc_info[i].dst_bo->tbo.base.size - reloc.dst_offset < reloc_size ||
+			    (reloc.dst_offset & ~PAGE_MASK) > PAGE_SIZE - reloc_size) {
+				ret = -EINVAL;
+				goto out_free_bos;
+			}
 			reloc_info[i].dst_offset = reloc.dst_offset;
 		} else {
+			if (cmd->command_size < reloc_size ||
+			    reloc.dst_offset < sizeof(union qxl_release_info) ||
+			    reloc.dst_offset > sizeof(union qxl_release_info) +
+					       cmd->command_size - reloc_size) {
+				ret = -EINVAL;
+				goto out_free_bos;
+			}
 			reloc_info[i].dst_bo = cmd_bo;
 			reloc_info[i].dst_offset = reloc.dst_offset + release->release_offset;
 		}
@@ -323,14 +344,17 @@ int qxl_update_area_ioctl(struct drm_device *dev, void *data, struct drm_file *f
 		qxl_ttm_placement_from_domain(qobj, qobj->type);
 		ret = ttm_bo_validate(&qobj->tbo, &qobj->placement, &ctx);
 		if (unlikely(ret))
-			goto out;
+			goto out2;
 	}
 
 	ret = qxl_bo_check_id(qdev, qobj);
 	if (ret)
 		goto out2;
-	if (!qobj->surface_id)
+	if (!qobj->surface_id) {
 		DRM_ERROR("got update area for surface with no id %d\n", update_area->handle);
+		ret = -EINVAL;
+		goto out2;
+	}
 	ret = qxl_io_update_area(qdev, qobj, &area);
 
 out2:
@@ -386,12 +410,18 @@ int qxl_alloc_surf_ioctl(struct drm_device *dev, void *data, struct drm_file *fi
 	struct drm_qxl_alloc_surf *param = data;
 	int handle;
 	int ret;
-	int size, actual_stride;
+	size_t size, actual_stride;
 	struct qxl_surface surf;
 
+	if (param->stride == INT_MIN || param->stride == 0 || param->height == 0)
+		return -EINVAL;
+
 	/* work out size allocate bo with handle */
-	actual_stride = param->stride < 0 ? -param->stride : param->stride;
-	size = actual_stride * param->height + actual_stride;
+	actual_stride = param->stride < 0 ? -(size_t)param->stride : (size_t)param->stride;
+	if (check_mul_overflow(actual_stride, (size_t)param->height, &size) ||
+	    check_add_overflow(size, actual_stride, &size) ||
+	    size > INT_MAX)
+		return -EINVAL;
 
 	surf.format = param->format;
 	surf.width = param->width;
diff --git a/drivers/gpu/drm/qxl/qxl_object.c b/drivers/gpu/drm/qxl/qxl_object.c
index 313f6c30cac8..d54d5b4a6f68 100644
--- a/drivers/gpu/drm/qxl/qxl_object.c
+++ b/drivers/gpu/drm/qxl/qxl_object.c
@@ -116,6 +116,8 @@ int qxl_bo_create(struct qxl_device *qdev, unsigned long size,
 	else
 		type = ttm_bo_type_device;
 	*bo_ptr = NULL;
+	if (size == 0 || size > ULONG_MAX - PAGE_SIZE + 1)
+		return -EINVAL;
 	bo = kzalloc_obj(struct qxl_bo);
 	if (bo == NULL)
 		return -ENOMEM;
@@ -165,10 +167,8 @@ int qxl_bo_vmap_locked(struct qxl_bo *bo, struct iosys_map *map)
 	}
 
 	r = ttm_bo_vmap(&bo->tbo, &bo->map);
-	if (r) {
-		qxl_bo_unpin_locked(bo);
+	if (r)
 		return r;
-	}
 	bo->map_count = 1;
 
 	/* TODO: Remove kptr in favor of map everywhere. */
@@ -223,7 +223,7 @@ void *qxl_bo_kmap_atomic_page(struct qxl_device *qdev,
 	return io_mapping_map_atomic_wc(map, offset + page_offset);
 fallback:
 	if (bo->kptr) {
-		rptr = bo->kptr + (page_offset * PAGE_SIZE);
+		rptr = bo->kptr + page_offset;
 		return rptr;
 	}
 
@@ -232,7 +232,7 @@ void *qxl_bo_kmap_atomic_page(struct qxl_device *qdev,
 		return NULL;
 	rptr = bo_map.vaddr; /* TODO: Use mapping abstraction properly */
 
-	rptr += page_offset * PAGE_SIZE;
+	rptr += page_offset;
 	return rptr;
 }
 
@@ -395,8 +395,11 @@ int qxl_bo_check_id(struct qxl_device *qdev, struct qxl_bo *bo)
 			return ret;
 
 		ret = qxl_hw_surface_alloc(qdev, bo);
-		if (ret)
+		if (ret) {
+			qxl_surface_id_dealloc(qdev, bo->surface_id);
+			bo->surface_id = 0;
 			return ret;
+		}
 	}
 	return 0;
 }
