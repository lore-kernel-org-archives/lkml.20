Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793894103;
	b=E7OXQyV21PLEOi/gz8XZnU8imhoA2MS+AHM5Ak1a/Qf7pSk4w0/IH/asA+21MZOmyQaY
	 eNtzmuqSX/3yjGLQMisnpT0qgRzKit6KWZRKiE52v/nwvNH51FRO2aDBlfRARbM949e5H
	 lIVI/ISWq+LmchPoYusVe0V3EkrJ77HkqUi2WZLoOJTO6ojHZn1izwrge5xxR9aVYmQnZ
	 wA8LndATAwcQGyHcf+7kbHfjxkcWKprPlyHxsKVgTqWwGwh5O5Ibf3GibXpg8a5dApD0p
	 l6Df7lKrL2Aq8tiMGv/tdfU7iCf+STsdE1tKxL9XNK4u4T31cOrxRGGCczaNK1ijz4g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793894103;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:From:Reply-To:Subject:To:Cc:
	 References:Content-Language:Autocrypt:Organization:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=4gd5YBbTx7pIL/t9UDrPjuhr3sbKtTJ/cLT8Cj4GQTI=;
	b=EMZESILEbV9MSjmvsIM0S7Th7TARVQK3IH1/YtSBWQCgSovK1PTLbFMCtS5fDL+xwVfQ
	 dE3+czG+6agUQYI033+y8Rcol0DjBNkcI1jliAX0cikuVD9kk0HwO4eV/TdKs51XV3I4w
	 rQofgYkm1j7L9hl8cGxYbSI/CzXL/nEhkmt8Xi1T/yDrbRe5cHcNgh74fARu/3nQsPJC8
	 AtpxigS47fRZpz6NszHrXs45HXZ0o+076Ub7Rt9RGGIERNDi7KmpbYN1k3wu3nliStPvU
	 2rrpfmkjzUWvHhgYmz6VrKBYCKRtqJG9S9VD5kVJVoLKBl4x7e37BrTHV593BJyIrwg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=iClzQah2;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35E9560A262A
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 15:55:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 35E9560A262A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=iClzQah2
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a140e7405dso19273735e9.3
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 07:55:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793894101; x=1794498901; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4gd5YBbTx7pIL/t9UDrPjuhr3sbKtTJ/cLT8Cj4GQTI=;
        b=iClzQah2ajwLi7VYVW4NdNIgIUvDD+ZdrLoWvGq8RGTZaKFCl02nUIcBqo7ISBioFK
         wzMQQdBMaoHUNeHTdu94KwRSbVH94aM20kP6Doy3/qjEimbT2J8i0ONicN6vCBSSrLQM
         1BZWPhsU4Jlu63t9tEh4TjaRgTMa3ckW4bHzdvkN8H5ceOA/ttWETPfOz4ikLxwpOAVe
         45ZOBtaVvU6obODZYH7cSkplc3oqoXdT+ahh+qStMMzbSDfZyCHC8vyxnmvd775mY0Ru
         mntkQzpi3eBfMVUvQ3ngvWs8+TLIKRSsVxQdtYZhe9cn2z6akGfRg5ZQk4B1PaIWVZSy
         EFpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793894101; x=1794498901;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=4gd5YBbTx7pIL/t9UDrPjuhr3sbKtTJ/cLT8Cj4GQTI=;
        b=yC4dv7TEkTUIKnNev5Tx0Sb0OgbUET32RLEl/6FFRRDoYZPDeJEA1fJA7IdStwpFH4
         vxPou3UcK95D/n+1eDQfGf40W/sQ5QWM5v1Pd5ITqvSin7bsx9JOTSuL+htbOYDnhOMi
         jZ+4M6fwGh6XdltCkGTfFjOnEkHkURZWffHTpt7ZoqmZ2S5mO/m6oSTjDE+Re+bPMMx5
         d54Z+qFO2HxKtnkaU0LW4gbhQ8/MnjhLDsCYTwsV1SreM8N7GynC/jLIH172tduZiIFM
         vl5SnLC7BSV7tGozJTJ6le/3nlGdIIKDunKQI+5Hf2pLffJ36LRXbqkIlft2IJAJX1iT
         NKzg==
X-Forwarded-Encrypted: i=1; AKwUvBwfMLZ9mnf/n4fkVV5zmIn0bbwEshUHrELxw0b6ZrPzt7tWLQGgGQzyOGFiFWgEyfvpELVDcHnk71V2QIM=@vger.kernel.org
X-Gm-Message-State: APuU4Z//Ou+lFwkIToOdICSYJgtkeOsxeSSoq0UVtJhg9lEIGy0k0xCn
	PgXriqj8vCaQ9eqs+l6bdwL5ebnxOrlcFPZlO854eGmJj9UgVu0vGM1611SPY95LGsU=
X-Gm-Gg: AYBFou3n/2jeOC24q/aVSNu21q+KwA13P9v+xTNm5aaVnqBiCbsWapz0Fnl/CnvQoMZ
	gklykrzxyLzfNQSOYmg89akVBw+/aemkZOgIM/GW7ONGIJ1tRyTxYdbwTW2SOAzVYCFkumjLZhE
	MYItsOw916yOtyx9/e6r4/fMgYU6WEStPtw8d2FqcDcmmHhqazVgUBFqT2cVzdK7tJA2GWd3tn1
	jXo1fk3V9DD0LjjTx0v88TZnmrxuwsGXxK4KAccqB//Nb9Icxxt5MiRUmsFYpO28JialWpCQVjZ
	Dft52SW0qZ0EyXY4Zzj6nAp8dfpjaAnFQ6VtHYbNAEy92kixPwSW/0aZE2YnErm0Mn7bR5E4bUL
	VEaA5OybbxeDdZ6YvIaXgFxYCiiMkg/TVP63O7sLcF621iCcb06Jszmiqc93idzMXstvc1uETGI
	Q/VeZCpDLaLnfV8zuISuNDt3Mc5OotzXQFKulYF88t+YiVuuPx3tBizGrSdXGTcdzzM/wvW7qti
	iRJM56PGWsH9NWmoyt91bArIOI6+j41upPEqs8+ouvzEMVcFNQ7EIR/LZW0oIrJy9Yx6q7du6lO
	rpnQbF04MuGNx3SRhYEICTNw86Hfo2fckOm26MdrMhIgIMr6/260w0lw0QDfLT8cH3df5s2/cxP
	s9zApyVg=
X-Received: by 2002:a05:600c:6216:b0:4a3:5aea:21e5 with SMTP id 5b1f17b1804b1-4ac1737c533mr425955665e9.9.1793894101341;
        Thu, 05 Nov 2026 07:55:01 -0800 (PST)
Received: from ?IPV6:2a01:e0a:106d:1080:9899:e54b:a2f2:3695? ([2a01:e0a:106d:1080:9899:e54b:a2f2:3695])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fed92a753sm11994525f8f.45.2026.11.05.07.55.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 07:55:01 -0800 (PST)
Message-ID: <1463c55e-3bcc-4a30-89db-def43c05fe44@linaro.org>
Date: Thu, 5 Nov 2026 16:55:00 +0100
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
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] arm64: dts: amlogic: khadas-vim3: add SPI NOR flash
 overlay
To: Jose Nieto <jnieto.alaber@gmail.com>, Kevin Hilman
 <khilman@baylibre.com>, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Cc: Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261103164730.160593-1-jnieto.alaber@gmail.com>
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
In-Reply-To: <20261103164730.160593-1-jnieto.alaber@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/3/26 17:47, Jose Nieto wrote:
> The Khadas VIM3 has a 16 MiB SPI NOR flash (W25Q128) whose data lines are
> shared with the eMMC D4-D7 lines. Add an overlay that restricts the eMMC to
> 4-bit mode and enables the SPI NOR controller, exposing the flash as an MTD
> device.
> 
> The flash HOLD#/WP# lines are wired to the eMMC D3/D7 nets, so the
> nor_hold_wp_pins pinctrl group is intentionally not used.
> 
> Signed-off-by: Jose Nieto <jnieto.alaber@gmail.com>
> ---
>   arch/arm64/boot/dts/amlogic/Makefile          |  2 ++
>   .../dts/amlogic/meson-khadas-vim3-spifc.dtso  | 24 +++++++++++++++++++
>   2 files changed, 26 insertions(+)
>   create mode 100644 arch/arm64/boot/dts/amlogic/meson-khadas-vim3-spifc.dtso
> 
> diff --git a/arch/arm64/boot/dts/amlogic/Makefile b/arch/arm64/boot/dts/amlogic/Makefile
> index 57bc440fa55c..3714cbaaa03e 100644
> --- a/arch/arm64/boot/dts/amlogic/Makefile
> +++ b/arch/arm64/boot/dts/amlogic/Makefile
> @@ -23,6 +23,7 @@ dtb-$(CONFIG_ARCH_MESON) += meson-g12a-u200.dtb
>   dtb-$(CONFIG_ARCH_MESON) += meson-g12a-x96-max.dtb
>   dtb-$(CONFIG_ARCH_MESON) += meson-g12b-a311d-bananapi-m2s.dtb
>   dtb-$(CONFIG_ARCH_MESON) += meson-g12b-a311d-khadas-vim3.dtb
> +dtb-$(CONFIG_ARCH_MESON) += meson-g12b-a311d-khadas-vim3-spifc.dtb
>   dtb-$(CONFIG_ARCH_MESON) += meson-g12b-a311d-khadas-vim3-ts050.dtb
>   dtb-$(CONFIG_ARCH_MESON) += meson-g12b-bananapi-cm4-cm4io.dtb
>   dtb-$(CONFIG_ARCH_MESON) += meson-g12b-bananapi-cm4-mnt-reform2.dtb
> @@ -104,5 +105,6 @@ dtb-$(CONFIG_ARCH_MESON) += meson-sm1-x96-air.dtb
>   # Overlays
>   meson-g12a-fbx8am-brcm-dtbs	:= meson-g12a-fbx8am.dtb meson-g12a-fbx8am-brcm.dtbo
>   meson-g12a-fbx8am-realtek-dtbs	:= meson-g12a-fbx8am.dtb meson-g12a-fbx8am-realtek.dtbo
> +meson-g12b-a311d-khadas-vim3-spifc-dtbs := meson-g12b-a311d-khadas-vim3.dtb meson-khadas-vim3-spifc.dtbo
>   meson-g12b-a311d-khadas-vim3-ts050-dtbs := meson-g12b-a311d-khadas-vim3.dtb meson-khadas-vim3-ts050.dtbo
>   meson-sm1-khadas-vim3l-ts050-dtbs	:= meson-sm1-khadas-vim3l.dtb meson-khadas-vim3-ts050.dtbo
> diff --git a/arch/arm64/boot/dts/amlogic/meson-khadas-vim3-spifc.dtso b/arch/arm64/boot/dts/amlogic/meson-khadas-vim3-spifc.dtso
> new file mode 100644
> index 000000000000..c70780b11b9b
> --- /dev/null
> +++ b/arch/arm64/boot/dts/amlogic/meson-khadas-vim3-spifc.dtso
> @@ -0,0 +1,24 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Copyright (c) 2026 Jose Nieto <jnieto.alaber@gmail.com>

This change comes directly from the U-Boot file arch/arm/dts/meson-khadas-vim3-u-boot.dtsi
so at least keep the Copyright and where the changes comes from.

Neil

> + *
> + * The Khadas VIM3 on-board SPI NOR flash shares its data lines with the
> + * eMMC data lines 4-7. Restrict the eMMC to 4-bit mode to free D4-D7 and
> + * enable the SPI NOR controller, exposing the flash as an MTD device.
> + *
> + * The flash HOLD#/WP# lines are wired to the eMMC D3/D7 nets, so the
> + * nor_hold_wp_pins pinctrl group is intentionally not used.
> + */
> +
> +/dts-v1/;
> +/plugin/;
> +
> +&sd_emmc_c {
> +	pinctrl-0 = <&emmc_ctrl_pins>, <&emmc_data_4b_pins>, <&emmc_ds_pins>;
> +	bus-width = <4>;
> +};
> +
> +&spifc {
> +	status = "okay";
> +};
> +

