Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B76944063E
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 15:09:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791558550; cv=none; b=dz9eGKue/BYbOWR/qIbYM1XBMpGm7SvMWL740n0anYET6xg2N6RRgKQaX4qaRB1W+sf1wpuFILeU+0Njb+RJ6ohIR5e+fESteiBXFuDVmxt65UjpQkzzScbTwG5mGnOdzBB7Ki1S6Aw6L+pV+vxnc9V0aBoeYCN4NnxPX4aMH2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791558550; c=relaxed/simple;
	bh=nlhCH/CSlbatBMdTHsXWcB/emZcsKtIT1zL2drnLmYQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=a8jfuogJLlwiQ8CUAycdn80fz9N/wqeef25+Iyh6Rctf5KUAu2Zz9p3kSyooEB4r9gDnahEfHJhtdatOeocDx+/cHVSwB2YYGwtexo0O+2fyGbE9BFMHer7cxI8ADKUf0dcG3WkCwYoXAxjb+6oOuz6bGfIFc1TdaqtwCwTu3hw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=y47I0vd4; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="y47I0vd4"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-48c6f764f82so1584533f8f.0
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 08:09:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1791558546; x=1792163346; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=j/yns8BeekUtHsH0yjXfDU6YvlINj59bKBP0lN5D5wc=;
        b=y47I0vd4z8PcUo4UTN/ZYeXvUt3jz01XM8/wI/JMnUz80GvOI2ZasBeM9UijoFQD5e
         TjWxligWHD7NL5MVngt80wwJqgE/ui8kK5P5M7JXQA9Ein/BLEDuDuH0ZNw2/axTpRs2
         crUkA+Z8ubg51jk2rgB1joVceIToFbRSL6K9MqD04411SVuRixQWFP5PJAjxgOPZz262
         U0fHWE7reKUdQay3J5o3UK3DxjCDWyUBtg1sZPCIZMipylPvLp2Q7MzlRTYdc3IxoRJQ
         t4pG6mTuaI8N+xpoJbh4HAa7WJk3i5P1Nr3Zy/Gm9lQqHR3iHEyjYa/lQ+/aoAWHkTd1
         nMjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791558546; x=1792163346;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=j/yns8BeekUtHsH0yjXfDU6YvlINj59bKBP0lN5D5wc=;
        b=A/VabnIXD8BAdxPI6W6kJogvkuoRmzqiTDXmVZ7gdn8KEWTdAg9CYUlSX7BQniu17b
         NdP8py4FYEqQlpYXGcjezgAyXqQFKysUkEjwaBnBraYnTFN4d38JgjnnZDHR63EmuX8l
         muZ8MWjedEYaTQz8ghajpQfFSqlH6iaMRm9bjIDFAHVBQNHoPtJd7da/NFFlqnJLP9JT
         AgfguCsd/4rpnl+E/pJE2LiZVhZqS87IK/PgyQMd6Nuje5gyB/2BHyxF/uW6mJgb6q0n
         nX/Vmk0J2BrqJVEkB9lXgGTow1QiuNPTZOAzs7dBpMB7qHwX/aAiU9UbEEuRqabahlN5
         eYDQ==
X-Forwarded-Encrypted: i=1; AKwUvBxC6EGRrMl6arqdZYxFTR+ifzDSGGj7/6Jv/PhrZ7VyiG5Q7yjqb+idO5ow2bRO8NITjawDQ22mlVZA2zI=@vger.kernel.org
X-Gm-Message-State: AFq9FYIW13rvHJTfJplLK1QKggrn81Y+iRxRlcKGDxzIinVWbU3yXKNt
	8HchVIUk+9gkAcwkvnb48/T1rQ92yyvnbyN06cG3QvD/e5gYQOaUrRnTm8C5lXQ7Rxs=
X-Gm-Gg: AYBFou3KnLH52oH8aG7VDMh01+o+Pb40DkqxINH7b7qKqcxqswJmGb6Y3LxeL5pdsqi
	6gNfo8xzJmyCvQ7cYvcTsrsRwN3X1jM8W/qyakTUoynqeqI9IZ5p+ef10rohegmE5zaSjqYLswQ
	w2FkUQUsHGWFGIeYRMoUOd+3Sr+IYMYvUHzm+w1fKmEjjdM7I0AIVVhNq7n34eJVig+rcKINS4b
	FKYwRZPkQnWFOPXSpZ4zeh02cMa375B7L78xfRflVymfRPuxMubm1go9PC763c/HVZMxjFSwuSM
	aTXMwgGdo8vr8TLCv4jjk9JZS2JnH+dT/4zoJYmdrb+Q1sLVGP7d2U9nLCmf1Crhoz1Wb88KrpL
	LjjKRYrZ9a5RjGXOf0sTAGiasy/vxs19gLwKSAJRQp8GCnjVJq5azD4njSIZ9zJ9ddE0rEeVvq3
	AZK+lSzk1Sye32bPJla7KmYTracNbqJbJEc+fi/VqCOQYvOkBqLpW+dA73VgkVggIqdcVN2fAb
X-Received: by 2002:a05:6000:248a:b0:48a:f354:aefe with SMTP id ffacd0b85a97d-48dbacdef01mr4583595f8f.39.1791558545617;
        Fri, 09 Oct 2026 08:09:05 -0700 (PDT)
Received: from [172.22.22.28] ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db9463049sm4868635f8f.4.2026.10.09.08.09.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Oct 2026 08:09:05 -0700 (PDT)
Message-ID: <ee6ba585-2b87-4e38-963d-9d2731cf4d78@riscstar.com>
Date: Fri, 9 Oct 2026 10:09:00 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] dt-bindings: clock: introduce
 toshiba,tc9564-clock.yaml
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: sboyd@kernel.org, bmasney+clk@redhat.com, jbrunet+clk@baylibre.com,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 andersson@kernel.org, konradybcio@kernel.org, abelvesa@kernel.org,
 kees@kernel.org, gustavoars@kernel.org, mohd.anwar@oss.qualcomm.com,
 lorenzo.bianconi@oss.qualcomm.com, danielt@kernel.org,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-hardening@vger.kernel.org,
 linux-kernel@vger.kernel.org, Daniel Thompson <daniel@riscstar.com>
References: <20261005230927.2000398-1-elder@riscstar.com>
 <20261005230927.2000398-2-elder@riscstar.com>
 <20261009-gifted-stylish-tortoise-95b14d@quoll>
 <b190fe58-364b-4b94-9cab-c5f81f874289@riscstar.com>
 <aafe2703-bfb8-43da-8472-b1dfa36fa8f9@kernel.org>
 <77dacc46-7294-47c8-899a-fd56b6a2af55@riscstar.com>
 <ad511ae7-755d-42bc-a55d-12b93d49ddaf@kernel.org>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <ad511ae7-755d-42bc-a55d-12b93d49ddaf@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/9/26 9:46 AM, Krzysztof Kozlowski wrote:
> On 09/10/2026 16:23, Alex Elder wrote:
>> On 10/9/26 8:56 AM, Krzysztof Kozlowski wrote:
>>> On 09/10/2026 15:44, Alex Elder wrote:
>>>> On 10/9/26 4:31 AM, Krzysztof Kozlowski wrote:
>>>>> On Mon, Oct 05, 2026 at 06:09:24PM -0500, Alex Elder wrote:
>>>>>> Define the binding for the clock controller functionality present in
>>>>>> the Toshiba TC9564 SoC.
>>>>>>
>>>>>> Co-developed-by: Daniel Thompson <daniel@riscstar.com>
>>>>>> Signed-off-by: Daniel Thompson <daniel@riscstar.com>
>>>>>> Signed-off-by: Alex Elder <elder@riscstar.com>
>>
>> . . .
>>
>>>>>> +properties:
>>>>>> +  compatible:
>>>>>> +    const: toshiba,tc9564-clock
>>>>>> +
>>>>>> +  toshiba,config-syscon:
>>>>>> +    $ref: /schemas/types.yaml#/definitions/phandle
>>>>>> +    description:
>>>>>> +      Phandle for the configuration space system controller.
>>>>>
>>>>> I do not see my previous comment addressed - you have no resources here,
>>>>> so this belongs to the parent. You responded something about pci-ep, but
>>>>> the parent is not pci-ep. Open your code:
>>>>> https://lore.kernel.org/lkml/20260918165234.687224-5-elder@riscstar.com/
>>>>>
>>>>> I clearly see code like:
>>>>>      syscon {
>>>>>        clock@ {
>>>>>        };
>>>>>      };
>>>>>
>>>>> so I do not understand what pci-ep has anything to do here.
>>>>
>>>> What I have now (about to send) looks like this:
>>>>
>>>>        syscon@0 {
>>>>            compatible = "syscon", "simple-mfd";
>>>>            reg = <0x0 0x2000>;
>>>>
>>>>            clock {
>>>>                compatible = "toshiba,tc9564-clock";
>>>>                #clock-cells = <1>;
>>>>            };
>>>>        };
>>>>
>>>> A reset node will also go inside the syscon, so there is another
>>>> function for that MFD.
>>>>
>>>> The regmap belongs to the parent, and is looked up this way:
>>>>
>>>>        regmap = syscon_node_to_regmap(dev_of_node(dev->parent));
>>>
>>> That's driver code, so irrelevant. So how does this solve my comment
>>> from v1?
>>
>> I'm trying Krzysztof.
> 
> In v1 I asked to fold the node into the parent. v2 did not have it. v3,
> which you are preparing, still has no node folded, because they are
> separate.

Are you saying to fold it into the PCI function?

If so, could the PCI function be a clock provider and
define #clock-cells (and #reset-cells)?

Because as things stand now, clock and reset are used by
the two DWMAC Ethernet interfaces as well as a separate
interrupt controller (one for each PCI function).

It sounds a little like you might prefer everything being
wrapped up in the DWMAC driver, as we originally did six
months ago.

					-Alex

>> The clock controller uses two registers, 0x1004 and 0x100c,
>> to manage whether a set of clock signals are enabled or not.
>> (The reset controller uses two adjacent registers, 0x1008
>> and 0x1010, to manage whether a set of reset signals are
>> asserted or not.)
>>
>> You said "no resources except a small address space" and I
>> guess it's not clear to me what size is "big enough" to
>> warrant representing something as a separate device.
>>
>> *One* of the managed clocks is a 25 MHz clock, exposed
>> through a pin on the SoC.  That one clock signal is
>> therefore usable by the platform (although on the RB3gen2
>> it's not used).
>>
>> Rather than expose the register addresses in the clock
>> node, a syscon is defined, covering 8 KB, and the actual
>> offsets used are just defined in the clock and reset
>> driver source code.
>>
>> If that's not the right thing to do, please say that.
> 
> Nodes should be squashed.
> 
>>
>>>>> What's more, I still do not see any usage of these clocks outside. And I
>>>>> still did not receive actual answers (or I missed them) how these clocks
>>>>> are routed OUTSIDE of the connector. You said for example:
>>>>> "Ultimately the TC9564 SoC has a single 25 MHz input clock,"
>> . . .
>>
>>>> The single exposed clock *might* justify presenting the
>>>> clock controller device in devicetree.  There are also
>>>> resets exposed externally via GPIOs, and these control
>>>> external entities (PHYs).
>>>
>>> I cannot find any of these exposed. Please point me to DTS code showing
>>> this.
>>
>> It is not used by this platform, but is available for other
>> platforms to use.  Its name is "REFCLKO" and is exposed on
>> ball C17 of the SoC, if a platform designer decided to use it.
> 
> Yeah, but you do not describe the SoC but PCI EP device, thus my claim
> is that clocks cannot be used by the host. The SoC itself for different
> hardware uses would have different binding, so that's not an argument to
> have anything here, unless these different uses are also documented here.
> 
> Best regards,
> Krzysztof

