Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BE2C49739D
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 12:06:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789733186; cv=none; b=g9QlQSTnNrFe+Ip1V4F2QPURNJ8n2zIZ2YH/Pk+eT51uche+6MEdYQdqFRaTiu2GvF463XWtqY0wrMF1jQVCwS3rJidyWFhWpuNeUlub3U6665q0WiHd8NU5zR2pQvLMwi87OKFn9cegAfwWmJuLChKF3mvT+Kti9fGeJgEtKjo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789733186; c=relaxed/simple;
	bh=exQ2GBdnM0/QZ7EqaQNEcOlMhVtArgXtat+0cQdBSs8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MHvG56mMO/2PZwJ9UGWoJsoxxVZ0A0aEJ1PfYeUDWwOw0VfaGOovCHPpkIkrlHQy4PHi1nUp9h8LY+rrw75dQZARBA3sDCCX+xEvSFpefiis0AuZd1AdUKx9Idjgiuj9EjhAxcpXAi8RzX3j02pLcptQVFGKrg6wEBSNXtlKhFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=Z9OYV4Jj; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="Z9OYV4Jj"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=SRaU8y4A4/FVe1Z70TcZTz/SjVc3fuxJ2XAfmlHo/wc=; b=Z9OYV4Jjue9un2yzJ70E94/7Os
	p3gWLXlXXGD3lao/BgWpNUSc1BC5h1UJEmprecIDBA7888nHTMdYtRhHnXnEpqCleiqQ4y07HTYIM
	6t1DLZi7G9giu0pnx6BO00tINPRYRygsXr2oXCRykFsRhhzRAUbaQcR2IXZ8mrm1rjgW2FSHwPLjD
	yExP49r5tqHuesqXKvQdD0vgA3mnGTWSc4PFas9HODdU5zX7D92OnjjCN977Vn8zBKwpHY9YiaNQB
	PZq54O5dZz9ddvOPvfpRpm/xxCP6f9ygi0/zr/w6r7dfUS91XLMMfCs0/uwW3eFeqAz/MvYgAxjws
	Duals0oA==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x7XLt-0000000A2he-1iI8;
	Fri, 18 Sep 2026 12:06:01 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 6BA0230057F; Fri, 18 Sep 2026 14:06:00 +0200 (CEST)
Date: Fri, 18 Sep 2026 14:06:00 +0200
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
	Qais Yousef <qyousef@google.com>, ssouhlal@freebsd.org
Subject: Re: [RFC PATCH 02/12] futex: Switch PI futex to use p->pi_futex_lock
 instead of p->pi_lock.
Message-ID: <20260918120600.GM1837346@noisy.programming.kicks-ass.net>
References: <20260917043339.2093426-1-suleiman@google.com>
 <20260917043339.2093426-3-suleiman@google.com>
 <20260917153831.GL4121339@noisy.programming.kicks-ass.net>
 <CABCjUKD60kEn0BZo0r3zie6QE8wFh-0V=V6OG3nfa3b1evjVKQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CABCjUKD60kEn0BZo0r3zie6QE8wFh-0V=V6OG3nfa3b1evjVKQ@mail.gmail.com>

On Fri, Sep 18, 2026 at 04:11:03PM +0900, Suleiman Souhlal wrote:
> On Fri, Sep 18, 2026 at 12:38 AM Peter Zijlstra <peterz@infradead.org> wrote:
> >
> > On Thu, Sep 17, 2026 at 04:33:26AM +0000, Suleiman Souhlal wrote:
> > > Switch PI futexes to use p->pi_futex_lock instead of p->pi_lock.
> > >
> > > When augmenting PING futexes with proxy execution, we get lock order
> > > inversions, due to the lock order being p->pi_lock -> mutex->wait_lock
> > > in the scheduler, but wait_lock -> p->pi_lock in futex code.
> > >
> > > So move the futex code to use a new lock, p->pi_futex_lock, to
> > > protect p->pi_state_list and pi_state->owner.
> >
> > This is of course horrible. Lets not do this.
> 
> I suppose the alternatives would be to either figure out how to
> un-nest pi_lock from wait_lock in futex code or un-nesting the
> blocked_on lock from pi_lock in the scheduler.
> Either of them seemed more involved than creating a new lock, but
> maybe I was wrong.

So the reason I reacted was because the futex_pi code is tied into
rt_mutex and it isn't at all obvious separating futex from rt_mutex
doesn't completely wreck things.

The scheduler's (ab)use of pi_lock might be simpler to separate -- it
was the last added. I basically used pi_lock because I needed a
per-task raw_spinlock and pi_lock existed and had the right nesting
properties already (rq->lock nests inside pi->lock).

Still, its been a while since I did that, so if you untangle that be
very careful.

That is, doing something like s/pi_lock/sched_lock/ on kernel/sched/
*might* just work. But separating futex from rt_mutex seems very
dangerous to me.


