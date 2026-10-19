Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F9B94B26F6
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 09:28:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792402091; cv=none; b=hi7Z/zx1fBC8UqLyGATP/o8gYCjKE45mpFAOB6pk9MBGYB2Vg6eE/HlGE30C2Zt2ivYWD2ARfkaI773OsSvBNpQynHQSKtw9ls8CE6EubZAzdkLn9JDBkYAeBTlxmkL3eBmEfgxzvSk955CLTE5Tgkp3liKnHLq14WDhQCqR01I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792402091; c=relaxed/simple;
	bh=0dyPF7mE3t+RM/QADdAdf/PKx71VS8XRDDVPCLUpasc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SSGbZT/w9KR42kYIVkjbqn3UlrWNIk4BbCk6nh8jAGQZKMTBxF3oGyNLRWaexp5PsDZPndztxexPAsirG9GM+Znw0x6FM+4M3L0edhVgZmwQmU2azmaSNfy/3qaKm17xpA5R5uuRYeA64fvJfwWKtVOhAO3YKjDylih5l3E88oc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TabEt+4s; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TabEt+4s"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-487049569b6so899804f8f.1
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 02:28:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1792402088; x=1793006888; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FK8j4zExJxC720gbifUR9mDEZ2k0SEqSK8uj/t6ufAU=;
        b=TabEt+4syARpZYSS7IAUv/4kga+T5mT5y5YV4/TwUanxWgYT/3tSNCDXar14lM3s0H
         2IXDJb6fV0mk26cwkkFZijqxVxtT5Ahl72+Z0suNdAi2MaGf349Kl7Q71ylydqVvKJFT
         KyMqDVPxYmH6P0rDXOtqj36kHXvbsVWJ1wjxkaQKXvJ1LMhAWCtFjKhAxVWp0JQrPF1F
         MZImYUWGFPs/IvyKEJuRB7hzeGc8UZmOytgRX96KnwaunyDKGg+OrTulWUzkS7ju4+oN
         Dg8emLA38yAWd1v7qMBKI0kqOZW/I6e1UQzXhneL8ur/ver9WLJRdpeeZBJvH0qR9hnD
         vFWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792402088; x=1793006888;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FK8j4zExJxC720gbifUR9mDEZ2k0SEqSK8uj/t6ufAU=;
        b=X9BSKLBsPMkKPNKUALK0PMP+YKlbdouqHWQr+EKqap+6FOIAbSPlDl94EOoU5Tgc4O
         M8ZgLTdBLq048etLR2p+8Tojvfe8XZg8f1ZEbtOWufd8CGCvG2NsnTBHIeIqn2qjOPvN
         Hm+HBe+fuj5YEOhXBBOks0oUeGYYZ5X1J1HuK7Qk1+28OItQKsSyM3j5XM9PZcSASVeF
         hf4hjgqY9EX0DgvHH4o5Oy8LNld9gXCUG4pSPfPm4GcxNl/svE5LJ+HIWkMqUJcdDvEO
         L2Dav/NMAQFaJJLpNsa919vdVfZk1582hyrnoqJlyxAiY4UEFzfJEjgCohbB6ahAu4Tu
         jVtw==
X-Forwarded-Encrypted: i=1; AKwUvBwMr3avogkPMbWnXdjsFKEN12Sm3AkHJcL80NsO9T2iv8V6dZngK8Bd1tvgB5uvyjOckannx+Mgtmpb9jA=@vger.kernel.org
X-Gm-Message-State: AFq9FYKnnhHCOb6yXu+RTB+p1H3NQvGXOsY/M45M67HNgtVo9HefhEHr
	pj2hGW0CVLP740WjqDL7RJT5AeBLL+JaLvT18KnLbN/o5kL4zxteJZY7MQvEghZzCWE=
X-Gm-Gg: AYBFou3jx0HMzjh8Gz0HjMA0ajbgD9pD4dZV5637lCCKQHtHolrPlVX5ZhEW0/qbySb
	gmzhOUunmlZSgw/vykOQvxLTOnrVq4kUdWVgkdoObwZ/gY9RpKi81HRV8AVlsNZbwYTDbKzbgPF
	ZmBEV6U62L7hHMOb4AZICBbCjDS5ff4jLtFtcZIEgWnkzMjfXj/8XKT1pMSm4oT1FHsBjlFYuVC
	UmJknnkJwQ4Y17K+ZPFtfq9V/pKckTa+AVDN/nqINR4woUej5b7u0432MB/cRSPLFHziSs7a+aX
	iqZGafK/yaac2Q/4l5UdEKpIJiC3Ap3o2OA0lUG0tLXrW+JtO0CtEnfbqERee5cC+WL/Gkw29q6
	CCowgdiNCxH3MEHEQG7nPpSLzhBVnkFWKY7+iXxRCH1UZHOIercyhu950O477vIrgKTLbhdflGh
	uf9hY/FwHTVkpBWaU0UyEQGJjHauraGd5YMJ2VHJfMgo0bV6KC7uPVcaHk64tSvcvrc7JdHqofM
	Xl3faU62WtHQN2mafpamxGP7koyCSIr7ZD0fiMTj6K5VNgDqAPXNF4elREF
X-Received: by 2002:a5d:59c1:0:b0:48c:4d32:ccfd with SMTP id ffacd0b85a97d-48e0797ff49mr16398545f8f.6.1792402087710;
        Mon, 19 Oct 2026 02:28:07 -0700 (PDT)
Received: from ?IPV6:2a0a:ef40:eb0:c501:2c4e:44f:2449:8978? ([2a0a:ef40:eb0:c501:2c4e:44f:2449:8978])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd471a64sm23498338f8f.6.2026.10.19.02.28.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 02:28:07 -0700 (PDT)
Message-ID: <cb24bc10-aa0f-481f-80d7-71fddf1e428d@linaro.org>
Date: Mon, 19 Oct 2026 10:28:06 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/10] ARM: ti81xx: Prevent USB being put into idle
To: Andreas Kemnade <andreas@kemnade.info>,
 Ettore Chimenti <ettore.chimenti@linaro.org>
Cc: Paul Walmsley <paul@pwsan.com>, Aaro Koskinen <aaro.koskinen@iki.fi>,
 Kevin Hilman <khilman@baylibre.com>, Roger Quadros <rogerq@kernel.org>,
 Tony Lindgren <tony@atomide.com>, Russell King <linux@armlinux.org.uk>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Christopher Obbard <chris.obbard@oss.qualcomm.com>,
 Linus Walleij <linusw@kernel.org>,
 Rouven Czerwinski <rouven.czerwinski@linaro.org>,
 linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-gpio@vger.kernel.org
References: <20261016-patch-ektor5-dm8168-dts-v1-0-b4ce30217028@linaro.org>
 <20261016-patch-ektor5-dm8168-dts-v1-1-b4ce30217028@linaro.org>
 <20261017085339.3533e9ab@kemnade.info>
Content-Language: en-GB
From: Andrew Goodbody <andrew.goodbody@linaro.org>
In-Reply-To: <20261017085339.3533e9ab@kemnade.info>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 17/10/2026 07:53, Andreas Kemnade wrote:
> On Fri, 16 Oct 2026 16:41:16 +0200
> Ettore Chimenti <ettore.chimenti@linaro.org> wrote:
> 
>> From: Andrew Goodbody <andrew.goodbody@linaro.org>
>>
>> There is an issue with USB being put into idle with DMA enabled and that
>> is mostly prevented with usbcore.autosuspend=-1 on the kernel command
>> line. Stop the ti,hwmod code from putting it into idle by setting the
>> appropriate flag. This stops the log entry 'clk:0058:0: failed to
>> disable' being generated.
>>
> So the module cannot be put into idle in certain conditions. Why do you
> disable idle under all circumstances and not e.g. adding some
> runtime_resume/suspend pair somewhere?
> 
>> Signed-off-by: Andrew Goodbody <andrew.goodbody@linaro.org>
>> Signed-off-by: Ettore Chimenti <ettore.chimenti@linaro.org>
>> ---
>>   arch/arm/mach-omap2/omap_hwmod_81xx_data.c | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/arch/arm/mach-omap2/omap_hwmod_81xx_data.c b/arch/arm/mach-omap2/omap_hwmod_81xx_data.c
>> index 9b5c728fb7da..2f55dc32e150 100644
>> --- a/arch/arm/mach-omap2/omap_hwmod_81xx_data.c
>> +++ b/arch/arm/mach-omap2/omap_hwmod_81xx_data.c
>> @@ -650,6 +650,7 @@ static struct omap_hwmod dm816x_usbss_hwmod = {
>>   	.name		= "usb_otg_hs",
>>   	.clkdm_name	= "default_l3_slow_clkdm",
>>   	.main_clk	= "sysclk6_ck",
>> +	.flags		= HWMOD_NO_IDLE,
> 
> and why do we need this here and not in the ti-sysc node?
> 
> Regards,
> Andreas

Sorry for the noise, this can be dropped. It is not needed. It was a 
workaround for another problem that has since been fixed.

Andrew
