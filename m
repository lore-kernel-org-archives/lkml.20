Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AF6A1E260C
	for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 11:17:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788088642; cv=none; b=U5Vb+hQJkHxCfNcIATRaGb+I3TRV2ZeDcQQ1YD8nvjswiBscW5nG8K+y0KtXx7QOVOvk1V3yD4GOokRcijHsceRksrcD0sn8MC9ULOF2PgaCKnxtJ+f2iYTaywg1xdYrDT1RFBwbmP/YnB218UDlpHzfKyjekPZ64apUIBF4+DQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788088642; c=relaxed/simple;
	bh=04IVnAnTTCYVayT/0vwV6iLPYuefcxk2U4jMGHvoEwE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pGiGRtfjBW8/3NelELEuo6E3iQv+k9f5vOvhWe2yt0v70aUih6RzYwiTHaw2HqCCnUrwXOeFBx7pvv3il2ZBwQ+wT+K54R/FAs5thuRuZ6spGUBdq2QdRNnpS+5V/hhobfmVQUpNY/GJ0czu0IUOSiRGCMK+3588H8R7KJ/wdjQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U0hXpeUW; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U0hXpeUW"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c1f1f5631f8so37516966b.2
        for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 04:17:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788088639; x=1788693439; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8qAd5YEg8CKVaHSzqWSzab/y49rCvJcw+Xu2rn/DgAc=;
        b=U0hXpeUWClLKBqTMu0niqoJ1xtnU8XPUYuc2g8WVjQBD5Z68oq5s8QNpUT2H35aw08
         cTs4D5d4RH2d4hDbVXL/YIpLRU7q7uMGVuIZFGXruiGtP56GqXj8Vril2WLJB93x2ZmQ
         huZR26XaxBny/rV7x+vMiBbLU1v/BL6hAZYTIjPKUyo/UvQyT4uYZ6ggiyY9Mwb9T7Pf
         rZ+3nTXTS/i2OgSklgxODtllth6+HoFqQ+sOXJzTebnwH3FBddxUa68otlzdAscwxZk9
         OQ6M5YlhX/pNfCZwcfeQqdyldZBnQBGE2JLBfvCyl26v676/69h/1DHusZxwBaYRPQDh
         u0wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788088639; x=1788693439;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8qAd5YEg8CKVaHSzqWSzab/y49rCvJcw+Xu2rn/DgAc=;
        b=bDQxq7VzQcImqiXAXImEGywtGKdOuSki5baruGXy5eEjATk1VzCBdsALKU1NL1j1HN
         pWW9QDycNcl58k7q2Yb5oqGMDSYrI6F8QzLCS8QM3oZioOJwx0phzXebFENA/CXinRAY
         2lI5b9CnRdpLn+R5VkkX+NW/iwLVM3Tb0ZJ9kqks2vY3Dq7qEpp2hwKHl2Zk3uZYdXM1
         rJuiRjjBpTooODPKSzNPTCan4zRrmeutf+HwW3z1/4Ir2Rc7cM0sEOzBx4TRnaih7U9T
         8h8TRCp3Yo1AyqoT+88HyaawbW2KmxAxX6oJ3rA/xW8/PElaGAa2Tlbdv/rH/M56Egat
         ID1g==
X-Forwarded-Encrypted: i=1; AKwUvBxLhPbqm1pDh47xLgjp+K825Zikmw0i51rRyGoWllAL4ohbn4cg1QRXd3PNzvyXd0v8XJvd9kezRg+SRW0=@vger.kernel.org
X-Gm-Message-State: AFuF++nyURwvRkG82wiPgV4/SY8VoUbWa3LiR8TVg+aBa1I1fzTBxVgl
	3JDzv8zjFRG7NeunrobotCvcBp+YryLoz5AMdpMlSYO4bCc0cgMUELqyPaFy8A==
X-Gm-Gg: AYBFou0vzXK4sVnvlQwsDxYwSIVNilU0uF76tiBvGxc+X6GmSH2Sd2Qjytk3eiJRl9D
	amKpd10kR8pQQBingY/7jHnqSgLVQkDSz8b5xCpyAOPlCOSkfZV4BTJHNxBvque0OJAQQoOenO+
	3L1f0bzotuMNxE+FGff1yYnP8qbAyED6x2UxPm2cphKv2JeBOySsLCFzgLev6HmiCRv1oqpGb97
	q/PEOmiIjdRnFl6jnEKA6xCDmUfOffhqHRGL6NByc0AAb0D6McpQOQlQL0Ry1dTWzeO3AiGNR34
	KUcUPZAHJ1NUtheCtdfaKEH4AJRo+ClIYt0LIs2UJFTN5pKmEbjh8RHJvxI0A1+VSo4Kit1Fm0i
	xaV3tuaeDTL4mUAAnhxiYyUMPMhC9a77Xd9b+jSYZ6LbwZuDfdrAOrXmHEHBgIohyFwYzPflfSy
	0BBWB/0AQVxezaDTdJxHyTorDppJVnUwY7+a2ol0MqRXve6GTpU6kv8gXdIlz4MoIubLwyEWKV1
	4uX5pLx4fbjU+NLed84JciixLA=
X-Received: by 2002:a05:6402:43c6:b0:6a0:d411:930d with SMTP id 4fb4d7f45d1cf-6a60d36c8ddmr5293719a12.2.1788088639174;
        Sun, 30 Aug 2026 04:17:19 -0700 (PDT)
Received: from ?IPV6:2a02:a449:4071:0:32d0:42ff:fe10:6983? ([2a02:a449:4071:0:32d0:42ff:fe10:6983])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a611c38e82sm2188922a12.19.2026.08.30.04.17.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 30 Aug 2026 04:17:17 -0700 (PDT)
Message-ID: <545b78a0-159b-4ebd-9e2a-47d519c98bf9@gmail.com>
Date: Sun, 30 Aug 2026 13:17:15 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ARM: rockchip: smp: enable CPU1 for rk3066a
To: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
 Russell King <linux@armlinux.org.uk>
Cc: linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, =?UTF-8?Q?H=C3=BCseyin_BIYIK?=
 <boogiepop@gmx.com>
References: <20260829-cpu-v1-1-33dca576db92@gmail.com>
 <2667576.VLH7GnMWUR@diego>
Content-Language: en-US, ar-EG
From: Johan Jonker <jbx6244@gmail.com>
In-Reply-To: <2667576.VLH7GnMWUR@diego>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

On 8/29/26 23:59, Heiko Stübner wrote:
> Am Samstag, 29. August 2026, 01:40:57 Mitteleuropäische Sommerzeit schrieb Johan Jonker via B4 Relay:
>> From: Hüseyin BIYIK <boogiepop@gmx.com>
>>
>> RK3066a CPU1 fails to come online. Fix by using
>> a similar mailbox construction as in use with
>> other Rockchip SoCs.
> 

> "RK3066 CPU1 fails to come online with recent kernels....[rest]" or so

Not recent..

> and also please use the line length up a resonable length like around 70> to 75 characters.
> 
> Also, is it known, why that happens - i.e. what changed?


What loader chain did you use then?

This guessing!!!:
From TRM: RK PX2/rk3066a supports to boot from internal bootrom or embedded SRAM
Currently rk3066 U-boot doesn't remap, so we end up in ROM code waiting for deadbeaf:

void main(void)
{
        deadbeaf = 1;
        if ( !(__mrc(15, 0, 0, 0, 5) & 0xF) )
        {
                __set_CPSR(0xD2u);
                __set_CPSR(0xD3u);
                DELAY_write(24);
                CRU_CLKSEL();
                DELAY(10000);
                MAIN_LOOP1x4();
                DNL_LOOP();
                while ( 1 )
                        ;
        }
        __set_CPSR(0xD3u);
        while ( deadbeaf != 0xDEADBEAF )
                __wfe();
        secondary_startup();
}

Can't put a precise time tag on it since when.
Let us lead by what current available open source loaders solutions can do.
Please advise here.
How far does a fixes tag have to go back?

> 
>> Signed-off-by: Hüseyin BIYIK <boogiepop@gmx.com>
>> Signed-off-by: Johan Jonker <jbx6244@gmail.com>
>> ---
>>  arch/arm/mach-rockchip/platsmp.c | 3 ++-
>>  1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/arch/arm/mach-rockchip/platsmp.c b/arch/arm/mach-rockchip/platsmp.c
>> index f659d894bfae..d7d080c29f3c 100644
>> --- a/arch/arm/mach-rockchip/platsmp.c
>> +++ b/arch/arm/mach-rockchip/platsmp.c
>> @@ -133,7 +133,8 @@ static int rockchip_boot_secondary(unsigned int cpu, struct task_struct *idle)
>>  	if (ret < 0)
>>  		return ret;
>>  
>> -	if (read_cpuid_part() != ARM_CPU_PART_CORTEX_A9) {
>> +	if (read_cpuid_part() != ARM_CPU_PART_CORTEX_A9 ||
>> +	    of_machine_is_compatible("rockchip,rk3066a")) {
>>  		/*
>>  		 * We communicate with the bootrom to active the cpus other
>>  		 * than cpu0, after a blob of initialize code, they will
> 

> isn't now the only user of the old system the RK3188?
> 
> With both rk3066 and rk3188 from a similar time, I'd assume both could
> be switch and thus the the now unused code removed?
> 

> I've never thought to look into that ... need to find my RK3188 board :-)

Let me know what rk3188 U-boot and Kernel end up with how many CPUs, so we can remove the "if" condition altogether.

Johan

> 
> 
> Heiko
> 
> 
===========

https://github.com/armhoff/u-boot-rockchip/blob/u-boot-rk3066-sdcard/board/rockchip/common/platform/rk30/romloader.s#L110
https://github.com/paweljarosz82/u-boot-rk3066/blob/wip/rk3066-8/arch/arm/mach-rockchip/rk3066-board.c#L32
