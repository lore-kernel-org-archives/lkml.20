Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69C0D4D90D5
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 13:44:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791553454; cv=none; b=mNLrRm6U52Sq+c+0OqxnsExLfHQeddHZtqbs0IdChqZDaYbjfXCUXLN9Gg5gAOrpRgLI/IjhndNGHqBVW2hucEXHighdAEcXiNRtXIYRMm2pnCl1D652Q3lWCLlqLHLKDRO4pAaMBnjv6gxCJBkzsIz0f7TfugaskTwfuhJSxi8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791553454; c=relaxed/simple;
	bh=BakjqIoUF2dlef5BwvpXbTZHoWoCLddCRgN7G2pQUKA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aGsLmZ5+z4YvCZzKFgZfsFJOz7njB7sJrPx7przoE3vTfNRjwuxrQl+cCYovGBoNQjULJaPQ4rIwk7mOdemF0DaAhTXE4j0IIyY8ImWDk3QBrsvrCcMHaISNx8H45M+knASYeXsWGmQJX5GnWN7Ora3wJXoqKe9F3L27Xt6YE9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=NM128vmt; arc=none smtp.client-ip=209.85.222.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="NM128vmt"
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-93cb9e9405fso356471885a.2
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 06:44:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1791553449; x=1792158249; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=I7JSMLmgxrZlpqG/1fBPvESDCwzbPNyS4PWiTgAV+mk=;
        b=NM128vmtYZsNkuTAyqbbdNzjYltyli/mQ66sV3uQm+BMt8wsMu0lkcbU3vz9mI0V8l
         rWhQjXX5ubizmWMrME5eiuVeRB92a3HWlrjBrdXqB1axHX1gBref6Zb1LoiZbUZ8RNxU
         Khbr0giwvH4y5pSkx6gRiQ5kxuZS7AQ0pbSdquFdcoelLNx0KAhXs8VxSZ1piN+OBOha
         BDe/pix7Lba50Fnz76scWX7gpmJJ9ALw1DBZZLwm3zi4ghUBEGNqUSiQAdZBQOGvQPbR
         6Znd40ETi7hYB+Pakth0jnpygI6LMmcNf2hRojlCpGG905YQkC9/SJXy2deAOnjcEaKd
         B5VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791553449; x=1792158249;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=I7JSMLmgxrZlpqG/1fBPvESDCwzbPNyS4PWiTgAV+mk=;
        b=2shKlYUFQb8eMHfDHauKnrFKJs37BcI75o6+P+VZ38SygAd1IEwzKYXNNjGsdE3Gs8
         k92U9oUl601hQU85GmJnJrp/GEBONM1+fq12OGmHJy1BHbXrRntC1PaV/SGPc5p5wZd1
         CLFuEmOC1IBGoAWEW5mcQr/4SYC3SP9D6PiUWAWJozi9ZCGMMlGeO5JKjS8qTa4aojL8
         XyjArVPdNG791z0ezkHNqbof1Ple3tIuYQHiApAOn7PnUqYPHv8B2WGv/X/MCS0wnF9H
         5/wkrNj92f4vsbJpNdqXWk9fWH1AHyty/4dAQwnDMYuWfakm8aXHcNbTFqe75n7L+agx
         yGKQ==
X-Forwarded-Encrypted: i=1; AKwUvBwKyA4VkGhoRLNOGEqsBsNxosFXpuSqem2dPoBLalJ/Jx4zCshGnCe9O/I5mI2EQ/YwVh+MHcqxCa7NFZE=@vger.kernel.org
X-Gm-Message-State: AFq9FYLgrOxDGwkKsuV/kJlJ13Y2FMEx1KkWkd8F9kLDExtX0a00EepJ
	j7Wi5iLMmAc1y4xN4SjWJFR6MAbqLCXxY9bOPkKwY5zytFYF+SGVrW+1ld/N1DiqU98=
X-Gm-Gg: AYBFou2B96GTG8q09IpMOS0e6qSGE3PhEq4Fn+YPCBmewc21aubXlX59NpPliSpyxwY
	xpJaY9+1Rugp2y8WQVwANyGH0ymfAKmXhz+4Nfy8V1Fc5XVAVsyvL5KvIkfTeKBLD6YDYh+tc9E
	AuRxNSu6dqPf1fj5JUUDrynUmxI6aJAAGS8VreMstJI5xlvZsBhlrpTVl+wmd+/a0tdAfCXP5gv
	2LtIo+sF2JRUoA5wMzl8XnodMMfQXUX6j12rVPOpzWfG4qMHVDhzQT2fL/c6ndI3SIScJBDR0vs
	4ihLO1DNj2GIRukfQ5TsH5emTwtwxnfx20Z/bFTdgKuT3FDkY5HN6C/ZlM43RhuBwrb+WThKsVP
	aR0vRSh4DinyyzmxXIjmE6uZdUBZecQ3fFoVgshyhfnEwpCR/0B6v2GzK5Y3qy/i6YsccC72vpV
	cqS00kv7adu6mZYyt5ZRhMLw5TPRc4W8qamxeLGaX3eEMdU5kOytnkWuXFm3MJXIJOdvscMzo=
X-Received: by 2002:a05:620a:8018:b0:93e:7ddb:5098 with SMTP id af79cd13be357-93ebd21138fmr276133285a.25.1791553449022;
        Fri, 09 Oct 2026 06:44:09 -0700 (PDT)
Received: from [172.22.22.28] ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93eb98cd599sm186678485a.39.2026.10.09.06.44.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Oct 2026 06:44:07 -0700 (PDT)
Message-ID: <b190fe58-364b-4b94-9cab-c5f81f874289@riscstar.com>
Date: Fri, 9 Oct 2026 08:44:05 -0500
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
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20261009-gifted-stylish-tortoise-95b14d@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/9/26 4:31 AM, Krzysztof Kozlowski wrote:
> On Mon, Oct 05, 2026 at 06:09:24PM -0500, Alex Elder wrote:
>> Define the binding for the clock controller functionality present in
>> the Toshiba TC9564 SoC.
>>
>> Co-developed-by: Daniel Thompson <daniel@riscstar.com>
>> Signed-off-by: Daniel Thompson <daniel@riscstar.com>
>> Signed-off-by: Alex Elder <elder@riscstar.com>

I'm just about to send version 3 of this series (and
then a new reset series derived from the code that was
previously combined with the clock code).  Some things
related to what you mention have changed.  I show that
below, but also respond to your other comments, and try
to advocate for the approach used.
>> ---
>> v2: - Only define clock information, not reset information
>>      - Reworded description to avoid talking about software
>>      - Clock IDs are now consecutive (no more commented-out values)
>>
>>   .../bindings/clock/toshiba,tc9564-clock.yaml  | 54 +++++++++++++++++++
>>   MAINTAINERS                                   |  7 +++
>>   include/dt-bindings/clock/toshiba,tc9564.h    | 34 ++++++++++++
>>   3 files changed, 95 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/clock/toshiba,tc9564-clock.yaml
>>   create mode 100644 include/dt-bindings/clock/toshiba,tc9564.h
>>
>> diff --git a/Documentation/devicetree/bindings/clock/toshiba,tc9564-clock.yaml b/Documentation/devicetree/bindings/clock/toshiba,tc9564-clock.yaml
>> new file mode 100644
>> index 0000000000000..329b8f002cf2d
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/clock/toshiba,tc9564-clock.yaml
>> @@ -0,0 +1,54 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/clock/toshiba,tc9564-clock.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Toshiba TC9564 Clock Controller
>> +
>> +maintainers:
>> +  - Alex Elder <elder@riscstar.com>
>> +  - Daniel Thompson <daniel@riscstar.com>
>> +
>> +description:
>> +  The Toshiba TC9564 is an SoC accessed by a host system through the
>> +  upstream PCIe port on the PCIe switch it implements.  The switch
>> +  includes an embedded PCIe endpoint that provides access to various
>> +  SoC peripherals (including a clock controller) via its BARs.
>> +
>> +  A total of 21 clocks are implemented, though two of these are not
>> +  controllable.  Access to the clock controller relies on PCIe being
>> +  functional, so the PCIe clock is assumed to be always on.  Similarly,
>> +  the PCIe controller relies on I2C, so the I2C clock is also assumed
>> +  to be always on.
>> +
>> +  Clock ids are defined in <dt-bindings/clock/toshiba,tc9564.h>.
>> +
>> +properties:
>> +  compatible:
>> +    const: toshiba,tc9564-clock
>> +
>> +  toshiba,config-syscon:
>> +    $ref: /schemas/types.yaml#/definitions/phandle
>> +    description:
>> +      Phandle for the configuration space system controller.
> 
> I do not see my previous comment addressed - you have no resources here,
> so this belongs to the parent. You responded something about pci-ep, but
> the parent is not pci-ep. Open your code:
> https://lore.kernel.org/lkml/20260918165234.687224-5-elder@riscstar.com/
> 
> I clearly see code like:
>    syscon {
>      clock@ {
>      };
>    };
> 
> so I do not understand what pci-ep has anything to do here.

What I have now (about to send) looks like this:

     syscon@0 {
         compatible = "syscon", "simple-mfd";
         reg = <0x0 0x2000>;

         clock {
             compatible = "toshiba,tc9564-clock";
             #clock-cells = <1>;
         };
     };

A reset node will also go inside the syscon, so there is another
function for that MFD.

The regmap belongs to the parent, and is looked up this way:

     regmap = syscon_node_to_regmap(dev_of_node(dev->parent));

> What's more, I still do not see any usage of these clocks outside. And I
> still did not receive actual answers (or I missed them) how these clocks
> are routed OUTSIDE of the connector. You said for example:
> "Ultimately the TC9564 SoC has a single 25 MHz input clock,"
> 
> but that is input. I did not ask how this device receives clocks. I
> asked how the host receives the clocks from this device.

I was explaining that the clock input gets split into a number
of "output" clocks derived from that one input.  However you're
right, almost all of these clocks are connected to blocks
internal to the SoC.  There is only one 25 MHz clock that is
exposed externally (CLOCK_REFCLKO).

I think your point (or one of them) is that, even if pci-ep-bus
is used, the only things that warrant being described with
devicetree are those that can affect things outside the chip.
Everything else is not really variable from the perspective of
the platform, and inner details can be determined (and controlled)
by software.


Our original version of this code incorporated clock and reset
control inside the networking driver.  Rob commented that the
DWMAC driver should bind to the PCI functions and "everything
else...should be under the PCIe switch upstream node in a
pci-ep.bus".

The only driver associated with the switch inside the TC9564
is the special power control driver, accessed via I2C.  The
PCI switch functionality is otherwise provided without any
special handling, or is handled by generic code.

What *is* available is the PCI endpoint functions and their
BARs, so the endpoint buses use those.

PCI endpoint bus makes available things that devicetree
does that are very useful (including a standard way of
describing connections between blocks in the SoC).


I know that doesn't address the "exposed clocks" issue,
but it provides some background on why things were done
the way they were.


The single exposed clock *might* justify presenting the
clock controller device in devicetree.  There are also
resets exposed externally via GPIOs, and these control
external entities (PHYs).

But I'll reiterate how *nice* it is to use devicetree to
model the inner structure and of this SoC and the connections
between its various parts.  The DWMAC device driver can use
standard Linux clock (and reset, etc.) interfaces to manage
them--as if they were provided externally, or as if they
*could* be provided by something outside the TC9564.

There was no need to implement "unrelated" clock driver code
inside the DWMAC driver.  Granted, enabling/disabling the
clocks amounts to trivial register updates.  But supporting
two separate PCI functions that share access to those clocks
requires adding reference counting logic for every clock,
and it's just a lot nicer to benefit from the core Linux
code that already does that very well.


This is part of why I asked about the use of devicetree
overlays.  Can devicetree be used to describe an SoC (as
if it were an attached board)?  Would separating the DTS
portion into an overlay make this more palatable?


(Is this what the RPi RP1 does?)
>> +
>> +  "#clock-cells":
>> +    const: 1
>> +
>> +required:
>> +  - compatible
>> +  - toshiba,config-syscon
>> +  - "#clock-cells"
>> +
>> +unevaluatedProperties: false
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/clock/toshiba,tc9564.h>
> 
> Looks unused.

You're right, it's unused in the example.  I'll remove this.


> 
>> +
>> +    clock {
> 
> Anyway, if this stays, that's a clock-controller.

OK.  I'm still going to send version 3 shortly.

					-Alex

> 
> Best regards,
> Krzysztof

