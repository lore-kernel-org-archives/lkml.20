Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9724C3D9556;
	Thu, 17 Sep 2026 07:56:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789631807; cv=none; b=CvKjXD8LcSks8FVDRB/dH/XwhAcGPMnquoB1SN5brCoJ9zl8M89/WnEuAg69mu+Bwe1bxZ2Y4jz5eXhGX3V7R4Yxn2Fyjyus9AXf7bBM0/7VHZAM1EIt88jXexDjpvmqhA1tOGmAJ07TPmADui3EYvadroqEvNDgfRpDYlCh8Mc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789631807; c=relaxed/simple;
	bh=LViT9xmmVT4Sj6xJDliSJMp0AzSByfSidPRuZDJB5to=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=bBzNbcHBvoEHvvi9yCRL8/Baxsvv8t15deOf59cyepk4VAObYYgv4saj2RYcT1i6+fh+GYrMalvxeDd0tp3GkW4mkeyLwaSbeDeL4OGie96Cb2ccpGuBAD8PQDNxSLz5eCC8bIH6ez3QpSl7gGO1AtIsRQtOlYkUxW4i9XUZhhs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=Yl1Zs0tq; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=GrsEWd2X; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="Yl1Zs0tq";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="GrsEWd2X"
Date: Thu, 17 Sep 2026 07:56:41 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1789631803;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=72uz///s1DGSne0CUdP08ObTh4LsAvsRNzOmX5mhRyg=;
	b=Yl1Zs0tqoTBfyfshCI/85+N1SnhOVMTBHup2HGiH9ubblEnDbwWARxKbYsUh87U1G1EfbF
	Ge3T8xbxQ2t0salc3RzwG+b5dkNigO+ssSXnw17ML2qbBFH+MpNwDUBYQneQZ/gTs7j17/
	VGwG5NMBighZl3egVb3akAEDVzvNVAIFf2OwRMcVrbfwTWn7CGY1DzWFjs5tqMxPqaJ+LK
	PG2S9eVdPAz7bPFkE0q9v5X+lh6UE8dIrCnIEwgR52Tgfvb86hFPEQ7tShGtbWDgY0XzjV
	2bpuIgGrjdhqWs0wmob7uWua6RaMpqgjtm7ekQiATsBY0u132jBc/7r1OCn7rw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1789631803;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=72uz///s1DGSne0CUdP08ObTh4LsAvsRNzOmX5mhRyg=;
	b=GrsEWd2XYVq0kCFc4hTJyHpm8vaXCBgR/luVm2WXbmKUbfjctGQaw254M8zCb7no98/783
	Gf6poL919NODj0DA==
From: "tip-bot2 for Jinke Han" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject:
 [tip: perf/urgent] x86/kprobes: Fix crash when probing CS CALL instructions
Cc: "Masami Hiramatsu (Google)" <mhiramat@kernel.org>,
 Jinke Han <jinkehan@didiglobal.com>, Ingo Molnar <mingo@kernel.org>,
 Yafang Shao <laoar.shao@gmail.com>, Borislav Petkov <bp@alien8.de>,
 Peter Zijlstra <peterz@infradead.org>, x86@kernel.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <20260908073742.GA10517@didi-ThinkCentre-M920t-N000>
References: <20260908073742.GA10517@didi-ThinkCentre-M920t-N000>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <178963180130.1720534.7022382543498538660.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the perf/urgent branch of tip:

Commit-ID:     a5f7a5bb3b7f28ba7e4fa246775b29a0e5537255
Gitweb:        https://git.kernel.org/tip/a5f7a5bb3b7f28ba7e4fa246775b29a0e55=
37255
Author:        Jinke Han <jinkehan@didiglobal.com>
AuthorDate:    Tue, 08 Sep 2026 15:37:42 +08:00
Committer:     Ingo Molnar <mingo@kernel.org>
CommitterDate: Thu, 17 Sep 2026 09:48:42 +02:00

x86/kprobes: Fix crash when probing CS CALL instructions

When using eBPF to probe CS CALL instructions within a function,
a crash can be triggered.

The eBPF tool probes offset 257 of the __hrtimer_run_queues()
function:

<__hrtimer_run_queues+249>:  nopl   0x0(%rax,%rax,1)
<__hrtimer_run_queues+254>:  mov    %r14,%rdi
<__hrtimer_run_queues+257>:  cs call <__x86_indirect_thunk_r12>
<__hrtimer_run_queues+263>:  mov    %eax,%r12d
<__hrtimer_run_queues+266>:  xchg   %ax,%ax
<__hrtimer_run_queues+268>:  mov    %r13,%rdi

Which triggers this crash:

  BUG: unable to handle page fault for address: 00000000000f41c9
  #PF: supervisor write access in kernel mode
  #PF: error_code(0x0002) - not-present page
  PGD 0 P4D 0
  Oops: 0002 [#1] SMP NOPTI
  CPU: 1 PID: 0 Comm: swapper/1 Kdump: loaded Tainted: P
  RIP: 0010:__hrtimer_run_queues+0x106/0x230

Note that __hrtimer_run_queues+0x106 is __hrtimer_run_queues+262, which is
at the 6th byte of the above CS CALL instruction. Since the CS CALL
instruction occupies 6 bytes, the exception occurred in the middle of that
call instruction.

The root cause is that when using eBPF tools to probe in the middle of a
function, a kprobe with INT3 is used as the underlying implementation.

During single-step emulation of the original CALL instruction,
int3_emulate_call() assumes that the probed CALL instruction is 5 bytes
long. However, the actual CS-prefixed CALL instruction occupies 6 bytes,
so it constructs an incorrect exception return address. When the CPU
returns from the kprobe handler, the next instruction to be executed is at
the address of the last byte of that CS CALL instruction. Coincidentally,
starting from that address, the CPU fetches and decodes a completely
different instruction, which ultimately triggers a kernel crash.

Fix the issue by using the actual instruction length obtained from
the instruction decoder when constructing the exception return
address, rather than relying on the hardcoded CALL_INSN_SIZE macro.

[ mingo: Refined the changelog ]

Fixes: 6256e668b7af ("x86/kprobes: Use int3 instead of debug trap for single-=
step")
Suggested-by: Masami Hiramatsu (Google) <mhiramat@kernel.org>
Signed-off-by: Jinke Han <jinkehan@didiglobal.com>
Signed-off-by: Ingo Molnar <mingo@kernel.org>
Reviewed-by: Masami Hiramatsu (Google) <mhiramat@kernel.org>
Acked-by: Yafang Shao <laoar.shao@gmail.com>
Acked-by: Borislav Petkov <bp@alien8.de>
Cc: Peter Zijlstra <peterz@infradead.org>
Link: https://patch.msgid.link/20260908073742.GA10517@didi-ThinkCentre-M920t-=
N000
---
 arch/x86/include/asm/text-patching.h | 4 ++--
 arch/x86/kernel/alternative.c        | 6 ++++--
 arch/x86/kernel/kprobes/core.c       | 5 ++---
 3 files changed, 8 insertions(+), 7 deletions(-)

diff --git a/arch/x86/include/asm/text-patching.h b/arch/x86/include/asm/text=
-patching.h
index f2d142a..ea09381 100644
--- a/arch/x86/include/asm/text-patching.h
+++ b/arch/x86/include/asm/text-patching.h
@@ -164,9 +164,9 @@ unsigned long int3_emulate_pop(struct pt_regs *regs)
 }
=20
 static __always_inline
-void int3_emulate_call(struct pt_regs *regs, unsigned long func)
+void int3_emulate_call(struct pt_regs *regs, unsigned long ip, unsigned long=
 func)
 {
-	int3_emulate_push(regs, regs->ip - INT3_INSN_SIZE + CALL_INSN_SIZE);
+	int3_emulate_push(regs, ip);
 	int3_emulate_jmp(regs, func);
 }
=20
diff --git a/arch/x86/kernel/alternative.c b/arch/x86/kernel/alternative.c
index 741d876..582c6d8 100644
--- a/arch/x86/kernel/alternative.c
+++ b/arch/x86/kernel/alternative.c
@@ -2176,6 +2176,7 @@ int3_exception_notify(struct notifier_block *self, unsi=
gned long val, void *data
 	unsigned long selftest =3D (unsigned long)&int3_selftest_asm;
 	struct die_args *args =3D data;
 	struct pt_regs *regs =3D args->regs;
+	unsigned long ip;
=20
 	OPTIMIZER_HIDE_VAR(selftest);
=20
@@ -2188,7 +2189,8 @@ int3_exception_notify(struct notifier_block *self, unsi=
gned long val, void *data
 	if (regs->ip - INT3_INSN_SIZE !=3D selftest)
 		return NOTIFY_DONE;
=20
-	int3_emulate_call(regs, (unsigned long)&int3_selftest_callee);
+	ip =3D regs->ip - INT3_INSN_SIZE + CALL_INSN_SIZE;
+	int3_emulate_call(regs, ip, (unsigned long)&int3_selftest_callee);
 	return NOTIFY_STOP;
 }
=20
@@ -2758,7 +2760,7 @@ noinstr int smp_text_poke_int3_handler(struct pt_regs *=
regs)
 		break;
=20
 	case CALL_INSN_OPCODE:
-		int3_emulate_call(regs, (long)ip + tpl->disp);
+		int3_emulate_call(regs, (long)ip, (long)ip + tpl->disp);
 		break;
=20
 	case JMP32_INSN_OPCODE:
diff --git a/arch/x86/kernel/kprobes/core.c b/arch/x86/kernel/kprobes/core.c
index 4e5f8c1..133ff20 100644
--- a/arch/x86/kernel/kprobes/core.c
+++ b/arch/x86/kernel/kprobes/core.c
@@ -510,10 +510,9 @@ NOKPROBE_SYMBOL(kprobe_emulate_ret);
=20
 static void kprobe_emulate_call(struct kprobe *p, struct pt_regs *regs)
 {
-	unsigned long func =3D regs->ip - INT3_INSN_SIZE + p->ainsn.size;
+	unsigned long ip =3D regs->ip - INT3_INSN_SIZE + p->ainsn.size;
=20
-	func +=3D p->ainsn.rel32;
-	int3_emulate_call(regs, func);
+	int3_emulate_call(regs, ip, ip + p->ainsn.rel32);
 }
 NOKPROBE_SYMBOL(kprobe_emulate_call);
=20
