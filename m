Received: from mail-yx1-f45.google.com (mail-yx1-f45.google.com [74.125.224.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 179B04302FC
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 07:38:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792222691; cv=none; b=eq2NT+iVBLq2IrHpjs08lmF+29Y5yG1gFJtaiFVD8oGz/0XVNpsrNAeP3kkKHzbqSVwcO0J/d5ldxOoZxzJ1kbzwNfO1Yo7uxzKYEY8zIfy/2OBAzSsy+bAkGV/u+BmCv4liGnlMrAR8+CFZNtRVAh9EXorHJoNmST5f+PLMNJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792222691; c=relaxed/simple;
	bh=/op0kmXBWzdaRah0aK++jB8N9G4K7ft/F/sr7Fty/dM=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZolDwm8IwKVF0ecs2G/9QP0ErkuttxKBUDmjvxr/UVR+vdoeFQs/ba/iZeacEY/Vpk0gjLPMNq9SMm9QK4qwqkg0fJ0QmG0InXsSu8ae7XpH1aiIfNeOTfz2YBwOevu31JKAuzZW/AtAVxvr97G95vEB2gFhcfPitDS9wN9NacY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=tenstorrent.com; spf=pass smtp.mailfrom=tenstorrent.com; dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.b=WnqIq/XW; arc=none smtp.client-ip=74.125.224.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=tenstorrent.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tenstorrent.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.b="WnqIq/XW"
Received: by mail-yx1-f45.google.com with SMTP id 956f58d0204a3-67921b515a7so819503d50.2
        for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 00:38:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1792222689; x=1792827489; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:to:from:date:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oCasw6zfd8tSyzVlQk06yRX68bH/qhEnUNxA1ny8p2U=;
        b=WnqIq/XWIGZ9khc/em2M8Fk3ghFt2lNxfYPhL0qt0zR7Vt7fVRpJNNsjjnsGlpewp+
         GLOZHzCoN6YpSnpZ7tw0lrP7QPH/XgVKX/R6ME83UhaXMPwrx3LfbdI0IO4eo9higpQP
         wEV73ZXN7xrwRlgjxiT+XUE26Y48uYXn6bOj5OUIeijE1IiK2CdExcQ6XJaykGIW8A74
         0QW+hfMDkUWm3HQQUP1447/aWc40D9Egfs0RfMvC+kIaerLaQHJd2sdWPpLw2NxKovqE
         Y9gVri8xLTBeVFlVDHpo6RpMWrhHWzPs08ibErQq+wbIRA1c5+D+iSKJNcXp5klSLBTy
         JJeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792222689; x=1792827489;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oCasw6zfd8tSyzVlQk06yRX68bH/qhEnUNxA1ny8p2U=;
        b=t31CAOYtXcj8MaMd2Hs1GGGSWGr643Q9hNHLAH6ytEII+r/uv8wL0iGqcFOuxbXOwe
         1QNi1Np0fxflUniYqCYv6UklMPdQychcwonBL27EJfRUsuBm5TMacwf421+CHYNTtNvz
         jab5yBijFeYNKy8cF06iPeHHPvCmNWM52Yw+V8Ols6JAxLUBBObl95NUgXcHxTcLpJrG
         G2taJWUYp2KzFoZ5S7VXB8SkJCFtPGqxBDtUH/DqD4046sLFLwzLBerq+pkMZH9i59yS
         iYBUdIzCmS1e1PlffBosaMwAtQJlFJMivOpds+PrjzsHmaPgDtT+ldPcLmnkReVWOqGY
         6Dag==
X-Forwarded-Encrypted: i=1; AKwUvByNZ+aMMS12hb94/nnMgF/y/Vox3bF6OCM97nNx5NWUEvNCFMUqiCX4v1Py/nA1RnQiskBXrD4Q4vE7vYo=@vger.kernel.org
X-Gm-Message-State: AFq9FYL7Z8Sv4n33YnMTd/CIEBY5cu7m3xFkJQiM/KT89R/pk6PkTCru
	eZo73zer5fdgDuWETErSXMUwXAckTHVbFGGQfqzWSFGORIDnnTmsKzFMXn+AYE02r9M=
X-Gm-Gg: AYBFou2KS2DeHBRUMJZ2l3cfCj36WdMYQ+JZPoOkWE4j4CjUcYJmKJLQl7AYEWZNATi
	PpdQQtFcIOzh4engMBaftinauG+QDRcxDkuZLpBrHtphZY1zUd5rSOdYvb0RqzHyAXJlw3g8GVe
	H/vX5cZjG0sYNoC0UmuL2LbjB+SS9K6Arq1EUHFYOErXM90E8ewhr0+jtM8V2G38UnHCtqywH/4
	Ad+05h4oNGxvdGtLLXrKcU5K40jEeJzMGEGxzm+o/4jQFOCc5+5WxFdXJpYrD2aLUHlUVHdAOYK
	LpCl6vlGzQdQciFwAQv8aKyrCKH40WgRGXtbUBQ/rBVf1B06znzfvH04pIveO5JKE4IeK6aGc22
	j9fONSmNhvsAMJ5Z6lNlN4uJj0peJeFLSsQbGnfdOYqvptuH3sGq/tWQau+yVzCkbwpApkPEFlo
	i2lEav2aAChVlaBbzfi7pqbOEkF+UhjvXjVugOkBcXr3n1Wk3AAD8xXkpTks8PG4sN/2y6c9vH7
	EjT8sQuHrAo3IXXN549
X-Received: by 2002:a05:690c:6507:b0:8b0:cd30:ce8f with SMTP id 00721157ae682-8b0f21b9faemr8264127b3.49.1792222688984;
        Sat, 17 Oct 2026 00:38:08 -0700 (PDT)
Received: from localhost ([2600:1700:220:5c80:6dfb:85d9:d6b:fdcb])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b0e5889c2esm18352487b3.15.2026.10.17.00.38.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 00:38:08 -0700 (PDT)
Date: Sat, 17 Oct 2026 02:38:07 -0500
From: Andy Chiu <tchiu@tenstorrent.com>
To: Guobin Zhang <guobin.zhang@intel.com>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re:  riscv: signal: protect regs->status RMW from concurrent
 preemption
Message-ID: <atMl3yQ0seD_N0g4@Tao-Chiu's-Mac>
References: <20260807-vector_fpu_regs_status_rmw_fix-v1-1-0c16848b60db@intel.com>
 <arX5rpNRRk8r2Nve@aurel32.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <arX5rpNRRk8r2Nve@aurel32.net>

Hi Aurelien,

On Fri, Sep 25, 2026 at 06:33:50AM +0200, Aurelien Jarno wrote:
> Hi Guobin,
> 
> On 2026-08-07 11:00, Guobin Zhang wrote:
> > __fstate_clean() performs a non-atomic read-modify-write (RMW) on
> > task_pt_regs(current)->status to clear the FS bits. This RMW is
> > unprotected - it runs with preemption enabled and IRQs on during
> > signal delivery (setup_rt_frame -> fstate_save) and sigreturn
> > (restore_fp_state -> fstate_restore).
> > 
> > If a reschedule IPI or timer interrupt triggers preemption between
> > the load and store of this RMW, __switch_to_vector() calls
> > riscv_v_vstate_set_restore() which modifies the VS bits of the
> > same regs->status. When the preempted task resumes, it stores back
> > the stale value captured before preemption, overwriting the VS
> > update and restoring VS=DIRTY while TIF_RISCV_V_DEFER_RESTORE
> > remains set - a combination that should never occur and leads to
> > vector state corruption.
> > 
> > The race window:
> > 
> >   __fstate_clean (signal path)      set_restore (schedule path)
> >   -----------------------------     -----------------------------
> >   ld  a0, regs->status  // VS=DIRTY, FS=DIRTY
> >                                      <- preempted (reschedule IPI)
> >                                      regs->status VS = INITIAL
> >                                      set TIF_RISCV_V_DEFER_RESTORE
> >                                      <- resumed
> >   andi a0, ~FS
> >   ori  a0, FS_CLEAN     // stale a0 still has VS=DIRTY
> >   sd   a0, regs->status // overwrites VS=INITIAL with VS=DIRTY
> >   -> result: VS=DIRTY + DEFER -> ANOMALY
> > 
> > Fix by adding preempt_disable/enable around the RMW in
> > __fstate_clean() and fstate_off(). riscv_v_vstate_set_restore()
> > has the identical hazard: it is called from __restore_v_state()
> > (sigreturn path) with preemption enabled, and it can race the same
> > way against the scheduler's own call to riscv_v_vstate_set_restore()
> > for the same task in __switch_to_vector(). Wrap that call site with
> > preempt_disable/enable as well.
> > 
> > Add WARN_ON_ONCE(preemptible()) to riscv_v_vstate_restore()
> > to catch any future unprotected callers at development time.
> > 
> > Signed-off-by: Guobin Zhang <guobin.zhang@intel.com>
> > ---
> > Race: regs->status is shared between the FPU (SR_FS) and vector
> > (SR_VS) state machines. Three call sites do a non-atomic RMW on it
> > while preemptible: __fstate_clean()/fstate_off() in switch_to.h, and
> > riscv_v_vstate_set_restore() as called from signal.c's
> > __restore_v_state() (sigreturn path).
> > 
> > Cause: if the task is preempted between the load and the store, the
> > scheduler's own switch_to() writes the other half of the same
> > register word when switching this task back in. The task then
> > resumes and stores its stale value, clobbering that write.
> > 
> > Fix: wrap each RMW with preempt_disable()/preempt_enable(). This is
> > sufficient because the conflicting writer only runs via an actual
> > context switch of this task, which preempt_disable() prevents.
> > local_irq_disable() is not needed: no IRQ handler touches
> > regs->status, so masking IRQs would add latency without closing any
> > extra race.
> > 
> > Reproduced on Spacemit K1 hardware; not reproducible under QEMU/TCG
> > (see commit message for the full race-window trace).
> > ---
> >  arch/riscv/include/asm/switch_to.h | 4 ++++
> >  arch/riscv/include/asm/vector.h    | 2 ++
> >  arch/riscv/kernel/signal.c         | 2 ++
> >  3 files changed, 8 insertions(+)
> 
> Han Gao pointed me to this patch as a possible fix to the issue I 
> encountered on the SpacemiT K1 [1]. So far, my first tests show
> that it either fixes the issue or at the bare minimum hides it.
> 
> As you also mention that you reproduced the issue on the Spacemit K1 
> hardware, can you please tell me if the bug appeared with similar 
> symptoms?
> 

I have a reproducer on this bug and can reliablely catch it on K3. The
code runs in a loop that does the following things:

1. dirtify FS by executing a fp instruction
2. configure vstate as e8 m1
3. load bytes into v5
4. trigger a signal handler by executing ebreak
5. vector save using the loaded v5

The signal handler verifies if it comes from the ebreak, otherwise it is
the vstate corruption. Run multiple threads per core to increase the
context switch rate.

This should hit the problem pretty soon, as corrupting lmul to m8 would
cause the vector save from v5 trap immediately. With the fix the problem
no longer occurs.

Cheers,
Andy
