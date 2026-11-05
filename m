Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793873992;
	b=lBxIPy73y2vtr8jBJcI4ZtxOqTTN5imH+u81u8YIoSoN+T10+laReDvC+gc9rbvrdy4J
	 uz/pdCfvlzMi8DOP1li/mc4t9fjtQPa+Nshsb0MzKhj32fOJ6Qw8m/5zHCs++NjsaSKP3
	 qJw9aditsDAmSBGu+ZpcaN+QLpnrZG7Z2mhthK9YY9+AGY9Jr4MtLE6vp5/V9s5WunouZ
	 P9MKfKE6n78yAXu4uaTZf8tSLsd+umOr9hdmlSJby6HxwZMj5inSSmTY7s7UXPhXARCS7
	 rJGQeVqtVdSMF3xyMsYRcF6axq0AQ+dpFXCJu7qYv61fekmvUKEX8MnR+Fzhhl86eIw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793873992;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Gs45+8E5xy84OEh3ybzk5dOaTbKTJGqkMqq5Pu6NP0I=;
	b=CEbAe3kdVESFRTL9BW1QIp+4tYRKb2WkmicaXA2i/ye3GiGilXdHoRqXn0Jk88rRp11M
	 KylPsTC9P7owubqd9ZMgLpf/U26yhlFqubU6c1ZtNxT7hp81+nQ1BCoQcypDAxEdETgvM
	 35DYZqh7aLAdIz3Vgk64TG2E603u7gBEmAKZIhT+PqdPFswfng6JzEtdyFFrbknWFVgv9
	 gyjcuiHWmklFHDswGfjc81844SRs9BFcZtDyFih9RMKI8CvsIBawhqFt2p5rxDU+3d9XN
	 Xk9qwUIrqCR9jqGt16Gh+BUWF4pzDkwbGZBUCLp/T5iIqIe6XbBFYLdJjxfVrBFtvPQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=dxOR5E86;
	arc=none smtp.remote-ip=198.175.65.11
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2F8A606A32F
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 10:19:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E2F8A606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=dxOR5E86
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793873992; x=1825409992;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=CcQ2FV+deLEMBuA18W4vNVtU8UBn7HxTjGcNjKTbxbc=;
  b=dxOR5E86ks1MFlP9kwnJARiOAbVdLy0LpKADP0yVuxmIQgR1wR5uFgMA
   amA9h5C66QDXvT/tMnayOq3EDIVb6mMqbkYIgsm2VglQ58yLo/cIT2THP
   GG4vdxELbm7YLypAi+RM5/ruiStqH5zCn08yEkaiPlJEDYEYx4wzDNEOx
   WEfXTiMntFhTjrPxz3goH0LG/s7Ee4GSHCUfQEvWh2RNSAd8qXOFK0Drl
   9zB18Kj41NFGzo+WW9B6oz9oo44C+2FzDX/E4lgyFO9tPcFnNWBlNCgIO
   YoUUaJciPwPOFF30Rci4gpI20TwuFAr8HhfTNdnjZBeVPVVLBhJciPRlM
   A==;
X-CSE-ConnectionGUID: c5AoemqORdGxufgz+fd4Kw==
X-CSE-MsgGUID: eFwblpkySUyH/hZjCqcqxw==
X-IronPort-AV: E=McAfee;i="6800,10657,11956"; a="2541000"
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="2541000"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2026 02:19:52 -0800
X-CSE-ConnectionGUID: mPLbt0kTSQqWsSowT9gmAw==
X-CSE-MsgGUID: m59PGX7bRJKipcpdm0Q6tw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="7095803"
Received: from chenyu-dev.sh.intel.com ([10.239.62.184])
  by fmviesa005.fm.intel.com with ESMTP; 05 Nov 2026 02:19:48 -0800
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
Subject: [PATCH v10 05/12] x86/resctrl: Parse ACPI ERDT table and save CACD cpumask per RMD
Date: Thu,  5 Nov 2026 18:08:48 +0800
Message-Id: <f99fa409c6df92c54ce5a76f698154162b6a4e45.1793864720.git.yu.c.chen@intel.com>
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

Enhanced RDT (ERDT) exposes per-domain MMIO registers for RDT monitoring and
control. A single per-platform ERDT ACPI table describes them.

Each Resource Management Domain Description (RMDD) sub-table within the ERDT
table represents one resource management domain (RMD). When
RMDD_FLAG_CPU_L3_DOMAIN is set, it identifies the domain as a CPU-scoped L3
domain. The set of CPUs in the domain is listed by x2APIC ID in the CPU Agent
Collection Description (CACD) sub-table.

The hierarchy of these ACPI tables is illustrated below:

  +---------------------------------------------------------------+
  | ERDT  (one instance per platform)                             |
  |                                                               |
  |   +-------------------------------------------------------+   |
  |   | RMDD #0                                               |   |
  |   |   max_rmid                                            |   |
  |   |                                                       |   |
  |   |   +-----------------------------------------------+   |   |
  |   |   | CACD                                          |   |   |
  |   |   |   x2APIC ID[0], x2APIC ID[1], ...             |   |   |
  |   |   +-----------------------------------------------+   |   |
  |   +-------------------------------------------------------+   |
  |   +-------------------------------------------------------+   |
  |   | RMDD #1                                               |   |
  |   |   ...                                                 |   |
  |   +-------------------------------------------------------+   |
  |   ...                                                         |
  |   +-------------------------------------------------------+   |
  |   | RMDD #N-1                                             |   |
  |   +-------------------------------------------------------+   |
  +---------------------------------------------------------------+

Parse the RMDD sub-tables in preparation for attaching each ERDT domain to a
resctrl L3 domain. For each CPU-based L3 RMDD, map its control registers and
record the CPUs listed in its CACD sub-tables. Record the largest RMID that is
valid on every RMD. Require all RMDDs to have the same set of sub-table types.

ERDT is not compatible with Sub-NUMA Cluster (SNC) mode: ERDT describes CPU
monitoring resources only per L3 cache, while SNC divides an L3 cache into NUMA
node scoped monitoring domains. Leave ERDT disabled when SNC is enabled so that
resctrl keeps using the MSR interface.

Originally-by: Anil S Keshavamurthy <anil.s.keshavamurthy@intel.com>
Suggested-by: Tony Luck <tony.luck@intel.com>
Suggested-by: Reinette Chatre <reinette.chatre@intel.com>
Signed-off-by: Chen Yu <yu.c.chen@intel.com>
Tested-by: Hongyu Ning <hongyu.ning@linux.intel.com>
---
Changes since v9:
- Fold in the ERDT/SNC check from v9 "x86/resctrl: Do not enable ERDT
  when Sub-NUMA Cluster is enabled" and note in the changelog that ERDT
  and SNC are not compatible. (Reinette Chatre)
- Make the SNC check the first check in enumerate_erdt_table() so that
  no parsing is done when SNC is enabled. (Reinette Chatre)
- Drop "CMT" from the SNC comment and message because the restriction
  is not specific to CMT, drop the comment sentence about where
  snc_nodes_per_l3_cache is computed, and print "ERDT not supported with
  Sub-NUMA Cluster enabled". (Reinette Chatre)
- Skip an RMDD whose CACD sub-tables do not list any CPU known to the
  kernel, e.g. when all of them are excluded by nr_cpus=, instead of
  adding an ERDT domain without CPUs. (Reinette Chatre)
- Report a CPU-based L3 RMDD without a CACD sub-table as a firmware bug.
- Map the RMDD control registers only after the RMDD is known to have
  CPUs. (Reinette Chatre)
- Changelog: drop the sentence about the CMRC sub-table and CMT
  counters, which are unrelated to this patch, drop domain_id from the
  diagram because this patch does not use it, and shorten the
  description of the change. (Reinette Chatre)
- Add erdt.o to the existing ctrlmondata.o line in the Makefile.
  (Reinette Chatre)
- Simplify the erdt_max_rmid comment to "Largest RMID that is valid in
  every ERDT domain." (Reinette Chatre)
- Use kernel-doc format for enum erdt_mmio_type, and add braces around
  the multi-line if body in erdt_ioremap().

 arch/x86/kernel/cpu/resctrl/Makefile   |   2 +-
 arch/x86/kernel/cpu/resctrl/core.c     |  16 +-
 arch/x86/kernel/cpu/resctrl/erdt.c     | 274 +++++++++++++++++++++++++
 arch/x86/kernel/cpu/resctrl/internal.h |  30 +++
 4 files changed, 319 insertions(+), 3 deletions(-)
 create mode 100644 arch/x86/kernel/cpu/resctrl/erdt.c

diff --git a/arch/x86/kernel/cpu/resctrl/Makefile b/arch/x86/kernel/cpu/resctrl/Makefile
index 273ddfa30836..4f206add01a1 100644
--- a/arch/x86/kernel/cpu/resctrl/Makefile
+++ b/arch/x86/kernel/cpu/resctrl/Makefile
@@ -1,6 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0
 obj-$(CONFIG_X86_CPU_RESCTRL)		+= core.o rdtgroup.o monitor.o
-obj-$(CONFIG_X86_CPU_RESCTRL)		+= ctrlmondata.o
+obj-$(CONFIG_X86_CPU_RESCTRL)		+= ctrlmondata.o erdt.o
 obj-$(CONFIG_X86_CPU_RESCTRL_INTEL_AET)	+= intel_aet.o
 obj-$(CONFIG_RESCTRL_FS_PSEUDO_LOCK)	+= pseudo_lock.o
 
diff --git a/arch/x86/kernel/cpu/resctrl/core.c b/arch/x86/kernel/cpu/resctrl/core.c
index b5a86e5aa4e3..2b9a13be5975 100644
--- a/arch/x86/kernel/cpu/resctrl/core.c
+++ b/arch/x86/kernel/cpu/resctrl/core.c
@@ -1018,11 +1018,18 @@ static __init void check_quirks(void)
 
 static __init bool get_rdt_resources(void)
 {
+	bool ret;
+
 	snc_nodes_per_l3_cache = snc_get_config();
+	erdt_init();
 	rdt_alloc_capable = get_rdt_alloc_resources();
 	rdt_mon_capable = get_rdt_mon_resources();
 
-	return (rdt_mon_capable || rdt_alloc_capable);
+	ret = (rdt_mon_capable || rdt_alloc_capable);
+	if (!ret)
+		erdt_exit();
+
+	return ret;
 }
 
 static __init void rdt_init_res_defs_intel(void)
@@ -1144,12 +1151,15 @@ static int __init resctrl_arch_late_init(void)
 				  "x86/resctrl/cat:online:",
 				  resctrl_arch_online_cpu,
 				  resctrl_arch_offline_cpu);
-	if (state < 0)
+	if (state < 0) {
+		erdt_exit();
 		return state;
+	}
 
 	ret = resctrl_init();
 	if (ret) {
 		cpuhp_remove_state(state);
+		erdt_exit();
 		return ret;
 	}
 	rdt_online = state;
@@ -1172,6 +1182,8 @@ static void __exit resctrl_arch_exit(void)
 	cpuhp_remove_state(rdt_online);
 
 	resctrl_exit();
+
+	erdt_exit();
 }
 
 __exitcall(resctrl_arch_exit);
