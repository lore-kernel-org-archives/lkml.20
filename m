Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793962507;
	b=A0x2W02xo6iv7QspvJer2ppE/JEAxc1Lvs4FPVLSphgb8hIqdG78tVuZYM9PjGruMsNQ
	 b64VqekG5DkxUnDZ1caLc+m4p7Pv+PxtP3BkiYMD0y4u2PVZyOKNF1tdh5cPyK4x1t6LJ
	 dLR2lrmyDUmqQqFzJLyFFF/kR1T4M+dHWPptWMnOrvo/ny40cIwQM/HWADR8a4hWY59M8
	 G+KkWz/VTiiwZFoZvB238gCKBc9+MXHLrIyJrpT0k02wyzvvlMUNUZ4GAmQnbuDgBKqE5
	 aWuu7f4dMpOfm0IgKNqPdeqVjYHfVVbrF5/IHhGie1zoNZUkZar33Bjd+kGKQ8dZLHg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793962507;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:From:Reply-To:Subject:To:Cc:
	 References:Content-Language:Autocrypt:Organization:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=296xUxU8tn6mPRnshqQK79RjtnZgHDOcCRgt0Ddd2s8=;
	b=LPwcCK6ZOfr8ANC1fSoNnnonIN+8pwf0EIdfNNg4tvfd5HG6fYrmrAqYygHRGYb/XWjM
	 eFGrGmEuEQ9ZKLsXRd4cLAVRIP6xQ5lS1dwD+8ca1EyQLlWPJCxSKK9uSV9DQuhsWV32K
	 fT6v3TvmoP4R9Vw94e/eorwvLKpdEGGuL8P6J9T+ZptsetZCVbu1zqet/fDBijZm7fJhj
	 7dys1PcCHUayf8zWayhZRG2QO3unsUDnfuNkDJ76To3PjlP0KzWmYqsVM3E48O6YNTRMG
	 SmHeSwaUBGCCboTPGXL81gHiRcrI/Es0TFw1uywdiZZXpIGo7ymVyGoTlsaVH1nNCVA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=LcHB8DZr;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13674606A326
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 10:55:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 13674606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=LcHB8DZr
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a35d5d4a20so4849605e9.2
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 02:55:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793962505; x=1794567305; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=296xUxU8tn6mPRnshqQK79RjtnZgHDOcCRgt0Ddd2s8=;
        b=LcHB8DZrTKuLroG52e10jCH0CbTBPyHDfxnH2EuAjr3gEoMxb/58aOIkAsKSxIZl7O
         rhLhUWHSNpQpOnFJiIsCOuf6GShcSqHqeu7f9y8pllbkle7J1YWAEeQJNYEFyrhIppAB
         8Y1YVwlA3k4SITQr4JCFv8aTmISFc9CiTzSup+p8TyUkFNkfkCVvvsb3Nlh115BFM633
         4Szm61MMnAP3HpwKtvIlY3SYQbg++1yUf1zBdVzSEghyoHyjGNuKOiudXPW2fBu0wWQ4
         RVvkAiOjXan7MSaszIIJwEXtSVz03leWtn2eiSIZYCPgunSUDTzT998yDB6JdCXUSSYl
         pbNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793962505; x=1794567305;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=296xUxU8tn6mPRnshqQK79RjtnZgHDOcCRgt0Ddd2s8=;
        b=lUwXAYV1K1dHM/l3DtvV7GBsO1hP32D9/rWV6HIwJ+87IZ+ZHkFMMgSZ9rcgzvcBgq
         /OxHr12ocKOHHv9vCHjLHU6jwxMvIoNs9DpEDtYqIRCnZA+M0xdhWRXuTpNtvfQe5aer
         G8ObmRaWQRsoBPL4C9/2uhb8Bt8pkdXgnYNbuz9ZudFEdc6Xq3rehnAQtn/K0ETN/b75
         B/0qAG13/NA5CSwCwSsQnNC026Zz6K+2FEx9hCiuZgd4rSCLww/k/AP0ke7s9DN9NgCk
         Ono60DjbEgaq4gXsV+xkusO4+zrIo9PfupRnwMVMA8y5S86WbtjpYyZA1X9Ka8Uh5usK
         xFcg==
X-Forwarded-Encrypted: i=1; AKwUvBwRcHdAq//tKAGDO+uK3vhrV8/Zco+hzXZp3Te3/eyrpLRviYyYqs/ID6W7FZtV6rng/3pAq/IhPiDU+Y4=@vger.kernel.org
X-Gm-Message-State: APuU4Z+Hv6LNAzjqexj5tkDYK6tYNgX3ylFzBcrXfjRne3Pjgi6fNIpz
	q2eATamxc18kjYouZrN/Xu0syC6DCCfGDhBZC0KBq5GJcsSEuRHp4C3y1j/6R4totwU=
X-Gm-Gg: AYBFou35Ty/30cBPkmIfBAP3x/5nVaWMJ0v30CQuhJEKw1FlPkP7CSkCrq7WxbIC+Y6
	dY0tsayGBPK/KVcYTA8j8dTwj8b/pwcxrDSaYqMNvTEtMBnpVYDn/+Gxv4TvZuE0BSZWitoRhlK
	Z+GHnmQF8eRs8YYeQ2PJpAgoiQv2Ha6OqSukMxc38I9devlk/STlzBBU0CExOElIQeMYZOQAFV2
	uRgPp6kbVw/kl6s/pvE1GjzxJ0VlTCYrWbR3L4yaGJ/RFk8PwiG0BTONeUEhdMmAyq0awV2nd7M
	ZEVRG9LFKwYAZs93y+WC1uoeGPU4pCz/Nf31liVXRPnyd/HZkKAaHWbqsQkPxmjpdjJm0JAttvl
	+rsZt9KOgigxP1vEuP8j5zypi1Ln0QQTxTBuTwclF0kvFosim64DL6mPjsHrk4iO7DdC+Iy6mR3
	qVYzTX8KIuIZt8fI5PI0dLalRZw/0sztG6s9DOqpybRbk65cdxC09nXJQZkYpXKzisb88Zp8prc
	hEJNb1Q7CM7MGjExKnGCzTsiMmGDijz7LWvJHmyflwxoZIA4wDlUG2ykC45zgF4LH/0mEW/xYuq
	rPO5sGB5beXGGl8BXx6p2bxa1QWRihMVN0somzV1JJNgd+eMrS7cRoPaAUWxJeNxoTwNjXhQi1f
	dMNHp8wE=
X-Received: by 2002:a05:600c:1914:b0:4a4:7a8d:c436 with SMTP id 5b1f17b1804b1-4b6de788f5bmr33245395e9.11.1793962505296;
        Fri, 06 Nov 2026 02:55:05 -0800 (PST)
Received: from ?IPV6:2a01:e0a:106d:1080:9df2:2e39:58f0:72ca? ([2a01:e0a:106d:1080:9df2:2e39:58f0:72ca])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b6ed5b8159sm46157125e9.2.2026.11.06.02.55.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Nov 2026 02:55:05 -0800 (PST)
Message-ID: <d089bf43-5037-4ed6-93a5-c067ad1483b1@linaro.org>
Date: Fri, 6 Nov 2026 11:55:04 +0100
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
From: neil.armstrong@linaro.org
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 08/10] arm64: dts: amlogic: meson-s4: add the USB host
To: christian.koever-draxl@student.uibk.ac.at, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, khilman@baylibre.com,
 jbrunet@baylibre.com, martin.blumenstingl@googlemail.com
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 =?UTF-8?Q?Christian_Stefan_K=C3=B6v=C3=A9r-Draxl?= <ckoever@outlook.de>
References: <20261106104659.54656-1-christian.koever-draxl@student.uibk.ac.at>
 <20261106104659.54656-9-christian.koever-draxl@student.uibk.ac.at>
Content-Language: en-US, fr
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro
In-Reply-To: <20261106104659.54656-9-christian.koever-draxl@student.uibk.ac.at>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 11/6/26 11:46, christian.koever-draxl@student.uibk.ac.at wrote:
> From: Christian Stefan Kövér-Draxl <ckoever@outlook.de>
> 
> Add the two USB2 PHYs and the USB glue with its xHCI host controller.
> The S4 has no USB3 PHY, so the host runs USB2 only.
> 
> Signed-off-by: Christian Stefan Kövér-Draxl <ckoever@outlook.de>
> ---
>   arch/arm64/boot/dts/amlogic/meson-s4.dtsi | 45 +++++++++++++++++++++++
>   1 file changed, 45 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/meson-s4.dtsi b/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
> index 8bbd70e52a29..155997649dc3 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
> @@ -770,6 +770,26 @@ cpu_temp: temperature-sensor@20000 {
>   				amlogic,secure-monitor = <&sm 1>;
>   			};
>   
> +			usb2_phy0: phy@3c000 {
> +				compatible = "amlogic,s4-usb2-phy";
> +				reg = <0x0 0x3c000 0x0 0x2000>;
> +				clocks = <&xtal>;
> +				clock-names = "xtal";
> +				resets = <&reset RESET_USBPHY20>;
> +				reset-names = "phy";
> +				#phy-cells = <0>;
> +			};
> +
> +			usb2_phy1: phy@3e000 {
> +				compatible = "amlogic,s4-usb2-phy";
> +				reg = <0x0 0x3e000 0x0 0x2000>;
> +				clocks = <&xtal>;
> +				clock-names = "xtal";
> +				resets = <&reset RESET_USBPHY21>;
> +				reset-names = "phy";
> +				#phy-cells = <0>;
> +			};
> +
>   			eth_phy: mdio-multiplexer@28000 {
>   				compatible = "amlogic,g12a-mdio-mux";
>   				reg = <0x0 0x28000 0x0 0xa4>;
> @@ -988,6 +1008,31 @@ mdio0: mdio {
>   			};
>   		};
>   
> +		usb: usb@fe03a000 {
> +			compatible = "amlogic,meson-s4-usb-ctrl",
> +				     "amlogic,meson-g12a-usb-ctrl";
> +			reg = <0x0 0xfe03a000 0x0 0xa0>;
> +			interrupts = <GIC_SPI 129 IRQ_TYPE_LEVEL_HIGH>;
> +			#address-cells = <2>;
> +			#size-cells = <2>;
> +			ranges;
> +			clocks = <&clkc_periphs CLKID_USB>;
> +			resets = <&reset RESET_USBCTRL>;
> +			power-domains = <&pwrc PWRC_S4_USB_COMB_ID>;
> +			dr_mode = "host";
> +			phys = <&usb2_phy0>, <&usb2_phy1>;
> +			phy-names = "usb2-phy0", "usb2-phy1";
> +			status = "disabled";
> +
> +			crg_xhci: usb@fde00000 {
> +				compatible = "generic-xhci";
> +				reg = <0x0 0xfde00000 0x0 0x100000>;
> +				interrupts = <GIC_SPI 130 IRQ_TYPE_LEVEL_HIGH>;
> +				clocks = <&clkc_periphs CLKID_USB1_TO_DDR>;
> +				status = "okay";

Drop status

> +			};
> +		};
> +
>   		uart_a: serial@fe078000 {
>   			compatible = "amlogic,meson-s4-uart",
>   				     "amlogic,meson-ao-uart";

With that:
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil
