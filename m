Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793894105;
	b=r1QNbNzakndGiN0K7sUuIWGol/Bm/6tO1q3gOoixpyw3B0b+fUu8RMjDVWLpy5zORspu
	 itRc32mksBb+S7W010IYNolgWSQZ/cVh5d+bUWZdaTWCCbYOBIPbZLCC4IV34fDpWwbT9
	 c5GI3YfUwhlja1STLgUPXdYp4rOAGei6jbwsMQ/UQR59tFCJSvnpgp1lBw49AsW2E9Sb4
	 mc/wYbTTm0xCSyS+1a2LMx/42nEuOSoMx6XPS7d5Z8cdzULe5V05Kjj4bRpuAnjRp8O4z
	 tkUKG9SKwQIJScs2VApLFTIFJPZX1x509+phDzp9B6tK34W52yUA+1ZDjO7i5MnsVtg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793894105;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=dL326s4hlVlCdK8Nbo2Jt7cLhdWe7U4R6wIiuXLSfdU=;
	b=H9OOeSnEw/73Oul2vZRhJsS/OyzeKNH59/ZUaEO8rO5ejztygNr14l8Enxwka4+ITXTq
	 nCGOHDkpH6Yk/jvHzODLZ5vyMNVFY5SVNSf0LZLE+cBIXDZvrpxuv+lWLvCeeBVLAvkO8
	 drTHRJdjNEFccQAiuywuLrPU3rPpzk+9mPQGfOAnxeVzHXfwUcGflA/iyg/e3Um/Ehv85
	 cVFbowtazHs4jMWvCpxZuB+bpiVer48RK+W/X5UsWDvEmS2/PYlEgIFfpPZLDmm6tjMQE
	 uS3SvWshKPLrXwRMuAVgnOi6NTa4RX7s3nfzPgKQ9DIyGaDJ8sonaRtgri7qabDHTew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GRAzJJQK;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFE1A60A3806
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 15:55:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DFE1A60A3806
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GRAzJJQK
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4af520023fdso5545495e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 07:55:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793894103; x=1794498903; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dL326s4hlVlCdK8Nbo2Jt7cLhdWe7U4R6wIiuXLSfdU=;
        b=GRAzJJQK3Ofx0pF/a5fPpjk8fVXGsbELbdamwdlPk0VtjOKsLe3wwVAs/DLvS/M/E0
         tJkZITtMz4ZaqUztF7TnR7x+qAVMJIBVWlzK03hii8nM+cpIl5JYOfJ3ZIMAp6v3QdNk
         wT07EgBZJ7mT0hTO1CukSoTvqZATZ/lp//XmyXnRlfrLEffytKqYAf8qLrcI5NglawbW
         6VhcbX/0QR/ry2PFeCi4nNuKdkDNUp6wkIsXUD5Ycf0h4rtiPAi3SaYO565z8Axxkths
         INOh/OzJyYhrE3KTCyq/ocO3t62aJn5MrGQ5eCzCtJGGrXO74ABVKtaFON0VnjdCK+CL
         5OUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793894103; x=1794498903;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dL326s4hlVlCdK8Nbo2Jt7cLhdWe7U4R6wIiuXLSfdU=;
        b=L0agXOnSXHmlxu52ufRr9+6uUF0erYfMIdc8JmDFrGiw5zY4Xv/GBlLa54oO946FfL
         l8gr8DXdKPpoB1hrpZdqgSv+tQaaUrDOrMlOYNuPLiQfdByLyGIPP2Eqm0srmEVYbC2v
         aiUB5F5Pf5xwD/Zeg42VDh0fe2DoTm9IQzXOjz7CkFiLd6yPdfIdXqeYeueXa4MMx3ai
         4bfSQTi9+BooiqZ84+VjGrTF7IErIkfa4+ttUYFXivJ1VZI93iEpdyt23Rbes8fHJ5qa
         mscCrJuvmq1BB1KtCNW9gsY5fgr78Ld+Z15DVV80H39O0fn6wWU3XEbeVDtbwjUhDNXb
         VTnQ==
X-Forwarded-Encrypted: i=1; AKwUvBzuCDb7eggVoFPOGkHpk5wtmGjLqUNitEpB4oBuUxag9tf32VcHV/ZGypNsiC7zk172dBbM6WMzgblWA/k=@vger.kernel.org
X-Gm-Message-State: APuU4Z8ewLDSS9zu1Iv1o+i7O5QlQLkrMxEgKHTryvFx/EXYCm+y1BY9
	xKfNlVYrskQk05CqwSMda/sa8+9oOa7epIPKg+r3hN1illadMj7wc0SP
X-Gm-Gg: AYBFou1EN96bYs46QTmlWW5ZXHdkeHaPbCI6sQs5KYlVZYo/zNCN0fpvqgem+19UB7y
	zyR90hSCrDvb+sIl1cpEUJp9OEtmikiJGh3Mj9GN6nYII0ua/rQk7S4YhIDUQlhw4Vmb2PSllFk
	oVuH+2K+g90xfrSQMh5wU0r5FT9kPG9jyM+WG+o8DYrAR5f6HkWOf7evl5mcimrGyJn1L7WQI5C
	+RiNIO9cUMftEenZbqvS2DaeIfCClMitVgXVX2h5LVL0QBXLs7GGbj2HFkMNcIT5Fm4/EQC2pp5
	lTzF6sE8OsacGlOvkM/8O5hu1f5emsBkgdeIQnZEVw1a1SM5sidGt0NyVI3kP926zVekfSre26o
	E0xuzNRnddL5tRgSCCYAi2Na100h5WWnoAWo7+mLr7HmdJlRsNbywUmF3sVrO9QernGskvoUBS7
	4kWubyNxbMQ0IIl87N7QGWH+K0KlKG7Sqirx5y75r+06LnzrVupChN4oIe3ph7R4hgsxKo0oj9q
	q9Y20JLc8rttO5R8oyG3eM5ueRg8+KnfldIsjOKAW5lPQY/I3fMhkCr5KpLoiYtTUsCdbEuCTb3
	AI9tNHAM6JjTFDAz/faZrb3HtqUVbK9bQRorTOmqaMMoTNH90Rdx7dY=
X-Received: by 2002:a05:600c:a5a5:b0:4a1:e774:370d with SMTP id 5b1f17b1804b1-4ac1765d60fmr275939985e9.1.1793894103083;
        Thu, 05 Nov 2026 07:55:03 -0800 (PST)
Received: from scheduler.schedules ([85.100.66.184])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b56f0237aesm76917685e9.9.2026.11.05.07.55.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 07:55:02 -0800 (PST)
Date: Thu, 5 Nov 2026 18:54:58 +0300
From: Kayra Cizmeci <kayracizmeci@gmail.com>
To: Qais Yousef <qyousef@layalina.io>
Cc: Ingo Molnar <mingo@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Vincent Guittot <vincent.guittot@linaro.org>, Christian Loehle <christian.loehle@arm.com>, 
	Dietmar Eggemann <dietmar.eggemann@arm.com>, Steven Rostedt <rostedt@goodmis.org>, 
	John Stultz <jstultz@google.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC v5 3/4] Revert "sched/rt: Substract number of tasks
 of throttled queues from rq->nr_running"
Message-ID: <auyR6v0tKagzo986@scheduler.schedules>
References: <20261103005953.56271-1-qyousef@layalina.io>
 <20261103005953.56271-4-qyousef@layalina.io>
 <auoRQiZbirZCFF1x@scheduler.schedules>
 <8401ef7a-de1a-4cb2-a3eb-be02a8436360@layalina.io>
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
In-Reply-To: <8401ef7a-de1a-4cb2-a3eb-be02a8436360@layalina.io>

On Thu, Nov 05, 2026 at 01:31:37AM +0000, Qais Yousef wrote:
> On 11/3/26 18:51, Kayra Cizmeci wrote:
> 
> > So, as I was saying above I gave this a run. Did some tests:
> > 
> > In my base a RT task can only get a CPU's %95.5, with the series %99.9.
> > Even when rt_throttled is 1, task doesn't stop running. I opened
> > CONFIG_RT_GROUP_SCHED and set cpu.rt_runtime_us to 950000. cgroup v1.
> > 
> > 
> > And AFAICT from the code and my tests, nr_running is handled
> > differently/wrong with this patch.
> > 
> > When there is a RT group while throttling is enabled, with 2 tasks when
> > the group throttles nr_running should be 0. Since, there is nothing to
> > run. (If the group is alone in the rq tho :>) But with the patch series,
> > it stays 2. I think it's because dec_rt_tasks() does not call
> > sub_nr_running() in the group_rt_rq() case of se.
> > 
> > 
> > Or am I missing something :-)?
> 
> This is an RFC as I was looking for potential historical context why it had to
> be done this way. I did call out in the cover letter that I am not sure about
> the implementation of inc/dec_rt_tasks() and was looking for advise too.
> 
> I might have just missed that we have rt_task_is_entity(), does things get
> better with the below? Otherwise I'll just need to find the time to figure out
> the code and test it properly. Thanks!
> 
> --->8---
> 
> diff --git a/kernel/sched/rt.c b/kernel/sched/rt.c
> index 96d37a1ccc2a8..520273086134d 100644
> --- a/kernel/sched/rt.c
> +++ b/kernel/sched/rt.c
> @@ -1132,7 +1132,7 @@ void inc_rt_tasks(struct sched_rt_entity *rt_se, struct
> rt_rq *rt_rq)
>         inc_rt_prio(rt_rq, prio);
>         inc_rt_group(rt_se, rt_rq);
> 
> -       if (!group_rt_rq(rt_se)) {
> +       if (rt_entity_is_task(rt_se)) {
>                 struct rq *rq = rq_of_rt_rq(rt_rq);
> 
>                 add_nr_running(rq, 1);
> @@ -1151,7 +1151,7 @@ void dec_rt_tasks(struct sched_rt_entity *rt_se, struct
> rt_rq *rt_rq)
>         dec_rt_prio(rt_rq, rt_se_prio(rt_se));
>         dec_rt_group(rt_se, rt_rq);
> 
> -       if (!group_rt_rq(rt_se)) {
> +       if (rt_entity_is_task(rt_se)) {
>                 struct rq *rq = rq_of_rt_rq(rt_rq);
> 
>                 sub_nr_running(rq, 1);
> 


Well I'm *thinking* it's the same thing :/, no?

  #define rt_entity_is_task(rt_se) (!(rt_se)->my_q)


  And look at this:

  static inline struct rt_rq *group_rt_rq(struct sched_rt_entity *rt_se)
  {
  	return rt_se->my_q;
  }




Also, my other test was for this case that you said:

"It also had a confusing call in sched_rt_rq_dequeue() to
dequeue_top_rt_rq() when it is essentially a dead code - in existing
code base at least."

It's not dead. My other test was just for that case. Normally it
should, but when we change root's cgroup cpu.rt_runtime_us to 950000, it runs.

Because of two things:


1. We remove dequeue_top_rt_rq() calls, and in root throttle path that is
the thing that preventing root from being selected with reseting
rt_queued.

2. We remove rt_queued itself AND remove the rt_queued check from
rt_rq_is_runnable().

So when we come to pick_task_rt() sched_rt_runnable() returns true,
and we don't return NULL.


Or, is my brain oopsed?

BTW, fixing both of these AFAICT requires bit of
doing the same thing as the commit we are trying to revert. So may be
dropping the revert would be better. Its up to you tho.


What ya think?



Cheers,

Kayra

