Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=90.155.50.34
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793619629;
	b=y8aWD3n8SCfZF4LpIHONW1KCePBGoTROQ7dG980hEemXc7HoXf//MKwfezjZaCCmgQBo
	 4fuhXhKWS+A6axQOVdymI0JCZANajf5hc+OTJDcT6vO/QdXlK35dmnPpghvYDRHtfKBpr
	 RsudLbUKlDY2XBUKfNp9bIc0YSrVwDc0eaUe8lXuxsv1eBMq245BBq3r548OhpqGyn8oo
	 889eZ7PuiFLVOERRgJYRtR7FePTyDINvI5L8XAnTGZtfgQmBRvSdb2OC9d2KTDz3JyaWj
	 JaTqUXQAqjcOlwN0QyXwSHuypNLXOhHeya+IoDkss8/SqL8uuXoOffrqeG4hBDloTLg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793619629;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Message-ID:User-Agent:
	 Date:From:To:Cc:Subject:References:MIME-Version:Content-Type;
	bh=FtGpq/4OBWVzQmcI3KXphrHgavjsh+kN7JMOIKPIyEg=;
	b=AHJ6ENM+680halt9V7/20QuN8YxACReMIRt7hbchyYh26QmTmqT4MifrwXbB5iLhMF5S
	 yAprQVxWOK7oOR0pozrr5sz/V7uTYMUT+bswKprSdhW2oVBOSvv3eacrNZOeLD4VUOkW3
	 O2e0G5zcF12yPK+/1EbHJuFQmOwDN4/Ai9bXhq2dVfUdrLnJu6Mk7bYXnNRnf4QOex7WV
	 rq7C/QpHLM6raDDWJ8iahDjHsfIYHMI5vWkscgcLBhwAF28PzXf0ZW2WZJHBkS+XgaU4A
	 DxXinOeDn/L9QSLdiAoPGJUvLS4HRlzk4UeNeJCeFhcuw23IYwQX9wohP1JznvjoiVQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=infradead.org;
	spf=pass smtp.mailfrom=infradead.org;
	dkim=pass header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=XmqLDDdq;
	arc=none smtp.remote-ip=90.155.50.34
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3FF3606A32E
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 11:40:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E3FF3606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=XmqLDDdq
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Type:MIME-Version:References:
	Subject:Cc:To:From:Date:Message-ID:Sender:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:In-Reply-To;
	bh=FtGpq/4OBWVzQmcI3KXphrHgavjsh+kN7JMOIKPIyEg=; b=XmqLDDdqLo4wepjOg1v/ReHOq2
	ItZ7lAuwalgNuJsPrdBPaq8qqHbsgnwD28UA5fUzlD293QnGfVYdYgGxY3hbReiRegGoWh2se2Ph8
	0d5/c/anwCGVrylNNeyiDyt4zxjaAmAAcjoMQ7YsshWlCrOaA4gctJIfqVnRDFlPmtor61M20ANd+
	+/kBgkY53ixT+8yE2/Ltqnvh5GSj/RiQsYClp5wDbHpZ2ZdtyaTf6E8MMmRmxQVhMmWHpn8XyzCPK
	5ufjxKV/Z7OZM8XeccpJD+Vs1y7JLwThyD4sS/g+K+1DkUwC8tJNA4qP6sGV28V9us7fhxRPTneD+
	ptQZxX3Q==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNqOo-00000002K7o-0IaC;
	Mon, 02 Nov 2026 11:40:26 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 0)
	id 881CE303154; Mon, 02 Nov 2026 12:40:24 +0100 (CET)
Message-ID: <20261102114000.887706274@infradead.org>
User-Agent: quilt/0.68
Date: Mon, 02 Nov 2026 12:25:54 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: x86@kernel.org
Cc: linux-kernel@vger.kernel.org,
 peterz@infradead.org,
 jpoimboe@kernel.org,
 leitao@debian.org,
 keescook@chromium.org,
 hpa@zytor.com,
 kernel test robot <lkp@intel.com>
Subject: [PATCH 5/6] objtool: Allow EXPORT_SYMBOL() of __noendbr functions
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

Objtool IBT validation does two things:

 - it checks that all text references have an ENDBR instruction (WARN);
 - it finds all ENDBR instructions that have no references (SEAL).

The first ensures that all function pointers are of functions that have ENDBR,
since doing indirect calls requires this. The flip side is that you can have
text references that are not function pointers in the sense of later calling
them. Eg. ip_within_syscall_gap() will take the address of symbols, but will
never call them. Any such location that is referenced but does not have ENDBR
requires an ANNOTATE_NOENDBR.

The second is used to create a list of ENDBR instructions to SEAL. That is, at
boot time the kernel will replace all these ENDBR instructions with a NOP
instruction, limiting indirect targets.

Now, EXPORT_SYMBOL*(sym) is counted as a reference. This is important because
even if the kernel itself does not reference the symbol, a module still might.
The flip side is that exporting a __noendbr function needs an ANNOTATE_NOENDBR.

Relax this by supressing the objtool-WARN for .export_symbol references. This
allows exporting of __noendbr without further ANNOTATE_NOENDBR. Remove any such
now redudant annotation.

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
---
 arch/x86/entry/calling.h             |    1 -
 arch/x86/entry/entry_64.S            |    2 +-
 arch/x86/entry/entry_64_compat.S     |    6 +++---
 arch/x86/lib/clear_page_64.S         |    1 -
 arch/x86/lib/copy_user_64.S          |    1 -
 arch/x86/lib/copy_user_uncached_64.S |    1 -
 arch/x86/lib/getuser.S               |    4 ----
 arch/x86/lib/hweight.S               |    3 ---
 arch/x86/lib/putuser.S               |    4 ----
 tools/objtool/check.c                |   15 ++++++++++++---
 10 files changed, 16 insertions(+), 22 deletions(-)

--- a/arch/x86/entry/calling.h
+++ b/arch/x86/entry/calling.h
@@ -432,7 +432,6 @@ For 32-bit we have the following convent
 /* rdi:	arg1 ... normal C conventions. rax is saved/restored. */
 .macro THUNK name, func
 SYM_FUNC_START(\name)
-	ANNOTATE_NOENDBR
 	pushq %rbp
 	movq %rsp, %rbp
 
--- a/arch/x86/entry/entry_64.S
+++ b/arch/x86/entry/entry_64.S
@@ -95,7 +95,7 @@ SYM_CODE_START(entry_SYSCALL_64)
 	movq	PER_CPU_VAR(cpu_current_top_of_stack), %rsp
 
 SYM_INNER_LABEL(entry_SYSCALL_64_safe_stack, SYM_L_GLOBAL)
-	ANNOTATE_NOENDBR
+	ANNOTATE_NOENDBR // ip_within_syscall_gap
 
 	/* Construct struct pt_regs on stack */
 	pushq	$__USER_DS				/* pt_regs->ss */
--- a/arch/x86/entry/entry_64_compat.S
+++ b/arch/x86/entry/entry_64_compat.S
@@ -196,7 +196,7 @@ SYM_CODE_START(entry_SYSCALL_compat)
 	movq	PER_CPU_VAR(cpu_current_top_of_stack), %rsp
 
 SYM_INNER_LABEL(entry_SYSCALL_compat_safe_stack, SYM_L_GLOBAL)
-	ANNOTATE_NOENDBR
+	ANNOTATE_NOENDBR // ip_within_syscall_gap
 
 	/* Construct struct pt_regs on stack */
 	pushq	$__USER_DS		/* pt_regs->ss */
@@ -260,7 +260,7 @@ SYM_INNER_LABEL(entry_SYSCALL_compat_aft
          */
 	movq	RSP-ORIG_RAX(%rsp), %rsp
 SYM_INNER_LABEL(entry_SYSRETL_compat_unsafe_stack, SYM_L_GLOBAL)
-	ANNOTATE_NOENDBR
+	ANNOTATE_NOENDBR // ip_within_syscall_gap
 
 	/*
 	 * The original userspace %rsp (RSP-ORIG_RAX(%rsp)) is stored
@@ -280,7 +280,7 @@ SYM_INNER_LABEL(entry_SYSRETL_compat_uns
 	CLEAR_CPU_BUFFERS
 	sysretl
 SYM_INNER_LABEL(entry_SYSRETL_compat_end, SYM_L_GLOBAL)
-	ANNOTATE_NOENDBR
+	ANNOTATE_NOENDBR // ip_within_syscall_gap
 	int3
 SYM_CODE_END(entry_SYSCALL_compat)
 
--- a/arch/x86/lib/clear_page_64.S
+++ b/arch/x86/lib/clear_page_64.S
@@ -42,7 +42,6 @@ EXPORT_SYMBOL_GPL(__clear_pages_unrolled
  * rcx: uncleared bytes or 0 if successful.
  */
 SYM_FUNC_START(rep_stos_alternative)
-	ANNOTATE_NOENDBR
 	cmpq $64,%rcx
 	jae .Lunrolled
 
--- a/arch/x86/lib/copy_user_64.S
+++ b/arch/x86/lib/copy_user_64.S
@@ -32,7 +32,6 @@
  * it simpler for us, we can clobber rsi/rdi and rax freely.
  */
 SYM_FUNC_START(rep_movs_alternative)
-	ANNOTATE_NOENDBR
 	cmpq $64,%rcx
 	jae .Llarge
 
--- a/arch/x86/lib/copy_user_uncached_64.S
+++ b/arch/x86/lib/copy_user_uncached_64.S
@@ -28,7 +28,6 @@
  * rax uncopied bytes or 0 if successful.
  */
 SYM_FUNC_START(copy_to_nontemporal)
-	ANNOTATE_NOENDBR
 	/* If destination is not 7-byte aligned, we'll have to align it */
 	testb $7,%dil
 	jne .Lalign
--- a/arch/x86/lib/getuser.S
+++ b/arch/x86/lib/getuser.S
@@ -58,7 +58,6 @@
 
 	.text
 SYM_FUNC_START(__get_user_1)
-	ANNOTATE_NOENDBR
 	check_range size=1
 	ASM_STAC
 	UACCESS movzbl (%_ASM_AX),%edx
@@ -69,7 +68,6 @@ SYM_FUNC_END(__get_user_1)
 EXPORT_SYMBOL(__get_user_1)
 
 SYM_FUNC_START(__get_user_2)
-	ANNOTATE_NOENDBR
 	check_range size=2
 	ASM_STAC
 	UACCESS movzwl (%_ASM_AX),%edx
@@ -80,7 +78,6 @@ SYM_FUNC_END(__get_user_2)
 EXPORT_SYMBOL(__get_user_2)
 
 SYM_FUNC_START(__get_user_4)
-	ANNOTATE_NOENDBR
 	check_range size=4
 	ASM_STAC
 	UACCESS movl (%_ASM_AX),%edx
@@ -91,7 +88,6 @@ SYM_FUNC_END(__get_user_4)
 EXPORT_SYMBOL(__get_user_4)
 
 SYM_FUNC_START(__get_user_8)
-	ANNOTATE_NOENDBR
 #ifndef CONFIG_X86_64
 	xor %ecx,%ecx
 #endif
--- a/arch/x86/lib/hweight.S
+++ b/arch/x86/lib/hweight.S
@@ -10,8 +10,6 @@
  * %rdi: w
  */
 SYM_FUNC_START(__sw_hweight32)
-	ANNOTATE_NOENDBR
-
 #ifdef CONFIG_X86_64
 	movl %edi, %eax				# w
 #endif
@@ -44,7 +42,6 @@ EXPORT_SYMBOL(__sw_hweight32)
  */
 #ifdef CONFIG_X86_64
 SYM_FUNC_START(__sw_hweight64)
-	ANNOTATE_NOENDBR
 	pushq   %rdi
 	pushq   %rdx
 
--- a/arch/x86/lib/putuser.S
+++ b/arch/x86/lib/putuser.S
@@ -46,7 +46,6 @@
 
 .text
 SYM_FUNC_START(__put_user_1)
-	ANNOTATE_NOENDBR
 	check_range size=1
 	ASM_STAC
 1:	movb %al,(%_ASM_CX)
@@ -57,7 +56,6 @@ SYM_FUNC_END(__put_user_1)
 EXPORT_SYMBOL(__put_user_1)
 
 SYM_FUNC_START(__put_user_2)
-	ANNOTATE_NOENDBR
 	check_range size=2
 	ASM_STAC
 2:	movw %ax,(%_ASM_CX)
@@ -68,7 +66,6 @@ SYM_FUNC_END(__put_user_2)
 EXPORT_SYMBOL(__put_user_2)
 
 SYM_FUNC_START(__put_user_4)
-	ANNOTATE_NOENDBR
 	check_range size=4
 	ASM_STAC
 3:	movl %eax,(%_ASM_CX)
@@ -79,7 +76,6 @@ SYM_FUNC_END(__put_user_4)
 EXPORT_SYMBOL(__put_user_4)
 
 SYM_FUNC_START(__put_user_8)
-	ANNOTATE_NOENDBR
 	check_range size=8
 	ASM_STAC
 4:	mov %_ASM_AX,(%_ASM_CX)
--- a/tools/objtool/check.c
+++ b/tools/objtool/check.c
@@ -4597,7 +4597,7 @@ static int validate_ibt_insn(struct objt
 }
 
 static int validate_ibt_data_reloc(struct objtool_file *file,
-				   struct reloc *reloc)
+				   struct reloc *reloc, bool warn)
 {
 	struct instruction *dest;
 
@@ -4611,7 +4611,7 @@ static int validate_ibt_data_reloc(struc
 		return 0;
 	}
 
-	if (dest->noendbr)
+	if (dest->noendbr || !warn)
 		return 0;
 
 	WARN_FUNC(reloc->sec->base, reloc_offset(reloc),
@@ -4636,6 +4636,7 @@ static int validate_ibt(struct objtool_f
 		warnings += validate_ibt_insn(file, insn);
 
 	for_each_sec(file->elf, sec) {
+		bool warn = true;
 
 		/* Already done by validate_ibt_insn() */
 		if (is_text_sec(sec))
@@ -4672,6 +4673,14 @@ static int validate_ibt(struct objtool_f
 		    !strcmp(sec->name, "__patchable_function_entries"))
 			continue;
 
+		/*
+		 * EXPORT_SYMBOL() must be counted towards an ENDBR usage,
+		 * such symbols must not be implicitly sealed. But it is fine
+		 * to EXPORT an explicitly (__noendbr) sealed function.
+		 */
+		if (!strcmp(sec->name, ".export_symbol"))
+			warn = false;
+
 		for_each_reloc(sec->rsec, reloc) {
 			struct symbol *sym = find_symbol_containing(reloc->sec->base,
 								    reloc_offset(reloc));
@@ -4679,7 +4688,7 @@ static int validate_ibt(struct objtool_f
 			if (sym && !strcmp(sym->name, "sys_call_table"))
 				continue;
 
-			warnings += validate_ibt_data_reloc(file, reloc);
+			warnings += validate_ibt_data_reloc(file, reloc, warn);
 		}
 	}
 


