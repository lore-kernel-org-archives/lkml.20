Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793740993;
	b=iew8pLL+bF2wptwRkM53DgU6xmm76PlJUMkcJNpaQTW/0MxU2e7X/9GTwTqqvLTeHKjf
	 L2syVlnDlJlT4hmDzfrSmWyoC69OIhOKzJRMeT+xeBTKVaOw7tunhvuQwQ8iyeP+lFEVN
	 hWXtG49K0MHyuaup4yAWmM8HSAcgGlhneLtyRzNdSth7QTYHUFwplJNk+cQE0wpuhrVva
	 2TC/Iod1NiZltqjWoXDV8X6tHproRKIY0YsHoB7h8MnU672sk1xpLuNy8mB9SKYEaNxTD
	 BSuHIlHA6e7oSy1bdQ7qUgUJyAznB1mrL2SMtJwWrIgSyPzMJKZMl8k/lAxKe+WI2ig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793740993;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=lBNrYe0yLKuVTIMfJMVuE+omxBB/6AJe5EKzaI1Czwo=;
	b=Z310ZC7D8zT/TF1/tDm2eCV255/rDaLTz++67I8qXM9f3tLLdELrF5b92kNNipD4McHE
	 gmQgfmEMaZaqS/9gwZsU3bM42y0s5ywmY5Xd6rqSxs2QuBLjrHNGUxwlnQ2av15iGYc63
	 RZUXm0qBMGcmilS2YWaVekBN6mzjs9GeJh4rlzC2kYUxH+rdh2bSOY8no9w2dQgPBj+zs
	 4KL5U/dyCqfgAAwQ8R5DPK6VMwcF3C8B1qAiGSzbqYK/JG8EH5nyrxrnEfVUgK6EDYi9J
	 3kpno3qZYKeRqYIt5bnhlf8PlPHMVqGqWYaYJC/387EcQTsmBGaTLgZkZ3ksUf3z13A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=S2siptAg;
	arc=none smtp.remote-ip=192.198.163.11
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24D28606A32C
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 21:23:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 24D28606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=S2siptAg
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793740993; x=1825276993;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ycMmQFqOZeYF6u9U+1ocY+aBV5d/W+/cCZRGIuc43Xk=;
  b=S2siptAgrqNTkLgsAk8uEsHoMxAx2cDz+DGMZMvL/yY8l1faXtmFxX7H
   0dcWYdvuPHlNH0aJaoBMCtnQcy7+kkT9akn9xeNZgSeEq43wVJ3gXJc+Y
   M1tjOFQDnJh0l/AsFcISgF1hdsxZhIxJfFdv2Dx72lxLuA4xlHawYQUtB
   Bib8wEOu5o/1mH3WTCF2ZIw4tF3SXF8oKfxPpcKjBAIs89WON6L6OMjOD
   qbMkexo571KABVXpHfmc0bZXWExCFi60XYR2G7fVS1nFEOsoLOvVuXuJU
   6KJDV8q0nX0hGMQ77q52Ud5cdYq+HfwfuJFMwK6S61ZH5svKxHRs+lL3A
   Q==;
X-CSE-ConnectionGUID: 1GMURd9/TT2NEjJ6VsyCAQ==
X-CSE-MsgGUID: Kj8EbQOwQvup55iS7m6z4Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11955"; a="2393470"
X-IronPort-AV: E=Sophos;i="6.27,193,1787036400"; 
   d="scan'208";a="2393470"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2026 13:23:10 -0800
X-CSE-ConnectionGUID: eJcvNi4zQjW5lw4ER2O20Q==
X-CSE-MsgGUID: rwicwXI8SMqpUQk4hOmpzg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,193,1787036400"; 
   d="scan'208";a="6624572"
Received: from rosenzwe-mobl1.amr.corp.intel.com (HELO agluck-desk3.home.arpa) ([10.124.223.124])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2026 13:23:08 -0800
From: Tony Luck <tony.luck@intel.com>
To: Fenghua Yu <fenghuay@nvidia.com>,
	Reinette Chatre <reinette.chatre@intel.com>,
	Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>,
	Peter Newman <peternewman@google.com>,
	James Morse <james.morse@arm.com>,
	Babu Moger <babu.moger@amd.com>,
	Drew Fustini <dfustini@baylibre.com>,
	Dave Martin <Dave.Martin@arm.com>,
	Chen Yu <yu.c.chen@intel.com>
Cc: x86@kernel.org,
	linux-kernel@vger.kernel.org,
	patches@lists.linux.dev,
	Tony Luck <tony.luck@intel.com>
Subject: [RFC PATCH v2 04/11] x86/resctrl: Add asymmetric L2 CAT feature bits and boot options
Date: Tue,  3 Nov 2026 13:22:47 -0800
Message-ID: <20261103212254.18314-5-tony.luck@intel.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261103212254.18314-1-tony.luck@intel.com>
References: <20261103212254.18314-1-tony.luck@intel.com>
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

CPUID enumerates asymmetric allocation support separately from symmetric
RDT, with L2 CAT and CDP capabilities reported through the asymmetric leaves.

Define and detect the asymmetric feature bits, add their CPUID dependencies,
and provide rdt= options to control asymmetric L2 CAT and CDP.

Signed-off-by: Tony Luck <tony.luck@intel.com>
---
 arch/x86/include/asm/cpufeatures.h |  3 +++
 arch/x86/kernel/cpu/cpuid-deps.c   |  2 ++
 arch/x86/kernel/cpu/resctrl/core.c | 28 ++++++++++++++++------------
 arch/x86/kernel/cpu/scattered.c    |  3 +++
 4 files changed, 24 insertions(+), 12 deletions(-)

diff --git a/arch/x86/include/asm/cpufeatures.h b/arch/x86/include/asm/cpufeatures.h
index 61930f0d4578..8f8296eb7d83 100644
--- a/arch/x86/include/asm/cpufeatures.h
+++ b/arch/x86/include/asm/cpufeatures.h
@@ -432,6 +432,9 @@
 #define X86_FEATURE_CPPC_PERF_PRIO	(17*32+ 2) /* CPPC Floor Perf support */
 #define X86_FEATURE_SMCA		(17*32+ 3) /* "smca" Scalable MCA */
 #define X86_FEATURE_BTB_CTX_ISOLATION	(17*32+ 4) /* AMD: Branch predictions contexts isolated */
+#define X86_FEATURE_RDT_A_ASYM		(17*32+ 5) /* Asymmetric allocation features */
+#define X86_FEATURE_CAT_L2_ASYM		(17*32+ 6) /* Asymmetric Cache Allocation Technology L2 */
+#define X86_FEATURE_CDP_L2_ASYM		(17*32+ 7) /* Asymmetric Code and Data Prioritization L2 */
 
 /* Intel-defined CPU features, CPUID level 0x00000007:0 (EDX), word 18 */
 #define X86_FEATURE_AVX512_4VNNIW	(18*32+ 2) /* "avx512_4vnniw" AVX-512 Neural Network Instructions */
diff --git a/arch/x86/kernel/cpu/cpuid-deps.c b/arch/x86/kernel/cpu/cpuid-deps.c
index 99801e844b30..aeed13296233 100644
--- a/arch/x86/kernel/cpu/cpuid-deps.c
+++ b/arch/x86/kernel/cpu/cpuid-deps.c
@@ -73,6 +73,8 @@ static const struct cpuid_dep cpuid_deps[] = {
 	{ X86_FEATURE_BMEC,			X86_FEATURE_CQM_MBM_TOTAL   },
 	{ X86_FEATURE_BMEC,			X86_FEATURE_CQM_MBM_LOCAL   },
 	{ X86_FEATURE_SDCIAE,			X86_FEATURE_CAT_L3    },
+	{ X86_FEATURE_CAT_L2_ASYM,		X86_FEATURE_RDT_A_ASYM },
+	{ X86_FEATURE_CDP_L2_ASYM,		X86_FEATURE_RDT_A_ASYM },
 	{ X86_FEATURE_AVX512_BF16,		X86_FEATURE_AVX512VL  },
 	{ X86_FEATURE_AVX512_FP16,		X86_FEATURE_AVX512BW  },
 	{ X86_FEATURE_ENQCMD,			X86_FEATURE_XSAVES    },
diff --git a/arch/x86/kernel/cpu/resctrl/core.c b/arch/x86/kernel/cpu/resctrl/core.c
index c66ff4cdd84b..0b1de97af17d 100644
--- a/arch/x86/kernel/cpu/resctrl/core.c
+++ b/arch/x86/kernel/cpu/resctrl/core.c
@@ -921,6 +921,8 @@ enum {
 	RDT_FLAG_L3_CDP,
 	RDT_FLAG_L2_CAT,
 	RDT_FLAG_L2_CDP,
+	RDT_FLAG_L2_CAT_ASYM,
+	RDT_FLAG_L2_CDP_ASYM,
 	RDT_FLAG_MBA,
 	RDT_FLAG_SMBA,
 	RDT_FLAG_BMEC,
@@ -941,18 +943,20 @@ struct rdt_options {
 };
 
 static struct rdt_options rdt_options[]  __ro_after_init = {
-	RDT_OPT(RDT_FLAG_CMT,	    "cmt",	X86_FEATURE_CQM_OCCUP_LLC),
-	RDT_OPT(RDT_FLAG_MBM_TOTAL, "mbmtotal", X86_FEATURE_CQM_MBM_TOTAL),
-	RDT_OPT(RDT_FLAG_MBM_LOCAL, "mbmlocal", X86_FEATURE_CQM_MBM_LOCAL),
-	RDT_OPT(RDT_FLAG_L3_CAT,    "l3cat",	X86_FEATURE_CAT_L3),
-	RDT_OPT(RDT_FLAG_L3_CDP,    "l3cdp",	X86_FEATURE_CDP_L3),
-	RDT_OPT(RDT_FLAG_L2_CAT,    "l2cat",	X86_FEATURE_CAT_L2),
-	RDT_OPT(RDT_FLAG_L2_CDP,    "l2cdp",	X86_FEATURE_CDP_L2),
-	RDT_OPT(RDT_FLAG_MBA,	    "mba",	X86_FEATURE_MBA),
-	RDT_OPT(RDT_FLAG_SMBA,	    "smba",	X86_FEATURE_SMBA),
-	RDT_OPT(RDT_FLAG_BMEC,	    "bmec",	X86_FEATURE_BMEC),
-	RDT_OPT(RDT_FLAG_ABMC,	    "abmc",	X86_FEATURE_ABMC),
-	RDT_OPT(RDT_FLAG_SDCIAE,    "sdciae",	X86_FEATURE_SDCIAE),
+	RDT_OPT(RDT_FLAG_CMT,		"cmt",		X86_FEATURE_CQM_OCCUP_LLC),
+	RDT_OPT(RDT_FLAG_MBM_TOTAL,	"mbmtotal",	X86_FEATURE_CQM_MBM_TOTAL),
+	RDT_OPT(RDT_FLAG_MBM_LOCAL,	"mbmlocal",	X86_FEATURE_CQM_MBM_LOCAL),
+	RDT_OPT(RDT_FLAG_L3_CAT,	"l3cat",	X86_FEATURE_CAT_L3),
+	RDT_OPT(RDT_FLAG_L3_CDP,	"l3cdp",	X86_FEATURE_CDP_L3),
+	RDT_OPT(RDT_FLAG_L2_CAT,	"l2cat",	X86_FEATURE_CAT_L2),
+	RDT_OPT(RDT_FLAG_L2_CDP,	"l2cdp",	X86_FEATURE_CDP_L2),
+	RDT_OPT(RDT_FLAG_L2_CAT_ASYM,	"l2cat_asym",	X86_FEATURE_CAT_L2_ASYM),
+	RDT_OPT(RDT_FLAG_L2_CDP_ASYM,	"l2cdp_asym",	X86_FEATURE_CDP_L2_ASYM),
+	RDT_OPT(RDT_FLAG_MBA,		"mba",		X86_FEATURE_MBA),
+	RDT_OPT(RDT_FLAG_SMBA,		"smba",		X86_FEATURE_SMBA),
+	RDT_OPT(RDT_FLAG_BMEC,		"bmec",		X86_FEATURE_BMEC),
+	RDT_OPT(RDT_FLAG_ABMC,		"abmc",		X86_FEATURE_ABMC),
+	RDT_OPT(RDT_FLAG_SDCIAE,	"sdciae",	X86_FEATURE_SDCIAE),
 };
 #define NUM_RDT_OPTIONS ARRAY_SIZE(rdt_options)
 
diff --git a/arch/x86/kernel/cpu/scattered.c b/arch/x86/kernel/cpu/scattered.c
index d867ab90d42a..3db914c170f9 100644
--- a/arch/x86/kernel/cpu/scattered.c
+++ b/arch/x86/kernel/cpu/scattered.c
@@ -28,6 +28,7 @@ static const struct cpuid_bit cpuid_bits[] = {
 	{ X86_FEATURE_APERFMPERF,		CPUID_ECX,  0, 0x00000006, 0 },
 	{ X86_FEATURE_EPB,			CPUID_ECX,  3, 0x00000006, 0 },
 	{ X86_FEATURE_INTEL_PPIN,		CPUID_EBX,  0, 0x00000007, 1 },
+	{ X86_FEATURE_RDT_A_ASYM,		CPUID_ECX,  1, 0x00000007, 1 },
 	{ X86_FEATURE_MSR_IMM,			CPUID_ECX,  5, 0x00000007, 1 },
 	{ X86_FEATURE_APX,			CPUID_EDX, 21, 0x00000007, 1 },
 	{ X86_FEATURE_RRSBA_CTRL,		CPUID_EDX,  2, 0x00000007, 2 },
@@ -46,6 +47,8 @@ static const struct cpuid_bit cpuid_bits[] = {
 	{ X86_FEATURE_SGX2,			CPUID_EAX,  1, 0x00000012, 0 },
 	{ X86_FEATURE_SGX_EUPDATESVN,		CPUID_EAX, 10, 0x00000012, 0 },
 	{ X86_FEATURE_SGX_EDECCSSA,		CPUID_EAX, 11, 0x00000012, 0 },
+	{ X86_FEATURE_CAT_L2_ASYM,		CPUID_EBX,  2, 0x00000028, 0 },
+	{ X86_FEATURE_CDP_L2_ASYM,		CPUID_ECX,  2, 0x00000028, 2 },
 	{ X86_FEATURE_OVERFLOW_RECOV,		CPUID_EBX,  0, 0x80000007, 0 },
 	{ X86_FEATURE_SUCCOR,			CPUID_EBX,  1, 0x80000007, 0 },
 	{ X86_FEATURE_SMCA,			CPUID_EBX,  3, 0x80000007, 0 },
-- 
2.56.0

