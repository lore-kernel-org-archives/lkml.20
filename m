Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C62E92BE02C
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 01:53:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789005187; cv=none; b=I0gedUlLEmXpbtP9rC/k4ptoHSbmPOoMTlAuETADt4UiHAr3eLCXhZWFp7wm3UOGE0o6hvBRKFWwCbdhFM+qjpCO8VVgBPczBFBnOMsuvbMY7jLFjRfePH4mCBMzstmxg0LrhPL1BcBJoumZMlQkHkFtCnthCMMtxX4GMza4B9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789005187; c=relaxed/simple;
	bh=SmcfkWeuLc3CpgSLYnogq8F5mXa3Fw44pJ9p5pnhX2U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jZHXOgvglLmqvGQuuyC4x8gX/qR0z8d4a332K7e9p4ahWMsC21ZOZ2strEUM8UwDRVC9tWFoF+qFGQ3ay09tqBH4Ia2ZG+FhURkzImEBFdQ/zw8PiModUkS1JY16yivfNmMVVlCppd+pIsXvAcgCVb77HVCZ3/jwyL/yblZOpI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XK3OiMOQ; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XK3OiMOQ"
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2d747ed9865so7157865ad.1
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 18:53:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789005184; x=1789609984; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=B3AxC7gchtFJwmTqUc6Eo/wyWrQDc1+3uptrgZICrdw=;
        b=XK3OiMOQdpZYn6XiVZlnqJhl8XauhXCdvCSa9xSQN9wes0DpCqJ0/l3aDF57dPBnmn
         dmLdCUB3DTMmI+WipvfVtgTttsLcLxYRzzMoHKxrkSfAFQxioEDpNO2M5EZLENKYaFTu
         vBBXd04K5plFMIec7/zZX8Lj3C65Leo5GIg92h7L2n9OEdqWEigJbsJIpG/uffydRq8j
         poAsh8xck1TRYyVe0z7A7/pL/Bm3uxtvx+XmIjHA+Tz8aTbkdgcjqLpZtvEWNEcv0SmF
         d3eYswEqDxf5P7LM/BfXWP+f/Sor+XMHQna8nQvYEeGN/aqeDNvWbspdB/y/EbwNmYym
         iSBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789005184; x=1789609984;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=B3AxC7gchtFJwmTqUc6Eo/wyWrQDc1+3uptrgZICrdw=;
        b=g0EM/j8rbgCcM9vB7qTBdxGGdl29McUlg5v+yYnj8QRE943FEplXL6a/hb5GjWEeEg
         /mnZlaEs04zcuIoFGEWgjKsOVHAbbvo7k5H4S0stxztjN0MmHuN6l5dAgkiWHTCN+DAJ
         9k0jkbeKQ7qJLuIEZEWG+qOEBcqfgV+IBaKNshsYs4bHfHik9Lq9n5piZ3r4+BAWKz1I
         4nkTJ2/7q7LgGwG9gaAoq0dEyEG7LMYR3+oWpydmddA2cfSTzQjUbcv6CSGcdy06ryQ6
         NQMEkxl2g9Yl+ZxWY8oACtYcZ82D+I6CU5jYDMgnVcyzXRWFVcCwH/6+fC7DwO9b0ED8
         hDOA==
X-Forwarded-Encrypted: i=1; AKwUvBxOkWY82q5axLh95CPGj84NRKS+cMRGrW8Qnq76WnkyZGS70PG2lIliLnrRW0hff8B/2GKSF4Cg/AG+Fuo=@vger.kernel.org
X-Gm-Message-State: AFuF++kEXgRS5cdO/McVEdMJJ0NbG/6ZfeCqWEDV+vLlQcreTzxmrfcn
	LrRFFHEGntTU6K4NA5+t4wjnmWH3V4bR0MpNcQbxxs26kVa/pck1yBKv
X-Gm-Gg: AYBFou3jnQIr7fTAAOlN5Rl204T/ZeDGji+LkVbWlgBMZPmmEwDJAfbP8DSSaUD5SFm
	Y/MWC3xVQC1KBDbBg2syKRN2TiD/WuPHQ0VN2qU5PvOgifHt0nkGgvLB//m1uzpTxC5fPG+F4NB
	LOys9giXQRwqT6F/QZicz8c51T7XvEUit3Lw3QU4V++VMmL1gFMlYYhoPlPz11tUNADM29B35sM
	BevS72XDONu7OxQ+xn+Ahk263Ym3w7B9hF9RIGLSpln1bNXGybYqldA93cilq6sOD9FHdgLXp3J
	Ftcwp8cVmM1zwPMDP1A1SFA8mzalRyO25E8F4cPng7S0ln76RdDhJ6FGOgDIZ6V3EeejaqA/yea
	YnxdM+xGetPZiXyF/aSiJiif84uygypBWU+8QdEXXn1XYbobmks6UvJ7BabHh+b767O6lwLJilH
	vNQg2kLS+YO4mr8VJL9ftgEOkvCQDVKWKxCUd9fxWedVkYzHHY3WVUMOKoc6HK9oRd/qn5d8Ar7
	2LF0AUZiMY9Y8K27HqjJHT5F5+aFzbbemZ14u4jWJ5cayAnh3eqLVA=
X-Received: by 2002:a17:902:d58a:b0:2d9:4358:73ab with SMTP id d9443c01a7336-2dd07b9c78cmr64548885ad.19.1789005184028;
        Wed, 09 Sep 2026 18:53:04 -0700 (PDT)
Received: from [192.168.0.100] (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2db1499d92dsm79698945ad.52.2026.09.09.18.53.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Sep 2026 18:53:03 -0700 (PDT)
Message-ID: <9d697240-3632-401f-aeba-c1fa5c2a29d4@gmail.com>
Date: Thu, 10 Sep 2026 09:52:58 +0800
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
Content-Language: en-US
From: Joey Lu <a0987203069@gmail.com>
In-Reply-To: <f74168b54fe8f070b7cfe79dc2fc83a63c2e8842.camel@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


Icenowy Zheng 於 2026/9/9 下午 01:44 寫道:
> 在 2026-09-08二的 17:28 +0800，Joey Lu写道：
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
> This is weird, but I must admit that we're limited by the Common Clock
> Framework here, so I cannot give a better solution either.
>
> Anyway let's settle with the current result.
>
>> Move the clocks/clock-names minItems to 4 and resets/reset-names
>> minItems to 1 at the top level, since that is the lowest count any
>> supported variant needs.  Add an allOf/if block that tightens the
>> constraint back up to the fixed 5-clock/3-reset topology required by
>> the existing thead,th1520-dc8200 compatible, and another one that
>> caps
>> the new nuvoton,ma35d1-dcu compatible at the 4-clock/1-reset count it
>> actually wires up.
>>
>> Signed-off-by: Joey Lu <a0987203069@gmail.com>
>> ---
>>   .../bindings/display/verisilicon,dc.yaml      | 44
>> +++++++++++++++++++
>>   1 file changed, 44 insertions(+)
>>
>> diff --git
>> a/Documentation/devicetree/bindings/display/verisilicon,dc.yaml
>> b/Documentation/devicetree/bindings/display/verisilicon,dc.yaml
>> index 919a900122012..773966677d0f4 100644
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
>> @@ -79,6 +84,45 @@ required:
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
> Maybe it's reasonable to restrict max port count to 1 for MA35D1?
> Although I am not sure about how to do this...
>
> Thanks,
> Icenowy
  I found the same kind of per-compatible port restriction already used 
upstream in renesas,du.yaml, e.g.:

         ports:
           properties:
             port@2: false
             port@3: false
           required:
             - port@0
             - port@1

Applied to our binding, that would look like:

         ports:
           properties:
             port@1: false
           required:
             - port@0

in the existing nuvoton,ma35d1-dcu allOf/if/then block, so schema checks 
would reject a port@1 node on this compatible instead of silently 
accepting it.

Happy to add it if you'd like the schema to enforce this, but wanted to 
check whether you consider it worth the extra lines given it doesn't 
reflect an actual bug in any DT today. Let me know which way you'd 
prefer and I'll fold it into the next version.

Thanks.
>> +
>>   additionalProperties: false
>>   
>>   examples:
