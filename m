Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793576458;
	b=uuyU5VYRcPJAR3hryfwEtCu6XGkwFO0wWQoj11BRbFWJJekZvIcHJO2LbpLLpfsZSURE
	 TXzOBb4Pd1jQ+cGbtAwd8Sz3FNx5YUIhdgVFoU2SNBqgrDm2yTHWRXwcxR0/OI4HeZehs
	 UReetJI3o7Ctn3bPtsmLW4uiTLG9ob+XfOYcMi5mbyGh8n7zadMC86bNz/LvH4qfhiSb7
	 B94KfMEplWCfjqcski4xL8+KMX6bMQ14ZhYGwKhEKDQMIS9CDX44/jSLQv+eTVL/mlJHi
	 o+9XAgmCRaIjlWv/dMeu39tXu7jvVUqxgS+JwsbMi7nFx9PRbBiVG7F7VNP9HQgAG3Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793576458;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:From:Subject:To:Cc:References:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=74HQukGUJ4C2yyxSBlp/m4XQnwuzePv4+DTCDFRGHbM=;
	b=0F4sXacOXvc+vdVO5g6CN5/8YJQG1wy9FKKkT/jukkkvDBRzXfQRE5MvIXd6rMafQpUO
	 t1l95NC2VD4ercUEcV8i8m3GKwSdRzjolm3VZiORN31ptsXkr9WTvIO94kC0DMvChGppm
	 AApUH98y8o/YW6ypLZAOlG/lK7H7BrQk4lLAi2CgdLgJI6OUaxud3HYaYT06jsFsruEZU
	 iAoaL6NuF1Bst45xkvOCrDtAWZda7QawvfvDU9f7NFzJT9So1hlYv+/HmFsJVhuMLCJ30
	 46rzDVYqeODOpDhoNYgMxpEDNgSL874ojBL4vQiuycOqKbMVacENdAHmzVkcAZbkAwQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=layalina.io;
	spf=pass smtp.mailfrom=layalina.io;
	dkim=pass header.d=layalina-io.20260707.gappssmtp.com header.i=@layalina-io.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=bOucPML2;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA0F9606A327
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 23:40:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CA0F9606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=layalina.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=layalina.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=layalina-io.20260707.gappssmtp.com header.i=@layalina-io.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=bOucPML2
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a35a60499eso23616195e9.0
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 15:40:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=layalina-io.20260707.gappssmtp.com; s=20260707; t=1793576456; x=1794181256; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=74HQukGUJ4C2yyxSBlp/m4XQnwuzePv4+DTCDFRGHbM=;
        b=bOucPML26sK51G3EMy6byEmq4KrbSaMXohO4qeYws1nKX4TnEEzDY+h05i37dd7qVu
         rQKhto6WFnUq1kh6gREzDxJiqLPW2JaTwzoY3lPq8/w4yfJmS7r2/t4HT3ksxbulF6fm
         E5a8f73xBjrmmfW7F0J+iAkoussgrDcWgyEpTNb184B8IOURRVtir8mZOpTIwMkrniRN
         XjfR33XZIexICQ1ZjXkIhMpeCtT9Zn8obi0JjUXWe4rQnmFFNS3nfJJrx8JhDax757ui
         vUPR4It3x+ifLzkStIC2KWJUWM4hhLR1rH4x6eOE4Y0+VAMFbIbBsbTqQJcFTzUma5KL
         gFnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793576456; x=1794181256;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=74HQukGUJ4C2yyxSBlp/m4XQnwuzePv4+DTCDFRGHbM=;
        b=nPVNkJZzZHaju0jTzHsb3OVtApK7lZFzeqRjzYPIl/cU7AWi0gu87N/hK7ykq48hdx
         vc1jo5owKm8+SWOIZxhrW9FpbNjQsCRSrjSGug5DHrwHn4L+zH955zGUtFuxnRjmdotG
         DnysdP2Mz9iOH/SGQVeA+WVkZH9ToYA9v9vofeeiA5agFCoBZjbKmp5hYoh7Z5rBrP3E
         fxI8nNyvn8X0cq0E/erLV1NJtVKl/j3qQs0/1wWRKZx229UXxhjPOzD7RNYpOhqpoPsJ
         Z9jFLVCZ6TI5I6tRbpmNKBhQjihVP0Sk0yTEpa1qgLp3InHp4rdRwLdn+QIusdzin2lU
         yudg==
X-Forwarded-Encrypted: i=1; AKwUvByD/4/IhheM5riouieUNuy9y5cSXPfJ3B5jxbj2rYm7KIzCPn0U4FzMrKxRD9A6nDRELfn2As+v2vARipI=@vger.kernel.org
X-Gm-Message-State: APuU4Z+/GGcXjmmgHkeA2hShvGSipVL5nc7/aOJ8GnU/SUw9LDoNck+Z
	BaYbC0HYW7mO/I1mdCmtzyP9VjD9JcmqMOlWx5JXr6Qk7epAVQUBukaPF/DuIEnf7yw=
X-Gm-Gg: AYBFou0xpLip1Gtf2KMp+lTbtsGO3Zt396idgLQSrhuEr02lKPWdObpPtu0u8SV7Kdo
	QjHn72fkrIZwlHpibG9tnsGvyIrfsBJlOukNosAdvEl82gNcTpgVGpU/l/U82dlzPSrUn7igHC1
	V+qegxPpDRy+sjz9TxO1+UPBF+Rk4KgutZwFihCkKGW5pQ8Nl8qHZOW5XNuJv5kexqWnDawUbm7
	LJwA0OL7rQr8I69SeVOnkg8WIDf7Qpmm5tCb/tZ1QTR0zpAovquGOsDDGHxEg83cbeSakt3/wiY
	Q+Mz+dhgOZluOgaAYgzewgCYOK2HNOQABFLa1N8mb9XqNcJOVDbjT8hsg3hS4Qc9Yw45FqOjYrr
	sNndkxb9MDc0xNCNnHZBCQfr7XGsjDHhafI5b3C5V5i+yJMBYWbFMljQ3DVc8po6de0YWaNs176
	lXjptPEgH4tuagtgfDcGhxcl8FZAzdiiTHWNDBkYgkldY8ULXA/shGAE1Pkd2pumAnz5I1pPFII
	OJwOA4uX/8awI9gozZdBxdKmQJEEHoeGPMe4HAgPbEwc4ETKuy3i7jqkDKPYiu2UXbyEM3kguy0
	bzGeyhg9kLyCj0LUmUiDjyteFDk42qphgvadamXxqnS4zM1g57PJz/5VQkpVqCATA/OmOSan1il
	LbGSmIzsC2PaN8/K+uNAiDP42a58ptHytn3Q=
X-Received: by 2002:a05:6000:4543:b0:487:6f2:1a4c with SMTP id ffacd0b85a97d-48e6e2fce14mr13432327f8f.25.1793576455447;
        Sun, 01 Nov 2026 15:40:55 -0800 (PST)
Received: from [192.168.0.219] (host86-128-182-179.range86-128.btcentralplus.com. [86.128.182.179])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71ba4ac6sm17598619f8f.52.2026.11.01.15.40.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 01 Nov 2026 15:40:53 -0800 (PST)
Message-ID: <438bb66b-f659-4de6-8acf-29df7f4a90f2@layalina.io>
Date: Sun, 1 Nov 2026 23:40:52 +0000
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
From: Qais Yousef <qyousef@layalina.io>
Subject: Re: [PATCH v4 1/2] sched/uclamp: Fix race condition leading to
 imbalanced uclamp_rq
To: Peter Zijlstra <peterz@infradead.org>,
 Christian Loehle <christian.loehle@arm.com>
Cc: Ingo Molnar <mingo@kernel.org>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>,
 Steven Rostedt <rostedt@goodmis.org>, John Stultz <jstultz@google.com>,
 linux-kernel@vger.kernel.org, Wei Wang <wvw@google.com>
References: <20261029131354.11030-1-qyousef@layalina.io>
 <20261029131354.11030-2-qyousef@layalina.io>
 <c4740152-e873-4409-b3a8-16c5a49548dd@arm.com>
 <d944d543-1756-43d8-aa08-bcbbf6df712f@layalina.io>
 <75772ae5-d297-4894-971a-683f92fb87a4@arm.com>
 <20261030112825.z7k57twgua27p2vu@airbuntu>
 <20261030121518.GE1813469@noisy.programming.kicks-ass.net>
 <20261030124119.xulxkpo7aas3wlwa@airbuntu>
 <7b9c9ab0-7b3d-414b-b1b1-5416be256cc7@arm.com>
 <20261030141317.GP1779021@noisy.programming.kicks-ass.net>
Content-Language: en-US
In-Reply-To: <20261030141317.GP1779021@noisy.programming.kicks-ass.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/30/26 14:13, Peter Zijlstra wrote:
> On Fri, Oct 30, 2026 at 01:21:30PM +0000, Christian Loehle wrote:
>> On 10/30/26 12:41, Qais Yousef wrote:
>>> On 10/30/26 13:15, Peter Zijlstra wrote:
>>>> On Fri, Oct 30, 2026 at 11:28:25AM +0000, Qais Yousef wrote:
>>>>
>>>>> Peter/Vincent, what do you think? It seems we have a schrodenger task that is
>>>>> both enqueued and dequeued simultaneously in these throttling paths. Shouldn't
>>>>> this be fixed? If yes, any thoughts on the right approach? Should we throttle
>>>>> if there are no other tasks on the rq too? I didn't realize the semantics are
>>>>> that strong for enforcing the quota.
>>>>
>>>> Urgh, nothing is ever straight forward is it ...
>>>
>>> Exactly my thoughts..
>>>
>>>>
>>>> Bah, so this is because the core does uclamp (for classes that have it
>>>> on) but then the class does the throttle without going through the core
>>>> {en,de}queue.
>>>>
>>>> Does it make sense to have throttle_Cfs_rq_work() and tg_unthrottle_up()
>>>> do uclamp_rq_{dec,inc}() respectively, along with the
>>>> {de,en}queue_task_fair() they're already doing?
>>>
>>> Yes it does, just wanted to make sure we agree the bug is there rather than in
>>> the current patchset approach.
>>>
>>> I remember seeing a patch to remove the uclamp_enabled bit and defer to
>>> enqueue/dequeue_task_$class to handle this instead. Maybe I can revive it if it
>>> makes more sense to go that way.
>>>
>>> Let me find the path of least resistance and add it to the stack. Not sure we
>>> want to tag as Fixes for LTS to pick up this independent fix. Note we have rt
>>> group throttling path flagged up - which I also thought was false positive but
>>> not sure anymore - but it seems to do partial dequeue and must be fixed in that
>>> regard anyway even if it doesn't force idle.
>>
>> I can reproduce the idle path without uclamp_rq_dec through sched_rt_rq_dequeue(),>> too, so IMO that needs fixing up as well.
>
> Right, every class that has uclamp_enabled needs to be audited -- this
> seems to include sched_ext.

It would be in theory an easy fix to pair uclamp_rq_{inc, dec}() with
{add, sub}_nr_running(); this should ensure the moment we remove or add is the
moment we inc/dec uclamp too.

There's a mess in RT case though that will require partial revert of
f4ebcbc0d7e00 ("sched/rt: Substract number of tasks of throttled queues from
rq->nr_running"); we should simply do {add, sub}_nr_running() in
{inc, dec}_rt_tasks() without the extra complexity. Also sched_rt_rq_dequeue()
calling dequeue_top_rt_rq() doesn't make sense when RT group isn't compiled in,
the function is a NOP (dead code) in this case.

I am not sure though how to handle when rt_se is a group not a task in
{inc, dec}_rt_tasks(). Should I do something like this?

@@ -1182,6 +1131,9 @@ void inc_rt_tasks(struct sched_rt_entity *rt_se, struct rt_rq
 *rt_rq)

        inc_rt_prio(rt_rq, prio);
        inc_rt_group(rt_se, rt_rq);
+
+       if (!group_rt_rq(rt_se))
+               add_nr_running(rq_of_rt_rq(rt_rq), 1);
 }

 static inline
@@ -1194,6 +1146,9 @@ void dec_rt_tasks(struct sched_rt_entity *rt_se, struct rt_rq
 *rt_rq)

        dec_rt_prio(rt_rq, rt_se_prio(rt_se));
        dec_rt_group(rt_se, rt_rq);
+
+       if (!group_rt_rq(rt_se))
+               sub_nr_running(rq_of_rt_rq(rt_rq), 1);
 }

I think this should make sure we keep rq->nr_runninng updated correctly. I can
then easily pair uclamp inc/dec for all classes.

I am not sure also I can come up with LTS friendly solution now. We either
have to live with the existing warning in uclamp_rq_dec_id() if active is set
but buctkets is empty for LTS since we should handle it fine anyway. Or drop the
fixes tag and let folks who want it backport. The former seems the less evil of
the two to me.

I have done the work above on this branch and gave it some verification, if you
can give it a quick go Christian to confirm the warnings disappear that'd be
appreciated. I just need to make sure I am handling group rt correctly and would
be ready to post it.

	git clone https://github.com/qais-yousef/linux -b uclamp-idle-fix
