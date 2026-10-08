Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 926993D5652
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 08:36:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791448572; cv=none; b=myK2mP97yxqWNhiQwqwrL4tMXumNtetBPKydIPOLbizBbJXDmVqgGlT1FJlT1ZSH6C+vxBqBK5/TuLAaI5jsgXsF7BdGpg0yKNX6zdlbQaPuIzug1JIzVhUCaVXOI1qJVCRZQ/WBlBGzXqaGQUk3cK99x2jwf2kBCUbkNfKSdJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791448572; c=relaxed/simple;
	bh=2l0uzFvUg+eeiDcSrr8tRCplj9K3M0XAR/rxAvEEK8k=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=i+c5glL2tb7u357hzd5b1QOqF1Fi+BGSrwk7hH9T34R8uaWSXLr/WB9/m7fEY9YjTHemqa5GFZJZV5HdHwVCHt/RGc1O/nukA8+54oB0Op15F9ly1kGnaVesM4Bc4dWhpoRRT+KyBuDBUIg3TG3y1h4NYcAWJ0NHzJJvwDBJRg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=H1JuvB5x; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="H1JuvB5x"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-48c4d870d54so1767424f8f.2
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 01:36:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1791448570; x=1792053370; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aE/Cngz9PMWY1Nl5Izdbki/JG7Hmrq/g2In+zB6gKG0=;
        b=H1JuvB5xMb7NtgYc0RWknMrVl1nJY+qz1bwCNeYh15T/NS9CJfn592k3DHviqg7T6U
         w4oc4JKSr/raSoyM4uVMdQ/Efjl5EPoMamaL0CUErK0rGMPFhmREcGUFAXjzrtgGu9Mn
         ZJyLcuWKGxo1q7ETfDUkJ7PZPE+hxxEVcho5VS4Se/EZ25aPkO+bb5w4DfKSOtfZkXQS
         0+vd4FaWao1WUElswmHA7aKawJn6/igVhdo0qI4uGI5IhSM182Hwjj8wi8eBbrzlm+BZ
         Rx/zYkjAqnB2Em4GK6oKV3re0aRRFFpMRA0FlRbKk4ilseUEULIaI022QTJrxsZqJHeS
         pHhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791448570; x=1792053370;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=aE/Cngz9PMWY1Nl5Izdbki/JG7Hmrq/g2In+zB6gKG0=;
        b=FyAXt5FNj9sVgc12+hr7c3E4ihHIKc3urvYAUtOYQsDFZZFL0p7k/Pi/kzxYcE4YH+
         ljRKqLKSjKxnaqfCOe+iDueFOlzb/sELHQjzlo66bInb4wiBcCusFAHWX6uRbsFH/S4O
         1ia4OhwY3e9R21i2jHJrfsxEEJxVGt9q3vFGk58gRgSFm8CRuZReNcux+BN/0H22Yv43
         j+RP5BLJTVSVVQiiOJmsMioGpAt5rDbnq9/s4UjKQ4EVEf6PJKSlQ/M/FRWhoFf01q2l
         c/Ohl4C+ai7+RRAk4lQRTNubGV7hU7/1hIkWTjAw4JEAT6geCoWe85ORJsyHHFrrYZzd
         mSOw==
X-Forwarded-Encrypted: i=1; AKwUvBzzQbwrch7Lo7r15pc5WvQwC7uktVb+fkT0FEhjliqsY+ly0vRZ/xSR9DyAz9jN2VCiQhufJ2sYwZihMZs=@vger.kernel.org
X-Gm-Message-State: AFq9FYK+JHIkbw68Ig0d3uYz7s9DOHJIlb6gTlqz5c52p4vRY4OmRGNx
	4WbE8bvGcaIJfIzZ8+ciJMazArmR3WT71Osdu/bO3lEnokk/YCHmY+mIr9oD5MzArPA=
