Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=90.155.92.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794480991;
	b=O98KzOOd8goMLMCV948oy1JO4+zPc6DXjK7ggV3ikgOQZ9VnnQdmR0Zizgomog1GUJKE
	 8n4M/qFcVVl3+sAlIi+/lDD+Or35pZZMU0tTS4HG3EDZsCPowrBb4KTR3vMEzgh/Wao/Z
	 vdWcccbYWpUnZno9aJrm9W7YppjBloiwcWVGd3Vg5JkntPTiyrrUwU2xSK1oA6jR1LU2A
	 mvEaU/0AoNUF1y8J7pEw73YMOR9blRT3kgESFK6dHPJeOiX/c8xdUupDgQcozbMiSHzAH
	 eH6OHQhgTuns2U4KYe3ef/XHSr3ev0LomBPH+zgkRwLbIkV0gTLfIdU8zO6ZImTvtpw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794480991;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=KCo8Qlmn/2+C+uMj43DMnRWaevfzJkszOGCL93tK9P0=;
	b=qSA/nR13lVFYcNS5HrNF6hDBEKHoNbiMJbrQMjYadZJaFGllUW9kzmhTQ5JtpqCuALkO
	 A6bjK2oC6Y8volug1aLKqdaJ9I6K1ZbiWDmyvqlz0ZvLwzgQ2eNItzlqoQs0HlLmdaoO7
	 oCJvvVk8C0yoawE6zS6AN0qxvGTvlM0HhJVrXwd7XbOOhdIg8b2zobeeeaHT2od61tVgw
	 cQq2RYmAY9IRTIIl3K9zEspc0DzhUjNwhubbT0mziClUybIeVYvfQqSC2G5/pTxDxE1MV
	 NDCSiF+8UsZsaIonPBBmjqiqGzow9QKpJcoNJIsGp73HXPZlnkiNJCFum5gn5ZVxjew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=infradead.org;
	spf=pass smtp.mailfrom=infradead.org;
	dkim=pass header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=XFP6shXp;
	arc=none smtp.remote-ip=90.155.92.199
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C33A7606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 10:56:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C33A7606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=XFP6shXp
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=KCo8Qlmn/2+C+uMj43DMnRWaevfzJkszOGCL93tK9P0=; b=XFP6shXpg4c1I447/LkDftO/OA
	rDOfbp59dF/wmdUBpET9AZJtVGc7v2mIrG/SOREqkKiF5m6KEfQWXEngHy80bIsPZRFbhgBj7hd4Y
	J2x0L5trkYo8clK2+TeyqzwGf9021UcjgjNI4Buzshnaa/JdUIfmtDcEyKAEH7Kpanw+MNHr/eZGg
	uUgHjiLqXYsqTYI8RJiqfyFfz00dpUhl4k3+J4RTEtDphZcMMKOffV/v6bCzkOKqiqzlcPVdFOd8F
	Uzc/KXzPvxy1E3ulPALmlhlpO3p3dDIlRzadD+Z1yjafcmDLrEP40x7gexdykAswEeH6hPz7ceJdS
	HoLK9pCA==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRSTh-0000000ADgA-3ARP;
	Thu, 12 Nov 2026 10:56:25 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 4698A300882; Thu, 12 Nov 2026 11:56:24 +0100 (CET)
Date: Thu, 12 Nov 2026 11:56:24 +0100
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
Message-ID: <20261112105624.GM2668804@noisy.programming.kicks-ass.net>
References: <20261111-bug-sched-fair-offline-active-v1-0-4f54523c5a70@linux.dev>
 <20261111-bug-sched-fair-offline-active-v1-2-4f54523c5a70@linux.dev>
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
In-Reply-To: <20261111-bug-sched-fair-offline-active-v1-2-4f54523c5a70@linux.dev>

On Wed, Nov 11, 2026 at 08:24:21PM -0500, Qiliang Yuan wrote:
> rq_online_fair() calls update_runtime_enabled(), which walks every task
> group and takes each group's cfs_bandwidth lock to copy its quota state
> into the CPU's cfs_rq. A sched domain rebuild reaches it for every
> active CPU through rq_attach_root(), with the rq lock held and
> interrupts disabled.
> 
> The walk only matters when the cached state may be stale. While a CPU
> is online, tg_set_cfs_bandwidth() updates runtime_enabled on it under
> the rq lock, and it holds cpus_read_lock() so it cannot miss a CPU that
> is coming up. Only unthrottle_offline_cfs_rqs() clears runtime_enabled
> behind its back, and a CPU that has never been online has not been
> visited at all.
> 
> Track this in a per-rq flag that update_runtime_enabled() sets after
> the walk and unthrottle_offline_cfs_rqs() clears, and skip the walk
> while it is set.
> 
> With 4000 cpu cgroups on a 32-CPU VM booted with rt_group_sched=0,
> switching a 4-CPU cpuset to a partition root and offlining or onlining
> one CPU take (median of 20 partition switches and 16 hotplug operations):
> 
>   operation         before (ms)  after (ms)  change
>   partition root           7.68        1.21    -84%
>   cpu offline             30.96       13.44    -57%
>   cpu online              28.48       12.82    -55%

How do you end up with 4k cgroups ?!? That's wild.

Also, why do you care about the rebuild performance? I'm not entirely
sure it makes sense to add data for something that 'never' happens. Do
we really need a new member variable for this?

> Signed-off-by: Qiliang Yuan <qiliang.yuan@linux.dev>
> ---
>  kernel/sched/fair.c  | 11 +++++++++++
>  kernel/sched/sched.h |  2 ++
>  2 files changed, 13 insertions(+)
> 
> diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
> index e245a31b0544e..e2f67bdc3031e 100644
> --- a/kernel/sched/fair.c
> +++ b/kernel/sched/fair.c
> @@ -7798,6 +7798,15 @@ static void __maybe_unused update_runtime_enabled(struct rq *rq)
>  
>  	lockdep_assert_rq_held(rq);
>  
> +	/*
> +	 * tg_set_cfs_bandwidth() keeps runtime_enabled up to date while the
> +	 * CPU is online, so only the first activation and the one following
> +	 * unthrottle_offline_cfs_rqs() need the walk.
> +	 */
> +	if (rq->cfsb_runtime_valid)
> +		return;
> +	rq->cfsb_runtime_valid = true;
> +
>  	guard(rcu)();
>  
>  	list_for_each_entry_rcu(tg, &task_groups, list) {
> @@ -7816,6 +7825,8 @@ static void __maybe_unused unthrottle_offline_cfs_rqs(struct rq *rq)
>  
>  	lockdep_assert_rq_held(rq);
>  
> +	rq->cfsb_runtime_valid = false;
> +
>  	/*
>  	 * The rq clock has already been updated in the
>  	 * set_rq_offline(), so we should skip updating
> diff --git a/kernel/sched/sched.h b/kernel/sched/sched.h
> index 1d76950dbb0a1..1a73383204384 100644
> --- a/kernel/sched/sched.h
> +++ b/kernel/sched/sched.h
> @@ -1412,6 +1412,8 @@ struct rq {
>  #ifdef CONFIG_CFS_BANDWIDTH
>  	call_single_data_t	cfsb_csd;
>  	struct list_head	cfsb_csd_list;
> +	/* cfs_rq->runtime_enabled is in sync with the quota of every group */
> +	bool			cfsb_runtime_valid;
>  #endif
>  
>  	atomic_t		nr_iowait;
> 
> -- 
> 2.43.0
> 
