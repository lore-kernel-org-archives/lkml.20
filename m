Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8D9122370A
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 08:15:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789373747; cv=none; b=apXRCHJXjwcQM42exkMQXo53yXB5+kz1FOkfXJX2ojEmpLiZ3BF2lrMjAn6lNY7xs8w2C8giA9X+HeVVH16f9CgAPLxt5g5jxWKRR16smmw5Mc/p8luyVRYzdr75jAMVXK3X4THLsnJ7jQQOnuXfDak0aStEZYup5LWcFV8DvxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789373747; c=relaxed/simple;
	bh=YuXBmvIFB1Et+q+Dd5qvNxVQigDmtR3StCiUh0MdB5E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QBQPWdEDxaQbV2P4CTYEj0ZHztfRV+8CbIsuRZWK64NzbuGBCPXN7AjLm/CyKT642qFZwG1BKlCF5Ux3R2aYPWUgl4K0giO/qaN4HKk9GxYldg+QrDJ+KNhnJle8JPnDOyKtl5+hFkKCTTMStPPyLLMaWZfhjcSZUNQtz4dBHBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PbmZltK0; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PbmZltK0"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2d715f4a587so42647575ad.2
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 01:15:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789373744; x=1789978544; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=a+mbYj9gFoY+dF3f91W1Xx4566ofLNjeGKmQ/I7aiac=;
        b=PbmZltK0MZfEbi8ouIkbmxwzSvsC5A+XQiJftvWZURthCUQw2G5pcYukjzOfaGelPZ
         w/NJ3baHLBKwqaZ9Jkpo4Sx06GdXMvhKym80qXrXygyyTNH2n4lx3DhOrHYMdtnxUMtd
         Cbu8v6hQSvF+4iVFfUzlN1yKUeDPe/X4AgbVun1I5JTksno9cnrPCqThragIcZ4NyXE7
         ZDGoq8FePK/SwmZF4dl+AuL5om7pSnej7i3wHb9hQ0HeNcalEcrWkBxh6wEHYwxRtAQx
         IPuUhnnj5bkER3jj1pf2XUgP5lDOO3I51VFhl9/XBmj+1w2CH+iS3UF+iZFQ2AshFXTg
         NCEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789373744; x=1789978544;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=a+mbYj9gFoY+dF3f91W1Xx4566ofLNjeGKmQ/I7aiac=;
        b=qpHzQX6DeN3dDxnLBg5t1ggH/RyGudoEj7r3Id3PRbpUzJIFsUFFqzwCoIvEc3+d5j
         6hxjNvIfSyAIU2FLDt6fxeUKzxGQ9N4mwQaCxvYdh45QxnWYqXUstaYq2UKXiZquqcwR
         Y0rY35NT0QFssop255CXlUxQpaXUgKoRGdDvJ1E758P/uNLfvPD3DKKue09mQLfpf5yp
         sO2vxNcE4VN+TRg8Itbna10jseKK+FZ8E2NT2qLp2/TwCDPMaPc6sqMwCmfLt7scjGGE
         qA08r3z+rgNUXELE+nn5zJTha+xXsA08FJpEhSwaTHOvMhzRaAVzdMsDZlTD49siRCua
         EHyQ==
X-Forwarded-Encrypted: i=1; AKwUvBwbF7PtrmaxLhOrxqfUeupaLWJLQIe+RB5ctmDt3EjMunqBPWFvWOJTX9TU2Rklr4f0s5QJAS/7oCGKpG0=@vger.kernel.org
X-Gm-Message-State: AFuF++lzbzJwMjPuWf3Xn1wGiOnKB15Hs7B1eRVEOIgpwrRyYB3r9Xsy
	QD3SeFccNdPJn5dJGbQgmj5UbG5FKgLktIqRQO7nGD4UiDGm8AA7ozor
X-Gm-Gg: AYBFou0zEDFYGxJsD9UzCscklKYzdYITJrxZ5ozN4XjfWZyigwaSOhISzwYbtjX8TVv
	hZXSwLlp5BYnWit+mUGN5JJ+nA6DJhuUexjSRK9WvZa2tXQ3v6I5TWHSoIURlRYdRmpaM8XJjp3
	vD1DhOTnx0l+pnktHq38u1oD4H0yFgJGU62FX8c3NjtzGO9VvYkSBydaKEs0zRN4VelomJAPJSK
	6A8NqN4FUvgqXLnvhXSr6gDqRs3BJZaivE8C4SorgTEbqbc52I5cE3icHjm9Im4yuKyEUg5QBXt
	b/lFT3cf3ieiE2lFOz+HdcqMp4+KYWo+jKuFe87OUqDq5A1+BNGANLwtc0WvOZhUZoKwRwf8Gfc
	9brKJ+naeD0Rz43N90dnfwgZ02yI+Ef2nEqTOmkbUoSISEpLCjQYUWNS2EVbCX/AysipPF4hXNG
	AV0y8b6qfI/rkBvq+/NwudWA/zEHi1BqNzjrewDFy9zukFOUdmzZ8ZqgQz/1YKSWU24g3tVv3bR
	oFF/9vMwai4BkDO6VHoCeJHbJXU0bLhKIdPDNa7CVK+GFLIiRziKSDZ+mHstaR/qA==
X-Received: by 2002:a17:902:e744:b0:2bf:dd0:c8b1 with SMTP id d9443c01a7336-2dd6c4835d0mr31756845ad.0.1789373744241;
        Mon, 14 Sep 2026 01:15:44 -0700 (PDT)
Received: from [192.168.0.100] (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dd2cec8483sm44238255ad.44.2026.09.14.01.15.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2026 01:15:42 -0700 (PDT)
Message-ID: <2fd1f320-05a8-4782-8134-157c50024adb@gmail.com>
Date: Mon, 14 Sep 2026 16:15:37 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/6] dt-bindings: display: verisilicon,dc: add support
 for nuvoton,ma35d1-dcu
To: Icenowy Zheng <zhengxingda@iscas.ac.cn>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org
Cc: ychuang3@nuvoton.com, schung@nuvoton.com, yclu4@nuvoton.com,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260908092840.225220-1-a0987203069@gmail.com>
 <20260908092840.225220-2-a0987203069@gmail.com>
 <f74168b54fe8f070b7cfe79dc2fc83a63c2e8842.camel@iscas.ac.cn>
 <9d697240-3632-401f-aeba-c1fa5c2a29d4@gmail.com>
 <14f7fdf36a25b9669145b766becc6f32ef205320.camel@iscas.ac.cn>
Content-Language: en-US
From: Joey Lu <a0987203069@gmail.com>
In-Reply-To: <14f7fdf36a25b9669145b766becc6f32ef205320.camel@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


Icenowy Zheng 於 2026/9/10 下午 03:08 寫道:
> 在 2026-09-10四的 09:52 +0800，Joey Lu写道：
>> Icenowy Zheng 於 2026/9/9 下午 01:44 寫道:
>>> 在 2026-09-08二的 17:28 +0800，Joey Lu写道：
>>>> Add the Nuvoton MA35D1 DCUltraLite (nuvoton,ma35d1-dcu) to the
>>>> binding.
>>>> The DCUltraLite uses only four clocks (core, axi, ahb, pix0) and
>>>> one
>>>> reset (core), with a single output port.
>>>>
>>>> The MA35D1 clock controller gates the core, AXI and AHB clocks
>>>> with a
>>>> single bit, but each remains a distinct clock line feeding the IP
>>>> with
>>>> its own rate constraints, so all four must still be listed
>>>> individually
>>>> in the devicetree; core, axi and ahb happen to share the same
>>>> clock
>>>> phandle.
>>> This is weird, but I must admit that we're limited by the Common
>>> Clock
>>> Framework here, so I cannot give a better solution either.
>>>
>>> Anyway let's settle with the current result.
>>>
>>>> Move the clocks/clock-names minItems to 4 and resets/reset-names
>>>> minItems to 1 at the top level, since that is the lowest count
>>>> any
>>>> supported variant needs.  Add an allOf/if block that tightens the
>>>> constraint back up to the fixed 5-clock/3-reset topology required
>>>> by
>>>> the existing thead,th1520-dc8200 compatible, and another one that
>>>> caps
>>>> the new nuvoton,ma35d1-dcu compatible at the 4-clock/1-reset
>>>> count it
>>>> actually wires up.
>>>>
>>>> Signed-off-by: Joey Lu <a0987203069@gmail.com>
>>>> ---
>>>>    .../bindings/display/verisilicon,dc.yaml      | 44
>>>> +++++++++++++++++++
>>>>    1 file changed, 44 insertions(+)
>>>>
>>>> diff --git
>>>> a/Documentation/devicetree/bindings/display/verisilicon,dc.yaml
>>>> b/Documentation/devicetree/bindings/display/verisilicon,dc.yaml
>>>> index 919a900122012..773966677d0f4 100644
>>>> ---
>>>> a/Documentation/devicetree/bindings/display/verisilicon,dc.yaml
>>>> +++
>>>> b/Documentation/devicetree/bindings/display/verisilicon,dc.yaml
>>>> @@ -17,6 +17,7 @@ properties:
>>>>        items:
>>>>          - enum:
>>>>              - thead,th1520-dc8200
>>>> +          - nuvoton,ma35d1-dcu
>>>>          - const: verisilicon,dc # DC IPs have discoverable
>>>> ID/revision
>>>> registers
>>>>    
>>>>      reg:
>>>> @@ -26,6 +27,7 @@ properties:
>>>>        maxItems: 1
>>>>    
>>>>      clocks:
>>>> +    minItems: 4
>>>>        items:
>>>>          - description: DC Core clock
>>>>          - description: DMA AXI bus clock
>>>> @@ -34,6 +36,7 @@ properties:
>>>>          - description: Pixel clock of output 1
>>>>    
>>>>      clock-names:
>>>> +    minItems: 4
>>>>        items:
>>>>          - const: core
>>>>          - const: axi
>>>> @@ -42,12 +45,14 @@ properties:
>>>>          - const: pix1
>>>>    
>>>>      resets:
>>>> +    minItems: 1
>>>>        items:
>>>>          - description: DC Core reset
>>>>          - description: DMA AXI bus reset
>>>>          - description: Configuration AHB bus reset
>>>>    
>>>>      reset-names:
>>>> +    minItems: 1
>>>>        items:
>>>>          - const: core
>>>>          - const: axi
>>>> @@ -79,6 +84,45 @@ required:
>>>>      - reset-names
>>>>      - ports
>>>>    
>>>> +allOf:
>>>> +  - if:
>>>> +      properties:
>>>> +        compatible:
>>>> +          contains:
>>>> +            const: thead,th1520-dc8200
>>>> +    then:
>>>> +      properties:
>>>> +        clocks:
>>>> +          minItems: 5
>>>> +
>>>> +        clock-names:
>>>> +          minItems: 5
>>>> +
>>>> +        resets:
>>>> +          minItems: 3
>>>> +
>>>> +        reset-names:
>>>> +          minItems: 3
>>>> +
>>>> +  - if:
>>>> +      properties:
>>>> +        compatible:
>>>> +          contains:
>>>> +            const: nuvoton,ma35d1-dcu
>>>> +    then:
>>>> +      properties:
>>>> +        clocks:
>>>> +          maxItems: 4
>>>> +
>>>> +        clock-names:
>>>> +          maxItems: 4
>>>> +
>>>> +        resets:
>>>> +          maxItems: 1
>>>> +
>>>> +        reset-names:
>>>> +          maxItems: 1
>>> Maybe it's reasonable to restrict max port count to 1 for MA35D1?
>>> Although I am not sure about how to do this...
>>>
>>> Thanks,
>>> Icenowy
>>    I found the same kind of per-compatible port restriction already
>> used
>> upstream in renesas,du.yaml, e.g.:
>>
>>           ports:
>>             properties:
>>               port@2: false
>>               port@3: false
>>             required:
>>               - port@0
>>               - port@1
>>
>> Applied to our binding, that would look like:
>>
>>           ports:
>>             properties:
>>               port@1: false
>>             required:
>>               - port@0
>>
>> in the existing nuvoton,ma35d1-dcu allOf/if/then block, so schema
>> checks
>> would reject a port@1 node on this compatible instead of silently
>> accepting it.
>>
>> Happy to add it if you'd like the schema to enforce this, but wanted
>> to
>> check whether you consider it worth the extra lines given it doesn't
>> reflect an actual bug in any DT today. Let me know which way you'd
>> prefer and I'll fold it into the next version.
> Personally I think this is good, but maybe adding it as an additional
> patch after merging isn't a big problem, because this just plays as
> kind of a safety guard.
>
> Well this depends on how DT binding maintainers think, but as Conor has
> dropped his Ack, this shouldn't be a big issue.
>
> Thanks,
> Icenowy
I'll send the port@1: false restriction as a follow-up patch once this 
series lands.
Thanks!
>> Thanks.
>>>> +
>>>>    additionalProperties: false
>>>>    
>>>>    examples:
