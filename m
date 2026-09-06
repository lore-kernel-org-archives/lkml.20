Received: from mx10.didiglobal.com (mx10.didiglobal.com [111.202.70.125])
	by smtp.subspace.kernel.org (Postfix) with SMTP id D14EB3C37A5
	for <linux-kernel@vger.kernel.org>; Sun,  6 Sep 2026 13:57:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=111.202.70.125
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788703035; cv=none; b=r5wBY3P1bnAKXYSQ9drVw4SgzssEENv+DYTqU9MuMO+Eg1ixtR3ZLqx8i7+r4XccQt3wmn/PxmD/M/rVo4jQkqpC225aeAMVAu+AqtXowLDAk+bbdRy/bIwBlErhSG0fph5/ToiH8J0oHS3xkVhoUpasiD3fGOtLf8yo7Wx51WQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788703035; c=relaxed/simple;
	bh=FgxngFhrtukUrceqpGlM9T2XWJY+LV7GU+zVAUZUp64=;
	h=Date:From:To:CC:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=CZy+h64EKE4a6IsxYAQi2x6UnvUOvp6rkn+Nqu2wwLzvDWf9IUTH4zxLPFvim38kcOTNVUflq2therUmH7BOhpNP3Wn3fduonimpBmMGAeeuDyYDBp8IGN7eg5VXVFQxx+ecEy9AnySZAhmeuY7SmS58n6MFatqC8h+EHIu/y78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=didiglobal.com; spf=pass smtp.mailfrom=didiglobal.com; dkim=pass (1024-bit key) header.d=didiglobal.com header.i=@didiglobal.com header.b=TMPbfL0p; arc=none smtp.client-ip=111.202.70.125
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=didiglobal.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=didiglobal.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=didiglobal.com header.i=@didiglobal.com header.b="TMPbfL0p"
Received: from mail.didiglobal.com (unknown [10.79.64.21])
	by mx10.didiglobal.com (MailData Gateway V2.8.8) with ESMTPS id 333B818A532BBD;
	Sun,  6 Sep 2026 21:53:45 +0800 (CST)
Received: from BJ01-ACTMBX-04.didichuxing.com (10.79.64.12) by
 BJ01-ACTMBX-02.didichuxing.com (10.79.64.21) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Sun, 6 Sep 2026 21:53:44 +0800
Received: from didi-ThinkCentre-M920t-N000 (10.79.64.102) by
 BJ01-ACTMBX-04.didichuxing.com (10.79.64.12) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.45; Sun, 6 Sep 2026 21:53:44 +0800
Date: Sun, 6 Sep 2026 21:53:26 +0800
X-MD-Sfrom: jinkehan@didiglobal.com
X-MD-SrcIP: 10.79.64.21
From: Jinke Han <jinkehan@didiglobal.com>
To: <linux-kernel@vger.kernel.org>, <mhiramat@kernel.org>, <tglx@kernel.org>,
	<ingo@redhat.com>, <bp@alien8.de>, <dave.hansen@linux.intel.com>,
	<x86@kernel.org>
CC: <hpa@zytor.com>, <peterz@infradead.org>, <rppt@kernel.org>,
	<kees@kernel.org>, <laoar.shao@gmail.com>, <tiozhang@didiglobal.com>
Subject: Re: [PATCH] x86/kprobe: Fix crash when probe cs call
Message-ID: <20260906135326.GA17099@didi-ThinkCentre-M920t-N000>
Mail-Followup-To: linux-kernel@vger.kernel.org, mhiramat@kernel.org,
	tglx@kernel.org, ingo@redhat.com, bp@alien8.de,
	dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com,
	peterz@infradead.org, rppt@kernel.org, kees@kernel.org,
	laoar.shao@gmail.com, tiozhang@didiglobal.com
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260904214122.15b0924c7ee32dbf0998d876@kernel.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-ClientProxiedBy: BJ02-PUBMBX-01.didichuxing.com (10.79.65.22) To
 BJ01-ACTMBX-04.didichuxing.com (10.79.64.12)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=didiglobal.com;
	s=2025; t=1788702831;
	bh=YeWMlNK4QDLcK4a5VEh8dPXi/3EYndWSMDzD5kMFOqo=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type;
	b=TMPbfL0pCPX6qzusquVFhzstre/mK3ktVZ1GkxTmOAgpaxpbQfswKUrEVFwNiFkhf
	 mmmtg6FoQW3dtosfRiYpRECDzhVRu4710WrQhAokHPoG0eETF7HsCnOnvN/sI/UeZZ
	 QccArHjKsevSuSHY2ouXdhIvWcr/LhFXV7rNrgvk=

On Fri, Sep 04, 2026 at 09:41:22PM +0900, Masami Hiramatsu wrote:
> On Thu, 27 Aug 2026 10:57:56 +0800
> Jinke Han <jinkehan@didiglobal.com> wrote:
> 
> > When I used eBPF to probe the call instructions within a function,
> > we encountered a kernel crash.
> > 
> > The ebpf tool probes the 257 offset of the __hrtimer_run_queues
> > function.
> > 
> > <__hrtimer_run_queues+249>:  nopl   0x0(%rax,%rax,1)
> > <__hrtimer_run_queues+254>:  mov    %r14,%rdi
> > <__hrtimer_run_queues+257>:  cs call <__x86_indirect_thunk_r12>
> > <__hrtimer_run_queues+263>:  mov    %eax,%r12d
> > <__hrtimer_run_queues+266>:  xchg   %ax,%ax
> > <__hrtimer_run_queues+268>:  mov    %r13,%rdi
> > 
> > The scene of kernel crash is as follows:
> > 
> > [73665.737181] BUG: unable to handle page fault for address: 00000000000f41c9
> > [73665.744253] #PF: supervisor write access in kernel mode
> > [73665.749643] #PF: error_code(0x0002) - not-present page
> > [73665.754843] PGD 0 P4D 0
> > [73665.757390] Oops: 0002 [#1] SMP NOPTI
> > [73665.761073] CPU: 1 PID: 0 Comm: swapper/1 Kdump: loaded Tainted: P
> > [73665.782671] RIP: 0010:__hrtimer_run_queues+0x106/0x230
> > 
> > Note that __hrtimer_run_queues+0x106 is __hrtimer_run_queues+262, which is
> > at the 6th byte of the above cs call instruction. Since the cs call
> > instruction occupies 6 bytes, the exception occurred in the middle of that
> > call instruction.
> 
> Ah, OK. So it adds a dummy CS prefix for padding the instruction.
> Also, please Cc probe patch to linux-trace-kernel@vger.kernel.org too.
> 
> > 
> > The root cause is that when using eBPF tools to probe in the middle of a
> > function, kprobe with int3 is used as the underlying implementation.
> > During single-step emulation of the original call instruction,
> > int3_emulate_call assumes that the probed call instruction is 5 bytes
> > long. However, the actual CS-prefixed call instruction occupies 6 bytes,
> > so it constructs an incorrect exception return address. When the CPU
> > returns from the kprobe handler, the next instruction to be executed is at
> > the address of the last byte of that CS call instruction. Coincidentally,
> > starting from that address, the CPU fetches and decodes a completely
> > different instruction, which ultimately triggers a kernel crash.
> > 
> > Fix the issue by using the actual instruction length obtained from
> > the instruction decoder when constructing the exception return
> > address, rather than relying on the hardcoded CALL_INSN_SIZE macro.
> > 
> 
> OK, this fixes kprobe local, but for cleanliness, I have a comment.
> 
> > Cc: stable@kernel.org
> > Fixes: 6256e668b7af ("x86/kprobes: Use int3 instead of debug trap for single-step")
> > Signed-off-by: Jinke Han <jinkehan@didiglobal.com>
> > ---
> >  arch/x86/kernel/kprobes/core.c | 4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
> > 
> > diff --git a/arch/x86/kernel/kprobes/core.c b/arch/x86/kernel/kprobes/core.c
> > index 4e5f8c1736ec..b50e4a60bdfe 100644
> > --- a/arch/x86/kernel/kprobes/core.c
> > +++ b/arch/x86/kernel/kprobes/core.c
> > @@ -511,9 +511,11 @@ NOKPROBE_SYMBOL(kprobe_emulate_ret);
> >  static void kprobe_emulate_call(struct kprobe *p, struct pt_regs *regs)
> >  {
> >  	unsigned long func = regs->ip - INT3_INSN_SIZE + p->ainsn.size;
> > +	unsigned long ip = func;
> >  
> >  	func += p->ainsn.rel32;
> 
> This looks a bit less readability because func is once have a return address
> and later it becomes call address. Moreover int3_emulate_call() is kept broken :(.
> 
> > -	int3_emulate_call(regs, func);
> > +	int3_emulate_push(regs, ip);
> > +	int3_emulate_jmp(regs, func);
> 
> What about updating int3_emulate_call() to get ip (=return address) and func?
> 
> void int3_emulate_call(struct pt_regs *regs, unsigned long ip, unsigned long func)
> {
> 	int3_emulate_push(regs, ip);
> 	int3_emulate_jmp(regs, func);
> }
> 
> Then in  smp_text_poke_int3_handler(struct pt_regs *regs),  we will call:
> 
> 	int3_emulate_call(regs, (long)ip, (long)ip + tpl->disp);
> 
> And in this, we simply call;
> 
> 	unsigned long ip = regs->ip - INT3_INSN_SIZE + p->ainsn.size;
> 
> 	int3_emulate_call(regs, ip, ip + p->ainsn.rel32);
> 
> (Note: currently smp_text_poke_batch() does not handle non-5 byte nop.
> it checks the size.)
> 
> Thanks,
> 
> >  }

That sounds very reasonable. I will adopt it in v2. Thanks.
--
Jinke han
> >  NOKPROBE_SYMBOL(kprobe_emulate_call);
> >  
> > -- 
> > 2.34.1
> > 
> 
> 
> -- 
> Masami Hiramatsu (Google) <mhiramat@kernel.org>
