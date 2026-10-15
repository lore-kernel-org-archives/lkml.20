Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6BBCD4E36CB
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 12:04:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792065883; cv=none; b=E8o2uGDUrmWyKmoEfOFC2ru6JYTm+Ogpl171ScMDHxNlwPgXsFI9iw3wiIEkKEhe9DSV/yAZnxjFPApE96oVnC+fMF9fw8uU6Ya4cqX1zq3wvcjYSm2If/vW8fahBOewyeM2NHSvujoUq0Z1yOVblrsLtngR9vRshtJVyX0IWDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792065883; c=relaxed/simple;
	bh=9hD0gbQLuZhAtA/2D6ZAId/8XxZyvrMdTlj7LEroJC0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tHwAu1M0fasD/aMCZ+CJNLxnviUhvcg39MckhNvXmO/Ul+GA3KsAqR6wNwdBwCkjnOEeifofI+xKiQXWmadbLDW3oDoZegdpJ3hjXaDRPOe5sxfgksMfbGjuTuI0lylDQEzPd8y2VRR+2Kfjytsrcc8BrbsM2InWfrif9VmWxeA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=jWuo7fwf; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="jWuo7fwf"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4FEA514BF;
	Thu, 15 Oct 2026 05:04:36 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D528E3F871;
	Thu, 15 Oct 2026 05:04:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1792065879; bh=9hD0gbQLuZhAtA/2D6ZAId/8XxZyvrMdTlj7LEroJC0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jWuo7fwfRMkLuTfqYVBJpBe4G9ihPMuBmC9+Rd8NFryOfIE1Nn8l9gnmM+U3VNoST
	 UQe6IbmfqqwbrsdbIi70juGwH6B/T180+9Qi2aWGX3erhCqE9qmc6kr66HcCwKEubQ
	 +ebgCSucVqtXL8lVUw4S2++i9oj0Q5g6fR1HNlzk=
Date: Thu, 15 Oct 2026 13:04:36 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Mark Brown <broonie@kernel.org>
Cc: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] arm64: gcs: Store GCSCRE0_EL1 values instead of
 userspace mode
Message-ID: <atDBVHvDQ3Pwr2Uq@arm.com>
References: <20260917-arm64-gcs-store-gcscre0-v1-0-3c9fa9213bac@kernel.org>
 <20260917-arm64-gcs-store-gcscre0-v1-2-3c9fa9213bac@kernel.org>
 <as-8IqsbMbOBo5Oq@arm.com>
 <c39b2cc4-832f-49cb-8a59-e5b7a8bd9317@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c39b2cc4-832f-49cb-8a59-e5b7a8bd9317@sirena.org.uk>

On Wed, Oct 14, 2026 at 07:28:08PM +0100, Mark Brown wrote:
> On Wed, Oct 14, 2026 at 06:30:10PM +0100, Catalin Marinas wrote:
> > On Thu, Sep 17, 2026 at 11:14:17PM +0100, Mark Brown wrote:
> 
> > >  	u64			por_el0;
> > >  #ifdef CONFIG_ARM64_GCS
> > > -	unsigned int		gcs_el0_mode;
> > > +	unsigned int		gcscre0_el1;
> 
> > u64?
> 
> Sure, I always find the decision about which to use in a given situation
> confusing.

gcs_el0_mode was a software view. gcscre0_el1 is a raw sysreg value,
described in the Arm ARM as 64-bit (though the top bits are RES0).

> > > -	current->thread.gcs_el0_mode = enabled;
> > > +	gcs_set_el0_mode(current, enabled);
> > 
> > I think we have an existing bug here and it's more serious without this
> > patch. restore_gcs_context() does not update the actual register and,
> > with current mainline, we may even skip the hardware write in
> > gcs_thread_switch(). Basically one task can disable GCS for another
> 
> Right, that's an existing bug.
> 
> > task. Can we get gcs_set_el0_mode() to actually update the register as
> > well?
> 
> We also set the mode from ptrace at which point it's being set for a
> different thread.

Could we do like in arch_set_shadow_stack_status() for gcspr_el0 and
only set it if task == current?

> > On the sigreturn bug, do you recall why we thought we needed to update
> > the gcs_el0_mode in the signal handler (or even expose it)? Wouldn't it
> > be better if the signal handler did a prctl() directly if it needed to
> > change the mode for the current thread?
> 
> In theory you could have tasks with a mix of GCS and non-GCS threads
> doing green thread stuff, especially if the clone3() stuff had gone in
> so that the GCS wasn't so tied to the thread.  You could also have mixed
> push or write permissions in that case.  I am not sure that any of this
> is a realistic use case though, I'm certainly not aware of any current
> users. 
> 
> The case where a signal handler tries to handle a GCS fault by disabling
> GCS could be handled using prctl() if someone wants it.  I'm not aware
> of anyone doing that yet, there was some talk about implementing it in
> glibc at LPC but it's not been implemented.

Just thinking, if we fault on a modified field, a handler using prctl()
would also have to update features_enabled in the sigcontext, otherwise
sigreturn fails. I think that is already the case today for disabling
(the frame still has ENABLE, so sigreturn returns -EINVAL). prctl()
changes to WRITE/PUSH are silently reverted.

Another option is to ignore the field on sigreturn and keep it for
information only. I favour the latter, but it needs to be a separate
patch for discussion and a change to the sigreturn text in
Documentation/arch/arm64/gcs.rst.

-- 
Catalin
