Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A1803AA1B2
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 12:33:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791376416; cv=none; b=L042U7wngcDOTdt/WhHXmVCy6DawgNqbSpB1vC/zRi91Zv+kSI2isiD2b/IaZBqETf27Llm2WKcC4XevQaUEOmZBekj4Jqbx44gSZab7QyRzlNKxBtGamlTvDJsfaBn1sBFXpKE2epde7mYSvBa5JqW9AiSOrm87RLtWOMQftbk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791376416; c=relaxed/simple;
	bh=JcerM9sK/g4sUoTC/DiI4yPMBzcaqJfNy1s9cxu6Ej4=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=kXoUm27tNi81Tfh4tIFuEtP2fXRMPyvEOHwh6SKSV2CXSDmXYen4lTktYRzhusAAJaL9dW0na84L9+Tkjbl+1rrIAty/vtdhGtq0LySH0ftYobOqk0eGBC3E2LXLyOgEeLAaGzq2e8cQ0lNtABgjOw2ZC+Uq8sU85Z9zokgyISs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UMdAPtpY; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UMdAPtpY"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-48870973bddso1112018f8f.1
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 05:33:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1791376405; x=1791981205; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Sto7ylfghKrxF0yVdAjf8Y/DDquUXT6FEKrppsRxI2o=;
        b=UMdAPtpYFLkRkCBvRcJTuYAxv1GWo8EufGmhcUd9CjHk16Cagb11tceIhnvwUN7br4
         Nc0W0yIA0lERin+yT1KioikeW+c71KsHa4/HfWh3nZ38y44NFM9DdxzOmQU9Vl2spqrd
         pbxD0Jf2Te59in0mDIfYQzNpmvjmzXt4RScCWAE05I4Q8nL2suWjOD+dEKY3i9Z8BkU+
         eff8lGmjunMzk7siyCuT4J079SB+nhs6NrQNQfl1Q7qegGLESmb28Y6vZJAUN8/X11j8
         tBVup9oW9ct5tL1jp6PjJkhDOPvBJW8FoYMgIaMbbgCE4FXhJ+cXCRw5RTWM6V13+doG
         vAGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791376405; x=1791981205;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Sto7ylfghKrxF0yVdAjf8Y/DDquUXT6FEKrppsRxI2o=;
        b=Gzxm7oRSGZBPIWgtmRyI/e+ONmONg1uCjdbqI1WCaVZtOydz3FaZfh2R+bRb4HtJyo
         5cSezoUN+pbt3txmbY+LSP4uifK+9xpVQwTiJ26/47ELYCN4Q3skAChh0b8N3FOanEZI
         8FoGqGlthSIpZupDQTeDTtPOcf4TOzepWuDnw2ObYIjL85VJdGOCG2bR9W86BgzorCaQ
         5BU33UQm6DkCktsWtoqCHJWJMwXbIdv3gujUQr7c53VmKobCSaBpNRNN+BBYg4l37UID
         M2f84lX7shaRDeejD9M3RtEeffxwyDK/b1JI/n57caUwht56EFunHUw0/48fL14UaIVg
         A6Sw==
X-Forwarded-Encrypted: i=1; AKwUvBx70ds06TLhZh32SGC1mXShUC+RcPGvMz0l0iqwNw6qRFOB93hRp8I0m1rDEyHvSIZDl59uWv7sUpuIutk=@vger.kernel.org
X-Gm-Message-State: AFq9FYLtBUJ7uhf4OxCNliu1zoQNSzs4cpvlR6jclCgEFcT7aUOug3S/
	L4jylzebmtnE7OLuYFp4zmwrr2Awf0HTmEsi52L/jalzpE1mhS1dmZhtr4u/wZvmiMA=
X-Gm-Gg: AYBFou172uWVGiz1LyCF3uQ+4J4/FeqB0Qll5hP3p2nVKDddHnoSK4zbE9jLoOPUYww
	cFjMsY6uR1Mrfrk+lUmit0gFgn9jM1eUJyuU3aEZgFccEUbte5Ukbap9yzxFwY5Row3UosCyifO
	asRh38M6e2dYIcMxj8jhcWSEBlBl734lilTE3zFlTWCJ+fHjnGpzm2GzVk9vUy9D5E562Gmo4DZ
	EtmD977nyfhSTtXCGlKfVksmpksuf/R+pMWn++iyqYQk0ugQnujTxC5n/zlxsE2pWVUJAezbfk2
	UaXOQ8f+Qji0L74OxslFI7yPbJqdfBQaCcFJTiI8Yfb/oiG/VmcBB+GBLgTGABri2fyXmc3gjIc
	wK0ZzRGmmblvb7jFOdqZEKjMWENQAPdiYT+viUM5b1o4UnUW1s7DMmaN9Ol8M9zxADJy1P1U8Xh
	NFLlXbYDOl3qavrgXNE3s8R+Xnil7IHwT5WHbXT7fLSVi6qQ6U1ZJcIFlga/T4SEVfvpvyqbnvl
	KG+uMKn6SvEmBN6pOmx6H3aRiOGpxm+
X-Received: by 2002:a5d:6184:0:b0:48c:54ec:ea3 with SMTP id ffacd0b85a97d-48c688c031amr8414035f8f.13.1791376405104;
        Wed, 07 Oct 2026 05:33:25 -0700 (PDT)
Received: from [192.168.151.46] (90-182-211-1.rcp.o2.cz. [90.182.211.1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48c71d3d3eesm5973138f8f.53.2026.10.07.05.33.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Oct 2026 05:33:24 -0700 (PDT)
Message-ID: <15a6f5d5-fdf2-43e2-94bc-3e87c4eea122@linaro.org>
Date: Wed, 7 Oct 2026 14:33:20 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2] arm64: dts: amlogic: meson-sm1-odroid-hc4: add the fan
 tachometer
To: iav@iav.lv, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Christian Hewitt <christianshewitt@gmail.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20261006-hc4-fan-tach-v2-1-e27ad96e92a2@iav.lv>
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
In-Reply-To: <20261006-hc4-fan-tach-v2-1-e27ad96e92a2@iav.lv>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/6/26 18:36, Igor Velkov via B4 Relay wrote:
> From: Igor Velkov <iav@iav.lv>
> 
> The fan connector routes the fan's tachometer output to GPIOX_7, but
> the fan node does not describe it. pwm-fan therefore registers no
> fan1_input, and the fan speed cannot be read.
> 
> Describe the line as the fan's interrupt, and mux the pin as a GPIO
> input without bias: R109 on the board pulls the line up to VDDAO_3V3
> (schematic rev1.0, sheet 31).
> 
> Tested on ODROID-HC4: fan1_input reads 0 with the fan stopped and
> rises with the duty cycle, to about 4200 rpm at full speed.
> 
> Assisted-by: LLM
> Signed-off-by: Igor Velkov <iav@iav.lv>
> ---
> Changes in v2:
> - Mux GPIOX_7 as a GPIO input without bias (Neil).
> - Link to v1: https://lore.kernel.org/r/20261006-hc4-fan-tach-v1-1-4e7cecf0b45b@iav.lv
> ---
>   arch/arm64/boot/dts/amlogic/meson-sm1-odroid-hc4.dts | 15 +++++++++++++++
>   1 file changed, 15 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/meson-sm1-odroid-hc4.dts b/arch/arm64/boot/dts/amlogic/meson-sm1-odroid-hc4.dts
> index 5f15c2299509..64602aff1d81 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-sm1-odroid-hc4.dts
> +++ b/arch/arm64/boot/dts/amlogic/meson-sm1-odroid-hc4.dts
> @@ -21,6 +21,10 @@ fan0: pwm-fan {
>   		#cooling-cells = <2>;
>   		cooling-levels = <0 120 170 220>;
>   		pwms = <&pwm_cd 1 40000 0>;
> +		interrupt-parent = <&gpio_intc>;
> +		interrupts = <IRQID_GPIOX_7 IRQ_TYPE_EDGE_FALLING>;
> +		pinctrl-0 = <&fan_tach_pins>;
> +		pinctrl-names = "default";
>   	};
>   
>   	leds {
> @@ -114,6 +118,17 @@ &pcie {
>   	reset-gpios = <&gpio GPIOH_4 GPIO_ACTIVE_LOW>;
>   };
>   
> +&periphs_pinctrl {
> +	fan_tach_pins: fan-tach {
> +		mux {
> +			groups = "GPIOX_7";
> +			function = "gpio_periphs";
> +			bias-disable;
> +			output-disable;
> +		};
> +	};
> +};
> +
>   &pwm_cd {
>   	status = "okay";
>   	pinctrl-names = "default";
> 
> ---
> base-commit: b44e2be772f866985cafdf90355285069ea68495
> change-id: 20261006-hc4-fan-tach-440c1b874a04
> 
> Best regards,

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil
