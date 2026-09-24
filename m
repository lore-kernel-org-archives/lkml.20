Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81C1C1F5821
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 12:30:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790253057; cv=none; b=hoIAfoWAbh+I64Dl4ro8cfYskrVpYr3Q/5HJrAKL5s5wUgVjX9jWDaddzqgKNM9KKAYwHuc+lPob+TmzqYZ7vonMhfVpsRFiEKR9CxVjCcwfoiUQSYsqFsCu1zrAF8sODENpW7EcUwXn9vQO9DtTg3e7xGtcPLIM3OkD8gZqwmc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790253057; c=relaxed/simple;
	bh=7Z9BRnc88lWRD9mzvlib9f0zxylO0s87pD48teC9g1o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=P/Gs4F2JfonmT3u2lkAlhufp2oudyZBbjSpVem1Lk5gY6joDqhTwRmDl2ABSEkQmri4XkHzAEiesT5ehlzO493ux9gYEj2/uQC2eidHIQ2KgORi+rZQMhsbR5B/us3k3ijido65zsb+tZ8R/2+BqeayGwWJMmlbAsOy+ejPWjMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=Uc/XuySp; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="Uc/XuySp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1790253053;
	bh=7Z9BRnc88lWRD9mzvlib9f0zxylO0s87pD48teC9g1o=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Uc/XuySpum2htJ1K5glZh8dFcGDZ47cv/AJMcGooMk+zQFjUeQEg9A9m66KAQ5fu4
	 55yg70mQDo2mEUujlZkMMz4qNvESyEtgNkc2e5PqJyxIDr8a6XevNtPkpLyfiQQo0S
	 rX5OQUUObiL0PtaI5d0uDR55jVVMvThhieOjmC+PXAAJdTx+TolIB6iJyD/ycd6iNx
	 /fPGul7OdKs7Zr5FzJoZalqjHavCH6hrrcGgTpgrB00tkj4bY/qafy2/taoYG+d8CF
	 qXdddE2AP5Q/6WaJQ2yykC9uTDhn7D41BObIGWlQ+O3BEREPe/Q5eCarRblFRQeLFU
	 PDq2D8r1BT2Pw==
Received: from fedora-32.home (unknown [100.64.0.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bbrezillon)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 3B55917E0B0F;
	Thu, 24 Sep 2026 14:30:53 +0200 (CEST)
From: Boris Brezillon <boris.brezillon@collabora.com>
Date: Thu, 24 Sep 2026 14:30:44 +0200
Subject: [PATCH 2/3] drm/panthor: Fully disable the AS even if it's going
 to be re-assigned
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260924-panthor-mmu-fixes-v1-2-e25f9b106466@collabora.com>
References: <20260924-panthor-mmu-fixes-v1-0-e25f9b106466@collabora.com>
In-Reply-To: <20260924-panthor-mmu-fixes-v1-0-e25f9b106466@collabora.com>
To: Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>, 
 Akash Goel <akash.goel@arm.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Chia-I Wu <olvaffe@gmail.com>, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, 
 Boris Brezillon <boris.brezillon@collabora.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790253051; l=4132;
 i=boris.brezillon@collabora.com; s=20260429; h=from:subject:message-id;
 bh=7Z9BRnc88lWRD9mzvlib9f0zxylO0s87pD48teC9g1o=;
 b=z9QhgEUI1uTx35sXCT2CHZRGwu2jbVSG2firdYMAEsbgFsHlvpamQMvvrobq0cA8CRNIjBl4d
 hQFZI2Ixj2IA9JU6RE87quUK0/l98eUj6/51wHRy3xhLtxAO0tqzbf2
X-Developer-Key: i=boris.brezillon@collabora.com; a=ed25519;
 pk=eN+ORdOgQY7d5U+0kA8h5bf67XdD8bhKbjD/TCHexSY=

We're trying to be smart by skipping the UPDATE(UNMAPPED) step, but
it remains to be proven it adds any noticeable overhead. Moreover, it's
breaking the assumption that, once the VM is unbound, no access can
happen on it.

For instance, say the panthor_mmu_as_enable() call in panthor_vm_active()
fails after we've called panthor_vm_release_as_locked(), we're now in a
state where the HW still points to the old page table, but SW slot points
to the new VM, which is not truly HW-bound.

If, after the as_slots lock is released, the evicted VM itself is
released, the HW might have access to memory that has been returned
to the system until the reset we scheduled (because of the faulty
AS_COMMAND) is effective.

Let's make this bullet-proof by doing a full bound -> unbound -> bound
cycle on AS slot recycling.

Fixes: 32e593d74c39 ("drm/panthor: Make sure caches are flushed/invalidated when an AS is recycled")
Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
---
 drivers/gpu/drm/panthor/panthor_mmu.c | 21 +++++++--------------
 1 file changed, 7 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/panthor/panthor_mmu.c b/drivers/gpu/drm/panthor/panthor_mmu.c
index 7e98084b9a1e..038a092fd08c 100644
--- a/drivers/gpu/drm/panthor/panthor_mmu.c
+++ b/drivers/gpu/drm/panthor/panthor_mmu.c
@@ -620,8 +620,7 @@ static int panthor_mmu_as_enable(struct panthor_device *ptdev, u32 as_nr,
 	return as_send_cmd_and_wait(ptdev, as_nr, AS_COMMAND_UPDATE);
 }
 
-static int panthor_mmu_as_disable(struct panthor_device *ptdev, u32 as_nr,
-				  bool recycle_slot)
+static int panthor_mmu_as_disable(struct panthor_device *ptdev, u32 as_nr)
 {
 	struct panthor_mmu *mmu = ptdev->mmu;
 	struct panthor_vm *vm = ptdev->mmu->as.slots[as_nr].vm;
@@ -645,12 +644,6 @@ static int panthor_mmu_as_disable(struct panthor_device *ptdev, u32 as_nr,
 			return ret;
 	}
 
-	/* If the slot is going to be used immediately, don't bother changing
-	 * the config.
-	 */
-	if (recycle_slot)
-		return 0;
-
 	gpu_write64(mmu->iomem, AS_TRANSTAB(as_nr), 0);
 	gpu_write64(mmu->iomem, AS_MEMATTR(as_nr), 0);
 	gpu_write64(mmu->iomem, AS_TRANSCFG(as_nr), AS_TRANSCFG_ADRMODE_UNMAPPED);
@@ -777,7 +770,7 @@ int panthor_vm_active(struct panthor_vm *vm)
 		drm_WARN_ON(&ptdev->base, refcount_read(&lru_vm->as.active_cnt));
 		as = lru_vm->as.id;
 
-		ret = panthor_mmu_as_disable(ptdev, as, true);
+		ret = panthor_mmu_as_disable(ptdev, as);
 		if (ret)
 			goto out_unlock;
 
@@ -919,7 +912,7 @@ static void panthor_vm_declare_unusable(struct panthor_vm *vm)
 	vm->unusable = true;
 	mutex_lock(&ptdev->mmu->as.slots_lock);
 	if (vm->as.id >= 0 && drm_dev_enter(&ptdev->base, &cookie)) {
-		panthor_mmu_as_disable(ptdev, vm->as.id, false);
+		panthor_mmu_as_disable(ptdev, vm->as.id);
 		drm_dev_exit(cookie);
 	}
 	mutex_unlock(&ptdev->mmu->as.slots_lock);
@@ -1911,7 +1904,7 @@ static void panthor_mmu_irq_handler(struct panthor_device *ptdev, u32 status)
 			ptdev->mmu->as.slots[as].vm->unhandled_fault = true;
 
 		/* Disable the MMU to kill jobs on this AS. */
-		panthor_mmu_as_disable(ptdev, as, false);
+		panthor_mmu_as_disable(ptdev, as);
 		mutex_unlock(&ptdev->mmu->as.slots_lock);
 
 		status &= ~mask;
@@ -1940,7 +1933,7 @@ void panthor_mmu_suspend(struct panthor_device *ptdev)
 
 		if (vm) {
 			drm_WARN_ON(&ptdev->base,
-				    panthor_mmu_as_disable(ptdev, i, false));
+				    panthor_mmu_as_disable(ptdev, i));
 			panthor_vm_release_as_locked(vm);
 		}
 	}
@@ -2065,7 +2058,7 @@ static void panthor_vm_free(struct drm_gpuvm *gpuvm)
 		int cookie;
 
 		if (drm_dev_enter(&ptdev->base, &cookie)) {
-			panthor_mmu_as_disable(ptdev, vm->as.id, false);
+			panthor_mmu_as_disable(ptdev, vm->as.id);
 			drm_dev_exit(cookie);
 		}
 
@@ -3360,7 +3353,7 @@ void panthor_mmu_unplug(struct panthor_device *ptdev)
 
 		if (vm) {
 			drm_WARN_ON(&ptdev->base,
-				    panthor_mmu_as_disable(ptdev, i, false));
+				    panthor_mmu_as_disable(ptdev, i));
 			panthor_vm_release_as_locked(vm);
 		}
 	}

-- 
2.55.0

