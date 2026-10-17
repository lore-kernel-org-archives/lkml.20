Received: from freeshell.de (freeshell.de [116.202.128.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E2003EC802;
	Sat, 17 Oct 2026 21:06:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=116.202.128.144
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792271192; cv=none; b=oLt1zeJ5+sHaYEmR/SK7ecR7nw5Ye/jINnJ/uYsGkZtJoXjY/HltKlXEi4syg0WqK6RN1hy/PS9eOJGJL7yrcQsVUgoSWPwH/s3X4ixS7qrT1nY/N8WvZKSNgc1IoQSP23WN7kw1x5EwpDEWQNfYHZlATyRrKK6X9x0v59GQVs0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792271192; c=relaxed/simple;
	bh=AVgNLZ3TFbJiXts+HVJihfsJS/suvsBreFJc0spb4eY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jkOZqEFp4SFfTGk5I+qM3TbNz60nVe5qffPsJoXGuPDmiifEwt9VCdJuCFbuRkRgNFL44W+EKh2jNWitGsPdK+oqh9/gwEU8qE9fuhUhkTfUAFnUoA3DP15ijxoAU+OgBKJkO6YIowuA4DiJ8hDTM628N/QQ2AbLQQyNHUPytio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=freeshell.de; spf=pass smtp.mailfrom=freeshell.de; dkim=pass (2048-bit key) header.d=freeshell.de header.i=@freeshell.de header.b=f+dBEzyU; arc=none smtp.client-ip=116.202.128.144
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=freeshell.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=freeshell.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=freeshell.de header.i=@freeshell.de header.b="f+dBEzyU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=freeshell.de;
	s=s2025; t=1792271150;
	bh=GZCIYxzwJgfq5iax1nk6spe3PnZmYcsROINLBRk7eCU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=f+dBEzyU2h+xCUynaxy+XFsX/cazSMzV5qD8FbTAhL0Edy6tm/oXbImU/O5pFcexV
	 eKg+L4m48Zmgv3ZrgUzSj9EkyoejvXXxruDHKtD2leIZ3LM0gWo+KrNML7nIL2ZsLH
	 /3z7EMitRTGEr7BG7j7nNK8Te7T44WnUnLoHpQe6gbMVomB46QMzir+WfudKvN4DFu
	 944mLM+i8k8D8Z2i/FuMFCN3UFpP202olP+/dZCDRQiE7QdbeeWhtubTD+l3wB8aqY
	 tSBkpczkYaOaADll3fADeJsXmSiBap1OLrgrgMCS6Zwe4kDel1N6Jz8szQGV7PZTuQ
	 NRm5dzNwjHB5Q==
Received: from [IPV6:2605:59ca:364f:d400:1b91:6b30:22c2:fffc] (unknown [IPv6:2605:59ca:364f:d400:1b91:6b30:22c2:fffc])
	(Authenticated sender: e)
	by freeshell.de (Postfix) with ESMTPSA id 79CACB221DBD;
	Sat, 17 Oct 2026 23:05:47 +0200 (CEST)
Message-ID: <05e0c9e4-4e27-4114-866a-ec55c33ba349@freeshell.de>
Date: Sat, 17 Oct 2026 14:05:40 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] riscv: dts: spacemit: k1: mark boot-critical SoC
 nodes bootph-pre-ram
To: Hung-Chun Tseng <alan.tseng.cs@gmail.com>, Yixun Lan <dlan@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20261017180141.3477743-1-alan.tseng.cs@gmail.com>
 <20261017180141.3477743-2-alan.tseng.cs@gmail.com>
Content-Language: en-US
From: E Shattow <e@freeshell.de>
In-Reply-To: <20261017180141.3477743-2-alan.tseng.cs@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Hung-Chun,

On 10/17/26 11:01, Hung-Chun Tseng wrote:
> A bootloader SPL that follows the K1 BootROM runs from SRAM before DRAM
> is up. It needs the root clocks, the clock and reset controllers, the
> console UART, the I2C bus of the PMIC (i2c8, which every K1 board
> uses), and the boot media controllers: SD (sdhci0), eMMC and QSPI NOR.
> Mark these nodes bootph-pre-ram so an SPL can use the upstream device
> tree as is, instead of carrying the tags in per-board overlays.
> 
> These are the SoC nodes that the mainline U-Boot SPL for K1 currently
> tags in its board -u-boot.dtsi files.

Drop this last paragraph/sentence or place after scissors line, not for
the commit message itself.

Device tree in Linux describes hardware and not the arbitrary needs of
some other specific software project. Any SPL executed by hardware
BootROM SPL loader functionality in the SoC mask ROM will reasonably be
expected to need bootph-pre-ram tags on peripherals configured by that
same hardware workflow so boot can be successful in an initially
SRAM-constrained environment before DRAM setup. This is not the same as
stating that "U-Boot SPL for K1 currently tags..." which is a
description of arbitrary software and not any correct justification.

Examples illustrative how to reason about why bootph-pre-ram tags belong
upstream and not as recommendations for what to say in the commit message:

* Valid here upstream: BootROM serial UART SPL loader => U-Boot SPL UART
YMODEM U-Boot main app loader

* Valid here upstream: BootROM USB fastboot SPL loader => U-Boot SPL
fastboot U-Boot main app loader

* Valid downstream, not upstream here: BootROM USB fastboot SPL loader
=> U-Boot SPL UART YMODEM U-Boot main app loader; it is valid downstream
without additional effort as a side-effect of implementing all the valid
upstream bootph-pre-ram tags

* Valid downstream, not upstream here: BootROM serial UART SPL loader =>
serial UART-attached Bluetooth BLE VibeCodedBootLoader; When there is no
such Bluetooth BLE loader functionality in MaskROM BootROM code, any
bootloader project may implement such exotic interface and add
bootph-pre-ram tags in its own overrides downstream.

This is not so easy to review for lack of knowing the fact of what all
peripherals that BootROM may configure, and what tags might reasonably
be then extended to any SPL in any given BootROM SPL loader workflow.
Without knowledge of the BootROM code we then rely on vendor-employed
developer review and community testing for outcomes.

> 
> Assisted-by: claude-opus-5-5 dtbs_check
> Signed-off-by: Hung-Chun Tseng <alan.tseng.cs@gmail.com>
> ---
>  arch/riscv/boot/dts/spacemit/k1.dtsi | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/arch/riscv/boot/dts/spacemit/k1.dtsi b/arch/riscv/boot/dts/spacemit/k1.dtsi
> index 3fabfd341..5d9550272 100644
> --- a/arch/riscv/boot/dts/spacemit/k1.dtsi
> +++ b/arch/riscv/boot/dts/spacemit/k1.dtsi
> @@ -322,6 +322,7 @@ cluster1_l2_cache: l2-cache1 {
>  	clocks {
>  		vctcxo_1m: clock-1m {
>  			compatible = "fixed-clock";
> +			bootph-pre-ram;
>  			clock-frequency = <1000000>;
>  			clock-output-names = "vctcxo_1m";
>  			#clock-cells = <0>;
> @@ -329,6 +330,7 @@ vctcxo_1m: clock-1m {
>  
>  		vctcxo_24m: clock-24m {
>  			compatible = "fixed-clock";
> +			bootph-pre-ram;
>  			clock-frequency = <24000000>;
>  			clock-output-names = "vctcxo_24m";
>  			#clock-cells = <0>;
> @@ -336,6 +338,7 @@ vctcxo_24m: clock-24m {
>  
>  		vctcxo_3m: clock-3m {
>  			compatible = "fixed-clock";
> +			bootph-pre-ram;
>  			clock-frequency = <3000000>;
>  			clock-output-names = "vctcxo_3m";
>  			#clock-cells = <0>;
> @@ -343,6 +346,7 @@ vctcxo_3m: clock-3m {
>  
>  		osc_32k: clock-32k {
>  			compatible = "fixed-clock";
> +			bootph-pre-ram;
>  			clock-frequency = <32768>;
>  			clock-output-names = "osc_32k";
>  			#clock-cells = <0>;
> @@ -586,6 +590,7 @@ i2c5: i2c@d4013800 {
>  		syscon_apbc: system-controller@d4015000 {
>  			compatible = "spacemit,k1-syscon-apbc";
>  			reg = <0x0 0xd4015000 0x0 0x1000>;
> +			bootph-pre-ram;
>  			clocks = <&osc_32k>, <&vctcxo_1m>, <&vctcxo_3m>,
>  				 <&vctcxo_24m>;
>  			clock-names = "osc", "vctcxo_1m", "vctcxo_3m",
> @@ -726,6 +731,7 @@ i2c7: i2c@d401d000 {
>  		i2c8: i2c@d401d800 {
>  			compatible = "spacemit,k1-i2c";
>  			reg = <0x0 0xd401d800 0x0 0x38>;
> +			bootph-pre-ram;
>  			#address-cells = <1>;
>  			#size-cells = <0>;
>  			clocks = <&syscon_apbc CLK_TWSI8>,
> @@ -857,6 +863,7 @@ pwm19: pwm@d4022c00 {
>  		syscon_mpmu: system-controller@d4050000 {
>  			compatible = "spacemit,k1-syscon-mpmu";
>  			reg = <0x0 0xd4050000 0x0 0x209c>;
> +			bootph-pre-ram;
>  			clocks = <&osc_32k>, <&vctcxo_1m>, <&vctcxo_3m>,
>  				 <&vctcxo_24m>;
>  			clock-names = "osc", "vctcxo_1m", "vctcxo_3m",
> @@ -869,6 +876,7 @@ syscon_mpmu: system-controller@d4050000 {
>  		pll: clock-controller@d4090000 {
>  			compatible = "spacemit,k1-pll";
>  			reg = <0x0 0xd4090000 0x0 0x1000>;
> +			bootph-pre-ram;
>  			clocks = <&vctcxo_24m>;
>  			spacemit,mpmu = <&syscon_mpmu>;
>  			#clock-cells = <1>;
> @@ -877,6 +885,7 @@ pll: clock-controller@d4090000 {
>  		syscon_apmu: system-controller@d4282800 {
>  			compatible = "spacemit,k1-syscon-apmu";
>  			reg = <0x0 0xd4282800 0x0 0x400>;
> +			bootph-pre-ram;
>  			clocks = <&osc_32k>, <&vctcxo_1m>, <&vctcxo_3m>,
>  				 <&vctcxo_24m>;
>  			clock-names = "osc", "vctcxo_1m", "vctcxo_3m",
> @@ -956,6 +965,7 @@ uart0: serial@d4017000 {
>  				compatible = "spacemit,k1-uart",
>  					     "intel,xscale-uart";
>  				reg = <0x0 0xd4017000 0x0 0x100>;
> +				bootph-pre-ram;
>  				clocks = <&syscon_apbc CLK_UART0>,
>  					 <&syscon_apbc CLK_UART0_BUS>;
>  				clock-names = "core", "bus";
> @@ -1085,6 +1095,7 @@ qspi: spi@d420c000 {
>  				reg = <0x0 0xd420c000 0x0 0x1000>,
>  				      <0x0 0xb8000000 0x0 0xc00000>;
>  				reg-names = "QuadSPI", "QuadSPI-memory";
> +				bootph-pre-ram;
>  				clocks = <&syscon_apmu CLK_QSPI_BUS>,
>  					 <&syscon_apmu CLK_QSPI>;
>  				clock-names = "qspi_en", "qspi";
> @@ -1328,6 +1339,7 @@ usb_dwc3: usb@c0a00000 {
>  			sdhci0: mmc@d4280000 {
>  				compatible = "spacemit,k1-sdhci";
>  				reg = <0x0 0xd4280000 0x0 0x200>;
> +				bootph-pre-ram;
>  				clocks = <&syscon_apmu CLK_SDH_AXI>,
>  					 <&syscon_apmu CLK_SDH0>;
>  				clock-names = "core", "io";
> @@ -1341,6 +1353,7 @@ sdhci0: mmc@d4280000 {
>  			emmc: mmc@d4281000 {
>  				compatible = "spacemit,k1-sdhci";
>  				reg = <0x0 0xd4281000 0x0 0x200>;
> +				bootph-pre-ram;
>  				clocks = <&syscon_apmu CLK_SDH_AXI>,
>  					 <&syscon_apmu CLK_SDH2>;
>  				clock-names = "core", "io";

Presumably the BootROM does configure all of the above? If so, the shape
of this looks good to me, the device tree node sorting where
bootph-pre-ram is added appears correct. With that,

Reviewed-by: E Shattow <e@freeshell.de>
