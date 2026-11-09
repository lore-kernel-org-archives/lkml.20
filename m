Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794246237;
	b=cpREU8pXzBbQ851XjFB2FxZ3uz98JzgsgIK8VMpSf3rLUBofw/PLmuj4giuTqoY5IcBM
	 LCDgZ9mICEDY8ucv44gY54/kGJB+z/teQGmO1+dFs1BmkIm3bVn4y5Ro3gb6Mz1FVlZVY
	 yjOpOoJ7DYSeqZWN2WVXzZtqXcsiFXpEa72G5xu7mXtJaidbjhsDPb6P3p29aZvoXQssf
	 TEtIthDjYaJnj7k6lQ1zHb4JCf/SEFFmLTG95h4wNIAGIirlIzG0LIz/pgkE9snER1D8J
	 XJbj+gUrY4IAnMsZ9VkSc28ugtnAGrneCbehlb7h1WouFIMXC9bZn/OL1LQ4n+WTKWQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794246237;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=ODDsFkmR4JZZjzffhsKtiZTywC4t5hT17cOUsHgNWAg=;
	b=F4cf+H/5k2vn8u3DWcKd/3hXagO0/F81yM6bXkRsgtKIqz0MZmgpr/FmIffqwC9AJHkU
	 gqIJ9YVNq6zYOem0Cg0vkX0QAGRfe3lR3psYh9VDRA02VkevWYGkKxWtfQKHRlyCh+8AE
	 AZclDyDETUIa0D5nMECT4lMYTtEizpyxWbqqlVNxd4zCCBfUqx+75UzC9K1O0M4ax4iO+
	 FYGiYyc+hqN8VH/UpgYWPKWsHcsRI17gCNQu63hnAQFKr58CMWfvnk8Sq87cS9ccjtQIA
	 OBETgaT2U7WzeQ5RA0h7c2jjbX4ge2hyK9p++ko3EShoG0DX1cpOXM43HVD+Z59t6dw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wIzTE7tJ;
	arc=none smtp.remote-ip=209.85.222.181
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 243C0606A31C
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 17:43:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 243C0606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wIzTE7tJ
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-93e503815adso89996785a.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 09:43:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794246236; x=1794851036; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ODDsFkmR4JZZjzffhsKtiZTywC4t5hT17cOUsHgNWAg=;
        b=wIzTE7tJZL57n4rOmfvRje35MjUF+8WHf5ImqsavMNtYxjHYS+ACiQLBGeyWpSLHYY
         yRrfeIoJSuqRPB/6chSwuuDdc+NH8qaP+8NVpmo6JVUvqraKE5z/C4z9vgm2jL8G7RDL
         kFnAeycHLSHPt0ozm3QTOcrpY9HGw7sXdh85ZGsbfmQn1mTlQ+aJpzPqA/WbjHzYT3cZ
         yDk0vIBNuWp9ZGrioji495WD7xPUNwlIUH4uzWp5MI2OwouJ9jDmZgcRQYwrAFTCezIk
         U3d7Ft0gjlvjkPXvNUsaPZv20DA3c7+Rv0T0XHIHnj7s9wbIWhlsRS9Aj/WzJ5TovGU9
         IuFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794246236; x=1794851036;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ODDsFkmR4JZZjzffhsKtiZTywC4t5hT17cOUsHgNWAg=;
        b=xmeNjEUOeZPhvz8VS3sojN1ePXFVkM0XWldzZrCqQaov2nbry6fAI6cMc1k2qERkYq
         kRxQYGWqwoMlHg0Zi/OGShQxVrHWLZMdFtSnaEJpKdGB9Gm6Gle2tNV4TEP1FutmVVbL
         zOCGGNiQXcBfbQmrcPNIf+1wmQ6dDwBBFZ8hCgqG3JeD34tS7JngKbXz9mt4TQfQowsA
         IvoRcWUyNG0aZcAaaHbQZrPJmEfukb60Nsfy0vxxFH7CFnIOld270GdSwwCuGmY4YQ46
         cA6taFb3m0vXA52hkE3Rwf49+NjzTfnNEx1dj3gRKka/CRQ/cp5ArJ+XiIIAEaBFtp92
         k04Q==
X-Forwarded-Encrypted: i=1; AL+hErFR3hkiydiLzHolIf/uC+IqOBHxkne0cmWFcvAVh8g3YdP8QEy35JgCZwgx2UrGqGcqGgX2917p+5C6fkw=@vger.kernel.org
X-Gm-Message-State: APuU4Z8jyPivQLPP8AfgPxKraAZRfhavCEHBh6pElAIL3WUrAXMuKsKe
	WCP6FNdjZRL2BNZABydOai3OfQ5Ial1sgt54raqxzEKh29FQYy8zfF8G
X-Gm-Gg: AYBFou00HKtkaCEvUce5S1NkUHx10E1g/ydRqr4RjT0b9VqSrnum/9o8E90SdBFJltR
	qu2ob3aqjC1IxwKnmG8fRQ28GuqAugkhahQ6KbR+g7huhoYA+2LINIWnBTqctIEJB1q2+c4816j
	gwN18vNvzJyixQ0OHbU/Ca0qas/iduWWJ3Omub4cJXDtkDXjs912IyrdUeaXH2ibYBzu3X3A6kn
	R1Cnq3mhxuDh4Q6B19p4InE5kfgPft1shsUv0Ly1bSGVNnrvvfM6BGyBH/TvNzRtmdgAiew/eYW
	75rR+g7Iu2q2SC+osfxGn0Dmx5PS4ZZbLmzUO17Rl/RmHNvh+2xa5i7TVM1hvXQQPjt5kfsMXBc
	7DIrl44rxB4AmdGlZ09LBVE1C6s15TAHeHzN+wOINIFp1uynfD9pwbCKAnSEfpM1TUI02RXWywR
	CdCRaSZo0AuhPdx7COCQeXUA5ehgWfHoTFnJ92+5ISJFYzjlhDom5kfoJCOD9zWkg6NMe3LzZPy
	+UcsQMF7acE0jxN3WyWJY1Lzu/evCip4erXKJr8AYFvQz3YbeRhtbm16tUkC54tBUniuYgCDyKJ
	A/4lRzzY52lao+j7egJFX+espeinBFd8H8FF2BASKZmDJZDtE/jIapA=
X-Received: by 2002:a05:620a:199e:b0:939:a003:7127 with SMTP id af79cd13be357-9479f2e5f2bmr27118285a.52.1794246235960;
        Mon, 09 Nov 2026 09:43:55 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9479e784b90sm24886985a.22.2026.11.09.09.43.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 09:43:54 -0800 (PST)
Message-ID: <de0d1eb4-b866-43a0-980a-ec017d93549f@gmail.com>
Date: Mon, 9 Nov 2026 09:43:53 -0800
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
Subject: Re: [PATCH] MIPS: SB1250: Validate and update IRQ affinity
To: "Maciej W. Rozycki" <macro@orcam.me.uk>
Cc: linux-mips@vger.kernel.org,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Thomas Gleixner <tglx@kernel.org>, open list <linux-kernel@vger.kernel.org>
References: <20261103215043.1190947-1-f.fainelli@gmail.com>
 <alpine.DEB.2.21.2611060517330.17804@angie.orcam.me.uk>
 <alpine.DEB.2.21.2611090615360.17804@angie.orcam.me.uk>
Content-Language: en-US, fr-FR
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <alpine.DEB.2.21.2611090615360.17804@angie.orcam.me.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Maciej,

On 11/8/26 22:17, Maciej W. Rozycki wrote:
> On Fri, 6 Nov 2026, Maciej W. Rozycki wrote:
> 
>>> sb1250_set_affinity() selects the first online CPU in the requested
>>> affinity mask without checking whether such a CPU exists. If the
>>> intersection is empty, the resulting CPU index is invalid and must
>>> not be passed to cpu_logical_map().
>>>
>>> Reject affinity masks containing no online CPU with -EINVAL before
>>> accessing the CPU mapping or interrupt mapper registers.
>>
>>   Why do you think this is needed?  The only case where an unvalidated mask
>> is passed is AFAICT with:
>>
>> /**
>>   * irq_force_affinity - Force the irq affinity of a given irq
>>   * @irq:	Interrupt to set affinity
>>   * @cpumask:	cpumask
>>   *
>>   * Same as irq_set_affinity, but without checking the mask against
>>   * online cpus.
>>   *
>>   * Solely for low level cpu hotplug code, where we need to make per
>>   * cpu interrupts affine before the cpu becomes online.
>>   */
>>
>> -- which does not apply here (nor for arch/mips/sibyte/bcm1480/irq.c,
>> which uses analogous code and should otherwise be updated accordingly)
>> since all the CPUs are onchip the SoC.
>>
>>   Have I missed anything?
>>
>>> Also update the effective affinity mask to reflect the single logical
>>> CPU selected as the interrupt target.
>>
>>   Likewise, why is it needed?  This code returns IRQ_SET_MASK_OK (should
>> really use the enumeration constant), so the caller will do the copy.
> 
>   I can see it went to Linus already.  Can we please have it reverted?

Apologies for the late response, I was hoping Thomas would allow us to 
discuss this before applying. The effective-affinity update addresses 
this warning observed during boot:

genirq: irq_chip SB1250-IMR did not update eff. affinity mask of irq 2

IRQ_SET_MASK_OK causes irq_do_set_affinity() to copy the requested mask 
into irq_common_data.affinity, but it does not populate the separate 
effective_affinity mask when CONFIG_GENERIC_IRQ_EFFECTIVE_AFF_MASK is 
enabled. irq_validate_effective_affinity() then finds that mask empty 
and emits the warning.

Since the mapper selects a single CPU, 
irq_data_update_effective_affinity(d, cpumask_of(i)) records the actual 
target and addresses that warning. I should have included this in the 
commit message.

You are right about the empty-mask check, I will remove that part, 
revise the commit message accordingly, and use IRQ_SET_MASK_OK 
explicitly. BCM1480 should receive the analogous effective-affinity 
update as well.
-- 
Florian
