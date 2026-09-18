Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B062379EC1
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 05:00:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789707660; cv=none; b=gd8NCEE7rcFO5HaBG5RXE5H3A/a19uRTnx99omMkHPsCa0nWCZKJfoQZ7OAYICcVkwAnAxjTt1S1g9KHOG5pULnlcIPFuC14qu3dN8sjlZ7qfWlTX/Lr8u4VinIgx2a+J3987KbLENaPaJetpKApuQvv984bq8dvstBTAVA8+nM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789707660; c=relaxed/simple;
	bh=EvTSYSAw1pZwy4SODPFNStgvITm06LetBqNDGk7GQ0M=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=PFJJ7RkFQOEprNSKPfMiKHZ9BqTuG0Z9ZSKyXcSo2h9EXAWRH7iFfCcs1jUd+XT/ZGAJyvNupao0euSz7aWG1MgMBpyR3YxunexyZzFTj8WnVRU4s8z7XQfti8WmyZijIww7/hysca3js2icWBLjhMTAryjMn472Gqm4oBOYokw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=T9ayVUi5; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="T9ayVUi5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789707658; x=1821243658;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=EvTSYSAw1pZwy4SODPFNStgvITm06LetBqNDGk7GQ0M=;
  b=T9ayVUi5b+hKL00DDOhBGmGYSu6Dt1SAhGmiTKxA8x6f6LXfQpr49Dj3
   jHLlNTOv16tJbYGaotrM/KKXH21U/+cyLHQIFlaWNVTxFzhWPxp6YBRUw
   sKjaVHmoXy78FLkugyX+t6LhcfsSvzl6RDSm8Zo1oDUkGfrQP6i0dVJpb
   iBS5Zx0QeR8xkd1BMjdYir9p32pjhie6Tn4iY0UzqS78g7vCvxC36UcKN
   LyYuZf/wA0HkwtEB+icOmM2X3zpZVjNsm9iitxyxm68rG4O5xfwidcL41
   osTukPCEUG6m/vSiv++yG0YWEZ7EHhUhcNlHzMwsgrUi1f5diT1XmMb51
   g==;
X-CSE-ConnectionGUID: +61WbYewQxSEtn+zykfx9A==
X-CSE-MsgGUID: gOvmCYzqSRGuy7a5VK5Flg==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="107693036"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="107693036"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2026 22:00:57 -0700
X-CSE-ConnectionGUID: 3yxps+WmSI2nYtatXAHm1A==
X-CSE-MsgGUID: u6s5+UEDRm2BqWl1zdF21w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="2612089"
Received: from chenyu-dev.sh.intel.com ([10.239.62.107])
  by fmviesa013.fm.intel.com with ESMTP; 17 Sep 2026 22:00:54 -0700
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
Subject: [PATCH v8 5/9] x86/resctrl: Parse ACPI CMRC table
Date: Fri, 18 Sep 2026 12:50:15 +0800
Message-Id: <51bf1ffbd3a6efe53dc457f32b0863cc6aff0e3f.1789705667.git.yu.c.chen@intel.com>
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
 arch/x86/include/asm/resctrl.h         |  2 +
 arch/x86/kernel/cpu/resctrl/erdt.c     | 73 ++++++++++++++++++++++++++
 arch/x86/kernel/cpu/resctrl/internal.h |  6 ++-
 3 files changed, 80 insertions(+), 1 deletion(-)

diff --git a/arch/x86/include/asm/resctrl.h b/arch/x86/include/asm/resctrl.h
index 8f6edcdcfd87..9a32ed418c33 100644
--- a/arch/x86/include/asm/resctrl.h
+++ b/arch/x86/include/asm/resctrl.h
@@ -49,6 +49,8 @@ DECLARE_STATIC_KEY_FALSE(rdt_enable_key);
 DECLARE_STATIC_KEY_FALSE(rdt_alloc_enable_key);
 DECLARE_STATIC_KEY_FALSE(rdt_mon_enable_key);
 
+unsigned int erdt_get_scale(void);
+
 static inline bool resctrl_arch_alloc_capable(void)
 {
 	return rdt_alloc_capable;
diff --git a/arch/x86/kernel/cpu/resctrl/erdt.c b/arch/x86/kernel/cpu/resctrl/erdt.c
index 249ba547d7c8..a8a7417c2f82 100644
--- a/arch/x86/kernel/cpu/resctrl/erdt.c
+++ b/arch/x86/kernel/cpu/resctrl/erdt.c
@@ -23,6 +23,7 @@ static LIST_HEAD(domain_info_list);
 static bool erdt_enabled;
 
 #define ERDT_VALID_VERSION		1
+#define CMRC_SUPPORTED_INDEX_FN		1
 #define RMDD_FLAG_CPU_L3_DOMAIN		BIT(0)
 
 /* Bitmask of valid sub-tables found in the first RMDD, used to ensure all RMDDs match. */
@@ -37,11 +38,26 @@ static u16 first_rmdd_domain_id;
  */
 static unsigned int erdt_max_rmid;
 
+/*
+ * Used only by the limbo handler to round resctrl_rmid_realloc_threshold.
+ * resctrl_rmid_realloc_threshold is a single global value, and
+ * resctrl_arch_round_mon_val() takes no domain argument, so a single scale has
+ * to be derived from the per-domain cmrc->up_scale. max() is chosen because the
+ * rounding is a floor: a larger scale yields a slightly lower threshold, i.e. an
+ * RMID has to drop to a slightly lower occupancy before it is reused.
+ */
+static unsigned int erdt_scale;
+
 unsigned int erdt_get_max_rmid(void)
 {
 	return erdt_max_rmid;
 }
 
+unsigned int erdt_get_scale(void)
+{
+	return erdt_scale;
+}
+
 static void __iomem *erdt_ioremap(resource_size_t base, u32 num_pages, const char *desc)
 {
 	void __iomem *addr;
@@ -71,6 +87,7 @@ static void erdt_iounmap_domain(struct erdt_domain_info *domain)
 static void cleanup_one_domain(struct erdt_domain_info *d)
 {
 	erdt_iounmap_domain(d);
+	kfree(d->cmrc);
 	kfree(d);
 }
 
@@ -105,6 +122,49 @@ static __init int cacd_init(struct acpi_subtbl_hdr_16 *subtbl,
 	return 0;
 }
 
+static __init int cmrc_init(struct acpi_subtbl_hdr_16 *subtbl,
+			    struct erdt_domain_info *domain_info)
+{
+	struct acpi_erdt_cmrc *cmrc = (struct acpi_erdt_cmrc *)subtbl;
+
+	if (cmrc->header.length < sizeof(*cmrc)) {
+		pr_warn(FW_BUG "Truncated CMRC sub-table\n");
+		return -EIO;
+	}
+
+	if (cmrc->index_fn != CMRC_SUPPORTED_INDEX_FN) {
+		pr_info("Unsupported CMRC index function %u\n", cmrc->index_fn);
+		return -EIO;
+	}
+
+	if (!cmrc->clump_size) {
+		pr_warn(FW_BUG "CMRC clump_size is zero\n");
+		return -EIO;
+	}
+
+	/* resctrl scales monitoring values with an unsigned int. */
+	if (cmrc->up_scale > UINT_MAX) {
+		pr_warn(FW_BUG "Insane CMRC up_scale value 0x%llx\n", cmrc->up_scale);
+		return -EIO;
+	}
+
+	domain_info->base[ERDT_MMIO_CMRC_BASE] =
+		erdt_ioremap(cmrc->cmt_reg_base, cmrc->cmt_reg_size, "CMRC base");
+	if (!domain_info->base[ERDT_MMIO_CMRC_BASE])
+		return -EIO;
+
+	domain_info->cmrc = kmemdup(cmrc, cmrc->header.length, GFP_KERNEL);
+	if (!domain_info->cmrc) {
+		iounmap(domain_info->base[ERDT_MMIO_CMRC_BASE]);
+		domain_info->base[ERDT_MMIO_CMRC_BASE] = NULL;
+		return -ENOMEM;
+	}
+
+	erdt_scale = max(erdt_scale, cmrc->up_scale);
+
+	return 0;
+}
+
 static inline struct acpi_subtbl_hdr_16 *rmdd_subtbl(struct acpi_erdt_rmdd *rmdd)
 {
 	return (void *)rmdd + sizeof(*rmdd);
@@ -170,6 +230,19 @@ static __init bool parse_rmdd_table(struct acpi_subtbl_hdr_16 *rmdd_hdr)
 
 			subtbl_mask |= BIT(ACPI_ERDT_TYPE_CACD);
 			break;
+		case ACPI_ERDT_TYPE_CMRC:
+			/*
+			 * Only one CMRC is supported per domain as there is no
+			 * method to distinguish different CMRCs within a domain.
+			 */
+			if (subtbl_mask & BIT(ACPI_ERDT_TYPE_CMRC))
+				break;
+
+			if (cmrc_init(subtbl, domain_info))
+				goto cleanup;
+
+			subtbl_mask |= BIT(ACPI_ERDT_TYPE_CMRC);
+			break;
 		default:
 			break;
 		}
diff --git a/arch/x86/kernel/cpu/resctrl/internal.h b/arch/x86/kernel/cpu/resctrl/internal.h
index 2e8fb36ad804..26c3e0c546ad 100644
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
@@ -35,12 +37,14 @@ enum erdt_mmio_type {
 /**
  * struct erdt_domain_info - Per-domain ERDT information
  * @base:	Array of ioremapped MMIO region base addresses, indexed by ERDT_MMIO_*
+ * @cmrc:	Copy of the ACPI CMRC sub-table for this domain
  * @cpu_mask:	CPUs belonging to this resource management domain
  * @dom_id:	L3 cache ID shared by all CPUs in this domain (-1 if unset)
  * @entry:	Links into the global domain_info_list
  */
 struct erdt_domain_info {
 	void __iomem		*base[ERDT_MMIO_NUM_TYPES];
+	struct acpi_erdt_cmrc	*cmrc;
 	struct cpumask		cpu_mask;
 	int			dom_id;
 	struct list_head	entry;
-- 
2.25.1

