Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794115007;
	b=kn5NwqOiKRGjBm04m6H1A0gawJsVhMKjnJMBUq/FMguT3q+63NF63ETu/WOFTasKvMW/
	 9IBV6Zo3uKhXCIPnsnRWmkx6G96/isl2Oevz0Ws5o0Xu5Z7Au1mTOutBdeGmXnnqCkN5d
	 QA8yKeFyfNdTjgHZS1JKECUD4eZ7fmLUU3Aw9kbGIs14gc53qJPiW/RHtnAQuOilFW6Js
	 aln7aeA//oFRpcMLqVkMeykp+vEbp3bEp7EwlOvRELzkgNjRRQvPo50a9Ol5olC1TYiHW
	 IlxObSLrID4wry4+cZJPqHzSzRLUpJxutc6cAOx2hb7yvDapNXl2FS7QL1QItrUpqtA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794115007;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=YVx8EibVSDmqX/AcJMPqICHqAKqCDOESNCCkjO2gyzE=;
	b=oZjoQSVqLtxP7pyQu4eOAVrC57IHAuAvzCqSn/PNR5R3gPzlaxV9xVO7HgPuSmruUlv2
	 8wtBP4Ch0XVZAUCVjviH17tji++o1ns75Px/a9r5uR7m8JA/dyVsqrVOMmmMxYxYFx3ao
	 NMTPHd4BnaazawmrFjVkEg1NMmNlohB7reTWny2yinPaVlWmFlXwiumdE2e+UDixSteMh
	 8MHw5etbypIBlcvQCZsUQSqUugiSvftjQnwoQZweW317MhMFb4SSZx7SlUT9L8dLY06N2
	 +WA2YBbhLq1U33t1vA45Aek7Z4/5mGnOtwpQqd4UW8FEM+hiSKtU1DBqPQFDhEsPLyA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BJwDELTk;
	arc=none smtp.remote-ip=74.125.82.177
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5558A606A31C
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 05:16:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5558A606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BJwDELTk
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-3720addb068so287687eec.1
        for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 21:16:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794115006; x=1794719806; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YVx8EibVSDmqX/AcJMPqICHqAKqCDOESNCCkjO2gyzE=;
        b=BJwDELTk5bFmfKz4wGiI/wQwGfx4TBarUQkqKdWNVtVhANdMOnr9/qrd+Wv+QBBrse
         iTRzq1dgnB8Nv+sbO8MNSnWpPjOcQ0WhElCXoBqdnghVhmDySrnJld4jC69O13NcBq/W
         UbrFurh2G8sW3YVB6EDd6EQVnoaA94UgPxCwifk8BPPRYDCOWDD4sCq1eIKks7bq5V8j
         Et8oTdWkOIHzCT3yHx6Aq8DdOYht3av/kW76Uzvh51ta0oitd4hFz/TVlH6GxDZvdNnQ
         sLS8S6P4dhdtjgKbLit2mqJXttUfffK+bxRJjGdYDUzOQ7ljske9eLQ8MXju6FfYlrxO
         YeVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794115006; x=1794719806;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YVx8EibVSDmqX/AcJMPqICHqAKqCDOESNCCkjO2gyzE=;
        b=VA1lZL1q5W4RHytBy6iGPAUNqx4f0NA7FKsi9x8UjriieVY0FryH99kt+yNKQEndLN
         jl6n/oY9HwSSVkB9oNvoNPtq2FpoobOPd1V668bkZnnJLd33g8iN/6Vv5GVinNwZz9QW
         a7GoF87nzfbHxREmC9yV0rmMfvv/SDZ6ij+74U/PqIlx2h0O9KX+RXFZKPVezkemPTUg
         DAPWSiVMSlUn8zmXb5jlVrrwPwiCETOvQy/ffKgOinHSKApTOOxKIPzZhPaPudDuJycB
         of8RaWb69CCY9aL0Vf6oz/GXpv++Jygo7IOt2Mf+73p6YFlHEqwx65eKie0KnG39+QLt
         yA0w==
X-Forwarded-Encrypted: i=1; AL+hErHExtKdKcVX3w01dfDSDwVqO+PqFxtjT9rV+/59YjJkzEOAwBn0gVkS/FX9D9PvAf31m9/TmYhCub6bdgw=@vger.kernel.org
X-Gm-Message-State: APuU4Z/TM6sJFKE50KrxYSwVe6XGQ2w5MwzC3qyDg55G+Zj+njPVDfoa
	XbXV4k8X6m/pPfmKz0pO2VQu5wK5RtQX44ZyBqMQRYKHEjMZMTJ0TtEMhycSUA==
X-Gm-Gg: AYBFou3grhYMlYrOT2DhfzCb4jOVCrUFyg2G39sh1pg/d3THAYQBQVCTvX1UCiKBY58
	nzKW2RUUwonIBiMKFoLNAxGIic5sr+3K8LvlFG3Xd4sJFVU6jrCSKCItbKRRxw81jHb30LTfrHy
	stvOPEp0+yOG5dstA+KuCs50BpENj4jfjDCWmwkEHl7oQQpN2Y35MjD9tzCsH2ELFW74W80Y+xa
	HpE2jiHDX5TkQIcDUEBwh/hgEyw8t66wU70Sy8/VQ9t4am6ctFyEHKGDR2kq5GXs6lqrrAH44i+
	QUS82axiERnsxYL7SEp41KdeosLPiGoOo2L1g8secdYx1/Q3V2Ui8+J62YY7z3JO/1XiwIHnmA4
	n7xpuUl0r2Yx85G2bhx3UUVuvVR6/xsWzLjHtyX3CLskhn/+708+du9h1FOYNuA8ryZ2HRGsuB4
	/LNOPaupaxtOOHPBMGSAxiEF7d9MnOMu34iYf0dDblQAllPPQI+5v0ChmHAK5I8mbdcW4JTRaqr
	0WhMjatFEZk1Hwzy3+Hh9ZDGz7Y6xJjn04+XGmnjLVtvJbucczC34QnCIElzCR/y6n0Iu1J7g79
	WbrhIK5neRCRwD8TEk/gQa2bjA==
X-Received: by 2002:a05:7301:430c:b0:36e:97b4:1071 with SMTP id 5a478bee46e88-37257aa2df0mr1675347eec.14.1794115006342;
        Sat, 07 Nov 2026 21:16:46 -0800 (PST)
Received: from [127.0.1.1] ([121.125.115.175])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-372667d60absm2750989eec.26.2026.11.07.21.16.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 21:16:45 -0800 (PST)
From: Gyeyoung Baek <gye976@gmail.com>
Date: Sun, 08 Nov 2026 14:16:23 +0900
Subject: [PATCH v2 1/6] drm/imagination: Switch the GPUVM to immediate mode
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261108-pvr-vm-bind-v2-1-730103d2cc9a@gmail.com>
References: <20261108-pvr-vm-bind-v2-0-730103d2cc9a@gmail.com>
In-Reply-To: <20261108-pvr-vm-bind-v2-0-730103d2cc9a@gmail.com>
To: Alessio Belle <alessio.belle@imgtec.com>, 
 Luigi Santivetti <luigi.santivetti@imgtec.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Philipp Stanner <phasta@kernel.org>, 
 Donald Robson <donald.robson@imgtec.com>, 
 Sarah Walker <sarah.walker@imgtec.com>, 
 Matt Coster <opensource@mtcoster.net>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>
Cc: imagination@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 linaro-mm-sig@lists.linaro.org, linux-doc@vger.kernel.org, 
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
index af1f5526a78..d551d9a4ab4 100644
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
@@ -568,7 +579,8 @@ pvr_vm_create_context(struct pvr_device *pvr_dev, bool is_userspace_context)
 	drm_gem_private_object_init(&pvr_dev->base, &vm_ctx->dummy_gem, 0);
 	drm_gpuvm_init(&vm_ctx->gpuvm_mgr,
 		       is_userspace_context ? "PowerVR-user-VM" : "PowerVR-FW-VM",
-		       0, &pvr_dev->base, &vm_ctx->dummy_gem,
+		       DRM_GPUVM_IMMEDIATE_MODE, &pvr_dev->base,
+		       &vm_ctx->dummy_gem,
 		       0, PVR_PAGE_TABLE_ADDR_SPACE_SIZE, 0, 0, &pvr_vm_gpuva_ops);
 
 	mutex_init(&vm_ctx->lock);
@@ -602,6 +614,7 @@ pvr_vm_context_release(struct kref *ref_count)
 		pvr_fw_object_destroy(vm_ctx->fw_mem_ctx_obj);
 
 	pvr_vm_unmap_all(vm_ctx);
+	drm_gpuvm_bo_deferred_cleanup(&vm_ctx->gpuvm_mgr);
 
 	pvr_mmu_context_destroy(vm_ctx->mmu_ctx);
 	drm_gem_private_object_fini(&vm_ctx->dummy_gem);
@@ -738,7 +751,9 @@ pvr_vm_map(struct pvr_vm_context *vm_ctx, struct pvr_gem_object *pvr_obj,
 
 err_cleanup:
 	mutex_unlock(&vm_ctx->lock);
+
 	pvr_vm_bind_op_fini(&bind_op);
+	drm_gpuvm_bo_deferred_cleanup(&vm_ctx->gpuvm_mgr);
 
 	return err;
 }
@@ -820,6 +835,8 @@ pvr_vm_unmap_obj(struct pvr_vm_context *vm_ctx, struct pvr_gem_object *pvr_obj,
 	err = pvr_vm_unmap_obj_locked(vm_ctx, pvr_obj, device_addr, size);
 	mutex_unlock(&vm_ctx->lock);
 
+	drm_gpuvm_bo_deferred_cleanup(&vm_ctx->gpuvm_mgr);
+
 	return err;
 }
 
@@ -854,6 +871,8 @@ pvr_vm_unmap(struct pvr_vm_context *vm_ctx, u64 device_addr, u64 size)
 
 	mutex_unlock(&vm_ctx->lock);
 
+	drm_gpuvm_bo_deferred_cleanup(&vm_ctx->gpuvm_mgr);
+
 	return err;
 }
 
@@ -889,6 +908,8 @@ pvr_vm_unmap_all(struct pvr_vm_context *vm_ctx)
 	}
 
 	mutex_unlock(&vm_ctx->lock);
+
+	drm_gpuvm_bo_deferred_cleanup(&vm_ctx->gpuvm_mgr);
 }
 
 /* Static data areas are determined by firmware. */

-- 
2.43.0

