Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9BAE26F2BF
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 19:47:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788378466; cv=none; b=URq1J0qm0O6jP7Bjh1+abnXhe5CIxvB4rqR3AJv+ryrmOzMfO6LD2ah+W8z2P5Zfaz3ZXOrecANdTUQYTGGgIO5g0pgh/SlDiMlw2/Cf4jXsCgQqpH2BSkV6Hd7tfx4KiI4f8bIExogt4r1cbqQ4YhD7WA1sMHFk25dk2cWfAPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788378466; c=relaxed/simple;
	bh=eDMgO081SUb8BSOs4aO2ZnP0gNni6rGjxk0Uu8cjp/k=;
	h=Subject:To:Cc:From:Date:Message-Id; b=oO8zij2ZOxmI48sCBCECBHu5aYzL4wcTDCourCDj7n/bBkGoE9WNJDpYLlGjQjuhWBuKLtslA7UC5twf87D0A/9zinNuIIxfOB0Atpq+eX0YiUeIf438xsL8+rHANVzG+voXffWNVHqKGlj4wabLCZDxPbFRgWgr8rtpYP+s4P4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HLQot87r; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HLQot87r"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788378446; x=1819914446;
  h=subject:to:cc:from:date:message-id;
  bh=eDMgO081SUb8BSOs4aO2ZnP0gNni6rGjxk0Uu8cjp/k=;
  b=HLQot87rSSXHodk6I7teZI2UUq7rxvcuKEwqWw775YlMgfxU1STM0yCO
   PGUethGZLWsAaV7gz83QyI0X/Rifqdsp2AOyrfVIKL1LEs81F3m5y6/0g
   oxkU5h5LfA6jeL8yRZ7ieBFcQC+7krEvI5U3H+T9vpAnz0JnBnYDtPikJ
   NUTptZXGnoz9+3TsMUAgR471wqkpPtu94axayJlPDc+9+5r1fAURaOBQ9
   zlrwhPVmUJuIkgOHWukEm2u48z+LejOLooyzTdHABgj7h23iVIIzan3K4
   hDahB6lz5MH1IGqNyJ1pWpNmiPJy5/uEpSE0CD5IstPozLhWFIbO5vPJd
   A==;
X-CSE-ConnectionGUID: bLK6XbRyQAKAHdquQbFuEA==
X-CSE-MsgGUID: sXrWgrkLS3uNiCteNV2VOA==
X-IronPort-AV: E=McAfee;i="6800,10657,11894"; a="88872184"
X-IronPort-AV: E=Sophos;i="6.25,258,1779174000"; 
   d="scan'208";a="88872184"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2026 12:47:19 -0700
X-CSE-ConnectionGUID: kn9a4qjITtq6EqmJJNStog==
X-CSE-MsgGUID: nb4+IBgiQBynnIhwBB1eyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,258,1779174000"; 
   d="scan'208";a="266904789"
Received: from davehans-spike.ostc.intel.com (HELO localhost.localdomain) ([10.165.164.11])
  by fmviesa008.fm.intel.com with ESMTP; 02 Sep 2026 12:47:18 -0700
Subject: [PATCH] x86/mm: Introduce helper for checking direct map 1G page support
To: linux-kernel@vger.kernel.org
Cc: Dave Hansen <dave.hansen@linux.intel.com>, Andy Lutomirski <luto@kernel.org>, Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>, Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>, Thomas Gleixner <tglx@kernel.org>, x86@kernel.org, Yeoreum Yun <yeoreum.yun@arm.com>
From: Dave Hansen <dave.hansen@linux.intel.com>
Date: Wed, 02 Sep 2026 12:47:18 -0700
Message-Id: <20260902194718.E1FF3041@davehans-spike.ostc.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>


From: Dave Hansen <dave.hansen@linux.intel.com>

There is an existing variable (direct_gbpages) that says whether the
kernel can and should use 1G pages in the direct map. It is driven
by a bunch of other machinery. At least:

 1. Hardware support for 1G pages
 2. Kconfig support for 1G direct mappings
 3. Kernel command line overrides

Most code just checks the 'direct_gbpages' variable itself.  But there
are cases where 1G mappings are compile-time disabled (via
X86_DIRECT_GBPAGES) and 'direct_gbpages' is always 0. Unfortunately,
that constraint is invisible to the compiler.

This opacity has been historically functionally harmless; it only
leaves a bit of dead code. But, there are plans to tigthen up the
compile-time checks around folded page table levels. The build will
break if that dead code appears reachable to the compiler. Making
the compile-time config visible to the compiler fixes the build.

Add a helper to replace 'direct_gbpages' checks. Check the Kconfig
option and base CPU support before looking at the variable.

This lets the compiler optimize things better, especially
collapse_pud_page() where most of the function can now be optimized
out when the PUD level is folded.

Notes:

Use boot_cpu_has() instead of cpu_feature_enabled(). There's no
required/disabled features for 1G pages themselves
(X86_DIRECT_GBPAGES is for kernel mappings only) and the
static_cpu_has() infrastructure is just gets in the compiler's way.

This makes 64-bit build marginally larger (20 bytes in one compile)
and 32-bit builds less marginally _smaller_ (~700 bytes).

Signed-off-by: Dave Hansen <dave.hansen@linux.intel.com>
Reviewed-by: Yeoreum Yun <yeoreum.yun@arm.com>
Tested-by: Yeoreum Yun <yeoreum.yun@arm.com>
Link: https://lore.kernel.org/all/20260902-dummy_ptxp3-v3-15-5d8f5b17c25c@arm.com/ [1]
---

 b/arch/x86/include/asm/pgtable.h     |   14 ++++++++++++++
 b/arch/x86/kernel/cpu/common.c       |    2 +-
 b/arch/x86/kernel/machine_kexec_64.c |    2 +-
 b/arch/x86/mm/init.c                 |    2 +-
 b/arch/x86/mm/pat/set_memory.c       |    4 ++--
 5 files changed, 19 insertions(+), 5 deletions(-)

diff -puN arch/x86/include/asm/pgtable.h~direct_gbpages-compiletime arch/x86/include/asm/pgtable.h
--- a/arch/x86/include/asm/pgtable.h~direct_gbpages-compiletime	2026-09-02 10:08:59.999169372 -0700
+++ b/arch/x86/include/asm/pgtable.h	2026-09-02 10:09:00.011170394 -0700
@@ -1163,6 +1163,20 @@ static inline int pgd_none(pgd_t pgd)
 #ifndef __ASSEMBLER__
 
 extern int direct_gbpages;
+static inline bool direct_gbpages_enabled(void)
+{
+	/* Check the direct map config option: */
+	if (!IS_ENABLED(CONFIG_X86_DIRECT_GBPAGES))
+		return false;
+
+	/* Check the CPU feature: */
+	if (!boot_cpu_has(X86_FEATURE_GBPAGES))
+		return false;
+
+	/* Check the command-line and early setup variable: */
+	return direct_gbpages;
+}
+
 void init_mem_mapping(void);
 void early_alloc_pgt_buf(void);
 void __init poking_init(void);
diff -puN arch/x86/mm/init.c~direct_gbpages-compiletime arch/x86/mm/init.c
--- a/arch/x86/mm/init.c~direct_gbpages-compiletime	2026-09-02 10:09:00.001169542 -0700
+++ b/arch/x86/mm/init.c	2026-09-02 10:09:00.011170394 -0700
@@ -251,7 +251,7 @@ static void __init probe_page_size_mask(
 		__default_kernel_pte_mask &= ~_PAGE_GLOBAL;
 
 	/* Enable 1 GB linear kernel mappings if available: */
-	if (direct_gbpages && boot_cpu_has(X86_FEATURE_GBPAGES)) {
+	if (direct_gbpages_enabled()) {
 		printk(KERN_INFO "Using GB pages for direct mapping\n");
 		page_size_mask |= 1 << PG_LEVEL_1G;
 	} else {
diff -puN arch/x86/kernel/cpu/common.c~direct_gbpages-compiletime arch/x86/kernel/cpu/common.c
--- a/arch/x86/kernel/cpu/common.c~direct_gbpages-compiletime	2026-09-02 10:09:00.003169713 -0700
+++ b/arch/x86/kernel/cpu/common.c	2026-09-02 10:09:00.012170479 -0700
@@ -2660,7 +2660,7 @@ void __init arch_cpu_finalize_init(void)
 		 * Right now we don't do that with gbpages because there seems
 		 * very little benefit for that case.
 		 */
-		if (!direct_gbpages)
+		if (!direct_gbpages_enabled())
 			set_memory_4k((unsigned long)__va(0), 1);
 	} else {
 		fpu__init_check_bugs();
diff -puN arch/x86/kernel/machine_kexec_64.c~direct_gbpages-compiletime arch/x86/kernel/machine_kexec_64.c
--- a/arch/x86/kernel/machine_kexec_64.c~direct_gbpages-compiletime	2026-09-02 10:09:00.004169798 -0700
+++ b/arch/x86/kernel/machine_kexec_64.c	2026-09-02 10:09:00.012170479 -0700
@@ -257,7 +257,7 @@ static int init_pgtable(struct kimage *i
 		info.kernpg_flag |= _PAGE_ENC;
 	}
 
-	if (direct_gbpages)
+	if (direct_gbpages_enabled())
 		info.direct_gbpages = true;
 
 	for (i = 0; i < nr_pfn_mapped; i++) {
diff -puN arch/x86/mm/pat/set_memory.c~direct_gbpages-compiletime arch/x86/mm/pat/set_memory.c
--- a/arch/x86/mm/pat/set_memory.c~direct_gbpages-compiletime	2026-09-02 10:09:00.008170139 -0700
+++ b/arch/x86/mm/pat/set_memory.c	2026-09-02 10:09:00.013170565 -0700
@@ -130,7 +130,7 @@ void arch_report_meminfo(struct seq_file
 	seq_printf(m, "DirectMap4M:    %8lu kB\n",
 			direct_pages_count[PG_LEVEL_2M] << 12);
 #endif
-	if (direct_gbpages)
+	if (direct_gbpages_enabled())
 		seq_printf(m, "DirectMap1G:    %8lu kB\n",
 			direct_pages_count[PG_LEVEL_1G] << 20);
 }
@@ -1340,7 +1340,7 @@ static int collapse_pud_page(pud_t *pud,
 	pmd_t *pmd, first;
 	int i;
 
-	if (!direct_gbpages)
+	if (!direct_gbpages_enabled())
 		return 0;
 
 	addr &= PUD_MASK;
_
