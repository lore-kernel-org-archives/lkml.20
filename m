Received: from mail.auroraos.dev (unknown [95.181.193.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 646762C0303
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 20:04:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.181.193.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790798695; cv=none; b=iLnzGmeyMuYK1VOGYs/fJkmFg8XvWExc2hiqtvJOpfkYuw/kgEk40qHrwnpAKobpDIiFv30YWNAUNap2DZaReR+WxUnw4XAnWn+EPT4iPlMPsw56WJw02ErMiN21yEf4DwyQxktTEyrAm73BVQZW/MEuMAZlFocNUK/4XrfPHAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790798695; c=relaxed/simple;
	bh=8S2syLFn5Ve2ieXLBGr8EP9QjBH4YNGpF4ArxjrnGDE=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=Sh9uiorZrigmlGRYcctn5K9+Rdf68mazlPftp7Ik87cVUND1Olvnug1mkRCG9mKxIuHTjAzoJhktvet68FA/HRIk0GBqMJ5uJGzIMBPjQOsypLhufKHAGpA4squwL7QJlZYKDjJ6CO58HTrmPld4fu8okKHPOS2tftUO2+ASTu0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=auroraos.dev; spf=pass smtp.mailfrom=auroraos.dev; arc=none smtp.client-ip=95.181.193.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=auroraos.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=auroraos.dev
Received: from [192.168.2.104] (91.78.23.234) by exch16.corp.auroraos.dev
 (10.189.209.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1847.3; Wed, 30 Sep
 2026 23:04:47 +0300
Message-ID: <a498213c-f034-48a4-af88-3e2a073dcca9@auroraos.dev>
Date: Wed, 30 Sep 2026 23:04:46 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tick/sched: check skew_tick kernel parameter's validity
From: Sergey Shtylyov <s.shtylyov@auroraos.dev>
To: Thomas Gleixner <tglx@kernel.org>, Anna-Maria Behnsen
	<anna-maria@linutronix.de>, Frederic Weisbecker <frederic@kernel.org>, Ingo
 Molnar <mingo@kernel.org>, <linux-kernel@vger.kernel.org>
References: <20260829202535.46470-1-s.shtylyov@auroraos.dev>
 <87ecebj080.ffs@fw13> <d95d424c-77a7-4c59-a7cb-9e547af7461c@auroraos.dev>
Content-Language: en-US
In-Reply-To: <d95d424c-77a7-4c59-a7cb-9e547af7461c@auroraos.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: exch16.corp.auroraos.dev (10.189.209.38) To
 exch16.corp.auroraos.dev (10.189.209.38)

On 9/30/26 10:01 PM, Sergey Shtylyov wrote:
[...]

>>> In skew_tick(), the result of get_option() call is ignored, so even if a
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

   One thing I did forget to ask: we still don't need the Fixes tag here?

[...]

>> Thanks,
>>
>>         tglx

MBR, Sergey

