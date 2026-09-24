Received: from mail-wr2-f35.google.com (mail-wr2-f35.google.com [74.125.225.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0BBD47DD72
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 13:37:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790257087; cv=none; b=P2Cay/RvDxxTsZ4hUr1ePc76V7ka5CFtqWLFM5p5K70+ULw2CrZUjFdPk/a2OqeXLfQgMjjbRiiXoelde8O3iFqtU5dsSraW4Ii2ykeRVvWYlCH8/VBgxeOEhcwGo1H2d6hR8rF3RzFLKnIrvG5NfCmvaiZWarghkLs28k9WcPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790257087; c=relaxed/simple;
	bh=uBVumAGvxpFaaov/Th+EWyfqXFiE07geQnHeIk6jyio=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=h/ZiO7nSOyiOIcK40z2qfSDX3VLJS1GRAv3Ed32lzRdzaRHv/tAuiFqfFpRej0/5Pht+LD7h5DwZOm7uhSge7vcz9JY5uc6FYkLIdbc6v5hNfPxVywl3uatPW5ZZJM2NyOwnWqxCNOrh5YzAsMCFXE3Rq9MrVkbC6SY6u/l8o0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DXvoQCtz; arc=none smtp.client-ip=74.125.225.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DXvoQCtz"
Received: by mail-wr2-f35.google.com with SMTP id ffacd0b85a97d-4887635e952so163151f8f.1
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 06:37:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790257071; x=1790861871; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=czECHI0/k3wkyu2UFpcXryFcDXjrvdMhsjt10rPpJ7M=;
        b=DXvoQCtzjEPswEYmU2NQORfOF5rIYZyiv81s+4AMYRsUm9jb96vTqvTomEIWl80seW
         bjBbc+CXuNJ1QwgERGm2bWWbSMf6/vA5CewJKoPH1r/Q7K9Gd6Osae/GW2WJ6jayr1Td
         HkC9jrPePQQRkGSD2zm/R+Czu70/BBG93vsbGvqQ36fv8OvF/p6wgJJZigt2KzSXlOTh
         h8MYAYvhPg30Zw6z2Yw44QYuOsgnE47Qvo11Lvbah3+e5q8iMOODQxK3+jDtIDUGGLKp
         02bFrrG6oRBGvKBLBk/E4YYoJki0r+fEprC+59H9MxfWbgMWblZo3/oD8K9tn/FiHiPb
         b0lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790257071; x=1790861871;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=czECHI0/k3wkyu2UFpcXryFcDXjrvdMhsjt10rPpJ7M=;
        b=2j/Mt77rePmPv2tsjxpULmBqAyeorDy5ICix3POpHZ4bBlEHA5uwFqL1hu7Vw6JYIG
         8Ect3GJpQ/b+NCjhRE2SELLiJfyYFtxPGoVX7gseIlRMlNZw8kFUZKEE68Ou47MgIP60
         L7asMRYnyYkrVQERK8Uym0fPWvUMrAsMxdyNk1eTZGUp7J9FGXJV64+jzev8h57gBpL9
         g6CEAHR0Xs+LAygkLdg9NJX0JIw9HxJ9WjOcKqSn4BUQt8d45dTlcf/A5Gm3QfE7Cbs8
         MePBoxoTAI0jPDgoy2yhEsOLdoUbQvL3kjQ5EodbnwGAUesQHoxBC/20eEwNXCKRS95t
         Nx1Q==
X-Forwarded-Encrypted: i=1; AKwUvByOnJRLcMX12bPJS9/eAWTUP0GluKJc5OV+NEWrtHuxoWIspFv2UyQ6KNjPv987X2CXhtsslwdhccTMNJU=@vger.kernel.org
X-Gm-Message-State: AFuF++lDyQIVWVJ8jmAAhTm8z3usxz4PPQtZfCze60tF/X5Mnh9wxaFn
	2nUi+18NcBZ7vXJAj8X/0ywRdUiwGBav5LR+7KSR8avEscgtTsJmU5n9ZbVCSNiuh+U=
X-Gm-Gg: AYBFou16/fzyBuOM7f/3Y4ROnpnMwI0hdjUFP6mwhXBa5yAjtzgN7VbSvL1en3m9mfk
	t4EqeayoZREpU2lgCiBIUyFixfnDCeVQWQ165Fhtj2b9bXLheGp3CSNTXFMxUD35BKYepQWwdHB
	Giudg0g4Q+/u8lbvKbwwicZYO0qibwR1Td5wRlTZWpFx9HqFTVu9/sHTbFAKfLnr0/wfcxuZ0qr
	E74Erzajcc0SBDT6rSdL8KezyzFt60NuJ0N3Ugjd2hQ5nrHazG4XRIUWElQeh2kKjQA0GIemBeL
	vzXO8DpZQ9DxcLb5N0uuxsMNZXMJZf97PglUj+Sp6UDSnb4cDtETDPGzR5GWnhzZzcF8ZxRlUkY
	5fIK2OsQZjNgJeTwisSwwI5/drLe/U9PWu61TuEHleUK1KUD7dKKsHOqSQ6l/K8+Zy9HrLZoBAh
	dgbLE7X9jBf7/JzDyOSN5A6QTgDUdopLIyynyFVqw9nEHQkZGL7mVhcJO28RS60uASzXk4HL1Vu
	eWESZ6grOfy4zYOsFmrukPXweqn4mqKoJRBDzIMPA891dRJt7RxTQ==
X-Received: by 2002:a05:6000:470e:b0:487:342:eb37 with SMTP id ffacd0b85a97d-488716954e0mr4204794f8f.7.1790257070687;
        Thu, 24 Sep 2026 06:37:50 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:336e:a1a0:8f96:9f7a? ([2a01:e0a:106d:1080:336e:a1a0:8f96:9f7a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-488682673bdsm14741846f8f.2.2026.09.24.06.37.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Sep 2026 06:37:49 -0700 (PDT)
Message-ID: <3aaa9d04-6bf4-46a4-80d7-9828405b7468@linaro.org>
Date: Thu, 24 Sep 2026 15:37:49 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] drm/panel: tdo-tl070wsh30: Remove panel on attach failure
To: Muhammad Bilal <meatuni001@gmail.com>
Cc: jesszhan0024@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 sam@ravnborg.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20260919191524.268810-1-meatuni001@gmail.com>
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
In-Reply-To: <20260919191524.268810-1-meatuni001@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/19/26 21:15, Muhammad Bilal wrote:
> tdo_tl070wsh30_panel_add() calls drm_panel_add() to link the panel
> into the global panel_list before tdo_tl070wsh30_panel_probe() calls
> mipi_dsi_attach(). The panel object itself is allocated with
> devm_drm_panel_alloc(), which only arranges for an automatic
> drm_panel_put() (via devm_add_action_or_reset()) when the DSI device
> is torn down; unlike devm_drm_panel_add(), it does not call
> drm_panel_remove() for you.
> 
> If mipi_dsi_attach() fails, probe() returns the error directly:
> 
> 	return mipi_dsi_attach(dsi);
> 
> Once probe() returns an error, the driver core releases devres
> resources for the device, which drops the allocation's own
> reference. But drm_panel_add() had already taken its own reference
> and linked panel->list into the global panel_list, and nothing
> undoes that. The panel is left registered in panel_list pointing at
> a device that failed to bind, where it can still be found and
> dereferenced by later lookups/iterations such as
> of_drm_find_panel() or find_panel_by_fwnode().
> 
> Call drm_panel_remove() when mipi_dsi_attach() fails, mirroring what
> tdo_tl070wsh30_panel_remove() already does on the normal teardown
> path, and matching the pattern used by other MIPI-DSI panel drivers
> that pair a manual drm_panel_add() with mipi_dsi_attach().
> 
> Fixes: cf40c6600592 ("drm: panel: add TDO tl070wsh30 panel driver")
> Cc: stable@vger.kernel.org
> Signed-off-by: Muhammad Bilal <meatuni001@gmail.com>
> ---
>   drivers/gpu/drm/panel/panel-tdo-tl070wsh30.c | 6 +++++-
>   1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-tdo-tl070wsh30.c b/drivers/gpu/drm/panel/panel-tdo-tl070wsh30.c
> index fa961abdd2d7..32f2dd2bcee7 100644
> --- a/drivers/gpu/drm/panel/panel-tdo-tl070wsh30.c
> +++ b/drivers/gpu/drm/panel/panel-tdo-tl070wsh30.c
> @@ -179,7 +179,11 @@ static int tdo_tl070wsh30_panel_probe(struct mipi_dsi_device *dsi)
>   	if (err < 0)
>   		return err;
>   
> -	return mipi_dsi_attach(dsi);
> +	err = mipi_dsi_attach(dsi);
> +	if (err < 0)
> +		drm_panel_remove(&tdo_tl070wsh30->base);
> +
> +	return err;

Switch to devm_mipi_dsi_attach() instead.

Neil


>   }
>   
>   static void tdo_tl070wsh30_panel_remove(struct mipi_dsi_device *dsi)

