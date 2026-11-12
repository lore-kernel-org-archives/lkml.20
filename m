Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=90.155.50.34
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794488393;
	b=ZiLuG4yxuUkeUl6kbPBDD5BXWAf8t8xKocMTwPG7sT9Plzbq5D+uc4uFaf1hnrs3gd5L
	 8XztcBYdXpOxcTQ8j9NAkiro1LmiT/aoR3YZncVjykrzjgrwzGJCVhdYcN5qLE7UZO3fz
	 gKYqp/+fAoR3a8j3Ln3ZFFAPBGx08rU7IZhC4NE4FpQs8bA95e9tfqsbj1yyxDEbqFfXq
	 mCiklD0+ZgtuowFOoiXVkQrvbxGHNjIgyGB6SfJsCNOBA/y6Xtm8/GjFk0/QWuk6l+XS3
	 9ElCYenVN9wru3fBi5KpwfYnTKtgIZbNpA+PTrW6lo0of4Vw2fVltynv6HwdvgKi92Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794488393;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=G4r2wE/WPOl4l57k5noCae0ixFFRvEEiHTkO2rapLoY=;
	b=1kiL4m5t4dI4dVJ0HvqITjGxNNsTOeQjuJYLXrGuyhzRXQK6duRhO1b7fxZCzqSL/fW/
	 53VZCtCWS92jg/6z83rjqpJcDKzJm1kNJ8cPc3w4+EccN3PjM03yatQZ9c0cesDTsWH0a
	 WKBEFCGoeTud07MwxnqNvQ0i08qszf3BuNvfsNP1UCw5EeVQkZOM3eUiD9opQcyhHlrSx
	 v9fv1E0nVVlOMfEedZeNK1odiqTXZe18jKvrqlFZxnMUbXoqZnICQGpmbv5jsICpYH9eC
	 cfW2fynY5/d7XlBcE3PUG8bSvBY/dJxf/4G2DryULjuMdLVer59jdRefuRDJgG2x4wg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=infradead.org;
	spf=pass smtp.mailfrom=infradead.org;
	dkim=pass header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=qKbKtWHN;
	arc=none smtp.remote-ip=90.155.50.34
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFE05606A889
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 12:59:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CFE05606A889
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=qKbKtWHN
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=G4r2wE/WPOl4l57k5noCae0ixFFRvEEiHTkO2rapLoY=; b=qKbKtWHNJbJAQ1Om4NgemPPDkb
	aPJkkAndiJXnLsfCoTYkqQ+GTnr5VAsZtfvmrw/kUNZGd8DQEtI3MSD8VEWLMyoHhGY1g/NVa4Ez/
	1cg6iaDP+/Rclma3rfP5K8gu6TqaP5eWUa2nm0ffgDdeQEohHBopi2yxRkXpw1nQSV9MnI2RZMI05
	lO5NXOBMBeo1g691X4Ju32/I4/gPq9SdvqCnvAC9CLvWslainLuIwHB7cTlC5vxaq/OvRKC2DqsS+
	SY3iqzY6Pz8m/TOIZYfpPVhschO86Z7QBRHiIkbW0BHIgs6d1rodsgCm9XfqjwCF2vKT9L/zckpt0
	SGW+M+aQ==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRUP6-00000007PgF-0gke;
	Thu, 12 Nov 2026 12:59:48 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id B8E75300882; Thu, 12 Nov 2026 13:59:47 +0100 (CET)
Date: Thu, 12 Nov 2026 13:59:47 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Qiliang Yuan <qiliang.yuan@linux.dev>
Cc: Ingo Molnar <mingo@redhat.com>, Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] sched/fair: Avoid re-syncing runtime_enabled on root
 domain changes
Message-ID: <20261112125947.GZ1813469@noisy.programming.kicks-ass.net>
References: <20261111-bug-sched-fair-offline-active-v1-0-4f54523c5a70@linux.dev>
 <20261111-bug-sched-fair-offline-active-v1-2-4f54523c5a70@linux.dev>
 <20261112105624.GM2668804@noisy.programming.kicks-ass.net>
 <20261112111055.400697-1-qiliang.yuan@linux.dev>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261112111055.400697-1-qiliang.yuan@linux.dev>

On Thu, Nov 12, 2026 at 06:10:55AM -0500, Qiliang Yuan wrote:
> On Thu, Nov 12, 2026 at 11:56:24AM +0100, Peter Zijlstra wrote:
> > How do you end up with 4k cgroups ?!? That's wild.
> 
> It is common on hosts running AI agent harnesses: every agent sandbox
> gets its own container, and each pod and container has a cgroup with
> the cpu controller enabled, so a single kernel easily carries over a
> thousand task groups. 4000 is the upper end of that, picked to show the
> scaling.

*groan*

> > Also, why do you care about the rebuild performance? I'm not entirely
> > sure it makes sense to add data for something that 'never' happens. Do
> > we really need a new member variable for this?
> 
> On those setups it is not rare. Agent harnesses and KubeVirt both
> hot-add and remove vCPUs at run time to follow the load, and every
> hotplug rebuilds the sched domains of the guest.

So CPU hotplug is a slow path; there's nothing that's going to 'fix'
that. If it hurts, its one of those things you need to stop doing.

> A rebuild runs rq_attach_root() on every active CPU, and with the rq
> lock held and interrupts disabled it walks all task groups twice. 

Right, that is a bit daft. It should be relatively straight forward to
make that one loop.

> With 4000 cpu cgroups on a 32-CPU VM, one rq_attach_root() call takes
> 188 us at the median and up to 938 us, against 2 us with both patches
> applied (20 partition switches, 1280 calls). So every rebuild leaves
> each CPU with interrupts off for close to a millisecond in the worst
> case.

Not ideal, but again, you did do hotplug so you get to keep the pieces.

> The member is there because rq_online_fair() can't tell a rebuild from
> a CPU coming up: the CPU is active in both cases, but only the latter
> can have runtime_enabled out of date after unthrottle_offline_cfs_rqs().

So the actual hotplug code obviously knows. It should be fairly simple
to add a boolean argument to both functions and set the right value in
rq_attach_root() and sched_set_rq_{on,off}line() respectively.