X-Gm-Gg: AYBFou3nwHk/nZqSQywSD2XWFFFHdlaUXcgIZOXunuBeD4hC9nPbbg2tAKlM5IgGqLD
	zrP6+sponcyGl7MS9W0CefhnwCqq4IjTp5g39YNj2mXuxYXEYTRFvEEEJp9E+78arhgcEKi031t
	W8JBdqDjMEfRQ0m2p6f+EE27r7QLN3PrrjUJ9JFyENr/z4OutCifZ3OS9SGPUCwuxKLPt1YIH4l
	7HPieJqYlLI7srEC3MnxCExAQpIdRDQ/wLRKZIElqyq1lcMzGb8diDNWAJ6B7nPPWsZ8rf/Lny2
	DWWpAcSZcIoWzIqN0GP9ccIodZzVZ3OTAUMUjJLSFRSxYnYXFKk0KyavOeTcj8NKsdee3dAu2ey
	i1AXEt3MbALZu+KDAaYWtchMmo2oTON6QdDZAOQIAU0ddSUZtSf34wreOxK/OhhhsEWh/FcK2BU
	21alt9LT/0YkCcDSEH1eZ7HOzjqurcxuzWgm9Jv5QWydarRjc8Ck0exRAvOybW64egoJua1rBdo
	6nzEP/QoEnyTASqvF+mMfp8CwSn5yA=
X-Received: by 2002:a05:6000:1846:b0:48b:d17:139c with SMTP id ffacd0b85a97d-48c728858b5mr9232891f8f.51.1791448569688;
        Thu, 08 Oct 2026 01:36:09 -0700 (PDT)
Received: from [192.168.151.76] (90-182-211-1.rcp.o2.cz. [90.182.211.1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48ca8e2e627sm1605811f8f.20.2026.10.08.01.36.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Oct 2026 01:36:09 -0700 (PDT)
Message-ID: <70897195-0ffc-4d80-80d4-e60f87c6101e@linaro.org>
Date: Thu, 8 Oct 2026 10:36:08 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] irqchip/meson-gpio: Allow the GPIO interrupts to wake the
 system
To: iav@iav.lv, Thomas Gleixner <tglx@kernel.org>
Cc: Radu Rendec <radu@rendec.net>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20261008-meson-gpio-wake-v1-1-b0af1598d469@iav.lv>
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
In-Reply-To: <20261008-meson-gpio-wake-v1-1-b0af1598d469@iav.lv>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/7/26 23:55, Igor Velkov via B4 Relay wrote:
> From: Igor Velkov <iav@iav.lv>
> 
> meson_gpio_irq_chip has neither .irq_set_wake nor IRQCHIP_SKIP_SET_WAKE,
> so enable_irq_wake() fails with -ENXIO for every interrupt routed through
> it. Such an interrupt cannot wake the system from suspend.
> 
> Set IRQCHIP_SKIP_SET_WAKE, like the other hierarchical irqchips with a
> GIC parent. The GIC sets the same flag, so irq_chip_set_wake_parent()
> would end there anyway.
> 
> Tested on ODROID-HC4 with the PCF8563 alarm interrupt routed through this
> controller: the alarm wakes the board from s2idle 4/4, and 0/1 without
> this change.
> 

The code sound valid but the this paragraph means nothing, adding or removing
IRQCHIP_SKIP_SET_WAKE should not change the fact PCF8563 would wake up the ODROID-HC4
since the BL301 firmware hardcodes which gpio can wakeup.

I guess this flag simply removes an error when setting the gpio as wakeup source
which means nothing in this platform anyway. So please rephrase.

Neil

> Assisted-by: LLM
> Signed-off-by: Igor Velkov <iav@iav.lv>
> ---
>   drivers/irqchip/irq-meson-gpio.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/irqchip/irq-meson-gpio.c b/drivers/irqchip/irq-meson-gpio.c
> index 91a9c337fe6d..e0329ef5e4a2 100644
> --- a/drivers/irqchip/irq-meson-gpio.c
> +++ b/drivers/irqchip/irq-meson-gpio.c
> @@ -538,7 +538,7 @@ static struct irq_chip meson_gpio_irq_chip = {
>   #ifdef CONFIG_SMP
>   	.irq_set_affinity	= irq_chip_set_affinity_parent,
>   #endif
> -	.flags			= IRQCHIP_SET_TYPE_MASKED,
> +	.flags			= IRQCHIP_SET_TYPE_MASKED | IRQCHIP_SKIP_SET_WAKE,
>   };
>   
>   static int meson_gpio_irq_domain_translate(struct irq_domain *domain,
> 
> ---
> base-commit: a90ee4305c4a5df72c11b31dacfdc76e00fcf78a
> change-id: 20261008-meson-gpio-wake-f3bfa3bb2e5a
> 
> Best regards,

