Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793278676;
	b=KvW+XM6vpFjLYSq6NIk3cRNeGtiOgHRShfP31//SL7iUHSi+UVM1nAHCnPIYsteSrlxY
	 9cDb/WBdZOwDBYZBHYf5GOslireRtH+89Uuhrfn+NrrZ49noVPOI8LWyrAF0UQ7iRkQSo
	 CltdF1WT0rmF1E5nxIvs89txI/q0HoZP+w49FGyfT/zCCjCWaslt62wgpS9fihhSonypL
	 kqz+LL/cmVxgRe9TfQX2EV7Uoif6tFoND7beo+ARk4iTiy5299iVyoYkgSrSw6rX8y9/f
	 hoDRiNG6a24sAJwlu05yZIoxoxkLMzWJeiHp54i/XoiO5ZBZ/OJD5QIL3zYBa22S2hw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793278676;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:From:To:Cc:References:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=lORUDuD44P5apmR746epDN5dym1GQh15CCtLamHIWFs=;
	b=q79xiusyKhVKAMycLe38LOrs2jySNhkK2telr0S+Z8iJMo+i8MjCbVPJtFegvgnVyiJ5
	 P8BnNvU2SbG31RG7bpXPba7jI3100q1KQt81Y6Q6BwPI4jk9odOhzvy8bg9l/EvN3Dox5
	 Qmifm6sQCTaQ5r+y0bTGFhxgualsZl5n4cBz1SuUN8FzyjcKV+ZN4efd5yfsDS2qfVjpu
	 NAP5Btll6wUtJwauDfp3T6mXQUspBRBRcGoc+WroQkM4JCclNCiBB8GmLK/1TXnMUJVB8
	 PpOWMMMRCb8ds3CkfJGDabGQlwnBYbp5tIntyEF0Bf0Xz6nKCVGXoBB7umDAr86f2RQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=layalina.io;
	spf=pass smtp.mailfrom=layalina.io;
	dkim=pass header.d=layalina-io.20260707.gappssmtp.com header.i=@layalina-io.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=XYVlWQmP;
	arc=none smtp.remote-ip=209.85.221.53
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FF36606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 12:57:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4FF36606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=layalina.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=layalina.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=layalina-io.20260707.gappssmtp.com header.i=@layalina-io.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=XYVlWQmP
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-48df4f540ebso1037356f8f.3
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 05:57:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=layalina-io.20260707.gappssmtp.com; s=20260707; t=1793278675; x=1793883475; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=lORUDuD44P5apmR746epDN5dym1GQh15CCtLamHIWFs=;
        b=XYVlWQmP1gL0rdzvSX2PBxtass3NzTJcR41SBmfBqj7LAKpIZ6n/EzARwaGNZyW8zh
         pDDu3Pr6+Bsr0baa42HWNfpWENXF+Gv4FN16Yzw2EWEjFKijdOIYO9jlLUdEzYsmmXzQ
         9eOzRpjzmgwv0UUmMJgdcVmmNFDQ8LcipUaxa7zZiMrPZFSK8jGz14mVcOF+TMGATg8V
         zCbk9805xGLLx9vHAJhZdzJoPEVC23VLntXubqjWl+4LRJtleLrgCHka+MSyG1GVy/JF
         iHr3BdDaZRHQcIEGSE2L57RwIDosg70vv7fO0TMFo5NCx9JLftuvZGRKGwBJTHoYxIhO
         c1ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793278675; x=1793883475;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lORUDuD44P5apmR746epDN5dym1GQh15CCtLamHIWFs=;
        b=RdNHzLJrheWNV0OJRd2ImvSDkXtDAXS857l6zOnBSDH7diKAu9tLdeZk9rGjxg5FCh
         pA3saVl+rTT3JeX4ZKkHbmN2zhAtIg9ZFxzerULIk+fHWX43UnrjgL2ceQFWrrt3/ZGR
         4XGnTzH7aBvcEozuumJtPVGlZfoIrjWAPG6SZKxwkyUDPdfab1B007TR7Jd54rj+Bhm8
         HgvakzUACPPX/ldp7FF2zq3sRO260cIyX4zLnZ9CimhmIr09b2ECHq3vf6URGycbyL5D
         zRzkAPaT9wjDH8ciOLF/bDTTX5EPnLeVwYx8Wat1iC1MCdJLWoG/yzg+yQTr1ZmmDHK1
         Mckg==
X-Forwarded-Encrypted: i=1; AKwUvByEh3Dk7114mE+NsauNfZg46XRQdsvFiRP1KEt20XjChyEWCFBTEc9VHXM6syPHQe4hNKddFUsGJtYNl6w=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ+MzEj3D+yPJvP5+LHLs1/QfRMVY2dtf2KxZerYQEaqAySdU23
	wUrkDLiWfS1o78GAPuE4xZFmyD1LUo6AqYIYhiy43oU7MaTARJHBMVL2/7QMl6cGYUE=
X-Gm-Gg: AYBFou3Uqmf8prgDmIjQN1+KUrK3Yj8galDQ+gvAKp9VLGV/h1Lg3Del78Vz1VVvkuI
	Sl0M6NsUXt8WRE5e5pbfBmF1MQntJciRQLo1t+xswX3TP3EuxvGY59IVD33Gf5Klm29qkJ9lcVr
	ALzI2LobiRQPIJZn5y0IzlRoX2ZAD/hj8CtWi2u+AXC2jbChAEnoZae+FpzuwffEjF+2jZwA0u+
	Pb1QsfbYnOjuxLkijJukrwXeeWssJ6x73T5+tAn/CXMJlGI6+i6ltg9SOacuot02ADs4dnrj+3P
	2OTguj+X5bIj4wy4QHhKrrD3+YyhBearmCiBMT9wleSzIULzu8FRS1O+nfeXOm4jjxE71MQVS+q
	KjG55NbD/cWL+3hOR2MKqfATKzPX7C2LYDJBqRCdHbLMORWPwT4QYnvS3mQ3UXchSdKB2Gkueu+
	SmVUWcz5U+v9ok/0OqDSPf43Zk+ozTWDmpBOvF3f2mltCPDotS1oDZ3wZ752y5bm1jrYeoMD9FO
	KgFXqPC6Ai4GhrrBFcs4HmVfNPQOwNbgNi5+Zz1Y3gxRFdhRbMUUCm8bJtUb0bdqEMccpMzSnxQ
	xsaudU+VUVg4Z4t6Aa4lY1OQZCAzhEBnAtMTTWsdxMscp/5wGdxUssHKNXyg1+8ikRZp3KHXy88
	nooBVAbVjvkuBUA==
X-Received: by 2002:a5d:5f84:0:b0:48b:1a0:5630 with SMTP id ffacd0b85a97d-48e5d3063b6mr13743271f8f.41.1793278674655;
        Thu, 29 Oct 2026 05:57:54 -0700 (PDT)
Received: from [192.168.0.219] (host86-128-182-179.range86-128.btcentralplus.com. [86.128.182.179])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ecd39a9sm35661629f8f.46.2026.10.29.05.57.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Oct 2026 05:57:54 -0700 (PDT)
Message-ID: <5523c6e2-b791-448c-a587-d940dc0bfdbf@layalina.io>
Date: Thu, 29 Oct 2026 12:57:51 +0000
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
Subject: Re: [PATCH v3 1/2] sched/uclamp: Fix race condition leading to
 imbalanced uclamp_rq
From: Qais Yousef <qyousef@layalina.io>
To: Christian Loehle <christian.loehle@arm.com>,
 Ingo Molnar <mingo@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 Vincent Guittot <vincent.guittot@linaro.org>
Cc: Dietmar Eggemann <dietmar.eggemann@arm.com>,
 Steven Rostedt <rostedt@goodmis.org>, John Stultz <jstultz@google.com>,
 linux-kernel@vger.kernel.org, Wei Wang <wvw@google.com>
References: <20261028020512.10245-1-qyousef@layalina.io>
 <20261028020512.10245-2-qyousef@layalina.io>
 <97ab857d-9d9e-40d4-a243-253d1c2e411f@arm.com>
 <57277276-2115-446F-A339-DBD5373E4F1D@layalina.io>
Content-Language: en-US
In-Reply-To: <57277276-2115-446F-A339-DBD5373E4F1D@layalina.io>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/28/26 12:09, Qais Yousef wrote:
> On October 28, 2026 11:13:55 AM UTC, Christian Loehle <christian.loehle@arm.com> wrote:
>> On 10/28/26 02:05, Qais Yousef wrote:
>>> Static keys are not guaranteed to be enabled atomically across CPUs.
>>> Which means when sched_uclamp_used is enabled, some CPUs will return
>>> true for uclamp_is_used() while others won't, leading to asymmetric
>>> ulcamp_rq_{inc, dec}_id. If we decrement without increment this is safe
>>> as documented in the code. But an increment without a decrement is
>>> a problem and will leave the uclamp_rq in a corrupt state.
>>>
>>> The race for increment without a decrement is interesting as it means
>>> a CPU has seen the static key flipped and incremented while enqueueing
>>> a task, but the task was dequeued on another CPU that hasn't seen the
>>> static key flipped - we need to be wary this might be a symptom of
>>> something else going wrong.
>>>
>>> Plugging the race is hard as discussed in [1]. Take it for granted and
>>> do correction actions on going to idle to guarantee this state is
>>> transient for a short period after uclamp_sched_used is enabled.
>>>
>>> [1] https://lore.kernel.org/lkml/CANDhNCqyXsZ6G77z+9s=rTO6BZifRG9+hVxMTah+tAv6pB6h3w@mail.gmail.com/
>>>
>>> Reported-by: Wei Wang <wvw@google.com>
>>> Fixes: 46609ce227039 ("sched/uclamp: Protect uclamp fast path code with static key")
>>> Signed-off-by: Qais Yousef <qyousef@layalina.io>
>>> ---
>>>   kernel/sched/core.c  |  2 +-
>>>   kernel/sched/idle.c  | 17 +++++++++++++++++
>>>   kernel/sched/sched.h |  3 +++
>>>   3 files changed, 21 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/kernel/sched/core.c b/kernel/sched/core.c
>>> index d7c3b43158dea..c6780358a7975 100644
>>> --- a/kernel/sched/core.c
>>> +++ b/kernel/sched/core.c
>>> @@ -2111,7 +2111,7 @@ static void uclamp_post_fork(struct task_struct *p)
>>>   	uclamp_update_util_min_rt_default(p);
>>>   }
>>>   
>>> -static void __init init_uclamp_rq(struct rq *rq)
>>> +void init_uclamp_rq(struct rq *rq)
>>>   {
>>>   	enum uclamp_id clamp_id;
>>>   	struct uclamp_rq *uc_rq = rq->uclamp;
>>> diff --git a/kernel/sched/idle.c b/kernel/sched/idle.c
>>> index 76f3c84ca6846..c722b23e07dc2 100644
>>> --- a/kernel/sched/idle.c
>>> +++ b/kernel/sched/idle.c
>>> @@ -502,6 +502,23 @@ static void set_next_task_idle(struct rq *rq, struct task_struct *next, enum snt
>>>   	 * lost_idle_time of clock_pelt
>>>   	 */
>>>   	update_idle_rq_clock_pelt(rq);
>>> +
>>> +	/*
>>> +	 * Due to a race condition when enabling sched_uclamp_used static key,
>>> +	 * we can end up with imbalance where uclamp_rq_inc_id() has happened
>>> +	 * on a CPU without uclamp_rq_dec_id() on another CPU that hasn't seen
>>> +	 * the static key flipped. The race condition is unlikely, but ensure
>>> +	 * the uclamp_rq() state is set properly on each entry to idle.
>>> +	 *
>>> +	 * The reset will cause the uclamp_max from uclamp_idle_value() to be
>>> +	 * lost. Since we are imbalanced, hard to know what is right. So just
>>> +	 * cleanup. This should be a transient error state once we recover
>>> +	 * everything should work as expected.
>>> +	 */
>>> +	if (uclamp_is_used()) {
>>> +		if (unlikely(!uclamp_rq_is_idle(rq)))
>>> +			init_uclamp_rq(rq);
>>> +	}
>>>   }
>>>   
>>
>>
>> I haven't checked the other cases, but sashiko notes a few issues with this.
>> The sched_ext one and the core-scheduling cases seem legitimate, i.e. the idle
>> task may be scheduled while the rq actually isn't idle and clamps should be
>> maintained?
>>
> 
> I need to check in more details, but we can add rq->nr_running guard. Might need to audit other updates here too since we update clocks and load avgs, which might be fine

It seems we can end up with force_idle paths, yes.. I added a guard for 
rq->nr_running. Thanks!
