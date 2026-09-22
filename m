Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D954D5372E4
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 10:55:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790074548; cv=none; b=t8fgavR4yHp16jIJlQCA+W69MbmiVATK+Bl9QpMexyWPCevknZ0p+18KO/Xk/QIBo32nHR9ZJJ9lyX3ey5CHtE+ShFmsNUhsnRY6P+dkEmxWw9C+8P+ZgPU6FtDgB1FztJtq16ChujEMFzPXCFSNGj2s555g5DcmVVXAvrj6hjw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790074548; c=relaxed/simple;
	bh=3mZLwBmMEmyiS9+0pCUX6SwxzZuh8HcwZNSHLmkrGJI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V4HgWm2dIUDj8IUg7X2w8mbQb2Vft+fAKMZ+d9dobfchm/VTFz/1a/Yjysr7IU85kN52Z++Zr21MH3dJDK7+dLs68VqsGXvBLqMNQGnlzs5LWKOxCicSy4YE5Ofv7wwRNlboKcwUqS2EvTDy9hGDPVlg15tVH9gzFAHrDktBztQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=Ap7pJQB7; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="Ap7pJQB7"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=LgOPdUWQbWLix5MT29lnjzH/ydA94ciUFQ6JGqmnyHk=; b=Ap7pJQB7eFtICditLEGAvpMFGA
	KCdhzR9UE2o+S0JoR7fTgcu8N3NfGBhce2FM1jDd5FGioSrt9WUN6OuphiULiiBXvRCKNnulFi8mT
	1W0V6zgw3fiUUGVbyU+WD87+KVNPsUBBHQUb8VgADfHYzC7iCKDXxT6iBTNU7AWCDuck5bsRiDAmD
	CWsiJES3ExEF29UXS4EO2j8waf9SAzWjeyrDDCxbFQKWN6P+mRAnw+r4E2DvglipK0ILDXBRxV0Cs
	mQfEbc7cMzo+WiBCkfpt+dwzLp/Q/b9ntnW31NcGjmn09fewOU4Au26TYmc2fB6tUFSB6EuETpUNg
	68YSzReg==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x8y9j-0000000DSvi-0zua;
	Tue, 22 Sep 2026 10:55:23 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 453DD300708; Tue, 22 Sep 2026 12:55:22 +0200 (CEST)
Date: Tue, 22 Sep 2026 12:55:22 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: albin_yang@163.com
Cc: mingo@redhat.com, juri.lelli@redhat.com, vincent.guittot@linaro.org,
	dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com,
	mgorman@suse.de, vschneid@redhat.com, kprateek.nayak@amd.com,
	chen.yu@linux.dev, kayracizmeci@gmail.com, mintaohuang@tencent.com,
	linux-kernel@vger.kernel.org, albinwyang@tencent.com,
	Chen Yu <yu.c.chen@intel.com>
Subject: Re: [PATCH v3] sched/stats: Fix run_delay over-count for migrated
 sched_delayed tasks
Message-ID: <20260922105522.GO1837346@noisy.programming.kicks-ass.net>
References: <20260922082432.2987855-1-albin_yang@163.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260922082432.2987855-1-albin_yang@163.com>

On Tue, Sep 22, 2026 at 04:24:32PM +0800, albin_yang@163.com wrote:
> From: Wei Yang <albinwyang@tencent.com>
> 
> With DELAY_DEQUEUE, a blocked task stays on the runqueue with
> se.sched_delayed set and its sched_info.last_queued is cleared, so the sleep
> is not counted into run_delay.
> 
> When such a delayed (sleeping) task is migrated across CPUs via the plain
> migration paths (move_queued_task / move_queued_task_locked, the latter used
> by __migrate_swap_task), activate_task(dst, 0) calls enqueue_task() without
> ENQUEUE_RESTORE, re-arming last_queued to the migration timestamp while the
> task is still sleeping. The later real wakeup (ENQUEUE_DELAYED) tries to
> re-arm last_queued at wakeup time but is suppressed because last_queued is
> already non-zero, so sched_info_arrive() folds the whole sleep duration
> between migration and wakeup into run_delay.
> 
> Load balance is affected too: the sched_delayed check in can_migrate_task()
> bails out only when env->migration_type != migrate_load, so it does not
> block migration when the type is migrate_load - which active load balance
> always uses (its lb_env leaves migration_type at 0 == migrate_load), and
> which regular load balance can also use via calculate_imbalance(). Either
> way the re-attach goes through attach_task() -> activate_task(rq, p,
> ENQUEUE_NOCLOCK), without ENQUEUE_RESTORE.
> 
> Fix by not re-arming last_queued for a sched_delayed task in
> sched_info_enqueue(). The wakeup path clears sched_delayed before reaching
> sched_info_enqueue(), so it still re-arms at the real wakeup time. Plain
> runnable tasks are unaffected.
> 
> Fixes: 152e11f6df29 ("sched/fair: Implement delayed dequeue")
> Reported-by: MingTao Huang <mintaohuang@tencent.com>
> Signed-off-by: Wei Yang <albinwyang@tencent.com>
> Reviewed-by: Chen Yu <yu.c.chen@intel.com>
> Reviewed-by: Kayra Cizmeci <kayracizmeci@gmail.com>
> Reviewed-by: K Prateek Nayak <kprateek.nayak@amd.com>
> Tested-by: K Prateek Nayak <kprateek.nayak@amd.com>
> ---

>  kernel/sched/stats.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/kernel/sched/stats.h b/kernel/sched/stats.h
> index ebe0a7765f98..dc626f99ffd9 100644
> --- a/kernel/sched/stats.h
> +++ b/kernel/sched/stats.h
> @@ -290,7 +290,7 @@ static void sched_info_arrive(struct rq *rq, struct task_struct *t)
>   */
>  static inline void sched_info_enqueue(struct rq *rq, struct task_struct *t)
>  {
> -	if (!t->sched_info.last_queued)
> +	if (!t->sched_info.last_queued && !t->se.sched_delayed)
>  		t->sched_info.last_queued = rq_clock(rq);
>  }

Will we not have a similar problem with proxy exec? That is, would
t->is_blocked be more appropriate?
