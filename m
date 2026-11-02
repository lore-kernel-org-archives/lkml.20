Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=90.155.50.34
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793619629;
	b=CSnrhZo5OcB2SRBkov5/CjLkxfTtvb+vQSon3/K8N9QLUUT/VM64LUSTHYLfKMG/1XGT
	 Iv+twfaJsaDt1kWyXep38G/d5PW4oN3p76JSoH9l1kU0j0Hwyx+12SUZ61oXJnK5SZmiL
	 M6+xBsAbEnk/1ketanAqwp2KxjayB4phaBdg26akbcWV+7UojM8LXmPSOiu+7JR6ax9oj
	 0x69fxQPSBMxXEV3vI1iahhJgJqDCwfexuSl9KkFbyt/dOljQ08yHvxlzRtb3ehWFRXyD
	 uIJPtKnMIRf/zTVf3vJOLrYr2bfABpmpzamQB4K31+wy3xf1kOzC7WtdeYiartrOCCw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793619629;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Message-ID:User-Agent:
	 Date:From:To:Cc:Subject:References:MIME-Version:Content-Type;
	bh=j5i3KGzgzJPb1Xto+y4NNqe0DoD3WTXzPOa1eT0oSHo=;
	b=iu6VE9Wh/POjWcJE3JgpC0H/x3AXBq7irZnhHhEP3vAgegJp3YdUgr0vvsFIUvw3Iaae
	 X2UbX2UyhmULtnBEv9EOQYJOrz48LzszlMHS0SeMJJaNJ3Q6atoYAHJ3m1PlCaMh4XToP
	 13CeZ+wc4VpUIidJkoolYqXbUfyvZj2hge9ZHPohkDwQJrxBGLYRQ9hR+srYdLQDtc+4s
	 D8dytBI/JNjZDEtnxUSPDlMAemz/NkCPU7Mz0Ei1c7goqf+rIDxh5s6TS8TDKLPqwJ8ar
	 FdMR99FiPTwi0CHeuXqaOIfG2Cb72HF4iE9q2qP72VJb9EsbF2+yQEpyo5Ta4O/SzMA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=infradead.org;
	spf=pass smtp.mailfrom=infradead.org;
	dkim=pass header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=Kzp5aiSG;
	arc=none smtp.remote-ip=90.155.50.34
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E402B606A32F
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 11:40:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E402B606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=Kzp5aiSG
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Type:MIME-Version:References:
	Subject:Cc:To:From:Date:Message-ID:Sender:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:In-Reply-To;
	bh=j5i3KGzgzJPb1Xto+y4NNqe0DoD3WTXzPOa1eT0oSHo=; b=Kzp5aiSGHvKQr8ef1ZYooiD54b
	BeYuKyTceh9CWzvvron3IWgURdD1LkfpNXTLILkzQ54KtfgjweKAgwhUzQkrDFOvlyBpZdhUUoyO+
	GtXLfjV3yMrx+iB0kbkvIOqsHyDI+VNGxYxgB+Bhd65gOBtbBYbS/JGgwQGadhPE4DNPr01K2YQuV
	mJ89uMRYvlqZQWSXL+1VbN2XBs6497OB7n02SuFy5Ud0091qmiXd8hJn/brt4Q4pcqHMhubuMAKQg
	ddJH8oc1JF6xtcfZR4pRbOHr0Gok24218YTkVH/vhc9DAjFpyoWd7MDLsqm0K4ZDdldXNAvcppUPi
	svLHlV1A==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNqOn-00000002K7b-1sgj;
	Mon, 02 Nov 2026 11:40:25 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 0)
	id 835D230313B; Mon, 02 Nov 2026 12:40:24 +0100 (CET)
Message-ID: <20261102114000.771366690@infradead.org>
User-Agent: quilt/0.68
Date: Mon, 02 Nov 2026 12:25:53 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: x86@kernel.org
Cc: linux-kernel@vger.kernel.org,
 peterz@infradead.org,
 jpoimboe@kernel.org,
 leitao@debian.org,
 keescook@chromium.org,
 hpa@zytor.com
Subject: [PATCH 4/6] x86_64/entry: Mark all syscalls __noendbr
References: <20261102112549.714541309@infradead.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8

Since system call dispatch is now strictly through direct calls, there is no
reason for the syscalls to be called indirectly. Mark them all __noendbr.

Notably, the sys_call_table[] is purely a lookup for tracing and the like,
nobody actually (should) dispatch anything through it, and with this we make
sure nobody *can*.

Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
---
 arch/x86/entry/syscall_32.c            |    5 +++--
 arch/x86/entry/syscall_64.c            |    7 ++++---
 arch/x86/include/asm/syscall_wrapper.h |   23 ++++++++++++-----------
 tools/objtool/check.c                  |    9 ++++++++-
 4 files changed, 27 insertions(+), 17 deletions(-)

--- a/arch/x86/entry/syscall_32.c
+++ b/arch/x86/entry/syscall_32.c
@@ -12,6 +12,7 @@
 #include <asm/traps.h>
 #include <asm/cpufeature.h>
 #include <asm/syscall.h>
+#include <asm/ibt.h>
 
 #ifdef CONFIG_IA32_EMULATION
 #define __SYSCALL_WITH_COMPAT(nr, native, compat)	__SYSCALL(nr, compat)
@@ -19,8 +20,8 @@
 #define __SYSCALL_WITH_COMPAT(nr, native, compat)	__SYSCALL(nr, native)
 #endif
 
-#define __SYSCALL(nr, sym) extern long __ia32_##sym(const struct pt_regs *);
-#define __SYSCALL_NORETURN(nr, sym) extern long __noreturn __ia32_##sym(const struct pt_regs *);
+#define __SYSCALL(nr, sym) extern __noendbr long __ia32_##sym(const struct pt_regs *);
+#define __SYSCALL_NORETURN(nr, sym) extern __noendbr long __noreturn __ia32_##sym(const struct pt_regs *);
 #include <asm/syscalls_32.h>
 #undef  __SYSCALL
 
--- a/arch/x86/entry/syscall_64.c
+++ b/arch/x86/entry/syscall_64.c
@@ -8,9 +8,10 @@
 #include <linux/entry-common.h>
 #include <linux/nospec.h>
 #include <asm/syscall.h>
+#include <asm/ibt.h>
 
-#define __SYSCALL(nr, sym) extern long __x64_##sym(const struct pt_regs *);
-#define __SYSCALL_NORETURN(nr, sym) extern long __noreturn __x64_##sym(const struct pt_regs *);
+#define __SYSCALL(nr, sym) extern __noendbr long __x64_##sym(const struct pt_regs *);
+#define __SYSCALL_NORETURN(nr, sym) extern __noendbr long __noreturn __x64_##sym(const struct pt_regs *);
 #include <asm/syscalls_64.h>
 #ifdef CONFIG_X86_X32_ABI
 #include <asm/syscalls_x32.h>
@@ -25,7 +26,7 @@
  * kernel/trace/trace_syscalls.c still wants to know the system
  * call address.
  */
-#define __SYSCALL(nr, sym) __x64_##sym,
+#define __SYSCALL(nr, sym) (void *)&__x64_##sym,
 const sys_call_ptr_t sys_call_table[] = {
 #include <asm/syscalls_64.h>
 };
--- a/arch/x86/include/asm/syscall_wrapper.h
+++ b/arch/x86/include/asm/syscall_wrapper.h
@@ -7,9 +7,10 @@
 #define _ASM_X86_SYSCALL_WRAPPER_H
 
 #include <asm/ptrace.h>
+#include <asm/ibt.h>
 
-extern long __x64_sys_ni_syscall(const struct pt_regs *regs);
-extern long __ia32_sys_ni_syscall(const struct pt_regs *regs);
+extern __noendbr long __x64_sys_ni_syscall(const struct pt_regs *regs);
+extern __noendbr long __ia32_sys_ni_syscall(const struct pt_regs *regs);
 
 /*
  * Instead of the generic __SYSCALL_DEFINEx() definition, the x86 version takes
@@ -83,22 +84,22 @@ extern long __ia32_sys_ni_syscall(const
 			__MAP(x, __SC_TYPE, __VA_ARGS__))		\
 
 #define __SYS_STUB0(abi, name)						\
-	long __##abi##_##name(const struct pt_regs *regs);		\
+	long __noendbr __##abi##_##name(const struct pt_regs *regs);	\
 	ALLOW_ERROR_INJECTION(__##abi##_##name, ERRNO);			\
-	long __##abi##_##name(const struct pt_regs *regs)		\
+	long __noendbr __##abi##_##name(const struct pt_regs *regs)	\
 		__alias(__do_##name);
 
 #define __SYS_STUBx(abi, name, ...)					\
-	long __##abi##_##name(const struct pt_regs *regs);		\
+	long __noendbr __##abi##_##name(const struct pt_regs *regs);	\
 	ALLOW_ERROR_INJECTION(__##abi##_##name, ERRNO);			\
-	long __##abi##_##name(const struct pt_regs *regs)		\
+	long __noendbr __##abi##_##name(const struct pt_regs *regs)	\
 	{								\
 		return __se_##name(__VA_ARGS__);			\
 	}
 
 #define __COND_SYSCALL(abi, name)					\
-	__weak long __##abi##_##name(const struct pt_regs *__unused);	\
-	__weak long __##abi##_##name(const struct pt_regs *__unused)	\
+	__weak long __noendbr __##abi##_##name(const struct pt_regs *__unused);	\
+	__weak long __noendbr __##abi##_##name(const struct pt_regs *__unused)	\
 	{								\
 		return sys_ni_syscall();				\
 	}
@@ -257,8 +258,8 @@ extern long __ia32_sys_ni_syscall(const
  * For VSYSCALLS, we need to declare these three syscalls with the new
  * pt_regs-based calling convention for in-kernel use.
  */
-long __x64_sys_getcpu(const struct pt_regs *regs);
-long __x64_sys_gettimeofday(const struct pt_regs *regs);
-long __x64_sys_time(const struct pt_regs *regs);
+long __noendbr __x64_sys_getcpu(const struct pt_regs *regs);
+long __noendbr __x64_sys_gettimeofday(const struct pt_regs *regs);
+long __noendbr __x64_sys_time(const struct pt_regs *regs);
 
 #endif /* _ASM_X86_SYSCALL_WRAPPER_H */
--- a/tools/objtool/check.c
+++ b/tools/objtool/check.c
@@ -4672,8 +4672,15 @@ static int validate_ibt(struct objtool_f
 		    !strcmp(sec->name, "__patchable_function_entries"))
 			continue;
 
-		for_each_reloc(sec->rsec, reloc)
+		for_each_reloc(sec->rsec, reloc) {
+			struct symbol *sym = find_symbol_containing(reloc->sec->base,
+								    reloc_offset(reloc));
+
+			if (sym && !strcmp(sym->name, "sys_call_table"))
+				continue;
+
 			warnings += validate_ibt_data_reloc(file, reloc);
+		}
 	}
 
 	return warnings;


