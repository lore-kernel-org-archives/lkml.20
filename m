Received: from mail.auroraos.dev (unknown [95.181.193.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72FDB48B36A
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 17:44:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.181.193.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788284653; cv=none; b=RjRc2JGZ6EqJywi8z8NI0NZmh6fpheTqED2yHTUc0TdnHQz6GEzQxpE8DuGgA7tFXD4uDEsUnmwXu1Rg0suIFjjZOsHwln9ZOmIGevEt3Kqf9HlqfjyygmCZtrS/Gzd0+nWjCXTZ99hRO+0wGPPOKsoHv+d7gYUYXEG4Wi1BWUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788284653; c=relaxed/simple;
	bh=zWhKltTf6EJyA4Ei9FYuuMx0dry+wiokO67ynFf0IbA=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=ZleSbZNZiYuwNPBe060gauI9cqMX/I5AYfd8dCYmPokhbq6x5pVJAQ4ikEzkctIQQ6DOXvvdYCI7gZrMQh5TNIE0d/0q9kFp4yfDJIoHEc2EZrbyy7vo5iyZyjnyEz/81uEcS/WR/jU2f6RrSmAtWFHOoELHi8K7Pprr8FWSDU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=auroraos.dev; spf=pass smtp.mailfrom=auroraos.dev; arc=none smtp.client-ip=95.181.193.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=auroraos.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=auroraos.dev
Received: from [192.168.2.104] (91.78.29.96) by exch16.corp.auroraos.dev
 (10.189.209.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1847.3; Tue, 1 Sep 2026
 20:43:58 +0300
Message-ID: <8c4f2857-e7bc-4880-8ed9-8815d7f7e57f@auroraos.dev>
Date: Tue, 1 Sep 2026 20:43:56 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tick/sched: check skew_tick kernel parameter's validity
To: Frederic Weisbecker <frederic@kernel.org>
CC: Anna-Maria Behnsen <anna-maria@linutronix.de>, Ingo Molnar
	<mingo@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
	<linux-kernel@vger.kernel.org>
References: <20260829202535.46470-1-s.shtylyov@auroraos.dev>
 <apbLW_Y1CScaZoR7@localhost.localdomain>
Content-Language: en-US
From: Sergey Shtylyov <s.shtylyov@auroraos.dev>
In-Reply-To: <apbLW_Y1CScaZoR7@localhost.localdomain>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: exch16.corp.auroraos.dev (10.189.209.38) To
 exch16.corp.auroraos.dev (10.189.209.38)

On 9/1/26 3:55 PM, Frederic Weisbecker wrote:
[...]

>> In skew_tick(), the result of get_option() call is ignored, so even if a
>> value of the skew_tick kernel parameter was not specified (or specified
>> as a list or range), the kernel won't complain. Add the missing check...
>>
>> Found by Linux Verification Center (linuxtesting.org) with the Svace static
>> analysis tool.
>>
>> Signed-off-by: Sergey Shtylyov <s.shtylyov@auroraos.dev>
>>
>> ---
>> The patch is against the timers/nohz branch of the tip.git repo...
>>
>>  kernel/time/tick-sched.c | 3 ++-
>>  1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/kernel/time/tick-sched.c b/kernel/time/tick-sched.c
>> index c1ee0b256445..34ceccdd49b5 100644
>> --- a/kernel/time/tick-sched.c
>> +++ b/kernel/time/tick-sched.c
>> @@ -1483,7 +1483,8 @@ static int sched_skew_tick;
>>
>>  static int __init skew_tick(char *str)
>>  {
>> -     get_option(&str, &sched_skew_tick);
>> +     if (get_option(&str, &sched_skew_tick) != 1)
>> +             return -EINVAL;
>>
>>       return 0;
> 
> I'm not sure that matters. Initcall return values seem to be ignored on boot.

   But that's not an initcall, IIUC.
   Looking at do_early_param(), the kernel would call pr_warn() if the setup
fucntion fails...

> Looks like only modules do care.

[...]

MBR, Sergey

