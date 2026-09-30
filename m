Received: from mail.auroraos.dev (unknown [95.181.193.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABCC53C09F5
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 19:01:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.181.193.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790794900; cv=none; b=S5Cuw+7q6m+JctwriKR0kEpTPPHSnscxpdFWj0bUTLeeUCMSL7z2SabcxtiNpYzBsPkalgY2zzu3xTOWVd/vpPColpR6bebEQw4QiEle6782rQ3TaQpjjWskUtSJsYtOkQ4R4RCy8q3IP/Qg7756dUZAJupTaP2Wb38FDe/OYhg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790794900; c=relaxed/simple;
	bh=3lx/w9pnmPDAskzdtj39rTa8lt8/KLUU44H4nGdIoFc=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=eQO75bVPlgYhfM1evCZmT+Z2HwrP+MKhwVYRnUUn7ioASNAoTpFTu5J6bm3S1WmzhTvmNmeqmJgXaU/linZGeQ/rvOgeqUIgoqbTF62sGSXGVqKa2/Na6TGP8K3jzhSNcuQVprpaqF16KPWsI0sTQAIcb4l8uFvMHPs5ujYgAqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=auroraos.dev; spf=pass smtp.mailfrom=auroraos.dev; arc=none smtp.client-ip=95.181.193.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=auroraos.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=auroraos.dev
Received: from [192.168.2.104] (91.78.23.234) by exch16.corp.auroraos.dev
 (10.189.209.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1847.3; Wed, 30 Sep
 2026 22:01:26 +0300
Message-ID: <d95d424c-77a7-4c59-a7cb-9e547af7461c@auroraos.dev>
Date: Wed, 30 Sep 2026 22:01:25 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tick/sched: check skew_tick kernel parameter's validity
To: Thomas Gleixner <tglx@kernel.org>, Anna-Maria Behnsen
	<anna-maria@linutronix.de>, Frederic Weisbecker <frederic@kernel.org>, Ingo
 Molnar <mingo@kernel.org>, <linux-kernel@vger.kernel.org>
References: <20260829202535.46470-1-s.shtylyov@auroraos.dev>
 <87ecebj080.ffs@fw13>
Content-Language: en-US
From: Sergey Shtylyov <s.shtylyov@auroraos.dev>
In-Reply-To: <87ecebj080.ffs@fw13>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: exch16.corp.auroraos.dev (10.189.209.38) To
 exch16.corp.auroraos.dev (10.189.209.38)

On 9/29/26 11:01 PM, Thomas Gleixner wrote:
[...]>> In skew_tick(), the result of get_option() call is ignored, so even if a
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
>>  }
> 
> sched_skew_tick should be converted to bool and this function should
> simply do:
> 
>        return kstrtobool(str, &sched_skew_tick);

   Thanks for your comment!
   OK, I'll do that (and add the Suggested-by: tag, of/c)...

> And to make it complete, sched_skew_tick should be annotated with
> ro_after_init.

   I guess you meant __ro_after_init? Would it then be OK adding it
in the same patch?

> Thanks,
> 
>         tglx

MBR, Sergey

