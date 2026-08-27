Received: from mx9.didiglobal.com (mx9.didiglobal.com [111.202.70.124])
	by smtp.subspace.kernel.org (Postfix) with SMTP id 70B96226D05
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 03:01:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=111.202.70.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787799699; cv=none; b=h9fNgsXLSugjzMAgB+qJ5CHQK0Y44z9P/xwQe61WIN7Uxj1YayEwYnLhjY0BcRz03JMyR/uT/6t2CkUqfle4Em8PRB2JodQ1yu46QoaEvxXU9bhYsejZh/KSJVeZO1/a6ylRtt77z3dPs6NWV1bb7gFa9eUP7Vmz4TVCGPTLpDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787799699; c=relaxed/simple;
	bh=s2V4Ya19UdPpYWr3zasKqleH2w7XOCmhoZipoQYE/SE=;
	h=Date:From:To:CC:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=aKs+qCkIIdXzjEgokOgNlKRKAfUctZGnB27KQCupgoLVeKZ8G1MbixpAxu2H4pHgKINbYbXJrEAL/winWQ4tSxoPRpFuyi3tW9vjeE82UYRF7djRkRJSZADh9vvRKig0FW6d6U/kI6YsKfUAmM1wERF4yTZ8yP5qVAUtivxC1cc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=didiglobal.com; spf=pass smtp.mailfrom=didiglobal.com; dkim=pass (1024-bit key) header.d=didiglobal.com header.i=@didiglobal.com header.b=kW18OEE0; arc=none smtp.client-ip=111.202.70.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=didiglobal.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=didiglobal.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=didiglobal.com header.i=@didiglobal.com header.b="kW18OEE0"
Received: from mail.didiglobal.com (unknown [10.79.64.21])
	by mx9.didiglobal.com (MailData Gateway V2.8.8) with ESMTPS id 28B231846D1BC8;
	Thu, 27 Aug 2026 10:58:08 +0800 (CST)
Received: from BJ01-ACTMBX-04.didichuxing.com (10.79.64.12) by
 BJ01-ACTMBX-02.didichuxing.com (10.79.64.21) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 27 Aug 2026 10:58:07 +0800
Received: from didi-ThinkCentre-M920t-N000 (10.79.64.102) by
 BJ01-ACTMBX-04.didichuxing.com (10.79.64.12) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.45; Thu, 27 Aug 2026 10:58:07 +0800
Date: Thu, 27 Aug 2026 10:57:56 +0800
X-MD-Sfrom: jinkehan@didiglobal.com
X-MD-SrcIP: 10.79.64.21
From: Jinke Han <jinkehan@didiglobal.com>
To: <jinkehan@didiglobal.com>, <tglx@kernel.org>, <mingo@redhat.com>,
	<bp@alien8.de>, <dave.hansen@linux.intel.com>, <x86@kernel.org>
CC: <hpa@zytor.com>, <peterz@infradead.org>, <rppt@kernel.org>,
	<kees@kernel.org>, <mhiramat@kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH] x86/kprobe: Fix crash when probe cs call
Message-ID: <20260827025756.GA26653@didi-ThinkCentre-M920t-N000>
Mail-Followup-To: tglx@kernel.org, mingo@redhat.com, bp@alien8.de,
	dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com,
	peterz@infradead.org, rppt@kernel.org, kees@kernel.org,
	mhiramat@kernel.org, linux-kernel@vger.kernel.org
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
	s=2025; t=1787799493;
	bh=ehCw5tfpz5vaSqv5J0gTcVmSLLdaO2kJH8zuAhSIQfQ=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type;
	b=kW18OEE0XYpHLX34PBPFkKvW4D1etYxFRabwL9WI94hahgxRyHgDA8FnPhVL/Ohnd
	 S62ewBP1HmqnkjU1yIxfm2ftLCWb0qkW++8EovZVlTI664nrJ5xO1AQ9eQi9xwGC2s
	 rFsWNZ+W3+lU7WETw6K5QtGG6BR/8qDQj2ezijow=

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
Fixes: 6256e668b7af ("x86/kprobes: Use int3 instead of debug trap for single-step")
Signed-off-by: Jinke Han <jinkehan@didiglobal.com>
---
 arch/x86/kernel/kprobes/core.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/x86/kernel/kprobes/core.c b/arch/x86/kernel/kprobes/core.c
index 4e5f8c1736ec..b50e4a60bdfe 100644
--- a/arch/x86/kernel/kprobes/core.c
+++ b/arch/x86/kernel/kprobes/core.c
@@ -511,9 +511,11 @@ NOKPROBE_SYMBOL(kprobe_emulate_ret);
 static void kprobe_emulate_call(struct kprobe *p, struct pt_regs *regs)
 {
 	unsigned long func = regs->ip - INT3_INSN_SIZE + p->ainsn.size;
+	unsigned long ip = func;
 
 	func += p->ainsn.rel32;
-	int3_emulate_call(regs, func);
+	int3_emulate_push(regs, ip);
+	int3_emulate_jmp(regs, func);
 }
 NOKPROBE_SYMBOL(kprobe_emulate_call);
 
-- 
2.34.1

