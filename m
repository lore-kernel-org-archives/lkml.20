Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2E0C3769FF
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 19:44:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788205468; cv=none; b=DqOTKNDer/5diMxdDgylSm+7iF1wU74iBL1LUhqCoeMlq8ok5jNGqaqHzFmLNNXs7Qn9hrp5kA0hgy7XrOQy1WnW4cT2EdUuhWmHGysdiT8wTY/zkIDgqpwpqGmKtt/lQTMGPfiNwVUFh6+fQfB5QwMSOrxlp/6SjYXFJ1iVDhE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788205468; c=relaxed/simple;
	bh=eWpXRhxHS2WF406Ert5+8cxUb29KHQLVMqQPlC+E5vA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aaneaWvbpUljEbIhQwaxzuJXLp+dqPV4ZEiSwq684pDob6vNhWVFGlVkXCBqe4ebpX9hJfouNR2sDq4tDrURGkw68J1I2Odzz5OQlhm2NaCOSOiW0XcKkxnwxm8jBCfNQrhwt9Iyqe7ak7XC0glY7uNC3h9ZjM6r3+cW2rbTJWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=d9fJEm2/; arc=none smtp.client-ip=209.85.210.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="d9fJEm2/"
Received: by mail-ot1-f50.google.com with SMTP id 46e09a7af769-7f4df360cc9so309713a34.1
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 12:44:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1788205465; x=1788810265; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IGP7GGTvrEowNva1rbNoI+VHdtW9WuY11cAsUH1ZGFI=;
        b=d9fJEm2/EoHMYtc3tZWjdZcR21hq8CFqm1RLJkTqk3Y95VoFSTqW593IZ5r2FIYqK2
         jzgP3BAqTfR5LfaUJaaW96Wknlie6LmkDuOKuYRH5VqJXqYGMwWd3GuLXAKuLj16jYIy
         ahywBIPSl/fFsnKUlEX+ahiwE17ijDmXVoUGdmTCgN2IhvthMIefzA3ewh6JIK/bjVar
         PglNOU8MkgfKqWwebFP5/6AguRNODrokx04Edib6BQGg+tR8YRf1vQDgx9Dkwhd70QnH
         2JwyAPX+dJHjgVqv8jFcyuYCTTfXG4lmeRi0wh8JCGCjAVtFIoqG4YcsusG6I0ZZ+dFz
         DfaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788205465; x=1788810265;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IGP7GGTvrEowNva1rbNoI+VHdtW9WuY11cAsUH1ZGFI=;
        b=amD63ui/PgQOcNMIKLddcld5WehtdB818NNC4CZoylAEnf+kdBJpw3MKIB89/8RwEF
         +8kAj4ruT4a0XNuuTRm+881I7Xv+WR3TNrlaiLOhqKmbKW5B61hkOBKcp4GtGCwBjEFc
         3usG7G8jezdrfQZzV7kDw9lcwd6y7+UyIuInH86FiwS8PcffJ4XvKYPwrK/CTTgPhHw9
         z6pVGsolpXVj+c/AGLcp6jSqkS0doWo9lOK9ZXfNEe9HLhW6ze4ovohDHf6EXD/YBFDD
         +nn70i964/MEpNFNX2CW9LMqJr+ExBCHC91v1T7Gvq+l2QcEWa77uDFx7QFD5/wsSoZt
         t1cw==
X-Forwarded-Encrypted: i=1; AHgh+Rrv8g2N2ubNZbte6AMRiLOHkSvc/iAqFqSeBNk8F0NyFXFvZ1B5DnzkkXZZK9bKIYK/X9Xai7dE/vgwIoE=@vger.kernel.org
X-Gm-Message-State: AFuF++lMXyFrPbtoO8H8L4fnztnMFomV3HPmSAnIsGzIxFde5KdXY4e9
	4TZy/IfX3Q0v8IIlplecqL49lnq0AUacea0zp3P9gf1idvAKyG0T82PIGLfeL3HMO5s=
X-Gm-Gg: AR+sD10b90u8HVGTeopsGYbc6xCJ3Ahd9Ifq0nE8ULXnyWgtF7gR3AuEg+DzxwY9zAc
	G5l7LZKtB2yhT9vY3Z0IvHonhBpznzP6FkKkDfI3236fRG0sKg9NUvFuO62XWI55l/wWQqJSn9E
	KibRiK9PoQnWBjqWrtGmNqrP4QSO2wHl8w0AeEOLkGzDpGh/4V9uQnupmsk/mxkHuAkyWUALfD0
	uDFbQ/ELlmbNNDjxGXC14M7gMYbGcMYFEDcmF6Vmc4wTRW1morQEP/w6+18gI2uDV5XKELICEtm
	Aa8bAMF2XKehCCRI70PupcmiCAdZ+oAOXMODtpZCustGxG+7FwX56m5Wuh1Dfk2wlAYsAZ0UkqF
	wN2ffwsopRllrSetwISftqFxghUnwPgKY+eov0fmne3JDVUG4UoLvGnFwgTYyjIYvlkYlfljHe8
	zvj3uuu2QVf8LWHG4t6EYOcbuLoCSlXAIWqmnHKeeWBoHexo0F7be29zYOjZGT4c4RbYT+tXJTk
	Zhw/MaOcEtzQTJ9fSNb4zLdulLdazu/ClUb
X-Received: by 2002:a05:6830:8545:20b0:7e9:ca12:37bf with SMTP id 46e09a7af769-7f68f5d5015mr470147a34.7.1788205464675;
        Mon, 31 Aug 2026 12:44:24 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:500:778b:da9:a8a1:bc78? ([2600:8803:e7e4:500:778b:da9:a8a1:bc78])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7f4fa7e92c1sm8939784a34.8.2026.08.31.12.44.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Aug 2026 12:44:24 -0700 (PDT)
Message-ID: <aae42329-f531-41fc-80df-2cb5e445f1db@baylibre.com>
Date: Mon, 31 Aug 2026 14:44:23 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 02/10] dt-bindings: iio: adc: support the TI ADS126x
 ADC family
To: Kurt Borja <kuurtb@gmail.com>, Jonathan Cameron <jic23@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: =?UTF-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
 Andy Shevchenko <andy@kernel.org>, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260828-ads126x-v4-0-1dc27e9c0260@gmail.com>
 <20260828-ads126x-v4-2-1dc27e9c0260@gmail.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <20260828-ads126x-v4-2-1dc27e9c0260@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 8/28/26 1:38 AM, Kurt Borja wrote:
> The ADS1262 and ADS1263 are 32-bit, 38.4-kSPS delta-sigma ADCs with an
> integrated PGA, internal reference, excitation and burn-out current
> sources for sensor biasing and diagnostics. The ADS1263 is compatible
> with ADS1262, but includes a second auxiliary ADC (ADC2) to perform main
> channel (ADC1) cross-checking measurements, system background
> measurements, or temperature compensation of the primary sensor.
> 

...

> +  '#io-channel-cells':
> +    minimum: 1
> +    maximum: 2
> +    description: |
> +      The first cell selects the channel by its reg. The second cell selects
> +      between the main ADC (ADC1) and the auxiliary ADC (ADC2) as follows:
> +        0: ADC1
> +        1: ADC2
> +

I like the suggestion to make this always 2 cells. Makes it simpler. And
to put ADC first.

And maybe make the first cell take 1, 2 so we don't have to make the
translation?


> +  "^channel@[0-9a-f]+$":
> +    $ref: /schemas/iio/adc/adc.yaml#
> +    unevaluatedProperties: false
> +

...

> +allOf:
> +  - $ref: /schemas/spi/spi-peripheral-props.yaml#
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: ti,ads1263
> +    then:
> +      properties:
> +        '#io-channel-cells':
> +          minimum: 1
> +          maximum: 2
> +      patternProperties:
> +        "^channel@[0-9]+$":

These don't match the pattern above (missing a-f).

> +          properties:
> +            reference-sources:
> +              minItems: 3
> +              maxItems: 3
> +              default: [internal-p, internal-n, internal]
> +    else:
> +      properties:
> +        '#io-channel-cells':
> +          const: 1
> +      patternProperties:
> +        "^channel@[0-9]+$":
> +          properties:
> +            reference-sources:
> +              minItems: 2
> +              maxItems: 2
> +              default: [internal-p, internal-n]
> +
With those fixed...

Reviewed-by: David Lechner <dlechner@baylibre.com>
