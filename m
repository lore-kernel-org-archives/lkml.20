Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C5D7547070
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 05:01:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789707708; cv=none; b=pqHUtLJEYLfHA/GYDpRVVKcpsOepkVY+Q+0MUj4VKag08A0m7NgX1q4eSPNZ6GhcYSR1Vsz7830qoS8uTtUYjEH6Mf4HxJ50UfqBmp9AfqrZx525f+hsstKcIipyZ1WGbZwAIqOmyQP6PpDra/AB6F1xB1bYi6jeiAu524yGYVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789707708; c=relaxed/simple;
	bh=iyhvSZKEJbUo1GxfN6urlameJ0XPTHn5O/gYeTE8UH8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=IAi5I4yuEmjdEhFLXh+XhbSelhiaqgorPzS8q/lWIyViVYptiCRXtEvcQkAmbDd97u50aQzN3wLrw0wygO/jTPcqoDA2101fR0CfYlZpNSZr59hb9mSFEEbjgjHYqsxjt6+h9ExNmIpWeosRzTs6wFSzf8ToVY//3qWMKSu8FnY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SySM41DU; arc=none smtp.client-ip=192.198.163.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SySM41DU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789707708; x=1821243708;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=iyhvSZKEJbUo1GxfN6urlameJ0XPTHn5O/gYeTE8UH8=;
  b=SySM41DUqyduOABi7pSwr43gPqpOB8oIHbhP7gfGuiLeheLbyMBv2laz
   4qy3LwFZ8StOXlgzl9BooBa3vXWEt8St9CTgxBofKQkDPOvf7mPBtNf/7
   emTmV8PSBS0yFdmW3szEaRo291r2WuubVMan1C+94Ri03FTJbWM04OCuk
   /At5I7s3X9Yj/VCLz2ooD9Pjo/p0+v2hetEtgj4k3qlyGnmttIFvcjQxm
   qxG+P4nwAoGzPU5PfLwABDzPAbCbbXKLWl6EoItgjbK5TOP2h7yYtggHP
   M0fjW2uVv2OrnW8qEHGX+3pQKuadiusnhKmBM3B7HiO/+4wejXk5FD0Y7
   A==;
X-CSE-ConnectionGUID: 9pFfc9JXSB+m4Go5AppYbA==
X-CSE-MsgGUID: hPAkl8ylTmScSzoZwZ5E0w==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="704940"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="704940"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa116.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2026 22:01:47 -0700
X-CSE-ConnectionGUID: dWcyI+e5SvKEicdBn6QSGw==
X-CSE-MsgGUID: T9xlsuNGSGSFPBYFVD72Ag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="271542646"
Received: from chenyu-dev.sh.intel.com ([10.239.62.107])
  by fmviesa008.fm.intel.com with ESMTP; 17 Sep 2026 22:01:43 -0700
From: Chen Yu <yu.c.chen@intel.com>
To: tony.luck@intel.com,
	reinette.chatre@intel.com
Cc: tglx@kernel.org,
	bp@alien8.de,
	mingo@redhat.com,
	dave.hansen@linux.intel.com,
	hpa@zytor.com,
	fenghuay@nvidia.com,
	babu.moger@amd.com,
	hongyu.ning@intel.com,
	chen.yu@linux.dev,
	x86@kernel.org,
	linux-kernel@vger.kernel.org,
	Chen Yu <yu.c.chen@intel.com>,
	Hongyu Ning <hongyu.ning@linux.intel.com>
Subject: [PATCH v8 9/9] x86/resctrl: Add MMIO-based LLC occupancy monitoring support
Date: Fri, 18 Sep 2026 12:51:17 +0800
Message-Id: <bfe91aeeb714f14e2d1a9c3066ceab0e62c3c231.1789705667.git.yu.c.chen@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1789705667.git.yu.c.chen@intel.com>
References: <cover.1789705667.git.yu.c.chen@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add erdt_mon_read() to read LLC occupancy via MMIO and use it when the platform
supports ERDT. Register the L3 occupancy event with ERDT enabled when available,
falling back to the MSR-based path otherwise.

Use the CMRC (Cache Monitoring Registers for CPU Agents Description) ACPI
sub-table to read LLC occupancy counters for each RMID via MMIO when ERDT is
enabled. Store the CMRC information in the rdt_hw_l3_mon_domain, which could be
accessed directly.

Although the occupancy counters can now be read from any CPU via MMIO, the
per-domain limbo handler is kept. A global handler would still have to iterate
over every domain and would only save one worker thread, which does not justify
maintaining two limbo handler models.

Suggested-by: Reinette Chatre <reinette.chatre@intel.com>
Signed-off-by: Chen Yu <yu.c.chen@intel.com>
Tested-by: Hongyu Ning <hongyu.ning@linux.intel.com>
---
 arch/x86/include/asm/resctrl.h         |  8 ++-
 arch/x86/kernel/cpu/resctrl/core.c     |  5 +-
 arch/x86/kernel/cpu/resctrl/erdt.c     | 74 +++++++++++++++++++++++++-
 arch/x86/kernel/cpu/resctrl/internal.h |  9 +++-
 arch/x86/kernel/cpu/resctrl/monitor.c  | 14 +++--
 5 files changed, 102 insertions(+), 8 deletions(-)

diff --git a/arch/x86/include/asm/resctrl.h b/arch/x86/include/asm/resctrl.h
index bcfcc8ac1fe6..31c2f81cd06e 100644
--- a/arch/x86/include/asm/resctrl.h
+++ b/arch/x86/include/asm/resctrl.h
@@ -135,7 +135,13 @@ static inline void __resctrl_sched_in(struct task_struct *tsk)
 
 static inline unsigned int resctrl_arch_round_mon_val(unsigned int val)
 {
-	unsigned int scale = boot_cpu_data.x86_cache_occ_scale;
+	unsigned int scale = boot_cpu_data.x86_cache_occ_scale, escale;
+
+	if (erdt_cpu_has(X86_FEATURE_CQM_OCCUP_LLC)) {
+		escale = erdt_get_scale();
+		if (escale)
+			scale = escale;
+	}
 
 	/* h/w works in units of "boot_cpu_data.x86_cache_occ_scale" */
 	val /= scale;
diff --git a/arch/x86/kernel/cpu/resctrl/core.c b/arch/x86/kernel/cpu/resctrl/core.c
index ca7e67f976d5..135f2eb2a5a5 100644
--- a/arch/x86/kernel/cpu/resctrl/core.c
+++ b/arch/x86/kernel/cpu/resctrl/core.c
@@ -1007,7 +1007,10 @@ static __init bool get_rdt_mon_resources(void)
 	struct rdt_resource *r = &rdt_resources_all[RDT_RESOURCE_L3].r_resctrl;
 	bool ret = false;
 
-	if (rdt_cpu_has(X86_FEATURE_CQM_OCCUP_LLC)) {
+	if (erdt_cpu_has(X86_FEATURE_CQM_OCCUP_LLC)) {
+		resctrl_enable_mon_event(QOS_L3_OCCUP_EVENT_ID, true, 0, NULL);
+		ret = true;
+	} else if (rdt_cpu_has(X86_FEATURE_CQM_OCCUP_LLC)) {
 		resctrl_enable_mon_event(QOS_L3_OCCUP_EVENT_ID, false, 0, NULL);
 		ret = true;
 	}
diff --git a/arch/x86/kernel/cpu/resctrl/erdt.c b/arch/x86/kernel/cpu/resctrl/erdt.c
index 400973ebf2b8..f350a516d3d9 100644
--- a/arch/x86/kernel/cpu/resctrl/erdt.c
+++ b/arch/x86/kernel/cpu/resctrl/erdt.c
@@ -26,6 +26,10 @@ static bool erdt_enabled;
 #define CMRC_SUPPORTED_INDEX_FN		1
 #define RMDD_FLAG_CPU_L3_DOMAIN		BIT(0)
 
+/* Set in a monitoring counter when it holds no valid data to report. */
+#define UNAVAILABLE_COUNTER		BIT_ULL(63)
+#define CMRC_FLAG_UNAVAILABLE_BIT	BIT(0)
+
 /* Bitmask of valid sub-tables found in the first RMDD, used to ensure all RMDDs match. */
 static u32 valid_subtbl_mask;
 
@@ -50,7 +54,12 @@ static unsigned int erdt_scale;
 
 bool erdt_support(int flag)
 {
-	return false;
+	switch (flag) {
+	case X86_FEATURE_CQM_OCCUP_LLC:
+		return valid_subtbl_mask & BIT(ACPI_ERDT_TYPE_CMRC);
+	default:
+		return false;
+	}
 }
 
 unsigned int erdt_get_max_rmid(void)
@@ -60,7 +69,68 @@ unsigned int erdt_get_max_rmid(void)
 
 unsigned int erdt_get_scale(void)
 {
-	return erdt_scale;
+	/* Divided by snc_nodes_per_l3_cache, see erdt_read_l3_occupancy(). */
+	return erdt_scale / snc_nodes_per_l3_cache;
+}
+
+static u32 cmrc_index_function_1(struct acpi_erdt_cmrc *cmrc, u32 rmid)
+{
+	/*
+	 * MMIO_offset_for_RMID# =
+	 *   (RMID / ClumpSize) * Stride +
+	 *   (RMID % ClumpSize) * 8
+	 */
+	return (rmid / cmrc->clump_size) * cmrc->clump_stride +
+	       (rmid % cmrc->clump_size) * 8;
+}
+
+static int erdt_read_l3_occupancy(const struct erdt_domain_info *d, u32 rmid, u64 *val)
+{
+	struct acpi_erdt_cmrc *cmrc;
+	u64 l3_cmt_count;
+	u32 offset;
+
+	cmrc = d->cmrc;
+	if (!cmrc)
+		return -EIO;
+
+	offset = cmrc_index_function_1(cmrc, rmid);
+	/* Overflow of cmt_reg_size * SZ_4K already validated in erdt_ioremap(). */
+	if (offset + sizeof(u64) > (u32)cmrc->cmt_reg_size * SZ_4K)
+		return -EINVAL;
+
+	l3_cmt_count = readq(d->base[ERDT_MMIO_CMRC_BASE] + offset);
+	if ((cmrc->flags & CMRC_FLAG_UNAVAILABLE_BIT) &&
+	    (l3_cmt_count & UNAVAILABLE_COUNTER))
+		return -EINVAL;
+
+	/*
+	 * In legacy mode, scale is divided by snc_nodes_per_l3_cache to
+	 * prevent over-calculation of aggregated monitor data, do it
+	 * the same for MMIO based access.
+	 * This scaling factor might need to be revisited/tuned for future
+	 * platforms that support both SNC and MMIO-based monitoring
+	 * simultaneously.
+	 */
+	*val = l3_cmt_count * cmrc->up_scale / snc_nodes_per_l3_cache;
+
+	return 0;
+}
+
+int erdt_mon_read(struct rdt_domain_hdr *hdr, enum resctrl_event_id evtid, u32 rmid, u64 *val)
+{
+	struct rdt_hw_l3_mon_domain *hw_dom;
+	const struct erdt_domain_info *d;
+
+	hw_dom = resctrl_to_arch_mon_dom(container_of(hdr, struct rdt_l3_mon_domain, hdr));
+	d = hw_dom->d_info;
+	if (!d)
+		return -EIO;
+
+	if (evtid == QOS_L3_OCCUP_EVENT_ID)
+		return erdt_read_l3_occupancy(d, rmid, val);
+
+	return -EIO;
 }
 
 static void __iomem *erdt_ioremap(resource_size_t base, u32 num_pages, const char *desc)
diff --git a/arch/x86/kernel/cpu/resctrl/internal.h b/arch/x86/kernel/cpu/resctrl/internal.h
index ce037e017fc3..e2d0d6c76b20 100644
--- a/arch/x86/kernel/cpu/resctrl/internal.h
+++ b/arch/x86/kernel/cpu/resctrl/internal.h
@@ -156,7 +156,11 @@ struct msr_param {
  *			which has been corrected for features like CDP.
  * @msr_base:		Base MSR address for CBMs
  * @msr_update:		Function pointer to update QOS MSRs
- * @mon_scale:		cqm counter * mon_scale = occupancy in bytes
+ * @mon_scale:		Scale factor applied to a raw counter value on the
+ *			MSR-based read path: CMT occupancy counter * mon_scale =
+ *			occupancy in bytes, and MBM chunk count * mon_scale = bytes
+ *			transferred. ERDT reads occupancy via MMIO and applies its
+ *			own firmware-provided scale instead.
  * @mbm_width:		Monitor width, to detect and correct for overflow.
  * @cdp_enabled:	CDP state of this resource
  * @mbm_cntr_assign_enabled:	ABMC feature is enabled
@@ -185,6 +189,8 @@ static inline struct rdt_hw_resource *resctrl_to_arch_res(struct rdt_resource *r
 
 extern struct rdt_hw_resource rdt_resources_all[];
 
+extern int snc_nodes_per_l3_cache;
+
 void arch_mon_domain_online(struct rdt_resource *r, struct rdt_l3_mon_domain *d);
 
 /* CPUID.(EAX=10H, ECX=ResID=1).EAX */
@@ -289,6 +295,7 @@ static inline bool intel_handle_aet_option(bool force_off, char *tok) { return f
 
 bool erdt_support(int flag);
 unsigned int erdt_get_max_rmid(void);
+int erdt_mon_read(struct rdt_domain_hdr *hdr, enum resctrl_event_id evtid, u32 rmid, u64 *val);
 int erdt_init(void);
 void erdt_exit(void);
 
diff --git a/arch/x86/kernel/cpu/resctrl/monitor.c b/arch/x86/kernel/cpu/resctrl/monitor.c
index 138fd420131b..1fc02020dbc9 100644
--- a/arch/x86/kernel/cpu/resctrl/monitor.c
+++ b/arch/x86/kernel/cpu/resctrl/monitor.c
@@ -34,7 +34,7 @@ bool rdt_mon_capable;
 
 #define CF(cf)	((unsigned long)(1048576 * (cf) + 0.5))
 
-static int snc_nodes_per_l3_cache = 1;
+int snc_nodes_per_l3_cache = 1;
 
 /*
  * The correction factor table is documented in Documentation/filesystems/resctrl.rst.
@@ -283,6 +283,10 @@ int resctrl_arch_rmid_read(struct rdt_resource *r, struct rdt_domain_hdr *hdr,
 
 	switch (r->rid) {
 	case RDT_RESOURCE_L3:
+		if (eventid == QOS_L3_OCCUP_EVENT_ID &&
+		    erdt_cpu_has(X86_FEATURE_CQM_OCCUP_LLC))
+			return erdt_mon_read(hdr, eventid, rmid, val);
+
 		return arch_l3_read_event(r, hdr, rmid, eventid, val);
 	case RDT_RESOURCE_PERF_PKG:
 		return intel_aet_read_event(hdr->id, rmid, arch_priv, val);
@@ -432,12 +436,16 @@ int __init rdt_get_l3_mon_config(struct rdt_resource *r)
 	struct rdt_hw_resource *hw_res = resctrl_to_arch_res(r);
 	unsigned int threshold;
 	u32 eax, ebx, ecx, edx;
+	int max_rmid;
 
 	snc_nodes_per_l3_cache = snc_get_config();
 
+	max_rmid = erdt_cpu_has(X86_FEATURE_CQM_OCCUP_LLC) ?
+			min_t(int, erdt_get_max_rmid(), boot_cpu_data.x86_cache_max_rmid) :
+			boot_cpu_data.x86_cache_max_rmid;
 	resctrl_rmid_realloc_limit = boot_cpu_data.x86_cache_size * 1024;
 	hw_res->mon_scale = boot_cpu_data.x86_cache_occ_scale / snc_nodes_per_l3_cache;
-	r->mon.num_rmid = (boot_cpu_data.x86_cache_max_rmid + 1) / snc_nodes_per_l3_cache;
+	r->mon.num_rmid = (max_rmid + 1) / snc_nodes_per_l3_cache;
 	hw_res->mbm_width = MBM_CNTR_WIDTH_BASE;
 
 	if (mbm_offset > 0 && mbm_offset <= MBM_CNTR_WIDTH_OFFSET_MAX)
@@ -456,7 +464,7 @@ int __init rdt_get_l3_mon_config(struct rdt_resource *r)
 
 	/*
 	 * Because num_rmid may not be a power of two, round the value
-	 * to the nearest multiple of hw_res->mon_scale so it matches a
+	 * to the nearest multiple of hw_res->mon_scale or mmio scale so it matches a
 	 * value the hardware will measure. mon_scale may not be a power of 2.
 	 */
 	resctrl_rmid_realloc_threshold = resctrl_arch_round_mon_val(threshold);
-- 
2.25.1

