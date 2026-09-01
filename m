Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B03493815E1;
	Tue,  1 Sep 2026 10:20:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788258049; cv=none; b=C8p24CD8qa4hVwJ67aybsrEUMgYge8xm36OJ7bOYmMlVivWIlaZnQo9ESpWcAoU/HmHGIB6i6iXduVEqgnshdGgtBCJ/f+AFH91C07DNm+LtyUOz5/07mzBGwBMNOW5HH0FStkhCqg/Y/ylV3d42Wx2WASb2t8LgJHwtomndo58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788258049; c=relaxed/simple;
	bh=bH/cyuEmH8e42aHPDwxlQ95WZHFNp6qYvd4pHWTgC2c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uIMM90o/t27gMZ9Ei2qHcp9WldnnnTb9CPHW25dTPKEXkwvl8eTHia3ogeVd9sqd0gdOyWKFk+RE+MXxxkvV1dyCadnvfFmb/cCRkTsQaugdOduB/16qZMva8hmkKRugtSk3TFjmwh5dj+xPikD0JI8AJPdBuM/R1Y63dTDnqa8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Y030m2Uk; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Y030m2Uk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788258047; x=1819794047;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=bH/cyuEmH8e42aHPDwxlQ95WZHFNp6qYvd4pHWTgC2c=;
  b=Y030m2UkkQ4/LsdYEhyQkKLxGdRtB2MvmUZtf1UeWWm/H+kNfsMektvL
   iZX4YnJaYd/JRH0Cw2jqAikdiThQlxPp/ONvGHZH82yPyIutbQ4Azysx+
   997FN1AbbKAm1MFMrWmPeAWpeuNuIgTbaDd8/nYymoak2gSWF7j3/0CrR
   yS8sgiBqtidRFhyvMW88egAL8xiS2z9VmaY5c1PeZJGH7bYobFwRppuLi
   lWxgTu7igZwdpNad+GLOidQmU950ZgZW9JyH6L5XQHEinAz79HC3OPUP/
   fZJJH2PCYBGb7bsGwWiypSL63nayfflROKIMYdXA7VsfOhRbz58iES/19
   A==;
X-CSE-ConnectionGUID: 7lFc5RQlQSyo9RcOOWRqLg==
X-CSE-MsgGUID: T9KKFme7T3a4VsERPngmPg==
X-IronPort-AV: E=McAfee;i="6800,10657,11892"; a="88608687"
X-IronPort-AV: E=Sophos;i="6.25,255,1779174000"; 
   d="scan'208";a="88608687"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2026 03:20:47 -0700
X-CSE-ConnectionGUID: nlax7mflS7ilXTp0XV4EoQ==
X-CSE-MsgGUID: tswa2/1zQbGg/UccToCrVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,255,1779174000"; 
   d="scan'208";a="298947127"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa002.jf.intel.com with ESMTP; 01 Sep 2026 03:20:42 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 79DCD99; Tue, 01 Sep 2026 12:20:41 +0200 (CEST)
Date: Tue, 1 Sep 2026 12:20:41 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Sven Peter <sven@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>,
	Andreas Noever <andreas.noever@gmail.com>,
	Mika Westerberg <westeri@kernel.org>,
	Yehezkel Bernat <YehezkelShB@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Konrad Dybcio <konradybcio@kernel.org>, linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 17/19] arm64: dts: apple: t8103: Add USB4 ACIO and NHI
Message-ID: <20260901102041.GG106095@black.igk.intel.com>
References: <20260830-b4-apple-soc-tbt-v1-0-44bc9348683c@kernel.org>
 <20260830-b4-apple-soc-tbt-v1-17-44bc9348683c@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260830-b4-apple-soc-tbt-v1-17-44bc9348683c@kernel.org>

On Sun, Aug 30, 2026 at 10:19:35PM +0200, Sven Peter wrote:
> Add the ACIO host router, NHI, DART and M3 mailbox nodes for both
> Type-C ports on t8103 and connect the host routers to the Type-C
> connectors.
> 
> Signed-off-by: Sven Peter <sven@kernel.org>
> ---
>  arch/arm64/boot/dts/apple/t8103-jxxx.dtsi |  61 ++++++++++
>  arch/arm64/boot/dts/apple/t8103.dtsi      | 188 ++++++++++++++++++++++++++++++
>  2 files changed, 249 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/apple/t8103-jxxx.dtsi b/arch/arm64/boot/dts/apple/t8103-jxxx.dtsi
> index 686fb1dd215d..acdefa2a0084 100644
> --- a/arch/arm64/boot/dts/apple/t8103-jxxx.dtsi
> +++ b/arch/arm64/boot/dts/apple/t8103-jxxx.dtsi
> @@ -17,6 +17,10 @@ aliases {
>  		wifi0 = &wifi0;
>  		atcphy0 = &atcphy0;
>  		atcphy1 = &atcphy1;
> +		usb4-0-acio = &usb4_0_acio;
> +		usb4-0-nhi = &usb4_0_nhi;
> +		usb4-1-acio = &usb4_1_acio;
> +		usb4-1-nhi = &usb4_1_nhi;
>  	};
>  
>  	chosen {
> @@ -76,6 +80,13 @@ typec0_connector_ss: endpoint {
>  						remote-endpoint = <&atcphy0_typec_lanes>;
>  					};
>  				};
> +
> +				port@2 {
> +					reg = <2>;
> +					typec0_con_tbt: endpoint {
> +						remote-endpoint = <&usb4_0_acio_tbt>;
> +					};
> +				};
>  			};
>  		};
>  	};
> @@ -107,6 +118,13 @@ typec1_connector_ss: endpoint {
>  						remote-endpoint = <&atcphy1_typec_lanes>;
>  					};
>  				};
> +
> +				port@2 {
> +					reg = <2>;
> +					typec1_con_tbt: endpoint {
> +						remote-endpoint = <&usb4_1_acio_tbt>;
> +					};
> +				};
>  			};
>  		};
>  	};
> @@ -198,6 +216,49 @@ atcphy1_usb3: endpoint {
>  	};
>  };
>  
> +/* USB4 */
> +&usb4_0_acio {
> +	ports {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		/* 1: USB4 port */
> +		port@1 {
> +			reg = <1>;
> +			usb4_0_acio_tbt: endpoint {
> +				remote-endpoint = <&typec0_con_tbt>;
> +			};
> +		};
> +
> +		/* 2: unused(?) USB4 port */

I'm assuming these are all adapters in a router so the 2 here is the lane 1
adapter. One USB4 port has always 2 lane adapters: lane 0 and lane 1.


> +		/* 3: PCIe */
> +		/* 4: USB3 */
> +		/* 5: DP0 */
> +		/* 6: DP1 */
> +	};
> +};
> +
> +&usb4_1_acio {
> +	ports {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		/* 1: USB4 port */
> +		port@1 {
> +			reg = <1>;
> +			usb4_1_acio_tbt: endpoint {
> +				remote-endpoint = <&typec1_con_tbt>;
> +			};
> +		};
> +
> +		/* 2: unused(?) USB4 port */

Same here.

> +		/* 3: PCIe */
> +		/* 4: USB3 */
> +		/* 5: DP0 */
> +		/* 6: DP1 */
> +	};
> +};
> +
>  /*
>   * Force the bus number assignments so that we can declare some of the
>   * on-board devices and properties that are populated by the bootloader
> diff --git a/arch/arm64/boot/dts/apple/t8103.dtsi b/arch/arm64/boot/dts/apple/t8103.dtsi
> index 5b68bf0df4e6..f83ed8da9a42 100644
> --- a/arch/arm64/boot/dts/apple/t8103.dtsi
> +++ b/arch/arm64/boot/dts/apple/t8103.dtsi
> @@ -982,6 +982,14 @@ pinctrl_aop: pinctrl@24a820000 {
>  				     <AIC_IRQ 272 IRQ_TYPE_LEVEL_HIGH>,
>  				     <AIC_IRQ 273 IRQ_TYPE_LEVEL_HIGH>,
>  				     <AIC_IRQ 274 IRQ_TYPE_LEVEL_HIGH>;
> +
> +			acio0_pins: acio0-pins {
> +				pinmux = <APPLE_PINMUX(39, 1)>;
> +			};
> +
> +			acio1_pins: acio1-pins {
> +				pinmux = <APPLE_PINMUX(41, 1)>;
> +			};
>  		};
>  
>  		ans_mbox: mbox@277408000 {
> @@ -1018,6 +1026,96 @@ nvme@27bcc0000 {
>  			resets = <&ps_ans2>;
>  		};
>  
> +		usb4_0_mbox: mailbox@381100000 {
> +			compatible = "apple,t8103-m3-mailbox",
> +				"apple,m3-mailbox-v2";
> +			reg = <0x3 0x81100000 0x0 0x4000>;
> +			interrupt-parent = <&aic>;
> +			interrupts = <AIC_IRQ 812 IRQ_TYPE_LEVEL_HIGH>,
> +				<AIC_IRQ 813 IRQ_TYPE_LEVEL_HIGH>,
> +				<AIC_IRQ 814 IRQ_TYPE_LEVEL_HIGH>,
> +				<AIC_IRQ 815 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names = "send-empty", "send-not-empty",
> +				"recv-empty", "recv-not-empty";
> +			#mbox-cells = <0>;
> +		};
> +
> +		usb4_0_acio: cio@381ac0000 {
> +			compatible = "apple,t8103-usb4-acio";
> +			reg = <0x3 0x81ac0000 0x0 0xc000>,
> +				<0x3 0x81080000 0x0 0x20000>;
> +			reg-names = "rc", "sram";
> +
> +			mboxes = <&usb4_0_mbox>;
> +			resets = <&cio_reset 0>;
> +
> +			power-domains = <&ps_atc0_cio>,
> +					<&ps_atc0_cio_pcie>,
> +					<&ps_atc0_cio_usb>;
> +
> +			thunderbolt-switch;
> +
> +			pinctrl-0 = <&acio0_pins>;
> +			pinctrl-names = "default";
> +
> +			#address-cells = <1>;
> +			#size-cells = <1>;
> +			ranges = <0x0 0x3 0x81000000 0x1000000>;
> +			nonposted-mmio;
> +
> +			usb4_0_dart: iommu@a80000 {
> +				compatible = "apple,t8103-dart";
> +				reg = <0xa80000 0x4000>;
> +				interrupt-parent = <&aic>;
> +				interrupts = <AIC_IRQ 810 IRQ_TYPE_LEVEL_HIGH>;
> +				#iommu-cells = <1>;
> +			};
> +
> +			usb4_0_nhi: nhi@f00000 {
> +				reg = <0xf00000 0x100000>,
> +					<0xdb0000 0x30004>;
> +				reg-names = "nhi", "pdf";
> +				compatible = "apple,t8103-usb4-nhi";
> +				interrupt-parent = <&aic>;
> +				interrupts = <AIC_IRQ 783 IRQ_TYPE_LEVEL_HIGH>,
> +					<AIC_IRQ 784 IRQ_TYPE_LEVEL_HIGH>,
> +					<AIC_IRQ 785 IRQ_TYPE_LEVEL_HIGH>,
> +					<AIC_IRQ 786 IRQ_TYPE_LEVEL_HIGH>,
> +					<AIC_IRQ 787 IRQ_TYPE_LEVEL_HIGH>,
> +					<AIC_IRQ 788 IRQ_TYPE_LEVEL_HIGH>,
> +					<AIC_IRQ 789 IRQ_TYPE_LEVEL_HIGH>,
> +					<AIC_IRQ 790 IRQ_TYPE_LEVEL_HIGH>,
> +					<AIC_IRQ 791 IRQ_TYPE_LEVEL_HIGH>,
> +					<AIC_IRQ 792 IRQ_TYPE_LEVEL_HIGH>,
> +					<AIC_IRQ 793 IRQ_TYPE_LEVEL_HIGH>,
> +					<AIC_IRQ 794 IRQ_TYPE_LEVEL_HIGH>,
> +					<AIC_IRQ 795 IRQ_TYPE_LEVEL_HIGH>,
> +					<AIC_IRQ 796 IRQ_TYPE_LEVEL_HIGH>,
> +					<AIC_IRQ 797 IRQ_TYPE_LEVEL_HIGH>,
> +					<AIC_IRQ 798 IRQ_TYPE_LEVEL_HIGH>,
> +					<AIC_IRQ 799 IRQ_TYPE_LEVEL_HIGH>,
> +					<AIC_IRQ 800 IRQ_TYPE_LEVEL_HIGH>,
> +					<AIC_IRQ 801 IRQ_TYPE_LEVEL_HIGH>,
> +					<AIC_IRQ 802 IRQ_TYPE_LEVEL_HIGH>,
> +					<AIC_IRQ 803 IRQ_TYPE_LEVEL_HIGH>,
> +					<AIC_IRQ 804 IRQ_TYPE_LEVEL_HIGH>,
> +					<AIC_IRQ 805 IRQ_TYPE_LEVEL_HIGH>,
> +					<AIC_IRQ 806 IRQ_TYPE_LEVEL_HIGH>;
> +				interrupt-names =
> +					"txring0", "txring1", "txring2",
> +					"txring3", "txring4", "txring5",
> +					"txring6", "txring7", "txring8",
> +					"txring9", "txring10", "txring11",
> +					"rxring0", "rxring1", "rxring2",
> +					"rxring3", "rxring4", "rxring5",
> +					"rxring6", "rxring7", "rxring8",
> +					"rxring9", "rxring10", "rxring11";
> +				iommus = <&usb4_0_dart 1>;
> +				/* To be filled by the loader */
> +				apple,thunderbolt-drom = [00];
> +			};
> +		};
> +
>  		dwc3_0: usb@382280000 {
>  			compatible = "apple,t8103-dwc3";
>  			reg = <0x3 0x82280000 0x0 0xcd00>, <0x3 0x8228cd00 0x0 0x3200>;
> @@ -1070,6 +1168,96 @@ atcphy0: phy@383000000 {
>  			power-domains = <&ps_atc0_usb>;
>  		};
>  
> +		usb4_1_mbox: mailbox@501100000 {
> +			compatible = "apple,t8103-m3-mailbox",
> +				"apple,m3-mailbox-v2";
> +			reg = <0x5 0x01100000 0x0 0x4000>;
> +			interrupt-parent = <&aic>;
> +			interrupts = <AIC_IRQ 892 IRQ_TYPE_LEVEL_HIGH>,
> +				<AIC_IRQ 893 IRQ_TYPE_LEVEL_HIGH>,
> +				<AIC_IRQ 894 IRQ_TYPE_LEVEL_HIGH>,
> +				<AIC_IRQ 895 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names = "send-empty", "send-not-empty",
> +				"recv-empty", "recv-not-empty";
> +			#mbox-cells = <0>;
> +		};
> +
> +		usb4_1_acio: cio@501ac0000 {
> +			compatible = "apple,t8103-usb4-acio";
> +			reg = <0x5 0x01ac0000 0x0 0xc000>,
> +				<0x5 0x01080000 0x0 0x20000>;
> +			reg-names = "rc", "sram";
> +
> +			mboxes = <&usb4_1_mbox>;
> +			resets = <&cio_reset 1>;
> +
> +			power-domains = <&ps_atc1_cio>,
> +					<&ps_atc1_cio_pcie>,
> +					<&ps_atc1_cio_usb>;
> +
> +			thunderbolt-switch;
> +
> +			pinctrl-0 = <&acio1_pins>;
> +			pinctrl-names = "default";
> +
> +			#address-cells = <1>;
> +			#size-cells = <1>;
> +			ranges = <0x0 0x5 0x01000000 0x1000000>;
> +			nonposted-mmio;
> +
> +			usb4_1_dart: iommu@a80000 {
> +				compatible = "apple,t8103-dart";
> +				reg = <0xa80000 0x4000>;
> +				interrupt-parent = <&aic>;
> +				interrupts = <AIC_IRQ 890 IRQ_TYPE_LEVEL_HIGH>;
> +				#iommu-cells = <1>;
> +			};
> +
> +			usb4_1_nhi: nhi@f00000 {
> +				reg = <0xf00000 0x100000>,
> +					<0xdb0000 0x30004>;
> +				reg-names = "nhi", "pdf";
> +				compatible = "apple,t8103-usb4-nhi";
> +				interrupt-parent = <&aic>;
> +				interrupts = <AIC_IRQ 863 IRQ_TYPE_LEVEL_HIGH>,
> +					<AIC_IRQ 864 IRQ_TYPE_LEVEL_HIGH>,
> +					<AIC_IRQ 865 IRQ_TYPE_LEVEL_HIGH>,
> +					<AIC_IRQ 866 IRQ_TYPE_LEVEL_HIGH>,
> +					<AIC_IRQ 867 IRQ_TYPE_LEVEL_HIGH>,
> +					<AIC_IRQ 868 IRQ_TYPE_LEVEL_HIGH>,
> +					<AIC_IRQ 869 IRQ_TYPE_LEVEL_HIGH>,
> +					<AIC_IRQ 870 IRQ_TYPE_LEVEL_HIGH>,
> +					<AIC_IRQ 871 IRQ_TYPE_LEVEL_HIGH>,
> +					<AIC_IRQ 872 IRQ_TYPE_LEVEL_HIGH>,
> +					<AIC_IRQ 873 IRQ_TYPE_LEVEL_HIGH>,
> +					<AIC_IRQ 874 IRQ_TYPE_LEVEL_HIGH>,
> +					<AIC_IRQ 875 IRQ_TYPE_LEVEL_HIGH>,
> +					<AIC_IRQ 876 IRQ_TYPE_LEVEL_HIGH>,
> +					<AIC_IRQ 877 IRQ_TYPE_LEVEL_HIGH>,
> +					<AIC_IRQ 878 IRQ_TYPE_LEVEL_HIGH>,
> +					<AIC_IRQ 879 IRQ_TYPE_LEVEL_HIGH>,
> +					<AIC_IRQ 880 IRQ_TYPE_LEVEL_HIGH>,
> +					<AIC_IRQ 881 IRQ_TYPE_LEVEL_HIGH>,
> +					<AIC_IRQ 882 IRQ_TYPE_LEVEL_HIGH>,
> +					<AIC_IRQ 883 IRQ_TYPE_LEVEL_HIGH>,
> +					<AIC_IRQ 884 IRQ_TYPE_LEVEL_HIGH>,
> +					<AIC_IRQ 885 IRQ_TYPE_LEVEL_HIGH>,
> +					<AIC_IRQ 886 IRQ_TYPE_LEVEL_HIGH>;
> +				interrupt-names =
> +					"txring0", "txring1", "txring2",
> +					"txring3", "txring4", "txring5",
> +					"txring6", "txring7", "txring8",
> +					"txring9", "txring10", "txring11",
> +					"rxring0", "rxring1", "rxring2",
> +					"rxring3", "rxring4", "rxring5",
> +					"rxring6", "rxring7", "rxring8",
> +					"rxring9", "rxring10", "rxring11";
> +				iommus = <&usb4_1_dart 1>;
> +				/* To be filled by the loader */
> +				apple,thunderbolt-drom = [00];
> +			};
> +		};
> +
>  		dwc3_1: usb@502280000 {
>  			compatible = "apple,t8103-dwc3";
>  			reg = <0x5 0x02280000 0x0 0xcd00>, <0x5 0x0228cd00 0x0 0x3200>;
> 
> -- 
> 2.55.0
> 
