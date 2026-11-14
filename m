Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794675402;
	b=oo5yhHLMnaVqMW/prJ3yNc0lt9wx+AfTwpbXq8AbaPwveE1pOYej2tRhaNsJXRMaZYKq
	 p2GeezJIJZnH0J/Arc15p/8MILyfFIcIF6NcCkCLhaEJZb5EbOcfUwgh2Ex55hVVQg5Ig
	 MiYceOiXp0K1T6qxBPMrHgdo+QXaUc9ImrlMaSnM13JBRbQE46Rcq6HkxY5U1j+VM5RUM
	 addNo6zQok4syoG+/jU8RsI5740dNbCuwTydi9rGBkj6lrx+BGtcjTPHFX3YF4qkiv/Ex
	 EkwdKYRPUgef8hZpiQDZWdxp367ERTtKbFtHbt/9C/7vgFG59vfoxJ2gUFzERy1X4iw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794675402;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=XhTJDQW9I3jYphxzjZY5kyFwNSEMPvNKx4S3YYDMvnY=;
	b=TCPEElw/DcQnybouR8H/B1Z89ShN3+Rr7Ecq1qsThZ19/naMfrM1MP+ruM3VyuOEeM9k
	 HPi06qddGJ+3X+nAe3WsTg57YL+XlA2RMxQ9fDx/UQ6latW9AOCJ7NjbdD8yKFLnONyBZ
	 Um5b0/3BBKX+x0UsHK1C5gBvscEaebMFypsNDwhPi1hxVoxHr3adtWdyrE2g6nNhjqK20
	 jupC1HxeLRsMPxaDABV46uyvFrEkia//8vnYqufgONnEfANM8rsi6oXdcVUGSvs07kIK7
	 ZMYUj7u3CYlag2e6nwEenvWetO3rmkUe1LbU6v+VZxDQivMHSDavNk8WsHhVxrsntng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=b8wIfyN6;
	arc=none smtp.remote-ip=209.85.167.49
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11815606A327
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 16:56:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 11815606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=b8wIfyN6
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5c10dc41270so2424977e87.2
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 08:56:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794675400; x=1795280200; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XhTJDQW9I3jYphxzjZY5kyFwNSEMPvNKx4S3YYDMvnY=;
        b=b8wIfyN66yKZtE+S7ylY9c28+PG3dWW3FZMrw/bmaAxsEKl86k1SLe8rzROJr9pdnG
         0uWEp6TzJxEcI87fly/1d+SHOOZ6ZQHds7bt7TwcohLbB0wfi3Nw08048YK89VhoJClL
         9A0oi+FMaarZn60EUKrUPVZ3XuEmYl3Kn+RPWRs0HDSBvrv4aywdtjYPQmpmJD9H47nz
         JT4lW4DKMeA/hfD4oEqYVhpoFAm3azn4bP+zXi98tCdaziGjp0Sy4Hmtb9X1kcGLGFcl
         5Aq5BnaUlWKZ4rP2QiqhdEZlGKiAg1UQDU3veWFou/8tO9ZU5EeS55p4TJ50iblrM/QQ
         059w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794675400; x=1795280200;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XhTJDQW9I3jYphxzjZY5kyFwNSEMPvNKx4S3YYDMvnY=;
        b=MAvubSVwqUEAOExjwgeIRz+ALgBWiytlMZSDuleFKs8wJOEmE5ix/+6LnHCvfqQJHB
         8gOubzGySq6HfYJHAcmajzwRgkyMKNgo8zVW2KEsScAThXC2gbwUDjS7gI0E0d044gA6
         Ih1qvTbVSvZVXojG9vi/mbZGW6nwq1YFjYZEhxc/C2uBM+YgoLsmZB8rw1vFi/Awd1Gq
         /kFF8sXdW+Of3k+1YdQEfYBy2zCHA01sWl8sTX9wj8cA7EGE5S48/2aGZdQ8zz0pTGF4
         qK+pKfpujc4VC2lC+4XQGsibYm+Kct25pVfM+D4gteWEAkaB7YNyoa318u2oMe1KJgE/
         IUcQ==
X-Gm-Message-State: APuU4Z9LbFN6UolK7VgrmCO5HnIKcpcOfWk9EbBJVYhPrygicg8hH6KO
	72uWen0erb3KD3qHRXE0P6HmgVe60DjIaRohU+rsN3VgPlmgEBwa/T2Z
X-Gm-Gg: AYBFou2XiQ/oQsRx0j3K49inESsWQLVMAzYdw+RemViKLjuvZQ2eqG2HgAHD/jCbrEL
	eGqy72kh9NL5Ud4EAe/QYFW91GrORnK7iXKwDO9w4FKu/8w0q74YQZOMCYTgNGzvTWLjZ8AP5Wh
	9/jb+9BZqVYeFxQbiuijZwZuKwIoXDnyRxEQowr2ESSmxuMwtE39BaTSI5XXdJEpXoc5/sU/gKf
	c6++FmrHTheAnm82udMJ8Dd6PEG/67LUPUAPW/Wg1DX1Yo/K+iwBJM4yKjoPqbUbYzDK3JTeE9Q
	PGLDkCYP2OY5Q+NldBLg0kRSg5FUIWSPRGUDjqQbpE0ffaDLJ+BiTeeyyzJXbIHBq9U+MD2GsxT
	KqVM9cuvP7XPlCkmsE0uFq1E9wFiWWdfD890bgNaLKa4THlNnw9eFbaBXnoSi1Y8YN9s9daY+FU
	FFIO8DX3e7tNxMgFGtRpuPfpgNJULgS+GpAZuww+PqN+VL3utnCONHkr0mrELqe2QK+lkM1wek+
	X/WXLlorLQ9YWPAUYQxfpmeckYckfqIjKjaaH6XB3kDPXzCEUjg5RZ2YQFAwtZyFZmMxK1qd03w
	5ip2qwIFDEfr3xmt+iM/9ipCGXCGknmoMpBHN1suJdXH1VG95Y92GkSjB41rzbK+MbSQhRZ5pln
	1ytOghoz9CA==
X-Received: by 2002:a05:6512:2c8d:b0:5c1:4e17:1eee with SMTP id 2adb3069b0e04-5c170b36a6cmr1991694e87.58.1794675399908;
        Sat, 14 Nov 2026 08:56:39 -0800 (PST)
Received: from SafoStation ([31.40.65.49])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c1712dad26sm1792051e87.8.2026.11.14.08.56.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 08:56:39 -0800 (PST)
From: Safocl Stollmannovic <safocl88@gmail.com>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Oleg Nesterov <oleg@redhat.com>
Cc: linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org
Subject: [PATCH v3 04/14] MIPS: fix duplicate extern declarations
Date: Sat, 14 Nov 2026 20:55:44 +0400
Message-ID: <20261114165612.368785-5-safocl88@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261114165612.368785-1-safocl88@gmail.com>
References: <20261114165612.368785-1-safocl88@gmail.com>
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

Compiling a kernel module with a C++ compiler results in a "duplicate
extern specifier" error.
This occurs because the code contains `extern asmlinkage`, and `asmlinkage`
expands to `extern C` when processed by a C++ compiler.
Since the code already contains sections that respond to a C++ compiler,
I believe it is a perfectly valid approach to gradually move toward a state
where kernel modules can be compiled by a C++ compiler without any issues.
The `extern` specifier must be removed.

Link: https://bugzilla.kernel.org/show_bug.cgi?id=222257
Signed-off-by: Safocl Stollmannovic <safocl88@gmail.com>
---
 arch/mips/cavium-octeon/setup.c   |  2 +-
 arch/mips/include/asm/bmips.h     |  2 +-
 arch/mips/include/asm/idle.h      |  2 +-
 arch/mips/include/asm/paccess.h   |  4 +--
 arch/mips/include/asm/ptrace.h    |  4 +--
 arch/mips/include/asm/smp.h       |  2 +-
 arch/mips/include/asm/switch_to.h |  2 +-
 arch/mips/kernel/r4k-bugs64.c     |  2 +-
 arch/mips/kernel/signal-common.h  |  8 ++---
 arch/mips/kernel/traps.c          | 50 +++++++++++++++----------------
 10 files changed, 39 insertions(+), 39 deletions(-)

diff --git a/arch/mips/cavium-octeon/setup.c b/arch/mips/cavium-octeon/setup.c
index 7497be7b9..c2ee7d8bc 100644
--- a/arch/mips/cavium-octeon/setup.c
+++ b/arch/mips/cavium-octeon/setup.c
@@ -296,7 +296,7 @@ static uint64_t crashk_size, crashk_base;
 
 static int octeon_uart;
 
-extern asmlinkage void handle_int(void);
+asmlinkage void handle_int(void);
 
 /**
  * octeon_is_simulation - Return non-zero if we are currently running
diff --git a/arch/mips/include/asm/bmips.h b/arch/mips/include/asm/bmips.h
index 0eee81be9..a0de86e0d 100644
--- a/arch/mips/include/asm/bmips.h
+++ b/arch/mips/include/asm/bmips.h
@@ -88,7 +88,7 @@ extern cpumask_t bmips_booted_mask;
 extern unsigned long bmips_tp1_irqs;
 
 extern void bmips_ebase_setup(void);
-extern asmlinkage void plat_wired_tlb_setup(void);
+asmlinkage void plat_wired_tlb_setup(void);
 extern void bmips_cpu_setup(void);
 
 static inline unsigned long bmips_read_zscm_reg(unsigned int offset)
diff --git a/arch/mips/include/asm/idle.h b/arch/mips/include/asm/idle.h
index c7d75807d..58b201eb4 100644
--- a/arch/mips/include/asm/idle.h
+++ b/arch/mips/include/asm/idle.h
@@ -6,7 +6,7 @@
 #include <linux/linkage.h>
 
 extern void (*cpu_wait)(void);
-extern asmlinkage void r4k_wait(void);
+asmlinkage void r4k_wait(void);
 extern void r4k_wait_irqoff(void);
 
 static inline int using_skipover_handler(void)
diff --git a/arch/mips/include/asm/paccess.h b/arch/mips/include/asm/paccess.h
index af81ab0da..67efa9440 100644
--- a/arch/mips/include/asm/paccess.h
+++ b/arch/mips/include/asm/paccess.h
@@ -22,8 +22,8 @@
 #define __PA_ADDR	".dword"
 #endif
 
-extern asmlinkage void handle_ibe(void);
-extern asmlinkage void handle_dbe(void);
+asmlinkage void handle_ibe(void);
+asmlinkage void handle_dbe(void);
 
 #define put_dbe(x, ptr) __put_dbe((x), (ptr), sizeof(*(ptr)))
 #define get_dbe(x, ptr) __get_dbe((x), (ptr), sizeof(*(ptr)))
diff --git a/arch/mips/include/asm/ptrace.h b/arch/mips/include/asm/ptrace.h
index ef72c46b5..5673c7518 100644
--- a/arch/mips/include/asm/ptrace.h
+++ b/arch/mips/include/asm/ptrace.h
@@ -160,8 +160,8 @@ extern unsigned long exception_ip(struct pt_regs *regs);
 #define exception_ip(regs) exception_ip(regs)
 #define profile_pc(regs) instruction_pointer(regs)
 
-extern asmlinkage long syscall_trace_enter(struct pt_regs *regs);
-extern asmlinkage void syscall_trace_leave(struct pt_regs *regs);
+asmlinkage long syscall_trace_enter(struct pt_regs *regs);
+asmlinkage void syscall_trace_leave(struct pt_regs *regs);
 
 extern void die(const char *, struct pt_regs *) __noreturn;
 
diff --git a/arch/mips/include/asm/smp.h b/arch/mips/include/asm/smp.h
index a545568f1..5e1b73a06 100644
--- a/arch/mips/include/asm/smp.h
+++ b/arch/mips/include/asm/smp.h
@@ -58,7 +58,7 @@ extern cpumask_t cpu_coherent_mask;
 
 extern unsigned int smp_max_threads __initdata;
 
-extern asmlinkage void smp_bootstrap(void);
+asmlinkage void smp_bootstrap(void);
 
 extern void calculate_cpu_foreign_map(void);
 
diff --git a/arch/mips/include/asm/switch_to.h b/arch/mips/include/asm/switch_to.h
index d6ccd5344..a9d6616ad 100644
--- a/arch/mips/include/asm/switch_to.h
+++ b/arch/mips/include/asm/switch_to.h
@@ -29,7 +29,7 @@ struct task_struct;
  * This function is used whilst scheduling to save the context of prev & load
  * the context of next. Returns prev.
  */
-extern asmlinkage struct task_struct *resume(struct task_struct *prev,
+asmlinkage struct task_struct *resume(struct task_struct *prev,
 		struct task_struct *next, struct thread_info *next_ti);
 
 extern unsigned int ll_bit;
diff --git a/arch/mips/kernel/r4k-bugs64.c b/arch/mips/kernel/r4k-bugs64.c
index 83970ac7e..31bf3146f 100644
--- a/arch/mips/kernel/r4k-bugs64.c
+++ b/arch/mips/kernel/r4k-bugs64.c
@@ -182,7 +182,7 @@ asmlinkage void __init do_daddi_ov(struct pt_regs *regs)
 
 static __init void check_daddi(void)
 {
-	extern asmlinkage void handle_daddi_ov(void);
+	asmlinkage void handle_daddi_ov(void);
 	unsigned long flags;
 	void *handler;
 	long v, tmp;
diff --git a/arch/mips/kernel/signal-common.h b/arch/mips/kernel/signal-common.h
index 136eb20ac..65e262b7f 100644
--- a/arch/mips/kernel/signal-common.h
+++ b/arch/mips/kernel/signal-common.h
@@ -32,13 +32,13 @@ extern int fpcsr_pending(unsigned int __user *fpcsr);
 #define unlock_fpu_owner()	({ pagefault_enable(); preempt_enable(); })
 
 /* Assembly functions to move context to/from the FPU */
-extern asmlinkage int
+asmlinkage int
 _save_fp_context(void __user *fpregs, void __user *csr);
-extern asmlinkage int
+asmlinkage int
 _restore_fp_context(void __user *fpregs, void __user *csr);
 
-extern asmlinkage int _save_msa_all_upper(void __user *buf);
-extern asmlinkage int _restore_msa_all_upper(void __user *buf);
+asmlinkage int _save_msa_all_upper(void __user *buf);
+asmlinkage int _restore_msa_all_upper(void __user *buf);
 
 extern int setup_sigcontext(struct pt_regs *, struct sigcontext __user *);
 extern int restore_sigcontext(struct pt_regs *, struct sigcontext __user *);
diff --git a/arch/mips/kernel/traps.c b/arch/mips/kernel/traps.c
index 8ec1e185b..0d963f427 100644
--- a/arch/mips/kernel/traps.c
+++ b/arch/mips/kernel/traps.c
@@ -77,31 +77,31 @@
 #include "access-helper.h"
 
 extern void check_wait(void);
-extern asmlinkage void skipover_handle_int(void);
-extern asmlinkage void handle_int(void);
-extern asmlinkage void handle_adel(void);
-extern asmlinkage void handle_ades(void);
-extern asmlinkage void handle_ibe(void);
-extern asmlinkage void handle_dbe(void);
-extern asmlinkage void handle_sys(void);
-extern asmlinkage void handle_bp(void);
-extern asmlinkage void handle_ri(void);
-extern asmlinkage void handle_ri_rdhwr_tlbp(void);
-extern asmlinkage void handle_ri_rdhwr(void);
-extern asmlinkage void handle_cpu(void);
-extern asmlinkage void handle_ov(void);
-extern asmlinkage void handle_tr(void);
-extern asmlinkage void handle_msa_fpe(void);
-extern asmlinkage void handle_fpe(void);
-extern asmlinkage void handle_ftlb(void);
-extern asmlinkage void handle_gsexc(void);
-extern asmlinkage void handle_msa(void);
-extern asmlinkage void handle_mdmx(void);
-extern asmlinkage void handle_watch(void);
-extern asmlinkage void handle_mt(void);
-extern asmlinkage void handle_dsp(void);
-extern asmlinkage void handle_mcheck(void);
-extern asmlinkage void handle_reserved(void);
+asmlinkage void skipover_handle_int(void);
+asmlinkage void handle_int(void);
+asmlinkage void handle_adel(void);
+asmlinkage void handle_ades(void);
+asmlinkage void handle_ibe(void);
+asmlinkage void handle_dbe(void);
+asmlinkage void handle_sys(void);
+asmlinkage void handle_bp(void);
+asmlinkage void handle_ri(void);
+asmlinkage void handle_ri_rdhwr_tlbp(void);
+asmlinkage void handle_ri_rdhwr(void);
+asmlinkage void handle_cpu(void);
+asmlinkage void handle_ov(void);
+asmlinkage void handle_tr(void);
+asmlinkage void handle_msa_fpe(void);
+asmlinkage void handle_fpe(void);
+asmlinkage void handle_ftlb(void);
+asmlinkage void handle_gsexc(void);
+asmlinkage void handle_msa(void);
+asmlinkage void handle_mdmx(void);
+asmlinkage void handle_watch(void);
+asmlinkage void handle_mt(void);
+asmlinkage void handle_dsp(void);
+asmlinkage void handle_mcheck(void);
+asmlinkage void handle_reserved(void);
 extern void tlb_do_page_fault_0(void);
 
 void (*board_be_init)(void);
-- 
2.56.1

