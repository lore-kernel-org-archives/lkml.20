Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49233314A60
	for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 09:45:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791711960; cv=none; b=bqbMRl8NtRbbo+iuOj6Sgg5suT69EiEsvbOZNcSJEqqI7WwFeL6lq4issrlQU51AJZbboH8eIiGF77gwko0MDshkjZTSNdYNqsIoFqFiAtn7HkjC0TLZGfYp7V4oyW0pvUhrEWQOtaLhpZ2N7tDjr0xA9B54DJbzFZN8s4IsXj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791711960; c=relaxed/simple;
	bh=wLfJxALuT1cZSnPavKZt4dn22slSqnr0uWglnuyHRWw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=usoEdLo0fms+FlpBcj2mBpq6Un1pjXFd6b7CySzlzr9m23V/2DIEaKM5ewRcWqkhUCX31v2lWw9M1BeS9/Yjg637R0kA/Yy0/4Rqk5dyQdcPYt4ZFhMUnTLKFO17dD0mJHr5T5E82cdB1MXb+IZZ4++dxBslj2J6ktkLdi0jDUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JNdUR6YA; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JNdUR6YA"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2e2c837fa12so3595665ad.1
        for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 02:45:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791711958; x=1792316758; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uN8ZmAJdRHfbn3ihN7mgkxsJ7YccZG0qSHKehDex714=;
        b=JNdUR6YAwGphZFc7zSOxDAgkYf8KO65+ZKwiXMrQcCxG2EhcfcHaBWVPcI2loA7tht
         Wi2VjiRmQIHu8LrwdMLnewlDIlK/DSOoGW0kM5qqV85SUmQpPtknxpXAw3R11vCZYbC4
         cjTBHLt5SsiL4j8TRHHSc3xDG29IrOJOdkun7LxWYVQi+Eruj/VNb+nGk6OyiNsDjI+y
         WcWQEk8LiW7+1dMxFj7qexXw7CFzhYS/eYBrg9F19dPF1fYNfC/LAXvE5jfUyo/2FJSW
         HoGBi8wW3g1DWX8J+jKP/8FVFz4cltRFVAJ9U5Rav9FEvQZebx4F1gkQZbu+qmb7t8PO
         LHpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791711958; x=1792316758;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uN8ZmAJdRHfbn3ihN7mgkxsJ7YccZG0qSHKehDex714=;
        b=l1dyiN5pjoNtZLpZbT6bcNVEOOoFTl6ejhXG5O3BDAobkzT/+G9M4RHIYySMhVvfXL
         uNgfGIZGxCCr1G5qT3jtvOMk33uCixS98Hr7kjv6TCRArw3QoHWM2oQb8HtCyeVf3o0C
         w3RrWFsIn7Ro0s1emc18bRAkDe1wRPeuZlTOkK4NamzcktqEhaSFctvQWiQrZSaHaIt2
         aEiV3QN2/TeUkWudlytL1deNq3ynPS2lGs3TMQof1iAL7Qwt/bK5qLMYWhsjY5VLpmbe
         7kxRl8S3XxI99nQ8TSShTYfzHK9LUWp/uskP0jcAql96jlknc/ghapiskp3H57EVkLHF
         MJ2A==
X-Forwarded-Encrypted: i=1; AKwUvBwnm4cJhhvLbcfqjirJd+HB7A0dCvqpdaAGTKkX3Vu51jvj+Ll+1CHlh69ZAlQmxJAN5aPTyPnm8ZGNy9E=@vger.kernel.org
X-Gm-Message-State: AFq9FYK2j5SQ9eFvm6CsrTgnwvuuz/RsT0KlPLWK+bvEBI9SIzyJ1miP
	uaHRE4FEHyCOwRHkqGgGLvV+tYzs6e4Z5vsnHsZTiitX0Ur/4gL8UdTF
X-Gm-Gg: AYBFou3vT4PI/2PQxfFN3eNjda97zE6jlNwwWuQQKC+BbfNxEKXIR52Z6BxmmPaiaGF
	JTlEnUBWYAHcSJOflvDlOqMwov7QVOkXG8sTzZCjvwpMprJzqM1Q+f39XIwyWDAAClBM0+ogRd4
	GBN5WXEqabKLFf3zjiwJQE80WWZzil8ihEA3C2dvFepDlN+tzaI5QubIkdo68kCdL78/SQ24L5R
	riWETMCulVtgc4T7fflwMJiG9768qS2QRwTDtqk+oa3EpDQdpJmiRHDG42Xs3sfqr7gCYsJl0NG
	XyYSUgKNeG1CO7r9Jv2c3yF5Jb7OY/tnWVPf9GluAsWLwYRLmZ4REKuJBAlGNbZfptG12bzw2Fx
	oFMgWsBOGys0opac1zZjjIm7DvooZmIJiRRFzIfo2xcEZcGzb8xe+eGEolqt++XX2HEUsQVYRHy
	d76GoIJlx063r8LUaNIbb0xI8uBB6WaydEqmBwu4s5xJ4+aM3A0eETrnqHtklVAmWbDRb5H3GE0
	MyMHg==
X-Received: by 2002:a17:903:1c7:b0:2e6:c39:b250 with SMTP id d9443c01a7336-2e842ab6808mr49774725ad.25.1791711958372;
        Sun, 11 Oct 2026 02:45:58 -0700 (PDT)
Received: from [127.0.1.1] ([121.125.115.175])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e8422ba80asm31067695ad.63.2026.10.11.02.45.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 02:45:57 -0700 (PDT)
From: Gyeyoung Baek <gye976@gmail.com>
Date: Sun, 11 Oct 2026 18:45:32 +0900
Subject: [PATCH v2 1/2] drm/imagination: Switch the GPUVM to immediate mode
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261011-pvr-gpuvm-immediate-v2-1-744ddc6644c3@gmail.com>
References: <20261011-pvr-gpuvm-immediate-v2-0-744ddc6644c3@gmail.com>
In-Reply-To: <20261011-pvr-gpuvm-immediate-v2-0-744ddc6644c3@gmail.com>
To: Alessio Belle <alessio.belle@imgtec.com>, 
 Luigi Santivetti <luigi.santivetti@imgtec.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: Alexandru Dadu <alexandru.dadu@imgtec.com>, 
 Brajesh Gupta <brajesh.gupta@imgtec.com>, 
 Frank Binns <frank.binns@imgtec.com>, imagination@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Gyeyoung Baek <gye976@gmail.com>
X-Mailer: b4 0.15.1

Use DRM_GPUVM_IMMEDIATE_MODE so that each GEM's GPUVA list is protected
by its gpuva.lock instead of its dma_resv. This prepares for
asynchronous VM_BIND, whose run_job() will update the GPUVA lists
before signalling its fence. That section imposes three rules:

1. No dma_resv: another thread may hold it while waiting for the job's
   fence, directly or through a dependency.
   -> Protect the lists with gpuva.lock, and take it around
      drm_gpuva_link().

2. No allocation under a lock run_job() takes: reclaim may wait for a
   fence that depends on the job.
   -> Allocate the vm_bo before taking gpuva.lock:
      drm_gpuvm_bo_obtain_locked() becomes drm_gpuvm_bo_create() +
      drm_gpuvm_bo_obtain_prealloc().

3. No freeing of GEM objects: that takes their dma_resv, and under
   gpuva.lock would free the held lock too.
   -> Defer it: drm_gpuva_unlink() and drm_gpuvm_bo_put() become
      drm_gpuva_unlink_defer() and drm_gpuvm_bo_put_deferred(), and
      drm_gpuvm_bo_deferred_cleanup() frees once the locks are dropped.

This also fixes an unlocked GPUVA list update: when a map fails,
pvr_vm_bind_op_fini() drops the last vm_bo reference without holding
the object's dma_resv.

Failing VM_MAP allocations with fail-nth shows
it on a lockdep kernel (real allocation failures under memory pressure
take the same path):

  WARNING: drivers/gpu/drm/drm_gpuvm.c:1661 at drm_gpuvm_bo_put+0x2ec/0x660 [drm_gpuvm]
  Call trace:
   drm_gpuvm_bo_put
   pvr_vm_bind_op_fini
   pvr_vm_map
   pvr_ioctl_vm_map

Fixes: ff5f643de0bf ("drm/imagination: Add GEM and VM related code")
Signed-off-by: Gyeyoung Baek <gye976@gmail.com>
---
 drivers/gpu/drm/imagination/pvr_vm.c | 39 +++++++++++++++++++++++++++---------
 1 file changed, 30 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/imagination/pvr_vm.c b/drivers/gpu/drm/imagination/pvr_vm.c
index cbdd15ed74f..807a01aab1d 100644
--- a/drivers/gpu/drm/imagination/pvr_vm.c
+++ b/drivers/gpu/drm/imagination/pvr_vm.c
@@ -214,7 +214,7 @@ static int pvr_vm_bind_op_exec(struct pvr_vm_bind_op *bind_op)
 
 static void pvr_vm_bind_op_fini(struct pvr_vm_bind_op *bind_op)
 {
-	drm_gpuvm_bo_put(bind_op->gpuvm_bo);
+	drm_gpuvm_bo_put_deferred(bind_op->gpuvm_bo);
 
 	kfree(bind_op->new_va);
 	kfree(bind_op->prev_va);
@@ -255,11 +255,11 @@ pvr_vm_bind_op_map_init(struct pvr_vm_bind_op *bind_op,
 
 	bind_op->type = PVR_VM_BIND_TYPE_MAP;
 
-	dma_resv_lock(obj->resv, NULL);
-	bind_op->gpuvm_bo = drm_gpuvm_bo_obtain_locked(&vm_ctx->gpuvm_mgr, obj);
-	dma_resv_unlock(obj->resv);
-	if (IS_ERR(bind_op->gpuvm_bo))
-		return PTR_ERR(bind_op->gpuvm_bo);
+	bind_op->gpuvm_bo = drm_gpuvm_bo_create(&vm_ctx->gpuvm_mgr, obj);
+	if (!bind_op->gpuvm_bo)
+		return -ENOMEM;
+
+	bind_op->gpuvm_bo = drm_gpuvm_bo_obtain_prealloc(bind_op->gpuvm_bo);
 
 	bind_op->new_va = kzalloc_obj(*bind_op->new_va);
 	bind_op->prev_va = kzalloc_obj(*bind_op->prev_va);
@@ -293,6 +293,8 @@ pvr_vm_bind_op_map_init(struct pvr_vm_bind_op *bind_op,
 
 err_bind_op_fini:
 	pvr_vm_bind_op_fini(bind_op);
+	/* Drain what fini() deferred. */
+	drm_gpuvm_bo_deferred_cleanup(&vm_ctx->gpuvm_mgr);
 
 	return err;
 }
@@ -366,7 +368,11 @@ pvr_vm_gpuva_map(struct drm_gpuva_op *op, void *op_ctx)
 		return err;
 
 	drm_gpuva_map(&ctx->vm_ctx->gpuvm_mgr, &ctx->new_va->base, &op->map);
+
+	mutex_lock(&op->map.gem.obj->gpuva.lock);
 	drm_gpuva_link(&ctx->new_va->base, ctx->gpuvm_bo);
+	mutex_unlock(&op->map.gem.obj->gpuva.lock);
+
 	ctx->new_va = NULL;
 
 	return 0;
@@ -396,7 +402,7 @@ pvr_vm_gpuva_unmap(struct drm_gpuva_op *op, void *op_ctx)
 		return err;
 
 	drm_gpuva_unmap(&op->unmap);
-	drm_gpuva_unlink(op->unmap.va);
+	drm_gpuva_unlink_defer(op->unmap.va);
 	kfree(to_pvr_vm_gpuva(op->unmap.va));
 
 	return 0;
@@ -418,6 +424,7 @@ pvr_vm_gpuva_unmap(struct drm_gpuva_op *op, void *op_ctx)
 static int
 pvr_vm_gpuva_remap(struct drm_gpuva_op *op, void *op_ctx)
 {
+	struct drm_gem_object *obj = op->remap.unmap->va->gem.obj;
 	/* The split parts belong to the object of the mapping being split. */
 	struct drm_gpuvm_bo *vm_bo = op->remap.unmap->va->vm_bo;
 	struct pvr_vm_bind_op *ctx = op_ctx;
@@ -435,16 +442,20 @@ pvr_vm_gpuva_remap(struct drm_gpuva_op *op, void *op_ctx)
 	drm_gpuva_remap(&ctx->prev_va->base, &ctx->next_va->base, &op->remap);
 
 	if (op->remap.prev) {
+		mutex_lock(&obj->gpuva.lock);
 		drm_gpuva_link(&ctx->prev_va->base, vm_bo);
+		mutex_unlock(&obj->gpuva.lock);
 		ctx->prev_va = NULL;
 	}
 
 	if (op->remap.next) {
+		mutex_lock(&obj->gpuva.lock);
 		drm_gpuva_link(&ctx->next_va->base, vm_bo);
+		mutex_unlock(&obj->gpuva.lock);
 		ctx->next_va = NULL;
 	}
 
-	drm_gpuva_unlink(op->remap.unmap->va);
+	drm_gpuva_unlink_defer(op->remap.unmap->va);
 	kfree(to_pvr_vm_gpuva(op->remap.unmap->va));
 
 	return 0;
@@ -588,7 +599,8 @@ pvr_vm_create_context(struct pvr_device *pvr_dev, bool is_userspace_context)
 	drm_gem_private_object_init(&pvr_dev->base, &vm_ctx->dummy_gem, 0);
 	drm_gpuvm_init(&vm_ctx->gpuvm_mgr,
 		       is_userspace_context ? "PowerVR-user-VM" : "PowerVR-FW-VM",
-		       0, &pvr_dev->base, &vm_ctx->dummy_gem,
+		       DRM_GPUVM_IMMEDIATE_MODE, &pvr_dev->base,
+		       &vm_ctx->dummy_gem,
 		       0, 1ULL << device_addr_bits, 0, 0, &pvr_vm_gpuva_ops);
 
 	mutex_init(&vm_ctx->lock);
@@ -622,6 +634,7 @@ pvr_vm_context_release(struct kref *ref_count)
 		pvr_fw_object_destroy(vm_ctx->fw_mem_ctx_obj);
 
 	pvr_vm_unmap_all(vm_ctx);
+	drm_gpuvm_bo_deferred_cleanup(&vm_ctx->gpuvm_mgr);
 
 	pvr_mmu_context_destroy(vm_ctx->mmu_ctx);
 	drm_gem_private_object_fini(&vm_ctx->dummy_gem);
@@ -758,7 +771,9 @@ pvr_vm_map(struct pvr_vm_context *vm_ctx, struct pvr_gem_object *pvr_obj,
 
 err_cleanup:
 	mutex_unlock(&vm_ctx->lock);
+
 	pvr_vm_bind_op_fini(&bind_op);
+	drm_gpuvm_bo_deferred_cleanup(&vm_ctx->gpuvm_mgr);
 
 	return err;
 }
@@ -840,6 +855,8 @@ pvr_vm_unmap_obj(struct pvr_vm_context *vm_ctx, struct pvr_gem_object *pvr_obj,
 	err = pvr_vm_unmap_obj_locked(vm_ctx, pvr_obj, device_addr, size);
 	mutex_unlock(&vm_ctx->lock);
 
+	drm_gpuvm_bo_deferred_cleanup(&vm_ctx->gpuvm_mgr);
+
 	return err;
 }
 
@@ -874,6 +891,8 @@ pvr_vm_unmap(struct pvr_vm_context *vm_ctx, u64 device_addr, u64 size)
 
 	mutex_unlock(&vm_ctx->lock);
 
+	drm_gpuvm_bo_deferred_cleanup(&vm_ctx->gpuvm_mgr);
+
 	return err;
 }
 
@@ -906,6 +925,8 @@ pvr_vm_unmap_all(struct pvr_vm_context *vm_ctx)
 	}
 
 	mutex_unlock(&vm_ctx->lock);
+
+	drm_gpuvm_bo_deferred_cleanup(&vm_ctx->gpuvm_mgr);
 }
 
 /* Static data areas are determined by firmware. */

-- 
2.43.0

