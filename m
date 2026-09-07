Received: from mx10.didiglobal.com (mx10.didiglobal.com [111.202.70.125])
	by smtp.subspace.kernel.org (Postfix) with SMTP id 2C82D39478B
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 19:24:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=111.202.70.125
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788809093; cv=none; b=b8FzHKsGWPMhY7+F/joAinfhepHhSlN08unTWmcZpCeAd0is/TlstkA/rFhcJNC4hHoHe3W8JKpXpt2moZjp3X2Imth4u6v7HA483KTaN8ib2x0f7FdUZDRIiyqCQkCu42PKu7O9ePEKDdBKhwM2+SDIf7rX+iV7VSujLlm2Cew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788809093; c=relaxed/simple;
	bh=n/gFASvtlGGrWDBpOcPOjpVXdfDZ2amrSaabRI9ia58=;
	h=Date:From:To:CC:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=t35fDYaa0cELT4+HfAvOGZ4bnfA+7Q5qbnySx8ZkM9KQLzwIUz+FBtdZZlKIQidQBj0RRoIfnQQ5x1bOfW0LDk37mbi2peODDw7ooCf+2Zrh7Nlh4hgxv1JNzmdOGIP7IfFxtqMpMun8jtP9JOnaKZYoBXCrz710LdAOtCXZ+ng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=didiglobal.com; spf=pass smtp.mailfrom=didiglobal.com; dkim=pass (1024-bit key) header.d=didiglobal.com header.i=@didiglobal.com header.b=n48TdAZ5; arc=none smtp.client-ip=111.202.70.125
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=didiglobal.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=didiglobal.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=didiglobal.com header.i=@didiglobal.com header.b="n48TdAZ5"
Received: from mail.didiglobal.com (unknown [10.79.65.20])
	by mx10.didiglobal.com (MailData Gateway V2.8.8) with ESMTPS id E6ABA180414266;
	Tue,  8 Sep 2026 03:24:27 +0800 (CST)
Received: from BJ01-ACTMBX-04.didichuxing.com (10.79.64.12) by
 BJ02-ACTMBX-02.didichuxing.com (10.79.65.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 8 Sep 2026 03:24:27 +0800
Received: from didi-ThinkCentre-M920t-N000 (10.79.64.102) by
 BJ01-ACTMBX-04.didichuxing.com (10.79.64.12) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.45; Tue, 8 Sep 2026 03:24:27 +0800
Date: Tue, 8 Sep 2026 03:24:16 +0800
X-MD-Sfrom: jinkehan@didiglobal.com
X-MD-SrcIP: 10.79.65.20
From: Jinke Han <jinkehan@didiglobal.com>
To: <jinkehan@didiglobal.com>, <tglx@kernel.org>, <mingo@redhat.com>,
	<bp@alien8.de>, <dave.hansen@linux.intel.com>, <x86@kernel.org>,
	<mhiramat@kernel.org>
CC: <hpa@zytor.com>, <laoar.shao@gmail.com>, <peterz@infradead.org>,
	<jgross@suse.com>, <kees@kernel.org>, <jpoimboe@kernel.org>,
	<rppt@kernel.org>, <sohil.mehta@intel.com>, <linusw@kernel.org>,
	<linux-kernel@vger.kernel.org>, <tiozhang@didiglobal.com>
Subject: [PATCH v2] x86/kprobe: Fix crash when probe cs call
Message-ID: <20260907192416.GA4979@didi-ThinkCentre-M920t-N000>
Mail-Followup-To: tglx@kernel.org, mingo@redhat.com, bp@alien8.de,
	dave.hansen@linux.intel.com, x86@kernel.org, mhiramat@kernel.org,
	hpa@zytor.com, laoar.shao@gmail.com, peterz@infradead.org,
	jgross@suse.com, kees@kernel.org, jpoimboe@kernel.org,
	rppt@kernel.org, sohil.mehta@intel.com, linusw@kernel.org,
	linux-kernel@vger.kernel.org, tiozhang@didiglobal.com
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
User-Agent: Mutt/1.9.4 (2018-02-28)
X-ClientProxiedBy: BJ02-PUBMBX-01.didichuxing.com (10.79.65.22) To
 BJ01-ACTMBX-04.didichuxing.com (10.79.64.12)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=didiglobal.com;
	s=2025; t=1788809070;
	bh=TK32NFX27Lnj7LMm+Bv6qzS/dFPPDOnVSsmnmN1cWBo=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type;
	b=n48TdAZ50/sEVi56rtGybZIedddLqwb0/oLNpaLt9ufZrY39+cdsFb+JQ/8zzWDmq
	 ukWypa5lCfuLvBsy9bvKEcxrJEcbzixQx41cWt6s+XMXG9kEUtHmpCjXVUgS0Y3qCv
	 +9l1vrirmUKEdXOyJHsVgr5KBqL6cKi4+IZ3hzQg=

When I used eBPF to probe the call instructions within a function,
we encountered a kernel crash.

The ebpf tool probes the 257 offset of the __hrtimer_run_queues
function.

<__hrtimer_run_queues+249>:  nopl   0x0(%rax,%rax,1)
<__hrtimer_run_queues+254>:  mov    %r14,%rdi
<__hrtimer_run_queues+257>:  cs call <__x86_indirect_thunk_r12>
<__hrtimer_run_queues+263>:  mov    %eax,%r12d
<__hrtimer_run_queues+266>:  xchg   %ax,%ax
<__hrtimer_run_queues+268>:  mov    %r13,%rdi

The scene of kernel crash is as follows:

[73665.737181] BUG: unable to handle page fault for address: 00000000000f41c9
[73665.744253] #PF: supervisor write access in kernel mode
[73665.749643] #PF: error_code(0x0002) - not-present page
[73665.754843] PGD 0 P4D 0
[73665.757390] Oops: 0002 [#1] SMP NOPTI
[73665.761073] CPU: 1 PID: 0 Comm: swapper/1 Kdump: loaded Tainted: P
[73665.782671] RIP: 0010:__hrtimer_run_queues+0x106/0x230

Note that __hrtimer_run_queues+0x106 is __hrtimer_run_queues+262, which is
at the 6th byte of the above cs call instruction. Since the cs call
instruction occupies 6 bytes, the exception occurred in the middle of that
call instruction.

The root cause is that when using eBPF tools to probe in the middle of a
function, kprobe with int3 is used as the underlying implementation.
During single-step emulation of the original call instruction,
int3_emulate_call assumes that the probed call instruction is 5 bytes
long. However, the actual CS-prefixed call instruction occupies 6 bytes,
so it constructs an incorrect exception return address. When the CPU
returns from the kprobe handler, the next instruction to be executed is at
the address of the last byte of that CS call instruction. Coincidentally,
starting from that address, the CPU fetches and decodes a completely
different instruction, which ultimately triggers a kernel crash.

Fix the issue by using the actual instruction length obtained from
the instruction decoder when constructing the exception return
address, rather than relying on the hardcoded CALL_INSN_SIZE macro.

Cc: stable@kernel.org
Cc: linux-trace-kernel@vger.kernel.org
Fixes: 6256e668b7af ("x86/kprobes: Use int3 instead of debug trap for single-step")
Suggested-by: Masami Hiramatsu (Google) <mhiramat@kernel.org>
Acked-by: Yafang Shao <laoar.shao@gmail.com>
Signed-off-by: Jinke Han <jinkehan@didiglobal.com>
---
 arch/x86/include/asm/text-patching.h |  4 ++--
 arch/x86/kernel/alternative.c        | 13 ++++++++++---
 arch/x86/kernel/kprobes/core.c       |  5 ++---
 3 files changed, 14 insertions(+), 8 deletions(-)

diff --git a/arch/x86/include/asm/text-patching.h b/arch/x86/include/asm/text-patching.h
index f2d142a0a862..ea09381070e8 100644
--- a/arch/x86/include/asm/text-patching.h
+++ b/arch/x86/include/asm/text-patching.h
@@ -164,9 +164,9 @@ unsigned long int3_emulate_pop(struct pt_regs *regs)
 }
 
 static __always_inline
-void int3_emulate_call(struct pt_regs *regs, unsigned long func)
+void int3_emulate_call(struct pt_regs *regs, unsigned long ip, unsigned long func)
 {
-	int3_emulate_push(regs, regs->ip - INT3_INSN_SIZE + CALL_INSN_SIZE);
+	int3_emulate_push(regs, ip);
 	int3_emulate_jmp(regs, func);
 }
 
diff --git a/arch/x86/kernel/alternative.c b/arch/x86/kernel/alternative.c
index 91b1cdd16569..ce5cce46f3ef 100644
--- a/arch/x86/kernel/alternative.c
+++ b/arch/x86/kernel/alternative.c
@@ -2169,6 +2169,7 @@ int3_exception_notify(struct notifier_block *self, unsigned long val, void *data
 	unsigned long selftest = (unsigned long)&int3_selftest_asm;
 	struct die_args *args = data;
 	struct pt_regs *regs = args->regs;
+	unsigned long ip;
 
 	OPTIMIZER_HIDE_VAR(selftest);
 
@@ -2180,8 +2181,14 @@ int3_exception_notify(struct notifier_block *self, unsigned long val, void *data
 
 	if (regs->ip - INT3_INSN_SIZE != selftest)
 		return NOTIFY_DONE;
-
-	int3_emulate_call(regs, (unsigned long)&int3_selftest_callee);
+	/*
+	 * As seen in int3_selftest_asm, the effective return address
+	 * should be placed immediately after the instruction sequence
+	 * [int3; nop; nop; nop; nop.]. Therefore, CALL_INSN_SIZE works
+	 * perfectly well here.
+	 */
+	ip = regs->ip - INT3_INSN_SIZE + CALL_INSN_SIZE;
+	int3_emulate_call(regs, ip, (unsigned long)&int3_selftest_callee);
 	return NOTIFY_STOP;
 }
 
@@ -2721,7 +2728,7 @@ noinstr int smp_text_poke_int3_handler(struct pt_regs *regs)
 		break;
 
 	case CALL_INSN_OPCODE:
-		int3_emulate_call(regs, (long)ip + tpl->disp);
+		int3_emulate_call(regs, (long)ip, (long)ip + tpl->disp);
 		break;
 
 	case JMP32_INSN_OPCODE:
diff --git a/arch/x86/kernel/kprobes/core.c b/arch/x86/kernel/kprobes/core.c
index 4e5f8c1736ec..133ff20caccd 100644
--- a/arch/x86/kernel/kprobes/core.c
+++ b/arch/x86/kernel/kprobes/core.c
@@ -510,10 +510,9 @@ NOKPROBE_SYMBOL(kprobe_emulate_ret);
 
 static void kprobe_emulate_call(struct kprobe *p, struct pt_regs *regs)
 {
-	unsigned long func = regs->ip - INT3_INSN_SIZE + p->ainsn.size;
+	unsigned long ip = regs->ip - INT3_INSN_SIZE + p->ainsn.size;
 
-	func += p->ainsn.rel32;
-	int3_emulate_call(regs, func);
+	int3_emulate_call(regs, ip, ip + p->ainsn.rel32);
 }
 NOKPROBE_SYMBOL(kprobe_emulate_call);
 
-- 
2.34.1

