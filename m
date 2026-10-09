Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA7494BD11B
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 14:24:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791555845; cv=none; b=fE1HzsMfd6e2z19DBuc5KfEB3e9UhEnTeKvjMt1g3EjPKQu7USRn5SF2nOKv2zUf88XqYiwL6Jrz9qLd0pj6M6VjuzjGyBsbQGx+SlTXcmVByx5hKB8k0gfZrRMFOdyTp6Yai8EAUZfhFj3uXEHzoLhcibM9mXZ3WIZlt1CgdSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791555845; c=relaxed/simple;
	bh=5afvs8MvB8g8cyiV0dvhk0wts/9RLtB6TmHb87Dw3Ug=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=H7nCN9gjtutBYKYrzv3xo71yD8EV8oBewELMNd8ZV6qiKJZuhs6hI87dSssWenrrZOvxMNWp+rJrtAStcuzllMmDQ4pA9ejv1CqlJdsujyBOMXTPfsiAtlqCdKH+VVwhQdfP5/pAupnDmkyEoEIloS8RLVPCOAwpDU6DI+lbQ0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=P+umFAKd; arc=none smtp.client-ip=209.85.219.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="P+umFAKd"
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-91b64fb6010so591706d6.1
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 07:24:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1791555843; x=1792160643; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aHhnSl5etYVacPAAIx+gDocb5CfPyv6BoCMmkWUozsk=;
        b=P+umFAKdn9MfAbB62Bqe6Jys+RsjWl2LwVRDDG/uz13/lPDJFGEa5ORtAmA2EcWk/S
         TGVt1/Aj7+lGEpUHa3LUj1CqdcnNGVsMXqM5Id773/N5CH938hcD/V6gyLLLVqIlCEk6
         vEiKKlI1OKH/MdpZiN/FhMVtBOthkHEEdzNcyevspMAVlUdMLhyA3HZZFEwXcoSKZiEh
         a5TWsewDZZbyZx4LqZQGPm07zkq+0kf6ghk+3ihhmNHcwe6b+8fm7uzJ3V+7w/HTTLdh
         l1J9/zvS0/nGNnJvUjVWoKAC4EGeJFm/wzr0mIQTRiHnvotZrADu/oR754e3Ey405Bra
         Z0EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791555843; x=1792160643;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aHhnSl5etYVacPAAIx+gDocb5CfPyv6BoCMmkWUozsk=;
        b=wrfDe8PmXTVlHnheDhcD/PVcuZ54Pox52vnkcxdeaAodxSizDG06M2T+1QSnVYU+Eu
         UGrJTBLdyngxX+cdvorvo+YXB4zesTgfZgxXH5QE+wCwVtwCJmSaHg/6kerDYoh9wARQ
         VSMBw5dgZkZg/fNHUnCybqmdRwDiA5cxZIT2pXH7Yayk7pxGKRBTWjk5ENcMP8Egf1RA
         IDBA5EZ8YS2nr47Sqc4mbcIuD43rL8n6fPRCNcbaOxtAqbPIIkyJSQ84dc1aYKTarvEh
         rVBcaYSKIbfeMorKg2ikPxZPLJooU9lA2y24UKTpKjmLSw5d//obbwdK25GA18vuHqtV
         qADg==
X-Forwarded-Encrypted: i=1; AKwUvBwqMIXxjz9lm/XWG2+wjThfHqQEtabMKjCDBMsykVFGfgPD06NCqOFz4R2Pz2gZOvdeIjRqOlNHiCS6Fq8=@vger.kernel.org
X-Gm-Message-State: AFq9FYIb2LwFLl0ID2DPgI/RnYouJTxnyY4TLRZY2ciZ9BXXXWr8DWXA
	oDJuiw8LIm+Gexj9qDYGKf7oHqFFNtaio/RA3ir2LMywECstEMQi9q4ogZILfGKAJCU=
X-Gm-Gg: AYBFou0twBb4gl9LT3nJav/SxWUidbKTy+bZIfFQfPcpUjMkPvbOSXw4Weto9ZCGrMh
	z0bs1L4GlYX5pbYY7IZJSoj18o31mMqYbbq6c3QhfrKulyMEXxCmqDCPGy+IpSdkt2dG5Eu+88h
	SECAQ1cvA+U7QPltfRm/k8EjG/35h3bQS+3lQQvmGAwAgp94eJjFQVyEg9TPeQvGbnicQXsw8oT
	YG0Z+xRBGxGKn5Qd+xtt0qlH0FRinXfIyxTrIbrpdezKrwxITNC4fVmUoacc8C/88rix4JaJzp7
	auJigTux2RWpwybVut3vUmRb6CVqT7lxMokP7uGD1VXEo5W0YdWPXIz7+ZxbDbDRLgdxiDZyzC4
	duLBOOkcKSPvjpVBhDthUntTc6LBGqXwwSqYhu0bbJvcIhU+LfUqAev+nk/rJ+JIeeuUcboNerO
	p0gOQvTiJDw3V0a7QOvA6dXq6hii+i+IcZzRBhR/vdFGdR0BiRZkPkK/U+L8yQyaPs3Vshd7M=
X-Received: by 2002:a05:6214:410c:b0:91b:5d85:6521 with SMTP id 6a1803df08f44-91b5d8571e7mr20208846d6.24.1791555842704;
        Fri, 09 Oct 2026 07:24:02 -0700 (PDT)
Received: from [172.22.22.28] ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91b54e832edsm19562406d6.4.2026.10.09.07.23.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Oct 2026 07:24:01 -0700 (PDT)
Message-ID: <77dacc46-7294-47c8-899a-fd56b6a2af55@riscstar.com>
Date: Fri, 9 Oct 2026 09:23:59 -0500
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
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <aafe2703-bfb8-43da-8472-b1dfa36fa8f9@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/9/26 8:56 AM, Krzysztof Kozlowski wrote:
> On 09/10/2026 15:44, Alex Elder wrote:
>> On 10/9/26 4:31 AM, Krzysztof Kozlowski wrote:
>>> On Mon, Oct 05, 2026 at 06:09:24PM -0500, Alex Elder wrote:
>>>> Define the binding for the clock controller functionality present in
>>>> the Toshiba TC9564 SoC.
>>>>
>>>> Co-developed-by: Daniel Thompson <daniel@riscstar.com>
>>>> Signed-off-by: Daniel Thompson <daniel@riscstar.com>
>>>> Signed-off-by: Alex Elder <elder@riscstar.com>

. . .

>>>> +properties:
>>>> +  compatible:
>>>> +    const: toshiba,tc9564-clock
>>>> +
>>>> +  toshiba,config-syscon:
>>>> +    $ref: /schemas/types.yaml#/definitions/phandle
>>>> +    description:
>>>> +      Phandle for the configuration space system controller.
>>>
>>> I do not see my previous comment addressed - you have no resources here,
>>> so this belongs to the parent. You responded something about pci-ep, but
>>> the parent is not pci-ep. Open your code:
>>> https://lore.kernel.org/lkml/20260918165234.687224-5-elder@riscstar.com/
>>>
>>> I clearly see code like:
>>>     syscon {
>>>       clock@ {
>>>       };
>>>     };
>>>
>>> so I do not understand what pci-ep has anything to do here.
>>
>> What I have now (about to send) looks like this:
>>
>>       syscon@0 {
>>           compatible = "syscon", "simple-mfd";
>>           reg = <0x0 0x2000>;
>>
>>           clock {
>>               compatible = "toshiba,tc9564-clock";
>>               #clock-cells = <1>;
>>           };
>>       };
>>
>> A reset node will also go inside the syscon, so there is another
>> function for that MFD.
>>
>> The regmap belongs to the parent, and is looked up this way:
>>
>>       regmap = syscon_node_to_regmap(dev_of_node(dev->parent));
> 
> That's driver code, so irrelevant. So how does this solve my comment
> from v1?

I'm trying Krzysztof.

The clock controller uses two registers, 0x1004 and 0x100c,
to manage whether a set of clock signals are enabled or not.
(The reset controller uses two adjacent registers, 0x1008
and 0x1010, to manage whether a set of reset signals are
asserted or not.)

You said "no resources except a small address space" and I
guess it's not clear to me what size is "big enough" to
warrant representing something as a separate device.

*One* of the managed clocks is a 25 MHz clock, exposed
through a pin on the SoC.  That one clock signal is
therefore usable by the platform (although on the RB3gen2
it's not used).

Rather than expose the register addresses in the clock
node, a syscon is defined, covering 8 KB, and the actual
offsets used are just defined in the clock and reset
driver source code.

If that's not the right thing to do, please say that.

>>> What's more, I still do not see any usage of these clocks outside. And I
>>> still did not receive actual answers (or I missed them) how these clocks
>>> are routed OUTSIDE of the connector. You said for example:
>>> "Ultimately the TC9564 SoC has a single 25 MHz input clock,"
. . .

>> The single exposed clock *might* justify presenting the
>> clock controller device in devicetree.  There are also
>> resets exposed externally via GPIOs, and these control
>> external entities (PHYs).
> 
> I cannot find any of these exposed. Please point me to DTS code showing
> this.

It is not used by this platform, but is available for other
platforms to use.  Its name is "REFCLKO" and is exposed on
ball C17 of the SoC, if a platform designer decided to use it.

I only mention its existence as a reason to justify defining
the clock as a separate device, but I realize you are arguing
that I should do it somehow differently.

					-Alex

> 
> Best regards,
> Krzysztof

