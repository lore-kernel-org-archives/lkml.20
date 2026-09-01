Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com [209.85.221.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 757404A2E2D
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 20:27:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788294470; cv=none; b=jV+dHpyA+331FMVSLaA2NlM6k0bzQ0OVNUDicf0y7vcMOQuzaOx/3Y25g0fGubWrijXrr3p/axg0KFXyOHwZ1nSysu3IevhOvHCe4MXZY7jAl8qZF9XZRpek3bEj/U6fIaep1AJCJHLwiV0LMJiyLbXaqGl+xygZerSnG/evmsI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788294470; c=relaxed/simple;
	bh=0crSDXFUYRHn5cE86zNLgjHbaDkwEGKnyxcaBlA40KA=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=ZMevSDaNHqOlu8m9KRZTOm2oFXLKL6xAmD+cXi+AoaqJiYVR+Z/BVQ6LlFOYZGPkfYi6bUm3g/UD79Z8ZmaWOxQgwl+53+LUY5zC7JUhimRjIEM351qWBvh7K+mqfUiKd0IGPh3DdkZn1ZoGydTVFlMN/SeqPK58Zg7KJsvIvvo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=LXQcHsaS; arc=none smtp.client-ip=209.85.221.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="LXQcHsaS"
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-482e05af072so191850f8f.3
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 13:27:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788294467; x=1788899267; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SQnFh9r56AYzIEOtuB6dPXWC4TkA0XAbv/e0FUOrDC0=;
        b=LXQcHsaS0I6MHLbmAU56vp+uwno3d0t3BH2UEPhaL8aiDGwu2BGscYIqdDEFZUS8xn
         0VIPWEuEWukFvK44LBXFOSeksM/CzC1LHASvo5EEzHNbGDVkZuzZ7S2kTwEuDN6urBk0
         3263XF5uyEk0SHTwALIQkVb/H7caHSR+U8JI+jdYsWq7hoP0LijH4mjlH+Zq0gvLjrfe
         2Pxriu+0zdq+3sqg0aMMUpINTiM6XYQK/dozmsQxEGrrzYLGifHfb08dCAWtyUtOxCeL
         CeoUBlxoL/WBsSF0+nu5nTbwt7UbsOjVTpckaxOFLqpiiX15g+ui95PuVqwNQ6zUl1x9
         tF2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788294467; x=1788899267;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SQnFh9r56AYzIEOtuB6dPXWC4TkA0XAbv/e0FUOrDC0=;
        b=ckx8mlU5AXZJ6bfI8FMVqlqUjvd+rRFwkt+T/CGyZ3Sc5TJ0JSHrFelJPsTZvK+bMs
         +R02B2RmXfCWUtH8+AzhCME+PkZvwfe0EAzGaPpk97Cw3Dlb9z2eu0w/VC/onZfXoth4
         QQwcCf5uZqRyDWmehuxexfugCa4CMfPno9UtJryvVBY7k1gNaKuwldDCjwaUQzrIpIik
         iFaZJUgh1JbEzav6RBLOAEi34VIQHNBWOAQPa5UDQTs2XlCqD2Uv9BV7r/nyML9bDYiu
         RjC33zGZxc96rNqRQLnaWPwIlQucg/HMuBlrtUS8KoTY6WGrp4Kdd/O2iNICmsRbEsSQ
         ssFw==
X-Forwarded-Encrypted: i=1; AHgh+RpAPviizxNyLbJhmGL1F2wwf3JeShoqgQGNoQc2rneW4TAsw8DrmKRjS2tp33iTUbqa7j5XHN5YzbzOhyY=@vger.kernel.org
X-Gm-Message-State: AFuF++m3HAQfwKarO7Nltvi9apytsKFWMcIGJQr0dupZQ9mHs8NdGhPI
	Tk5oyMsSpHpxgfCudr1uJJ0PDV2DepB6/WeYTBujZ/eQSKRSI+thvbc1k6hl8hXCZ/JuijWCtSN
	B9UjMBbh8M/oVEarHKw==
X-Received: from wmox18.prod.google.com ([2002:a05:600c:1792:b0:49c:cb59:1edf])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:4f42:b0:49c:dada:f581 with SMTP id 5b1f17b1804b1-49ce558e89amr4285525e9.0.1788294466422;
 Tue, 01 Sep 2026 13:27:46 -0700 (PDT)
Date: Tue, 1 Sep 2026 20:27:44 +0000
In-Reply-To: <apa71yN7lYR3FKeI@shell.ilvokhin.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260831-sys-futex-wake-time-slice-v1-1-814bb95cc339@google.com> <apa71yN7lYR3FKeI@shell.ilvokhin.com>
Message-ID: <apc1QGjH0ObFx2rw@google.com>
Subject: Re: [PATCH] rseq: defer time slice extension yield for sys_futex_wake
From: Alice Ryhl <aliceryhl@google.com>
To: Dmitry Ilvokhin <d@ilvokhin.com>
Cc: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Peter Zijlstra <peterz@infradead.org>, 
	"Paul E. McKenney" <paulmck@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	Dmitry Vyukov <dvyukov@google.com>, Thomas Gleixner <tglx@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Tue, Sep 01, 2026 at 11:49:43AM +0000, Dmitry Ilvokhin wrote:
> On Mon, Aug 31, 2026 at 12:57:26PM +0000, Alice Ryhl wrote:
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
> 
> Just out of curiosity, is there any publicly available implementation of
> a mutex that combines rseq time-slice extensions and futexes?
> 
> I'm interested in learning more about how these two mechanisms interact
> with each other.

This came up while I was looking into implementing one for use in Tokio.
There, we have quite a few cases where we have a doubly linked list
protected by a mutex, and I really really want to avoid preemption while
that lock is held. Some of those locks are known problems for contention
in Tokio.

But that implementation is still WIP.

Some pseudocode:

struct rseq_futex {
    // 0 = unlocked, 1 = locked, 2 = contended
    int futex;
};

void mutex_lock(struct rseq_futex *mutex) {
    for (;;) {
        __rseq_abi.slice_ctrl.request = 1;
        int expected = 0;
        // Change state from 0 -> 1 to lock.
        if (compare_exchange(&mutex->futex, &expected, 1))
            return;

        // lock is taken, use slow-path
        bool was_granted = __rseq_abi.slice_ctrl.granted;
        __rseq_abi.slice_ctrl.request = 0;

        // If the state is not already 2, then change it so that
        // mutex_unlock() knows to wake us up.
        if (expected == 2 || compare_exchange(&mutex->futex, &expected, 2)) {
            // State is 2, we can sleep until that changes.
            futex_wait(&mutex->futex, 2);
        } else if (was_granted) {
            rseq_slice_yield();
        }
    }
}

void mutex_unlock(struct rseq_futex *mutex) {
    // Unlock the mutex and return whether it was contended.
    int prev = atomic_swap(&mutex->futex, 0);

    // End the time slice extension for the critical region
    bool was_granted = __rseq_abi.slice_ctrl.granted;
    __rseq_abi.slice_ctrl.request = 0;

    if (prev == 2) {
        futex_wake(&mutex->futex);
    } else if (was_granted) {
        rseq_slice_yield();
    }
}

Though now that I think more about it, perhaps unlock should look like
this, to avoid a preemption point just immediately before futex_wake().

void mutex_unlock(struct rseq_futex *mutex) {
    // Unlock the mutex and return whether it was contended.
    int prev = atomic_exchange(&mutex->futex, 0);

    // Wake up contended waiters
    if (prev == 2)
        futex_wake(&mutex->futex);

    // End the time slice extension for the critical region
    bool was_granted = __rseq_abi.slice_ctrl.granted;
    __rseq_abi.slice_ctrl.request = 0;

    if (was_granted)
        rseq_slice_yield();
}
