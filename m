Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACC05242D89
	for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 13:01:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788094867; cv=none; b=TjmUfhtdGHit+Hb3rTaNobnDrU0x/lCLpRqI1nBhiStI2kmyOvF14G7kf3ogkSVvpDXt4HyplrrekaDwf3PkZk2+xdUv1mtz/eGduoHNTl8fxS50EyDCi8FdwBObMjNgdc9kWJ8qAhOcPtxoeU7hVobx43L/T0gS+X8XHluri7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788094867; c=relaxed/simple;
	bh=0DRikPuLl1nle7mcVDUoDj5GtLILLiHE0n4FBZIds2w=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=sUe3gAre/D0tLhYsqIbUPMHn6u1S/ABnk7o2USq9Gu7TrVM6ZS/+OrslBNkY85H/jYeuXe0ouS6YHuONVmq13KOJXl/DsQw8bKYyGM7S0RsGypq8zpBEVNr4DeSTyM2bEr4pGBXzb+g+Bs/UBT/oZo5JI6xUQRUmOds25j58SnI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IKHyJxe0; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IKHyJxe0"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-49b0d78a801so19467725e9.2
        for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 06:01:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1788094864; x=1788699664; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sJWD3o3HQBZZ/WZYdRYAGX1zvKwfbjT6qB/Y+mCi/aU=;
        b=IKHyJxe0QzoXgQLkMqy07d31UEbrsL4/YSoeocsv2d88vKGdopXHtE7ODE+Msf5Iwn
         jLF2Hj/KzthK3Gsmq68QVqAryEphUKlK3pcT0GsRHbOVre3Edsdw4FrQuUZLn7SKBBIQ
         TSwyYPvOmBdZF4M+LaZhpbGsPvZtXavMLvp6FmaGA05SRo5aD3xWSUqvA7/+ZLwnRp9Z
         DKnolOfPhAl0Locx5+x56+vsoAuQ+Wy0OMoQ+89SvM6V+vur1zAVZPFFKHdiVBBU4ICB
         JaTkOzRgXfolb2kt+Sci7pSS6C4AeUGE38K4bKleZntxDazd3c3OlLUtm/EnSurQK07j
         kXmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788094864; x=1788699664;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=sJWD3o3HQBZZ/WZYdRYAGX1zvKwfbjT6qB/Y+mCi/aU=;
        b=RYvBvJ77A0owCg1G1ZYiEke1EiDhGitj+H5LRZS98aJ5ewIL+9bC1uRrlrjGPHyd6o
         91vkOGjcOPgIJHqsBp9s6EpPC/wHFsGq/k/+f5r4jESUUWh5ZQ37MxVIV6Wjk6U6/x98
         iyo67v/0h1J3IaCKrnWYfKjxFAaAXVUyyI2A6jEZEHYqZz3aC908qHvA/O3wmnKnLwyf
         DCsMoLRJTQF/Mm7S4APUi5KGHp2Drxt7SQPf97lwHPsTnGxh727VX44Oc1DCgZlyDDmf
         mc+6fPbeoe0zG3YZ0Xyfait82JJu66+3sJF23RqJd7DSzN1pu2L/8YKuxrOQyHvvcB/U
         AJ5A==
X-Forwarded-Encrypted: i=1; AHgh+Rqh1rKUWHyCBXQZIDiHUacc/lNarKYrIMLZbqnuVPbH6NVTh0Szv5wHLXTyWs5j8QhzksPt9hIVKEbSQZQ=@vger.kernel.org
X-Gm-Message-State: AFuF++kBygF57xKX7i+S7E+mrCTyn2Gqo3m4R6WHT/IT/dcVwB4455vn
	4GpK+dRkfGFQYUbjXGVYp7b1bi+IQ1ZkrefTLOwm/r4Okd/pgWklUjnpQ/mjBhfJOAY=
X-Gm-Gg: AR+sD12sYkfmPtEb9nsHeZ3jTXW6P88hKCHi0o4LJTiM53pZRszW5EjjC7CgRG/otZi
	M6gboePc/Qx96x0ZVxogqTVeuoSWww/KGJV6qtZGvPzgRK+2quoBj+hjSVRzWcVW4iLa2rsQ32J
	JBJJqpLmNawgVJY5JtBU5kAYVXL6VCYo3bKCIRR/jPP5kFjlumv8nDFPgi8/dQwzzanVCEVjWbh
	yzpwqTmtGUmDJktZZXiNRboXUK9wHtZ9v1QGYyZ0V1SJSou0eJT2rap8S1oAInihWlENG5s1Lup
	NpoaPi8fMiMziL/R0koXqzr/kT38/eRFunr6r9cH1sb6Y1vOlRiQYsCyKljhH5iB+IkiCMU+Umo
	1rhYXyCt0E8rnwyhjZ76CiKFtQqks/A37zE9sehZzCI4YcSoTyJWVctkKVhp2ghW6qn4ZLZJdhx
	sN6FpTg1FMqV9PEXTTv5L+dWw+AWAwWW3ZDIQWgMLMjI/pG5B8aV6o0W7zxiht821oiFIovfTQj
	P6rblSjVA==
X-Received: by 2002:a05:600c:3155:b0:49b:910c:7703 with SMTP id 5b1f17b1804b1-49b91c3dcb4mr278278415e9.9.1788094863617;
        Sun, 30 Aug 2026 06:01:03 -0700 (PDT)
Received: from [192.168.1.36] ([83.214.235.72])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ccea87e1asm81979695e9.2.2026.08.30.06.01.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 30 Aug 2026 06:01:03 -0700 (PDT)
Message-ID: <08cf135f-7fef-4dae-88d5-2ee0a080853d@linaro.org>
Date: Sun, 30 Aug 2026 14:59:34 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH RFC 1/2] dt-bindings: display: panel: Add bindings for
 Novatek NT51021
To: Nickolay Goppen <setotau@mainlining.org>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260829-qcom-novatek-nt51021-panels-v1-0-cc1ca61bd261@mainlining.org>
 <20260829-qcom-novatek-nt51021-panels-v1-1-cc1ca61bd261@mainlining.org>
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
In-Reply-To: <20260829-qcom-novatek-nt51021-panels-v1-1-cc1ca61bd261@mainlining.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/29/26 22:09, Nickolay Goppen wrote:
> Novatek NT51021 is a display driver IC that can drive DSI panel. It
> is also present in the BOE TV101WUM-NX0 video mode panel, which is a WUXGA
> panel with a resolution of 1200x1920 and 10.1 inches size. It is found in
> Xiaomi Mi Pad 4 Plus.
> 
> This patch adds the bindings for display driver for the IC, with support
> added for this BOE TV101WUM-NX0 WUXGA video mode panel.
> 
> Signed-off-by: Nickolay Goppen <setotau@mainlining.org>
> ---
>   .../bindings/display/panel/novatek,nt51021.yaml    | 93 ++++++++++++++++++++++
>   MAINTAINERS                                        |  5 ++
>   2 files changed, 98 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/panel/novatek,nt51021.yaml b/Documentation/devicetree/bindings/display/panel/novatek,nt51021.yaml
> new file mode 100644
> index 000000000000..a3e4ed10e645
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/panel/novatek,nt51021.yaml
> @@ -0,0 +1,93 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/panel/novatek,nt51021.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Novatek NT51021 based DSI display Panels
> +
> +maintainers:
> +  - Nickolay Goppen <setotau@mainlining.org>
> +
> +description: |
> +  The NT51021 IC from Novatek is a generic DSI Panel IC used to drive dsi
> +  panels.
> +  Right now, support is added only for a BOE WUXGA LCD display panels with a
> +  resolution of 1200x1920. They are video mode DSI panels.
> +
> +allOf:
> +  - $ref: panel-common.yaml#
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - boe,tv101wum-nx0
> +          - boe,tv080wum-nx2
> +      - const: novatek,nt51021
> +    description: This indicates the panel manufacturer of the panel that is
> +      in turn using the NT51021 panel driver. This compatible string
> +      determines how the NT51021 panel driver is configured for the indicated
> +      panel. The novatek,nt51021 compatible shall always be provided as a fallback.
> +

You can drop the description entirely here.


> +  reg:
> +    maxItems: 1
> +
> +  reset-gpios:
> +    maxItems: 1
> +    description: phandle of gpio for reset line - This should be 8mA, gpio
> +      can be configured using mux, pinctrl, pinctrl-names (active high)
> +
> +  vdd-supply:
> +    description: phandle of the regulator that provides the supply voltage
> +      for digital circuits
> +
> +  avdd-supply:
> +    description: phandle of the regulator that provides the supply voltage
> +      for analog circuits
> +
> +  havdd-supply:
> +    description: phandle of the regulator that provides the supply voltage
> +      for analog circuits
> +
> +  port: true
> +  backlight: true
> +
> +required:
> +  - compatible
> +  - reg
> +  - vdd-supply
> +  - avdd-supply
> +  - havdd-supply
> +  - reset-gpios
> +  - port
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |+
> +    #include <dt-bindings/gpio/gpio.h>
> +
> +    dsi0 {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        panel@0 {
> +            compatible = "boe,tv101wum-nx0", "novatek,nt51021";
> +            reg = <0>;
> +            vdd-supply = <&lcd_pwr>;
> +            avdd-supply = <&lcd_pwr>;
> +            havdd-supply = <&lcd_pwr>;
> +
> +            backlight = <&i2c_backlight>;
> +            reset-gpios = <&tlmm 62 GPIO_ACTIVE_LOW>;
> +
> +            port {
> +                panel_in: endpoint {
> +                    remote-endpoint = <&dsi0_out>;
> +                };
> +            };
> +        };
> +    };
> +
> +...
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 7291238bc09f..6cbf9ee3fa9b 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -8354,6 +8354,11 @@ S:	Maintained
>   F:	Documentation/devicetree/bindings/display/panel/novatek,nt37801.yaml
>   F:	drivers/gpu/drm/panel/panel-novatek-nt37801.c
>   
> +DRM DRIVER FOR NOVATEK NT51021 PANELS
> +M:	Nickolay Goppen <setotau@mainlining.org>
> +S:	Maintained
> +F:	Documentation/devicetree/bindings/display/panel/novatek,nt51021.yaml
> +
>   DRM DRIVER FOR NVIDIA GEFORCE/QUADRO GPUS
>   M:	Lyude Paul <lyude@redhat.com>
>   M:	Danilo Krummrich <dakr@kernel.org>
> 

Move the MAINTAINERS change in a separate commit.

Neil
