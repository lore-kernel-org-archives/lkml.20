Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 170C946C829
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 08:24:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791447881; cv=none; b=Qwv+D0F7WcMBOhEJQe4Wr9TuyPjh7e0swveJzpkTmgf3Ji17aoj8CT/uJBKXkEJCS2MyhBzZGeOulL0hVqvBkZn+BuVcmfBHuDvHUMgeCBU/hL3piJq2L+gVhH7QvE1XrIojlZ6RAt/sR5cd38D2oNamH2mnTDXVqxukQIeBVsg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791447881; c=relaxed/simple;
	bh=R19lXHv3qObauzbjTU4gwaYFk2HryBGzM3LG4AIi0Q0=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=ji1o6BQMYJ6DW6cyJNPCcc26ElNfQoFWKOW8LY+SV1mNcVcc7RmaxYrJrt+QmpFHS/3jtcuVKHN1Mx8sHqIKxeO0Bp7FZJujhlAcUg98pBAs39wM9jcTCXA5g53FWE0PfaoHv1FRO7T6RCjTdpY1CBvwkR+cH0OB8PmRoJwk0bo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nd+zVrUf; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nd+zVrUf"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a140e7405dso49441285e9.3
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 01:24:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1791447878; x=1792052678; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=M6ASayUKoMdn/Pu+VkK60Fyzl8gQVjykNVGO1atxmUU=;
        b=nd+zVrUfViKB7OgHXrJl9QebcqZwwVhs6hMHWy6HkvExVZ9iD9Ksyyoc4rd3qYcwPU
         M5Ib5E+J3EjogzMkX52dmkI3Ho9lgsozEEkxsR6CWzfqy4Wl4V9mYlRd8bHfuMAuOIKy
         bZgB5Frn+zTuvzagUxg+jkvwtpskXPXDq2xDitrzWAQ77I7N/O56LwPB9J1m2L/ixfBM
         ZbIBbZI+hdnzvWMgTFVtfYvio/0si9RdHL29czDrQC/Dwe3kHJiBHefyij66ORACpymV
         FRUqz1rAe+9ybcRhfee3h64R5G5UERnFlLVJkPJAHDxHUgjdz4vQcq31irr3S84olL1+
         gnZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791447878; x=1792052678;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=M6ASayUKoMdn/Pu+VkK60Fyzl8gQVjykNVGO1atxmUU=;
        b=VWgWCRXPkHx8SRZJnC752VITiP7Xbs5r3HgoUMEMWis3x0LK/iqVzLWPRsojAHABx5
         AB4HylKF/8gsup7RI10qsTU+gKmriUvkfWXCqffjMlJrbql76miH2lZdsOy2HcTJpcRS
         EU3OKagyH/3T+Fa+mCrPtaE4SmA4s4x76UWQWY+EBDyPbETPaaJSPCf82sVIM7uiACS9
         C7fTPXqdZ81Nly98AYHzDF7wnW4d44CfFSIPhC7sT4oYfWIUmEjn7mOyS4h7RTj+54Kh
         ESyKFQgRNbADj/JHz//NVjCwvlVCgTj2V4B1g/NBmd6AVHjXq19NCAOlLpLYKnZ9cLi8
         WaoQ==
X-Forwarded-Encrypted: i=1; AKwUvBwqCdHLPZdnkCe8Q7fyzVMnEYH3kCkPwpf7ijbDMRjcmQs/YQBHlUTab+2mUxR8tsMXWa0y8yjbmtNUTd4=@vger.kernel.org
X-Gm-Message-State: AFuF++lLk/KV0CCwRWyVpTIeuD1ih/yxJoNhTi+DQvg4VFx21xJEDqSN
	RC6Kr8hdm2uey9QdwA473dT8ynj9HFAxZmNX6z24c6HC8VCXfU8FM4ZtlrpHwChwsJQ=
X-Gm-Gg: AYBFou1881KubGzai4X/R3OhUTvMSwpg8FCMhLzKmxwR7ji2FLsLRoy1he2JjH6unvk
	FSyZKxaw/crlhOu1gjOTK1XOZBs+Ncg7Ay4168713NleHEr03SUSzc4AQYkJLzk64/NBbQHlZnE
	eyEYjO4QlEeh0Alsx2+dMSNVameoCK6nilYBQNK0EUbeIKmITfrol+3c4Gvs2I1vyZhBoyTD/u9
	iyaECc+R+ReXpt5TAXnd1WiFlxn+PQ3+IPzYDAThnL7yKgjYXVTnKxtTLe6ha0IxC5PKlEo1MA5
	IkT8zu/dNpHs6wKep7cptJS7FQ4E3uxypgSnP4PtPomfE1IsIkystLGZOzbFP6QRWETKfjm4gmq
	YBDdlQDQUa3sQKD87sPafOsaeVe65tZtZWVEI1woiGok02MMixWVkXaAYLb0aozLhx+7tKS5wXg
	5K4ZIherMKmvd4gu5NIHLPIOGTLLgt8rF0JJ28fxkjlQ6QFu1UjCLQrhXciPKo9mwhyYsSHWxZs
	5LuSRI0IObJAVvLV4Q57+yHhE5C8bU=
X-Received: by 2002:a05:600c:810c:b0:4a1:7163:3e41 with SMTP id 5b1f17b1804b1-4a1804234ffmr77254905e9.9.1791447878231;
        Thu, 08 Oct 2026 01:24:38 -0700 (PDT)
Received: from [192.168.151.76] (90-182-211-1.rcp.o2.cz. [90.182.211.1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1843d1e0bsm51322805e9.6.2026.10.08.01.24.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Oct 2026 01:24:37 -0700 (PDT)
Message-ID: <fa64131e-52a3-4058-9655-e1a4c36de47d@linaro.org>
Date: Thu, 8 Oct 2026 10:24:36 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 2/4] drm/panel: st7703: move init commands to prepare()
To: Marc-Olivier Champagne <marc-olivier.champagne@savoirfairelinux.com>,
 Jessica Zhang <jesszhan0024@gmail.com>, =?UTF-8?Q?Guido_G=C3=BCnther?=
 <agx@sigxcpu.org>
Cc: Ondrej Jirman <megi@xff.cz>, Purism Kernel Team <kernel@puri.sm>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Hugo Villeneuve <hvilleneuve@dimonoff.com>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Jerome Oufella <jerome.oufella@savoirfairelinux.com>,
 Felix Boucher <felix.boucher@savoirfairelinux.com>,
 Quentin Lehoux <quentin.lehoux@savoirfairelinux.com>
References: <20261007201859.3709656-1-marc-olivier.champagne@savoirfairelinux.com>
 <20261007201859.3709656-3-marc-olivier.champagne@savoirfairelinux.com>
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
In-Reply-To: <20261007201859.3709656-3-marc-olivier.champagne@savoirfairelinux.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/7/26 22:18, Marc-Olivier Champagne wrote:
> The panel init sequence is currently sent from enable(), i.e. after
> the DSI host has started the video stream. Not all DSI hosts accept
> command packets in that state, so the init sequence may never reach
> the panel.
> 
> Move the init sequence to prepare(), right after the panel reset, to
> ensure it is sent before the host enables the video stream.
> 
> Since the init sequence can now fail in prepare(), power the panel
> back down on error: the panel core does not call unprepare() when
> prepare() fails, leaving the power supplies enabled.
> 
> Both patterns are already used by other DSI panel drivers.
> 
> Suggested-by: Hugo Villeneuve <hvilleneuve@dimonoff.com>
> Signed-off-by: Marc-Olivier Champagne <marc-olivier.champagne@savoirfairelinux.com>
> ---
>   drivers/gpu/drm/panel/panel-sitronix-st7703.c | 18 +++++++++++++++---
>   1 file changed, 15 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-sitronix-st7703.c b/drivers/gpu/drm/panel/panel-sitronix-st7703.c
> index 368c57591817..f4635a7327de 100644
> --- a/drivers/gpu/drm/panel/panel-sitronix-st7703.c
> +++ b/drivers/gpu/drm/panel/panel-sitronix-st7703.c
> @@ -774,8 +774,6 @@ static int st7703_enable(struct drm_panel *panel)
>   	struct mipi_dsi_device *dsi = to_mipi_dsi_device(ctx->dev);
>   	struct mipi_dsi_multi_context dsi_ctx = {.dsi = dsi};
>   
> -	ctx->desc->init_sequence(&dsi_ctx);
> -
>   	mipi_dsi_dcs_exit_sleep_mode_multi(&dsi_ctx);
>   
>   	/* It takes the controller 120 msec to wake up after sleep. */
> @@ -784,7 +782,7 @@ static int st7703_enable(struct drm_panel *panel)
>   	mipi_dsi_dcs_set_display_on_multi(&dsi_ctx);
>   
>   	if (!dsi_ctx.accum_err)
> -		dev_dbg(ctx->dev, "Panel init sequence done\n");
> +		dev_dbg(ctx->dev, "Panel enable done\n");
>   
>   	return dsi_ctx.accum_err;
>   }
> @@ -819,6 +817,8 @@ static int st7703_unprepare(struct drm_panel *panel)
>   static int st7703_prepare(struct drm_panel *panel)
>   {
>   	struct st7703 *ctx = panel_to_st7703(panel);
> +	struct mipi_dsi_device *dsi = to_mipi_dsi_device(ctx->dev);
> +	struct mipi_dsi_multi_context dsi_ctx = {.dsi = dsi};
>   	int ret;
>   
>   	dev_dbg(ctx->dev, "Resetting the panel\n");
> @@ -843,6 +843,18 @@ static int st7703_prepare(struct drm_panel *panel)
>   	gpiod_set_value_cansleep(ctx->reset_gpio, 0);
>   	usleep_range(15000, 20000);
>   
> +	ctx->desc->init_sequence(&dsi_ctx);
> +
> +	if (dsi_ctx.accum_err) {
> +		gpiod_set_value_cansleep(ctx->reset_gpio, 1);
> +		regulator_disable(ctx->iovcc);
> +		regulator_disable(ctx->vcc);
> +
> +		return dsi_ctx.accum_err;
> +	}
> +
> +	dev_dbg(ctx->dev, "Panel init sequence done\n");
> +
>   	return 0;
>   }
>   

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil
