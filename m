Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E486F1D4606
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 07:14:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789024465; cv=none; b=cus8Y47nQDM5JUOx2iQkRrxmIERMCBYeX9ukxhWUAXsgkVZ2yL//z2uRxIyO7OPgovEjtn9jJlqqurVwpK0Xgd254TF3KtHzZ/r40fKrGA/rglYu4yRYJUl+OsndtmOJY5WpuiR1zHMG1OhIP8AWetptNwOcjdvlRsXNyojGoFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789024465; c=relaxed/simple;
	bh=cfnlVmyhYPZkZGxRJVcWZ3KuHUGPHu6/QM/rF0grmUc=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=OVXuU8k/JRlU/1C0ju3agT221y8P0YVuAOdSvyG4d1vKlTrj0ndpetSjahcrKE9hzliauBiHli1kzXxbWZ7NEEyzqKL9zW541xycko21kOT/KTNhhjwl4OI1jkdRI4KjN5a4q0uEyqUJKKzuN4KTkVR6Q6XvStVO5wX3mB/N66o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wLN0wYuC; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wLN0wYuC"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-47de0093c42so6218742f8f.3
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 00:14:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1789024462; x=1789629262; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JcyMbgDgyo89MWk1toywy6KeNj1X5yjPwiq8FggZGfQ=;
        b=wLN0wYuCqSBXJpo0m39jsQnlyu6HlquOn6eW7oE5BJYi9R7eVA1Xk7NTTZbZ48bjhX
         rgFV4ljSLLKS3r/A8mcS2EpD9pYDxSp9qiqCJxivnBsjyfbNylWRBQtRL+15JEkKkPtF
         BbYn1ICvRZpXtzigJ+D2Py76UcrkayTaRXEQaAE8VpSNUfgu57K4oILKDWvb5lM9fsoN
         a2yU+4tDvuqjqyx10+0E1tGRYVDXRMtIZ9v9W6KorGBzdEMmy1mJoUcY9YndqCYwI544
         UQjlN1sRrrBs/0mmaeCZ0rjicc4KMPncMRoZnBPGHfjO+xWounhD8phlSUdKhAtMHiMn
         b5wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789024462; x=1789629262;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=JcyMbgDgyo89MWk1toywy6KeNj1X5yjPwiq8FggZGfQ=;
        b=E5FHG058KeEWNkcpWIT/q8w/UTt7KdgOw6AaoJhoifbt6kRL/pAwxo/xcgCNKOifcj
         zMGPf0zoScQx/9TnyuSG4XaB/Tfj5G0kUtDlf8iqTO4hvH8H1f5VpiDxQbWT6OQ7PxgX
         hDiMvh2WT+8Fkm/yHsBCwZ6J1Vr1XBZugD7FJirTdgiY2D+VV78J+J77eJKMDxwbL9+0
         kJ+pG/X6IjUz/pelN2vRkdQQDNJEfJzKIvdZa1zTdjqXV8VdSvhgiYLSWYD7jC+63p7/
         32fNDH/SJs5ZV/plmV9qj5ZrS35tIYmuEBL861Ix3KZ56c11Y7cwYuzFtK2xMppmMQgh
         7alA==
X-Forwarded-Encrypted: i=1; AKwUvBwwafql8IAQB9NtBm+mqDVdA2vaWtGikEBuXFsFe2UlCSEzjrP2jCG+9JLzZTKPaeUq0SVeptaByWQ56Os=@vger.kernel.org
X-Gm-Message-State: AFuF++mf6PQ+9zWG875HutZZMhP3WPmxKT9fEDwjIExx4xiUnN+6YoN0
	NW4GKawjbRnja2uo0Z/YV6NxeuFqGWRJQyiBFmj1u9u6waBjDzps2VYWQUsTAH/y1Jw=
X-Gm-Gg: AYBFou1HBHqfsd740Ccaz8R27KNOSyRDeSSXHHAAlNVyw4vBWFwc6I+tsKbyCsRnPAw
	IcL9b+yFNC8UaWj8+MrC1vCFEBDjoGl3NBSBHSvB7iKtt7vJHDYn0hGj9q5qCSUL65zCNtAX+RP
	nCX1n03CfR3SiNOzw3t9fG+vSxyx+s5s+qG9Cah8rPuZaSowbebIGTVRhbtkjPJCtEYe/htxLPa
	JHw2t2MwlffRktmby87uxvW8Ms9Xp/z/ns8gC+6Cmfb5vi3zmBPh9oMm9vOic7mFI0G3oTE51NY
	vAtovNMjur+PLT3YHULd7TtIhMSQqtEVSFp5wQqd42LDBXBHJF7JKetdUa5Vh+bzo+sWVs9tzoA
	ARrIlRFoog5lVSqX8ClfFTHCWijbGQInfemkRs3I65Br8gaDGY04bMtjQBug6nCFiTB8xr49z/t
	ry7YwomVg0m0u/kkVYbNMk49jLgY2/ICtj11UPDM6whkylq3Wt9cyM2ByVznp3Cdffj1qshtYvA
	0aNqy+TeXfw3D8LKXspJNLLjmI/Q9ecxIIjtKG6pX9MgeB5CMwSJw==
X-Received: by 2002:a05:6000:25c9:b0:485:ac96:7264 with SMTP id ffacd0b85a97d-485ac967432mr8582029f8f.5.1789024462022;
        Thu, 10 Sep 2026 00:14:22 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:3caf:d840:c911:29a9? ([2a01:e0a:106d:1080:3caf:d840:c911:29a9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485883a9b49sm41176221f8f.17.2026.09.10.00.14.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Sep 2026 00:14:21 -0700 (PDT)
Message-ID: <e51d62c0-7d02-4516-8f03-9d1be8c5c64b@linaro.org>
Date: Thu, 10 Sep 2026 09:14:20 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v3 2/2] arm64: dts: amlogic: a9: Add IR controller support
To: xianwei.zhao@amlogic.com, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20260903-a9-ir-v3-0-cd471c667c15@amlogic.com>
 <20260903-a9-ir-v3-2-cd471c667c15@amlogic.com>
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
In-Reply-To: <20260903-a9-ir-v3-2-cd471c667c15@amlogic.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/3/26 07:22, Xianwei Zhao via B4 Relay wrote:
> From: Xianwei Zhao <xianwei.zhao@amlogic.com>
> 
> Add the IR controller node for the Amlogic A9 SoC and describe the
> corresponding remote input pin configuration.
> 
> Enable the IR controller on the Amlogic A9 A311Y3 BY401 board with the
> proper pinctrl setting.
> 
> Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
> ---
>   arch/arm64/boot/dts/amlogic/amlogic-a9-a311y3-by401.dts |  6 ++++++
>   arch/arm64/boot/dts/amlogic/amlogic-a9.dtsi             | 14 ++++++++++++++
>   2 files changed, 20 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/amlogic-a9-a311y3-by401.dts b/arch/arm64/boot/dts/amlogic/amlogic-a9-a311y3-by401.dts
> index a6b380ca47a5..389c9de3dc3c 100644
> --- a/arch/arm64/boot/dts/amlogic/amlogic-a9-a311y3-by401.dts
> +++ b/arch/arm64/boot/dts/amlogic/amlogic-a9-a311y3-by401.dts
> @@ -38,3 +38,9 @@ secmon_reserved: secmon@5000000 {
>   &uart_b {
>   	status = "okay";
>   };
> +
> +&ir {
> +	status = "okay";
> +	pinctrl-0 = <&remote_input_ao_pins>;
> +	pinctrl-names = "default";
> +};
> diff --git a/arch/arm64/boot/dts/amlogic/amlogic-a9.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-a9.dtsi
> index b0e0fadeed82..790109aa7c9c 100644
> --- a/arch/arm64/boot/dts/amlogic/amlogic-a9.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/amlogic-a9.dtsi
> @@ -241,6 +241,13 @@ test_n: gpio@c0 {
>   					#gpio-cells = <2>;
>   					gpio-ranges = <&aobus_pinctrl 0 (AMLOGIC_GPIO_TEST_N<<8) 1>;
>   				};
> +
> +				func-ir-in {
> +					remote_input_ao_pins: group-remote-input-ao-pins {
> +						pinmux = <AML_PINMUX(AMLOGIC_GPIO_D, 5, 1)>;
> +						bias-disable;
> +					};
> +				};
>   			};
>   
>   			gpio_ao_intc: interrupt-controller@4080 {
> @@ -254,6 +261,13 @@ gpio_ao_intc: interrupt-controller@4080 {
>   					394 395 396 397 398 399 400 401 402 403>;
>   			};
>   
> +			ir: ir@14080 {
> +				compatible = "amlogic,a9-ir", "amlogic,meson-s4-ir";
> +				reg = <0x0 0x14080 0x0 0x30>;
> +				interrupts = <GIC_SPI 413 IRQ_TYPE_EDGE_RISING>;
> +				status = "disabled";
> +			};
> +
>   			uart_b: serial@1e000 {
>   				compatible = "amlogic,a9-uart",
>   					     "amlogic,meson-s4-uart";
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil
