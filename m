Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 133704B8273
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 09:58:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792403910; cv=none; b=dhCtkAa0E7emS0qbd0oJ3mdPuMrPDUpt/SwFwMBB9NfuUzLcNcAZc7uA3weWdIb1UdCr/jHQGs1V9m8TLbe3voXn94QNKC05QCAdkMH/6CRA/Yl7izf1xcAY0W5BL6qCtoZd1hjExNOjpxNY9bFSNgkcSA1UIHUXSBUCap+xnxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792403910; c=relaxed/simple;
	bh=eGAF2rlwQq8vrlYsNjNO5wZQgv0NDo73dHPMv/EUZMA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FDsIsmicvBABsX0pSBMuvR8gnoX3jUQM5JRSz11zJKRkPmwAHT7+/Gsb19UTTPUSxfmKj+WbmL2x324FVWPzZpx7dpJ2UFq+4ChjK4vDC4gpsbJFzAT/YHEXsiuD/wT0uOdC9Tr4WqWYaikUDG0r9tZAYKjZfp+BqATl+J3ar40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=ESeQ7N44; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="ESeQ7N44"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-49d0da752ffso15175645e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 02:58:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1792403906; x=1793008706; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fFxY6AoLFrbUivYUuQNWjKVo2lafGDyB/yJV4/e5rAo=;
        b=ESeQ7N44rAVadcdww7HKi34BCvlPvJ/WBrGpGgngLuTG42gBx+5SPVgNliJCBwVa4O
         89pbHujG+82jsPLRW7e6r5be8yk46hvYDk0tv1axYFUA1ZZY+BApLEC48R9folA95uyD
         p4wQk7ELbE6xscICda7ygBfuARyOq2F9qA9BYJF6BiBYhHDZMXGOdb0kTu7GG7vA1aQP
         xgB+LlgcxdDTyfWqcGIvoYBxbvy3tNrcuEuYIPJXlzvXQNt5ESBkbfzAeuuJvINFNO6L
         oHzHLx8+PNECXfQpuyaHL6zgnSdnKq5axW9zGDie8Cs5UqIzV8e0F3M0ab5pySmr/nVE
         WiDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792403906; x=1793008706;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fFxY6AoLFrbUivYUuQNWjKVo2lafGDyB/yJV4/e5rAo=;
        b=InCUoraqGY4YdoMmBXiGroGdjMlwuc5OVaOHZ5oIjhxPCuVD9s1qqjwNKmlI8V2RUU
         pxCuauf01FK3iBEFPjC3CpNW2fYAZxMTdPieMDS4wr3i8s6eBNx3/h6i5Lf/SO61GefI
         ALutZL8jblcHLTy8903sDKUf+AUO6IQc1lU+VJU65RBi0so4jrKdjfuiQh7/9xaC1n3T
         RJqhfj3D9I1iZDuu/EB6HE8WkGmyngJ4cQ3647cn2ZFMlDh/XvZznBMS28HtGmFW5yzg
         NlafkDRdZxngDNAvUwScITZ6OzfGs5g8iQIji8S+/NLDB4oDCdn7jtMOrWLPli4mhl03
         vxTQ==
X-Forwarded-Encrypted: i=1; AKwUvBwmWYQixQ0RFbBtL3fwLWdUFXdlKnlyMWDgB5VCbt4vGW4nK/cVzKv+3OER9YLtDp4cIrbCfr2e+NyARL4=@vger.kernel.org
X-Gm-Message-State: AFq9FYJuaOALEtro9jiIOSPjKeLJWObPrn5jC1A3g02tcsHNqXFKzIpg
	Bd98AujxHXrcXc0MStSL1K82EkSEwBK4tL5SQI1o+2TXOx4p0TloA9mSXyCi7T8+Bey6IEzZjg2
	bF9rv
X-Gm-Gg: AYBFou2RtrJf/YrI/SyIWxSeLM5ofCF/yP3BGqa00D3/PqXcmUhGvOgQEzwpFYwzCvu
	XgqHIeQoPKeWnfq+BnmpZINndZspkWPXokgKppwiZSqYpBK3l/GAhOGRegf5xaQ6NNwCWnfUlBM
	XuWFoW4bAvafEMsdplgO1l+T0SUqCqVLbu7xWU4JX1FjnYI8r76vMRdt1z9S8vv4MQSGwVbg2RR
	8YfJV/Rsv3T6gtesSJbMi5OuUPCs2TDuUyOopQzjG86sV39JnEtoH8mi+POCDmp2ESBRAOPJoJ9
	lcLSenwFMaPdldpAUJcFzCwjT/Bwl+aejQSFzQjthD0eiv3uE/twiojU64fSMslw2sC3LAD/YgG
	pd0kcaAfCYAs/vxX5iyAH4GjmL1diYLMBfg0devdFoBuUZoO0Ol1we1PkDw4jL7/RgPvcPBLQnc
	YmGIWQ6TFYOes/WCRASCubT2uypk358YnRi8dZdiHsSdrGj7nvioL0MQefLciqgURuEksomaCy1
	xh0HKc=
X-Received: by 2002:a05:600c:540f:b0:4a1:97c6:d2e8 with SMTP id 5b1f17b1804b1-4a1d7633b35mr152802705e9.32.1792403906248;
        Mon, 19 Oct 2026 02:58:26 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.221])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1cdf2f0d1sm156663265e9.2.2026.10.19.02.58.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 02:58:25 -0700 (PDT)
Message-ID: <4a9e32a8-8a2e-4b70-8057-2d51e6d38b98@tuxon.dev>
Date: Mon, 19 Oct 2026 12:58:24 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/7] can: rcar_canfd: Allow the CAN FD clock to be
 sourced from fck
To: Marc Kleine-Budde <mkl@pengutronix.de>
Cc: mailhol@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, geert+renesas@glider.be, magnus.damm@gmail.com,
 biju.das.jz@bp.renesas.com, fabrizio.castro.jz@renesas.com,
 linux-can@vger.kernel.org, devicetree@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
References: <20260902141544.565763-1-claudiu.beznea+renesas@tuxon.dev>
 <20260902141544.565763-4-claudiu.beznea+renesas@tuxon.dev>
 <20261016-durable-meticulous-owl-7a9eed-mkl@pengutronix.de>
 <69826962-0c21-4616-9cd8-6eb0478a422b@tuxon.dev>
 <20261017-weightless-poetic-mayfly-bbdf75-mkl@pengutronix.de>
Content-Language: en-US
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20261017-weightless-poetic-mayfly-bbdf75-mkl@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi, Mark,

On 10/17/26 23:01, Marc Kleine-Budde wrote:
>>>>    /* Helper functions */
>>>> @@ -2190,13 +2196,20 @@ static int rcar_canfd_probe(struct platform_device *pdev)
>>>>    	 */
>>>>    	gpriv->can_clk = devm_clk_get(dev, "can_clk");
>>>>    	if (IS_ERR(gpriv->can_clk) || (clk_get_rate(gpriv->can_clk) == 0)) {
>>>               ^^^^^^^^^^^^^^^^^^^^^
>>>
>>> As sashiko.dev [1] pointed out here's no check for -EPROBE_DEFER.
>> This looks to me a pre-existing issue.
>>
>> The newly added support does:
>>
>> fcan_freq = clk_get_rate(gpriv->clkp);
>>
>> At the time this is executed the clkp was already checked against any errors
>                                     ^^^^
>> (above) including -EPROBE_DEFER.
> It's not about "clkp".
> 
> What's missing is, that "gpriv->can_clk" is checked against IS_ERR():
> 
>>>>    	gpriv->can_clk = devm_clk_get(dev, "can_clk");
>>>>    	if (IS_ERR(gpriv->can_clk) || (clk_get_rate(gpriv->can_clk) == 0)) {
> but if it's a -EPROBE_DEFER, IS_ERR() returns true. I think in this case
> you want to return with dev_err_probe().
> 
> There's also a difference between "can_clk" not found (e.g. not
> configured in DT), and there was a problem with "can_clk". I don't know
> if this is important for this driver, but if you want to distinguish
> between those, you can use devm_clk_get_optional(). I will return NULL
> if the clock is not found, -EPROBE_DEFER if not available yet, the clock
> or, in case of an error -errno.
> 
> Thinking about it: if "can_clk" is not available, I would consider it
> intentional, so the driver should use the other clock. If the clock has
> an error, the driver should not fallback to a probably untested clock
> configuration.

         /* fCAN clock: Pick External clock. If not available fallback to
          * CANFD clock
          */
         gpriv->can_clk = devm_clk_get(dev, "can_clk");
         if (IS_ERR(gpriv->can_clk) || (clk_get_rate(gpriv->can_clk) == 0)) {

Based on the comment on this code "If not available fallback to CANFD clock"
I think the intention with IS_ERR() is to allow probing go forward, falling back 
to CANFD clock, in case of any error of devm_clk_get().

The device trees that I've checked sets the can_clk to a fixed clock with rate = 
0 or have the clock provided directly by the SoC clock provider. I think the 
intention with IS_ERR() was not only for -ENOENT but for any other kind of 
errors. We can return in case of -EPROBE_DEFER, to ensure the expected clock is 
used, when it's available and sane.

I'll switch to something like:

  gpriv->can_clk = devm_clk_get(&pdev->dev, "can_clk");
+if (ERR_PTR(gpriv->can_clk) == -EPROBE_DEFER)
+	return dev_err_ptr(dev, ...);

The devm_clk_get_optional() would involve changing more lines:

-       gpriv->can_clk = devm_clk_get(dev, "can_clk");
-       if (IS_ERR(gpriv->can_clk) || (clk_get_rate(gpriv->can_clk) == 0)) {
+       gpriv->can_clk = devm_clk_get_optional(dev, "can_clk");
+       if (ERR_PTR(gpriv->can_clk) == -EPROBE_DEFER)
+               return dev_err_probe(dev, -EPROBE_DEFER, "cannot get can_clk");
+
+       if (IS_ERR_OR_NULL(gpriv->can_clk) || (clk_get_rate(gpriv->can_clk) == 0)) {
                 gpriv->can_clk = devm_clk_get(dev, "canfd");
                 if (IS_ERR(gpriv->can_clk))
                         return dev_err_probe(dev, PTR_ERR(gpriv->can_clk),

Please let me know otherwise.

Thank you,
Claudiu
