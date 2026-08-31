Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com [209.85.128.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DB41443E44
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 14:12:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788185568; cv=none; b=kT2+PW3Twurp+9ofWSNxsTOdLxylblPSkNUz7RCGyHommRLTpPqNFnlxjyRcinaeXoFH24hMe/5SrpDgZECnnagUg/yfeplT2pfIs7CVaDK9VatKdbLpP6jpW4YQnBHE8Xs2fTjG8v/WQRgut3elQ3j5obqKKpPOyxYrqPJz07A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788185568; c=relaxed/simple;
	bh=HO3i8jPEq+t50RYFf/H+PXoGo63vAGi43wP1utjBY1M=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=OlD6DqAHn7n4so/Px39q4jO/O+F63CKONjc2C9rTJO/Wm7L0SeA+So0gAXR2OObWDx7xvNvDXaPg4fQ+OSfxgnl99VOJ0UePz+6RjzJc9gsiIbSO6FtGGGDSZkahjpcz3AXzSCf5SPLX76QpLjG9G9sZDPix3iJi7F3pjlODkmE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=We4TIath; arc=none smtp.client-ip=209.85.128.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="We4TIath"
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-490a767c7dcso25784185e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 07:12:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788185564; x=1788790364; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=enmYgpseGkhwRWk/6x6IfJWBAGPePrZp4E75kiptkns=;
        b=We4TIathP2bqje8Idye57nSVlBoHzHcIvuMWqLwOcXyhwvyyjYk7QtWV6e5XftQ0ap
         pAx+nv/OArcfuPq2LDO4FmaN/XiNtq8+3KV/FnjWxPPoOqnBoWg6gnIfvO4RzHHJ3Eob
         szcSM+D5oz3dvyHxyK3aQHV0iVGFbMyrl7ikeK7E0jOisAJlfh2ngIVkfWnIIyScjhc+
         rgVH41YlGTBbdxSPr9ZzHpwjQPlsCXktEjDpwWF1tkq3QP5HCfaAI/jV7fMaNXEA0gz9
         YKZur7e34hxPXYuQnGZI7wWut/LyGefUu75CcerqRccy5k159PT27XflG5WB9CXMSX02
         TphA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788185564; x=1788790364;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=enmYgpseGkhwRWk/6x6IfJWBAGPePrZp4E75kiptkns=;
        b=XbPURf2F+0H2IHHcrwtGMcmr/8yJ/R1rv/Kc6NivWYU8EqaEzu2QYQw7Ysyubaw5UB
         HPZRstHWAgEq9+s4THPkKr2GztKK+8VdmknAtRJIQrqbIyf5nTU4Z10xSg+et2aQ1ov5
         IF8B6OROrhLXXE5qxYJauafaJqQo6JvPJ0w38YUkNGePVwKvE3c2EdzDIGSGervWGak4
         1eM4ahYQSnpBFeB0ryRy10rQfG0qLKTouxlR295KfXISkobDx0eWS5KJDHQYzXGZdQoJ
         k+CJYhcpQ9mZ8V3mxd5qQZwya2yGSiwICUkXP08R02el+wVFqyRnXpgcv2FYhAaar5qp
         dZ4Q==
X-Forwarded-Encrypted: i=1; AHgh+Rqr1C4rc373bB4QUP1T4lr+7fpKLcN1Q2Ly2qAmwokFq2cjG/GZ5g78PViFINff8ap2/MKmN/NnaAxYOZM=@vger.kernel.org
X-Gm-Message-State: AFuF++lfYb7V23y0sQS9BrBzOUvNpQfPtHwkNOu+jmfX4KT0XHydrZL0
	eif6BoYf9ubGYyBYawAlWGrYyrN+vq9AMZx4NJgTHRFX40+/y6wkPghslIs9JLGJuehbMYBaTZw
	GJT7fijeIM2DHdYVOog==
X-Received: from wmbip22.prod.google.com ([2002:a05:600c:a696:b0:499:b6c1:bd20])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:8411:b0:499:4892:d022 with SMTP id 5b1f17b1804b1-49b91c279e1mr470552705e9.8.1788185564261;
 Mon, 31 Aug 2026 07:12:44 -0700 (PDT)
Date: Mon, 31 Aug 2026 14:12:43 +0000
In-Reply-To: <c8453a19-3487-4031-8153-22e1b1cd2b69@efficios.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260831-sys-futex-wake-time-slice-v1-1-814bb95cc339@google.com> <c8453a19-3487-4031-8153-22e1b1cd2b69@efficios.com>
Message-ID: <apWL2wFhvRM93zm1@google.com>
Subject: Re: [PATCH] rseq: defer time slice extension yield for sys_futex_wake
From: Alice Ryhl <aliceryhl@google.com>
To: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Cc: Peter Zijlstra <peterz@infradead.org>, "Paul E. McKenney" <paulmck@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Dmitry Vyukov <dvyukov@google.com>, Thomas Gleixner <tglx@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Mon, Aug 31, 2026 at 09:45:25AM -0400, Mathieu Desnoyers wrote:
> On 2026-08-31 08:57, Alice Ryhl wrote:
> > When a task is granted an rseq scheduler time slice extension, it is
> > expected to finish its critical section and relinquish the CPU via
> > rseq_slice_yield(2). If the task issues any other system call while a
> > grant is active, rseq_syscall_enter_work() forces an immediate
> > reschedule on syscall entry via cond_resched(). This may cause
> > significant latency penalty for userspace lock implementations that use
> > rseq time slice extensions when unlocking the futex.
> > 
> > In a userspace mutex unlock sequence:
> > 1. The lock is released in userspace.
> > 2. If there are waiters, the unlocking thread calls sys_futex_wake()
> >     to wake a sleeping waiter.
> > 
> > Because sys_futex_wake() is currently treated as an arbitrary syscall,
> > rseq_syscall_enter_work() schedules out the unlocking thread upon
> > syscall entry, which is before it has executed the wakeup. Consequently,
> > the lock is free in userspace, but the waiter remains blocked in the
> > kernel while the CPU switches to an unrelated task. The waiter is only
> > woken when the unlocking thread is eventually scheduled back in to
> > finish the syscall, causing lock handoff delays.
> > 
> > Thus, update rseq_syscall_enter_work() for sys_futex_wake() so that it
> > does not reschedule during syscall entry. The thread will yield the CPU
> > on the syscall exit path instead.
> > 
> > There is no need to apply this optimization to the multiplexed futex()
> > syscall since any userspace code that can invoke rseq_slice_yield() can
> > also invoke futex_wake().
> 
> Is the goal there to provide a single blessed way of doing futex wake,
> or to allow the futex multiplexer to keep being used for that wake
> scenario ?
> 
> The proposed change exposes two ABIs (multiplexer vs explicit futex
> wake) with very different behaviors. I'm concerned that it would be
> confusing to users.
> 
> Thoughts ?

My understanding is that the multiplexed futex syscall is soft
deprecated and the goal is that new code should use the dedicated
syscalls, so I didn't think it was needed to implement the perf
optimizations for the "old" API.

But I do agree it's confusing to do it that way, so I'm happy to also
support the multiplexed one if you think we should.

Note that we can't read the 'op' argument to the multiplexed futex
syscall inside rseq_syscall_enter_work(), so to implement it for that
one too, we would have to skip the cond_resched() for all calls to
sys_futex(), and then re-check inside of sys_futex() itself to call
cond_resched() there if `op != FUTEX_WAKE` and the rseq time slice
extension applies.

Though now that I think about it, maybe we want to skip the
cond_resched() for all futex ops? If you're invoking FUTEX_WAIT, then
there's not really much reason to call cond_resched() if you're calling
schedule() immediately afterwards.

Alice
