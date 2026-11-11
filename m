Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794390672;
	b=hHVqqQD1L7wca5gnI1dL1U8+0VLB5AJdTVeDHI6CWwOrpyaWUPxdBJ2Sj47bagtaQngz
	 X2wAsIASPY7kFYSheKHzeleqrxmKpd6Wjm/L2LyDoHAqwx7+VPMAzETVR+p51WLJTKuE2
	 H3d4HwDvnXx9fQ1KiPktQRmRMU0Ii4OhQqIVx3UpUVlGB0LMjjL6EqbrYHq7gmnBMozt8
	 0MwUNYNNLud8Qrd+hG1fSxZVtS6tYE0N91+W2peWZ/Sz6n2rSu++xIXhDqfYpOw7DGbLf
	 YWVVqEbweKyMANdOWroLafXBoOIgEKwz5ZrI//8XSDA7BeQWGlWBu6s2ZaMEgR7SZaw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794390672;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=L4XaMe1XbOvnrjzdlHkxdaauhP01YTI9M/d43wkBUnw=;
	b=QzZ2/4q4nQXAsbAITtFKgALWGAsmH6CIS0860npOKTSoGJmUQkxHBO6J9zHkPDBP6Tnd
	 NuH9LW3AzEXvXotUx5sG29AHUiMZ0h4jWaJ0zJDuHAL0FszPXK3FEhasCgZe9ajSw2Wx8
	 DZV9g/QRybsJlD8p8tcI060E9W0FxueFvEKyiZO4EDBrnBBaMrDw1Rsb7PTy2Wlt5OAN0
	 bnTiUyl5ii8SIp5A5La4RJs0K9pffZ6RH1fkZ0NFAXPxuGsYUp5VHsGER5OheTQXOT3iR
	 yzNt99QjnStW1YTcu8vCsloPZirSSTo/xPkDW017gqg5mTdPNJipFy2M1sIIP4u9OXw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FHgCWGbU;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9038D606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 09:51:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9038D606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FHgCWGbU
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a59ffacb51so569755e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 01:51:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794390670; x=1794995470; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=L4XaMe1XbOvnrjzdlHkxdaauhP01YTI9M/d43wkBUnw=;
        b=FHgCWGbUOAHFYWjmrjhTZlDPt7Ait/9jDh/Y2DlEvdk83DyFGJ7fHDBP/nbcnWrb7S
         2Cz7LQA+2ESOCeTiju1THwaepiXAC7nUJMDEpc2qTlgOcI3wLD/S7N2GuEgvQML+KJ/s
         watz/SW4UdkEdq4jM8ipTg/ytsPGU0hZTdkiobtrlhjSdwXfCxunPZd8pArvTBXFBs8H
         9w75QzjiS2y01hwmBHp3FLwcqikxzuuERIXYKFuDFIItUwObAQQBA3pNzNBt0DA/YHYc
         ZzmXvGNrr1EiCq3rIsrrA3Mj0NS95fNC/XTc96RYzU0c8YLE3NUVylxv+iFjJgc8Oa9Y
         FSdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794390670; x=1794995470;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=L4XaMe1XbOvnrjzdlHkxdaauhP01YTI9M/d43wkBUnw=;
        b=AKJYHze7saLzxEdS6f/Pg/HUKD+nXBDYmvQAWipYLbpw48EuI50S5zwb1DiH1rsKLy
         PRLIBnHxt2A6xYOc89+aeczFP6p4FJG8TZw9wvMy+b/mFqnYnpRhLnqpZkpisCGcIm7J
         zc/YkmF/CGaeyOph83jT+ji+aQK8RWGpE3YYvhLK1caiTMdoU+sOlxRIl2r1B69eGysg
         kMvrdzkb1nFPm2DcQyhbzpKFeb0NHmNR4Xo/arjv24175C3YOy23uE9ffju2nGRn+O90
         /J7jd668lOHRRWHfXB9Ee22E0GYKGy3r6oMmlq4ViJnJT9pSpr5/A2DlAZaDK3lUj4PI
         c3ng==
X-Forwarded-Encrypted: i=1; AL+hErHRhxuRys7euRXCuuXEcJLYuHkTZJlrQl/QUoZhiUrrHHc9e9NUHDEr1LAIr5RNbfMM6xV6RqbcdH6LtJA=@vger.kernel.org
X-Gm-Message-State: APuU4Z9GVcmZhghvU6Qt0rbyHDBLb2Mh+jxwsh4tjS6RjizrPyxLBRm3
	7/ydULQBmY/WereA3LUxTIQS52qL0oZgLjNl9UEVcbKILYxBsuC4VkGF
X-Gm-Gg: AYBFou0d21xoJVZfc5AbziBSoqPHUBxBXl8JvXs6/Rc0ZjvXy8Cog0BwCZRVkIdLvJr
	htfgTy008IJeR/ohcZH7XjxmN6ZGp1i70dSUtJ8IGhFb/PoJb/P3azjTZpHaAySdOafI3JZhanb
	YHgR14j+u69GeLy7E7KmHLtcjDtJzr3Uv0L7JPSfnFAKpZUpA1NSB1X4ViFdPjSuIENYQpn10E7
	YCU4pCLbyEb1S9hytlcDceTDOQbp9ubRImgSe605pSCECkc9VPZbc6zX8HLaE05N4hLe5IgtHch
	Pv34N77sBHy9UI9cXlLqbNGji59MW0WZi4l3Dt+Ay+IpmrRCrWN0qvn7K1c8lVXQy8T5AXZINsK
	wfwcjCKwoMmWyeGC7XJ2wRhKseUgMT7TS7EOPjCeGu/MeGLR5MDXtEJQlmCV+Mgwf+qyriR2qn6
	p5cu6DR5pvVsZsfzg5GXUzeBZ1d3LcCoLys5SAtJr/BeUpq1jjiXw68WvEFXXvCZNxGZBRS2Kv4
	322n8ITSXzzww4vdZ6B/KVCQqBnzBNg/6XO8ZHn3Yk/d3ZT6GYl4+wUyYRh+rf1PNs046bNDzF0
	2BLq2ysjWVazp2yv2p0pVu3LGchIlM4vySu0y3qJtIlSsk6vu7lULbNcF4WpMd+AxNKRlOh+rVo
	Cdg==
X-Received: by 2002:a05:600c:150a:b0:4b8:af10:d795 with SMTP id 5b1f17b1804b1-4ba091aa3c2mr19523215e9.0.1794390669711;
        Wed, 11 Nov 2026 01:51:09 -0800 (PST)
Received: from scheduler.schedules ([85.100.66.184])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba0204785dsm132365325e9.9.2026.11.11.01.51.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 01:51:09 -0800 (PST)
Date: Wed, 11 Nov 2026 12:51:05 +0300
From: Kayra Cizmeci <kayracizmeci@gmail.com>
To: K Prateek Nayak <kprateek.nayak@amd.com>
Cc: Peter Zijlstra <peterz@infradead.org>, mingo@kernel.org, 
	juri.lelli@redhat.com, vincent.guittot@linaro.org, dietmar.eggemann@arm.com, 
	rostedt@goodmis.org, bsegall@google.com, mgorman@suse.de, vschneid@redhat.com, 
	linux-kernel@vger.kernel.org, tj@kernel.org, ziqianlu@bytedance.com
Subject: Re: [PATCH v2 05/12] sched/core: Abstract/fix
 rq_clock_start_loop_update()
Message-ID: <avQ2igWsNJ6ci9CY@scheduler.schedules>
References: <20261107115913.261163891@infradead.org>
 <20261107120207.242460109@infradead.org>
 <avBDWS-AY6QQtCuH@scheduler.schedules>
 <b3ded9e9-2b4b-48c4-8e18-5c213601b96e@amd.com>
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
In-Reply-To: <b3ded9e9-2b4b-48c4-8e18-5c213601b96e@amd.com>

Hi!

On Wed, Nov 11, 2026 at 02:40:36PM +0530, K Prateek Nayak wrote:
> Hello Kayre, Peter,
> 
> On 11/9/2026 3:56 AM, Kayra Cizmeci wrote:
> > So to fix both of these I would suggest something like so, not tested:
> > 
> > 
> > diff --git a/kernel/sched/sched.h b/kernel/sched/sched.h
> > index 339a77864ec8..a91d12640f37 100644
> > --- a/kernel/sched/sched.h
> > +++ b/kernel/sched/sched.h
> > @@ -1911,7 +1911,7 @@ static inline unsigned int rq_clock_freeze(struct rq *rq)
> >  	return flags;
> >  }
> >  
> > -static inline void rq_clock_thaw(struct rq *rq, bool flags)
> > +static inline void rq_clock_thaw(struct rq *rq, unsigned int flags)
> >  {
> >  	lockdep_assert_rq_held(rq);
> >  	rq->clock_update_flags &= ~RQCF_FREEZE;
> > @@ -3357,8 +3357,8 @@ unsigned long arch_scale_freq_capacity(int cpu)
> >   */
> >  static inline void double_rq_clock_clear_update(struct rq *rq1, struct rq *rq2)
> >  {
> > -	rq1->clock_update_flags &= (RQCF_REQ_SKIP|RQCF_ACT_SKIP);
> > -	rq2->clock_update_flags &= (RQCF_REQ_SKIP|RQCF_ACT_SKIP);
> > +	rq1->clock_update_flags &= ~RQCF_UPDATED;
> > +	rq2->clock_update_flags &= ~RQCF_UPDATED;
> >  }
> >  
> >  #define DEFINE_LOCK_GUARD_2(name, type, _lock, _unlock, ...)				\
> 
> So with this, I still get a clock_update_flags warning like:
> 
>     ------------[ cut here ]------------
>     !(rq->clock_update_flags & RQCF_UPDATED)
>     WARNING: kernel/sched/sched.h:1862 at set_next_task_idle+0xe1/0x100, CPU#262: sched-messaging/8375
>     Modules linked in: ...
>     CPU: 262 UID: 0 PID: 8375 Comm: sched-messaging Tainted: G        W           7.4.0-rc1-test+ #463 PREEMPT(lazy)
>     Tainted: [W]=WARN
>     Hardware name: AMD Corporation Titanite_4G/Titanite_4G, BIOS RTI100CC 03/28/2024
>     RIP: 0010:set_next_task_idle+0xe1/0x100
>     Code: ...
>     RSP: 0018:ff919f922f4e7c80 EFLAGS: 00010046
>     RAX: 0000000000000000 RBX: ff49b96ece1b33c0 RCX: 0000000000000007
>     RDX: 000000128e40504c RSI: 0000000000000200 RDI: ff49b8b30f2d8000
>     RBP: ff49b8b28ed84280 R08: 0000000000000200 R09: ff49b8b28ed84280
>     R10: 0000000000000008 R11: 0000000000000008 R12: ff49b8b28ed84280
>     R13: ffffffff86a043c0 R14: ff49b8b28dfca700 R15: 0000000000000200
>     FS:  00007fddd81237c0(0000) GS:ff49b96f477af000(0000) knlGS:0000000000000000
>     CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
>     CR2: 000055ce59162840 CR3: 00000001a1f11004 CR4: 0000000000f71ef0
>     PKRU: 55555554
>     Call Trace:
>      <TASK>
>      __schedule+0x93b/0x1ca0
>      schedule+0x28/0xa0
>      anon_pipe_read+0x302/0x410
>      ? __pfx_autoremove_wake_function+0x10/0x10
>      vfs_read+0x30b/0x340
>      ksys_read+0xb8/0xe0
>      do_syscall_64+0xce/0x550
>      ? srso_alias_return_thunk+0x5/0xfbef5
>      ? srso_alias_return_thunk+0x5/0xfbef5
>      ? do_syscall_64+0x35/0x550
>      entry_SYSCALL_64_after_hwframe+0x76/0x7e
>     RIP: 0033:0x7fddd6514932
>     Code: ...
>     RSP: 002b:00007fffd6dcde28 EFLAGS: 00000246 ORIG_RAX: 0000000000000000
>     RAX: ffffffffffffffda RBX: 0000000000000000 RCX: 00007fddd6514932
>     RDX: 0000000000000064 RSI: 00007fffd6dcde40 RDI: 0000000000000007
>     RBP: 00007fffd6dcdee0 R08: 0000000000000000 R09: 00007fddd81237c0
>     R10: 00007fddd84ed0c8 R11: 0000000000000246 R12: 0000000000000064
>     R13: 00007fffd6dcde40 R14: 00000000000001c7 R15: 000055ce88d5e840
>      </TASK>
>     ---[ end trace 0000000000000000 ]---
> 
> with:
> 
>   coresched new -t pid -- perf bench sched messaging -p -l 100000 -g 8
> 
> on queue:sched/hackery.
> 
> If I do:
> 
> diff --git a/kernel/sched/sched.h b/kernel/sched/sched.h
> index 339a77864ec8..fd900d1419c6 100644
> --- a/kernel/sched/sched.h
> +++ b/kernel/sched/sched.h
> @@ -3357,8 +3357,8 @@ unsigned long arch_scale_freq_capacity(int cpu)
>   */
>  static inline void double_rq_clock_clear_update(struct rq *rq1, struct rq *rq2)
>  {
> -	rq1->clock_update_flags &= (RQCF_REQ_SKIP|RQCF_ACT_SKIP);
> -	rq2->clock_update_flags &= (RQCF_REQ_SKIP|RQCF_ACT_SKIP);
> +	__rq_clock_clear(rq1);
> +	__rq_clock_clear(rq2);
>  }
>  
>  #define DEFINE_LOCK_GUARD_2(name, type, _lock, _unlock, ...)				\
> ---
> 
> I don't see that warning anymore. Must be the "core_pick_in_flight"
> check keeping everything sane.
> 

Thanks for testing! Well, I missed that :-(. Core Scheduling...

> > In a case like this:
> > 
> > CPU1 calls rq_drop_lock(), saves FREEZE = 0, and changes FREEZE to 1,
> > and drops the lock.
> > 
> > CPU2 gets the lock, saves FREEZE = 1 and changes FREEZE to 1, and then
> > drops the lock.
> > 
> > In this period CPU1 gets the lock again, makes FREEZE 0.
> > 
> > And later CPU2 comes and makes it FREEZE 1.
> > 
> > 
> > Not sure above could happen tho. Could it happen?
> 
> I suppose it is possible.
> 
> Generally rq_lock is dropped in middle of __schedule() when NEED_RESCHED is still
> set so ->task_woken() would generally bail out early for dl and rt (ext doesn't
> seem to drop the rq_lock on that path).
> 
> That said, a concurrent wakeup can grab the rq_lock when another ->task_woken()
> dropped the rq_lock or a __balance_callbacks() for setprio or sched_move_task()
> can interleave with a ->task_woken() and lead to your scenario.
> 
> > I tried to fix this assuming it could happen.
> > 
> > I'm not really happy with below diff, but I couldn't find a better way
> > neither, so please tell me that this case can't happen or there
> > is a better way to fix it :-(. This is on top of the current code BTW.
> > Only compile tested.
> 
> [..snip..]
> 
> >  bool cfs_task_bw_constrained(struct task_struct *p)
> > diff --git a/kernel/sched/sched.h b/kernel/sched/sched.h
> > index 339a77864ec8..d8f1784d0640 100644
> > --- a/kernel/sched/sched.h
> > +++ b/kernel/sched/sched.h
> > @@ -1281,6 +1281,7 @@ struct rq {
> >  	u64			clock;
> >  	unsigned long		lost_idle_time;
> >  	unsigned int		clock_update_flags;
> > +	unsigned int		clock_update_depth;
> 
> I think this can stand-in for the freeze flag too if you do
> something like:
> 
> diff --git a/kernel/sched/sched.h b/kernel/sched/sched.h
> index 339a77864ec8..49c732d3f3bb 100644
> --- a/kernel/sched/sched.h
> +++ b/kernel/sched/sched.h
> @@ -1280,7 +1280,18 @@ struct rq {
>  	u64			clock_pelt;
>  	u64			clock;
>  	unsigned long		lost_idle_time;
> -	unsigned int		clock_update_flags;
> +	union {
> +		struct {
> +			s16	clock_update_flags;
> +			u16	freeze_depth;
> +		};
> +		/*
> +		 * Inspect both clock_update_flags and
> +		 * freeze_depth together in
> +		 * __update_rq_clock().
> +		 */
> +		u32		__clock_update_flags;
> +	};
>  	u64			clock_pelt_idle;
>  	u64			clock_idle;
>  
> ---
> 
> Probably makes it very ugly :-)
> 

TBH, I don't know which one is better. And if I were to decide,
I'd be wrong 50% of the time, so it's up to Peter :-).

> >  	u64			clock_pelt_idle;
> >  	u64			clock_idle;
> >  
> > @@ -1902,31 +1903,28 @@ static inline void rq_clock_cancel_skipupdate(struct rq *rq)
> >   * update_rq_clock() for several cfs and rt runqueues (Typically when using
> >   * list_for_each_entry_*)
> >   */
> > -static inline unsigned int rq_clock_freeze(struct rq *rq)
> > +static inline void rq_clock_freeze(struct rq *rq)
> >  {
> > -	unsigned int flags = rq->clock_update_flags;
> >  	lockdep_assert_rq_held(rq);
> >  	assert_clock_updated(rq);
> > +	rq->clock_update_depth++;
> >  	rq->clock_update_flags |= RQCF_FREEZE;
> > -	return flags;
> >  }
> >  
> > -static inline void rq_clock_thaw(struct rq *rq, bool flags)
> > +static inline void rq_clock_thaw(struct rq *rq)
> >  {
> >  	lockdep_assert_rq_held(rq);
> > +	WARN_ON_ONCE(!rq->clock_update_depth);
> > +	rq->clock_update_flags |= RQCF_UPDATED;
> > +	rq->clock_update_depth--;
> > +	if (rq->clock_update_depth)
> > +		return;
> >  	rq->clock_update_flags &= ~RQCF_FREEZE;
> > -	rq->clock_update_flags |= RQCF_UPDATED | (flags & RQCF_FREEZE);
> >  }
> 
> This seems like a legit problem one can run into and
> your solutions works well!

Thanks for having a look at this!

> 
> -- 
> Thanks and Regards,
> Prateek
> 

Cheers,

Kayra
