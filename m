Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793778774;
	b=NV7ThdS5or6BUN84UfQaZ9BBEMx/JxGhJGu2z2wURc7SaiN8hUFII3bkXonjvCuuCL+N
	 HUI3MH7sR9y0FHn21P42FD/ixgDdsiR0Nt+MM9taXJrsMg/QCxxr1LJcthxluwsizEAtV
	 H7O1ZEuBXy3zesJUUKCOHClSlipk7iaAXp6I9qzkAUkVKU5xA74ew2o7QGGG6Vd4a2cYg
	 DRFZEHsAHjim65fG/4Gw3VskOGNV9fh0fuNbfW+LA3ew8bNjuJ8hSF1h6fYYS5k6unCZ+
	 sQQQWyBv3fZupa3BFAOrBXWIijrhAxPN7XNHVy3TIiLtEV/yzJ9NWAzPOPOzBCzNQgg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793778774;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=H9pWRYIuDAbASTBKlOVzXYu6I+EvAShszd61Y2x+bnQ=;
	b=zLsSPreekk8LQ2JnMj/5FoMIUfZA4ppPRf2uDLqBuagvzh+uCY+xwQxLHf3RGuivADIW
	 AoQ8j+QggzAcmtnR1y4I/zIz5m1CAw6raWrLWN+9ira3SV/5UOywVqKW9QJNtOm3V6OnQ
	 teogtECngRJwRxRGGNcQ2dmiGXAFKR2jYyZWdAoc62ibFbiH1CiJNmvp906aUoxf91y3Z
	 NEkCQFESwGSBp5SLMiRltiHYcOTImrZPCJOdz/0uXhfwh+UrL/phgmaOw32J88kdALyUl
	 2nQaeiMUsoV6OvQ5uW6gXKLkrnnZ5ZRob31ubEd9MBjipkcb1rAeWCwmhr07gOGLinA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=c6bim7w0;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C696606A33A
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 07:52:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9C696606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=c6bim7w0
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4b467581b98so1860425e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 23:52:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793778772; x=1794383572; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=H9pWRYIuDAbASTBKlOVzXYu6I+EvAShszd61Y2x+bnQ=;
        b=c6bim7w0MrecT/LTcZm4w7jH7t/rwOkixrL1BiRKyJMhLwAYd7ZFN0kbrRlqJqfYPI
         E+YxJzYB+0z+WkP4HiS5/Xvi+EMEFh1anzYGV3xdzuvD7ra5v94/ui12ulPOIiTRun8y
         dkBpnd71XfEAaCTK+i+rOrzvWETF9ILaNUgG+PUp8CSoK6PRwX6njCk5MIDkm+osWhTH
         GcTgJg/HbecZaU8H+BlTvOi3exS4hnEbrNKPWocBCY7Aqp8ye5W3lzEEbJgNYfVMn9MI
         twQfJXqGqTiCxzQN0omOwIgoPfMmkGavZIzd9L40Hu75+gBSmbp/awWHroyCkUAvnM6u
         xm+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793778772; x=1794383572;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=H9pWRYIuDAbASTBKlOVzXYu6I+EvAShszd61Y2x+bnQ=;
        b=X+8jSXZbgYuObJ50spXgPa/NyjDpsTm/gcGJN+uRIgFM/XHamiB5nCYemfB1BhLKnk
         nIt+QmcafkYVoH9bdUYNgbjMJDJRCtkyJMfEAfRTo6le/BWTuerD5+q3ikJTD3nasdxm
         TjmJ+GCc00g1rAD7hX9OIjx319c98p0d50nOqG6Y64cR8K987X+By+TUcYdCiylOgzeI
         z680uznrK0LIM0TXhObK7FY5V6Z+nuL79fWhPdiMSYfeNTlo4qKes7zrWJZf+eXv26zS
         txRZ/kmYYH+EXKC0a2d0Gi7S8XgSXvdUx61mXERniYXzaPaIQeg1jcTIPGWc2mK2xBWP
         yfUQ==
X-Forwarded-Encrypted: i=1; AKwUvBxjhpbcaFtP/vYvL41N7na5KfUPvgMuCAtHAuWUZMgJZBfa5E2cdeSDzPh6KY88n07dwcKfrDC6xvJkvVc=@vger.kernel.org
X-Gm-Message-State: APuU4Z+RBVIBlvXzjFZ4KaVzkA6G6qjMXuEU1VOKPk5/pitwLRXNtbVJ
	JytMI11U7piVLcGVuCCAUlrkba6F8ArXL1fFs9YKF5+04hLaDlewLOA6S0Nj5U5VK/s=
X-Gm-Gg: AYBFou3zk8a19rmooodLTdFxWFxz1fvsUh+VMRLBHcGJEkAoUrWDuP+kjptsMQQbBVP
	VFbv3T9RkvXE0uT8VrpBViIIBDT7smcKqzELNBEOJNuNModnr01YXXwDJ02q1rzqkxXu73xXL3d
	ZWPiujADunQZY/zNuQDyY3vqnIsA7a4CEo0IO2qF49+zPv4QrN2LzLWZYiLvkiNRqIX32xGV3nA
	vN1ivLQBfIW3GA6Po3WUsiD8E02y++/HUI5tbXitDOEZuhH5TXHOHZ4+gIzrEH3/0i1IuByV6iI
	cNR1Fk9YpEcB5xS7/lwl9vefrgfX6HmzIhtPobws7nngC0BYp85qJnt2OPwb55jUvTZ1XbUN7lF
	gMYhzw9W9pSfLWJdJTaWCvqxDhu2LQLz6JrjlzaofRYbghU/F4PO94HvYdLUr2U1Zk4jasQJAnA
	h2C+BoQltYndPLqrDajGDWW7TKOvcNN5Up/Iy7RztcHkmf8ffRpnYoFeA8VKGTOeB4+E7w849ZI
	4VaUxG0PkXuNnTL1empIb4O/PJ46US9KOxPFAQBKB1KkjzYL3BeAWUzQCBPKWObcBgsZfdHKQYN
	EE9tnaZkETC3FXolBp7lUMzuRssMgaVARE5NvU4b5bfz002KzKfbLw48FIl4WeLLiCzD/oTCtTb
	f87HTaSEleUPtANBIYPmVUczzxo1/5lxoNARGdVmKJg633QEelZoE
X-Received: by 2002:a05:600c:3554:b0:4a1:e7ce:107b with SMTP id 5b1f17b1804b1-4ac150b20eamr371311155e9.2.1793778771764;
        Tue, 03 Nov 2026 23:52:51 -0800 (PST)
Received: from localhost.localdomain (80-108-121-211.cable.dynamic.surfer.at. [80.108.121.211])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48feda207d8sm2200785f8f.52.2026.11.03.23.52.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 23:52:51 -0800 (PST)
From: Christian Gmeiner <christian.gmeiner@gmail.com>
Date: Wed, 04 Nov 2026 08:52:39 +0100
Subject: [PATCH v2 1/3] drm/panthor: Report the last VM fault through
 VM_GET_STATE
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
Message-Id: <20261104-panthor-fault-info-v2-v2-1-673b31f3840c@igalia.com>
References: <20261104-panthor-fault-info-v2-v2-0-673b31f3840c@igalia.com>
In-Reply-To: <20261104-panthor-fault-info-v2-v2-0-673b31f3840c@igalia.com>
To: Boris Brezillon <boris.brezillon@collabora.com>, 
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Alice Ryhl <aliceryhl@google.com>
Cc: Lukas Zapolskas <lukas.zapolskas@arm.com>, 
 Paul Toadere <paul.toadere@arm.com>, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 Christian Gmeiner <cgmeiner@igalia.com>
X-Mailer: b4 0.14.3

From: Christian Gmeiner <cgmeiner@igalia.com>

Keep the raw AS_FAULTSTATUS and AS_FAULTADDRESS of the last fault in
the VM and return them through VM_GET_STATE. Userspace decodes the
values. No memory is allocated in the fault path.

The MMU irq handler records the fault under the AS slots lock. The
ioctl reads it under the same lock. The VM stores the fault as a
struct drm_panthor_vm_fault, which is the uAPI struct, so the ioctl
can copy it with one assignment.

The unhandled_fault flag is cleared when the VM is re-activated. The
stored fault is not. So userspace can still query it after the group
that hit the fault was killed.

Old userspace that passes the shorter struct still works, the DRM core
zero-fills the missing tail.

Link: https://lore.kernel.org/r/20251215115457.2137485-4-lukas.zapolskas@arm.com
Signed-off-by: Christian Gmeiner <cgmeiner@igalia.com>
---
 drivers/gpu/drm/panthor/panthor_drv.c |  2 ++
 drivers/gpu/drm/panthor/panthor_mmu.c | 33 +++++++++++++++++++++++++++++++--
 drivers/gpu/drm/panthor/panthor_mmu.h |  2 ++
 include/uapi/drm/panthor_drm.h        | 22 ++++++++++++++++++++++
 4 files changed, 57 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/panthor/panthor_drv.c b/drivers/gpu/drm/panthor/panthor_drv.c
index dc8d0191aef4..7572cd7d6423 100644
--- a/drivers/gpu/drm/panthor/panthor_drv.c
+++ b/drivers/gpu/drm/panthor/panthor_drv.c
@@ -1471,6 +1471,8 @@ static int panthor_ioctl_vm_get_state(struct drm_device *ddev, void *data,
 	else
 		args->state = DRM_PANTHOR_VM_STATE_USABLE;
 
+	panthor_vm_get_fault(vm, &args->fault);
+
 	panthor_vm_put(vm);
 	return 0;
 }
diff --git a/drivers/gpu/drm/panthor/panthor_mmu.c b/drivers/gpu/drm/panthor/panthor_mmu.c
index d1c29eec46f2..6fc5f3d381c1 100644
--- a/drivers/gpu/drm/panthor/panthor_mmu.c
+++ b/drivers/gpu/drm/panthor/panthor_mmu.c
@@ -389,6 +389,15 @@ struct panthor_vm {
 	 */
 	bool unhandled_fault;
 
+	/**
+	 * @fault: Last fault on this VM.
+	 *
+	 * A new fault overwrites the previous one. Unlike @unhandled_fault,
+	 * this is not cleared when the VM is re-activated. Protected by
+	 * panthor_mmu::as::slots_lock.
+	 */
+	struct drm_panthor_vm_fault fault;
+
 	/** @locked_region: Information about the currently locked region currently. */
 	struct {
 		/** @locked_region.start: Start of the locked region. */
@@ -662,6 +671,19 @@ bool panthor_vm_has_unhandled_faults(struct panthor_vm *vm)
 	return vm->unhandled_fault;
 }
 
+/**
+ * panthor_vm_get_fault() - Get the last fault of a VM
+ * @vm: VM to query.
+ * @fault: Returns the last fault, with a zero status if no fault happened.
+ */
+void panthor_vm_get_fault(struct panthor_vm *vm, struct drm_panthor_vm_fault *fault)
+{
+	struct panthor_device *ptdev = vm->ptdev;
+
+	guard(mutex)(&ptdev->mmu->as.slots_lock);
+	*fault = vm->fault;
+}
+
 /**
  * panthor_vm_is_unusable() - Check if the VM is still usable
  * @vm: VM to check.
@@ -1855,6 +1877,7 @@ static void panthor_mmu_irq_handler(struct panthor_irq *pirq, u32 status)
 	while (status) {
 		u32 as = ffs(status | (status >> 16)) - 1;
 		u32 mask = MMU_INT_AS_FAULT(as);
+		struct panthor_vm *vm;
 		u64 addr;
 		u32 fault_status;
 		u32 exception_type;
@@ -1895,8 +1918,14 @@ static void panthor_mmu_irq_handler(struct panthor_irq *pirq, u32 status)
 		 */
 		gpu_write(mmu->irq.iomem, INT_CLEAR, mask);
 
-		if (ptdev->mmu->as.slots[as].vm)
-			ptdev->mmu->as.slots[as].vm->unhandled_fault = true;
+		vm = mmu->as.slots[as].vm;
+		if (vm) {
+			vm->unhandled_fault = true;
+			vm->fault = (struct drm_panthor_vm_fault){
+				.status = fault_status,
+				.address = addr,
+			};
+		}
 
 		/* Disable the MMU to kill jobs on this AS. */
 		panthor_mmu_as_disable(ptdev, as);
diff --git a/drivers/gpu/drm/panthor/panthor_mmu.h b/drivers/gpu/drm/panthor/panthor_mmu.h
index abc36e7204be..74f9f5d98c94 100644
--- a/drivers/gpu/drm/panthor/panthor_mmu.h
+++ b/drivers/gpu/drm/panthor/panthor_mmu.h
@@ -11,6 +11,7 @@
 struct drm_exec;
 struct drm_sched_job;
 struct drm_memory_stats;
+struct drm_panthor_vm_fault;
 struct panthor_gem_object;
 struct panthor_heap_pool;
 struct panthor_vm;
@@ -74,6 +75,7 @@ struct panthor_vm *panthor_vm_pool_get_vm(struct panthor_vm_pool *pool, u32 hand
 
 bool panthor_vm_has_unhandled_faults(struct panthor_vm *vm);
 bool panthor_vm_is_unusable(struct panthor_vm *vm);
+void panthor_vm_get_fault(struct panthor_vm *vm, struct drm_panthor_vm_fault *fault);
 
 /*
  * PANTHOR_VM_KERNEL_AUTO_VA: Use this magic address when you want the GEM
diff --git a/include/uapi/drm/panthor_drm.h b/include/uapi/drm/panthor_drm.h
index a2ff0f4ec691..85e197d7a528 100644
--- a/include/uapi/drm/panthor_drm.h
+++ b/include/uapi/drm/panthor_drm.h
@@ -743,6 +743,20 @@ enum drm_panthor_vm_state {
 	DRM_PANTHOR_VM_STATE_UNUSABLE,
 };
 
+/**
+ * struct drm_panthor_vm_fault - Fault information of a VM.
+ */
+struct drm_panthor_vm_fault {
+	/** @status: Raw AS_FAULTSTATUS value, zero if no fault happened. */
+	__u32 status;
+
+	/** @pad: Will be zero on return. */
+	__u32 pad;
+
+	/** @address: Raw AS_FAULTADDRESS value, valid if @status is non-zero. */
+	__u64 address;
+};
+
 /**
  * struct drm_panthor_vm_get_state - Get VM state.
  */
@@ -756,6 +770,14 @@ struct drm_panthor_vm_get_state {
 	 * Must be one of the enum drm_panthor_vm_state values.
 	 */
 	__u32 state;
+
+	/**
+	 * @fault: Last fault on this VM.
+	 *
+	 * A new fault overwrites the previous one. It is not cleared when the
+	 * VM is re-activated or after a GPU reset.
+	 */
+	struct drm_panthor_vm_fault fault;
 };
 
 /**

-- 
2.56.0

