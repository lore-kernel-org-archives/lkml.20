Received: from mail-yx1-f51.google.com (mail-yx1-f51.google.com [74.125.224.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6C134CF483
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 07:26:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792221984; cv=none; b=lK9LJW55PfhvxPNkUscO+iAsH/d7ES724yjN7cigTWOTWH8Clyx3J/Q1RuYlwcR6fPlqA/azxAOP3LMwGfBq/OM9zD4TN9ZFUN2oVD6wiv6KA7M2ZcX9GBbrogoLeVeaxnOXCEjaDmqa4sMwwRjuWahZRol8YmHxN6yx1VTpKgs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792221984; c=relaxed/simple;
	bh=6EAQUoVArRnvo57j6g+Kk+eM0X/PssrXgbb+9RSu8cY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H1fbkKgpo6jIHuoo3v28Q23Dj7dWU3lggceY7cpZWQ6Mt9dYKWFJHIsfDta0BuuAVpyKpquTIXgt2GRUBYbKUe18YmFoYPIBTR+28eGe5CKotZFLCnM6Xp5RHw5Shdq3/a0/QPgrwwinQqik1w4+YY3qOnOOX2WAK1DzzO5qkBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=tenstorrent.com; spf=pass smtp.mailfrom=tenstorrent.com; dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.b=GhpgINxm; arc=none smtp.client-ip=74.125.224.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=tenstorrent.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tenstorrent.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.b="GhpgINxm"
Received: by mail-yx1-f51.google.com with SMTP id 956f58d0204a3-66c9995ca60so1624526d50.1
        for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 00:26:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1792221982; x=1792826782; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PcBQe8FM4jqkZp3iRfJbe9kW+y/urIO/htZpqOKaQ0Y=;
        b=GhpgINxmJqjs4hiVCXtN2qk7z/0OI7T8hEY3ted0uBN6lN2gUcC5O+Hos2Ewf+Mzgx
         BO5KkxL8fftTpsmmco3xQw4SmpgkiPaMUUw1FZnu2mfJfziJGwvi3RQC+HbzHtzVKxRK
         kMdVnVzCVlhBoe33N7R/KNp1+n/gQRnWXoAdZNAjIHzcVtub4Ui5KlA8nnzMI6jwB2uc
         u4b3yeGGu79AtCwfcfrC7DqxBeVMgjoPu1ct2AATwYeDWZ52QKpDp5OOs32A3Iwvupxn
         j+H7thWJzYVFgZln9aLQve0ETValmv/ALvO1jeOSGblWQ4TR+D2yTIQmk5H3BRl+NSfw
         gKMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792221982; x=1792826782;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PcBQe8FM4jqkZp3iRfJbe9kW+y/urIO/htZpqOKaQ0Y=;
        b=i6GMDdBxufmxtfkJfl03PdFGnyOShmFcSVBZ1RIBh2mprswdTiORbE674DZyRubxNV
         Ac4/dlHCXkVPYdtZXJt4Q43N0kP1prZd1d5BdZyID2B7w5zTkM3olghSJEK+QXBQOrdc
         MOpNkzOY7hxBQJlvuh6ZYZpTb65TYirj2S/iZ8EzRItaxwOC+9EvKa7Euxn3+CV0PgVr
         7SR7MKEcrYtMKWwJJt/dn1HcR2JFuB89Pd3WRTg2QTzl03Qde1AP7PqZidzHWqPsXL2W
         PPGwYgksV8PX6tw28Vt7ExzazivcLzM5qnx3r/+N8K23LwcKepgWvc/yEP5L/GKSkJud
         kNlw==
X-Forwarded-Encrypted: i=1; AKwUvBywdv01besRPmfeFHXkx7aoeJSwR0QUC7esKSDrB9ObRUI/8zRz42bAKMkMiPusQKBKaH4AoDTr6Eio+cA=@vger.kernel.org
X-Gm-Message-State: AFq9FYKqruGNejCSRWZFVflYycoCFMbCYHslbuqdVRLhtJ7BNZnzdMK0
	F50f0/8qoIFnQvsT0WRrQUVJC3lXeynjqutQK7ZxTzdRCVLn6TWXexpIaTOYAzwvh5o=
X-Gm-Gg: AYBFou1pP4HO3L1g1/hQbhxyIJCsImUhG9Hus2cymPfGdO0RG63xKYBSD0TqhAJ8301
	MKvKMQBFauOyODKS4PhLSzx/c8q6awwnRucGnyV1xczYipK+HxlOPWGiAaTYWyj4oeIqZcAcPea
	MqfcVNESIQxcvl9X9Gexa1K7Yxsi4IXajd7QhGxc43m7ov4bWJpQUoY/HteZPh/kSFZ6GA9slEZ
	P97PhGPwpdC1KvEJjfLr5i0ZtXcLrXqNCaAb/rXf8a90gYpUOjvDrARgAlcB1GCFEzez5XzmZgX
	vyUSXwM2vneIRsPBfLVej+0R5ABYcttFbz1Z9/P0NedkdZAtj8Uv56Q0tm+/QSo5kfO6EtFVHQo
	okQ9ORfEBT3RHNcqfKsGa1331UruqXoS4DHBqtswih7f03bqOoFg7Qh2Dx+qSChEO5m+OWg7K/e
	0ai0IEX22R1nRQR1LdMOj1vnWEBpzuDhGfAV7UCRcTgGEpJsqiCijRC0GspRTpBXOVGyjAx/xzr
	pHMJklfS8uOCHYeoemWQUDsf70IsUg=
X-Received: by 2002:a05:690c:c017:b0:8ac:927:f7e5 with SMTP id 00721157ae682-8b0f20f4704mr6362897b3.10.1792221981874;
        Sat, 17 Oct 2026 00:26:21 -0700 (PDT)
Received: from localhost ([2600:1700:220:5c80:6dfb:85d9:d6b:fdcb])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b0e591c51bsm18053947b3.34.2026.10.17.00.26.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 00:26:21 -0700 (PDT)
Date: Sat, 17 Oct 2026 02:26:20 -0500
From: Andy Chiu <tchiu@tenstorrent.com>
To: Guobin Zhang <guobin.zhang@intel.com>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: signal: protect regs->status RMW from concurrent
 preemption
Message-ID: <atMjHBJI9LoEve8-@Tao-Chiu's-Mac>
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

Hi Guobin,

On Fri, Aug 07, 2026 at 11:00:50AM +0800, Guobin Zhang wrote:
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

Thanks for finding this. Indeed, pt_regs->status updates are not safe in
preemptible context, since it is not atomic and can race with the
nesting context. This can result in vtype corruption since marking the
VS as DIRTY again will write the vtype used by the context saving code
into process's vstate when setting up the signal frame.

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
> 
> diff --git a/arch/riscv/include/asm/switch_to.h b/arch/riscv/include/asm/switch_to.h
> index 0e71eb82f920..fd0ceebd1c23 100644
> --- a/arch/riscv/include/asm/switch_to.h
> +++ b/arch/riscv/include/asm/switch_to.h
> @@ -21,13 +21,17 @@ extern void __fstate_restore(struct task_struct *restore_from);
>  
>  static inline void __fstate_clean(struct pt_regs *regs)
>  {
> +	preempt_disable();
>  	regs->status = (regs->status & ~SR_FS) | SR_FS_CLEAN;
> +	preempt_enable();
>  }
>  
>  static inline void fstate_off(struct task_struct *task,
>  			      struct pt_regs *regs)
>  {
> +	preempt_disable();
>  	regs->status = (regs->status & ~SR_FS) | SR_FS_OFF;
> +	preempt_enable();
>  }

Ideally, we should guard the preemption at fstate_save and
fstate_restore level. This works because saving and restoring floating
registers are reentrant safe (not for the vector as we will get the
corrupted vtype).

Instead, I would prefer enclosing premption off region there, and have
fstate_{save,restore}_preempt_off() for code that is clearly run with
preemption off (the scheduler code and kernel_mode_fpu).

Something like:

+static inline void fstate_save_preempt_off(struct task_struct *task,
                               struct pt_regs *regs)
 {
        if ((regs->status & SR_FS) == SR_FS_DIRTY) {
@@ -44,7 +40,7 @@ static inline void fstate_save(struct task_struct *task,
        }
 }

-static inline void fstate_restore(struct task_struct *task,
+static inline void fstate_restore_preempt_off(struct task_struct *task,
                                  struct pt_regs *regs)
 {
        if ((regs->status & SR_FS) != SR_FS_OFF) {
@@ -53,14 +49,30 @@ static inline void fstate_restore(struct task_struct *task,
        }
 }

+static inline void fstate_save(struct task_struct *task,
+                              struct pt_regs *regs)
+{
+       preempt_disable();
+       fstate_save_preempt_off(task, regs);
+       preempt_enable();
+}
+
+static inline void fstate_restore(struct task_struct *task,
+                                 struct pt_regs *regs)
+{
+       preempt_disable();
+       fstate_restore_preempt_off(task, regs);
+       preempt_enable();
+}
+
 static inline void __switch_to_fpu(struct task_struct *prev,
                                   struct task_struct *next)
 {
        struct pt_regs *regs;

        regs = task_pt_regs(prev);
-       fstate_save(prev, regs);
-       fstate_restore(next, task_pt_regs(next));
+       fstate_save_preempt_off(prev, regs);
+       fstate_restore_preempt_off(next, task_pt_regs(next));
 }

 static __always_inline bool has_fpu(void)

 Thanks again for finding this and please let me know if you would like
 to send a revision for this.

 Cheers,
 Andy
