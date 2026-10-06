Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BC09383326
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 10:43:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791283390; cv=none; b=EP2gbGlCkLYpmGkXvVfWb5kahXQr3zfA1gchg5Fu1F1ycXvrgp08UAQgLA5kS+Uoez1iWorlMf+iaKOd78drL6dBmkPQjv5VOO79vgRwFxiHJPABEv+dUTf9ia2FOzMXI9NLiuccn61u7p4k/Xvl2pcq981fD6N1jcCEkM/XG7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791283390; c=relaxed/simple;
	bh=Y4YXkuvkrc1XHWLGfGnZVC4JlpoFO4yvIMBJD/MVErY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LFzCeMP26QFrUtIXe0ZdpTIuoX6B4d1xqZBlQ6x9BYSVngeXxqFbigb0yo8L8jA5wUDbcyUE2JkCSmfpFg4w8B7ZvO5yz0oGQca5mBwfkvZgW66Q1a47Y7NC7ge3WPbDkxH/vjESut9umMDF4mJPKu5lg3irQECD6tbMEsR61n0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ioc8eQSe; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ioc8eQSe"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-3a0aaa0fd13so999634a91.2
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 03:43:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791283389; x=1791888189; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WgOz8LzlE3w3VKFtUPRYULU7lY8WNBCIqyynChuXNxU=;
        b=ioc8eQSes1AR8V86aI71e73rJbRneVPIfBQdSBgV5w4VG9l0i9DgDn+iEWC6NMzcXR
         Nnl4bYj64aB4lQZhKJTNyWJgBaIjCRgNAF7Lc7IGVn5Rzp2LC0lOS4WMhoCyd/0ct3VQ
         JRJkE3ga4b+tixfKcEyipvKkAf8gQBAgEYt1hgHkjpEcj+HrQDsf/Ok8tChHnLPvvmbR
         3qw6wT6o0Mvo8Eq08Rj9MCjqRszrjv59PLcJk6ubw4AWuidIaZ0iZfySSXK8VBt7W+hd
         Y55IYE/1jTN4XlaR2oTGjrmLfdhBSONg78NxNEJMLMLfTJqepQDTyU2BYyZqzJbpcvPc
         1AjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791283389; x=1791888189;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WgOz8LzlE3w3VKFtUPRYULU7lY8WNBCIqyynChuXNxU=;
        b=muMaJaDIT+e5VZHHnia4r662V5cbdbb84r8RqcjovXgnnqMyBxqtUOGLWNpC2cpMKR
         6UUO+Gq25/k2drjPmo138F4iyh1efpdw/3t5BUTXy+mqnPk52u8mI/JLVGWbkoc+RZWo
         HsuLO5o7/9Hxe5YSHol7q0HSRcrYHjpS7BSVnQSrwSJnOm0K9F+MMeqcG3mgPlYdI3Yi
         MkWvHtAcx1o8cSF34z4CuiKgoyNb9nRJGEBLko8clBU9XxDIB2WEUw5QskTjIu0l1NP/
         pfIntNVzjhr/jGiMbgavHeDEkBJfES8fcEpm76DK4ntmOIQGUm5Pi4pfjP+b2Sa0BoLC
         +KJw==
X-Forwarded-Encrypted: i=1; AKwUvBwGn7xTeCGBCe5Gc90vWzlT1BXb2CKNvWGlSsSwhfzWZG+7SR7B0nAvoe+7DIf6Fjxw+9ojmaJv42r6Fls=@vger.kernel.org
X-Gm-Message-State: AFq9FYKvF+f0c5SHtdU2jQ/zEo3p8WG0rVA/RwpNQFZR0jbKwO6mSKEm
	nQyORKenFiByJTxxKUqwTWhgwt5gW46OIxkxGPGQlsMMc5GOi93DizVSPL2LUA==
X-Gm-Gg: AYBFou2Bzy9+99OEFWcPN4eoyaLox8KvZfSmKnQH7cEQhDDz1EI3X2qGK2x1g9BItxQ
	FciqtLT9C+UNJEKbpuqHldCevX1echKbHQypFuYVxI5a+s4JSSL3mePjh41rxr6BqIho6DE/Zg6
	TIksD5UgcIwp8RQv+AXP+9exJxFMapGWNslUrQec4VnfuNKHcncJh08kAQW41ra2zcwWy3JUNbB
	AJyTL5EoJie/AFu6r5l/eO/bbsR1ZVXawR8w9TXPQF7Hz2OvFviUxjwONL14eeRxelLmq0ns6c4
	v8ZYEuLqzYXGXjY1jeHm1zEqKGJf4+NXOB7K1B0l/YumdYDl7vNi6E69WgH4INDbD32vknvoue5
	I69XENCku5mgT+I6nLi4FUHRn3oy/3i9F0FkIh9nJLxiIYS9flwLNonFc7M8MmdSuIvTjU136US
	Hg5AIVOz7oVCXdF6gNNiDlW+Q5uaHLt5TLwIfK9FAOMhMvRzovYQJzatWQHdJGDDIlOJXOhLeSb
	pHvkZNlDgAOL87MysHw2M0aAu1iA+cTh4RqaqHf+MCVbATai1Wpqmv9p5uPUxbXSw==
X-Received: by 2002:a17:90b:280d:b0:3a0:345a:3646 with SMTP id 98e67ed59e1d1-3a8736b5a2fmr730235a91.45.1791283388692;
        Tue, 06 Oct 2026 03:43:08 -0700 (PDT)
Received: from [192.168.0.100] (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a853cde769sm4184018a91.13.2026.10.06.03.43.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Oct 2026 03:43:08 -0700 (PDT)
Message-ID: <e646b60a-cbc3-44b9-8014-c9aa76ccc3bd@gmail.com>
Date: Tue, 6 Oct 2026 18:43:04 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 3/3] phy: nuvoton: phy-ma35d1-usb2: extend to dual-port
 with OTG support
To: Vinod Koul <vkoul@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Catalin Marinas <catalin.marinas@arm.com>, Jacky Huang
 <ychuang3@nuvoton.com>, Shan-Chun Hung <schung@nuvoton.com>,
 Hui-Ping Chen <hpchen0nvt@gmail.com>, Joey Lu <yclu4@nuvoton.com>,
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260929020854.1282339-1-a0987203069@gmail.com>
 <20260929020854.1282339-4-a0987203069@gmail.com> <asN29Gi71MIA-2fq@parshuram>
 <ab91b558-e7e6-4758-b4e3-66e5db75b790@gmail.com> <asSzYUA5W51Ngn4X@parshuram>
 <413f21b6-90ca-4102-9466-3cf7b9feddc3@gmail.com> <asTP4lI3psLy5GCg@parshuram>
Content-Language: en-US
From: Joey Lu <a0987203069@gmail.com>
In-Reply-To: <asTP4lI3psLy5GCg@parshuram>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


Vinod Koul 於 2026/10/6 下午 06:39 寫道:
> On 06-10-26, 18:22, Joey Lu wrote:
>> Vinod Koul 於 2026/10/6 下午 04:37 寫道:
>>> On 06-10-26, 09:37, Joey Lu wrote:
>>>> Vinod Koul 於 2026/10/5 下午 06:07 寫道:
>>>>>>      */
>>>>>>     #include <linux/bitfield.h>
>>>>>>     #include <linux/clk.h>
>>>>>>     #include <linux/delay.h>
>>>>>> -#include <linux/io.h>
>>>>> why is this dropped?
>>>> This driver never did direct MMIO access (no readl()/writel()/ioremap()/
>>>> __iomem), even before this series - all register access goes through
>>>> regmap via syscon_regmap_lookup_by_phandle(). So linux/io.h was an
>>>> unused include already, and it's dropped here as part of the broader
>>>> rewrite touching this include block. Happy to keep it if you'd prefer
>>>> not to bundle unrelated include cleanup into this series.
>>> Then it should be a different patch explaining this
>> Understood. I'll drop this change from the series. I'll leave the include
>> unchanged.
> Nope, pls add it, but a separate patch. This in unrelated to this one,
> and should be added but as a different patch.
Got it. I'll add it as a separate patch. Thanks.
