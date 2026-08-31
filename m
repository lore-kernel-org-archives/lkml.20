Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2A3049DB95
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 17:54:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788198876; cv=none; b=SAshNpGJwnKc4j6Fzghi81Bv0z7hVaZel3Dbc6t6M7hXGaZRNRCn9iHENQx1o5CmfksOuWveg1qYcKOFUee5DmwqFEEVngRXCkjHZYdehwdj4CYnLgOtO8hR6ceOSh79vXiF9NALwLShN2kmLjQ8v74gVrx/klKv8HHtZ1E1bu8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788198876; c=relaxed/simple;
	bh=UYE0TVPvtGJOyY9Ckx6gnfEQGK1vxdpcJMZkB+6Olco=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nIIwjqxZbUc1SxPEorUBMgSUlO+QFNALvS/kUtPyvgglVVEJdk5DKM53rppFdF6fLV8WWcE985fT/xRT01Ckk1NIhqJVQWzJQ8+L6thZy95EWQKMs7mMOIw3zWxImaXOH0U8a22SmGe0ya+TETOzA4nqjcaA6KT6Q3q4I4RmMkc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HLoHs6eI; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HLoHs6eI"
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-cbe6295f05bso104711a12.1
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 10:54:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788198874; x=1788803674; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eJ0+j4O30OtnEhBm9bnkMs8hCArM6aYcbWRiMpOscEw=;
        b=HLoHs6eIph6xc3XRHV9E3n5IIgNZ55v3gtBwMkVAjmTZ5Xhrxqi3mIhCURfzIMycMx
         TPXH2C/QoZoyoQYR3DGONbj1P/w5QnGFTh2N/f+D8yjmcFW5jR7A/218wZOuT4yqtCjB
         89/Aa8spWDombJbF37PmUnZ36S6bVf3/1PVvpO2f2C1lBsU0W+7CYmN3OtzzgtEDY2vF
         5Uwe3UvAFSlp2os3JbUWMw/myCSBRiNHM/ei/s8Tqe5ZNgtHNQbW7G66+nyMcyEkCJ4t
         uAp/yD63ArVxatEdQnRXmIODMFxpcC7MqelQ1c+LLFWXpRtOoRdbH3kEcZvVL6AmKUNE
         oFQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788198874; x=1788803674;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=eJ0+j4O30OtnEhBm9bnkMs8hCArM6aYcbWRiMpOscEw=;
        b=OobynCwlim/Noqmo2p4R59RmbNgVsILMK74NWTpShmsty2RF90gKlfc+lRLtnTNTiU
         ntomBrC01qw7+gm+FYlF1crjjz1cCgqjuJVGZXpwxmDoKTzbgIeR/pp9rn9dwA8JC0t1
         ce8CzUs1/hT+10tFOMr+38ow9qb68VLILPhLSI8RQLDsoLyNrDk3J7+NoY//WoL5pPmE
         PvsfLqu92vW9UJl3V8C+8ETaMLhx4hhAMQgGpIjdQj9cH0ZD0/iaYuVTbW0fb1YbGkUP
         k5bTm5A4xHlw1taDFUiAXaVcG+1WlzNEDOUC4Fg8WEEibJDHI5R85oaXWi6hm/nravSo
         QjPw==
X-Forwarded-Encrypted: i=1; AKwUvBxhtvwVI+3G+9/s/C95n8FXWrAO80S12YJ1oudU+NdrQmNoXOs7bXNKT0K14ctF4k4S9Yd4gYSz2YiMqKU=@vger.kernel.org
X-Gm-Message-State: AFuF++kQC8yQWugVI+bVFyqZOxS1A94GhFlxqQGQmYf6EK+AaVFn8VVa
	vD7GmBqrfF1IodkxLLOW3DTDALxyqXFuvH4QgvZUBJimlW04XVliZAuO
X-Gm-Gg: AYBFou2occt4uFNe26sYhL9HaQWbkQrIjr35dXivH92FnzonMExfVZFFF59+G6wHpaA
	c5WAih0YORyS63pWEeAdd8YbCgizu8VoRyxJMQgL7IZt/eRndztf85fR9cWCl5pi1yUdY6ONqz0
	tUVl/2+sG2fiEq7Y+tcBIZKHz+5VezkO872GJFYrkh2iWXxeB23hyvU32Ml8eZxc+FNJjBd+H1T
	xtpxeH3NBIyJbYmdQ9shW/tR2kClc9JDQ9W1pC27MhUWFAYTmesSg78VAX4COtDl2+pQ6yRFkzR
	5OQLo1jLIkAa6YUiViNyaOyN3Z70JLY0OQzrtB3EGVtmi4Qyo0sy9AbGfV5ECGmx9ocxLGeE9rw
	oHd0zimxlrwiju+6qTn4uIJpD67YqIXzaXe+WXCTBkrxOELrUKUj6ZLBJ330hSlY1VbCEHTb4K5
	EQBVmQVa/nFaawgaXXw/QKWpP3jSScfgSQIqKmU3ZLVfcqJa7EUFT0yZNFzqGqiv3elYHgjoTSG
	rJUjGO/LfNYk8k9NmfU3KfwaEmhTatN/d9swQ==
X-Received: by 2002:a17:90b:33c6:b0:398:ceed:b903 with SMTP id 98e67ed59e1d1-3990f7693e4mr33129a91.11.1788198873899;
        Mon, 31 Aug 2026 10:54:33 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3286fa5517fsm34727251eec.31.2026.08.31.10.54.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Aug 2026 10:54:33 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <9f4e99f4-5135-4db8-8534-46c91bf4f7d2@roeck-us.net>
Date: Mon, 31 Aug 2026 10:54:32 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/2] dt-bindings: hwmon: Add starfive,jhb100-fan-tach
To: Conor Dooley <conor@kernel.org>,
 Changhuang Liang <changhuang.liang@starfivetech.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
 linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org
References: <20260830011941.40199-1-changhuang.liang@starfivetech.com>
 <20260830011941.40199-2-changhuang.liang@starfivetech.com>
 <20260831-dominion-data-c8b6f691dd5b@spud>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260831-dominion-data-c8b6f691dd5b@spud>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/31/26 09:32, Conor Dooley wrote:
> On Sat, Aug 29, 2026 at 06:19:40PM -0700, Changhuang Liang wrote:
>> Add compatible "starfive,jhb100-fan-tach" for StarFive JHB100 Fan-Tach
>> controller.
>>
>> Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
>> ---
>>   .../hwmon/starfive,jhb100-fan-tach.yaml       | 93 +++++++++++++++++++
>>   1 file changed, 93 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/hwmon/starfive,jhb100-fan-tach.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/hwmon/starfive,jhb100-fan-tach.yaml b/Documentation/devicetree/bindings/hwmon/starfive,jhb100-fan-tach.yaml
>> new file mode 100644
>> index 000000000000..1dcd4932768f
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/hwmon/starfive,jhb100-fan-tach.yaml
>> @@ -0,0 +1,93 @@
>> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/hwmon/starfive,jhb100-fan-tach.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: StarFive JHB100 Fan-Tach controller
>> +
>> +maintainers:
>> +  - Changhuang Liang <changhuang.liang@starfivetech.com>
>> +
>> +description:
>> +  The StarFive Fan-Tach controller can support up to 16 fan tach input.
>> +
>> +properties:
>> +  compatible:
>> +    enum:
>> +      - starfive,jhb100-fan-tach
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  clocks:
>> +    maxItems: 1
>> +
>> +  resets:
>> +    maxItems: 1
>> +
>> +  interrupts:
>> +    maxItems: 1
>> +
>> +  "#address-cells":
>> +    const: 1
>> +
>> +  "#size-cells":
>> +    const: 0
>> +
>> +patternProperties:
>> +  "^fan@[0-9a-f]+$":
>> +    $ref: fan-common.yaml#
>> +    unevaluatedProperties: false
>> +
>> +    properties:
>> +      reg:
>> +        description:
>> +          PWM channel index. The driver allows two fans to share the same
>> +          PWM channel, or each fan to use a dedicated channel.
> 
> Doesn't matter what the driver can do, the description should describe
> what the hardware supports.
> pw-bot: changes-requested
> 
> Does this fan-tach controller provide the PWMs?
> If so (although Guenter may correct me), I think the fan-tach controller
> needs to be.
> 
> If you don't do that, I think you're going to run into problems with
> having multiple nodes with the same unit address when two fans share a
> pwm?
> 

Depends on how the controller works. Normally fan controllers have a feedback
mechanism which can be either temperature -> pwm output or fan speed -> pwm output.
I don't know how this controller works, specifically if the fan speed inputs are
internally associated with pwm outputs or if they are completely independent
of each other. If it is the latter, aspeed,g6-pwm-tach.yaml would probably
be a good baseline.

> I think what you're supposed to do is drop "reg" and replace it with
> "pwms", but once again Guenter may correct me there.
> e.g. aspeed,g6-pwm-tach.yaml
> 

Sorry, when it comes to devicetree properties, I am completely clueless.
Usually the devicetree and pwm maintainers insist that all fan controllers
are modeled as pwm controllers because they have pwm outputs. My approach
is "use whatever bindings are acceptable by DT maintainers".

Guenter

> Cheers,
> Conor.
> 
>> +        maximum: 15
>> +
>> +      tach-ch:
>> +        description:
>> +          The tachometer channel(s) wired to the fan(s) driven by this PWM
>> +          channel. Integer values in the range 0-15.
>> +        minItems: 1
>> +        maxItems: 2
>> +        items:
>> +          maximum: 15
>> +
>> +    required:
>> +      - reg
>> +      - tach-ch
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - clocks
>> +  - resets
>> +  - interrupts
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    fan-controller@11be0000 {
>> +        compatible = "starfive,jhb100-fan-tach";
>> +        reg = <0x11be0000 0x400>;
>> +        interrupts = <128>;
>> +        clocks = <&per2crg 33>;
>> +        resets = <&per2crg 5>;
>> +        #address-cells = <1>;
>> +        #size-cells = <0>;
>> +
>> +        fan@0 {
>> +            reg = <0x0>;
>> +            tach-ch = /bits/ 8 <0x0 0x8>;
>> +            pulses-per-revolution = <2>;
>> +        };
>> +        fan@1 {
>> +            reg = <0x1>;
>> +            tach-ch = /bits/ 8 <0x1>;
>> +            pulses-per-revolution = <2>;
>> +        };
>> +    };
>> -- 
>> 2.25.1
>>

