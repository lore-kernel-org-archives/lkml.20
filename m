Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98C523A0B13
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 16:53:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789059241; cv=none; b=diRZbW4ORxAl+uOuR44XXHCSNQsxmfS/TUXVtOBm7V6Q5Q1nT7Y5LJIUzoFVtyzp6mXkUFVMx2ncP0Gm3RF1XbGueAGBJhIixXXlG3rsg/X+hS2HY8BHYZPUFOjCNxWGFtRm1EsrqTHByyveHMzD+M7wRwFsourXU6quV4lXXsk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789059241; c=relaxed/simple;
	bh=kFXFgOEhKlngjPkjJ1DPF1n2S680Kf5nf8debqxzhDE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oaqNNnu8eJi8eVgaE6omgdesL39Kdd9wxf43Asw+bM3S1hsEfYFwAnOojqv1/R0lkAaljDCDPjntxGCyJIfzYJr3zFp7pJotW8J1v96nl51EuIX3R9SyRjNt+uc4FhvoIq1NtmBFCNO7tslDOlFxKkLhL+T+eko4r1SVZL+gOkI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZkbaOgjG; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZkbaOgjG"
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-cc439bfb2d8so38792a12.2
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 09:53:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789059238; x=1789664038; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EtBz5QzHQc+Th2x67irNYDwYKHrb3yatIwwlwUzsjwc=;
        b=ZkbaOgjGdWglyuAeA/8vTXybXRMKhA7y6BXpNjJvWodKab+dSXbrtTibFgGz7gWHoM
         bxMTi1DXkWGgrnyjZ38f0irfgwpxaxeQyaj6Mc5tJW7jgnWynKTbut75kxEO/nJ1uXbt
         kF5PgUgWU09jdA9gEAbRtmwAH9ECcxL9gSfswknqQqrl5p+U9VeKn9PIBLXZvs5+3NlE
         OnRV5PiFcp/DJEl8bcWdkVYsSZR2L3K1wIBvfV2ni4xDB5OpMD0jJPVPZ+RrheXuj+7K
         tIeF4L2w0vLDkA5lwC2sfG0YJM6sjoe/u8J/ofKLHyzY93uBjhE6X3S89MyDW90UiLCH
         rEfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789059238; x=1789664038;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EtBz5QzHQc+Th2x67irNYDwYKHrb3yatIwwlwUzsjwc=;
        b=cxYZWqbq/6YF3P+BRdr5ZAfbV1bsPrDycHB5oJC1MmDC3qvVhI17misrkRIZqyrNgH
         obNZKRj/KmHzlsJwKq15QWbxKO3Hi75IeIz81UV94oHkuGlPnf7iNNzUGYCGFoWfr/iQ
         s5LKs/iGNLNBpm51o5r4KVi9wLHFsqtSB2NtYuPkXgT4ReE4tw3tS4EDHPHe2M/GA73T
         lARueEtJDOgyx2maCkNdmhJiWUeMDr843QqWFlWOIo/4or0cwOiw422Wq5m2nt05HpTs
         JgvC9ElGK4GF4+66CpcPHlm/gWkc4EkVXR4OZWOQDoGYzxLb7Lj9SUS8A3h8fG1CTt0R
         JIyw==
X-Forwarded-Encrypted: i=1; AKwUvByH/23aZZC7VjF4Qg0+k4jFZuPU8viNf3h+if8mKevOdhk7zsd8Ddx0hIIC9ADEuAqa3xp/huPK6hF/8Bw=@vger.kernel.org
X-Gm-Message-State: AFuF++kjIg974nN91MXZgfnBKcsjShD6ltLIpFs6UDNHZI9uvhJQxDN4
	82N0tVp5KEAOziccMo3yorAdEK3+K7xyQw7uQWNy4HZfgpM4NiJwcXjY
X-Gm-Gg: AYBFou1qQcIIbIHBv8hpuhG29aaYCNYiNc/iNb7+jqHRJeZBXmM5NRTY/JcOpPQrHOT
	9hl87IB96of5wMRVudf5IvNhJE21JOlLTNZiecIP69Dw7M1BmPpee3n9OAQsCvA27SFkBEJ0PSn
	s2x0Ufeu7klGn/rb5/DPCtyIcZkrTJ3wTDtKLrGihImi/ZSq5xyCP3GqouVhJ1GkECde6/cfZ/7
	6I/AL8p/IGJJFUQOvEo0DoKxXK13Q/xlTNROw3DPOs/Os6o6oBaKJNuOnjWDgtisjQwGQDcI/2N
	9KeJPDACBCwnYhySaVOiCs1yzQEMRTEBpqnF0eFErvGvQ4h+Li8B9HjeGSA2c3IiMrb1MMIHbGo
	ruESdpNYaa5uwa32H51UgDW6TAFql52/pnsp8HPH/o1f5KUh8gLDkpEXXk9vmN9TRbWUe5iwOjR
	C5eOyB6qyk0VMEZ7xmQysGosSYDl+Z6C02lRpNH4XoPUdhEoVcj7AtIGTTFW3CuPVDifF9RVKby
	HlvcrCq0bqIpUOEaEvh2M4hyN6dsPUIBPle5j4RQfwt3LPQxanmuf8=
X-Received: by 2002:a05:6a21:1b85:b0:3d3:adbf:7779 with SMTP id adf61e73a8af0-3da3a0af14amr66467142637.21.1789059237749;
        Thu, 10 Sep 2026 09:53:57 -0700 (PDT)
Received: from [172.19.1.47] (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc4c657156bsm10825a12.21.2026.09.10.09.53.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Sep 2026 09:53:57 -0700 (PDT)
Message-ID: <1ae22be2-b72e-4c23-9aff-ef1052a10c45@gmail.com>
Date: Fri, 11 Sep 2026 00:53:52 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] arm64: dts: nuvoton: Add NuMaker board
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Jacky Huang <ychuang3@nuvoton.com>, Shan-Chun Hung <schung@nuvoton.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>,
 Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>,
 Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Steam Lin <STLin2@winbond.com>, linux-arm-kernel@lists.infradead.org,
 openbmc@lists.ozlabs.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260904-perso-ma35d1-upstream-dts-v2-0-30ce255a401f@bootlin.com>
 <20260904-perso-ma35d1-upstream-dts-v2-3-30ce255a401f@bootlin.com>
Content-Language: en-US
From: Jacky Huang <ychuang570808@gmail.com>
In-Reply-To: <20260904-perso-ma35d1-upstream-dts-v2-3-30ce255a401f@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

> Nuvoton MA35D SoC is used on the NuMaker SoM, itself plugged onto a
> carrier board labelled NuMaker. Create a DTS including the SoM
> description. As a first external component, mention the SPI NAND
> connected to the Quad SPI controller.
>
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
>   arch/arm64/boot/dts/nuvoton/Makefile           |  1 +
>   arch/arm64/boot/dts/nuvoton/ma35d1-numaker.dts | 42 ++++++++++++++++++++++++++
>   2 files changed, 43 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/nuvoton/Makefile b/arch/arm64/boot/dts/nuvoton/Makefile
> index 3bc9787801a5..4c82109c885a 100644
> --- a/arch/arm64/boot/dts/nuvoton/Makefile
> +++ b/arch/arm64/boot/dts/nuvoton/Makefile
> @@ -1,4 +1,5 @@
>   # SPDX-License-Identifier: GPL-2.0
>   dtb-$(CONFIG_ARCH_MA35) += ma35d1-iot-512m.dtb
> +dtb-$(CONFIG_ARCH_MA35) += ma35d1-numaker.dtb
>   dtb-$(CONFIG_ARCH_MA35) += ma35d1-som-256m.dtb
>   dtb-$(CONFIG_ARCH_NPCM) += nuvoton-npcm845-evb.dtb
> diff --git a/arch/arm64/boot/dts/nuvoton/ma35d1-numaker.dts b/arch/arm64/boot/dts/nuvoton/ma35d1-numaker.dts
> new file mode 100644
> index 000000000000..16c003998d3b
> --- /dev/null
> +++ b/arch/arm64/boot/dts/nuvoton/ma35d1-numaker.dts
> @@ -0,0 +1,42 @@
> +// SPDX-License-Identifier: GPL-2.0-only OR MIT
> +/*
> + * Copyright (C) 2025 Bootlin
> + * Author: Miquel Raynal <miquel.raynal@bootlin.com>
> + */
> +
> +/dts-v1/;
> +#include "ma35d1-som-256m.dts"
> +
> +/ {
> +       model = "Nuvoton MA35D1 NuMaker";
> +       compatible = "nuvoton,ma35d1-numaker", "nuvoton,ma35d1-som", "nuvoton,ma35d1";
> +};
> +
> +&pinctrl {
> +       spi-grp {
> +               pinctrl_qspi0: qspi0-pins {
> +                       nuvoton,pins = <3 0 5>,
> +                                      <3 1 5>,
> +                                      <3 2 5>,
> +                                      <3 3 5>,
> +                                      <3 4 5>,
> +                                      <3 5 5>;
> +                       bias-disable;
> +                       power-source = <1>;
> +               };
> +       };
> +};
> +
> +&qspi0 {
> +       pinctrl-names = "default";
> +       pinctrl-0 = <&pinctrl_qspi0>;
> +       status = "okay";
> +
> +       flash: flash@0 {
> +               compatible = "spi-nand";
> +               reg = <0>;
> +               spi-max-frequency = <30000000>;
> +               spi-rx-bus-width = <4>;
> +               spi-tx-bus-width = <4>;
> +       };
> +};
>
> --
> 2.54.0
>

Reviewed-by: Jacky Huang <ychuang3@nuvoton.com>

Best regards,
Jacky Huang

