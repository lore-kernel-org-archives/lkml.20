Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 452FC3A7852
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 07:13:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789024414; cv=none; b=s1ERSAY5ms4MZcsz21X8/yw3Qe+AIANjK2SU7JL5XYvbz1r5xBsDNVClzV96eZOEl143E5qwaWCQgDgC0fMJLeBfoShs210tw33XonqgGpUT+PCGmbV3Zs/cn2gjHqI456XXy2OpYbaLjv8q1pAI+SIgDXnTHpsvQs/y1ccf5q8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789024414; c=relaxed/simple;
	bh=ApElNDQ61Wl8YOJI75+dfJ9A1MMUh2shMw4qooG0uQw=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=DVqKeAlXA4hxGP5heBge7hVgnWtReNkMfMhXqKXjAAHhsgPjp0JqlAZj+AeBjLaLt1bPmvqk+G/rXgpXKQEwbT53VjkXJdutdreOY4p3oWyBBSQgz9UCcNtevOBZkLBA8LIFlX7Fk7LAGjxcZtCitODvNUjaWWAI03GwcK8PqfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pwXLwocz; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pwXLwocz"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49cd38e0e5dso12355975e9.2
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 00:13:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1789024410; x=1789629210; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z8Ga3BtRui77Q8Bka8GkpeTdclh0OZRER9FqEReJlpA=;
        b=pwXLwoczjH/usPEciPgO9y7TDAdmYG/uw+UMacWPt6y048OPnK/zuegELXnp0fNAYM
         3nCjOpbIy3xlAnzhII2IWASeFNhYAm3vSqS0oRd6VqPiimb9Cj9Cll85iF9nWvfn1KNZ
         rz1qDRzKt4+Rk95nsNvTm18pH9Y9pK/Bj2Fxq93brrKHiU18hJWMFcwyKoiIfmUZcqlK
         KPop02boH7L850KP7WnBt8ROnl4A1QSAvhn1cnyljFWOW2oveRgTVMYFIaIKUCGBlsIJ
         +5J0XnkLY5i4ecwgTnMk+tgBPOudGwzHnnne7e5ZF6EfTbSUOzMQcci35kbOwaCGHS7j
         z9uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789024410; x=1789629210;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Z8Ga3BtRui77Q8Bka8GkpeTdclh0OZRER9FqEReJlpA=;
        b=UGt8zCCckhJ5bo6X+UDqdqr7EdobmWsh/ysy7I/obbENcPLqRyPiNeuWykFbCc9x0B
         BQj8WdzSxdZVcw1aKzHbyRzJ5aBwEdPxRotV5df0X6hou0pRgiW7Fi38lVGyiFr6Dzxh
         GuGfyyE5mun7cNyCtIC6Q7FNGzbFg1cgrdiI7e5STEondDJCZFrcoXfVMb/ddg+ot2tc
         RKqhVlv87DcmMeJ1NvzXbeVokgIYF8qjC8qfr74GvZ7Bsb00w2lvnbEO589RLIs1B05E
         ZusGW0n2tbya77aZI9kHoWpudfK1/K/tdjcMM4f+ufndn2yStagxrflibl3jTLkaOq7i
         48/Q==
X-Forwarded-Encrypted: i=1; AKwUvByl2lfF6vuycaUzIQs/cm7+0bHIUmnYVPa1BRanNU3BcDVRwUdoXAAyKzkiPdpvz4LqmQ4+/8x+GToI8ZA=@vger.kernel.org
X-Gm-Message-State: AFuF++lahyU1CaJtplhBb1Hne1BUCnOFaeb44zMWVnKtZlooUNGbb6Ee
	EYjMsdTp3D/8T67XAf49R7iDi8Yg5i/NyuhM49HLHv2vjK9qhkgDCswK2/6ztSw13dU=
X-Gm-Gg: AYBFou1Eumxjx1pIktgFL3SUYHpqqM/N5NlhyIFikw5ppcAYpndo5QhzDLq160em3ac
	45icAKUvESIRoqMs2tEEvwaDdEDBGltdN/PrlHW1zfH8f8F4f2SMMgcTd3km+p1Avg0DZ8Jmnjd
	Mz/SNpSFBNh3QP2wvEbQ/g5Fi1wEVNPJJGTtPesPu1bMniRdceg3+nsa7mkxo2Qk3ZS9R2A6g7Y
	u2CEyi1girMfYVc3o0iKHEIyzeJJHKnPAxMhQIovg0vGDzOaidLV2IFOrLmUUfFs2uC3V029kJY
	/QmIm0tRyzMhi5/wx6GHgAfQe8IDZYgZj5dgC/yLxsrZnUPBmMwaRWG9Z6CkQN8tTen+1O/7dRc
	XX0XXX+OWCM/lrBEUVZYQ+JtQhBJWedSaY8WY8GJLXK5VWVBJAA//MnbFxGkxO5scc4Oezhd4DQ
	SA06OxCdEyfwNqAlRbAaG5QYo/bWIsnrid8J7Se0uzzouM16EpbFSYL6j7k6aVSV3pJAnECP6CN
	iMt0J7HszB16Dd+ZeCXpSUorwjFI/oC4D6r7aUbmqrLFfUztcKljn115gGEAcpl
X-Received: by 2002:a05:600c:a315:b0:499:a277:e8b5 with SMTP id 5b1f17b1804b1-49d258cefc8mr86177985e9.3.1789024410283;
        Thu, 10 Sep 2026 00:13:30 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:3caf:d840:c911:29a9? ([2a01:e0a:106d:1080:3caf:d840:c911:29a9])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d20fc23fcsm99287025e9.3.2026.09.10.00.13.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Sep 2026 00:13:28 -0700 (PDT)
Message-ID: <22576e60-df08-4994-a7ce-130d5bae80d9@linaro.org>
Date: Thu, 10 Sep 2026 09:13:26 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2 3/4] arm64: dts: amlogic: t7: add the pipeline clock to
 the MMC controllers
To: Lucas Tanure <tanure@linux.com>, Ulf Hansson <ulfh@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jerome Brunet <jbrunet@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Stephen Boyd <sboyd@kernel.org>
Cc: Brian Masney <bmasney+clk@redhat.com>, Chuan Liu <chuan.liu@amlogic.com>,
 Jian Hu <jian.hu@amlogic.com>, Ronald Claveau <linux-kernel-dev@aliel.fr>,
 linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260905153234.133217-1-tanure@linux.com>
 <20260905153234.133217-4-tanure@linux.com>
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
In-Reply-To: <20260905153234.133217-4-tanure@linux.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/5/26 17:32, Lucas Tanure wrote:
> The SD/eMMC controllers reach the DRAM through a pipeline stage that
> the hardware design inserts in the bus path to the NIC_MATRIX fabric,
> clocked by CLKID_SYS_AMPIPE_NAND. When that clock is disabled, a
> controller that starts a DMA transfer can never complete it.
> 
> Reference the clock from the three MMC controller nodes so the driver
> keeps it running, instead of relying on the clock being marked critical
> in the clock controller.
> 
> Assisted-by: Claude:claude-fable-5
> Signed-off-by: Lucas Tanure <tanure@linux.com>
> ---
>   arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi | 15 +++++++++------
>   1 file changed, 9 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
> index c3dc479b137d..dbb4a95652c6 100644
> --- a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
> @@ -730,8 +730,9 @@ sd_emmc_a: mmc@88000 {
>   				interrupts = <GIC_SPI 176 IRQ_TYPE_LEVEL_HIGH>;
>   				clocks = <&clkc_periphs CLKID_SYS_SD_EMMC_A>,
>   					 <&clkc_periphs CLKID_SD_EMMC_A>,
> -					 <&scmi_clk CLKID_FCLK_DIV2>;
> -				clock-names = "core", "clkin0", "clkin1";
> +					 <&scmi_clk CLKID_FCLK_DIV2>,
> +					 <&clkc_periphs CLKID_SYS_AMPIPE_NAND>;
> +				clock-names = "core", "clkin0", "clkin1", "pipeline";
>   				resets = <&reset RESET_SD_EMMC_A>;
>   				assigned-clocks = <&clkc_periphs CLKID_SD_EMMC_A_SEL>;
>   				assigned-clock-parents = <&xtal>;
> @@ -744,8 +745,9 @@ sd_emmc_b: mmc@8a000 {
>   				interrupts = <GIC_SPI 177 IRQ_TYPE_EDGE_RISING>;
>   				clocks = <&clkc_periphs CLKID_SYS_SD_EMMC_B>,
>   					 <&clkc_periphs CLKID_SD_EMMC_B>,
> -					 <&scmi_clk CLKID_FCLK_DIV2>;
> -				clock-names = "core", "clkin0", "clkin1";
> +					 <&scmi_clk CLKID_FCLK_DIV2>,
> +					 <&clkc_periphs CLKID_SYS_AMPIPE_NAND>;
> +				clock-names = "core", "clkin0", "clkin1", "pipeline";
>   				resets = <&reset RESET_SD_EMMC_B>;
>   				assigned-clocks = <&clkc_periphs CLKID_SD_EMMC_B_SEL>;
>   				assigned-clock-parents = <&xtal>;
> @@ -758,8 +760,9 @@ sd_emmc_c: mmc@8c000 {
>   				interrupts = <GIC_SPI 178 IRQ_TYPE_EDGE_RISING>;
>   				clocks = <&clkc_periphs CLKID_SYS_SD_EMMC_C>,
>   					 <&clkc_periphs CLKID_SD_EMMC_C>,
> -					 <&scmi_clk CLKID_FCLK_DIV2>;
> -				clock-names = "core", "clkin0", "clkin1";
> +					 <&scmi_clk CLKID_FCLK_DIV2>,
> +					 <&clkc_periphs CLKID_SYS_AMPIPE_NAND>;
> +				clock-names = "core", "clkin0", "clkin1", "pipeline";
>   				resets = <&reset RESET_SD_EMMC_C>;
>   				assigned-clocks = <&clkc_periphs CLKID_SD_EMMC_C_SEL>;
>   				assigned-clock-parents = <&xtal>;

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil
