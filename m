Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD1EF35BDC2
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 03:09:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791947346; cv=none; b=XS5+Es+A65C/bBnj6LyMg33OzVqo9oZqfz+O4dlCAKeFDPIFAa0vemw5T69odhGIbi+tYNO1hBcUbnFjWPwRCBD30PZNIUMgZIYbDw9tP3KV+EOKcwyLP1qSbqal3sXCTk6pOikm6UJwecfamnE5XASlqX6i8ITvwYHWd46bQEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791947346; c=relaxed/simple;
	bh=jAseg4k7AidkxbD+Mo4TIToLzdcv/tpNQFbyg9IiJ2A=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=TapBhvgksuOHXKaJCDfGwo5NaQpYXhW/3qTfokcVl9+dBH8mm0MTlg2C/lFix/InY3mi+qYYA9JDsgEX7ZIeun1VLkXpEuwegLQcEhZLJ1A8r9meRYFbmUuNBHWyWCbQIyieHMfsQxbzTrd7gL97/ZV2gCwcIoCFmHgTntB+70s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=H+a+a+XT; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="H+a+a+XT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791947343; x=1823483343;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=jAseg4k7AidkxbD+Mo4TIToLzdcv/tpNQFbyg9IiJ2A=;
  b=H+a+a+XTrPhPBNZ5xN1uaLeWfB/+IeuEkt94/RKlsTQMI+fstaLnc23q
   316Q1LFR6dgwHAIHzk62eI3kaSDJPqKSqW6xXq1NDRWl3/OEKhvo1ZR23
   1hBvNTHvusZU/mjpih5H5oEWdlprfbZv3K7YFQZ2wgK8P4LBTSgFInPgt
   IX3N7+RLVlIkSZ3pQRVkGC0U1Hvsubx0axI6wFVCRR9CcDcXyzKA0SVMB
   za8TviG/9tIqLNSxuMav5W/SokfWI/khSTen2qYVFmhCSNBFHM3h6LXI8
   QYfkMK943/wdoksaMJlNCJBovOX6CaWqIBOxgZDA5tpyt8Jf24Vr/38aW
   Q==;
X-CSE-ConnectionGUID: +cijnWs7SQy1XaSqPu1Vlw==
X-CSE-MsgGUID: crl+EyXURVGD2W70sp8YNQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11934"; a="589199"
X-IronPort-AV: E=Sophos;i="6.27,156,1787036400"; 
   d="scan'208";a="589199"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2026 20:09:03 -0700
X-CSE-ConnectionGUID: OWCtEmScTtWQd80wkNJahg==
X-CSE-MsgGUID: 4VvtAd7eRJS/7Y52iLu4HA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,156,1787036400"; 
   d="scan'208";a="1414395"
Received: from chenyu-dev.sh.intel.com ([10.239.62.107])
  by fmviesa005.fm.intel.com with ESMTP; 13 Oct 2026 20:08:59 -0700
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
	Anil S Keshavamurthy <anil.s.keshavamurthy@intel.com>,
	Hongyu Ning <hongyu.ning@linux.intel.com>
Subject: [PATCH v9 03/12] x86/resctrl: Parse ACPI ERDT table and save CACD cpumask per RMD
Date: Wed, 14 Oct 2026 10:58:35 +0800
Message-Id: <90f0d5e1139e6767ebce4ca78eca871ce48c7315.1791933001.git.yu.c.chen@intel.com>
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

Enhanced RDT (ERDT) exposes per-domain MMIO registers that resctrl needs
in order to read hardware monitoring counters on the upcoming MMIO-based
path. The kernel discovers this hardware through a single per-platform
ERDT ACPI table.

Each Resource Management Domain Description (RMDD) sub-table within the
ERDT table represents one resource management domain (RMD). When
RMDD_FLAG_CPU_L3_DOMAIN is set, it identifies the domain as a CPU-scoped
L3 domain. The MMIO base of the domain's CMT counters is carried by the
RMDD's Cache Monitoring Registers for CPU Agents Description (CMRC)
sub-table. The set of CPUs in the domain is listed by x2APIC ID in the
CPU Agent Collection Description (CACD) sub-table.

The hierarchy of these ACPI tables is illustrated below:

  +---------------------------------------------------------------+
  | ERDT  (one instance per platform)                             |
  |                                                               |
  |   +-------------------------------------------------------+   |
  |   | RMDD #0                                               |   |
  |   |   domain_id, max_rmid                                 |   |
  |   |                                                       |   |
  |   |   +-----------------------------------------------+   |   |
  |   |   | CACD                                          |   |   |
  |   |   |   domain_id, x2APIC ID[0], x2APIC ID[1], ...  |   |   |
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

Walk the ERDT table's RMDD sub-tables in preparation for attaching each
ERDT domain to a resctrl L3 domain. For each CPU-based L3 RMDD,
ioremap its control-register region, walk its CACD entries,
translate each x2APIC ID to a logical CPU, and record the result on the
ERDT domain's erdt_domain_info. Record the largest RMID that is valid
on every RMD so a later reader cannot access an RMID that is
unsupported on some domain, and require every RMDD to advertise the
same set of sub-table types so downstream code can rely on a uniform
shape.

Originally-by: Anil S Keshavamurthy <anil.s.keshavamurthy@intel.com>
Suggested-by: Tony Luck <tony.luck@intel.com>
Suggested-by: Reinette Chatre <reinette.chatre@intel.com>
Signed-off-by: Chen Yu <yu.c.chen@intel.com>
Tested-by: Hongyu Ning <hongyu.ning@linux.intel.com>
---
Changes since v8:
- Rename the subject from "... save CACD cpumask for RMDD domains" to
  "... save CACD cpumask per RMD". (Reinette Chatre)
- Rewrite the changelog to lead with the motivation, drop the duplicated
  first paragraph, and add a diagram of the ERDT/RMDD/CACD hierarchy.
  (Reinette Chatre)
- Replace "Based on original work from Anil S Keshavamurthy" with an
  Originally-by: tag. (Reinette Chatre)
- Keep the CONFIG_X86_CPU_RESCTRL entries grouped together in the
  Makefile. (Reinette Chatre)
- Rename the local "succeed" to "ret" in get_rdt_resources() to match
  the surrounding style. (Reinette Chatre)
- Make erdt_init() return void because its return value was ignored, and
  place __init before the return type. (Reinette Chatre)
- Move the "ERDT: " prefix into pr_fmt() and drop it from the individual
  messages. (Reinette Chatre)
- Rename ERDT_VALID_VERSION to ERDT_VALID_REVISION to match the ACPI
  header field it is compared against. (Reinette Chatre)
- Add ERDT_DOMAIN_ID_UNSET instead of the open coded -1. (Reinette Chatre)
- Make cacd_init() return bool instead of errno values that no caller
  consumed. (Reinette Chatre)
- Do not discard the whole ERDT table when a CACD x2APIC ID has no
  logical CPU, for example when the possible CPU mask is limited by
  nr_cpus=. Skip such a CPU instead. (sashiko, Reinette Chatre)
- Drop rmdd_subtbl() and open code the sub-table walk to match the style
  of enumerate_erdt_table(). (Reinette Chatre)
- Drop the always-zero argument from the RMDD max_rmid FW_BUG message.
  (Reinette Chatre)
- Comments: use the grep friendly "max_rmid", upper case the RMID
  acronym, and describe struct erdt_domain_info as "L3 domain ERDT
  information". (Reinette Chatre)

 arch/x86/kernel/cpu/resctrl/Makefile   |   1 +
 arch/x86/kernel/cpu/resctrl/core.c     |  16 +-
 arch/x86/kernel/cpu/resctrl/erdt.c     | 255 +++++++++++++++++++++++++
 arch/x86/kernel/cpu/resctrl/internal.h |  29 +++
 4 files changed, 299 insertions(+), 2 deletions(-)
 create mode 100644 arch/x86/kernel/cpu/resctrl/erdt.c

diff --git a/arch/x86/kernel/cpu/resctrl/Makefile b/arch/x86/kernel/cpu/resctrl/Makefile
index 273ddfa30836..a975c73e273e 100644
--- a/arch/x86/kernel/cpu/resctrl/Makefile
+++ b/arch/x86/kernel/cpu/resctrl/Makefile
@@ -1,6 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0
 obj-$(CONFIG_X86_CPU_RESCTRL)		+= core.o rdtgroup.o monitor.o
 obj-$(CONFIG_X86_CPU_RESCTRL)		+= ctrlmondata.o
+obj-$(CONFIG_X86_CPU_RESCTRL)		+= erdt.o
 obj-$(CONFIG_X86_CPU_RESCTRL_INTEL_AET)	+= intel_aet.o
 obj-$(CONFIG_RESCTRL_FS_PSEUDO_LOCK)	+= pseudo_lock.o
 
diff --git a/arch/x86/kernel/cpu/resctrl/core.c b/arch/x86/kernel/cpu/resctrl/core.c
index 55214d6fdc49..7fadfebb5312 100644
--- a/arch/x86/kernel/cpu/resctrl/core.c
+++ b/arch/x86/kernel/cpu/resctrl/core.c
@@ -1016,10 +1016,17 @@ static __init void check_quirks(void)
 
 static __init bool get_rdt_resources(void)
 {
+	bool ret;
+
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
@@ -1141,12 +1148,15 @@ static int __init resctrl_arch_late_init(void)
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
@@ -1169,6 +1179,8 @@ static void __exit resctrl_arch_exit(void)
 	cpuhp_remove_state(rdt_online);
 
 	resctrl_exit();
+
+	erdt_exit();
 }
 
 __exitcall(resctrl_arch_exit);
diff --git a/arch/x86/kernel/cpu/resctrl/erdt.c b/arch/x86/kernel/cpu/resctrl/erdt.c
new file mode 100644
index 000000000000..eb5e262e243a
--- /dev/null
+++ b/arch/x86/kernel/cpu/resctrl/erdt.c
@@ -0,0 +1,255 @@
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
+/*
+ * The minimal max_rmid of different domains. Using minimal is to avoid the domain with
+ * small RMID accessing an invalid RMID.
+ */
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
+	if (!addr)
+		pr_warn(FW_BUG "Failed to map %s at phys addr %pa (size: %u pages)\n",
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
+	domain_info->base[ERDT_MMIO_RMDD_CREG] =
+		erdt_ioremap(rmdd->creg_base, rmdd->creg_size, "RMDD ctrl base");
+	if (!domain_info->base[ERDT_MMIO_RMDD_CREG])
+		goto cleanup;
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
index e3cfa0c10e92..e2f3b884847c 100644
--- a/arch/x86/kernel/cpu/resctrl/internal.h
+++ b/arch/x86/kernel/cpu/resctrl/internal.h
@@ -21,6 +21,32 @@
 
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
@@ -253,4 +279,7 @@ static inline void intel_aet_mon_domain_setup(int cpu, int id, struct rdt_resour
 static inline bool intel_handle_aet_option(bool force_off, char *tok) { return false; }
 #endif
 
+void erdt_init(void);
+void erdt_exit(void);
+
 #endif /* _ASM_X86_RESCTRL_INTERNAL_H */
-- 
2.43.0

