Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1396A448B8E
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 08:24:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791447853; cv=none; b=Fdk7EFRKpw4YIsQqcvviXCZeT2FCbBkqxP+z/0dJ03lZHjW/bb+X95/Vn+RHlgi6yXdkMFgAEwchkP8tvFeCE1kNrOuHWl6RPnghFsZuXFOtVF/KhRHaNFP11mk6+OO8Odf9ZDPqKyGE9iEVOJa/WZ30Wcnl3faO4tNXeYzjZmE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791447853; c=relaxed/simple;
	bh=lcJ2Jx4jRzbxqtaMyX7nQoruuHUG1mlcWlaJ6b9elOg=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=bwkgcbzD3b6Kc/PfloI1Ihr/fM9P0iep1Wh202agR5ThE57NO9NsolGo9DE13kf8N0UjBW8zIEnULep/AW/TFA/PYjqXzQT8XKUzSQkz/IVuum3cfsRrJCA5SHqbOCrU6z62Rf3vjwv91/1+uo2gzL2iCBOtosBnm19Z73KBbKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KMbOlnlM; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KMbOlnlM"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a02753c04fso15121495e9.3
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 01:24:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1791447850; x=1792052650; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mBycP8p7SGKiJlPKrsQosdM3WVmZLo/n5T15mL/kfEI=;
        b=KMbOlnlMz3uZqltzx8s9CQzyZOi1O+BNCclB+BGKxG+TeMQXhWIUPPGlpaCsBqLCL5
         X+VrtHIcboHSguXCZsV+RouMBDY83CgIhrUDHP5iVRHpPnC7Lpu03G/IDB+5lzRCHhII
         TowT+vd2083gH2CqqlbVZEPCJFpJlNex5FeFkWP4AHf/YF3z4ZGdzrj2V26UFSI5lCqj
         iuEcNm7GVPvrNsgUsEUYtQbZf1AlsRxlo4MS7+fhHw/3xtFwgYirAMlx+2vuMMXSxezl
         OrHk2aoHySn8nh92vFmA2Zc0q8JnaPSpoPYLcB7RZUVdmrG0NsTp23fHEujGGd3nSgBH
         taeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791447850; x=1792052650;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=mBycP8p7SGKiJlPKrsQosdM3WVmZLo/n5T15mL/kfEI=;
        b=dhgNQ5tgcBqnbAgh8BPkoWTVTrD4RiZucYBPqzyhhCWnWPqqkb+GW3XY8OzYN6iFqt
         PzCV2FnnT2Bh/Dip9Fk17aSggulErU67oUNyku6vK9OSbLQKtHJDrSuHOO9qSRLgejYA
         K/Oi5FbFhxFZIepgXlGRsQsVCgbgIEVLhXVBscWcnfw48t/XsVaSN/HW3YpX/+kzoDXI
         kEqk90qad0uxfNxCWo3+wcF+F5xQ3w7oD8Snxn48HKy5Hwwevtgpl1ovqCp8Y6iaVZ2A
         IPsbM7zK6qXgz6GNxrKIHAo5G+S0oNOvzIUJD04MyGPq7mFqOC6+3OfUWltd0Horeo2r
         soig==
X-Forwarded-Encrypted: i=1; AKwUvBw6el4jnrXJD8W71XzoftvWfTIwmVtZGgwNl65QO1xvB+Sva1Z+o0kDc//leRCZzMKAqlImjU7pogaDRfA=@vger.kernel.org
X-Gm-Message-State: AFuF++nx/82Brt0EtnZ95NCkUXmxfO8vn9AmnvkAbMWLX5BPpuF2cgF4
	8irfz3UlWujnd8s6m819Wdl7LdG7EDpPueyFJrUPv9vPMhTSPo5obFjZB1KZA39pW5Feaoe+KqT
	mU0zHHKU6+Q==
X-Gm-Gg: AYBFou1etKSPXHGOFK/7OIePRiFS4pBQllMg8O/3n8ejONfGYka9Ey7+85X2vgYE/fV
	xKDmEwmWXhlOoqKVH7N8bghEGR27BclegPMI52HmzsZXu9C16Wu9+cki+o7ePMGtGeFP5GDG2wT
	PfuKGoGxs9epGnJjBemQ8lk74WaB8OaSr89bB1+x5DBY2AsUfhUcBOoTQZHLTpJOgbY5VUGSS5I
	OJxn7BcbNa+FY7FSu+OZHbb/1QkRjHj1RXpr1uQ5YFRr7EMJnEhl/yFVPOOPzqY5DyQ+liFFx2b
	v1+AGfVS+g0fifnNVXPnpcG6MvhM/eM9bT7bT1o6XBs82zv4e1QNXds3xyW3PLmrfJcfzc6gDPM
	64NJjvvEa+RScqRAqp++DAPL3nvaCOIsKljuFqvLtrJkEyLrlGRsBv0FUy3B9qOEuE5lkL/Z4R2
	V3HmqXPAfqc3+SCM1/NGqIi06eyjltUnDcJBl1lMgSD793/UrR3714MhxMWznbXIVkP6mD2nr3H
	QKrcAlZkJU/VWkalsJz74yv/vsCZHI=
X-Received: by 2002:a05:600c:8b18:b0:49c:fa21:e749 with SMTP id 5b1f17b1804b1-4a180455775mr77142395e9.31.1791447850014;
        Thu, 08 Oct 2026 01:24:10 -0700 (PDT)
Received: from [192.168.151.76] (90-182-211-1.rcp.o2.cz. [90.182.211.1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48c71b786d8sm9975943f8f.0.2026.10.08.01.24.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Oct 2026 01:24:09 -0700 (PDT)
Message-ID: <51fec579-a74a-4bfd-8b5d-2e7308405211@linaro.org>
Date: Thu, 8 Oct 2026 10:24:08 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 1/4] drm/panel: st7703: set prepare_prev_first
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
 <20261007201859.3709656-2-marc-olivier.champagne@savoirfairelinux.com>
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
In-Reply-To: <20261007201859.3709656-2-marc-olivier.champagne@savoirfairelinux.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/7/26 22:18, Marc-Olivier Champagne wrote:
> The DSI host must be enabled for the panel to be initialized in
> prepare(). Set the prepare_prev_first flag to guarantee this.
> 
> Suggested-by: Hugo Villeneuve <hvilleneuve@dimonoff.com>
> Signed-off-by: Marc-Olivier Champagne <marc-olivier.champagne@savoirfairelinux.com>
> ---
>   drivers/gpu/drm/panel/panel-sitronix-st7703.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/gpu/drm/panel/panel-sitronix-st7703.c b/drivers/gpu/drm/panel/panel-sitronix-st7703.c
> index 70f7282471e6..368c57591817 100644
> --- a/drivers/gpu/drm/panel/panel-sitronix-st7703.c
> +++ b/drivers/gpu/drm/panel/panel-sitronix-st7703.c
> @@ -973,6 +973,8 @@ static int st7703_probe(struct mipi_dsi_device *dsi)
>   	if (ret < 0)
>   		return dev_err_probe(&dsi->dev, ret, "Failed to get orientation\n");
>   
> +	ctx->panel.prepare_prev_first = true;
> +
>   	ret = drm_panel_of_backlight(&ctx->panel);
>   	if (ret)
>   		return ret;

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil
