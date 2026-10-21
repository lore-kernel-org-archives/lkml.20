Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792612309;
	b=tJF6bk62+niIlbUEPmEffsSRPkmKmThVGkzmkasaoGeso65TrNR5UqLPNqwMArtUIKTA
	 Y9foj4K7XfMOLbe7LLnCUDVAfuyXDhL4Mp24ahVOyMKVKluYxTZKRDsphH93NgKDWD+zW
	 ujaCYDHtMcnDrUgTr6GPWswjpINITzDnW33okOcV7vZBowhEbSSIBQlFKBfIspiNQBej0
	 tVHjG6UlZ8w1+swG9tcCfcCCNaxnr0z7BHbTL7FFpFjrqxlZ9zadMB95Bz4+5UlGUnu3v
	 1MiL/gfPm+SkO6RqLYDu0NziEUz5omwu3ktZCmrehBZWeZ3v2lupb0L84Ak7S/EPoQA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792612309;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Subject:To:Cc:From:
	 Date:References:In-Reply-To:Message-Id;
	bh=FZ9+k9ouvHhHUlk2AIJJKXInlqQvA8diqXLTlJ6hSzU=;
	b=Mb2Z4v87N9scKLu6Yr17hu0zSLWDNcCfr9JCgbV/9aQGoouAPX7dPTbSDGdbXmZKEPOT
	 XNGwpKbfMis0FRNzKyKN9pkB1sGt/FpzmV/dbVQBH3EyiWJg1KOM/RLsz+4nDWJivBtGK
	 r/YgbXb7fqe6rF53XvlUr7bwxSKE/MsTZlNOQWwVdqhJ/HvavsglDDmcBwntWrGZ0oZPV
	 LPnXsvPvLUtYd11WuyhIYerDIwNIQG2Ro0R3lskI4opf6b6vosIXZseMsFKwK4jRryDde
	 M0bevmuXmaQyGOREn93ESwM9QLiIDUTigp/Dzt8eqVh05FPkpl/nyl/Wac64DywDzsw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=KE2IHzVd;
	arc=none smtp.remote-ip=198.175.65.12
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6152A60A6F43
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 19:51:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6152A60A6F43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=KE2IHzVd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792612309; x=1824148309;
  h=subject:to:cc:from:date:references:in-reply-to:
   message-id;
  bh=Ab43Qr4vfczLfB1FduwwybiDMe2hYpM/T6am14QM4B0=;
  b=KE2IHzVdR6lJVnVTRjWXgaTBSzwWH5TA42MFLBYko/OHAWZl7Ve21KjA
   fxdG1rjNFERBSu5Jm1wkFfzmSd8jU6k05PGjLzdLNFjh75lAjNNuiJpCG
   saalqqSUtUgJ6Gl52J/MVCAdMFDTmDWqRfOYrgKAjv9xhiyLZJzKTBt/8
   oWEUUy7fhXz11ObJbXyH2aRbNOnAuf1BbgygxF9taeFQ3o1iFmdQkGFPI
   70MC4k8n/w6zQ1Qq20ZP9OsckhqW2idDqqYQFVbNUcyq2DPFwrQc6PaVR
   VeAsmJ8IZGIkyQIw9l8SSBQUKYqHHbwXY+8tU0OHPFv3qScCwdvkGBi3i
   A==;
X-CSE-ConnectionGUID: ANJBxydnTjyXUEtiIYPcDw==
X-CSE-MsgGUID: 60v2Oo7JQxqo4dTllCowEw==
X-IronPort-AV: E=McAfee;i="6800,10657,11942"; a="1230259"
X-IronPort-AV: E=Sophos;i="6.27,170,1787036400"; 
   d="scan'208";a="1230259"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2026 12:51:49 -0700
X-CSE-ConnectionGUID: XLIMiv1FQaCrx2hXXfdzYQ==
X-CSE-MsgGUID: IiW1DXqjRHGXDFnsutDTSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,170,1787036400"; 
   d="scan'208";a="3092245"
Received: from davehans-spike.ostc.intel.com (HELO localhost.localdomain) ([10.165.164.11])
  by orviesa007.jf.intel.com with ESMTP; 21 Oct 2026 12:51:49 -0700
Subject: [RFC][PATCH 21/24] x86/extable: Update shadow stack entry frame during RIP overwrites
To: linux-kernel@vger.kernel.org
Cc: Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>, Edgecombe, Rick P <rick.p.edgecombe@intel.com>, Andrew Cooper <andrew.cooper3@citrix.com>, the arch/x86 maintainers <x86@kernel.org>, Kees Cook <kees@kernel.org>, Pawan Gupta <pawan.kumar.gupta@linux.intel.com>, Borislav Petkov <bp@alien8.de>, Thomas Gleixner <tglx@kernel.org>, Dave Hansen <dave.hansen@linux.intel.com>
From: Dave Hansen <dave.hansen@linux.intel.com>
Date: Wed, 21 Oct 2026 12:51:49 -0700
References: <20261021195120.E61EC737@davehans-spike.ostc.intel.com>
In-Reply-To: <20261021195120.E61EC737@davehans-spike.ostc.intel.com>
Message-Id: <20261021195149.174475BA@davehans-spike.ostc.intel.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list


Previous work stashed the entry SSP value on the regular (RSP) stack.
Use that stashed value to locate the FRED entry frame on the shadow
stack. Update the "LIP" value in that frame to match the updated
regs->rip value.

The now-matching values will keep FRED happy during ERETS.

Also include a stub function for non-CET builds.

This "rewrite rip" infrastructure will get used in quite a few other
locations. The extable site is the most critical. Do it first. A
normal kernel won't boot without it because it allows kernel
exceptions to be "stepped over" for "safe" variants like wrmsr_safe().

---

 b/arch/x86/include/asm/insn-eval.h     |   12 +++++++
 b/arch/x86/include/asm/special_insns.h |    7 ++++
 b/arch/x86/kernel/cet.c                |   54 +++++++++++++++++++++++++++++++++
 b/arch/x86/mm/extable.c                |    2 -
 4 files changed, 74 insertions(+), 1 deletion(-)

diff -puN arch/x86/include/asm/insn-eval.h~fred-entry-ssp-muck arch/x86/include/asm/insn-eval.h
--- a/arch/x86/include/asm/insn-eval.h~fred-entry-ssp-muck	2026-10-21 12:36:43.032890836 -0700
+++ b/arch/x86/include/asm/insn-eval.h	2026-10-21 12:36:43.041890854 -0700
@@ -82,4 +82,16 @@ static inline void insn_assign_reg(unsig
 	}
 }
 
+#ifdef CONFIG_X86_CET
+void regs_set_return_ip(struct pt_regs *regs, unsigned long ip);
+#else
+static inline void regs_set_return_ip(struct pt_regs *regs, unsigned long ip)
+{
+	/* This is only for changing kernel return addresses: */
+	WARN_ON_ONCE(user_mode(regs));
+
+	regs->ip = ip;
+}
+#endif
+
 #endif /* _ASM_X86_INSN_EVAL_H */
diff -puN arch/x86/include/asm/special_insns.h~fred-entry-ssp-muck arch/x86/include/asm/special_insns.h
--- a/arch/x86/include/asm/special_insns.h~fred-entry-ssp-muck	2026-10-21 12:36:43.034890840 -0700
+++ b/arch/x86/include/asm/special_insns.h	2026-10-21 12:36:43.042890856 -0700
@@ -303,6 +303,13 @@ static __always_inline void tile_release
 	asm volatile(".byte 0xc4, 0xe2, 0x78, 0x49, 0xc0");
 }
 
+static __always_inline void wrss(u64 val, u64 *addr)
+{
+	asm volatile("wrssq %[val], %[addr]"
+		     : [addr] "=m" (*addr)
+		     : [val] "r" (val));
+}
+
 #endif /* __KERNEL__ */
 
 #endif /* _ASM_X86_SPECIAL_INSNS_H */
diff -puN arch/x86/kernel/cet.c~fred-entry-ssp-muck arch/x86/kernel/cet.c
--- a/arch/x86/kernel/cet.c~fred-entry-ssp-muck	2026-10-21 12:36:43.036890844 -0700
+++ b/arch/x86/kernel/cet.c	2026-10-21 12:36:43.042890856 -0700
@@ -4,6 +4,8 @@
 #include <asm/bugs.h>
 #include <asm/msr.h>
 #include <asm/traps.h>
+#include <asm/insn-eval.h>
+#include <asm/special_insns.h>
 
 enum cp_error_code {
 	CP_EC        = (1 << 15) - 1,
@@ -160,3 +162,55 @@ DEFINE_IDTENTRY_ERRORCODE(exc_control_pr
 			do_unexpected_cp(regs, error_code);
 	}
 }
+
+/*
+ * FRED hardware pushes this frame on to the shadow stack for
+ * kernel=>kernel entry. First (lowest address) in this struct
+ * is the last entry pushed by the hardware.
+ */
+struct fred_shstk_entry_frame {
+	u64 ssef_ssp;
+	u64 ssef_lip;
+	u64 ssef_cs;
+};
+
+/*
+ * The kernel=>kernel entry code pushes SSP on to the entry stack.
+ * This only occurs for kernel=>kernel entry. Not userspace.
+ *
+ * SSP is pushed on to the frame below pt_regs. At the point it is
+ * pushed, it points to a special FRED entry frame.
+ */
+struct fred_kernel_frame {
+	struct fred_shstk_entry_frame *ssef;
+	struct pt_regs regs;
+};
+
+/*
+ * Change the return IP of an event. Use this instead of directly
+ * manipulating regs->ip.
+ *
+ * The hardware saves a special FRED entry frame on to the shadow
+ * stack. It contains the RIP of the interrupted context. ERETS
+ * ensures that this matches regs->ip.
+ *
+ * Update the FRED entry frame in addition to regs->ip.
+ */
+void regs_set_return_ip(struct pt_regs *regs, unsigned long ip)
+{
+	struct fred_shstk_entry_frame *ssef;
+
+	regs->ip = ip;
+
+	if (!cpu_feature_enabled(X86_FEATURE_KERN_SHSTK))
+		return;
+
+	/* Only kernel-mode events save the 'ssef' pointer. */
+	WARN_ON_ONCE(user_mode(regs));
+
+	ssef = container_of(regs, struct fred_kernel_frame, regs)->ssef;
+	if (!ssef)
+		return;
+
+	wrss(ip, &ssef->ssef_lip);
+}
diff -puN arch/x86/mm/extable.c~fred-entry-ssp-muck arch/x86/mm/extable.c
--- a/arch/x86/mm/extable.c~fred-entry-ssp-muck	2026-10-21 12:36:43.039890850 -0700
+++ b/arch/x86/mm/extable.c	2026-10-21 12:36:43.042890856 -0700
@@ -38,7 +38,7 @@ static bool ex_handler_default(const str
 	if (e->data & EX_FLAG_CLEAR_DX)
 		regs->dx = 0;
 
-	regs->ip = ex_fixup_addr(e);
+	regs_set_return_ip(regs, ex_fixup_addr(e));
 	return true;
 }
 
_
