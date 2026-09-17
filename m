Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31455483BD8
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 08:58:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789635509; cv=none; b=kx36R2H0NvGeVHizFm/oivnj6lk7GgUCg6iStL/g4ObIKe07knFjIUHYah01egbYau+FGFFU+U5OlwfUaOFCRwManp1Pv4npIRcvgi2CB+oVoURy8LSfnfpKHrCr7C9DqkdlvlxI6KeNZbpJpskVyoqShjMOk2g/002xXhgPTPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789635509; c=relaxed/simple;
	bh=r9Hsb5A8A3GqqbHHPz4KIbZGPT/GmeguhasatfJFwg4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=edwoXD4ilSE2V8r151u1uIXM4pwQ56e12HB+p2fGiEws9pQSzs4ks+8DVQYxGlHS0M4bRQ308HegcunqnYHBDjraCpd5QH/2hCYLhs47wjVfBu04jD2WYIa/C3e8XF3g06l+C4kdyabrQMa9bvsoLpUX8+j5EQ6QSp2h77Qzn+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=MmbfaGWa; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="MmbfaGWa"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=QYwsrhlB4PAiHmssQJ9tn87vQAe1ulAb6t/S45PZfVk=; b=MmbfaGWagfWJACmxBolFLghWiX
	QNJ54mmRd22gZa3zsbksqROzwTYu3vZgZLpYlgF2RLtZmYzccIpydS5bW1dxtyM5BUystjURa3zNd
	GeWcEmrKA13Y1LZdak82SR9P5ZyjV6/T87JHoSBNiUpKXhUT21v3toaF5Wrml1VmaI7W4EWwWlhcC
	TR8XvPewspBnJEWBVNRJ127YGHPkYBcKTMvycTtE6NdXK+snQ1HdvBjk/FkGHhfHvKo5h58umYDPr
	fQvdfLUcDAfSZgsEJe4bFNJtVx0fm586mTfO+HBoz90cADRfWZuj/MkClqy2Xqj6P9cyPMStequvw
	H6AE4M1Q==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x77wU-000000099Qv-3ePL;
	Thu, 17 Sep 2026 08:58:07 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id AADFF300583; Thu, 17 Sep 2026 10:58:05 +0200 (CEST)
Date: Thu, 17 Sep 2026 10:58:05 +0200
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
Subject: Re: [RFC PATCH 00/12] FUTEX_PING: A stealable futex using Proxy
 Execution.
Message-ID: <20260917085805.GD2009045@noisy.programming.kicks-ass.net>
References: <20260917043339.2093426-1-suleiman@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260917043339.2093426-1-suleiman@google.com>

On Thu, Sep 17, 2026 at 04:33:24AM +0000, Suleiman Souhlal wrote:
> Hello,
> 
> This patch series adds a new type of PI futexes, PI Next Generation,
> or PING (name coined by Steven Rostedt) (but other name suggestions
> are welcome!), that differs from classic PI futexes in that they can
> be stolen from the top waiter, and use Proxy Execution instead of
> rtmutexes internally. 
> 
> The reason to allow the futexes to be stolen is that with classic PI
> futex's strict handoff to the top waiter, new contending lockers are
> now forced to wait in queue, which means that any locking operation
> now becomes a scheduling event. With stealing, a contending locker has
> the chance of taking the lock without blocking. The longer wait time
> of blocked tasks can be mitigated by forcing the lock to be handed
> off to them in a way that can't be stolen, when they've been stolen
> from too much, to ensure they don't get starved.
> 
> The use of Proxy Execution lets us also get Priority Inheritance for
> for fair tasks, which PI futexes don't really allow.

https://patch.msgid.link/1490204338-1856-1-git-send-email-longman%40redhat.com

Also, the goal is to eventually delete rt_mutex and have it be the
normal mutex, in which case the existing FUTEX_*_PI things will
automagically work.

So I'm thinking all of this is way premature.
