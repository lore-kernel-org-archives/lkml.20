Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68D574FE2F5
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 12:59:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791982761; cv=none; b=mXeQ0uMrDRARcchsmWt2teaxgxmiQ2qa5jkWLFjN9CJtgaxCIOZMnpPwyum02VXRd2zPX5w3K7V2EZo5W9WKcT+mO9sbgEGfWD5U/6GXo6ktVFkH6Hmf7amjI5RHizzn4ISPeJ84l8Rhi1UjT8JRtnEDpnQ0UV+sKhkk1K8oNKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791982761; c=relaxed/simple;
	bh=BzBKfGgsKBwSw29mpPiHcnaTzoS6V12YLpKjejsQvzM=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H2TEqvELAqvMQ53+WBMZ6G5mMSgUAacEA25Crj7a9MzJWv+aLkadIjzWeXxFsZc7IWEIPBRxIAqNuPn1Cek0ncMptNXFI26Q830OCHBP80kDOhnv6qSMNvyNRZB0+F5rzvNb2UBJ6x9XxUTbgypR+0CZjqcfrUDMzVlCX40MO/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jr57VvY4; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jr57VvY4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5716B1F000FF;
	Wed, 14 Oct 2026 12:59:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791982752;
	bh=vt5cE7bhqHhJM4LXml8ddm5B1GkCN7R4vMUET5RYgY0=;
	h=Date:From:To:Subject:Reply-To:References:In-Reply-To;
	b=jr57VvY4dw2O8lU7Jt62kykVvplEXZR0U3Y9usB1jibGnMDq3CRTdPf8xMl+ScE0R
	 O0HpxURSzv5Bwhl/0kzpH2tOBRl6JYe5WEZG8V8BX4wcnipaB8NqrJmZJ94IaN2GbP
	 hE8WZkNKDiXmLiQBefUdD+Sr1rR1XBzsNt/uaKkk7BeGEEQVDOzOJpyL7bbZeUrYkd
	 pDvyEBmy9/ZErmLvJeJHCPIBL+FIW5T9UnrrskS1ExreKHMvKvrrb+qnIXFmW6ZIu8
	 T1w1x9xqBxRtrB+f0lB7b7qAg9ItTqvcUY3KwT0bUR4sknjdq8obUHQxlSm09C7nw5
	 216jkLmqJZIuQ==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 11E04CE0855; Wed, 14 Oct 2026 05:59:12 -0700 (PDT)
Date: Wed, 14 Oct 2026 05:59:12 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: K Prateek Nayak <kprateek.nayak@amd.com>,
	Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	Joel Fernandes <joelagnelf@nvidia.com>,
	linux-kernel@vger.kernel.org, kernel-team@meta.com
Subject: Re: [PATCH] sched/core: Call wakeup_preempt() for queued tasks
 during class change
Message-ID: <4abd0c29-efde-4e8b-a498-aea5a0fb788f@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <8fa7f795-518c-4507-b684-60b0c1cac2c5@paulmck-laptop>
 <20261013152455.9039-1-kprateek.nayak@amd.com>
 <786f52b9-adef-4246-b83c-fc0081bbabba@paulmck-laptop>
 <44e3b645-b8d3-4812-930b-0112c05a9132@paulmck-laptop>
 <af6eb571-791d-475a-8413-18d2125328f4@paulmck-laptop>
 <c334b382-a13c-4222-99bb-798340ff0d68@paulmck-laptop>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c334b382-a13c-4222-99bb-798340ff0d68@paulmck-laptop>

On Tue, Oct 13, 2026 at 05:13:00PM -0700, Paul E. McKenney wrote:
> On Tue, Oct 13, 2026 at 01:06:50PM -0700, Paul E. McKenney wrote:
> > On Tue, Oct 13, 2026 at 12:55:12PM -0700, Paul E. McKenney wrote:
> > > On Tue, Oct 13, 2026 at 10:57:17AM -0700, Paul E. McKenney wrote:
> > > > On Tue, Oct 13, 2026 at 03:24:55PM +0000, K Prateek Nayak wrote:
> > > > > Paul reported recent RCU changes exposed a lost resched where CPU idles
> > > > > with a rcutorture thread waiting while being completely runnable.
> > > > > 
> > > > > Dumping the rq state at the time of idling with runnable tasks showed
> > > > > the following:
> > > > > 
> > > > >   rq->next_class = &fair_sched_class
> > > > >   rq->nr_running = 1
> > > > >   rq->cfs.h_nr_queued = 0
> > > > >   rq->rt.rt_nr_running = 1
> > > > > 
> > > > > Although the waiting task was an RT task, "rq->next_class" did not point
> > > > > to rt_sched_class and was stuck at the lower priority fair_sched_class.
> > > > 
> > > > Thank you all very much!  I have started a short test.  If all goes well
> > > > with the short tests, I will run an overnight test.
> > > > 
> > > > I will of course let you know how the individual tests go.
> > > 
> > > 20 minutes of 39*TREE03 (13 hours) on x86 passed!  2 hours of 9*TREE03 (18
> > > hours) on arm64 in progress.  Starting five hours of 200*TREE03 on x86.
> > > If that works, 12 hours of same.
> > 
> > And the 2 hours of 9*TREE03 on arm64 passed!  Started a 15-hour run.
> 
> And the five hours of 200*TREE03 on x86 passed!  Started a 12-hour run.
> 
> So thus far, this patch has passed bit more than 1,000 hours on x86 and
> 18 hours on arm64.  (Something about having access to quite a few more
> x86 boxes than arm64 boxes.)
> 
> If it is still alive in the morning, Pacific Time, it will have more
> than earned itself a Tested-by.  ;-)

Tested-by: Paul E. McKenney <paulmck@kernel.org>

Thank you all very much!!!

For those into statistics, these test results give 99.9% confidence that
this patch reduced the bug rate by more than two orders of magnitude.  ;-)

							Thanx, Paul
