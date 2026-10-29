Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793271146;
	b=qLQSXgqaNZpTg5bQYUpizBouy4sfrN+Jbglk3cQMIOQD3mCPIjs8IgUDyL7DCjBac9hN
	 SRpsK3svtuVJ/EclDDXhlRWQnBkIILsXzy5+2rJbpv+w916bfRnVmgBJcgHI3M9gJQ8YF
	 FkFdM5s0UwIetQhkVPEZvRRanP8fsfqjJiQncxL0/beVABh9mNFaRWDEIIt+FME8L+pH6
	 bLlR+onGZlhqHTpndSx/bTg8/+unPswIa1taaRrYrlOE/hKBjtEbzXWzO3wamtfHDqOQc
	 yUoVplEEM9JhFK8nII4KmWzdOiA5VVsal4pTbcIeKmdcg8c7OubWcofpbz7GaAypDEQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793271146;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=Z9CuJJHkbbNNuzLS3GGtdXngJnS4fF2IBPDFiplXDVI=;
	b=Oow2E1uI8vL/8qWdRo9ZRfYyO1Ds61RzGW9I49gkVwkecsVpLQhY95dEbGF1DFGOZxhm
	 9bX0qSP0K91kIf44E6kWFgMLSBAhj7AvHlvla3z6wOo1n27GBELHQUsdjJs/jfw0KZyyo
	 ocVIvT7X5H/+CRtV90u8/189LrQDm4OgZ1ttr8Ysf7gSoZQNcpEJoxNCkUO6infzy31H6
	 Ee6uGF+6kiIdBgfuqQWvqlKJbWZUx88oZK/KLdiSREcz1afbFJSjOOdOnPPbNsh8ZCYXo
	 05dtIcitVUxvFPX/OsskfJi7IhelZxvh3nyWoz1KToUlG2EOhDuCr/oy53Q8MqDWWxg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PsYvEjgx;
	arc=none smtp.remote-ip=209.85.221.52
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C7C6606A326
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 10:52:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7C7C6606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PsYvEjgx
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-48afcfc4bf5so1626403f8f.1
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 03:52:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793271145; x=1793875945; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Z9CuJJHkbbNNuzLS3GGtdXngJnS4fF2IBPDFiplXDVI=;
        b=PsYvEjgxQzAaHbqnKMmKaATrRLL3eF78bLWpfKuowjhm9iKoiYVq+QgV27M271RkK9
         U0lV17SWE2FvHqBV8dHwPsyXM0iiPfahckMTEUjM4vepU2oEIRv9h4vPrVWCSKYV1e/Q
         z+ZYVBCIu1iWfyuTGFHun73FLD3PUyseydCFA8M/ACRg1UM6cJVeJLDl7qbu4gZLm+mP
         CKCsKhX/rc/bgD7Rrh9Nx3+81uQ53QlJTEjJ8mXQQNAIz8NvC+rBbb6CXewLhr74D48+
         Z7iYe08xhjdECnx0favoECnlXvKP1cL5eaJ/P8Wy9fI9htrlCFYOlNLFFQqZ8T0v9Z7z
         Salw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793271145; x=1793875945;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z9CuJJHkbbNNuzLS3GGtdXngJnS4fF2IBPDFiplXDVI=;
        b=Wn9qPeulyiW/4CFBqaVgq+nLQtsrBClz+cUyTWZRwDYcCmX2J1GifT97TmijTMzh4W
         x9MxKqPCcaRC78QxAkeXfOfyrorVa3VYDEamY5A7g/lIa3DgsfqtXG7M1trLwTPjmf9S
         +YqitW+UzwczDpMklv/fRz4vOHq/WgOoYvCm+IQI+2oVbfd93+dYjeQ/E3QSG5QGZz83
         LK8/Nk/oIxE2cYK1SAdfysum0GTcSXNy0keci+ZZ/OpiPDdI/K8RHIytI0/54nTObboM
         1dRuHL5N4smfwCjI0tEqPLCLOjw3Mv9Th251Z8EoMKPwsGDdd15IKHfEEOImCZ4iRdhl
         v2uQ==
X-Forwarded-Encrypted: i=1; AKwUvBzr9d/omZBKrqd6pGy9Jei1xGA7sa/vqmS9xkl+quw3G9ARmuf9UXSlSaJGsFx2KWndjHSi+6QLG3aWmdY=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ2Gt8Hz1uXO1/xdm8lQCkwyxX5KbLbzK1dwYXBhfrSrgtEoHzc
	iZO44C6w61+ISm/h/WYhcHIy21AkHBqSxaEshcLQukAxB8PiX6mAwmRy
X-Gm-Gg: AYBFou0lGrKlZaPsHd9Mh7cH6ZrCyz/gQDLTXSMHH4MCOz6TYB5Yphj+J3UaovvHewe
	6QK93RoDtjCJkr2pprRo5um+c83B5Y7wcPn3Ps52e7VODwtnzojyFGRlpQR7Rdy9jBJx9kIXx4w
	bzhOxlN1VyYLVeymUh0JCCddt5nIbUbu4xgOFPmq24VEYwF/vs6cAWXM0uQw6JmdKeRbzE1sKIv
	Wiryzm614UHM0CxoCM4Rzu40BZpT64uUQAxH28rGwoWl+WklE+xlxbYFaEFGT5jOIZ2qOubWx3M
	SwYRSfpXZxdrTHe+9smzzY4ocOMisvVQIa6/48Juq8IIu++HawfLaHDnCP1tuJw/UPvXfuZJs20
	YSjj6cKi58veSTfNnXLpqnAWHWtOrbhgSOSGGDQfiHnkNMcse+BNgE2srsCQzBzKbJtYfVtF9bt
	1YmbZxbtYRQErWP2S6kAU6n28WiLPgoqiuSuzClpmu5QAhrweMjEr2KHEX5mRexGyEx+EJv9v1b
	/qz+EDfC/5Ku9MvycwbonIAcazhtkTd3WDERZJ9mlH9ybcAQ2SJdqd8TYOD+eiB0Bq86mkyQKou
	4YmfZfS5wJEeVCmigwhxHUiQ5EzsgvV6Hninkacwk0LUbg==
X-Received: by 2002:a05:6000:2284:b0:48b:f08:8159 with SMTP id ffacd0b85a97d-48e5d46820amr12549573f8f.40.1793271144749;
        Thu, 29 Oct 2026 03:52:24 -0700 (PDT)
Received: from [192.168.1.22] ([83.231.69.9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ecd8ddasm36664688f8f.48.2026.10.29.03.52.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Oct 2026 03:52:24 -0700 (PDT)
Message-ID: <7558d438-5d5d-41bf-8853-33bee931dc50@gmail.com>
Date: Thu, 29 Oct 2026 11:52:23 +0100
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
Subject: Re: [PATCH v7 1/2] dt-bindings: iio: light: add as7343
To: Chang Yu <marcus.yu.56@gmail.com>, Jonathan Cameron <jic23@kernel.org>
Cc: David Lechner <dlechner@baylibre.com>, =?UTF-8?Q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Joshua Crofts
 <joshua.crofts1@gmail.com>, Shi Hao <i.shihao.999@gmail.com>,
 linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
References: <20261029074851.216029-1-marcus.yu.56@gmail.com>
 <20261029074851.216029-2-marcus.yu.56@gmail.com>
Content-Language: en-US
From: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>
In-Reply-To: <20261029074851.216029-2-marcus.yu.56@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/29/26 8:48 AM, Chang Yu wrote:
> Add binding for AMS AS7343 which is a 14-channel multi-spectral sensor
> with i2c address of 0x39.
> 
> The GPIO pin is not described because the datasheet does not document
> how to use it for hardware synchronization at all. The GPIO register
> also has no mode-select bit to isolate the pin from the chip's
> internal control logic. Exposing it as a generic GPIO could result
> in kernel writes being overwritten by internal logic.
> 
> Datasheet: https://look.ams-osram.com/m/5f2d27fff9a874d2/original/AS7343-14-Channel-Multi-Spectral-Sensor.pdf
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Chang Yu <marcus.yu.56@gmail.com>
LGTM so:

Reviewed-by: Jose A. Perez de Azpillaga <azpijr@gmail.com>

-- 
cheers,
jose a. p-a
