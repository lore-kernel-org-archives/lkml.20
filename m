Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEFAD3FB7F1
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 21:26:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788384368; cv=none; b=E9xDcHZ6RRZJCre+2i33Dr18XlAJqS7IViznAo36Sqh/oPGly3k3G/5WbzF0V4E48xdS3khy5XHAEx79MOiMYABQOY6K2HqiDBaYS6+gThO82+A9Mhe6a3EkThESfMmBoDz0S4zwQs9+T0fzENDBLck1rPptAOWR+kXD0pmG2sU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788384368; c=relaxed/simple;
	bh=Wqny6CjZTsdaVrnuEzf0jnl+Z0+B17vt/EwoBnJqTR4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=R7JsCflWbb1w3RAi6wAy9ts5SDMRnv5Az1pnYeejhNTqbmyx7uoSQlRk6/32+mzLUx6FLN/Ba/XNU9LCExYaC50Xf8NkEhWLoORfHzEsey95jAZqsIxZXWyMyKFjgt7uIcRVD7duQdX4on/0bfiSDyVRQgusdMkWRtrqhtsE6oI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WJ1UqGs2; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WJ1UqGs2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788384364; x=1819920364;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Wqny6CjZTsdaVrnuEzf0jnl+Z0+B17vt/EwoBnJqTR4=;
  b=WJ1UqGs2MpLOv8dqllqmLs+Zr+/tA35FxkH8+adaKk3xF0j1EMDGoeHr
   qof5peO5fGR5oUzgYx8hZk9VV9wumg5z+M5kfESIhXNmNoEB7oNWCLYRI
   mHmiT/ew3zVq1Vs1sW3J+c6/4ROWt2K6tV7hByV7/nb2UsBA2KYeVtwBP
   WFKQzQmogBeFyO0KI9PSoidx6n/pmPdb3Lw5qnoSbLllDXXxNUL0n3/7m
   //vw5vLi+X6bv9r9OC6xqgOdJlVLlwqqBVsO6O2Qsg82aRwQsXnd2Zm0z
   FZUpxwFaULPdy+pvo5LmTALR70OaBiTTlhuzvqt6ZYH6LeK+9J15f4lm8
   A==;
X-CSE-ConnectionGUID: Ai65uPjERgesEDEuiEAg2Q==
X-CSE-MsgGUID: qrTlexylSp2CejRovm+7WA==
X-IronPort-AV: E=McAfee;i="6800,10657,11894"; a="111629928"
X-IronPort-AV: E=Sophos;i="6.25,258,1779174000"; 
   d="scan'208";a="111629928"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2026 14:26:00 -0700
X-CSE-ConnectionGUID: pT5PbvltSPm8qjAQ/E4Cgw==
X-CSE-MsgGUID: rG1Yuz+GS2+b1CGzDouLaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,258,1779174000"; 
   d="scan'208";a="273682846"
Received: from osgc-sh-dragon.sh.intel.com ([10.239.81.44])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2026 14:25:57 -0700
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
Subject: [PATCH v6 2/2] drm/xe/vm: Add srcid to xe_vm_get_property_ioctl fault report
Date: Thu,  3 Sep 2026 05:25:49 +0800
Message-ID: <20260902212549.347805-3-jonathan.cavitt@intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260902212549.347805-1-jonathan.cavitt@intel.com>
References: <20260902212549.347805-1-jonathan.cavitt@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add the SRCID of the faulting hardware unit to the return of the
xe_vm_get_property_ioctl fault report.

v2:
- Readd pad check, as the pad in the ioctl struct was not changed
  (jcavitt)

v3:
- Squash SRCID with ASID to keep the struct compact (Matthew)

Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: David Airlie <airlied@gmail.com>
Cc: Simona Vetter <simona@ffwll.ch>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/xe/xe_vm.c       | 8 ++++++++
 drivers/gpu/drm/xe/xe_vm_types.h | 2 ++
 include/uapi/drm/xe_drm.h        | 4 ++--
 3 files changed, 12 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 19b3d0be79282..753a5fc55baa0 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -655,6 +655,7 @@ void xe_vm_add_fault_entry_pf(struct xe_vm *vm, struct xe_pagefault *pf)
 				  pf->consumer.fault_type_level);
 	e->fault_level = FIELD_GET(XE_PAGEFAULT_LEVEL_MASK,
 				   pf->consumer.fault_type_level);
+	e->srcid = FIELD_GET(XE_PAGEFAULT_SRCID_MASK, pf->consumer.id);
 
 	list_add_tail(&e->list, &vm->faults.list);
 	vm->faults.len++;
@@ -4277,6 +4278,11 @@ static u8 xe_to_user_fault_level(u8 fault_level)
 	return fault_level;
 }
 
+static u8 xe_to_user_srcid(u8 srcid)
+{
+	return srcid;
+}
+
 static int fill_faults(struct xe_vm *vm,
 		       struct drm_xe_vm_get_property *args)
 {
@@ -4304,6 +4310,8 @@ static int fill_faults(struct xe_vm *vm,
 		fault_entry.fault_type = xe_to_user_fault_type(entry->fault_type);
 		fault_entry.fault_level = xe_to_user_fault_level(entry->fault_level);
 
+		fault_entry.srcid = xe_to_user_srcid(entry->srcid);
+
 		memcpy(&fault_list[i], &fault_entry, entry_size);
 
 		i++;
diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
index 68588b6242121..648031e641451 100644
--- a/drivers/gpu/drm/xe/xe_vm_types.h
+++ b/drivers/gpu/drm/xe/xe_vm_types.h
@@ -202,6 +202,7 @@ struct xe_device;
  * @access_type: type of address access that resulted in fault
  * @fault_type: type of fault reported
  * @fault_level: fault level of the fault
+ * @srcid: ID of the faulting hardware unit
  */
 struct xe_vm_fault_entry {
 	struct list_head list;
@@ -210,6 +211,7 @@ struct xe_vm_fault_entry {
 	u8 access_type;
 	u8 fault_type;
 	u8 fault_level;
+	u8 srcid;
 };
 
 struct xe_vm {
diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index 509202a7b13eb..8c852abcacf0d 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -1294,8 +1294,8 @@ struct xe_vm_fault {
 #define FAULT_LEVEL_PML4	3
 #define FAULT_LEVEL_PML5	4
 	__u8 fault_level;
-	/** @pad: MBZ */
-	__u8 pad;
+	/** @srcid: ID of the faulting hardware unit */
+	__u8 srcid;
 	/** @reserved: MBZ */
 	__u64 reserved[4];
 };
-- 
2.53.0

