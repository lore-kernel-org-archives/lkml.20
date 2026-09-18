Received: from mta0.migadu.com (out-176.mta0.migadu.com [91.218.175.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3F9F4F68C5
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 13:37:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789738633; cv=none; b=ICTJJQ/peu91dGDz4xUe7WKv8b/MhVV/UNpOdFrCkADF0/F499iskcCyMqwSaDNVQ1EANaEI3nlwvGJi+vqt47rKSj0/a1zm4JDPoFR0SN+9t9R5qfEL9rM+0aPt4QS6LeEdGA2mIfpvb6Y/emrIjeU30LdaKFlCia8ghL0NKng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789738633; c=relaxed/simple;
	bh=Gn9qlANnDHKqEExXLVsEI54wLRFoEAS2oPHH7WQAms0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CgVrTWdmUwtHfK+uAEijmdDSMgSO9TD/MbH8bBTMBDVhQnTTm7jwFJPm5bDwiCg1UeHFkmSAog0u84VLxQ8KqN0Nh3MMNbdxwuYQ3Ubmtb97nzSOpCV0PSMaut20DSqloR0bJFXs0F7lEYGvoiU00fK6qrPIUvqEaLLolI0B63U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=wVvZ+aBX; arc=none smtp.client-ip=91.218.175.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="wVvZ+aBX"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=Gn9qlANnDHKqEExXLVsEI54wLRFoEAS2oPHH7WQAms0=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789738628; v=1; x=1790343428;
 b=wVvZ+aBXHDyUae3OYLAWOtjkUGgx7RXiH0DndIokQEmp9xrZvx+lnzwSbS2eoLNm0EhEWFDe
 RchoM/ywq1dmMn+0LLEw6FIpWkSHRnaYtnz1g95hb7LkI3hf3PdETHwBh3Wwja2VLVS3OSnyQV7
 YNdsiGHKsBdQ9gmF9bnZFlfA=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 005886009e64175d;
	Fri, 18 Sep 2026 13:37:08 +0000
X-Mizu-Trace-ID: 005886009e64175d
X-Migadu-Flow: FLOW_OUT
Message-ID: <7989bcf2-b37e-4a3e-ba9f-f13fcf4c1e48@linux.dev>
Date: Fri, 18 Sep 2026 14:37:08 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tick/nohz: Avoid unused timekeeping_max_deferment() calls
To: Frederic Weisbecker <frederic@kernel.org>
Cc: anna-maria@linutronix.de, linux-kernel@vger.kernel.org, mingo@kernel.org,
 tglx@kernel.org, hannes@cmpxchg.org, shakeel.butt@linux.dev, riel@surriel.com
References: <20260917163929.1271332-1-usama.arif@linux.dev>
 <aq0pp8VCIyc3t-k_@localhost.localdomain>
Content-Language: en-US
From: Usama Arif <usama.arif@linux.dev>
In-Reply-To: <aq0pp8VCIyc3t-k_@localhost.localdomain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 18/09/2026 13:08, Frederic Weisbecker wrote:
> Le Thu, Sep 17, 2026 at 09:39:29AM -0700, Usama Arif a écrit :
>> tick_nohz_next_event() limits a CPU's sleep interval to the maximum
>> deferment supported by the current clocksource when that CPU owns the
>> do_timer() duty. If the duty is unassigned, the limit also applies when
>> the CPU's TS_FLAG_DO_TIMER_LAST flag is set.
>>
>> After the early timer checks, the function currently reads the maximum
>> deferment unconditionally. It then replaces the result with KTIME_MAX
>> unless one of the two conditions above applies.
>>
>> timekeeping_max_deferment() performs a seqcount-protected read of the
>> shared timekeeper and follows its clocksource pointer. Check the do_timer
>> state first and avoid this work when the result would be discarded. This
>> leaves the resulting expiry unchanged and reduces accesses to timekeeper
>> data that is modified regularly.
>>
>> On x86-64 this removes 18-20 dynamically executed instructions, including
>> the call, from the common non-owner path when the seqcount does not retry.
>>
>> Signed-off-by: Usama Arif <usama.arif@linux.dev>
>> ---
>>  kernel/time/tick-sched.c | 23 +++++++++++++++--------
>>  1 file changed, 15 insertions(+), 8 deletions(-)
>>
>> diff --git a/kernel/time/tick-sched.c b/kernel/time/tick-sched.c
>> index c8f2c4a503b08..e7c7c28311156 100644
>> --- a/kernel/time/tick-sched.c
>> +++ b/kernel/time/tick-sched.c
>> @@ -872,18 +872,25 @@ static ktime_t tick_nohz_next_event(struct tick_sched *ts, int cpu)
>>  	 * If this CPU is the one which had the do_timer() duty last, we limit
>>  	 * the sleep time to the timekeeping 'max_deferment' value.
>>  	 * Otherwise we can sleep as long as we want.
>> +	 *
>> +	 * Only read the max deferment in the former case: it is a seqcount
>> +	 * read of the globally shared timekeeper, and on a large machine
>> +	 * almost every caller is not the do_timer() CPU and would throw the
>> +	 * value away.
> 
> I don't think that needs a comment.
> 
>>  	 */
>> -	delta = timekeeping_max_deferment();
>>  	tick_cpu = READ_ONCE(tick_do_timer_cpu);
>>  	if (tick_cpu != cpu &&
>> -	    (tick_cpu != TICK_DO_TIMER_NONE || !tick_sched_flag_test(ts, TS_FLAG_DO_TIMER_LAST)))
>> -		delta = KTIME_MAX;
>> -
>> -	/* Calculate the next expiry time */
>> -	if (delta < (KTIME_MAX - basemono))
>> -		expires = basemono + delta;
>> -	else
>> +	    (tick_cpu != TICK_DO_TIMER_NONE || !tick_sched_flag_test(ts, TS_FLAG_DO_TIMER_LAST))) {
>>  		expires = KTIME_MAX;
>> +	} else {
>> +		delta = timekeeping_max_deferment();
>> +
>> +		/* Calculate the next expiry time */
>> +		if (delta < (KTIME_MAX - basemono))
>> +			expires = basemono + delta;
>> +		else
>> +			expires = KTIME_MAX;
>> +	}
> 
> If anything, it also makes the code more readable. You can even remove the delta
> variable because even in its former use in the function, it's an unecessary
> middle step.
> 
> Thanks.


Thanks for the review! I have sent a v2 to address above in [1].

[1] https://lore.kernel.org/all/20260918133408.2834751-1-usama.arif@linux.dev/

> 
>>  
>>  	ts->timer_expires = min_t(u64, expires, next_tick);
>>  
>> -- 
>> 2.53.0-Meta
>>
> 

