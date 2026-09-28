Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E398502D55
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 22:15:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790633727; cv=none; b=Vx286XdrmJXjluWtn2BkxWE/bymK6ToAlU8ibdk05p7To1ZZQLuftVLQWETbBvUTk9LP5cAs47lxORK0zxrzX5ylfqZI9ABo+x63BLbtc0BET/OP+gc1chRD+e90QN00UuTDhey1EMMDPoynwCnyQnSUn6j2bI2yGt0AVNaS7pA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790633727; c=relaxed/simple;
	bh=nhwEC2QH7/NHB66wQKhVR0mTkp6KvQcYd8p/53bETLs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ej2jzn/2eNMYW5BM+h17zsnQkWKv7Vp3F/O2MNbqPXGrYPWhZvmyyDcj85R8Ayojnsc2UmG9HtCCqplLyB5orbTdgHpcjCeWyy32q2/73zJlsk2GAI17/99V9ZRxQnA18PVRuOAWXCOFHf1VJpJJtcf29G6JHzuXCqY2XXDWe3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ONsahlDt; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ONsahlDt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790633724; x=1822169724;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=nhwEC2QH7/NHB66wQKhVR0mTkp6KvQcYd8p/53bETLs=;
  b=ONsahlDthwcfTdnLBL5/UlfQDR/S5NtryLQLdjPH3IKm2fSNHTfu+oai
   hU3utNjnygOEqwVuWcWOXWof7C3oN1/yYogEqdg9qsx+RLms245gzuIop
   ACatPvY1Uty1lC5NicQ+YxCSqJmNvns/Jk4822iLwZbD8YZ8ZVGfCUcvh
   DXUvWvUFYnBxvwUIP8HB8NsRkOuqlU0y8VGoP/+QPt1fB1oLUfyxzJoMG
   yob8Ux1GB3Q2JVqNz6YUikgBQX7jTmILI8gUblPICrd7K3P2w+wc2i1Ri
   WOiT0uHZT3DM1SMKowgNdqtCviudND5XaHYhuWJlyv1xPhd0YlmCKx68m
   A==;
X-CSE-ConnectionGUID: nkVSnJHdQqqMSx+IftEjOQ==
X-CSE-MsgGUID: rbjV9Q2FSRu3N1WJ7UnJ+g==
X-IronPort-AV: E=McAfee;i="6800,10657,11919"; a="90387188"
X-IronPort-AV: E=Sophos;i="6.27,129,1787036400"; 
   d="scan'208";a="90387188"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2026 15:15:18 -0700
X-CSE-ConnectionGUID: 027vTMxBRLql91KH7Q9Oog==
X-CSE-MsgGUID: yJfIPWnSQC6p4IclwG0sag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,129,1787036400"; 
   d="scan'208";a="274685472"
Received: from lstrano-mobl6.amr.corp.intel.com (HELO agluck-desk3.intel.com) ([10.124.222.143])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2026 15:15:17 -0700
From: Tony Luck <tony.luck@intel.com>
To: Fenghua Yu <fenghuay@nvidia.com>,
	Reinette Chatre <reinette.chatre@intel.com>,
	Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>,
	Peter Newman <peternewman@google.com>,
	James Morse <james.morse@arm.com>,
	Babu Moger <babu.moger@amd.com>,
	Drew Fustini <dfustini@baylibre.com>,
	Dave Martin <Dave.Martin@arm.com>,
	Chen Yu <yu.c.chen@intel.com>,
	David E Box <david.e.box@intel.com>,
	x86@kernel.org
Cc: Christoph Hellwig <hch@infradead.org>,
	linux-kernel@vger.kernel.org,
	patches@lists.linux.dev,
	Tony Luck <tony.luck@intel.com>
Subject: [PATCH v13 04/25] x86/resctrl: Centralize monitoring feature enumeration
Date: Mon, 28 Sep 2026 15:14:48 -0700
Message-ID: <20260928221509.68002-5-tony.luck@intel.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260928221509.68002-1-tony.luck@intel.com>
References: <20260928221509.68002-1-tony.luck@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The original implementation of Intel Cache QoS Monitoring (CQM) planned
to integrate with the "perf" and "cgroup" subsystems. With that plan it
made sense for parameters from CPUID to be stored in fields of the
cpuinfo_x86 structure. But that plan was abandoned and the resctrl file
system user interface replaced it.

Centralize all L3 monitoring enumeration within resctrl in preparation for
removal of resctrl fields from struct cpuinfo_x86.

Signed-off-by: Tony Luck <tony.luck@intel.com>
---
v13:
	Update commit subject and comment as suggested.
---
 arch/x86/include/asm/resctrl.h        |  9 ++++----
 arch/x86/kernel/cpu/resctrl/monitor.c | 32 ++++++++++++++++++++++++---
 2 files changed, 33 insertions(+), 8 deletions(-)

diff --git a/arch/x86/include/asm/resctrl.h b/arch/x86/include/asm/resctrl.h
index 8f6edcdcfd87..c9f9db96f792 100644
--- a/arch/x86/include/asm/resctrl.h
+++ b/arch/x86/include/asm/resctrl.h
@@ -44,6 +44,7 @@ DECLARE_PER_CPU(struct resctrl_pqr_state, pqr_state);
 
 extern bool rdt_alloc_capable;
 extern bool rdt_mon_capable;
+extern unsigned int rdt_l3_mon_scale;
 
 DECLARE_STATIC_KEY_FALSE(rdt_enable_key);
 DECLARE_STATIC_KEY_FALSE(rdt_alloc_enable_key);
@@ -132,11 +133,9 @@ static inline void __resctrl_sched_in(struct task_struct *tsk)
 
 static inline unsigned int resctrl_arch_round_mon_val(unsigned int val)
 {
-	unsigned int scale = boot_cpu_data.x86_cache_occ_scale;
-
-	/* h/w works in units of "boot_cpu_data.x86_cache_occ_scale" */
-	val /= scale;
-	return val * scale;
+	/* Round down to nearest h/w monitoring unit */
+	val /= rdt_l3_mon_scale;
+	return val * rdt_l3_mon_scale;
 }
 
 static inline void resctrl_arch_set_cpu_default_closid_rmid(int cpu, u32 closid,
diff --git a/arch/x86/kernel/cpu/resctrl/monitor.c b/arch/x86/kernel/cpu/resctrl/monitor.c
index 3838e0a13d36..89b83cc7e800 100644
--- a/arch/x86/kernel/cpu/resctrl/monitor.c
+++ b/arch/x86/kernel/cpu/resctrl/monitor.c
@@ -32,6 +32,11 @@
  */
 bool rdt_mon_capable;
 
+/*
+ * Scale factor to convert L3 monitor events to bytes.
+ */
+unsigned int __ro_after_init rdt_l3_mon_scale;
+
 #define CF(cf)	((unsigned long)(1048576 * (cf) + 0.5))
 
 static int snc_nodes_per_l3_cache = 1;
@@ -418,16 +423,37 @@ static __init int snc_get_config(void)
 
 int __init rdt_get_l3_mon_config(struct rdt_resource *r)
 {
-	unsigned int mbm_offset = boot_cpu_data.x86_cache_mbm_width_offset;
 	struct rdt_hw_resource *hw_res = resctrl_to_arch_res(r);
+	unsigned int mbm_offset;
 	unsigned int threshold;
 	u32 eax, ebx, ecx, edx;
+	u32 num_rmid;
+
+	/* Resource monitoring leaf is 0xf. L3 monitoring details in subleaf 1 */
+	cpuid_count(0xf, 1, &eax, &ebx, &ecx, &edx);
+	mbm_offset = eax & GENMASK(7, 0);
+	rdt_l3_mon_scale = ebx;
+	num_rmid = ecx + 1;
+
+	if (!mbm_offset) {
+		switch (boot_cpu_data.x86_vendor) {
+		case X86_VENDOR_AMD:
+			mbm_offset = MBM_CNTR_WIDTH_OFFSET_AMD;
+			break;
+		case X86_VENDOR_HYGON:
+			mbm_offset = MBM_CNTR_WIDTH_OFFSET_HYGON;
+			break;
+		default:
+			/* Leave mbm_offset as 0 */
+			break;
+		}
+	}
 
 	snc_nodes_per_l3_cache = snc_get_config();
 
 	resctrl_rmid_realloc_limit = boot_cpu_data.x86_cache_size * 1024;
-	hw_res->mon_scale = boot_cpu_data.x86_cache_occ_scale / snc_nodes_per_l3_cache;
-	r->mon.num_rmid = (boot_cpu_data.x86_cache_max_rmid + 1) / snc_nodes_per_l3_cache;
+	hw_res->mon_scale = rdt_l3_mon_scale / snc_nodes_per_l3_cache;
+	r->mon.num_rmid = num_rmid / snc_nodes_per_l3_cache;
 	hw_res->mbm_width = MBM_CNTR_WIDTH_BASE;
 
 	if (mbm_offset > 0 && mbm_offset <= MBM_CNTR_WIDTH_OFFSET_MAX)
-- 
2.55.0

