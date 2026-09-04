Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06FB120D4FF
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 00:24:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788481457; cv=none; b=Oz20zLl17byslePJE+oyqp2v60RPlJBHDga8hQHfTbbjzZemzMUBX+IQZozY0ICQG1g05//nrTRLdWkAJx4gBXqIoAP4j7cUEOhxLPmj76k04+FrGHGCrrLIRstGSqJx4ADmDaMQiuTXTfyfEa9RXq9QTAffhEvB9hJhAILq7wc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788481457; c=relaxed/simple;
	bh=vI3w7Yfe6qPIBFjIgwMVs1BgewAMFw3n7X4YwNwR5v0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Jxr4Jjt9u8x9SY4i/osHy65FTfPgPxucKxAyUpfGghrYT4f+7vZ2XKt0OgD8yuC6gZKK2GBpADotHWvIatir+wBZk3DS8FLqtKbgn/S7vJ217tdeevXpiGrHopzR5cf+mxJTBY0qjrKIM3nlZGqYnpSJlhEfewU8JVxATw4T+z0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PTxo2Z9S; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PTxo2Z9S"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2d6fe26ef1cso4992135ad.2
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 17:24:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788481455; x=1789086255; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xGtEyL+SG/LvgHfix7kNxu8fbD/5RFe2NtGfqWXVEXc=;
        b=PTxo2Z9SRS0jbFE22JIqohXwucRBb2UUWAbq/5L2+0/z/fn+Ri6YfJjiKoQWjv3+Xk
         U75kkYdDW6N/EHRK71U9ZlyyxaXfdyNuOGPM+QpAYnXrBwihTHsCbXt9cIpzWBvngERT
         uHnmMC1pGhcyMVAlJG9lKNvaAVLTnnnm83qQkWxmBO9BQgr66Y4Ow5J13EFKLND6rh+V
         QPJLrlB/cIrLatLDWDKuOm39wuxTwYSy8D1vt7tnf+4Kor0rBKFttfa8z7UMv9ULYYPW
         v4iLwbOwsDrGMX9tS64qmdQMGnELy/rJLWwGvsOd4DGIl4Db+Emmwqy09HZr5YFPXUBo
         PQPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788481455; x=1789086255;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xGtEyL+SG/LvgHfix7kNxu8fbD/5RFe2NtGfqWXVEXc=;
        b=EjbAI83IyjEm7kyCXRJsbM2KlgG58dlf39op9V0OCadbkhWVaq2dF28NWmirHPVWYW
         mQiBWGa0SFVkwK+YYU78Dp1dS3bDSpiYiUrItA4oHGVy3GAZYSK4Bg+Yl1j6CN7+hAA/
         kF5NFCqwU5Uk1rrujrsvc3iQxVcH/tVlZTtjoF/uYf4PDYSMfGur9xjwxjZwGGdElLuy
         bepwC6pE3wQSMvAzFAYTpzEwyFOHWIwn38VNj/uEU7q9GLAATOb3COGznRlLoYv51lpW
         k+qmS/f8mDIg8ixsFsgk9DQHYYytj76Crpe42l//lcwbTFZS2kxYJATn3KWEw6R4Bi03
         XPmA==
X-Forwarded-Encrypted: i=1; AKwUvByTnL/v0gF1IXUxMJW5NyajVnZCoTYmTrnZFYI6HqN25KzJMfgXygQUzQJkasgvqni8v1JducCHpwbbQ10=@vger.kernel.org
X-Gm-Message-State: AFuF++l8KiRia+PuyhkHepslJg9ERrMSuGb5rqggPjoXLsRgcy5uOs2h
	FljaA9yOk7r+ghGh1JFx0GVpCbCR8ejvoahZDi1qUjh2bA6FrSadVC8K
X-Gm-Gg: AYBFou3UKPTBHbJecOxyVVHmxA9DJHIT01Sgyq3aSKX4uIcT5UJ85KssSfsidZG6WFk
	1ylhZlSodu9alZR4DZUQNwEyZBx8upzEUEoibC/7HmEaoYt0xkjwmDWVkSsJXVv9qj+lam8npqX
	xBXR2rG5DAmdI4BnVoIh3JDPvCgJ6lscWRmf653EYjYL4d//LU6k63fYBM4Tuv2WUIO8ST5Ml7J
	+I7HEO9OIXRz8Qp77Z6eOIUnoh5J0/haMxm3Gyk5i286jgms01sprQLz53ESMFFUTRmO9t38+DS
	f6EDO9RdWZ7JOUp/BLlpdT6idko+UdiB7tvucCpt6XTwf35FC5/H7MxL5VEZtvP5OWNWY6Tw8Zz
	TzCsHxgU3qHvKkp/tFhVkwqZzOUbiajbxAiZjVTwgCTf2Wt2o53zqWp3xwxi7hsM3gnFQCAZ7eP
	FlZYpkwXJclkUVWP3U7JpFwFt7Fgla9r9FQGhA96AwUbu4FPyZHfVSQFY9dK7X32I6zZvPOZmrt
	e50cEHWcK1mGGf+j7iBIHCquxrlX+xJ1NmZHrbQtp5oICjjvCXGyNb6ecx/
X-Received: by 2002:a17:90b:5343:b0:398:e46e:ade3 with SMTP id 98e67ed59e1d1-39b2628fc1amr3801873a91.23.1788481455199;
        Thu, 03 Sep 2026 17:24:15 -0700 (PDT)
Received: from [10.21.0.95] (wnpgmb0592w-ds02-161-177-131.dynamic.bellmts.net. [207.161.177.131])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b08bcc090sm7824281a91.4.2026.09.03.17.24.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Sep 2026 17:24:14 -0700 (PDT)
Message-ID: <d1a590c7-f526-4e70-a255-fccfb199be39@gmail.com>
Date: Thu, 3 Sep 2026 19:24:12 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Betterbird (Linux)
Subject: Re: [BUG] SPD5118 Intermittent MR11 Corruption During Suspend/Resume
To: Armin Wolf <W_Armin@gmx.de>, Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 "linux-acpi@vger.kernel.org" <linux-acpi@vger.kernel.org>
References: <46191fa9-fa4a-4c16-b618-2c0c6dc09102@gmx.de>
 <531be24a-bad0-40f6-8e30-3d4da565afcb@gmail.com>
 <a2efdc40-c73c-4892-9fea-9470c0f9823b@gmx.de>
 <0388506d-9ddc-4825-bf28-95c8eef219b6@gmail.com>
 <57a05dea-3cce-4ecf-bbe1-ab7464f8c224@gmx.de>
 <a5d32ab5-f545-4e11-bf0b-88d3eaa68890@gmail.com>
 <474a37bb-0774-4710-8458-ea28d7c54c89@gmx.de>
 <c81e7caf-d3e4-4212-be9b-ec35d0a04086@gmail.com>
 <c096b0d7-90c2-4d91-9776-9f109679c309@gmx.de>
 <7ca2e621-e0a1-4eee-bcd1-2ded610f1beb@gmail.com>
 <cff09168-9a88-494d-bc82-d9a5e4de22a7@roeck-us.net>
 <e1a6a91d-d03e-4e7a-ba7b-9268284ce7e8@gmail.com>
 <5480c69c-8e98-443e-96d7-30e64e886373@roeck-us.net>
 <02dc7eb6-6d0d-4c0c-af10-b831d3f8ba06@gmx.de>
Content-Language: en-US
From: Matthew Bettencourt <matthew.bettencourt@gmail.com>
In-Reply-To: <02dc7eb6-6d0d-4c0c-af10-b831d3f8ba06@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hello Guenter,

 >> - Do you have the latest BIOS installed on your system ?
 >>   Some statements online seem to suggest that the problem
 >>   _may_ be fixed with the latest BIOS on at least some
 >>   of the affected systems.

Yup as of Sept 3 2026 I am running the latest BIOS, 4.43. I think a new 
one is coming soonish as Asrock has started rolling out 4.50 on other 
x870 motherboards

 >> - Please boot the affected system with "usbcore.autosuspend=-1"
 >>   kernel command line parameter.
 >>   There are some claims online that this might resolve the problem.
 >>   I have no idea why that would be the case, but I guess it does
 >>   not hurt trying. Of course, if that _does_ work, we have yet another
 >>   mystery to solve.

I think we have another mystery to solve. I enabled 
"usbcore.autosuspend=-1" as a boot parameter and the errors have cleared 
up when I suspend/resume. I doubled checked this by removing 
"usbcore.autosuspend=-1" from my boot parameters and the errors came back.

 >> - Do you have memory with RGB-anything in the affected system ? If so,
 >>   is it controlled by the BIOS ? If yes, please disable the 
functionality
 >>   if that is possible.

I checked my BIOS and all RGB options are disabled.


Thanks,
Matthew
On 9/3/26 5:47 PM, Armin Wolf wrote:
> Am 03.09.26 um 23:05 schrieb Guenter Roeck:
> 
>> Hi Matthew,
>>
>> On 9/3/26 11:25, Matthew Bettencourt wrote:
>>> Hello Guenter,
>>>
>>>  > This system [MSI PRO B850M-A WIF/7600x3d] does _not_ have a 
>>> problem, or did I misunderstand the above ?
>>>
>>> That is correct. I was unable to replicate the issue with the MSI PRO 
>>> B850M-A WIF and 7600x3d. The MR11 registered never got corrupted 
>>> during sleep/resume and I never saw any piix4 errors logged when 
>>> using my piix4 driver with the additional logging enabled.
>>>
>>> I never swapped the CPUs as that was more hassle than I was willing 
>>> to do right now, but if it something that might be useful I can 
>>> probably try that at some point.
>>>
>> I don't think that would help. From all the reports I browsed through
>> so far, the common denominator seems to be that the affected systems use
>> a X870 or X870E chipset.
>>
>> Anyway, couple of ideas:
>>
>> - Do you have the latest BIOS installed on your system ?
>>   Some statements online seem to suggest that the problem
>>   _may_ be fixed with the latest BIOS on at least some
>>   of the affected systems.
>>
>> - Please boot the affected system with "usbcore.autosuspend=-1"
>>   kernel command line parameter.
>>   There are some claims online that this might resolve the problem.
>>   I have no idea why that would be the case, but I guess it does
>>   not hurt trying. Of course, if that _does_ work, we have yet another
>>   mystery to solve.
>>
>> - Do you have memory with RGB-anything in the affected system ? If so,
>>   is it controlled by the BIOS ? If yes, please disable the functionality
>>   if that is possible.
>>
>> Thanks,
>> Guenter 
> 
> According to the output of /proc/ioports, the root issue seems to be 
> that the ACPI firmware
> drives the SMBus controller and marks the affected IO ports as reserved, 
> but acpi_check_region()
> still tells the driver that the IO ports are available.
> 
> I already CCed the ACPI people to take a look at this.
> 
> Thanks,
> Armin Wolf
> 

