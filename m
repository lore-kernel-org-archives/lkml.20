Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793625806;
	b=u3PYr2E+3VVyW8FkteiBHjMVNzlqi5V7ati9dKrXSX3CJff+tfpbLy8p0DidMgHFTIt/
	 2LrdN6UZGiSfk54t0Vmk4wLq3nwUCPUHNGoPu8hXli/vIx85AG2v18yi4yBF+D4EsZC8C
	 aZC8ZYfMD5/kizNjxTIavqnVIc4ppWFCnB96fbHo+CbwKFvJDHxaMmP9Hxi/C9UVK+CXT
	 p9TTNMosssdgAR1TX2AKRGCCDF1LYxi1aHwHhymFtsOy32mjb03yUkWvI45QYwdTmgEuN
	 ubePYJUK2m5R+TArUQjtjGzN83HQuHKMiFmAjrmgBDLh0tYFaFn6zDILw67Hcw3LKjA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793625806;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:From:Reply-To:Subject:To:Cc:
	 References:Content-Language:Autocrypt:Organization:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=iIx9bq7eJtm+GqnApG7n9pCm9nsbzo/SWmqkbsdi7fI=;
	b=v+5+2TJROXDANTSBfCieLn0v2CK6hdJOE8NfjX69tl5rd5JkwSqJkJiiqKVqs5wSoZyt
	 gPEPVmncaisP4voA2/iGUx7/l+cned9gfVjhno2XnFXuwtEK2JwlQ9HW9OD3fGFiRIZdJ
	 DatHYiOmCpzpO43l72iMHSjWc4t5GLntrNKNMLU/WENf15g3laHJ/PIuvPtmIBB29IBPr
	 ys5pUuAnLQIb1M7LhNh9kXBm9VBDNVgyu1CPRGnfqI8Uh+Q91/slWWwUfLw3EOsr6EeCL
	 +mbCIFpfBHdIhr/7h+xzNc4+6WbyyDW4gLKq0Mk8jbN7tIzcv8uZIJZ8rpig7Y1ngmg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=grN4zMxc;
	arc=none smtp.remote-ip=209.85.221.45
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5772606A327
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 13:23:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C5772606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=grN4zMxc
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-48df4f540ebso1341879f8f.3
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 05:23:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793625803; x=1794230603; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iIx9bq7eJtm+GqnApG7n9pCm9nsbzo/SWmqkbsdi7fI=;
        b=grN4zMxc7oQlR98hYUkHCZ6Yuu01AtMNd9fxu+r0BRT4eb0ZejEnXA5JACGs2/7Qaw
         cHX+/SbLjGcmL9T59knvnPl5nbQo7oivB8DBZFuuqi7Ryx6P699t/5uRTVH7i+o/vkKa
         +4hUWvktNsWR75ynl9CeOQRky4Y9GQ2Dp6QX2FFpvvHwZZzBBEiw+losE3FWyMVpqioQ
         /lUy+HIp4IMM+E5IluYwt5g03Jhpu+fmyg6lqcxv6NfA36WD8cmXr1MAw+tSUS8WxfYl
         GvwGKkg0PyofYvOLBvUIpGLiwpGYtNKb9L96yyK38mt28tI015jVBKCejbDhk8m7Dteb
         VmVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793625803; x=1794230603;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=iIx9bq7eJtm+GqnApG7n9pCm9nsbzo/SWmqkbsdi7fI=;
        b=HA75ADntNG+9QrPO14ZlYIr42dn7rcRBz+n2XR0dSzYOW7VJNdOo2Jb19u2AX6st4O
         uKqTWixHJ/kzeQrUvv/Jkto1ikYQSPwP1HQVqotHAFdUcIvbzVYG22FzPBuYhAHptVVo
         JkR2zrdleSQ6yFsOY7/2XmqhIbU3Bufbfa+iHZfS7VQsat6UN9mwRQzf6ZOsjV9WGUkt
         r7Pasz11QW6jrOVlKddViXLM57fHVuhDqZlCzw4Ecrr+92ZPXdzFtrDovvKnqLsQ4CB9
         Q6JSDedpEg4D/FJLCyhWXf/xiemqnUtdyJlBEviSpuN6S0hvrcF4jSoH5HVfjI4sAV63
         m38A==
X-Forwarded-Encrypted: i=1; AKwUvBzUvC49OM0AskCsWi2v4z83q5o1uQYYzKbkPE8P1du7pNPh8NhYm/1tBE1hnUtsNycb29qYZvrwX8M/sRw=@vger.kernel.org
X-Gm-Message-State: APuU4Z9yCnyaJhPjufbglc9mvl3I2ogIpuzrhB3vLdX0cLt10jhVkyev
	bk/HDVzXLFRf57O0XMCXbHLpaAK/te+fc88PrXtL7wBVI9xNuLWXukaugCanQZJBlfs=
X-Gm-Gg: AYBFou3OXGUlAUJYEISpIg2qyxTnY8Q/ScNQMsmbtMVY8cEHhp7a9LVcI/7s09t4EbK
	5vw0uEjTZNtkIF0LK3lHaDEY0iCEni7N+8XS8frZgULkYISEifG+FcMJhHUlrnnftJU2GLZPixw
	si2FLmEptnbUZGWoIQ9aRpNo3XUR+7pUdDYAtCumlzpJU8QBjXr7hBtmHQUchxba3n47k1UNf47
	Q4LkK6sKPvcgsj5HBXWaSA3qfpBW/8iSgTFiYN84h9ctde8ZRbJbIt/blhLeTvqNsVgVKR7PD3Z
	mtv9hOo8Kvs5RxRb4YT0rx0QvXNNetYwKM1juIeK/W+FDShOzLZtloXrMbiH9BeYTLamSoHbosO
	uOaWJ0p/W/7udqpHRKrl42cpInAiDH2nJ4adaL+hffcRcgchB+DIi4uwK1u11icHe67Hm8vfBti
	jmvh4DYnMtthWHPCuISiJSjr20JYL1ObMkc9M3Z3OWzPrJZX0nuqSnyqz7Az471t2OtJug7Ifke
	J2lwdb0lfNmsMHkPPqeUCDXBvCMTQStPnsAHoNbIjGmOmZRqt/41EHYp7oawRw5LEqd0nI3Gfgh
	Tl1/8ioXNQ/y3z7ocnTSfv5dTRI7sjQybWisv3ZpNHwdyOzRNXaRFHh8SAUW6ycGZc/g2wUwcCU
	mC1pbKQ==
X-Received: by 2002:a05:6000:2501:b0:488:654b:ccd8 with SMTP id ffacd0b85a97d-48e6e2bdb0dmr23565416f8f.6.1793625802634;
        Mon, 02 Nov 2026 05:23:22 -0800 (PST)
Received: from ?IPV6:2a01:e0a:106d:1080:9476:5165:3a16:262? ([2a01:e0a:106d:1080:9476:5165:3a16:262])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b8c6e9sm19912671f8f.43.2026.11.02.05.23.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 05:23:22 -0800 (PST)
Message-ID: <75fc5b39-d038-4643-b4ea-a6eb6f903650@linaro.org>
Date: Mon, 2 Nov 2026 14:23:21 +0100
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
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v3 5/9] drm/panel: novatek-nt36672a: Combine two init
 callbacks into one
To: Alexey Minnekhanov <alexeymin@minlexx.ru>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: David Heidelberg <david@ixit.cz>, Joel Selvaraj <foss@joelselvaraj.com>,
 Chintan Patel <chintanlike@gmail.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 phone-devel@vger.kernel.org
References: <20261011-nt36672a-panels-v3-0-9ea238627f8a@minlexx.ru>
 <20261011-nt36672a-panels-v3-5-9ea238627f8a@minlexx.ru>
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
In-Reply-To: <20261011-nt36672a-panels-v3-5-9ea238627f8a@minlexx.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/11/26 13:54, Alexey Minnekhanov wrote:
> The split between .send_init_cmds_1 and _cmds_2 is completely artificial
> and unnecessary. Two command sets are split in between by the sequence:
>   - exit_sleep_mode
>   - delay
>   - set_display_on
> 
> But not every panel driver follows this "split" in their init sequence.
> Some may have different delay timer, or put exit_sleep_mode/display_on
> commands into other places in the sequence.
> 
> In order to make this driver more extensible, combine two init functions
> into one by puting exit_sleep_mode/delay/display_on in the middle,
> followed by commands from cmds_2. As part of this step, also move the
> tianma-beryllium specific deinit sequence with its delays from
> nt36672a_panel_unprepare() to tianma_fhd_video_send_deinit_cmds(), so
> that each panel model can have its deinit sequence with its own delays.
> 
> No functional change - full init sequence with all the delays for the
> tianma_fhd_video panel is kept the same in the end.
> 
> Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
> Signed-off-by: Alexey Minnekhanov <alexeymin@minlexx.ru>
> ---
> v2: move tianma_fhd deinit commands into its own deinit function
>      (set_display_off, msleep, enter_sleep_mode, msleep)
> ---
>   drivers/gpu/drm/panel/panel-novatek-nt36672a.c | 61 ++++++++++----------------
>   1 file changed, 23 insertions(+), 38 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-novatek-nt36672a.c b/drivers/gpu/drm/panel/panel-novatek-nt36672a.c
> index 73bec4f47ec60..a445c8067aa5f 100644
> --- a/drivers/gpu/drm/panel/panel-novatek-nt36672a.c
> +++ b/drivers/gpu/drm/panel/panel-novatek-nt36672a.c
> @@ -51,8 +51,7 @@ struct nt36672a_panel_desc {
>   	enum mipi_dsi_pixel_format format;
>   	unsigned int lanes;
>   
> -	void (*send_init_cmds_1)(struct mipi_dsi_multi_context *dsi_ctx);
> -	void (*send_init_cmds_2)(struct mipi_dsi_multi_context *dsi_ctx);
> +	void (*send_init_cmds)(struct mipi_dsi_multi_context *dsi_ctx);
>   	void (*send_deinit_cmds)(struct mipi_dsi_multi_context *dsi_ctx);
>   };
>   
> @@ -92,20 +91,6 @@ static int nt36672a_panel_unprepare(struct drm_panel *panel)
>   	if (pinfo->desc->send_deinit_cmds)
>   		pinfo->desc->send_deinit_cmds(&dsi_ctx);
>   
> -	/* Reset error to continue with display off even if send_cmds failed */
> -	dsi_ctx.accum_err = 0;
> -	mipi_dsi_dcs_set_display_off_multi(&dsi_ctx);
> -	/* Reset error to continue power-down even if display off failed */
> -	dsi_ctx.accum_err = 0;
> -
> -	/* 120ms delay required here as per DCS spec */
> -	msleep(120);
> -
> -	mipi_dsi_dcs_enter_sleep_mode_multi(&dsi_ctx);
> -
> -	/* 0x3C = 60ms delay */
> -	msleep(60);
> -
>   	nt36672a_panel_power_off(panel);
>   
>   	return 0;
> @@ -140,22 +125,9 @@ static int nt36672a_panel_prepare(struct drm_panel *panel)
>   
>   	dsi_ctx.accum_err = nt36672a_panel_power_on(pinfo);
>   
> -	/* send first part of init cmds */
> -	if (pinfo->desc->send_init_cmds_1)
> -		pinfo->desc->send_init_cmds_1(&dsi_ctx);
> -
> -	mipi_dsi_dcs_exit_sleep_mode_multi(&dsi_ctx);
> -
> -	/* 0x46 = 70 ms delay */
> -	mipi_dsi_msleep(&dsi_ctx, 70);
> -
> -	mipi_dsi_dcs_set_display_on_multi(&dsi_ctx);
> -
> -	/* Send rest of the init cmds */
> -	if (pinfo->desc->send_init_cmds_2)
> -		pinfo->desc->send_init_cmds_2(&dsi_ctx);
> -
> -	mipi_dsi_msleep(&dsi_ctx, 120);
> +	/* send init cmds */
> +	if (pinfo->desc->send_init_cmds)
> +		pinfo->desc->send_init_cmds(&dsi_ctx);
>   
>   	if (dsi_ctx.accum_err < 0)
>   		gpiod_set_value(pinfo->reset_gpio, 0);
> @@ -192,7 +164,7 @@ static const struct drm_panel_funcs panel_funcs = {
>   	.get_modes = nt36672a_panel_get_modes,
>   };
>   
> -static void tianma_fhd_video_send_init_cmds_1(struct mipi_dsi_multi_context *dsi_ctx)
> +static void tianma_fhd_video_send_init_cmds(struct mipi_dsi_multi_context *dsi_ctx)
>   {
>   	u8 reg;
>   
> @@ -352,15 +324,19 @@ static void tianma_fhd_video_send_init_cmds_1(struct mipi_dsi_multi_context *dsi
>   	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x51, 0xff);
>   	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x53, 0x24);
>   	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x55, 0x00);
> -}
>   
> -static void tianma_fhd_video_send_init_cmds_2(struct mipi_dsi_multi_context *dsi_ctx)
> -{
> +	mipi_dsi_dcs_exit_sleep_mode_multi(dsi_ctx);
> +	/* 0x46 = 70 ms delay */
> +	mipi_dsi_msleep(dsi_ctx, 70);
> +	mipi_dsi_dcs_set_display_on_multi(dsi_ctx);
> +
>   	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xff, 0x24);
>   	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xfb, 0x01);
>   	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xc3, 0x01);
>   	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xc4, 0x54);
>   	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xff, 0x10);
> +
> +	mipi_dsi_msleep(dsi_ctx, 120);
>   }
>   
>   static void tianma_fhd_video_send_deinit_cmds(struct mipi_dsi_multi_context *dsi_ctx)
> @@ -369,6 +345,16 @@ static void tianma_fhd_video_send_deinit_cmds(struct mipi_dsi_multi_context *dsi
>   	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xfb, 0x01);
>   	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xc3, 0x01);
>   	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xff, 0x10);
> +
> +	/* Reset error to continue with display off even if send_cmds failed */
> +	dsi_ctx->accum_err = 0;
> +	mipi_dsi_dcs_set_display_off_multi(dsi_ctx);
> +	/* Reset error to continue power-down even if display off failed */
> +	dsi_ctx->accum_err = 0;
> +	/* 120ms delay required here as per DCS spec */
> +	msleep(120);
> +	mipi_dsi_dcs_enter_sleep_mode_multi(dsi_ctx);
> +	msleep(60); /* 0x3C = 60ms delay */
>   }
>   
>   static const struct drm_display_mode tianma_fhd_video_panel_default_mode = {
> @@ -399,8 +385,7 @@ static const struct nt36672a_panel_desc tianma_fhd_video_panel_desc = {
>   			| MIPI_DSI_MODE_VIDEO_BURST,
>   	.format = MIPI_DSI_FMT_RGB888,
>   	.lanes = 4,
> -	.send_init_cmds_1 = tianma_fhd_video_send_init_cmds_1,
> -	.send_init_cmds_2 = tianma_fhd_video_send_init_cmds_2,
> +	.send_init_cmds = tianma_fhd_video_send_init_cmds,
>   	.send_deinit_cmds = tianma_fhd_video_send_deinit_cmds,
>   };
>   
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil
