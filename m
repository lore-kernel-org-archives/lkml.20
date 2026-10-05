Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EFAE4A3F25
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 14:32:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791210778; cv=none; b=jx9JfuhAP+SC0aaRSbrjhg/BisgdetB0DSiOKhE+vZHrUy3kvry9VNAhWOxb1GRsfOYb0v8t8JLiJwRUpO830TyagWJmltgJqUYLj7DR639MGDC2ojIK1Zh81hTjmuwcPjmF9vJAeH9pgq3gjSjuAOZ24gJN6q+AdOBuMZuoRjM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791210778; c=relaxed/simple;
	bh=MvM+qt6wAKsb7V+ZaFMTPuwjBKNeyLcinjujYmIusLI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bUavq5PvqCwpELSN8IqcPz5ySOLFI7tAycWWuRHWoEEIq4bSM0d2dGL2vScloFzIk4GUChZHLNhqv2AYuvT7Y+NDwADZU42LM2NLBS00ymi4Lz+5bcRh3OKg+j6S6UiJ8wLMU0qouHIIgho/DDfNAh4yN0Ieh4CLnxjpXpbLXms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QXxDCDbC; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QXxDCDbC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D35211F000FF;
	Mon,  5 Oct 2026 14:32:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791210768;
	bh=mdLMAkMxoc8Ue1yfZ7E4bcT7wNRq/KHmN91Bugt8zyY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=QXxDCDbCUOz1Iz+wW89bwIjOu+XsyoqDaMuDlArI9wSuFmPIFdoKPCP2VA5ydKvTg
	 A6RoSAQISiuUqLoIRwpUkA/eY101smJ0I5u9xlT+XnG6mkeX/ZZD6vlSbvp+hSlqDE
	 NcXwChGAR+bRvkQP2J+DKMCp6QEBEOsDHeRMn4jrQgrU6ROk7dnpwubaHnL6op6Z5K
	 CHTchl9RPHLK1XN6VTh2GL+rDmqoRg4ayq7lTlvTGCKgJEtbBI5yLAn/qrLwW8yOEb
	 AygQF3vcVzzzlsk94kbe+UYqlQc1g4nVVNhY9oLQj2yfOBbIGAD53393UqzJfxGkHy
	 zdcuInFfiyntg==
Date: Mon, 5 Oct 2026 16:32:45 +0200
From: Frederic Weisbecker <frederic@kernel.org>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Juri Lelli <juri.lelli@redhat.com>, Ingo Molnar <mingo@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	Andrea Righi <arighi@nvidia.com>, linux-kernel@vger.kernel.org,
	David Haufe <dhaufe@simplextrading.com>,
	Cao Ruichuang <create0818@163.com>,
	Furkan =?utf-8?B?w4dhbMSxxZ9rYW4=?= <frn1furkan10@gmail.com>
Subject: Re: [PATCH v2] sched/deadline: Make dl-server nohz full aware
Message-ID: <asO1DctL9BydDNGV@localhost.localdomain>
References: <20260513-upstream-fix-dlserver-nohzfull-b4-v2-1-d3e9cbe5c845@redhat.com>
 <20261001142735.GT2009045@noisy.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261001142735.GT2009045@noisy.programming.kicks-ass.net>

Le Thu, Oct 01, 2026 at 04:27:35PM +0200, Peter Zijlstra a écrit :
> On Wed, May 13, 2026 at 11:13:03AM +0200, Juri Lelli wrote:
> > The dl_server_timer() originally caused spurious IPIs on nohz_full
> > cores, breaking isolation guarantees. While such IPIs cannot be observed
> > on recent kernels, dl-server timers for tick-stopped isolated CPUs still
> > fire unnecessarily on housekeeping cores.
> > 
> > The problem is that dl-servers are not coordinated with nohz_full tick
> > state. Even when the tick stops on an isolated CPU, its dl-server timer
> > continues to fire on housekeeping, wasting cycles and potentially
> > affecting housekeeping CPU performance.
> > 
> > Fix by managing servers in sched_can_stop_tick():
> > 
> > - When RT tasks run with CFS/SCX tasks, start the appropriate server(s)
> >   and keep the tick running
> > - When only RT tasks remain, stop all servers and allow tick to stop
> >   (except for >1 RR tasks which need the tick for round-robin)
> > - When only CFS/SCX tasks remain, stop all servers before stopping tick
> > 
> > Introduce dl_servers_stop_all() to reduce duplication and abstract
> > server management from core.c. Unify RT handling into one block that
> > handles both RR and FIFO cases.
> > 
> > Note on SCX: While SCX is incompatible with isolcpus=domain, it does
> > support nohz_full. The ext_server handling in this patch targets
> > nohz_full configurations without domain isolation.
> > 
> > Fixes: 557a6bfc662c ("sched/fair: Add trivial fair server")
> > Reported-by: David Haufe <dhaufe@simplextrading.com>
> > Closes: https://lore.kernel.org/lkml/CAKJHwtOw_G67edzuHVtL1xC5Vyt6StcZzihtDd0yaKudW=rwVw@mail.gmail.com
> > Signed-off-by: Juri Lelli <juri.lelli@redhat.com>
> > ---
> 
> I was most confused with this IPI talk, since dl-server are strictly
> per-cpu and was thinking you must be meaning timer interrupts.
> 
> But AFAICT the normal dl timers are ABS_HARD, and !PINNED, so the whole
> NOHZ_FULL muck will move them around for no win. Oh well. Do we want the
> below?

Well, more or less, non pinned hrtimers don't move as easily as non pinned
jiffies timers. But yes.

> 
> Anyway, yes, I think this is more or less the best we can hope for. In
> the down-thread case where someone is running both FIFO and CFS tasks,
> they get to keep the pieces, since that is violating NOHZ_FULL premise
> anyway.

Exactly.

Thanks.

-- 
Frederic Weisbecker
SUSE Labs
