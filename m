Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=62.72.0.81
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792624904;
	b=PLMkO3K7NbAs8jkOg+mmmCO+OanG4VGXvLMm2LKX4o6He/Mq6dLXJ0Ov7tRr35Z93S09
	 2Fb0oTRjJqxaxLEUyPMUZM3Lzg0GNhPVzXt5PEb4cBwweq9q2LZqaV8Ol85mlZp+IgvP7
	 X6kG59YcdLZ9kjHywCFcdfJC8OUj5aCy+Q6bI5OUz+9d/X9k+fw+YSIWKDPHw7IoMYEfb
	 Xh4FXTq9rQkOQmPXJzo8leJ1lwrbRCtLwGRtgHPQEXyfddZQNGribtWtvY/nBZszKUw28
	 TcgupOm3Vfx8/i0kV7CQmE6yHeTMzaucnMDgZJJKY38e3/uAx86+U3r6gKTrL0S55Lg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792624904;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:From:To:cc:
	 Subject:In-Reply-To:Message-ID:References:MIME-Version:Content-Type;
	bh=lPG6V1ghBuG8rTEvN/M3Qly5oWIEdqplCPxBQkS7sVE=;
	b=U5IwbSEW5ZuN+7vDF7EvFjyJWlTEiDoCL3IqW0BQUa1+rBIfH87W2estbESI2djY8fWb
	 WNEsfektehDChYluClAlJwbmc+xXIzE6FHqlQMrIwfXoNc2fum6nj2B4ecA0c9jfANRsh
	 uGP1Nqho0VkZGupdiBle/4ONhkT71qHpksWTG6ASoTaxW/UO/ts7ces83HIL0pFWanzSS
	 CVbciz9c64CxgzNTM4W8Gfhux/jbAiFthJbWRThfe1vX2Bf+vmapSXyoullSEPDgSEVgC
	 L+0WPyzBWnZJJSWV8xTXzUbQ1xKImwTl4QMd4R+I4isEqsrtDu2WuM5qbLvsOkTWJxg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gentwo.org;
	spf=pass smtp.mailfrom=gentwo.org;
	dkim=pass header.d=gentwo.org header.i=@gentwo.org header.a=rsa-sha256 header.s=default header.b=c+kSGzsj;
	arc=none smtp.remote-ip=62.72.0.81
Received: from gentwo.org (gentwo.org [62.72.0.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D77B8606A31B
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 23:21:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D77B8606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=gentwo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentwo.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=gentwo.org header.i=@gentwo.org header.a=rsa-sha256 header.s=default header.b=c+kSGzsj
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gentwo.org;
	s=default; t=1792624367;
	bh=NhncZNOJbD4ToJsbO/WSMSq1VdJNFZgNrsDoBWmkVr0=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=c+kSGzsjwnPMjaOFljmo5JQGgHTxLMurNBIKDa1XPm4Ztpr3Tcc860enj8tacznI9
	 3/fa2VUlvcvlorbTPTiCPPvPaKRm9IwDZXbsIKPDr80YsTuAHSrpPmpXucyKTEpD9R
	 Mjll8XyyjxyiwxbdMN+HM/ZF7rd639VAs8rrTcO8=
Received: by gentwo.org (Postfix, from userid 1007)
	id CA0D4406DB; Wed, 21 Oct 2026 16:12:47 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
	by gentwo.org (Postfix) with ESMTP id C75954014B;
	Wed, 21 Oct 2026 16:12:47 -0700 (PDT)
Date: Wed, 21 Oct 2026 16:12:47 -0700 (PDT)
From: Shubhang <sh@gentwo.org>
To: John Stultz <jstultz@google.com>
cc: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>, 
    Juri Lelli <juri.lelli@redhat.com>, 
    Vincent Guittot <vincent.guittot@linaro.org>, 
    Dietmar Eggemann <dietmar.eggemann@arm.com>, 
    Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>, 
    Mel Gorman <mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>, 
    K Prateek Nayak <kprateek.nayak@amd.com>, 
    Connor O'Brien <connoro@google.com>, 
    Shubhang Kaushik <shubhang@os.amperecomputing.com>, 
    "Christoph Lameter (Ampere)" <cl@gentwo.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] sched/core: Use the scheduling context for remote
 ticks
In-Reply-To: <CANDhNCptx=Sqyb82XG6c5fQ-nW4V7LA6GxTMQqzfwoE-+q_9Dg@mail.gmail.com>
Message-ID: <dddbfac1-0d95-a94d-e413-5d497b7fc482@gentwo.org>
References: <20261021-remote-tick-proxy-v2-1-07890601a71e@gentwo.org> <CANDhNCptx=Sqyb82XG6c5fQ-nW4V7LA6GxTMQqzfwoE-+q_9Dg@mail.gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1618735823-1792624367=:135615"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1618735823-1792624367=:135615
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8BIT

Hi John,

On Wed, 21 Oct 2026, John Stultz wrote:

> On Wed, Oct 21, 2026 at 10:15 AM Shubhang Kaushik (Ampere)
> <sh@gentwo.org> wrote:
>>
>> sched_tick_remote() invokes task_tick() for rq->curr. With proxy
>> execution, rq->curr is the mutex-owner execution context while
>> rq->donor is the blocked task that supplies the scheduling context.
>>
>> A mutex-blocked task remains queued for proxy execution. If that task
>> is SCHED_FIFO, or the only SCHED_RR task, sched_can_stop_tick() permits
>> the full-nohz tick to stop. find_proxy_task() can then select its mutex
>> owner as rq->curr while retaining the blocked task as rq->donor.
>>
>> sched_tick() and hrtick() already invoke task_tick() for rq->donor.
>> Like task_tick(), the remote tick's full-nohz interval sanity check
>> currently uses rq->curr. The proxy owner in rq->curr can have a stale
>> se.exec_start before the accounting path updates it.
>>
>> Make sched_tick_remote() use rq->donor for both the class tick and the
>> full-nohz tick-interval sanity check.
>
> Hey! Thanks for chasing this down!
>
> Apologies, as full nohz is a bit of a blind spot for me, but it seems
> the commit message gets a little lost focusing on the proxy details,
> which makes it a bit harder to understand how the underlying
> assumption was broken.
>
> Maybe can I suggest reworking it to something like:
> ---
> In sched_tick_remote(), when adding proxy-exec support, an assumption
> was made, which was: we're in full dynticks mode, so there can be only
> one task on the rq.  With only one task, we can assume rq->donor ==
> rq->curr.  So there wasn't a need to switch rq->curr reference to
> rq->donor when proxy logic was added.
>
> However, the full nohz rules are more complex. If a SCHED_FIFO task is
> running, even if there are multiple tasks on the rq,
> sched_can_stop_tick() allows the tick to stop since there is no forced
> preemption of SCHED_FIFO. Similarly if there is only one SCHED_RR task
> the tick can be stopped even if there are other lower-sched-class
> tasks on the RQ.
>
> This means in sched_tick_remote(), there may be more tasks on the
> runqueue, which means we could be proxying (if a SCHED_FIFO task is
> blocked on a SCHED_NORMAL task) and and rq->donor may not equal
> rq->curr.  This earlier assumption doesn't hold, and the references do
> need to be switched to use rq->donor so the accounting is handled
> properly, and to make it more consistent with rq->donor useage
> elsewhere in the scheduler.
> ---
>
> Also looking I see the comment at the top of the sched_tick_remote()
> function "The [full dynticks mode] check is racy by nature" which
> makes me wonder if that might also be involved here, and worth
> mentioning?
>
> The code change itself looks good to me though, so after tweaking the
> commit message, feel free to add:
> Acked-by: John Stultz <jstultz@google.com>
>

Thanks for the review, agreed.
The full-nohz assumption is the important part:
sched_can_stop_tick() can legitimately stop the tick with multiple
tasks on the runqueue in the SCHED_FIFO and exactly one SCHED_RR cases.
A blocked SCHED_FIFO task can then remain rq->donor while proxy
execution runs its SCHED_NORMAL mutex owner as rq->curr.

The racy tick-stopped check can allow an extra or missed remote tick,
but is not required for the issue; the mismatch can occur while the
tick is legitimately stopped. I will clarify both points in v3 and add
your Acked-by tag.

Regards,
Shubhang Kaushik
--8323329-1618735823-1792624367=:135615--
