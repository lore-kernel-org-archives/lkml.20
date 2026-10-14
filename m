Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C021B52CCD5
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 17:30:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791999019; cv=none; b=mEx1icywzn7vFVGLcQsTh6JNuxMEp9/Tn+ujD9vn0TTFbEcEhen9E5iOX71RLmZt171Ncym6BQ/8/3uHr70jMUa4l9RzmFoQvg0okEELv0HPfVa5Vm90bNKnFRWEvkz0U/kKNjLdv91+GE0rWd0pzuyCIzuJMA3L0BgFWdaBvaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791999019; c=relaxed/simple;
	bh=by6on7IdoMYA3UgFmnlrUVtDz0jT2YuuuHv7ehz4Vso=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RQbEZmGRB0Gj8D6gRYTtansr/Awj4Th1vKiYWdyDNOy1MaDxRJJdbSrUOTSTrFa71h4OGmy/Z7E4UdwEqfQwQEbcnqFecw5tt5vhLcEj7uf8WUONSvJceu6d5YcxcAcjmeB0zlWS23FbuGoB70Kg7LQiYGuOg3F5WxFTXjS2mp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=E4CG3nEO; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="E4CG3nEO"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 529F214BF;
	Wed, 14 Oct 2026 10:30:10 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B6F1F3F7B4;
	Wed, 14 Oct 2026 10:30:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1791999013; bh=by6on7IdoMYA3UgFmnlrUVtDz0jT2YuuuHv7ehz4Vso=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=E4CG3nEOJur/swv/CcWIZxoJS4pKFo0RuEfa5DM8aE7EMBLJn65YktaO44KhAlXB7
	 bw6eDbluamnlZF1rnjsrIfsz63OJrzt204E5UyMZar/mt+2wx50LMAxsDjldFlXTMD
	 RWcwvHKgm4WJE/QOobu/GjxkHKSvYEUzujQTarWY=
Date: Wed, 14 Oct 2026 18:30:10 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Mark Brown <broonie@kernel.org>
Cc: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] arm64: gcs: Store GCSCRE0_EL1 values instead of
 userspace mode
Message-ID: <as-8IqsbMbOBo5Oq@arm.com>
References: <20260917-arm64-gcs-store-gcscre0-v1-0-3c9fa9213bac@kernel.org>
 <20260917-arm64-gcs-store-gcscre0-v1-2-3c9fa9213bac@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260917-arm64-gcs-store-gcscre0-v1-2-3c9fa9213bac@kernel.org>

Hi Mark,

On Thu, Sep 17, 2026 at 11:14:17PM +0100, Mark Brown wrote:
> diff --git a/arch/arm64/include/asm/processor.h b/arch/arm64/include/asm/processor.h
> index 6dfbcacd9ba0..5b9b22ce9329 100644
> --- a/arch/arm64/include/asm/processor.h
> +++ b/arch/arm64/include/asm/processor.h
> @@ -196,7 +196,7 @@ struct thread_struct {
>  	u64			tpidr2_el0;
>  	u64			por_el0;
>  #ifdef CONFIG_ARM64_GCS
> -	unsigned int		gcs_el0_mode;
> +	unsigned int		gcscre0_el1;

u64?

> @@ -593,9 +594,7 @@ static void gcs_thread_switch(struct task_struct *next)
>  	/* GCSPR_EL0 is always readable */
>  	gcs_preserve_current_state();
>  	write_sysreg_s(next->thread.gcspr_el0, SYS_GCSPR_EL0);
> -
> -	if (current->thread.gcs_el0_mode != next->thread.gcs_el0_mode)
> -		gcs_set_el0_mode(next);
> +	write_sysreg_s(next->thread.gcscre0_el1, SYS_GCSCRE0_EL1);
>  
>  	/*
>  	 * Ensure that GCS memory effects of the 'prev' thread are

[...]

> @@ -763,7 +763,7 @@ static int restore_gcs_context(struct user_ctxs *user)
>  	if (!(enabled & PR_SHADOW_STACK_ENABLE))
>  		enabled = 0;
>  
> -	current->thread.gcs_el0_mode = enabled;
> +	gcs_set_el0_mode(current, enabled);

I think we have an existing bug here and it's more serious without this
patch. restore_gcs_context() does not update the actual register and,
with current mainline, we may even skip the hardware write in
gcs_thread_switch(). Basically one task can disable GCS for another
task. Can we get gcs_set_el0_mode() to actually update the register as
well?

On the sigreturn bug, do you recall why we thought we needed to update
the gcs_el0_mode in the signal handler (or even expose it)? Wouldn't it
be better if the signal handler did a prctl() directly if it needed to
change the mode for the current thread?

I don't think we have any precedent for allowing sigreturn to update an
EL1 sysreg. In hindsight, we shouldn't have exposed it at all but that's
ABI now. The next best thing we can do now is check the field hasn't
been modified and fault otherwise (assuming no-one does anything with
this field).

> @@ -120,29 +120,39 @@ SYSCALL_DEFINE3(map_shadow_stack, unsigned long, addr, unsigned long, size, unsi
>  	return addr;
>  }
>  
> -/*
> - * Apply the GCS mode configured for the specified task to the
> - * hardware.
> - */
> -void gcs_set_el0_mode(struct task_struct *task)
> +void gcs_set_el0_mode(struct task_struct *task, u64 flags)
>  {
> -	u64 gcscre0_el1 = GCSCRE0_EL1_nTR;
> +	task->thread.gcscre0_el1 = GCSCRE0_EL1_nTR;
>  
> -	if (task->thread.gcs_el0_mode & PR_SHADOW_STACK_ENABLE)
> -		gcscre0_el1 |= GCSCRE0_EL1_RVCHKEN | GCSCRE0_EL1_PCRSEL;
> +	if (flags & PR_SHADOW_STACK_ENABLE)
> +		task->thread.gcscre0_el1 |= GCSCRE0_EL1_RVCHKEN | GCSCRE0_EL1_PCRSEL;
>  
> -	if (task->thread.gcs_el0_mode & PR_SHADOW_STACK_WRITE)
> -		gcscre0_el1 |= GCSCRE0_EL1_STREn;
> +	if (flags & PR_SHADOW_STACK_WRITE)
> +		task->thread.gcscre0_el1 |= GCSCRE0_EL1_STREn;
>  
> -	if (task->thread.gcs_el0_mode & PR_SHADOW_STACK_PUSH)
> -		gcscre0_el1 |= GCSCRE0_EL1_PUSHMEn;
> +	if (flags & PR_SHADOW_STACK_PUSH)
> +		task->thread.gcscre0_el1 |= GCSCRE0_EL1_PUSHMEn;
> +}

Are we preemptible here? I think we are, so we should build the value
and do a WRITE_ONCE(), otherwise the switch code may get confused.

-- 
Catalin
