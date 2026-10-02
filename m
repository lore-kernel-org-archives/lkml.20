Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E5693CE4BE
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 19:29:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790969398; cv=none; b=qAAO6O7yo33es/mfNgyDlwu+b4RwYGIV6K4Vdr2fv/eWvddFVB2wQCnR43/tTg8GKlnn+/A268HFOfEtUGG8XBZ6Bhnu0TdNLSnptkg8jXe9matXrHxw7lbulPZEDHsz0d2lV/biKgG5ulvmc2bapyZJaEo63IiadkN4OZ6B5eA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790969398; c=relaxed/simple;
	bh=gYX5tGbv5Wzep53IGVNll4lhze1F8DYjm44G83CG9KA=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=Zv0MLW7dnPbv2bUwRPB98fuYUbmdxiWroRlroTy6slICUGS6CqqmfZyW9fzH3mP37elU4YXUikHeHeykJ63JizL9pNb+PqlO3QWt+iuFbB0YDEtCTRf+UNosLy03kJSTctDgclmMbT8X7Bf2BwnUbmWfweTZHLZkIORxW78CRbI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Lr9mzQX1; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Lr9mzQX1"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-48441a2ba1bso941682f8f.1
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 12:29:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790969389; x=1791574189; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cztgwljGD8oX4kZgQ1gsJ1QSEaSYmGWQ7py1olDlbuE=;
        b=Lr9mzQX15dgg6gdyNByNl+Equil13ZCaDpqXO87nWZIqpDQARe7vJi/FrMqUTD6BFt
         dJ2d050iZqEaulwK2sJiCyHIxpPLtaeZuzGIazDaXKjQlaxCh2DiKYZ+WOQKYcMqPwv4
         /w/bP5izw773klXkfMdqI7R4ZQIlTXpslF3FvunVwxwNrTnOVPTR3fLF34gtyyBZKrlC
         p65lqy4Q3fkOZbtznw/MivsRhfrM7Oy2Lz5pbbkm15uMjrc7oXt1UW/Sj+1nCTv7qlCL
         GhUYjVGXn0t1IHE2ML2S9UagfumpJFokkKrz4Rx5gkFogoVMRlD/NWE5Dk6AZxBJ3sWd
         Lcjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790969389; x=1791574189;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=cztgwljGD8oX4kZgQ1gsJ1QSEaSYmGWQ7py1olDlbuE=;
        b=Qf/dECFIP1v5UcCGYUUEaR+FGKkqXaacEzd2NEQj7J05rbz/6rSDoWgiVREACFh8SW
         q5cLtkdknQlZSzeW8dPza5pmvHpxKYkdqWlPrHKxwNOmFrTOmsZGCO1uLP70xvlE0FT0
         aqCgUfskNl8B+8ARvsxKdU1pWhpv8mEtXJTpBATvUiGJgbZ74HHAlGNDSVv4vzqYZi5+
         w+dmHJ5lASxBn/f3pTraZU6nNC+eAv+MPjc8Iv+BVNEcYCT0Xu7eFu58ghsjSx9Di/8G
         tpAtYfK5LGhnnJIIL0Ej6Mu+4ZX97gWnuqQ6F3X7zyGWO1kZ8V73dkbh13UxfTCN/eFn
         PaAA==
X-Forwarded-Encrypted: i=1; AKwUvBwmyiLNtIRnl8Mm5yYE68/cFzklSSPt2yUscWqOzsa3PQDQsngmZ2U7P2opQF6UrQIpmys5vyCk1lASZSc=@vger.kernel.org
X-Gm-Message-State: AFq9FYLMD8vJzN46ttc5M5/TDp1oDnmXToFEpPl65A9AJ3Smml4ID/mR
	RNDvMxWRgQVN168+GaMYhePb83Z+vTkS0w7laBZAUKIUPCxLK6CyrD83611M1/Wyz3s=
X-Gm-Gg: AYBFou3C49FI59vzcIkQJGYAt8Ev4P+iJpBhfNWpPbEI9PB6ROS9wd8j48BA3UdcBc+
	g6jukOtBlUmb52JKSTpxw+34cszphjTQujlxG3y7zB7MQpKWbH5P5IWroiANA/9EATgtr7I9xOq
	headwgpQTOsxVO57CL4+eHVIADDmK9OXdDimhxdH7tCJ2BnmTU+TqN9IHQkHQtkvKLL54YHcZtA
	7WTx69IS0+i4RziZV86iHhD0GALQLQnm200g4IZRZ7TIdFzRyb0mgs4x8rUoyWSYIewYIDytNSk
	r/js4YNvL9NGkSNRXuaMOSD3jJujh3ttYyfoz5QoeyYJkKTX9rHN5D4aA8v1WM4YswWsSRhzioR
	3fmUm0fb04oqGKxhmYu2oYrHOPI2CadRUOpCJJ/VGgMUWpDwTLg1xbtdvXimwJCuGgsg27FEGLy
	KnHgQKiYfFZ9dZQ8aijdOv4jz+GHrNBfBDkRYLB6rWNY3OZC4UzYW9XmGSO5+cMLBlLiGWGYqJV
	Kbi0S/ryl7o7I738rp1EJy5lzfH12BAibe9p8SelmtM0hs4+4s=
X-Received: by 2002:a5d:5d13:0:b0:488:75e4:f5b6 with SMTP id ffacd0b85a97d-48c4801c1aemr625756f8f.54.1790969389014;
        Fri, 02 Oct 2026 12:29:49 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:2f62:6d3:721b:8c9e? ([2a01:e0a:106d:1080:2f62:6d3:721b:8c9e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b380facfesm8184812f8f.23.2026.10.02.12.29.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Oct 2026 12:29:48 -0700 (PDT)
Message-ID: <23235204-8e5f-4fa7-a900-66acfcfc593a@linaro.org>
Date: Fri, 2 Oct 2026 21:29:47 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2 1/2] arm64: dts: amlogic: meson-sm1-odroid-hc4: mux the
 SPI NOR HOLD# and WP# pins
To: iav@iav.lv, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Christian Hewitt <christianshewitt@gmail.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20261002-hc4-spi-nor-v2-0-8366a4f91049@iav.lv>
 <20261002-hc4-spi-nor-v2-1-8366a4f91049@iav.lv>
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
In-Reply-To: <20261002-hc4-spi-nor-v2-1-8366a4f91049@iav.lv>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/2/26 20:36, Igor Velkov via B4 Relay wrote:
> From: Igor Velkov <iav@iav.lv>
> 
> The SPI NOR flash uses six lines, but nor_pins covers only four: data,
> clock and chip select. Nothing claims HOLD# (BOOT_3) and WP# (BOOT_7),
> so they keep the boot ROM setting. After a boot from SPI they are in
> the nor function and the flash works. After a boot from SD with the
> button under the board, they stay eMMC data lines pulled low, and
> spi-nor reports "unrecognized JEDEC id bytes: 00 00 00 00 00 00".
> 
> Add them as a separate group in meson-g12-common.dtsi rather than to
> nor_pins: whether HOLD# and WP# reach the SoC depends on the board. The
> HC4 has eMMC disabled and takes both groups.
> 
> Tested on ODROID-HC4: with BOOT_3 and BOOT_7 set back to eMMC with
> pull-down and spifc rebound, the flash fails as above without this
> patch and probes as a 16 MiB mtd0 with it.
> 
> Fixes: 7178f340e929 ("arm64: dts: meson-sm1-odroid-hc4: add spifc node to ODROID-HC4")
> Assisted-by: LLM
> Signed-off-by: Igor Velkov <iav@iav.lv>
> ---
>   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi    | 9 +++++++++
>   arch/arm64/boot/dts/amlogic/meson-sm1-odroid-hc4.dts | 2 +-
>   2 files changed, 10 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
> index 00609d2da674..3135566df880 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
> @@ -615,6 +615,15 @@ mux {
>   						};
>   					};
>   
> +					nor_hold_wp_pins: nor-hold-wp {
> +						mux {
> +							groups = "nor_hold",
> +							       "nor_wp";
> +							function = "nor";
> +							bias-disable;
> +						};
> +					};
> +
>   					pdm_din0_a_pins: pdm-din0-a {
>   						mux {
>   							groups = "pdm_din0_a";
> diff --git a/arch/arm64/boot/dts/amlogic/meson-sm1-odroid-hc4.dts b/arch/arm64/boot/dts/amlogic/meson-sm1-odroid-hc4.dts
> index 3ece30a0a1ff..c4b93d6619f2 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-sm1-odroid-hc4.dts
> +++ b/arch/arm64/boot/dts/amlogic/meson-sm1-odroid-hc4.dts
> @@ -126,7 +126,7 @@ &sd_emmc_c {
>   
>   &spifc {
>   	status = "okay";
> -	pinctrl-0 = <&nor_pins>;
> +	pinctrl-0 = <&nor_pins>, <&nor_hold_wp_pins>;
>   	pinctrl-names = "default";
>   
>   	flash@0 {
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil
