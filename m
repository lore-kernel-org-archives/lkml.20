Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794822877;
	b=Z8yZ5YSzXBjSmogCcWdJAYnmEbCD6ZneD4EmWYG7uoz4C5UA/Dc1J2rgHGeOBqGB307Z
	 B+/nIqMwBSyKlfoxBIJ5EsF37dg8SKSIB1a5zfswbSmoaAJpdQBoeTNJyvq1Oa+n0hYfR
	 3XcXTnReIvCnlEPztelLw3JwLIuu1Liq7tZ/gdCAM+3M/tdW0f/GlFuXHTIkjXXNItHel
	 a6w8+oneFSV1v2duZIFCxtiaCq/qqshAXQULz+/CpcSXkkxYHoIftl+XFUXmjwRTfkGAb
	 y04h7U8T0pIprJsUYInGMytcu/Q0foCGEeooc+mfZUqpMr9syHW8pZ+qGihZdNlsfdQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794822877;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:From:Reply-To:Subject:To:Cc:
	 References:Content-Language:Autocrypt:Organization:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=O7A/7r4PaZj0TpdOqDl6awwgwuxZUBMXAvOcGR8Mu0U=;
	b=D2ayFJ8HGfXj4UNkD5AzbVqIr0pU6cmKMSraQnFH0sKHCeKCNpWm1dhdftP8Idoi8/dx
	 QDgP9pxvw+fr1RHKaW7mT34/8APNxbXEA808i1w/hkGPNZ/JXxhow46bQjVfTvKaVo3+P
	 QY7Ue5+iI9SxvXSUCA8CR22jJbQ7pKJunBPpwL5Ji8Um6i83Ul14X6OrfxNDoVf1Brxre
	 1/+hO6hzWHLzpFIDptxQAPkmqplmeB/feySe3EU1bnJl+abPY0tYXL5NHtFMqGFp3b8Kn
	 gop7H4lLrlFzReNyBE8v2T2h9oqQknXtSh+kltI/XELEWrh9EDlXq9n+4GOloV1glYQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=A+gXvdVN;
	arc=none smtp.remote-ip=209.85.221.45
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0ADE606A32A
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 09:54:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B0ADE606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=A+gXvdVN
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-498f5fa4f70so3490677f8f.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 01:54:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794822875; x=1795427675; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=O7A/7r4PaZj0TpdOqDl6awwgwuxZUBMXAvOcGR8Mu0U=;
        b=A+gXvdVNQlbxG2OJnAkc2HMODjS+HFKCxCKLgWQ2hNlh6Q8ymOmuCTAdP3I0G7qB4W
         gCju/pgfiUSBdT19UcVuubc4AgJ4fMArXELSOS1Tr3c1TwIWRywBg2PRnwA82mDURSb3
         2gdHWuPSij3722hWFVQX+SP2XLyjnunn8ktK2h+9AtjI4MfIbzo7NuBK3VnBWDmy/6xL
         1KRV5zu7EEqGX5gkN14RmrYr7jX/UEBzDGXe+Xa/8Ulrn9w5lpKd6BUgEBfiWKXVTgdg
         WKbUBmm+W+T+V/IqsbpBTNHVd6HZguYLhq54kjjvrh5AbrcIeZfB6b87vgFiZ1MaCq3/
         2jwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794822875; x=1795427675;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=O7A/7r4PaZj0TpdOqDl6awwgwuxZUBMXAvOcGR8Mu0U=;
        b=FcBJ1UdQPcNzTwEMhY1Qg7+G/9CB13UjUlDCiPHwpd36Wu+hUmMTC+VqQ2yTorJ688
         EOaQFZZInvF7Hh80mbbJjDcv701Z4Tn8ktatGX9jBq6mnDW9z6HtBEBExcXYAa5hsUuP
         AFPvFWHYxGa5cOudjm2N/Dmso5EpA7Ioy46E/k6UUHRK5ikKDT6Qc7SlCDImg6Q6muaj
         K9LBG/uBsglP72Pc0rqtQcdqeu51mEpGDIM1/SE4Dl5qscO0wPHDkUVmYajBh+mCdDLW
         dgKDPK1RanKCHE2zsxZOnXDEvC4J42sfVQMORjS24cipDxkcihXDAiskW40RL4PVlEa/
         lKzQ==
X-Forwarded-Encrypted: i=1; AL+hErGo9dsGtWGl5px1lt5hs9rVR50T8AIk2cid8xhYWU8LezUE2+x4ra0F0RnVLHW6EhM5Z8slZzrCG/k/SC8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+g3ds4ZyhgILYMrTXHNvjDcv73dsBMQGYBitIJ8zydGmgOlrdq
	RdmKWWkTQ6JQ1IprUfw7SIk9znfHpFaslkSfxC/rypzKYiVBTDguroIFxAqwdjlcWKw=
