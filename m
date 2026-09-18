Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E93502FBDE0
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 08:08:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789718891; cv=none; b=XkwimHROVaAl8EyhgWxi13UofD48qA2hBZErVRvWpSP5tmYWnaneeDHRFW/nngnw2wOXA4CUY8/r6X2XHox2YMJxjih8fTUyCY+wAvuxgKauiRGDqpWyl/mDavE2If23EMw8UNpYMZudUpSYL5dsNIOzhz9skTKcHNMJZM1yxCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789718891; c=relaxed/simple;
	bh=tRzdU/vAvNMbNQzpdwsvb3t+9DA58n2vx1/A2sIx8Fg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sj3uxHfi0p7+0sU3XCr1NFcN75jKp3zyfR0iT7B+IpjpFsbhCA1+gApMVvmwgdWNgRiA6CKY0/gPP+VVrpogdBH2nJ6wx2U7a8rvKKsSAfzD9ORmE+VGnva/hUpyMHEEINKlaREdy2uUNN3icLNWLmCxNkSu6XG30dAuhleVXPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=QryDg0O2; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="QryDg0O2"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=v+SeOsRk1Xof0yv2frfPr5ERXPlgMXtJkQoLxg9lVcA=; b=QryDg0O2MyTv7RxPdeRo9XSW0E
	prH/77QGmExO1cVoNcs+KPyLiTa1dOmzILNTseBXWphMMjuk6qIUY4rUNpbzjqVk24iDZ8ppINyC5
	90tzkiZ4BTUa5erUuLAbV4gYVEDff4eu1bdIMiDob5f2C7ko0Prp4uimbY6bxZy3323QbVpiE/7ze
	5dwKgKAaxLr7YUwAuoubEMLCa7jPQmLOAYgaq+sUO/957RZZKOia1iM8QzGnlfDz8E2N4cTwvdwDt
	2FGVzV32E8kr2INLQkDWzPMJCwWAqvVAEQ4dokF6yHV1ieX1wpCetx1wYCmdIZQfnQzmPrRkvo43t
	QmvKfK0Q==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7TdO-0000000GUXT-3ZYR;
	Fri, 18 Sep 2026 08:07:50 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id BAB373008E2; Fri, 18 Sep 2026 10:07:49 +0200 (CEST)
Date: Fri, 18 Sep 2026 10:07:49 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Suleiman Souhlal <suleiman@google.com>
Cc: linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>, Darren Hart <dvhart@infradead.org>,
	Davidlohr Bueso <dave@stgolabs.net>,
	=?iso-8859-1?Q?Andr=E9?= Almeida <andrealmeid@igalia.com>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	zhidao su <soolaugust@gmail.com>, John Stultz <jstultz@google.com>,
	Qais Yousef <qyousef@google.com>, ssouhlal@freebsd.org,
	Waiman Long <longman@redhat.com>
Subject: Re: [RFC PATCH 00/12] FUTEX_PING: A stealable futex using Proxy
 Execution.
Message-ID: <20260918080749.GI1837346@noisy.programming.kicks-ass.net>
References: <20260917043339.2093426-1-suleiman@google.com>
 <20260917085805.GD2009045@noisy.programming.kicks-ass.net>
 <CABCjUKBmmh4sn0A3H6RJgASgqBg-E7LEFNQGmL=xJCmtP03qUQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CABCjUKBmmh4sn0A3H6RJgASgqBg-E7LEFNQGmL=xJCmtP03qUQ@mail.gmail.com>

On Fri, Sep 18, 2026 at 03:07:56PM +0900, Suleiman Souhlal wrote:
> On Thu, Sep 17, 2026 at 5:58 PM Peter Zijlstra <peterz@infradead.org> wrote:
> >
> > On Thu, Sep 17, 2026 at 04:33:24AM +0000, Suleiman Souhlal wrote:
> > > Hello,
> > >
> > > This patch series adds a new type of PI futexes, PI Next Generation,
> > > or PING (name coined by Steven Rostedt) (but other name suggestions
> > > are welcome!), that differs from classic PI futexes in that they can
> > > be stolen from the top waiter, and use Proxy Execution instead of
> > > rtmutexes internally.
> > >
> > > The reason to allow the futexes to be stolen is that with classic PI
> > > futex's strict handoff to the top waiter, new contending lockers are
> > > now forced to wait in queue, which means that any locking operation
> > > now becomes a scheduling event. With stealing, a contending locker has
> > > the chance of taking the lock without blocking. The longer wait time
> > > of blocked tasks can be mitigated by forcing the lock to be handed
> > > off to them in a way that can't be stolen, when they've been stolen
> > > from too much, to ensure they don't get starved.
> > >
> > > The use of Proxy Execution lets us also get Priority Inheritance for
> > > for fair tasks, which PI futexes don't really allow.
> >
> > https://patch.msgid.link/1490204338-1856-1-git-send-email-longman%40redhat.com
> 
> I was not aware of this, thanks!
> It actually seems very similar to this patchset (but much better written).
> The main functional differences that I can see from a cursory look are
> that on unlock it doesn't preserve the waiters bit, while PING does,
> and that TP futex also supports userspace rwlocks, unlike PING.
> And of course the fact that PING also uses Proxy Execution.
> So now I know that I'm not completely crazy for wanting this. :-)

Well, you all seem to be in violent disagreement with yourself. On the
one hand you call your feature Priority Inheritance Next-Gen, while at
the same time you're arguing you do NOT in fact want the strictness of
PI/RT.

You cannot have it both ways.


But yes, FUTEX_LOCK/FUTEX_UNLOCK is desirable for a fair number of
reasons, and Waiman's earlier attempt basically died because neither
Thomas nor me found time to do a proper review :-(

One of the very few things that I remember being annoyed with is that it
did handoff in the futex code, while mutex_unlock() already has this.
But other than it being a annoyance, I never had enough time to dig in
to understand if this was fixable or not.

Anyway, back then the motivation for FUTEX_LOCK was to get optimistic
spinning for 'free' by using mutex, much like how FUTEX_LOCK_PI uses
rt_mutex. These days, you'd get proxy exec as well.

But like I mentioned elsewhere, the whole futex/proxy thing needs a
deadlock detector, something we don't really need for in-kernel code,
since it is a hard requirement for kernel code not to have lock cycles
(barring ww_mutex, which will resolve them etc.). But we cannot trust
userspace to play nice.

Doing it at schedule() time is very much not ideal, this is something
much better done at block time, not least because it is the ideal
context to return -EDEADLK, but also because you but the cost of
verifying it in the right context.
