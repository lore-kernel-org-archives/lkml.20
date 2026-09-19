Received: from smtp.forwardemail.net (smtp.forwardemail.net [121.127.44.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F048722D7A1
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 09:39:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=121.127.44.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789810752; cv=none; b=caPp0eUWTD6Ns9cbDtmygRJ65IHoCmnIaIjQmxx0RzM683PlZ6l+cCXsIsioev+X2hyrayzxtY2HqSM0+bvwt1n3RhOed+2EetT3Q46QQvcLlHrhDkTkk7HHKr2H30dRm8iRuiawY15JaSlELtDYQ3BIdVkRVActl/4a+58djII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789810752; c=relaxed/simple;
	bh=aRwzNsIL/5bajiWK0LSBq7YOtWlomb4QGW1kHG1eh8I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DK7xOSxGmwId6/Gm79kEQMsiaRjHTakqpRD7EfS05sjmWrYnfWM828lTJZ9ei4ZvMWDnJDdGU2PXTnwUJUshk8KEHWge8DcWmS3w3qXiw3hZnVqTuNAFkvJ3iCr5z7Q6mtzu3ta38MdwSj3ePpj4gW9465PXriiSQiILF/lDUCI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kwiboo.se; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se; dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.b=InOh+eNG; arc=none smtp.client-ip=121.127.44.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kwiboo.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.b="InOh+eNG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: Content-Type: In-Reply-To: From: References:
 Cc: To: Subject: MIME-Version: Date: Message-ID; q=dns/txt;
 s=fe-e1b5cab7be; t=1789810750;
 bh=C5v7Aljt9tHacvzfj3/FAUxs1cLBe5dXs4Hz04Y3k7U=;
 b=InOh+eNGWfkcq1PRz7IBDw4PqQQeFvydZKBat5KBHfBhZu4nL4n1WMyuIDMhpC6+IgOsPUncs
 q74u24gaAQxP7YJ1U4P0/yH1q0/YIMtQRovSUcc0WVsFcFra9p3XIDkj2cjr/rWfgFTLrZSITfx
 ueiTYsvEMh+jff0DLpRZyhJLoZ6iurq5nWrFpqrp07Awmqd/apMl/7Ue7IarLiwAfO4iBthJB0K
 lm/GYdawGCzPGD+cBw9TFAEAQqNGwNzhf9+KUB6RPS+Wi+R+55PKwQIZjTSdx3ZuA5nVYgat4XH
 XSNPCE3b69S4LsvvO0InvCcmp5ac27RuP5/uCf6DKmog==
X-Forward-Email-ID: 6aae583c6b7a9fab87b109cf
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 121.127.44.73
X-Forward-Email-Version: 2.14.2
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
Message-ID: <2ca409b2-e614-4762-abc7-56b167f62a90@kwiboo.se>
Date: Sat, 19 Sep 2026 11:39:02 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/3] arm64: dts: rockchip: Split out the common NanoPi
 RK3528 parts
To: HystericalDragons@proton.me, Heiko Stuebner <heiko@sntech.de>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, Chukun Pan <amadeus@jmu.edu.cn>,
 jensen <jensenhuang@friendlyarm.com>, Andrey Korshunov
 <razor1702@gmail.com>, Diederik de Haas <diederik@cknow-tech.com>
References: <20260914-r28s-upstream-v6-0-ea9edd75c126@proton.me>
 <20260914-r28s-upstream-v6-2-ea9edd75c126@proton.me>
Content-Language: en-US
From: Jonas Karlman <jonas@kwiboo.se>
In-Reply-To: <20260914-r28s-upstream-v6-2-ea9edd75c126@proton.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

On 9/14/2026 3:35 PM, 安容 via B4 Relay wrote:
> From: 安容 <HystericalDragons@proton.me>
> 
> The FriendlyElec NanoPi Zero2 and the NanoPi R28S share their power
> tree, storage, RGMII Ethernet, RTC, SYS LED and debug console. Move
> those parts into rk3528-nanopi.dtsi so the NanoPi R28S can reuse them,
> and leave only the board specific nodes in the NanoPi Zero2 devicetree.
> 
> Suggested-by: Chukun Pan <amadeus@jmu.edu.cn>
> Signed-off-by: 安容 <HystericalDragons@proton.me>
> ---
>  .../boot/dts/rockchip/rk3528-nanopi-zero2.dts      | 291 +--------------------
>  arch/arm64/boot/dts/rockchip/rk3528-nanopi.dtsi    | 288 ++++++++++++++++++++
>  2 files changed, 297 insertions(+), 282 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/rockchip/rk3528-nanopi-zero2.dts b/arch/arm64/boot/dts/rockchip/rk3528-nanopi-zero2.dts
> index 97d85124d2..8a7dbd539f 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3528-nanopi-zero2.dts
> +++ b/arch/arm64/boot/dts/rockchip/rk3528-nanopi-zero2.dts
> @@ -2,41 +2,13 @@
>  
>  /dts-v1/;
>  
> -#include <dt-bindings/input/input.h>
>  #include <dt-bindings/leds/common.h>

You can also drop this include, you are also adding this include to the
rk3528-nanopi.dtsi file.

> -#include <dt-bindings/pwm/pwm.h>
> -#include "rk3528.dtsi"
> +#include "rk3528-nanopi.dtsi"
>  
>  / {
>  	model = "FriendlyElec NanoPi Zero2";
>  	compatible = "friendlyarm,nanopi-zero2", "rockchip,rk3528"; 

[snip]

> +&leds {

This should also include a 'pinctrl-names = "default"', as we are
re-defining pinctrl-0 here.

> +	pinctrl-0 = <&led1>, <&led_sys>;

The led1 label is defined/shared among the three boards, yet led-1 is
defined in each board DT. Maybe define a common led-1 or move the led1
label to board DT?

>  
> +	led-1 {
> +		color = <LED_COLOR_ID_GREEN>;
> +		default-state = "on";
> +		function = LED_FUNCTION_STATUS;
> +		gpios = <&gpio4 RK_PB1 GPIO_ACTIVE_HIGH>;
> +		linux,default-trigger = "default-on";
>  	};
>  };

[snip]

> diff --git a/arch/arm64/boot/dts/rockchip/rk3528-nanopi.dtsi b/arch/arm64/boot/dts/rockchip/rk3528-nanopi.dtsi
> new file mode 100644
> index 0000000000..f15493f825
> --- /dev/null
> +++ b/arch/arm64/boot/dts/rockchip/rk3528-nanopi.dtsi
> @@ -0,0 +1,288 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Common parts of the FriendlyElec RK3528 boards: NanoPi Zero2 and NanoPi R28S.

This comment does not really serve a purpose, this is already implied
from the filename. And if you want to keep it, please use something that
is more generic and does not need to change when R28S DT and NEO3 Plus
DT is added.

  Common parts of the FriendlyElec NanoPi RK3528 series boards

> + */
> +
> +#include <dt-bindings/input/input.h>
> +#include <dt-bindings/leds/common.h>
> +#include <dt-bindings/pwm/pwm.h>
> +#include "rk3528.dtsi"

[snip]

> +&pinctrl {
> +	ethernet {
> +		gmac1_rstn_l: gmac1-rstn-l {
> +			rockchip,pins = <4 RK_PC2 RK_FUNC_GPIO &pcfg_pull_none>;
> +		};
> +	};
> +
> +	leds {
> +		led1: led1 {
> +			rockchip,pins = <4 RK_PB1 RK_FUNC_GPIO &pcfg_pull_none>;
> +		};

As mentioned above, not sure why we cannot define a common led-1 here if
we also define the pin in the common dtsi.

Regards,
Jonas

> +
> +		led_sys: led-sys {
> +			rockchip,pins = <4 RK_PB0 RK_FUNC_GPIO &pcfg_pull_none>;
> +		};
> +	};
> +
> +	rtc {
> +		rtc_int_l: rtc-int-l {
> +			rockchip,pins = <4 RK_PC1 RK_FUNC_GPIO &pcfg_pull_up>;
> +		};
> +	};
> +
> +	sdmmc {
> +		sdmmc_pwren_l: sdmmc-pwren-l {
> +			rockchip,pins = <4 RK_PA1 RK_FUNC_GPIO &pcfg_pull_none>;
> +		};
> +
> +		sdmmc_vol_ctrl_h: sdmmc-vol-ctrl-h {
> +			rockchip,pins = <4 RK_PB6 RK_FUNC_GPIO &pcfg_pull_none>;
> +		};
> +	};
> +};

[snip]
