Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7050C349B15
	for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 06:13:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787984006; cv=none; b=BFQoSfZLRP2dqYN13Mcz96ERdyzMzpS2+ja48QEiaYvZBwNr4pqoyjKYIk9VQOqqKr73HFdppngrXsXatHytjxYaousqiRdODm0Ht98XjhGv6JINpXWu0M4imqWeMEAUrxj+My4jERHTDOwe/HhkfudejcEh9flVnEgjhhobmS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787984006; c=relaxed/simple;
	bh=2zHjTeCRmJspqNOvxj26gOQdJvukwSNivA+3bp7NuIg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=W1cMFPtg/2E682v37f8/HUDEdo8hq74pIEMhDxsmjSUORym+Dc1vVRrK/Qw0YYy+p149hppkaEMAgAi0BYDyJ/w4Agc3rZ7wU4i8C43DcD9FcQOZTX5l0da0My6AZDTcpAP1iJJ3TVv7mHHDSq73FHtcwmuZso12cbZAxwJPcvA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lKC0KK3Y; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lKC0KK3Y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787984004; x=1819520004;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=2zHjTeCRmJspqNOvxj26gOQdJvukwSNivA+3bp7NuIg=;
  b=lKC0KK3Y/OeGidsHscLiGYvqusvuBGvYG32QIk3NMVlakaEBbx0Y4Scv
   Jyqf/4cPNNgYxXN5dGMarDxtcDgmXp5MurI7aM6SOffRRJdCrRX4YMjAx
   OOArJsTwkwn/ouEorKAUzyhUDWRby1evpnQpKkPAHCnTbcHtO+58ikGju
   N81JG0iV7TOV8qoN1ZjANh0uY/VWea1z/6chzPVrPo6pIxktYJe7S5MDK
   LZLmp6YaJUWwxgesQev4fqYwPQfGlnDM2YwLfdIQ6YAXgEUSw2OAfBZEW
   xTJlgarrCs/IFxh+17FSSaSFGY83qLow6c3Hr4ERPfMEWTFEN548LsdX0
   g==;
X-CSE-ConnectionGUID: Y9EQT9w5SaWVRSBFPhnY/A==
X-CSE-MsgGUID: /Q6gmDePRwKPgQmlV1uj1w==
X-IronPort-AV: E=McAfee;i="6800,10657,11889"; a="88507889"
X-IronPort-AV: E=Sophos;i="6.25,250,1779174000"; 
   d="scan'208";a="88507889"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2026 23:13:24 -0700
X-CSE-ConnectionGUID: nM4I2DlpTJSH27EOFvH/zw==
X-CSE-MsgGUID: W8yy5pDAQtuuZabTcOjJvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,250,1779174000"; 
   d="scan'208";a="272157067"
Received: from chenyu-dev.sh.intel.com ([10.239.62.107])
  by orviesa004.jf.intel.com with ESMTP; 28 Aug 2026 23:13:21 -0700
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
	chen.yu@linux.dev,
	x86@kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v7 9/9] x86/resctrl: Add MMIO-based LLC occupancy monitoring support
Date: Sat, 29 Aug 2026 14:02:55 +0800
Message-Id: <dc324874823d721cae60cc07a09358057cc6b5a4.1787976868.git.yu.c.chen@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1787976868.git.yu.c.chen@intel.com>
References: <cover.1787976868.git.yu.c.chen@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add erdt_mon_read() to read LLC occupancy via MMIO and use it when
the platform supports ERDT. Register the L3 occupancy event with
ERDT enabled when available, falling back to the MSR-based path
otherwise.

Use the CMRC (Cache Monitoring Registers for CPU Agents Description)
ACPI sub-table to read LLC occupancy counters for each RMID via MMIO
when ERDT is enabled. Store the CMRC information in the
rdt_hw_l3_mon_domain, which could be accessed directly.

Although the occupancy counters can now be read from any CPU via MMIO,
the per-domain limbo handler is kept. A global handler would still have
to iterate over every domain and would only save one worker thread, which
does not justify maintaining two limbo handler models.

Suggested-by: Reinette Chatre <reinette.chatre@intel.com>
Signed-off-by: Chen Yu <yu.c.chen@intel.com>
Tested-by: Hongyu Ning <hongyu.ning@linux.intel.com>
---
v6->v7:
    Use switch() instead of an if-chain in erdt_support(). (Reinette Chatre)
    Clamp max_rmid with min_t() so MSR-based MBM events are not handed the
    ERDT RMID. (Reinette Chatre)
    Divide the ERDT scale by snc_nodes_per_l3_cache under SNC.
    (Reinette Chatre)
---
 arch/x86/include/asm/resctrl.h         |  8 ++-
 arch/x86/kernel/cpu/resctrl/core.c     |  5 +-
 arch/x86/kernel/cpu/resctrl/erdt.c     | 73 +++++++++++++++++++++++++-
 arch/x86/kernel/cpu/resctrl/internal.h |  9 +++-
 arch/x86/kernel/cpu/resctrl/monitor.c  | 12 ++++-
 5 files changed, 100 insertions(+), 7 deletions(-)

diff --git a/arch/x86/include/asm/resctrl.h b/arch/x86/include/asm/resctrl.h
index a8dfaca5c6f8..14d69d1bb200 100644
--- a/arch/x86/include/asm/resctrl.h
+++ b/arch/x86/include/asm/resctrl.h
@@ -132,7 +132,13 @@ static inline void __resctrl_sched_in(struct task_struct *tsk)
 
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
index 2db9c71bf1f0..d6ea005b0858 100644
--- a/arch/x86/kernel/cpu/resctrl/core.c
+++ b/arch/x86/kernel/cpu/resctrl/core.c
@@ -1005,7 +1005,10 @@ static __init bool get_rdt_mon_resources(void)
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
index e6eba4067348..fb1643e165cf 100644
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
@@ -60,7 +69,67 @@ unsigned int erdt_get_max_rmid(void)
 
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
+	 * prevent over-calculation of aggregated monitor data.
+	 * FIXME: This scaling factor needs to be revisited/tuned for future
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
index bb7a902b5b9d..df1707105eb9 100644
--- a/arch/x86/kernel/cpu/resctrl/internal.h
+++ b/arch/x86/kernel/cpu/resctrl/internal.h
@@ -158,7 +158,11 @@ struct msr_param {
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
@@ -187,6 +191,8 @@ static inline struct rdt_hw_resource *resctrl_to_arch_res(struct rdt_resource *r
 
 extern struct rdt_hw_resource rdt_resources_all[];
 
+extern int snc_nodes_per_l3_cache;
+
 void arch_mon_domain_online(struct rdt_resource *r, struct rdt_l3_mon_domain *d);
 
 /* CPUID.(EAX=10H, ECX=ResID=1).EAX */
@@ -291,6 +297,7 @@ static inline bool intel_handle_aet_option(bool force_off, char *tok) { return f
 
 bool erdt_support(int flag);
 unsigned int erdt_get_max_rmid(void);
+int erdt_mon_read(struct rdt_domain_hdr *hdr, enum resctrl_event_id evtid, u32 rmid, u64 *val);
 int erdt_init(void);
 void erdt_exit(void);
 
diff --git a/arch/x86/kernel/cpu/resctrl/monitor.c b/arch/x86/kernel/cpu/resctrl/monitor.c
index 8057f8403e56..ac822e305afa 100644
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
@@ -429,12 +433,16 @@ int __init rdt_get_l3_mon_config(struct rdt_resource *r)
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
-- 
2.25.1

