Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792710276;
	b=H3SG+uKsY+EHpUUU1v45RdXEaTrWt6U3mxqlt0K2mA81197IvkKTEhiyb4LPzDM+C4fW
	 9nNhhHQergYms7Nb2UK+9hpv3v1Irm6azQbmpZPX7pSDjOL8wc3TkJYwIu8jQ2i9Z1frj
	 54DY1wFpeA9vLa1ccm5CMbSmtxmeG58+dEmoul7BqSgaHC3RBc4j4ZPiO6lAafk9NA4tf
	 Fj52V8NP0AKU76sKuIeKFyP78xBm7VW638vHiKYOqW4YIdmo6ZPUDi+Kw1mytbbB6ZlgD
	 YfJQrzVnIo+XDVLVViFJGIr3xl9oRIgKgR5wdF6zSpxEMs2xXerx+a0UQo47fKwr35Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792710276;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=jSu0BLMuA7L43aT6T2KcW7Fkv7IJTbKPBRbS3rQaZjo=;
	b=IqpTF6KJqEUSTH0rrGyweh9OxfETdiQ3Q7ilr5sFShin6s5A08UuK0/DboBALDfFn0jZ
	 0Zf0OXfWywBbDy0L1VWz1ESxoQ/DmLjWtfW+iwiflXrWmSA8WiRTL6HkOkzjg36HSAg3B
	 2xc136EvmnfETb4cEg+6lj7kpqcwdE0GcudyTxRnnAomJA0SnSlbH9DDDeEKzbzc7SS3i
	 jx6Eth1CTjm/MhHF9w7n4QfaReYXexAeI2Z9oDg92sF4hHGapZpHt/w712v0Qp4EBCfYa
	 Z2kxZPSSlSLY8z4NdoM7e0sOvbt0WENAoRRpicUMNi/ZgWvclpAxtj8kzCjdzY2axsA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=tenstorrent.com;
	spf=pass smtp.mailfrom=tenstorrent.com;
	dkim=pass header.d=tenstorrent.com header.i=@tenstorrent.com header.a=rsa-sha256 header.s=google header.b=Rh9CHB+j;
	arc=none smtp.remote-ip=209.85.210.51
Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51AB1606A319
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 23:04:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 51AB1606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=tenstorrent.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tenstorrent.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=tenstorrent.com header.i=@tenstorrent.com header.a=rsa-sha256 header.s=google header.b=Rh9CHB+j
Received: by mail-ot1-f51.google.com with SMTP id 46e09a7af769-82109f51565so119295a34.2
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 16:04:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1792710273; x=1793315073; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jSu0BLMuA7L43aT6T2KcW7Fkv7IJTbKPBRbS3rQaZjo=;
        b=Rh9CHB+jn7oBMt5+iZ/1u1xk7/8yF6uok12/Il/siW3YL+3xdlTge0WkaW/h/zuXpF
         Yzy3BoOm7gBYOwUSCmNdNe0ojCH5KWZhS65cpU2UJpRYGPHhMGFUT6giAP3ZKUH8PdRv
         wJE54AX1ZgW0NoJ0jsJHikJsv9+RlEYVNSUQwiUVFMdyGOQm2R39O0X/Fcr22b7iy/f8
         3NXYdrP203qXaMheYCKxREFewGqwpRSS+4Z2dAhQa6PrZ3zOd4Khj0ELRZgX+2yxZC64
         dTzA/kHbUw9XOl+ZWWNrOKepk5v5sQiRx1/yGaRulHh8T1/40vS3D5trMk813S97S/5W
         RGXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792710273; x=1793315073;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jSu0BLMuA7L43aT6T2KcW7Fkv7IJTbKPBRbS3rQaZjo=;
        b=uaAaMWK0wVQyrIvT8E5ZZ6mxkJEZ9eii6cHGs86YXs+AqQ6EciErd5jP1oe4mr7iWZ
         HXXIEgzVhZIKFirWvTi6bA7g6dh8G1sAaDiU6ycnLvcJTvTjSjcVH2H9hqX6t5tm31pq
         Y54uGxVFIB6ydJkfc43K+1DI+GC13tgtxtFACAzGkQ5o3wW4xQclGhCpYrxwvudw+G97
         13zIn2yfZMUdJzBVzUc8eaU/sG5+t6aG9C9XGuZyDbvIPTD7QdLr/8jZf8yXrBtggQVo
         Lplw5iWrzoEmR9rRAnUmOAMiraqyWBUDPPNSXmw25clwERVvQPbYq2jdspg60CBGqFAz
         tQjg==
X-Forwarded-Encrypted: i=1; AKwUvBwmNO2g7F2podg+m0Q4d1/Rofu4QEzfSovXHLUsOsI5yWVhkRDoSZlYXE6BP41vpAoi/SUjQSZN1t9S7X4=@vger.kernel.org
X-Gm-Message-State: AFq9FYIplTG7EfywSr8pz4pwfI0LiD1YEAZCccbAP+hwNk28IQ2aWFEM
	k1blT8VcK6Z5gxSMHf1Cm5KXlqie+GhsgRvG5thshj48RyVhNls13UJ2BCHobgmHdb8=
X-Gm-Gg: AYBFou14g3VI6vEpr/UeROQY7f45NhqVnLJlRzgEPSO213QEY7SExO4BFRs9GAMImTe
	N1BzTzmCXGzhHzQcFCy4ez4wMb7WLvHz0lnPUx6wwxoErmsTU4k9WVcISbGl9PXYgOQ9H2K8psS
	qXDCpDrGOk20ALH9VIc4Q9hIfmeoneVDzj8g4uu0Urq+YZidDLAO++uPveoPCofsG6nY8VTpFiN
	F+9LWCDbBVD+QTQEutXVRf2o3rd8XlvlxCv3GYm9816lsSfhMK/HKWQe2N4zvlGEYwpy/je4khn
	njKDAU2kjjJMw6enV3csndUNK+JgB7rGPWjTxq4uWg509WXwJEBDEtJXaxo3cW+p2ZZ2xJ24roW
	TpGpuBpy81Fm9o+9zFvWuEM9VaqlVHxK+UsAFTnZ/t38iw+WsJ/ZjI7GjL2AcvqJzacMiflRzDB
	ZHj80zrO3/zVTtz4Nkz2JTz2Fh9h41thswOZeZQ0t1Y2o5pre8VMaksEQZEXAiroLYZfGdIRV2c
	zjRiE5Hh2apJ2vo7iqwQBKmun0Su41sCDr5qaJQ9p6kfPQuoY6LDmjfdmDX5B1y+z4=
X-Received: by 2002:a05:6830:b14:b0:814:b62d:3122 with SMTP id 46e09a7af769-84fb135c9c0mr429298a34.22.1792710273153;
        Thu, 22 Oct 2026 16:04:33 -0700 (PDT)
Received: from localhost ([68.203.12.10])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-84fbb382c62sm432420a34.1.2026.10.22.16.04.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 16:04:32 -0700 (PDT)
Date: Thu, 22 Oct 2026 18:04:31 -0500
From: Andy Chiu <tchiu@tenstorrent.com>
To: Guobin Zhang <guobin.zhang@intel.com>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] riscv: signal: protect regs->status RMW from
 concurrent preemption
Message-ID: <atqWfyAobkl6TXCN@Tao-Chiu's-Mac>
References: <20261020-vector_fpu_regs_status_rmw_fix-v2-1-474a59155e96@intel.com>
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
In-Reply-To: <20261020-vector_fpu_regs_status_rmw_fix-v2-1-474a59155e96@intel.com>

On Tue, Oct 20, 2026 at 07:24:25PM +0800, Guobin Zhang wrote:
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
> Fix by adding preempt_disable/enable in fstate_save() and
> fstate_restore(), which covers the RMW in __fstate_clean(), and
> around the RMW in fstate_off(). Add fstate_{save,restore}_preempt_off()
> for code that already runs with preemption disabled (the scheduler and
> kernel_mode_fpu).
> 
> riscv_v_vstate_set_restore() has the identical hazard: it is called
> from __restore_v_state() (sigreturn path) with preemption enabled, and
> it can race the same way against the scheduler's own call to
> riscv_v_vstate_set_restore() for the same task in __switch_to_vector().
> Wrap that call site with preempt_disable/enable as well.
> 
> Add WARN_ON_ONCE(preemptible()) to riscv_v_vstate_restore()
> to catch any future unprotected callers at development time.
> 
> Suggested-by: Andy Chiu <tchiu@tenstorrent.com>
> Signed-off-by: Guobin Zhang <guobin.zhang@intel.com>

Reviewed-by: Andy Chiu <tchiu@tenstorrent.com>

> ---
> regs->status is shared between the FPU (SR_FS) and vector (SR_VS) state
> machines, and is updated with plain read-modify-write. When such an RMW
> runs preemptible on the current task, the scheduler may update the other
> field of the same word in between (e.g. riscv_v_vstate_set_restore() in
> __switch_to_vector() on switch-in), and the stale store then clobbers
> it, leaving VS=DIRTY with TIF_RISCV_V_DEFER_RESTORE set.
> 
> v2 follows Andy's suggestion: preemption is disabled at the
> fstate_save()/fstate_restore() level, which is fine because the FPU
> register save/restore itself is reentrant-safe, and new
> fstate_{save,restore}_preempt_off() variants are used by callers that
> already run with preemption disabled (__switch_to_fpu() and
> kernel_fpu_{begin,end}()). fstate_off() and the
> riscv_v_vstate_set_restore() call in __restore_v_state() are wrapped
> directly.
> 
> local_irq_disable() is not needed: no IRQ handler touches regs->status.
> 
> Reproduced on Spacemit K1 hardware; not reproducible under QEMU/TCG.
> ---
> Changes in v2:
> - Disable preemption at the fstate_save()/fstate_restore() level and add
>   fstate_{save,restore}_preempt_off() for the scheduler and kernel_mode_fpu
>   (Andy Chiu)
> - Drop preempt_disable() from __fstate_clean()
> - Link to v1: https://patch.msgid.link/20260807-vector_fpu_regs_status_rmw_fix-v1-1-0c16848b60db@intel.com
> ---
>  arch/riscv/include/asm/switch_to.h  | 30 ++++++++++++++++++++++++------
>  arch/riscv/include/asm/vector.h     |  2 ++
>  arch/riscv/kernel/kernel_mode_fpu.c |  4 ++--
>  arch/riscv/kernel/signal.c          |  2 ++
>  4 files changed, 30 insertions(+), 8 deletions(-)
> 
> diff --git a/arch/riscv/include/asm/switch_to.h b/arch/riscv/include/asm/switch_to.h
> index 0e71eb82f920..709831688ef3 100644
> --- a/arch/riscv/include/asm/switch_to.h
> +++ b/arch/riscv/include/asm/switch_to.h
> @@ -27,11 +27,13 @@ static inline void __fstate_clean(struct pt_regs *regs)
>  static inline void fstate_off(struct task_struct *task,
>  			      struct pt_regs *regs)
>  {
> +	preempt_disable();
>  	regs->status = (regs->status & ~SR_FS) | SR_FS_OFF;
> +	preempt_enable();
>  }
>  
> -static inline void fstate_save(struct task_struct *task,
> -			       struct pt_regs *regs)
> +static inline void fstate_save_preempt_off(struct task_struct *task,
> +					   struct pt_regs *regs)
>  {
>  	if ((regs->status & SR_FS) == SR_FS_DIRTY) {
>  		__fstate_save(task);
> @@ -39,8 +41,8 @@ static inline void fstate_save(struct task_struct *task,
>  	}
>  }
>  
> -static inline void fstate_restore(struct task_struct *task,
> -				  struct pt_regs *regs)
> +static inline void fstate_restore_preempt_off(struct task_struct *task,
> +					      struct pt_regs *regs)
>  {
>  	if ((regs->status & SR_FS) != SR_FS_OFF) {
>  		__fstate_restore(task);
> @@ -48,14 +50,30 @@ static inline void fstate_restore(struct task_struct *task,
>  	}
>  }
>  
> +static inline void fstate_save(struct task_struct *task,
> +			       struct pt_regs *regs)
> +{
> +	preempt_disable();
> +	fstate_save_preempt_off(task, regs);
> +	preempt_enable();
> +}
> +
> +static inline void fstate_restore(struct task_struct *task,
> +				  struct pt_regs *regs)
> +{
> +	preempt_disable();
> +	fstate_restore_preempt_off(task, regs);
> +	preempt_enable();
> +}
> +
>  static inline void __switch_to_fpu(struct task_struct *prev,
>  				   struct task_struct *next)
>  {
>  	struct pt_regs *regs;
>  
>  	regs = task_pt_regs(prev);
> -	fstate_save(prev, regs);
> -	fstate_restore(next, task_pt_regs(next));
> +	fstate_save_preempt_off(prev, regs);
> +	fstate_restore_preempt_off(next, task_pt_regs(next));
>  }
>  
>  static __always_inline bool has_fpu(void)
> diff --git a/arch/riscv/include/asm/vector.h b/arch/riscv/include/asm/vector.h
> index 00cb9c0982b1..da1559bcee36 100644
> --- a/arch/riscv/include/asm/vector.h
> +++ b/arch/riscv/include/asm/vector.h
> @@ -315,6 +315,8 @@ static inline void riscv_v_vstate_save(struct __riscv_v_ext_state *vstate,
>  static inline void riscv_v_vstate_restore(struct __riscv_v_ext_state *vstate,
>  					  struct pt_regs *regs)
>  {
> +	WARN_ON_ONCE(preemptible());
> +
>  	if (riscv_v_vstate_query(regs)) {
>  		__riscv_v_vstate_restore(vstate, vstate->datap);
>  		__riscv_v_vstate_clean(regs);
> diff --git a/arch/riscv/kernel/kernel_mode_fpu.c b/arch/riscv/kernel/kernel_mode_fpu.c
> index 0ac8348876c4..03d847fbfcf6 100644
> --- a/arch/riscv/kernel/kernel_mode_fpu.c
> +++ b/arch/riscv/kernel/kernel_mode_fpu.c
> @@ -14,7 +14,7 @@
>  void kernel_fpu_begin(void)
>  {
>  	preempt_disable();
> -	fstate_save(current, task_pt_regs(current));
> +	fstate_save_preempt_off(current, task_pt_regs(current));
>  	csr_set(CSR_SSTATUS, SR_FS);
>  }
>  EXPORT_SYMBOL_GPL(kernel_fpu_begin);
> @@ -22,7 +22,7 @@ EXPORT_SYMBOL_GPL(kernel_fpu_begin);
>  void kernel_fpu_end(void)
>  {
>  	csr_clear(CSR_SSTATUS, SR_FS);
> -	fstate_restore(current, task_pt_regs(current));
> +	fstate_restore_preempt_off(current, task_pt_regs(current));
>  	preempt_enable();
>  }
>  EXPORT_SYMBOL_GPL(kernel_fpu_end);
> diff --git a/arch/riscv/kernel/signal.c b/arch/riscv/kernel/signal.c
> index 59784dc117e4..6f6f3315bc09 100644
> --- a/arch/riscv/kernel/signal.c
> +++ b/arch/riscv/kernel/signal.c
> @@ -123,7 +123,9 @@ static long __restore_v_state(struct pt_regs *regs, void __user *sc_vec)
>  	 * to avoid getting the vstate incorrectly clobbered by the
>  	 *  discarded vector state.
>  	 */
> +	preempt_disable();
>  	riscv_v_vstate_set_restore(current, regs);
> +	preempt_enable();

Just a quick note for Paul that my v6 vctxopt series will conflict with
the above code, can be fixed by including __riscv_v_vstate_clean() to the
preemption off region. I can also respin the unmerged patches if that
makes things easier.

>  
>  	/* Copy everything of __sc_riscv_v_state except datap. */
>  	err = __copy_from_user(&current->thread.vstate, &state->v_state,
> 
> ---
> base-commit: 075b74841bd0065a3bda3440873c747938e69b68
> change-id: 20260807-vector_fpu_regs_status_rmw_fix-b51fa4a453d8
> 
> Best regards,
> --  
> Guobin Zhang <guobin.zhang@intel.com>
> 

Thanks,
Andy
