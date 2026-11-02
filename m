Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793624481;
	b=kPecnSkyejcjGRqwibnxpl8Q4X11dZP1MlqH4v07Dw0CttIP3u52z6yntZE7vV0PQ0sW
	 ZYVn9diH3iYSPCFncoJ7MFiRzZjt5HrVY1qJ15l5U4/gn3jpu5xETgI4EGGaEd7jzynfd
	 lkfuDcvyTLJEgUyM86u9wS5Vc09fDlpH0crWHd0HfDVDdPyJJjEqKbCPamJtJRwVB1tCD
	 j8sg4f4kP9PtSavB+q/qE4RN8saRDWEnEy1iqpmHyVaIvdRVXnjEISi5eLzgwONYc3gAI
	 XVP1pV6BqUNjh+4LqRoxitkz1E9MmI45NrVQ6o2VBeWnUiQySX3D8u4YTOLKd18D9YA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793624481;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:From:Reply-To:Subject:To:Cc:
	 References:Content-Language:Autocrypt:Organization:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=FdyGkNb9XEU5OiT4BY8dIJsA7dO+2bFe6m//LRgHEZM=;
	b=KMbDIP2Gbwdc+G/mV/EdodwoFR+RLZRRSqrIC6K2zx9esGvieU3naa7yRVg5E874Tmah
	 hbvrHvfWMKVbKv9dE+rhX1AziPgo9+Z6+MbAqhZbWXFYiDzV1g76pdV4op++0JtneMTii
	 56MHAeJajyJYs1VXRDlQtPbUjzNUu3oy1Wnl2lz4PINcGDeXIX+FaLjl6aTRdJX8YVCJS
	 CZymZm9yz+Db13p0PXUZGhjpkseVcOaCUwKaXKPAWGZUZeJE8YIoQVHK+ORiJUwYubAc6
	 Mxb2OZKUStyaMSL6ufENiRk3cCxwyeDyeZO7nFsz+tLzOkFAMXljFU2uJlh0gpo4C0A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=eLmsb4sb;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DEA2606A327
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 13:01:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4DEA2606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=eLmsb4sb
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a59100fa83so26247105e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 05:01:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793624480; x=1794229280; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FdyGkNb9XEU5OiT4BY8dIJsA7dO+2bFe6m//LRgHEZM=;
        b=eLmsb4sb7eeK8xptP4EBOO66D/NmsJX94TwOXY+OgzalGPrCFxmjoABgQ6NSZptbad
         ym5DOaRfyGyzr30EIjFrMZ2Avs5U7r4nIDUvbazRVHdP9oOLKSHe7Be9lbMfeAuG+FYJ
         cKb2xLCUoT2lEadOnavNBIDmdWp3U/KcI477CcE/TR4+UfLCrIkxcXIixka36ibwD+z1
         3x3PRKGi0vYcSP10td3TqEK3e5m6AG2s1LMbNC2EsmitsYMgW80vlNuLgX6FVa1RIu7I
         o/qd/hyWEtVXMUuByqYEShEZoCp0EsLoGW3rPQmjMI8IpJcGI2X2DZJwyW9KSuc+vbEZ
         2LBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793624480; x=1794229280;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=FdyGkNb9XEU5OiT4BY8dIJsA7dO+2bFe6m//LRgHEZM=;
        b=mG+ejfXf/w9a9314yKw/4IWTKRyrorZB3CmTmUohQIqDwic+NxJQgDqZariEuGQH3A
         RjvW1gFLEQdDBu+bNqxPwXS9uZK6Yjus/rwg+H8OHEzuIYUKoBb1ge6pBPwtXkvDrii1
         ELr2liy4dzkBCUUsxOj+XjiJNdqhU1miKNDjcBx8ITRtOlSp3TXcN6kUjGUeC+PP8xFD
         iI+ovH+gVOEnRMABKS2f9CFd8rlz7uUctABfvxvLb9axslvhfuGOTSqg9OdfCYpDr9Ny
         ixQ1n85DLhFnDvL5XATYytenJCe0JAUu02j4U7wyI/OkkEZkoUQ6EBKYrb4haUEMlUWZ
         517A==
X-Forwarded-Encrypted: i=1; AKwUvBzfdJB5+AnUmQWHbWrkEJBjpZhkrKDr7g5oMu7dtgCAEiDfPPB4rc5k2uKJbzab4/cvoXFn2TxDJl3V2a8=@vger.kernel.org
X-Gm-Message-State: AFq9FYITGEXHoC272WYgqN+Qnblumz8Sr5C7Mtx+4XHcvWH5yN6QJr7e
	FLkbHtwk6MRZFeodOGFPMwq66O931oH0vXgaXcy+VCyNbI2IynSrE0jJzW5CgmLNiSw=
X-Gm-Gg: AYBFou14jn2fHoEwfCV/87fpNet4ZztmjyZQ9+oR7WssShZ02Q1E7V199SqU3XKD0ZD
	AbJpTMGa5MfMkYRF6tJKv5KWU2oW2H4okB7JaT7wIyi8lPvqOlKOEm9FF0yxaj0Xmc0RtU5958F
	YZLi8Foz/DCXZOBvmbj6Nqd0wCTLhAUQFpCMH0tgFAp9t4WMB9gnsiPpfIKy0JFDXoSIFeUoNaA
	QQuRDC4QC0ZArRjeaWIx/M//BwrmBNS0o+4fxuysV656EVqPCFw5lq9bw3/XK9oH0WXhpFrMGIG
	bE2CYR1dAUcYM0fHgw0kNqSleky3JVrlWZKIHivvhj+xn06ZwmkQUu4HqoJX8CD0V4s1034odAI
	KGepcw9FdBHRE57gZXwEHLk0hYTl32LM5Sh9mJaKoSyTqEp/OImv/08z92+7rMHABKmrzpreauO
	dTJ1Cv/WCUL4eVqK41TLzJdck3Jodc79CpsRNXZJW1tfQmcM/JC7UovQhsnCmmEmNe7RNy8kOwe
	LaIuKkcvcRrNQaGCeTwlMHaYR/lSUJTM/ZR0gSlFeWijrj+L2Wl8Mq7lqMlSRhQ1f9EshEowNOs
	rT/wfXn0tAk477gyFQtgc932JihqufAtcXh3OqGCoGnHDDeYwV/XOAFEm5i9JufhpA1XRRD1Lhl
	QXOwQ
X-Received: by 2002:a05:600c:638f:b0:4a3:59c2:b41e with SMTP id 5b1f17b1804b1-4ac150b304cmr228118685e9.4.1793624478166;
        Mon, 02 Nov 2026 05:01:18 -0800 (PST)
Received: from ?IPV6:2a01:e0a:106d:1080:9476:5165:3a16:262? ([2a01:e0a:106d:1080:9476:5165:3a16:262])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ab61d8b9f4sm316856835e9.12.2026.11.02.05.01.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 05:01:17 -0800 (PST)
Message-ID: <fe1eb69f-329a-4463-8993-619f598dbca0@linaro.org>
Date: Mon, 2 Nov 2026 14:01:15 +0100
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
Subject: Re: [PATCH v2 2/5] drm/panel: raydium-rm68200: Fix prepare error
 cleanup
To: Hsieh Hung-En <hungen3108@gmail.com>, dianders@chromium.org,
 jesszhan0024@gmail.com
Cc: jagan@amarulasolutions.com, osama.abdelkader@gmail.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, Sashiko <sashiko-bot@kernel.org>
References: <20261102043215.990351-1-hungen3108@gmail.com>
 <20261102043215.990351-3-hungen3108@gmail.com>
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
In-Reply-To: <20261102043215.990351-3-hungen3108@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/2/26 05:32, Hsieh Hung-En wrote:
> rm68200_prepare() returns without disabling the supply regulator if
> EXIT_SLEEP_MODE or SET_DISPLAY_ON fails. Since drm_panel_prepare() does
> not mark the panel as prepared on failure, drm_panel_unprepare() does
> not call the driver's unprepare() callback, leaving the regulator
> enable count elevated even after subsequent successful
> prepare/unprepare cycles.
> 
> On failure, restore the reset GPIO to its unprepared state, following
> the existing reset sequence in unprepare(), and disable the supply
> regulator before returning the original error.
> 
> Fixes: 2b7ed18bed1a ("drm/panel: Add support for Raydium RM68200 panel driver")
> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Closes: https://lore.kernel.org/r/sashiko-outbox-171393@kernel.org
> Signed-off-by: Hsieh Hung-En <hungen3108@gmail.com>
> ---
> 
> Notes:
>      In this patch, rm68200_init_sequence() still returns void and only
>      logs DCS write failures. These failures do not cause prepare() to
>      return early. A later patch in this series will propagate
>      initialization errors through prepare(), where this cleanup path
>      will also handle them.
>      
>      The error path does not send SET_DISPLAY_OFF or ENTER_SLEEP_MODE,
>      as DCS communication may already have failed. Instead, it follows
>      the existing reset and regulator shutdown sequence in unprepare().
> 
>   drivers/gpu/drm/panel/panel-raydium-rm68200.c | 13 +++++++++++--
>   1 file changed, 11 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-raydium-rm68200.c b/drivers/gpu/drm/panel/panel-raydium-rm68200.c
> index c535dc931903..3a59eb00274d 100644
> --- a/drivers/gpu/drm/panel/panel-raydium-rm68200.c
> +++ b/drivers/gpu/drm/panel/panel-raydium-rm68200.c
> @@ -277,17 +277,26 @@ static int rm68200_prepare(struct drm_panel *panel)
>   
>   	ret = mipi_dsi_dcs_exit_sleep_mode(dsi);
>   	if (ret)
> -		return ret;
> +		goto assert_reset;
>   
>   	msleep(125);
>   
>   	ret = mipi_dsi_dcs_set_display_on(dsi);
>   	if (ret)
> -		return ret;
> +		goto assert_reset;
>   
>   	msleep(20);
>   
>   	return 0;
> +
> +assert_reset:
> +	if (ctx->reset_gpio) {
> +		gpiod_set_value_cansleep(ctx->reset_gpio, 1);
> +		msleep(20);
> +	}
> +	/* Balance the regulator enable count on prepare failure. */
> +	regulator_disable(ctx->supply);
> +	return ret;
>   }
>   
>   static int rm68200_get_modes(struct drm_panel *panel,

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil
