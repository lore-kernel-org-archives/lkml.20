Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793876399;
	b=TMFOaRtqrwDES/L0ynT7eJTxMw9DD6OCiFWPuQvzSPVYQyPgrVxyM5fRnyPTAAM29my+
	 Bir/hBrIBWFMaVLetDolfT0BaBzkz8t4SPdzFiO/sOToFTAiBHH54fk3wSzSx4eJDo/a7
	 TXt0CpLscWOdpM+CTQWDQsjdjhU4mQ8O7flyo4cRSXWrwtIxmv5ReaVg9JbrYyKWnoMIR
	 5s3QQ+071vNRF6xCcrEacAYuylRIdqN+HlGxutGvXq2XTnXSY1JpYTIp78R9q4ws9Hd7Z
	 FFPvmMq1m3Pfu9CejmiXq4LbgUw6oR5Mo9lF4/hxoaHyb2+GNKmGXN4DPEHalpzb53A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793876399;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=Oek9BHm9kE/i/pAixALrJCjyIzhOnrADlEzuRw14Asc=;
	b=VURS23DqOZ8KUqRBGqlkzWEsNDjeo/MV+SEJnsvR0srwfarc3Cf5od9KWkVzhIt61MWp
	 Ffc5dzHu12wbmQHGNFKmopcVMpfKdDZyd4oNgczJADQw7GAss1ULhzvIl+edxq04sylCt
	 hFMGmmD9iL1zrWquAXJWL89+WY4HUsqSSBfIiiKHif3EfMhm1GpttNstVXzA3igsWkHcX
	 anSmsG4WkXLUu85PJ354mHmw0oSyjRQOYtkm1GopWHG3JrFCOAtVKj56M2S/G+O8TlJeJ
	 V49JuNFWkItLw0j2MTVvvUtHAHiqfeXeBEv4dR7RVp82lwPIUzay3qCkxjRg++qkQDw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=cekl2FdR;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=gZiczuIE;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88323606A330
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 10:59:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 88323606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=cekl2FdR;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=gZiczuIE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793876397;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Oek9BHm9kE/i/pAixALrJCjyIzhOnrADlEzuRw14Asc=;
	b=cekl2FdRYSxDVWLaO2b5rc50UWb6AchPKYdj2MEADONAaBAUywzaUJe4b+XQ3ahnO2gfjO
	z7A1UwQC8qsZPnykQfOhs24VPtHeg3p7E+MtQ2nv8NKyohBJG1ol1CSCuCcXwyxQ+q0lsf
	EwM8RTrCjVTARyYfV9zP6xxEL4TqWKc=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-401-zzUgAjzoNeu5w2nu7UDL7Q-1; Thu, 05 Nov 2026 05:59:56 -0500
X-MC-Unique: zzUgAjzoNeu5w2nu7UDL7Q-1
X-Mimecast-MFC-AGG-ID: zzUgAjzoNeu5w2nu7UDL7Q_1793876395
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-490ed502749so754321f8f.2
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 02:59:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1793876395; x=1794481195; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Oek9BHm9kE/i/pAixALrJCjyIzhOnrADlEzuRw14Asc=;
        b=gZiczuIEW2yUUWdrcRC4doXHKTnqUbq4594ohoQ04aWzVwkVJJFmci0C9jmcUwoSzt
         PFyhfph+AzZlOOIn+OK5F9E5EbiT5hy0BsH5HX9EjSttOscmpMOt91rbv9mkyXyX0ADG
         u9DXBqqsjZ9i9SNGWUIiFTgH0j/uG9lbB9sl2ARY4TkTmOyEAyW8mWQ2m4UB8KpZZ0aJ
         rJUDHf6zC3gx9B0F5qqRtfcbPXo73n8tzCGmQPWedtPuKMcnIJfQECdTRfw7bwErTyPM
         2hy/x0etXMhY6dGYipNB6J042Dv36ssXVIJCr92EulQJOiXW67Dc9I+naEJyA5HStQ3M
         lkow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793876395; x=1794481195;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Oek9BHm9kE/i/pAixALrJCjyIzhOnrADlEzuRw14Asc=;
        b=nbJkuO4smklkfw7eYL2FEhyQeN4kXuDIrOSjvSCVBhY6ftclS9E02YAZH1BrbjYkq6
         /Olo4OZzhKDB8rbL/g5mItAts+onGg5KiJ7yo5QzGSC3J3sDQOm/c7DbXwcTN+a0bJqE
         lxTVbXGEtJTgptowhCjYjdLWeBE+/vavhb7HDnYUwKJ9cp7YRywXNsA4lfflt+9sD1xS
         Tt8pOyeN2joGvvJP0njVKOb7SGY6SylApwzACZ0OPawdOFQptgnu+WPLVBA7yM7sVXy0
         QFPJAx8mVs4Eik5H9OMBkQElpW/etcHdrUsQ5hPEoHaSDBLEn0l5AcPCAQf5LBnKGaH4
         f17w==
X-Forwarded-Encrypted: i=1; AKwUvByyeBi6Cd8iQqMlKEKGOxTIBMTy7RyFhSCNh6U9MNjw2wx/mNa09hxcICqKswWN3ALlvyZ2ZFqqtBpTDY8=@vger.kernel.org
X-Gm-Message-State: APuU4Z9j/dgHf2PIrTZmx6uafmRYVVn9cakdIwh2RlLwwnFLStFxJnnF
	xuyr23hW727/y3hjaNM0EV7jwX2KVh7n90yV1Enyo3MPT9N43T4uwl6k6tW3grEKYuBNLyjP+Wa
	057dGXDVrDGg2gks/hOxkn9iQuP44dCsxGXGfTriyEYB7vbS2T61aCeCJY4thXZuTJw==
X-Gm-Gg: AYBFou2YUWa6wX4Wq1At47+xMm1MkuBKc31EOYlstgaDPAb8j/SYshSH21UDCQe7fX8
	7EgMLS8YFG4TJN2ZFBPkfykctp5vGnwPvTy0PG5kzTv/kcQPCnDOQK5ZhUnKGPG1C3LYxLcSQs+
	BNHHrLib/b+4v5GNHozGRYpbgI2DRUui7ej80P8fLXd5MIvTlkTl+MciD4VxquFncJgQNOX79Pp
	8CHh2Z10k9iKbkpcuEgz1RsWpFxkq2cGeJMrUEeBi+PctY2Q7IQcEDOMdI7mFOKC3PiFU7d1eZB
	Pl1ejqiFsIIYRU+yS8IA/6PvVWspw8CqqSL7bX43qxp5ZlC+tVHcpWyVoF2XqrxkeSejstJw4g8
	LIuzp7LK/XZwaxfnuxTmf7U23LROyGA6COE8diT5DBsRae6fX/isyKz/zw7zY1qx1/cBXYnR3gx
	BYAA==
X-Received: by 2002:a05:6000:1acb:b0:48b:a7:6396 with SMTP id ffacd0b85a97d-48e6e4f56dbmr39400082f8f.41.1793876395126;
        Thu, 05 Nov 2026 02:59:55 -0800 (PST)
X-Received: by 2002:a05:6000:1acb:b0:48b:a7:6396 with SMTP id ffacd0b85a97d-48e6e4f56dbmr39400028f8f.41.1793876394719;
        Thu, 05 Nov 2026 02:59:54 -0800 (PST)
Received: from jlelli-thinkpadt14gen4.remote.csb ([151.29.158.90])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fed5521c7sm9157524f8f.39.2026.11.05.02.59.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 02:59:54 -0800 (PST)
Date: Thu, 5 Nov 2026 11:59:51 +0100
From: Juri Lelli <juri.lelli@redhat.com>
To: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	linux-kernel@vger.kernel.org,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	Luca Abeni <luca.abeni@santannapisa.it>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Waiman Long <longman@redhat.com>,
	Ridong Chen <ridong.chen@linux.dev>, Tejun Heo <tj@kernel.org>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Michal =?iso-8859-1?Q?Koutn=FD?= <mkoutny@suse.com>,
	Shuah Khan <shuah@kernel.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Clark Williams <clrkwllms@kernel.org>, cgroups@vger.kernel.org,
	linux-kselftest@vger.kernel.org, linux-rt-devel@lists.linux.dev
Subject: Re: [PATCH v2 05/21] sched/deadline: Do not BUG() on a deadline task
 with no active CPU allowed
Message-ID: <auxhp05Xmz9LYOo-@jlelli-thinkpadt14gen4.remote.csb>
References: <20261104211207.1392343-1-mathieu.desnoyers@efficios.com>
 <20261104211207.1392343-6-mathieu.desnoyers@efficios.com>
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
In-Reply-To: <20261104211207.1392343-6-mathieu.desnoyers@efficios.com>

Hello,

On 04/11/26 16:11, Mathieu Desnoyers wrote:
> dl_task_root_domain_cpu() finds the root domain that holds a deadline
> task's bandwidth from the first active CPU of the task's mask, and
> BUG()s when the mask has none. A mask can have none:
> 
>  - a task boosted into the deadline class by priority inheritance keeps
>    the affinity of its own policy, which may allow one CPU alone, or a
>    cpuset of one. dl_task_needs_bw_move() and set_cpus_allowed_dl()
>    take it for a deadline task, dl_task(p) being true, and look the root
>    domain up from the mask they are replacing, which allows that CPU,
>    inactive by then: the cpuset code updates the masks of a cpuset's
>    tasks once the CPU is inactive, and select_fallback_rq() widens the
>    mask of a task it pushes off that CPU;
>  - with admission control off (sched_rt_runtime_us at -1), a deadline
>    task may be pinned to fewer CPUs than its root domain spans, and
>    those may all go offline.
> 
> Both take the kernel down on the first try, in 8-CPU VMs of v7.4-rc1
> with the four deadline fixes of sched/urgent. The priority inheritance
            ^^^
Not sure how much sense will this info make when reading this changelog
in the future. :)

> one, which asks for no unusual configuration, through the wakeup of the
> boosted owner:
> 
>   kernel BUG at kernel/sched/deadline.c:3340!
>   CPU: 7 UID: 0 PID: 0 Comm: swapper/7
>   RIP: 0010:set_cpus_allowed_dl+0xf0/0x100
>   Call Trace:
>    <IRQ>
>    set_cpus_allowed_force+0x9f/0xf0
>    cpuset_cpus_allowed_fallback+0x12b/0x1d0
>    select_fallback_rq+0x238/0x340
>    try_to_wake_up+0x2a0/0xb70
> 
> Fall back to the CPU the task last ran on, which these callers used
> before the commit this one fixes. Its root domain may have no active CPU
> left: the previous patch has __dl_sub() and __dl_add() take that. Ten
> rounds of each case leave no warning with it.
> 
> Fixes: b4a61fdc19c5 ("sched/deadline: Fix stale root domain in cpuset bandwidth transfer")
> Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
> ---
>  kernel/sched/deadline.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/kernel/sched/deadline.c b/kernel/sched/deadline.c
> index dadda1a528ec..30a52e42c26d 100644
> --- a/kernel/sched/deadline.c
> +++ b/kernel/sched/deadline.c
> @@ -3338,13 +3338,19 @@ static void task_woken_dl(struct rq *rq, struct task_struct *p)
>   * current cpus_mask (not yet updated to the new mask) to find the
>   * actual root domain. Use cpus_mask rather than cpus_ptr, which
>   * may be temporarily narrowed by migrate_disable().
> + *
> + * The mask has no active CPU left when the CPUs it allows went offline,
> + * which the affinity of a deadline task allows with admission control
> + * off, and that of a task boosted into the deadline class by priority
> + * inheritance always: fall back to the CPU the task last ran on.
>   */
>  static unsigned int dl_task_root_domain_cpu(struct task_struct *p)
>  {
>  	unsigned int cpu;
>  
>  	cpu = cpumask_first_and(&p->cpus_mask, cpu_active_mask);
> -	BUG_ON(cpu >= nr_cpu_ids);
> +	if (cpu >= nr_cpu_ids)
> +		cpu = task_cpu(p);
>  	return cpu;
>  }

At least (worst case) we fall back to how things were before my change
introduced the regression.

Acked-by: Juri Lelli <juri.lelli@redhat.com>

Thanks,
Juri

