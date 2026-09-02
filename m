Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 556F24AF665
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 21:44:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788385471; cv=none; b=daRjACW1lSJ+2I6+KdikslEkNpZqDkDNI8IznFugZhwn+6WMCpHGZopr2kbp8NFhtNf4S6q71ANPd51LJnSh85fj8rWlYNLZPosiXl5DMW5wmxwDZScKjivBZWczuucImGu+Xu7CX0KwB8C6ZcEZnGBSSnvCcq0vQQT9LEZJZKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788385471; c=relaxed/simple;
	bh=hADbGKsG2GNP7ZSOHpEyR14RG0xZoJNeZoGIfYBdNS4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cuPouP6p1Y0W8b7u/vimjARDu3PfPrEe+3RrL0JjYFAm4hNYvw5g8hT6hchndK4Hj8bUvZZwbJGe4gYu5K2dGSMqrZyxssW8YHYZwTTUy71DpauAb2+KsQ0AjcdnWiQdRyzw+67K1wC/xCjYJv6qha4j9mpZ7NWSezyWNMHgMQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=I+xYWG1j; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="I+xYWG1j"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788385462; x=1819921462;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=hADbGKsG2GNP7ZSOHpEyR14RG0xZoJNeZoGIfYBdNS4=;
  b=I+xYWG1jFDys/MDM0cSxZUBHiPGuTN6xPmQtKfpjYYq47FaqEwHViAex
   2b2UY7k07Ujx4XJ0WhXgs1vs+LAxswYaQ3V3Ab8erbkGQ8rgtpri2uwbE
   LSZyHDm1/sQCNx84QZ9MMRgUm0bWEtb02tizLQXWbZnI4GymFl6FZWl91
   6+UTQhOA6FADaKC3vSvpVJDyzFwA/5LOLj8ZMojQg2zqQmONFctXzDUMj
   8YM1RECd5b3ym2yu2x/Pxi2IpsugsYOlA8/3p4QPr7/aIaC1DJ+8NtqLz
   eArTi1F1tQTfVgCEEUL30DglaImkOlh0J0H0FTH2NFvG5ILxUrtB9h7Ez
   A==;
X-CSE-ConnectionGUID: 3P8o9YIPRXecBUtZysLHTQ==
X-CSE-MsgGUID: CAy6bnZPQgKY5CaN/ucDag==
X-IronPort-AV: E=McAfee;i="6800,10657,11894"; a="87997780"
X-IronPort-AV: E=Sophos;i="6.25,258,1779174000"; 
   d="scan'208";a="87997780"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2026 14:44:08 -0700
X-CSE-ConnectionGUID: 1VCRX1apSk61TTh8Lfm+Vw==
X-CSE-MsgGUID: ggOZ/a0bStqUtVcQGqjxTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,258,1779174000"; 
   d="scan'208";a="266929181"
Received: from osgc-sh-dragon.sh.intel.com ([10.239.81.44])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2026 14:44:04 -0700
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: alex.zuo@intel.com,
	jonathan.cavitt@intel.com,
	mripard@kernel.org,
	airlied@gmail.com,
	simona@ffwll.ch,
	linux-kernel@vger.kernel.org,
	intel-xe@lists.freedesktop.org,
	Rodrigo.vivi@intel.com,
	matthew.brost@intel.com,
	maarten.lankhorst@linux.intel.com,
	thomas.hellstrom@linux.intel.com,
	tzimmermann@suse.de
Subject: [PATCH v7 1/2] drm/xe/pagefault: Add SRCID to pagefault struct
Date: Thu,  3 Sep 2026 05:43:57 +0800
Message-ID: <20260902214358.348399-2-jonathan.cavitt@intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260902214358.348399-1-jonathan.cavitt@intel.com>
References: <20260902214358.348399-1-jonathan.cavitt@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add SRCID information to pagefault struct for the purpose of reporting
the hardware unit that resulted in the pagefault.

v2:
- Squash SRCID with ASID to keep the struct compact (Matthew)

v3:
- Use BUILD_BUG_ON and move ASID definition in one function (Matthew)

v4:
- Various formatting fixes

Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: David Airlie <airlied@gmail.com>
Cc: Simona Vetter <simona@ffwll.ch>
---
 drivers/gpu/drm/xe/xe_guc_pagefault.c   |  8 +++++++-
 drivers/gpu/drm/xe/xe_pagefault.c       | 24 +++++++++++++++---------
 drivers/gpu/drm/xe/xe_pagefault_types.h |  9 +++++++--
 3 files changed, 29 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_pagefault.c b/drivers/gpu/drm/xe/xe_guc_pagefault.c
index 8f8210a732e98..df237fd405519 100644
--- a/drivers/gpu/drm/xe/xe_guc_pagefault.c
+++ b/drivers/gpu/drm/xe/xe_guc_pagefault.c
@@ -108,7 +108,13 @@ int xe_guc_pagefault_handler(struct xe_guc *guc, u32 *msg, u32 len)
 				      << PFD_VIRTUAL_ADDR_HI_SHIFT) |
 		(FIELD_GET(PFD_VIRTUAL_ADDR_LO, msg[2]) <<
 		 PFD_VIRTUAL_ADDR_LO_SHIFT);
-	pf.consumer.asid = FIELD_GET(PFD_ASID, msg[1]);
+
+	BUILD_BUG_ON(XE_MAX_ASID > XE_PAGEFAULT_ASID_MASK);
+
+	pf.consumer.id = FIELD_PREP(XE_PAGEFAULT_ASID_MASK,
+				    FIELD_GET(PFD_ASID, msg[1])) |
+			 FIELD_PREP(XE_PAGEFAULT_SRCID_MASK,
+				    FIELD_GET(PFD_SRC_ID, msg[0]));
 	pf.consumer.access_type = FIELD_GET(PFD_ACCESS_TYPE, msg[2]) |
 		(FIELD_GET(PFD_PREFETCH, msg[2]) ? XE_PAGEFAULT_ACCESS_PREFETCH : 0);
 	if (FIELD_GET(XE2_PFD_TRVA_FAULT, msg[0]))
diff --git a/drivers/gpu/drm/xe/xe_pagefault.c b/drivers/gpu/drm/xe/xe_pagefault.c
index 2e415995f067b..e81ca24df37fc 100644
--- a/drivers/gpu/drm/xe/xe_pagefault.c
+++ b/drivers/gpu/drm/xe/xe_pagefault.c
@@ -252,12 +252,13 @@ static int xe_pagefault_service(struct xe_pagefault *pf)
 	struct xe_vma *vma = NULL;
 	int err;
 	bool atomic;
+	u32 asid = FIELD_GET(XE_PAGEFAULT_ASID_MASK, pf->consumer.id);
 
 	/* Producer flagged this fault to be nacked */
 	if (pf->consumer.fault_type_level == XE_PAGEFAULT_TYPE_LEVEL_NACK)
 		return -EFAULT;
 
-	vm = xe_pagefault_asid_to_vm(xe, pf->consumer.asid);
+	vm = xe_pagefault_asid_to_vm(xe, asid);
 	if (IS_ERR(vm))
 		return PTR_ERR(vm);
 
@@ -374,7 +375,7 @@ static bool xe_pagefault_match(struct xe_pagefault *pf, u64 start,
 {
 	struct xe_device *xe = gt_to_xe(pf->gt);
 	u64 page_addr = pf->consumer.page_addr;
-	u32 pf_asid = pf->consumer.asid;
+	u32 pf_asid = FIELD_GET(XE_PAGEFAULT_ASID_MASK, pf->consumer.id);
 
 	xe_assert(xe, pf->consumer.alloc_state !=
 		  XE_PAGEFAULT_ALLOC_STATE_FREE);
@@ -499,7 +500,7 @@ static bool xe_pagefault_queue_pop(struct xe_pagefault_queue *pf_queue,
 		align = SZ_4K;
 	pf_work->cache.start = ALIGN_DOWN(lpf->consumer.page_addr, align);
 	pf_work->cache.end = pf_work->cache.start + align;
-	pf_work->cache.asid = lpf->consumer.asid;
+	pf_work->cache.asid = FIELD_GET(XE_PAGEFAULT_ASID_MASK, lpf->consumer.id);
 	pf_work->cache.pf = lpf;
 	lpf->consumer.alloc_state = XE_PAGEFAULT_ALLOC_STATE_ACTIVE;
 
@@ -545,14 +546,16 @@ static void xe_pagefault_print(struct xe_pagefault *pf)
 	u8 engine_class = FIELD_GET(XE_PAGEFAULT_ENGINE_CLASS_MASK,
 				    pf->consumer.engine_class_instance);
 
-	xe_gt_info(pf->gt, "\n\tASID: %d\n"
+	xe_gt_info(pf->gt, "\n\tASID: %lu\n"
 		   "\tFaulted Address: 0x%08x%08x\n"
 		   "\tFaultType: %lu\n"
 		   "\tAccessType: %lu\n"
 		   "\tFaultLevel: %lu\n"
 		   "\tEngineClass: %d %s\n"
-		   "\tEngineInstance: %lu\n",
-		   pf->consumer.asid,
+		   "\tEngineInstance: %lu\n"
+		   "\tSRCID: 0x%02lx\n",
+		   FIELD_GET(XE_PAGEFAULT_ASID_MASK,
+			     pf->consumer.id),
 		   upper_32_bits(pf->consumer.page_addr),
 		   lower_32_bits(pf->consumer.page_addr),
 		   FIELD_GET(XE_PAGEFAULT_TYPE_MASK,
@@ -564,7 +567,9 @@ static void xe_pagefault_print(struct xe_pagefault *pf)
 		   engine_class,
 		   xe_hw_engine_class_to_str(engine_class),
 		   FIELD_GET(XE_PAGEFAULT_ENGINE_INSTANCE_MASK,
-			     pf->consumer.engine_class_instance));
+			     pf->consumer.engine_class_instance),
+		   FIELD_GET(XE_PAGEFAULT_SRCID_MASK,
+			     pf->consumer.id));
 }
 
 static void xe_pagefault_save_to_vm(struct xe_device *xe, struct xe_pagefault *pf)
@@ -577,7 +582,8 @@ static void xe_pagefault_save_to_vm(struct xe_device *xe, struct xe_pagefault *p
 	 * mode, return VM anyways.
 	 */
 	down_read(&xe->usm.lock);
-	vm = xa_load(&xe->usm.asid_to_vm, pf->consumer.asid);
+	vm = xa_load(&xe->usm.asid_to_vm,
+		     FIELD_GET(XE_PAGEFAULT_ASID_MASK, pf->consumer.id));
 	if (vm)
 		xe_vm_get(vm);
 	else
@@ -611,7 +617,7 @@ static void xe_pagefault_queue_work(struct work_struct *w)
 		const struct xe_pagefault_ops *ops = pf->producer.ops;
 		void *private = pf->producer.private;
 		struct xe_gt *gt = pf->gt;
-		u32 asid = pf->consumer.asid;
+		u32 asid = FIELD_GET(XE_PAGEFAULT_ASID_MASK, pf->consumer.id);
 		int err = 0;
 		bool invalidated = false;
 
diff --git a/drivers/gpu/drm/xe/xe_pagefault_types.h b/drivers/gpu/drm/xe/xe_pagefault_types.h
index efeba5c3a58ba..f16bab29bfc30 100644
--- a/drivers/gpu/drm/xe/xe_pagefault_types.h
+++ b/drivers/gpu/drm/xe/xe_pagefault_types.h
@@ -112,8 +112,13 @@ struct xe_pagefault {
 				u8 engine_class_instance;
 #define XE_PAGEFAULT_ENGINE_CLASS_MASK		GENMASK(3, 0)
 #define XE_PAGEFAULT_ENGINE_INSTANCE_MASK	GENMASK(7, 4)
-				/** @consumer.asid: address space ID */
-				u32 asid;
+				/**
+				 * @consumer.id: address space ID and SRCID, folded into one
+				 * to keep size compact
+				 */
+				u32 id;
+#define XE_PAGEFAULT_ASID_MASK	GENMASK(23, 0)
+#define XE_PAGEFAULT_SRCID_MASK	GENMASK(31, 24)
 			};
 			/**
 			 * @consumer.end_addr: end address of page fault,
-- 
2.53.0

