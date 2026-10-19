Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792443066;
	b=p9LuAXO97ImbO+zCB9XaonLhAgbGq0DnqG+XLCN3kkdPAlYeN1VwUakq8R9BLNPtrMji
	 kuGqZfs2nrDHKCS5zGEvDOyf8kF1PEci17qkLg4MXE7sWDqNeByHgwRNqD7FIn1nIeYU5
	 A6YUkvCxvSAXFusjxDljHXjk4XHfdK3sWl54DjP6FlM86DcF1VhpvHW+X06TBY31Lo3Rz
	 akE3xKeRGpEKXVrfFIwPZcxNmC5bS5u7OONKzj9nLS4fX+BjioNWCGP2rIJa0s6pSq2SA
	 x3l5WhC7elAuV9u5bnQJeyONHNN2tOeyRxMuXo/d8Nctm8XTyHTm2Dkcuz0qPmMKzPg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792443066;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=CaWuUKCLnDkY1goQ4qPQ732xwjLW6llx4MJoHFMDOCc=;
	b=TXJH4sPhC/f3xcU0KXLR6Wu/TAhBbm529BXinLzw4dwB61mGJngz+dEvkIf7HM27qjbj
	 xNUlcmC/8nXGDURYVH7gnoTABn60elzOwdBSXZRpp7mBwW89VS0sgah53VWwoWofadHjv
	 6PvCvhtlBiTDPc+yJqdPK2ipBGlz5aO5k0KJIp+5sFlggMQO2YxzH645mDPVKXLcKUilb
	 suvOqERUg5/QSk5MZwBgFFRECIetmGzxUEAeobhoRaHGLGsrICj9vwtGmp6b4A+/zzm9g
	 wFGRCjMpkw5/JgufHNYkkUj2YP4wljNgC+iOuYkglrlSEheaZPcRle86/yZ61JT7Tlg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=aZIb4Odo;
	arc=none smtp.remote-ip=198.175.65.16
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A08A606A328
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 20:50:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9A08A606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=aZIb4Odo
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792443053; x=1823979053;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=E1DGaniKkHlUROpMqW4y0ZxxqRsXPH56KuSd/JrAwLk=;
  b=aZIb4OdoWDLjs1AOW5haz5JYtlyuoy7Exnjbf5OgGvCm+ze5X12NuMzG
   ttLSfJS1LzCS5Aby16l8ybB+h8FCxuHYfh71JlDGdJp3rudc84cdHS+KH
   NEqKeFwzMyNrlb+/Utc0Uuz1TLpOeaFBHSL1fNrOT9I+WKNIj2b5W8v44
   u0AyfDPYvR3zVtTRU4a+BslBkPjDtrJiWKHhMEX2Yi4MB0WcPKnZVPjC2
   y9inuegK6/1qbj5pHZQTCIkURjNtuWmS3rNGcc+8EPlr602GG5eTV9wPs
   9NOyTJA41CM7J8oCLxX3DEbZzcqdHcGu9ZzuMGXopu0LYq3it377vruuz
   A==;
X-CSE-ConnectionGUID: Bs/kCs3qRkezXk+WPOL6ag==
X-CSE-MsgGUID: JZCJ1dgCSICS4HuNKmpHZg==
X-IronPort-AV: E=McAfee;i="6800,10657,11940"; a="1131150"
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="1131150"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2026 13:50:48 -0700
X-CSE-ConnectionGUID: ZQnfnfJPS1qbKytlPJ/Y3g==
X-CSE-MsgGUID: hDn7FUBjRtqL+csoS3zdlQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="3008632"
Received: from spandruv-mobl5.amr.corp.intel.com (HELO agluck-desk3.intel.com) ([10.124.220.87])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2026 13:50:49 -0700
From: Tony Luck <tony.luck@intel.com>
To: Fenghua Yu <fenghuay@nvidia.com>,
	Reinette Chatre <reinette.chatre@intel.com>,
	Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>,
	Peter Newman <peternewman@google.com>,
	James Morse <james.morse@arm.com>,
	Babu Moger <babu.moger@amd.com>,
	Drew Fustini <dfustini@baylibre.com>,
	Dave Martin <Dave.Martin@arm.com>,
	Chen Yu <yu.c.chen@intel.com>,
	David E Box <david.e.box@intel.com>,
	x86@kernel.org
Cc: Christoph Hellwig <hch@infradead.org>,
	linux-kernel@vger.kernel.org,
	patches@lists.linux.dev,
	Tony Luck <tony.luck@intel.com>,
	"Borislav Petkov (AMD)" <bp@alien8.de>
Subject: [PATCH v14 05/24] x86/resctrl: Delete resctrl_cpu_detect()
Date: Mon, 19 Oct 2026 13:50:12 -0700
Message-ID: <20261019205031.16977-6-tony.luck@intel.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261019205031.16977-1-tony.luck@intel.com>
References: <20261019205031.16977-1-tony.luck@intel.com>
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

resctrl now enumerates its monitoring properties itself, leaving the resctrl
fields in cpuinfo_x86 without any consumers. These resctrl specific fields
are populated from the vendor CPU identification paths.

This unnecessarily placing resctrl details in generic x86 CPU setup.

Delete the unused fields together with the code that populates them, removing
resctrl from early CPU identification.

Signed-off-by: Tony Luck <tony.luck@intel.com>
Acked-by: Borislav Petkov (AMD) <bp@alien8.de>
---
v14:
	Split first paragraph into two: context and problem.
	Don't list all the fields as a regex.
---
 arch/x86/include/asm/processor.h   |  4 ---
 arch/x86/include/asm/resctrl.h     |  3 ---
 arch/x86/kernel/cpu/amd.c          |  3 ---
 arch/x86/kernel/cpu/hygon.c        |  3 ---
 arch/x86/kernel/cpu/intel.c        |  7 -----
 arch/x86/kernel/cpu/resctrl/core.c | 42 ------------------------------
 6 files changed, 62 deletions(-)

diff --git a/arch/x86/include/asm/processor.h b/arch/x86/include/asm/processor.h
index ec9db0dfa0df..4deb88c61c94 100644
--- a/arch/x86/include/asm/processor.h
+++ b/arch/x86/include/asm/processor.h
@@ -185,10 +185,6 @@ struct cpuinfo_x86 {
 	/* in KB - valid for CPUS which support this call: */
 	unsigned int		x86_cache_size;
 	int			x86_cache_alignment;	/* In bytes */
-	/* Cache QoS architectural values, valid only on the BSP: */
-	int			x86_cache_max_rmid;	/* max index */
-	int			x86_cache_occ_scale;	/* scale to bytes */
-	int			x86_cache_mbm_width_offset;
 	int			x86_power;
 	unsigned long		loops_per_jiffy;
 	/* protected processor identification number */
diff --git a/arch/x86/include/asm/resctrl.h b/arch/x86/include/asm/resctrl.h
index c9f9db96f792..2031b30ff25b 100644
--- a/arch/x86/include/asm/resctrl.h
+++ b/arch/x86/include/asm/resctrl.h
@@ -193,12 +193,9 @@ static inline void resctrl_arch_mon_ctx_free(struct rdt_resource *r,
 					     enum resctrl_event_id evtid,
 					     void *ctx) { }
 
-void resctrl_cpu_detect(struct cpuinfo_x86 *c);
-
 #else
 
 static inline void resctrl_arch_sched_in(struct task_struct *tsk) {}
-static inline void resctrl_cpu_detect(struct cpuinfo_x86 *c) {}
 
 #endif /* CONFIG_X86_CPU_RESCTRL */
 
diff --git a/arch/x86/kernel/cpu/amd.c b/arch/x86/kernel/cpu/amd.c
index 54e14ed276b5..dd82a11084f4 100644
--- a/arch/x86/kernel/cpu/amd.c
+++ b/arch/x86/kernel/cpu/amd.c
@@ -23,7 +23,6 @@
 #include <asm/pci-direct.h>
 #include <asm/delay.h>
 #include <asm/debugreg.h>
-#include <asm/resctrl.h>
 #include <asm/msr.h>
 #include <asm/sev.h>
 
@@ -475,8 +474,6 @@ static void bsp_init_amd(struct cpuinfo_x86 *c)
 		}
 	}
 
-	resctrl_cpu_detect(c);
-
 	/* Figure out Zen generations: */
 	switch (c->x86) {
 	case 0x17:
diff --git a/arch/x86/kernel/cpu/hygon.c b/arch/x86/kernel/cpu/hygon.c
index ec51c2b9a257..0f226335dd9a 100644
--- a/arch/x86/kernel/cpu/hygon.c
+++ b/arch/x86/kernel/cpu/hygon.c
@@ -17,7 +17,6 @@
 #include <asm/spec-ctrl.h>
 #include <asm/delay.h>
 #include <asm/msr.h>
-#include <asm/resctrl.h>
 
 #include "cpu.h"
 
@@ -119,8 +118,6 @@ static void bsp_init_hygon(struct cpuinfo_x86 *c)
 			x86_amd_ls_cfg_ssbd_mask = 1ULL << 10;
 		}
 	}
-
-	resctrl_cpu_detect(c);
 }
 
 static void early_init_hygon(struct cpuinfo_x86 *c)
diff --git a/arch/x86/kernel/cpu/intel.c b/arch/x86/kernel/cpu/intel.c
index 4297ceb2cb24..2f09710e863c 100644
--- a/arch/x86/kernel/cpu/intel.c
+++ b/arch/x86/kernel/cpu/intel.c
@@ -22,7 +22,6 @@
 #include <asm/microcode.h>
 #include <asm/msr.h>
 #include <asm/numa.h>
-#include <asm/resctrl.h>
 #include <asm/thermal.h>
 #include <asm/uaccess.h>
 
@@ -371,11 +370,6 @@ static void early_init_intel(struct cpuinfo_x86 *c)
 		detect_tme_early(c);
 }
 
-static void bsp_init_intel(struct cpuinfo_x86 *c)
-{
-	resctrl_cpu_detect(c);
-}
-
 #ifdef CONFIG_X86_32
 /*
  *	Early probe support logic for ppro memory erratum #50
@@ -804,7 +798,6 @@ static const struct cpu_dev intel_cpu_dev = {
 #endif
 	.c_detect_tlb	= intel_detect_tlb,
 	.c_early_init   = early_init_intel,
-	.c_bsp_init	= bsp_init_intel,
 	.c_init		= init_intel,
 	.c_x86_vendor	= X86_VENDOR_INTEL,
 };
diff --git a/arch/x86/kernel/cpu/resctrl/core.c b/arch/x86/kernel/cpu/resctrl/core.c
index 82b27a0157ae..f0cfb37482d3 100644
--- a/arch/x86/kernel/cpu/resctrl/core.c
+++ b/arch/x86/kernel/cpu/resctrl/core.c
@@ -1083,48 +1083,6 @@ static __init void rdt_init_res_defs(void)
 
 static enum cpuhp_state rdt_online;
 
-/* Runs once on the BSP during boot. */
-void resctrl_cpu_detect(struct cpuinfo_x86 *c)
-{
-	if (!cpu_has(c, X86_FEATURE_CQM_LLC) && !cpu_has(c, X86_FEATURE_ABMC)) {
-		c->x86_cache_max_rmid  = -1;
-		c->x86_cache_occ_scale = -1;
-		c->x86_cache_mbm_width_offset = -1;
-		return;
-	}
-
-	/* will be overridden if occupancy monitoring exists */
-	c->x86_cache_max_rmid = cpuid_ebx(0xf);
-
-	if (cpu_has(c, X86_FEATURE_CQM_OCCUP_LLC) ||
-	    cpu_has(c, X86_FEATURE_CQM_MBM_TOTAL) ||
-	    cpu_has(c, X86_FEATURE_CQM_MBM_LOCAL) ||
-	    cpu_has(c, X86_FEATURE_ABMC)) {
-		u32 eax, ebx, ecx, edx;
-
-		/* QoS sub-leaf, EAX=0Fh, ECX=1 */
-		cpuid_count(0xf, 1, &eax, &ebx, &ecx, &edx);
-
-		c->x86_cache_max_rmid  = ecx;
-		c->x86_cache_occ_scale = ebx;
-		c->x86_cache_mbm_width_offset = eax & 0xff;
-
-		if (!c->x86_cache_mbm_width_offset) {
-			switch (c->x86_vendor) {
-			case X86_VENDOR_AMD:
-				c->x86_cache_mbm_width_offset = MBM_CNTR_WIDTH_OFFSET_AMD;
-				break;
-			case X86_VENDOR_HYGON:
-				c->x86_cache_mbm_width_offset = MBM_CNTR_WIDTH_OFFSET_HYGON;
-				break;
-			default:
-				/* Leave c->x86_cache_mbm_width_offset as 0 */
-				break;
-			}
-		}
-	}
-}
-
 static int __init resctrl_arch_late_init(void)
 {
 	struct rdt_resource *r;
-- 
2.56.0

