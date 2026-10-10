Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE170327C08
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 17:22:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791652961; cv=none; b=ZpJ+W3Op5xNYEF+s7ZMpKr3TxZfBcocMaZRjoXX6pOoLyxSEadtHfTR1zNwhnH1taZFb5xQJFTTTJQkgci4+LDUVOCTbl8Sk42+iQq4NrJyfNemxzXkLblMJCZNCvKfHbok7el3FpK+cg1OpF6JDjLfbrHpAOh3x8Njhfjl6NSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791652961; c=relaxed/simple;
	bh=ArA7/cyybb/ytVnOjsZoMydpCsrCz71v8RB5zvglvsY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ozI4wjRgLeYTNYkEOgxPNNiE1xAPp1HQwJ7rZPWQylCLo/kCzZKui25fcD76LqrvBXe3TV4CXhODadkI/7Q9qc+K0XuBG7kZp4EtTknxqSA83yarLke0Bpa3klshdIzm+dhWN6CbKeTia7iW1i0IB69UgVALec9yv9yZMgBgHws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dhka4dPx; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dhka4dPx"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-8899a204034so279602b3a.2
        for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 10:22:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791652959; x=1792257759; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hR9991eIWnfzDlxFtx+UedoUNTrLPMpEu26Tgl8wdrs=;
        b=dhka4dPxBVkZzhvj3Y85TsuAgQXFnRtoDt90SzbxHUJZn6odDXUbe+m4i+yNOWxWt5
         gC6IwcLX8EyDt6+kIz5qzUQlNcjme3WFEEOFnNuLb63B29WkvE41QTgq82StZpbbPtSv
         hRe0BIKxRWC/qBJApNjoaofRvVL/7PpQPYaBfxHXonGDjJotcRnQPSIt1oiPA5B67Gvu
         ozNZ7u6X7it1wIsHM2muRLf/WiSv56taLgtM9wmCnpnJFKWb0iWfICd9vc70/xAblQ/Z
         iXIpLeOX2Avy/iHHt1pBhwGDxgWiuEJzm8SU3MkB4/Z9xTK1swJiLye5V1kuEJDYTfF+
         4POw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791652959; x=1792257759;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hR9991eIWnfzDlxFtx+UedoUNTrLPMpEu26Tgl8wdrs=;
        b=eDMgSUXw+DdIZLPF/h11Bis9jJ3soOVFhSD4gJdgFZJpkWmSMPZYpxYRzigQIGugHS
         8xXxesrm7MQaOqWyUXa9VLT4WklO9OwJWUgIz/V8p3ZsnHo6SJTdpESH2l6CvBGyYAoW
         /FFb5EFP9M6TMr5DcOH/GUgQcMq6JjPEBo2qFxDy5Ys5skL4VDx5Utij7N14u8NNke4Z
         5LFEZhtZTcA+r/qMKKeH5M8grCCkHHb8aLbrfJ5+CLHkkLbKtP1W0HdNdifJXNiT5N8H
         RYEm6MK8p2hLWGfTILwxGciSZp6HZeW8R14vMq/NadrWmoMh5JGMglloHVebJS5r8vW6
         vTZw==
X-Forwarded-Encrypted: i=1; AKwUvBxJb7Nuo5J2WiwPfZ7aPE+NzYGrG9KH92CTMTiMjtrJev56yE0i4L163aHi+cEH5nero+yE2tTnZk3T3CU=@vger.kernel.org
X-Gm-Message-State: AFq9FYJeYGBuAbfX8FaFw1wPXrn9LG+qTP7BUzch9vRyfwOjRP1qxvAm
	9DljLEwifqermIgRz8lY+cmiPEva5C1SXere1QPPLTqcVRs/g5v5mmoQ
X-Gm-Gg: AYBFou0CUhMR0frb8YUr2kze8LkfKYq/fh6AqhTztwf6HiiBVPoiByK+ktEduW2UBk0
	3nk65cFeajUfRlg8+hraJP6dEpkHqhSsMSTxbGnzPhPVOilATkzY3H9QFnk5mPua61Ycezl70c2
	+QiWp4xIgshPKEw5S151O52/7+71DWathv4N7OmsfT/asZpPnN6u/aR1McWRacgtPw/eUj4RGdV
	rpOg5g2rwOzSRRYT4di/kaCpRAieHK3zoefddKci8QCcEHcfZ1H7EOPaTPYLCQkYC8YFg2Jh0eO
	eNj1fY/YXTkgA0ws2tARFPz9LgGABZXOejqiVQwbEEhNR8LiCc09Fk5C359Deurwws4Czqw1CyA
	rmDzTCCN5342KUQgBWOH3ZrqcrSoVKYC4o4LT/HN02Atm3Ii91RfJaoIKwgW6thPfPtHIy7Ujcf
	2QXhzQP5UbEgNsFD3zHy0W6+1ZP6+URKKs6wN1maCAONOMDvsRooInfWegpA7KbJY5hHg=
X-Received: by 2002:a05:6a20:db0c:b0:3de:3ab8:d1ae with SMTP id adf61e73a8af0-3e16be9397amr3933052637.48.1791652958879;
        Sat, 10 Oct 2026 10:22:38 -0700 (PDT)
Received: from [127.0.1.1] ([121.125.115.175])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-898802de7d6sm1510213b3a.23.2026.10.10.10.22.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 10:22:38 -0700 (PDT)
From: Gyeyoung Baek <gye976@gmail.com>
Date: Sun, 11 Oct 2026 02:22:20 +0900
Subject: [PATCH 1/2] drm/imagination: Switch the GPUVM to immediate mode
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261011-pvr-gpuvm-immediate-v1-1-5b298dfce4f8@gmail.com>
References: <20261011-pvr-gpuvm-immediate-v1-0-5b298dfce4f8@gmail.com>
In-Reply-To: <20261011-pvr-gpuvm-immediate-v1-0-5b298dfce4f8@gmail.com>
To: Alessio Belle <alessio.belle@imgtec.com>, 
 Luigi Santivetti <luigi.santivetti@imgtec.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: Alexandru Dadu <alexandru.dadu@imgtec.com>, 
 Brajesh Gupta <brajesh.gupta@imgtec.com>, 
 Frank Binns <frank.binns@imgtec.com>, Danilo Krummrich <dakr@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, imagination@lists.freedesktop.org, 
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
 drivers/gpu/drm/imagination/pvr_vm.c | 37 +++++++++++++++++++++++++++---------
 1 file changed, 28 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/imagination/pvr_vm.c b/drivers/gpu/drm/imagination/pvr_vm.c
index cbdd15ed74f..3921b765688 100644
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
@@ -366,7 +366,11 @@ pvr_vm_gpuva_map(struct drm_gpuva_op *op, void *op_ctx)
 		return err;
 
 	drm_gpuva_map(&ctx->vm_ctx->gpuvm_mgr, &ctx->new_va->base, &op->map);
+
+	mutex_lock(&op->map.gem.obj->gpuva.lock);
 	drm_gpuva_link(&ctx->new_va->base, ctx->gpuvm_bo);
+	mutex_unlock(&op->map.gem.obj->gpuva.lock);
+
 	ctx->new_va = NULL;
 
 	return 0;
@@ -396,7 +400,7 @@ pvr_vm_gpuva_unmap(struct drm_gpuva_op *op, void *op_ctx)
 		return err;
 
 	drm_gpuva_unmap(&op->unmap);
-	drm_gpuva_unlink(op->unmap.va);
+	drm_gpuva_unlink_defer(op->unmap.va);
 	kfree(to_pvr_vm_gpuva(op->unmap.va));
 
 	return 0;
@@ -418,6 +422,7 @@ pvr_vm_gpuva_unmap(struct drm_gpuva_op *op, void *op_ctx)
 static int
 pvr_vm_gpuva_remap(struct drm_gpuva_op *op, void *op_ctx)
 {
+	struct drm_gem_object *obj = op->remap.unmap->va->gem.obj;
 	/* The split parts belong to the object of the mapping being split. */
 	struct drm_gpuvm_bo *vm_bo = op->remap.unmap->va->vm_bo;
 	struct pvr_vm_bind_op *ctx = op_ctx;
@@ -435,16 +440,20 @@ pvr_vm_gpuva_remap(struct drm_gpuva_op *op, void *op_ctx)
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
@@ -588,7 +597,8 @@ pvr_vm_create_context(struct pvr_device *pvr_dev, bool is_userspace_context)
 	drm_gem_private_object_init(&pvr_dev->base, &vm_ctx->dummy_gem, 0);
 	drm_gpuvm_init(&vm_ctx->gpuvm_mgr,
 		       is_userspace_context ? "PowerVR-user-VM" : "PowerVR-FW-VM",
-		       0, &pvr_dev->base, &vm_ctx->dummy_gem,
+		       DRM_GPUVM_IMMEDIATE_MODE, &pvr_dev->base,
+		       &vm_ctx->dummy_gem,
 		       0, 1ULL << device_addr_bits, 0, 0, &pvr_vm_gpuva_ops);
 
 	mutex_init(&vm_ctx->lock);
@@ -622,6 +632,7 @@ pvr_vm_context_release(struct kref *ref_count)
 		pvr_fw_object_destroy(vm_ctx->fw_mem_ctx_obj);
 
 	pvr_vm_unmap_all(vm_ctx);
+	drm_gpuvm_bo_deferred_cleanup(&vm_ctx->gpuvm_mgr);
 
 	pvr_mmu_context_destroy(vm_ctx->mmu_ctx);
 	drm_gem_private_object_fini(&vm_ctx->dummy_gem);
@@ -758,7 +769,9 @@ pvr_vm_map(struct pvr_vm_context *vm_ctx, struct pvr_gem_object *pvr_obj,
 
 err_cleanup:
 	mutex_unlock(&vm_ctx->lock);
+
 	pvr_vm_bind_op_fini(&bind_op);
+	drm_gpuvm_bo_deferred_cleanup(&vm_ctx->gpuvm_mgr);
 
 	return err;
 }
@@ -840,6 +853,8 @@ pvr_vm_unmap_obj(struct pvr_vm_context *vm_ctx, struct pvr_gem_object *pvr_obj,
 	err = pvr_vm_unmap_obj_locked(vm_ctx, pvr_obj, device_addr, size);
 	mutex_unlock(&vm_ctx->lock);
 
+	drm_gpuvm_bo_deferred_cleanup(&vm_ctx->gpuvm_mgr);
+
 	return err;
 }
 
@@ -874,6 +889,8 @@ pvr_vm_unmap(struct pvr_vm_context *vm_ctx, u64 device_addr, u64 size)
 
 	mutex_unlock(&vm_ctx->lock);
 
+	drm_gpuvm_bo_deferred_cleanup(&vm_ctx->gpuvm_mgr);
+
 	return err;
 }
 
@@ -906,6 +923,8 @@ pvr_vm_unmap_all(struct pvr_vm_context *vm_ctx)
 	}
 
 	mutex_unlock(&vm_ctx->lock);
+
+	drm_gpuvm_bo_deferred_cleanup(&vm_ctx->gpuvm_mgr);
 }
 
 /* Static data areas are determined by firmware. */

-- 
2.43.0

