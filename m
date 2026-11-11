Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=160.236.53.87
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794389497;
	b=d0wElQxH97ZwFn6ih9rjnNURopBx5XiqgFL+2sporInTmDalz02qKwLw9ybrvnMzk5Sq
	 8gRzhU8ttM9DhffLvsfc8eaE+pj6NGt1LAES790EEh0tMsJxYfgNAqZbjDtE8ogG9K9bz
	 r9UqNIfUOdNvRXQ/ORDPnblHEfGbFtRa99wOKyZQwpoyW2XeKp9wUady0eY4+ID79Tg8t
	 VXvaM/B/mpNmMpz16JXy1gNaT/DhtGOxqrqEEm8MP+Oksio1+YhB+YBuLcjiUgBK/aUMj
	 AiPsfhWpz6cc9FWNiwLDzinaiW5aIiBcuGOsr/gRlSDadrKZ8BSEXAZ8Rt28z3c1lZA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794389497;
	h=DMARC-Filter:Received:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-HM-Tid:X-HM-MType:
	 X-HM-Spam-Status:DKIM-Signature;
	bh=C2cuMUzfqAtJpLaC4vioo9E+wmpwXHi1Jc/gRzevf2A=;
	b=U8n0esA7xd3mFeUWwZcMvU6LSSMs2PsNwHkUKjx5E5DnnBBcDayCjEr/SKaQODvtqozR
	 syMm1lXt/Zl3C2xW9BSWRaLEb9wTZ05DuFynBxXaAmSiZXSIQaJkd7+g+OMWQ01EdxcAM
	 om5TVXsjIcqVYO58YrNDdk18QfIKdCtpyo4UV863+RPUUz9W0QLu4lk+Lj3ol+5GRJ7Tc
	 cL1fYZtKduLYcZEqZKcIopMnpWnpemyn9nOYRdSvTqsThA5blG+w7CM9Wpea5EJ4/4aKD
	 pDVF6mHCqXpDQ9GBwL27LZgGjoT9oOZAjb3coQAUFMlgd5wv8vM/BBbxURqOsLK4oSA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rock-chips.com;
	spf=pass smtp.mailfrom=rock-chips.com;
	dkim=pass header.d=rock-chips.com header.i=@rock-chips.com header.a=rsa-sha256 header.s=default header.b=hTwkZitU;
	arc=none smtp.remote-ip=160.236.53.87
Received: from mail-m1602365387.xmail.ntesmail.com (mail-m1602365387.xmail.ntesmail.com [160.236.53.87])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52974606A321;
	Wed, 11 Nov 2026 09:31:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 52974606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=rock-chips.com header.i=@rock-chips.com header.a=rsa-sha256 header.s=default header.b=hTwkZitU
Received: from [172.16.12.90] (unknown [61.154.14.86])
	by smtp.qiye.163.com (Hmail) with ESMTP id 544c1233e;
	Wed, 11 Nov 2026 17:31:21 +0800 (GMT+08:00)
Message-ID: <dd59d491-82b0-4047-ae98-f8070f6be112@rock-chips.com>
Date: Wed, 11 Nov 2026 17:31:15 +0800
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
Subject: Re: [PATCH] arm64: dts: rockchip: Describe the Type-C port on RK3576
 EVB1
To: Alexey Charkov <alchark@flipper.net>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20261106-rk3576-evb1-husb311-v1-1-99c2f57ea2a5@flipper.net>
Content-Language: en-US
From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
In-Reply-To: <20261106-rk3576-evb1-husb311-v1-1-99c2f57ea2a5@flipper.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-HM-Tid: 0aa1c9f2996d03a7kunm04e86817850c70
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlDSEseVk0fGE1PHhlMTEkeT1YVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlNSlVKTk9VSk9VQ01ZV1kWGg8SFR0UWUFZT0tIVUpLSU
	9PT0hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=hTwkZitUQQ0AbxuUDmb0AWUloKZZxsb8SuK/b3HEWHcV0LS/5b3NeJOa/zsz0bJvUSFbwvwY59ldiD5vsQ4ibLdox5bJQ/9+xbqdwywCalBxMSl0HS1QyEmzxpzzmygHPTL+fJQTjhuYup8dCYeQnv3QvwF8m+/i4magR2fDWg8=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=C2cuMUzfqAtJpLaC4vioo9E+wmpwXHi1Jc/gRzevf2A=;
	h=date:mime-version:subject:message-id:from;

Hi Alexey,

On 11/7/2026 1:52 AM, Alexey Charkov wrote:
> RK3576 EVB1 has its USBDP PHY routed to a Type-C port with a HUSB311 CC
> controller and a fixed-voltage VBUS supply.
> 
> Describe it in the device tree, including the wiring for both the USB and
> the DP side.
> 
> This makes the data roles follow the Type-C port's negotiation, so the
> port stops being host only. It also leaves the VBUS regulator to be
> managed by TCPM instead of being hardwired via the tangentially related
> phy-supply on a USB controller. DP lanes are also muxed dynamically by
> the USBDP PHY based on the Type-C port's negotiation, so the hacky fixed
> lane muxing also goes away.
>

Have you tested this? As far as I know, dw-dp driver does not support
Type-C HPD yet.

> Signed-off-by: Alexey Charkov <alchark@flipper.net>
> ---
>  arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dts | 150 ++++++++++++++++++++++-
>  1 file changed, 147 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dts b/arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dts
> index f83d129f96f1..a9b27cdb2dfa 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dts
> +++ b/arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dts
> @@ -11,6 +11,7 @@
>  #include <dt-bindings/leds/common.h>
>  #include <dt-bindings/pinctrl/rockchip.h>
>  #include <dt-bindings/soc/rockchip,vop2.h>
> +#include <dt-bindings/usb/pd.h>
>  #include "rk3576.dtsi"
>  
>  / {
> @@ -334,6 +335,22 @@ &combphy1_psu {
>  	status = "okay";
>  };
>  
> +&dp {
> +	status = "okay";
> +};
> +
> +&dp0_in {
> +	dp0_in_vp1: endpoint {
> +		remote-endpoint = <&vp1_out_dp>;
> +	};
> +};
> +
> +&dp0_out {
> +	dp0_out_con: endpoint {
> +		remote-endpoint = <&usbdp_phy_dp_in>;
> +	};
> +};
> +
>  &gmac0 {
>  	clock_in_out = "output";
>  	phy-mode = "rgmii-rxid";
> @@ -772,6 +789,58 @@ regulator-state-mem {
>  &i2c2 {
>  	status = "okay";
>  
> +	usbc0: typec-portc@4e {
> +		compatible = "hynetek,husb311", "richtek,rt1711h";
> +		reg = <0x4e>;
> +		interrupt-parent = <&gpio0>;
> +		interrupts = <RK_PA5 IRQ_TYPE_LEVEL_LOW>;
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&usbc0_int>;
> +		vbus-supply = <&vbus5v0_typec>;
> +
> +		connector {
> +			compatible = "usb-c-connector";
> +			label = "USB-C";
> +			data-role = "dual";
> +			power-role = "source";
> +			source-pdos = <PDO_FIXED(5000, 2000,
> +						 PDO_FIXED_USB_COMM | PDO_FIXED_DATA_SWAP)>;
> +
> +			altmodes {
> +				displayport {
> +					svid = /bits/ 16 <0xff01>;
> +					vdo = <0x00001c46>;
> +				};
> +			};
> +
> +			ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				port@0 {
> +					reg = <0>;
> +					usbc0_hs: endpoint {
> +						remote-endpoint = <&usb_drd0_hs_ep>;
> +					};
> +				};
> +
> +				port@1 {
> +					reg = <1>;
> +					usbc0_ss: endpoint {
> +						remote-endpoint = <&usbdp_phy_ss_out>;
> +					};
> +				};
> +
> +				port@2 {
> +					reg = <2>;
> +					usbc0_sbu: endpoint {
> +						remote-endpoint = <&usbdp_phy_dp_out>;
> +					};
> +				};
> +			};
> +		};
> +	};
> +
>  	hym8563: rtc@51 {
>  		compatible = "haoyu,hym8563";
>  		reg = <0x51>;
> @@ -944,6 +1013,14 @@ usb_otg0_pwren: usb-otg0-pwren {
>  		usbc0_int: usbc0-int {
>  			rockchip,pins = <0 RK_PA5 RK_FUNC_GPIO &pcfg_pull_up>;
>  		};
> +
> +		usbc0_sbu1: usbc0-sbu1 {
> +			rockchip,pins = <2 RK_PA6 RK_FUNC_GPIO &pcfg_pull_none>;
> +		};
> +
> +		usbc0_sbu2: usbc0-sbu2 {
> +			rockchip,pins = <2 RK_PA7 RK_FUNC_GPIO &pcfg_pull_none>;
> +		};
>  	};
>  
>  	wifi {
> @@ -1008,7 +1085,6 @@ &u2phy0 {
>  };
>  
>  &u2phy0_otg {
> -	phy-supply = <&vbus5v0_typec>;
>  	status = "okay";
>  };
>  
> @@ -1051,13 +1127,74 @@ &ufshc {
>  };
>  
>  &usbdp_phy {
> -	rockchip,dp-lane-mux = <2 3>;
> +	mode-switch;
> +	orientation-switch;
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&usbc0_sbu1 &usbc0_sbu2>;
> +	sbu1-dc-gpios = <&gpio2 RK_PA6 GPIO_ACTIVE_HIGH>;
> +	sbu2-dc-gpios = <&gpio2 RK_PA7 GPIO_ACTIVE_HIGH>;
>  	status = "okay";
> +
> +	ports {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		port@0 {
> +			reg = <0>;
> +
> +			usbdp_phy_ss_out: endpoint {
> +				remote-endpoint = <&usbc0_ss>;
> +			};
> +		};
> +
> +		port@1 {
> +			reg = <1>;
> +
> +			usbdp_phy_ss_in: endpoint {
> +				remote-endpoint = <&usb_drd0_ss_ep>;
> +			};
> +		};
> +
> +		port@2 {
> +			reg = <2>;
> +
> +			usbdp_phy_dp_in: endpoint {
> +				remote-endpoint = <&dp0_out_con>;
> +			};
> +		};
> +
> +		port@3 {
> +			reg = <3>;
> +
> +			usbdp_phy_dp_out: endpoint {
> +				remote-endpoint = <&usbc0_sbu>;
> +			};
> +		};
> +	};
>  };
>  
>  &usb_drd0_dwc3 {
> -	dr_mode = "host";
> +	usb-role-switch;
>  	status = "okay";
> +
> +	ports {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		port@0 {
> +			reg = <0>;
> +			usb_drd0_hs_ep: endpoint {
> +				remote-endpoint = <&usbc0_hs>;
> +			};
> +		};
> +
> +		port@1 {
> +			reg = <1>;
> +			usb_drd0_ss_ep: endpoint {
> +				remote-endpoint = <&usbdp_phy_ss_in>;
> +			};
> +		};
> +	};
>  };
>  
>  &usb_drd1_dwc3 {
> @@ -1079,3 +1216,10 @@ vp0_out_hdmi: endpoint@ROCKCHIP_VOP2_EP_HDMI0 {
>  		remote-endpoint = <&hdmi_in_vp0>;
>  	};
>  };
> +
> +&vp1 {
> +	vp1_out_dp: endpoint@a {
> +		reg = <ROCKCHIP_VOP2_EP_DP0>;
> +		remote-endpoint = <&dp0_in_vp1>;
> +	};
> +};
> 
> ---
> base-commit: ddfe51b0a0f5dc9e415cc2c8ad8db17532dd426b
> change-id: 20261106-rk3576-evb1-husb311-00efcff4a808
> 
> Best regards,
> --  
> Alexey Charkov <alchark@flipper.net>

-- 
Best, 
Chaoyi
