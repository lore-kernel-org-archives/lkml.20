Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793587132;
	b=pCfsp9rOTcCnDOBwgIMnK+bmvLoeSLDUa85j74FNYNEukNY9PGy0M+ieBD+f0aKHXOu9
	 MRNWrJERPmpKiHvDPSMxGg0gdC67fkGlcaKV5ox66ukKq5ALAfw6xtCTTNys2QD2H3dF5
	 P85lN8zMYlluJYNUmefa9avzyMjWz0Pc02P81beSLHDzGRz9q5WDYYnS/dGYH/vf03tsr
	 72uvMU8xjSiTbC8Q94j/op0kRGhvp+nApT+9gR16bac+CJBGD02t28bR9WfmgUTNczz5E
	 fLd+jOY3FbHaNapLLkJQ9c+W/fpyQLvBB0fL5eq8jdvKVaPe7mu7S9KdELRVN0WYeUQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793587132;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=dGXUAf3ZvpwCwk6GVJwDfPoTF9MzG91gJCXDDK2/gfI=;
	b=SMQybUTwqLoRDeNSyA+D/yISwWisZoCMoVw4bqqQYH4CLYe6rUWKLraDeeF9uRtQron0
	 t2kiJra+kEkClUQYD3FM3Ns+NUgS48Ru4Ee88MylIZIVaazbKlNcfHykymh/28aH+h6/S
	 Fm02doUTctdFwNmX6S7OLyghTz9WZEV2MUt1z9NEsWzwqiduRVGo3qvq9qLYvdWR6IpjW
	 u3D8QR9xp3KWaY1W4MqySVQN+miVCk23nST7YqvDuLOlysrwTj4QlpMH3oqVuONYECjQV
	 yEKWfN6N6djpPnbo4mHMmWmeHGi0c8uzyvUFwyWjcNPeOj764nNtk+TpKCgn1oRU04g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eEVquVj8;
	arc=none smtp.remote-ip=74.125.82.181
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BDC1606A327
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 02:38:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2BDC1606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eEVquVj8
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-3535a54bed9so3827947eec.1
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 18:38:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793587131; x=1794191931; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dGXUAf3ZvpwCwk6GVJwDfPoTF9MzG91gJCXDDK2/gfI=;
        b=eEVquVj8eqsZOSxmep26cGfxIZE2P+dOYPim6zhBvHZpac4gKocfLPWR4LLbJBBETv
         cPo7J9ilDXBWwzdmmgworvr3oSSPrWqnrsDVvXrgS5HsIM4XcBSTV42ML9vSE8SfmPUp
         tXvC2q16VfaiQR9YLOd4onozk1Y4Vu9gbmcyOXNZAswm3Q3Uuax9QBNgK0Y5f5fDygDB
         utSISo3E74GxV/hlhue2u89rND7ERXI3DDXfzCWdlLFeMAcK1ktXM3GU3iFlhaQ+8lye
         rf1hnkRd9aqjO0acuZGVhxrAv62iAiM2uB4UU9SH9qCigru9kSOPGtW+DuQRdlny3eDZ
         N4zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793587131; x=1794191931;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dGXUAf3ZvpwCwk6GVJwDfPoTF9MzG91gJCXDDK2/gfI=;
        b=cjD9X2sbavqIG1f0rc5aLZNBVqmbWnAXwQwUJWuOaevOGbp4DOo3eVAPqGFPHex4Me
         UTqYi0XNFRzdX/sW8HEdWg7rmbufsEgmiVoRhKBtENL4Shzv/7p71DzNtrvopQH9nRK1
         XtjnXFm+avCbFOMCJo17mFBh8YVS9DJvxly6zfUF5uMjKUK8P9XJUY3oL6aGtzfqw0Tn
         RH9tH0AQJFKyOWRCNdQS32CxPLpUvPNFLXeQEO2AC0sb7azbDhbDa/0+6RnRqSN9plT1
         OJAUoHuMx8wvtXBllg1Tn7ZXt9IPGnMDIDFwfWBaebReyO8cUR26P1QtXcW58lS2dk88
         M0jQ==
X-Forwarded-Encrypted: i=1; AKwUvBysiXfguCVpkXB+MYzLkwocg6CKngdg/mWau4pMxf6I5iBxL7RuUftasEjc2CUrvV0zVkweFjgaYiAy1QQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z9JEIU0Agzn0sAr9nwns9arDIQ5bKyDKS93ION4evjatr4EOWeH
	BGP9SZNhtlzCHKMOwV8yb6r0QKl0Roz7icgJox3oAqh/6qdT/xv5Eik5
X-Gm-Gg: AYBFou2vdtZEcMIntLjAzAQxhV6VymB3rt2Id+Stqkk3IanYVDyOpUxMiHBjDXKdYNI
	SjGHxy6X1uyBl2YdQm8zfUscWzh7r8Nqgh0YSWCIJoTZEqf8ac60cWRi5/6BDQhgeoqho/mOEUi
	7RFFGVEAdBoCC0qp/tvshdym+npy/lnqmRkqt8/uyCKfyYJpSwY8eB2kYvf+vOB2Pb6quyNa0eN
	8VHyKpQsFkuc2g0gMQoxCHJyHbsKnOcpyW1PezfAXYouwO3dwnOoTcRugxl1WIGSxW+4NkgKwns
	LCEAL3LxXR6eVlOQr9yfpd0b1BbVKYVmiHo8lnsfDRFk2XM81VMm7iH2nkMrnTWdgbmG6T4f93S
	bgrvasODZUTvvgeMDipZkDqv2kcTSMCkaq4AwJ8YH0mzzBntUEwtC6tFCZ7w9nI3gX4mHaZvhtO
	W/9XP/Ko6YitcOMqo6UWN1Af1Vc0N8ePDFtxgymhJfIslai9IsxjBZVw3MB2ZSq2TNyNDQa1bwt
	Qnq1kGnTVc0mAbClo1iJCFrFSjU0GlVm3GlRi/eDi9dwDojv0tXGZOXoYdLyO7UxkqPj8yc9Wyz
	4zigpRKgImP84sSP8POh4KpfBUGYGNa9kq+C+mZJ6qs1W26OCj6CwIvxOvcdq/Wk/ZdGJBdwcgX
	4l/0=
X-Received: by 2002:a05:7300:f149:b0:36a:1104:5fb5 with SMTP id 5a478bee46e88-36a4221a8demr14296245eec.1.1793587130960;
        Sun, 01 Nov 2026 18:38:50 -0800 (PST)
Received: from [172.19.1.42] (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42902649sm37003471eec.11.2026.11.01.18.38.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 01 Nov 2026 18:38:50 -0800 (PST)
Message-ID: <6b1f4008-c6dd-4e81-8a6a-43ea45c7eb15@gmail.com>
Date: Mon, 2 Nov 2026 10:38:47 +0800
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
To: Jonathan Cameron <jic23@kernel.org>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 dlechner@baylibre.com, nuno.sa@analog.com, andy@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, cwweng@nuvoton.com
References: <20261030031501.130290-1-cwweng.linux@gmail.com>
 <20261030031501.130290-2-cwweng.linux@gmail.com>
 <20261101001934.23588aa2@jic23-hlaptop>
Content-Language: en-US
From: Chi-Wen Weng <cwweng.linux@gmail.com>
In-Reply-To: <20261101001934.23588aa2@jic23-hlaptop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



Jonathan Cameron 於 2026/11/1 上午 08:19 寫道:
> On Fri, 30 Oct 2026 11:15:00 +0800
> Chi-Wen Weng <cwweng.linux@gmail.com> wrote:
> 
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
>>
>> Expose the controller as an IIO channel provider through the
>> DT #io-channel-cells property. The cell identifies the logical EADC
>> channel selected by the reg value of the corresponding channel child
>> node.
>>
>> Restrict the channel binding to features supported by the MA35D1 EADC
>> hardware and use the common single-channel representation for
>> single-ended inputs.
> This description seems a little verbose.  Maybe only talk about the
> stuff we can't tell from the patch.
> 
> 1. Why it needs a new binding and isn't similar enough to existing
>     ones for reuse.
> 2. Any unusual aspects.  Calling out the stuff that I note below on
>     the per channel binding oddity more clearly would have been helpful.
> 
> For the other stuff the reader can just look at the patch,
> 
> Thanks,
> 
> Jonathan
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
> 
> I think you only want to keep paragraphs. In which case > rather than |
> 
>> +  The Nuvoton MA35D1 Enhanced Analog-to-Digital Converter (EADC) is a
>> +  12-bit successive approximation converter with eight external analog
>> +  inputs and one internally connected VBAT input.
>> +
>> +  The external inputs can be used as eight single-ended channels or as
>> +  four fixed differential pairs: 0-4, 1-5, 2-6 and 3-7. The internally
>> +  connected VBAT input is not described by a channel child node.
> 
> How would you have a consumer of VBAT given the io-channel-cells
> comment about using the channel reg values for xlate?
> 
> 
>> +
>> +  The controller provides four interrupt outputs, ADINT0 through ADINT3.
>> +  ADINT0, ADINT1 and ADINT2 are generated by the corresponding ADIF0,
>> +  ADIF1 and ADIF2 conversion interrupt flags. ADINT3 is shared by the
>> +  ADIF3 conversion interrupt flag and the ADCMPF0 through ADCMPF3 result
>> +  compare flags.
> 
>> +
>> +patternProperties:
>> +  '^channel@[0-7]$':
>> +    type: object
>> +    $ref: /schemas/iio/adc/adc.yaml#
>> +    unevaluatedProperties: false
>> +    description: |
>> +      External EADC channel description.
>> +
>> +      For a single-ended channel, single-channel specifies the external
>> +      analog input number (0 through 7), while reg provides the logical IIO
>> +      channel index.
>> +
>> +      For a differential channel, omit single-channel. The reg value selects
>> +      one of the four fixed hardware differential pairs: reg 0 selects 0-4,
>> +      reg 1 selects 1-5, reg 2 selects 2-6 and reg 3 selects 3-7.
> 
> Sorry, I wasn't paying attention on earlier versions.  This is a very
> unintuitive binding particularly as we may want to have a single channel
> before a differential one.  Better I think to use the differential
> channel bindings and restrict which ones are allowed to this fixed set.
> 
> 
>> +
>> +    properties:
>> +      reg:
>> +        maximum: 7
>> +
>> +      single-channel:
>> +        maximum: 7
>> +
>> +      # Differential pairs are fixed in hardware and are selected by reg.
>> +      diff-channels: false
>> +
>> +      bipolar: false
>> +
>> +      common-mode-channel: false
>> +
>> +      settling-time-us: false
>> +
>> +      oversampling-ratio: false
>> +
>> +    allOf:
>> +      - if:
>> +          not:
>> +            required:
>> +              - single-channel
>> +        then:
>> +          properties:
>> +            reg:
>> +              maximum: 3
>> +
>> +    required:
>> +      - reg
>> +
> 
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/clock/nuvoton,ma35d1-clk.h>
>> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
>> +    #include <dt-bindings/interrupt-controller/irq.h>
>> +    #include <dt-bindings/reset/nuvoton,ma35d1-reset.h>
>> +
>> +    soc {
>> +        #address-cells = <2>;
>> +        #size-cells = <2>;
>> +
>> +        adc@40430000 {
>> +            compatible = "nuvoton,ma35d1-eadc";
>> +            reg = <0x0 0x40430000 0x0 0x10000>;
>> +            interrupts = <GIC_SPI 65 IRQ_TYPE_LEVEL_HIGH>,
>> +                         <GIC_SPI 66 IRQ_TYPE_LEVEL_HIGH>,
>> +                         <GIC_SPI 67 IRQ_TYPE_LEVEL_HIGH>,
>> +                         <GIC_SPI 68 IRQ_TYPE_LEVEL_HIGH>;
>> +            interrupt-names = "adint0", "adint1", "adint2", "adint3";
>> +            clocks = <&clk EADC_GATE>;
>> +            resets = <&reset MA35D1_RESET_EADC0>;
>> +
>> +            #io-channel-cells = <1>;
>> +            #address-cells = <1>;
>> +            #size-cells = <0>;
>> +
>> +            channel@0 {
>> +                reg = <0>;
>> +                single-channel = <0>;
>> +            };
>> +
>> +            channel@1 {
>> +                reg = <1>;
> 
> This looked very odd and is why I had a closer read of the docs
> above.  To make this a reasonable binding to read this
> needs to do the full differential channel binding from adc.yaml
> with reg just being an index and not specifying channels at all
> (same as for the single channel case).
> 
>> +            };
>> +        };
>> +    };
>> +
>> +...
> 

Hi Jonathan,

Thank you for the detailed review.

I agree that the current channel representation is unnecessarily
unusual and does not make good use of the common ADC channel binding.

For v4 I will rework it so that reg is only the logical channel index,
while the physical inputs are described explicitly:

- single-channel for a single-ended input
- diff-channels for a differential input

The differential channels will be restricted to the four combinations
supported by the MA35D1 hardware:

   <0 4>
   <1 5>
   <2 6>
   <3 7>

I will also require each external channel node to explicitly describe
either single-channel or diff-channels, instead of using the absence of
single-channel to imply differential mode.

This should also make the example clearer, for example:

   channel@0 {
       reg = <0>;
       single-channel = <2>;
   };

   channel@1 {
       reg = <1>;
       diff-channels = <0 4>;
   };

so that reg is clearly independent of the physical ADC input selection.

I will also switch the channel schema to additionalProperties: false
and only expose the common ADC properties supported by this hardware,
rather than inheriting unsupported properties from adc.yaml.

For the top-level description I will switch from the literal block
style to the folded paragraph style and shorten the commit message to
focus on the unusual hardware aspects rather than repeating information
visible directly in the schema.

Regarding VBAT, thank you for pointing out the inconsistency with the
#io-channel-cells description. The internal VBAT input is a fixed
hardware connection rather than a board-routed input, so it should not
need a channel child node. I will rework the provider/channel numbering
description in v4 so that the internal VBAT channel, if exposed to an
IIO consumer, has an unambiguous channel specifier without requiring a
DT child node.

Thanks,
Chi-Wen


