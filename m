Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1F0F218E91
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 09:22:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791796938; cv=none; b=n6Ce0HR0FJkLkPcht6GTqH+hP2gTH/dSZmC7zUWAMouYOo0ZDFe3XwOVAstQD/toD/35dIy6rtckQTGM2CGKNOCeD0KuZFptIYChvd5x6iROuxH3qh7GXLr1dX6/CBEuDubNl43n6+qjdiZVsl2ljZdrprhcbhPiFikXr5TPhk8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791796938; c=relaxed/simple;
	bh=pQUX3gB6259Y2UtIUjapVUVyofx9zTRpyf+VPMi7T7E=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=aGPPchHZh9eC7eYCBLvP0BXha8HQd4zhkZ/ZkFw8wajbCMj2PaVdzq81l+15IEgI+H3I2+5wVIDSoEQ2UkJxV1+/2dFyxdXzmASkBlSQOeILaulcI94MoVPxf3wqiyGivRl6d/4KGIMV5sfhUM/Iv92MV5lnUFZwk3yOeLJJAdY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QRjzm/mV; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QRjzm/mV"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a0286c981dso13936815e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 02:22:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1791796935; x=1792401735; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FLb0lJXlFmNtssjfM0yj8AimWlA+OyKOOXSxBmbtCKA=;
        b=QRjzm/mV+40n+tlKsPcpOBbWM633wqptMhwhhmXz/g3yAFMMzy+A4lzmek0y8hFxx7
         ogqdXKyqMNXMVQOyc00m3QX5Azvqfw8gF664uX6gTi0mJnY/Ew0+Foy5PhHeZbvXM8ZO
         jnQcZcQWwJXhmNz7jqP6TR5PpE92pgOmrvdU2ycGIKFa6hV714yck9LZNXji6+bWSd4T
         yepgPO0P036VC5AQ8HZQqcLB/fZABECsT/7++Ppl0Qm41gH7UqfdW4MqJDsBbn6fz1oX
         ANuqvEX94axp2vxj6dC78rrXTGMBuSc2dj+Hkpt+yJz/u/2Ilrso01mKpxCUozRoypsi
         O1oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791796935; x=1792401735;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=FLb0lJXlFmNtssjfM0yj8AimWlA+OyKOOXSxBmbtCKA=;
        b=DWFJyY+Eq5qDbXQy/U/JIUzGY2bqfSw/3YcCEgwGDtdffqT46BqeORj++9M95A5qVO
         3M2xIHdyUBuvHdxLUZDsVWUyrap1CAsjPGOq0nH17YLXU3cmLDZyWstvBU9dRwbWa7wP
         bBGKiK7quKWkTYOAkOlVdiXPnP/hQH/LaCJDZSdQoK8XxR1PBD1pyT+38iPYcQIE2myi
         GF3l7asJnrjpO7JxAgVBWn9XyHYF52p6YXjdR5QCRKIUVE6jxCnNnC1xjRNvujq7Vh1R
         entFovJm8nRC3MOrMkLJwhRMR1fFvXE+zVgre5BQYlSXegJSq5CRg2BUMiMmkju8UJgD
         ZdjA==
X-Forwarded-Encrypted: i=1; AKwUvBwe0OIoA6AJQ6ENIxBQEoVey5SJXQA6/eq63ZJf2R08EeC0fIhSSnkSbn74TJf9+8roOECwgRyX1VlygXk=@vger.kernel.org
X-Gm-Message-State: AFq9FYLde9qkCWWmXoFWnSguocbHzW0aDgvMSvQrHF5fxv1CTNc93Nj/
	oKoVKSxkA7lR3kZ8wKRvyn48qPjmHuXt+1j4kcZLg1NLWGQLvlGKDdDlr8mbmNLHPFw=
X-Gm-Gg: AYBFou2lkTGQIAdP7MU3AfiPy1dic34+bkhIful0QEWCo/7pjs4zxPJGjtK4P/Goi9E
	0TuDgn+buYB+l4p9G/R3KsAdlvPbei4Pwy/xy/zW3+xtU8jbJ7S88fq9zXZR0A8X4y2ysvN4TgM
	kjDJEr1+fowQe0hl4XNiMArlNfRIhO8QwPFpjnqmep07iKLtbm/ySKYPF7D5/JkE68ji6qLOMFM
	GkJ1yFxYNeYegNehsM7NHHLjixGaMd0lW1KVKDL5WuG1RiNK94bvObzsz81v5aVUURKwGX7Fwv+
	1pQgTzcVhRN3OTcwhIvZEyiYOEx9e/eWrAe8V2Gizr93LWTwPvkuP6qSQoZqJyoi+tqus04D90l
	4pmGY2xjqt+I/3E/bbPfz0Xl9fBPPQWu7GmoCoxGoNZjUO1ru6OD/Yc6I/QZW2cQhqFFW0IrVyS
	vJUulTAxH8m5sLe/fBwg+R86p1EVxw+gbiV8VeXpu4DosysVSNlPr/11lRmistKaGXG/GOvr1N6
	xv7lEbko94A3bAmyDwNgZMpHRg5xLeUbCO7WY/0u7OkLDuzF60=
X-Received: by 2002:a05:600c:3144:b0:4a1:70b2:8dbb with SMTP id 5b1f17b1804b1-4a18e4b0347mr158264505e9.19.1791796934769;
        Mon, 12 Oct 2026 02:22:14 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:417e:f4c4:5b8:8c48? ([2a01:e0a:106d:1080:417e:f4c4:5b8:8c48])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db99b820asm19844601f8f.24.2026.10.12.02.22.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Oct 2026 02:22:14 -0700 (PDT)
Message-ID: <03223155-d632-464a-9be3-a11f9928d05b@linaro.org>
Date: Mon, 12 Oct 2026 11:22:13 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2] irqchip/meson-gpio: Allow the GPIO interrupts to wake
 the system
To: iav@iav.lv, Thomas Gleixner <tglx@kernel.org>
Cc: Radu Rendec <radu@rendec.net>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20261010-meson-gpio-wake-v2-1-790ecc6df792@iav.lv>
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
In-Reply-To: <20261010-meson-gpio-wake-v2-1-790ecc6df792@iav.lv>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/10/26 20:20, Igor Velkov via B4 Relay wrote:
> From: Igor Velkov <iav@iav.lv>
> 
> meson_gpio_irq_chip has neither .irq_set_wake nor IRQCHIP_SKIP_SET_WAKE,
> so enable_irq_wake() fails with -ENXIO for every interrupt routed through
> it, and such an interrupt never gets IRQD_WAKEUP_STATE.
> 
> That matters for suspend-to-idle. suspend_device_irqs() keeps only the
> wakeup interrupts enabled; the rest are suspended and masked by the flow
> handler when they first fire. A GPIO interrupt that fires during s2idle
> therefore brings a CPU out of idle once, gets masked, and the system
> sleeps on. For mem the firmware chooses the wakeup sources, and this
> flag changes nothing there.
> 
> Set IRQCHIP_SKIP_SET_WAKE, like the other hierarchical irqchips with a
> GIC parent. The GIC sets the same flag, so irq_chip_set_wake_parent()
> would end there anyway.
> 
> Tested on ODROID-HC4 with the PCF8563 alarm interrupt routed through this
> controller: with the flag the alarm wakes the board from s2idle 4/4, and
> /sys/power/pm_wakeup_irq names it; without the flag the board stayed in
> s2idle past the alarm until a power cycle (0/5).
> 
> Assisted-by: LLM
> Signed-off-by: Igor Velkov <iav@iav.lv>
> ---
> Changes in v2:
> - Reworded, as Neil asked: say that the test and the effect are for
>    suspend-to-idle, describe how genirq handles the interrupt there, and
>    note that for mem the firmware picks the wakeup sources.
> - Repeated the run without the flag: 0/5 (v1 said 0/1).
> - Link to v1: https://lore.kernel.org/r/20261008-meson-gpio-wake-v1-1-b0af1598d469@iav.lv
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

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil
