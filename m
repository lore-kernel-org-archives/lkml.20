Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D78165335AE
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 12:15:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788869741; cv=none; b=Lngvj/chB9tNND4kCk0owxV+FS9tRO9Te941JvpIlQfW3LOcOiAy39XVhLQ9dGKyvWqHzMdZqNR44qsMMOMmExl1G3v/ESNtsVEIBX3oZRTPPOUKh7mwndQxeU488NdrmX5ezCnKibhRKcs3Q2qcuZCC2iHEgtr63nX0xziZ42o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788869741; c=relaxed/simple;
	bh=aYRJVQbHGSzGVB6oLn+nVcJuJQzCtIpTufu5sE3U7eg=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=f/q+LaC0O8cUCS1TuqN5NFA9NEoDT0zRrw5OzeGcFnO1mQoud9015zeTc9OZLmcdx+69YNf0AMYawa8wy6hDSIAr9ZlIH5i6BKHzAdqW6MswndFxyvkTPKdxUnv3cSFsHa6W6w+3CgrffbJc2bGHxvjRWTv8VByDUsFtegTiNL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=uRr9FxIr; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uRr9FxIr"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-482f6356257so493469f8f.0
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 05:15:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1788869726; x=1789474526; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=opW7KwpTJqDOoH0UYZ6XA/5fYGHhXR/DMT65lptOerM=;
        b=uRr9FxIrfHU3NuzOzbrBQqdCGKl7tvrFiuhp+8jvzRwZX4ND3GXhP5iRi/arK02B2A
         1Wf/HsQaMLVZ0jRukZ1qoHCdJDVzRWM5l/xXxGDO24V3Uefbx1pvx83SyDhAoEl4DovH
         T+xz7ajjGE6/EF4LOt/0COUmgvSrWjSNWqtezusmHHKGxAubVTS0ulpyZuHk6QiRR2Aa
         DMc5WyXTssr+RGgbLflHi6ep5OZZuzbF/WwQVnyXqchQP3jmj1mZC4NOo+m6xVYZ+zO2
         nW+60idR2rBK9+L7NSzJXeHRdHF2KXDQEjgG24XitbJwckQyntKkn+U/WEQsv087vRFS
         rHQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788869726; x=1789474526;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=opW7KwpTJqDOoH0UYZ6XA/5fYGHhXR/DMT65lptOerM=;
        b=NDxjJ7ZM+VOZDDHPk3wwvjyn5rVdmDU9iwCwpxAacnF7m3SDkguueBfRdLKFFjS01B
         3OidWa1mvaAN2Wv227fiMwA3vGEaYM4ihLTqJUgeixiBFnE/vs11TQ+iSp98iEkgHIWY
         4fqXvISekZf6kP051B/u10ZhG8HKq8Bho3CUM8hA1qNrUJ7cD4H2X7UqAS9mQlQ4kCz3
         qDi/8kipwvU/cDcYMlVznN8dAK4rtuhMXi9olZqVinbbALonXSAOXfF2QOB62gZMZO3b
         +zGTe8fB4tQYIUzfI4gohi2GC/4pQ4CwZUcTIVEYUxCprxQcIfroSZJvlsXQRT3Qk2k1
         U9vQ==
X-Forwarded-Encrypted: i=1; AKwUvByrggWxjmpEi9w9IlxPEUePTPCai5lAyzdEVTii/oap7osJ3rS48m9ED+gcOmIUttSxlDigCnrYGdDvg2g=@vger.kernel.org
X-Gm-Message-State: AFuF++kVqx+wqXC2awajCbHMz6QIelAP5tvb7YCHf/c1GqaRrhDv7CxU
	0FXWf3Df/z3cLuklgEyT13EDYgl2LFvpda1tkUoi3cLmxctvWEAC8uQVnJMdz+uVqOs=
X-Gm-Gg: AYBFou1CgqH7pV0RMnsRaAlkn67THugjbL2cl/Dkte5CtGU4tTWs4KN5c1l4DYgZBYe
	CL7jn9fao/5VbqX5ZJhbAbEPv2sMzBNNmM+BBK0VvFBZgBAieojpkrfIeEhziRTpLC5K8AaiJcQ
	w/JERRAbEhkoakRaHSNZ/Oao+Tu3fev+7Sc1sVhD8ND7XvFm11UTQiZ7UggxXqcXhRwj7N5amJ3
	M8+a9G3r9K1NFwU0X6gTPjWe5BUXGsti8YeBMf0Qw+EpuUTD5haJQgoI9ZylDGlew2lGSHPZh4x
	Id4vLqHnL4K3vxkGODGzT/T+ABx2k1GNMeBmVaAitJyf+4O8womwhcO0iUlWTXGrkz3FORWWWiv
	xgddCwrA5r7bHTTdChfsvI41okFuMpTL22ceulIHYzts+mPertzeH2i3K0IH34gXKdu620mW44+
	GNuyl2lhjTqzsJqO9GZQTanGqBtYBYImD88qj2HtudJ8rQ4Zjm7X8zcANkWBk8wTiNJBAjFEPx4
	0IbDtEI9/QNZtPZsBlvzELx/C3feFaWERKYjxXtOcU=
X-Received: by 2002:a05:600c:a01:b0:49d:1916:2133 with SMTP id 5b1f17b1804b1-49d1916215amr42841305e9.8.1788869725867;
        Tue, 08 Sep 2026 05:15:25 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:ea45:883b:8b89:b4e5? ([2a01:e0a:106d:1080:ea45:883b:8b89:b4e5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cf5135353sm342891865e9.2.2026.09.08.05.15.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Sep 2026 05:15:25 -0700 (PDT)
Message-ID: <7d1d7726-aff1-40cf-a958-6e825a1b50eb@linaro.org>
Date: Tue, 8 Sep 2026 14:15:23 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 3/3] drm/panel: ebbg-ft8719: Split initialization into
 enable/disable fn
To: david@ixit.cz, Joel Selvaraj <jo@jsfamily.in>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sam Ravnborg <sam@ravnborg.org>, Marco Mattiolo <marco.mattiolo@hotmail.it>,
 Linus Walleij <linusw@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 phone-devel@vger.kernel.org
References: <20260906-ebbg-ft8719-fixups-v1-0-4e846510cad1@ixit.cz>
 <20260906-ebbg-ft8719-fixups-v1-3-4e846510cad1@ixit.cz>
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
In-Reply-To: <20260906-ebbg-ft8719-fixups-v1-3-4e846510cad1@ixit.cz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/6/26 15:19, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> Efficiently this already happens with prepare/unprepare calls.
> Remove unnecessary login and just use enable/disable functions.

I would replace with:

Move the MIPI commands into enable/disable callbacks since they
are called between prepare/unprepare callbacks.

Or similar.

> 
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>   drivers/gpu/drm/panel/panel-ebbg-ft8719.c | 17 +++++++----------
>   1 file changed, 7 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-ebbg-ft8719.c b/drivers/gpu/drm/panel/panel-ebbg-ft8719.c
> index 14982263a94f1..9965f46f1a316 100644
> --- a/drivers/gpu/drm/panel/panel-ebbg-ft8719.c
> +++ b/drivers/gpu/drm/panel/panel-ebbg-ft8719.c
> @@ -49,40 +49,42 @@ static void ebbg_ft8719_reset(struct ebbg_ft8719 *ctx)
>   	gpiod_set_value_cansleep(ctx->reset_gpio, 0);
>   	usleep_range(4000, 5000);
>   	gpiod_set_value_cansleep(ctx->reset_gpio, 1);
>   	usleep_range(1000, 2000);
>   	gpiod_set_value_cansleep(ctx->reset_gpio, 0);
>   	usleep_range(15000, 16000);
>   }
>   
> -static int ebbg_ft8719_on(struct ebbg_ft8719 *ctx)
> +static int ebbg_ft8719_enable(struct drm_panel *panel)
>   {
> +	struct ebbg_ft8719 *ctx = to_ebbg_ft8719(panel);
>   	struct mipi_dsi_device *dsi = ctx->dsi;
>   	struct mipi_dsi_multi_context dsi_ctx = { .dsi = dsi };
>   
>   	dsi->mode_flags |= MIPI_DSI_MODE_LPM;
>   
>   	mipi_dsi_dcs_set_display_brightness_multi(&dsi_ctx, 0x00ff);
>   	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, MIPI_DCS_WRITE_CONTROL_DISPLAY, 0x24);
>   	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, MIPI_DCS_WRITE_POWER_SAVE, 0x00);
>   
>   	mipi_dsi_dcs_exit_sleep_mode_multi(&dsi_ctx);
>   	mipi_dsi_msleep(&dsi_ctx, 90);
>   	mipi_dsi_dcs_set_display_on_multi(&dsi_ctx);
>   
>   	return dsi_ctx.accum_err;
>   }
>   
> -static int ebbg_ft8719_off(struct ebbg_ft8719 *ctx)
> +static int ebbg_ft8719_disable(struct drm_panel *panel)
>   {
> +	struct ebbg_ft8719 *ctx = to_ebbg_ft8719(panel);
>   	struct mipi_dsi_device *dsi = ctx->dsi;
>   	struct mipi_dsi_multi_context dsi_ctx = { .dsi = dsi };
>   
> -	dsi->mode_flags &= ~MIPI_DSI_MODE_LPM;
> +	ctx->dsi->mode_flags &= ~MIPI_DSI_MODE_LPM;
>   
>   	mipi_dsi_dcs_set_display_off_multi(&dsi_ctx);
>   	mipi_dsi_usleep_range(&dsi_ctx, 10000, 11000);
>   	mipi_dsi_dcs_enter_sleep_mode_multi(&dsi_ctx);
>   	mipi_dsi_msleep(&dsi_ctx, 90);
>   
>   	return dsi_ctx.accum_err;

Before the ebbg_ft8719_off() return error was ignored, perhaps you still want to ignore the disable return error.

Neil

>   }
> @@ -93,30 +95,23 @@ static int ebbg_ft8719_prepare(struct drm_panel *panel)
>   	int ret;
>   
>   	ret = regulator_bulk_enable(ARRAY_SIZE(ctx->supplies), ctx->supplies);
>   	if (ret < 0)
>   		return ret;
>   
>   	ebbg_ft8719_reset(ctx);
>   
> -	ret = ebbg_ft8719_on(ctx);
> -	if (ret < 0) {
> -		gpiod_set_value_cansleep(ctx->reset_gpio, 1);
> -		return ret;
> -	}
> -
>   	return 0;
>   }
>   
>   static int ebbg_ft8719_unprepare(struct drm_panel *panel)
>   {
>   	struct ebbg_ft8719 *ctx = to_ebbg_ft8719(panel);
>   
> -	ebbg_ft8719_off(ctx);
>   	gpiod_set_value_cansleep(ctx->reset_gpio, 1);
>   	regulator_bulk_disable(ARRAY_SIZE(ctx->supplies), ctx->supplies);
>   
>   	return 0;
>   }
>   
>   static const struct drm_display_mode ebbg_ft8719_mode = {
>   	.clock = (1080 + 28 + 4 + 16) * (2246 + 120 + 4 + 12) * 60 / 1000,
> @@ -148,16 +143,18 @@ static int ebbg_ft8719_get_modes(struct drm_panel *panel,
>   	connector->display_info.height_mm = mode->height_mm;
>   	drm_mode_probed_add(connector, mode);
>   
>   	return 1;
>   }
>   
>   static const struct drm_panel_funcs ebbg_ft8719_panel_funcs = {
>   	.prepare = ebbg_ft8719_prepare,
> +	.enable = ebbg_ft8719_enable,
> +	.disable = ebbg_ft8719_disable,
>   	.unprepare = ebbg_ft8719_unprepare,
>   	.get_modes = ebbg_ft8719_get_modes,
>   };
>   
>   static int ebbg_ft8719_probe(struct mipi_dsi_device *dsi)
>   {
>   	struct device *dev = &dsi->dev;
>   	struct ebbg_ft8719 *ctx;
> 

