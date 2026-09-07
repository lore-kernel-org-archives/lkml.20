Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com [209.85.221.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C8844C0424
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 13:21:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788787279; cv=none; b=Oxqkgk3bf/HL91VyKOfhFmRVUemuqMzmR1mGdOMqGHPCyqpu5p+cUtQDaQY+a0+KflLqFHbn/JqVXjaWGIRQgZwMDiZIUgluu2i1GcTiyFvIO7flYJI9cGkMjsP1o946MF+1W60yGrBdKN2WA6DszR5KToYDrO4upWSgLYZRBRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788787279; c=relaxed/simple;
	bh=83XvBbKJyKRwzi5hwxmiTZIyKAph+RzH+y7aNyQjjG4=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=tte0jlp69Gw5mJ4kONF3Ad57lZgWD5bacM8ILGYWgbQlF/cM0JioKE26SRonNd6ekaW17lRFLP1HcVGflSolWkZQqDK+pP3dZ7shKIKdiwv61eIxcUBOk/ZgYk1iVU4bJ5uY4qLkUQEZOqw3cntVaoPNVBqkLxIeAV924ZKj9LM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=DaXLoPW5; arc=none smtp.client-ip=209.85.221.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="DaXLoPW5"
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-48584d903ddso1096815f8f.3
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 06:21:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788787273; x=1789392073; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Uh0S6eZu/cyygSj5aUM0MA8p8dLPdOnIzaP9eMnKI0s=;
        b=DaXLoPW5rp0h+q3fGeUfMZs3XSxaerhSowGY7atQsPstJ74rjC1tcd2Y6VuSEZSZ8r
         attONSGdjO+OUO6kPCt191UdCmM1u1xh88Ylh2orbVcwUymILYwUg7+3ou/40WeX+Ikf
         4fEbWmDqAxhb/XaVQUTBHXJxLCQN2I9wp3MXJXkyom3iI6rNE/oqGVCspuc1uBy+YEQQ
         PPqCAMeCigJ+8zxfu2vvnwxGoaG61JOiVqjiXfMXg2UHtWoi7iF9FLDvQE6CECAJqBTX
         9NtdIFRRRvj5dPm1K1IoS8bbTjPZVvLL+h4ADPTqYYhbZC03hV779t+5G9PPQq8eivfy
         NzXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788787273; x=1789392073;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Uh0S6eZu/cyygSj5aUM0MA8p8dLPdOnIzaP9eMnKI0s=;
        b=ZiaHSjL70hoFxwmRnIZvT+0GGYzxh/rBYmrFIh/nPes0/fbl4rx0ZMEGpdz5UJ5OtE
         bcQvCBANtL0kvzuayIB+VmWjZjjAdG4BBgDT9CdJkv2li+FDy2Xe1qPrWvuuznnpEna7
         hvzm2nxIZYpj/ljO4hSf8XGgtsP2qFqHygkdbGA45S2KGi0Ykm3s8B4aY3OYF7D7/jNF
         BeVX6PmmtgWjREi8+tPZlQu87r0RoBamtLmDGCiKR4fJPv5AQMNt9YSO2oacnCsrdL9o
         8QjTv7uqs3MAohDw0UfUVvPkTyu+OdUxVweGH6fJdT5kCtJpLave/Q2tIig2mLNiTGeZ
         Rjsw==
X-Forwarded-Encrypted: i=1; AKwUvBzEAxx37XKXKumzxq1G07XGls1Csl42KW94DcNJZ1+4+TcNVIns0gdntWdHp0hwcUUjQj8FOh89+CCDqsM=@vger.kernel.org
X-Gm-Message-State: AFuF++nJp2NcFSIO+zW+xuJ+ab54wVJMadY68oQPvv5ZQrb2ClsQseAG
	0S+Qie0d1MCF2Fls1DgdS9EwoVTzoK7lc8MzAvPA6NKTstPv6PS6sqQ1mx5291qpMvxmFcjFxnS
	5LL4/DhNng69OKzySuA==
X-Received: from wrxo16.prod.google.com ([2002:a05:6000:110:b0:481:5a0f:19b5])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:41d7:b0:485:8c16:5efd with SMTP id ffacd0b85a97d-4858c16611emr18132049f8f.55.1788787272868;
 Mon, 07 Sep 2026 06:21:12 -0700 (PDT)
Date: Mon, 7 Sep 2026 13:21:11 +0000
In-Reply-To: <87cxur5ux4.ffs@fw13>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260831-sys-futex-wake-time-slice-v1-1-814bb95cc339@google.com>
 <87ld9ha8wu.ffs@fw13> <aprNcgTON1V7Tr1W@shell.ilvokhin.com> <87cxur5ux4.ffs@fw13>
Message-ID: <ap66R7QTdVyMqcG9@google.com>
Subject: Re: [PATCH] rseq: defer time slice extension yield for sys_futex_wakey
From: Alice Ryhl <aliceryhl@google.com>
To: Thomas Gleixner <tglx@kernel.org>
Cc: Dmitry Ilvokhin <d@ilvokhin.com>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Peter Zijlstra <peterz@infradead.org>, "Paul E. McKenney" <paulmck@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	Dmitry Vyukov <dvyukov@google.com>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Sat, Sep 05, 2026 at 10:01:59PM +0200, Thomas Gleixner wrote:
> On Fri, Sep 04 2026 at 13:53, Dmitry Ilvokhin wrote:
> > On Fri, Sep 04, 2026 at 07:21:37AM +0200, Thomas Gleixner wrote:
> >> On Mon, Aug 31 2026 at 12:57, Alice Ryhl wrote:
> >> > Thus, update rseq_syscall_enter_work() for sys_futex_wake() so that it
> >> > does not reschedule during syscall entry. The thread will yield the CPU
> >> > on the syscall exit path instead.
> >> 
> >> That's undermining the design and takes control away from the scheduler.
> >> 
> >> It granted a short extension with well defined semantics and then you
> >> special case futex_wake() which can take arbitrary time to complete.
> >
> > Thomas, do you think the problem is worth solving, though?
> 
> Eventually :)
> 
> > Currently, it seems like the rseq time slice extension is a good fit for
> > userspace spinlocks implementation, but userspace adaptive mutexes don't
> > fit quite as well.
> 
> Correct. The main incentive for time slice extensions are user space
> spinlocks. The DB folks wanted to have a way to disable preemption from
> user space forever exactly for that problem and after twenty years of
> horrible hacks we finally have something workable.
> 
> I'm not surprised that you want to exploit that for your use case, but
> that's not a good fit.
> 
> > One can argue that adopting the rseq time slice extension for adaptive
> > mutexes can never make things worse. The extension allows the lock to be
> > released, so other threads are free to grab it. The only problem is a
> > potentially delayed waiter, but this can happen now anyway, even without
> > the time slice extension applied. That said, it doesn't mean we can't do
> > better here.
> >
> > One option that I can think of is a best-effort
> > rseq_slice_yield_wake(uaddr) that is allowed to fail with a userspace
> > falling back to futex_wake() in case of a failure.
> >
> > rseq_slice_yield_wake(uaddr) could look like this:
> >
> > - Works only for private futexes with nr=1.
> >
> > - Bails out early on a contended hb->lock.
> >
> > - Limits the hb->chain walk time by the same time slice extension, that
> >   is already set.
> 
> Once hb->lock is held preemption is disabled except for RT enabled
> kernels. And no, we are not going to add a cond_resched() into that code
> right at the point where we are trying to get rid of this ill defined
> insanity alltogether.
> 
> > This way the scheduler is still very much in control and in case of the
> > success, scheduler might pick a better task, since the waiter is now
> > available to run.
> 
> That depends on your POV. The scheduler already granted some leeway and
> now your special case wants some more which is pretty much guaranteed to
> exceed the grant.
> 
> And special casing X is a slippery slope because everyone has an
> argument why their Y and Z use cases are equally important and need an
> exemption too. You can figure out where that ends up ...
> 
> The real question is whether you have exhausted all possibilities to
> solve the underlying user space problem. Alice mumbled something vague
> about double linked lists, but that's handwaving at best.
> 
> What is the actual problem you are trying to solve?

Basically in Tokio we have a bunch of critical regions that look like
this:

	mutex_lock();
	list_add_tail(&my_list, new_item);
	mutex_unlock();

and this:

	mutex_lock();
	next_job = list_first_entry(&my_list);
	list_del(&next_job);
	mutex_unlock();

except in Rust.

People are reporting bugs to me saying that this particular list in
Tokio is causing significant contention for real-world workloads in
production. The context here is backend/web servers.

Thus, I am looking at various solutions to improving contention here.

I saw an article on LWN about this new time slice feature for rseq and
thought that I definitely do not want to get preempted during these
short critical regions, so applying rseq to them seems like an obviously
good idea.

I tried using them and realized that the interaction between rseq and
futexes is not ideal because of when cond_resched() is called. Hence
this patch.


I don't have real-world data on whether this would actually solve their
problem because, well, I'm pretty sure the servers do not have a recent
enough Linux kernel to use this feature. But just from a theoretical
perspective, to me, this seems like the "obvious" behavior you want for
a futex-based mutex if the critical region is short.

Alice
