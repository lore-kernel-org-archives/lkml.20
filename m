Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB38D486E43
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 07:37:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792395431; cv=none; b=tooR3ji3hNtbLprE079vZiO/S9nf4f0v5aFUa/vZEOPIa3BAZzBGXW9b7RLOKObEbyqt3gYzJsxtPsD70RUWCiz5+HF/IpEZuPwEDBmASARVdQiH1CrYnKiScCRu4rNi5GKoh0lhtUYyG/ualFU+pH2CukhLbHhBP4urxogPsu4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792395431; c=relaxed/simple;
	bh=ECyBmSMSrDZXgArarpvT0cyc692WgKdDIT9ZDoEi7Hw=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=jyLYrc/5j0nF6VK3fg0vp26hAy6xD5riDj/HkC50Q6vfRzbs2ZnQ5dxJgFrfbb0i732U/yQeIK81Hf8DSRIF1OrSH95FKs9x6oYpSw1yfEFPHXokQO1OOBxBbodRgIweRcir7fgAd1iIpFiGvdIsoOXjllIid/f2RAyjZAyMhVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FWbOZ/Y7; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FWbOZ/Y7"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-49d0da752ffso13961305e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 00:37:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1792395428; x=1793000228; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8QPld4PDvxchqNmytlS7taNyVAk0cnj+pHWf4Ud33mo=;
        b=FWbOZ/Y7/3kXJeITchyfR2Zf/7vnLCEH818nbTi9S02zQCyEw5GVu8pPj7rLUPrAP8
         qlxJf7obPq6C8C61ykAVmApgcUiWXXmOCOLSoprls9VXAKYoMGEDO7/BjwidMhvNU/nU
         e35meK+CXRTTB/QhHTOumxrLnpnSqEokj+KuTZ/Lh+AJWgCfJp+VOBYD1CCchDTBP77V
         maPny47Zs0cGAwcxe4kEo3ZnGdsiSoLuF2T6Om97WFCC0y3bPp3xjw7QQqOOvlVNZRZi
         pMuN7zFaNSiJcyr5hQzwcnXaw/Jadhwjsn5hZOVIBwoC1/aAlrGENAAw1wMJxOwrweJ3
         ZR2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792395428; x=1793000228;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=8QPld4PDvxchqNmytlS7taNyVAk0cnj+pHWf4Ud33mo=;
        b=XunUaldwMIoPQIgAGKwiaNwvwp3a6+SGN4RqDDqpQnNFUC42iL5cL1C+cb/+tRmy9u
         zyyUVZBxjRxXRk9TdvkVpf+LZ70fEC0P4n5ziBCFQIhAUfOlt8Heftm6W1F0F7C/KL3V
         /grwXhsh0mcyCx2xSlMfR1nmdAH8Hmar+s0BwYMUC8VXsAxUn7SbiV1zzAqfM/ADGL+c
         RgIOAopdjhjP6dOcwDb3yL7/E4j+rEVhZSIlffD0TIGjZDwMnfIpDjLnD5WUeXkg6J1T
         XA+MPQ2TUfbcJsTCXVJr4VvuWylMJQo7BO10IyWNWGnhjBOxh3GeAUBhuhdo7Hdu0m3n
         xkdA==
X-Forwarded-Encrypted: i=1; AKwUvBxdIoDNWkOGL2mvmJwkk3AgGNLXITJncnpgxEFgnJ9w8/nptkSpQKFeB5BaU55ekrmFV2uFjowjGg4uWSw=@vger.kernel.org
X-Gm-Message-State: AFq9FYKA3oE6l4KYTWTeUjmRLx+Mf5d+8VHpS6HfRgP+t5CDV1hAJYA3
	7QuJ7btF9npxpJ0HhCmghQGLvnVeCamb7lIG06wrlGJ3WAurPB/4VUqPyFaLMBR5XS01j7S1mxu
	ajhnM
X-Gm-Gg: AYBFou0eQOiGMKnU3o7i4KAWrsKfA7R0zmCzypWyxYDkplJcWML5RUefJPejhSuLnwi
	Ynwyd9tyKhhyD1Riml26aEYzV9tIuma8wAjWW25wQvHm43GOyKj++oR/GeBTCZTtzZhQ9UnVGHL
	LYiMA6pa0cHJae+k/q5/j/7uiYqR4xw5giAadKnTBYDfbi4DJRnsY24IlB0kT5e/AKSbm1LzZFr
	DBNW2AahlDNDTkPOhMjHF8xPB7fSZVNm7b13L3xvfEyreaiCv1DOofiNpCrmqfDMK1Kmn5yQqXj
	+j/VM62RXpDgWYBL3h8VzWeKAL1osbQ05T3junNBThWYB7YIPt4QbFYpUzNPxu0t3di6yyG7ctU
	NTfuMsoEwyHC3aQvi5aIAwAWGQbroIMpVeJHHatzbh3pNo5Iumc/Vvl8anel9naKyeyEn4msRE4
	awuL7ujn8rZltfGNoCyaHhK9fxSCM+t8Tk3bP3CNdhc4XL0c0g62/5X6T0fihTv6PSUAB50PBwj
	jzDEE6AsGoC2tpChcYC4kLRUbA19xX7L2nmvIjK+ZolAMuS6/uNeww=
X-Received: by 2002:a05:600c:1da1:b0:4a1:6425:be69 with SMTP id 5b1f17b1804b1-4a1d7614e61mr143555575e9.17.1792395427243;
        Mon, 19 Oct 2026 00:37:07 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:6674:33bf:38d6:bc10? ([2a01:e0a:106d:1080:6674:33bf:38d6:bc10])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd471a35sm18346334f8f.7.2026.10.19.00.37.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 00:37:06 -0700 (PDT)
Message-ID: <f5dc8732-9248-44f1-9337-379991cd5762@linaro.org>
Date: Mon, 19 Oct 2026 09:37:06 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 2/2] arm64: dts: amlogic-a9-a311y3-khadas-vim-5: add
 initial device tree
To: Nick Xie <nick@khadas.com>, khilman@baylibre.com
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 jbrunet@baylibre.com, martin.blumenstingl@googlemail.com,
 christianshewitt@gmail.com, xianwei.zhao@amlogic.com,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, xieqinick@gmail.com
References: <20261017040038.3702428-1-nick@khadas.com>
 <20261017040038.3702428-3-nick@khadas.com>
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
In-Reply-To: <20261017040038.3702428-3-nick@khadas.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/17/26 06:00, Nick Xie wrote:
> The Khadas VIM 5 uses the Amlogic A311Y3 SoC, based on the Amlogic A9
> SoC family, on a board with the same form factor as the
> VIM/VIM2/VIM3/VIM4/VIM1S models. The serial debug console works with this
> initial device tree.
> 
> It features:
>   - 8GB LPDDR5
>   - 64GB eMMC 5.1 storage
>   - 32MB SPI flash
>   - 10/100/1000 Base-T Ethernet
>   - AP6275P Wireless (802.11 a/b/g/n/ac/ax, BT5.1)
>   - HDMI 2.1 output
>   - HDMI 2.1 input
>   - 1x USB 2.0 + 1x USB 3.0 ports
>   - 1x USB-C with USB 3.0/DP/PD
>   - 2x LEDs (1x red, 1x white)
>   - 3x buttons (power, function, reset)
>   - M2 socket with PCIe, USB, ADC & I2C
>   - 1x 4 lanes MIPI DSI
>   - 1x 4 lanes MIPI CSI
>   - 40pin GPIO Header
>   - 1x micro SD card slot
> 
> Signed-off-by: Nick Xie <nick@khadas.com>
> ---
>   arch/arm64/boot/dts/amlogic/Makefile          |  1 +
>   .../amlogic-a9-a311y3-khadas-vim-5.dts        | 42 +++++++++++++++++++
>   2 files changed, 43 insertions(+)
>   create mode 100644 arch/arm64/boot/dts/amlogic/amlogic-a9-a311y3-khadas-vim-5.dts
> 
> diff --git a/arch/arm64/boot/dts/amlogic/Makefile b/arch/arm64/boot/dts/amlogic/Makefile
> index 57bc440fa55cc..8b4e3212be131 100644
> --- a/arch/arm64/boot/dts/amlogic/Makefile
> +++ b/arch/arm64/boot/dts/amlogic/Makefile
> @@ -2,6 +2,7 @@
>   dtb-$(CONFIG_ARCH_MESON) += amlogic-a4-a113l2-ba400.dtb
>   dtb-$(CONFIG_ARCH_MESON) += amlogic-a5-a113x2-av400.dtb
>   dtb-$(CONFIG_ARCH_MESON) += amlogic-a9-a311y3-by401.dtb
> +dtb-$(CONFIG_ARCH_MESON) += amlogic-a9-a311y3-khadas-vim-5.dtb
>   dtb-$(CONFIG_ARCH_MESON) += amlogic-c3-c302x-aw409.dtb
>   dtb-$(CONFIG_ARCH_MESON) += amlogic-c3-c308l-aw419.dtb
>   dtb-$(CONFIG_ARCH_MESON) += amlogic-s6-s905x5-bl209.dtb
> diff --git a/arch/arm64/boot/dts/amlogic/amlogic-a9-a311y3-khadas-vim-5.dts b/arch/arm64/boot/dts/amlogic/amlogic-a9-a311y3-khadas-vim-5.dts
> new file mode 100644
> index 0000000000000..3989ce7a8aff9
> --- /dev/null
> +++ b/arch/arm64/boot/dts/amlogic/amlogic-a9-a311y3-khadas-vim-5.dts
> @@ -0,0 +1,42 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Copyright (c) 2026 Khadas Technology Co., Ltd.
> + */
> +
> +/dts-v1/;
> +
> +#include "amlogic-a9.dtsi"
> +
> +/ {
> +	model = "Khadas VIM 5";
> +	compatible = "khadas,vim-5", "amlogic,a9";
> +	#address-cells = <2>;
> +	#size-cells = <2>;
> +
> +	aliases {
> +		serial0 = &uart_b;
> +	};
> +
> +	memory@0 {
> +		device_type = "memory";
> +		reg = <0x0 0x0 0x0 0xe0000000>,
> +		      <0x1 0x0 0x1 0x20000000>; /* 8 GiB */
> +	};
> +
> +	reserved-memory {
> +		#address-cells = <2>;
> +		#size-cells = <2>;
> +		ranges;
> +
> +		/* 35 MiB reserved for ARM Trusted Firmware */
> +		secmon_reserved: secmon@5000000 {
> +			compatible = "shared-dma-pool";
> +			reg = <0x0 0x05000000 0x0 0x2300000>;
> +			no-map;
> +		};
> +	};
> +};
> +
> +&uart_b {
> +	status = "okay";
> +};

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil
