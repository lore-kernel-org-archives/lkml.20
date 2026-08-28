Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D802C36195A
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 02:48:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787885327; cv=none; b=d/TZO+hspCe0u85neED2H2tA8k31Mo2uzrELDyzU7S7uL5gnRExvDXCqMryrS9xEF9wuU8LNUqCsj+uxeqcObPUpvNPvUVIRFfzAYZrnmowJ1pcH7+gzvJDypV83kUJyKFb/yhLBxqqLoNMtbOWea8vuNQvf/NFQdy/vc0dQphU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787885327; c=relaxed/simple;
	bh=jWqpeJZIlYDu+Q5xCDiOg9008ijAT3x657XQiXkxHk0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Lh0VLdCTgqyPnADR97DdlNGz8d8tPdK4rNcfRod5SyV+moYZgNoA4aAE+rT7aDzYsdU5BeGmq1C7pW0TramqACikhjXZEEgXC/bt9RX75fOwVBMLMKlXLN7WAypN3CaiaQ+Yan6nEPVkN/83yx+4yMFoL1nIH0BgofUp7jxIXwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VwrHF6r8; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VwrHF6r8"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-39647aa9d52so553751a91.0
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 19:48:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787885325; x=1788490125; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NJyX/sTI7ddUntBaZ2k7BLJc1KSOT8B7StpeDL2PyF0=;
        b=VwrHF6r8xt4/LRl45fPEYS+WSozCo21sjJQjjl94eoJgCvQ/P9jeXd9bDWZYsDWBvW
         xb+skXvSq9ddwwyGWWqXUE752AzEGegq3NOXBHwQDuul6COUkCQ4OKBTS0nhjO5cJc8C
         mL0boZWlOtp26nAjJRmMSmOL4r5UB44+a/5npL8HlHHH1rIJv6Z5Kb5ngaX/Q3MREeFM
         XO6vIk4hPvVX0XH4H0JNJNTfiL9bvUiVJX6T0vmRcgLRukh2blLO79gWeNeJeXKGrazI
         yFvRqraZlpvjCwVzPfaaXLfnecIsEn9Aer/OV7mZxJdxJ6j+hSB7igDd/pp55z3nLCvk
         jkng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787885325; x=1788490125;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NJyX/sTI7ddUntBaZ2k7BLJc1KSOT8B7StpeDL2PyF0=;
        b=cKGtdeJ1lXEi4oLAQ9KOY0CwX0UzSnHUHTIu+MG0+Pav4U3iQAxuGvEo+Ogo2nf46J
         vruhqQu6ablZDSG5GPdmyQPV5PqHCzE7uNxoKACLZ9hW7dvuYm3K6EM4iWcj+tFXungw
         5hqDSD41GXLj9rZv16vO8bWQZ/seoylpqn6j9a0CJetehIUaWgJDAaLW7nWkjWglcsCN
         uoXr/r3zrRA0DhdocoCIuLAjDC+xH+BMSGQPxUF7TH2NyyjRAZR1pEyQmyAP+ZNlUmdM
         8MkK3waK8IGEM409o8bitXuSf2qQGr/MnqNYb6dU+IHnhzuHskzDTz5uSLLe1LWy71sr
         JzQw==
X-Forwarded-Encrypted: i=1; AHgh+Rqg6tKj7TT4BolFumlG+RcuwXvKD2+GpoIvYU+MOcFKLquVSO/7NOQJ/Urgzshw9mG3qwm7PMbxfpue+Bw=@vger.kernel.org
X-Gm-Message-State: AFuF++m1o7qUFmn8M1a3hUq4SY92cXdo+hPuUuucpJWzHDxhtY96/9AW
	QJP9eXt58cD0oSNBxbfUfFnqe5SM6l+yqEQGJzFiUhNV+pZPbS7tODFp
X-Gm-Gg: AR+sD116iPWOOfDA2YPyosc2xsS1uQgrDWJwDOmrZ0S7y5R1dyrUMbwNab3F5Grim0E
	Sa6K9S0KdttiTY/RnStYaJMIX6yWdCTkljU+fJS4aW4V3de300YTz1C5DqU3en52Zcp4YBqiQy8
	uQngWICe6/NZTX3cV81s7HvSkg1CJ1aAjOzQ3iVZO/wGxsXcfHUi8BidqeLB4sxzD4woZT/11uo
	8uwqH3L4jGX8X1FH8cqBgsSJQK9oHUWEnc9pCaNH5j2/a4v99mXTg/d92klC+sUaOFfptwQp6kW
	WWRWuDqgPZKe6IOUV2IWr0CzUJKrWgH0YfwF8gsiTgcPHvMpl16cPoCGeTbVY2/dkbDww2FLXmZ
	iyGwUVuXfvy69tSMMFK7oehkIt6IMTPK3eBfEjhsAtoUx2RaoD5y+p0Jygx9eenSXpYUNqsxX+D
	JieL8b269egDNSgirl4Ep0HZm0Hp0LX+XMXKq16O/ToowL1m/JDzAzaGCox766z99o92iSaBIcr
	n1o9lk=
X-Received: by 2002:a17:90a:d44b:b0:37f:e5b1:ec4b with SMTP id 98e67ed59e1d1-3969ba8642dmr16032119a91.5.1787885325113;
        Thu, 27 Aug 2026 19:48:45 -0700 (PDT)
Received: from [10.25.165.77] ([128.77.72.133])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-142e0d2e465sm2109869c88.4.2026.08.27.19.48.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 19:48:44 -0700 (PDT)
Message-ID: <8849ec9d-a7fd-47d7-a8a8-a31849637f6c@gmail.com>
Date: Fri, 28 Aug 2026 10:48:38 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: imx8mp-phyboard-pollux-peb-av-10: Fix SAI
 master assignment
To: Primoz Fiser <primoz.fiser@norik.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>,
 Yannic Moog <y.moog@phytec.de>, Shawn Guo <shawnguo@kernel.org>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 upstream@lists.phytec.de
References: <20260827065556.2326079-1-primoz.fiser@norik.com>
 <0ee330e3-8c6b-4162-81fe-d769982df5de@gmail.com>
 <bc5c1564-963e-4995-90c1-8d78cd9df26a@norik.com>
Content-Language: en-US
From: Chancel Liu <chancel.liu@gmail.com>
In-Reply-To: <bc5c1564-963e-4995-90c1-8d78cd9df26a@norik.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

> Hi,
> 
> On 8/27/26 10:56, Chancel Liu wrote:
>>> The dailink_master label was incorrectly placed on the codec sub-node,
>>> causing simple-audio-card to configure TLV320AIC3007 as the I2S bitclock
>>> and frame master with SAI2 in consumer mode. This contradicts the SAI2
>>> node configuration (assigned-clock-parents, assigned-clock-rates,
>>> fsl,sai-mclk-direction-output) which requires provider/master mode.
>>
>> Just a small question about the commit message. As far as I understand,
>> these SAI2 node configurations only describe SAI2 providing MCLK to the
>> codec. A topology where the SAI provides MCLK while the codec is the
>> bclk/fs provider is common. So the original configuration seems
>> self-consistent, not contradictory.
>>
> 
> You are right. Such configuration are possible.
> 
> However, on this board's wiring, SAI has to be bus master for BCLK/FSYNC.
> 
> Shall I reword commit message or is this explanation enough?
> 
> BR,
> Primoz
>

I'd prefer rewording, as current message is a bit confusing.

Regards,
Chancel Liu
