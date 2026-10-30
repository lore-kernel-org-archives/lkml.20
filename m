Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793366501;
	b=jee0v19KjVBf5FWsOlFCuag7/k2jHS6jGKgEenAzrD4Ct6HyvQNUmMbd7cEwRzTM2whe
	 pN5fpboBFzYrYSnJTL7Y9Eo4JO6pbjkgGZfuzLXw98ddOJdYhI59cbPuII2IZsd+q48BT
	 FIaGNCK9QIooQRQbkGBuE4vtm/EBHuPVXZqdck+UYPzeayogma8Za7rFaesKZBfO+DM84
	 MAxKvR+DIV9tcr4ndytLzd1UhGEGYSW7g2KblN06YnVYb/o3yvB94HUukCv2t3yDukhzR
	 8mrl9xeIj7adIdXtHSKM6mSH6SL+Ait7CaeoQFlhEhAzHW9LW9mXsnC8Y6azpMrPsJA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793366501;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=3D3WvnGp8iPWKnjLe1gkjOHCbXQhTVXHr8KD/BbMSfA=;
	b=ps+MnTRPVczUJcX0W7rhAzD48KxFbdTQ4L9gapinzcrtzKJia9jDqls5N5/6OMHIJLH9
	 +Jy+TB8dYbcwbN5M2HuMXX15mr1I6Y4TOuh2b4PUKCpvOd9nF9Zwu9gaaR+F0BWS0X8fB
	 yHnPJzdW95wRva0eM1QFJRyQ0fgelvfvbhco9/hz++ven+pEGZuFyFRUb3L4C1lTH4ump
	 pnPMDJ1zF6HDM14p3q9o0vW/ga7gsbuYK8aJazSuMtCZCwdx6e2F2k3/HE0NZ2D9HvJOk
	 45xiipw7rNP18BZFytIwOtTLlMUB3F9/9C6yw0+o/dEpJ6pGCTxtbByd7A3gZY+ANgA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=c01RaonW;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E2771606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 13:21:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E2771606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=c01RaonW
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BE7601682;
	Fri, 30 Oct 2026 06:21:35 -0700 (PDT)
Received: from [10.0.128.129] (e127648.arm.com [10.0.128.129])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 148D83F59E;
	Fri, 30 Oct 2026 06:21:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793366498; bh=zkC/k4/QrOx0whEPhynn58TtusorvuJ7Lg9AYWA2pRw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=c01RaonWGf4NWz2U6GV15WpTwoiN6bJeHvfdGkSMKQeWKGcLE2OoBQwUQiPVI4dNP
	 TpSQCoWa4fQ+m9UhZ5XETmgAc0NT7wJ0OZngSKf7D6jLXzkAkH/Eo8u45lfE6Ijnz+
	 865+4ZuNXgaT9xOniq9OujO0iaHob+dqrgGbE19c=
Message-ID: <7b9c9ab0-7b3d-414b-b1b1-5416be256cc7@arm.com>
Date: Fri, 30 Oct 2026 13:21:30 +0000
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
To: Qais Yousef <qyousef@layalina.io>, Peter Zijlstra <peterz@infradead.org>
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
Content-Language: en-US
From: Christian Loehle <christian.loehle@arm.com>
In-Reply-To: <20261030124119.xulxkpo7aas3wlwa@airbuntu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/30/26 12:41, Qais Yousef wrote:
> On 10/30/26 13:15, Peter Zijlstra wrote:
>> On Fri, Oct 30, 2026 at 11:28:25AM +0000, Qais Yousef wrote:
>>
>>> Peter/Vincent, what do you think? It seems we have a schrodenger task that is
>>> both enqueued and dequeued simultaneously in these throttling paths. Shouldn't
>>> this be fixed? If yes, any thoughts on the right approach? Should we throttle
>>> if there are no other tasks on the rq too? I didn't realize the semantics are
>>> that strong for enforcing the quota.
>>
>> Urgh, nothing is ever straight forward is it ...
> 
> Exactly my thoughts..
> 
>>
>> Bah, so this is because the core does uclamp (for classes that have it
>> on) but then the class does the throttle without going through the core
>> {en,de}queue.
>>
>> Does it make sense to have throttle_Cfs_rq_work() and tg_unthrottle_up()
>> do uclamp_rq_{dec,inc}() respectively, along with the
>> {de,en}queue_task_fair() they're already doing?
> 
> Yes it does, just wanted to make sure we agree the bug is there rather than in
> the current patchset approach.
> 
> I remember seeing a patch to remove the uclamp_enabled bit and defer to
> enqueue/dequeue_task_$class to handle this instead. Maybe I can revive it if it
> makes more sense to go that way.
> 
> Let me find the path of least resistance and add it to the stack. Not sure we
> want to tag as Fixes for LTS to pick up this independent fix. Note we have rt
> group throttling path flagged up - which I also thought was false positive but
> not sure anymore - but it seems to do partial dequeue and must be fixed in that
> regard anyway even if it doesn't force idle.

I can reproduce the idle path without uclamp_rq_dec through sched_rt_rq_dequeue(),
too, so IMO that needs fixing up as well.
