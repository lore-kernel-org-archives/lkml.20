Received: from mta1.migadu.com (out-231.mta1.migadu.com [95.215.58.231])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 390C95172D0
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 13:03:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.231
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791982997; cv=none; b=UMd46W2uZPCUqLSQ7mESDp4NmBn7u7ACECrNr53oz8LxKtUVitepvHySOavLRR5o6E72mk2HErDLtBGxD7mVdxYtzKVsdaF6KhVTN4/2GW7G5ZT7uqlFvzyWGJTYBl1WQMXuiaf4QSCeR1mYTse326DAXEDZS5PURFsQddH0+Y0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791982997; c=relaxed/simple;
	bh=khPlBD3AeZJg4/XaFgEOpdGn+ZT+ENWKvYv6fGgsH80=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sBNXUTmb8SeWXYrQN28g9SAJ0MqQtpr64166YCRwaGzVPvxUjoC/C8q7JjnwyAt91ako77vBCk4o1ivdz23rfyFV7UoIH7vWbbWyBpTqszFWW5QM7iFk0zrN7NhQ+SYl0gAb1x2MUgi+Lb62/QEQeqXsDRetYLzD9Qoequ6Hxgc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=wmZFQJD8; arc=none smtp.client-ip=95.215.58.231
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="wmZFQJD8"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=khPlBD3AeZJg4/XaFgEOpdGn+ZT+ENWKvYv6fGgsH80=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1791982990; v=1; x=1792587790;
 b=wmZFQJD8sh6Wg7d1Q9m3jiA9bQrfLWyxuwhAaRmWGbBhe0cILqBnOUC/7KiAIx76rc3rPiyF
 HUw9eXD2Ay004i5sOX66SRdpBL/ixTa8hOjVCPYDLsdthrEbD0BJjwe+A9/DoYl48p0xQ+5AD4b
 EbUdFrpjnQm3qx6Fad9QXG+M=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 4641c432dd9ea51d;
	Wed, 14 Oct 2026 13:03:10 +0000
X-Mizu-Trace-ID: 4641c432dd9ea51d
X-Migadu-Flow: FLOW_OUT
Date: Wed, 14 Oct 2026 21:03:49 +0800
From: Chen Yu <chen.yu@linux.dev>
To: Jemmy Wong <jemmywong512@gmail.com>
Cc: Chen Yu <yu.c.chen@intel.com>, tim.c.chen@linux.intel.com,
	Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] sched/cache: Remove the old cache group footprint on
 exec
Message-ID: <as99ta0PWAuYROp0@three-body>
References: <20261010111612.31345-1-jemmywong512@gmail.com>
 <aspT_A1vl-RwKmoP@chenyu-dev>
 <32BC7D58-C1C9-4B24-857B-7433F19606A8@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <32BC7D58-C1C9-4B24-857B-7433F19606A8@gmail.com>

Hi Jemmy,

On Wed, Oct 14, 2026 at 05:17:30PM +0800, Jemmy Wong wrote:
> 
> Hi Chenyu,
> 
> I've updated the patch to use atomic_long_t for grp->footprint, with
> atomic_long_add() for placement deltas and atomic_long_sub() when a
> task leaves the group through exec or exit.
> 
> The reason for removing the clamp is that the footprint aggregates the
> same contributions tracked by p->total_numa_faults. NUMA placement
> already applies each signed memory-fault delta to the per-node counters
> and the task total without clamping. A negative delta only removes half
> of an existing bucket, so normal decay cannot make the task's
> contribution negative.
> 
> With atomic updates preventing lost deltas, and each departing task's
> contribution subtracted exactly once, the group footprint should remain
> nonnegative too, assuming no overflow. Clamping would hide an accounting
> mismatch rather than correct it. The non-returning atomic add/sub
> operations also need no ordering against unrelated accesses.
> 
> I've kept your suggestion to update the footprint once per placement
> pass. Instead of maintaining a separate delta accumulator, the patch
> snapshots p->total_numa_faults before the loop and applies its net change
> afterward. This reuses the existing NUMA accounting and limits shared
> cache-line traffic.
> 
> There is one exception to the balance argument: if exec fails after
> switching groups but before task_numa_free() resets the statistics, exit
> can subtract the old total from the new group, where it was never
> accounted. That can make the new footprint negative. This group belongs
> only to the execing task, which is past the point of no return and will
> exit, so the mismatch does not persist in a surviving shared group.
> This version leaves the existing NUMA reset ordering unchanged.
> 
> Does using atomic_long_t without the clamp look reasonable to you,

Yes, your proposal to use atomic_long_add() is more straighforward.

> including handling that failed-exec case as described?
>

The failed-exec case is not a big deal IMO as that over-substract value will
soon disappear after the task exit.

> 
> +static inline void sched_cache_footprint_update(struct task_struct *p, long delta)
> +{
> +	struct sched_cache_group *grp = rcu_deref_sched_cache_grp(p);
> +
> +	if (grp && delta)
> +		atomic_long_add(delta, &grp->footprint);
> +}
> +
>  static struct sched_cache_group *sched_cache_replace_grp(struct task_struct *p,
>  							 struct sched_cache_group *new)
>  {
>  	struct sched_cache_group *old;
> 
>  	old = rcu_deref_sched_cache_grp(p);
> +#ifdef CONFIG_NUMA_BALANCING
> +	if (old && old != new)
> +		atomic_long_sub(p->total_numa_faults, &old->footprint);
> +#endif

The minor issue is that the goal of sched_cache_replace_grp() was to serve as a
helper for dealing with sched_cache_group pointer assignment, so we don't want to
interfere with its members' values, such as footprint. If you can reuse
sched_cache_footprint_update() in sched_cache_exit_mm() and sched_cache_exec_mmap(),
that would make the code cleaner for future maintenance. Do you have any reason
to keep the current form?

Could you please send a formal patch? I'll launch a test with your patch applied.
The only concern is that we convert the raw READ/WRITE_ONCE into atomic write,
which might impact performance.

thanks,
Chenyu
