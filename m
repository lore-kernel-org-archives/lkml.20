Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793962377;
	b=M0z2G4tzJjuaqLkvKJU7IuD3vBOtyqk6PvrBsYtBH9Xc8rGFS5R4u5ieiM8cY+FLPzWq
	 Zv+K4uJCnArVynRFW1oOHESurjgVL+IVmws3umpCbxJiZBxlehbgyVsKWki2D1UkbSNua
	 6mAHGj1dhhgGRm44D6a44TguLAUNYtMz0WDVVPNJhZrExMUtB+uKBzelovHuD1e6NOSPa
	 pg1HCDSUCqg44AiHDZsBPMl7x7DtUV9wuTiLEysSpNKxPe8j9IpNLbPjiTds2qr2P/eeu
	 Bc4PBc/lPFsfj4AwRD1cAydu0/mv1CyUTdeKC1pQcOBT70VgxYKYf19i/SWG35f8EXA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793962377;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:From:Reply-To:Subject:To:Cc:
	 References:Content-Language:Autocrypt:Organization:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=h6kLZ8i6rJjG0cT28y1NGxwCKUSmKTnRbGESAnsD4Hw=;
	b=FNaSbw7RMFGJiZ+YUZz3RJ7ONo9x7DuvnvYLVsKsH1lXSCtJgz4b8FPzji64zxMD5G6A
	 GQRTKMdTFpMOXR7k/Akh2oFF63gSuu9akfa2+miuU5d/fJu+J8oMrDJlgBcUc7n/uxvS9
	 BEr0Pq1WwRQgPyXrJmrEd0xp/Qb3260/DXbc0BcUV4QSdNjVrxK0+VDdrjGAIklNmPMsd
	 sWQTBoW0Cvb4nIEoDrGB/sFN/Y635+wvWSoojrriIHpMMauEo5ICDZTiLFU1Y96zJiEC9
	 5MaO4koznQ6AGeXChy2IkJPNUjzO6d1TwiE18iBlWjVFTI1PytqdAnEX0le42icNeYA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=wKTOPBvt;
	arc=none smtp.remote-ip=209.85.221.42
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49BB3606A332
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 10:52:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 49BB3606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=wKTOPBvt
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-4922523d1afso300716f8f.0
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 02:52:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793962376; x=1794567176; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=h6kLZ8i6rJjG0cT28y1NGxwCKUSmKTnRbGESAnsD4Hw=;
        b=wKTOPBvtJlvXYwQFwduNxulhkI1q15Ez4CeJzSIthsik1J7CJE+Hyr92aM5ECpzrPa
         UNq0Ni/zcyYuUHYxDos49FQTwXTfWSp8iz0LwIgtX90KL7GrQ8YaP1iDPEJjoCc0GGED
         zUKzOBDfkOx7PcGIxRwLHp1laU9sd9Fw7WVA7iAT/XFH752U/x8DmG3pkq5OH/Mp/BE8
         RwAo5FcBFnFtxHnlj2i9kWH1TNTKiOVnMIWweD0w9HudvHxJ7t2uer4WzjcJECtPwYGE
         +Sq+WIcfN5M2gNc10TnxTq3oHWPvzQsR1kextonGSXpgW4ajqkJeZR7fyKZTgGeG1rP+
         TNpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793962376; x=1794567176;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=h6kLZ8i6rJjG0cT28y1NGxwCKUSmKTnRbGESAnsD4Hw=;
        b=u0LYECR3FiQXUo6YLW7VZdP6QOzDFe2LiMOvbKpSYT86hYXpBrVhw689fAwWECI35A
         fkxjDr/Nc0knvMqwSiOyNxEoB4oM5dUMQERPbw7juWHoaBN6cRY0I9yFcnIQ0DVkfSbQ
         HTeP+HbYyxGCNJJaQYsDPQzhkBfQWTs8vlfJT4fDLBXElsCpM7/jTfY0Kv7LJ1eWaO69
         dDgjhdrypCALfroQTEhUnSWb/YFPTk9mLK2v3EkPORJ0/cNoaDqikW6UYtoRHuz8Hkad
         CIFHjVwDFgj3xNmM9iyQtRFqIghh1dymOM/uSWVsmq+aompbeJ6Z0IbeHsfp5sLhyyYI
         PniA==
X-Forwarded-Encrypted: i=1; AL+hErEBbM9rgCwNJET1aJ6Etwrb+A2YFbUSFtDX33sy2msD9GcsgsZX8KjCqb0MWX4O6Al/B6MqTTJCbm7Q6RM=@vger.kernel.org
X-Gm-Message-State: APuU4Z/ZIiyZQ5onKkkze3gAVoGjp5WqAX/XkHdTyaXitkUwdxo5QGJ4
	nUs3VZpFw2U6A9WCPa1q4Oa3QT/6mXfMEQpz3+KrttFHOubwuBHBNx6ZXrdWK+c4770=
X-Gm-Gg: AYBFou3nGV+TjvJTPqPACzOmEBlpn7MGDUguQd3rsXwt5xdMZ8lRkqG0iVuxPQj2ez4
	4P+W7Di5ePsmrtDu8Bbya21ZZfSh4KvjECpC3nDb8nMy3Fn85xKbjKGyzbk73Qmgq8qpn7aN/4Q
	gFFEMVu/QZOAp9sPT1brqUIe/EE+K3Kas4+S3cfxbSxOUbvcyzgEKW60sx+kNq+/t4Y8Tjs/so5
	+KMfK4KEzX10NXi0W73OA1rSUaLMyBsKSHT3OaTPlRo+Gy0eUjR5tC+DCYIapRWVgoGPLowDgh4
	e/Ppl7ej7OXF8z+hoXRareji/iHgtXXLIKlTRawKQRMTX/uKPay7Y62M5j+YK58EQ5Gj2vtcGh3
	EO7WxfhXcPkJmSMHvzFtdcgGAeqvM2StGUn35cI1XJLxypJY7gC+La1CZ9PobI39U0WgOmJuzUm
	OBKuzeEd0YjxV3VNJ3E1gculCCJVTjSW1lUS5To4NQjJJ93gwqxBD1uQ1kOCfFd6Bvi7PVNRBak
	R+/Wi/pvWDN/duOSONnf5t3XR4hBzIqGWrWxyGLFw+aW/lWHNaX8R3j6tXfb+BQG5bcOKS88MPB
	gRlZrScNwW61ZdJ3R3LSBswavn4tS7OPX/HK2zanJcBTBwGVCUgdjDsPiGD69SDfzo9fz2pzrww
	q7q7seho=
X-Received: by 2002:a05:6000:4a06:b0:48d:f034:7fcd with SMTP id ffacd0b85a97d-49278a136fbmr4487405f8f.51.1793962375440;
        Fri, 06 Nov 2026 02:52:55 -0800 (PST)
Received: from ?IPV6:2a01:e0a:106d:1080:9df2:2e39:58f0:72ca? ([2a01:e0a:106d:1080:9df2:2e39:58f0:72ca])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-492fc80e017sm2563298f8f.34.2026.11.06.02.52.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Nov 2026 02:52:55 -0800 (PST)
Message-ID: <cd5c6354-58c2-4e41-b7b5-af1e2910be57@linaro.org>
Date: Fri, 6 Nov 2026 11:52:54 +0100
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
From: neil.armstrong@linaro.org
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 02/10] arm64: dts: amlogic: meson-s4: describe the CPU
 caches
To: christian.koever-draxl@student.uibk.ac.at, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, khilman@baylibre.com,
 jbrunet@baylibre.com, martin.blumenstingl@googlemail.com
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 =?UTF-8?Q?Christian_Stefan_K=C3=B6v=C3=A9r-Draxl?= <ckoever@outlook.de>
References: <20261106104659.54656-1-christian.koever-draxl@student.uibk.ac.at>
 <20261106104659.54656-3-christian.koever-draxl@student.uibk.ac.at>
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
In-Reply-To: <20261106104659.54656-3-christian.koever-draxl@student.uibk.ac.at>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 11/6/26 11:46, christian.koever-draxl@student.uibk.ac.at wrote:
> From: Christian Stefan Kövér-Draxl <ckoever@outlook.de>
> 
> Describe the per-core L1 caches and the shared 512 KiB L2 cache, with
> the geometry the cores report in CCSIDR_EL1 on an S905W2.
> 
> Signed-off-by: Christian Stefan Kövér-Draxl <ckoever@outlook.de>
> ---
>   arch/arm64/boot/dts/amlogic/meson-s4.dtsi | 38 +++++++++++++++++++++++
>   1 file changed, 38 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/meson-s4.dtsi b/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
> index 2a6fbd530836..675db02a8d5e 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
> @@ -22,6 +22,13 @@ cpu0: cpu@0 {
>   			compatible = "arm,cortex-a35";
>   			reg = <0x0 0x0>;
>   			enable-method = "psci";
> +			d-cache-line-size = <64>;
> +			d-cache-size = <0x8000>;
> +			d-cache-sets = <128>;
> +			i-cache-line-size = <64>;
> +			i-cache-size = <0x8000>;
> +			i-cache-sets = <256>;
> +			next-level-cache = <&l2>;
>   		};
>   
>   		cpu1: cpu@1 {
> @@ -29,6 +36,13 @@ cpu1: cpu@1 {
>   			compatible = "arm,cortex-a35";
>   			reg = <0x0 0x1>;
>   			enable-method = "psci";
> +			d-cache-line-size = <64>;
> +			d-cache-size = <0x8000>;
> +			d-cache-sets = <128>;
> +			i-cache-line-size = <64>;
> +			i-cache-size = <0x8000>;
> +			i-cache-sets = <256>;
> +			next-level-cache = <&l2>;
>   		};
>   
>   		cpu2: cpu@2 {
> @@ -36,6 +50,13 @@ cpu2: cpu@2 {
>   			compatible = "arm,cortex-a35";
>   			reg = <0x0 0x2>;
>   			enable-method = "psci";
> +			d-cache-line-size = <64>;
> +			d-cache-size = <0x8000>;
> +			d-cache-sets = <128>;
> +			i-cache-line-size = <64>;
> +			i-cache-size = <0x8000>;
> +			i-cache-sets = <256>;
> +			next-level-cache = <&l2>;
>   		};
>   
>   		cpu3: cpu@3 {
> @@ -43,6 +64,23 @@ cpu3: cpu@3 {
>   			compatible = "arm,cortex-a35";
>   			reg = <0x0 0x3>;
>   			enable-method = "psci";
> +			d-cache-line-size = <64>;
> +			d-cache-size = <0x8000>;
> +			d-cache-sets = <128>;
> +			i-cache-line-size = <64>;
> +			i-cache-size = <0x8000>;
> +			i-cache-sets = <256>;
> +			next-level-cache = <&l2>;
> +		};
> +
> +		/* Geometry as CCSIDR_EL1 reports it on S905W2. */
> +		l2: l2-cache0 {
> +			compatible = "cache";
> +			cache-level = <2>;
> +			cache-unified;
> +			cache-size = <0x80000>; /* L2. 512 KB */
> +			cache-line-size = <64>;
> +			cache-sets = <1024>;
>   		};
>   	};
>   

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil
