Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794115016;
	b=XbQ0Wd7ZP+1EHfXYlao8bnWrHxSM9ordF1lu0tpNpzaNkoQqWE70tQ8uMFag94LpziS+
	 VieDn4BamNMaBBjGk09skLzTTxBNXv3HCqGd0WmlpFbfGdc6aW8FJMO8hMuooMRtjj64X
	 35TF9S9MO3sq3jaRhfa6oqETL+hb1SC7SN4EwlqLLUhPixiIrILEfL1MD/65DoBsNqOGO
	 4ygBN7d9wGKDVsdH7I5pLvdOTwiqQpe85eGxR1NYYmofQCtRf1UeqnHFo9h2mceV2eWEa
	 sK2ubPpt1DXuNGx8xPQtGjll/0sZWv4Q2NvoxIc9z6oD7On3aHyIloD/tppRrTz0JtQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794115016;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=qpNejHsKjoRjIn6cBdkeKQ2TVXC5Ocq9jv5W/tLl7Q0=;
	b=Sdh2BPam54pkXgvYdjBhdc81m5AkS9hK5a/MkSV2lUzX6d2QxmEvJpR099orE1uqa+y+
	 Ve+ZgGhJhtZ3u4iiCMMz/nKSDkEOj2XzBAMKQl8Susakv5FM5iwaFNUzu36NweUUzesLg
	 7xyHj87Qn+EdpsdCYTSGIkfnojQuAG9xaM4DlyBt+PM48UB9c/kOurukvnYvpCSC7sIOY
	 09AQsYBovcxDnSvL+dIDObacJAX/fbBav5aPLNukjK4aW3AE/ZF+ngRO7tUNXLGf7ip4J
	 UbG8RwmTTddD6K3Z5alPkaweWeLMIkCrKi7L7PgKHXcV+QPCtSVXKlkCC+CRwRUntaA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nTI7JB2h;
	arc=none smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F852606A31D
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 05:16:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0F852606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nTI7JB2h
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-3700ed8dbe3so567905eec.0
        for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 21:16:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794115015; x=1794719815; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qpNejHsKjoRjIn6cBdkeKQ2TVXC5Ocq9jv5W/tLl7Q0=;
        b=nTI7JB2hL5FteNwyY6+Imzjajzjtmr7kPjuXPAfqe+48t27jPAybgcA54si6pFfNY+
         f548RD3DO8SOLsWfCfOU1kaBNdvnuOrMpSEwo/J7SgLChioinVGiiZA8lZ4yiD5M7P8P
         MxnGO3zNgxu9Pus5XgU31llLLaW3wJy+ljwf7BqavWINdTS/iMU9Y11PSQQTgBFCEuT5
         TDXy2lpa5oFXmxBUBHlofaM/Z57DeN4ljgP+2I4evq/1WksZj+Gg14XdJzYBhV/RRz0+
         f0ZRl9uV2Rv5ADdmUOIA3QyhiLUOyzdaBgXXkZdJ0KYuhl3yhqVcNDMgkjF0G4EjYkWP
         j6tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794115015; x=1794719815;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qpNejHsKjoRjIn6cBdkeKQ2TVXC5Ocq9jv5W/tLl7Q0=;
        b=VPM2u7TJaIC1QtlHTEYTqgnIpqyOusDZWBcQMqu/3yB3J1O5pib7b6w/lV/mAG1nbo
         jGEdWhNhuUM9Weo0tkXwHyNvFWea0SJnscpUv32dK8sP+geIHRPn+6lOxv51SWnXTQZ6
         ep8JFyR0uoUlAtbOj+BHwfXygyxO+oU4f0k1xLkJvYOwa/+9/Moq3b3EjdATKDoVDJhZ
         rocbqr08vJHubqTxrgh9vUaIF9QIAPE2C60oawp65a/Q3LSWf0Q1dNM4iPsgZS6y4Mmc
         SU5YSXv+MTP40LyebeQLlbmQ2ZUdau5Q7STSBF3l6auFlrtf02TC0kEXDo0E6CKOS35c
         xblw==
X-Forwarded-Encrypted: i=1; AL+hErEquQSaL0CYuLMm05ouaq+KjbpEzfXIS1/gRYaESkd898apvi+keWM9hvMPxjt8IPaCWkbE0Pk6hAXUhfE=@vger.kernel.org
X-Gm-Message-State: APuU4Z8QAhr+R7cfP5KIsh7CiGf1niaUhPCTI8cTjd2aK3T0664AqMNC
	J6G3/MkFgbwFSxaPRDP2qSJhIfXJv0/U8KnwDS9+oaY1fnuN/JoP11TIdRZ5mw==
X-Gm-Gg: AYBFou1Ssc9Iv5PquPdCov1WbW3Nhbz31fA0S76TBfXy2RVkm+LD8R++rIcSSpjJfPF
	KOD/N4yK6/QtypyaNMOeLxwIWdihp77CALoplFlgO6aaF9yKVYLl9s8C4LhSmWSnsjBQJHNzv1f
	gJ8zGMDLS/s4XaK4rtIYXf58iJK47dxXNNaiQKZjsm05mTBxhEVtdqUmAH386S13Jwi/hDV65lX
	uNVmj6Rcf8YVwqG3323RQn2DfnRZgMHO0CFdmPg945nelUlj4FSD22l+R1Rbz5AFTzvX7P1hXly
	t9BpQG8D1kKWxwEeuGFVTNIJb6kS6brwgIXFZZV/4ELhXuj9Zfd8ogct7k/S6aH2Sehid9/o/WQ
	1YJKYIzP/98Zm0nH2RSH8/wxIuCEBX1SOZmE0peqfKrhQYNaK8JpmkHHUW3fkRKpH9ZX9UUMrxa
	NsB+rTxHhz25L63TJNF7WpN2To1Toa3tWdxdZ88gZnTzvQi+NvJMdKsgfu8pnNh7N9mi2mTE7bf
	RuMkvHH0tQzBqdKNv1wFIUajf+Da72QyDHPHwKBMRzhWBRAOueYqEDDwS8ULlovVoG5N1S80N3i
	JU4n6+twr+1SfJV40CaJ7BHPhQ==
X-Received: by 2002:a05:693c:8956:20b0:36d:8b1a:7faa with SMTP id 5a478bee46e88-3725d77d41bmr1528703eec.7.1794115014966;
        Sat, 07 Nov 2026 21:16:54 -0800 (PST)
Received: from [127.0.1.1] ([121.125.115.175])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-372667d60absm2750989eec.26.2026.11.07.21.16.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 21:16:54 -0800 (PST)
From: Gyeyoung Baek <gye976@gmail.com>
Date: Sun, 08 Nov 2026 14:16:25 +0900
Subject: [PATCH v2 3/6] drm/imagination: Route map and unmap through
 pvr_vm_bind()
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
Message-Id: <20261108-pvr-vm-bind-v2-3-730103d2cc9a@gmail.com>
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

Give the VM layer a single kernel-side bind entry point, and move every
existing map and unmap path onto it.

FW mappings and the VM_MAP/VM_UNMAP ioctls each had their own copy of
the same sequence (prepare, lock, execute, clean up). Fold them into one
pvr_vm_bind() taking an array of struct pvr_vm_bind_desc. The VM_BIND
ioctl that follows uses the same entry point.

Before:

  pvr_meta_vm_map() ----+
  pvr_riscv_vm_map() ---+--> pvr_vm_map()
  pvr_ioctl_vm_map() ---+      map_init -> lock -> exec -> unlock -> fini

  pvr_meta_vm_unmap() --+
  pvr_riscv_vm_unmap() -+--> pvr_vm_unmap_obj()
                               unmap_init -> lock -> exec -> unlock -> fini

  pvr_ioctl_vm_unmap() ----> pvr_vm_unmap()
                               unmap_init -> lock -> find -> exec
                                          -> unlock -> fini

After:

  pvr_meta_vm_map() ----+
  pvr_riscv_vm_map() ---+--> pvr_vm_map() ---+
  pvr_ioctl_vm_map() ---+                    |
                                             +--> pvr_vm_bind()
  pvr_meta_vm_unmap() --+                    |      init -> lock -> exec
  pvr_riscv_vm_unmap() -+--> pvr_vm_unmap() -+      -> unlock -> fini
  pvr_ioctl_vm_unmap() -+

- pvr_vm_unmap() sets the exact flag of its descriptor, since VM_UNMAP
  only removes a mapping that exactly matches the range. An unmap
  through pvr_vm_bind() otherwise removes everything in the range,
  because the VM_BIND ioctl that follows takes an arbitrary range, like
  Vulkan sparse unbinding, rather than a previous binding.
- pvr_vm_unmap_all() is the exception and does not go through
  pvr_vm_bind().
  - pvr_vm_bind(): with the asynchronous mode the VM_BIND ioctl gains
    afterwards, a queued request that fails part way through leaves the
    address space in a state nobody can reason about. The VM context is
    then marked unusable, and pvr_vm_bind() refuses it.
  - pvr_vm_unmap_all(): it empties a VM context, so it has to succeed
    whatever state the context is in.
- The only userspace-visible change: VM_UNMAP returns -EINVAL instead of
  -ENOENT for an invalid address or size.

Signed-off-by: Gyeyoung Baek <gye976@gmail.com>
---
 drivers/gpu/drm/imagination/pvr_fw_meta.c  |   6 +-
 drivers/gpu/drm/imagination/pvr_fw_riscv.c |   6 +-
 drivers/gpu/drm/imagination/pvr_vm.c       | 304 +++++++++++++++--------------
 drivers/gpu/drm/imagination/pvr_vm.h       |  46 ++++-
 4 files changed, 205 insertions(+), 157 deletions(-)

diff --git a/drivers/gpu/drm/imagination/pvr_fw_meta.c b/drivers/gpu/drm/imagination/pvr_fw_meta.c
index 38a91dcb66c..a1de51afde1 100644
--- a/drivers/gpu/drm/imagination/pvr_fw_meta.c
+++ b/drivers/gpu/drm/imagination/pvr_fw_meta.c
@@ -542,10 +542,8 @@ pvr_meta_vm_map(struct pvr_device *pvr_dev, struct pvr_fw_object *fw_obj)
 static void
 pvr_meta_vm_unmap(struct pvr_device *pvr_dev, struct pvr_fw_object *fw_obj)
 {
-	struct pvr_gem_object *pvr_obj = fw_obj->gem;
-
-	pvr_vm_unmap_obj(pvr_dev->kernel_vm_ctx, pvr_obj,
-			 fw_obj->fw_mm_node.start, fw_obj->fw_mm_node.size);
+	pvr_vm_unmap(pvr_dev->kernel_vm_ctx, fw_obj->fw_mm_node.start,
+		     fw_obj->fw_mm_node.size);
 }
 
 static bool
diff --git a/drivers/gpu/drm/imagination/pvr_fw_riscv.c b/drivers/gpu/drm/imagination/pvr_fw_riscv.c
index cd84635bb88..a22b3f99218 100644
--- a/drivers/gpu/drm/imagination/pvr_fw_riscv.c
+++ b/drivers/gpu/drm/imagination/pvr_fw_riscv.c
@@ -149,10 +149,8 @@ pvr_riscv_vm_map(struct pvr_device *pvr_dev, struct pvr_fw_object *fw_obj)
 static void
 pvr_riscv_vm_unmap(struct pvr_device *pvr_dev, struct pvr_fw_object *fw_obj)
 {
-	struct pvr_gem_object *pvr_obj = fw_obj->gem;
-
-	pvr_vm_unmap_obj(pvr_dev->kernel_vm_ctx, pvr_obj,
-			 fw_obj->fw_mm_node.start, fw_obj->fw_mm_node.size);
+	pvr_vm_unmap(pvr_dev->kernel_vm_ctx, fw_obj->fw_mm_node.start,
+		     fw_obj->fw_mm_node.size);
 }
 
 static bool
diff --git a/drivers/gpu/drm/imagination/pvr_vm.c b/drivers/gpu/drm/imagination/pvr_vm.c
index 12ebf0daf88..2f959cd5e90 100644
--- a/drivers/gpu/drm/imagination/pvr_vm.c
+++ b/drivers/gpu/drm/imagination/pvr_vm.c
@@ -21,6 +21,8 @@
 #include <linux/gfp_types.h>
 #include <linux/kref.h>
 #include <linux/mutex.h>
+#include <linux/sched.h>
+#include <linux/slab.h>
 #include <linux/stddef.h>
 
 /**
@@ -117,11 +119,6 @@ struct pvr_vm_gpuva {
 
 #define to_pvr_vm_gpuva(va) container_of_const(va, struct pvr_vm_gpuva, base)
 
-enum pvr_vm_bind_type {
-	PVR_VM_BIND_TYPE_MAP,
-	PVR_VM_BIND_TYPE_UNMAP,
-};
-
 /**
  * struct pvr_vm_bind_op - Context of a map/unmap operation.
  */
@@ -132,6 +129,9 @@ struct pvr_vm_bind_op {
 	/** @pvr_obj: Object associated with mapping (map only). */
 	struct pvr_gem_object *pvr_obj;
 
+	/** @exact: See &pvr_vm_bind_desc.exact. */
+	bool exact;
+
 	/**
 	 * @vm_ctx: VM context where the mapping will be created or destroyed.
 	 */
@@ -198,6 +198,11 @@ static int pvr_vm_bind_op_exec(struct pvr_vm_bind_op *bind_op)
 	}
 
 	case PVR_VM_BIND_TYPE_UNMAP:
+		if (bind_op->exact &&
+		    !drm_gpuva_find(&bind_op->vm_ctx->gpuvm_mgr,
+				    bind_op->device_addr, bind_op->size))
+			return -ENOENT;
+
 		return drm_gpuvm_sm_unmap(&bind_op->vm_ctx->gpuvm_mgr,
 					  bind_op, bind_op->device_addr,
 					  bind_op->size);
@@ -229,9 +234,9 @@ static void pvr_vm_bind_op_fini(struct pvr_vm_bind_op *bind_op)
 static int
 pvr_vm_bind_op_map_init(struct pvr_vm_bind_op *bind_op,
 			struct pvr_vm_context *vm_ctx,
-			struct pvr_gem_object *pvr_obj, u64 offset,
-			u64 device_addr, u64 size)
+			const struct pvr_vm_bind_desc *desc)
 {
+	struct pvr_gem_object *pvr_obj = desc->obj;
 	struct drm_gem_object *obj = gem_from_pvr_gem(pvr_obj);
 	const bool is_user = vm_ctx != vm_ctx->pvr_dev->kernel_vm_ctx;
 	const u64 pvr_obj_size = pvr_gem_object_size(pvr_obj);
@@ -239,17 +244,19 @@ pvr_vm_bind_op_map_init(struct pvr_vm_bind_op *bind_op,
 	u64 offset_plus_size;
 	int err;
 
-	if (check_add_overflow(offset, size, &offset_plus_size))
+	if (check_add_overflow(desc->offset, desc->size, &offset_plus_size))
 		return -EINVAL;
 
 	if (is_user &&
-	    !pvr_find_heap_containing(vm_ctx->pvr_dev, device_addr, size)) {
+	    !pvr_find_heap_containing(vm_ctx->pvr_dev, desc->device_addr,
+				      desc->size)) {
 		return -EINVAL;
 	}
 
-	if (!pvr_device_addr_and_size_are_valid(vm_ctx, device_addr, size) ||
-	    offset & ~PAGE_MASK || size & ~PAGE_MASK ||
-	    offset >= pvr_obj_size || offset_plus_size > pvr_obj_size)
+	if (!pvr_device_addr_and_size_are_valid(vm_ctx, desc->device_addr,
+						desc->size) ||
+	    desc->offset & ~PAGE_MASK || desc->size & ~PAGE_MASK ||
+	    desc->offset >= pvr_obj_size || offset_plus_size > pvr_obj_size)
 		return -EINVAL;
 
 	bind_op->type = PVR_VM_BIND_TYPE_MAP;
@@ -275,7 +282,9 @@ pvr_vm_bind_op_map_init(struct pvr_vm_bind_op *bind_op,
 		goto err_bind_op_fini;
 
 	bind_op->mmu_op_ctx =
-		pvr_mmu_op_context_create(vm_ctx->mmu_ctx, sgt, device_addr, offset, size);
+		pvr_mmu_op_context_create(vm_ctx->mmu_ctx, sgt,
+					  desc->device_addr, desc->offset,
+					  desc->size);
 	err = PTR_ERR_OR_ZERO(bind_op->mmu_op_ctx);
 	if (err) {
 		bind_op->mmu_op_ctx = NULL;
@@ -283,17 +292,16 @@ pvr_vm_bind_op_map_init(struct pvr_vm_bind_op *bind_op,
 	}
 
 	bind_op->pvr_obj = pvr_obj;
+	pvr_gem_object_get(pvr_obj);
 	bind_op->vm_ctx = vm_ctx;
-	bind_op->device_addr = device_addr;
-	bind_op->size = size;
-	bind_op->offset = offset;
+	bind_op->device_addr = desc->device_addr;
+	bind_op->size = desc->size;
+	bind_op->offset = desc->offset;
 
 	return 0;
 
 err_bind_op_fini:
 	pvr_vm_bind_op_fini(bind_op);
-	/* Drain what fini() deferred. */
-	drm_gpuvm_bo_deferred_cleanup(&vm_ctx->gpuvm_mgr);
 
 	return err;
 }
@@ -301,12 +309,12 @@ pvr_vm_bind_op_map_init(struct pvr_vm_bind_op *bind_op,
 static int
 pvr_vm_bind_op_unmap_init(struct pvr_vm_bind_op *bind_op,
 			  struct pvr_vm_context *vm_ctx,
-			  struct pvr_gem_object *pvr_obj,
-			  u64 device_addr, u64 size)
+			  const struct pvr_vm_bind_desc *desc)
 {
 	int err;
 
-	if (!pvr_device_addr_and_size_are_valid(vm_ctx, device_addr, size))
+	if (!pvr_device_addr_and_size_are_valid(vm_ctx, desc->device_addr,
+						desc->size))
 		return -EINVAL;
 
 	bind_op->type = PVR_VM_BIND_TYPE_UNMAP;
@@ -319,17 +327,18 @@ pvr_vm_bind_op_unmap_init(struct pvr_vm_bind_op *bind_op,
 	}
 
 	bind_op->mmu_op_ctx =
-		pvr_mmu_op_context_create(vm_ctx->mmu_ctx, NULL, device_addr, 0, 0);
+		pvr_mmu_op_context_create(vm_ctx->mmu_ctx, NULL,
+					  desc->device_addr, 0, 0);
 	err = PTR_ERR_OR_ZERO(bind_op->mmu_op_ctx);
 	if (err) {
 		bind_op->mmu_op_ctx = NULL;
 		goto err_bind_op_fini;
 	}
 
-	bind_op->pvr_obj = pvr_obj;
 	bind_op->vm_ctx = vm_ctx;
-	bind_op->device_addr = device_addr;
-	bind_op->size = size;
+	bind_op->exact = desc->exact;
+	bind_op->device_addr = desc->device_addr;
+	bind_op->size = desc->size;
 
 	return 0;
 
@@ -683,188 +692,191 @@ void pvr_destroy_vm_contexts_for_file(struct pvr_file *pvr_file)
 	}
 }
 
-/**
- * pvr_vm_map() - Map a section of physical memory into a section of
- * device-virtual memory.
- * @vm_ctx: Target VM context.
- * @pvr_obj: Target PowerVR memory object.
- * @pvr_obj_offset: Offset into @pvr_obj to map from.
- * @device_addr: Virtual device address at the start of the requested mapping.
- * @size: Size of the requested mapping.
- *
- * No handle is returned to represent the mapping. Instead, callers should
- * remember @device_addr and use that as a handle.
- *
- * Return:
- *  * 0 on success,
- *  * -%EINVAL if @device_addr is not a valid page-aligned device-virtual
- *    address; the region specified by @pvr_obj_offset and @size does not fall
- *    entirely within @pvr_obj, or any part of the specified region of @pvr_obj
- *    is not device-virtual page-aligned,
- *  * Any error encountered while performing internal operations required to
- *    destroy the mapping (returned from pvr_vm_gpuva_map or
- *    pvr_vm_gpuva_remap).
- */
-int
-pvr_vm_map(struct pvr_vm_context *vm_ctx, struct pvr_gem_object *pvr_obj,
-	   u64 pvr_obj_offset, u64 device_addr, u64 size)
+static int
+pvr_vm_bind_op_init(struct pvr_vm_bind_op *bind_op,
+		    struct pvr_vm_context *vm_ctx,
+		    const struct pvr_vm_bind_desc *desc)
 {
-	struct pvr_vm_bind_op bind_op = {0};
+	switch (desc->type) {
+	case PVR_VM_BIND_TYPE_MAP:
+		if (WARN_ON(!desc->obj || desc->exact))
+			return -EINVAL;
 
-	int err = pvr_vm_bind_op_map_init(&bind_op, vm_ctx, pvr_obj,
-					  pvr_obj_offset, device_addr,
-					  size);
+		return pvr_vm_bind_op_map_init(bind_op, vm_ctx, desc);
 
-	if (err)
-		return err;
+	case PVR_VM_BIND_TYPE_UNMAP:
+		if (WARN_ON(desc->obj))
+			return -EINVAL;
 
-	pvr_gem_object_get(pvr_obj);
+		return pvr_vm_bind_op_unmap_init(bind_op, vm_ctx, desc);
+	}
 
-	mutex_lock(&vm_ctx->lock);
-	err = pvr_vm_bind_op_exec(&bind_op);
-	mutex_unlock(&vm_ctx->lock);
+	return -EINVAL;
+}
 
-	pvr_vm_bind_op_fini(&bind_op);
-	drm_gpuvm_bo_deferred_cleanup(&vm_ctx->gpuvm_mgr);
+/**
+ * pvr_vm_bind_ops_free() - Release an array of prepared bind operations.
+ * @bind_ops: Array to release.
+ * @count: Number of prepared entries in @bind_ops.
+ */
+static void pvr_vm_bind_ops_free(struct pvr_vm_bind_op *bind_ops, u32 count)
+{
+	for (u32 i = 0; i < count; i++)
+		pvr_vm_bind_op_fini(&bind_ops[i]);
 
-	return err;
+	kvfree(bind_ops);
 }
 
 /**
- * pvr_vm_unmap_obj_locked() - Unmap an already mapped section of device-virtual
- * memory.
+ * pvr_vm_bind_ops_create() - Prepare an array of bind operations.
  * @vm_ctx: Target VM context.
- * @pvr_obj: Target PowerVR memory object.
- * @device_addr: Virtual device address at the start of the target mapping.
- * @size: Size of the target mapping.
+ * @descs: Descriptions of the operations.
+ * @desc_count: Number of entries in @descs.
  *
- * Return:
- *  * 0 on success,
- *  * -%EINVAL if @device_addr is not a valid page-aligned device-virtual
- *    address,
- *  * Any error encountered while performing internal operations required to
- *    destroy the mapping (returned from pvr_vm_gpuva_unmap or
- *    pvr_vm_gpuva_remap).
+ * Performs every allocation the operations need, so that applying them cannot
+ * fail for want of memory.
  *
- * The vm_ctx->lock must be held when calling this function.
+ * Return: The new array, or an ERR_PTR on failure.
  */
-static int
-pvr_vm_unmap_obj_locked(struct pvr_vm_context *vm_ctx,
-			struct pvr_gem_object *pvr_obj,
-			u64 device_addr, u64 size)
+static struct pvr_vm_bind_op *
+pvr_vm_bind_ops_create(struct pvr_vm_context *vm_ctx,
+		       const struct pvr_vm_bind_desc *descs, u32 desc_count)
 {
-	struct pvr_vm_bind_op bind_op = {0};
-
-	int err = pvr_vm_bind_op_unmap_init(&bind_op, vm_ctx, pvr_obj,
-					    device_addr, size);
-	if (err)
-		return err;
+	struct pvr_vm_bind_op *bind_ops;
+	int err;
 
-	pvr_gem_object_get(pvr_obj);
+	bind_ops = kvzalloc_objs(*bind_ops, desc_count, GFP_KERNEL_ACCOUNT);
+	if (!bind_ops)
+		return ERR_PTR(-ENOMEM);
 
-	err = pvr_vm_bind_op_exec(&bind_op);
+	for (u32 prepared = 0; prepared < desc_count; prepared++) {
+		err = pvr_vm_bind_op_init(&bind_ops[prepared], vm_ctx,
+					  &descs[prepared]);
+		if (err) {
+			pvr_vm_bind_ops_free(bind_ops, prepared);
+			/* Release the vm_bos that fini() deferred. */
+			drm_gpuvm_bo_deferred_cleanup(&vm_ctx->gpuvm_mgr);
+			return ERR_PTR(err);
+		}
 
-	pvr_vm_bind_op_fini(&bind_op);
+		cond_resched();
+	}
 
-	return err;
+	return bind_ops;
 }
 
 /**
- * pvr_vm_unmap_obj() - Unmap an already mapped section of device-virtual
- * memory.
+ * pvr_vm_bind() - Apply a batch of bind operations to a VM context.
  * @vm_ctx: Target VM context.
- * @pvr_obj: Target PowerVR memory object.
- * @device_addr: Virtual device address at the start of the target mapping.
- * @size: Size of the target mapping.
+ * @descs: Operations to apply, in array order.
+ * @desc_count: Number of entries in @descs.
+ *
+ * Not atomic: if an operation fails, the earlier ones stay applied.
  *
  * Return:
- *  * 0 on success,
- *  * Any error encountered by pvr_vm_unmap_obj_locked.
+ *  * 0 on success, or
+ *  * A negative error code on failure.
  */
-int
-pvr_vm_unmap_obj(struct pvr_vm_context *vm_ctx, struct pvr_gem_object *pvr_obj,
-		 u64 device_addr, u64 size)
+int pvr_vm_bind(struct pvr_vm_context *vm_ctx,
+		const struct pvr_vm_bind_desc *descs, u32 desc_count)
 {
-	int err;
+	struct pvr_vm_bind_op *bind_ops;
+	int err = 0;
+
+	bind_ops = pvr_vm_bind_ops_create(vm_ctx, descs, desc_count);
+	if (IS_ERR(bind_ops))
+		return PTR_ERR(bind_ops);
 
 	mutex_lock(&vm_ctx->lock);
-	err = pvr_vm_unmap_obj_locked(vm_ctx, pvr_obj, device_addr, size);
+
+	for (u32 i = 0; !err && i < desc_count; i++)
+		err = pvr_vm_bind_op_exec(&bind_ops[i]);
+
 	mutex_unlock(&vm_ctx->lock);
 
+	pvr_vm_bind_ops_free(bind_ops, desc_count);
 	drm_gpuvm_bo_deferred_cleanup(&vm_ctx->gpuvm_mgr);
 
 	return err;
 }
 
 /**
- * pvr_vm_unmap() - Unmap an already mapped section of device-virtual memory.
+ * pvr_vm_map() - Map part of an object into a VM context.
+ * @vm_ctx: Target VM context.
+ * @pvr_obj: Target PowerVR memory object.
+ * @pvr_obj_offset: Offset into @pvr_obj to map from.
+ * @device_addr: Virtual device address at the start of the requested mapping.
+ * @size: Size of the requested mapping.
+ *
+ * A wrapper around pvr_vm_bind() with a single map operation.
+ *
+ * Return: 0 on success, or a negative error code.
+ */
+int
+pvr_vm_map(struct pvr_vm_context *vm_ctx, struct pvr_gem_object *pvr_obj,
+	   u64 pvr_obj_offset, u64 device_addr, u64 size)
+{
+	const struct pvr_vm_bind_desc desc = {
+		.type = PVR_VM_BIND_TYPE_MAP,
+		.obj = pvr_obj,
+		.offset = pvr_obj_offset,
+		.device_addr = device_addr,
+		.size = size,
+	};
+
+	return pvr_vm_bind(vm_ctx, &desc, 1);
+}
+
+/**
+ * pvr_vm_unmap() - Remove a mapping from a VM context.
  * @vm_ctx: Target VM context.
  * @device_addr: Virtual device address at the start of the target mapping.
  * @size: Size of the target mapping.
  *
+ * A wrapper around pvr_vm_bind() with a single exact unmap operation.
+ *
  * Return:
  *  * 0 on success,
- *  * Any error encountered by drm_gpuva_find,
- *  * Any error encountered by pvr_vm_unmap_obj_locked.
+ *  * -%ENOENT if no mapping starts at @device_addr and spans exactly @size, or
+ *  * Any other error returned by pvr_vm_bind().
  */
 int
 pvr_vm_unmap(struct pvr_vm_context *vm_ctx, u64 device_addr, u64 size)
 {
-	struct pvr_gem_object *pvr_obj;
-	struct drm_gpuva *va;
-	int err;
-
-	mutex_lock(&vm_ctx->lock);
-
-	va = drm_gpuva_find(&vm_ctx->gpuvm_mgr, device_addr, size);
-	if (va) {
-		pvr_obj = gem_to_pvr_gem(va->gem.obj);
-		err = pvr_vm_unmap_obj_locked(vm_ctx, pvr_obj,
-					      va->va.addr, va->va.range);
-	} else {
-		err = -ENOENT;
-	}
-
-	mutex_unlock(&vm_ctx->lock);
-
-	drm_gpuvm_bo_deferred_cleanup(&vm_ctx->gpuvm_mgr);
-
-	return err;
+	const struct pvr_vm_bind_desc desc = {
+		.type = PVR_VM_BIND_TYPE_UNMAP,
+		.exact = true,
+		.device_addr = device_addr,
+		.size = size,
+	};
+
+	return pvr_vm_bind(vm_ctx, &desc, 1);
 }
 
 /**
  * pvr_vm_unmap_all() - Unmap all mappings associated with a VM context.
  * @vm_ctx: Target VM context.
  *
- * This function ensures that no mappings are left dangling by unmapping them
- * all in order of ascending device-virtual address.
+ * Unmaps the whole device-virtual address space at once.
  */
 void
 pvr_vm_unmap_all(struct pvr_vm_context *vm_ctx)
 {
-	u64 addr = vm_ctx->gpuvm_mgr.mm_start;
-	u64 end = vm_ctx->gpuvm_mgr.mm_start + vm_ctx->gpuvm_mgr.mm_range;
-	u64 va_addr, va_range;
-
-	mutex_lock(&vm_ctx->lock);
-
-	for (; addr < end; addr = va_addr + va_range) {
-		struct pvr_gem_object *pvr_obj;
-		struct drm_gpuva *va;
-
-		va = drm_gpuva_find_first(&vm_ctx->gpuvm_mgr, addr, end - addr);
-		if (!va)
-			break;
-
-		pvr_obj = gem_to_pvr_gem(va->gem.obj);
-		va_addr = va->va.addr;
-		va_range = va->va.range;
+	const struct pvr_vm_bind_desc desc = {
+		.type = PVR_VM_BIND_TYPE_UNMAP,
+		.device_addr = vm_ctx->gpuvm_mgr.mm_start,
+		.size = vm_ctx->gpuvm_mgr.mm_range,
+	};
+	struct pvr_vm_bind_op bind_op = {0};
 
-		WARN_ON(pvr_vm_unmap_obj_locked(vm_ctx, pvr_obj, va_addr, va_range));
-	}
+	if (WARN_ON(pvr_vm_bind_op_unmap_init(&bind_op, vm_ctx, &desc)))
+		return;
 
+	mutex_lock(&vm_ctx->lock);
+	WARN_ON(pvr_vm_bind_op_exec(&bind_op));
 	mutex_unlock(&vm_ctx->lock);
 
+	pvr_vm_bind_op_fini(&bind_op);
 	drm_gpuvm_bo_deferred_cleanup(&vm_ctx->gpuvm_mgr);
 }
 
diff --git a/drivers/gpu/drm/imagination/pvr_vm.h b/drivers/gpu/drm/imagination/pvr_vm.h
index b0528dffa7f..bf6d5e802d9 100644
--- a/drivers/gpu/drm/imagination/pvr_vm.h
+++ b/drivers/gpu/drm/imagination/pvr_vm.h
@@ -38,10 +38,50 @@ struct pvr_vm_context *pvr_vm_create_context(struct pvr_device *pvr_dev,
 int pvr_vm_map(struct pvr_vm_context *vm_ctx,
 	       struct pvr_gem_object *pvr_obj, u64 pvr_obj_offset,
 	       u64 device_addr, u64 size);
-int pvr_vm_unmap_obj(struct pvr_vm_context *vm_ctx,
-		     struct pvr_gem_object *pvr_obj,
-		     u64 device_addr, u64 size);
 int pvr_vm_unmap(struct pvr_vm_context *vm_ctx, u64 device_addr, u64 size);
+
+/**
+ * enum pvr_vm_bind_type - Type of a &struct pvr_vm_bind_desc.
+ * @PVR_VM_BIND_TYPE_MAP: Map @pvr_vm_bind_desc.obj into a device-virtual range.
+ * @PVR_VM_BIND_TYPE_UNMAP: Unmap a device-virtual range.
+ */
+enum pvr_vm_bind_type {
+	PVR_VM_BIND_TYPE_MAP,
+	PVR_VM_BIND_TYPE_UNMAP,
+};
+
+/**
+ * struct pvr_vm_bind_desc - A bind operation, as passed to pvr_vm_bind().
+ */
+struct pvr_vm_bind_desc {
+	/** @type: Map or unmap. */
+	enum pvr_vm_bind_type type;
+
+	/**
+	 * @obj: Object to map. Map only; must be %NULL for an unmap.
+	 * pvr_vm_bind() does not consume the caller's reference.
+	 */
+	struct pvr_gem_object *obj;
+
+	/** @offset: Offset into @obj to begin mapping from. Map only. */
+	u64 offset;
+
+	/**
+	 * @exact: Fail with -%ENOENT unless a single mapping spans exactly
+	 * the range. Unmap only.
+	 */
+	bool exact;
+
+	/** @device_addr: Device-virtual address at the start of the range. */
+	u64 device_addr;
+
+	/** @size: Size of the range. */
+	u64 size;
+};
+
+int pvr_vm_bind(struct pvr_vm_context *vm_ctx,
+		const struct pvr_vm_bind_desc *descs, u32 desc_count);
+
 void pvr_vm_unmap_all(struct pvr_vm_context *vm_ctx);
 
 dma_addr_t pvr_vm_get_page_table_root_addr(struct pvr_vm_context *vm_ctx);

-- 
2.43.0

