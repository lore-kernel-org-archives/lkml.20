Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793874066;
	b=JAyS+BX9sIi5FaXRwRcUmcRT7MoVYxuqW0RbF+lp/Y4WH+69G0i4PTU8uaU8AlhGTJbQ
	 4sjjCmSDZ36t57yBPjRkeYCzzirSNhSrO8W+cQfLh+z9CjCweTrIlblxh4bwyaCbOd+Dt
	 kn0T+1cK46sUPBWDeUJiVJR8DbWRCGll26kP2zSV0tx1JvUZ2PrTXCBsqWpQUoprJfV4o
	 kCs6nPCvYflckeLHIBKDEgFHLfHRZtqL5gg0sXkBYMNI4UtwhXJclrepZRQXyh8nstkfT
	 uw4yg7krivKJJokN32BCIkq2zqOlGZSdkmHO5sxnCJ5bMvTwpo3YgfjBm68YPnFsr9w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793874066;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Mv/2AS0qRaKZ0TdaC5t/xTIPeHi5gO2PuQ8CKfwNT/c=;
	b=w0velWgMDRSA955v2OaUUkRyjDhErPOkNn3MvVscgT+Lk1dxultkiFedBf0GLbC1p4u3
	 p1+YYUigo8JW1JicXZ5ilJdrqETi9ZqdnazGXCLuLsdY+dQ/UYvUcbKScqvAeRktCsGsn
	 VvCdG7cG5fxEMGbZPyaO8XiRGc635QKFToYEtKYn/B0O73RSWetq6QRs6YZwawlHLlIIx
	 cxjEQO/LJ09WeRmQVKvqsSdFivqfnBfbWQA0ko+ykPUn1j/GxtRcNM/xoHgZixRKhEs8+
	 g9PByqEuegY+r2qXtGOZgJvFO1WXX2Z9FhyCL0XBdpCXeDXZ32xE6vCMOUhooK1G5nA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=CZWedlsZ;
	arc=none smtp.remote-ip=198.175.65.12
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06A78606EEB0
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 10:21:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 06A78606EEB0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=CZWedlsZ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793874065; x=1825410065;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=wtShDU7T6GEj+a09zbBySCNTmUCtnre7hUuzve5+zE8=;
  b=CZWedlsZf8HCMH97xYbQbYbL2F43TrXYQ6PxMB9tjuEPG58ihOpBqW1G
   X4pkLiAtTuYZnKxgHz0q2hol8Lt/ZmIYLX7SUZf+nS2nKZ278CqJ5UEwN
   0+Fwcxj2IHr2wtBk4aWB4MvPXZCPjPPe9MO7VTenOLl0Q3+CehNJPCJWa
   kuiAHt5nsdX1fujKMIoZgrrMMJA/giEaDyC24gEIJ7kNmPhNNtmLd9wvK
   PZlhfbbhy0oZ6CaoP04NdDZmz0WCx9zkAXZlwrTazZGE72o5ISazyZ8VW
   8dsrMU3bbnYC2ZwMtFt+KY9qm3purYWRzPngMhVu2OwzBKeAu5RB//rZ2
   Q==;
X-CSE-ConnectionGUID: 8dE03DgPRU2V6ViAiNoyLQ==
X-CSE-MsgGUID: K/sDUxyCTG+YAu/cuW1R9A==
X-IronPort-AV: E=McAfee;i="6800,10657,11956"; a="2530343"
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="2530343"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2026 02:21:05 -0800
X-CSE-ConnectionGUID: ZWSBCWqcR+ysLFUlChBZgA==
X-CSE-MsgGUID: Dk+b99EEQTCCilkCSEd+DA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="7143944"
Received: from chenyu-dev.sh.intel.com ([10.239.62.184])
  by fmviesa003.fm.intel.com with ESMTP; 05 Nov 2026 02:21:01 -0800
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
	linux-kernel@vger.kernel.org
Subject: [PATCH v10 12/12] x86/resctrl: Add MMIO-based LLC occupancy monitoring support
Date: Thu,  5 Nov 2026 18:10:01 +0800
Message-Id: <7bed6c8ff93d549d82c546010933d8e6c02aa44b.1793864720.git.yu.c.chen@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1793864720.git.yu.c.chen@intel.com>
References: <cover.1793864720.git.yu.c.chen@intel.com>
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

Add erdt_mon_read() to read LLC occupancy via MMIO and use it when the platform
supports ERDT. Fall back to the MSR-based path if ERDT is unavailable on this
platform. Mark the LLC occupancy event as readable from any CPU when it is read
via MMIO.

When LLC occupancy is read via MMIO, limit the number of RMIDs to what every
ERDT domain supports. resctrl uses a single number of RMIDs for all monitoring
events, so this limit applies to the MSR-based MBM events as well. When LLC
occupancy is not read via MMIO, e.g. with rdt=!cmt or without CMRC, no event
is read via ERDT and the number of RMIDs is determined by CPUID alone.

Keep the per domain limbo handler even though the occupancy counters can now be
read from any CPU via MMIO. A single global handler would still have to check
the limbo RMIDs of every L3 domain, so it would do the same amount of work. The
only saving would be running one limbo worker instead of one per L3 domain,
which does not justify maintaining two limbo handler models.

Suggested-by: Reinette Chatre <reinette.chatre@intel.com>
Signed-off-by: Chen Yu <yu.c.chen@intel.com>
Tested-by: Hongyu Ning <hongyu.ning@linux.intel.com>
---
Changes since v9:
- Make erdt_get_max_rmid() depend on erdt_enabled instead of
  erdt_cpu_has(X86_FEATURE_CQM_OCCUP_LLC): RMDD max_rmid limits all RMIDs,
  not only those used for LLC occupancy. Say so in the changelog.
  (Reinette Chatre)
- Move the erdt_cmt_scale update, the erdt_get_cmt_scale() check, and
  the resctrl_arch_round_mon_val() comment fix to "x86/resctrl: Add the
  ERDT CMT scale". (Reinette Chatre)
- Fix the CMRC register size check: cast cmrc->cmt_reg_size to u64
  instead of u32 so that the multiplication by SZ_4K is not truncated.
  (Reinette Chatre)
- Use WARN_ON_ONCE() when an L3 monitoring domain has no ERDT domain
  attached. This should not happen.
- Do not shadow the erdt_max_rmid global in rdt_get_l3_mon_config():
  rename the local to erdt_rmid_limit, make max_rmid unsigned and
  initialize it from CPUID, use min(), and keep reverse fir tree order.
  (Reinette Chatre)
- Document that hw_res->mon_scale is not used when LLC occupancy is read
  via ERDT.
- Changelog: start the limbo handler paragraph with "Keep the per domain
  limbo handler" and explain the "nr_domains - 1" saving in plain
  English. (Reinette Chatre)

 arch/x86/kernel/cpu/resctrl/core.c     |  4 +-
 arch/x86/kernel/cpu/resctrl/erdt.c     | 83 +++++++++++++++++++++++++-
 arch/x86/kernel/cpu/resctrl/internal.h |  5 +-
 arch/x86/kernel/cpu/resctrl/monitor.c  | 12 +++-
 4 files changed, 100 insertions(+), 4 deletions(-)

diff --git a/arch/x86/kernel/cpu/resctrl/core.c b/arch/x86/kernel/cpu/resctrl/core.c
index c71d6626c330..3ea40a5dbbea 100644
--- a/arch/x86/kernel/cpu/resctrl/core.c
+++ b/arch/x86/kernel/cpu/resctrl/core.c
@@ -990,7 +990,9 @@ static __init bool get_rdt_mon_resources(void)
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
index 3d34e1050794..431e63dd5ead 100644
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
 
@@ -49,7 +52,34 @@ static unsigned int erdt_cmt_scale;
 
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
+/**
+ * erdt_get_cmt_max_rmid() - Get the RMID limit of CMT via ERDT
+ *
+ * Return the ERDT limit only when LLC occupancy is read via ERDT, rather than
+ * whenever ERDT is enabled. This prevents, for example, booting with
+ * "rdt=!cmt" or ERDT without CMRC from restricting the RMIDs of the MSR-based
+ * events to the ERDT range even though no event is read via ERDT.
+ *
+ * Return: The largest RMID valid in every ERDT domain if LLC occupancy is read
+ * via ERDT, 0 otherwise.
+ */
+unsigned int erdt_get_cmt_max_rmid(void)
+{
+	if (!erdt_cpu_has(X86_FEATURE_CQM_OCCUP_LLC))
+		return 0;
+
+	return erdt_max_rmid;
 }
 
 unsigned int erdt_get_cmt_scale(void)
@@ -60,6 +90,57 @@ unsigned int erdt_get_cmt_scale(void)
 	return erdt_cmt_scale;
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
+	if (offset + sizeof(u64) > (u64)cmrc->cmt_reg_size * SZ_4K)
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
+	if (WARN_ON_ONCE(!d))
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
diff --git a/arch/x86/kernel/cpu/resctrl/internal.h b/arch/x86/kernel/cpu/resctrl/internal.h
index 87494316becb..4d5aff6ec1b5 100644
--- a/arch/x86/kernel/cpu/resctrl/internal.h
+++ b/arch/x86/kernel/cpu/resctrl/internal.h
@@ -155,7 +155,8 @@ struct msr_param {
  *			which has been corrected for features like CDP.
  * @msr_base:		Base MSR address for CBMs
  * @msr_update:		Function pointer to update QOS MSRs
- * @mon_scale:		cqm counter * mon_scale = occupancy in bytes
+ * @mon_scale:		cqm counter * mon_scale = occupancy in bytes.
+ *			Not used when LLC occupancy is read via ERDT.
  * @mbm_width:		Monitor width, to detect and correct for overflow.
  * @cdp_enabled:	CDP state of this resource
  * @mbm_cntr_assign_enabled:	ABMC feature is enabled
@@ -294,6 +295,8 @@ static inline bool intel_handle_aet_option(bool force_off, char *tok) { return f
 bool erdt_cpu_has(int flag);
 bool erdt_support(int flag);
 unsigned int erdt_get_cmt_scale(void);
+unsigned int erdt_get_cmt_max_rmid(void);
+int erdt_mon_read(struct rdt_domain_hdr *hdr, enum resctrl_event_id evtid, u32 rmid, u64 *val);
 void erdt_init(void);
 void erdt_exit(void);
 bool erdt_try_bind_domain(int cpu);
diff --git a/arch/x86/kernel/cpu/resctrl/monitor.c b/arch/x86/kernel/cpu/resctrl/monitor.c
index 05f6d24d0fc6..6269a3632652 100644
--- a/arch/x86/kernel/cpu/resctrl/monitor.c
+++ b/arch/x86/kernel/cpu/resctrl/monitor.c
@@ -281,6 +281,10 @@ int resctrl_arch_rmid_read(struct rdt_resource *r, struct rdt_domain_hdr *hdr,
 
 	switch (r->rid) {
 	case RDT_RESOURCE_L3:
+		if (eventid == QOS_L3_OCCUP_EVENT_ID &&
+		    erdt_cpu_has(X86_FEATURE_CQM_OCCUP_LLC))
+			return erdt_mon_read(hdr, eventid, rmid, val);
+
 		return arch_l3_read_event(r, hdr, rmid, eventid, val);
 	case RDT_RESOURCE_PERF_PKG:
 		return intel_aet_read_event(hdr->id, rmid, arch_priv, val);
@@ -439,13 +443,19 @@ unsigned int resctrl_arch_round_mon_val(unsigned int val)
 int __init rdt_get_l3_mon_config(struct rdt_resource *r)
 {
 	unsigned int mbm_offset = boot_cpu_data.x86_cache_mbm_width_offset;
+	unsigned int max_rmid = boot_cpu_data.x86_cache_max_rmid;
 	struct rdt_hw_resource *hw_res = resctrl_to_arch_res(r);
+	unsigned int erdt_rmid_limit;
 	unsigned int threshold;
 	u32 eax, ebx, ecx, edx;
 
+	erdt_rmid_limit = erdt_get_cmt_max_rmid();
+	if (erdt_rmid_limit)
+		max_rmid = min(max_rmid, erdt_rmid_limit);
+
 	resctrl_rmid_realloc_limit = boot_cpu_data.x86_cache_size * 1024;
 	hw_res->mon_scale = boot_cpu_data.x86_cache_occ_scale / snc_nodes_per_l3_cache;
-	r->mon.num_rmid = (boot_cpu_data.x86_cache_max_rmid + 1) / snc_nodes_per_l3_cache;
+	r->mon.num_rmid = (max_rmid + 1) / snc_nodes_per_l3_cache;
 	hw_res->mbm_width = MBM_CNTR_WIDTH_BASE;
 
 	if (mbm_offset > 0 && mbm_offset <= MBM_CNTR_WIDTH_OFFSET_MAX)
-- 
2.25.1

