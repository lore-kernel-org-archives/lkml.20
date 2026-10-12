Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE19737F320
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 19:10:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791832207; cv=none; b=s8cmfUtUc6eoS1ZqsdfTuETx2r352GoL00lGSQ+HRCSVKtsHhDxPv9oh8zqTXaJ5W39HbEdJFkEXADWFo3a31oM3deYiuLg5K3xACs8wLuAMFU9PR9oeA+MkeIu+3QBlDcwmYS2Vkqryo8qbn14UMfY2/12WtFpiAPgfdmhbUhc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791832207; c=relaxed/simple;
	bh=Xc+nIPxCNGK3pm2Emrcwtq0lB7OBwQuSRMVBRuBakmk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=M64ssHPeCCNU/GkyhUfNd7SkxLXDafhhSPikdy7COLvbgvfFBOwaBntQQvre/V2fxHQTM4RIsF9KQ4PV4pMK5jS/ACTC5LMZgY523+OF1qiOZelrJ5NFL4O2cstmw2YKmuRzLllZ/YJdN3IU5wdev/LhBWJ2tsOi2JDbuu016ew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=Of694zjg; arc=none smtp.client-ip=209.85.219.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="Of694zjg"
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-91b55859245so37936386d6.0
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 12:10:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1791832205; x=1792437005; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bgbVKyxAX/dGkX0f0v/RFrRMhus+JeswTL51hzIEKPs=;
        b=Of694zjgKj2WzzOUYBE65xI7DuXqu12Qtsr+Qwq5a89HnhMY7UbCtUGEJDWV4BD1wi
         vSV1ivigXwBH2p3wm2NnAvmLOsvHSyZcLMmG4Cy6SHoe9nxDOEOtzMiv8mIhL7nBKZOX
         O+ZuiofQuDg5ctl7wWw1XbZXkpnvu7l7s1YRH7A2cxX7O5TuyfSe3Udw4T90QHE8R3Bg
         6TYXgXo3UeRAR6sEGrBvsBUS2UOurt7XIZKWjpjW4AsADa4RbJ4UX3omuX0r6uf5C30+
         /Gt07HgXspBqBV5juL1s65l560CAXrRycDNHD8M1b01ShnEG02JQVrCxqYP1rBuerYth
         AeGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791832205; x=1792437005;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bgbVKyxAX/dGkX0f0v/RFrRMhus+JeswTL51hzIEKPs=;
        b=GLEqIDQWg7Q7glUUOVJ4tdRiBomb5Z1WHZdXkxTkaOLyHhgPcB1CYQfEF09Hx6FjN1
         Yvt5WP/Kr+XYs74a/mN1WfX0u5Y7nq4katnt1CAD61H4ZHKiJbVFlZvcybGisDUaeQPM
         UGaH4Q/JZ9QckzQ7L2qCdp+UHhvmIAlVDjAjJAY3f8SzNKMQfcyQjA0t/9Vont00A/kT
         GihAxzetop1Wi7Syr9KYTSOORKIfk4a3Ohz9LAdFA/dC7GxdD3Zp6YaKAYzoha3gMbG3
         CDxGWGQX4JxTObYs9Lk/fEXi8oHmNhnsERnVhw7RRE1oyIjc6WEBI75GWjNvPGeMwqVJ
         hFEQ==
X-Forwarded-Encrypted: i=1; AKwUvBwY+cLXETNLzqY6ul1/F6z/NvXb4ODqp7L3OzZH9+wv8bhl/KNS9p/laAPFCP3+2juICIWhbcOR5dIZGsM=@vger.kernel.org
X-Gm-Message-State: AFq9FYJCQ45tW1ncTpgSp/aYFELeRO4JfDn4Dr7owY5ZZErymSTEjXjd
	EL7nqJ+SI385+biI7THZ0z8ViIuKZvOc5JWMy+fepSaEbvlRiBCkVHBX3rY8jDklsCg=
X-Gm-Gg: AYBFou1atnoIi6dWvX5/n6cmjgxzXbHc0sc/uoRiKw1AYv3gIzx9YHd7rw4Q3kLJGz1
	pJ3RIVC5NBQTyjlwgKQjFTnhx/fDMKw2izbEBjc1GSoIzftX/IWz2affB68Az4ObgSe0hFhgJRz
	4AadKPX//eGjfk4MFEmTf7GDS6RgOU6w+yC58lZzZl/kc0S7ZgPVOFhEwLOnqKAYIJ41GKVBUty
	kxXUHSqUzCg9CtUwFIka8R9xRSVeRuk/+VCPZWOO606pBvGz8MEqs5KsTV9M8teEO946BlHohNs
	jnHLcQ8SIlpXgaUpv6wNdmwIUxN2KZgt4tqOP1OybwfmwHioxS1/z11zCHqTVQ9yzQZCsH82GOs
	BVaq4DMODraJzq9nW/GqwThw9MT6GYfoBpUfU1RFpQhckD0p5X/07h4wTNyZTzld1hUjl8MWHjF
	hGcBgtVJFbv0HEY6SAkHw/PNU4VSsV49qI426IaHA1/9qArdWxS5E2B7XlHM3LiFP/W9E9iLE=
X-Received: by 2002:a05:6214:2b8b:b0:917:924a:d4eb with SMTP id 6a1803df08f44-91b55575e40mr180379896d6.36.1791832204691;
        Mon, 12 Oct 2026 12:10:04 -0700 (PDT)
Received: from [172.22.22.28] ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91b97bce2b8sm5092196d6.37.2026.10.12.12.10.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Oct 2026 12:10:03 -0700 (PDT)
Message-ID: <492396bc-a0f4-4274-9a7c-21fd5fd886b5@riscstar.com>
Date: Mon, 12 Oct 2026 14:10:01 -0500
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
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20261012-shale-rosy-805c49f6c404@spud>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/12/26 1:51 PM, Conor Dooley wrote:
> On Mon, Oct 12, 2026 at 11:43:52AM -0500, Alex Elder wrote:
>> Define the binding for the reset controller functionality present in
>> the Toshiba TC9564 SoC.
>>
>> Co-developed-by: Daniel Thompson <daniel@riscstar.com>
>> Signed-off-by: Daniel Thompson <daniel@riscstar.com>
>> Signed-off-by: Alex Elder <elder@riscstar.com>
>> ---
>>   .../bindings/reset/toshiba,tc9564-reset.yaml  | 56 +++++++++++++++++++
>>   MAINTAINERS                                   |  7 +++
>>   include/dt-bindings/reset/toshiba,tc9564.h    | 26 +++++++++
>>   3 files changed, 89 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/reset/toshiba,tc9564-reset.yaml
>>   create mode 100644 include/dt-bindings/reset/toshiba,tc9564.h
>>
>> diff --git a/Documentation/devicetree/bindings/reset/toshiba,tc9564-reset.yaml b/Documentation/devicetree/bindings/reset/toshiba,tc9564-reset.yaml
>> new file mode 100644
>> index 0000000000000..1908e9539abac
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/reset/toshiba,tc9564-reset.yaml
>> @@ -0,0 +1,56 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/reset/toshiba,tc9564-reset.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Toshiba TC9564 Reset Controller
>> +
>> +maintainers:
>> +  - Alex Elder <elder@riscstar.com>
>> +  - Daniel Thompson <daniel@riscstar.com>
>> +
>> +description:
>> +  The Toshiba TC9564 is an SoC accessed by a host system through the
>> +  upstream PCIe port on the PCIe switch it implements.  The switch
>> +  includes an embedded PCIe endpoint that provides access to various
>> +  SoC peripherals (including a reset controller) via its BARs.
>> +
>> +  A total of 13 resets are implemented, though two of these are not
>> +  controllable.  Access to the reset controller relies on PCIe being
>> +  functional, so the PCIe reset is assumed to be deasserted.  Similarly,
>> +  the PCIe controller relies on I2C, so the I2C reset is also assumed
>> +  to be deasserted.
>> +
>> +  Reset ids are defined in <dt-bindings/reset/toshiba,tc9564.h>.
>> +
>> +  The reset controller uses registers within the same page as a
>> +  clock controller, so both devices are defined as children of a
>> +  "config" syscon.
>> +
>> +properties:
>> +  compatible:
>> +    const: toshiba,tc9564-reset
> 
> Why does this need to exist as a standalone device, rather than be
> rolled up into the parent syscon node? It doesn't have any resources, so
> it should be doable.

This is along the lines of what Krzysztof has mentioned, and it
seems clear I must be missing something.

> This kind of thing for a syscon is always difficult to review when only
> one element is present - where is the rest of the syscon's
> functionality?

The reason a syscon was used was simply for the benefit of
having a shared regmap that the reset, clock, and DWMAC drivers
can use.  All three of those drivers use registers that reside
within a single page of addressible MMIO space.  And I don't
know that I can guarantee their probe order.

There is otherwise no "system controller" that is treated as
a logical entity within the SoC.

What is the proper way for me to represent this?  It's fairly
simple; and I mainly want to ensure all three of those drivers
can safely access their addresses.

Thanks.

					-Alex


> Thanks,
> Conor.
> 
>> +
>> +  "#reset-cells":
>> +    const: 1
>> +
>> +required:
>> +  - compatible
>> +  - "#reset-cells"
>> +
>> +unevaluatedProperties: false
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/reset/toshiba,tc9564.h>
>> +
>> +    syscon@0 {
>> +        compatible = "syscon", "simple-mfd";
>> +        reg = <0x0 0x2000>;
>> +
>> +        reset {
>> +            compatible = "toshiba,tc9564-reset";
>> +            #reset-cells = <1>;
>> +        };
>> +    };
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index 252b6d7ee1638..d0eb44079fe17 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -28180,6 +28180,13 @@ S:	Maintained
>>   F:	Documentation/devicetree/bindings/misc/pci1179,0220.yaml
>>   F:	drivers/misc/tc9564-pci.c
>>   
>> +TOSHIBA TC9564 RESET DRIVER
>> +M:	Alex Elder <elder@kernel.org>
>> +M:	Daniel Thompson <danielt@kernel.org>
>> +S:	Maintained
>> +F:	Documentation/devicetree/bindings/reset/toshiba,tc9564-reset.yaml
>> +F:	include/dt-bindings/reset/toshiba,tc9564.h
>> +
>>   TOSHIBA WMI HOTKEYS DRIVER
>>   M:	Azael Avalos <coproscefalo@gmail.com>
>>   L:	platform-driver-x86@vger.kernel.org
>> diff --git a/include/dt-bindings/reset/toshiba,tc9564.h b/include/dt-bindings/reset/toshiba,tc9564.h
>> new file mode 100644
>> index 0000000000000..5fcc9a06d4ff6
>> --- /dev/null
>> +++ b/include/dt-bindings/reset/toshiba,tc9564.h
>> @@ -0,0 +1,26 @@
>> +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
>> +
>> +/*
>> + * Copyright (C) 2026 by RISCstar Solutions Corporation.  All rights reserved.
>> + */
>> +
>> +#ifndef __RESET_TOSHIBA_TC9564_H__
>> +#define __RESET_TOSHIBA_TC9564_H__
>> +
>> +/* Reset IDs */
>> +
>> +#define RESET_MCU		0
>> +#define RESET_MCU1		1
>> +#define RESET_MSIGEN		2
>> +#define RESET_INTC		3
>> +#define RESET_UART		4
>> +
>> +#define RESET_MAC0_MAC		5
>> +#define RESET_MAC0_PMA		6
>> +#define RESET_MAC0_XPCS		7
>> +
>> +#define RESET_MAC1_MAC		8
>> +#define RESET_MAC1_PMA		9
>> +#define RESET_MAC1_XPCS		10
>> +
>> +#endif /* __RESET_TOSHIBA_TC9564_H__*/
>> -- 
>> 2.53.0
>>

