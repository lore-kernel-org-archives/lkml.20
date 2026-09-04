Received: from mail.ilvokhin.com (mail.ilvokhin.com [178.62.254.231])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B27B84A43ED;
	Fri,  4 Sep 2026 13:54:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.62.254.231
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788530047; cv=none; b=ZW35IfshG1byJqjCEZ13GhSJN/y2qYweEHrYEeIvNYc5dtk1x9kVzs6Zk+8q/oxRdYdux2wmjWG09XEIB7dThpyJdcG252yQtBhiumi2etTjiyQDDrXmocngo8mrFhztzuGBN/dE7Z9bHWC5AzlD4c0HOV5vmCa8u80xZDVmwbE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788530047; c=relaxed/simple;
	bh=pb+OXN3sLCJZKmTGzbOzb2452rtXMBox4AVSFnjxnow=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TKNdOncIdo7veXXeVYe5fVcvVBmEabEPSFSgUL4LRF272TEpxmwKDtfeNb4IjaDfnt6o2MYEqjJIytgoGjqhAbXnfrVHp/J31se6MYbVR+XpC6DDZQJvRWqcCxAD7eTSoTbNbyL+4EroAMLueKg5rWRmr04+aogM/HjkMVpd1NA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ilvokhin.com; spf=pass smtp.mailfrom=ilvokhin.com; dkim=pass (1024-bit key) header.d=ilvokhin.com header.i=@ilvokhin.com header.b=c/oKJkj+; arc=none smtp.client-ip=178.62.254.231
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ilvokhin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ilvokhin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ilvokhin.com header.i=@ilvokhin.com header.b="c/oKJkj+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ilvokhin.com;
	s=mail; t=1788530038;
	bh=ixQsouVZrNZkrSZGHCDIEy+wyYGPNQccFvbLtCeQ0DA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=c/oKJkj+NzCvOGY/cQFhM+Bh7TTwoaha6T+E7A7Ap1vQo86BA9at+O/+LK7MbcQaS
	 Cfw+zOD5AwXaqrKdwei0SLWfbJtqNQrkYJ+W3/yxE+ZiVukl+tzpnPRGSktruZCVG3
	 8xHJTRlFjmDOgTpmO9Ehuf7ikI8rwlOS6A7pSbC0=
Received: from shell.ilvokhin.com (shell.ilvokhin.com [138.68.190.75])
	(Authenticated sender: d@ilvokhin.com)
	by mail.ilvokhin.com (Postfix) with ESMTPSA id 372FBEBB6B;
	Fri, 04 Sep 2026 13:53:58 +0000 (UTC)
Date: Fri, 4 Sep 2026 13:53:54 +0000
From: Dmitry Ilvokhin <d@ilvokhin.com>
To: Thomas Gleixner <tglx@kernel.org>
Cc: Alice Ryhl <aliceryhl@google.com>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Peter Zijlstra <peterz@infradead.org>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Boqun Feng <boqun@kernel.org>, Dmitry Vyukov <dvyukov@google.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] rseq: defer time slice extension yield for
 sys_futex_wakey
Message-ID: <aprNcgTON1V7Tr1W@shell.ilvokhin.com>
References: <20260831-sys-futex-wake-time-slice-v1-1-814bb95cc339@google.com>
 <87ld9ha8wu.ffs@fw13>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87ld9ha8wu.ffs@fw13>

On Fri, Sep 04, 2026 at 07:21:37AM +0200, Thomas Gleixner wrote:
> On Mon, Aug 31 2026 at 12:57, Alice Ryhl wrote:
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
> >    to wake a sleeping waiter.
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
> 
> That's undermining the design and takes control away from the scheduler.
> 
> It granted a short extension with well defined semantics and then you
> special case futex_wake() which can take arbitrary time to complete.

Thomas, do you think the problem is worth solving, though?

Currently, it seems like the rseq time slice extension is a good fit for
userspace spinlocks implementation, but userspace adaptive mutexes don't
fit quite as well.

One can argue that adopting the rseq time slice extension for adaptive
mutexes can never make things worse. The extension allows the lock to be
released, so other threads are free to grab it. The only problem is a
potentially delayed waiter, but this can happen now anyway, even without
the time slice extension applied. That said, it doesn't mean we can't do
better here.

One option that I can think of is a best-effort
rseq_slice_yield_wake(uaddr) that is allowed to fail with a userspace
falling back to futex_wake() in case of a failure.

rseq_slice_yield_wake(uaddr) could look like this:

- Works only for private futexes with nr=1.

- Bails out early on a contended hb->lock.

- Limits the hb->chain walk time by the same time slice extension, that
  is already set.

This way the scheduler is still very much in control and in case of the
success, scheduler might pick a better task, since the waiter is now
available to run.
