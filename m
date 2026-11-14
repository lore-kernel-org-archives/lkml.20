Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794629807;
	b=LRMWLpoQzru5L41Ez8fD4eagwoluui3Qr9qRQZA135WbQF5EiIsIIpnpEaJMqqDFg1V0
	 JW6nlSWQkGIrZ0NLTy1G3mYzTZ9yd8E8P3iiqaX58//uS8dUtFkbxqTs7DlbB0TI8MAGm
	 iYaKgiqLe8kUYSIcRpPliHcNr5SzrSR23JOzz4iu1tlA2rllMX9lWAAyH0D6J+ql2La1v
	 1HHcK2doh0KKABTyvlbJ3fwJwUVG1VShwyc1dLxGcqGqAAwXZP9GvVH8LiWtOQHfVeS48
	 r+c34kwquCmOyg41Y3c6Ji/kwI0U4UudVDIuew5aG8ACbRb6geTmE5Xb57PUK9oXqsA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794629807;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=bJZ49mA/2fv/eo9vW0sZHgqgFD/tfUpaTmYh5t4KpuM=;
	b=LBeazBafV8TijcU48n8UNjnaV5JrZdCDfyc1StFF8QeCzyOkAcZ8MxOGPOuzyCrgENTZ
	 YA0XZmGYCo1w+9dURAQ62npaU78n3xur/nGXQY5IZpZxMPNm6SVRETU4ScntuYeaQTo0S
	 l7Izf6gnGapQ7v+18IK/6Sz+/ssVd7a8wZ1QByIYvNolaDiPsk7h7kiKKnUoEJSRNdx6M
	 x9XZmOGBrLFNb7UpWEwjb9y0MLvoJpSiLrqUV82TYEdMN/F1X/j09M5kTbLfIRBH20UGj
	 uGwXFbUgWLIaEH9cd3tHLBkJMmp38/+ZSW67JFk+dhRFZsBSY5/6hbxmLRkxc2nPJVA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rMvn67HJ;
	arc=none smtp.remote-ip=74.125.82.172
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C319D606A32E
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 04:16:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C319D606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rMvn67HJ
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-36f8cdd30beso1194504eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 20:16:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794629806; x=1795234606; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bJZ49mA/2fv/eo9vW0sZHgqgFD/tfUpaTmYh5t4KpuM=;
        b=rMvn67HJ/4qTLn1Cw9eXe5ua4+5psKuBSIMYHqjmgeBPkMW2rBX5FnPrG7wf+Z3km5
         TVdD+/kUfJLEih8Bmit8nB26HVnW/TgGxs8yIqjVP4/uENO/LqSLpVmC23Avj38Yszww
         sx5QHdfP6LemiNXwKLvWJqyoBLhtumwSlpD4sUN+O2tmVo2GM+G0euvRk0WgEjMwNGEN
         wHo11NQlg0zFCIQFOIXMZe05XI+eRGgyEfrfUwJ3INR1qJcSBytrW3kQ2YBshaJIDzYu
         ZUN+7A+AGOcdpg/3pgbm+CwG0o3bMdER5Ite6AVnRsfUzEf2k2iuoqO/fG4jkfF3vjlr
         vWpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794629806; x=1795234606;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bJZ49mA/2fv/eo9vW0sZHgqgFD/tfUpaTmYh5t4KpuM=;
        b=QxBFEZ9Kj+xTf7OKtNrnMK68c0d4r0tWnQ49tG3tM/FFz6rQoo8jJVJkpf8AREgML7
         DgyU7tE94/sMfb+qV51oVn0Kd7SymofYF2rsSIQp2Q3cgravwUQdKelI5XBgIQDq0GOv
         2WvaieEQNKnyZY1+UJFKnZq/T2CFAukhbVwZSfLXyYYRNtffQM8bP2M8o8g3jdLwo1tL
         zj6wizx6+/3VBlNpD3y1OU/hcOtWeclJ2/4T7HD38rENSKa8sLQ6HoEaUg3gM8V+WLpd
         Owhu9kbSbk7seR53SRpSnnGj1f5VHi/lYee9POzVyoYz6V1axPzf/UOj7cUyzzkCbOpr
         1sqQ==
X-Forwarded-Encrypted: i=1; AL+hErGxLbsLCJjQ3aDhTKwOdRa82VcBRVmLRvdYRmbLFDPLo5N8QCIrFxKu+igasceUKmwPqMXFsigA8zHzEI0=@vger.kernel.org
X-Gm-Message-State: APuU4Z8pmUYRchIEA86NiG731Gn9OiNtZws2J83QQ+XJvbcKAKL3hAg7
	6TsnXLOcylDhQU1z8mhmjfM7DVEFnZJCdTUAyVmn6M/YpmTbikCbsPMk
X-Gm-Gg: AYBFou0PHA/mzBdfa7aUC08HbPRl3bv1gTCaw8TeBDqUZQV6K2yuzcyeMiMMVExLDfj
	LTxtE4xbr41VA2liFZUiWLllGRIeLvNRHohmoEfcg3roUCStFAUswFfniUE1ImgH6egiXF1h4+0
	07MpCUnPrMlaVXf1NVEs1iAfgCcP0WXeuQlGvKJPeket+oYeU4w0YnyRzJPfo5HF3r2lQtPXPoZ
	McdMt4ePKUbJAR7fzMtd4CoXY8A+k6RkchAxBYhmgEyQDSmO5TmUA+70DeTU/yvpq+nzJs+bVPh
	bBaraZJSt4F3B72Khw5Kl7jEOOjD7rWFpREO9FIwwNUA809kUuMyHnscNPpEtU9xiYaiLWi/29A
	+MMWDfSHiLHazC3VNsD8Eed5lmXqvKwz0VgmnvH+mWxBPKsy/Zv47cR7upxQbAxpajdjHPXZgpe
	V9EXtrppIeljcaZqNkoGsCi03cQTc3uf3EBPOMaFJPv71U4XwS2nvd6jOPEsT2kk+1id3tE20QX
	nOwpsuwr0Ak1m0oulMmijv3GHh3FzH4hJ8U6MI+xN/xwG5ypRkdoy4ddBs899AmXlP2bQtmTzU3
	dhBwE9qLp0/cjKFLZdtaaydMldhl0y+rOnrRxTs9+EkpPBgtMcfjvK3oG3Q4TMOJgRk7i9ZyGSL
	T
X-Received: by 2002:a05:693c:6293:b0:378:314:4033 with SMTP id 5a478bee46e88-379679e29f2mr4158766eec.32.1794629805701;
        Fri, 13 Nov 2026 20:16:45 -0800 (PST)
Received: from [192.168.10.3] (ip70-187-214-22.oc.oc.cox.net. [70.187.214.22])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37955f01d68sm11849406eec.17.2026.11.13.20.16.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Nov 2026 20:16:43 -0800 (PST)
Message-ID: <34ffee4c-c5f6-4050-b76c-637fc48d1030@gmail.com>
Date: Fri, 13 Nov 2026 20:16:41 -0800
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
Subject: Re: ARM BCM53573 SoC hangs/lockups caused by locks/clock/random
 changes
To: Florian Fainelli <florian.fainelli@broadcom.com>,
 Linus Walleij <linus.walleij@linaro.org>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?=
 <zajec5@gmail.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Will Deacon <will@kernel.org>, Waiman Long <longman@redhat.com>,
 Boqun Feng <boqun.feng@gmail.com>, Russell King <linux@armlinux.org.uk>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, openwrt-devel@lists.openwrt.org,
 bcm-kernel-feedback-list@broadcom.com
References: <a03a6e1d-e99c-40a3-bdac-0075b5339beb@gmail.com>
 <CACRpkdahWm9aP+UasDx=s3th+vyjAfuWrKB5HS9BKEbz90ZmKw@mail.gmail.com>
 <ec17c6c8-e697-4a5a-a705-bff24daae7b2@gmail.com>
 <CACRpkdZp=4sP_1a=u6c7DGbPWA8WRee4J8Wpsw7Y57S2FT5GFw@mail.gmail.com>
 <92190d04-9b43-47ad-9dd0-4b85bb60f8ef@broadcom.com>
Content-Language: en-US
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <92190d04-9b43-47ad-9dd0-4b85bb60f8ef@broadcom.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Rafal!

On 11/29/2023 1:42 PM, Florian Fainelli wrote:
> On 11/29/23 13:33, Linus Walleij wrote:
>> On Wed, Nov 29, 2023 at 10:20 PM Rafał Miłecki <zajec5@gmail.com> wrote:
>>
>>> Here comes more interesting experiment though. Putting there:
>>>
>>> if (!(foo++ % 10000)) {
>>>          pr_info("[%s] arm_pm_idle:%ps\n", __func__, arm_pm_idle);
>>> }
>>>
>>> doesn't seem to help.
>>>
>>>
>>> Putting following however seems to make kernel/device stable:
>>>
>>> if (!(foo++ % 100)) {
>>>          pr_info("[%s] arm_pm_idle:%ps\n", __func__, arm_pm_idle);
>>> }
>>
>> That's just too weird.
> 
> It does seem to indicate that idling for too long wrecks havoc, but it 
> is indeed not making much sense. Not having proper documentation for 
> this SoC, it is hard to figure out what impact does stopping the ARM CPU 
> clock has on the rest of the memory subsystem, especially outside of the 
> CPU. I do not believe that this SoC has any form of PLL clock gating or 
> pulse skipping.
> 
>>
>>> I think I'm just going to assume those chipsets are simply hw broken.
>>
>> If disabling CPU idle on these altogether stabilize them, then maybe that
>> is what we need to do?
> 
> Yes, please try booting with "nohlt" set on the kernel command line and 
> see how that fares.
> 
> Also useful would be to dump the L2 CTLR and L2 ECTLR, this is a 
> complete shot in the dark, though was initially wondering if there could 
> be some retention issues, and would have recommended disabling the L2 
> retention policy completely just for testing.
> 
> MRC p15, 1, <Rt>, c9, c0, 2;
> 
> of particular interest here would be bit at position 0, try to see if 
> changing it to 1 (3 cycles) or 0 (2 cycles) changes anything.
> 
> MRC p15, 1, <Rt>, c9, c0, 3;
> 
> the lower bits are reserved, so I would not necessarily expect them to 
> be mapping to configurable latencies, but if you see non-zero values in 
> bits [28:0], try changing them to 0 and see if that changes anything.
> 
> Thanks for your persistence!

Thankfully now we have MCPs and it did not take look to identify a lead 
that was actually documented into an internal bug tracker! Would you be 
able to test this branch:

https://github.com/ffainelli/linux/pull/new/rfc/bcm53573-counter-wa
-- 
Florian

