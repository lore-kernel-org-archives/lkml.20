Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C5E54E2F28;
	Fri, 16 Oct 2026 14:31:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792161106; cv=none; b=AEbkLUSoCyCW7f9L5cAERg47a7esUGjlo64H80HFJxO1KgyZMYFDKqX7SepBf6jubfzQtGHiajsYYGxMdEwQtxY4Wo+fqX7fDkknISCRLHA9rEFMo1LQ7aPZDR/RkeDr78I2mRJJi8/Kz/IJ5c85/K/DUoSNZKX24YaIPQh6E5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792161106; c=relaxed/simple;
	bh=dt+a4a6W70jAxDMgMbHMH1fPbQ/npH5no4bHOhmOJ1Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tKy1JmXNEnA4cuQkopgP+EI7cEKY7+V4LSdHhuNabcqktEiS+8XX6vjcyJbG8GsnnNMzoDcbxxBjkz/o7CxS/o3DfXWhIVvePo0kD92q/SFYr+8R2KwfMnh/zWeDfYAPf9GG/eGC0VGtcCwD9gabNtM7lgKTdURxfBQR1PIqw24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JUGTEosA; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JUGTEosA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792161104; x=1823697104;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=dt+a4a6W70jAxDMgMbHMH1fPbQ/npH5no4bHOhmOJ1Q=;
  b=JUGTEosAmxx1iscke4UCmFU4HmpA/Suto0zJ1tOwo/4qPhqleprS1Mlp
   K5ZMHPVhbntquFS2gdaia8M9nfsngwJQ1FfYH9QKRP3nLe+z8SHu8DJFX
   U9S/wGF1v16Biq74EdEcQ5nA9XsAGnrcv9MJG3ALHaogP64x5rQv+Ex8s
   BIHJid+0I9wP4AVriqW8CGioW/oO15E0IhDlpks5T8Zvq6eQwNYr6yXrA
   t324Ob5jpGjm9mqP3fMe9CDLO3Bw74MXtvAUcdg+7g5zVM+nn9cTp+C/j
   oo1jyslsrdal9E9a2teAivgcOF2YTfT/4veEW66dmYUv+B5nw4O2wglv0
   Q==;
X-CSE-ConnectionGUID: z+BscdiTSV6eyvG6uChHIA==
X-CSE-MsgGUID: JJc683/TQ96eSgHjji01FA==
X-IronPort-AV: E=McAfee;i="6800,10657,11936"; a="950265"
X-IronPort-AV: E=Sophos;i="6.27,161,1787036400"; 
   d="scan'208";a="950265"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2026 07:31:43 -0700
X-CSE-ConnectionGUID: mRWJKeS1S0+qnz5vjEKOLw==
X-CSE-MsgGUID: 52fbFazJTpmxta21tS5qsw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,161,1787036400"; 
   d="scan'208";a="1954568"
Received: from dawidgla-mobl.ger.corp.intel.com (HELO [10.94.249.157]) ([10.94.249.157])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2026 07:31:41 -0700
Message-ID: <f7c98fbe-2880-4769-bf09-53134cdfc63d@linux.intel.com>
Date: Fri, 16 Oct 2026 16:31:33 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] ARM: dts: aspeed: add Intel AVCRP BMC
To: Tan Siewert <tan.siewert@9elements.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 maciej.lawniczak@intel.com
References: <cover.1791825961.git.dawid.glazik@linux.intel.com>
 <12f8124fea31a6c6b1401d6aee640842c8d896a7.1791825961.git.dawid.glazik@linux.intel.com>
 <7d703c43-e462-41d6-a488-87342fd139a2@9elements.com>
Content-Language: en-US
From: Dawid Glazik <dawid.glazik@linux.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <7d703c43-e462-41d6-a488-87342fd139a2@9elements.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 10/12/2026 7:19 PM, Tan Siewert wrote:
> On 10/12/26 7:39 PM, Dawid Glazik wrote:
>> Add the initial AST2600 device tree for the Intel AVCRP BMC platform.
>>
>> Signed-off-by: Dawid Glazik <dawid.glazik@linux.intel.com>
> 
> You got Review trailers from Andrew Lunn in v1. Unless you think Andrew 
> has to re-review it (which should be then reasoned), please keep them in 
> new revisions.
> 
>  From the kernel docs [0]:
> 
> "Both Tested-by and Reviewed-by tags, once received on mailing list from 
> tester or reviewer, should be added by author to the applicable patches 
> when sending next versions. However if the patch has changed 
> substantially in following version, these tags might not be applicable 
> anymore and thus should be removed. Usually removal of someone’s Acked- 
> by, Tested-by or Reviewed-by tags should be mentioned in the patch 
> changelog with an explanation (after the ‘---’ separator)."
> 
>> ---
>> v2:
>>   - Replace bootargs console=ttyS4,115200n8 with stdout-path = &uart5
>>   - Remove the unreferenced video_memory reserved-memory node
>> ---
>>   arch/arm/boot/dts/aspeed/Makefile             |   1 +
>>   .../dts/aspeed/aspeed-bmc-intel-avcrp.dts     | 315 ++++++++++++++++++
>>   2 files changed, 316 insertions(+)
>>   create mode 100644 arch/arm/boot/dts/aspeed/aspeed-bmc-intel-avcrp.dts
>>
>> diff --git a/arch/arm/boot/dts/aspeed/Makefile b/arch/arm/boot/dts/ 
>> aspeed/Makefile
>> index 767f7c7652d5..ea4645ef9872 100644
>> --- a/arch/arm/boot/dts/aspeed/Makefile
>> +++ b/arch/arm/boot/dts/aspeed/Makefile
>> @@ -54,6 +54,7 @@ dtb-$(CONFIG_ARCH_ASPEED) += \
>>       aspeed-bmc-ibm-rainier-4u.dtb \
>>       aspeed-bmc-ibm-sbp1.dtb \
>>       aspeed-bmc-ibm-system1.dtb \
>> +    aspeed-bmc-intel-avcrp.dtb \
>>       aspeed-bmc-intel-s2600wf.dtb \
>>       aspeed-bmc-inspur-fp5280g2.dtb \
>>       aspeed-bmc-inspur-nf5280m6.dtb \
>> diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-intel-avcrp.dts b/ 
>> arch/arm/boot/dts/aspeed/aspeed-bmc-intel-avcrp.dts
>> new file mode 100644
>> index 000000000000..7c088c89d417
>> --- /dev/null
>> +++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-intel-avcrp.dts
>> @@ -0,0 +1,315 @@
>> +// SPDX-License-Identifier: GPL-2.0-or-later
>> +// Copyright 2026 Intel Corporation
>> +
>> +/dts-v1/;
>> +
>> +#include "aspeed-g6.dtsi"
>> +#include <dt-bindings/gpio/aspeed-gpio.h>
>> +
>> +/ {
>> +    model = "Intel AVCRP BMC";
>> +    compatible = "intel,avcrp-bmc", "aspeed,ast2600";
>> +
>> +    aliases {
>> +        serial4 = &uart5;
>> +    };
>> +
>> +    chosen {
>> +        stdout-path = &uart5;
>> +        bootargs = "earlycon";
>> +    };
>> +
>> +    memory@80000000 {
>> +        device_type = "memory";
>> +        reg = <0x80000000 0x40000000>;
>> +    };
>> +
>> +    reserved-memory {
>> +        #address-cells = <1>;
>> +        #size-cells = <1>;
>> +        ranges;
>> +
>> +        video_engine_memory: jpegbuffer {
>> +            size = <0x02000000>; /* 32M */
>> +            alignment = <0x01000000>;
>> +            compatible = "shared-dma-pool";
>> +            reusable;
>> +        };
>> +    };
>> +
>> +};
>> +
>> +&rtc {
>> +    status = "okay";
>> +};
> 
> Please sort your nodes, as described in the device tree design guideline 
> [1]. There's also a tool called `scripts/dtc/dt-check-style` that can 
> help with this.
> Note on that: we usually run `--mode strict` but it is known to report 
> false-positives, so please check any reported errors twice ^^
> 
>> +
>> +&fmc {
>> +    status = "okay";
>> +    flash@0 {
>> +        status = "okay";
>> +        m25p,fast-read;
>> +        label = "bmc";
>> +        spi-rx-bus-width = <4>;
>> +        spi-max-frequency = <50000000>;
>> +#include "openbmc-flash-layout-64.dtsi"
>> +    };
>> +};
>> +
>> +&uart1 {
>> +    status = "okay";
>> +};
>> +
>> +&uart3 {
>> +    status = "okay";
>> +};
>> +
>> +&uart4 {
>> +    status = "okay";
>> +};
>> +
>> +&uart5 {
>> +    status = "okay";
>> +};
>> +
>> +&uart_routing {
>> +    status = "okay";
>> +};
>> +
>> +&mdio1 {
>> +    status = "okay";
>> +
>> +    ethphy1: ethernet-phy@0 {
>> +        compatible = "ethernet-phy-id001c.c916";
>> +        reg = <0>;
>> +        reset-gpios = <&gpio0 ASPEED_GPIO(C, 1) GPIO_ACTIVE_LOW>;
>> +        reset-assert-us = <10000>;
>> +        reset-deassert-us = <50000>;
>> +    };
>> +};
>> +
>> +&mac1 {
>> +    status = "okay";
>> +    pinctrl-names = "default";
>> +    pinctrl-0 = <&pinctrl_rgmii2_default>;
>> +    clocks = <&syscon ASPEED_CLK_GATE_MAC2CLK>,
>> +         <&syscon ASPEED_CLK_MAC2RCLK>;
>> +    clock-names = "MACCLK", "RCLK";
>> +    phy-mode = "rgmii-id";
>> +    phy-handle = <&ethphy1>;
>> +};
>> +
>> +&lpc {
>> +    lpc_snoop: lpc-snoop@80 {
>> +        snoop-ports = <0x80>;
>> +        status = "okay";
>> +    };
> 
> Why's this named if you don't use it as reference anywhere.
> 
>> +};
>> +
>> +&i3c_global {
>> +    status = "okay";
>> +};
> 
> That's enabled by default.
> 
>> +
>> +&vhub {
>> +    status = "okay";
>> +};
>> +
>> +&video {
>> +    status = "okay";
>> +    memory-region = <&video_engine_memory>;
>> +};
>> +
>> +&gpio0 {
>> +    gpio-line-names =
>> +        /*A0-A7*/ "", "", "", "", "SMB_CPU_PIROM_SCL", 
>> "SMB_CPU_PIROM_SDA",
>> +                "SMB_IPMB_STBY_LVC3_SCL", "SMB_IPMB_STBY_LVC3_SDA",
>> +        /*B0-B7*/ "", "", "", "FM_CPU1_ERR2_LVT3_N",
>> +                "RGMII_BMC_RMM4_LVC3_R_MDC", 
>> "RGMII_BMC_RMM4_LVC3_R_MDIO",
> 
> Why do you name reserved GPIO lines (in this case the RGMII lines)? 
> They're used by the kernel anyways.
> 
> Tan
> 
> [0] https://docs.kernel.org/process/submitting-patches.html#using- 
> reported-by-tested-by-reviewed-by-suggested-by-and-fixes
> [1] https://docs.kernel.org/devicetree/bindings/dts-coding-style.html
Hi Tan,

Thanks for the instructions. I'll implement them in the new revision

Dawid
