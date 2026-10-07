Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 568B43A63F3
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 12:35:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791376558; cv=none; b=OvaL74RqEMCsHluE98VQ2UNyxJEPAKqVt3vKKAHZ02nIsK/sdnesRyeX2T9f4sgfUdFY4D6V8sbmMzzW+RYUmao2+r4Y/S/CfOUy2WCXyZ9NOSTPqgg1txIkosP9zY43Vzuqjd37vKL+dNpf8Hcl7bOP/oy1/FO7IOU9V/yuXMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791376558; c=relaxed/simple;
	bh=LG+u0ls6VzC7KKKN6T1gPPOh03a/2rcmPcFgIdyIVq0=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=fXB/Gj9ycguC4fKdFnkfUJUbikGCmnlrDLO7srLQXM96J7o7LIlGLa97AGUBzzo8UaWzbCrZ2FoG5aEdfAX0w48w3KonaMlGFcyWyeWQNSoHfHArYiHGglYFBzFVBRiKPhkRswWYgL6bPjA5jlCIITmtVtZO/Rm0vDi2+rSHDUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MER5TZR1; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MER5TZR1"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-48b03f23305so3436143f8f.1
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 05:35:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1791376548; x=1791981348; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=atVsgpDLAd3FCy/r5rwHewVKjgkttl9/HQ0eAY9dsQ8=;
        b=MER5TZR16FnnX+q1KYf3/L+b18JwORaY3RZrf0y4tlJEPInEHPCiEH+X8trYqEPMbW
         5bHmdl0Y2uqZzOlcFj2N91qj56OYkjsEuKpqt7RlA759t3ueMKMU638Zp6mVwDVH+Sfi
         wlM3YwoorWKF/uTaovNFebYS4YKZPiXRlDO94mrUXWddwTRsIZ/HbrMt5yJRmRAjhsie
         yFnVAWmiGqsBfMw6pDdjFjd0beElmjI+ojSSztNeyczipNvXVoOWcaVLWX4ItfkU9lRr
         lqdVSXwRESbkLGsPrMSlWsJS/4Ag8FaPIFIJOz1/wj96VbPMWYg7wZWkVSAj7OPS9EAw
         HLEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791376548; x=1791981348;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=atVsgpDLAd3FCy/r5rwHewVKjgkttl9/HQ0eAY9dsQ8=;
        b=kHdHBm+pYHB1Ujpxd5qNQVuDqVWDM59g29FBMBcQ9CDls0JTNkOIGu7R5VOC5r4ZZP
         uWMZto9HwhBnrFJpPSIq/7D0ePMqCRZwjAZTjGird2lc84l/pzmNvyD4B9vBVpWB2LYw
         KtcnxvPJ8gdwk/9ov9UzsQ6aMQenQLTg5QI69D8yjdxJVi9EobZsvbGQuPnV5Yh/lEKc
         ROzhEOtTcxO0LYLMzeM3bg0iTKmAJHiLkJVzQJNwj3Ax4Lm3ML7r/PR60LgkjPECSoI5
         FVwfP8qq0PEimaFb7IJnJFOe7ax1xv880Vn932fRMCEpn4RYmZ4NoilfMwaHXJzcnN+9
         4Trg==
X-Forwarded-Encrypted: i=1; AKwUvByVpcCi9s5dd7ahDwkI4H1QpnSvrOgH6aqFZmSmSsN635b+VcpRt+Sipodr5QXFAqxdkUUHNRyPlnJhugE=@vger.kernel.org
X-Gm-Message-State: AFuF++msjGQnEn2KSUsufVS4Xs8wLt75cbLzOet3QZbd3vhf0RdgUEan
	vQKWXyMebIxeS7OKvlZPiJczLfJXD2bXFeIRmW2BqAh9e8EE+YsV23zDlsWGz2Yudvo=
X-Gm-Gg: AYBFou3qMA8PI7+Sob42T5DogsnscUsU8Qp/KHSrs3J0FkwgsJPd2/baOJWIKB0rsml
	BDd/1FU5ZaV/9p6GdTUAZFDB0Q0vfdXeMKiZ99ujlHJI0pethq/ZDtEKLVbYUXzkGXAtKBLCcEG
	qfuOTpBqEHbWUga9xn3zPpbeicSzLndjxcYG+letgZZWsQhe5YOH5oPOKWEiKNXk1vrDI8QTDKn
	hgf3kW5JH8PkzsRJGCIka2lKV/OXJKHhMcdf/j93lRavFXH6vWFehe+kboh+7+jNYNyq3hRN0bC
	TDjDjtvCxeDJ6+DxuNaVT/USRlB0EQXxAgNj2Ydq8KOsB0spHFizoq7rMu7PuvMEc6Uao2taEsp
	mt9fN4os+lYk9NG9aaC42GaHAB+C0n8JsJdMjRC7E2Imjh+ytovnYfnBQ8vDTuNOlS9o7CVXPNd
	1sRLmAHKtLZy0qMnk8aP40bUH5gxnSRKL/NHB6spKSUAG4Z2lRl7Mxo32Ln5PeEMUPOeJIHGd6w
	2/ZMe+Agm4Ko8ltijZBi1A5Fntu9ts=
X-Received: by 2002:a05:600c:8b54:b0:49c:fc6e:8caf with SMTP id 5b1f17b1804b1-4a18043c9b9mr34840155e9.19.1791376548113;
        Wed, 07 Oct 2026 05:35:48 -0700 (PDT)
Received: from [192.168.151.46] (90-182-211-1.rcp.o2.cz. [90.182.211.1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1822af9d5sm37187375e9.15.2026.10.07.05.35.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Oct 2026 05:35:46 -0700 (PDT)
Message-ID: <c70d918e-7944-4229-b997-7f07d924125a@linaro.org>
Date: Wed, 7 Oct 2026 14:35:43 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [RFC PATCH v2 3/7] dt-bindings: net: amlogic,meson-dwmac: add
 amlogic,t7-dwmac
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
 linux-kernel@vger.kernel.org
References: <20261007082627.63807-1-tanure@linux.com>
 <20261007082627.63807-4-tanure@linux.com>
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
In-Reply-To: <20261007082627.63807-4-tanure@linux.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/7/26 10:26, Lucas Tanure wrote:
> The T7 has the same ethernet glue as the G12A, but the controller
> reaches memory through a pipeline stage that this SoC inserts in the
> bus path. That stage has a gate of its own, which no other member of
> the family has, and nothing else in Linux claims it. It is therefore
> switched off as unused, and the port can then no longer finish a
> transfer.
> 
> Describing it needs a fourth clock, and the fourth clock of the
> existing list drives the timing adjustment logic, which the T7 never
> uses. So the T7 gets a list of its own with the gate in that place,
> under the name the SD and eMMC controllers already use.
> 
> Assisted-by: LLM
> Signed-off-by: Lucas Tanure <tanure@linux.com>
> ---
>   .../bindings/net/amlogic,meson-dwmac.yaml     | 47 +++++++++++++++++++
>   1 file changed, 47 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.yaml b/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.yaml
> index 90ef79161ab1..96118b4d1560 100644
> --- a/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.yaml
> +++ b/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.yaml
> @@ -23,6 +23,7 @@ select:
>             - amlogic,meson-gxbb-dwmac
>             - amlogic,meson-axg-dwmac
>             - amlogic,meson-g12a-dwmac
> +          - amlogic,t7-dwmac
>     required:
>       - compatible
>   
> @@ -57,6 +58,47 @@ allOf:
>               - const: clkin1
>               - const: timing-adjustment
>   
> +  # The T7 applies the RGMII RX delay through PRG_ETH1 and never enables the
> +  # timing adjustment logic, so it has no timing-adjustment clock. What it does
> +  # need is the gate of the pipeline stage the controller reaches DRAM through.
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: amlogic,t7-dwmac
> +    then:
> +      properties:
> +        clocks:
> +          items:
> +            - description: GMAC main clock
> +            - description: First parent clock of the internal mux
> +            - description: Second parent clock of the internal mux
> +            - description:
> +                clock of the pipeline stage inserted in the bus path between
> +                the controller and the DRAM. Without it, the controller cannot
> +                complete DMA transfers.
> +
> +        clock-names:
> +          items:
> +            - const: stmmaceth
> +            - const: clkin0
> +            - const: clkin1
> +            - const: pipeline
> +
> +  # Delay definitions for Meson8b and newer (including T7)
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - amlogic,meson8b-dwmac
> +              - amlogic,meson8m2-dwmac
> +              - amlogic,meson-gxbb-dwmac
> +              - amlogic,meson-axg-dwmac
> +              - amlogic,meson-g12a-dwmac
> +              - amlogic,t7-dwmac
> +    then:
> +      properties:
>           amlogic,tx-delay-ns:

Do we still want to support the vendor property on t7 ?

Neil

>             enum: [0, 2, 4, 6]
>             default: 2
> @@ -106,6 +148,7 @@ allOf:
>             contains:
>               enum:
>                 - amlogic,meson-g12a-dwmac
> +              - amlogic,t7-dwmac
>       then:
>         properties:
>           rx-internal-delay-ps:
> @@ -143,6 +186,10 @@ properties:
>                 - amlogic,meson6-dwmac
>                 - amlogic,meson8m2-dwmac
>             - const: snps,dwmac
> +      - items:
> +          - const: amlogic,t7-dwmac
> +          - const: snps,dwmac-5.10a
> +          - const: snps,dwmac
>   
>     reg:
>       items:

