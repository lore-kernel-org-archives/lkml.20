Received: from mx9.didiglobal.com (mx9.didiglobal.com [111.202.70.124])
	by smtp.subspace.kernel.org (Postfix) with SMTP id F10971E2834
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 07:38:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=111.202.70.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788853098; cv=none; b=NsIdLcTb/JVgh2iGOByO45jSZH/eHjPBXYYl7322x7cN9+UrQf7w4nDznmPEy/pTeVfrFQGDUTdgDcmQIVUloeoLXsDYEvu/R1Q1S43InkgHDASKpuS2Hrmi1DWB8aR9iTueZmhxbmrC7U4G3q+YlnubWylP1ogJBoI51P7eqe4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788853098; c=relaxed/simple;
	bh=rCITZH9XRxR9u7JidjNbdBXA6RQZYXguPA1h6FUSUVw=;
	h=Date:From:To:CC:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JYOXjBvxaLvMNUP+b0zDrTjGM62hKHzBoMvsIIqBnI0RuDJ0uEBKXiylAT7A/Bto0RGNhp/XxQeyfFe1Y+Yl5q3ZeQ/kK8HUGTMDIOlwXH68p8nIPTXj/u6GvrTz+E4Q7xVjmHV9K7X+pBa69YhWTNlBNqJO4vYo3gcAC6bb4JI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=didiglobal.com; spf=pass smtp.mailfrom=didiglobal.com; arc=none smtp.client-ip=111.202.70.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=didiglobal.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=didiglobal.com
Received: from mail.didiglobal.com (unknown [10.79.65.20])
	by mx9.didiglobal.com (MailData Gateway V2.8.8) with ESMTPS id DE1B91879F6E51;
	Tue,  8 Sep 2026 15:37:51 +0800 (CST)
Received: from BJ01-ACTMBX-04.didichuxing.com (10.79.64.12) by
 BJ02-ACTMBX-02.didichuxing.com (10.79.65.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 8 Sep 2026 15:37:51 +0800
Received: from didi-ThinkCentre-M920t-N000 (10.79.64.102) by
 BJ01-ACTMBX-04.didichuxing.com (10.79.64.12) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.45; Tue, 8 Sep 2026 15:37:51 +0800
Date: Tue, 8 Sep 2026 15:37:42 +0800
X-MD-Sfrom: jinkehan@didiglobal.com
X-MD-SrcIP: 10.79.65.20
From: Jinke Han <jinkehan@didiglobal.com>
To: <jinkehan@didiglobal.com>, <tglx@kernel.org>, <mingo@redhat.com>,
	<bp@alien8.de>, <dave.hansen@linux.intel.com>, <x86@kernel.org>,
	<mhiramat@kernel.org>
CC: <hpa@zytor.com>, <laoar.shao@gmail.com>, <peterz@infradead.org>,
	<jgross@suse.com>, <kees@kernel.org>, <rppt@kernel.org>,
	<jpoimboe@kernel.org>, <calvin@wbinvd.org>, <pfalcato@suse.de>,
	<linux-kernel@vger.kernel.org>, <tiozhang@didiglobal.com>
Subject: [PATCH v3] x86/kprobe: Fix crash when probe cs call
Message-ID: <20260908073742.GA10517@didi-ThinkCentre-M920t-N000>
Mail-Followup-To: tglx@kernel.org, mingo@redhat.com, bp@alien8.de,
	dave.hansen@linux.intel.com, x86@kernel.org, mhiramat@kernel.org,
	hpa@zytor.com, laoar.shao@gmail.com, peterz@infradead.org,
	jgross@suse.com, kees@kernel.org, rppt@kernel.org,
	jpoimboe@kernel.org, calvin@wbinvd.org, pfalcato@suse.de,
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
Reviewed-by: Masami Hiramatsu (Google) <mhiramat@kernel.org>
Suggested-by: Masami Hiramatsu (Google) <mhiramat@kernel.org>
Acked-by: Yafang Shao <laoar.shao@gmail.com>
Signed-off-by: Jinke Han <jinkehan@didiglobal.com>
---
 arch/x86/include/asm/text-patching.h | 4 ++--
 arch/x86/kernel/alternative.c        | 6 ++++--
 arch/x86/kernel/kprobes/core.c       | 5 ++---
 3 files changed, 8 insertions(+), 7 deletions(-)

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
index add62db3e82c..d13bc5215d87 100644
--- a/arch/x86/kernel/alternative.c
+++ b/arch/x86/kernel/alternative.c
@@ -2172,6 +2172,7 @@ int3_exception_notify(struct notifier_block *self, unsigned long val, void *data
 	unsigned long selftest = (unsigned long)&int3_selftest_asm;
 	struct die_args *args = data;
 	struct pt_regs *regs = args->regs;
+	unsigned long ip;
 
 	OPTIMIZER_HIDE_VAR(selftest);
 
@@ -2184,7 +2185,8 @@ int3_exception_notify(struct notifier_block *self, unsigned long val, void *data
 	if (regs->ip - INT3_INSN_SIZE != selftest)
 		return NOTIFY_DONE;
 
-	int3_emulate_call(regs, (unsigned long)&int3_selftest_callee);
+	ip = regs->ip - INT3_INSN_SIZE + CALL_INSN_SIZE;
+	int3_emulate_call(regs, ip, (unsigned long)&int3_selftest_callee);
 	return NOTIFY_STOP;
 }
 
@@ -2754,7 +2756,7 @@ noinstr int smp_text_poke_int3_handler(struct pt_regs *regs)
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

