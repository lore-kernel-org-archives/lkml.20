Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793962446;
	b=zEQvdVsQ/rjIsiKIpqWBYjubz09s8LQevl7aPLLtUg5FzV44WPsWEvF1Atu9syocVY1u
	 Ai8RzTFuns75ghdxrUzsHvcvnAutwhzCicB1y3Qv0m6RymHG9QKQl/Hs02hpysjkUw94N
	 Vn/zVOk5XaWrI1TSO6oARQDxlqE+gzRE96ZGnhYYhX4does+BJ8mIH9w7Hjai6yDxI6TT
	 8AqyGrMI3gtRsox8uoUQJ+NYwcutibCGkIY3IEueXtK6uWID9mAh03osImQxE26zo2+pN
	 MS7rMU4pKzqjXmbLymDmCOay/vjR2pgLukN4//b8j4fxHA5H9tlkTmmpNBP7jo4+2Ag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793962446;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:From:Reply-To:Subject:To:Cc:
	 References:Content-Language:Autocrypt:Organization:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=WGZXSsiRoZs5M7Tq/hSmEqWmQ4g9AUNQW2RxywPyv0U=;
	b=iS0X7+/h7RkG1K7D2wRwsQPtVXIUBGbuh8mAZQx5uo1YqSFm64lkeUVZt34DU15SQc+O
	 WPXTNys9qwh1d9nLq/iCyTw0wR9WaflbqbAcEXkzmp6JFoTkdrD0oWbCq2y0l0XfPxUXk
	 3KkraKDjP6WTLaeIfcpG9mE0cOejqACRm/yWH/DZE0AmLLd+CG2K3OCOfwwMHXHZLSlb3
	 tA2Eo73NQKVaC5nFemaOB/ZWvk2XFd+T6yiSTg7apHdVnsDRppJhpSFrD+tWHi0iVUzIZ
	 ZJIjJWsd78N9RB0qpkqM4J8fntIhNXNuBRF04zagu/PwpizAE8/+/E3Ujc7JK4hOirg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=TaNbsC+d;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3418F606A32C
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 10:54:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3418F606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=TaNbsC+d
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a2167bd087so4369555e9.3
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 02:54:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793962444; x=1794567244; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WGZXSsiRoZs5M7Tq/hSmEqWmQ4g9AUNQW2RxywPyv0U=;
        b=TaNbsC+dyq0JzLyNjniWU38zx9z5v+s5yYYVPv7vb0i+ViWgxzr66yn/GBP5j2Apxy
         309TgoUbdRYCWGFgMuO0h2aaRvbwphsSzZbgIdR3mZOjbVqI7uJMM5JCUGuVlGkB6WNp
         t6Mz1Z+lInYE9tEGkr69bsUgGJIMVdcva3bUZwS55lgkC5hdH+gafIPuQDN+5lVu6qDN
         ZpEDNl9a1zH4+QvRGgXDl2wp2xnzZJRZBvRWWhVM43Q2rVhdeztfGARNhQCyCpckYjAN
         FWz8W7i1TkqVL6UMWBmDWjZTlSZhbh8gY0j1mTVTQgY2GqVLARyzvWF9ar7TPlnAAC8m
         wO4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793962444; x=1794567244;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=WGZXSsiRoZs5M7Tq/hSmEqWmQ4g9AUNQW2RxywPyv0U=;
        b=2UdibhXDVWnplh5u0Ky2dJYREo7McouW5lyuWct04P8UXqTuerH8HsY3NoqRd38wzi
         ZQTmOECNBd2JO0bCUj8GfSmhNgGhFpun55GJrVJzmdGrXZfBSLJr4X/0TF+5eMEBaPIl
         UTvxJmoyXHIKuhGQmxShi21pq+bGcG+/2jFctVL/if1LhKfuQKAUIc3aiYXDdm0qmZD7
         3cqo58qkN18NYjkt4WTOE+RWknEnazOlq5zRzu7RubXi8odIj/OehR6LzAZyIvwVqt3j
         kE5dPYPE5wYYdIQecC20R9AXnl1Ru4kqCcJg0B+cRTe/0HpZTNC/hKOXtysVBbVCRUrO
         CGuA==
X-Forwarded-Encrypted: i=1; AKwUvBziWZI+roFGd1Z6+pSb6jhO5E3Pjl6+dssJiPHXS4m/qHXj4zg/Lo+Sgk0bdOVxPgJzWbQGKuBqY9Is7jE=@vger.kernel.org
X-Gm-Message-State: APuU4Z8LgnyHvEB9A0Mq7l+SrlMXpPk09Y9ioEh/m+oUvYygzBTb4wlx
	eOoLkUoZcWxDLxH8jWKa0XxYLhIqWnxQUBdoUlXmcaSqeob904d5kO0R/nYV0CaK0Y0=
X-Gm-Gg: AYBFou2DabQb4TofXIdOxB0CjTJ6rMt/EQBspjCAtBsGP02exnVY5zgong0d8XpBcRW
	Rgg+5dwdSiu1uaMhQ1S3BlsJSuNltwJS3rfyNeA4PyKB0BHGTqGnNudQYRJi86T4oJxZ+mYocMV
	m84R7os56c3TfPXvL5BXHVodZ5Scb/5TDUHGjF+8fZCfR+5CDhoZnjcApo3gdCwvuTwuabb0as1
	FlWq4rNWt8iBnvxJZk7t2cOToxqX2L3POmTvb/YickbYECL/dnGEpBwUBibtgpI80UNR3a9XOb/
	XLhs0FMU8ke0beli+5jMeXGRtWVG8ILzzKrCPK+OeEGmYtwzY6BU9oC6dlpWHguBTi69cBiNVL0
	cHdtRdYonxBYlwdeV/MZTZlajlqRbnQSwf7mVoQPIKgnL31m1kGTIeR4y2hrhWsAkX1cFiUDrPG
	Zpw7j9UQDF8FcHqQ0Z4KA3twnu+Ud/zkN4HQx53sih0vmP9R8vU0GFupp3jDGG+bkta5Z2IRjqg
	KMcKaM+Y44SyauIcBxVRHjhNxyGETURmOYAe+9tvfKkozQJ0ije8mgQU7CSiya8SrcNnlfcK9aq
	oqvgBfwjVQtgAkHH6nnuRKBpVUBVrxMd9DmcIdatZchyCjOyOg2XF5UZAYkQKglbQAYDHaIwZqQ
	RgB0BTaCL
X-Received: by 2002:a05:600c:8b33:b0:4a2:267:25b3 with SMTP id 5b1f17b1804b1-4b6e0edffd5mr33716705e9.35.1793962444315;
        Fri, 06 Nov 2026 02:54:04 -0800 (PST)
Received: from ?IPV6:2a01:e0a:106d:1080:9df2:2e39:58f0:72ca? ([2a01:e0a:106d:1080:9df2:2e39:58f0:72ca])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4932901d9c9sm2031660f8f.59.2026.11.06.02.54.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Nov 2026 02:54:04 -0800 (PST)
Message-ID: <608dd5f2-4136-4f3e-8546-2242f43cfbaf@linaro.org>
Date: Fri, 6 Nov 2026 11:54:03 +0100
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
Subject: Re: [PATCH 03/10] arm64: dts: amlogic: meson-s4: add the PSCI CPU
 idle state
To: christian.koever-draxl@student.uibk.ac.at, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, khilman@baylibre.com,
 jbrunet@baylibre.com, martin.blumenstingl@googlemail.com
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 =?UTF-8?Q?Christian_Stefan_K=C3=B6v=C3=A9r-Draxl?= <ckoever@outlook.de>
References: <20261106104659.54656-1-christian.koever-draxl@student.uibk.ac.at>
 <20261106104659.54656-4-christian.koever-draxl@student.uibk.ac.at>
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
In-Reply-To: <20261106104659.54656-4-christian.koever-draxl@student.uibk.ac.at>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 11/6/26 11:46, christian.koever-draxl@student.uibk.ac.at wrote:
> From: Christian Stefan Kövér-Draxl <ckoever@outlook.de>
> 
> The firmware implements PSCI 1.0 without OS-initiated mode. Add the
> core power-down state the vendor kernel uses (power state 0x10000).
> 
> Signed-off-by: Christian Stefan Kövér-Draxl <ckoever@outlook.de>
> ---
>   arch/arm64/boot/dts/amlogic/meson-s4.dtsi | 24 +++++++++++++++++++++++
>   1 file changed, 24 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/meson-s4.dtsi b/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
> index 675db02a8d5e..57270fbfb4a7 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
> @@ -22,6 +22,7 @@ cpu0: cpu@0 {
>   			compatible = "arm,cortex-a35";
>   			reg = <0x0 0x0>;
>   			enable-method = "psci";
> +			cpu-idle-states = <&cpu_sleep>;
>   			d-cache-line-size = <64>;
>   			d-cache-size = <0x8000>;
>   			d-cache-sets = <128>;
> @@ -36,6 +37,7 @@ cpu1: cpu@1 {
>   			compatible = "arm,cortex-a35";
>   			reg = <0x0 0x1>;
>   			enable-method = "psci";
> +			cpu-idle-states = <&cpu_sleep>;
>   			d-cache-line-size = <64>;
>   			d-cache-size = <0x8000>;
>   			d-cache-sets = <128>;
> @@ -50,6 +52,7 @@ cpu2: cpu@2 {
>   			compatible = "arm,cortex-a35";
>   			reg = <0x0 0x2>;
>   			enable-method = "psci";
> +			cpu-idle-states = <&cpu_sleep>;
>   			d-cache-line-size = <64>;
>   			d-cache-size = <0x8000>;
>   			d-cache-sets = <128>;
> @@ -64,6 +67,7 @@ cpu3: cpu@3 {
>   			compatible = "arm,cortex-a35";
>   			reg = <0x0 0x3>;
>   			enable-method = "psci";
> +			cpu-idle-states = <&cpu_sleep>;
>   			d-cache-line-size = <64>;
>   			d-cache-size = <0x8000>;
>   			d-cache-sets = <128>;
> @@ -82,6 +86,26 @@ l2: l2-cache0 {
>   			cache-line-size = <64>;
>   			cache-sets = <1024>;
>   		};
> +
> +		/*
> +		 * The firmware reports PSCI 1.0 without OSI, so the platform
> +		 * itself decides how deep to go and the kernel only has this
> +		 * one core state to offer. The suspend parameter is in the
> +		 * original format - bit 16 asks for a power down at affinity
> +		 * level 0 - and matches what the vendor kernel passes.
> +		 */

Drop this comment and move it to the commit message

> +		idle-states {
> +			entry-method = "psci";
> +
> +			cpu_sleep: cpu-sleep {
> +				compatible = "arm,idle-state";
> +				arm,psci-suspend-param = <0x00010000>;
> +				local-timer-stop;
> +				entry-latency-us = <4000>;
> +				exit-latency-us = <5000>;
> +				min-residency-us = <10000>;
> +			};
> +		};
>   	};
>   
>   	timer {

With that:
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil
