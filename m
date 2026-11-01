Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793518657;
	b=QHLkogEQ6eCdL5yvYW/RvpxOf6J0wHgTD5BR/eFJybqWpHHyIj9UV7rBflmEoWJyv7dj
	 pkGrO/+cuKyWbT5wMOugm3EH5PGiNpF71q80WKqMxzf68tQJ6voactnkSyZmd4V7qBhtN
	 ok9kSvz8TqLSAp02GaPwTY44q8kkLgCkZKa9W1+rhVg44n7w1KCTfCyjONUJ7VuKdEfV7
	 JKyaxQCuw9D83ALSvuJyJJvvzU4/smzKmBc3bDK9LsBKq7dVnH5OznXYMg3Oq1gZolfJF
	 H5Ei7w3cdTPnqDFWg85cRadU9poYGAPVbxG5YaJg6kxhImJpH0Wsi3AzhH+c0JcYYAQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793518657;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=t/gjE8PAV/l+wGQLdHNbUraby6W5o/4waIhxkQthi2Q=;
	b=WXh24DzWdPyiX17vjr5cGq7fYVQEq/HCtg1plKKFYfDuc6X1zSSyY3LsqLj4kgT5ebF3
	 i8D70b09R6BILdgtN9n4YgFAVQyjjF2XDQeszEOGMxG/hH5o6f6PIAP4h1UZmw94kD8WM
	 xGrjsY1+z8wRdf0C3reckBxeNfo1uVo5/c7C0ql+lOHjw1+GeYVBxBwRG86Ti5B24thDU
	 V/SFMBRZT2mBLu3FWjSQQsXf9OWklL9lRy9nDtLaOr0U1J44OR0cxO4BDsFcTCqnvO56G
	 cqiYFIDShz76pmCfiWcOqs/llh+4rWGdMfFKyDnPMhO4dhxiuMHFdNIn0qo39nnleew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Eg8zAMIA;
	arc=none smtp.remote-ip=209.85.216.43
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21924606A325
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 07:37:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 21924606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Eg8zAMIA
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-3ab98332238so1076060a91.3
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 00:37:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793518655; x=1794123455; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=t/gjE8PAV/l+wGQLdHNbUraby6W5o/4waIhxkQthi2Q=;
        b=Eg8zAMIAxmNBY9xTCn49zIrcM3RsmmBffLXfZ/+M7oiexTKYXznFILfdD979X/MB+N
         fRNQ+AtY/kiW6HTz1sXJZxgnN5X5N6biyUAEwkp7eJ6rHrRgqoMhAfl3MqLsyML0Xb8C
         gM6TDAOj/iDcb74cFrjSPDSQlKy3zqLgKwFMOCWtVy3dbrJ/NJmwAsq0Yv39HMSzYiAQ
         5zfs63tA/mWW5lrcazqtN3BpughNXcNQDcS29ajCKboHICeI5nx44wczaMx/rIv5myjJ
         5mQl+ahg8dDQrnQphxvZWqYoZfS+a7KiQQU8kfd3n05QCWf3SyIcY0HfGYsshLzmVklA
         yi6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793518655; x=1794123455;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=t/gjE8PAV/l+wGQLdHNbUraby6W5o/4waIhxkQthi2Q=;
        b=cqlitKlDtRV6Cnkt6LmSIBJckCuDUBp6xRX2T5CKDWHE98UFm5jSqn40u/05g8I7o4
         40ctk2gQm2dppiAHIQbb5nsKbMMEykwLJa7eucenBso5h8M0V0GBOQPPSjbLASQ1iLk/
         zGRxqWaZoRxgjq8BWHBGheMGo47/6WzIhUjUq/Hw8vbAKO19c/MFEbG3nrtrifDSEE1U
         7GLO4lt9B4kRL43ia2aFuGiXrUJFWbnh8RM9wPR8i/9pZyXAFLm4ACDxYccClEAp5vQF
         4eQ3KD41B5D8jrj5MZf6Xqu8RCNPKnEzqfuYPRu//zE3u0htYakOgfUdiVT58Dj01hU9
         bEag==
X-Forwarded-Encrypted: i=1; AKwUvByWI5weWLyX7gkF/vY1SyOMgXaNonOH3X1NSWxp/VOPMir1rNcTBSjQl8yPvIgbPipVR8/u5cIsK/kEbWQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z/IJ720aP65ceSeuSaFaxnN5T/Sc+7NrzHSL/XOlHunFGdeo8rM
	03TOds0NtHkRDuhgzvdLVta9E4l3FHei8yeWlRZTN8A7hO9eGcX0zJeO
X-Gm-Gg: AYBFou0DCNKiHZ0JO+LnEgf4qjnaVAh9UH8N68vUExhI9znn9sN7T4casZ/kGnPr5RA
	ZFWCzUoY5GS56Q0/2uQg1KXche740pl2/fpOWuBSyUJ/oe2gtsjevODNZau1rxj+VBhYIWchuol
	g8Obu8Hw72UYbfYoIoYgWDA/k8YLHaw+LPoh1pVG8LtQM/1PMoFSdX2VnuFEbd46NTDQKubM+U9
	tFsz3UEGlqzZAT8cXnZYBejUs/LbgTw/Ptpuv382MHhtnxFEjeMO2XcgfSErYZJcyVXepYwjgCB
	cGKr74mU6lPt+HgqKiRmC1tPVjTf8jBMDAlJoydKn29nGs9gSm61M81fvfrSC701G6sGkzGtgvm
	sLAIxgOYBaXi4Rzs7w7gDcwmgzahlqHd+aWMc59UkJ9nO1zpzz+wzxMlqTt1UP2/7dr5u+BjBVW
	t/iqDji+Q4yYVMe1gS1hK1ooqLvhMpcYMxF0tq9X/uAwO9dZVf8ti5ZfmVkd6b16Uus4MQV1+yz
	TWdDAPCa3rtIV83aogKkaRzGrJQqhRas1GAezaHhVK/8CFBxyhEW2F0apSK0rDQ5aE6Nd3s7ecI
	mr9WiYcv+Dg8FrCxVrRZhmT6rZqRfyL1lfKn1uCSm4dsyw==
X-Received: by 2002:a17:90b:2741:b0:3a0:e4ce:31fd with SMTP id 98e67ed59e1d1-3ae896f8304mr6013969a91.10.1793518655425;
        Sun, 01 Nov 2026 00:37:35 -0700 (PDT)
Received: from gye-SER8.tail6a86d6.ts.net ([121.125.115.175])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cdb096b8323sm2114642a12.6.2026.11.01.00.37.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 00:37:34 -0700 (PDT)
From: Gyeyoung Baek <gye976@gmail.com>
To: Tomeu Vizoso <tomeu@tomeuvizoso.net>,
	Oded Gabbay <ogabbay@kernel.org>
Cc: Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Sidong Yang <sidong.yang@furiosa.ai>,
	dri-devel@lists.freedesktop.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH v2] accel/rocket: Fix drm_mm UAF on close vs in-flight job
Date: Sun,  1 Nov 2026 16:37:00 +0900
Message-ID: <20261101073700.1261966-1-gye976@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The drm_mm and its mutex live in rocket_file_priv, which
rocket_postclose() frees on fd close.  But a BO held by an
in-flight job is only freed after close, from the drm_sched
free_job worker, and its destructor then accesses the already
freed drm_mm and mutex.

  BUG: KASAN: slab-use-after-free in __mutex_trylock_common+0x90/0x1e8
  Workqueue: <NPU>.npu drm_sched_free_job_work [gpu_sched]
  Call trace:
    __mutex_lock
    rocket_gem_bo_free
    rocket_job_cleanup
    rocket_job_free
    drm_sched_free_job_work [gpu_sched]

Move drm_mm and the mutex out of rocket_file_priv into the
kref-managed rocket_iommu_domain (renamed to rocket_vm).  Their
lifetime now matches the vm's: as long as a BO or job references
the vm, the address-space state stays alive.

Fixes: ed98261b4168 ("accel/rocket: Add a new driver for Rockchip's NPU")
Cc: stable@vger.kernel.org
Signed-off-by: Gyeyoung Baek <gye976@gmail.com>
---
Changes in v2:
- Rebased on drm-misc-fixes and resent. No functional changes.
- Link to v1: https://lore.kernel.org/r/20260426103758.1373137-1-gye976@gmail.com

 drivers/accel/rocket/rocket_drv.c | 74 +++++++++++++++----------------
 drivers/accel/rocket/rocket_drv.h | 13 +++---
 drivers/accel/rocket/rocket_gem.c | 31 ++++++-------
 drivers/accel/rocket/rocket_gem.h |  4 +-
 drivers/accel/rocket/rocket_job.c |  6 +--
 drivers/accel/rocket/rocket_job.h |  2 +-
 6 files changed, 64 insertions(+), 66 deletions(-)

diff --git a/drivers/accel/rocket/rocket_drv.c b/drivers/accel/rocket/rocket_drv.c
index 5d7805c41dc..f58c15131dc 100644
--- a/drivers/accel/rocket/rocket_drv.c
+++ b/drivers/accel/rocket/rocket_drv.c
@@ -26,46 +26,54 @@ static struct platform_device *drm_dev;
 static struct rocket_device *rdev;
 
 static void
-rocket_iommu_domain_destroy(struct kref *kref)
+rocket_vm_destroy(struct kref *kref)
 {
-	struct rocket_iommu_domain *domain = container_of(kref, struct rocket_iommu_domain, kref);
+	struct rocket_vm *vm = container_of(kref, struct rocket_vm, kref);
 
-	iommu_domain_free(domain->domain);
-	domain->domain = NULL;
-	kfree(domain);
+	drm_mm_takedown(&vm->mm);
+	mutex_destroy(&vm->lock);
+	iommu_domain_free(vm->domain);
+	vm->domain = NULL;
+	kfree(vm);
 }
 
-static struct rocket_iommu_domain*
-rocket_iommu_domain_create(struct device *dev)
+static struct rocket_vm *
+rocket_vm_create(struct device *dev)
 {
-	struct rocket_iommu_domain *domain = kmalloc_obj(*domain);
+	struct rocket_vm *vm = kmalloc_obj(*vm);
+	u64 start, end;
 	void *err;
 
-	if (!domain)
+	if (!vm)
 		return ERR_PTR(-ENOMEM);
 
-	domain->domain = iommu_paging_domain_alloc(dev);
-	if (IS_ERR(domain->domain)) {
-		err = ERR_CAST(domain->domain);
-		kfree(domain);
+	vm->domain = iommu_paging_domain_alloc(dev);
+	if (IS_ERR(vm->domain)) {
+		err = ERR_CAST(vm->domain);
+		kfree(vm);
 		return err;
 	}
-	kref_init(&domain->kref);
 
-	return domain;
+	start = vm->domain->geometry.aperture_start;
+	end = vm->domain->geometry.aperture_end;
+	drm_mm_init(&vm->mm, start, end - start + 1);
+	mutex_init(&vm->lock);
+	kref_init(&vm->kref);
+
+	return vm;
 }
 
-struct rocket_iommu_domain *
-rocket_iommu_domain_get(struct rocket_file_priv *rocket_priv)
+struct rocket_vm *
+rocket_vm_get(struct rocket_file_priv *rocket_priv)
 {
-	kref_get(&rocket_priv->domain->kref);
-	return rocket_priv->domain;
+	kref_get(&rocket_priv->vm->kref);
+	return rocket_priv->vm;
 }
 
 void
-rocket_iommu_domain_put(struct rocket_iommu_domain *domain)
+rocket_vm_put(struct rocket_vm *vm)
 {
-	kref_put(&domain->kref, rocket_iommu_domain_destroy);
+	kref_put(&vm->kref, rocket_vm_destroy);
 }
 
 static int
@@ -73,7 +81,6 @@ rocket_open(struct drm_device *dev, struct drm_file *file)
 {
 	struct rocket_device *rdev = to_rocket_device(dev);
 	struct rocket_file_priv *rocket_priv;
-	u64 start, end;
 	int ret;
 
 	if (!try_module_get(THIS_MODULE))
@@ -86,29 +93,22 @@ rocket_open(struct drm_device *dev, struct drm_file *file)
 	}
 
 	rocket_priv->rdev = rdev;
-	rocket_priv->domain = rocket_iommu_domain_create(rdev->cores[0].dev);
-	if (IS_ERR(rocket_priv->domain)) {
-		ret = PTR_ERR(rocket_priv->domain);
+	rocket_priv->vm = rocket_vm_create(rdev->cores[0].dev);
+	if (IS_ERR(rocket_priv->vm)) {
+		ret = PTR_ERR(rocket_priv->vm);
 		goto err_free;
 	}
 
 	file->driver_priv = rocket_priv;
 
-	start = rocket_priv->domain->domain->geometry.aperture_start;
-	end = rocket_priv->domain->domain->geometry.aperture_end;
-	drm_mm_init(&rocket_priv->mm, start, end - start + 1);
-	mutex_init(&rocket_priv->mm_lock);
-
 	ret = rocket_job_open(rocket_priv);
 	if (ret)
-		goto err_mm_takedown;
+		goto err_vm_put;
 
 	return 0;
 
-err_mm_takedown:
-	mutex_destroy(&rocket_priv->mm_lock);
-	drm_mm_takedown(&rocket_priv->mm);
-	rocket_iommu_domain_put(rocket_priv->domain);
+err_vm_put:
+	rocket_vm_put(rocket_priv->vm);
 err_free:
 	kfree(rocket_priv);
 err_put_mod:
@@ -122,9 +122,7 @@ rocket_postclose(struct drm_device *dev, struct drm_file *file)
 	struct rocket_file_priv *rocket_priv = file->driver_priv;
 
 	rocket_job_close(rocket_priv);
-	mutex_destroy(&rocket_priv->mm_lock);
-	drm_mm_takedown(&rocket_priv->mm);
-	rocket_iommu_domain_put(rocket_priv->domain);
+	rocket_vm_put(rocket_priv->vm);
 	kfree(rocket_priv);
 	module_put(THIS_MODULE);
 }
diff --git a/drivers/accel/rocket/rocket_drv.h b/drivers/accel/rocket/rocket_drv.h
index 2c673bb99cc..2754f46f174 100644
--- a/drivers/accel/rocket/rocket_drv.h
+++ b/drivers/accel/rocket/rocket_drv.h
@@ -11,22 +11,23 @@
 
 extern const struct dev_pm_ops rocket_pm_ops;
 
-struct rocket_iommu_domain {
+struct rocket_vm {
 	struct iommu_domain *domain;
+	struct drm_mm mm;
+	/* protects @mm */
+	struct mutex lock;
 	struct kref kref;
 };
 
 struct rocket_file_priv {
 	struct rocket_device *rdev;
 
-	struct rocket_iommu_domain *domain;
-	struct drm_mm mm;
-	struct mutex mm_lock;
+	struct rocket_vm *vm;
 
 	struct drm_sched_entity sched_entity;
 };
 
-struct rocket_iommu_domain *rocket_iommu_domain_get(struct rocket_file_priv *rocket_priv);
-void rocket_iommu_domain_put(struct rocket_iommu_domain *domain);
+struct rocket_vm *rocket_vm_get(struct rocket_file_priv *rocket_priv);
+void rocket_vm_put(struct rocket_vm *vm);
 
 #endif
diff --git a/drivers/accel/rocket/rocket_gem.c b/drivers/accel/rocket/rocket_gem.c
index a5fffa51ff3..057fd82e2a5 100644
--- a/drivers/accel/rocket/rocket_gem.c
+++ b/drivers/accel/rocket/rocket_gem.c
@@ -14,20 +14,20 @@
 static void rocket_gem_bo_free(struct drm_gem_object *obj)
 {
 	struct rocket_gem_object *bo = to_rocket_bo(obj);
-	struct rocket_file_priv *rocket_priv = bo->driver_priv;
+	struct rocket_vm *vm = bo->vm;
 	size_t unmapped;
 
 	drm_WARN_ON(obj->dev, refcount_read(&bo->base.pages_use_count) > 1);
 
-	unmapped = iommu_unmap(bo->domain->domain, bo->mm.start, bo->size);
+	unmapped = iommu_unmap(vm->domain, bo->mm.start, bo->size);
 	drm_WARN_ON(obj->dev, unmapped != bo->size);
 
-	mutex_lock(&rocket_priv->mm_lock);
+	mutex_lock(&vm->lock);
 	drm_mm_remove_node(&bo->mm);
-	mutex_unlock(&rocket_priv->mm_lock);
+	mutex_unlock(&vm->lock);
 
-	rocket_iommu_domain_put(bo->domain);
-	bo->domain = NULL;
+	rocket_vm_put(vm);
+	bo->vm = NULL;
 
 	drm_gem_shmem_free(&bo->base);
 }
@@ -64,6 +64,7 @@ int rocket_ioctl_create_bo(struct drm_device *dev, void *data, struct drm_file *
 	struct drm_gem_shmem_object *shmem_obj;
 	struct rocket_gem_object *rkt_obj;
 	struct drm_gem_object *gem_obj;
+	struct rocket_vm *vm;
 	struct sg_table *sgt;
 	int ret;
 
@@ -74,8 +75,8 @@ int rocket_ioctl_create_bo(struct drm_device *dev, void *data, struct drm_file *
 	gem_obj = &shmem_obj->base;
 	rkt_obj = to_rocket_bo(gem_obj);
 
-	rkt_obj->driver_priv = rocket_priv;
-	rkt_obj->domain = rocket_iommu_domain_get(rocket_priv);
+	vm = rocket_vm_get(rocket_priv);
+	rkt_obj->vm = vm;
 	rkt_obj->size = args->size;
 	rkt_obj->offset = 0;
 
@@ -85,15 +86,15 @@ int rocket_ioctl_create_bo(struct drm_device *dev, void *data, struct drm_file *
 		goto err;
 	}
 
-	mutex_lock(&rocket_priv->mm_lock);
-	ret = drm_mm_insert_node_generic(&rocket_priv->mm, &rkt_obj->mm,
+	mutex_lock(&vm->lock);
+	ret = drm_mm_insert_node_generic(&vm->mm, &rkt_obj->mm,
 					 rkt_obj->size, PAGE_SIZE,
 					 0, 0);
-	mutex_unlock(&rocket_priv->mm_lock);
+	mutex_unlock(&vm->lock);
 	if (ret)
 		goto err;
 
-	ret = iommu_map_sgtable(rocket_priv->domain->domain,
+	ret = iommu_map_sgtable(vm->domain,
 				rkt_obj->mm.start,
 				shmem_obj->sgt,
 				IOMMU_READ | IOMMU_WRITE);
@@ -118,13 +119,13 @@ int rocket_ioctl_create_bo(struct drm_device *dev, void *data, struct drm_file *
 	return 0;
 
 err_unmap:
-	iommu_unmap(rocket_priv->domain->domain,
+	iommu_unmap(vm->domain,
 		    rkt_obj->mm.start, rkt_obj->size);
 
 err_remove_node:
-	mutex_lock(&rocket_priv->mm_lock);
+	mutex_lock(&vm->lock);
 	drm_mm_remove_node(&rkt_obj->mm);
-	mutex_unlock(&rocket_priv->mm_lock);
+	mutex_unlock(&vm->lock);
 
 err:
 	drm_gem_shmem_object_free(gem_obj);
diff --git a/drivers/accel/rocket/rocket_gem.h b/drivers/accel/rocket/rocket_gem.h
index 24043033450..e1fbbd8cf71 100644
--- a/drivers/accel/rocket/rocket_gem.h
+++ b/drivers/accel/rocket/rocket_gem.h
@@ -9,9 +9,7 @@
 struct rocket_gem_object {
 	struct drm_gem_shmem_object base;
 
-	struct rocket_file_priv *driver_priv;
-
-	struct rocket_iommu_domain *domain;
+	struct rocket_vm *vm;
 	struct drm_mm_node mm;
 	size_t size;
 	u32 offset;
diff --git a/drivers/accel/rocket/rocket_job.c b/drivers/accel/rocket/rocket_job.c
index 4bc4f9c8ee4..0de56bb84e3 100644
--- a/drivers/accel/rocket/rocket_job.c
+++ b/drivers/accel/rocket/rocket_job.c
@@ -240,7 +240,7 @@ static void rocket_job_cleanup(struct kref *ref)
 						refcount);
 	unsigned int i;
 
-	rocket_iommu_domain_put(job->domain);
+	rocket_vm_put(job->vm);
 
 	dma_fence_put(job->done_fence);
 	dma_fence_put(job->inference_done_fence);
@@ -321,7 +321,7 @@ static struct dma_fence *rocket_job_run(struct drm_sched_job *sched_job)
 	if (ret < 0)
 		goto err_put_fences;
 
-	ret = iommu_attach_group(job->domain->domain, core->iommu_group);
+	ret = iommu_attach_group(job->vm->domain, core->iommu_group);
 	if (ret < 0)
 		goto err_put_pm;
 
@@ -564,7 +564,7 @@ static int rocket_ioctl_submit_job(struct drm_device *dev, struct drm_file *file
 	kref_init(&rjob->refcount);
 
 	rjob->rdev = rdev;
-	rjob->domain = rocket_iommu_domain_get(file_priv);
+	rjob->vm = rocket_vm_get(file_priv);
 
 	ret = drm_sched_job_init(&rjob->base,
 				 &file_priv->sched_entity,
diff --git a/drivers/accel/rocket/rocket_job.h b/drivers/accel/rocket/rocket_job.h
index 4ae00feec3b..9373c3d0273 100644
--- a/drivers/accel/rocket/rocket_job.h
+++ b/drivers/accel/rocket/rocket_job.h
@@ -36,7 +36,7 @@ struct rocket_job {
 	/* Fence to be signaled by IRQ handler when the job is complete. */
 	struct dma_fence *done_fence;
 
-	struct rocket_iommu_domain *domain;
+	struct rocket_vm *vm;
 
 	struct kref refcount;
 };

base-commit: f00d7a241f846b053e89c0bb2285ef5988d4cafc
-- 
2.43.0

