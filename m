Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793872048;
	b=Y6en3QaMRGiwftt94yJ1Ej41QFM1kBbm5tLgxJsuXQUgQytzihuJe+WqsEiQojJpglQu
	 /OvdUTfsWRXZm4KFPMIhRlJtLaBspgknEM56433bCrHXQc4Oqi0HXAkvPv+64VajGqXLg
	 STEE6hzRVgnxiv2jT4THbIFD4IDxNcOc/mLr8OA6j6DvIvJIK2BIEGq9FyoMnOSM0ifbQ
	 QkPbut0WHFkJwuxZLkk/bssaVCntBfaMZW2c/l0odMdxS/2aQ9G7ayV4l5S4sHkQ6e0dY
	 f/iH8wu1FmXIicIE6v7FgGUDF4GFl2AtvcvB3vME/LRcqiUwFYoieA9U22+IcEBaiIQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793872048;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=jyLL8ZmxrAARfweF0V8YGIXZS1Pegf4tg2ZATRaSJHc=;
	b=bf10CLtMsxoNCHO3Dyg9Yoz1huyw+1RoQyGYkjzRzCVrBbfhQxKIeRi4roCIvyKSoUna
	 IDcbJJQs6l9yFRLmm/pMFwiNvgsa9Qr6FJ2hnTje5H17EvlgyAtYMn75f/hWTp5ScBPoh
	 Bc/xUeMe5h4bkAvJc8PBcx/etHQ45mCD6zRnAgpgHCAv/OY2f4A+ILevG2z0wGH/F3DNQ
	 9Tg4MBj/157X6taygptIHVI4GzEqbVcCRvc1nteTMJr41MgqxW6dvugdYbGW9SHmnMoMZ
	 EmMlqN8HKPuW3gkg/dE/MeGBhw/5l8wueY5IYSPansmHKtyIO1z4aD7aLWK4I/NeV/w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=RASG78SQ;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B6D0606A32C
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 09:47:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0B6D0606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=RASG78SQ
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a215e64962so15407255e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 01:47:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793872041; x=1794476841; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=jyLL8ZmxrAARfweF0V8YGIXZS1Pegf4tg2ZATRaSJHc=;
        b=RASG78SQJZb7zly3rDtTUgyOxzbegHId3oxXTHrgcPPTO7wKUsm28sWnWodJU6lGHj
         Xl4lgSwi6T8p8iO48+EYJyut2DlkqBgDidTj54wXHNwFYg81frFZE8Q7apcHbehGyfUA
         oEBrf2dIpQtOCwWHURtTzf2Dzmg0FgcsA/tVffLX9VOTMSbrVTczidrPCVBSUmPfF8xr
         VdCf7x+UzAcuXIV8ZgZ7/IHSey42eTXQt/qVDbQZL/NKaCBoqsLCKXtWNZ4qjue5YjS9
         3KNNVGfvWsr5ovwtxywRvbMkqZpXcjcM2JDvQJQyfSpzT0jiqJ0bYD4srOLe6uto7P4W
         fyiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793872041; x=1794476841;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jyLL8ZmxrAARfweF0V8YGIXZS1Pegf4tg2ZATRaSJHc=;
        b=k2cmnxBhiTLTaUExeXfW5TgAbo8o3k3TvOOaJhZc94Y8uxL7LSNVaA+0lFGFRA0nh+
         T2Ua57iokYF0yVPw3NGGbGo44s7FC0vCi02ZVgcNl6gBnOa2MB5ExdQj0GrlhY9THV3M
         dGrD4VnjBcDm8qViz9pWtg0FYhARvBaY52W/pdDoiCDerVocxZGEhuYM6I0UCRD6ftC6
         bheDM2ncjGby5UlubBa3Cpit9zT1YsX+P28n/nLY2IabkkuhSxbJCJMkBRddDQ4jKYR3
         9FdeqjcRxevoX36cWXk+kIKFBKmNoGPN5nKpMkpYbzlhZuncPoIo3V6h9ZmguVEv3yPm
         1cZw==
X-Forwarded-Encrypted: i=1; AKwUvBzPkJnbj8k1ENBYaG1wNg3oRIwhO5K7jxdCMbVo6BK2X2xiMApwnchojKP1OPUO5AziULzRljGpcz/4djg=@vger.kernel.org
X-Gm-Message-State: APuU4Z8OHW4WJYvZqoMAW/UJv3G/36AmRwUYJFxWd1T7iGAMnOPmzt5E
	Q4m1+o0+2TJrZE7LJ9jVH3mmYIiW+GUgwN2VF77x+7D/DTSAYTdqQcgF3+oHo0iBVqw=
X-Gm-Gg: AYBFou2g6lOH9p7rBOmnsCF1agI2n2OADG1z+YkblJNuRtzsdnPFqpgmeTstkkFxmKD
	G0M7EW4xdkadSAiuRDRkkPhp3yy3tmdactPV1oTHIKcwemc764uIfzjGYLrgTrFVWsrCc62PNRa
	T1NRaJYoS8kLsyfWGbo4EXz+ciBBBzJe87LJRfkmAre8wd9F3j45PrFshK5i4gYQNfWdoHvbKTG
	qTFTtX9EwAFx3FBddF2orEjt0wY2CNezXmHq6PlDB2dZqwgm9ZodwWfPbElJLIdT6/SJmbUEIwq
	UbCeNv9KiIQ+W31EyMZgMRrQuIGOmgwQIJpDye0FvSsbNoe05zMkcNeGEV0faBBaRnYLR9QBOOL
	mzQqQnZNrKNDYj7hvXTYUpfe0nCFNSPtmFqaoHMlyN/zAphb+XVo4pQ5aVDp6xeD+WOzDvjE3r/
	RkSXMLCB88sHJs9kC20YAxTKtv+fQcUGHSeLhOmJ26SoGXpd1ehiFMV8jzjyuui3p5XGKiXuu6T
	OThgDaGfi4drI+OFEgUoW2OL5/8fEmEZUPaNpIeY/yf86YuvBPFnuu+d0WGL9NKVF5EF3Nn89XY
	M4ZOACCPheeMNu7J+xnNrfBxEROwdJt5Ofo68FsT
X-Received: by 2002:a05:600c:4f86:b0:4a7:669c:c988 with SMTP id 5b1f17b1804b1-4ac18b7df2cmr429163325e9.23.1793872041405;
        Thu, 05 Nov 2026 01:47:21 -0800 (PST)
Received: from [192.168.0.167] ([51.37.126.136])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fed45d71dsm8886594f8f.36.2026.11.05.01.47.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 01:47:20 -0800 (PST)
Message-ID: <5ba03b8e-1d51-4e66-a802-37e63814f5d5@linaro.org>
Date: Thu, 5 Nov 2026 09:47:19 +0000
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
Subject: Re: [PATCH 2/4] dt-bindings: media: qcom,sm8150-camss: Add SM8150
 CAMSS
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 mail@andrewgigena.dev, Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bryan O'Donoghue <bod@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org
References: <20261104-sm8150-v7-4-rc1-camss-v1-0-7a9534a9a22f@andrewgigena.dev>
 <20261104-sm8150-v7-4-rc1-camss-v1-2-7a9534a9a22f@andrewgigena.dev>
 <904675e8-701d-4fd6-b418-6c0dcc9288b9@linaro.org>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <904675e8-701d-4fd6-b418-6c0dcc9288b9@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 04/11/2026 23:16, Vladimir Zapolskiy wrote:
>> +maintainers:
>> +  - Andrew Gigena <mail@andrewgigena.dev>
>> +
>> +description: |
>> +  The CAMSS IP is a CSI decoder and ISP present on Qualcomm platforms.
>> +
>> +properties:
>> +  compatible:
>> +    const: qcom,sm8150-camss
>> +
>> +  clocks:
>> +    minItems: 42
>> +    maxItems: 42
>> +
>> +  clock-names:
>> +    items:
>> +      - const: camnoc_axi
>> +      - const: camnoc_axi_src
>> +      - const: cpas_ahb
>> +      - const: cphy_rx_src
>> +      - const: csiphy0
>> +      - const: csiphy0_timer
>> +      - const: csiphy0_timer_src
>> +      - const: csiphy1
>> +      - const: csiphy1_timer
>> +      - const: csiphy1_timer_src
>> +      - const: csiphy2
>> +      - const: csiphy2_timer
>> +      - const: csiphy2_timer_src
>> +      - const: csiphy3
>> +      - const: csiphy3_timer
>> +      - const: csiphy3_timer_src
> 
> Please switch to the new model of describing and exploiting
> the stand-alone CSI2 PHY devices.
> 
> Any CAMSS drivers based on the legacy description of CSIPHYs
> should not be accepted into the upstream.

I mean we are just adding a new define for a SoC here - not a new init 
sequence.

We could move all of sc8280xp, sm8150 and sm8250 to a new driver 
topology but, I don't think that's a reasonable ask for a small change 
like this from a new contributor.

Certainly would welcome the transition given above as a defined and neat 
series but, I don't think there's a need for that to include this SoC in 
100% existing infrastructure.

---
bod
