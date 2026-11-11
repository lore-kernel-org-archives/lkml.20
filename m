Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=136.143.188.112
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794400393;
	b=xD4v0kWr9Az1DhIP82ZyVqApzfUFOzey84KbDbO/4zYwvaxwAyqhCk5AI8SRoEXslsx4
	 CBl2icWNw9NOZ2ojrXa8JIX1KlC7uKzTXzTka8S7fosQrSAMVBt4erH4GIG00mQvprOIv
	 GqH82UriihEhIXH0V84V2jkuOVmaRo4lrFfSP2G6M1Rq5TEiKOvk0oBSegcazPKRoA+t0
	 dnbr0OEA4xNipzDrsaNLojygQR0wXljD1A+sgpKc/LDH6MrGnp+Oco1hNpcBzuG95uBxR
	 fLPj8EkB7y6KbESlCwPDMZPWcm7WPI82Psq27HeCe+cmMWMISrkbXB3GOQN3zTdEhcw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794400393;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-ZohoMailClient;
	bh=9zO+640/KHWsaMaqBoO79/jSoXhkI8QCCTxXofbivUQ=;
	b=ElNkgsgEc599f7ZLwp3kKUcfODujbzwkMopHycM63drwvBq2wweUECTL3JCmnmzx4gN7
	 RLHPpggRdCwm+qZQcDsqvRYmH3HnWGJs8u4ECnojtFyuEmBSlnhmlBMphAMviTrg96yYL
	 8SRdq+U0DoB/8W4wv4JSgKpQtYWW+a8muP6cu23Pseb/cW5g+PcBxeyyPKatsqQbm71Ow
	 yH2sIbOY1H20I9pi9IZ+nrGoJ83fyEt8mKOyCeHq3bMvLD5mmRyXkL1Kb7gze0xR/aeDo
	 dg0MEwV5ASP0a2Zkyu8dZBA/96zfig3cD8TbXmnVM9aw6/52Mz+IQWnBjebw0Z7zTHA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=zohomail header.b=MyoCTRFh;
	arc=pass header.oldest-pass=0 smtp.remote-ip=136.143.188.112
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 494E8606A321;
	Wed, 11 Nov 2026 12:33:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 494E8606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=zohomail header.b=MyoCTRFh
ARC-Seal: i=1; a=rsa-sha256; t=1794400367; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Q+/kXTvFvW8+6LUt5EGKXvW9TPMsc6/DJmfXPJOXdwOr+AJk4S4cdMzVu/2ngkfl47CYQ8gsSqEqMQyXVJ6Kl7+x4/xIRhFQzaMSk1NuiJ6wbOq0iqNKrVLYdfigDib0sY8aybqfAg57c1euVFEhRMaxkpQrOXcgimzhsh28PYA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1794400367; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=9zO+640/KHWsaMaqBoO79/jSoXhkI8QCCTxXofbivUQ=; 
	b=XloUxi06PsdEqOPrOlQR7VPh1f5atSlAimk44HiMMAkjm5loG7u85cLUz0YGa7tKj+thHZFJspLPV0PUhwuC+kTx4MkLt+0vnHXm7j4h59ralZ0We0qyvWJqwxhWVzzLqa3cyp2FsJvbQwzmeb3VKiiLovb3xTQfbbExJvj0ynU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=michael.riesch@collabora.com;
	dmarc=pass header.from=<michael.riesch@collabora.com>
DKIM-Signature: a=rsa-sha256; b=MyoCTRFhTyf8w/NUxmE8FnZuSjD2lwiy0FGPrX4bUQk92LBPvq/L72qvVISZoCVbjvKl4AJaMsqVWgREXSsYBRlp7upzTZ5VeeE3cdk7yNvSo9SkuHJ05hSBY0BCy3+/ySPK44w013FGJ3aXCxzvlej4rwZG/oOfdWWtvCAWEjc=; c=relaxed/relaxed; s=zohomail; d=collabora.com; v=1; bh=9zO+640/KHWsaMaqBoO79/jSoXhkI8QCCTxXofbivUQ=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zohomail.com with SMTPS id 1794400365749801.6617129785609;
	Wed, 11 Nov 2026 04:32:45 -0800 (PST)
Message-ID: <cb2a2451-149f-44d5-aea3-e050673422e4@collabora.com>
Date: Wed, 11 Nov 2026 13:32:40 +0100
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 9/9] arm64: dts: rockchip: add the dcphy mipi csi-2
 receiver nodes to rk3588
To: Jason Yang <jason98166@gmail.com>, Vinod Koul <vkoul@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Guochun Huang <hero.huang@rock-chips.com>,
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: Sebastian Reichel <sebastian.reichel@collabora.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20261110-dcphy-rx-v1-v6-0-d681ba20b36a@gmail.com>
 <20261110-dcphy-rx-v1-v6-9-d681ba20b36a@gmail.com>
Content-Language: en-US
From: Michael Riesch <michael.riesch@collabora.com>
In-Reply-To: <20261110-dcphy-rx-v1-v6-9-d681ba20b36a@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

Hi Jason,

On 11/10/26 09:18, Jason Yang wrote:
> The MIPI0 and MIPI1 receiver units are connected to MIPI DCPHY0 and
> MIPI DCPHY1, whose receiver side is now supported. Add the two nodes and
> wire them to the VICAP ports.
> 
> The dsi nodes keep <&mipidcphy0 PHY_TYPE_DPHY>, the only value the
> binding had before the PHY receiver was added. PHY_TYPE_DPHY still
> selects the PHY transmitter in D-PHY mode. The csi nodes use the new
> PHY_DIRECTION_RX from the dt-bindings header. Neither phy node needs
> phy-type: the DSI host and the CSI-2 host both run the block in D-PHY
> mode, the default.
> 
> There is an ABI break if the dsi and csi nodes use the new cell values:
> an older kernel ignores phy-type and takes any cell value as the mode of
> the block. A DSI node with PHY_DIRECTION_TX then gets no display, and a
> CSI-2 node with PHY_DIRECTION_RX gets no camera.
> 
> To keep the ABI break small, the dsi nodes keep PHY_TYPE_DPHY, which
> older and newer kernels both accept. With the csi nodes disabled, the
> display therefore keeps working on either kernel.
> 
> The csi nodes have no older value to keep and have to use
> PHY_DIRECTION_RX. Enabling csi0 or csi1 therefore needs a PHY driver
> with receiver support. Since v7.0, a CSI-2 host driver probes the csi
> nodes. An older PHY driver then gives the CSI-2 host the PHY transmitter
> that drives the display. The camera gets no frames, and the display can
> stop working as well.

I think you can restrict the patch description to what the patch
actually does.

This patch modifies the device tree in a perfectly valid way as set out
in the DT bindings. Any breakage or disadvantage of the approach therein
should be discussed there.

> Signed-off-by: Jason Yang <jason98166@gmail.com>

But apart from that this LGTM!

Reviewed-by: Michael Riesch <michael.riesch@collabora.com>

Best regards,
Michael

> ---
>  arch/arm64/boot/dts/rockchip/rk3588-base.dtsi | 68 +++++++++++++++++++++++++++
>  1 file changed, 68 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi b/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
> index aa69fd3793fd..c7174c2f15c3 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
> +++ b/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
> @@ -1516,10 +1516,18 @@ vicap_dvp: port@0 {
>  
>  			vicap_mipi0: port@1 {
>  				reg = <0x1>;
> +
> +				vicap_mipi0_input: endpoint {
> +					remote-endpoint = <&csi0_output>;
> +				};
>  			};
>  
>  			vicap_mipi1: port@2 {
>  				reg = <0x2>;
> +
> +				vicap_mipi1_input: endpoint {
> +					remote-endpoint = <&csi1_output>;
> +				};
>  			};
>  
>  			vicap_mipi2: port@3 {
> @@ -1568,6 +1576,66 @@ vicap_mmu: iommu@fdce0800 {
>  		status = "disabled";
>  	};
>  
> +	csi0: csi@fdd10000 {
> +		compatible = "rockchip,rk3588-mipi-csi2", "rockchip,rk3568-mipi-csi2";
> +		reg = <0x0 0xfdd10000 0x0 0x10000>;
> +		interrupts = <GIC_SPI 143 IRQ_TYPE_LEVEL_HIGH 0>,
> +			     <GIC_SPI 144 IRQ_TYPE_LEVEL_HIGH 0>;
> +		interrupt-names = "err1", "err2";
> +		clocks = <&cru PCLK_CSI_HOST_0>;
> +		phys = <&mipidcphy0 PHY_DIRECTION_RX>;
> +		power-domains = <&power RK3588_PD_VI>;
> +		resets = <&cru SRST_P_CSI_HOST_0>;
> +		status = "disabled";
> +
> +		ports {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			csi0_in: port@0 {
> +				reg = <0>;
> +			};
> +
> +			csi0_out: port@1 {
> +				reg = <1>;
> +
> +				csi0_output: endpoint {
> +					remote-endpoint = <&vicap_mipi0_input>;
> +				};
> +			};
> +		};
> +	};
> +
> +	csi1: csi@fdd20000 {
> +		compatible = "rockchip,rk3588-mipi-csi2", "rockchip,rk3568-mipi-csi2";
> +		reg = <0x0 0xfdd20000 0x0 0x10000>;
> +		interrupts = <GIC_SPI 145 IRQ_TYPE_LEVEL_HIGH 0>,
> +			     <GIC_SPI 146 IRQ_TYPE_LEVEL_HIGH 0>;
> +		interrupt-names = "err1", "err2";
> +		clocks = <&cru PCLK_CSI_HOST_1>;
> +		phys = <&mipidcphy1 PHY_DIRECTION_RX>;
> +		power-domains = <&power RK3588_PD_VI>;
> +		resets = <&cru SRST_P_CSI_HOST_1>;
> +		status = "disabled";
> +
> +		ports {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			csi1_in: port@0 {
> +				reg = <0>;
> +			};
> +
> +			csi1_out: port@1 {
> +				reg = <1>;
> +
> +				csi1_output: endpoint {
> +					remote-endpoint = <&vicap_mipi1_input>;
> +				};
> +			};
> +		};
> +	};
> +
>  	csi2: csi@fdd30000 {
>  		compatible = "rockchip,rk3588-mipi-csi2", "rockchip,rk3568-mipi-csi2";
>  		reg = <0x0 0xfdd30000 0x0 0x10000>;
> 

