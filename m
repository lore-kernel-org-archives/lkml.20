Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61F97414A29;
	Fri,  4 Sep 2026 05:21:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788499302; cv=none; b=saoDkFCKAehyQ/GDcYdsErygFNPA+kKMyArbd/fPq64Ly/WVXQCbYQ1fhJzCbJ8IcwI3Egj3qDSR6NtSAcAA2aAIjFPQEHxVJEVwaJd/RWH2GdMGngZcBUd2hr9hx1QeRTRcNzgjXjQI8kyF815otaWf/rZ4ULVnoZvdI/QbwwM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788499302; c=relaxed/simple;
	bh=ZFV6biptTu9I2FSFcZJhWxwCkhTh5GSnz2gwaVroPKg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=bRKlUw7uHOXf/EJojdbd/NIxUnaHOkZt4Fs4KLFHkNFxzJlQ20CcAvS7dL8RaHzicuAZmJCqkceQT5X/+4CrN4lVUVZWo5MyVKe8OEWg4Zd2r/GwQxgbJ5Fc/efR1mTAqLidIlb2GZ5ZmD4w/pGQqOmEds8H4EJo9AIgubEKkcU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WwIUCswD; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WwIUCswD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 701711F00A3E;
	Fri,  4 Sep 2026 05:21:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788499301;
	bh=mo4U1DEUliDCIZKEMteRu8zD3B4RsgeP/pNJQSoESjg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=WwIUCswD+v0fmLtjTVCCQ9sgjkNGjj+ydrTQjd4rs/2Aa+U6fR3+8uCDQpaaIpnKG
	 CYIzARjt7jJDdh+YH4DiTBf8cPyO0g/iBwgN/GCpepDtuWr0BR503zk+w9zQ9VUHFz
	 5g5Vv5DyZfbYcGHFyUUgYFryyCOk3KLvrZbVG4WqzXl5jrdxxuAm1Z7GTrDdbiK+73
	 KqnDF+jSwEQgYHFFIassP7OuvGPpBwb2G8lhg9J6nEGfbQyOi3wTLAFOLbdiSwlT+U
	 Ai2J4vxVIAGm11ta/t8gdyNOdV7JnFDNelzcMUwCy1CRf0irOL1By2W8l8pY3qTNXj
	 ZjxFSWjYvBOZA==
From: Thomas Gleixner <tglx@kernel.org>
To: Alice Ryhl <aliceryhl@google.com>, Mathieu Desnoyers
 <mathieu.desnoyers@efficios.com>, Peter Zijlstra <peterz@infradead.org>,
 "Paul E. McKenney" <paulmck@kernel.org>, Boqun Feng <boqun@kernel.org>,
 Dmitry Vyukov <dvyukov@google.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan
 <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, Alice Ryhl
 <aliceryhl@google.com>
Subject: Re: [PATCH] rseq: defer time slice extension yield for sys_futex_wake
In-Reply-To: <20260831-sys-futex-wake-time-slice-v1-1-814bb95cc339@google.com>
References: <20260831-sys-futex-wake-time-slice-v1-1-814bb95cc339@google.com>
Date: Fri, 04 Sep 2026 07:21:37 +0200
Message-ID: <87ld9ha8wu.ffs@fw13>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Mon, Aug 31 2026 at 12:57, Alice Ryhl wrote:
> When a task is granted an rseq scheduler time slice extension, it is
> expected to finish its critical section and relinquish the CPU via
> rseq_slice_yield(2). If the task issues any other system call while a
> grant is active, rseq_syscall_enter_work() forces an immediate
> reschedule on syscall entry via cond_resched(). This may cause
> significant latency penalty for userspace lock implementations that use
> rseq time slice extensions when unlocking the futex.
>
> In a userspace mutex unlock sequence:
> 1. The lock is released in userspace.
> 2. If there are waiters, the unlocking thread calls sys_futex_wake()
>    to wake a sleeping waiter.
>
> Because sys_futex_wake() is currently treated as an arbitrary syscall,
> rseq_syscall_enter_work() schedules out the unlocking thread upon
> syscall entry, which is before it has executed the wakeup. Consequently,
> the lock is free in userspace, but the waiter remains blocked in the
> kernel while the CPU switches to an unrelated task. The waiter is only
> woken when the unlocking thread is eventually scheduled back in to
> finish the syscall, causing lock handoff delays.
>
> Thus, update rseq_syscall_enter_work() for sys_futex_wake() so that it
> does not reschedule during syscall entry. The thread will yield the CPU
> on the syscall exit path instead.

That's undermining the design and takes control away from the scheduler.

It granted a short extension with well defined semantics and then you
special case futex_wake() which can take arbitrary time to complete.

Thanks,

        tglx
