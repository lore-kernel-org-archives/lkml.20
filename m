Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793317431;
	b=SPQmzSXEbcLhJYyJd6YlmR5xMv4cCWQvu9/D6G3LmPjev88fdy1KgMhxg63EdtgMkJId
	 3wxqYQBP3jRwAkLW7IGn9v8fg1luAs1HttImdaTw/Oe/o+3d5L15XejEZ18TqwfhM3c6l
	 l/PhJLI+qLTQ+r5GcM/7RPHblKagqdEj+7c083NJtr54xUr2jHPJbXIQB1q7fh8b6S9yy
	 uF+q2EXl0qJpZwf63n2kGM73KfHJ39F9Ha+zAoH+yzdDfaJxg8nWlsvc+e+vgnrCN0Lwt
	 Tdw49CWEAWoOnYkovRXm+dAsYo0lm5BlPNIR+9HH4pXyH7FkhB7sb4eH9T823K3UkVw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793317431;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=wmmc84r4/2Hl8i/I7UeQPMcAyh9CTGMdHX+K9MQu8WM=;
	b=YCZ3Z6rIVvIXHt7oJdihkHXF4ONYvmBivWIXbxcj+YDzocIGoL6LQNjsVnCHdk9Yrwzx
	 bi5zo63Ju/ZuhtLrm+zCIOP66lA32tv3OIYM3bO8k6dpgqOK/g8gC5ruqmmtd1t7U9C5Q
	 MR4ZkyiOwbuTA21qeKr6pVDvdtMxL0tv7GOSY6UzKdS/k3R8pPJXhjy2foTgL1yz7gMLD
	 jra34I3aRzRNPk6XRpf0c6DsKUo+3e6xPVhyayY+R0BPURW3cwl49Vg1xdOY+q0kyaFID
	 yxwHeRcV5atDZeUoLuRxAZJ4AovqudENR0w2ytSqebK8qdD1jTpm3bjgIBKzesz6psg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=layalina.io;
	spf=pass smtp.mailfrom=layalina.io;
	dkim=pass header.d=layalina-io.20260707.gappssmtp.com header.i=@layalina-io.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=JvF1IKje;
	arc=none smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 227C9606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 23:43:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 227C9606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=layalina.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=layalina.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=layalina-io.20260707.gappssmtp.com header.i=@layalina-io.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=JvF1IKje
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-48dfc0421d9so116605f8f.1
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 16:43:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=layalina-io.20260707.gappssmtp.com; s=20260707; t=1793317429; x=1793922229; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wmmc84r4/2Hl8i/I7UeQPMcAyh9CTGMdHX+K9MQu8WM=;
        b=JvF1IKjeDN/m+IQK2yYZdb77lpAegD4mmANJeksb3B2TJzIq9iwq6eqQrscSba/XdS
         kYeDql+zj6i88A++E1GxL4kU6pg5S0spKiAzGqJivjwnyeEbHpSHNxemX9uLetbft2Oo
         Plep4HN36exTGMsnsRyYjf8PGJRnTIUU5222U0lnhvMfI2eNPZfnEFjVKII256yuECN7
         DXsQb4yPAd8sPGMdBMb4YlVP2GIc6+wZU8yUX6QXJzHgwBTG0bvuXTtYfD+hG6TPzh4D
         lENkJy2pXTObCv0wbcDzmXHCU0W0R2GQ8z94Nhx6+UjTEP4cWM4XgVsQDPVm36zrEKjz
         EzjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793317429; x=1793922229;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wmmc84r4/2Hl8i/I7UeQPMcAyh9CTGMdHX+K9MQu8WM=;
        b=wrfndismDj9Jf5QbPZ/XSAwMa1s7o5hHykLoOkqtymh05wtbYijvL/CIB8DMXjTPvs
         9CFKjWpdDjGm2BkUeiaGWt+f5DXk/75Iz5jGVfm+uoc9TYo9xMFjrtLqW8vJK2x5/Xhx
         BSC+EFN+5lHtfgMCDTscYr0jSPtnhHHkDsVGtGVQuyHDIpTh2c9XmvSGBNYoRes9MfAt
         5ZNzNwAgJeB5Kj+j3A0lakPWgXkU9vAbnKpO7Xn+SlgTDBPHPj0OdPh2k4sQAFFU4/6a
         CiqDCIioz2JyZZJv+3vGomu8I7bWIBxCjyTZTNDKk5EeqyNnXx9ju9ZBA9sYvLAqx/AV
         m9fQ==
X-Forwarded-Encrypted: i=1; AKwUvBzEZ/M8GeH8gHkqJpBeOiY1VdQY+AvJOaJ94WSrAwO24zpRXsl9UE6FpUWCGeRVxFTJRl+AUebYz+9ztMY=@vger.kernel.org
X-Gm-Message-State: AFq9FYJY183ep3cGYCU2PtJiuuYjyyx0wivK2YLH/NwadIgyIZCP0n23
	0KT6uof0ys088pnMqfp+j2bqRcxC4qpnCFaFos7SZ3TG+IQqcW3Ic7mkcZnz06sfzQg=
X-Gm-Gg: AYBFou0hFtd1BfcirRdw0CiPpWRYWGdHnCxkXCIq6yZRdVdX5Nj5ltq7BTWgmOBYHBX
	K1M3lskr+m+6AuMUxSz33VxkTCxv6nTkFweyL8O9EfXsJybbGLlUoVQ1/6NZrFZPWUa5KILf8Cd
	eoD/Ctmzj3grKzIzPtxFdvV+FExpTOIr5nRFviRBkWwy1yCWrBFY4PHEbXEinelvQMZQeeSxCwF
	cUcv6gJhS4t75vl1ET34+jUKModnpp5tXfqpl1QRTghpI9MY6li5N+W4VRYXzdZ8Foel/kWLQJk
	XbGpIawDGkTAI/c/KVtY4wfRKuG14UC5AiMjPDOshr8BRPWTT3X4jWy6LVINrFbPi19SYk248cW
	Cbu7Wjf5F5k0c302v1i9OFgwEaLSRCh512FkRH9PH6RYK6DUuxKVXP6cSYEW6o0tXq6Ko/MQoIa
	DFxZsRoAT2CgpehgE/iPMzWFlCQnD5VEwPgS7q5UA0zVklBdfl6zWMsOyedmsfRrCUQb4u59luJ
	kQGPCSd5y5MHzvMzqjoNb1HvaJihnWtnqRmJ2LTjRUJ4dYegJFCvsV5JsKJopQlYFncKGSa59YM
	JVPFWYyLaHWEfm6wCDxntrsm9qTPWJFW24q0CdQAIrzc3od0s1AzejtZ+2yeETImyPAcEMZqxq3
	BNotKUYVPmln4jEo=
X-Received: by 2002:a05:6000:2207:b0:48e:e98:8b6a with SMTP id ffacd0b85a97d-48e6e2db50fmr1588017f8f.4.1793317429326;
        Thu, 29 Oct 2026 16:43:49 -0700 (PDT)
Received: from [192.168.0.219] (host86-128-182-179.range86-128.btcentralplus.com. [86.128.182.179])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e712cc66bsm366817f8f.43.2026.10.29.16.43.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Oct 2026 16:43:48 -0700 (PDT)
Message-ID: <d944d543-1756-43d8-aa08-bcbbf6df712f@layalina.io>
Date: Thu, 29 Oct 2026 23:43:47 +0000
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/2] sched/uclamp: Fix race condition leading to
 imbalanced uclamp_rq
To: Christian Loehle <christian.loehle@arm.com>,
 Ingo Molnar <mingo@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 Vincent Guittot <vincent.guittot@linaro.org>
Cc: Dietmar Eggemann <dietmar.eggemann@arm.com>,
 Steven Rostedt <rostedt@goodmis.org>, John Stultz <jstultz@google.com>,
 linux-kernel@vger.kernel.org, Wei Wang <wvw@google.com>
References: <20261029131354.11030-1-qyousef@layalina.io>
 <20261029131354.11030-2-qyousef@layalina.io>
 <c4740152-e873-4409-b3a8-16c5a49548dd@arm.com>
Content-Language: en-US
From: Qais Yousef <qyousef@layalina.io>
In-Reply-To: <c4740152-e873-4409-b3a8-16c5a49548dd@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/29/26 15:58, Christian Loehle wrote:

>> diff --git a/kernel/sched/idle.c b/kernel/sched/idle.c
>> index 76f3c84ca6846..84301fc49e699 100644
>> --- a/kernel/sched/idle.c
>> +++ b/kernel/sched/idle.c
>> @@ -502,6 +502,25 @@ static void set_next_task_idle(struct rq *rq, struct task_struct *next, enum snt
>>   	 * lost_idle_time of clock_pelt
>>   	 */
>>   	update_idle_rq_clock_pelt(rq);
>> +
>> +	/*
>> +	 * Due to a race condition when enabling sched_uclamp_used static key,
>> +	 * we can end up with imbalance where uclamp_rq_inc_id() has happened
>> +	 * on a CPU without uclamp_rq_dec_id() on another CPU that hasn't seen
>> +	 * the static key flipped. The race condition is unlikely, but ensure
>> +	 * the uclamp_rq() state is set properly on each entry to idle.
>> +	 *
>> +	 * The reset will cause the uclamp_max from uclamp_idle_value() to be
>> +	 * lost. Since we are imbalanced, hard to know what is right. So just
>> +	 * cleanup. This should be a transient error state once we recover
>> +	 * everything should work as expected.
>> +	 *
>> +	 * We need to be careful of some paths that can force idle with tasks
>> +	 * are still queued.
>> +	 */
>> +	if (uclamp_is_used() &&
>> +	    !rq->nr_running && unlikely(!uclamp_rq_is_idle(rq)))
> 
> just checking nr_running isn't enough as CFS bandwidth throttling (a fun one
> recently!) will decrement it through dequeue_task_fair() without calling
> uclamp_rq_dec(), i.e. it's clamps must remain valid AFAICS.

I think this and the rt group throttling are false positives. Do they 
actually force idle or just under contention dequeue the task 
temporarily to allow other queued tasks to run?

If this is the last running task and throttling can force it off the 
queue partially then enter idle, I don't think the bug is here. It 
should do a full dequeue then. But I am not awfully familiar with this 
code, so could be missing something.

For context, below is Sashiko's full report. Proxy and core scheduling 
seems to cause temporarily context switch to idle. No idea about 
sched_ext. 3 and 4 seem false positive to me.

--->8---

Can calling init_uclamp_rq(rq) in set_next_task_idle() corrupt rq->uclamp
when the runqueue schedules the idle task while uclamp-active tasks are 
still
queued on rq?
In kernel/sched/core.c, init_uclamp_rq() zeroes all bucket->tasks counters
and resets rq->uclamp[clamp_id].value without clearing
p->uclamp[clamp_id].active on tasks that remain on rq:
kernel/sched/core.c:init_uclamp_rq() {
	for_each_clamp_id(clamp_id) {
		uc_rq[clamp_id] = (struct uclamp_rq) {
			.value = uclamp_none(clamp_id)
		};
	}
	rq->uclamp_flags = UCLAMP_FLAG_IDLE;
}
When those still-queued tasks are later dequeued, uclamp_rq_dec_id() in
kernel/sched/core.c sees uc_se->active is still true while bucket->tasks was
zeroed (or decrements another task's bucket reference count):
kernel/sched/core.c:uclamp_rq_dec_id() {
	if (unlikely(!uc_se->active))
		return;
	bucket = &uc_rq->bucket[uc_se->bucket_id];
	WARN_ON_ONCE(!bucket->tasks);
	if (likely(bucket->tasks))
		bucket->tasks--;
}
There appear to be several normal scheduling paths that reach
set_next_task_idle() while tasks remain queued on rq with
p->uclamp[clamp_id].active set and UCLAMP_FLAG_IDLE cleared:
1. With proxy execution enabled, proxy_deactivate() and proxy_migrate_task()
in kernel/sched/core.c call proxy_resched_idle(rq) ->
put_prev_set_next_task(rq, rq->donor, rq->idle) -> set_next_task_idle()
immediately before calling block_task() or deactivate_task():
kernel/sched/core.c:proxy_deactivate() {
	proxy_resched_idle(rq);
	block_task(rq, donor, state);
}
Here set_next_task_idle() zeroes bucket->tasks via init_uclamp_rq(rq), 
and on
the very next line block_task() -> dequeue_task() -> uclamp_rq_dec() ->
uclamp_rq_dec_id() triggers WARN_ON_ONCE(!bucket->tasks). Similarly,
find_proxy_task() calls proxy_resched_idle(rq) when a mutex-blocked 
donor and
other runnable tasks remain queued on rq.
2. With core scheduling enabled, pick_next_task() in kernel/sched/core.c can
force-idle an SMT sibling rq_i that still has runnable tasks queued when no
task matches the core cookie:
kernel/sched/core.c:pick_next_task() {
		if (!cookie_equals(p, cookie)) {
			p = NULL;
			if (cookie)
				p = sched_core_find(rq_i, cookie);
			if (!p)
				p = idle_sched_class.pick_task(rq_i, rf);
		}
}
3. With CFS bandwidth throttling enabled, throttle_cfs_rq_work() in
kernel/sched/fair.c dequeues tasks via dequeue_task_fair() directly without
going through dequeue_task() and uclamp_rq_dec():
kernel/sched/fair.c:throttle_cfs_rq_work() {
		dequeue_task_fair(rq, p, DEQUEUE_SLEEP | DEQUEUE_THROTTLE);
		list_add(&p->throttle_node, &cfs_rq->throttled_limbo_list);
}
4. With RT group bandwidth throttling enabled, 
sched_rt_runtime_exceeded() in
kernel/sched/rt.c dequeues the throttled rt_rq via sched_rt_rq_dequeue() ->
dequeue_top_rt_rq() without calling dequeue_task() and uclamp_rq_dec() 
on the
queued RT tasks:
kernel/sched/rt.c:sched_rt_runtime_exceeded() {
		if (rt_rq_throttled(rt_rq)) {
			sched_rt_rq_dequeue(rt_rq);
			return 1;
		}
}
5. With sched_ext enabled (where ext_sched_class sets uclamp_enabled),
do_pick_task_scx() in kernel/sched/ext/ext.c returns NULL when the local DSQ
is empty even if tasks enqueued on rq reside in a non-local DSQ or BPF
custody:
kernel/sched/ext/ext.c:do_pick_task_scx() {
		p = first_local_task(rq);
		if (!p)
			return NULL;
}
When any of these paths causes rq to schedule rq->idle while tasks with
p->uclamp[clamp_id].active remain on rq, wouldn't init_uclamp_rq(rq) wipe
active frequency clamps and corrupt the bucket task counts?
