Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC54943BDA7
	for <linux-kernel@vger.kernel.org>; Sun,  4 Oct 2026 15:29:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791127760; cv=none; b=FjLx7BkDIqJEwszskpwB0MiOD5+ck7DBW42+y2PkYiWQazvcgj92dvCI5OwdXwqNC9Gx34L0yr8W4/gepltkEzPyIA6WzaHmXAkQWfOiWTaXIZglN164TeSp2Rtjk58ccayOHmCpfXZoYM0ym5Sf6li4b/U9X23MHUiQZ36x+O0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791127760; c=relaxed/simple;
	bh=dp0/nCH05DwygzWEsV1XBCgBJ8K4fIcNyE/T0vIMAr4=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=k5NO95BcHQe/HAYkhidNNUbRewaSnDIJuzyJvi2Elr1SB4VJxtoBtlDgrLTVc2ie8YM41SJsFuuAZmCZHclS++N6niaWgGdwQ3lVAxJZcAuZfyrXhNuGAxgeMKURFZq2o99s3GIqVEYNLeeJsVE8MLkWAG/QStHtbqOqqzJmB08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mRYhgNiD; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mRYhgNiD"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-4834977ae75so437541f8f.3
        for <linux-kernel@vger.kernel.org>; Sun, 04 Oct 2026 08:29:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1791127757; x=1791732557; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=i3n8J2PGXLDx/H5KLegGco+ygP5/7+r1Zqv1kXmn61w=;
        b=mRYhgNiDOpbsb/KbDnmqaEszbxWmIRzCpndJkQFw0ABhexqsVIopjprnglivtSlvDU
         /KpufS8FP/8nx2CjIGsMwD/KXoLPWBWmf23xhR1kTmxlhae1lyOEnOPfPhsMMDUisNW8
         eqMHe7C+9YjhVIkgtI8dVRVURsuVrewDDCIhmfF7UOap386Hu6yQMtg96QY9VOHS4pJ3
         GPadtTLcmXjPZ4z9siLdeI4EdWZ8/Z5KE2OmnSItc4VSvzcG3tZPcxbmmza9twfkuFC/
         7EnH2akgCCsjT5MUlxSkH0Y3Sglk3Z1PFiZWtHOelhBRN0gDEc7W6jcRPhZxsyfWseTf
         49Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791127757; x=1791732557;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=i3n8J2PGXLDx/H5KLegGco+ygP5/7+r1Zqv1kXmn61w=;
        b=iQdRdx4YZm0psPYbJ4VhrW2u+TyzFT2nzQzPvTMiGgw8IAes6yQHK9qJl3MEUHN7Hc
         d5kh/NmDs63iGWJ8jA1LNKAXJpztDZGlCy/uN2RSagxLaRE624AEkVGQrMqIBZQL0i9X
         Iru5qmT3wzewxgjzZ9Ox9Zmaph4qejmu3UPw0PvLMWaC0/ZUsggEofN/8OnH98Ts+kXY
         uVORnteR1O23F3PxJJc0LRUax0DEClCDwf5s25Y1H3aCB3RBLPW9JLHxwvZw11slZnWT
         ZpsIaiZV0PRIhy2Aw65ZAp2QCv6+1KoxUy4Nl7//NabcUwVSn3lW861+BjYCmLbbX1HG
         DIMQ==
X-Forwarded-Encrypted: i=1; AKwUvByzvck29dHkW6GTjKJrEChOvJAM8Wx1Ow7gWoYGUTimPiNsEtBT8+QcIURWmYSkY8w+3y8zR0G5If/OW8Q=@vger.kernel.org
X-Gm-Message-State: AFuF++ln3C+Xiu3osBOsZznv+EDwlb4a6xG+j6F8p//fEDghDAJlFvmt
	E4aby/9RBpXbPXyujm2wPwHqHWcuxkSBySPuuAfeEKPPMnxn2rQ2/GZzkgcHaLrsas0=
X-Gm-Gg: AYBFou1teZJkj5LxF9pdy7z6oiwqvmh1cBzBnhvHN36GJq/L0z8Zu01XS3phZFlmYCU
	BRCGGNo7TF4FHhwvtc4UI9CxdrFBoLp/OpFSckhlnBTO/hvpIVhwQXHZhBQOjVtw/xbwHalnI/O
	tUgTyl2wwaecqs+CWga3TV2+0VV9GL1gCFJ+ionxMtS8S/3wW62x01BdCx4ONqZHne02GpifwcK
	cNTYC4yyb2kmIMZYYWdJ3Qj7UFOPsG614DLUyL1sa12EVWUNXaR/SCTJWa21rgzUfXD1X9SlAu2
	qwhT0VNuDlNyyrt8l7T8ZBFTdhOdhUnXH8yL0F+BRprQGuqKaIRNGuZjS09zEgtkOqMwPuOV//o
	3/xqDPm0K8XxiBtHkP/9VWJT6K3p9Ydx5IoCMIM2AxI+Cq3oxfGZ4Cb/NjZ0ahILbsFFlBsJpsk
	syXqQNRuWs8+S23wHrHgkdGFcGuNunhSbJRnr5GZ3NFLEH8+MATCR11Di+D8slfT9pJesKPvJz0
	uCnwoZF
