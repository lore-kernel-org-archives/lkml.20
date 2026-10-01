Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC327401A14
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 14:01:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790863281; cv=none; b=nOAYTbplRqrNp8kWdbFOcO4KotmqoWZLN559+L29iy7DK+HKkjtruWvIe4k27Y1LiTvkdzM2h5fMy9ACTYLpnfzTfO1HSiC0slvdphIcywkQ/yPTYsUT2ahl6INzEt1WHdIO/0RP8D3BaWTmclTE3k7RycTWeTvpA3Xjj6rJV6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790863281; c=relaxed/simple;
	bh=n5aWS0ULpOL2AhyssTaA1Cyp54vlbwJfgUJL3xmyGf8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pFJRd6v1okOpWJUYW6NG80OlgeWQHqK1+ulD8pmopAM15YiqNmJopqM9icGgctz0X2kgyssDNP2+oOSqdUGyn1AsrWyLLGpCRPI/Rn8q9QWDyHq3RixOTMKdKv0GF3cqxY+OBgR0SBWPFBQuV+vg8Fd7vzUcCmIQ+ImLmc1i9uQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=GGtGHLmH; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="GGtGHLmH"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B45F2497;
	Thu,  1 Oct 2026 07:01:15 -0700 (PDT)
Received: from [10.0.130.165] (e127648.arm.com [10.0.130.165])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4E8143F86F;
	Thu,  1 Oct 2026 07:01:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790863279; bh=n5aWS0ULpOL2AhyssTaA1Cyp54vlbwJfgUJL3xmyGf8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=GGtGHLmHzzR/6LhExjkZmhycifHVPY23UIW/e6IHgoSbFPDwLKOoBzl1CKlMzCQNo
	 LLzEcrLyE8obY4ogt/OktJJi8IhLQ5TYOzHNV491oxV8SZ6U0czmSHoD6L6rq7CcBv
	 K/pHUdlY7apO5s4j5iUpPnQwvSkchlydwlLFSXlw=
Message-ID: <9c7570ca-7d26-4497-ad11-bf5ce16cea83@arm.com>
Date: Thu, 1 Oct 2026 15:01:15 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/5] sched/fair: Take slice protection into account
 when arming HRTICK
To: Peter Zijlstra <peterz@infradead.org>
Cc: linux-kernel@vger.kernel.org, mingo@redhat.com,
 vincent.guittot@linaro.org, dietmar.eggemann@arm.com,
 kayracizmeci@gmail.com, kprateek.nayak@amd.com, elif.topuz@arm.com,
 sh@gentwo.org
References: <20261001134016.3881268-1-christian.loehle@arm.com>
 <20261001134016.3881268-2-christian.loehle@arm.com>
 <20261001134320.GR2009045@noisy.programming.kicks-ass.net>
Content-Language: en-US
From: Christian Loehle <christian.loehle@arm.com>
In-Reply-To: <20261001134320.GR2009045@noisy.programming.kicks-ass.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/1/26 14:43, Peter Zijlstra wrote:
> On Thu, Oct 01, 2026 at 02:40:12PM +0100, Christian Loehle wrote:
>> EEVDF can end a task's slice protection before its virtual deadline when
>> shorter requests compete on the runqueue. update_curr() requests a new
>> selection once protection expires, but hrtick_start_fair() still arms the
>> timer for the virtual deadline. Without an intervening scheduling event,
>> the next opportunity to reconsider the task can therefore arrive much
>> later than the protection boundary.
>>
>> Arm the fair hrtick for the earlier of the virtual deadline and live
>> slice protection. Keep the deadline fallback once protection expires.
>> With RUN_TO_PARITY disabled, vprot remains the minimum progress quantum,
>> so the timer must reconsider current at that boundary too. A same-task
>> repick restarts the timer without renewing protection, so newly eligible
>> tasks can compete without waiting for another protected quantum.
>>
>> A wakeup can shorten protection without preempting current. The enqueue
>> path calls hrtick_update() before wakeup_preempt_fair() updates protection,
>> and hrtick_update() leaves an active timer alone. Recompute the fair
>> hrtick after update_protect_slice() changes vprot, including when a timer
>> is already active. If the new protection boundary has already passed,
>> request lazy rescheduling, as update_curr() does on protection expiry,
>> instead of falling back to the later deadline.
>>
> 
> Right, so I don't much like this. This wrecks the steady state behaviour
> in favour of our 'dodgy' wakeup heuristics.
> 
> I would much rather we stick to the paper for steady state, and let
> wakeups be wakeups.

Alright, I guess the same reasoning then for 5/5?
Again these are all just from throwing a bunch of artificial rt-app tests
against Vincent's patchset and seeing what sticks...
