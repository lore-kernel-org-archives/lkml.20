Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B90B4214813
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 08:12:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790928754; cv=none; b=DusBKY3jFPgQ+a5UgkbxEd++6Vjs+BjNgZrN2KTbnCKg/R4Zcpr59cdmCKQcw/05FwxEE6/ahrogqCSux2xhbhVg8KpzuU5K2la7D/bQhZAeilioCsE8r3k47U2ycONIo9HzrABjZYCsBTthTfCSasB29W6vdV+j/5m5FrhqMg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790928754; c=relaxed/simple;
	bh=mUZoqT4FOwpYQh+KuejEClG/eAu/MteILsXR+W6iLyA=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=Jq7Lti5uLzno5NS8G8KogBqq6GHBe8i7V2zlm4QWUc46oWUg7BZyCWr/cMa0xGB9lYbShB3wlxz1ZJepN3iKzUQQsrc7zZMw30J77kxjuPdQ66Osa5E0X0I3+K1mlF3DMLeVI8TxztLQik+nm5rpwQcuYSlMvCC3vos/Y41dNQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=oG00bPZ9; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="oG00bPZ9"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912d822dso54603675e9.2
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 01:12:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790928751; x=1791533551; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xs5oz1JmPTBBqK5n7Rqihg5Y4URFjfrr+i3MIUtEfRY=;
        b=oG00bPZ9ql6uofGzm/HmsIgK9TWGjpboudpOyxqjuCv/xdTw7x4IPb/lXzMLgiLMbA
         9chcUQ8w9sI8L5RFP9SZfk4o7GxBDe/08RYVvQerq9mmFh99QVT7wZiQ7ho0ANGqdvg9
         FBHa5bJ9Pt/SK0r2ylwG0CRNk51+AbAT9rZ1lCTQKEjWpTQAFB+kJuZcPUTUD1H6ke+O
         jveYJX++4mFKb23ujCiZBgIl+YuVisCSUx2xcAvNzisEu5k9568n4CUKr0oFmC/dgKqP
         tTCbw6ukgK8FNxQqKtJwhlb0l5jzUJgTzkXCQzdS5EKUDOshA/YJ5OaQ+OPCEijtnGWH
         dyAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790928751; x=1791533551;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=xs5oz1JmPTBBqK5n7Rqihg5Y4URFjfrr+i3MIUtEfRY=;
        b=0179rzLWVL2M6fS5vvwSzyLngmfq1D1uWcrTJW95p+2H/zUHXUYZ+aUh4P0DuoGlKy
         UHrSEO4R+higYgWqnfbZ6WpYaI4HAfP+y7p5IiwW9DqRAx/1xt7CH5vSsL33M2lQYRJE
         alzYNj9Pv8thXj1zk0fu78aoazUH8GMsmn/JiyhJrjfmRUb/NWii46dEI0kRp6qHuwgn
         5NxlOv+f1R5Fa0Cr9PJgjqE8OmRFIhyomzZFL8qxKy7t78jlIH6mjOQ/pDCK5UFpZ59J
         yx+gZsWv/bF8oGWilG+ZPv9o/XcQZl9IN1vGFEVOdqn5ORvyHnUgFh+pP5illYyphZsv
         zDrg==
X-Forwarded-Encrypted: i=1; AKwUvBzxnl6BtWfLoIyZZx+GG8cBYchN59z53OIYVit3yYRYx+4C/6c5nZ4T2mEhDWry9RNsLS92d1wSbSSQOOQ=@vger.kernel.org
X-Gm-Message-State: AFuF++lwpV04Vx2MLHGZlnkR5ikUezJjGCMXzcHYqsr7tBufy9Fm3uwu
	4c52irTXG4SJYDOwlBkfgFd9OmSoRNQTVaFlT33LqXSLevr7Gan0SMcqGdukNcCjDzE=
X-Gm-Gg: AYBFou1KrhFbxiIJsmL7O42sDRZxjV7iJt/dV1m82OZzrdztalgBRXKO4z4R82O2FEP
	0YY5nAt5AJAW2Cn9cFRayaqgXrAPODWvW4dLTW7ov6XG+ZOGrpdF9Mx/lJK3rP9aYxQkhNL/OF9
	aAjMr0iaJFO+o7yjSopQtTFqM+D3q5gHdfs+JSP4ejhDaIYfEryXH+mlptDGKFkDBC1MhixXFVv
	FrN4iYeyYnUiuvgI0qKTFW6L1EdTPSrHRwIALS5kCvPjYrUH4iIXeHAQCtij9tUNGCeI18+alx7
	A8Xx18z3vlISMmQjU/KUKSotc15gIzD0rotghEsklieCtTyEEl60eV1J6LyeOKP8V9YjFP0ZGiG
	PfIQByUZ/0bvXFYfapGpMLAsUN5cADv+ZoVwYeNHifjQoSPQcctT0D0TwVAxcVd3iMUEpReBt8A
	pHvyw7mpIfnFB6CHYngHRNwDt0qeReGg+F9Kgg0Y0Df61QsixL70bAqf5R7WtxtuKQDxuG4m2bW
	FxwcKov19rVjwHGB44Ns4mMtGRKHlFdm3qJoWFx4Cgw4Zy81q4=
X-Received: by 2002:a05:600c:c3ce:10b0:4a0:317:1996 with SMTP id 5b1f17b1804b1-4a02769f2a5mr24217955e9.27.1790928750805;
        Fri, 02 Oct 2026 01:12:30 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:2f62:6d3:721b:8c9e? ([2a01:e0a:106d:1080:2f62:6d3:721b:8c9e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a0394c937csm30885075e9.1.2026.10.02.01.12.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Oct 2026 01:12:30 -0700 (PDT)
Message-ID: <cd764af7-3fa9-4b35-9c0d-9a0b863e464e@linaro.org>
Date: Fri, 2 Oct 2026 10:12:29 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2] drm/panel: ronbo-rb070d30: Ignore DCS errors in
 disable()
To: Hsieh Hung-En <hungen3108@gmail.com>, dianders@chromium.org,
 jesszhan0024@gmail.com
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch
References: <20261001004940.110776-1-hungen3108@gmail.com>
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
In-Reply-To: <20261001004940.110776-1-hungen3108@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/1/26 02:49, Hsieh Hung-En wrote:
> If rb070d30_panel_disable() returns an error, drm_panel_disable() skips
> clearing panel->enabled. unprepare() still powers the panel off, but the
> next drm_panel_enable() sees the panel as already enabled and does
> nothing, so the panel stays dark.
> 
> Always return 0 from disable(). A failed ENTER_SLEEP_MODE is still logged
> by mipi_dsi_dcs_enter_sleep_mode_multi().
> 
> Suggested-by: Douglas Anderson <dianders@chromium.org>
> Signed-off-by: Hsieh Hung-En <hungen3108@gmail.com>
> ---
> 
> Notes:
>      Changes in v2:
>      - Add a comment explaining why the error is ignored (Doug)
>      
>      This applies on top of:
>      https://lore.kernel.org/all/20260929080143.559685-1-hungen3108@gmail.com/
>      
>      v1:
>      https://lore.kernel.org/all/20260930013029.3241267-1-hungen3108@gmail.com/
>      
>      Compile-tested on arm64 with W=1; not tested on hardware.
> 
>   drivers/gpu/drm/panel/panel-ronbo-rb070d30.c | 8 +++++++-
>   1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-ronbo-rb070d30.c b/drivers/gpu/drm/panel/panel-ronbo-rb070d30.c
> index ebe6352db..9adf97aba 100644
> --- a/drivers/gpu/drm/panel/panel-ronbo-rb070d30.c
> +++ b/drivers/gpu/drm/panel/panel-ronbo-rb070d30.c
> @@ -87,7 +87,13 @@ static int rb070d30_panel_disable(struct drm_panel *panel)
>   	struct mipi_dsi_multi_context dsi_ctx = { .dsi = ctx->dsi };
>   
>   	mipi_dsi_dcs_enter_sleep_mode_multi(&dsi_ctx);
> -	return dsi_ctx.accum_err;
> +
> +	/*
> +	 * Returning an error would leave panel->enabled set, causing the
> +	 * next enable to be skipped even after unprepare powers off the panel.
> +	 * The helper above already logs any command failure.
> +	 */
> +	return 0;
>   }
>   
>   /* Default timings */

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil
