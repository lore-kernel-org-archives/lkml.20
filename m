Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793874019;
	b=RRfzy2qyYYh7GtbmAy87KEBINVAbgptvvciQqdyVf+1dH/XwdVrt+VkLDLnPwAD4oNru
	 sg/LnSdFiAxt8I8tipoFldRkzO2RywQj82YjWgqdyScnzqx/XmejZ7LS1EuFXaRzGSVJw
	 tvbNKoLcNQRvy5Y29y8a2YPbL1cquHUXD4PAZMluGStmt1pQWmobwI5mMHr6xqHMNltVD
	 8vcqpqklTcwU4DaxkSo+uVzGLN9VEZhChHkjBn2eHOzb06xnZxUV16NhB5cgcaKeeW31N
	 EEig2Wk8iJh0JKxEpMTzKBcgtSyUtIylZtDi8RCccEumL+5U713WYKu+2g3+Q1xMfCg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793874019;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=0uMZjFSgxjuERf/qFZuMr8q9CKg2qRvbL/QtfxdbFsQ=;
	b=SXJrm4G8nVbmQhXyv1KcKK+ztxxc0g8rKuekvHgUnWWEFso7Si1UbXfISophCPJIEnXL
	 OZVaqPcWohVaRbg2sOkMr5MwGZiSWL0TDG02OmFQENTu3M/LTIv92b4g9t2ZHGNs8Q1EI
	 iYDpdsIHPqk1WQXpnEpIHRAkgcnT3dQYDn3hycd733+sSgWT2ffBqY53c0Aflkcu5Fuw7
	 b7jQwXvMvtJi52hjVmUHkvJQSjuM+Ol85vvQAP0MfnGwN7g6Ygf6t4fZimYzv+u3UDViz
	 OUV5xE5ASbD3Pp/sAJvq3kkkQRgE9dry5hPteiV1EPoDIyTLhvmcUPzcVetY6j0bs/A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=FMHyBcij;
	arc=none smtp.remote-ip=198.175.65.12
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E9B0606EE8B
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 10:20:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4E9B0606EE8B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=FMHyBcij
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793874019; x=1825410019;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=AxaOvfyxrG6Y15DlNftzLyqwvZTEfE99N5XjNfG+HMs=;
  b=FMHyBcijdXEtCzp3SGCgF6Eqly2h2H1TL5HmbHcqT6mykVMklH73eKrf
   unFumEYx5LmLT9lyGORsi4gT99NvCbbe6hQCnKBp0yP2A4TndwRU2gt5v
   u99gd9USFtyAGCfoFM9E1u6BXrFssTUvNhLlaY7TxZzX/dGO4ovfdHb7e
   5KYKTMNGkk6ntNNN9J/cN2HxRTVxiApcXsQYKVptlQ/6dUKJcArbyDGdL
   7/df0Zmji7DpeQ6mQ80QF4hCfA5wGNcgQzqvKZQ0o7R2RRAD9dENR6MSo
   /Mwpt9Ue3q5f5+5hblEUImrwEDodJ/3Xk7+3puk5nEnnNmlyxJXX41JOJ
   A==;
X-CSE-ConnectionGUID: cZz4OSPWTJimeEBmUFiXPQ==
X-CSE-MsgGUID: wFYyzcvaSp+3XEMBoiwvLA==
X-IronPort-AV: E=McAfee;i="6800,10657,11956"; a="2530277"
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="2530277"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2026 02:20:18 -0800
X-CSE-ConnectionGUID: MZeRwfbUSRigVei1TB4mww==
X-CSE-MsgGUID: 8LDXCxauTmWggYKkjIPYkw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="7143653"
Received: from chenyu-dev.sh.intel.com ([10.239.62.184])
  by fmviesa003.fm.intel.com with ESMTP; 05 Nov 2026 02:20:14 -0800
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
Subject: [PATCH v10 07/12] x86/resctrl: Parse ACPI CMRC table
Date: Thu,  5 Nov 2026 18:09:14 +0800
Message-Id: <d83563076e5f945078a83aa5f10d430b1fb5e561.1793864720.git.yu.c.chen@intel.com>
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

The CMRC (Cache Monitoring Registers for CPU Agents Description) sub-table of
ERDT describes the MMIO registers used to read the LLC occupancy counters of an
ERDT domain.

Reading the LLC occupancy of an RMID via MMIO, rather than via the
IA32_QM_EVTSEL/IA32_QM_CTR MSRs, requires the following data from the CMRC
sub-table:

 - Where the counters are: the base address and size of the domain's
   monitoring register block.
 - How the counters are laid out: the index function, clump size and clump
   stride, which locate the counter of a given RMID within that block.
 - How to interpret a counter value: the flags, which indicate whether a
   counter can report that its data is unavailable, and up_scale, which
   converts a counter value to bytes.

The LLC occupancy read path needs all of this data on every read. The limbo
handler also needs up_scale to round its occupancy threshold.

Parse each CMRC sub-table, validate the data above, ioremap the monitoring
register block and save a copy of the CMRC sub-table in the corresponding ERDT
domain entry.

Suggested-by: Tony Luck <tony.luck@intel.com>
Signed-off-by: Chen Yu <yu.c.chen@intel.com>
Tested-by: Hongyu Ning <hongyu.ning@linux.intel.com>
---
Changes since v9:
- Rebased on the kernel-doc enum erdt_mmio_type from "x86/resctrl:
  Parse ACPI ERDT table and save CACD cpumask per RMD". No code change.

 arch/x86/kernel/cpu/resctrl/erdt.c     | 53 ++++++++++++++++++++++++++
 arch/x86/kernel/cpu/resctrl/internal.h |  6 ++-
 2 files changed, 58 insertions(+), 1 deletion(-)

diff --git a/arch/x86/kernel/cpu/resctrl/erdt.c b/arch/x86/kernel/cpu/resctrl/erdt.c
index 1b07dd734b9b..ef7f51fde838 100644
--- a/arch/x86/kernel/cpu/resctrl/erdt.c
+++ b/arch/x86/kernel/cpu/resctrl/erdt.c
@@ -23,6 +23,7 @@ static LIST_HEAD(domain_info_list);
 static bool erdt_enabled;
 
 #define ERDT_VALID_REVISION		1
+#define CMRC_SUPPORTED_INDEX_FN		1
 #define RMDD_FLAG_CPU_L3_DOMAIN		BIT(0)
 #define ERDT_DOMAIN_ID_UNSET		-1
 
@@ -65,6 +66,7 @@ static void erdt_iounmap_domain(struct erdt_domain_info *domain)
 static void cleanup_one_domain(struct erdt_domain_info *d)
 {
 	erdt_iounmap_domain(d);
+	kfree(d->cmrc);
 	kfree(d);
 }
 
@@ -98,6 +100,47 @@ static __init bool cacd_init(struct acpi_subtbl_hdr_16 *subtbl,
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
@@ -154,6 +197,16 @@ static __init bool parse_rmdd_table(struct acpi_subtbl_hdr_16 *rmdd_hdr)
 
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
index deb033155f31..527e3ac91b26 100644
--- a/arch/x86/kernel/cpu/resctrl/internal.h
+++ b/arch/x86/kernel/cpu/resctrl/internal.h
@@ -24,11 +24,13 @@
 /**
  * enum erdt_mmio_type - Index into erdt_domain_info::base[] for each MMIO region
  * @ERDT_MMIO_RMDD_CREG: RMDD control register base address
+ * @ERDT_MMIO_CMRC_BASE: CMRC monitoring register base address
  * @ERDT_MMIO_LAST: Last MMIO region type
  */
 enum erdt_mmio_type {
 	ERDT_MMIO_RMDD_CREG,
-	ERDT_MMIO_LAST = ERDT_MMIO_RMDD_CREG
+	ERDT_MMIO_CMRC_BASE,
+	ERDT_MMIO_LAST = ERDT_MMIO_CMRC_BASE
 };
 
 #define ERDT_MMIO_NUM_TYPES	(ERDT_MMIO_LAST + 1)
@@ -36,6 +38,7 @@ enum erdt_mmio_type {
 /**
  * struct erdt_domain_info - L3 domain ERDT information
  * @base:	Array of ioremapped MMIO region base addresses, indexed by ERDT_MMIO_*
+ * @cmrc:	Copy of the ACPI CMRC sub-table for this domain
  * @cpu_mask:	CPUs belonging to this resource management domain
  * @dom_id:	L3 cache ID shared by all CPUs in this domain
  *		(ERDT_DOMAIN_ID_UNSET if unset)
@@ -43,6 +46,7 @@ enum erdt_mmio_type {
  */
 struct erdt_domain_info {
 	void __iomem		*base[ERDT_MMIO_NUM_TYPES];
+	struct acpi_erdt_cmrc	*cmrc;
 	struct cpumask		cpu_mask;
 	int			dom_id;
 	struct list_head	entry;
-- 
2.25.1

