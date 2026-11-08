Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794165520;
	b=mfK0tIKF6pixTrIZxHWqj486lZptvFCHO2X1XPwghmf09SMdgkFtRB/gtmedI+0p0Xdz
	 gB8BQwdle+zxa7Sn9f9I0sEYcsAaSwLVnLNiRnE4lT65KcVHka7t9GJ6o0vVuWVXzqCu7
	 9QWkTAzL2S9JXVKD47N4X3BSARNBNbiNieU5Hbg43fSVHTbvd9vNpSq9O4A3aiwwui8aH
	 CyQiGwHkrVsbgtmD0pyzFukbZIU8QREGSW4mqVf79gRzamysrzIvIdWROAnEBRh/w3YOU
	 ugJp3/nBNPwcSOD+nUYQ4Yf5HcD4cQiAvmLR9jN5SaDN3kFKNRmtL/UO4k7eeyGnFAg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794165520;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=IJSeHtW8m/8seenLcMMtEgFRqHXcM+m20gKhiWJ69iI=;
	b=CoBSkR1uBgundvah+pCtDQtORPWPQvn17kmc/pwbjAKxXn5SPHGCRDqtfcXQRx2lb0Vr
	 TD7JEf0DuQIbq0aIK4Y0OrFApNXao/A7Rn+lsGN4It3UPOGS+QOMQVf4FeSG1hm5+bTgY
	 o3q3CeRn7an/cpN2u3h6M7LP+XEHP4964oYclFxx6nkoDJxrrbVaZ0V+1qoEXi6CZxEw8
	 Vj7Ox1YgDxoIlge5TCRGcMN8YLPW4btkRqPyn2LljRgVFnwDn0kxWv/6IGxmkoWx/jzpC
	 4e4ZWfLhsxQTH4uzeFOmQXMUJkl0UrY63vZ4TEtWojEBTqygGkPMUySnD/kIFjNzI8A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mQT7BfNH;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C701A606A31C;
	Sun,  8 Nov 2026 19:18:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mQT7BfNH
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D05221F0089F;
	Sun,  8 Nov 2026 19:18:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794165519;
	bh=IJSeHtW8m/8seenLcMMtEgFRqHXcM+m20gKhiWJ69iI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=mQT7BfNHgE3e95As3KXaDESnWFR7vKfeVl71xf+NF1BLGjcmnwjS/Wy4DLekHSetJ
	 uOYSxzksFpQ2X5lgw7m2GsueYUjcOcJ4MSe2wJh+/5d9csXceT+0k6Axo35Qt/arIF
	 Km0sS2nWN9wYrCY9zi57rYndaVUPF3vFzeEW3OktjRIaLFgbRiZkFSIfbtAqPBn+HE
	 kkus4cpzlve/H+r64V7QT28PiMV2UEgOXGHJEhDzGxfE471ZIwRue/bpRHUFXuUEYC
	 HFeotnSr7T9ag4sHlZhNl432mCcGCY4uUKi/8uYFdiEGrSUzyz/C8o2YAZP0xhroTn
	 6kFRHT2nCqe0A==
Date: Sun, 8 Nov 2026 13:18:33 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: george.moussalem@outlook.com
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Wesley Cheng <quic_wcheng@quicinc.com>, 
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>, Konrad Dybcio <konradybcio@kernel.org>, 
	Abel Vesa <abelvesa@kernel.org>, linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>, 
	Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v4 3/8] arm64: dts: qcom: ipq5424: Flatten usb controller
 nodes
Message-ID: <avDKwE7XQb7bVqwr@zenbook>
References: <20261001-ipq-flatten-usb-v4-0-486a4d5ede30@outlook.com>
 <20261001-ipq-flatten-usb-v4-3-486a4d5ede30@outlook.com>
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
In-Reply-To: <20261001-ipq-flatten-usb-v4-3-486a4d5ede30@outlook.com>

On Thu, Oct 01, 2026 at 11:53:46AM +0400, George Moussalem via B4 Relay wrote:
> From: George Moussalem <george.moussalem@outlook.com>
> 
> Flatten usb controller nodes and update to using latest bindings and
> flattened driver approach.

Computer says:

+ arch/arm64/boot/dts/qcom/ipq5424-rdp466.dtb: usb2@1e00000 (qcom,ipq5424-dwc3): interrupt-names:4: 'dm_hs_phy_irq' was expected
        from schema $id: http://devicetree.org/schemas/usb/qcom,snps-dwc3.yaml
+ arch/arm64/boot/dts/qcom/ipq5424-rdp466.dtb: usb3@8a00000 (qcom,ipq5424-dwc3): interrupt-names:4: 'dm_hs_phy_irq' was expected
        from schema $id: http://devicetree.org/schemas/usb/qcom,snps-dwc3.yaml

Did you run "make dtbs_check" on this, or am I missing something?

The other changes in the series seems to pass.

Regards,
Bjorn

> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: George Moussalem <george.moussalem@outlook.com>
> ---
>  arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts | 12 ++--
>  arch/arm64/boot/dts/qcom/ipq5424.dtsi       | 86 +++++++++++++----------------
>  2 files changed, 41 insertions(+), 57 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts b/arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts
> index 793afc3ee82e..0c3370dba65b 100644
> --- a/arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts
> +++ b/arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts
> @@ -74,14 +74,6 @@ vreg_misc_0p925: regulator-usb-0p925 {
>  	};
>  };
>  
> -&dwc_0 {
> -	dr_mode = "host";
> -};
> -
> -&dwc_1 {
> -	dr_mode = "host";
> -};
> -
>  &pcie2 {
>  	pinctrl-0 = <&pcie2_default_state>;
>  	pinctrl-names = "default";
> @@ -284,10 +276,14 @@ &uart1 {
>  };
>  
>  &usb2 {
> +	dr_mode = "host";
> +
>  	status = "okay";
>  };
>  
>  &usb3 {
> +	dr_mode = "host";
> +
>  	status = "okay";
>  };
>  
> diff --git a/arch/arm64/boot/dts/qcom/ipq5424.dtsi b/arch/arm64/boot/dts/qcom/ipq5424.dtsi
> index 23f851e9241f..b1bfe31227e7 100644
> --- a/arch/arm64/boot/dts/qcom/ipq5424.dtsi
> +++ b/arch/arm64/boot/dts/qcom/ipq5424.dtsi
> @@ -640,12 +640,9 @@ qusb_phy_1: phy@71000 {
>  			status = "disabled";
>  		};
>  
> -		usb2: usb2@1ef8800 {
> -			compatible = "qcom,ipq5424-dwc3", "qcom,dwc3";
> -			reg = <0 0x01ef8800 0 0x400>;
> -			#address-cells = <2>;
> -			#size-cells = <2>;
> -			ranges;
> +		usb2: usb2@1e00000 {
> +			compatible = "qcom,ipq5424-dwc3", "qcom,snps-dwc3";
> +			reg = <0 0x01e00000 0 0xfc100>;
>  
>  			clocks = <&gcc GCC_USB1_MASTER_CLK>,
>  				 <&gcc GCC_USB1_SLEEP_CLK>,
> @@ -664,33 +661,31 @@ usb2: usb2@1ef8800 {
>  			assigned-clock-rates = <200000000>,
>  					       <24000000>;
>  
> -			interrupts-extended = <&intc GIC_SPI 395 IRQ_TYPE_LEVEL_HIGH>,
> +			interrupts-extended = <&intc GIC_SPI 396 IRQ_TYPE_LEVEL_HIGH>,
> +					      <&intc GIC_SPI 395 IRQ_TYPE_LEVEL_HIGH>,
>  					      <&intc GIC_SPI 397 IRQ_TYPE_LEVEL_HIGH>,
>  					      <&intc GIC_SPI 387 IRQ_TYPE_LEVEL_HIGH>,
>  					      <&intc GIC_SPI 388 IRQ_TYPE_LEVEL_HIGH>;
> -			interrupt-names = "pwr_event",
> +			interrupt-names = "dwc_usb3",
> +					  "pwr_event",
>  					  "qusb2_phy",
>  					  "dm_hs_phy_irq",
>  					  "dp_hs_phy_irq";
>  
>  			resets = <&gcc GCC_USB1_BCR>;
> +
> +			phys = <&qusb_phy_1>;
> +			phy-names = "usb2-phy";
> +
>  			qcom,select-utmi-as-pipe-clk;
> -			status = "disabled";
>  
> -			dwc_1: usb@1e00000 {
> -				compatible = "snps,dwc3";
> -				reg = <0 0x01e00000 0 0xe000>;
> -				clocks = <&gcc GCC_USB1_MOCK_UTMI_CLK>;
> -				clock-names = "ref";
> -				interrupts = <GIC_SPI 396 IRQ_TYPE_LEVEL_HIGH>;
> -				phys = <&qusb_phy_1>;
> -				phy-names = "usb2-phy";
> -				tx-fifo-resize;
> -				snps,is-utmi-l1-suspend;
> -				snps,hird-threshold = /bits/ 8 <0x0>;
> -				snps,dis_u2_susphy_quirk;
> -				snps,dis_u3_susphy_quirk;
> -			};
> +			tx-fifo-resize;
> +			snps,is-utmi-l1-suspend;
> +			snps,hird-threshold = /bits/ 8 <0x0>;
> +			snps,dis_u2_susphy_quirk;
> +			snps,dis_u3_susphy_quirk;
> +
> +			status = "disabled";
>  		};
>  
>  		qusb_phy_0: phy@7b000 {
> @@ -746,13 +741,9 @@ restart_reason: restartreason-sram@7b0 {
>  			};
>  		};
>  
> -		usb3: usb3@8af8800 {
> -			compatible = "qcom,ipq5424-dwc3", "qcom,dwc3";
> -			reg = <0 0x08af8800 0 0x400>;
> -
> -			#address-cells = <2>;
> -			#size-cells = <2>;
> -			ranges;
> +		usb3: usb3@8a00000 {
> +			compatible = "qcom,ipq5424-dwc3", "qcom,snps-dwc3";
> +			reg = <0 0x08a00000 0 0xfc100>;
>  
>  			clocks = <&gcc GCC_USB0_MASTER_CLK>,
>  				 <&gcc GCC_USB0_SLEEP_CLK>,
> @@ -771,34 +762,31 @@ usb3: usb3@8af8800 {
>  			assigned-clock-rates = <200000000>,
>  					       <24000000>;
>  
> -			interrupts-extended = <&intc GIC_SPI 412 IRQ_TYPE_LEVEL_HIGH>,
> +			interrupts-extended = <&intc GIC_SPI 409 IRQ_TYPE_LEVEL_HIGH>,
> +					      <&intc GIC_SPI 412 IRQ_TYPE_LEVEL_HIGH>,
>  					      <&intc GIC_SPI 414 IRQ_TYPE_LEVEL_HIGH>,
>  					      <&intc GIC_SPI 423 IRQ_TYPE_LEVEL_HIGH>,
>  					      <&intc GIC_SPI 424 IRQ_TYPE_LEVEL_HIGH>;
> -			interrupt-names = "pwr_event",
> +			interrupt-names = "dwc_usb3",
> +					  "pwr_event",
>  					  "qusb2_phy",
>  					  "dm_hs_phy_irq",
>  					  "dp_hs_phy_irq";
>  
>  			resets = <&gcc GCC_USB_BCR>;
> -			status = "disabled";
>  
> -			dwc_0: usb@8a00000 {
> -				compatible = "snps,dwc3";
> -				reg = <0 0x08a00000 0 0xcd00>;
> -				clocks = <&gcc GCC_USB0_MOCK_UTMI_CLK>;
> -				clock-names = "ref";
> -				interrupts = <GIC_SPI 409 IRQ_TYPE_LEVEL_HIGH>;
> -				phys = <&qusb_phy_0>, <&ssphy_0>;
> -				phy-names = "usb2-phy", "usb3-phy";
> -				tx-fifo-resize;
> -				snps,is-utmi-l1-suspend;
> -				snps,hird-threshold = /bits/ 8 <0x0>;
> -				snps,dis_u2_susphy_quirk;
> -				snps,dis_u3_susphy_quirk;
> -				snps,dis-u1-entry-quirk;
> -				snps,dis-u2-entry-quirk;
> -			};
> +			phys = <&qusb_phy_0>, <&ssphy_0>;
> +			phy-names = "usb2-phy", "usb3-phy";
> +
> +			tx-fifo-resize;
> +			snps,is-utmi-l1-suspend;
> +			snps,hird-threshold = /bits/ 8 <0x0>;
> +			snps,dis_u2_susphy_quirk;
> +			snps,dis_u3_susphy_quirk;
> +			snps,dis-u1-entry-quirk;
> +			snps,dis-u2-entry-quirk;
> +
> +			status = "disabled";
>  		};
>  
>  		timer@f420000 {
> 
> -- 
> 2.53.0
> 
> 
