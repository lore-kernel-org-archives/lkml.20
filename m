Received: from hall.aurel32.net (hall.aurel32.net [195.154.119.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D1423A48F7
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 04:33:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.154.119.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790310842; cv=none; b=OV3aipD1EzbLvnPFAhFUkdkRtc42TR8w04n+TuAEYq5Y+QyhZBSRCdul7YKhWW3QWnvPsuRDgv0UEr+PdnYuOli7mqfPTTCporJgE1cMt3963b71vZ5p8vfdXL7pP0KjNljRZ5ApW4li7k4wXmdNBPRKAJp+h2qQDKkk7JaHOuk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790310842; c=relaxed/simple;
	bh=SsEb/pZQz6Vcr1BPI9568j67dmoz0/0wLU12Nysv4g4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iSzj6/5Sn6oCFK4zAKpvFTMq0m4it0KzMyvST8ZS4gfnWD8Fm2T0I8uBkYFVoGGjM6vY75XG2jgdzXQ3Id2x/ahJ1H7GTCYwwvAbBLfThZGvbeoSnaUtK4u5LPN9WbGK2Zx3v4lZioQk6SeWXxFLJFsB3y1SCRBnzoheCwTY5/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=aurel32.net; spf=pass smtp.mailfrom=aurel32.net; dkim=pass (2048-bit key) header.d=aurel32.net header.i=@aurel32.net header.b=BJHQrLaX; arc=none smtp.client-ip=195.154.119.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=aurel32.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aurel32.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=aurel32.net header.i=@aurel32.net header.b="BJHQrLaX"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=aurel32.net
	; s=202004.hall; h=In-Reply-To:Content-Type:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Content-Transfer-Encoding:From:Reply-To:
	Subject:Content-ID:Content-Description:X-Debbugs-Cc;
	bh=7hQ11hEZQrpBkoI/YAXz3ZjiMto8X2wVm1c+8n1Ybso=; b=BJHQrLaX1bNEXN49+vdvDEqUPK
	hNZ6qD/0aUTH5S3mmoT2ussX7XsJkxg0glr8SrMIwHUgc1ON7zXjuxULhoiQzlVCQoIkevMM4jAPz
	Km2+xT9x1DfvHx1zbwRxI2QnvcGyn1+bVXJVVuNzdU8MawUb2INqoYd3IzJ6aO1FJPY6CHmCtHrgk
	tGmfx+QjpEvKpZjRhuodeHNdGjUIfQ/K0ko5EAFi4fTGFgFnsM5JmdCTzTdequFvNSwIcaq+MSiTO
	EWhOMjXuT5HeYtk+tfFPG9vKLOx2rI08TTX9afcAqZ8GW3y9JiPnL4IGrvxOvytGhtpGHvhnY0B6F
	9nE/aJRQ==;
Received: from authenticated user
	by hall.aurel32.net with esmtpsa  (TLS1.3)  tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <aurelien@aurel32.net>)
	id 1x9xd8-00000009gVM-24Fa;
	Fri, 25 Sep 2026 06:33:50 +0200
Date: Fri, 25 Sep 2026 06:33:50 +0200
From: Aurelien Jarno <aurelien@aurel32.net>
To: Guobin Zhang <guobin.zhang@intel.com>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: signal: protect regs->status RMW from concurrent
 preemption
Message-ID: <arX5rpNRRk8r2Nve@aurel32.net>
Mail-Followup-To: Guobin Zhang <guobin.zhang@intel.com>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260807-vector_fpu_regs_status_rmw_fix-v1-1-0c16848b60db@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260807-vector_fpu_regs_status_rmw_fix-v1-1-0c16848b60db@intel.com>
User-Agent: Mutt/2.4.1 (2026-07-04)

Hi Guobin,

On 2026-08-07 11:00, Guobin Zhang wrote:
> __fstate_clean() performs a non-atomic read-modify-write (RMW) on
> task_pt_regs(current)->status to clear the FS bits. This RMW is
> unprotected - it runs with preemption enabled and IRQs on during
> signal delivery (setup_rt_frame -> fstate_save) and sigreturn
> (restore_fp_state -> fstate_restore).
> 
> If a reschedule IPI or timer interrupt triggers preemption between
> the load and store of this RMW, __switch_to_vector() calls
> riscv_v_vstate_set_restore() which modifies the VS bits of the
> same regs->status. When the preempted task resumes, it stores back
> the stale value captured before preemption, overwriting the VS
> update and restoring VS=DIRTY while TIF_RISCV_V_DEFER_RESTORE
> remains set - a combination that should never occur and leads to
> vector state corruption.
> 
> The race window:
> 
>   __fstate_clean (signal path)      set_restore (schedule path)
>   -----------------------------     -----------------------------
>   ld  a0, regs->status  // VS=DIRTY, FS=DIRTY
>                                      <- preempted (reschedule IPI)
>                                      regs->status VS = INITIAL
>                                      set TIF_RISCV_V_DEFER_RESTORE
>                                      <- resumed
>   andi a0, ~FS
>   ori  a0, FS_CLEAN     // stale a0 still has VS=DIRTY
>   sd   a0, regs->status // overwrites VS=INITIAL with VS=DIRTY
>   -> result: VS=DIRTY + DEFER -> ANOMALY
> 
> Fix by adding preempt_disable/enable around the RMW in
> __fstate_clean() and fstate_off(). riscv_v_vstate_set_restore()
> has the identical hazard: it is called from __restore_v_state()
> (sigreturn path) with preemption enabled, and it can race the same
> way against the scheduler's own call to riscv_v_vstate_set_restore()
> for the same task in __switch_to_vector(). Wrap that call site with
> preempt_disable/enable as well.
> 
> Add WARN_ON_ONCE(preemptible()) to riscv_v_vstate_restore()
> to catch any future unprotected callers at development time.
> 
> Signed-off-by: Guobin Zhang <guobin.zhang@intel.com>
> ---
> Race: regs->status is shared between the FPU (SR_FS) and vector
> (SR_VS) state machines. Three call sites do a non-atomic RMW on it
> while preemptible: __fstate_clean()/fstate_off() in switch_to.h, and
> riscv_v_vstate_set_restore() as called from signal.c's
> __restore_v_state() (sigreturn path).
> 
> Cause: if the task is preempted between the load and the store, the
> scheduler's own switch_to() writes the other half of the same
> register word when switching this task back in. The task then
> resumes and stores its stale value, clobbering that write.
> 
> Fix: wrap each RMW with preempt_disable()/preempt_enable(). This is
> sufficient because the conflicting writer only runs via an actual
> context switch of this task, which preempt_disable() prevents.
> local_irq_disable() is not needed: no IRQ handler touches
> regs->status, so masking IRQs would add latency without closing any
> extra race.
> 
> Reproduced on Spacemit K1 hardware; not reproducible under QEMU/TCG
> (see commit message for the full race-window trace).
> ---
>  arch/riscv/include/asm/switch_to.h | 4 ++++
>  arch/riscv/include/asm/vector.h    | 2 ++
>  arch/riscv/kernel/signal.c         | 2 ++
>  3 files changed, 8 insertions(+)

Han Gao pointed me to this patch as a possible fix to the issue I 
encountered on the SpacemiT K1 [1]. So far, my first tests show
that it either fixes the issue or at the bare minimum hides it.

As you also mention that you reproduced the issue on the Spacemit K1 
hardware, can you please tell me if the bug appeared with similar 
symptoms?

Thanks
Aurelien

[1] https://lore.kernel.org/spacemit/apSYF5x1Tu7PlyL1@aurel32.net

-- 
Aurelien Jarno                          GPG: 4096R/1DDD8C9B
aurelien@aurel32.net                     http://aurel32.net
