Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDA32FC0A
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 02:47:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789958851; cv=none; b=TnmvevdWy28zabNPAzVJaXs6shmAkE+O4WNlnwF7Qd5Obt9uFoBby01JN+yA8q6aep/0CsyKmYT+w5qBmnGn5zHV2LFC3EldnHM2tIIru2ZbJooqP8f6qTEemTIFLTt9lkwUuMBlH6qF/fAS+LgCOmcRt0NnoZkw/AeJRL3TJaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789958851; c=relaxed/simple;
	bh=EnpwLLfoXtFV3vYxnNqPP3WzznAu9yOBj9IRsZlS6vY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=o6BUbAb6TxQDEzeLgZ8ADyKJ6L1Cqz0nzhjXxicBub9KEectEHY6dERJh8Ah0XxFVwTPkHsqPy7EKZr/8jUAFH0qAuOHNoO0SIOy87/s3lH1uX/Fh8071Rg/ucm+lhfBlIUtuI+cskS8vyLDxIvI8GePLdB8koKAb+UdswirKNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fAqy3aeZ; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fAqy3aeZ"
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2d747ed1368so30090435ad.1
        for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 19:47:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789958849; x=1790563649; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+O5egBgvsUIuHoGJAoHI3ORXx+xU1etkOpoJliWaQik=;
        b=fAqy3aeZAXHWu+A9BnrYoyVRo8HrYWxZpsoC4kDDcTPTRqT9+pQ176qusBXR6Qey65
         uTNr9Owu6q1QcvxF6opUjbyGDNhbfROAOnpNZ0EMFeuI9yiJYKT1ZXjGArEK0BShom5Z
         lJFQFnRKwbWBAwQWLvvCUg0IxB3v6eXCsuyE40GkHFHAAv54PmE7bkeDS/eoorN2+l8y
         uPLuZekC5HFcXOa3tds07XyNcbHagR36X2YIfWcHkOL1jEq6dQ9fyrNF4BBIEcvkoRgY
         sbQGJkBGViGWOgsogAIJ381Este4MLXnriTGa0l0uzVz34KCBMJf99TVeFgOPp9D3yUH
         J1fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789958849; x=1790563649;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+O5egBgvsUIuHoGJAoHI3ORXx+xU1etkOpoJliWaQik=;
        b=GHJc9u9wHbWm13YYR3kvbwtJONxJj2n/MDmNHRb6yxYn8Xh3oY+j9wF7sgiyyOG3GU
         PlZd9dO09OVDXHJKihiTgxr+wY3Vhcp+sbEy5bOY/7WO6XkmhlcdiFEbs1PvIqcrJ2lI
         LjrQBHx/cW/JU6rsyplqhhGiRGaoJK2kTv0PWSpNiW2epp4z6P2hqv4ZVN9XUWgM/UQA
         fEDpKNV9jIUuNBZip/HA1HTPvW3YbdqRtoj9m4ZcHZsF66uxl9VmdHShzueV+rZ+lNAc
         6JOafGxa2VDH4t0J0feOBtAfrGTJeqt1B4CGSyosC9sNTGOzWah5Cb1QJHBLTHrI8hN7
         BHCw==
X-Forwarded-Encrypted: i=1; AKwUvByRBE9VbAyubq4Y+tQiOusKgBT9gUA3Let1b6r+MxIru/5Ccx1rCaco69nqFId3kndyrI+N9wuWrHeBBqI=@vger.kernel.org
X-Gm-Message-State: AFuF++klff33vBUy9zBGjWxPEDz6UgqCOUtnqk0FnCVQFQsy8Efq+N/z
	021/RhvsjVloHvMgbbFUw3L6/Y+9YqTLYAH+7WxTduYoQrMzNePtcntW
X-Gm-Gg: AYBFou1Db1jtjYCb+e0fQFa036mLmyDMOCYf4INbUa8MEl2GoyMYFXGqQRS48udl+nD
	2UAWyBFbboCvTXJC77Wl9EYIDQdpcchn9Veb7J+McuLu18hZj+dnuCpzc+cEE32/ELF0Pn76NPu
	JKsmX3Eyi/DQ0qBFhWN3SO8azViJC6zPVIfzPLwtG7XebuqeWVvDqitlfdSz5TfHVv/KwvB6Voe
	Rce1Bhbbd88/2vU6tJnJQlpnnOAMHyFSW0Aqdpx6JyWdBerOWzsjj5cLiVO7PWomVFbVgMaxGTN
	Pr5tlOhvXrnA2tyDoGeDGjreYB/3ceJjZVtcGjXvIBCLED3tm39y29BapwFevc4EoYNuEMs1UNs
	LBr6hNkPEMBTDPGUj0oktnKTKxx3rjc235L9VcbVuh/EPj/1GaTWIcAozWKGgqsGOS1gxYBSrdx
	5xWxfAqRiIoxCV5N5XQhX50bCGGHsKbzt+GnpgN7OCpR2xxKCVuSBXOD9KZX/68EFXwkPDdfvFK
	9gH8iIPc+WGhIxBwZ0Z1T6psuVBtMzmdnlr8rHaTEkUs8VLj+BQDdc=
X-Received: by 2002:a17:903:2349:b0:2dd:c100:b2c6 with SMTP id d9443c01a7336-2ddc100b360mr85279055ad.49.1789958849031;
        Sun, 20 Sep 2026 19:47:29 -0700 (PDT)
Received: from [192.168.0.100] (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ddc16b4a99sm25390025ad.5.2026.09.20.19.47.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 20 Sep 2026 19:47:28 -0700 (PDT)
Message-ID: <7b5c7095-e086-45de-bdc2-9063e8229222@gmail.com>
Date: Mon, 21 Sep 2026 10:47:24 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 1/7] dt-bindings: display: verisilicon,dc: add support
 for nuvoton,ma35d1-dcu
To: Icenowy Zheng <zhengxingda@iscas.ac.cn>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org
Cc: ychuang3@nuvoton.com, schung@nuvoton.com, yclu4@nuvoton.com,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Conor Dooley <conor.dooley@microchip.com>
References: <20260918030125.315978-1-a0987203069@gmail.com>
 <20260918030125.315978-2-a0987203069@gmail.com>
 <ea18c92ce2af08a65bfd8834ea7f262d1bcb4bf2.camel@iscas.ac.cn>
Content-Language: en-US
From: Joey Lu <a0987203069@gmail.com>
In-Reply-To: <ea18c92ce2af08a65bfd8834ea7f262d1bcb4bf2.camel@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


Icenowy Zheng 於 2026/9/18 下午 06:50 寫道:
> 在 2026-09-18五的 11:01 +0800，Joey Lu写道：
>> Add the Nuvoton MA35D1 DCUltraLite (nuvoton,ma35d1-dcu) to the
>> binding.
>> The DCUltraLite uses only four clocks (core, axi, ahb, pix0) and one
>> reset (core), with a single output port.
>>
>> The MA35D1 clock controller gates the core, AXI and AHB clocks with a
>> single bit, but each remains a distinct clock line feeding the IP
>> with
>> its own rate constraints, so all four must still be listed
>> individually
>> in the devicetree; core, axi and ahb happen to share the same clock
>> phandle.
>>
>> Move the clocks/clock-names minItems to 4 and resets/reset-names
>> minItems to 1 at the top level, since that is the lowest count any
>> supported variant needs.  Add an allOf/if block that tightens the
>> constraint back up to the fixed 5-clock/3-reset topology required by
>> the existing thead,th1520-dc8200 compatible, and another one that
>> caps
>> the new nuvoton,ma35d1-dcu compatible at the 4-clock/1-reset count it
>> actually wires up.
>>
>> Restrict the same nuvoton,ma35d1-dcu if block to a single port@0,
>> since the DCUltraLite only has one output port.
> By the way, when will the MA35D1 device tree sources be updated? I saw
> a lot of drivers being merged but w/o corresponding DT nodes: sdhci-of-
> ma35d1, nuvoton-ma35d1-nand-controller, phy-ma35d1-usb2, rtc-ma35d1,
> spi-ma35d1-qspi, ma35d1_wdt.
>
> Thanks,
> Icenowy
We are currently reviewing several peripheral device tree updates, 
including USB/PHY, CAN, and other related blocks.

Once the core driver support is in place, we plan to do a more thorough 
review and update of the MA35D1 device tree
sources to ensure the corresponding DT nodes are properly added and 
aligned with the upstream drivers.

Thanks for your patience and feedback.
>> Signed-off-by: Joey Lu <a0987203069@gmail.com>
>> Acked-by: Conor Dooley <conor.dooley@microchip.com>
>> ---
>>   .../bindings/display/verisilicon,dc.yaml      | 51
>> +++++++++++++++++++
>>   1 file changed, 51 insertions(+)
>>
>> diff --git
>> a/Documentation/devicetree/bindings/display/verisilicon,dc.yaml
>> b/Documentation/devicetree/bindings/display/verisilicon,dc.yaml
>> index 919a900122012..e1e6a3a953646 100644
>> --- a/Documentation/devicetree/bindings/display/verisilicon,dc.yaml
>> +++ b/Documentation/devicetree/bindings/display/verisilicon,dc.yaml
>> @@ -17,6 +17,7 @@ properties:
>>       items:
>>         - enum:
>>             - thead,th1520-dc8200
>> +          - nuvoton,ma35d1-dcu
>>         - const: verisilicon,dc # DC IPs have discoverable ID/revision
>> registers
>>   
>>     reg:
>> @@ -26,6 +27,7 @@ properties:
>>       maxItems: 1
>>   
>>     clocks:
>> +    minItems: 4
>>       items:
>>         - description: DC Core clock
>>         - description: DMA AXI bus clock
>> @@ -34,6 +36,7 @@ properties:
>>         - description: Pixel clock of output 1
>>   
>>     clock-names:
>> +    minItems: 4
>>       items:
>>         - const: core
>>         - const: axi
>> @@ -42,12 +45,14 @@ properties:
>>         - const: pix1
>>   
>>     resets:
>> +    minItems: 1
>>       items:
>>         - description: DC Core reset
>>         - description: DMA AXI bus reset
>>         - description: Configuration AHB bus reset
>>   
>>     reset-names:
>> +    minItems: 1
>>       items:
>>         - const: core
>>         - const: axi
>> @@ -79,6 +84,52 @@ required:
>>     - reset-names
>>     - ports
>>   
>> +allOf:
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          contains:
>> +            const: thead,th1520-dc8200
>> +    then:
>> +      properties:
>> +        clocks:
>> +          minItems: 5
>> +
>> +        clock-names:
>> +          minItems: 5
>> +
>> +        resets:
>> +          minItems: 3
>> +
>> +        reset-names:
>> +          minItems: 3
>> +
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          contains:
>> +            const: nuvoton,ma35d1-dcu
>> +    then:
>> +      properties:
>> +        clocks:
>> +          maxItems: 4
>> +
>> +        clock-names:
>> +          maxItems: 4
>> +
>> +        resets:
>> +          maxItems: 1
>> +
>> +        reset-names:
>> +          maxItems: 1
>> +
>> +        ports:
>> +          properties:
>> +            port@1: false
>> +
>> +          required:
>> +            - port@0
>> +
>>   additionalProperties: false
>>   
>>   examples:
