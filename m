Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793897216;
	b=XSavAx71367FxhbN5XKnWGihMdKESWVpBAlxJ+WX5wKkJPoj48q25VFDI2+TQwBiPbOV
	 csKcD16RQ6wzuL2e8lHeh1v/N+L7pxjaR9mR6R6OLUOWtAE6PT5GcFI9EO0NbLDqo9YQ/
	 AE0+C7c3VHcXuYb787uVFyXA5NAakqif+SN12vxEuJ8lXpS3T8DqrLUmCMowdd5TkvlzQ
	 98b6GNtN3EpKUgJiLm6/MDgM4ey9CthdvQDblTHOiRyqrcKIJvDI62wogcJcn8waeJMu9
	 VVCFGTwhKZz/toPmlwJAsH7NtY1pBej9/j0wY53jgFxRF3KysZn/oHoi394lSR6ZvwQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793897216;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=i6GOdaucFsBj/d7wvECyj7e/eAUDKpCb0x0Xo5UAFo4=;
	b=5sAlM8RR8YbqlSQu9SXsESIpAYT4JD7DqZCopYnQi2Ohb9RKf0UNYMs5ncu+G7paS/NA
	 TkUvaHCzpwdjiT2+/laCxZ9Gb8IBPImxVmW5TOAwm31Rb5RyvD80cxQ4jQRcBAdwBwQ2N
	 /Wz1562J0n9Wx+QQcI+ZOuegWa8OXmk7wTKRUW+QIIqxkbi9GBWfE974CEdh60kehdb0F
	 9pHVcfJRk3etdWFITHFZ69VmJxVaOaQEjrI874YSZdPxafKz44KTZz0UI2lNlLTVTO93n
	 SIEkPLXNk+nNEy+hBRCybrWUZY3bgK6CGZX2yBXh4cgjjwRwAuGVfLyWLgWFyRiQfeg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WhqFlxnt;
	arc=none smtp.remote-ip=209.85.221.42
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C68E606A326
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 16:46:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9C68E606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WhqFlxnt
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-48df4f7ccf4so121404f8f.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 08:46:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793897214; x=1794502014; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=i6GOdaucFsBj/d7wvECyj7e/eAUDKpCb0x0Xo5UAFo4=;
        b=WhqFlxntRN+VfsWCv3+b8oo5m3frudrUGt9bF25KngP45bKi774V8oDrrKvSUMxpjs
         q6tjZon2IOVLluAMAXkKe/O1ttNhgvi4fLBsU0Lwc57aLegRxQmMVZ3uMk8U9A815cSe
         AI9gFPL1GSuF8EpxKWa4RV65ChUvPsJcM43XBKSIzyan0Drh4CkUu4F4hjoBaE3EqFjq
         NftOweLSp+KrNHXFnPmxoXi7b1jhCFnFhbZH9ANpLupN3tzdE35Ez5ck877hm0w3KDls
         wu0d6oDhXWsXyxnOEAMvnbAQAsZOiOpTda3wtK0aaHZGRdDdpyjHiGU0/kxbbKOq50BE
         9MCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793897214; x=1794502014;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=i6GOdaucFsBj/d7wvECyj7e/eAUDKpCb0x0Xo5UAFo4=;
        b=Ce/xeMnWScXj4fReK1+AcBso23cFOKj8H+UMsIHNZzbLhFCwspEGikKETbws06jJ32
         3kdcggkeCGzI6RoZEO8ulgLDXEPjkg8+Woy+lTeijxL3bzeNAsDFWnEeFbbhgw+eAmK6
         w1B9lygNJ6sVHaPEUktE9sQ0LEtYrEzIALIWotHOxlgLoDeonFgmDylkLYx2zcmOdwpP
         t1q42/o0nlK4P0aBLkuQAjpQTecK2NERUZ3vj/I9tPEM8pLu0gzpj1KJNps9RcCGRx6U
         KWoT5sV+cnIP4gC3ae51qCoDdO1ZctmB9jAIP3DorlsNCm5zTBDj77ivzewZ+mJz07Dz
         7W3A==
X-Forwarded-Encrypted: i=1; AKwUvByQCCeLxzBWSZO1PTphHdQgmcH+8t75v8IHLX6JZaJrhR6fsP569NzdqZ7ETqJRB3MYRC89y1xZFoJBDPo=@vger.kernel.org
X-Gm-Message-State: APuU4Z/phlylI6fgfWe1Lso4UF0aXgPHaTYyjKYtv+G0Ui9eYK8YRsYF
	zaRozo2NQAunQ8ywRx252bj5FcAsBh61Zk3eT5Rdto7qDWArj4l2fWlj
X-Gm-Gg: AYBFou1d/dkr/wd5H4F5oE6Bd2lzupltKTKU3ZXTOpB9Q9mThic3m1utZ/odgkHKtS9
	AzG5RdrZ90hsBgYqUWjb9cqKgtAhqPJtnjp8W3kseSmfKN94YaoxKJgoA3+EYcAMwOwTcpegJ41
	Bx+7dWlu7J9t0iTiB1vXc1kawZgsl0fVcBgGkdvosfGSKgNbta6CUQVBHNgx8R9/SrhrFMF6uFV
	21Xem5O0qnoi+AxDMgVd//ZHbm8stVohBewiIi8/le2rssFeHjf4yPBZXV+0gUNh5i0GR4pdL6I
	jqOvLFBNUlSpPbnrghflCzM3rykv1/ay/bAth1NIyw9YifeDWJHNY6EjOOJIMXVyWYmcyOqQ/D7
	qpHhEwOHspVt5qCVWvZSsUWfKUE8Lfdvt2Qma0q2Ikhwroaem3wmRtCjCx/H+Eg74pyZmD/8KX1
	ZVE2iXC4MJwOU6+f0VqW56lQIHHY+QWtud71AGMGxVUUf1pMoW4Yx8g5lzoKyvFZCo/vPLCNTY1
	5oHUjCQtLO+TwunBhHPr3SFp1KRLy9vrr9rsXOLlMfx3j5DLsYh9yEcThoM9qsLTdnwFSMgDYJk
	0YQ1YJCUrvD+bq0/DQHjBah6iDIKvbSdwYXq5Sd/dbSxInng1jRylIk=
X-Received: by 2002:a05:6000:460b:b0:48e:6675:3a77 with SMTP id ffacd0b85a97d-49275093a8dmr336605f8f.3.1793897213873;
        Thu, 05 Nov 2026 08:46:53 -0800 (PST)
Received: from scheduler.schedules ([85.100.66.184])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fec8d8734sm11533675f8f.20.2026.11.05.08.46.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 08:46:53 -0800 (PST)
Date: Thu, 5 Nov 2026 19:46:50 +0300
From: Kayra Cizmeci <kayracizmeci@gmail.com>
To: Li kunyu <likunyu@open-hieco.net>
Cc: mingo@redhat.com, peterz@infradead.org, juri.lelli@redhat.com, 
	vincent.guittot@linaro.org, dietmar.eggemann@arm.com, rostedt@goodmis.org, 
	bsegall@google.com, mgorman@suse.de, vschneid@redhat.com, kprateek.nayak@amd.com, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] sched/fair: Distribute burst-woken tasks when rq depth
 reaches 3x average
Message-ID: <auypmYsIO08V3avZ@scheduler.schedules>
References: <20261104091842.266273-1-likunyu@open-hieco.net>
 <autCBv3-foLXkZss@scheduler.schedules>
 <5e26b0b2-0b87-da79-9cb5-b471c9ebf77a@open-hieco.net>
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
In-Reply-To: <5e26b0b2-0b87-da79-9cb5-b471c9ebf77a@open-hieco.net>

On Thu, Nov 05, 2026 at 09:43:07AM +0800, Li kunyu wrote:
> Hi Kayra,
> 
> On 2026/11/5 2:10, Kayra Cizmeci wrote:
> > 
> > Hi!
> > 
> > On Wed, Nov 04, 2026 at 05:18:42PM +0800, Li kunyu wrote:
> > 
> > FWIW, This doesn't apply to the mainline:
> > 
> > Patch failed at 0001 sched/fair: Distribute burst-woken tasks when rq depth reaches 3x average
> > error: patch failed: kernel/sched/fair.c:9972
> > error: kernel/sched/fair.c: patch does not apply
> 
> Today, I updated the warehouse branch to the latest version, addressed the
> identified issues, and performed another thorough test.
> 
> >> When a task burst-wakes a large number of tasks in a short period, tasks
> >> can pile up on a single CPU regardless of whether the system has idle
> >> CPUs or NO_HZ enabled.
> >>
> >> Track the average runqueue depth (scaled by SCHED_CAPACITY_SCALE to
> >> preserve fractional precision) in root_domain during the periodic
> >> load-balance pass.
> >>
> >> In select_task_rq_fair(), when the target runqueue depth reaches 3x the
> >> system-wide average, fall back to cpumask_any_and_distribute(p->cpus_ptr,
> >> cpu_active_mask) to rotate waking tasks across allowed CPUs and reset the
> >> periodic load balance intervals so regular load balancing can promptly
> >> smooth out the distribution.
> >>
> >> Suggested-by: Peter Zijlstra <peterz@infradead.org>
> >> Link: https://lore.kernel.org/all/20261021125419.GK2823843@noisy.programming.kicks-ass.net/
> >> Signed-off-by: Li kunyu <likunyu@open-hieco.net>
> >> ---
> >>  kernel/sched/fair.c     | 70 ++++++++++++++++++++++++++++++++++++++---
> >>  kernel/sched/sched.h    |  3 ++
> >>  kernel/sched/topology.c |  2 ++
> >>  3 files changed, 71 insertions(+), 4 deletions(-)
> >>
> >> diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
> >> index 6e005f1e8dc9..e4d278ac46c4 100644
> >> --- a/kernel/sched/fair.c
> >> +++ b/kernel/sched/fair.c
> >> @@ -9903,6 +9903,38 @@ static int find_energy_efficient_cpu(struct task_struct *p, int prev_cpu)
> >>  	return target;
> >>  }
> >>  
> >> +/*
> >> + * Check if a CPU's rq depth reaches 3x the system-wide average tracked
> >> + * in root_domain (scaled by SCHED_CAPACITY_SCALE, floored at 1 task).
> >> + */
> >> +static inline bool rq_burst_overloaded(int cpu)
> >> +{
> >> +	struct rq *rq = cpu_rq(cpu);
> >> +	unsigned long avg;
> >> +
> >> +	if (unlikely(!rq->rd))
> >> +		return false;
> >> +
> >> +	avg = max_t(unsigned long, READ_ONCE(rq->rd->avg_nr_running),
> >> +		    SCHED_CAPACITY_SCALE);
> >> +
> >> +	return (READ_ONCE(rq->nr_running) << SCHED_CAPACITY_SHIFT) >= avg * 3;
> >> +}
> >> +
> >> +static inline void reset_periodic_lb_interval(int cpu)
> >> +{
> >> +	struct sched_domain *sd;
> >> +
> >> +	/*
> >> +	 * Only the most basic values are updated here to avoid excessive
> >> +	 * cost.
> >> +	 */
> >> +	for_each_domain(cpu, sd) {
> >> +		if (READ_ONCE(sd->balance_interval) > sd->min_interval)
> >> +			WRITE_ONCE(sd->balance_interval, sd->min_interval);
> >> +	}
> >> +}
> >> +
> >>  /*
> >>   * select_task_rq_fair: Select target runqueue for the waking task in domains
> >>   * that have the relevant SD flag set. In practice, this is SD_BALANCE_WAKE,
> >> @@ -9972,11 +10004,19 @@ select_task_rq_fair(struct task_struct *p, int prev_cpu, int wake_flags)
> >>  
> >>  	/* Slow path */
> >>  	if (unlikely(sd))
> >> -		return sched_balance_find_dst_cpu(sd, p, cpu, prev_cpu, sd_flag);
> >> -
> >> +		new_cpu = sched_balance_find_dst_cpu(sd, p, cpu, prev_cpu, sd_flag);
> >>  	/* Fast path */
> >> -	if (wake_flags & WF_TTWU)
> >> -		return select_idle_sibling(p, prev_cpu, new_cpu);
> >> +	else if (wake_flags & WF_TTWU)
> >> +		new_cpu = select_idle_sibling(p, prev_cpu, new_cpu);
> >> +
> >> +	if (unlikely(rq_burst_overloaded(new_cpu))) {
> >> +		int dist_cpu = cpumask_any_and_distribute(p->cpus_ptr, cpu_active_mask);
> >> +
> >> +		if (likely(dist_cpu < nr_cpumask_bits)) {
> >> +			reset_periodic_lb_interval(new_cpu);
> > 
> > Why are we calling this for new_cpu?
> 
> Here, the existing logic is reused, with new_cpu used as the final return value.

It's not used as the final return value. We return dist_cpu not new_cpu.
Look below :-).

> It remains unclear whether this approach is appropriate. If it causes no
> practical impact, it seems reasonable to keep it unchanged.
> 
> >> +			return dist_cpu;
> >> +		}
> >> +	}
> >>  


Well, if we chose dist_cpu instead of new_cpu why we are calling
reset_periodic_lb_interval() thingie for new_cpu?

Even calling it for dist_cpu is questionable.


Because:

sched_balance_domains() gets the interval value from
get_sd_balance_interval(). get_sd_balance_interval() reads the value
from sd->balance_interval (The value we are resetting) and multiplies it
by busy_factor if the cpu_busy bool parameter is true.

sched_balance_domains() calls sched_balance_rq() if jiffies is bigger or equal to
last_balance + interval.

Now as you can see, we make the interval value bigger when the CPU is
busy. In your path, if the new_cpu is not the picked CPU calling this
makes no sense. Because if we didn't picked it, it already means that
it's busy or atleast worse than the other options.

sched_balance_rq() already tries to pull the tasks to the given CPU at
first place.


If we really wanna do that, atleast call it for dist_cpu (the returned CPU) not
for the CPU that lost.

Or am I getting something wrong?


Cheers,

Kayra
