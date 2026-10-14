Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80C7F3290C9
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 03:11:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791947495; cv=none; b=d/p4/tdN6ANeSz1UY2UjAVMl2CLwTbxm9Bz59xcsAgCxXGI3E7ROETEddGr/HGZTzJqtpL2HyGI3kJ1fTteAb2SrD9+ayUaHubYoI+VXkYZfmH0yuNS1CXmXd2fFnuhY83q1gwk7oML6IACUtABHA0CPFm18WZBVErrfwvbAcMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791947495; c=relaxed/simple;
	bh=PMt9TsITFbprwmEh9o7FzPPWp+p/v/YW56NoLUo6a6s=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=a6lcNemaEyYA+bidIyHXBeAUzZ6Pbds70m2ePH7P5p50xemvdHLJZacE2ogTuSjVuYCAYFJ1HdqgCry5fsLiSvPjA0fFe7mlhvJP0RqXZoGy9HdgSqDAQvHRjWH4cQ0+I3BS7l6yBT4i4/Fen1Miw4vyEdrOYGemLlDXeB1z3w0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lWxS66wr; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lWxS66wr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791947494; x=1823483494;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=PMt9TsITFbprwmEh9o7FzPPWp+p/v/YW56NoLUo6a6s=;
  b=lWxS66wrQX0Zk7/TeBW4kc3PNRDQ/9CVIIBFvr14q7OONRp5KAKHoVJ3
   3ARHldTNvPXaceOJsxm7qb/UPrzNPRnv9aX8wFwfzSovnY3968wQuHEm0
   D0xLrEPMPNrTw+b9ARyDHW9haqJB5ng7TaKXncouKavbph4pfUUh0FRJi
   xtcb8jLCrJJhoTXcdvPYlyNHq+4cVwUmpfFEwc7zt0QVinLXYWpkWlpux
   KZTaz8LhhM7lAlfuQsfYihTt6WpLiOSyan57gEcdL+ZxPOsGCFdcoIS40
   EIfhZ+FobQLqVSGELO1GyvxgBypqZIirvLpbfjJ1txuGfzx7gnCycLChn
   Q==;
X-CSE-ConnectionGUID: T7CedD9iTUq80FGTyToQGg==
X-CSE-MsgGUID: sDNa2z8jSr+hgrCSUMVfcw==
X-IronPort-AV: E=McAfee;i="6800,10657,11934"; a="586702"
X-IronPort-AV: E=Sophos;i="6.27,156,1787036400"; 
   d="scan'208";a="586702"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2026 20:11:33 -0700
X-CSE-ConnectionGUID: 4HISva2DSM2w3krIz/mJJA==
X-CSE-MsgGUID: 9/EM89dbSwefdU1Kain5QQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,156,1787036400"; 
   d="scan'208";a="1283373"
Received: from chenyu-dev.sh.intel.com ([10.239.62.107])
  by orviesa002.jf.intel.com with ESMTP; 13 Oct 2026 20:11:29 -0700
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
Subject: [PATCH v9 12/12] x86/resctrl: Add MMIO-based LLC occupancy monitoring support
Date: Wed, 14 Oct 2026 11:01:04 +0800
Message-Id: <afa6d022d767b0debb2aa7814699ac9842825820.1791933001.git.yu.c.chen@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1791933001.git.yu.c.chen@intel.com>
References: <cover.1791933001.git.yu.c.chen@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add erdt_mon_read() to read LLC occupancy via MMIO and use it
when the platform supports ERDT. Register the L3 occupancy event
with ERDT enabled when available, falling back to the MSR-based
path otherwise.

Use the CMRC (Cache Monitoring Registers for CPU Agents Description)
ACPI sub-table to read LLC occupancy counters for each RMID via MMIO
when ERDT is enabled.

Although the occupancy counters can now be read from any CPU via
MMIO, keep the per-domain limbo handler. A global handler would
still have to iterate over every domain and would save nr_domains - 1
worker threads, which does not justify maintaining two limbo handler
models.

Suggested-by: Reinette Chatre <reinette.chatre@intel.com>
Signed-off-by: Chen Yu <yu.c.chen@intel.com>
Tested-by: Hongyu Ning <hongyu.ning@linux.intel.com>
---
Changes since v8:
- Keep rdt_cpu_has(X86_FEATURE_CQM_OCCUP_LLC) as the outer check in
  get_rdt_mon_resources() and only use erdt_cpu_has() to select the MMIO
  read path, so that CPUID remains the enumeration mechanism and this
  patch does not conflict with Tony's CMT enumeration cleanup.
  (Reinette Chatre)
- Drop the snc_nodes_per_l3_cache division from erdt_read_l3_occupancy()
  and erdt_get_scale(). ERDT is not enabled when SNC is enabled, see
  "x86/resctrl: Do not enable ERDT when Sub-NUMA Cluster is enabled".
  (Reinette Chatre, sashiko)
- Rename UNAVAILABLE_COUNTER to CMRC_UNAVAILABLE_COUNTER. (Reinette Chatre)
- Add a function comment for cmrc_index_function_1() that connects it to
  CMRC_SUPPORTED_INDEX_FN, documents the Intel RDT Architecture
  Specification as the origin of the formula, and keeps the formula on a
  single line. (Reinette Chatre)
- Make erdt_get_scale() and erdt_get_max_rmid() return 0 unless
  erdt_cpu_has(X86_FEATURE_CQM_OCCUP_LLC), so the MSR path is used
  whenever the MMIO path is not.
- Fix the stale "h/w works in units of boot_cpu_data.x86_cache_occ_scale"
  comment. (Reinette Chatre)
- Changelog: drop the description of storing the CMRC data, which is
  done by "x86/resctrl: Parse ACPI CMRC table", use imperative mood for
  keeping the per-domain limbo handler, and say that a global handler
  would save nr_domains - 1 worker threads. (Reinette Chatre)

 arch/x86/kernel/cpu/resctrl/core.c     |  4 +-
 arch/x86/kernel/cpu/resctrl/erdt.c     | 77 +++++++++++++++++++++++++-
 arch/x86/kernel/cpu/resctrl/internal.h |  2 +
 arch/x86/kernel/cpu/resctrl/monitor.c  | 17 +++++-
 4 files changed, 96 insertions(+), 4 deletions(-)

diff --git a/arch/x86/kernel/cpu/resctrl/core.c b/arch/x86/kernel/cpu/resctrl/core.c
index f8737d9b2e20..f71584b10b19 100644
--- a/arch/x86/kernel/cpu/resctrl/core.c
+++ b/arch/x86/kernel/cpu/resctrl/core.c
@@ -989,7 +989,9 @@ static __init bool get_rdt_mon_resources(void)
 	bool ret = false;
 
 	if (rdt_cpu_has(X86_FEATURE_CQM_OCCUP_LLC)) {
-		resctrl_enable_mon_event(QOS_L3_OCCUP_EVENT_ID, false, 0, NULL);
+		resctrl_enable_mon_event(QOS_L3_OCCUP_EVENT_ID,
+					 erdt_cpu_has(X86_FEATURE_CQM_OCCUP_LLC),
+					 0, NULL);
 		ret = true;
 	}
 	if (rdt_cpu_has(X86_FEATURE_CQM_MBM_TOTAL)) {
diff --git a/arch/x86/kernel/cpu/resctrl/erdt.c b/arch/x86/kernel/cpu/resctrl/erdt.c
index 110e7b9806b4..1a9847a11de8 100644
--- a/arch/x86/kernel/cpu/resctrl/erdt.c
+++ b/arch/x86/kernel/cpu/resctrl/erdt.c
@@ -27,6 +27,9 @@ static bool erdt_enabled;
 #define RMDD_FLAG_CPU_L3_DOMAIN		BIT(0)
 #define ERDT_DOMAIN_ID_UNSET		-1
 
+#define CMRC_UNAVAILABLE_COUNTER	BIT_ULL(63)
+#define CMRC_FLAG_UNAVAILABLE_BIT	BIT(0)
+
 /* Bitmask of valid sub-tables found in the first RMDD, used to ensure all RMDDs match. */
 static u32 valid_subtbl_mask;
 
@@ -52,14 +55,84 @@ static unsigned int erdt_scale;
 
 bool erdt_support(int flag)
 {
-	return false;
+	if (!erdt_enabled)
+		return false;
+
+	switch (flag) {
+	case X86_FEATURE_CQM_OCCUP_LLC:
+		return valid_subtbl_mask & BIT(ACPI_ERDT_TYPE_CMRC);
+	default:
+		return false;
+	}
+}
+
+unsigned int erdt_get_max_rmid(void)
+{
+	if (!erdt_cpu_has(X86_FEATURE_CQM_OCCUP_LLC))
+		return 0;
+
+	return erdt_max_rmid;
 }
 
 unsigned int erdt_get_scale(void)
 {
+	if (!erdt_cpu_has(X86_FEATURE_CQM_OCCUP_LLC))
+		return 0;
+
 	return erdt_scale;
 }
 
+/*
+ * Compute the CMRC MMIO offset for CMRC_SUPPORTED_INDEX_FN using the
+ * MMIO_offset_for_RMID# = (RMID / ClumpSize) * Stride + (RMID % ClumpSize) * 8
+ * formula from the Intel RDT Architecture Specification.
+ */
+static u32 cmrc_index_function_1(struct acpi_erdt_cmrc *cmrc, u32 rmid)
+{
+	return (rmid / cmrc->clump_size) * cmrc->clump_stride +
+	       (rmid % cmrc->clump_size) * sizeof(u64);
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
+	if (offset + sizeof(u64) > (u32)cmrc->cmt_reg_size * SZ_4K)
+		return -EINVAL;
+
+	l3_cmt_count = readq(d->base[ERDT_MMIO_CMRC_BASE] + offset);
+	if ((cmrc->flags & CMRC_FLAG_UNAVAILABLE_BIT) &&
+	    (l3_cmt_count & CMRC_UNAVAILABLE_COUNTER))
+		return -EINVAL;
+
+	*val = l3_cmt_count * cmrc->up_scale;
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
+}
+
 static void __iomem *erdt_ioremap(resource_size_t base, u32 num_pages, const char *desc)
 {
 	void __iomem *addr;
@@ -161,6 +234,8 @@ static __init bool cmrc_init(struct acpi_subtbl_hdr_16 *subtbl,
 		return false;
 	}
 
+	erdt_scale = max(erdt_scale, cmrc->up_scale);
+
 	return true;
 }
 
diff --git a/arch/x86/kernel/cpu/resctrl/internal.h b/arch/x86/kernel/cpu/resctrl/internal.h
index 88fae7a84fc7..3561a7ae8c7e 100644
--- a/arch/x86/kernel/cpu/resctrl/internal.h
+++ b/arch/x86/kernel/cpu/resctrl/internal.h
@@ -291,6 +291,8 @@ static inline bool intel_handle_aet_option(bool force_off, char *tok) { return f
 bool erdt_cpu_has(int flag);
 bool erdt_support(int flag);
 unsigned int erdt_get_scale(void);
+unsigned int erdt_get_max_rmid(void);
+int erdt_mon_read(struct rdt_domain_hdr *hdr, enum resctrl_event_id evtid, u32 rmid, u64 *val);
 void erdt_init(void);
 void erdt_exit(void);
 bool erdt_try_bind_cpu(int cpu);
diff --git a/arch/x86/kernel/cpu/resctrl/monitor.c b/arch/x86/kernel/cpu/resctrl/monitor.c
index e66e4c845739..93ee638119d3 100644
--- a/arch/x86/kernel/cpu/resctrl/monitor.c
+++ b/arch/x86/kernel/cpu/resctrl/monitor.c
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
@@ -438,7 +442,7 @@ unsigned int resctrl_arch_round_mon_val(unsigned int val)
 	if (!scale)
 		scale = boot_cpu_data.x86_cache_occ_scale;
 
-	/* h/w works in units of "boot_cpu_data.x86_cache_occ_scale" */
+	/* h/w works in units of the occupancy scale  */
 	val /= scale;
 	return val * scale;
 }
@@ -447,12 +451,21 @@ int __init rdt_get_l3_mon_config(struct rdt_resource *r)
 {
 	unsigned int mbm_offset = boot_cpu_data.x86_cache_mbm_width_offset;
 	struct rdt_hw_resource *hw_res = resctrl_to_arch_res(r);
+	unsigned int erdt_max_rmid;
 	unsigned int threshold;
+	int max_rmid;
 	u32 eax, ebx, ecx, edx;
 
+	erdt_max_rmid = erdt_get_max_rmid();
+	if (erdt_max_rmid)
+		max_rmid = min_t(unsigned int, erdt_max_rmid,
+				 boot_cpu_data.x86_cache_max_rmid);
+	else
+		max_rmid = boot_cpu_data.x86_cache_max_rmid;
+
 	resctrl_rmid_realloc_limit = boot_cpu_data.x86_cache_size * 1024;
 	hw_res->mon_scale = boot_cpu_data.x86_cache_occ_scale / snc_nodes_per_l3_cache;
-	r->mon.num_rmid = (boot_cpu_data.x86_cache_max_rmid + 1) / snc_nodes_per_l3_cache;
+	r->mon.num_rmid = (max_rmid + 1) / snc_nodes_per_l3_cache;
 	hw_res->mbm_width = MBM_CNTR_WIDTH_BASE;
 
 	if (mbm_offset > 0 && mbm_offset <= MBM_CNTR_WIDTH_OFFSET_MAX)
-- 
2.43.0