X-Received: by 2002:a05:600c:4ecf:b0:49f:ce78:3567 with SMTP id 5b1f17b1804b1-4a02769ceefmr145584105e9.24.1791127756918;
        Sun, 04 Oct 2026 08:29:16 -0700 (PDT)
Received: from [172.20.10.3] ([37.169.53.153])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a02769a818sm280087545e9.2.2026.10.04.08.29.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 04 Oct 2026 08:29:16 -0700 (PDT)
Message-ID: <30637763-03bf-4d3c-a9e9-769de28c729d@linaro.org>
Date: Sun, 4 Oct 2026 17:29:10 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [RFC PATCH 5/6] arm64: dts: amlogic: t7: add the ethernet
 controller
To: Lucas Tanure <tanure@linux.com>, xianwei.zhao@amlogic.com,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
References: <20261004144046.391444-1-tanure@linux.com>
 <20261004144046.391444-6-tanure@linux.com>
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
In-Reply-To: <20261004144046.391444-6-tanure@linux.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/4/26 16:40, Lucas Tanure wrote:
> The SoC pairs a Synopsys gigabit MAC with a small block of glue
> registers that selects the interface type and trims the clock timing,
> and with a multiplexer that points the management bus at either the
> on-chip 100M PHY or the external pins. None of it was described, so the
> port could not be used at all.
> 
> Add the controller and the multiplexer. The MAC reports a 5.10a core.
> The path the controller reaches memory over runs through a pipeline
> stage with a gate of its own, so hand that to the controller as well;
> nothing else claims it and it would otherwise be switched off as unused,
> leaving the port unable to complete a transfer.
> 
> The on-chip PHY behind the second port of the multiplexer is described
> the way the G12A does it. No board in tree uses it and that path is
> untested.
> 
> The controller is left disabled for boards to enable.
> 
> Assisted-by: LLM
> Signed-off-by: Lucas Tanure <tanure@linux.com>
> ---
>   arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi | 57 +++++++++++++++++++++
>   1 file changed, 57 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
> index 7bd53ec16607..140f1836f3dd 100644
> --- a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
> @@ -250,6 +250,31 @@ gic: interrupt-controller@fff01000 {
>   			interrupts = <GIC_PPI 9 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_HIGH)>;
>   		};
>   
> +		ethmac: ethernet@fdc00000 {
> +			compatible = "amlogic,t7-dwmac",
> +				     "snps,dwmac-5.10a",
> +				     "snps,dwmac";
> +			reg = <0x0 0xfdc00000 0x0 0x10000>,
> +			      <0x0 0xfe024000 0x0 0x8>;
> +			interrupts = <GIC_SPI 74 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names = "macirq";
> +			clocks = <&clkc_periphs CLKID_SYS_ETH>,
> +				 <&scmi_clk CLKID_FCLK_DIV2>,
> +				 <&mpll CLKID_MPLL2>,
> +				 <&clkc_periphs CLKID_SYS_AMPIPE_ETH>;
> +			clock-names = "stmmaceth", "clkin0", "clkin1", "pipeline";
> +			power-domains = <&pwrc PWRC_T7_ETH_ID>;
> +			rx-fifo-depth = <4096>;
> +			tx-fifo-depth = <2048>;
> +			status = "disabled";
> +
> +			mdio0: mdio {
> +				compatible = "snps,dwmac-mdio";
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +			};
> +		};
> +
>   		apb4: bus@fe000000 {
>   			compatible = "simple-bus";
>   			reg = <0x0 0xfe000000 0x0 0x480000>;
> @@ -645,6 +670,38 @@ gpio_intc: interrupt-controller@4080 {
>   					<10 11 12 13 14 15 16 17 18 19 20 21>;
>   			};
>   
> +			eth_phy: mdio-multiplexer@28000 {
> +				compatible = "amlogic,g12a-mdio-mux";
> +				reg = <0x0 0x28000 0x0 0xa4>;
> +				clocks = <&clkc_periphs CLKID_SYS_ETHPHY>,
> +					 <&xtal>,
> +					 <&scmi_clk CLKID_FCLK_50M>;
> +				clock-names = "pclk", "clkin0", "clkin1";
> +				mdio-parent-bus = <&mdio0>;
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				ext_mdio: mdio@0 {
> +					reg = <0>;
> +					#address-cells = <1>;
> +					#size-cells = <0>;
> +				};
> +
> +				int_mdio: mdio@1 {
> +					reg = <1>;
> +					#address-cells = <1>;
> +					#size-cells = <0>;
> +
> +					internal_ephy: ethernet-phy@8 {
> +						compatible = "ethernet-phy-id0180.3301",
> +							     "ethernet-phy-ieee802.3-c22";
> +						interrupts = <GIC_SPI 340 IRQ_TYPE_LEVEL_HIGH>;
> +						reg = <8>;
> +						max-speed = <100>;
> +					};
> +				};
> +			};
> +
>   			uart_a: serial@78000 {
>   				compatible = "amlogic,t7-uart", "amlogic,meson-s4-uart";
>   				reg = <0x0 0x78000 0x0 0x18>;

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil
