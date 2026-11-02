Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=90.155.92.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793619634;
	b=j6tKBkpWpYj5fuB77JKbdEZjg2KtbDSwc0MPbbSQZt+/OzF6aCUywmj+Too2QMUVpl91
	 UYpILoiTpyx1mgmFLR3+OXjeotv3cqvJ9ADtPPb1hQX3NY83c2Vfnh8b7QpbZ4QaFzDNJ
	 Q2FL50fz2SCobUy/k0HQIjmCdk92lZ1egOYAuLrXyXn4fJabqncG14DxQwFYoZOAOxd9q
	 dyMjaIgE4rEr96GALIFiNRJDAUEz/WzxrDo+LUvb4D/FKgHrNYVWTgk6Af2UDQ02olwWa
	 97DVz0tAsXWhoFI/GUBA1ejgSUnq9MFnd4BLBj1TjrLF9rIz906HhZx8Wby5zMAtujg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793619634;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Message-ID:User-Agent:
	 Date:From:To:Cc:Subject:References:MIME-Version:Content-Type;
	bh=f0FLNY6suxF7FUVhwQgnT/NMhQfGXzw7a/c6MzEKyjA=;
	b=3NcEA6Zsnoj4L8I/Hy0sHuHHJt7mMuMSrLmFcoxqQ7X0VeYyVwwFFYUd/gy6m6XQ7aP+
	 KrIQxCFnzB4IBV95lFFJEiVxwSxujCshPEMZZHean6gJCSFIHaWKLoqZ7glO87BfVeiil
	 gPs35QdGzf7MzXOStWSrHAE6JHrodkiGjOLcyl8opC6MKkimFOalDpSGyxA57qZUcwWSI
	 fXzIrAq5dZfpMHp7oitWy1naVN8clHT6VBUjFIjV3bk18W4wyuaQZdFPHu8U8LetIS+g1
	 ixd0AIaZ/rjUGlQy61Fks+YCjH7U/AeByByhu4UlRvLNl7yaTIS5PXdQsCcWmYjNcSw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=infradead.org;
	spf=pass smtp.mailfrom=infradead.org;
	dkim=pass header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=HAV6dRUz;
	arc=none smtp.remote-ip=90.155.92.199
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76F90606A33A
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 11:40:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 76F90606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=HAV6dRUz
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:MIME-Version:References:
	Subject:Cc:To:From:Date:Message-ID:Sender:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:In-Reply-To;
	bh=f0FLNY6suxF7FUVhwQgnT/NMhQfGXzw7a/c6MzEKyjA=; b=HAV6dRUz82qqHwf8S7bgk6y6rf
	ksJlj66EX+6j3a+6cceDCokj8D/F4By2HOn4M4u9h79iJ7LW/uswXF/CCXPbEMvrL8MnNxV7/bSl7
	AOZbi/HozqDyzI091dEs8wOVaEVUtiNrg8/pzkQhyfpfbaYlYhrHdl/GZj/OtL/LpCOO/yuLK5VR2
	UAqj4TA6RZuYS47Ur9gLCCSTGozMJ0TUr3aM7PV7iFFE2stebpWPpi5e3i8Gw/SLp7X4H9W7CQ2Ns
	B9zErPqTFj88/TK+eXzgptmDopvKZtV50OTjtzXeHAGxHPYLGYwKfkrRvTGfwj1x39mMM4PqDBSz0
	dQyUNBRQ==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNqOo-00000002SER-1JOB;
	Mon, 02 Nov 2026 11:40:30 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 0)
	id 8C9FD3031E1; Mon, 02 Nov 2026 12:40:24 +0100 (CET)
Message-ID: <20261102114000.994159236@infradead.org>
User-Agent: quilt/0.68
Date: Mon, 02 Nov 2026 12:25:55 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: x86@kernel.org
Cc: linux-kernel@vger.kernel.org,
 peterz@infradead.org,
 jpoimboe@kernel.org,
 leitao@debian.org,
 keescook@chromium.org,
 hpa@zytor.com
Subject: [PATCH 6/6] x86_64/entry: Mark C noinstr __noendbr
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

Mark all the C noinstr entry functions __noendbr where possible. Nobody has any
business of doing indirect calls to this.

Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
---
 arch/x86/entry/common.c             |    2 +-
 arch/x86/entry/entry_fred.c         |    6 +++---
 arch/x86/entry/syscall_32.c         |   10 +++++-----
 arch/x86/entry/syscall_64.c         |    6 +++---
 arch/x86/include/asm/entry-common.h |    2 +-
 arch/x86/include/asm/fred.h         |    6 +++---
 arch/x86/include/asm/syscall.h      |   10 +++++-----
 7 files changed, 21 insertions(+), 21 deletions(-)

--- a/arch/x86/entry/common.c
+++ b/arch/x86/entry/common.c
@@ -15,7 +15,7 @@
  * purely a signal that an NMI/IRQ is pending, i.e. the event that triggered
  * the VM-Exit is held pending until it's unblocked in the host.
  */
-noinstr void x86_entry_from_kvm(unsigned int event_type, unsigned int vector)
+noinstr __noendbr void x86_entry_from_kvm(unsigned int event_type, unsigned int vector)
 {
 	if (event_type == EVENT_TYPE_EXTINT) {
 #ifdef CONFIG_X86_64
--- a/arch/x86/entry/entry_fred.c
+++ b/arch/x86/entry/entry_fred.c
@@ -234,7 +234,7 @@ static noinstr void fred_swexc(struct pt
 	}
 }
 
-__visible noinstr void fred_entry_from_user(struct pt_regs *regs)
+__visible noinstr __noendbr void fred_entry_from_user(struct pt_regs *regs)
 {
 	unsigned long error_code = regs->orig_ax;
 
@@ -266,7 +266,7 @@ __visible noinstr void fred_entry_from_u
 	return fred_bad_type(regs, error_code);
 }
 
-__visible noinstr void fred_entry_from_kernel(struct pt_regs *regs)
+__visible noinstr __noendbr void fred_entry_from_kernel(struct pt_regs *regs)
 {
 	unsigned long error_code = regs->orig_ax;
 
@@ -295,7 +295,7 @@ __visible noinstr void fred_entry_from_k
 }
 
 #if IS_ENABLED(CONFIG_KVM_INTEL)
-__visible noinstr void __fred_entry_from_kvm(struct pt_regs *regs)
+__visible noinstr __noendbr void __fred_entry_from_kvm(struct pt_regs *regs)
 {
 	switch (regs->fred_ss.type) {
 	case EVENT_TYPE_EXTINT:
--- a/arch/x86/entry/syscall_32.c
+++ b/arch/x86/entry/syscall_32.c
@@ -124,7 +124,7 @@ static __always_inline bool int80_is_ext
  *   eax:				system call number
  *   ebx, ecx, edx, esi, edi, ebp:	arg1 - arg 6
  */
-__visible noinstr void do_int80_emulation(struct pt_regs *regs)
+__visible noinstr __noendbr void do_int80_emulation(struct pt_regs *regs)
 {
 	long nr;
 
@@ -239,7 +239,7 @@ DEFINE_FREDENTRY_RAW(int80_emulation)
 #else /* CONFIG_IA32_EMULATION */
 
 /* Handles int $0x80 on a 32bit kernel */
-__visible noinstr void do_int80_syscall_32(struct pt_regs *regs)
+__visible noinstr __noendbr void do_int80_syscall_32(struct pt_regs *regs)
 {
 	long nr = syscall_32_enter(regs);
 
@@ -259,7 +259,7 @@ __visible noinstr void do_int80_syscall_
 }
 #endif /* !CONFIG_IA32_EMULATION */
 
-static noinstr bool __do_fast_syscall_32(struct pt_regs *regs)
+static noinstr __noendbr bool __do_fast_syscall_32(struct pt_regs *regs)
 {
 	long nr = syscall_32_enter(regs);
 	int res;
@@ -291,7 +291,7 @@ static noinstr bool __do_fast_syscall_32
 }
 
 /* Returns true to return using SYSEXIT/SYSRETL, or false to use IRET */
-__visible noinstr bool do_fast_syscall_32(struct pt_regs *regs)
+__visible noinstr __noendbr bool do_fast_syscall_32(struct pt_regs *regs)
 {
 	/*
 	 * Called using the internal vDSO SYSENTER/SYSCALL32 calling
@@ -338,7 +338,7 @@ __visible noinstr bool do_fast_syscall_3
 }
 
 /* Returns true to return using SYSEXIT/SYSRETL, or false to use IRET */
-__visible noinstr bool do_SYSENTER_32(struct pt_regs *regs)
+__visible noinstr __noendbr bool do_SYSENTER_32(struct pt_regs *regs)
 {
 	/* SYSENTER loses RSP, but the vDSO saved it in RBP. */
 	regs->sp = regs->bp;
--- a/arch/x86/entry/syscall_64.c
+++ b/arch/x86/entry/syscall_64.c
@@ -35,7 +35,7 @@ const sys_call_ptr_t sys_call_table[] =
 #define __SYSCALL(nr, sym) case nr: return __x64_##sym(regs);
 
 /* The unsigned int @nr argument is intentional as it creates denser code */
-static noinstr long x64_sys_call(const struct pt_regs *regs, unsigned int nr)
+static noinstr __noendbr long x64_sys_call(const struct pt_regs *regs, unsigned int nr)
 {
 	/*
 	 * Because -fno-jump-tables, this compiles into a binary branch tree
@@ -51,7 +51,7 @@ static noinstr long x64_sys_call(const s
 	}
 }
 
-static noinstr long x32_sys_call(const struct pt_regs *regs, unsigned int nr)
+static noinstr __noendbr long x32_sys_call(const struct pt_regs *regs, unsigned int nr)
 {
 #ifdef CONFIG_X86_X32_ABI
 	instrumentation_weak();
@@ -84,7 +84,7 @@ static __always_inline void do_syscall_x
 }
 
 /* Returns true to return using SYSRET, or false to use IRET */
-__visible noinstr bool do_syscall_64(struct pt_regs *regs, long nr)
+__visible noinstr __noendbr bool do_syscall_64(struct pt_regs *regs, long nr)
 {
 	if (likely(syscall_enter_from_user_mode_randomize_stack(regs, &nr))) {
 		instrumentation_begin();
--- a/arch/x86/include/asm/entry-common.h
+++ b/arch/x86/include/asm/entry-common.h
@@ -96,6 +96,6 @@ static __always_inline void arch_exit_to
 }
 #define arch_exit_to_user_mode arch_exit_to_user_mode
 
-extern void x86_entry_from_kvm(unsigned int entry_type, unsigned int vector);
+extern __noendbr void x86_entry_from_kvm(unsigned int entry_type, unsigned int vector);
 
 #endif
--- a/arch/x86/include/asm/fred.h
+++ b/arch/x86/include/asm/fred.h
@@ -67,9 +67,9 @@ void asm_fred_entrypoint_user(void);
 void asm_fred_entrypoint_kernel(void);
 void asm_fred_entry_from_kvm(struct fred_ss);
 
-__visible void fred_entry_from_user(struct pt_regs *regs);
-__visible void fred_entry_from_kernel(struct pt_regs *regs);
-__visible void __fred_entry_from_kvm(struct pt_regs *regs);
+__visible __noendbr void fred_entry_from_user(struct pt_regs *regs);
+__visible __noendbr void fred_entry_from_kernel(struct pt_regs *regs);
+__visible __noendbr void __fred_entry_from_kvm(struct pt_regs *regs);
 
 /* Can be called from noinstr code, thus __always_inline */
 static __always_inline void fred_entry_from_kvm(unsigned int type, unsigned int vector)
--- a/arch/x86/include/asm/syscall.h
+++ b/arch/x86/include/asm/syscall.h
@@ -164,13 +164,13 @@ static inline int syscall_get_arch(struc
 		? AUDIT_ARCH_I386 : AUDIT_ARCH_X86_64;
 }
 
-bool do_syscall_64(struct pt_regs *regs, long nr);
-void do_int80_emulation(struct pt_regs *regs);
+__noendbr bool do_syscall_64(struct pt_regs *regs, long nr);
+__noendbr void do_int80_emulation(struct pt_regs *regs);
 
 #endif	/* CONFIG_X86_32 */
 
-void do_int80_syscall_32(struct pt_regs *regs);
-bool do_fast_syscall_32(struct pt_regs *regs);
-bool do_SYSENTER_32(struct pt_regs *regs);
+__noendbr void do_int80_syscall_32(struct pt_regs *regs);
+__noendbr bool do_fast_syscall_32(struct pt_regs *regs);
+__noendbr bool do_SYSENTER_32(struct pt_regs *regs);
 
 #endif	/* _ASM_X86_SYSCALL_H */


