Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792612314;
	b=zWhRN7yQNGrSk21XQBJjwNHEctTnJYQVyhnfYSxPRahroK57w/qjah2kmRoAy/PuZPb2
	 KpAb1gARUuaC0q+OLPDTeQwTwvik+4RghM4Y3HPvmGfFaIjn/3BhvBIvdqucX1CV5sJ7f
	 cynqfwjp7cWllOIVMREFafIWMW/JWdLFlspYrGGRVd7MomTIENT6Ctp8aH0xMKcGWthJh
	 eqXHUS/rrhrCmruhVZUs6di3LtC6r9GqUsYEoH7RoCP+FG6TMARWoJNuwoD7yht3yrhUg
	 AHkyPyOHhBOsBG0t17olmxKjs1Eta9m5RrvIAhaDe+wg8cOoHnkQkhkDYcogQs/xElQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792612314;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Subject:To:Cc:From:
	 Date:References:In-Reply-To:Message-Id;
	bh=qPt9BEF/RDif7/0SXlfyJ2FKzWgaF8fql1ROMkkYuXw=;
	b=jF8IIHTZzFCXrHs8QF8hO0YT3VWDZ5BpDPC6b4PZHUNLPiTSMfGTAVaSA4Y8y9BShTbZ
	 UqtKddEA8XvurEp89PQC/w+MZT5ExR53+vZFips5/3gvkNqGBYCe7ohJCbrOGS27CKdTW
	 //DOmLVayI9zWIxtZX8fifsMTDSzc0PliKpQsfop4cBxsS8nY9g0gWY9++QElNxVss0EK
	 1sP+e3LGbX8oiEOULwGmUNt9KKBWW11+ZbwQO18kJ1g02GuShn/7h62w03x3MNTJQFQC+
	 OunA7uJpN+Z7ZPDR36x8eyjCEtRpqIM2oxijtWPmzYnvO8nscH0h435xlXRyvI4f21w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=C3XdCGLp;
	arc=none smtp.remote-ip=198.175.65.12
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91EEA60A3822
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 19:51:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 91EEA60A3822
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=C3XdCGLp
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792612314; x=1824148314;
  h=subject:to:cc:from:date:references:in-reply-to:
   message-id;
  bh=jKbrjOBB0QQCJLFTM/btqEwFaAT3LvvNbCXvxmxUSRw=;
  b=C3XdCGLpdWZ5XONzCCOfMJqoS/4aK9djhN8lGWfG0zy0JDjjU8UEVJea
   8l2ndgW3FHym2BlrxuTlI23nHGFUuvmjLXd7xsa35FJZsbpETUhJTW78f
   5raQkgWXWiZLsk0rl8tdkOHfOwoZbOzabsa1CUSIvWmlQi1WsQgi/WgVA
   4mSLB+Rhyf1Q/iaaPknK5ZtMXGCjDrJBblhbofu1qecBrZoM+dK9r1rk8
   YcO1KXNxAdvjtZBvSofiJXophZiwXh/07bNrCu5842snWcLT44iEbSY7V
   TK9RRoA2/8aSrSWXTxrmEVxBR5dPZvR/uZErorwuSdMTnWWWVRkJogF6k
   A==;
X-CSE-ConnectionGUID: i8NWqRn5SIeGtl/vxCpHYA==
X-CSE-MsgGUID: qgNCAx8MR9mgCf5xecUwmg==
X-IronPort-AV: E=McAfee;i="6800,10657,11942"; a="1230290"
X-IronPort-AV: E=Sophos;i="6.27,170,1787036400"; 
   d="scan'208";a="1230290"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2026 12:51:53 -0700
X-CSE-ConnectionGUID: X+23EtW4TWGa6dBXzDbF7Q==
X-CSE-MsgGUID: 9/waGIfoT1Kchlgxi8BNZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,170,1787036400"; 
   d="scan'208";a="3092282"
Received: from davehans-spike.ostc.intel.com (HELO localhost.localdomain) ([10.165.164.11])
  by orviesa007.jf.intel.com with ESMTP; 21 Oct 2026 12:51:53 -0700
Subject: [RFC][PATCH 24/24] [DO NOT MERGE] x86/shstk: Depend out everything incompatible with kernel shadow stacks
To: linux-kernel@vger.kernel.org
Cc: Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>, Edgecombe, Rick P <rick.p.edgecombe@intel.com>, Andrew Cooper <andrew.cooper3@citrix.com>, the arch/x86 maintainers <x86@kernel.org>, Kees Cook <kees@kernel.org>, Pawan Gupta <pawan.kumar.gupta@linux.intel.com>, Borislav Petkov <bp@alien8.de>, Thomas Gleixner <tglx@kernel.org>, Dave Hansen <dave.hansen@linux.intel.com>
From: Dave Hansen <dave.hansen@linux.intel.com>
Date: Wed, 21 Oct 2026 12:51:53 -0700
References: <20261021195120.E61EC737@davehans-spike.ostc.intel.com>
In-Reply-To: <20261021195120.E61EC737@davehans-spike.ostc.intel.com>
Message-Id: <20261021195153.06D8D679@davehans-spike.ostc.intel.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list


Note: this is a 100% vibe-coded pile of goo. It will at least present
the rough scale of the work that's left to do though.

===

Kernel shadow stacks make the CPU check every RET against a second,
hardware-maintained stack of return addresses. Anything that "returns"
somewhere other than where the matching CALL came from takes a #CP.
Quite a lot of kernel code does exactly that, on purpose.

Exclude all of it at Kconfig time. This is deliberately the biggest
hammer available. Each dependency is annotated with the specific
construct that breaks so it can be revisited when that code is taught
about shadow stacks:

 * Retpolines, call depth tracking and SRSO Safe-RET all execute a RET
   whose return address was not pushed by the matching CALL.
 * Function graph tracing, rethook/fprobe, livepatch and error injection
   all hijack return addresses or redirect the IP that ftrace_regs_caller
   RETs to.
 * kprobes emulates CALL and RET by moving the return address on the
   regular stack only.
 * BPF trampolines return to the grandparent with SKIP_FRAME and
   bpf_throw() unwinds frames without executing their RETs.
 * kexec, hibernation and S3 resume all RET or jump into saved context
   without S_CET, the SSP MSRs or SSP itself being saved or restored.
 * EFI mixed mode uses LRETQ/LRET, which are shadow stack checked.
 * KVM refuses to load when host S_CET.SH_STK_EN is set and VMX loads
   HOST_SSP=0 on every VM-exit.
 * Xen PV runs the kernel in ring 3 without FRED.
 * kgdb writes regs->ip behind FRED's back.

Also document, in the same place, the features that were examined and
found compatible (rethunk, retbleed untrain, ITS thunks, clear_bhb_loop,
PTI by way of it clearing FRED, IBT, user shadow stacks), and the known
gaps that Kconfig can not express: text_poke_bp() CALL emulation,
direct regs->ip writes, the RSB_CTXSW fill in __switch_to_asm, and EFI
runtime services.

Runtime-selected mitigations (spectre_v2=retpoline on an eIBRS CPU,
retbleed=stuff, RSB filling) can not be caught here and are handled by
a separate runtime check in the CET init code.

---

 b/arch/x86/Kconfig |  107 +++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 107 insertions(+)

diff -puN arch/x86/Kconfig~kshstk-kconfig-depend-out-incompatible arch/x86/Kconfig
--- a/arch/x86/Kconfig~kshstk-kconfig-depend-out-incompatible	2026-10-21 12:36:44.598893837 -0700
+++ b/arch/x86/Kconfig	2026-10-21 12:36:44.601893842 -0700
@@ -1865,6 +1865,40 @@ config X86_USER_SHADOW_STACK
 
 	  If unsure, say N.
 
+# Kernel shadow stacks make the CPU check every RET against a second,
+# hardware-maintained stack of return addresses. Anything that
+# "returns" somewhere other than where the matching CALL came from
+# takes a #CP. That rules out a surprising amount of kernel code. The
+# dependencies below exclude all of it at build time. Each one names
+# the construct that breaks so it can be revisited when that code is
+# taught about shadow stacks.
+#
+# Examined and believed compatible, so NOT excluded here:
+#  - MITIGATION_RETHUNK: __x86_return_thunk is a plain RET.
+#  - MITIGATION_UNRET_ENTRY: retbleed_return_thunk is a plain RET and
+#    entry_untrain_ret is a balanced CALL/RET.
+#  - MITIGATION_ITS: the ITS indirect thunks are JMPs and
+#    its_return_thunk is a plain RET. (its=stuff is caught at runtime
+#    via X86_FEATURE_CALL_DEPTH.)
+#  - MITIGATION_SPECTRE_BHI: clear_bhb_loop() is balanced CALL/RET.
+#  - MITIGATION_PAGE_TABLE_ISOLATION: PTI clears X86_FEATURE_FRED at
+#    runtime and kernel shadow stacks require FRED, so the two can
+#    never be active together.
+#  - X86_KERNEL_IBT, X86_USER_SHADOW_STACK: separate CET controls.
+#
+# Known gaps that Kconfig can not express and that the design must
+# still handle:
+#  - text_poke_bp() CALL emulation (int3_emulate_call(), used by
+#    static_call and ftrace call-site patching and by the boot-time
+#    int3_selftest()) pushes the return address only on the regular
+#    stack.
+#  - Any code that writes regs->ip directly instead of going through
+#    regs_set_return_ip() leaves the FRED shadow stack frame stale.
+#  - The RSB_CTXSW RSB fill in __switch_to_asm pushes 32 bogus shadow
+#    stack entries. It is survivable only because SSP is reloaded
+#    with RSTORSSP immediately afterwards.
+#  - EFI runtime services run firmware code that is not shadow stack
+#    aware while kernel shadow stacks are live.
 config X86_KERN_SHADOW_STACK
 	bool "X86 kernel shadow stack"
 	depends on X86_FRED # implies X86_64
@@ -1873,6 +1907,79 @@ config X86_KERN_SHADOW_STACK
 	depends on VMAP_STACK
 	depends on AS_WRUSS
 	select X86_CET
+	# The retpoline sequence is "call; mov %reg,(%rsp); ret": the
+	# CALL pushes a shadow stack entry and the RET then uses a
+	# rewritten return address. Mismatch every time.
+	depends on !MITIGATION_RETPOLINE
+	# The indirect call thunks are retpoline-based (see above) and
+	# call_depth_return_thunk() refills the RSB with 16 CALLs, then
+	# does "add $128,%rsp; ret", leaving 16 stale shadow stack entries.
+	depends on !MITIGATION_CALL_DEPTH_TRACKING
+	# Safe-RET is "call srso_safe_ret" followed by
+	# "lea 8(%rsp),%rsp; ret": the RET consumes the caller's return
+	# address while the shadow stack top holds the CALL's.
+	depends on !MITIGATION_SRSO
+	# Replaces return addresses on the stack with return_to_handler,
+	# and return_to_handler itself returns with a retpoline-style
+	# "call; mov %rdi,(%rsp); ret".
+	depends on !FUNCTION_GRAPH_TRACER
+	# kprobe_emulate_call(), kprobe_emulate_ret() and
+	# kprobe_emulate_call_indirect() emulate CALL and RET by moving
+	# the return address on the regular stack only. KRETPROBES and
+	# OPTPROBES hang off this symbol as well.
+	depends on !KPROBES
+	# arch_rethook_trampoline() is a return address hijack: the
+	# probed function RETs to the trampoline instead of its caller.
+	# FPROBE selects RETHOOK.
+	depends on !RETHOOK
+	depends on !FPROBE
+	# klp_ftrace_handler() redirects execution by changing the
+	# ftrace_regs IP. ftrace_regs_caller writes that IP into the
+	# return slot and RETs to it, but the shadow stack still holds
+	# the original address.
+	depends on !LIVEPATCH
+	# override_function_with_return() points regs->ip at
+	# just_return_func, a bare RET that pops the probed function's
+	# return address without the function's own RET ever running.
+	depends on !FUNCTION_ERROR_INJECTION
+	# BPF trampolines with BPF_TRAMP_F_SKIP_FRAME do "add $8,%rsp; ret"
+	# to return to the grandparent. bpf_throw() unwinds BPF frames by
+	# walking the stack and resuming at the exception callback with
+	# the unwound RSP, skipping the intervening RETs.
+	depends on !BPF_JIT
+	# relocate_kernel() switches CR3 and CR4 with a shadow stack live
+	# and uses "pushq $0 ... ret" as the handoff into purgatory. It
+	# needs S_CET.SH_STK_EN cleared first, which nothing does yet.
+	depends on !KEXEC_CORE
+	# restore_registers() RETs on a stack reloaded from the image
+	# with S_CET, the PLx/FRED_SSPx MSRs and SSP itself never saved or
+	# restored. Same problem for do_suspend_lowlevel()/wakeup_long64(),
+	# which resume with "jmp *%rax" into the middle of the function
+	# and then RET.
+	depends on !HIBERNATION
+	depends on !SUSPEND
+	# __efi64_thunk() drops into 32-bit firmware with LRETQ and comes
+	# back with LRET. Far returns are shadow stack checked and expect
+	# a far CALL frame that was never pushed.
+	depends on !EFI_MIXED
+	# KVM snapshots host S_CET at load, refuses to load if SH_STK_EN
+	# is set (kvm_x86_vendor_init()), and VMX programs HOST_SSP=0 for
+	# every VM-exit. vmenter.S also runs FILL_RETURN_BUFFER before
+	# its RET when RSB_VMEXIT or RSB_VMEXIT_LITE is active.
+	depends on !KVM
+	# PV guests run the kernel in ring 3 without FRED. Kernel shadow
+	# stacks are FRED-only.
+	depends on !XEN_PV
+	# kgdb_arch_set_pc() writes regs->ip directly rather than through
+	# regs_set_return_ip(), so the FRED shadow stack frame goes stale.
+	# The breakpoint and single-step paths have not been audited.
+	depends on !KGDB
+	help
+	  Shadow stacks for the kernel itself. Every CALL pushes the
+	  return address on a second, hardware-protected stack and every
+	  RET checks it. Requires FRED. See the comments above for the
+	  long list of kernel features this is currently incompatible
+	  with.
 
 config INTEL_TDX_HOST
 	bool "Intel Trust Domain Extensions (TDX) host support"
_
