Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793625775;
	b=D13MjwY+nqlN+C4Oq4yKCcoDkVSLhzJ1QT5GzRSHEifiQkisq2ynWy6+N2u6bBZXrBvL
	 JON5iR19FPUCaSAEBM3D3x0raTxHx+ijvjXGz94Ic4RchmaQ82hqTUYae8+5hBvXjmhFw
	 GXUdIr3t0gFsfJgnyJRnZeMk0zBpLeZjwPUIF6WkaOY/0m0hNP1/PK31m6GgGZrg6jsSX
	 b49wQFDPxgtNxE1qqrCn9mvjQmEXOnRMnh4SiV3xPKvtQgL/olxecsCyWCEHbDvVS6SaX
	 I8xdTXvKn2DJgOVBqX2ccqacZ6wp0BCTcAKChM/oZJWO5iPyB8Ga5qiIWlN4UOBPC5w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793625775;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:From:Reply-To:Subject:To:Cc:
	 References:Content-Language:Autocrypt:Organization:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=tOUwoJJ2xHQgVFDnHDlORcv3rq2tKQISQ2U/UtTWQ6E=;
	b=34J3hh9gsqaK95ML9Xbo94WyXizpI/MHB2hDFY1QonawIUF7yrKgJm+8H4dKRT1IA2tJ
	 tk2tjGv7/9TCh/bP0LRej0R+69jJCEorRAOcsZa3SWC0AjfCUs7/oeqZzjSDg/d7JMTfs
	 e5aR7VY6liGats+cwjfKqtjaXYvD3fDBY7wgXfIL97yBDEfJy1YUryoiTaIzCffduI9y9
	 7jSyb+PvDCaq9LJ3lnK3CP7cL4gE6WRf2cUjngGrE6REUMnPMa5nI9YfoPdXSmf5MoECp
	 +7FYIAmH0TZus8GPIcyGLgC3oTMKJvYy41QGjpmmddNsbuImfPkyjEq6g/RRLZO9c5Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b="A/VAmHu3";
	arc=none smtp.remote-ip=209.85.221.54
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E581E606A329
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 13:22:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E581E606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=A/VAmHu3
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-48e10a70540so1671346f8f.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 05:22:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793625773; x=1794230573; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tOUwoJJ2xHQgVFDnHDlORcv3rq2tKQISQ2U/UtTWQ6E=;
        b=A/VAmHu3lU2LSY/R9EliSoPwYWs/3Rw3Zg4pL21allQ32gj3bNHbB/Ue9iVMJtEftM
         LoEa6hyzUPUyKiWsV5tpqoPl7cq2YnDzmHyCchIC2ROEmBZUdW3lp/vvjLhJCRFqiR70
         W+yLV/YwVUKCuoErorE10SxEvKQZ4eEI/et5177eGWxez6xroPANlZsqx19sP6hfKJeG
         VX3l8J9y1keBAv0vdlTw3xVLwwN36rbuV7gRKuEcLQlWQmUtVRgR9ymRX36ylKoE9IcY
         8asa2mbfDlU5Qz5EbiF60DiF9d5CxZU/HJr8MCU4Ci+aQRY+JxvA2/5ttTrFNClU57ci
         g7vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793625773; x=1794230573;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=tOUwoJJ2xHQgVFDnHDlORcv3rq2tKQISQ2U/UtTWQ6E=;
        b=c2ES5b+NGggptXcde+XRlBWbYawLDUYyrkxLM5cMFpVSG3r4QjoT5le8YjzulgOwJ6
         LMnZel4BT2hUzQZTaPPIPn6wSkVMuum0MkIs9MDpdgq6KAVfX11dLEV+u4pwQQoPWnOw
         KadGZ0LHyPDcwW9ko2RF9d2VfaQ4A8iB8aoBLTI84k4rS11epHyu6Bn3FPvd08LzPUO3
         qxUyUCbb57qNK3tM7mQq53fgE68yG2Hp0HlUKAhO64N2eC+riV5PIeowgNSe7Mvx2ZO5
         42Qj6KDpoluWJ11a6j31suGB8epqtKqP+fJR3wYFwwYdx5x6NT+rkHL1qZD7rdUWzSt9
         NW5Q==
X-Forwarded-Encrypted: i=1; AKwUvBxqd5bURHa+Yve1raY2nX4O3A2KMcqLluS8ca9K6kuxvfGI+mRgUPA8frbIuFe1+ZkWnIoNhBu+2EMOtNU=@vger.kernel.org
X-Gm-Message-State: APuU4Z+KAy1lWtraCvMJAOdmCIEWm8+BDMGMuWrJEP7O9l+vEd6VytlU
	sAHWBs36hvgf57g857NpM93S0rtn5dH0N7IU+/DwT8To3n6fCz+Ti9gn5MVc7Hq8uyM=
X-Gm-Gg: AYBFou10jVS9Jpp6hv+MQdLi1yL6iG0rcXwthG7Tl/N0zX08koKL+lwO+pD7hiYRmhU
	ToD5qOstBdfLnVfauQE0PfzAOirIc7VMwh56iUqom26a3IAIwvqvadJwD2G6Lqk+7+NC7Ij0bFb
	Vq58HBiWVEU6NlhsUSNwvq1MH/0kbx1BX+lUtWWnXQMTnjCuSOsNVcyt7eKq3uKooNJl3leYlfu
	d2kXUEqdY+Cq+Dd1K+V5Qw3mZkq6cCTkxmZV903Ny7BumC04rk6ZqAo6sy2BRmEGbiRnN9AizQm
	rFevUJdIu6BhLAhzRqoHZH1/I3v8dNWoVJKjHNd02cWe/soMJSSGhrrltCecMfvDbMMz7UPh8uc
	Jd0+OJFHjkQrhH0dPB1OVtN2bbxQ6lTavpPiz+SBK+wjNM/M66NvNIXVs5jSATnowPgDfq9psOE
	LjjbAajB2CXAAWfBx5UI44cu3qOc74gflcyBvirl7wkvSDZ2bFwNYuK/6FRh3wk0uWI2tmMKK/A
	SDsem/5TKx5zAFdJB4Ib1gD3CMf9Wn96y08DIJK9z0klUry9emKqcduL1l3+X9GdoFrWsVSCq4N
	Aqvsbnh+Ysczl64UncZ3AQXiKY/PDXRK2c9Bun0KEL6vNDdTSpTo9zCfB/Xe8XZvpxWPWmsY7wA
	J8cyQLcEwl2Fruo+f3bIR7Sn6USU=
X-Received: by 2002:a5d:6f0b:0:b0:48e:f14:61bd with SMTP id ffacd0b85a97d-48e6e2f6772mr23661360f8f.14.1793625772934;
        Mon, 02 Nov 2026 05:22:52 -0800 (PST)
Received: from ?IPV6:2a01:e0a:106d:1080:9476:5165:3a16:262? ([2a01:e0a:106d:1080:9476:5165:3a16:262])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b728ddsm19859094f8f.9.2026.11.02.05.22.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 05:22:52 -0800 (PST)
Message-ID: <07adb06a-5760-40fd-9c67-b562bbd72ad6@linaro.org>
Date: Mon, 2 Nov 2026 14:22:51 +0100
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
Subject: Re: [PATCH v3 4/9] drm/panel: novatek-nt36672a: Set driver name to
 novatek for consistency
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
 <20261011-nt36672a-panels-v3-4-9ea238627f8a@minlexx.ru>
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
In-Reply-To: <20261011-nt36672a-panels-v3-4-9ea238627f8a@minlexx.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/11/26 13:54, Alexey Minnekhanov wrote:
> Since this driver should represent not only devices manufactured by
> Tianma Micro-electronics, but also from other companies, it makes more
> sense to name it according to what driver file name already is: novatek.
> 
> This does not change neither module file name nor Kconfig symbol, only
> driver identification in dmesg. This makes it possible to e.g. grep
> dmesg for "novatek" and get messages from both nt36672a-based panel and
> Novatek touchscreen.
> 
> Reviewed-by: David Heidelberg <david@ixit.cz>
> Signed-off-by: Alexey Minnekhanov <alexeymin@minlexx.ru>
> ---
>   drivers/gpu/drm/panel/panel-novatek-nt36672a.c | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-novatek-nt36672a.c b/drivers/gpu/drm/panel/panel-novatek-nt36672a.c
> index 464d9ce47d87d..73bec4f47ec60 100644
> --- a/drivers/gpu/drm/panel/panel-novatek-nt36672a.c
> +++ b/drivers/gpu/drm/panel/panel-novatek-nt36672a.c
> @@ -479,16 +479,16 @@ static void nt36672a_panel_remove(struct mipi_dsi_device *dsi)
>   	drm_panel_remove(&pinfo->base);
>   }
>   
> -static const struct of_device_id tianma_fhd_video_of_match[] = {
> +static const struct of_device_id panel_nt36672a_match[] = {
>   	{ .compatible = "tianma,fhd-video", .data = &tianma_fhd_video_panel_desc },
>   	{ },
>   };
> -MODULE_DEVICE_TABLE(of, tianma_fhd_video_of_match);
> +MODULE_DEVICE_TABLE(of, panel_nt36672a_match);
>   
>   static struct mipi_dsi_driver nt36672a_panel_driver = {
>   	.driver = {
> -		.name = "panel-tianma-nt36672a",
> -		.of_match_table = tianma_fhd_video_of_match,
> +		.name = "panel-novatek-nt36672a",
> +		.of_match_table = panel_nt36672a_match,
>   	},
>   	.probe = nt36672a_panel_probe,
>   	.remove = nt36672a_panel_remove,
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil
