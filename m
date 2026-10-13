Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4089E53447D
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 20:06:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791922012; cv=none; b=KjGuuSGsrDQJBCIyD4U1dFrX7rmQYsA23DTYWc3JpNTkBvZyzBh1EZUTCm+99LzkQAH0bphfAanmdDzIDzAweBibo/PspTKdjvQ1Ok+DkemTPfJc8CHQiu96lueZ5gcnzABz18vPfVdIuvj63iRsU1l9n/Lvy94U4oPhstWGCJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791922012; c=relaxed/simple;
	bh=aI71Raxm3niwYTWEppQO9yobVar3ea/YyR0gF8Xb77A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ADe/Rcs26jeJGJ5/fDa7kIdrmBapE5jpV7bV+zQO4YZG0CCo+sbpupCku59WKHnwKQYD90gN/QrIW0GpXP0xIO5zKXPQwSjWFtPGP2gEXjyPhSCIsctROVMCxkLEemXmasoRLNyURTHZNVhLnczjV+rA6DlMLQgLpXD2LhhP+6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MNfZ+R/G; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MNfZ+R/G"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB5611F000FF;
	Tue, 13 Oct 2026 20:06:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791922010;
	bh=AZEXexuK4waYhZj/x2j0mphPl+YYTElPoPacjw8iFOo=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To;
	b=MNfZ+R/GS8QvNiXkdi43DTG53nH8lMSo7cjvpd9i+n5i/pfe2Y/mSWBNju6sRSQCl
	 TSmiBfcrl7sQxX9yAkKQERuP2McnAeQ50zyN9BvXP1ciYFbBObvMbOUhqGoE2b51kI
	 DQv/A839j2XlrfYOR/eau7v2/+E42tmR5sz2WAGze/5ILPUEuEkCQUHAKE/VcfXJJU
	 /B/8X7V7mBOJEE+u25Ng2Ys3MO2y5jKDov7DcsMeSZSlNCQSC40tzSIGymMYPj5Ajp
	 zqKQhIh763xp6bRWEs2Ou8cg5+isSM11MWpCd/xYgBu9pkOxSoLfngezdk6cGYuuys
	 yUoC5N+dRsxQw==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 86690CE0248; Tue, 13 Oct 2026 13:06:50 -0700 (PDT)
Date: Tue, 13 Oct 2026 13:06:50 -0700
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
Message-ID: <af6eb571-791d-475a-8413-18d2125328f4@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <8fa7f795-518c-4507-b684-60b0c1cac2c5@paulmck-laptop>
 <20261013152455.9039-1-kprateek.nayak@amd.com>
 <786f52b9-adef-4246-b83c-fc0081bbabba@paulmck-laptop>
 <44e3b645-b8d3-4812-930b-0112c05a9132@paulmck-laptop>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <44e3b645-b8d3-4812-930b-0112c05a9132@paulmck-laptop>

On Tue, Oct 13, 2026 at 12:55:12PM -0700, Paul E. McKenney wrote:
> On Tue, Oct 13, 2026 at 10:57:17AM -0700, Paul E. McKenney wrote:
> > On Tue, Oct 13, 2026 at 03:24:55PM +0000, K Prateek Nayak wrote:
> > > Paul reported recent RCU changes exposed a lost resched where CPU idles
> > > with a rcutorture thread waiting while being completely runnable.
> > > 
> > > Dumping the rq state at the time of idling with runnable tasks showed
> > > the following:
> > > 
> > >   rq->next_class = &fair_sched_class
> > >   rq->nr_running = 1
> > >   rq->cfs.h_nr_queued = 0
> > >   rq->rt.rt_nr_running = 1
> > > 
> > > Although the waiting task was an RT task, "rq->next_class" did not point
> > > to rt_sched_class and was stuck at the lower priority fair_sched_class.
> > 
> > Thank you all very much!  I have started a short test.  If all goes well
> > with the short tests, I will run an overnight test.
> > 
> > I will of course let you know how the individual tests go.
> 
> 20 minutes of 39*TREE03 (13 hours) on x86 passed!  2 hours of 9*TREE03 (18
> hours) on arm64 in progress.  Starting five hours of 200*TREE03 on x86.
> If that works, 12 hours of same.

And the 2 hours of 9*TREE03 on arm64 passed!  Started a 15-hour run.

							Thanx, Paul
