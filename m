Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793842303;
	b=RLN2keQHYDZnb1KefPFOOaIpwTXxumgxlWyX0d75UpLNJQ9zVWJ76AUrqM6UBSEsm8jU
	 RN3+4JWkTgX+Og7Vgi4mGTWSaZX2WlX6TtoKdmTLpYEfqvU3TYDelGD5YiiCr9kWoPU22
	 qdtnCfILQWn8rtHC7blVhebJ8h9LA5Fauq5yc1m65qoMlrWod7Sex4F+ruKZo6Cug+W6B
	 /Wx37utx+POPEvjNa0xMIrm9anGAifIxdWER1u3WSh0MLgwgKhVVVO9pY+xnECZ7TGp5V
	 uMnaaPjqhO/aBxSjJbAfxb/fi6v+tALpc2Gh7++5Yrv3vVCO48khN8jYuXIKGVasahg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793842303;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=JLmWBKBg3eGd3tZYxEsm6k7nPECbaO41XaN1QBV12SI=;
	b=INvpqYYdcz59jd3WcN2+V6bN7Y7/n9SdllGPHG5IxKt/Hs2zph7sOyiLi4NQyPiATsWA
	 XquFUa2Fob7JHtG6yGENU7WLp6Ae5QnznAHNQKklCHK9ta5DvGiuHIo7orUWu74dKl0NW
	 ZY58nr71C1YrB/gl8LL+UWZEPslDWUGwKOjEFG80gh+pn3aZcp2WnphT5Q+idPJb9pgaK
	 SgrKsf1pvKCd5wpmk/S2yWY9ax9wVcXTB3GEiezB3PkVgpJe3ZZPgIP5onGsyOnZHrUNr
	 BrbTre2w4lRKfyc9xNHgunx1t0mp5sLBh7EwUZ/c5/AiosCtUbeT2hZiR6MOgIl7qEQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=layalina.io;
	spf=pass smtp.mailfrom=layalina.io;
	dkim=pass header.d=layalina-io.20260707.gappssmtp.com header.i=@layalina-io.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=T3XtYAmn;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC30B606A31B
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 01:31:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AC30B606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=layalina.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=layalina.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=layalina-io.20260707.gappssmtp.com header.i=@layalina-io.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=T3XtYAmn
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a1b07c3c5fso11674405e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 17:31:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=layalina-io.20260707.gappssmtp.com; s=20260707; t=1793842301; x=1794447101; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JLmWBKBg3eGd3tZYxEsm6k7nPECbaO41XaN1QBV12SI=;
        b=T3XtYAmn/YL2Jaa4b7CXx7WOYxKldBEXtKk8EHCLKqoKN13jQ0G1qJPyrVzCGlPqRZ
         8wIFoJKBUw4KYeVChKTolfVH0QTot74STI49BC7aXAw2BE2agKhdB9znu9rFa1ERpomD
         snbmlsqJQV6mWsQa57IRKLqLVCJNpDWqghMKnpoSM9yvr/28hAcicXa+cX2zo2gX2jre
         B1Z68ChcBY7wiiHA+kmL1Av3vwN3Q9BWFZ85wvcs5kI6GSYs+2tQ3mrCmJUqDYp71+HU
         XTD+2Mt0TnKpMttc4j/HvV8ipfi1RlZbR5W9C1+6uX87/rYpix31vz9sVEtU4EAxTte2
         MxIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793842301; x=1794447101;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JLmWBKBg3eGd3tZYxEsm6k7nPECbaO41XaN1QBV12SI=;
        b=TC133wbNmdnGSm2/TTDAyZbvUBTlfwlEaBiHU1YS8ABEtCAO4qVSEK40UFKXDOG2Q3
         hEg9iD7TSIC2r/QklSwxSrfS6UszZMGqijI1IG3cToHPU1CP3WlXj/3AfUP/mm23fhj3
         +Of58bxrl11UCDcWLYcQ3Hr5C0kHf5XGbQ08iY8J0HAIh3hqosNOL3r4vaOqn/q9rSny
         8690Mpk33FGVvELJReCaS5BzanujPDhzYH8X0+V2pykjnoZJED1ioj36/cyMXiZWAIQH
         Rrc9lUxPWwpgnBO19fNGuRefFq940xPgdGfm/mfoKWGa3FoWPD0tGcF6nD/D2YzAWDmm
         vV9Q==
X-Forwarded-Encrypted: i=1; AKwUvBzTkGO38qnVMhFk4mprKRPuorskBSm1qG724zuAOnpOatwpT5DtUAjDfGh7S7Q4eWNRYUmVWBj7CoddYLE=@vger.kernel.org
X-Gm-Message-State: APuU4Z9rGxcCLh4iMi+2lBPMRB196jczWwSFbFQP7j382WAt2iZhvYfx
	e26WjM4r5UIDpQf8yrSSJgzoagDnwfc8FA1nzSbFC+pZhSbVaQnsyTpOZ1y0/QhTD7iujBBhyc4
	r2S6KVmk=
X-Gm-Gg: AYBFou3y9k4hbnl9nvFW5fN0JS5MEQ16UsDRy5yeRETl1uOn8ieOCELrty9KtcVCjlf
	dIQqTqOBuZRaZV8KAV664aSbQ7IjGa9n6hGQQQ1E3HgtHVoodWpQkTIaALZ7E6uvr4s2u6ixBUh
	eDGGirlWr1yglnT+MFVa5ttQkN1la14gbbKXwrU4vT3Nsr1nd/UopdpR5/FPCXEw3rLy4CyDro9
	Wvqj3kU+CH2tiJQ6ZHVrIb+Gz/q72MqtOHGjas6Yesy7TDbuYOoJRxX76CHa7NvTCVdQ/a+Punx
	A9s9L9nJxokOBo7PB8Dv/Ty+F/z81ZUqmKX39ek9CbiugNgq8+XnQtONMPDKx9osaVBLoUL1Wz0
	tByCy43IZwjgiEvCFRHzNCD9JhCU7R1bQdZAnCtmTfLgGGyuzM1lcYfdz5XVWBBC1XbtZHhRWhz
	1nmBSB2Hg728n4Q4G2MsA1uC3M02IOadRx59HtpMr2c9fE8X1DTZOTbSHjL9wSpasc8XENwmtzh
	D4iVpqT6bkvgIVIS8Fr2iD7ELc8OXT1yDsJlQ1hLQS/aNNoVEK2Wbb9fSevP01nOQK7I/w1qfrD
	xC+0T+7ADecRON+pRttoUOI9aZEZb+ZzYgFTUJqKCv5S0ivLkaqy7MCUFOTQ3NOfND4/QYtPpwu
	muWkD0oJT08x0EmaAZ+Hs7KNwAqODgfXeIA==
X-Received: by 2002:a05:600c:8b01:b0:4a2:74f:46c1 with SMTP id 5b1f17b1804b1-4ac1737c682mr398419395e9.8.1793842300720;
        Wed, 04 Nov 2026 17:31:40 -0800 (PST)
Received: from [192.168.0.219] (host86-128-182-179.range86-128.btcentralplus.com. [86.128.182.179])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b414b170d0sm63919195e9.1.2026.11.04.17.31.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2026 17:31:39 -0800 (PST)
Message-ID: <8401ef7a-de1a-4cb2-a3eb-be02a8436360@layalina.io>
Date: Thu, 5 Nov 2026 01:31:37 +0000
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
Subject: Re: [PATCH RFC v5 3/4] Revert "sched/rt: Substract number of tasks of
 throttled queues from rq->nr_running"
To: Kayra Cizmeci <kayracizmeci@gmail.com>
Cc: Ingo Molnar <mingo@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 Christian Loehle <christian.loehle@arm.com>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>,
 Steven Rostedt <rostedt@goodmis.org>, John Stultz <jstultz@google.com>,
 linux-kernel@vger.kernel.org
References: <20261103005953.56271-1-qyousef@layalina.io>
 <20261103005953.56271-4-qyousef@layalina.io>
 <auoRQiZbirZCFF1x@scheduler.schedules>
Content-Language: en-US
From: Qais Yousef <qyousef@layalina.io>
In-Reply-To: <auoRQiZbirZCFF1x@scheduler.schedules>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/3/26 18:51, Kayra Cizmeci wrote:

> So, as I was saying above I gave this a run. Did some tests:
> 
> In my base a RT task can only get a CPU's %95.5, with the series %99.9.
> Even when rt_throttled is 1, task doesn't stop running. I opened
> CONFIG_RT_GROUP_SCHED and set cpu.rt_runtime_us to 950000. cgroup v1.
> 
> 
> And AFAICT from the code and my tests, nr_running is handled
> differently/wrong with this patch.
> 
> When there is a RT group while throttling is enabled, with 2 tasks when
> the group throttles nr_running should be 0. Since, there is nothing to
> run. (If the group is alone in the rq tho :>) But with the patch series,
> it stays 2. I think it's because dec_rt_tasks() does not call
> sub_nr_running() in the group_rt_rq() case of se.
> 
> 
> Or am I missing something :-)?

This is an RFC as I was looking for potential historical context why it had to
be done this way. I did call out in the cover letter that I am not sure about
the implementation of inc/dec_rt_tasks() and was looking for advise too.

I might have just missed that we have rt_task_is_entity(), does things get
better with the below? Otherwise I'll just need to find the time to figure out
the code and test it properly. Thanks!

--->8---

diff --git a/kernel/sched/rt.c b/kernel/sched/rt.c
index 96d37a1ccc2a8..520273086134d 100644
--- a/kernel/sched/rt.c
+++ b/kernel/sched/rt.c
@@ -1132,7 +1132,7 @@ void inc_rt_tasks(struct sched_rt_entity *rt_se, struct
rt_rq *rt_rq)
        inc_rt_prio(rt_rq, prio);
        inc_rt_group(rt_se, rt_rq);

-       if (!group_rt_rq(rt_se)) {
+       if (rt_entity_is_task(rt_se)) {
                struct rq *rq = rq_of_rt_rq(rt_rq);

                add_nr_running(rq, 1);
@@ -1151,7 +1151,7 @@ void dec_rt_tasks(struct sched_rt_entity *rt_se, struct
rt_rq *rt_rq)
        dec_rt_prio(rt_rq, rt_se_prio(rt_se));
        dec_rt_group(rt_se, rt_rq);

-       if (!group_rt_rq(rt_se)) {
+       if (rt_entity_is_task(rt_se)) {
                struct rq *rq = rq_of_rt_rq(rt_rq);

                sub_nr_running(rq, 1);

