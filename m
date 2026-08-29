Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D38413603D7
	for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 06:08:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787983694; cv=none; b=hh8z0jKQiuzplkACI1VfWkojXEauL+uhPeu3/KGIxKqwrZPqnfjHd/2nw/NjI9gbP9KlUczV6htFrnRbgEp/dVkLqiRHrpMvleQU4WC4kaYh2oASDPSF9oD7NjqxjdA9omUdsLVUYEflGmqPbNhHh+GCL4VlxP5nIj/FuTJrQt8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787983694; c=relaxed/simple;
	bh=WZ8/oqMe+E7vGEptXhGDxg2FWezMNFjXanxYcRGkv2Q=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=dmINfy2Y5xw8Zbh1JCgYdqI3kQS0d0x1sFUIqNvWrC+3PpEWAsaoWRowvwVIouV5r9kiaSwsQXsGpJGK+7WRMsTyGrHr8QpqVFP87jRU0L1XG/1dZ4j0x8DjF0pzUTYebXcnMLjvU1FhKbFalkEMdWoy1dZ6upjjuIO7k0lIsso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PLeonE2D; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PLeonE2D"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787983693; x=1819519693;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=WZ8/oqMe+E7vGEptXhGDxg2FWezMNFjXanxYcRGkv2Q=;
  b=PLeonE2DSKpztHBQsXVXlc+VlWozA6aRAe48qke2a3lgm9CABviOkOAi
   kmWNooY+NB+cXr1zr9Ebq1FxxFc+RIzg1jUE81I9sGrDmpBfVtiiwTiLk
   jpXEIx+N1+/MQYH9sd11qxbSdntC0zM/Y0zEFFDVpG9z6JATWfnweN90b
   nHvyMB1T3ozflTA875myMH5FNIBI9Y90S9uy6UpHKpAQhIQij6X45SOZ8
   4wRDUkJa5lB0YHkr5pyKWIL+PtNOuiYGENyAWqaeH88guN4V8cD+eGhJX
   yx0KeLHsfOIgfI/N5ENufPW/13aBdwmOOmVPjnjjrbtObRCIC0TCr/myv
   w==;
X-CSE-ConnectionGUID: suynnRGNRwWpc3Tvc1v+6w==
X-CSE-MsgGUID: wSEREgz0QY2nrDiNkCW2wg==
X-IronPort-AV: E=McAfee;i="6800,10657,11889"; a="88685902"
X-IronPort-AV: E=Sophos;i="6.25,250,1779174000"; 
   d="scan'208";a="88685902"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2026 23:08:13 -0700
X-CSE-ConnectionGUID: dqRyPX2ASZy4ttjCDWq6PA==
X-CSE-MsgGUID: dyRWYRilQI2KFaWLLe5LjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,250,1779174000"; 
   d="scan'208";a="266543583"
Received: from chenyu-dev.sh.intel.com ([10.239.62.107])
  by orviesa006.jf.intel.com with ESMTP; 28 Aug 2026 23:08:09 -0700
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
Subject: [PATCH v7 3/9] x86/resctrl: Parse ACPI ERDT table and save CACD cpumask for RMDD domains
Date: Sat, 29 Aug 2026 13:57:43 +0800
Message-Id: <1505a5e5cdea9424e7760ef440d95b8938844a7d.1787976868.git.yu.c.chen@intel.com>
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

There is one Enhanced RDT (ERDT) ACPI table per platform. Each Resource
Management Domain Description (RMDD) sub-table within it describes one resource
management domain (RMD), also known as an L3 domain, and carries MMIO base
information for monitoring support. The CPU agents within the scope of an RMDD
are enumerated by their x2APIC IDs in a nested CPU Agent Collection Description
(CACD) sub-table.

Parse the RMDD sub-tables within the ERDT ACPI table and their nested CACD
entries to construct per-domain CPU masks.

For each RMDD, parse the associated CACD, map its x2APIC IDs to logical CPUs,
and save the resulting CPU mask. Associate every ERDT domain with the CPUs that
belong to it to prepare for attaching ERDT data to resctrl monitoring domains.

Based on original work from Anil S Keshavamurthy.

Suggested-by: Tony Luck <tony.luck@intel.com>
Suggested-by: Reinette Chatre <reinette.chatre@intel.com>
Signed-off-by: Chen Yu <yu.c.chen@intel.com>
Tested-by: Hongyu Ning <hongyu.ning@linux.intel.com>
---
v6->v7:
    Let get_rdt_resources() clean up its own state on failure and drop
    the asymmetric __resctrl_arch_late_init() wrapper. (Reinette Chatre)
    Make erdt_max_rmid and num_ids unsigned, add an explanatory comment
    and use a plain min(). (Reinette Chatre)
    Reset erdt_max_rmid in erdt_exit(). (Reinette Chatre)
    Match erdt_ioremap() argument types to ioremap() by using
    resource_size_t. (Reinette Chatre)
    Initialise rmdd at declaration and check its length via
    header.length. (Reinette Chatre)
    Use a for() loop instead of while() for the table parsing, for
    consistency. (Reinette Chatre)
    Use sizeof(*erdt) instead of sizeof(struct ...) and align pr_warn()
    to the open parenthesis. (Reinette Chatre)
---
 arch/x86/kernel/cpu/resctrl/Makefile   |   1 +
 arch/x86/kernel/cpu/resctrl/core.c     |  16 +-
 arch/x86/kernel/cpu/resctrl/erdt.c     | 266 +++++++++++++++++++++++++
 arch/x86/kernel/cpu/resctrl/internal.h |  31 +++
 4 files changed, 312 insertions(+), 2 deletions(-)
 create mode 100644 arch/x86/kernel/cpu/resctrl/erdt.c

diff --git a/arch/x86/kernel/cpu/resctrl/Makefile b/arch/x86/kernel/cpu/resctrl/Makefile
index 273ddfa30836..2216ee084832 100644
--- a/arch/x86/kernel/cpu/resctrl/Makefile
+++ b/arch/x86/kernel/cpu/resctrl/Makefile
@@ -2,6 +2,7 @@
 obj-$(CONFIG_X86_CPU_RESCTRL)		+= core.o rdtgroup.o monitor.o
 obj-$(CONFIG_X86_CPU_RESCTRL)		+= ctrlmondata.o
 obj-$(CONFIG_X86_CPU_RESCTRL_INTEL_AET)	+= intel_aet.o
+obj-$(CONFIG_X86_CPU_RESCTRL)		+= erdt.o
 obj-$(CONFIG_RESCTRL_FS_PSEUDO_LOCK)	+= pseudo_lock.o
 
 # To allow define_trace.h's recursive include:
diff --git a/arch/x86/kernel/cpu/resctrl/core.c b/arch/x86/kernel/cpu/resctrl/core.c
index 9c01d2562b7a..30a0bc1c8d8d 100644
--- a/arch/x86/kernel/cpu/resctrl/core.c
+++ b/arch/x86/kernel/cpu/resctrl/core.c
@@ -1013,10 +1013,17 @@ static __init void check_quirks(void)
 
 static __init bool get_rdt_resources(void)
 {
+	bool succeed;
+
+	erdt_init();
 	rdt_alloc_capable = get_rdt_alloc_resources();
 	rdt_mon_capable = get_rdt_mon_resources();
 
-	return (rdt_mon_capable || rdt_alloc_capable);
+	succeed = (rdt_mon_capable || rdt_alloc_capable);
+	if (!succeed)
+		erdt_exit();
+
+	return succeed;
 }
 
 static __init void rdt_init_res_defs_intel(void)
@@ -1138,12 +1145,15 @@ static int __init resctrl_arch_late_init(void)
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
@@ -1166,6 +1176,8 @@ static void __exit resctrl_arch_exit(void)
 	cpuhp_remove_state(rdt_online);
 
 	resctrl_exit();
+
+	erdt_exit();
 }
 
 __exitcall(resctrl_arch_exit);
diff --git a/arch/x86/kernel/cpu/resctrl/erdt.c b/arch/x86/kernel/cpu/resctrl/erdt.c
new file mode 100644
index 000000000000..cdc53640ede2
--- /dev/null
+++ b/arch/x86/kernel/cpu/resctrl/erdt.c
@@ -0,0 +1,266 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Enhanced Resource Director Technology (ERDT)
+ *
+ * Copyright (C) 2026 Intel Corporation
+ *
+ */
+
+#define pr_fmt(fmt)     "resctrl: " fmt
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
+#define ERDT_VALID_VERSION		1
+#define RMDD_FLAG_CPU_L3_DOMAIN		BIT(0)
+
+/* Bitmask of valid sub-tables found in the first RMDD, used to ensure all RMDDs match. */
+static u32 valid_subtbl_mask;
+
+/* Domain ID of the first RMDD that established @valid_subtbl_mask, for diagnostics. */
+static u16 first_rmdd_domain_id;
+
+/*
+ * The minimal max-rmid of different domains. Using minimal is to avoid the domain with
+ * small rmid accessing an invalid rmid.
+ */
+static unsigned int erdt_max_rmid;
+
+unsigned int erdt_get_max_rmid(void)
+{
+	return erdt_max_rmid;
+}
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
+	if (!addr)
+		pr_warn(FW_BUG "ERDT: Failed to map %s at phys addr %pa (size: %u pages)\n",
+			desc, &base, num_pages);
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
+ * convert the X2APIC to CPU and save them in a mask.
+ */
+static __init int cacd_init(struct acpi_subtbl_hdr_16 *subtbl,
+			    struct erdt_domain_info *domain_info)
+{
+	struct acpi_erdt_cacd *cacd = (struct acpi_erdt_cacd *)subtbl;
+	unsigned int num_ids;
+	int cpu;
+
+	if (cacd->header.length < struct_size(cacd, X2APICIDS, 1)) {
+		pr_warn(FW_BUG "Invalid x2apicid CACD table\n");
+		return -EIO;
+	}
+
+	num_ids = (cacd->header.length - sizeof(*cacd)) / sizeof(cacd->X2APICIDS[0]);
+
+	for (unsigned int i = 0; i < num_ids; i++) {
+		cpu = topo_lookup_cpuid(cacd->X2APICIDS[i]);
+		if (cpu < 0) {
+			pr_warn(FW_BUG "Unknown x2apicid 0x%x\n", cacd->X2APICIDS[i]);
+			return -EIO;
+		}
+
+		cpumask_set_cpu(cpu, &domain_info->cpu_mask);
+	}
+
+	return 0;
+}
+
+static inline struct acpi_subtbl_hdr_16 *rmdd_subtbl(struct acpi_erdt_rmdd *rmdd)
+{
+	return (void *)rmdd + sizeof(*rmdd);
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
+	domain_info->dom_id = -1;
+
+	domain_info->base[ERDT_MMIO_RMDD_CREG] =
+		erdt_ioremap(rmdd->creg_base, rmdd->creg_size, "RMDD ctrl base");
+	if (!domain_info->base[ERDT_MMIO_RMDD_CREG])
+		goto cleanup;
+
+	for (subtbl = rmdd_subtbl(rmdd);
+	     subtbl_valid((void *)rmdd + rmdd->header.length, subtbl);
+	     subtbl = next_subtbl(subtbl)) {
+		switch (subtbl->type) {
+		/* An RMDD table has one or more CACD sub-table(s) */
+		case ACPI_ERDT_TYPE_CACD:
+			if (cacd_init(subtbl, domain_info))
+				goto cleanup;
+
+			subtbl_mask |= BIT(ACPI_ERDT_TYPE_CACD);
+			break;
+		default:
+			break;
+		}
+	}
+
+	if (!subtbl_mask)
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
+		pr_warn(FW_BUG "Unreasonable RMDD max_rmid %u\n", rmdd->max_rmid);
+		goto cleanup;
+	}
+	domain_info->max_rmid = rmdd->max_rmid;
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
+	return false;
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
+	if (erdt->header.revision != ERDT_VALID_VERSION) {
+		pr_info("Unsupported ERDT table revision %u (expected %u)\n",
+			erdt->header.revision, ERDT_VALID_VERSION);
+		return -EINVAL;
+	}
+
+	if (erdt->header.length < sizeof(*erdt)) {
+		pr_warn(FW_BUG "ERDT: Invalid table length %u bytes\n", erdt->header.length);
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
+int __init erdt_init(void)
+{
+	return acpi_table_parse(ACPI_SIG_ERDT, enumerate_erdt_table);
+}
diff --git a/arch/x86/kernel/cpu/resctrl/internal.h b/arch/x86/kernel/cpu/resctrl/internal.h
index e3cfa0c10e92..d5b05b5e1517 100644
--- a/arch/x86/kernel/cpu/resctrl/internal.h
+++ b/arch/x86/kernel/cpu/resctrl/internal.h
@@ -21,6 +21,33 @@
 
 #define RMID_VAL_UNAVAIL		BIT_ULL(62)
 
+/*
+ * Index into erdt_domain_info::base[] for each MMIO region.
+ * @ERDT_MMIO_RMDD_CREG: RMDD control register base address
+ */
+enum erdt_mmio_type {
+	ERDT_MMIO_RMDD_CREG,
+	ERDT_MMIO_LAST = ERDT_MMIO_RMDD_CREG
+};
+
+#define ERDT_MMIO_NUM_TYPES	(ERDT_MMIO_LAST + 1)
+
+/**
+ * struct erdt_domain_info - Per-domain ERDT information
+ * @base:	Array of ioremapped MMIO region base addresses, indexed by ERDT_MMIO_*
+ * @cpu_mask:	CPUs belonging to this resource management domain
+ * @max_rmid:	Maximum RMID supported by this domain
+ * @dom_id:	L3 cache ID shared by all CPUs in this domain (-1 if unset)
+ * @entry:	Links into the global domain_info_list
+ */
+struct erdt_domain_info {
+	void __iomem		*base[ERDT_MMIO_NUM_TYPES];
+	struct cpumask		cpu_mask;
+	u32			max_rmid;
+	int			dom_id;
+	struct list_head	entry;
+};
+
 /*
  * With the above fields in use 62 bits remain in MSR_IA32_QM_CTR for
  * data to be returned. The counter width is discovered from the hardware
@@ -253,4 +280,8 @@ static inline void intel_aet_mon_domain_setup(int cpu, int id, struct rdt_resour
 static inline bool intel_handle_aet_option(bool force_off, char *tok) { return false; }
 #endif
 
+unsigned int erdt_get_max_rmid(void);
+int erdt_init(void);
+void erdt_exit(void);
+
 #endif /* _ASM_X86_RESCTRL_INTERNAL_H */
-- 
2.25.1

