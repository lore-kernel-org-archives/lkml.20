Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A5654EFFCF
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 13:22:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791897779; cv=none; b=WVkQFJyFKK2kgPSQYd2SgEIx8C34Q2Y8QuNbqdZ45khMcrh7ZjN/IQoRe0baef9Hua84DMjhgdndfTaqSPfIRBPlSK+oAZdwC+msUvk+a47yF/NCCFibBNdE/tm6rGICAgmWITIpzVqFa1nGLUCms+XuHUIuXoQn70Yi/DmhBGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791897779; c=relaxed/simple;
	bh=uhSIhGmoiggOyu5C7xZ+k2glq4qhvGgGnyRvKydjFUQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HF3m4q+WhFf3nEzEq2LTPZXX+gaO3do2D0ADQH2UuGHEHWpF7Mk+U17pjqa/VskUV3nYidikwJA1V9ducJk3ZCHpy7ymjUXo50ZfwisfOZ0SdnGR2u/R/jb6+hH2hJ4kfqbX5wae59Wcs0Dqe8QkTb0s2irV1HWbSnIz4dYlsXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=sGs8wk1U; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="sGs8wk1U"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c2dcbcc546fso358026566b.3
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 06:22:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1791897775; x=1792502575; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TuuW3kdXNcytdHjGMm3fy9Aqvv0NclQCEenudQSDAfo=;
        b=sGs8wk1UD89XFGvPLkvDjpCB6jnghw2zxT7UbGpK8MUUekjb1XwXcM2AdF5hJtBuqC
         1lB4jni75y1l73HGP8WcFAfcIAIFXNjCyn6Xm82EL/2aOQ44gXK4rSxxw2dv1eJqt0bL
         VGGwBzOipMq6vjjeQKtodjRmfdkFofQkQuHuJeU3+E7vGfa5oXWBgaJt6bbPv8i6pJye
         gG32C6Qk1YLrIozb2xBpwnKmoDRRNDpa6SD9cEW5DAUgPjlspkja+3/1eydAQ4tAta5O
         SbYASkyUDZg8PiWXDLeHO8UOXmjWUc0pmQ9ccBi2oQchKQZKij2WrbLFG2D/I2VrZR3Q
         hQ3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791897775; x=1792502575;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TuuW3kdXNcytdHjGMm3fy9Aqvv0NclQCEenudQSDAfo=;
        b=HWOvKLuY/++23ySE6m3jR5wCMOYHoAQn9qq5sA9Kva7aV61u7Op4M6JXeeEAx08Af4
         JRcBrc67PWFOmw+VvzXX8rqmp1tEL1YZzz6uUHyG58tFFdspg+kl2OZXJCJkqVc8AeNi
         +UJ1yiTdtiTt+GwXrtuoiVqAg48SsZcm83aptO4gXGVIksYFEc25JCwJ0pNXhjXODPiZ
         Ici8oWG+uf2llrSG2Ilcce/6jSuRpsk1cF647wFRFPG2V00TSDjqOjMzayAhruiKl1+h
         /DE2uDM6nA+junZPizX80rU3ONYl5sA+ugaStzaMGtjeGYzn1M6WrzlNX+XWD4547RcR
         s7LA==
X-Forwarded-Encrypted: i=1; AKwUvBw/qTEZpyGKa/fdYUTajoNyxa5UGvNKhGOxQx9++XPjER7JS1jyQ8bPW6ksxxBf3Sxtf16s64Wi6E3ApBg=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ7nV1j4Vr0JFidq36sqxLiryegX50f5VxM2vXVTI7Xt4rVkK/+
	m/GPW/irImAVrn/hj+OnCjcxsdRwH77fS+PuNjUQWFRkhHzGwLuQ/rfQsNr1DNNkZfw=
X-Gm-Gg: AYBFou3LT7DoCfI0OZQ0FDUQYfc6o0sOs4equqDWT53R6tuH7Epl5Dbm4jK7VcmCmJR
	cWXLAW7dqgRt4uJ1KfIr4z2MmSlUBJlMBm4TaOXXX06cqZ1cZHyjfKF/GEoUSGwsjkf9XuyFIoG
	AiWZEN+isTMqoKN54KysCvWilNLqFm4aWw94j9A4dvumZrW3MrSU6JgsOVArUxGZPUE0PkHuHKl
	Oe0uHHssMpEltSJRnJzO3O8UTA4K7MpRSoBQNI30x+rxcjSpZacZLTEPVBXgfSJkyOgxX8FUxgp
	Dvxa0Xn+f2MaLavJq4Ga8DFy7Qf5CFJRmPh7m/SzVJMhfFWZ14UDGq9x3WmamEn0DWBvqlcK1/k
	EIOm+62+KrpAHvVOcs57xlWMHEYXKRL9O1rBBD0fJ1C7xz531huEOiWsqH90WzU6f0vQpQF+xS0
	J70xuqffKjDNkCx1btvu7wUGNvIU6BFlgM9wW/NELBBpeWEVAfYEdILt0hkI75BsIqzi6cfTQ=
X-Received: by 2002:a17:907:e158:b0:c34:e9fe:82ed with SMTP id a640c23a62f3a-c34e9fe8db4mr377854366b.28.1791897774167;
        Tue, 13 Oct 2026 06:22:54 -0700 (PDT)
Received: from [172.22.22.28] ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c356f981cd3sm201580366b.83.2026.10.13.06.22.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Oct 2026 06:22:53 -0700 (PDT)
Message-ID: <325b8836-61a2-4e1c-98e3-92f0a5177f9d@riscstar.com>
Date: Tue, 13 Oct 2026 08:22:50 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: reset: introduce
 toshiba,tc9564-reset.yaml
To: Conor Dooley <conor@kernel.org>
Cc: p.zabel@pengutronix.de, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, mohd.anwar@oss.qualcomm.com,
 lorenzo.bianconi@oss.qualcomm.com, danielt@kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Daniel Thompson <daniel@riscstar.com>
References: <20261012164354.3872326-1-elder@riscstar.com>
 <20261012164354.3872326-2-elder@riscstar.com>
 <20261012-shale-rosy-805c49f6c404@spud>
 <492396bc-a0f4-4274-9a7c-21fd5fd886b5@riscstar.com>
 <20261012-numerous-flatworm-9e4cfa659541@spud>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20261012-numerous-flatworm-9e4cfa659541@spud>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/12/26 4:22 PM, Conor Dooley wrote:
> On Mon, Oct 12, 2026 at 02:10:01PM -0500, Alex Elder wrote:
>> On 10/12/26 1:51 PM, Conor Dooley wrote:
>>> On Mon, Oct 12, 2026 at 11:43:52AM -0500, Alex Elder wrote:
>>>> Define the binding for the reset controller functionality present in
>>>> the Toshiba TC9564 SoC.
>>>>
>>>> Co-developed-by: Daniel Thompson <daniel@riscstar.com>
>>>> Signed-off-by: Daniel Thompson <daniel@riscstar.com>
>>>> Signed-off-by: Alex Elder <elder@riscstar.com>
>>>> ---
>>>>    .../bindings/reset/toshiba,tc9564-reset.yaml  | 56 +++++++++++++++++++
>>>>    MAINTAINERS                                   |  7 +++
>>>>    include/dt-bindings/reset/toshiba,tc9564.h    | 26 +++++++++
>>>>    3 files changed, 89 insertions(+)
>>>>    create mode 100644 Documentation/devicetree/bindings/reset/toshiba,tc9564-reset.yaml
>>>>    create mode 100644 include/dt-bindings/reset/toshiba,tc9564.h
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/reset/toshiba,tc9564-reset.yaml b/Documentation/devicetree/bindings/reset/toshiba,tc9564-reset.yaml
>>>> new file mode 100644
>>>> index 0000000000000..1908e9539abac
>>>> --- /dev/null
>>>> +++ b/Documentation/devicetree/bindings/reset/toshiba,tc9564-reset.yaml
>>>> @@ -0,0 +1,56 @@
>>>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>>>> +%YAML 1.2
>>>> +---
>>>> +$id: http://devicetree.org/schemas/reset/toshiba,tc9564-reset.yaml#
>>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>>> +
>>>> +title: Toshiba TC9564 Reset Controller
>>>> +
>>>> +maintainers:
>>>> +  - Alex Elder <elder@riscstar.com>
>>>> +  - Daniel Thompson <daniel@riscstar.com>
>>>> +
>>>> +description:
>>>> +  The Toshiba TC9564 is an SoC accessed by a host system through the
>>>> +  upstream PCIe port on the PCIe switch it implements.  The switch
>>>> +  includes an embedded PCIe endpoint that provides access to various
>>>> +  SoC peripherals (including a reset controller) via its BARs.
>>>> +
>>>> +  A total of 13 resets are implemented, though two of these are not
>>>> +  controllable.  Access to the reset controller relies on PCIe being
>>>> +  functional, so the PCIe reset is assumed to be deasserted.  Similarly,
>>>> +  the PCIe controller relies on I2C, so the I2C reset is also assumed
>>>> +  to be deasserted.
>>>> +
>>>> +  Reset ids are defined in <dt-bindings/reset/toshiba,tc9564.h>.
>>>> +
>>>> +  The reset controller uses registers within the same page as a
>>>> +  clock controller, so both devices are defined as children of a
>>>> +  "config" syscon.
>>>> +
>>>> +properties:
>>>> +  compatible:
>>>> +    const: toshiba,tc9564-reset
>>>
>>> Why does this need to exist as a standalone device, rather than be
>>> rolled up into the parent syscon node? It doesn't have any resources, so
>>> it should be doable.
>>
>> This is along the lines of what Krzysztof has mentioned, and it
>> seems clear I must be missing something.
>>
>>> This kind of thing for a syscon is always difficult to review when only
>>> one element is present - where is the rest of the syscon's
>>> functionality?
>>
>> The reason a syscon was used was simply for the benefit of
>> having a shared regmap that the reset, clock, and DWMAC drivers
>> can use.  All three of those drivers use registers that reside
>> within a single page of addressible MMIO space.
> 
> What does the dwmac use the region for? I assume it's for some misc
> register and you don't mean that the dwmac lies within the region?

That's right.  There is one register (per DWMAC--there are two)
that contains one bit (bit 21) that is used to signal that 
initialization of the PMA is done.  We assert reset, set up
clocks, then deassert, and finally wait for this bit to be set.
The DWMAC code uses a phandle property to refer to the syscon,
like:
     toshiba,config-syscon = <&tc9564_config_syscon0 0x1070>

So again, the purpose of the syscon was to get the automatic
regmap for managing the region, which contains registers used
for distinct purposes.

After making the syscon be the parent of both the reset and
clock nodes, I *removed* the "reg" properties and just defined
those offsets in the driver.  Maybe that was a mistake.
> There's nothing inherently wrong with the act of using of a syscon here,
> what I am actually complaining about is how you are using it.
> In cases where a syscon region contains clock and reset, the typical way
> we want people to do this is via something like
> 
> syscon@f00 {
> 	compatible = "toshiba,tc9564-bla-syscon", "syscon", "simple-mfd";
> 	reg = <0x0 0x2000>;
> 	#reset-cells = <1>;
> 	#clock-cells = <1>;
> };

In this case it seems I must create a syscon driver that provides
combined reset and clock functionality.  Is that right?  (This
series is the result of separating the reset code from the clock
code in a combined driver.)

To be honest I don't have a lot of experience with proper use of
syscons.  I have no problem writing or restructuring the code,
it just seems I need help knowing what the final structure should
look like.

> because the child node exists for no other reason than to access linux
> driver probing in the most trivial way. If there's some features that
> actually need a child node, that's fine, but those will end up being
> things with significantly more properties or things with competing
> property use (e.g. if there were devices with buses that need
> address/size cells).

I'm not sure I understand this statement (and that might be part
of the problem).

There are other devices (currently just two DWMACs, plus an
interrupt controller that generates MSIs for each PCI function)
that use the reset and clock signals.  I haven't yet
posted the reworked DWMAC code but I just sent the first version
of the interrupt driver yesterday.
   https://lore.kernel.org/lkml/20261012190245.3988619-1-elder@riscstar.com/

>> And I don't know that I can guarantee their probe order.
> 
> I am assuming this is moot, since I am not objecting to using a syscon?
> 
>> There is otherwise no "system controller" that is treated as
>> a logical entity within the SoC.
>>
>> What is the proper way for me to represent this?  It's fairly
>> simple; and I mainly want to ensure all three of those drivers
>> can safely access their addresses.
> 
> What else does this region actually contain?

At this point I've described everything we now use.  Two
registers control a set of resets; two registers enable and
disable a set of clocks; and two registers each contain a
bit to signal readiness of a DWMAC device.

There are other registers in this region, but at this time
we don't use them.

					-Alex

> 
> Cheers,
> Conor.
> 
>>>> +
>>>> +  "#reset-cells":
>>>> +    const: 1
>>>> +
>>>> +required:
>>>> +  - compatible
>>>> +  - "#reset-cells"
>>>> +
>>>> +unevaluatedProperties: false
>>>> +
>>>> +examples:
>>>> +  - |
>>>> +    #include <dt-bindings/reset/toshiba,tc9564.h>
>>>> +
>>>> +    syscon@0 {
>>>> +        compatible = "syscon", "simple-mfd";
>>>> +        reg = <0x0 0x2000>;
>>>> +
>>>> +        reset {
>>>> +            compatible = "toshiba,tc9564-reset";
>>>> +            #reset-cells = <1>;
>>>> +        };
>>>> +    };
>>>> diff --git a/MAINTAINERS b/MAINTAINERS
>>>> index 252b6d7ee1638..d0eb44079fe17 100644
>>>> --- a/MAINTAINERS
>>>> +++ b/MAINTAINERS
>>>> @@ -28180,6 +28180,13 @@ S:	Maintained
>>>>    F:	Documentation/devicetree/bindings/misc/pci1179,0220.yaml
>>>>    F:	drivers/misc/tc9564-pci.c
>>>> +TOSHIBA TC9564 RESET DRIVER
>>>> +M:	Alex Elder <elder@kernel.org>
>>>> +M:	Daniel Thompson <danielt@kernel.org>
>>>> +S:	Maintained
>>>> +F:	Documentation/devicetree/bindings/reset/toshiba,tc9564-reset.yaml
>>>> +F:	include/dt-bindings/reset/toshiba,tc9564.h
>>>> +
>>>>    TOSHIBA WMI HOTKEYS DRIVER
>>>>    M:	Azael Avalos <coproscefalo@gmail.com>
>>>>    L:	platform-driver-x86@vger.kernel.org
>>>> diff --git a/include/dt-bindings/reset/toshiba,tc9564.h b/include/dt-bindings/reset/toshiba,tc9564.h
>>>> new file mode 100644
>>>> index 0000000000000..5fcc9a06d4ff6
>>>> --- /dev/null
>>>> +++ b/include/dt-bindings/reset/toshiba,tc9564.h
>>>> @@ -0,0 +1,26 @@
>>>> +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
>>>> +
>>>> +/*
>>>> + * Copyright (C) 2026 by RISCstar Solutions Corporation.  All rights reserved.
>>>> + */
>>>> +
>>>> +#ifndef __RESET_TOSHIBA_TC9564_H__
>>>> +#define __RESET_TOSHIBA_TC9564_H__
>>>> +
>>>> +/* Reset IDs */
>>>> +
>>>> +#define RESET_MCU		0
>>>> +#define RESET_MCU1		1
>>>> +#define RESET_MSIGEN		2
>>>> +#define RESET_INTC		3
>>>> +#define RESET_UART		4
>>>> +
>>>> +#define RESET_MAC0_MAC		5
>>>> +#define RESET_MAC0_PMA		6
>>>> +#define RESET_MAC0_XPCS		7
>>>> +
>>>> +#define RESET_MAC1_MAC		8
>>>> +#define RESET_MAC1_PMA		9
>>>> +#define RESET_MAC1_XPCS		10
>>>> +
>>>> +#endif /* __RESET_TOSHIBA_TC9564_H__*/
>>>> -- 
>>>> 2.53.0
>>>>
>>

