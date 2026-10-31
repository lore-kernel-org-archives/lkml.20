Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.154.119.183
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793470757;
	b=Uo7fRTdkEmt7R0M6Je7TjeSg33C7YaNS0oQ4OhBh0YT/9cR7kpZPVSbmj4Yg/sXybEST
	 ZEwlXfNpj9qRW/njtZteC8iHIL8nTXuzu0uSHH4Hy80KZFQAyhKml0G/RhewJSdgxDiNe
	 jAyOjOmqNgP6JFsPi83Y9kp9UAIkFXuhVTegV69Ptdr+36vXWdqKPNQcX+qruN3coZCVq
	 DdO8PexXELRYBQ8QlI35knww37ISbEr3lIKQE/OU5XHACzc/go6/Hrws+OhiKBSmAaVAq
	 foyXKvpQUNr9cf5nAoCprjU7x3SLGtRXvCWvXfqOdOH4ytSaF9ghBtbu5XhwmyRnAFA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793470757;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:Mail-Followup-To:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:User-Agent;
	bh=wXvKtxMScM3vklVT7dsWI8q+OIPz4wEMOfjmV3tlROo=;
	b=BoEBY0Wjtm8MhJ90JrHys+6MzDgwqZ9ycDHOgNpVBWZGRLS210RKOBZH7SW9vGZiQNFG
	 oWexl1ONdQXBMLA0R78N2QBexaY/Fyfzpkp2IicyUE2zmwhUSdpMItTlfoW9h3m0RW6Pr
	 T4yDkLlSpCnYzx4PtQmkTnn6tnNYAfPw38SuXC00jzxlz/ZhRLR8D6SaZizFVE3abytOl
	 tzIHouvfnpA2BIXcHIXE1YUT5BE9eHiOGBDtRmiRK+yCpgLhogxcT1hoVEtI9KGliT00Q
	 nGi7gsHK3+K5S4hgoZb3oOCGG/FP77/gae9yrS+JzTjg+S882rLqv3U7q9bPd4NDVfQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=aurel32.net;
	spf=pass smtp.mailfrom=aurel32.net;
	dkim=pass header.d=aurel32.net header.i=@aurel32.net header.a=rsa-sha256 header.s=202004.hall header.b=G25HnGaD;
	arc=none smtp.remote-ip=195.154.119.183
Received: from hall.aurel32.net (hall.aurel32.net [195.154.119.183])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26C6B606A31A;
	Sat, 31 Oct 2026 18:19:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 26C6B606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=aurel32.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aurel32.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=aurel32.net header.i=@aurel32.net header.a=rsa-sha256 header.s=202004.hall header.b=G25HnGaD
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=aurel32.net
	; s=202004.hall; h=In-Reply-To:Content-Type:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Content-Transfer-Encoding:From:Reply-To:
	Subject:Content-ID:Content-Description:X-Debbugs-Cc;
	bh=wXvKtxMScM3vklVT7dsWI8q+OIPz4wEMOfjmV3tlROo=; b=G25HnGaDkc1RgIW91lVD6GGCn7
	ujfzrPuOEazvc9Ofi9P8wnL97LyD0rSL6DBLcNFoQF57HBxyLfbBLHo+JoWJJCqgXtqe0Ng75yZRy
	CHdsGq9Uu5UAr1avEaMd2utnyJ/Vy9WVZnENmGrny5ozCa82wVAhbWOsLxaYfKqvoFFUQx0raHLrg
	01tmJs9J0g7B4M7b2UBzDsL1NNjZ5v/4v3+tA7IG6cYpgIQ1xYhHRSda25icsS05cWlnKjOimDC2E
	Kui1OWenvFiRlVVjeSmq+iL/RrtyeazdmNXRrRaoNpoA1J+AaDtnSiiyNPU4IgOb/FlKJmZrWQ0Jt
	hjoXbK6Q==;
Received: from authenticated user
	by hall.aurel32.net with esmtpsa  (TLS1.3)  tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <aurelien@aurel32.net>)
	id 1xNDfU-00000009eFe-1DoC;
	Sat, 31 Oct 2026 19:19:04 +0100
Date: Sat, 31 Oct 2026 19:19:01 +0100
From: Aurelien Jarno <aurelien@aurel32.net>
To: Chunyan Zhang <chunyan.zhang@linux.spacemit.com>
Cc: Yixun Lan <dlan@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	spacemit@lists.linux.dev, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Chunyan Zhang <zhang.lyra@gmail.com>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: dts: spacemit: k3: add USB3 port A (DRD) nodes
Message-ID: <auYxFRtKWbGAlRTL@aurel32.net>
Mail-Followup-To: Chunyan Zhang <chunyan.zhang@linux.spacemit.com>,
	Yixun Lan <dlan@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	spacemit@lists.linux.dev, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Chunyan Zhang <zhang.lyra@gmail.com>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	linux-kernel@vger.kernel.org
References: <20261030094024.3226356-1-chunyan.zhang@linux.spacemit.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261030094024.3226356-1-chunyan.zhang@linux.spacemit.com>
User-Agent: Mutt/2.4.1 (2026-07-04)

Hi,

On 2026-10-30 17:40, Chunyan Zhang wrote:
> Describe the DWC3 controller and its USB 2.0 PHY for USB3 port A
> of the K3 SoC.
> 
> Only the U2 lane is described: Port A's SuperSpeed PHY has no driver
> yet, so the port runs at high-speed (maximum-speed = "high-speed").
> 
> Enable USB3 port A with dr_mode = "peripheral", so it can be used as
> a USB device.
> 
> Signed-off-by: Chunyan Zhang <chunyan.zhang@linux.spacemit.com>
> ---
>  arch/riscv/boot/dts/spacemit/k3-pico-itx.dts |  9 ++++++
>  arch/riscv/boot/dts/spacemit/k3.dtsi         | 30 ++++++++++++++++++++
>  2 files changed, 39 insertions(+)
> 
> diff --git a/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts b/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
> index b084a35aa00e..74d4fdf9e405 100644
> --- a/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
> +++ b/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
> @@ -323,6 +323,15 @@ &usb2_phy {
>  	status = "okay";
>  };
>  
> +&usb3a_u2phy {
> +	status = "okay";
> +};
> +
> +&usb3a {
> +	dr_mode = "peripheral";
> +	status = "okay";
> +};
> +
>  &usb3d_u2phy {
>  	status = "okay";
>  };
> diff --git a/arch/riscv/boot/dts/spacemit/k3.dtsi b/arch/riscv/boot/dts/spacemit/k3.dtsi
> index c3f2dce0969c..220dfe29bb78 100644
> --- a/arch/riscv/boot/dts/spacemit/k3.dtsi
> +++ b/arch/riscv/boot/dts/spacemit/k3.dtsi
> @@ -630,6 +630,36 @@ gmac2_axi_setup: stmmac-axi-config {
>  			};
>  		};
>  
> +		usb3a: usb@cad00000 {

Please move this after the eth2 node, so that the node addresses are 
kept sorted.

> +			compatible = "spacemit,k3-dwc3";
> +			reg = <0x0 0xcad00000 0x0 0x10000>;
> +			interrupts = <118 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-parent = <&saplic>;
> +			clocks = <&syscon_apmu CLK_APMU_USB3_PORTA_BUS>;
> +			clock-names = "usbdrd30";
> +			resets = <&syscon_apmu RESET_APMU_USB3_A_AHB>,
> +				 <&syscon_apmu RESET_APMU_USB3_A_VCC>,
> +				 <&syscon_apmu RESET_APMU_USB3_A_PHY>;
> +			reset-names = "ahb", "vcc", "phy";
> +			phys = <&usb3a_u2phy>;
> +			phy-names = "usb2-phy";

Please move the PHYs definition to the board level, matching was it is 
done for the other USB3 ports, as other boards might have different PHY 
configuration.

> +			phy_type = "utmi";
> +			snps,dis_enblslpm_quirk;
> +			snps,dis_u2_susphy_quirk;
> +			snps,dis-del-phy-power-chg-quirk;
> +			snps,dis-tx-ipgap-linecheck-quirk;
> +			maximum-speed = "high-speed";

I think the maximum-speed property should also be moved to the board 
level, as its value depends on the PHYs configuration.

> +			status = "disabled";
> +		};

Any reason not to define the snps,parkmode-disable-ss-quirk property? It 
is defined for the other USB3 ports, as well as for the USB3 A port in 
the vendor kernel

> +
> +		usb3a_u2phy: phy@cad20000 {
> +			compatible = "spacemit,k3-usb2-phy";
> +			reg = <0x0 0xcad20000 0x0 0x200>;
> +			clocks = <&syscon_apmu CLK_APMU_USB3_PORTA_BUS>;
> +			#phy-cells = <0>;
> +			status = "disabled";
> +		};
> +
>  		pdma: dma-controller@d4000000 {
>  			compatible = "spacemit,k3-pdma";
>  			reg = <0x0 0xd4000000 0x0 0x4000>;

Otherwise looks good.

Regards
Aurelien

-- 
Aurelien Jarno                          GPG: 4096R/1DDD8C9B
aurelien@aurel32.net                     http://aurel32.net
