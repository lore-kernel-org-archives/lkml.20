Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9EEE4DE706
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 18:12:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790014339; cv=pass; b=l6ViBxNoDewIqjicMFjCN8Z67Myny1YMwdkRhbnaunurH7CeDeo4DiIqqwiunJUxxoOqO3JNWYjHZo7Bmjcpv6XVm23xxfsWPwHBYwQD5cP1EHk5sfsk3zycw6su7pppkgxfLUPIRPgkdpOXVJSJ8TIhxAvUTRcLmVXDLrD647k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790014339; c=relaxed/simple;
	bh=qnof8+uq6LRxm7UGriO/ZQY2bxnIl7e8CqbX4H1CCVY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=b5m24V6nj20PvU79LP8acilzpQ4tTz5HdyWtjPjhWgXEbSKRsoXxWTBiKWa+fVC39jhhbzq5WHX3sSo4OTkcl7ftByYcJDz7+6R6+l20Ltyt3h5q88U4InCuguHFvVFButJRfTyZA4L1WNSVgvRb7a9BfMboUhz3Wto67fZu+RU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dXL5Gv02; arc=pass smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dXL5Gv02"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6a9ac6aa620so195538a12.1
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 11:12:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790014336; cv=none;
        d=google.com; s=arc-20260327;
        b=qeNJeODusgjFdElgJPm5XgKMnQFNVed4kCDf3xthKOq5aPH+tJX31EBtQ9tHVpj8v1
         nsCb4avQxsIeThJNT3WYXnyvSOmAWye9wtElRfbjhlaeRSYjwIh5eVi7B4n/9UzK7+U3
         vhdWDFnb8kgpCi2YFHYE+LmeA7gFBr3aXbcox6CuKNTY0SauT1f4cT1wFidVBlkTYyE8
         8/RNzvvYL9ibQdnQXML4Ra8j41UUxY8Q3Ruulc2676yitHA0NL53mbcFd1H5BpfSPnfZ
         7HPMxOwmYXzmM1W4hN25pa33h6PAHFGO26+R6CWd2xuNwGHLhaCFb5yjr3+8h1x0kbL1
         Qp3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=qSirT6xM5ISWcGI7UcP1SxvvoMPpZ6FlZkkpBPJf8xk=;
        fh=4yOzG25RY2rX1AEcoqiMXvN4u45urE+xjs/3qQWX32Y=;
        b=fCHIxRLefpUIGZXmtiMlUZT2TS76Pxjv7EN5LNJoO6QNC38seHRSMCffEAOjvYZ1lK
         OymYiAjxKm/c3zsn9ldH/2bwwQm5aV7cdO9CXgIUl+wnuVBEK33/wc1A/1avaUPq/iPx
         I7EpeW8hLsVu7rtMIgPLLPlfGjEC22beIWXeb9njrAlrV86EHsBOMca7VPmStKhSJTWK
         eNzr0nTii3RTtTtwoJiUDzDLVZO/7xY4aL59H6uHBs8HdCqUk4Vv2XMgSUVqMkaeCoCg
         fs3020ckHju9dF4gnEUHvwdOW+zSxJ2oYEOtEck1HBRZt1zqliTEopehzvefFUv5ZaXs
         4BUw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790014336; x=1790619136; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qSirT6xM5ISWcGI7UcP1SxvvoMPpZ6FlZkkpBPJf8xk=;
        b=dXL5Gv02mk5LHbm3Hu8FAcSPCu/E8PrN0XLcw05ebbiMb0OVm3rot7YtGD/IgUXNR/
         TZfqkYqx9r8Obg1GiaY8TluJORFRkKqFH1WwBdqv+zRu8B81ilBEWsWFEz7n5NA+i1e4
         M3hKTItNxQKSGP3ExUNlV4xdS5C77YhWcImIjosNXLRA0HvoO/LXOPljhmKNO8hn90l2
         mB2KOETkYPeVnKsBzUWKt7PXGyh3fjPN2WZZr+ESj2koZad3tTu+xJyzTaceuGn6cfTw
         7MDyt13b7KnIL6Ngd8oQx7X6TgNySI4P4MekyhPeMUZUIbaBQXQrTizvlcV+Yghj+7wT
         C1/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790014336; x=1790619136;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qSirT6xM5ISWcGI7UcP1SxvvoMPpZ6FlZkkpBPJf8xk=;
        b=nEoVRyU6akdwAfDgPeMvtFTEuvZKpPzrXh9PG4aHv3/tqWlDMxx629RdhkNvpxnM6/
         bpPrM8BT5YQUS2pQBjFFfRwAEZNVyHUfUBMcarb4lIoNlemOEEtqui7kEk8UcRcIMeQw
         j8TnBVhxFn4H+qN/n2OWI9iKGFvRTHqFxasT7dat3zdmS0kYIZ/CE3ZD5XpMjrQ/9Kg1
         SoB5Z8LRLU+y9kDj/4EYbEBl4t6UE1ADu9Pl7B8Sejwn2ma0CSrx66xtZNz9HTOiXeqK
         q3Mj8J32s0Mk7Tt8wOkMDhTM0nwoCQdWecY1QaSvoGZ/la+Eemo9aDnPkLFpwP5ct/tf
         jxRA==
X-Forwarded-Encrypted: i=1; AKwUvBwMTEfXf5OdOcUUCnSpOQ5JhzZdTAX4dJhGPs+NfuB/ULAFBxUg7ud3BnuZH3FA8VTJ1vnuJe0gMtgshbg=@vger.kernel.org
X-Gm-Message-State: AFuF++mhlPI3uOwecmxxUBH8Kdcq8SYxC2eb3wk/LJ4S/RbMbp3jBl7z
	rV5cxgxaRNw5LSm4rpT0yxXyk1zDTV6ljbqYaBjftm5iOeK7ItlgyjrFDri+YSvaqdwOrpSgDn0
	NLhPetJ4dNoBnW+UJ4P48UwnsBVDWAvB9cFJWMbozYhTv
X-Gm-Gg: AYBFou25MssRij89jmOTLlQ7YUIWqrKA9DQCsOEIoZtVkA6HzNGm9doxL3Wxkxd45gK
	3/F3SzHIKb+DDux4iYmGJBS4mr4d3Ps/0XedNFDdnEA4u0rRO0wgqJ/bjF5MB2SsqWld+2G/MmY
	UqpFBgC69Atu6tdj/E6gtSg71Vd7EsZfUKGNdQR8Izp68eAFQNlepbj9Yo+C1IDyi6/5htTO8Gu
	xL1Mf9DrsqMzsvD2Ls5gxo/oo59E/10n+NyUDi+kq214oQgRMhcEXLwk0jxMAOdGdym6KhL61wR
	uNzX9n017hDZ3nIVbGYSZmgK1KTJuvkyTZpRSZ9jRV5p57pg2NbjC/c8LXvWDIREvjrxsvg=
X-Received: by 2002:a17:906:8d8b:b0:c26:1cfd:4244 with SMTP id
 a640c23a62f3a-c2a8d51eca2mr38924866b.11.1790014335694; Mon, 21 Sep 2026
 11:12:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <2a742578-120a-421d-9305-5de0b22bda33@paulmck-laptop>
 <20260919003258.3134343-1-paulmck@kernel.org> <aq6XFyrR3OiSvKl9@MacBook-0RXW5>
In-Reply-To: <aq6XFyrR3OiSvKl9@MacBook-0RXW5>
From: Puranjay Mohan <puranjay12@gmail.com>
Date: Mon, 21 Sep 2026 19:12:02 +0100
X-Gm-Features: AcwNN1Vopoh2H9nJUAxuZ5GhcLP12SoptZQi-rijjazFuXme4ontu_qvVGZPe3w
Message-ID: <CANk7y0g5EU8T8cLiU=+tLiZCcMEhZOjhnvs4uzD8Z=8GwN+7LA@mail.gmail.com>
Subject: Re: [PATCH 1/7] rcu: Make call_rcu() safe to call from any context
To: Boqun Feng <boqun@kernel.org>
Cc: "Paul E. McKenney" <paulmck@kernel.org>, rcu@vger.kernel.org, linux-kernel@vger.kernel.org, 
	kernel-team@meta.com, rostedt@goodmis.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 19, 2026 at 3:07=E2=80=AFPM Boqun Feng <boqun@kernel.org> wrote=
:
>
> On Fri, Sep 18, 2026 at 05:32:52PM -0700, Paul E. McKenney wrote:
> > From: Puranjay Mohan <puranjay@kernel.org>
> >
>
> Hi,
>
> Sorry for a bit late repsonse.
>
> > RCU's per-CPU callback list is only touched with interrupts disabled: t=
he
> > enqueue runs under local_irq_save() (and the nocb locks when offloaded)=
,
> > as do callback invocation and grace-period work.  A call_rcu() that
> > arrives with interrupts already disabled, whether from an NMI or from
> > instrumentation that re-enters RCU, can interrupt one of those and corr=
upt
> > the list or deadlock.
> >
> > Defer instead: stage the callback on a per-CPU llist and raise an irq_w=
ork
> > that re-issues it once interrupts are on, straight to the enqueue so it
> > cannot defer again.  The gate is bare irqs_disabled(), so callers that
> > merely hold interrupts off are deferred too and pay one irq_work hop.
> > Skip it while the scheduler is down (RCU_SCHEDULER_INACTIVE): irq_work =
is
> > not usable that early, rcu_init() already calls call_rcu(), and the per=
-CPU
> > deferral state is not initialised until rcu_init_one() runs later in it=
.
> >
> > rcu_barrier() drains every CPU's ->defer_head before it scans the lists=
,
> > and rcutree_migrate_callbacks() drains an outgoing CPU's.  A drain
> > re-issues onto the draining CPU, so a barrier moves other CPUs' staged
> > callbacks onto
> > its own ->cblist; call_rcu() promises no CPU affinity for invocation.
> > ->defer_lock is held across llist_del_all() and the whole re-issue so t=
he
> > drainers
> > serialize: one that finds the list empty can conclude that everything
> > staged before it is already on a callback list.  Interrupts stay off fo=
r
> > the batch.  Where the arch has an irq_work self-IPI that is what one
> > interrupts-disabled region could stage, normally a single callback; whe=
re
> > arch_irq_work_has_interrupt() is false the drain waits for the tick, so
> > several regions can accumulate first.
> >
> > The drain clears ->next before re-issuing.  A double call_rcu() on a he=
ad
> > that is already debug-object-active self-links the staged node, and
> > rcu_do_enqueue()'s duplicate path returns without clearing it, so the
> > drain would spin.  A re-add behind other staged callbacks makes a longe=
r
> > cycle, which that does not bound; a double call_rcu() stays undefined.
> > llist_del_all() yields newest-first, so a batch is re-issued in reverse
> > call order; nothing depends on call_rcu() ordering.  The re-issue drops
> > the lazy hint, since staging records only ->func, so a deferred callbac=
k
> > loses its batching on CONFIG_RCU_LAZY.  kasan_record_aux_stack() moves =
to
>
> I'm not sure this is a good idea, because it effectively remove LAZY
> support when DEFER is enabled. Since the goal of this patchset supports
> BPF and NMI, would it be nicer that we skip the whole defer logic if the
> callback is LAZY? Alternatively, you can have two llist (one for hurry
> and one for lazy).

I had made this trade-off of removing the Lazy tag as I thought it is
not necessary to support lazy when call_rcu() is called from nmi and
bpf based instrumentation as they should not be frequent. But I like
the idea of two lists (skipping the defer logic is not possible as it
could lead to deadlocks/corruption). I will also investigate if we can
put the Lazy tag on the ->next pointer. But will it be acceptable if I
do that as a follow up? I want to get the base support fully validated
with the BPF side changes. I also have more optimizations planned as
suggested by Sebastian.

Thanks,
Puranjay
