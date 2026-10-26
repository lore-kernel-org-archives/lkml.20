Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.14
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793051852;
	b=qecg0k+7JhVlMzuYe5c256A8wguEIzF2D7dAWEVX+aTDgwbDF+BCahlPbvVeNBl9hmGv
	 YngsmUWd/4tefQsQ1sukd3Pr2xCM1+0VGHsLzdlBIosIGm+hv07pdlkQ2V7oijUo4xU+1
	 7ox8AfqAaep4gTREhneggyin/moO+2sPSLrnQzeVUKd0iM+xQiq4qlHOExhGr8hgKnuVM
	 A2t9ulYK2+ooznpUlxKAHKNKl0YUdkqJ7Yoh21A66d5S3+ZhIwyeIrOVJ0Rpi+BgVtPis
	 JgOB1unZTOEjxcW/s5hiEC37JEpyGtvPN4vV+ugo2wOTgIxEvJoY98+24H9FEdN3NRA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793051852;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=nLbiu4vpexc8Wx0YWylLG3s0v3cIUHKHYDMXRcAL94g=;
	b=PGdpBe3ZgtVWI6j+2A8y3Mqn8f+f0ieu6bpcSYTFUTJPP1L6DJbPrZaz/v+Aic3Fosjp
	 cp8cuPoQcE35nHCvZh+euikWE59G2Z0Lnfkwo5+nSjHrS/aZzPPM//XXR/DdwMuDMFG85
	 iN+E39N84NcINnSYAtYMrJyMs3lfEmBI2Q+guf+HJBnzHV2k0tvr9q8LbWm+GlS5R9HVj
	 vvJKxoYx8igdRBYB9TupceILlw4Q7CS/jpFd5DhYzQwqJCA0drV0s3Q9NbcxaxJbHlLuh
	 CNlBeMSqNNUUfGlVvha0UyYWkmQpWwbgMANHpF9lie8NIX2BKf70jGjD7SyI2+HZ5tA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ecO26xbz;
	arc=none smtp.remote-ip=192.198.163.14
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24820606A324
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 21:57:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 24820606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ecO26xbz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793051852; x=1824587852;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=bzhv7s/5nJvPxQ44OMZU6Iz/kte/89+Yw2a+vbOExNA=;
  b=ecO26xbzALfiJFP3rDj56HAZZnv2pE19y8Lld+e8E/z1VNFKej9bbDF3
   Kbfzlgr4arWabAdDoJD4GX5f101FhAvXsX5bqmnap5ArHezFf60BLVsVd
   A3hVVsfr1hJqYyS9p74YfRsR4QK01bnS1e/8rXFsZwPZm85mzdfttYgIC
   M2NStDqJ1hZ2eNzv0UIGZik2JPGp020+KAdSREGa6mIQYyO/dVDU9x0ss
   rYWCvRM3fisG2zp+bBAV4ftGfPW5WK/JBTi5975q4663V4km6UIsTfVRE
   fkLlBmmfqT+4D75xC2oWsfx36gRHRqFPVYxq99qrMVSlbR3mVoeTpie1W
   Q==;
X-CSE-ConnectionGUID: JOjNT8JMRcmIMrnXyBLoyA==
X-CSE-MsgGUID: RNL+W2hVT/a5UlnF14kJig==
X-IronPort-AV: E=McAfee;i="6800,10657,11947"; a="1766390"
X-IronPort-AV: E=Sophos;i="6.27,180,1787036400"; 
   d="scan'208";a="1766390"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2026 14:57:28 -0700
X-CSE-ConnectionGUID: +J61q/xmSxyTQOJgpbAT1w==
X-CSE-MsgGUID: SB2LEAl0R6eXBdw3Kjwutw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,180,1787036400"; 
   d="scan'208";a="4240264"
Received: from khuang2-desk.gar.corp.intel.com (HELO agluck-desk3.home.arpa) ([10.124.221.204])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2026 14:57:27 -0700
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
Subject: [RFC PATCH 3/8] x86/cpuid: Add and use defines for Intel RDT enumeration leaves
Date: Mon, 26 Oct 2026 14:57:13 -0700
Message-ID: <20261026215718.16810-4-tony.luck@intel.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261026215718.16810-1-tony.luck@intel.com>
References: <20261026215718.16810-1-tony.luck@intel.com>
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

Intel Resource Director Technology (RDT) parameters are enumerated
in four leaves for (monitoring, allocation) * (symmetric, asymmetric).

Add defines for all four leaves.

Update code that hard-codes numerical values for the symmetric leaves.

Signed-off-by: Tony Luck <tony.luck@intel.com>
---
 arch/x86/include/asm/cpuid/types.h | 4 ++++
 arch/x86/kernel/cpu/resctrl/core.c | 8 ++++----
 2 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/arch/x86/include/asm/cpuid/types.h b/arch/x86/include/asm/cpuid/types.h
index 3d0e611c97ba..9594965a54e7 100644
--- a/arch/x86/include/asm/cpuid/types.h
+++ b/arch/x86/include/asm/cpuid/types.h
@@ -28,9 +28,13 @@ enum cpuid_regs_idx {
 #define CPUID_LEAF_MWAIT	0x05
 #define CPUID_LEAF_DCA		0x09
 #define CPUID_LEAF_XSTATE	0x0d
+#define CPUID_LEAF_RDT_M	0x0f
+#define CPUID_LEAF_RDT_A	0x10
 #define CPUID_LEAF_TSC		0x15
 #define CPUID_LEAF_FREQ		0x16
 #define CPUID_LEAF_TILE		0x1d
+#define CPUID_LEAF_RDT_M_ASYM	0x27
+#define CPUID_LEAF_RDT_A_ASYM	0x28
 
 #define CPUID_RANGE(idx)	((idx) & 0xffff0000)
 #define CPUID_RANGE_MAX(idx)	(CPUID_RANGE(idx) + 0xffff)
diff --git a/arch/x86/kernel/cpu/resctrl/core.c b/arch/x86/kernel/cpu/resctrl/core.c
index 709075ffc706..c66ff4cdd84b 100644
--- a/arch/x86/kernel/cpu/resctrl/core.c
+++ b/arch/x86/kernel/cpu/resctrl/core.c
@@ -235,7 +235,7 @@ static __init bool __get_mem_config_intel(struct rdt_resource *r)
 	union cpuid_0x10_x_edx edx;
 	u32 ebx, ecx, max_delay;
 
-	cpuid_count(0x00000010, 3, &eax.full, &ebx, &ecx, &edx.full);
+	cpuid_count(CPUID_LEAF_RDT_A, 3, &eax.full, &ebx, &ecx, &edx.full);
 	hw_res->num_closid = edx.split.cos_max + 1;
 	max_delay = eax.split.max_delay + 1;
 
@@ -357,7 +357,7 @@ static void rdt_get_cache_alloc_cfg(int idx, struct rdt_resource *r)
 	union cpuid_0x10_x_edx edx;
 	u32 ebx, default_ctrl;
 
-	cpuid_count(0x00000010, idx, &eax.full, &ebx, &ecx.full, &edx.full);
+	cpuid_count(CPUID_LEAF_RDT_A, idx, &eax.full, &ebx, &ecx.full, &edx.full);
 	hw_res->num_closid = edx.split.cos_max + 1;
 	hw_ctrl = kzalloc_obj(*hw_ctrl);
 	if (!hw_ctrl)
@@ -1196,7 +1196,7 @@ void resctrl_cpu_detect(struct cpuinfo_x86 *c)
 	}
 
 	/* will be overridden if occupancy monitoring exists */
-	c->x86_cache_max_rmid = cpuid_ebx(0xf);
+	c->x86_cache_max_rmid = cpuid_ebx(CPUID_LEAF_RDT_M);
 
 	if (cpu_has(c, X86_FEATURE_CQM_OCCUP_LLC) ||
 	    cpu_has(c, X86_FEATURE_CQM_MBM_TOTAL) ||
@@ -1205,7 +1205,7 @@ void resctrl_cpu_detect(struct cpuinfo_x86 *c)
 		u32 eax, ebx, ecx, edx;
 
 		/* QoS sub-leaf, EAX=0Fh, ECX=1 */
-		cpuid_count(0xf, 1, &eax, &ebx, &ecx, &edx);
+		cpuid_count(CPUID_LEAF_RDT_M, 1, &eax, &ebx, &ecx, &edx);
 
 		c->x86_cache_max_rmid  = ecx;
 		c->x86_cache_occ_scale = ebx;
-- 
2.56.0

