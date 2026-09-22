Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA724516154
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 07:18:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790061519; cv=none; b=fV2sxzDi2VHdrnYa8BpX7I1IkwFEbm0o5S7wSpG/tD6NAUfHCOZXa70bBwFrR1ZR2iSNR5ajERAoqCU6kpiplZQHBt7T+ApP5YxI0//SU7TGBphywI9SnPLR11UZ8boylXuFerIIW3gX/VRZn0DnNI0UntpO9TBoyKqahOTG0oo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790061519; c=relaxed/simple;
	bh=v6xZErlacr+A9mo6omiPPVicOPdkpTeC65FS62sInss=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JEOJEOyqrw6f3qhpFwE+zrYBavYeu9w9OOQ8349zcWwaEl7sD2LVJ3xUOZt7P2Pozkoi7lPSzBsLFUjPR+SazNcHMhVf+R8Y8gzli03BSb1c67KvFckYCZXGrUHAH6dP1v0RxvfQGj0a/n4iykBTxI3CpVvp1MVDXCAqd7mgGoc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=C0hX1X9h; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="C0hX1X9h"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=ygrPZm8eDcUQ7MoHLmGIK5pbHdtwj7Bl+cfPIeIvl7c=; b=C0hX1X9h6tbKVp8gdcWbmSLfel
	lBPMsguauBM3lc4UNKTZhuOI2pewCMdfGP0xz1twOL7jvkuRrPIPmpQwsVzbNKIp3RkBS+jkSpQ9o
	6QVtNUVRENhAUchD3WD6+mA37qdi+bnLbsmXjMrPK8754zymtq9eAvm6V2iBiKPdWpFWvKQrlUQJA
	2e+oT++vks1qDBxfdqDiB4vFUUKe8rckqRDvM6gmgumeXmyX0S74O9vkH8emwPDk7P6DzQQFyYApr
	aPPB7JPA0GknCA5X8XiXN2t3kkKOgpsKbC2/NG5+GzVvQn8t1aaU4kP9oo4ETzQEnUXhZgSvkXXWU
	OeQaVsrQ==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8uld-00000007U1N-3jx3;
	Tue, 22 Sep 2026 07:18:18 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 07875300708; Tue, 22 Sep 2026 09:18:17 +0200 (CEST)
Date: Tue, 22 Sep 2026 09:18:16 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: John Stultz <jstultz@google.com>
Cc: K Prateek Nayak <kprateek.nayak@amd.com>, Hui Su <sh_def@163.com>,
	Ingo Molnar <mingo@redhat.com>, Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Zhidao Su <soolaugust@gmail.com>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH 1/1] sched/proxy_exec: detect cycles in proxy walks
Message-ID: <20260922071816.GT4121339@noisy.programming.kicks-ass.net>
References: <20260914165455.2126134-1-sh_def@163.com>
 <20260914165455.2126134-2-sh_def@163.com>
 <CANDhNCqZwGk+wqhB4N8Emq0rPmzsrVWzHmayiSj9ptg-vLzo3Q@mail.gmail.com>
 <8669890e-c8a5-448e-b059-d959e3a1d73c@amd.com>
 <CANDhNCqKYjO=0mFM1aidHyAWaRirD2zO4_HqH=qB+0x-Uhk9PQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANDhNCqKYjO=0mFM1aidHyAWaRirD2zO4_HqH=qB+0x-Uhk9PQ@mail.gmail.com>

On Mon, Sep 21, 2026 at 11:06:52PM -0700, John Stultz wrote:

> > So if we are eventually planning on returning -EDEADLK to userspace
> > (context: https://lore.kernel.org/lkml/20260917153649.GK4121339@noisy.programming.kicks-ass.net/)
> > do we care where the chain starts or can we return -EDEADLK anywhere
> > in the chain?
> 
> So returning EDEADLK to userland seems like a new feature to me, as I
> don't believe existing futexes (which can still have dependency cycles
> or just ABA style usage) currently do this.

  git grep -e DEADLK -e DEADLOCK kernel/{futex,locking}

We definitely return -EDEADLK for PI futexes and rt_mutex. And given the
whole proxy thing hard relies on the block graph being acyclic, it
seems rather mandatory we enforce this before exposing it to userspace.

