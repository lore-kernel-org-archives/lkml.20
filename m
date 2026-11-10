Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794276704;
	b=OkAXrKMOox753HyI07dn6f6QP/2oRLWBQP5HUos40hP6Ezfb0jSlDfwVWByzBJ5I9/r1
	 a0THhVSU1hcmLW+iDQdLCf50OXXZiRAKvDJBqUIor31Wr6BYlFvRCsQdv6NZjSyj1YCEI
	 iH7QoI8iQxg7Xy4+80ztGkgFdXxJomEjJIDmMzwoPTfSWo1UHKvVgs+FydQVy3Qm4myJP
	 dFx1QUu4R0ZMSEpDBlp23XaeQnn4A4Jmpgc1y5ALfxPVE+2HPhozd21GYYLF6U4b9ZjWi
	 j673yCDzyMy4pzczpIIfHRIM+EWOL3aL0Axna+hdtTphSbk9pyfLf4uRqHkiQWBobVw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794276704;
	h=Received:DKIM-Signature:Date:From:To:cc:Subject:In-Reply-To:
	 Message-ID:References:MIME-Version:Content-Type;
	bh=7gGEU+F3OmTlWiYgAwa+KiEfjG9IR1QIEw8Ynm1GPns=;
	b=voIhpkdWUXW03WGvYIPFzls1C9FYRZsmzvT/JWERFIAhak9VLpwtNKbTMyA4nP8c44oP
	 syGh7oLVpE3VXNheZM0MC5+fVHZfyWgejx0cZECFOeomKMRrdIm7RloLXIFNYHint/8HV
	 64jwpn84YmjZuQO8OSE0AxxOGH+zNbAh5ftM8ttYJ7Ahxr3KnvieuqOIA8wME4HcMUI2n
	 CcULk7LNhHTUQYTGg4+MPPodWjEqxrG5Zjv+OLQtoA1n3qhwGtBfO6JVF1mrzbUgpIGDh
	 wBVKl4J/OPraOIlycGHAcBRKmp/V0QH9K0/+SX09zVpMW0vPYzwL3aMtmgvNmNGPnpw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PZZLU+cT;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED7F5606A335
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 02:11:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PZZLU+cT
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08B971F008BD;
	Tue, 10 Nov 2026 02:11:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794276703;
	bh=7gGEU+F3OmTlWiYgAwa+KiEfjG9IR1QIEw8Ynm1GPns=;
	h=Date:From:To:cc:Subject:In-Reply-To:References;
	b=PZZLU+cTxpjBQtlmyAy07GHEgXXaEoWOlVeUHazcItIUO8c/6eVpkHV3PEdd4Iecd
	 J0tYE+4cXQ/fOszmanmCgLX4D8DRp7x8RS00xHRsJOQe6ZsrVXTFOSLCwOLrR8bMpa
	 N1eeN9gaFhKXNyXOjsf9cIjkXNC5I/bY+JEDvup1RBYOVVcG+tLSErS7O9PLgfoxv8
	 5fXsDmJ/MBjYR5EmrmK64zuRN2VT6CSEoDqEQ29bYchRNIwpQcyw/kev03/NpOjw3Z
	 +kqsdvelenVZY+Q32vYR90ehYIiuKcu5Hl6V/CBiCW+dbYVaHarVSGTesVe5blewHQ
	 JE5ug/RLtB1iA==
Date: Mon, 9 Nov 2026 19:11:39 -0700 (MST)
From: Paul Walmsley <pjw@kernel.org>
To: Guobin Zhang <guobin.zhang@intel.com>
cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
    Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
    Andy Chiu <tchiu@tenstorrent.com>, linux-riscv@lists.infradead.org, 
    linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] riscv: signal: protect regs->status RMW from concurrent
 preemption
In-Reply-To: <20261020-vector_fpu_regs_status_rmw_fix-v2-1-474a59155e96@intel.com>
Message-ID: <b9ec7243-d30c-34bf-057e-b422f9eeb205@kernel.org>
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
Content-Type: text/plain; charset=US-ASCII

On Tue, 20 Oct 2026, Guobin Zhang wrote:

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

Thanks, queued for v7.4-rc.


- Paul
