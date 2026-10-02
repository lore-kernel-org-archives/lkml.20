Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BECB64746C0
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 09:43:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790934230; cv=none; b=uFAGxp8jUuf06vUreIGOY5+fK30woX5GeRCM1JxzeZad6T1jW96U7YCO3mWGlDqJqEVZXeDy3JQCB2Fidu5+aD+QROq+KYsBuQ7mjSGJjjo9/mKcjAAAr81EnTSO8L0fB+K2e/tJ04i98UCh8+gR+y1jtyniZP1cSzpujJx5rAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790934230; c=relaxed/simple;
	bh=bIlBGTbE6NoUAOiXsN6aRXwqWjVDbHnZ0+fxNYTuTGA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=loBRIMbCKCA3jbJKJXkTxXCwULFWHuAIyWf+eal29Q6QV+F0vRKkwLZO3HG9C8M28JXwADwwlAFMmq1L0x5rofdKJBWoW9Gv+8xryU/ZosfGUvSe8YlrOuXuVt1Fn2DGXb+BXa9lHOjgRu+9rH/B/rny10JhSFL2FEEJM8rOqN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=fixO7Oy2; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="fixO7Oy2"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9058A497;
	Fri,  2 Oct 2026 02:43:44 -0700 (PDT)
Received: from J2N7QTR9R3.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 948943F86F;
	Fri,  2 Oct 2026 02:43:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790934228; bh=bIlBGTbE6NoUAOiXsN6aRXwqWjVDbHnZ0+fxNYTuTGA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fixO7Oy2bsG6sTQ1wi7KjtqwK3C14qSLwNZX3cDr1fYuHSdXkjcNVXzBFfW4DIqXB
	 6i7cyA4MCbeAiEQ/LtYpwcHgAi1mddIuVno7/HOUUNokK3V/gA32fjncacVbo44tYa
	 rR2t9dY+4iHbyj7jH/hRWTcrhVGxFOrr9z+h3bQQ=
Date: Fri, 2 Oct 2026 10:43:41 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Breno Leitao <leitao@debian.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, rmikey@meta.com, kas@kernel.org,
	usama.arif@linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, kernel-team@meta.com
Subject: Re: [PATCH v2] arm64/sve: Don't zero the SVE state buffer when the
 SVE state is live
Message-ID: <ar98zc8h7UkIR6yc@J2N7QTR9R3.cambridge.arm.com>
References: <20260915-b4-arm64-sve-acc-memset-v2-1-14b7ab9c71bd@debian.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260915-b4-arm64-sve-acc-memset-v2-1-14b7ab9c71bd@debian.org>

On Tue, Sep 15, 2026 at 03:51:05AM -0700, Breno Leitao wrote:
> Currently do_sve_acc() always zeroes current->thread.sve_state. This is
> not necessary in the common case, and avoiding the zeroing has a
> measurable impact on some benchmarks.
> 
> In the common case where the task is not preempted and its state is not
> altered by a tracer, do_sve_acc() will observe that TIF_FOREIGN_FPSTATE
> is clear. In such cases, only the live register values matter, and the
> in-memory copy is stale regardless of whether it is saved in
> FP_STATE_FPSIMD format or FP_STATE_SVE format.
> 
> It is worth skipping the zeroing because the SVE state is discarded on
> syscall entry, so userspace that mixes SVE and syscalls re-traps
> constantly. A fleet profile of arm64 hosts running services whose
> memset() is SVE shows the memset under do_sve_acc() accounting for 29%
> of the trap handling cost.
> 
> Measured on a 72-core Neoverse V2 (SVE VL 128, sve_state_size 546,
> performance governor) with perf bench sched pipe pinned to one CPU, and
> SVE operation on write, so that each loop also takes an SVE access trap.
> 
> 	* -0.99% kernel instructions
> 	* -1.38% kernel cycles
> 	* -1.12% wall clock
> 
> Signed-off-by: Breno Leitao <leitao@debian.org>

Avoiding the memset in the fast path makes sense to me, and I believe
this is sound, so:

Acked-by: Mark Rutlame <mark.rutland@arm.com>

Mark.

> ---
> Changes in v2:
> - Rewrote the commit message using Mark's suggested wording: what
>   matters is that the in-memory copy is stale whenever the state is
>   live, not the format it was last saved in
> - Link to v1:
>   https://patch.msgid.link/20260914-b4-arm64-sve-acc-memset-v1-1-67866e442393@debian.org
> ---
>  arch/arm64/kernel/fpsimd.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/kernel/fpsimd.c b/arch/arm64/kernel/fpsimd.c
> index e7f1682a3059b..324c9799b0511 100644
> --- a/arch/arm64/kernel/fpsimd.c
> +++ b/arch/arm64/kernel/fpsimd.c
> @@ -1316,7 +1316,7 @@ void do_sve_acc(unsigned long esr, struct pt_regs *regs)
>  		return;
>  	}
>  
> -	sve_alloc(current, true);
> +	sve_alloc(current, false);
>  	if (!current->thread.sve_state) {
>  		force_sig(SIGKILL);
>  		return;
> @@ -1341,6 +1341,7 @@ void do_sve_acc(unsigned long esr, struct pt_regs *regs)
>  		sve_flush_live();
>  		fpsimd_bind_task_to_cpu();
>  	} else {
> +		memset(current->thread.sve_state, 0, sve_state_size(current));
>  		fpsimd_to_sve(current);
>  		current->thread.fp_type = FP_STATE_SVE;
>  		fpsimd_flush_task_state(current);
> 
> ---
> base-commit: f2bfbc3554ca6919484030729424b9dee2942d24
> change-id: 20260911-b4-arm64-sve-acc-memset-3425ad567857
> 
> Best regards,
> --  
> Breno Leitao <leitao@debian.org>
> 
