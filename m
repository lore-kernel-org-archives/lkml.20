Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793906405;
	b=CIGqLlmv4ERq+Atik2M9RSY1SgotyCXGhTPmMbLEMxnbjmfAnj3CVjBCyFeOiGVGJUvw
	 3yiHbqPzBGaX/hYJIKdc2rVIYRRjipXccwkWAiHgipdSsPrAnszzoxpHhnMbYfaKzV+K4
	 M0yYolumH1KX4li2GwzujSl8lnKBt6Us4VptDm6wwJs2LBrDo1fd1362lslg8stlgSWt/
	 MDzH4IpDWi2l2JQp6BrQIEfXSnXHTxbgHm/CeFLtv7biRDc0QjTKczb4e25NFiy9fzaX+
	 9mkJmUx5tYazYnHs3hvaU9v06Jr1otJYd8C+Ahfn1D4cjPLhJCAOOE3FhL5KF4zbYRw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793906405;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=HB7eLNeB4olwGleSkQVJgSv/fqV2FHdO5bMIeP58zwM=;
	b=vipcPdapXL3Z7NIVTk3RfA+oGyH+ARYf2o9F/lXxXcn0QbGerJYry993rx/3sYTYEW49
	 SS2mYUNjTifAoQmyICqtam1yryl6AZg/4KUv/fdK70QLcENBEvdFbpO014PU8BsM7xrUb
	 Dgl2h1ADKoIoKNiD2EhXHSX6GicpFtFJc+V+OqNshqMRQyJaf4lyc7hSxvP+n3Fs+bukL
	 tFid3idLqn+AIth8pO+qd9T4xFmvluB9ANHOW8X3U59oiNCTDcjgzDQG0ucs6RkWabYOE
	 ZIbPc1HBw5YAyleaCTDafEXFT+5GtfIYWxD7DWdrTQC0VQXb34x6Hon0cvJCoCNvnqw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="ryjFp/MP";
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48341606D803
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 19:20:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 48341606D803
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ryjFp/MP
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a599e9110eso7918345e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 11:20:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793906403; x=1794511203; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HB7eLNeB4olwGleSkQVJgSv/fqV2FHdO5bMIeP58zwM=;
        b=ryjFp/MP8yoCegX77FoIlmXtbwF00NrgA2iKbYyio6q8HlsNeVCE7esRwFlmEvPysV
         WINAerjFBQ7VWs52yTt2cQYrRl8Gholz2hSV69c7np+f45Ei4O9wvqh0CrRTB8gHNVJE
         6tXr/XgkPRHOtc62HxADGMOReizpv9afHJpYEqAnjfMlkTScw8Knyz2PKKQNhtUGh2Q8
         SzuzUolNEjn7FbtMgX/L0pDA4o0LO6iyfy6Umck85zJr18POZLKDJc1RLCGs09G1coKv
         Gn+ARdIIWlHrLezc/ew959uoIbp7gdhCWbJwLSyOAyuohUbPlT0HB6InKIx/CPb5fSX+
         B00g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793906403; x=1794511203;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HB7eLNeB4olwGleSkQVJgSv/fqV2FHdO5bMIeP58zwM=;
        b=KswgyukwX4IjPAjTAwH7rygS29RLnwolN6IoEJ98yR1XjFMRgh28MgcwHqC6V0Xita
         SvgsQlfp+NzeZicYsUtoS4cmQtiXL3tenLwugs5fTE+doPNMdNJg/doX1ALNL+IaZKjT
         UnjXOwnw5pQbbQ4Gvl8nMxUiqmuYhHHRr4xgH4j6orcWWp4s8aNb+rc2tUJhHT15AJ3x
         E2NOoVhpfKs4kkFATTOcQHzazsu5Kz6lWZDsmtKPSXTdWv/XwqV37l5GyfsdMYarUQof
         ggAwqP4kMBtARotMW3DUxNToRcunnKOS9waS4U+t5/oTzGb2o55yrQUn8clZIeDqCixs
         K1iw==
X-Forwarded-Encrypted: i=1; AKwUvByaPpo3lhba/g5yiurBd7x6Qnc/soNWZPR2VwBRCSLCr6oh7Uq8l+4tHr2EzPn0nwKqp1HYtL6Jk5iCz3E=@vger.kernel.org
X-Gm-Message-State: APuU4Z/CBluil8EHpunUUyx8CiTWsJnW6IOWcTm+C526m2EcFA1ZTKv1
	aK+wsCMhCw7ZEISKPlC8LTFO9u0Ud2UtfNBVC3MdWgGVmjn46z4sXCAc
X-Gm-Gg: AYBFou05Ql+rgac84Ar4HvCFDV3fgjq/B8D/Q4IHYbLBhjIvxGPdkC2cFOmXcM7l0od
	zQPn958dSuJGpwEH3GFMoQA6haLOkYNPYckWrgHOhXvr0tiR6iuLwsEN8qVRRsYRLaxP/B52xyM
	Tb/JQg0rv+Xr2m07FgiOUv6pbTbfRDIGe9CQdBu/MolpUupcWNQtppbk4MvdRwcD5nU0Oj0n++T
	o9pMk953AltFTUjcFa21mNIKI2oM/FvFyzC+b7teB0TEuqd4RBCHlSFYsc44UlmCJz21MsM2HDI
	N5mJ+lHc0czjftCB0n1+TZepa94hgEvWZ4argkn++E4+ILpg4GCWCmuhRax/3Lo9wqt0AvFvzs5
	Z8SsmwT0Ik5z1mfg5I6jemU/jA08CNldNeQnmmMneJfC8jABmNkHED1o6+M1jzkZFFkLp7l7+gw
	EW7nd+UAcYQjasEcF/bm5l9TFEkBoqLwNv6QGOHzcnAkYsHwpxcJywKfY6EKjC71F4ypC0knkgt
	U2bEOypvkqRDG4CbbtdFhiYBVGtUrVGDDH0/SMipSRhQ+6INVzxk1XI9DAKM27pJYT9zlPC0KSK
	AIEZis/AKoOFrXLuCl/68Ycpv2vbdNZw0DokvaK4eT0TuPLPxg==
X-Received: by 2002:a05:600c:c111:b0:4a1:e015:6441 with SMTP id 5b1f17b1804b1-4b6d8a63e17mr2048925e9.0.1793906403295;
        Thu, 05 Nov 2026 11:20:03 -0800 (PST)
Received: from scheduler.schedules ([85.100.66.184])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b56e58fcb8sm81401105e9.1.2026.11.05.11.20.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 11:20:02 -0800 (PST)
Date: Thu, 5 Nov 2026 22:20:00 +0300
From: Kayra Cizmeci <kayracizmeci@gmail.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: mingo@kernel.org, linux-kernel@vger.kernel.org, juri.lelli@redhat.com, 
	vincent.guittot@linaro.org, dietmar.eggemann@arm.com, rostedt@goodmis.org, 
	bsegall@google.com, mgorman@suse.de, vschneid@redhat.com, kprateek.nayak@amd.com, 
	joshdon@google.com, tj@kernel.org, jakub@okonski.org
Subject: Re: [PATCH 2/3] sched/fair: Make cfs_rq::idle the sum of ancestor
 tg::idle
Message-ID: <auzB7x4lVcFmTVMs@scheduler.schedules>
References: <20261105165525.011876858@infradead.org>
 <20261105170157.616859418@infradead.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261105170157.616859418@infradead.org>

On Thu, Nov 05, 2026 at 05:55:27PM +0100, Peter Zijlstra wrote:
> Rather than keeping cfs_rq::idle as a copy of tg::idle, make it the sum of
> all ancestor tg::idle. This makes it trivial to tell if the current cgroup
> is marked idle somewhere along its ancestral path.
> 
> This makes se_id_idle() behave differently. Notably is will now be true
> when there is a idle cgroup anywhere in the ancestor path. This
> addresses an issue where preemption of cgroup::idle was overlooked when
> flattening the runqueue.

How? The diff doesn't touches se_is_idle(). se_is_idle() just looks to
the policy for tasks:

static int se_is_idle(struct sched_entity *se)
{
	if (entity_is_task(se))
		return task_has_idle_policy(task_of(se));
	return cfs_rq_is_idle(group_cfs_rq(se));
}

And the issue in the preemption path is in the entity_is_task() path.

	cse_is_idle = se_is_idle(se);
	pse_is_idle = se_is_idle(pse);

	nse = se;
	/*
	 * Preempt an idle entity in favor of a non-idle entity (and don't preempt
	 * in the inverse case).
	 */
	if (cse_is_idle && !pse_is_idle)
		goto preempt;

	update_curr_fair(rq);

	if (cse_is_idle != pse_is_idle)
		goto update;



Or am I getting something wrong?


> 
> Fixes: 85570f10a4c6 ("sched/eevdf: Move to a single runqueue")
> Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
> ---
>  kernel/sched/core.c  |    2 -
>  kernel/sched/debug.c |    1 
>  kernel/sched/fair.c  |   73 ++++++++++++++++++++++++++++++++-------------------
>  kernel/sched/sched.h |    4 +-
>  4 files changed, 50 insertions(+), 30 deletions(-)
> 
> --- a/kernel/sched/core.c
> +++ b/kernel/sched/core.c
> @@ -8970,7 +8970,7 @@ void __init sched_init(void)
>  		rq->nr_running = 0;
>  		rq->calc_load_active = 0;
>  		rq->calc_load_update = jiffies + LOAD_FREQ;
> -		init_cfs_rq(&rq->cfs);
> +		init_cfs_rq(&rq->cfs, NULL);
>  		init_rt_rq(&rq->rt);
>  		init_dl_rq(&rq->dl);
>  #ifdef CONFIG_FAIR_GROUP_SCHED
> --- a/kernel/sched/debug.c
> +++ b/kernel/sched/debug.c
> @@ -1090,6 +1090,7 @@ void print_cfs_rq(struct seq_file *m, in
>  	SEQ_printf(m, "  .%-30s: %d\n", "h_nr_runnable", cfs_rq->h_nr_runnable);
>  	SEQ_printf(m, "  .%-30s: %d\n", "h_nr_queued", cfs_rq->h_nr_queued);
>  	SEQ_printf(m, "  .%-30s: %d\n", "h_nr_idle", cfs_rq->h_nr_idle);
> +	SEQ_printf(m, "  .%-30s: %d\n", "idle", cfs_rq->idle);
>  	SEQ_printf(m, "  .%-30s: %ld\n", "load", cfs_rq->load.weight);
>  	SEQ_printf(m, "  .%-30s: %lu\n", "load_avg",
>  			cfs_rq->avg.load_avg);
> --- a/kernel/sched/fair.c
> +++ b/kernel/sched/fair.c
> @@ -15594,8 +15594,10 @@ static void set_next_task_fair(struct rq
>  		hrtick_start_fair(rq, p);
>  }
>  
> -void init_cfs_rq(struct cfs_rq *cfs_rq)
> +void init_cfs_rq(struct cfs_rq *cfs_rq, struct cfs_rq *parent)
>  {
> +	if (parent)
> +		cfs_rq->idle = parent->idle;

AFAICT this creates a race:

Let's say we are creating a group under GA named GB.

We first call sched_create_group(), that calls alloc_fair_sched_group()
and that calls init_cfs_rq(). If the parent groups idle state changes
before GB gets into place in something like this:


* GA is not idle GB idle = 0

* GA gets idle in the window

* GB setells in

* GA then gets idle = 0 again


Now this happens:

GB idle = -1 and GA idle = 0.

So below, in tg_set_idle_up() the code things something changed and
h_nr_idle starts to corrupt.


Or am I missing something?


>  	cfs_rq->tasks_timeline = RB_ROOT_CACHED;
>  	cfs_rq->zero_vruntime = (u64)(-(1LL << 20));
>  	raw_spin_lock_init(&cfs_rq->removed.lock);
> @@ -15646,7 +15648,7 @@ int alloc_fair_sched_group(struct task_g
>  			goto err;
>  
>  		se = tg_se(tg, i);
> -		init_cfs_rq(cfs_rq);
> +		init_cfs_rq(cfs_rq, tg_cfs_rq(parent, i));
>  		init_tg_cfs_entry(tg, cfs_rq, se, i, tg_se(parent, i));
>  		init_entity_runnable_average(se);
>  	}
> @@ -15780,6 +15782,43 @@ int sched_group_set_shares(struct task_g
>  	return ret;
>  }
>  
> +struct tg_set_idle_struct {
> +	long idle;
> +	int cpu;
> +};
> +
> +static int tg_set_idle_up(struct task_group *tg, void *data)
> +{
> +	struct tg_set_idle_struct *tsi = data;
> +	struct cfs_rq *grp_cfs_rq = tg_cfs_rq(tg, tsi->cpu);
> +	struct sched_entity *se = tg_se(tg, tsi->cpu);
> +	int old_idle = grp_cfs_rq->idle;
> +	int task_delta;
> +
> +	grp_cfs_rq->idle += tsi->idle;
> +
> +	if (!!old_idle == !!grp_cfs_rq->idle)
> +		return 0;
> +
> +	task_delta = grp_cfs_rq->h_nr_queued - grp_cfs_rq->h_nr_idle;
> +	if (!task_delta)
> +		return 0;
> +
> +	task_delta *= tsi->idle;
> +	for_each_sched_entity(se) {
> +		struct cfs_rq *cfs_rq = cfs_rq_of(se);
> +
> +		if (!se->on_rq)
> +			break;
> +
> +		cfs_rq->h_nr_idle += task_delta;
> +
> +		if (cfs_rq_is_idle(cfs_rq))
> +			break;
> +	}
> +	return 0;
> +}


Cheers,


Kayra :-)
