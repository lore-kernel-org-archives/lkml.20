Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79A8041DE11
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 13:27:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790256449; cv=none; b=CTGsr2bnVxEJ6btOdS1peRGsIUTssMknLSj/ZhMiXBw84/lQe81l3RVivLSiOhN3s3w3vHpIqSMs7LC3DBMbG7/ylDtQEozq4rU+Z9U42XDIYHfFN8trkExsXGTQhvPhioep0DKm1XqQccfJZ77kWx3Sh/mc5sSHt25ZfteheKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790256449; c=relaxed/simple;
	bh=IY/IVZ+d9lMPZ1c2n2yTKvRchjsa75lOTKWkfytjpl4=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=vE0x1NZFOyAKlgofFfmwBwYDQq54H2NwqCLO/AEeNYCeyKW4x0iRre4QGTnHB0ET9e7O5nXaM/T73BxKhs8X4ZVTD34+VSp7jbo8edBWw+2+lhfXLYJwjRHbaam/60Bzbsq11S9q5vigTZbK9XVa9yV75Ocq5xBJKT/GEzPoGcw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=k7o5ecNU; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="k7o5ecNU"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e7d2bb404so7275755e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 06:27:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790256444; x=1790861244; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Jfb2GnzFdumBY8sSVQT0iDXZ6nvLBLs0k9mm9TK0BfE=;
        b=k7o5ecNUJtHxg/H3bMdnk/vu8Ux0SZmvdgQRcq6gDgE/ygjLUmqNFxZoUicQRYQNll
         vOgbDazQB8p3BwrLPnEgIO4e6qascGBWcd4VspMnFj+2ZMJtmKCRx9ch1o+CiMfHiCn1
         QVYKHjX7i6NNPRmyNwDR1Xcn0EEzyg1oelGei/+mwjezirZGNER+sNQVz6TS1uV93CcG
         aPV55DB6lcZw9i1nL3hZfQ8CkY+j2WI0qFsKXOKVDSeOueNkQ8JP/QJ1xSF8EyBV/4u0
         KEB0HrPRagUw0xgZKU85hWbUKPsw/bRK3TSisbZnjlzdBo1ZPR1B1uzsUXlLUqbhf4NH
         OB0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790256444; x=1790861244;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Jfb2GnzFdumBY8sSVQT0iDXZ6nvLBLs0k9mm9TK0BfE=;
        b=xx0Zbsi0uF0BJtTm/YWxORRqX8vTj5VVVFArvpX9/5QG1HweowzerNQoMUQLsfie9D
         V1blKmPpEQ9SY61RORrDSt1FBUHpdQdLAnZoeSqZCIvGntGVsWLOE0ApZ59khOr9x8E7
         DX2gmO+63eVjNhU964tKo1ny+cjVU9CKgjOvGJkw9vzATAGqHq7iV8m8h/aAIp/sjPgL
         rdQIx1nF1IsrR3LisxPZRZDvuMHSTrIBKuB6Rqw9cN6TnNi1BIbCZkPdjAKH2TNm6uiW
         zCTJSDusOxjgAQj7ytL6tRgaeBFRxVjCQpTA/YY6faihRMcApuooWwvnt3FDJNb8Ijak
         +5uA==
X-Forwarded-Encrypted: i=1; AKwUvBzTVGQQW4N1nrJjl85y5hymHF8uK85Naf9Nv1O7eMjzrGPrMyYa0eE0rDiS5Y3kwFs6zQ1l7azUQluT5fo=@vger.kernel.org
X-Gm-Message-State: AFuF++kMCUGRMkaF8onoLUVvuYIZk+C2y9SIrXDbtmWM2yycd8pMxGuj
	H0oDo2OdjWmlimFIgp81GsnZVRSU+svMClVrBavIzKsvcj8Wo5AyQKia5p5l4hap4U0=
X-Gm-Gg: AYBFou2coXQc8OTSYId/gESC069O8TSu49Pgn3HeuwGJWnlbryboY8tVt89pRFO0iLE
	sVdxW1KBqohInUQRybmIcfAPXiLjroTWlAd0SGq1GqJwbTUkMmZcvj6xR32AmCnI0/cEG45XE78
	+lrhIo75liGgWglqtEsBti7AUMqmNF1NEkds4ahCbO+iPe0FMoj7N/SykHXjRv2T54SRpb2Re/v
	HdkbR8pkZarFhPxf6YZZ7nHk28mN6PHf5FTX7zLUgLq0V2UyQHlplqtbITWDxPYarB/39m1xECB
	qZDxUMCYWloeX45QmazQfBD2vdJx1s62k3mHv6a50RJftEeAHFcAS7S4RiFf339DL+1vToz9uiz
	t3RJhufbM7nVtfQ45NuL8fXo+myUwyAXUdmvKYnvZ7aICtfk4wPI1otliQzaz4XWqRtrdWbC6V7
	A/LF2Rk2FlEy2Kxcygub9BPjy2FAGQoEkrEv+G6JhcQH/V7UDwBVPRgAr/Y9Mow0sgU12Tdhxs7
	pyZLfkFtdx57Mo9ycfc7GMR3+61cTIda+Ov2nQ3oGmikYX+J/9GHQ==
X-Received: by 2002:a05:600c:3513:b0:49e:6836:5386 with SMTP id 5b1f17b1804b1-49fe66ca6f5mr46789385e9.0.1790256444044;
        Thu, 24 Sep 2026 06:27:24 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:336e:a1a0:8f96:9f7a? ([2a01:e0a:106d:1080:336e:a1a0:8f96:9f7a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe5cbd134sm68870805e9.9.2026.09.24.06.27.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Sep 2026 06:27:23 -0700 (PDT)
Message-ID: <bfbe08b3-2de1-47c3-8436-a4f4013ba844@linaro.org>
Date: Thu, 24 Sep 2026 15:27:22 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 07/11] drm/panel: s6e3ha8: Assert reset GPIO in unprepare
To: david@ixit.cz, Dzmitry Sankouski <dsankouski@gmail.com>,
 Jessica Zhang <jesszhan0024@gmail.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 phone-devel@vger.kernel.org
References: <20260920-crosshatch-panel-v1-0-de6e9512da96@ixit.cz>
 <20260920-crosshatch-panel-v1-7-de6e9512da96@ixit.cz>
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
In-Reply-To: <20260920-crosshatch-panel-v1-7-de6e9512da96@ixit.cz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/20/26 13:05, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> For correct shutdown, the reset should be asserted.
> 
> Assisted-by: LLM
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>   drivers/gpu/drm/panel/panel-samsung-s6e3ha8.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/panel/panel-samsung-s6e3ha8.c b/drivers/gpu/drm/panel/panel-samsung-s6e3ha8.c
> index 99290913de69a..2591b8c1a7753 100644
> --- a/drivers/gpu/drm/panel/panel-samsung-s6e3ha8.c
> +++ b/drivers/gpu/drm/panel/panel-samsung-s6e3ha8.c
> @@ -58,16 +58,17 @@ static int s6e3ha8_get_modes(struct drm_panel *panel,
>   
>   	return drm_connector_helper_get_modes_fixed(connector, priv->desc->mode);
>   }
>   
>   static int s6e3ha8_unprepare(struct drm_panel *panel)
>   {
>   	struct s6e3ha8 *priv = to_s6e3ha8(panel);
>   
> +	gpiod_set_value_cansleep(priv->reset_gpio, 1);
>   	return regulator_bulk_disable(priv->desc->num_supplies, priv->supplies);
>   }
>   
>   static void s6e3ha8_amb577px01_wqhd_reset(struct s6e3ha8 *priv)
>   {
>   	gpiod_set_value_cansleep(priv->reset_gpio, 0);
>   	usleep_range(5000, 6000);
>   	gpiod_set_value_cansleep(priv->reset_gpio, 1);
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil
