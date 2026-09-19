Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C63D2D1911
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 15:52:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789833160; cv=none; b=F0LEkGPNnUzJmfh8ZPbQMioiUHLgWHg4fRLVQ6ymup/ENlMpSZUDCpHcRitG57GEVVOLLgvQ+++vuS6fYarWb1ew+d0JiF+3CIysX/UiaiiyE2m62khAu1a+uwHWpWocS7cYMQrqu3mTBTlyn3lG5dRHXR1URZXwSZcppzOmtYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789833160; c=relaxed/simple;
	bh=mNAegP/D+VbTl8PVgLlT0m9KFHqa+RqpmSCw9ts3HE8=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References; b=Rq1V6CDZNgMrWGHrwZc1glgfdDTKO7gR+MMdLwA+b7YvM7kPtoM11uImw/kWe3ann9RavXhQBGYJpsPaDYD4cu7CDAV1r5G9khx6JBJVgqu5NvbtKw96NW/fXEISBhU7O25qsLkWWEgywrW2pUwOxpByfyNrYqt5M9h3jjkH9Yk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=jcKFH+Mb; arc=none smtp.client-ip=117.135.210.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="jcKFH+Mb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:Message-ID:From:To:Subject; bh=eq6k996KSmPnH6v
	HEoHxv0JuIxpDwDETj3wA2ByVXgs=; b=jcKFH+MbOLrFvFFEkkRoFcxnq5neUFy
	RZD/i36XBmkTMN+ZpjesLqJumzlmEGsvEzJe1Hr9IxYxpeWjq2/VjpIbDf6sVRIv
	/AN+WpbzU2B2BmSIrjCF4nKatfuurxSDnqvENqS2Hb50plRST4enOpcpoHZa1nFE
	ghaSxvirUvSE=
Received: from localhost (unknown [])
	by gzga-smtp-mtada-g0-0 (Coremail) with SMTP id _____wB3M8x3r65qWABXBg--.52295S2;
	Sat, 19 Sep 2026 23:51:20 +0800 (CST)
Date: Sun, 20 Sep 2026 00:51:19 +0900
Message-ID: <77591907f579598e5cf293e2ac03682a.sh_def@163.com>
From: Hui Su <sh_def@163.com>
To: Hui Su <sh_def@163.com>
Cc: K Prateek Nayak <kprateek.nayak@amd.com>,
	Zhidao Su <soolaugust@gmail.com>,
	John Stultz <jstultz@google.com>,
	Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>,
	Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH 0/1] sched/proxy_exec: detect cycles without persistent walk state
In-Reply-To: <20260914165455.2126134-1-sh_def@163.com>
References: <20260914165455.2126134-1-sh_def@163.com>
X-CM-TRANSID:_____wB3M8x3r65qWABXBg--.52295S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxWr13JF15Kry5uFW3CFWUtwb_yoWrtF4rpF
	Z3KryxK3WkGF4xtryxAw4UJF4rurWkJF45JF9YkFy09rZ0qr1jkFs3K34FvFWUCr92vF1Y
	vr1Dt3ykZFWDAaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0JUaoGQUUUUU=
X-CM-SenderInfo: xvkbvvri6rljoofrz/xtbC6hhQr2qur3ixygAA3l
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

> The open design question is whether avoiding persistent task/rq state and its
> activation lifecycle is worth accepting the temporary blocked_donor cycle
> window in the single-pass Online Brent walk.

I did some follow-up validation of the unchanged Online Brent patch on
tip/sched/core at e81ee0630837.

One relevant change since the base used for the original measurements is:

	772d9ffbfd26 ("sched: Migrate whole chain in proxy_migrate_task()")

proxy_migrate_task() now walks p->blocked_donor directly, so this seemed
like the most important current consumer against which to test the temporary
backlink cycle mentioned in the RFC.

I added validation-only, read-only instrumentation at
proxy_migrate_task() entry.  It inspected the already-built backlink prefix
but did not repair, truncate, or otherwise change the production migration
path.

The validation on that tip revision included cross-CPU/multi-hop cycle cases, long
acyclic chains, repeated reuse of the same task/mutex objects, and KCSAN
runs.  Some representative results were:

  - an acyclic depth-1024 case completed 2921/2921 observed whole-chain
    migrations, reaching a maximum backlink prefix of 1016 tasks;

  - curr_in_chain/current-task protection was exercised 959 times in that
    run, with no current task entering the migration prefix;

  - the same task/mutex objects were reused for 100 rounds while affinity
    changes forced remote-owner placement; 226/226 observed proxy migrations
    completed;

  - across the observed migration entries I saw no backlink cycle, duplicate
    task, wrong-rq task, or off-rq task;

  - the clean RFC kernel, without the observer, also completed the
    representative cycle cases, and a clean KCSAN build completed a
    tail-plus-cycle case and 100 repeated cycle/recovery rounds without a KCSAN
    report or fatal scheduler diagnostic.

This does not prove every possible owner-change interleaving, but in the
tested paths I did not observe the temporary backlink cycle caused by delayed
Brent detection escaping into the current whole-chain blocked_donor
consumer.

The control-flow argument also looks consistent with those results: before a
remote-owner migration, find_proxy_task() has not installed the backlink for
that owner edge, so proxy_migrate_task() sees the finite prefix already
constructed from the current donor.  Once a local backlink cycle can close,
those owners have already passed the same-rq validation while rq->lock is
held.

There is also a state-lifetime property of this approach that I think is
worth considering as PE evolves.

The Brent state:

	checkpoint / power / span

belongs entirely to one find_proxy_task() invocation.  In other words, the
lifetime of the cycle-detection state matches the lifetime of the owner walk
that consumes it.  Task activation, migration, or later reactivation
therefore do not have to carry or reset detector state.

I have not tested this RFC on top of the sleeping-owner, rwsem, or futex
series; the point here is about the ownership and lifetime of the
cycle-detection state rather than a compatibility claim for those patches.

The same separation applies at the owner-resolution boundary.  As long as a
blocking primitive exposes or resolves one dependency step to at most one
task owner, e.g.

	mutex -----------\
	rwsem writer -----+--> task owner
	futex ------------/

the detector still only sees a task-to-task walk and does not need to know
which primitive supplied the edge.

So the useful property here is that lock-specific owner resolution,
task/rq lifecycle, and cycle-detection state remain separate.

There is also a clear limit to this abstraction: Brent assumes one successor
per step.  If PE eventually models and traverses multiple rwsem readers as
dependency owners, the walk becomes a branching graph and cycle detection
would need to be reconsidered together with that traversal model.

The cost remains the one described in the RFC: detection can occur later
than the first repeated owner, and the walk can temporarily close a
blocked_donor cycle.  The current-tip testing above was intended to exercise
that cost against the whole-chain blocked_donor consumer now present in
proxy_migrate_task().

The RFC implementation itself did not need any changes after this
validation, so I do not plan to respin it just for the additional test
results.

At this point, the main question I would appreciate feedback on is whether
this trade-off -- invocation-local detector state in exchange for delayed
detection and the transient backlink window -- is reasonable for this path.

Thanks,
Hui

