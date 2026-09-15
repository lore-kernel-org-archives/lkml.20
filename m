Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF96A46D2CF
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 08:39:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789461574; cv=none; b=fMo1j2aR6o/NNuTpPTotmU5KH3psSskpW+THcEhipbdFMh04GmsRMJRA6PqLTteLwFC1Ors6MYdb7CmstcbDYhI6HwhxabvsjNTi5sELPMUTkkt5ULaZcjQ9dTP25KsHZoQubDZO1OdyrqMHtGNrGAdTyuu7D3KVsmAhTHXzgKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789461574; c=relaxed/simple;
	bh=Xr4NlfVfDBMf1PNK1/DPRZfygwbBq5jJ2h46yDiTJL0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KsiE4BgvlIbdEnR82PyEFzdDjMcMHcuN5x2D2Ejz8mPw1yCXiSSlExTzrSuQtVHROlnnVe9YkHBxOKjBDnJPKkh7W7bRU/aahWN/ydmMZMrCEXYExcSN17zzkbjwyFHuOv/8I47q+rTCk9P07ybrUb59/7d6t8ZdGR+BwadKBiM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=Q2tji9rU; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="Q2tji9rU"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 953AC169E;
	Tue, 15 Sep 2026 01:39:27 -0700 (PDT)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 261253F7B4;
	Tue, 15 Sep 2026 01:39:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789461571; bh=Xr4NlfVfDBMf1PNK1/DPRZfygwbBq5jJ2h46yDiTJL0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Q2tji9rUzvv2R+S029mUW0ex3XRx2AFpQcTDYiY+Yhbr5RxERR3qDtebbTyPN3FNx
	 MXg8Z/tBJO6otuc6PiJ3avrCfkibwYyaD+Q3EgjUVKYBctesaNTO9oZo+1+EwYIo5a
	 BLyLKjjBU5asuZu37iORnEMbrsFfHQcakdV1ZjBM=
Date: Tue, 15 Sep 2026 09:39:24 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Breno Leitao <leitao@debian.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, kernel-team@meta.com
Subject: Re: [PATCH] arm64/sve: Don't zero the SVE state buffer when the SVE
 state is live
Message-ID: <aqkEPCrWXxaU-mNs@J2N7QTR9R3>
References: <20260914-b4-arm64-sve-acc-memset-v1-1-67866e442393@debian.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260914-b4-arm64-sve-acc-memset-v1-1-67866e442393@debian.org>

Hi Breno,

I think the change looks reasonable, but the commit message and comments
aren't quite right. More on that below.

On Mon, Sep 14, 2026 at 05:53:34AM -0700, Breno Leitao wrote:
> do_sve_acc() calls sve_alloc(current, true), which memsets the whole
> task->thread.sve_state buffer whenever it is already allocated.
> 
> Reviwing this code was not trivial giving the ABI here, and the
> exceptions (syscall vs context switch), but, I think this it makes
> sense.
> 
> On the common path the buffer is then never read: when
> TIF_FOREIGN_FPSTATE is clear the state stays in the registers,
> sve_flush_live() zeroes the non-FPSIMD part of them, and
> fpsimd_bind_task_to_cpu() re-binds the task. Only the
> TIF_FOREIGN_FPSTATE path builds the state in memory via fpsimd_to_sve(),
> which writes just the low 128 bits of each Z register and so needs the
> rest pre-zeroed. do_sme_acc() already allocates the same buffer with
> sve_alloc(current, false), so this also makes the two trap handlers
> consistent.
> 
> Skipping the zeroing on the live path is safe:

I think the above three paragraphs can be simplified and clarified as:

| Currently do_sve_acc() always zeroes current->thread.sve_state. This
| is not necessary in the common case, and avoiding the zeroing has a
| measureable impact on some benchmarks.
|
| In the common case where the task is is not preempted and its state is
| altered by a tracer, do_sve_acc() will observe that
| TIF_FOREIGN_FPSTATE is clear. In such cases, only the live register
| values matter, and the in-memory copy is stale regardless of whether
| it is saved in FP_STATE_FPSIMD format or FP_STATE_SVE format.

I don't think we should mention do_sme_acc(). It doesn't zero the
sve_state in any case, and the reasoning for that is different.

> 1) On entry to do_sve_acc() thread.fp_type is FP_STATE_FPSIMD. That is
>    how TIF_SVE came to be clear in the first place: task_fpsimd_load()
>    only clears it in the FP_STATE_FPSIMD case, and an SVE trap cannot
>    be taken from streaming mode.

This is almost right. The task cannot be in streaming mode when the
trap is taken, but the task could previously have been in streaming
mode, and consequently at entry to do_sve_acc() it's possible
thread.fp_type == FP_STATE_SVE from the last time state was saved.

The key thing is that when the state is live in registers, the in-memory
copy is stale, and it's not legitimate to consume the stale in-memory
copy. The format of the in memory copy (which is what thread.fp_type
describes) is immaterial.

> 2) While fp_type is FP_STATE_FPSIMD, thread.sve_state is by definition
>    stale. The state machine comment above task_fpsimd_load() says it
>    "must not be dereferenced and any data stored there should be
>    considered stale and not referenced".
> 
> 3) Every reader honours that. task_fpsimd_load() loads the buffer only
>    in the FP_STATE_SVE case; fpsimd_sync_from_effective_state() and
>    fpsimd_sync_to_effective_state_zeropad() test fp_type first;
>    ptrace's sve_get_common() reaches it only when
>    sve_init_header_from_task() chose SVE_PT_REGS_SVE, which requires
>    fp_type == FP_STATE_SVE; and preserve_sve_context() copies it out
>    only for a non-zero vq, which needs fp_type == FP_STATE_SVE or
>    streaming mode.
> 
> 4) fp_type becomes FP_STATE_SVE in exactly four places, and each has
>    written or zeroed the whole buffer by that point:
>    fpsimd_save_user_state() immediately after sve_save_state(); the
>    TIF_FOREIGN_FPSTATE branch below, after its memset and
>    fpsimd_to_sve(); and ptrace sve_set_common() and signal
>    restore_sve_fpsimd_context(), both after their own
>    sve_alloc(target, true).
> 
> 5) So nothing can observe the bytes left stale here. The buffer only
>    becomes readable at the moment something has just written all of it.

Thanks for digging through this; I very much appreciate that you spent
the time and effort to confirm these points. That said, I think we
should delete them from the commit message, as all of those point are
secondary to whether the in-memory copy is stale.

> This is worth doing because the SVE state is discarded on syscall entry,
> so userspace that mixes SVE and syscalls re-traps constantly. A fleet
> profile of arm64 hosts running services whose memset() is SVE shows the
> memset under do_sve_acc() accounting for 29% of the trap handling cost.
> 
> Measured on a 72-core Neoverse V2 (SVE VL 128, sve_state_size 546,
> performance governor) with perf bench sched pipe pinned to one CPU, and
> SVE operation on write, so that each loop also takes an SVE access trap.
> 
> 	* -0.99% kernel instructions
> 	* -1.38% kernel cycles
> 	* -1.12% wall clock
> 
> The arm64 fp and signal kselftests produce identical results on the two
> kernels.
> 
> Signed-off-by: Breno Leitao <leitao@debian.org>
> ---
>  arch/arm64/kernel/fpsimd.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/kernel/fpsimd.c b/arch/arm64/kernel/fpsimd.c
> index e7f1682a3059b..41e91186ee30b 100644
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
> @@ -1332,6 +1332,11 @@ void do_sve_acc(unsigned long esr, struct pt_regs *regs)
>  	 * registers or memory, so we must zero all state that is not shared
>  	 * with FPSIMD.
>  	 *
> +	 * When the state is live it stays in the registers, which
> +	 * sve_flush_live() zeroes. sve_state is only read when fp_type is
> +	 * FP_STATE_SVE, which is only set after sve_save_state() has written
> +	 * the whole buffer, so zero it only on the path that builds it here.
> +	 *

As above, I dont think fp_type is relevant here.

I don't think we need to extent the comment, and can leave it as it was.

Other than my comments above, this looks good to me. I'd be happy to ack
a version with the fixups suggested above.

Mark.

>  	 * SVE traps cannot be taken from streaming mode, so there cannot be
>  	 * any effective streaming mode SVE state.
>  	 */
> @@ -1341,6 +1346,7 @@ void do_sve_acc(unsigned long esr, struct pt_regs *regs)
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
