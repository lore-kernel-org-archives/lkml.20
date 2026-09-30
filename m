Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9A353E315C
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 19:37:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790797026; cv=none; b=lvruQOkNdGx6qLd6L81Mo2nWqO6+AEDs6k+C+WC9BfzdqDIkoKV9qtGmq612/c3z+Rw6AHZL93ecroT50UlnRJH/Guaelt/vwcqiFxhhYpheT+dx1H/t3RQuZpsMpKdYBdHzXz4r6j3RNnvN0wvhMS95+BI9mbft4JJqInnp9hU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790797026; c=relaxed/simple;
	bh=8P29LOmFjgcISOAW4/oHY1+cnoKgk0nwXWScc9rmSEA=;
	h=From:To:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Xkaxf3cszq3OxB+/N24ypW2IxQHDXy4pOYvpxDqUyugkeiwcwUTCGOJCho+1EhUwHdueK5NZDixWuvpI83QDuNgAffLBjiy209tkhz5gzgcViMn9OO5z5qaaBDl9se5fRfbOVjCpa3/jce/+61o022+QuaaFgMYyXGfjTae5ZQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=m2QPiZ5j; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="m2QPiZ5j"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B4F41F00898;
	Wed, 30 Sep 2026 19:37:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790797024;
	bh=w2qh18/xuz3/VOI454cQgEZkqBks5yM6N0YivZBgREY=;
	h=From:To:Subject:In-Reply-To:References:Date;
	b=m2QPiZ5jdvyS2B/IXrVQ2pZOQ6S/D8VQFOrUKxEzRi/iX1URh94APMEWdtpi2Jv32
	 t3VR3ZdySb30kq2K9flh9RoPaKTOPGcJLi0s6BxcHFX22mHbFm7LBv5FSqgkudAV8D
	 k5+SG9PJTqVPfXnPkE11JGfdNXuTP8NXwDP7YijWblxFn78SAru7enkAjD1aHfl9dp
	 1hqfE1IepL2r3YIsvYmvmtSG9nycORraki68w2qWIigJnioQMiYznjUnWzxRFCnx+v
	 LvRI6XX3aW5UqeBpQO/emJde6wq9j7ST1pOCoDyLG0mprtU70zdgrF9rUbsWeuuuOq
	 VxMy4qIHmFqpg==
From: Thomas Gleixner <tglx@kernel.org>
To: Sergey Shtylyov <s.shtylyov@auroraos.dev>, Anna-Maria Behnsen
 <anna-maria@linutronix.de>, Frederic Weisbecker <frederic@kernel.org>,
 Ingo
 Molnar <mingo@kernel.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] tick/sched: check skew_tick kernel parameter's validity
In-Reply-To: <d95d424c-77a7-4c59-a7cb-9e547af7461c@auroraos.dev>
References: <20260829202535.46470-1-s.shtylyov@auroraos.dev>
 <87ecebj080.ffs@fw13> <d95d424c-77a7-4c59-a7cb-9e547af7461c@auroraos.dev>
Date: Wed, 30 Sep 2026 21:36:57 +0200
Message-ID: <87tsn6h6p2.ffs@fw13>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Wed, Sep 30 2026 at 22:01, Sergey Shtylyov wrote:
> On 9/29/26 11:01 PM, Thomas Gleixner wrote:
> [...]>> In skew_tick(), the result of get_option() call is ignored, so even if a
>>> value of the skew_tick kernel parameter was not specified (or specified
>>> as a list or range), the kernel won't complain. Add the missing check...
>>>
>>> Found by Linux Verification Center (linuxtesting.org) with the Svace static
>>> analysis tool.
>>>
>>> Signed-off-by: Sergey Shtylyov <s.shtylyov@auroraos.dev>
>>>
>>> ---
>>> The patch is against the timers/nohz branch of the tip.git repo...
>>>
>>>  kernel/time/tick-sched.c | 3 ++-
>>>  1 file changed, 2 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/kernel/time/tick-sched.c b/kernel/time/tick-sched.c
>>> index c1ee0b256445..34ceccdd49b5 100644
>>> --- a/kernel/time/tick-sched.c
>>> +++ b/kernel/time/tick-sched.c
>>> @@ -1483,7 +1483,8 @@ static int sched_skew_tick;
>>>
>>>  static int __init skew_tick(char *str)
>>>  {
>>> -     get_option(&str, &sched_skew_tick);
>>> +     if (get_option(&str, &sched_skew_tick) != 1)
>>> +             return -EINVAL;
>>>
>>>       return 0;
>>>  }
>> 
>> sched_skew_tick should be converted to bool and this function should
>> simply do:
>> 
>>        return kstrtobool(str, &sched_skew_tick);
>
>    Thanks for your comment!
>    OK, I'll do that (and add the Suggested-by: tag, of/c)...
>
>> And to make it complete, sched_skew_tick should be annotated with
>> ro_after_init.
>
>    I guess you meant __ro_after_init? Would it then be OK adding it
> in the same patch?

As you change the data type of the variable anyway that's fine. Just
mention it in the changelog.

Thanks,

        tglx
