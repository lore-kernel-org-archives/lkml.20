Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 022C747A898
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 13:32:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790256741; cv=none; b=C8/CCC7jhVYMIQvmxdBSz9T5pBGGU5YBiBsp3uvLzBm2gu2HZ033IzTuy81nri8sdN8qFqIxzZTYOKEw1ThC7hZN/m94V+0GMhvWesCZQSY4aRpyI/W009A4JLx4fTkJgdIZY4rSXfX5kdB5yLDwDThr88i/31NxkqHGq9jtH78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790256741; c=relaxed/simple;
	bh=fr9RxllbuuvUiYfvgXQ45JoP4nvW3wrZ51yI8K7VT4w=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=ttP3CxFRvp2Cg3oT7BqRVyJX/KWAbeZw3D4Jw+HXwUEnHdaBziFB0dUmUm48TMQfdL1Y6qDARX6vpM9btJ5xngk/xrxDst3OSG+CYov6DOSeLwLk/Tm3AP+2qhl4c057047SJKSKqNttYwUZjuaBUiRRyLqZQU73REubQP7qxls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=A/a4yed4; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="A/a4yed4"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912d3931so15947045e9.3
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 06:32:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790256732; x=1790861532; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/Oz3plDiKZZCia6T0UyGOKiCd1d6w6OxiQiVqDt00Z8=;
        b=A/a4yed4zg1dMMxN+9moEBVVU8kEyNsjOXk+obsLQoiGRwHD19M8CNVHAzeusiWaCe
         6A/6vumAe51e+x+DSBx2M5o0LVoI0vcXkc/hJTUTiDZqTjUGPLFbzAG5uluRbcd8g6BO
         +JRvDijPtgI+BdT7tbBP6+gCfFmWeq8C30BP8Mn4n9E6G5AoqzKVsWHpuii5EBMD+BKt
         LJUd4ZE7oCHkK+7Za5KqUiLdcPP/YqYpRxa/UnZzMC7yRTBejWSdlH6J9w0IY/zoZnro
         bZnABnwHEWuZB2V/HhZ/cZpiMvV9NcdcyiENroSbw+ZRV4JpCBRR+oKd0UN4oFARxR/K
         QYkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790256732; x=1790861532;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=/Oz3plDiKZZCia6T0UyGOKiCd1d6w6OxiQiVqDt00Z8=;
        b=1mg/FYOPMn7uOUQv/J88gKjcg4dJR1MvzExWZbAjr9R2GVsVIZRRTMve96LbvXDABw
         GLnytMOf5SXpK9ny1phxALlWWyd5ow0aZp44d5bshWJ//RCdudlZHv/PzakE6rioQhk9
         hf6TRy6W7yf2W+ktwJnYxRipQObwIKE1gJzsjj7cyOaUxv9x31gGwEBBN+9SWZJP3Fe5
         aQ4D6haN93KQOMHwOP7ueCXNPUx1A/GIaUSZHkW4VcljAMQLAFgVvQVwkBLR7pvbcN+h
         NOarSBgAnoN3hghid9XoI+Yi5zO0nuYKAld9DhIzpW1R21T5ot6Ou8Q2UyuIT5HXR9RB
         id0Q==
X-Forwarded-Encrypted: i=1; AKwUvBwbOWWColaMjoo51C8ixn49ARDvaCkuGj4zsLDwQUMJ1Wq5UR9TCGeeA3TXIyz3cdQXRLPXSCl29n6gOno=@vger.kernel.org
X-Gm-Message-State: AFuF++nAXfcFqajxqGvQEeTSs4rH/ezQWLxArJdtpygcGaTqkgtsEcp7
	vqICU0pexsKXK/Yea41l5w1eKptHn+U5FIpHGnCbXV7UkMMNMvBu/HYMzHEQUBoFxoc=
X-Gm-Gg: AYBFou2tWGIKW1qPIB4v5C+1jThJ04Q9je90kr331CLcqxgT21G8fsH9nWqc3UxmVFj
	1qVh0L2LfqzQUd+HMHvLIimra60NevkW+ZauYx+mecOb8NJ3ODROlK/cUNKXLmXsRFgduRNqhCE
	UX0BbiWr9xWvafqEzioeUSG5h3zVxFWCUa4zxzFyNzzhrzOHLr1xsGXkiQyDEMGi4x1bgsg0Tt2
	0/q58kOC6QGrr7qsyWauyCPnjwwKK6J92umwxr2oTY5BerCuAlvdShtE+jyNrKygIyCM+hXksdO
	EPG1GGilGEcHdG6yk+x4iSiajYnpxXN6vdk3fj8ECBB0yOEytPTMiA3jhqAmzIxofBKR8SyKUT6
	KfStFQA5Q4pvWxCdWy6A9ZkAKbV1ubVK10BO8nK1LzpXzfiMB2w7+kLASTsB73ZGwk4+A11u+28
	N7jTiA9jqBMK8uL/0xSUo2PVGD2PEMQISXfBnbNtHiXh/C0ZaFwv5sAj/pDzIpEXf1CodJBXwZ4
	5bFxhq9YSM5m+ugRDlZ0mU8w3BKbPDgJPgPuHeCKoQT/iCbK8eEFA==
X-Received: by 2002:a05:600c:1d1c:b0:49c:eb16:9fd with SMTP id 5b1f17b1804b1-49fe66c9ae3mr43287325e9.3.1790256731984;
        Thu, 24 Sep 2026 06:32:11 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:336e:a1a0:8f96:9f7a? ([2a01:e0a:106d:1080:336e:a1a0:8f96:9f7a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe5ce4941sm66794335e9.6.2026.09.24.06.32.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Sep 2026 06:32:11 -0700 (PDT)
Message-ID: <42dea883-cbbf-4835-b8f0-b27a016ec339@linaro.org>
Date: Thu, 24 Sep 2026 15:32:10 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v4 3/3] MAINTAINERS: Add myself and Ryan Brue as
 maintainers of NT51021 panel driver
To: Nickolay Goppen <setotau@mainlining.org>,
 Jessica Zhang <jesszhan0024@gmail.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Ryan Brue <ryanbrue.dev@gmail.com>,
 Alexey Minnekhanov <alexeymin@minlexx.ru>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20260917-qcom-novatek-nt51021-panels-v4-0-30afbc35d70c@mainlining.org>
 <20260917-qcom-novatek-nt51021-panels-v4-3-30afbc35d70c@mainlining.org>
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
In-Reply-To: <20260917-qcom-novatek-nt51021-panels-v4-3-30afbc35d70c@mainlining.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/17/26 14:51, Nickolay Goppen wrote:
> Signed-off-by: Nickolay Goppen <setotau@mainlining.org>
> ---
>   MAINTAINERS | 7 +++++++
>   1 file changed, 7 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 7291238bc09f..743c785b4558 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -8354,6 +8354,13 @@ S:	Maintained
>   F:	Documentation/devicetree/bindings/display/panel/novatek,nt37801.yaml
>   F:	drivers/gpu/drm/panel/panel-novatek-nt37801.c
>   
> +DRM DRIVER FOR NOVATEK NT51021 PANELS
> +M:	Ryan Brue <ryanbrue.dev@gmail.com>
> +M:	Nickolay Goppen <setotau@mainlining.org>
> +S:	Maintained
> +F:	Documentation/devicetree/bindings/display/panel/novatek,nt51021.yaml
> +F:	drivers/gpu/drm/panel/panel-novatek-nt51021.c
> +
>   DRM DRIVER FOR NVIDIA GEFORCE/QUADRO GPUS
>   M:	Lyude Paul <lyude@redhat.com>
>   M:	Danilo Krummrich <dakr@kernel.org>
> 

Send again with a commit message.

Neil
