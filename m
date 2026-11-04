Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793799687;
	b=DzrrdVeGqH+wetvdi2XmS9zZhAt918zITExghO1BBYn+zlRtZcQnhVOsS8asJXf+tRNb
	 cCgI0HgY3EXX6xsxzR9smZyzEXBVPD7tGGhb2WLKJPMk8GJT1s8S9/SlYxckX0Qm6HZB8
	 JrZxQPKlQvKgHF2z0fTx0EbyBBqgwYo88tsQDO4XRo6KxGbFNaYkh7RmCB6UmuUb37bjv
	 f9YsDn4tY4rmhdCzpSCJApD78MthYUca871M/YKD4kQs2f1O3RlP6KmnYSsiIKBHS9W+e
	 QMpCISBgiESCeI3BzsaZy9R8ZhYA7qMsguEqI4lzZWmrbO9Nt+TYqtsmqW/cgVbkfKw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793799687;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=DsqUBkIa7Olvd6FTVJf/qEImpffvzM2i9AQMrT58Pf8=;
	b=ihmx3vZTwhFXW3RYRCmvQ3v5HhlzHnwMdm/Vx7lU9MR3xo/MbFfv91C/QGSNbYeWrn4n
	 n1czvH4tFNUIus8JvYZpoylfdsRYEOpaQX8k4XNUblBdIpE/MPh1AzB7PXXkkwXbRO2F7
	 ZGQ8sXKIGAAlLRihi2SVLkJr35BUTSeh6PGBrT+in/R8R+q3o2L44+ecn6kBFAdxYqO3D
	 ND2yW1vlgh0ay7pASFZ7QryjP9+OUawysIObU5U3di/bip7yBDrCcSIomKu9I5uOEt+/V
	 ODn3P5rTU6DXrX5oZVf56L5efIVE7YwB3er6OT2nHf65/doPrwOTFxaXwfCuC9mNGJw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JT20OMQf;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87E17606A31B
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 13:41:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JT20OMQf
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA0F91F000C1;
	Wed,  4 Nov 2026 13:41:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793799687;
	bh=DsqUBkIa7Olvd6FTVJf/qEImpffvzM2i9AQMrT58Pf8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=JT20OMQfzen2gkICb9s6vngZ0xsFXQq5MlNq6Skcb+xj9wzC/iCl2g+QGbxcP5NOl
	 IGOYNVl5TlTBFFAX4U/NFcPTyG2gsE05k5bQkfWW0uunf4p+pagOugov4KaGmrXQGK
	 76Ap8MewNhhcIG6oGXpx4RdaU7Gvr5NO8u2kC1O9qfuyccQ8dIUBPSjhFcK5OusjME
	 kGXAPwzyYGyb8H1feJ1k4FlpwfTXxwkxcovpL4mFWnekhw0Zd+5cu88Xjbgldz0aPf
	 Mw8iLWTUGMmDgJc/gaYGgbRKY2Xi420o4PDMxWZthB7FHROvtAN7j2oTd9cQ1qdf6b
	 5HFAFGCD1mTMA==
Date: Wed, 4 Nov 2026 13:41:22 +0000
From: Will Deacon <will@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: Zhao Gongyi <zhaogongyi@bytedance.com>, mark.rutland@arm.com,
	oleg@redhat.com, ruanjinjie@huawei.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] arm64: ptrace: don't warn on missing siginfo in a
 group-stop
Message-ID: <aus2Aq12Z-PKvoW7@willie-the-truck>
References: <20261023110710.10145-1-zhaogongyi@bytedance.com>
 <at-czRUYRPRxi9dy@arm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <at-czRUYRPRxi9dy@arm.com>

On Mon, Oct 26, 2026 at 06:32:45PM +0000, Catalin Marinas wrote:
> On Fri, Oct 23, 2026 at 07:07:10PM +0800, Zhao Gongyi wrote:
> > PTRACE_ATTACH to a group-stopped child can enter do_jobctl_trap(),
> > which calls ptrace_stop() without siginfo. If the tracer writes
> > NT_ARM_SYSTEM_CALL, system_call_set() can change syscallno from
> > NO_SYSCALL before calling update_syscall_orig_x0_after_ptrace(). The
> > WARN_ON_ONCE(!info) then fires, although this is a valid ptrace stop.

I can't quite get my head around what it means to set NT_ARM_SYSTEM_CALL
in this context. Suddenly, in_syscall() will return true, which has
implications for things like signal handling that seem bizarre if we're
not actually in a syscall. Should we be avoiding this situation to start
with?

> > Remove the warning and guard the syscall-exit-stop check against a
> > missing siginfo. Keep recognizing both SIGTRAP and SIGTRAP | 0x80:
> > syscall-exit-stops use either value depending on whether the tracer
> > enabled PTRACE_O_TRACESYSGOOD. With no siginfo, allow the final
> > assignment to synchronize orig_x0 from x0.
> > 
> > Fixes: 88b839ce497c ("arm64: ptrace: Keep 'orig_x0' in-sync with x0 on syscall entry")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Zhao Gongyi <zhaogongyi@bytedance.com>
> > ---
> > Changes since v1:
> > - Remove the warning and early return, as suggested by Oleg.
> > - Keep recognizing syscall-exit-stops with or without PTRACE_O_TRACESYSGOOD.
> > 
> > v1: https://lore.kernel.org/r/20261016024536.18938-1-zhaogongyi@bytedance.com
> > 
> > Tested on arm64 KVM at af32da41b032 with this v2 applied.
> > At a group-stop, PTRACE_GETSIGINFO returned -EINVAL and an
> > NT_ARM_SYSTEM_CALL write succeeded. Syscall-entry and seccomp
> > x0 rewrites worked. At syscall-exit-stops, NT_PRSTATUS writes succeeded
> > with and without PTRACE_O_TRACESYSGOOD (si_code 133 and 5,
> > respectively). No kernel warnings occurred.
> > 
> >  arch/arm64/kernel/ptrace.c | 6 +-----
> >  1 file changed, 1 insertion(+), 5 deletions(-)
> > 
> > diff --git a/arch/arm64/kernel/ptrace.c b/arch/arm64/kernel/ptrace.c
> > index f743cbec1..22fb9eeed 100644
> > --- a/arch/arm64/kernel/ptrace.c
> > +++ b/arch/arm64/kernel/ptrace.c
> > @@ -573,10 +573,6 @@ static void update_syscall_orig_x0_after_ptrace(struct task_struct *target)
> >  	if (regs->syscallno == NO_SYSCALL)
> >  		return;
> >  
> > -	/* We should only be called when target is in a ptrace stop */
> > -	if (WARN_ON_ONCE(!info))
> > -		return;
> 
> That's a slight semantic change since this function may now update
> orig_x0 even when !info. However, I think it makes more sense as the aim
> of commit 88b839ce497c ("arm64: ptrace: Keep 'orig_x0' in-sync with x0
> on syscall entry") was to update orig_x0 in all cases other than
> syscall-exit-stop. We can't have the latter with !info.
> 
> I'll wait for a couple of days to see if Will has any comments and queue
> it.

I was trying to limit the scope of this hack as much as possible, so I
think I'd prefer the early return tbh (i.e. just drop the WARN_ON_ONCE()
and update the comment).

Will
