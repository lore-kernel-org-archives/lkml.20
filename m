Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13F2C47ECD8
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 17:19:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791825561; cv=none; b=DMHqnkrItaAPtnG8owkss/yNkrLO+6PppWVqNWSbSePqoeyLGnoMHARot7vx/D29uK+Y/Kq0TWdtajBm6VQA2Yox43XwZPsURzljDDSThzZP355k6DNwlVrN2r+4S/1YBELBERgY+qKF2+6hQAm4jNs/oWCleYklikGvx01FM34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791825561; c=relaxed/simple;
	bh=xuHYOzqVDPF+T7DHJcXAkuDGTk5erdnYgh1uJDWbuqk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Nxr1bljARgn3Ycaw6fcZeIxhiCWLRx/MKCJZvZ5HuPKvxYzCZ0iDyK+1MBhboqc3M7txvcTgQVK12lIWu5kN/EEzvg8CynuAzaupiUTQdoe2nYucKmn5fnUUasw2LmVeXRL8ZXDE11O0cjamQyf/PKrOhxEHojLNtRUSLxzbC2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com; spf=pass smtp.mailfrom=9elements.com; dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b=LdK4pH6I; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=9elements.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b="LdK4pH6I"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-48afe75f055so1977038f8f.2
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 10:19:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1791825557; x=1792430357; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fmWhe9edetnI1XYoSUk/a0gFm8QWgHCjQdahFD9uVho=;
        b=LdK4pH6I7Yzumf0mZ0A5q3/1aTQbSY3iQrtBa8521viG++vQ/VWcqERrE+sONb43VD
         u6kCbJNWDq0xyqEzcW0r2mXCiPK6v7XEzWHwWULHKhr//sIc/42pN6YaTCkMrUCUwpqa
         h0BVBRkjmtls3MnGTX9Qz08ohbt6iHZLFnqw59MRS22ZP6T3AMkAU8wVG6jbJSEjkxlP
         KF3rhp+hpbzU2kICW6lYD11H07IbVdQ0rkpnKv3P9+KIs1z8JU1/Bpg3D1ctSIciLG9h
         xwsk8PIUForfICivt1utvl9/M3acpwm5C0CgtIxWai9eTuKRVWSFBh1bur+XJGFUoPZL
         tWDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791825557; x=1792430357;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fmWhe9edetnI1XYoSUk/a0gFm8QWgHCjQdahFD9uVho=;
        b=yNoIs3Aakv1BCfMOcv+aHEzydqpPUdpcUfFlsZsbzrqx2P6hGeEi+xOSCd70r0lbY8
         SuN4+03fSTxFZYqtwFTpeCUs/v5gNICBBOCQUztP8aSAXmsYRoBOObKSBWWH+Q88oDs4
         PQEJj7kIpF89RxxVSjqkE7FzpFF91tIz3C8YOq622uQJsJVmIVdGyfTX89M9LAFrcD1e
         /+YNvB59leffHYtHO790yVgm7SygJ/9AsFkpH0mYwhEg4jgr4XZAfHtSxbvcsmWS9Q44
         fHo4CnNH+xxLQeTJlsVSa48vejKHGV2ki6iSMwuIyOUwAGfZzJI6zalfdxJXvlK0l+mC
         nZwQ==
X-Forwarded-Encrypted: i=1; AKwUvBzy0lkqs4QE0IKZv6JYVzy3rhS+6lW4w2+nlcJT4Ae+ii479wed8RgCsTMlvCMLHQhLnd/OcQqix338Y1I=@vger.kernel.org
X-Gm-Message-State: AFq9FYLBj6C0oypaUjUgCzYNwZEEoMda9+ZcxFwgUZZ8bmH/llC1XnE9
	GkmGacJlkRB5pbmzJ3D4SdSpYprwW5Pxqwt94jIlTov1d31g668jGqVx1tfRzkM9mdE=
X-Gm-Gg: AYBFou0GrHAH+24UukEGlgtcY7BCrJFGvnYethvbndSbTX7WqyWrzAnT5+kNrmhic/k
	o36zkPBmiQUvtS0JGzUCuG/k4VjxrfnJENRUiHfBJaJpDKT7GltN5ngx16j2EiUD+KHVu9SnW09
	z9UOiF8U4yl/GvFabhTVwy5puNzAD0bk3Se2lnc9B+6zBpzC9mPtW/bJIcHkiibwpuOd9z9+7Sl
	a7ewus2LynAk2JwtCzpcZev/2G3hlIYpHgIIbQkogAcGFEr6ly7c3xMyuYCQSW7qEFwQ9+XY5v/
	8kqOOrpuMPkiH3xltYY6oEZOVwoyppQd1q2y6zsuJXoiVoAS6gd0hf8U8tBMwXV2R/zR4R3kZbS
	lv6GLC9CcitpdTy26oVdYX9mSt0a5axXGTyzl3eT1ShFGt6UvvjkFlL1xEUJSNXWhxni4dg9xmy
	zDFRos49fY0oyK+LOCLBsnZ8FUX3Kqvn9Pg+C4Uisbv5BSdI5W6tXdxyGWlZUQO9kUO3I4tgeuf
	iovqy6ZEdtY2H5THRR6/AnPNZkybVAKCh2hIKcY21D08hsimNmlQC0Q5+FiVEY=
X-Received: by 2002:a5d:5291:0:b0:486:f3db:e0f2 with SMTP id ffacd0b85a97d-48dbaade0b3mr13920551f8f.14.1791825555359;
        Mon, 12 Oct 2026 10:19:15 -0700 (PDT)
Received: from ?IPV6:2a01:599:840:e202:6f88:7a35:3ae9:6d10? ([2a01:599:840:e202:6f88:7a35:3ae9:6d10])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de0bc4ec6sm437267f8f.48.2026.10.12.10.19.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Oct 2026 10:19:15 -0700 (PDT)
Message-ID: <7d703c43-e462-41d6-a488-87342fd139a2@9elements.com>
Date: Mon, 12 Oct 2026 19:19:13 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] ARM: dts: aspeed: add Intel AVCRP BMC
To: Dawid Glazik <dawid.glazik@linux.intel.com>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 maciej.lawniczak@intel.com
References: <cover.1791825961.git.dawid.glazik@linux.intel.com>
 <12f8124fea31a6c6b1401d6aee640842c8d896a7.1791825961.git.dawid.glazik@linux.intel.com>
Content-Language: en-US
From: Tan Siewert <tan.siewert@9elements.com>
In-Reply-To: <12f8124fea31a6c6b1401d6aee640842c8d896a7.1791825961.git.dawid.glazik@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 10/12/26 7:39 PM, Dawid Glazik wrote:
> Add the initial AST2600 device tree for the Intel AVCRP BMC platform.
> 
> Signed-off-by: Dawid Glazik <dawid.glazik@linux.intel.com>

You got Review trailers from Andrew Lunn in v1. Unless you think Andrew 
has to re-review it (which should be then reasoned), please keep them in 
new revisions.

 From the kernel docs [0]:

"Both Tested-by and Reviewed-by tags, once received on mailing list from 
tester or reviewer, should be added by author to the applicable patches 
when sending next versions. However if the patch has changed 
substantially in following version, these tags might not be applicable 
anymore and thus should be removed. Usually removal of someone’s 
Acked-by, Tested-by or Reviewed-by tags should be mentioned in the patch 
changelog with an explanation (after the ‘---’ separator)."

> ---
> v2:
>   - Replace bootargs console=ttyS4,115200n8 with stdout-path = &uart5
>   - Remove the unreferenced video_memory reserved-memory node
> ---
>   arch/arm/boot/dts/aspeed/Makefile             |   1 +
>   .../dts/aspeed/aspeed-bmc-intel-avcrp.dts     | 315 ++++++++++++++++++
>   2 files changed, 316 insertions(+)
>   create mode 100644 arch/arm/boot/dts/aspeed/aspeed-bmc-intel-avcrp.dts
> 
> diff --git a/arch/arm/boot/dts/aspeed/Makefile b/arch/arm/boot/dts/aspeed/Makefile
> index 767f7c7652d5..ea4645ef9872 100644
> --- a/arch/arm/boot/dts/aspeed/Makefile
> +++ b/arch/arm/boot/dts/aspeed/Makefile
> @@ -54,6 +54,7 @@ dtb-$(CONFIG_ARCH_ASPEED) += \
>   	aspeed-bmc-ibm-rainier-4u.dtb \
>   	aspeed-bmc-ibm-sbp1.dtb \
>   	aspeed-bmc-ibm-system1.dtb \
> +	aspeed-bmc-intel-avcrp.dtb \
>   	aspeed-bmc-intel-s2600wf.dtb \
>   	aspeed-bmc-inspur-fp5280g2.dtb \
>   	aspeed-bmc-inspur-nf5280m6.dtb \
> diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-intel-avcrp.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-intel-avcrp.dts
> new file mode 100644
> index 000000000000..7c088c89d417
> --- /dev/null
> +++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-intel-avcrp.dts
> @@ -0,0 +1,315 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +// Copyright 2026 Intel Corporation
> +
> +/dts-v1/;
> +
> +#include "aspeed-g6.dtsi"
> +#include <dt-bindings/gpio/aspeed-gpio.h>
> +
> +/ {
> +	model = "Intel AVCRP BMC";
> +	compatible = "intel,avcrp-bmc", "aspeed,ast2600";
> +
> +	aliases {
> +		serial4 = &uart5;
> +	};
> +
> +	chosen {
> +		stdout-path = &uart5;
> +		bootargs = "earlycon";
> +	};
> +
> +	memory@80000000 {
> +		device_type = "memory";
> +		reg = <0x80000000 0x40000000>;
> +	};
> +
> +	reserved-memory {
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +		ranges;
> +
> +		video_engine_memory: jpegbuffer {
> +			size = <0x02000000>; /* 32M */
> +			alignment = <0x01000000>;
> +			compatible = "shared-dma-pool";
> +			reusable;
> +		};
> +	};
> +
> +};
> +
> +&rtc {
> +	status = "okay";
> +};

Please sort your nodes, as described in the device tree design guideline 
[1]. There's also a tool called `scripts/dtc/dt-check-style` that can 
help with this.
Note on that: we usually run `--mode strict` but it is known to report 
false-positives, so please check any reported errors twice ^^

> +
> +&fmc {
> +	status = "okay";
> +	flash@0 {
> +		status = "okay";
> +		m25p,fast-read;
> +		label = "bmc";
> +		spi-rx-bus-width = <4>;
> +		spi-max-frequency = <50000000>;
> +#include "openbmc-flash-layout-64.dtsi"
> +	};
> +};
> +
> +&uart1 {
> +	status = "okay";
> +};
> +
> +&uart3 {
> +	status = "okay";
> +};
> +
> +&uart4 {
> +	status = "okay";
> +};
> +
> +&uart5 {
> +	status = "okay";
> +};
> +
> +&uart_routing {
> +	status = "okay";
> +};
> +
> +&mdio1 {
> +	status = "okay";
> +
> +	ethphy1: ethernet-phy@0 {
> +		compatible = "ethernet-phy-id001c.c916";
> +		reg = <0>;
> +		reset-gpios = <&gpio0 ASPEED_GPIO(C, 1) GPIO_ACTIVE_LOW>;
> +		reset-assert-us = <10000>;
> +		reset-deassert-us = <50000>;
> +	};
> +};
> +
> +&mac1 {
> +	status = "okay";
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_rgmii2_default>;
> +	clocks = <&syscon ASPEED_CLK_GATE_MAC2CLK>,
> +		 <&syscon ASPEED_CLK_MAC2RCLK>;
> +	clock-names = "MACCLK", "RCLK";
> +	phy-mode = "rgmii-id";
> +	phy-handle = <&ethphy1>;
> +};
> +
> +&lpc {
> +	lpc_snoop: lpc-snoop@80 {
> +		snoop-ports = <0x80>;
> +		status = "okay";
> +	};

Why's this named if you don't use it as reference anywhere.

> +};
> +
> +&i3c_global {
> +	status = "okay";
> +};

That's enabled by default.

> +
> +&vhub {
> +	status = "okay";
> +};
> +
> +&video {
> +	status = "okay";
> +	memory-region = <&video_engine_memory>;
> +};
> +
> +&gpio0 {
> +	gpio-line-names =
> +		/*A0-A7*/ "", "", "", "", "SMB_CPU_PIROM_SCL", "SMB_CPU_PIROM_SDA",
> +				"SMB_IPMB_STBY_LVC3_SCL", "SMB_IPMB_STBY_LVC3_SDA",
> +		/*B0-B7*/ "", "", "", "FM_CPU1_ERR2_LVT3_N",
> +				"RGMII_BMC_RMM4_LVC3_R_MDC", "RGMII_BMC_RMM4_LVC3_R_MDIO",

Why do you name reserved GPIO lines (in this case the RGMII lines)? 
They're used by the kernel anyways.

Tan

[0] 
https://docs.kernel.org/process/submitting-patches.html#using-reported-by-tested-by-reviewed-by-suggested-by-and-fixes
[1] https://docs.kernel.org/devicetree/bindings/dts-coding-style.html
