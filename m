Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794593235;
	b=1dYuXG9IkpDcLtrC0ddp2dFm+3VCX8UmszFnXJcR23I3sksqbCA5Z6zRdw1cSG4qFex3
	 gdXtlrqAwVAvJhj+if62aj12d1GE6PyFnbYiEQxRsfZ2G3XMorvLZXZEHeJl07EGh3UGV
	 oioLjommh/63jC4k+xGOTL5TwZ3STCzbQ/EnYe+SP2joe9OqYqWKMag7RgvmWi/icFkNw
	 LYrVTqOvDKY08+B8JxEP3iDTf8vhfl3RRAf7RjXI28iKCZepzQOEElbo3sX8oiRfiJHHu
	 +ACQtet/zWF2ggnP8nlgPkrvN6auO3K64vQmSapDHbWVetmo3fGkHGFjyjoU5lDg+9g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794593235;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=vttGBAmDDCax2U5XiqRhhpJQxPTLOEnFzBvSm8vFABc=;
	b=Skoc8zhtyGavClwkx9RFhi4hkxZXE8sVcJlNxcJ+0wcaRuaybWLiHchJDeSRAhvouB7y
	 2b1ywAyqTuZaBJOMIbKQnz66JibYMpgnYNqXc1MbTJnsuzlxuuENplW+4obCVFGQf1urw
	 w1ESD4cPqrTpeWuSCbqdtqN3xS7HG+3W0t1sgEcoRBuIoSXralhXi162SOcboU78/4XVU
	 FJwSXdrH9UV19svaeUtglT1hTDBe9++L+0TDUkQgfraJfBr7iOPOcDNIFqvjyT4bIBrtx
	 AeGBVsgPJv9P8bHV1I7XQpU1xN3OU8L7Co4Bysax50kx8N8e4vtGBm7mBlW9iIT5ecw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NRlfz9WH;
	arc=none smtp.remote-ip=209.85.219.54
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3404B606A331
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 18:07:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3404B606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NRlfz9WH
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-91f23ddf32fso8878826d6.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 10:07:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794593234; x=1795198034; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vttGBAmDDCax2U5XiqRhhpJQxPTLOEnFzBvSm8vFABc=;
        b=NRlfz9WHgzlWq3BwvZ3LZZs75s5z7t1bERLgNZIYnFeQklJKU9R5SBhrm36IohFyJG
         DfTGW/64xCpX2/VhCdmA4NGukO67ZJ4EMK2ypUxgOFxWIvscnBF2jm4rGiz7q4+I4tGh
         JPoz8ym/FtwzDnyI49ME1Eok0OBcR+h3YabA2x9983URMqLDqgm8Xi9u0jt6PgI0PG1Q
         IPiEHWZ3h5Awvtn9LQdlU8iQchp1abmbjnqrM/yFM5s3MgGO2lQ+CXPBjOZxCzpVPG6a
         xB383LF6SjNkjYEy3phhlvfBtarXEd/DzpgKrlGl/eMmRULJYyiK5Xx3/qw86KrLGau0
         Okfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794593234; x=1795198034;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vttGBAmDDCax2U5XiqRhhpJQxPTLOEnFzBvSm8vFABc=;
        b=mP3Q513W+WDjtQ/1dDLR3CvqmvrNz4CkzxSp5GRGWmG5hjC7UjAKpLJN2nR7PkWl+5
         43kHggA5khsz1ROBzWr/ceXQOppblF5SUqygEQXg2UmVEaG9X6PaF2Lj8NRdQHQXZqI/
         h06IX+D2JQdn7wbzz4gxKZZudFg3WeGSuRRv9LKMuYhbzyUW/4k71KBknkR9pVjWOLK9
         d7Fc82BdWxoVofZz9TpHXkZwVqacQUzQ+DeSy1v0nVwxatZqBDn0JHF1P2vqicgIon+y
         H7UcURhjfDT4idaz8FQDacfUxYJ98wEiNJgdbRbRdYLNEPq5YVlCykjFt0h96Ia3ZLHT
         W5pw==
X-Forwarded-Encrypted: i=1; AL+hErFXVPZw9i0+n+YTRpZGNrwyzm9PaW505YTcwKrnBxntcbhndXA9/VyfFSaFFziJg+qq0MVydNPP5GIZpZk=@vger.kernel.org
X-Gm-Message-State: APuU4Z/U05A9CXxQ8b70LhRicku2WI9tYvU4LEufKe2TnWjCmp2gl+qu
	TeeObiw9UfNXZdut5rAjSuPlLCj7bcm+qR5cYi855kjW9BC9f+S7WLpf0YpceQ==
X-Gm-Gg: AYBFou1ERGYaF5dMTuU+Q69N8BGDTCOGl9w2lGJlg9tfP6TXRMDIZh0lnDP0WCHWFk8
	dW8IQfCiBZxZRw4YsCAFnt7w/ZKmCj9xHh3AvSkUI42egPjr+KKobeQXt+Mp+YXaJcq7s6y8PoE
	GWLBaEbcPLfRSGle4Zxifk0E0K+a6Uz69/NdZUqoQ5LEbXMABQIRXjX0tcRax0DAoUirXsIXY4h
	y+ewN1H43VKVDrnAKOMjDpvX5hwKFxaz6kXJcGBDfN2PKjPHVZm3MPU3OjjgES1DtGGFG3zHU18
	8V/uzsc1JvKdvVv4KgcV14eeX3KYJEnPG+zT3gt34wejOSmKxxS//GRTE+QlMPayKLXvbbOXkcw
	zxVx3vSN/57KJ2W0zTMzfcj4G6rcvlhFx3MR/w+uyvWrlWBUMviyPksHLPbZ534c1eNzkUIeYnO
	2FNKIv4PFJm/QsxO1Nv1b8l4pb/vZFOve88yq0f4anpghrnElSutzmqF/9UzeJ62XLvDzlrYxW5
	R9vQnLU+cp+n9v8rFRICrfkesw+YMKjjrS22xz2pBV1OY8qeGqZ2r5L4FCmosqc8iC+RYvkgCoo
	JomjGAkYji93B5f881n1pQw68ddK7F5uGcjiZQjD/eZDjPN+r31kgspCIA==
X-Received: by 2002:a05:6214:1d0e:b0:91e:af07:e146 with SMTP id 6a1803df08f44-91f24217bbamr50370466d6.29.1794593233740;
        Fri, 13 Nov 2026 10:07:13 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91f23d452bbsm25025776d6.7.2026.11.13.10.07.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Nov 2026 10:07:12 -0800 (PST)
Message-ID: <18bc9378-3f8c-4212-98cb-40e876bf996b@gmail.com>
Date: Fri, 13 Nov 2026 10:07:10 -0800
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
Subject: Re: [PATCH v4 2/3] MIPS: Ingenic: Add XBurst SMP support
To: Paul Cercueil <paul@crapouillou.net>, linux-mips@vger.kernel.org
Cc: =?UTF-8?B?5ZGo55Cw5p2wIChaaG91IFlhbmppZSk=?= <zhouyanjie@wanyeetech.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Paul Burton <paulburton@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
 Brian Masney <bmasney+clk@redhat.com>,
 Jerome Brunet <jbrunet+clk@baylibre.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>,
 hns@goldelico.com, paul@boddie.org.uk
References: <20261112184441.3724150-1-f.fainelli@gmail.com>
 <20261112184441.3724150-3-f.fainelli@gmail.com>
 <ea78059f26aa3e25822665a1a462951695bd1e80.camel@crapouillou.net>
Content-Language: en-US, fr-FR
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <ea78059f26aa3e25822665a1a462951695bd1e80.camel@crapouillou.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 11/13/26 04:54, Paul Cercueil wrote:
> Hi Florian,
> 
> Le jeudi 12 novembre 2026 à 10:44 -0800, Florian Fainelli a écrit :
>> From: 周琰杰 (Zhou Yanjie) <zhouyanjie@wanyeetech.com>
>>
>> Add support for the second XBurst core on the JZ4780, based on Zhou
>> Yanjie's 2020 series and Paul Burton's original CI20 SMP implementation.
>> Use the CP0 mailboxes for inter-processor interrupts.
>>
>> XBurst stops its private cache clock when executing WAIT. Write back
>> the data cache before entering idle so that the other core can access
>> data belonging to the sleeping core.
>>
>> Link: https://lkml.iu.edu/hypermail/linux/kernel/2005.2/03488.html
>> Link: https://lists.openwall.net/linux-kernel/2020/05/13/1482
>> Link: https://lists.openwall.net/linux-kernel/2020/05/19/1099
>> Reviewed-by: Paul Cercueil <paul@crapouillou.net>
>> Tested-by: Paul Cercueil <paul@crapouillou.net>
> 
> You updated the patch after my Reviewed-by, so that voids it...

Indeed, sorry about that.

> 
>> Signed-off-by: 周琰杰 (Zhou Yanjie) <zhouyanjie@wanyeetech.com>
>> [florian: forward ported to latest version]
>> Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
>> ---
> 
> Please add a changelog per patch too.

I would rather do this only in the cover letter, but fine, I will oblige 
here.

[snip]

>> +static const struct plat_smp_ops xburst_smp_ops = {
>> +	.send_ipi_single = xburst_send_ipi_single,
>> +	.send_ipi_mask = xburst_send_ipi_mask,
>> +	.init_secondary = xburst_init_secondary,
>> +	.smp_finish = xburst_smp_finish,
>> +	.boot_secondary = xburst_boot_secondary,
>> +	.smp_setup = xburst_smp_setup,
>> +	.prepare_cpus = xburst_prepare_cpus,
>> +#ifdef CONFIG_HOTPLUG_CPU
>> +	.cpu_disable = xburst_cpu_disable,
>> +#endif
> 
> Drop the macro guards:
> .cpu_disable = IF_PTR(IS_ENABLED(CONFIG_HOTPLUG_CPU), xburst_cpu_disable),

OK.

> 
>> +};
>> +
>> +int __init register_ingenic_smp_ops(void)
>> +{
>> +	if (!of_machine_is_compatible("ingenic,jz4780"))
>> +		return -ENODEV;
>> +
>> +	register_smp_ops(&xburst_smp_ops);
>> +	return 0;
>> +}
>> diff --git a/arch/mips/kernel/idle.c b/arch/mips/kernel/idle.c
>> index 80e8a04a642e..0b042a328ad7 100644
>> --- a/arch/mips/kernel/idle.c
>> +++ b/arch/mips/kernel/idle.c
>> @@ -18,6 +18,7 @@
>>   #include <asm/cpu-type.h>
>>   #include <asm/idle.h>
>>   #include <asm/mipsregs.h>
>> +#include <asm/r4kcache.h>
>>   
>>   /*
>>    * Not all of the MIPS CPUs have the "wait" instruction available. Moreover,
>> @@ -71,6 +72,27 @@ static void __cpuidle rm7k_wait_irqoff(void)
>>   		"	.set	pop					\n");
>>   }
>>   
>> +/* XBurst gates its private cache clock in WAIT; write back dirty data first.
>> */
>> +static void __cpuidle xburst_wait_irqoff(void)
>> +{
>> +	unsigned long pending;
>> +
>> +	if (need_resched())
>> +		return;
>> +
>> +	r4k_blast_dcache();
>> +	pending = read_c0_cause() & read_c0_status() & CAUSEF_IP;
>> +	if (!need_resched() && !pending) {
> 
> You now call need_resched() twice, that's on purpose?

The two need_resched() checks are intentional: the first avoids an 
unnecessary cache flush; the second checks for work arriving during it.

> 
>> +		__asm__ __volatile__(
>> +			".set push\n"
>> +			".set arch=r4000\n"
>> +			"sync\n"
>> +			"wait\n"
>> +			".set pop\n"
>> +			: : : "memory");
>> +	}
>> +}
>> +
>>   /*
>>    * Au1 'wait' is only useful when the 32kHz counter is used as timer,
>>    * since coreclock (and the cp0 counter) stops upon executing it. Only an
>> @@ -156,10 +178,16 @@ void __init check_wait(void)
>>   	case CPU_CAVIUM_OCTEON_PLUS:
>>   	case CPU_CAVIUM_OCTEON2:
>>   	case CPU_CAVIUM_OCTEON3:
>> -	case CPU_XBURST:
>>   	case CPU_LOONGSON32:
>>   		cpu_wait = r4k_wait;
>>   		break;
>> +	case CPU_XBURST:
>> +		if (IS_ENABLED(CONFIG_MACH_JZ4780) &&
>> +		    IS_ENABLED(CONFIG_SMP) && num_possible_cpus() > 1)
>> +			cpu_wait = xburst_wait_irqoff;
>> +		else
>> +			cpu_wait = r4k_wait;
>> +		break;
>>   	case CPU_LOONGSON64:
>>   		if ((c->processor_id & (PRID_IMP_MASK | PRID_REV_MASK)) >=
>>   				(PRID_IMP_LOONGSON_64C |
>> PRID_REV_LOONGSON3A_R2_0) ||
>> diff --git a/arch/mips/kernel/smp.c b/arch/mips/kernel/smp.c
>> index 0f28b4a62e72..46c70d866723 100644
>> --- a/arch/mips/kernel/smp.c
>> +++ b/arch/mips/kernel/smp.c
>> @@ -338,7 +338,10 @@ int mips_smp_ipi_free(const struct cpumask *mask)
>>   
>>   static int __init mips_smp_ipi_init(void)
>>   {
>> -	if (num_possible_cpus() == 1)
>> +	/* Platforms with their own IPI callbacks do not need an IRQ domain.
>> */
>> +	if ((mp_ops->send_ipi_single != mips_smp_send_ipi_single &&
>> +	     mp_ops->send_ipi_mask != mips_smp_send_ipi_mask) ||
>> +	    num_possible_cpus() == 1)
> 
> Needs braces now because of the multi-line if().
> 
> This change wasn't in your v3, and I also feel like this would belong in a
> separate patch.

Yes, that's fair enough.
-- 
Florian
