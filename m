Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793614861;
	b=LHXDvL+9A92K1yAQHrDPPmvLZBZnrq/EwYoV48Ilm/YgV+9Uys72dABmRLzZmgDnCCSs
	 KyrOAjTtCIhQQU8JAA4fZToU5qGpDR4TsMAiZKFxji2wXLrrpkWUBVqx8W2a5mY3XBw+f
	 vkaD/vQwb+WVbWp3IZ83+iDzwEkDDO+sCSVuNWu5ssHaXrRmmsbzogWhbSPvlzkfB6P8m
	 Vpu4oIANBmD2yF4BFTbQnqErS3TTeEEzMNce+jjT1Y0W9ucTcNBWyFO/E8zfSr8Z3zPD5
	 DCpHKKzCiWXX5Wpck62DW9U3cPBh9mRJbU2des0m6ZBNqJbcGWM+I2/tQnM+rWxaTeg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793614861;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=aK8g5gPWYY5ZSiatoKUDyldSfIMdc1sHYx/BgeG2gvc=;
	b=rXOpUP8nXVzh1EN8sCZ4vfLrcNPFNhkvmHTEQ6ceZpLcZthU3Dbi1/rY3EgLbrF0w8vs
	 PIJEkjlWFLdwSY44ovSySLPQsbuS07KvA5dGv0qYW1FN8BKeZDuFjriYvFs7EHhGqtKFA
	 mgrZjIgq/FVDQYZnd3V6wgyUrGTOrE+xI+f37n0dMPAaw1mzFBUm3fwh5nJUGAPKex6kr
	 RpDBRRYaGi/SolkAEc+/ikELUHZZw/VSQyyBK6Uh4VeCO95QRymDJ7Mga88jbdv3SY0Gr
	 jNFgztODZXGwwntn9u94VHSLDBNEdnCXUUd3w0ccYcXyWIpqnrCiVrUWcyeULNODidA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VoySFyXd;
	arc=none smtp.remote-ip=209.85.215.173
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2B2A606A326
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 10:21:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E2B2A606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VoySFyXd
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-cc7e79c1eaaso994514a12.2
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 02:21:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793614860; x=1794219660; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aK8g5gPWYY5ZSiatoKUDyldSfIMdc1sHYx/BgeG2gvc=;
        b=VoySFyXdwRG+tPuJ87m8IwYv32SSANj86gDRALvOsSbYwDK/ifgtnXoSMGBh1SSQkR
         RnyXRfCVux9yP7Yy3aa6aqkdbyRveIpxezwtLBVdEu8WRG9txUdsDMTYJCAu+3gGnL5L
         +0zBfOnsHSQZDHDRvcXapTgiGNHsFEcQ43/SX6eMO37dFTGD4eox5I9lSq73KN1sAQsq
         9QuWDeJxAxk1D7CLLMqrioZagP4g+RK9NNoF0yNJTkqaultLvMyUoXeinJ70fgP+bJfG
         JeB8RqaBegXLEw8QvE9jdRWN1GEW9O6Fk2beKUUVhlEsdRPAnCKOa5ux+ozyshkTCg+f
         PSsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793614860; x=1794219660;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aK8g5gPWYY5ZSiatoKUDyldSfIMdc1sHYx/BgeG2gvc=;
        b=XwVR1HMuzAm2eSFk4WlkbpVUZXoX+YO7/thbX9k87aCLKxidlF11wE1P8pLUF6GBL8
         bjAKG79B5ftC6hqO8nMOO5TWqn+nnl1RxM4DkiljThjpIngT+y12V17D3NLEDygyrg5y
         LyrlzfRdaD4OiQ0rawko7qoAXdXt1snkObXFRwAZXah8JJc2mSYHbkpZffAqNCUXqRIb
         q5xutT6ltRc9RLCIfhAkOdfcilSh9q4JUihqvt62+MVmgw2uw/1yMPUIJaRvRJhkXm7g
         UFG0tJUX2qEC5C0Op14T48zrtVxCJIj/7rYQgKNMERtcvxMg5YtJng+afUL5UeBOxm4d
         nzQQ==
X-Forwarded-Encrypted: i=1; AKwUvBxciwkq4yfjVxOz9WenHkKMly6+LbGAAHJZNxXU1LENS+Ete7xSTBBHKntaw52wYn8Coi9AW2sWZsdpIFs=@vger.kernel.org
X-Gm-Message-State: APuU4Z8TDBG6q0tpHopZdZeLjsaHjyuI7UdToPUUlA89Wbh+ZnR1Vp57
	06NLg2mf1o6WawmRCDSK1VgG6IOfMAQWqQM37FtR/6FLqniN92hlVWGq
X-Gm-Gg: AYBFou3XxHfscDvjuABThylxlBK55dMicoP8u6nBmsgahd6nfoERg1HfUu8m/5nzsE5
	TL0plb0ra/6DpMhYFIfELb1JtD0CY9a+zLHNxQ8HOwEOrVD4v2HcqWixyaTMj9y/ys8mEMvWQDM
	QTsXKKO6xxffjNhsOX5QlcQXLp/akCHbWN/AxSy/nEXRAWrNuaKOzC+jUusaw0jOoSWw+PZggyM
	8kzPYKpqVqfMUfSOWRNSgDaDvGyLF5CKwxDPiLyZevwHjliBdsTOP3NmotOvY+6W4HcNSGRaULg
	ByjLxjo7WsarSlxXlejapJo0hFVvXPv8hXdCIjxX2W0AA7PzuIq3a6KV5yHlOP0w5azClMGDl4J
	SMyDFllSvfM95fWDCiD734E2LeyA/51RHl4YMrHrQAycMVxsh3YTYtrlnTcNVhVn/tZ9qf6nlTC
	7NTH/edy3BS/IwnUXiwM4yjoy1B1pZM9AnaYOcyQtHWxcLWvkWT5M9MIKyztWXbYQCT7Y+Yh6pG
	PVtnX4RTm4CSp32sK4IrYubC/13sQ5dzyI4wCioRU9ALo6CNbpJWRA+AkCiRKrPjufT7bSi8Lbc
	m+sj/ipmg3Wjf3V4tBB+/aAbjeYebRWrMGnnwYZvxV/x31kRcVmYUx8FtWFe+kGcTxTvMs5BfMn
	KoOYY
X-Received: by 2002:a17:90b:1b02:b0:3ae:3c0b:159b with SMTP id 98e67ed59e1d1-3ae8973603bmr6808844a91.24.1793614860072;
        Mon, 02 Nov 2026 02:21:00 -0800 (PST)
Received: from [172.19.1.42] (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae845df666sm13811378a91.14.2026.11.02.02.20.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 02:20:59 -0800 (PST)
Message-ID: <0f0324f4-48d8-471e-b35f-7f2d541a70ee@gmail.com>
Date: Mon, 2 Nov 2026 18:20:56 +0800
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
Subject: Re: [PATCH v3 1/2] dt-bindings: iio: adc: Add Nuvoton MA35D1 EADC
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: jic23@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, dlechner@baylibre.com, nuno.sa@analog.com,
 andy@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, cwweng@nuvoton.com
References: <20261030031501.130290-1-cwweng.linux@gmail.com>
 <20261030031501.130290-2-cwweng.linux@gmail.com>
 <20261102-bald-mysterious-alpaca-13b8fa@quoll>
Content-Language: en-US
From: Chi-Wen Weng <cwweng.linux@gmail.com>
In-Reply-To: <20261102-bald-mysterious-alpaca-13b8fa@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



Krzysztof Kozlowski 於 2026/11/2 下午 06:03 寫道:
> On Fri, Oct 30, 2026 at 11:15:00AM +0800, Chi-Wen Weng wrote:
>> From: Chi-Wen Weng <cwweng@nuvoton.com>
>>
>> Add a devicetree binding for the Enhanced Analog-to-Digital Converter
>> (EADC) found on Nuvoton MA35D1 SoCs.
>>
>> The controller provides eight external analog inputs which can be used
>> as single-ended channels or as four fixed differential pairs: 0-4,
>> 1-5, 2-6 and 3-7.
>>
>> Describe the four hardware interrupt outputs, ADINT0 through ADINT3.
>> ADINT0 through ADINT2 are associated with the corresponding conversion
>> interrupt flags, while ADINT3 is shared by the ADIF3 conversion
>> interrupt and the ADCMPF0 through ADCMPF3 result-compare interrupt
>> sources.
>>
>> Also describe the functional clock, optional reset, optional external
>> reference supply and optional DMA request.
> 
> Don't repeat the patch contents.
> 
>>
>> Expose the controller as an IIO channel provider through the
>> DT #io-channel-cells property. The cell identifies the logical EADC
>> channel selected by the reg value of the corresponding channel child
>> node.
>>
>> Restrict the channel binding to features supported by the MA35D1 EADC
>> hardware and use the common single-channel representation for
>> single-ended inputs.
> 
> And here even more.
> 
>>
>> Signed-off-by: Chi-Wen Weng <cwweng@nuvoton.com>
>> ---
>>   .../bindings/iio/adc/nuvoton,ma35d1-eadc.yaml | 175 ++++++++++++++++++
>>   1 file changed, 175 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/iio/adc/nuvoton,ma35d1-eadc.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/iio/adc/nuvoton,ma35d1-eadc.yaml b/Documentation/devicetree/bindings/iio/adc/nuvoton,ma35d1-eadc.yaml
>> new file mode 100644
>> index 000000000000..97144a8eeb5c
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/iio/adc/nuvoton,ma35d1-eadc.yaml
>> @@ -0,0 +1,175 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/iio/adc/nuvoton,ma35d1-eadc.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Nuvoton MA35D1 Enhanced Analog-to-Digital Converter
>> +
>> +maintainers:
>> +  - Chi-Wen Weng <cwweng@nuvoton.com>
>> +
>> +description: |
>> +  The Nuvoton MA35D1 Enhanced Analog-to-Digital Converter (EADC) is a
>> +  12-bit successive approximation converter with eight external analog
>> +  inputs and one internally connected VBAT input.
>> +
>> +  The external inputs can be used as eight single-ended channels or as
>> +  four fixed differential pairs: 0-4, 1-5, 2-6 and 3-7. The internally
>> +  connected VBAT input is not described by a channel child node.
>> +
>> +  The controller provides four interrupt outputs, ADINT0 through ADINT3.
>> +  ADINT0, ADINT1 and ADINT2 are generated by the corresponding ADIF0,
>> +  ADIF1 and ADIF2 conversion interrupt flags. ADINT3 is shared by the
>> +  ADIF3 conversion interrupt flag and the ADCMPF0 through ADCMPF3 result
>> +  compare flags.
>> +
>> +properties:
>> +  compatible:
>> +    const: nuvoton,ma35d1-eadc
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  interrupts:
>> +    items:
>> +      - description: ADINT0 conversion interrupt output generated by ADIF0
>> +      - description: ADINT1 conversion interrupt output generated by ADIF1
>> +      - description: ADINT2 conversion interrupt output generated by ADIF2
>> +      - description: >
> 
> Drop >
> 
>> +          ADINT3 shared interrupt output generated by ADIF3 or by the
>> +          ADCMPF0 through ADCMPF3 result compare flags
>> +
>> +  interrupt-names:
>> +    items:
>> +      - const: adint0
>> +      - const: adint1
>> +      - const: adint2
>> +      - const: adint3
> 
> "int" is redundant, so honestly names should rather go away completely.
> 
>> +
>> +  clocks:
>> +    maxItems: 1
>> +
>> +  resets:
>> +    maxItems: 1
> 
> Best regards,
> Krzysztof

Hi Krzysztof,

Thank you for the review.

I will shorten the commit message in v4 and keep it focused on the
hardware aspects that are not obvious from the binding itself, rather
than repeating the properties added by the patch.

I will also simplify the interrupt description. The detailed ADINT3
source information can be kept in the controller description where
needed, rather than repeated in the interrupts property.

For interrupt-names, I agree that the current "adint0" through "adint3"
names do not add useful information. The interrupt outputs have a fixed
ordering, so I will remove interrupt-names from the binding and use the
first interrupt by position in the driver.

I will address these together with the other binding changes in v4.

Thanks,
Chi-Wen

