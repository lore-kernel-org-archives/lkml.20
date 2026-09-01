Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8DDCA42902D
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 15:27:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788276422; cv=none; b=GP0f6SH7e5mV50iBxUdrE1dRumHqZzBml/kgrPhfvcEJxi+UdDkZ9QCngAuWWlQSarGuKJTFlFU2FP2CsObIHtelUBfXjLB/36A9cOe5DYQhtolaDE5GjwT7VWVKT7v2Y9U2R3624rkmXtQa77UrwU9IWsp4HqiGjcvmO+VipSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788276422; c=relaxed/simple;
	bh=UlNPE/1ZOdMlJabmsnB4nDCZ/BqTCCq7uH2zFilUQ2A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Yby6pP+xpwtmi/n4RrJ/LetrMRnmFMdRYRNrnXsaQx8Ge71rQrQ+ioUvwyPZOpHABlqo8INF+fI4n2L+ONKY0qRgf3xPjSip7uoGVjp0b7QUCz9RBPOq2A36lgr8v5rMS41sTH2K/2R9ztu6gTIm4GfA9SrOoSG859utv4RqSlk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=tGs9t83z; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="tGs9t83z"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4E51B1756;
	Tue,  1 Sep 2026 08:26:50 -0700 (PDT)
Received: from J2N7QTR9R3.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 697D03F8C6;
	Tue,  1 Sep 2026 08:26:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788276414; bh=UlNPE/1ZOdMlJabmsnB4nDCZ/BqTCCq7uH2zFilUQ2A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tGs9t83zqDO/3WLtCNoYsjoH1d1UjPg3MXKCC1GS0MevTb4Hmd3o610OVWnspdCR2
	 CAlvLOffS32gCf1QyD8i53zFV2lKAcOdFkFNEyK5hdDWbLBfKYpk6PljCasRpccJXb
	 tFP7MFNc29SUZQC/Y775o1KKSspivM9bAL0iZ0rA=
Date: Tue, 1 Sep 2026 16:26:46 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: linux-kernel@vger.kernel.org, frederic@kernel.org, jstultz@google.com,
	juri.lelli@redhat.com, meted@linux.ibm.com, mingo@redhat.com,
	peterz@infradead.org, sshegde@linux.ibm.com, tglx@linutronix.de,
	vincent.guittot@linaro.org, vschneid@redhat.com
Subject: Re: [PATCH v2 5/6] sched: dynamic: Remove
 HAVE_PREEMPT_DYNAMIC_{CALL,KEY}
Message-ID: <apbutocBHjiBTmCd@J2N7QTR9R3.cambridge.arm.com>
References: <20260803191731.3244294-1-mark.rutland@arm.com>
 <20260803191731.3244294-6-mark.rutland@arm.com>
 <65b9ac80-1503-41ad-adee-59f9260fe4e0@huawei.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <65b9ac80-1503-41ad-adee-59f9260fe4e0@huawei.com>

On Fri, Aug 07, 2026 at 09:54:13AM +0800, Jinjie Ruan wrote:
> 
> 
> 在 2026/8/4 3:17, Mark Rutland 写道:
> > PREEMPT_DYNAMIC is now limited to the FULL and LAZY preemption models.
> > Switching model only changes the behaviour of dynamic_preempt_lazy(),
> > which uses a static key. There are no other static calls or static keys,
> > and so there's no need for HAVE_PREEMPT_DYNAMIC_CALL or
> > HAVE_PREEMPT_DYNAMIC_KEY.
> > 
> > The static key used by dynamic_preempt_lazy() is entirely local to
> > kernel/sched/core.c, and any architecture which selects
> > ARCH_HAS_PREEMPT_LAZY implements the necessary support. Remove
> > PREEMPT_DYNAMIC's dependencies on HAVE_PREEMPT_DYNAMIC_CALL and
> > HAVE_PREEMPT_DYNAMIC_KEY entirely, leaving the dependency on
> > ARCH_HAS_PREEMPT_LAZY.
> > 
> > For architectures which previously selected HAVE_PREEMPT_DYNAMIC_KEY,
> > PREEMPT_DYNAMIC will now be selected by default, matching x86. As the
> > runtime impact is limited to dynamic_preempt_lazy(), this shouldn't be
> > as concerning as previously (e.g. where calls to {cond,might}_resched()
> > stubs could introduce a measurable penalty).
> > 
> > As all of this can work without jump labels, JUMP_LABEL is not selected
> > explicitly. It is obviously preferable to have JUMP_LABEL enabled, but
> > this is not functionally necessary.

[...]

> > diff --git a/kernel/Kconfig.preempt b/kernel/Kconfig.preempt
> > index fb49424003b2b..87d567680bc74 100644
> > --- a/kernel/Kconfig.preempt
> > +++ b/kernel/Kconfig.preempt
> > @@ -128,11 +128,9 @@ config PREEMPTION
> >  
> >  config PREEMPT_DYNAMIC
> >  	bool "Preemption behaviour defined on boot"
> > -	depends on HAVE_PREEMPT_DYNAMIC
> >  	depends on ARCH_HAS_PREEMPT_LAZY
> > -	select JUMP_LABEL if HAVE_PREEMPT_DYNAMIC_KEY
> 
> After this, only the arm64 architecture explicitly selects JUMP_LABEL.
> When we remove the dependency on HAVE_PREEMPT_DYNAMIC_KEY, should we
> also select JUMP_LABEL for those architectures.
> 
> git grep "select JUMP_LABEL"
> arch/arm64/Kconfig:     select JUMP_LABEL
> block/Kconfig:  select JUMP_LABEL if HAVE_ARCH_JUMP_LABEL
> fs/xfs/Kconfig: select JUMP_LABEL if HAVE_ARCH_JUMP_LABEL
> fs/xfs/Kconfig: select JUMP_LABEL if HAVE_ARCH_JUMP_LABEL

I had deliberately avoided selecting JUMP_LABEL. As the commit message
says, it's not functionally necessary. It also wasn't previously
selected for !HAVE_PREEMPT_DYNAMIC_KEY (e.g. on x86). The relevant
defconfig files have CONFIG_JUMP_LABEL=y regardless, so it ends up being
on by default in practice.

Not selecting JUMP_LABEL allows it to be turned off for testing, so I
would prefer to leave it as-is.

> otherwise
> Reviewed-by: Jinjie Ruan <ruanjinjie@huawei.com>

Thanks!

Mark.
