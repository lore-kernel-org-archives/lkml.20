Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 851F0395266
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 22:52:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790549539; cv=none; b=hXJLoxUtcbBVU9ChPiXCLeaI/ifLxvHhYkRXeiI7MpUDV1DIYeyHO0GT+IXuCPXqjhbtDriwd+ioSJ8lkyKF6ZJeCHjF4z2E/ukmBJvZZNiUZNdH1A3HyKYYqiFQqfiEZ3UQez2cdfGgHP8x43g4/BD1shtdrvdNGqa1TYxpwtQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790549539; c=relaxed/simple;
	bh=fP0a3qkp40/pIAF3KUnH+O7efK57FgxqjMb55e9PZq0=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=EfWVRbIFRGMyXVJ2Bja18lNUBXtTUCEE9HT4pFiD1NRJocrneOvA9u06SvsLtbG7FneeozkwwlT1AgU4z2KuEvkhSM90db3/ErCGzFgaYFGwEzlmoXZQDWBfru2g+B7Tyvfl3wOR+BPFlcEjGPyyQHksrSAVM0/jhlhUFogjTU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=r29djOhe; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="r29djOhe"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-482f6350f89so1521926f8f.3
        for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 15:52:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790549535; x=1791154335; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TArekN18j9E29AsGV4AT/276CAexcJWhfmYRYuZpdI4=;
        b=r29djOhexovfMN2rfHon+wBL3ngptjpItTzPKjwnDtd0IdC47n6OEnr4bT6sUePqbf
         tdNiIpIpjf7YKtYGE/OUSjnCOx+Bukm4DSijECOL/8wqrLjxq/1JJNrHQtOCQzdXE/Hh
         HE/QBXls2afbu0e2KODnWk9EFkIayM0xS+nQf3twbRT+DUuXDEmH009p/0kYNPHEw9EA
         x+ndeF8mn0Xr7WgjmjXX2EwoojvZAMDsnWXRKkZ8D7PY/E5j1MNL/icSTCOmx+zsRiUK
         bfS8F1EvGrqwbxpvpONq6SkE6Z/oreN2nH8KSvWhm90FWUYO3CftikkDXhpTnXYM8QXn
         WadA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790549535; x=1791154335;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=TArekN18j9E29AsGV4AT/276CAexcJWhfmYRYuZpdI4=;
        b=NeY7CgiJcfjQph5F8/BHl0jdhtBSfegLJpRSBED4nkXFMsA/G4eLyQU6ATa3ukB3LQ
         Lhq48EAtCduf45uvfmzJJa0OuBysmDQn4Nvq0m6khQX9rUVGyeem7CecjFBV4ZCuykRi
         K8YOQwcU8q5JZwtAp+P8i9n34sqxCjkdh7I5o9xBvN7mdBsAFZ72GlddPSiwKvNpH1Lj
         WXrHAnJKzFQR0IZrsn+GD00yL03eotWC1RmD98e4j28PEQW5C5K3GA7DHo40BGTRZPmW
         HAH8M4KZuiv/AG+KD9BfYuPg7jHOMw1+5dHRNQgNWR0TstXpdLQ/XNOqsxP4bRpbnEyl
         uQbg==
X-Forwarded-Encrypted: i=1; AKwUvByVXoskS48K4XP9yjEfQzVLxWLjD7I1uFRMxOO4DOfrPG5AeYM8dkaaRo8XiVIqn3NHM4aPgXVtV9y/rhU=@vger.kernel.org
X-Gm-Message-State: AFq9FYKzkBIfuHbAm6gnRGNc8P3Pw7dSYbcP/5joAg5QiIVo/OzumJtl
	Ivxz3u91qRCrfrMS7O8ZJxVuNAaPxNuJcAjafHvU35O161J9qOO6AEzEAdclqpOq3wg=
X-Gm-Gg: AYBFou0oiZ51j9r5s0CP9im0slXRaj6x213ftPNvhcAN6lK6TsR+eKe5cqslBo/9GVo
	55PkME8HVK3DH2b0TqBgtdIiVB/oGEG9gXbX1HqwL8EmGtebBqmiYYrOcBcjtR1Bdj970KCRqFE
	UYp9j6vfiR+ki0Jc07ESBT6QjuHwa+QBogfytkIjjN5sjrBFcedeyCm3ZSOaN3cN7nTmInaGYpr
	PY1oOHJYWW5m9OqnEqbkDr02DKNcv3q6qgPbjud/D+Jp/BCNpB8O80a9eER3534EHLbBsDT7i4B
	BSzQrvALM+g9rNCuW5HZXkvjIygih7XGFRMc9QkDfp2PW4esPg8oEXh42d3HPZnfZvom9N+R1R1
	frlnCW8rvHlUEp/JlRCxr7zRCH84h1tTFPrWmni6kWS8cpdyzm69fKI8czezUeK3oqpgm7ZsfLp
	8+SbzYqUs08A6P6JEglT3uMI3w9bt/TVGQ9MmhDYNLwMrF4YypTI5ri9hIbA4I5goWofwZtlxmh
	uPZn3P1ypDoZP3+8A==
X-Received: by 2002:a05:6000:26d1:b0:487:8ec:1fc with SMTP id ffacd0b85a97d-4887d9fa635mr13779101f8f.12.1790549535472;
        Sun, 27 Sep 2026 15:52:15 -0700 (PDT)
Received: from [172.20.10.3] ([37.168.29.21])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a349731sm23314402f8f.12.2026.09.27.15.52.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 27 Sep 2026 15:52:15 -0700 (PDT)
Message-ID: <fc3da38f-0816-4639-b26b-bcf3a2dda0e6@linaro.org>
Date: Mon, 28 Sep 2026 00:52:08 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] drm/panel: fix novatek-nt36536 dependencies
To: Arnd Bergmann <arnd@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Pengyu Luo <mitltlatltl@gmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Jessica Zhang <jesszhan0024@gmail.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 David Heidelberg <david@ixit.cz>, Svyatoslav Ryhel <clamor95@gmail.com>,
 Julian Braha <julianbraha@gmail.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Teguh Sobirin <teguh@sobir.in>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20260925130125.3897046-1-arnd@kernel.org>
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
In-Reply-To: <20260925130125.3897046-1-arnd@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/25/26 15:01, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> The recently added driver requires access to DSC helper code
> and fails to link without that:
> 
> ld.lld: error: undefined symbol: drm_dsc_pps_payload_pack
>>>> referenced by panel-novatek-nt36536.c:109 (/home/arnd/arm-soc/drivers/gpu/drm/panel/panel-novatek-nt36536.c:109)
>>>>                drivers/gpu/drm/panel/panel-novatek-nt36536.o:(novatek_prepare) in archive vmlinux.a
> 
> Add the usual Kconfig dependency.
> 
> Fixes: 75a5dbd1f4f7 ("drm/panel: Add Novatek NT36536 panel driver")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>   drivers/gpu/drm/panel/Kconfig | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
> index 6874752a1901..8bf7911d2a0e 100644
> --- a/drivers/gpu/drm/panel/Kconfig
> +++ b/drivers/gpu/drm/panel/Kconfig
> @@ -694,6 +694,8 @@ config DRM_PANEL_NOVATEK_NT36536
>   	depends on OF
>   	depends on DRM_MIPI_DSI
>   	depends on BACKLIGHT_CLASS_DEVICE
> +	select DRM_DISPLAY_DSC_HELPER
> +	select DRM_DISPLAY_HELPER
>   	select DRM_KMS_HELPER
>   	help
>   	  Say Y here if you want to enable support for Novatek NT36536-based

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil
