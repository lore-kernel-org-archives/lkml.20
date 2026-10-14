Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DD6623ABBF
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 03:09:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791947356; cv=none; b=FN3CSNxkoUkEp2e3AT1KhhIaTdCMh/dfyRAvwpX8d+ihA378BuOKOSN0dUGla7X+Es19Arf9HJUoYDiybJcY3qXwtWpxzv4QY0zbsmzQG/FK5coKkONi03i9xzQXnVB1VM/XcuRn/Ph88KcKM3H80p+U8pIfLjdoFniROh0/qbE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791947356; c=relaxed/simple;
	bh=k3cFraQKcAUI97PEgSLbTvXYCpvxX+yXngi3fBdrWyU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Y3D4IUcuLfEAHzHh9cdzemF7FrOXKDMnYgsvG7ON2pL4ubfyJWVRFsHJw6OzEQXtxxPGFXKLRTL3Qdx13SRvF6lxvewJ0+WiOh1lHcRRHSuEOQsYx3wX+vrtaoNuoh+h+FPTcX04FhUknAsakPFG8l+mspTCIu1XV3GN8QFXKYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SHSIObFW; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SHSIObFW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791947354; x=1823483354;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=k3cFraQKcAUI97PEgSLbTvXYCpvxX+yXngi3fBdrWyU=;
  b=SHSIObFWgHCS9a76jpk3UJhKZnkX+SZgGMFVOktB3RfkaX+FiL9Jw9yN
   TQk1s22fs4WOXJBUrIjqgdOzRdFsnzjmIqxaiyeB5I0hZ03V1QW8dTFZr
   6MgULMAVBH7oaIzY9t0pGW6aqj6txiB+jeaCfXYuFlK5jgAlTplr8xDGZ
   El375vXQtIW9D25k5M0rUKz5DJbIt5fLt3WWT5wV9/qBS98+jEZ/KVlXn
   RI9JK9P8K129SepQYp2bs7car0WYC6pUqEA+GcwqpVs6UpEAm49sX7L9c
   A8XeSx5N3w7uXQ5mUR+R0mLh8ZhHFDBW1eU+kY4HKIklmYau81fVaNy7U
   w==;
X-CSE-ConnectionGUID: MPNKCeWqS+OMIt/xTwJF4Q==
X-CSE-MsgGUID: 17NNwFJhRqi2/c1bFZPO0w==
X-IronPort-AV: E=McAfee;i="6800,10657,11934"; a="676296"
X-IronPort-AV: E=Sophos;i="6.27,156,1787036400"; 
   d="scan'208";a="676296"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2026 20:09:13 -0700
X-CSE-ConnectionGUID: Bv2BwNPeSty5UJbPevqO+w==
X-CSE-MsgGUID: WHo6se6cQXe8CC3HbriEjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,156,1787036400"; 
   d="scan'208";a="1392351"
Received: from chenyu-dev.sh.intel.com ([10.239.62.107])
  by orviesa006.jf.intel.com with ESMTP; 13 Oct 2026 20:09:10 -0700
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
Subject: [PATCH v9 04/12] x86/resctrl: Do not enable ERDT when Sub-NUMA Cluster is enabled
Date: Wed, 14 Oct 2026 10:58:45 +0800
Message-Id: <eefa12618e3be5b5e19a88a343d192ab8d9049ae.1791933001.git.yu.c.chen@intel.com>
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

ERDT cannot coexist with SNC(Sub-NUMA-Clustering). The definition of SNC
is to 'divide' an L3 into smaller L3 slices by mapping addresses to
different L3 slices. The current platform with ERDT enabled has several
L3 per socket, and it will not be divided into smaller slices.
Furthermore, ERDT has only L3 scope for the CPU agent, and there are no
node-scope domains.

snc_nodes_per_l3_cache is calculated in rdt_get_l3_mon_config(), which
runs after erdt_init() has parsed the ACPI ERDT table. Introduce
resctrl_arch_update_snc() to do that calculation and call it from
get_rdt_resources() before erdt_init(). Leave ERDT disabled if SNC is
detected and keep using the legacy MSR based CMT interface. Do this check
while parsing the ERDT table so that platforms that do not provide an
ERDT table at all stay silent.

Suggested-by: Tony Luck <tony.luck@intel.com>
Suggested-by: Reinette Chatre <reinette.chatre@intel.com>
Signed-off-by: Chen Yu <yu.c.chen@intel.com>
Tested-by: Hongyu Ning <hongyu.ning@linux.intel.com>
---
Changes since v8:
- New patch. v8 made it look as though SNC was supported while silently
  depending on it being disabled. Make the restriction explicit by
  leaving ERDT disabled when SNC is enabled, and introduce
  resctrl_arch_update_snc() so that snc_nodes_per_l3_cache is computed
  before erdt_init() parses the ACPI table.
  (Reinette Chatre, sashiko)

 arch/x86/kernel/cpu/resctrl/core.c     |  1 +
 arch/x86/kernel/cpu/resctrl/erdt.c     | 12 ++++++++++++
 arch/x86/kernel/cpu/resctrl/internal.h |  3 +++
 arch/x86/kernel/cpu/resctrl/monitor.c  |  9 ++++++---
 4 files changed, 22 insertions(+), 3 deletions(-)

diff --git a/arch/x86/kernel/cpu/resctrl/core.c b/arch/x86/kernel/cpu/resctrl/core.c
index 7fadfebb5312..0ea888807bd0 100644
--- a/arch/x86/kernel/cpu/resctrl/core.c
+++ b/arch/x86/kernel/cpu/resctrl/core.c
@@ -1018,6 +1018,7 @@ static __init bool get_rdt_resources(void)
 {
 	bool ret;
 
+	resctrl_arch_update_snc();
 	erdt_init();
 	rdt_alloc_capable = get_rdt_alloc_resources();
 	rdt_mon_capable = get_rdt_mon_resources();
diff --git a/arch/x86/kernel/cpu/resctrl/erdt.c b/arch/x86/kernel/cpu/resctrl/erdt.c
index eb5e262e243a..d94c54617fa1 100644
--- a/arch/x86/kernel/cpu/resctrl/erdt.c
+++ b/arch/x86/kernel/cpu/resctrl/erdt.c
@@ -229,6 +229,18 @@ static __init int enumerate_erdt_table(struct acpi_table_header *table_hdr)
 		return -EINVAL;
 	}
 
+	/*
+	 * ERDT describes monitoring resources per L3 cache domain, while SNC
+	 * splits an L3 cache into NUMA node scoped monitoring domains. The two
+	 * cannot be matched up, so leave ERDT disabled and fall back to the
+	 * MSR based CMT interface. snc_nodes_per_l3_cache has been computed by
+	 * resctrl_arch_update_snc() before erdt_init() is called.
+	 */
+	if (snc_nodes_per_l3_cache > 1) {
+		pr_info("Not supported with Sub-NUMA Cluster enabled, using legacy CMT\n");
+		return -EINVAL;
+	}
+
 	for (subtbl = (void *)erdt + sizeof(*erdt);
 	     subtbl_valid((void *)erdt + erdt->header.length, subtbl);
 	     subtbl = next_subtbl(subtbl)) {
diff --git a/arch/x86/kernel/cpu/resctrl/internal.h b/arch/x86/kernel/cpu/resctrl/internal.h
index e2f3b884847c..34d29f719076 100644
--- a/arch/x86/kernel/cpu/resctrl/internal.h
+++ b/arch/x86/kernel/cpu/resctrl/internal.h
@@ -177,6 +177,8 @@ static inline struct rdt_hw_resource *resctrl_to_arch_res(struct rdt_resource *r
 
 extern struct rdt_hw_resource rdt_resources_all[];
 
+extern int snc_nodes_per_l3_cache;
+
 void arch_mon_domain_online(struct rdt_resource *r, struct rdt_l3_mon_domain *d);
 
 /* CPUID.(EAX=10H, ECX=ResID=1).EAX */
@@ -251,6 +253,7 @@ union l3_qos_abmc_cfg {
 void rdt_ctrl_update(void *arg);
 
 int rdt_get_l3_mon_config(struct rdt_resource *r);
+__init void resctrl_arch_update_snc(void);
 
 bool rdt_cpu_has(int flag);
 
diff --git a/arch/x86/kernel/cpu/resctrl/monitor.c b/arch/x86/kernel/cpu/resctrl/monitor.c
index 3838e0a13d36..6e46f10d8640 100644
--- a/arch/x86/kernel/cpu/resctrl/monitor.c
+++ b/arch/x86/kernel/cpu/resctrl/monitor.c
@@ -34,7 +34,7 @@ bool rdt_mon_capable;
 
 #define CF(cf)	((unsigned long)(1048576 * (cf) + 0.5))
 
-static int snc_nodes_per_l3_cache = 1;
+int snc_nodes_per_l3_cache = 1;
 
 /*
  * The correction factor table is documented in Documentation/filesystems/resctrl.rst.
@@ -416,6 +416,11 @@ static __init int snc_get_config(void)
 	return ret;
 }
 
+__init void resctrl_arch_update_snc(void)
+{
+	snc_nodes_per_l3_cache = snc_get_config();
+}
+
 int __init rdt_get_l3_mon_config(struct rdt_resource *r)
 {
 	unsigned int mbm_offset = boot_cpu_data.x86_cache_mbm_width_offset;
@@ -423,8 +428,6 @@ int __init rdt_get_l3_mon_config(struct rdt_resource *r)
 	unsigned int threshold;
 	u32 eax, ebx, ecx, edx;
 
-	snc_nodes_per_l3_cache = snc_get_config();
-
 	resctrl_rmid_realloc_limit = boot_cpu_data.x86_cache_size * 1024;
 	hw_res->mon_scale = boot_cpu_data.x86_cache_occ_scale / snc_nodes_per_l3_cache;
 	r->mon.num_rmid = (boot_cpu_data.x86_cache_max_rmid + 1) / snc_nodes_per_l3_cache;
-- 
2.43.0