diff --git a/arch/x86/kernel/cpu/resctrl/erdt.c b/arch/x86/kernel/cpu/resctrl/erdt.c
new file mode 100644
index 000000000000..2bb187255630
--- /dev/null
+++ b/arch/x86/kernel/cpu/resctrl/erdt.c
@@ -0,0 +1,274 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Enhanced Resource Director Technology (ERDT)
+ *
+ * Copyright (C) 2026 Intel Corporation
+ *
+ */
+
+#define pr_fmt(fmt)     "resctrl: ERDT: " fmt
+
+#include <linux/acpi.h>
+#include <linux/overflow.h>
+#include <linux/resctrl.h>
+#include <linux/sizes.h>
+
+#include <asm/apic.h>
+
+#include "internal.h"
+
+static LIST_HEAD(domain_info_list);
+
+/* True when the ERDT ACPI table describes at least one domain with at least one CPU. */
+static bool erdt_enabled;
+
+#define ERDT_VALID_REVISION		1
+#define RMDD_FLAG_CPU_L3_DOMAIN		BIT(0)
+#define ERDT_DOMAIN_ID_UNSET		-1
+
+/* Bitmask of valid sub-tables found in the first RMDD, used to ensure all RMDDs match. */
+static u32 valid_subtbl_mask;
+
+/* Domain ID of the first RMDD that established @valid_subtbl_mask, for diagnostics. */
+static u16 first_rmdd_domain_id;
+
+/* Largest RMID that is valid in every ERDT domain. */
+static unsigned int erdt_max_rmid;
+
+static void __iomem *erdt_ioremap(resource_size_t base, u32 num_pages, const char *desc)
+{
+	void __iomem *addr;
+	unsigned long size;
+
+	if (check_mul_overflow(num_pages, SZ_4K, &size))
+		return NULL;
+
+	addr = ioremap(base, size);
+	if (!addr) {
+		pr_warn(FW_BUG "Failed to map %s at phys addr %pa (size: %u pages)\n",
+			desc, &base, num_pages);
+	}
+
+	return addr;
+}
+
+static void erdt_iounmap_domain(struct erdt_domain_info *domain)
+{
+	for (int i = 0; i < ERDT_MMIO_NUM_TYPES; i++) {
+		if (domain->base[i]) {
+			iounmap(domain->base[i]);
+			domain->base[i] = NULL;
+		}
+	}
+}
+
+static void cleanup_one_domain(struct erdt_domain_info *d)
+{
+	erdt_iounmap_domain(d);
+	kfree(d);
+}
+
+/*
+ * Save CACD information for this RMDD:
+ * convert the x2APIC IDs to CPUs and save them in a mask.
+ */
+static __init bool cacd_init(struct acpi_subtbl_hdr_16 *subtbl,
+			     struct erdt_domain_info *domain_info)
+{
+	struct acpi_erdt_cacd *cacd = (struct acpi_erdt_cacd *)subtbl;
+	unsigned int num_ids;
+	int cpu;
+
+	if (cacd->header.length < struct_size(cacd, X2APICIDS, 1)) {
+		pr_warn(FW_BUG "Invalid x2APIC ID CACD table\n");
+		return false;
+	}
+
+	num_ids = (cacd->header.length - sizeof(*cacd)) / sizeof(cacd->X2APICIDS[0]);
+
+	for (unsigned int i = 0; i < num_ids; i++) {
+		cpu = topo_lookup_cpuid(cacd->X2APICIDS[i]);
+		/* Skip CPUs not in the possible mask, e.g. excluded by nr_cpus= */
+		if (cpu < 0)
+			continue;
+
+		cpumask_set_cpu(cpu, &domain_info->cpu_mask);
+	}
+
+	return true;
+}
+
+static inline struct acpi_subtbl_hdr_16 *next_subtbl(struct acpi_subtbl_hdr_16 *subtbl)
+{
+	return (void *)subtbl + subtbl->length;
+}
+
+static inline bool subtbl_valid(void *end, struct acpi_subtbl_hdr_16 *subtbl)
+{
+	/* Ensure the header is within bounds before dereferencing it. */
+	if ((void *)subtbl + sizeof(*subtbl) > end)
+		return false;
+
+	/* A sub-table must be at least as large as its header. */
+	if (subtbl->length < sizeof(*subtbl))
+		return false;
+
+	/* The entire sub-table (including body) must fit within the parent. */
+	if ((void *)subtbl + subtbl->length > end)
+		return false;
+
+	return true;
+}
+
+static __init bool parse_rmdd_table(struct acpi_subtbl_hdr_16 *rmdd_hdr)
+{
+	struct acpi_erdt_rmdd *rmdd = (struct acpi_erdt_rmdd *)rmdd_hdr;
+	struct erdt_domain_info *domain_info;
+	struct acpi_subtbl_hdr_16 *subtbl;
+	u32 subtbl_mask = 0;
+	bool ret = false;
+
+	if (rmdd->header.length < sizeof(*rmdd)) {
+		pr_warn(FW_BUG "Invalid RMDD length %u bytes\n", rmdd->header.length);
+		return false;
+	}
+
+	/* Quietly ignore non-CPU-based L3 domains */
+	if (!(rmdd->flags & RMDD_FLAG_CPU_L3_DOMAIN))
+		return true;
+
+	domain_info = kzalloc_obj(*domain_info, GFP_KERNEL);
+	if (!domain_info)
+		return false;
+
+	domain_info->dom_id = ERDT_DOMAIN_ID_UNSET;
+
+	for (subtbl = (void *)rmdd + sizeof(*rmdd);
+	     subtbl_valid((void *)rmdd + rmdd->header.length, subtbl);
+	     subtbl = next_subtbl(subtbl)) {
+		switch (subtbl->type) {
+		/* An RMDD table has one or more CACD sub-table(s) */
+		case ACPI_ERDT_TYPE_CACD:
+			if (!cacd_init(subtbl, domain_info))
+				goto cleanup;
+
+			subtbl_mask |= BIT(ACPI_ERDT_TYPE_CACD);
+			break;
+		default:
+			break;
+		}
+	}
+
+	/* A CPU-based L3 RMDD must have at least one CACD sub-table */
+	if (!(subtbl_mask & BIT(ACPI_ERDT_TYPE_CACD))) {
+		pr_warn(FW_BUG "RMDD %u has no CACD sub-table\n", rmdd->domain_id);
+		goto cleanup;
+	}
+
+	/* Quietly skip an RMDD without any CPU, e.g. all excluded by nr_cpus= */
+	if (cpumask_empty(&domain_info->cpu_mask)) {
+		ret = true;
+		goto cleanup;
+	}
+
+	domain_info->base[ERDT_MMIO_RMDD_CREG] =
+		erdt_ioremap(rmdd->creg_base, rmdd->creg_size, "RMDD ctrl base");
+	if (!domain_info->base[ERDT_MMIO_RMDD_CREG])
+		goto cleanup;
+
+	/*
+	 * Require all RMDDs to support same set of sub-tables
+	 */
+	if (!valid_subtbl_mask) {
+		valid_subtbl_mask = subtbl_mask;
+		first_rmdd_domain_id = rmdd->domain_id;
+	} else if (subtbl_mask != valid_subtbl_mask) {
+		pr_warn(FW_BUG "RMDD %u sub-table set does not match the first RMDD %u\n",
+			rmdd->domain_id, first_rmdd_domain_id);
+		goto cleanup;
+	}
+
+	if (!rmdd->max_rmid) {
+		pr_warn(FW_BUG "Unreasonable RMDD max_rmid 0\n");
+		goto cleanup;
+	}
+
+	if (!erdt_max_rmid)
+		erdt_max_rmid = rmdd->max_rmid;
+	else
+		erdt_max_rmid = min(erdt_max_rmid, rmdd->max_rmid);
+
+	list_add(&domain_info->entry, &domain_info_list);
+
+	return true;
+
+cleanup:
+	cleanup_one_domain(domain_info);
+	return ret;
+}
+
+void erdt_exit(void)
+{
+	struct erdt_domain_info *d, *tmp;
+
+	list_for_each_entry_safe(d, tmp, &domain_info_list, entry) {
+		list_del(&d->entry);
+		cleanup_one_domain(d);
+	}
+	erdt_enabled = false;
+	valid_subtbl_mask = 0;
+	first_rmdd_domain_id = 0;
+	erdt_max_rmid = 0;
+}
+
+static __init int enumerate_erdt_table(struct acpi_table_header *table_hdr)
+{
+	struct acpi_table_erdt *erdt = (struct acpi_table_erdt *)table_hdr;
+	struct acpi_subtbl_hdr_16 *subtbl;
+
+	/*
+	 * ERDT describes monitoring resources per L3 cache domain, while SNC
+	 * splits an L3 cache into NUMA node scoped monitoring domains. The two
+	 * cannot be matched up, so leave ERDT disabled and fall back to the
+	 * MSR based interface.
+	 */
+	if (snc_nodes_per_l3_cache > 1) {
+		pr_info("ERDT not supported with Sub-NUMA Cluster enabled\n");
+		return -EINVAL;
+	}
+
+	if (erdt->header.revision != ERDT_VALID_REVISION) {
+		pr_info("Unsupported table revision %u (expected %u)\n",
+			erdt->header.revision, ERDT_VALID_REVISION);
+		return -EINVAL;
+	}
+
+	if (erdt->header.length < sizeof(*erdt)) {
+		pr_warn(FW_BUG "Invalid table length %u bytes\n", erdt->header.length);
+		return -EINVAL;
+	}
+
+	for (subtbl = (void *)erdt + sizeof(*erdt);
+	     subtbl_valid((void *)erdt + erdt->header.length, subtbl);
+	     subtbl = next_subtbl(subtbl)) {
+		if (subtbl->type == ACPI_ERDT_TYPE_RMDD &&
+		    !parse_rmdd_table(subtbl))
+			goto cleanup;
+	}
+
+	if (list_empty(&domain_info_list))
+		goto cleanup;
+
+	erdt_enabled = true;
+
+	return 0;
+
+cleanup:
+	erdt_exit();
+	return -EINVAL;
+}
+
+__init void erdt_init(void)
+{
+	acpi_table_parse(ACPI_SIG_ERDT, enumerate_erdt_table);
+}
diff --git a/arch/x86/kernel/cpu/resctrl/internal.h b/arch/x86/kernel/cpu/resctrl/internal.h
index 4436b976aedf..e081ebdbc5de 100644
--- a/arch/x86/kernel/cpu/resctrl/internal.h
+++ b/arch/x86/kernel/cpu/resctrl/internal.h
@@ -21,6 +21,33 @@
 
 #define RMID_VAL_UNAVAIL		BIT_ULL(62)
 
+/**
+ * enum erdt_mmio_type - Index into erdt_domain_info::base[] for each MMIO region
+ * @ERDT_MMIO_RMDD_CREG: RMDD control register base address
+ * @ERDT_MMIO_LAST: Last MMIO region type
+ */
+enum erdt_mmio_type {
+	ERDT_MMIO_RMDD_CREG,
+	ERDT_MMIO_LAST = ERDT_MMIO_RMDD_CREG
+};
+
+#define ERDT_MMIO_NUM_TYPES	(ERDT_MMIO_LAST + 1)
+
+/**
+ * struct erdt_domain_info - L3 domain ERDT information
+ * @base:	Array of ioremapped MMIO region base addresses, indexed by ERDT_MMIO_*
+ * @cpu_mask:	CPUs belonging to this resource management domain
+ * @dom_id:	L3 cache ID shared by all CPUs in this domain
+ *		(ERDT_DOMAIN_ID_UNSET if unset)
+ * @entry:	Links into the global domain_info_list
+ */
+struct erdt_domain_info {
+	void __iomem		*base[ERDT_MMIO_NUM_TYPES];
+	struct cpumask		cpu_mask;
+	int			dom_id;
+	struct list_head	entry;
+};
+
 /*
  * With the above fields in use 62 bits remain in MSR_IA32_QM_CTR for
  * data to be returned. The counter width is discovered from the hardware
@@ -256,4 +283,7 @@ static inline void intel_aet_mon_domain_setup(int cpu, int id, struct rdt_resour
 static inline bool intel_handle_aet_option(bool force_off, char *tok) { return false; }
 #endif
 
+void erdt_init(void);
+void erdt_exit(void);
+
 #endif /* _ASM_X86_RESCTRL_INTERNAL_H */
-- 
2.25.1

