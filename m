Received: from mail-ed2-f16.google.com (mail-ed2-f16.google.com [74.125.228.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E3D948B38A
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 09:13:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.80
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789550026; cv=none; b=JHufWge/0CW5adFugFmXs5OKcREr9sB5xzENOmgBSpnFJ0GKHFmF12g/Dv+gGu50Z+FhJveyWC4YdW3WpHEjiaDt1yS0wWWAb+6FdrpzXoa3lwVJ5aL7oXJ24czMbAtz448hXfXiD5r1nlRHao0JmwdszdG0G9uw0KvYMTnUER0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789550026; c=relaxed/simple;
	bh=bPkxAYoE1nt+KRIvjS+PEE9IbJV3hXHoXuLeG8ZhedM=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=s6ql09adHlQAajNdg4M8vQCqGmhLE9YwaOe+Z9a0KYNq5jFI5CoGU9gSUqoSMF2a8cMOqvsBRxF4y8hzPYU+rNBSrkrBoAdf4fgW2+Uvoeoz9xbnt3KUPYOBxmUf9eF1OFLnLkdMv3bzsjimHMfhalxd9CjLUtGBWOcBJjProoU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com; spf=pass smtp.mailfrom=9elements.com; dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b=gy1BPePj; arc=none smtp.client-ip=74.125.228.80
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=9elements.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b="gy1BPePj"
Received: by mail-ed2-f16.google.com with SMTP id 4fb4d7f45d1cf-6a9984f9adcso1223746a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 02:13:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1789550005; x=1790154805; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=UtUJCPsoaKTejj6x2QLMIpjL9EPoJFwA0KNqad74re0=;
        b=gy1BPePjf40bTnFtiMrQV1Jr0cHdEvgy2HWEA+mrM8DBiSFQk5b/33uEap4lG8pUbx
         f79dOFnakpT/w1ZM7YLkE6Go9vwkjtdIZR318ptU4w+tyhuYUF64IFOjcZ9nwvKt5XY9
         i+okTJnEoHiN64KpJSuMhDTFvDAcdY82S/fsIjIJ2zexR3ZvIkzIIvsh+Kbw8/u7ciCN
         2GxJlWdWVGDpt0DyIHm5yIKrnevQlL/JF4SsFcsAMUFCX1uMETHyUuCGk/bHsM2BZBxY
         mH2DN0ryG6EtcltOvS/0su/9q4eP4xJvc7mLEJ7FpRQ29yHrTBQUKpi+OPo6zjEhOSUM
         Rx5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789550005; x=1790154805;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UtUJCPsoaKTejj6x2QLMIpjL9EPoJFwA0KNqad74re0=;
        b=gVYjhC9JvGHP7zyUKyqbnksvDQDc3BpV4fNUhY69u87mGsbhAk54inhsedKpm62LFb
         YtzP8cl0BBliEbxspXKy0fKZb0NYEx/bUbFw95ABdWn74GcaVUZl1Nlcy1L9bV17Xbxf
         xRqUNUv3S2GcYiyC0FD78ScnqrtUUNqwTaZH31eyi8PGUStf+4vLvRKDH3HMgrwF0xzY
         rkozJA2ykOlJvwp4QO45OUqBBkt6JlwLaFZ4ozRkRCkEa3K/BN6ZlfyjepNkLk4uADeY
         akVgLvOgUOUuq/bWexGd18oDIlqI+QmFRQyzlF8X4bBUSmQjd1ccupVkfU8zkC1VWLnZ
         VekQ==
X-Forwarded-Encrypted: i=1; AKwUvBwTUbDoOJqPAvYSZotT4FNUo0Ibsya50FkIYXN1PDc2RgBBD/QhTPGNrzvMx1PVvJmdMJDlFi0U/Bru1eI=@vger.kernel.org
X-Gm-Message-State: AFuF++m6l1OnDudfLO/SIr4sIRkVRybQ39gTxv+8CjvRpOHmFKkSEVK/
	A39E4hBpGb3zI85AnBgbLAb5qDIM7UnU6LUlismLqqlyLLXSCCOQ5x1PMGSOJekxZ/0=
X-Gm-Gg: AYBFou0+8RAHUN97hwC5yrDL7jvVtkr8FPJSTTWL0TtW/7LctJJAnSBOVOD46H0Pmx2
	Qw7b630wIRg+8P7sC2DM4VTAVkAwJu3wR2/WbuP+mJD0K9bF3fYqiTEmuWbgzu6BgnLLBxByMau
	QEBHbfFmxWO8oL01baR6lOtbXrALvO2UTFjHrfJo4pl9TEaX1FJlaj5M38/xpl87/5WCF8+WxCE
	3H3XLf5yADg9yvCcfESm4oCgOXQskXKsS7lhgV1uku5t0PUXel5YYvldYtLnobAFaOPt1G4+l6c
	rbvDZ7OfdlIcE5HXILriQn0oqVQ95C6ap/w4BxSxiIQzuQ7RWjeYuSC0JteXLr/ua+RsK/tze6P
	Q/1zSHQQuu+Jg1kmlv8J67vEftJpG+lPhGUssPApHWXAClykG6QbXopezAFliDre4uUOLkxJoKu
	GCN/EOFvhDiW6juRtYFp/XATi3e6P2jFWUgOC7JDn3+GzUkVHF26Y5jTRPRDYyJGuniDvAboMj4
	AGQb7qkEW+UYR0=
X-Received: by 2002:a05:6402:24c5:b0:6a9:e7eb:f52f with SMTP id 4fb4d7f45d1cf-6aa22418ef3mr1053990a12.28.1789550005374;
        Wed, 16 Sep 2026 02:13:25 -0700 (PDT)
Received: from white-mocha.local ([195.169.148.30])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6aa1d2a874esm1148454a12.29.2026.09.16.02.13.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 02:13:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v5 2/2] ARM: dts: aspeed: Add ASRock Rack B650D4U BMC
From: Tan Siewert <tan.siewert@9elements.com>
To: Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: Joel Stanley <joel@jms.id.au>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Ryan Chen <ryan_chen@aspeedtech.com>, 
 Billy Tsai <billy_tsai@aspeedtech.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260915013110.4780-3-prasanth.padarthi10@gmail.com>
References: <20260830182036.284736-1-prasanth.padarthi10@gmail.com>
 <20260915013110.4780-1-prasanth.padarthi10@gmail.com>
 <20260915013110.4780-3-prasanth.padarthi10@gmail.com>
Date: Wed, 16 Sep 2026 11:13:14 +0200
Message-Id: <178954999459.14468.3220034594197550391.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789549995; l=5936;
 i=tan.siewert@9elements.com; s=20260527; h=from:subject:message-id;
 bh=bPkxAYoE1nt+KRIvjS+PEE9IbJV3hXHoXuLeG8ZhedM=;
 b=cRryfJU6A7jVHO0Nx61Kd8fo8PmCnV1ZH14DLV0RISA+/+nuTe7JNI6y7jUo1FxKFiwHnboWS
 oWWxG1ZTPrBBOHlDo3PTtKo3lC1H5uosZY0hKaAzuzQOVg6ToMR+V/Z
X-Developer-Key: i=tan.siewert@9elements.com; a=ed25519;
 pk=ORQd/zQf+LsAvJGXP1CjQwVO6t6iEOGq/eGUsmRVTG4=

> Add the device tree for the ASRock Rack B650D4U BMC, which is
> based on the ASPEED AST2600 SoC.
> 
> Describe the BMC memory, SPI NOR flash layout, UART console,
> GPIO line names, video framebuffer memory, I2C EEPROM, and MAC0
> connected to an RTL8211F Ethernet PHY.
> 
> Use the EEPROM on I2C7 as the NVMEM provider for the MAC0 address.
> 
> Configure MAC0 to use the RTL8211F in RGMII-ID mode.
> 
> Signed-off-by: Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>

dt-check-style --mode strict reports issues:

    arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-b650d4u.dts:8: [property-order] property 'compatible' out of canonical order (should sort before 'model')
    arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-b650d4u.dts:26: [property-order] property 'ranges' out of canonical order (should sort before '#size-cells')
    arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-b650d4u.dts:30: [property-order] property 'alignment' out of canonical order (should sort before 'size')
    arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-b650d4u.dts:31: [property-order] property 'compatible' out of canonical order (should sort before 'alignment')
    arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-b650d4u.dts:39: [property-order] property 'memory-region' out of canonical order (should sort before 'status')
    arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-b650d4u.dts:70: [property-order] property 'spi-max-frequency' out of canonical order (should sort before 'm25p,fast-read')
    arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-b650d4u.dts:72: [required-blank-lines] "status" must be preceded by a blank line
    arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-b650d4u.dts:80: [property-order] property 'phy-mode' out of canonical order (should sort before 'status')
    arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-b650d4u.dts:81: [property-order] property 'phy-handle' out of canonical order (should sort before 'phy-mode')
    arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-b650d4u.dts:83: [property-order] property 'pinctrl-0' out of canonical order (should sort before 'pinctrl-names')
    arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-b650d4u.dts:85: [property-order] property 'nvmem-cells' out of canonical order (should sort before 'pinctrl-0')

>
> diff --git a/arch/arm/boot/dts/aspeed/Makefile b/arch/arm/boot/dts/aspeed/Makefile
> index 6b68671f9379..b109491d5c8f 100644
> --- a/arch/arm/boot/dts/aspeed/Makefile
> +++ b/arch/arm/boot/dts/aspeed/Makefile
> @@ -10,6 +10,7 @@ dtb-$(CONFIG_ARCH_ASPEED) += \
>  	aspeed-bmc-ampere-mtmitchell.dtb \
>  	aspeed-bmc-arm-stardragon4800-rep2.dtb \
>  	aspeed-bmc-asrock-altrad8.dtb \
> +	aspeed-bmc-asrock-b650d4u.dtb \
>  	aspeed-bmc-asrock-e3c246d4i.dtb \
>  	aspeed-bmc-asrock-e3c256d4i.dtb \
>  	aspeed-bmc-asrock-paul-ipmi-card.dtb \
> diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-b650d4u.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-b650d4u.dts
> new file mode 100644
> index 000000000000..6585bda56a4c
> --- /dev/null
> +++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-b650d4u.dts
> @@ -0,0 +1,120 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/dts-v1/;
> +
> +#include "aspeed-g6.dtsi"
> +
> +/ {
> +	model = "ASRock Rack B650D4U BMC";
> +	compatible = "asrock,b650d4u-bmc", "aspeed,ast2600";
> +
> +	aliases {
> +		serial0 = &uart5;
> +	};
> +
> +	chosen {
> +		stdout-path = "serial0:115200n8";
> +	};
> +
> +	memory@80000000 {
> +		device_type = "memory";
> +		reg = <0x80000000 0x20000000>;
> +	};
> +
> +	reserved-memory {
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +		ranges;
> +
> +		gfx_memory: framebuffer {
> +			size = <0x01000000>;
> +			alignment = <0x01000000>;
> +			compatible = "shared-dma-pool";
> +			reusable;
> +		};
> +	};
> +};
> +
> +&gfx {
> +	status = "okay";
> +	memory-region = <&gfx_memory>;
> +};
> +
> +&gpio0 {
> +	gpio-line-names =
> +		/* A0-A7 */	"","","","","","","","",
> +		/* B0-B7 */	"","","","","","","","",
> +		/* C0-C7 */	"","","","","","","","",
> +		/* D0-D7 */	"","","","","","","","",
> +		/* E0-E7 */	"","","","","","","","",
> +		/* F0-F7 */	"","","","","","button-reset-n","","",

How did you confirm this? According to the schematic it should be P0 (P0-P5
have GPIO passthrough functionality).

> +		/* G0-G7 */	"","","","","","","","",
> +		/* H0-H7 */	"","","","","","","","",
> +		/* I0-I7 */	"","","","","","","","",
> +		/* J0-J7 */	"","","","","","","","",
> +		/* K0-K7 */	"","","","","","","","",
> +		/* L0-L7 */	"","","","","","","","",
> +		/* M0-M7 */	"","","","","","","","",
> +		/* N0-N7 */	"","","","","","","","",
> +		/* O0-O7 */	"","","","","","","","",
> +		/* P0-P3 */	"","","","control-power-n";

Personally, I'm not a fan when `gpio-line-names` doesn't match with the amount
of defined `ngpios`, but that doesn't mean it's wrong. Maybe Andrew Jeffrey has
a different opinion on that.

> +};
> +
> +&fmc {
> +	status = "okay";
> +
> +	flash@0 {
> +		compatible = "jedec,spi-nor";
> +		reg = <0>;
> +		label = "bmc";
> +		m25p,fast-read;
> +		spi-max-frequency = <50000000>;
> +		spi-rx-bus-width = <4>;
> +		status = "okay";
> +
> +#include "openbmc-flash-layout-64.dtsi"
> +	};
> +};
> +
> +&mac0 {
> +	status = "okay";
> +	phy-mode = "rgmii-id";
> +	phy-handle = <&ethphy0>;
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_rgmii1_default>;
> +
> +	nvmem-cells = <&eth0_macaddress>;
> +	nvmem-cell-names = "mac-address";
> +};
> +
> +&mdio0 {
> +	status = "okay";
> +
> +	ethphy0: ethernet-phy@0 {
> +		compatible = "ethernet-phy-ieee802.3-c22";
> +		reg = <0>;
> +	};
> +};
> +
> +&uart5 {
> +	status = "okay";
> +};
> +
> +&i2c7 {

Please sort your nodes, as per the device-tree style guideline [0].

[0] https://docs.kernel.org/devicetree/bindings/dts-coding-style.html

Tan

-- 
Tan Siewert <tan.siewert@9elements.com>
