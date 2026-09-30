Received: from mail-qk2-f43.google.com (mail-qk2-f43.google.com [74.125.230.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4DA42E739C
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 13:22:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790774576; cv=none; b=E300U8NyMSt8O2IVhf8rCODbJ9EqG+LmGICTZDeVaL/xSmtFdFBLYUXHLcwnB9bOWXz47sSqEGvlacU7HpX0IZm4xmuXKL+8OlMPKae6pIqN0d50aPpw6gJGpyby0Kk6YZhRjQl7C+Qod4yqlK+I5WUFFlS0QUeqS5a5c+M/1y8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790774576; c=relaxed/simple;
	bh=LM1MsI49T0fvEyd/N6oOjGXSHve509yPeVpgLIoMUnI=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=e1dHMO2EX2x2TeEj3/UTJg1RpIYsVdyeuzeD7cd1wy/nKMhbPxUtmK0K2mdb/l4s2RT+IlfMV1GIHLUUotYEubFWwPorgz+yrfwDSCSTkpwUvDvq5OTJCPm6E0dShewNYsamVlLKKVwHdgdI6wO3YxgYqTRWz9inMpuNbKL/4LU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FkDNPehq; arc=none smtp.client-ip=74.125.230.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FkDNPehq"
Received: by mail-qk2-f43.google.com with SMTP id af79cd13be357-93ca7aa84e4so57467785a.0
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 06:22:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790774563; x=1791379363; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WjNzOSbZhH3UC1XcZKT+Hgp+Sdib45z8YSE/jOVoT0c=;
        b=FkDNPehqcrcRvMwbctSV9gEOGXE9an1HdrX4HjSW+FPaE4hF8HuKcAZi/YJBpv+jw5
         vY5AW/t9TIPWGgrEwqrKA2e1q1ljyRAuaw09e0oTaZvopzERl0Gisbx0+afJcns6+LmF
         N04bJQZkRUD0oS3JPS4eYDMCamr2qHCBGJs9azNzmnbM8N7VYPVWVivfyU4bPv7g0UEw
         uEJr2Un7/GUCOSS7Fw6RLEU4yCc8CWQRU2+1iWxbDTsam/7rs7KkaSzyoBzSgh58glbO
         uY069W+naJWgpeIf4gs+2Ta6B3H4mbh0uMQTChIURpQT/A3IaPNVSlD/E7gPWFkZmjkE
         d0kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790774563; x=1791379363;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=WjNzOSbZhH3UC1XcZKT+Hgp+Sdib45z8YSE/jOVoT0c=;
        b=k7mRcWgZ2+nGNrob0y1FZ6YOKworaGhffwc1evasQvM3dE/0E0wbGebyILzEpZKDMR
         gPO1DwhBYmpgo6elCeNfwLReDupx+m9obmneArOOcOEhqaouG8pbHaQ8msOY4+zOVdgP
         plqxqYvTSQfUVraZGt3qeJlvnbGbw4ZArS//LimF+7Cw5jklm7AFfYGx0Yh/vfXyCdQ5
         V6r86TReiIRTcGx5pA+ckItarOUXEjJfQgZp66mb9XSKYizFRpyZ6tXnMDzyUnxR6Zqo
         TGkaw6+anROMngR/pg96Js2qGtI0EPR99pTo+FwOvHEb9LNTYZu12MTemXprajW2Wshr
         nMtQ==
X-Forwarded-Encrypted: i=1; AKwUvBwu6GFNu9MmT4Qcg/PUXuXaFoXt/2W/I5Ginh8peoRO845ptgC312f7SbKq0SZh9SIHNc4+OCh0CRQRRzY=@vger.kernel.org
X-Gm-Message-State: AFuF++lFdwQS+jKaedcv4AmhFrfAvsr4cqe86MYkLRsz9EKqaIHuejsi
	BUWZt1WcU8thKDk15pDnhYGvMKmCN9TS2ppHoM3tTWKCU+lc5BcA1edZq9mxXzllJWk=
X-Gm-Gg: AYBFou2h3WlglNNWaNf+3WBmKr0lMxz15KawzWWuL3ZGPAdEc1xCKj688I2b5WWFjfx
	nbs2uOnlzIqVpG10BzBnvx2p4uqdcyFzIYtd2tlzMk6yj1whOBIYb/cGnfM1PG2Y1lS89Bxiawp
	silN6vK5VvzgaMrbJ3a7HIrytmuP1wwjshPqTl9KEfoIgahbrRGAV1GfGLR3777cFMl3rjvQ2Xo
	iDWKIfcMZF8X88uSOCklfMKf/EZVu8OyG1Srzj0VTtmvLO9UnefFMnGLR1QZEcbcbib94L+Q8Vs
	jxw/wQbMEiJCxAHWg6NKkT1TS9Tz2dWef8/ptyhV4pKLoZv2oEosYjx8byELpJ6ha/29LHpwGJ9
	uBeMNQyR6SpeamXhsMU+sDFyUAqVA2gz3QwBXvrcNHUlglfu9bsM8RLfNEZM8scj9JapYgBDNOc
	Vl147PhC2LcYuUNjiME/8qkq4EeLa3+PV0dTUPyaDZwhGF2T9zfyy7/nRkEVyjARtdHG+8efQZm
	BGX0/Xgwz13eaQYoBWZMEXwPvH303KV4uFhe2+UhwYLUWA4gk+b5zCXDPF5MutAAabYt08Ang92
	zHynJF0=
X-Received: by 2002:a05:620a:2717:b0:939:97bc:5645 with SMTP id af79cd13be357-93ca96b53e8mr222317685a.31.1790774562686;
        Wed, 30 Sep 2026 06:22:42 -0700 (PDT)
Received: from [10.21.51.184] (ipagstaticip-88fc351e-cb28-db3e-3f52-ad13c70f08da.sdsl.bell.ca. [142.127.77.63])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93ca82a87f4sm114784985a.20.2026.09.30.06.22.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Sep 2026 06:22:41 -0700 (PDT)
Message-ID: <a51f9814-fe65-4a2c-92df-cbc3f00036fc@linaro.org>
Date: Wed, 30 Sep 2026 15:22:40 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2 00/12] soc: amlogic: clk-measure: Add support for more
 SoCs
To: chuan.liu@amlogic.com, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260920-more-socs-to-support-clk_measure-v2-0-224382a429e8@amlogic.com>
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
In-Reply-To: <20260920-more-socs-to-support-clk_measure-v2-0-224382a429e8@amlogic.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/20/26 12:25, Chuan Liu via B4 Relay wrote:
> This patch series adds clk-measure support for the Amlogic A5, A4, S7,
> S7D, S6 and A9 SoCs, listed in the order of their release.
> 
> The clock names for the clk-measure channels are kept consistent with
> those used by the clock driver as much as possible, making it easier to
> identify the relationship between the clk-measure channels and the
> corresponding clocks in the clock driver.
> 
> This patchset also includes an additional patch to optimize memory usage:
>    - soc: amlogic: clk-measure: Optimize CLK_MSR_ID to reduce memory usage
> 
> To avoid requiring everyone to spend additional effort on a separate
> patchset, I have included it in this series. Please feel free to point
> out if this is not appropriate for this series.
> 
> To improve maintainability, this patchset also includes a patch to reorder
> the dt-binding and the compatible entries in the driver.
> 
> To minimize unrelated changes, the existing clk-measure channel tables in
> the driver are left in their original order. The tables for the newly
> supported SoCs are ordered alphabetically.
> 
> Signed-off-by: Chuan Liu <chuan.liu@amlogic.com>
> ---
> Changes in v2:
> - Reorder the dt-binding and the compatible entries in the driver
>    alphabetically.
> - Order the clk-measure channel tables for the newly supported SoCs
>    alphabetically.
> - Add the const qualifier to the A9 clk-measure channel table.
> - Rename "exit_Tsin_B_CLK_IN" to "ext_Tsin_B_CLK_IN" in the A9 clk-measure
>    channel table.
> - Link to v1: https://lore.kernel.org/r/20260911-more-socs-to-support-clk_measure-v1-0-940e269aa52f@amlogic.com
> 
> ---
> Chuan Liu (12):
>        dt-bindings: soc: amlogic: Reordering compatible of clk-measure
>        dt-bindings: soc: amlogic: Add clk-measure compatible to support more SoCs
>        soc: amlogic: clk-measure: Support more measurement channels
>        soc: amlogic: clk-measure: Align compatible entries with DT bindings
>        soc: amlogic: clk-measure: Add support for more SoCs
>        soc: amlogic: clk-measure: Optimize CLK_MSR_ID to reduce memory usage
>        arm64: dts: amlogic: a5: Add clk-measure controller node
>        arm64: dts: amlogic: a4: Add clk-measure controller node
>        arm64: dts: amlogic: s7: Add clk-measure controller node
>        arm64: dts: amlogic: s7d: Add clk-measure controller node
>        arm64: dts: amlogic: s6: Add clk-measure controller node
>        arm64: dts: amlogic: a9: Add clk-measure controller node
> 
>   .../soc/amlogic/amlogic,meson-gx-clk-measure.yaml  |  16 +-
>   arch/arm64/boot/dts/amlogic/amlogic-a4.dtsi        |   5 +
>   arch/arm64/boot/dts/amlogic/amlogic-a5.dtsi        |   5 +
>   arch/arm64/boot/dts/amlogic/amlogic-a9.dtsi        |   5 +
>   arch/arm64/boot/dts/amlogic/amlogic-s6.dtsi        |   5 +
>   arch/arm64/boot/dts/amlogic/amlogic-s7.dtsi        |   5 +
>   arch/arm64/boot/dts/amlogic/amlogic-s7d.dtsi       |   5 +
>   drivers/soc/amlogic/meson-clk-measure.c            | 927 ++++++++++++++++++++-
>   8 files changed, 953 insertions(+), 20 deletions(-)
> ---
> base-commit: a2530c83c458a503e55219966217dfd1c36a385e
> change-id: 20260710-more-socs-to-support-clk_measure-c826f8ab9e68
> 
> Best regards,

For the whole serie:
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil
