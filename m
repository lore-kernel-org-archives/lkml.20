Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5183955D896
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 13:14:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788959672; cv=none; b=PeJxP3i2atw1eTuwUWjnz7XrG6PgDp8uRB77Qwe1hd4qS60PebEbn3ZkwLYmqQdsm0+GqPutb9gd3sZHsGxVjGoArmLShXvxSqhqmW4jx+u06X7p1R3hVh1mlL/7ZLr+pXxpgI8ZmY/wprbQ/CLjmZdmwDZhcSx7/QNZkXh/k48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788959672; c=relaxed/simple;
	bh=o14skGXw1Dxp4PucfILVhMa2vKoRpn9E2Tqf7ERODZ0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hEmpiIIzLs+nuQHrIqWYtA8x4mlu4lBUoHKXDilQXp72GQGCnwRoEin1MHFZKvwSungXEwD6ig0nrP9m/83Qa3aiO2MQNyG4sf8/ST+vncH7paJQcKoAd3/4ubu8+2PRdFvDdeA7tgnBijBkPorPbff7rbr9Mzmztf6ib8LNoYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=ihU8Daeu; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="ihU8Daeu"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=hZDvF9mi528xRDbkT0RZ9EfBD5t2cfkdz03k0WhiM1U=; b=ihU8Daeub9rsgC1qoX+WTtPoIy
	fGW9+56Jy0DAiYbKW589aYu0OIa8wTURggq0eNPMRoX8muggfbLlyQlrrWnA0AutBp41VzdycKmya
	p5KekcJHKana4W7F0pztyJ/xLJquUhIZOs2eoyCK8f6qgL6f5U5O8AAH7fhBjQTXvcwA/9QJh4sbP
	ZKr1fIVcF3l2vKVVzhnrB7Dl6Y5CH9hiDua1q0T3OmOsa4uka9s+SEmDDrtJ2AzLLcynG+dkXYthQ
	cKe13jtbaMTSWiHQHnWtckUCozHf+m8GSKgOjYdZ7kleKAwnm2Qmf2D/Jhyjsw1RvS8LJOuDQ8VAz
	8NV7IfcQ==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4I80-00000005gw5-13Hn;
	Wed, 09 Sep 2026 13:14:18 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id C8588300A9A; Wed, 09 Sep 2026 15:14:15 +0200 (CEST)
Date: Wed, 9 Sep 2026 15:14:15 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Andrea Righi <arighi@nvidia.com>
Cc: Ingo Molnar <mingo@redhat.com>, Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Christian Loehle <christian.loehle@arm.com>,
	Shrikanth Hegde <sshegde@linux.ibm.com>,
	Phil Auld <pauld@redhat.com>, Breno Leitao <leitao@debian.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 0/2] sched: Enable preferred SMT siblings on NVIDIA
 Olympus
Message-ID: <20260909131415.GB4120091@noisy.programming.kicks-ass.net>
References: <20260909062649.469633-1-arighi@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260909062649.469633-1-arighi@nvidia.com>

On Wed, Sep 09, 2026 at 08:26:07AM +0200, Andrea Righi wrote:

> Andrea Righi (2):
>       arm64: topology: Prefer PE0 on NVIDIA Olympus SMT cores
>       sched/fair: Honor asymmetric SMT priority in idle selection
> 
>  arch/arm64/include/asm/topology.h |  1 +
>  arch/arm64/kernel/smp.c           |  1 +
>  arch/arm64/kernel/topology.c      | 51 +++++++++++++++++++++++
>  kernel/sched/fair.c               | 85 +++++++++++++++++++++++++++++++--------
>  kernel/sched/sched.h              |  6 +++
>  kernel/sched/topology.c           | 36 +++++++++++++++++
>  6 files changed, 163 insertions(+), 17 deletions(-)

I tentatively picked these up, but I need an arm64 ack before I can
merge them, and ideally vingu will bless them too :-)