X-Gm-Gg: AZFdTZd7wfdkWvyUdRLGfc0zub2tUeoCVkelK6cXeIEavSeUXBpVo+cjvgluKrvf1Ue
	p+ncoI0X0iuaNqHeOYrfJd5H+SJ/DN/T9nqyzrCWJoRxOcI6uP2kEsEgaJzyKE9+A/a/tS4y4VN
	zYrI+bv3PSrYmad+4bcufwrBUdgdIzMEsqbD8gh09NYjxeTY0Z1ZEH1yKaWaPOcd1W7KjhI7k1j
	4yLe7FuE3AWrFeDd/ka7JHE2QmZh/WxuwqKLmNLlz27sLPQ0bIbLDlGKyRWYqq1hNFa6kubYlt2
	AmNBDEQOpz49Vly0r4DaUeb7vkjrUkaW7Ah64UPtGRY/DOzYiOdKzgEoHzb6ZnR0tBQ4xJ2vcps
	i7s1g9uzQhrd8P4Jat2UFwFgyElB2lYVX+aK18lZIEJ5T47F8X4zSqhTkeG7pd6scZvLiTteTdF
	Vb5g1b0794HHLmBIR5GhF8SH6N9KV9aoxa0mJrTfe8gJ5yxD5OUpmTCuP0rcqSyfF1CHb1v7+4q
	cWGe69H1nnaaprUrMWX20p0lQPf8Alwc/QldtmMwKjvDUGQoDxoZ/F6jYljj8voR5Bw8NzD7tRd
	tLNW1hbNtKg2aTjQGAjM7nTJPcEzmzXb/ueJo/v0gfQxAxApFkkn+TNZ1ANhy1iQybLTMJQocik
	5ZqLsq4DOLw==
X-Received: by 2002:a05:6000:4688:b0:488:7d08:edbc with SMTP id ffacd0b85a97d-49c714a2a99mr14346569f8f.24.1794822874794;
        Mon, 16 Nov 2026 01:54:34 -0800 (PST)
Received: from ?IPV6:2a01:e0a:106d:1080:575d:8fcf:e30d:5aed? ([2a01:e0a:106d:1080:575d:8fcf:e30d:5aed])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c604ecda5sm20221619f8f.37.2026.11.16.01.54.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Nov 2026 01:54:34 -0800 (PST)
Message-ID: <93587a88-7b6d-4fd7-95d0-f958fc3ce1e8@linaro.org>
Date: Mon, 16 Nov 2026 10:54:33 +0100
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
Subject: Re: [PATCH] pinctrl: meson: meson8: fix I2S pin group names
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linusw@kernel.org, linux-amlogic@lists.infradead.org,
 linux-gpio@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20261115224136.818305-1-martin.blumenstingl@googlemail.com>
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
In-Reply-To: <20261115224136.818305-1-martin.blumenstingl@googlemail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/15/26 23:41, Martin Blumenstingl wrote:
> The I2S pin groups are registered without the _pins suffix, but the
> i2s_groups array still references them with the _pins suffix.
> Update the group names so that the I2S pin groups can be referenced.
> 
> Fixes: 64f6d07ba74c ("pinctrl: meson: meson8: add support for the I2S and SPDIF pins")
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> ---
>   drivers/pinctrl/meson/pinctrl-meson8.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/pinctrl/meson/pinctrl-meson8.c b/drivers/pinctrl/meson/pinctrl-meson8.c
> index 3da7f3799c3f..1f58752637a3 100644
> --- a/drivers/pinctrl/meson/pinctrl-meson8.c
> +++ b/drivers/pinctrl/meson/pinctrl-meson8.c
> @@ -923,9 +923,9 @@ static const char * const i2c_b_groups[] = {
>   };
>   
>   static const char * const i2s_groups[] = {
> -	"i2s_out_ch45", "i2s_out_ch23_pins", "i2s_out_ch01_pins",
> -	"i2s_in_ch01_pins", "i2s_lr_clk_in_pins", "i2s_ao_clk_in_pins",
> -	"i2s_am_clk_pins", "i2s_out_ch78_pins"
> +	"i2s_out_ch45", "i2s_out_ch23", "i2s_out_ch01",
> +	"i2s_in_ch01", "i2s_lr_clk_in", "i2s_ao_clk_in",
> +	"i2s_am_clk", "i2s_out_ch78"
>   };
>   
>   static const char * const sd_c_groups[] = {

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil
