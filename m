Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93581253B73
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 00:13:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791936783; cv=none; b=YtRqVFrxcP901Sj6f+KvSooiPcWTU0cNXPQQIfnz5hRbprHgrIEcZqt1WIz/MGSzn/G5f8GzO9vsSXXPHWKnB4TtyaSOEKbFUUWUxvpW+yz1a4Vq3XEjACA7v7+OyiFlRPZP5XQtqxg7SEC7c8vm4hnD9oSuTsGR2/P7yqAbNXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791936783; c=relaxed/simple;
	bh=S4TCCHOZ/EiuYIi8iQtArq+z1qIcHqKPyLYcq4MiOk8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ItfEXrjg0gsOepceu8b9ZOan3QklzZ3KmgmUTPngBaKQYKCsL3e0CRTdsmqAUr6p2SCJ2dfTd8bx1j/jadQcchzoHZSmQSE3/aKk6Om7+YaiIwJAG04sQ5p0YoohHRdZdpNib149fcHVeXaNWGrPOrKFN9aJZf6GkPffdpl34es=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OuaQMZX/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OuaQMZX/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B4FC1F000FF;
	Wed, 14 Oct 2026 00:13:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791936781;
	bh=Ia1VUQ1nYtUAKbFmfVhgW8uhMXui542LoIvaoMrzFk0=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To;
	b=OuaQMZX/maFpPITVX+qnGEGQ/PDtvWJoSirhTdgFJBElxTNKih5W0TxBGKhWNU+6s
	 gYznpLoO23qyABM5NVPkMBJGZOpBWonsdZy8mujkK5J7GR7oF3IIk5pFxI1kr19VKi
	 7SPS/Wn0T65S3BJC6ceMjyJXFQSC2T5+nQVk0g1+utCfWiKmDoym0vKKxmJgn0rfU8
	 ut1hwU0A3MUoX2cQwRRXcT1mdz6xyU+Ab/P0mF/6JUM981SzhjzplTFTdbXlluNMCv
	 4ff7BTOZv1b27ifas+FRmUQ5iA8QuLY23b4oLX4/p5u2jOhwsIreB5ze9WsoTB0Z3I
	 g3G/LmamkF0kA==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id CC713CE0459; Tue, 13 Oct 2026 17:13:00 -0700 (PDT)
Date: Tue, 13 Oct 2026 17:13:00 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: K Prateek Nayak <kprateek.nayak@amd.com>
Cc: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
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
Message-ID: <c334b382-a13c-4222-99bb-798340ff0d68@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <8fa7f795-518c-4507-b684-60b0c1cac2c5@paulmck-laptop>
 <20261013152455.9039-1-kprateek.nayak@amd.com>
 <786f52b9-adef-4246-b83c-fc0081bbabba@paulmck-laptop>
 <44e3b645-b8d3-4812-930b-0112c05a9132@paulmck-laptop>
 <af6eb571-791d-475a-8413-18d2125328f4@paulmck-laptop>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <af6eb571-791d-475a-8413-18d2125328f4@paulmck-laptop>

On Tue, Oct 13, 2026 at 01:06:50PM -0700, Paul E. McKenney wrote:
> On Tue, Oct 13, 2026 at 12:55:12PM -0700, Paul E. McKenney wrote:
> > On Tue, Oct 13, 2026 at 10:57:17AM -0700, Paul E. McKenney wrote:
> > > On Tue, Oct 13, 2026 at 03:24:55PM +0000, K Prateek Nayak wrote:
> > > > Paul reported recent RCU changes exposed a lost resched where CPU idles
> > > > with a rcutorture thread waiting while being completely runnable.
> > > > 
> > > > Dumping the rq state at the time of idling with runnable tasks showed
> > > > the following:
> > > > 
> > > >   rq->next_class = &fair_sched_class
> > > >   rq->nr_running = 1
> > > >   rq->cfs.h_nr_queued = 0
> > > >   rq->rt.rt_nr_running = 1
> > > > 
> > > > Although the waiting task was an RT task, "rq->next_class" did not point
> > > > to rt_sched_class and was stuck at the lower priority fair_sched_class.
> > > 
> > > Thank you all very much!  I have started a short test.  If all goes well
> > > with the short tests, I will run an overnight test.
> > > 
> > > I will of course let you know how the individual tests go.
> > 
> > 20 minutes of 39*TREE03 (13 hours) on x86 passed!  2 hours of 9*TREE03 (18
> > hours) on arm64 in progress.  Starting five hours of 200*TREE03 on x86.
> > If that works, 12 hours of same.
> 
> And the 2 hours of 9*TREE03 on arm64 passed!  Started a 15-hour run.

And the five hours of 200*TREE03 on x86 passed!  Started a 12-hour run.

So thus far, this patch has passed bit more than 1,000 hours on x86 and
18 hours on arm64.  (Something about having access to quite a few more
x86 boxes than arm64 boxes.)

If it is still alive in the morning, Pacific Time, it will have more
than earned itself a Tested-by.  ;-)

							Thanx, Paul
