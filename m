Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F97E35BDC2
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 03:09:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791947399; cv=none; b=N7ireGu6bWf7mZmUsi4ELqMWiKFMmHAHz6ZIFw/019bOZzVLkw1VUnlvXz2MqVS94PRTE88LE0sGbRoqocM/DMvIgIy55ghgF3+3QW8lY8rZH3jXk2wVVRnvSa+C7MJ8YM+qkju8W4sDlqE6diYf7LcZdFiKBtcjfwilBJCQowU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791947399; c=relaxed/simple;
	bh=gXcuc6fLIGa3mzqBlXDGYjjNMizcweQa3BVjXElHuS0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=h+UXGYZR2CQBq8O62aR69EL5h2AqXxMbZ+kThHvl69lAKULxfkZ/IslB/QPJxeo0LDl3BIeW3FChPBiY9DbGGcJfA+OVRSvJ2x8aTgbIFBeREhHk3pOefXk51tbq0aNfjzzsq52z0lHvXcCPH8ur+wfU3blMuEieG7ELCQAyoYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PtqgmZRc; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PtqgmZRc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791947398; x=1823483398;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=gXcuc6fLIGa3mzqBlXDGYjjNMizcweQa3BVjXElHuS0=;
  b=PtqgmZRcKLKISco22mOHt+d6vkdKI4I5yEZIjLLLi0bwLLauLGN5JBHq
   c4UsWk6MeUi+UAPZfpS7Dh7JCU2jMxIh7TYGiBU9mlIFlDU+BUMyPtVlP
   cOAZ84IUwsf5V/HEUm13+QdDLyIcpUC0emOMH7qI+pysPwVpANmmS0lv0
   cjXCz6i+H77I3iFtuMPqYvnbQvsv72Y7Ps2LgIdyOmdsaEJthlwAeluDb
   3LXT3FZ0G0Ba404ijvUOHt5URFOBo6TB5GA+DW4ygvFSn0oQnDfO+9RDz
   bHsf8QBocc0Cg88MzdCCzjpyYB066/4tOCa/Vcy82rBWLk1K4USNg087O
   g==;
X-CSE-ConnectionGUID: zaFjJ7qlQaySyHK6lvzGnw==
X-CSE-MsgGUID: kOr+NlCAQ7+qCm8htmo66g==
X-IronPort-AV: E=McAfee;i="6800,10657,11934"; a="562695"
X-IronPort-AV: E=Sophos;i="6.27,156,1787036400"; 
   d="scan'208";a="562695"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2026 20:09:57 -0700
X-CSE-ConnectionGUID: 0LpMuUDYSyaL6BdkpDdiXg==
X-CSE-MsgGUID: DBqRijN3SHylQ8uNeL2Wiw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,156,1787036400"; 
   d="scan'208";a="1283612"
Received: from chenyu-dev.sh.intel.com ([10.239.62.107])
  by orviesa001.jf.intel.com with ESMTP; 13 Oct 2026 20:09:55 -0700
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
Subject: [PATCH v9 08/12] x86/resctrl: Parse ACPI CMRC table
Date: Wed, 14 Oct 2026 10:59:30 +0800
Message-Id: <d867c73d60f3ce712c32027a7378596ef544027c.1791933001.git.yu.c.chen@intel.com>
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

The CMRC (Cache Monitoring Registers for CPU Agents Description) sub-table of
ERDT describes the MMIO registers used to read cache monitoring counters (e.g.
LLC occupancy) for a monitoring domain.

Parse each CMRC sub-table, ioremap its register window, and save a copy of the
CMRC table in the corresponding ERDT domain entry so that monitoring code can
read the counters via MMIO.

Suggested-by: Tony Luck <tony.luck@intel.com>
Signed-off-by: Chen Yu <yu.c.chen@intel.com>
Tested-by: Hongyu Ning <hongyu.ning@linux.intel.com>
---
Changes since v8:
- Split the introduction of erdt_scale/erdt_get_scale() out into
  "x86/resctrl: Add a global ERDT monitor scale". (Reinette Chatre)
- Make cmrc_init() return bool instead of errno values that no caller
  consumed. (Reinette Chatre)
- Use one consistent comment style for the RMDD sub-table cases: a
  single line comment above each "case" label. (Reinette Chatre)

 arch/x86/kernel/cpu/resctrl/erdt.c     | 53 ++++++++++++++++++++++++++
 arch/x86/kernel/cpu/resctrl/internal.h |  6 ++-
 2 files changed, 58 insertions(+), 1 deletion(-)

diff --git a/arch/x86/kernel/cpu/resctrl/erdt.c b/arch/x86/kernel/cpu/resctrl/erdt.c
index 09072e478bde..1e6cfc6dbc38 100644
--- a/arch/x86/kernel/cpu/resctrl/erdt.c
+++ b/arch/x86/kernel/cpu/resctrl/erdt.c
@@ -23,6 +23,7 @@ static LIST_HEAD(domain_info_list);
 static bool erdt_enabled;
 
 #define ERDT_VALID_REVISION		1
+#define CMRC_SUPPORTED_INDEX_FN		1
 #define RMDD_FLAG_CPU_L3_DOMAIN		BIT(0)
 #define ERDT_DOMAIN_ID_UNSET		-1
 
@@ -83,6 +84,7 @@ static void erdt_iounmap_domain(struct erdt_domain_info *domain)
 static void cleanup_one_domain(struct erdt_domain_info *d)
 {
 	erdt_iounmap_domain(d);
+	kfree(d->cmrc);
 	kfree(d);
 }
 
@@ -116,6 +118,47 @@ static __init bool cacd_init(struct acpi_subtbl_hdr_16 *subtbl,
 	return true;
 }
 
+static __init bool cmrc_init(struct acpi_subtbl_hdr_16 *subtbl,
+			     struct erdt_domain_info *domain_info)
+{
+	struct acpi_erdt_cmrc *cmrc = (struct acpi_erdt_cmrc *)subtbl;
+
+	if (cmrc->header.length < sizeof(*cmrc)) {
+		pr_warn(FW_BUG "Truncated CMRC sub-table\n");
+		return false;
+	}
+
+	if (cmrc->index_fn != CMRC_SUPPORTED_INDEX_FN) {
+		pr_info("Unsupported CMRC index function %u\n", cmrc->index_fn);
+		return false;
+	}
+
+	if (!cmrc->clump_size) {
+		pr_warn(FW_BUG "CMRC clump_size is zero\n");
+		return false;
+	}
+
+	/* resctrl scales monitoring values with an unsigned int. */
+	if (cmrc->up_scale > UINT_MAX) {
+		pr_warn(FW_BUG "Insane CMRC up_scale value 0x%llx\n", cmrc->up_scale);
+		return false;
+	}
+
+	domain_info->base[ERDT_MMIO_CMRC_BASE] =
+		erdt_ioremap(cmrc->cmt_reg_base, cmrc->cmt_reg_size, "CMRC base");
+	if (!domain_info->base[ERDT_MMIO_CMRC_BASE])
+		return false;
+
+	domain_info->cmrc = kmemdup(cmrc, cmrc->header.length, GFP_KERNEL);
+	if (!domain_info->cmrc) {
+		iounmap(domain_info->base[ERDT_MMIO_CMRC_BASE]);
+		domain_info->base[ERDT_MMIO_CMRC_BASE] = NULL;
+		return false;
+	}
+
+	return true;
+}
+
 static inline struct acpi_subtbl_hdr_16 *next_subtbl(struct acpi_subtbl_hdr_16 *subtbl)
 {
 	return (void *)subtbl + subtbl->length;
@@ -176,6 +219,16 @@ static __init bool parse_rmdd_table(struct acpi_subtbl_hdr_16 *rmdd_hdr)
 
 			subtbl_mask |= BIT(ACPI_ERDT_TYPE_CACD);
 			break;
+		/* An RMDD table supports at most one CMRC sub-table */
+		case ACPI_ERDT_TYPE_CMRC:
+			if (subtbl_mask & BIT(ACPI_ERDT_TYPE_CMRC))
+				break;
+
+			if (!cmrc_init(subtbl, domain_info))
+				goto cleanup;
+
+			subtbl_mask |= BIT(ACPI_ERDT_TYPE_CMRC);
+			break;
 		default:
 			break;
 		}
diff --git a/arch/x86/kernel/cpu/resctrl/internal.h b/arch/x86/kernel/cpu/resctrl/internal.h
index 75dd4736937d..0de174df26e9 100644
--- a/arch/x86/kernel/cpu/resctrl/internal.h
+++ b/arch/x86/kernel/cpu/resctrl/internal.h
@@ -24,10 +24,12 @@
 /*
  * Index into erdt_domain_info::base[] for each MMIO region.
  * @ERDT_MMIO_RMDD_CREG: RMDD control register base address
+ * @ERDT_MMIO_CMRC_BASE: CMRC monitoring register base address
  */
 enum erdt_mmio_type {
 	ERDT_MMIO_RMDD_CREG,
-	ERDT_MMIO_LAST = ERDT_MMIO_RMDD_CREG
+	ERDT_MMIO_CMRC_BASE,
+	ERDT_MMIO_LAST = ERDT_MMIO_CMRC_BASE
 };
 
 #define ERDT_MMIO_NUM_TYPES	(ERDT_MMIO_LAST + 1)
@@ -35,6 +37,7 @@ enum erdt_mmio_type {
 /**
  * struct erdt_domain_info - L3 domain ERDT information
  * @base:	Array of ioremapped MMIO region base addresses, indexed by ERDT_MMIO_*
+ * @cmrc:	Copy of the ACPI CMRC sub-table for this domain
  * @cpu_mask:	CPUs belonging to this resource management domain
  * @dom_id:	L3 cache ID shared by all CPUs in this domain
  *		(ERDT_DOMAIN_ID_UNSET if unset)
@@ -42,6 +45,7 @@ enum erdt_mmio_type {
  */
 struct erdt_domain_info {
 	void __iomem		*base[ERDT_MMIO_NUM_TYPES];
+	struct acpi_erdt_cmrc	*cmrc;
 	struct cpumask		cpu_mask;
 	int			dom_id;
 	struct list_head	entry;
-- 
2.43.0

