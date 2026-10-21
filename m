Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792612297;
	b=s0v0vOcSJ+PzAc+kGpLV8n4rfn3IK6GISts4EWrSR9XwbdDQ3igLLx0Z0sQ5dHjb1K4S
	 yfczNgIhUBTGMjDnEmWCMpoG/o/iEfoPsYrj4Ex9Vzj4ypwvnU8YocbWPvb1PHMpskCRa
	 Lt2DjE9/QJedmiC9Ccrh2ZMlXdggXEnNI+5D6e38KaMn/FT4pskQH/wOqb4JkaCD9GuWq
	 2nV0J4fSAmxj1l6csZ9um1iMUozaVnQvs50HQWklqsY5I2iPjseNaBSW1jutzY4vqjZrX
	 +uHhikaUpbZUAH0Vs0BtyEthupBvAehCTn003UKj7XBS81pCd0x7LEUJXx/Z+fXAcmw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792612297;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Subject:To:Cc:From:
	 Date:References:In-Reply-To:Message-Id;
	bh=d6P+I0z2Wd3sD7mDytYwCdvrJaMuAJCqd+VIxdHxD70=;
	b=U2Suh2QTq94yh1Ezf+Ubi4orMAt/hNfaUs9B/yP+pTFx252TAeAtDwwXiNL/XzZNpVaR
	 k/Sseynujv+d6SWLVuKN8IU5dBh9craU+h+BBJEdQqQdPDwn0trhQXmVTT01/ZnGPWuYs
	 8GzyP58CL9iaPxrYa6g/U1KQosuDvQ1JLBPDtOlNnK3Ck/D5N8K15W7aTktGSw0B87nkJ
	 a9ZlT3EE+OpuzD0AbKn6pTYkik7vGG/YbuiRqk4J4DfLQC6mlSVEqqdUt+urJ6BR23vNM
	 tf732+OY82mYDxglhK3M3JvUTrHNfi5qR6b7IpbYoLASmGZahEYE657assQiN2fAmXg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=PmDAkFNU;
	arc=none smtp.remote-ip=198.175.65.12
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 512C060A382C
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 19:51:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 512C060A382C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=PmDAkFNU
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792612297; x=1824148297;
  h=subject:to:cc:from:date:references:in-reply-to:
   message-id;
  bh=aHBiS2sGFOK73Jb4up4h2mhDvgEDZ86foYm5fBTESZ8=;
  b=PmDAkFNU72kgzyrdW7RBSA7UNzpN+TtVDbXsKBUt0t0ZJ9nFV1/UQnhh
   A8BTNmszSvQ/6w83RGj77b4sL+US7ux1Lq43oGoo3OQYsmhIpWUo/B6Nd
   7dtjVlSgXeoTonquAjmtOyZ6K+VuNnHFzgZbh8FbFBIAc7okdp1jum3JM
   C3NywQsf9gCwbDFH4WSPj+k+c07TmMNQ9w4umisw3m/u6OHVOs6CvHvk2
   ds6vEPbnvTKPqc9yBBeXeXlshs2QpkwY1LGCfbiK/W331bwp/zYjDFzoJ
   NXaQ/pLdh+RFAjAvsbeX8IOrwKhWzYMqZYqOk8mnOJo8J6IY/aXihbggU
   Q==;
X-CSE-ConnectionGUID: OqFs+z/sQeGO+Wtz+zVy9g==
X-CSE-MsgGUID: JEKKrEgCRV6WhGU6OYXxZQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11942"; a="1230154"
X-IronPort-AV: E=Sophos;i="6.27,170,1787036400"; 
   d="scan'208";a="1230154"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2026 12:51:37 -0700
X-CSE-ConnectionGUID: o0dRJyM+QZ2E7plCNMVNWw==
X-CSE-MsgGUID: aGeDbIjlQeKvPdN1bduplg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,170,1787036400"; 
   d="scan'208";a="3092125"
