Received: from mail-wr2-f34.google.com (mail-wr2-f34.google.com [74.125.225.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F2561B652E
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 14:02:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790949755; cv=none; b=cn3XSWsmTV1qq+fSgGgj/3YWoJLTWdWgoLcbcxPRx0EMms2+swsv8MFmEpv+Px5CDuCrPzJ5fGhpe7/RCvyTlb+TejsdjgkabLE939kMrYwsHdoXj+mpParz1xtzSlRzACJXowxgP4cd5zkYvQZotu/BHmUBuDUTUOnKKdxg4dg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790949755; c=relaxed/simple;
	bh=ya/7HZIUS2P76+MVLBOL/856vdgFTqKa0oQKpvBI7M0=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=iZyGHIjRaht8wYYFI71EJaBXe1GafSiRDE8+aauALGf7rDRlpSoN72xCyzefztr4K6XHrBqNIv0K9JoaZhnxJ7UuhOCWnbzSlnGGwmzb9B1ZuLsAGFRDQjif7cDGLn1rUAibS1MKHjc49JCm+V4xabLx+vTgjQDwohINjoF5Oak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ArL0vRDi; arc=none smtp.client-ip=74.125.225.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ArL0vRDi"
Received: by mail-wr2-f34.google.com with SMTP id ffacd0b85a97d-48afe3b2383so2459891f8f.1
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 07:02:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790949752; x=1791554552; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qb3iCujopSE8wIGt0Gx78GxDd4scP1isaUjBiUrVvNQ=;
        b=ArL0vRDifEYvGtSbv/7ZYJ8+BDeBgbdxr2lqu0V3EfkWh+6W6PyaAChDbJrmd62+gO
         zJPVhOQ+6UZPU8QhWv1pyaBurbePqwT365/DtpLv37l55NSe7NDuLY4P03N39hv/kFKM
         ZpoLB17UgEdJPOankomixVTbnyEfKHbFZom8MRZJfcZnBymzcs45VOZ7Jlr1C7UVUZ+G
         wbcluy4Zti1QBhqlxSFmwjLTyCDcn/QUYyaiGbcm8SjjPW2SuuHFnG2b/rlSwHBACzrf
         DQKBNSX85YX3qwwOn2kJ5v745W3AA6cy3qmWnqjQTphZ9r8S1KKLdR7FEmDyF8KabWfh
         BJvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790949752; x=1791554552;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=qb3iCujopSE8wIGt0Gx78GxDd4scP1isaUjBiUrVvNQ=;
        b=pta+MkIFs12bKiPLZpM9bNDL7vuGpK2x3p3Pp+ZIm4IbEfwufrLk4GPBnz5yaWFESu
         3qwlgn2zaR5oxdBuvRvZ2DJ3UoGPBaqDbyro0KojwTeIhf+77ePyxi+XNyzskWdlLXuE
         W5GA92D75iJuwETt51Rst8bCn6rSf7pVEKgoanahPx2qvabTf0NUJN1C7gaaNwyzxd8N
         lLZXBUak/TS6We63zvmbQRmbgt5dRe7MGQfTYkeZhFNad1ofGs6SwhfMZA5Cpc36PYMY
         Yr0XTbW6bvCHgyNzDXRaEPP2wPHMgU63B7Ho79pDK36A5zBLF4EYdnzk4AAqAdlN+Jk4
         mmVQ==
X-Forwarded-Encrypted: i=1; AKwUvBwXA+9fwCljx8S1qeWG2hMi5D1+gjEdAgvfWg7p0TTlZgl6dOj1QYtpcufV8NRaOxAgUJOqcdGShbJpmu4=@vger.kernel.org
X-Gm-Message-State: AFq9FYIGiBHYXr/xa383a399i0vyEweQQu4u42YTfpJb+X3BpV+juBlT
	ZoFRHfKBHXkSKIJh46jFdJJAQxCsa90+pPENOl7RGYL7XDW+ZihzcksPuzfhvqFJH98=
X-Gm-Gg: AYBFou08kly/XdfCz2icOHR2a0eSsgzVIiQD8RO+SyWLK03x1V5uC4ia9S3EDqAMqye
	AWj3A/CUj8klItTtl7KaJ42cIXfo7BGo7GJjOkDrSS197BUZ0PLNMf256lwaiPqE+A+z30nz14P
	jE6YUCy9ZyZ2rMztD1He3H0+/rRUq1wRGWPw1J8R3MUJbSb/ryDfMe9+/ORdydLhI+TBRQKPDip
	QxEq0sGNwGJ/IH8ZovWa8tzOawmkdnlKjkzqob+dvC+sGXPm2gjP5Se4/UeXux4aNKzRYm1O3gf
	fR7X5XdGn8p3ZAr4aEjhKq9Acipw/gyBmMaQLvlo2ih+lTewmoqhUq5X+T670XTX7RCay2O9n6d
	Q1rpb5EglJwTj4hI435irdZC4mW4okjgUqakN1zPLzjmQl7+FrrXXY8OG/8Ki5aRkPSkjq/W02m
	5NNvM3crEUi4X33MO2WRg0mN8PgbwjedsHRxg3hyPuWaKNsKxqrVmjCPFKl0LOcO7IrmwAIivsB
	ezhSOhNNCZti9gRT4E5sEkNzGFzB42jWRSQK2s231hLg6QcMrM=
X-Received: by 2002:a05:6000:2287:b0:48a:f354:aefe with SMTP id ffacd0b85a97d-48b1274facdmr5552169f8f.39.1790949751982;
        Fri, 02 Oct 2026 07:02:31 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:2f62:6d3:721b:8c9e? ([2a01:e0a:106d:1080:2f62:6d3:721b:8c9e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b38105239sm8006009f8f.33.2026.10.02.07.02.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Oct 2026 07:02:31 -0700 (PDT)
Message-ID: <e37d41db-5218-494e-96fe-bbf4e028763e@linaro.org>
Date: Fri, 2 Oct 2026 16:02:30 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] drm/panel-simple: take i2c adapter module reference
To: Johan Hovold <johan@kernel.org>, Jessica Zhang <jesszhan0024@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20260716132334.1565183-1-johan@kernel.org>
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
In-Reply-To: <20260716132334.1565183-1-johan@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/16/26 15:23, Johan Hovold wrote:
> The i2c subsystem currently blocks during adapter deregistration
> whenever there are consumers holding a reference.
> 
> Switch to using of_get_i2c_adapter_by_node() which also takes a
> reference to the adapter module so that an attempt to unload the module
> while in use fails gracefully instead of blocking uninterruptibly.
> 
> Signed-off-by: Johan Hovold <johan@kernel.org>
> ---
>   drivers/gpu/drm/panel/panel-simple.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
> index c09bf3db5e78..f58e83aa4ebe 100644
> --- a/drivers/gpu/drm/panel/panel-simple.c
> +++ b/drivers/gpu/drm/panel/panel-simple.c
> @@ -701,7 +701,7 @@ static struct panel_simple *panel_simple_probe(struct device *dev)
>   
>   	ddc = of_parse_phandle(dev->of_node, "ddc-i2c-bus", 0);
>   	if (ddc) {
> -		panel->ddc = of_find_i2c_adapter_by_node(ddc);
> +		panel->ddc = of_get_i2c_adapter_by_node(ddc);
>   		of_node_put(ddc);
>   
>   		if (!panel->ddc)
> @@ -746,7 +746,7 @@ static struct panel_simple *panel_simple_probe(struct device *dev)
>   	pm_runtime_disable(dev);
>   free_ddc:
>   	if (panel->ddc)
> -		put_device(&panel->ddc->dev);
> +		i2c_put_adapter(panel->ddc);
>   
>   	return ERR_PTR(err);
>   }
> @@ -791,7 +791,7 @@ static void panel_simple_remove(struct device *dev)
>   	pm_runtime_dont_use_autosuspend(dev);
>   	pm_runtime_disable(dev);
>   	if (panel->ddc)
> -		put_device(&panel->ddc->dev);
> +		i2c_put_adapter(panel->ddc);
>   }
>   
>   static const struct drm_display_mode ampire_am_1280800n3tzqw_t00h_mode = {

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil
