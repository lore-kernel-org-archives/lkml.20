Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792443053;
	b=pyRYHH12h9e+7esTQyAZYLyKh+ZGE8JAafWIkCYt7kGPSWgZZSrb5iqGtnVsg1F8u+S9
	 /neuXlkAAo8oTpurBFvKnxF60JFV0EHS4/bfFb5pFd3majAzAWbXJa0Qko3GtDVR4DzE0
	 Rq3VOdHorb/DXElN7kl4HJLQnbhp1HUOiuGQVs3DBDcSAE5kkn1tTiOYOIx8hkww/wk1/
	 0RpSO9FOenrizgFRdW24DJZOQPTLBbyFdpDsXGvXSELUNWXPTvFZVWbyqR3XXB7ttT60g
	 F030lLKwiiwDnl6lW8DyoMZ/55IGUDDhpa8v076ZasGI6DG2jTS6PsPFus2586SnIPA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792443053;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=hxdTMbA8LElIuPJVsQvOST89gibjO3Mqlv7/+bxExC4=;
	b=FBls5cOYiPLnMA7UGcKzcj8hZtlrtZdXrsokkCL9HnfsB/aH6cHh+p0rGTFoHt/lVJNF
	 GpAfcV3ZiPw/vulJPtBs5UdhFm+UfsYdu6CqGH0ygmfPsqNhX0mJCIeA/TdR5HiyJzE0+
	 BTBxuqlp6DjDrVDAbjQiEMaIsUpD/Z/Qrt4e9q59PtSzZ2FsSBiky4Ju5ztqBQJolrSL/
	 4OC4P5qNODKzAAzkiLgu4bfBmzAcmJAwzGtojeqFN9cmQjXe6yq06HO/5/DOneQBg8+5x
	 Z4ezatgQXBP2cy5XOOBj6amOLyQwJen7Jlxo5Y6w6n8jrs9tW1c51VhGOvioWrJ8Geg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=XqR7l+Vc;
	arc=none smtp.remote-ip=198.175.65.16
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0E69606A325
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 20:50:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F0E69606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=XqR7l+Vc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792443051; x=1823979051;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=CG7Lll4s+ThtivUH6SVnYWTUIN/0rn8cWo9ieKUsPK4=;
  b=XqR7l+Vc6xvyDjo1z1LrLOivHqdW4vQwcIAre/28dR7RAyfrmNbOAsmC
   B7X9nyxuAMpcOB9FsytggMPVBpV9mde3q2lt18zWTfx8ln5uMwLTJ0Ore
   FYLH4ytXevfPKbpGchgq4NiroJCFOi+ttRty2Aq/HmreSlKyFo0lkxKm3
   x90r+FQxbp9DO/qEHIf3WF4DpCk+Rvj1TLqe3oc4uNIsT9SSwEpcntbhl
   n27BjYTqzpvSvtdTfhGWfdSpRNCs86Fnlx3Ta4rfGc7SNUYL4uBzPl+id
   5ZIIpDEBRD8odcuoVEIdQyYxyC61JZyz52SQYv8rB9iB9p6rTi6dGWZla
   Q==;
X-CSE-ConnectionGUID: aqqsaRH0SQacK4W1zZqnIg==
X-CSE-MsgGUID: neI4vygmSp63+veXecQsyg==
X-IronPort-AV: E=McAfee;i="6800,10657,11940"; a="1131132"
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="1131132"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2026 13:50:48 -0700
X-CSE-ConnectionGUID: 2MsWXzZ1RtG/QDjxgdfpFQ==
X-CSE-MsgGUID: nw1Lt+vyT/SssC6+yl2TZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="3008624"
Received: from spandruv-mobl5.amr.corp.intel.com (HELO agluck-desk3.intel.com) ([10.124.220.87])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2026 13:50:49 -0700
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
Subject: [PATCH v14 03/24] x86/resctrl: Centralize monitoring feature enumeration
Date: Mon, 19 Oct 2026 13:50:10 -0700
Message-ID: <20261019205031.16977-4-tony.luck@intel.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261019205031.16977-1-tony.luck@intel.com>
References: <20261019205031.16977-1-tony.luck@intel.com>
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

The original "perf" implementation of Intel Cache QoS Monitoring (CQM)
put parameters from CPUID into fields of the cpuinfo_x86 structure. The
perf implementation was reverted and replaced by resctrl. The enumerated
parameters remained in the boot_cpu_data structure.

resctrl is the only consumer of these values, yet it depends on generic
x86 CPU setup to enumerate them.

Centralize all L3 monitoring enumeration within resctrl in preparation for
removal of resctrl fields from struct cpuinfo_x86. The Intel MBM correction
factor quirk remains the only reader of the cached values.

Signed-off-by: Tony Luck <tony.luck@intel.com>
---
v14:
	Structure commit in context, problem, solution.
	Add note that there is still one user of boot_cpu_data.
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
2.56.0