Received: from davehans-spike.ostc.intel.com (HELO localhost.localdomain) ([10.165.164.11])
  by orviesa007.jf.intel.com with ESMTP; 21 Oct 2026 12:51:37 -0700
Subject: [RFC][PATCH 12/24] x86/cea: Map and use FRED exception shadow stacks
To: linux-kernel@vger.kernel.org
Cc: Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>, Edgecombe, Rick P <rick.p.edgecombe@intel.com>, Andrew Cooper <andrew.cooper3@citrix.com>, the arch/x86 maintainers <x86@kernel.org>, Kees Cook <kees@kernel.org>, Pawan Gupta <pawan.kumar.gupta@linux.intel.com>, Borislav Petkov <bp@alien8.de>, Thomas Gleixner <tglx@kernel.org>, Dave Hansen <dave.hansen@linux.intel.com>
From: Dave Hansen <dave.hansen@linux.intel.com>
Date: Wed, 21 Oct 2026 12:51:36 -0700
References: <20261021195120.E61EC737@davehans-spike.ostc.intel.com>
In-Reply-To: <20261021195120.E61EC737@davehans-spike.ostc.intel.com>
Message-Id: <20261021195136.687DBEA2@davehans-spike.ostc.intel.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list


FRED hardware automatically switches stacks between levels on different
kinds of kernel entries. Each normal FRED "RSP" stack has a corresponding
"SSP" shadow stack.

Leverage the existing CPU Entry Area infrastructure. Add shadow stacks
for levels 1-3 right next to the existing RSP stacks. Map them with
shadow stack permissions. Last, point the FRED SSP MSRs at the exception
stacks.

Just like the task stacks, do not leave a guard page since regular and
shadow stacks have mutually exclusive permissions and serve as guards
for each other.

Nit: The "return style" of the new cea_map_stack() and wrmsr() code
looks superficially inconsistent. But each site is consistent with the
code around it, just not when looking at the two sites against each
other.

== Future Work ==

The *_stack_guard[] elements could probably be removed now. When in
use, shadow stacks serve as guard pages for the regular stacks. When
not in use, the shadow stack region could remain unmapped and also act
as a guard area. But that would take some more fancy dynamic mapping
work. The existing CEA code is dirt simple and doing anything dynamic
would add complexity. KISS. The downside is wasting three pages per
CPU when shadow stacks support is compiled in but not used at runtime.

---

 b/arch/x86/include/asm/cpu_entry_area.h |   15 +++++++++++++++
 b/arch/x86/kernel/fred.c                |   14 ++++++++++++++
 b/arch/x86/mm/cpu_entry_area.c          |    5 +++++
 3 files changed, 34 insertions(+)

diff -puN arch/x86/include/asm/cpu_entry_area.h~cea-estacks-shadows-1 arch/x86/include/asm/cpu_entry_area.h
--- a/arch/x86/include/asm/cpu_entry_area.h~cea-estacks-shadows-1	2026-10-21 12:36:38.292881759 -0700
+++ b/arch/x86/include/asm/cpu_entry_area.h	2026-10-21 12:36:38.320881812 -0700
@@ -10,6 +10,12 @@
 
 #ifdef CONFIG_X86_64
 
+#ifdef CONFIG_X86_KERN_SHADOW_STACK
+#define EXCEPTION_SHADOW_STKSZ	PAGE_SIZE
+#else
+#define EXCEPTION_SHADOW_STKSZ	0
+#endif
+
 #ifdef CONFIG_AMD_MEM_ENCRYPT
 #define VC_EXCEPTION_STKSZ	EXCEPTION_STKSZ
 #else
@@ -19,10 +25,13 @@
 /* Macro to enforce the same ordering and stack sizes */
 #define ESTACKS_MEMBERS(guardsize, optional_stack_size)		\
 	char	DF_stack_guard[guardsize];			\
+	char	DF_shadow_stack[EXCEPTION_SHADOW_STKSZ];	\
 	char	DF_stack[EXCEPTION_STKSZ];			\
 	char	NMI_stack_guard[guardsize];			\
+	char	NMI_shadow_stack[EXCEPTION_SHADOW_STKSZ];	\
 	char	NMI_stack[EXCEPTION_STKSZ];			\
 	char	DB_stack_guard[guardsize];			\
+	char	DB_shadow_stack[EXCEPTION_SHADOW_STKSZ];	\
 	char	DB_stack[EXCEPTION_STKSZ];			\
 	char	MCE_stack_guard[guardsize];			\
 	char	MCE_stack[EXCEPTION_STKSZ];			\
@@ -151,4 +160,10 @@ static __always_inline struct entry_stac
 #define __this_cpu_ist_bottom_va(name)					\
 	CEA_ESTACK_BOT(__this_cpu_read(cea_exception_stacks), name, stack)
 
+#define __this_cpu_shadow_bottom_va(name)				\
+	CEA_ESTACK_BOT(__this_cpu_read(cea_exception_stacks), name, shadow_stack)
+
+#define __this_cpu_shadow_top_va(name)					\
+	CEA_ESTACK_TOP(__this_cpu_read(cea_exception_stacks), name, shadow_stack)
+
 #endif
diff -puN arch/x86/kernel/fred.c~cea-estacks-shadows-1 arch/x86/kernel/fred.c
--- a/arch/x86/kernel/fred.c~cea-estacks-shadows-1	2026-10-21 12:36:38.294881762 -0700
+++ b/arch/x86/kernel/fred.c	2026-10-21 12:36:38.320881812 -0700
@@ -87,4 +87,18 @@ void cpu_init_fred_rsps(void)
 	wrmsrq(MSR_IA32_FRED_RSP1, __this_cpu_ist_top_va(DB));
 	wrmsrq(MSR_IA32_FRED_RSP2, __this_cpu_ist_top_va(NMI));
 	wrmsrq(MSR_IA32_FRED_RSP3, __this_cpu_ist_top_va(DF));
+
+	if (!cpu_has(&boot_cpu_data, X86_FEATURE_SHSTK))
+		return;
+
+	/*
+	 * ...and the FRED shadow stacks when supported by the CPU.
+	 *
+	 * Note that this is strictly checking CPU support, not the
+	 * kernel feature flag: X86_FEATURE_KERN_SHSTK. These MSRs
+	 * may get set and then never used.
+	 */
+	wrmsrq(MSR_IA32_FRED_SSP1, __this_cpu_shadow_top_va(DB));
+	wrmsrq(MSR_IA32_FRED_SSP2, __this_cpu_shadow_top_va(NMI));
+	wrmsrq(MSR_IA32_FRED_SSP3, __this_cpu_shadow_top_va(DF));
 }
diff -puN arch/x86/mm/cpu_entry_area.c~cea-estacks-shadows-1 arch/x86/mm/cpu_entry_area.c
--- a/arch/x86/mm/cpu_entry_area.c~cea-estacks-shadows-1	2026-10-21 12:36:38.318881808 -0700
+++ b/arch/x86/mm/cpu_entry_area.c	2026-10-21 12:36:38.321881814 -0700
@@ -162,6 +162,11 @@ static void __init percpu_setup_exceptio
 			cea_map_stack(VC2, stack, PAGE_KERNEL);
 		}
 	}
+
+	/* Map the per-CPU exception shadow stacks: */
+	cea_map_stack(DB,  shadow_stack, PAGE_KERNEL_SHSTK);
+	cea_map_stack(NMI, shadow_stack, PAGE_KERNEL_SHSTK);
+	cea_map_stack(DF,  shadow_stack, PAGE_KERNEL_SHSTK);
 }
 #else
 static void __init percpu_setup_exception_stacks(unsigned int cpu)
_
