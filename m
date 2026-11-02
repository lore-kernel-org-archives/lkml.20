Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793624535;
	b=eZ6O8zKFpFVEvzPxWCK1IbG8/0iCGQe4xQr9UdlQyWN+yuUkyhbOcAhAa6SxCcJ8EIqE
	 89yk4NlOpDHKP+CGq237hj4ggKHgqGHtqsc8nkUWALgjVF9h6J1Db5nI1mlLKqpkdC4mh
	 H7wCfOzroLFlnmMSSKxIy4V2ZrfKpTWfLdXayotDwVggXQEQGdMgXbPXkFYzBfLjNmk8O
	 CAUqWVHBK1G+vPV0RhaYBTkE/ycABanOi7DOFwZdEWCYX02bNeBi9SIjH8TfOlmbKa5Sb
	 gfnDF8rMDEGkmyqPZ+bO3S5YvypsqZEGjkCyeXiEoVtI3Bnxv+oUfxKGW6i6MRTT9aQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793624535;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:From:Reply-To:Subject:To:Cc:
	 References:Content-Language:Autocrypt:Organization:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=OCwjDl9SqaD1n0bx2YhNRBtWOo95W909nhaKEEF1fA8=;
	b=rMLkFlrMLa0SAgPqvYdURqv7yvwYg0W8L5Khuf7x+oCGEaaIKvnF4jkH3kV5UiLB1eJB
	 hDTQ4wElFDjg0kSoz5f1214XmU9zQ0xO/m1CmymyWJxeI/CKjPkca56jW8PVKHSc6uNkq
	 DG2FkVgaTOXAJvTSIHezLAQTuPROxlZ/bXZQN9iMRr5S/2zbqOvO+B9Tb6PyzCB33bVOu
	 ZUQif7DNR7AMD1CZQuaLoTE82XId6urNxnDByfiWqOLcbFT+WkcQ9NVY1GbHWv2YRxqdY
	 3Ms+Ci1hSb/2ncSoitryI9I67WYQ++gLQJ75l7qMbFGd2cIqrU0r89rKDN5EX53yViw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=D1PxL8YG;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBC4A606A324
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 13:02:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BBC4A606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=D1PxL8YG
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a20bdaf39cso34417055e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 05:02:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793624533; x=1794229333; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OCwjDl9SqaD1n0bx2YhNRBtWOo95W909nhaKEEF1fA8=;
        b=D1PxL8YG5RCXOH8prp9m34aQz8MQ/j8YwedjyV+nVtxKhR8STMaiem3Ce8rufyNYLP
         pqDQXh9q6Jk10kCoLUwiTIfrCI9diRJyFY2H+OC+rEKSqN9LgI4JvmA9RZOAdjimnXdK
         l/ndOOKuSJW4gJ4XSlxDLGWzHNw6QR2dkFMRnXO/mVDZQLH3XvKEjmakhphLlnc8qT7J
         6Xx1/b5C1qWJWd5tO5q5AaiV7RTzMqTWcXC5RWAl1aavrAkdn/WqscQzTJyTxnNhsGVm
         q0Zyv+yiUZKKWvThCO/BUv2ykopOiJj0SX+FkGAYdT7y6UKOPe9g+nivdKzzdhZOzWnO
         UC1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793624533; x=1794229333;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=OCwjDl9SqaD1n0bx2YhNRBtWOo95W909nhaKEEF1fA8=;
        b=lLewL92g7amfwZ1LxfDRZTqg6RuSroMweE/DruN9sQjDOQ4v3zcfKIFfgAl2bFGiG8
         F0bTzi+0KrSGV9cP5O0Ruy65JIPgpIO7Zoi45oVa8Cg23JcO3Nl3exv4Yo68AUo4qdqE
         eFGOTNWCmQzMkKsvJgOfK2N8VTDRFSThcNKYFWRfamz69jaTJ9T4Mvg5C0H7u+Qc1vDP
         jbuXa+kAwg92F6bdPas3HGlDWwyXxMAyZrx/IRIO8xfLc9dLaVV9CmmhJ0BAbFP2qNsV
         PdeV3ST3Q+87b3pbGY+hP2Q8T8xR8fbGA1h2Ct76nB+xItNi/1Y9HPEvDS3Nj8AbBQwg
         P9Fg==
X-Forwarded-Encrypted: i=1; AKwUvBwj8bsjnBJmdWEJBsi0uBE2NwPzZgFYDYqmczoLgjLYS/R71JKuKMGv84u9aJnQypApLjdmHlixgwbHKuE=@vger.kernel.org
X-Gm-Message-State: AFq9FYLNz7UeWK91gQCekyTHiIkHS4+1WClniQ+cM1AHsFlIdpSgbbuo
	gjZiC8akSHRHCYbkHDbAh1gteH7GH7Mysq5SZrypLoPdqtWRv5ZTycaCPTP/EVnDYYc=
X-Gm-Gg: AYBFou3k9R3D5+jQOOcE5N4qtn9UfOoLy/vR3XIhoSx3GJ+/saRH8sDicpzKgutZPYh
	F3huVyxbbqLGHsJMQW/C2vwnG9iaEHWmB/U6NfqsPfRRE7it0UltaZYrAC5vnlUxdOFdJ+y74Cz
	Ww3ZVW782U5kU01CoLhLOUFrrpuaDsD5ZxukaOZl4cQxAwwL+fz6EEg/6d6pv94YDQFY0LVG6+l
	9DzXmHeb6SHlWhQy+FRw83kGjtsuW5M03wuSBSGYOCC9+yrsN5/rlO5zGroifL4pkLiaEbKugIk
	RBmp+w1xEFK3H4pYFUMZrfU+Ivw/TmR7t7cK/5ZhAbdmL0EJGnaivPGEe2jO2f2VA+W3/kQDpcx
	TZqfctSu2IIif0sFo0lsGqTef1NKfyZ3GYD7pW/hprV+VHSjiGY10+im6dDWBba1uhlLwoyHXkh
	yK+WFGr29NyBC/pCVVrifWNCPD3pE7k9iB9rpgMJVCMUUHsGuXdeLAgb7Q3Xq0hC9Zv0ADxhEm/
	N23duwk6iAofErSQ1IUtqBk82dV0CiwwA+pfGBa3wLmsVyKzrJVmJ/SO1AnpAH/8SzIIt8Oy0bE
	ASOHWZYLAvOnGAHJ8oHAy2NdENbpjsgtWHrr+HbFrvJOxP4seDn/3Ircv8IC42oPKD3i+DwPOys
	pzCig
X-Received: by 2002:a05:600c:c0d4:b0:4b1:2026:6b31 with SMTP id 5b1f17b1804b1-4b12026723bmr41745155e9.28.1793624532870;
        Mon, 02 Nov 2026 05:02:12 -0800 (PST)
Received: from ?IPV6:2a01:e0a:106d:1080:9476:5165:3a16:262? ([2a01:e0a:106d:1080:9476:5165:3a16:262])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ac09cc3e9asm119273755e9.3.2026.11.02.05.02.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 05:02:12 -0800 (PST)
Message-ID: <389b4336-395c-48ee-a2ed-5396fc8fe58a@linaro.org>
Date: Mon, 2 Nov 2026 14:02:11 +0100
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
Subject: Re: [PATCH v2 3/5] drm/panel: feiyang-fy07024di26a30d: Use
 mipi_dsi_*_multi() functions
To: Hsieh Hung-En <hungen3108@gmail.com>, dianders@chromium.org,
 jesszhan0024@gmail.com
Cc: jagan@amarulasolutions.com, osama.abdelkader@gmail.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch
References: <20261102043215.990351-1-hungen3108@gmail.com>
 <20261102043215.990351-4-hungen3108@gmail.com>
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
In-Reply-To: <20261102043215.990351-4-hungen3108@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/2/26 05:32, Hsieh Hung-En wrote:
> Replace the deprecated MIPI DSI DCS helpers with their _multi variants,
> as suggested in Documentation/gpu/todo.rst.
> 
> Replace the initialization command table and loop with seven direct
> mipi_dsi_dcs_write_seq_multi() calls. Preserve the original command
> order and values, using lowercase hexadecimal literals.
> 
> In prepare(), the first failed DCS write prevents subsequent transfers
> and its error is propagated through the cleanup path added by the
> preceding patch. The helpers also log command failures.
> 
> In unprepare(), clear accum_err between commands so that ENTER_SLEEP_MODE
> is still attempted if SET_DISPLAY_OFF fails, preserving the original
> error handling behavior.
> 
> In disable(), ignore SET_DISPLAY_OFF errors to allow drm_panel_disable()
> to clear panel->enabled, avoiding a stale enabled state after the panel
> is powered off. This follows commit 00efe8a68565 ("drm/panel:
> ronbo-rb070d30: Ignore DCS errors in disable()"). Command failures
> remain logged by the helper.
> 
> Signed-off-by: Hsieh Hung-En <hungen3108@gmail.com>
> ---
> 
> Notes:
>      Changes in v2:
>      - Replace the initialization command table with direct
>        mipi_dsi_dcs_write_seq_multi() calls, as suggested by Doug.
>      - Route initialization errors through the cleanup path added in 1/5.
>      - Convert initialization command values to lowercase hex.
>      - Drop the previous Reviewed-by tag due to the initialization rework.
>      
>      The seven initialization commands were checked against the original
>      table; their order and values are unchanged.
> 
>   .../drm/panel/panel-feiyang-fy07024di26a30d.c | 68 +++++++++----------
>   1 file changed, 33 insertions(+), 35 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-feiyang-fy07024di26a30d.c b/drivers/gpu/drm/panel/panel-feiyang-fy07024di26a30d.c
> index bb4cc1ea2ece..fa304eb7453b 100644
> --- a/drivers/gpu/drm/panel/panel-feiyang-fy07024di26a30d.c
> +++ b/drivers/gpu/drm/panel/panel-feiyang-fy07024di26a30d.c
> @@ -13,8 +13,6 @@
>   #include <linux/module.h>
>   #include <linux/regulator/consumer.h>
>   
> -#define FEIYANG_INIT_CMD_LEN	2
> -
>   struct feiyang {
>   	struct drm_panel	panel;
>   	struct mipi_dsi_device	*dsi;
> @@ -29,25 +27,21 @@ static inline struct feiyang *panel_to_feiyang(struct drm_panel *panel)
>   	return container_of(panel, struct feiyang, panel);
>   }
>   
> -struct feiyang_init_cmd {
> -	u8 data[FEIYANG_INIT_CMD_LEN];
> -};
> -
> -static const struct feiyang_init_cmd feiyang_init_cmds[] = {
> -	{ .data = { 0x80, 0x58 } },
> -	{ .data = { 0x81, 0x47 } },
> -	{ .data = { 0x82, 0xD4 } },
> -	{ .data = { 0x83, 0x88 } },
> -	{ .data = { 0x84, 0xA9 } },
> -	{ .data = { 0x85, 0xC3 } },
> -	{ .data = { 0x86, 0x82 } },
> -};
> +static void feiyang_init(struct mipi_dsi_multi_context *dsi_ctx)
> +{
> +	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x80, 0x58);
> +	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x81, 0x47);
> +	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x82, 0xd4);
> +	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x83, 0x88);
> +	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x84, 0xa9);
> +	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x85, 0xc3);
> +	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x86, 0x82);
> +}
>   
>   static int feiyang_prepare(struct drm_panel *panel)
>   {
>   	struct feiyang *ctx = panel_to_feiyang(panel);
> -	struct mipi_dsi_device *dsi = ctx->dsi;
> -	unsigned int i;
> +	struct mipi_dsi_multi_context dsi_ctx = { .dsi = ctx->dsi };
>   	int ret;
>   
>   	ret = regulator_enable(ctx->dvdd);
> @@ -77,15 +71,10 @@ static int feiyang_prepare(struct drm_panel *panel)
>   	/* T12 (video & logic signal rise + backlight rise) T12 >= 200ms */
>   	msleep(200);
>   
> -	for (i = 0; i < ARRAY_SIZE(feiyang_init_cmds); i++) {
> -		const struct feiyang_init_cmd *cmd =
> -						&feiyang_init_cmds[i];
> -
> -		ret = mipi_dsi_dcs_write_buffer(dsi, cmd->data,
> -						FEIYANG_INIT_CMD_LEN);
> -		if (ret < 0)
> -			goto assert_reset;
> -	}
> +	feiyang_init(&dsi_ctx);
> +	ret = dsi_ctx.accum_err;
> +	if (ret < 0)
> +		goto assert_reset;
>   
>   	return 0;
>   
> @@ -104,32 +93,41 @@ static int feiyang_prepare(struct drm_panel *panel)
>   static int feiyang_enable(struct drm_panel *panel)
>   {
>   	struct feiyang *ctx = panel_to_feiyang(panel);
> +	struct mipi_dsi_multi_context dsi_ctx = { .dsi = ctx->dsi };
>   
>   	/* T12 (video & logic signal rise + backlight rise) T12 >= 200ms */
>   	msleep(200);
>   
> -	return mipi_dsi_dcs_set_display_on(ctx->dsi);
> +	mipi_dsi_dcs_set_display_on_multi(&dsi_ctx);
> +
> +	return dsi_ctx.accum_err;
>   }
>   
>   static int feiyang_disable(struct drm_panel *panel)
>   {
>   	struct feiyang *ctx = panel_to_feiyang(panel);
> +	struct mipi_dsi_multi_context dsi_ctx = { .dsi = ctx->dsi };
> +
> +	mipi_dsi_dcs_set_display_off_multi(&dsi_ctx);
>   
> -	return mipi_dsi_dcs_set_display_off(ctx->dsi);
> +	/*
> +	 * Returning an error would leave panel->enabled set, causing the
> +	 * next enable to be skipped even after unprepare powers off the panel.
> +	 * The helper above already logs any command failure.
> +	 */
> +	return 0;
>   }
>   
>   static int feiyang_unprepare(struct drm_panel *panel)
>   {
>   	struct feiyang *ctx = panel_to_feiyang(panel);
> -	int ret;
> +	struct mipi_dsi_multi_context dsi_ctx = { .dsi = ctx->dsi };
>   
> -	ret = mipi_dsi_dcs_set_display_off(ctx->dsi);
> -	if (ret < 0)
> -		dev_err(panel->dev, "failed to set display off: %d\n", ret);
> +	mipi_dsi_dcs_set_display_off_multi(&dsi_ctx);
>   
> -	ret = mipi_dsi_dcs_enter_sleep_mode(ctx->dsi);
> -	if (ret < 0)
> -		dev_err(panel->dev, "failed to enter sleep mode: %d\n", ret);
> +	/* Attempt to enter sleep mode even if display off failed. */
> +	dsi_ctx.accum_err = 0;
> +	mipi_dsi_dcs_enter_sleep_mode_multi(&dsi_ctx);
>   
>   	/* T13 (backlight fall + video & logic signal fall) T13 >= 200ms */
>   	msleep(200);

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil
