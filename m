Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABADC54B1AE
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 13:39:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788874789; cv=none; b=lBBOIfqZJTgF+rrzJEhCbSMxmTrJwCHOxhhAqfds2p+Apd/n1ilskXDf3k9nxyrsPul2QMgQSFHW6mAv30wfVFF7nAxEettSMYSMRG/AUepxURvYSzMQqScPyMtdieXfOMHc/PZ5tYjUQGnM0OZqruIWyjEQwdvMEb2tRaSkTDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788874789; c=relaxed/simple;
	bh=SdRROXN6EL+lU/WDjj/QcpJ5zvCkzpWhnGb6ShY7qIM=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=LhW+0jMciP0MnjP6hErTE2emyU9Dq4h9RCYzcXElcw6iG2DmY6Y4974GQB2YVaHmj9fEFWBHPUTytpRfLam6RJ9+WLnWMGNOPDwy9EZPZ1eMYnII8RqiqwmX9y0WAfwr95ghEXkNllfySMgxYUysciJ9cVR1pLRx7hUUvbX50/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lPVWZ11z; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lPVWZ11z"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-49b392ccaacso69266255e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 06:39:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1788874777; x=1789479577; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4c1OWqnqeFMUI7UCBm5h3sA/LSJxl6dx6ljBFoOkX0o=;
        b=lPVWZ11zQZDJe5pn2+abBNYQ6mbTzfQv4eSwJ/Y8Z0UPfJG2l1pTY4gnQJbqecxWPH
         RBGpwrKuv4WA4wetU5LpwWKfNX7vphDUNS0j3aAKjj137Wp1I/jC5ieDV9bFJegyF9MN
         l/G/I8DwUX/4Io2VzgaqgofU45Z5ExDrEXcHPXy/uBjzvuXIZe4PR/K7plE6hijoxKMW
         K84UHvqdmWzQmKzOLVKbsoygC2XKnY2EVUnyQ+zidcp4aFl8J6VHq1FwJMJDsv2YLLBg
         JcSmGTuf/UVlvSvwDMxnUyxh6AACvcPWsQHz3irkToDZ4odHRmVRSmPs9tx676aSnJQ4
         YLEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788874777; x=1789479577;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=4c1OWqnqeFMUI7UCBm5h3sA/LSJxl6dx6ljBFoOkX0o=;
        b=hVFkvKvFy3G+bbBw5pDdOhQ8rh7e/DGaj+2pf8jHo+/Uf1s0I8W4h4ANiEB3C8Ow+y
         uXlrlDydMn5bgLEOoAX5wopVDKAHATal7+7KaWApmj+zZfc5xqVQAxL9bdHeNQhQDUM5
         UYnr6SRYWSoyYKpxqa6Z6/jvjCKYiibzICdvvJvMxtD+USZlFrG6rOm9Et2+XADBO0I1
         OGc/uqWmGevLbnAzkrE5Ix0WzYhsi8vMCjUcIJuiN2MWWz3xUftp4ZsHcQOYIVPOFoHF
         qqWkOBoAXMtKv+lygZje4pjYC6qbU5Q2I2t4PF2fsuyHiTqPCefSEnB0ECAHnazOG6Iv
         2zPQ==
X-Forwarded-Encrypted: i=1; AKwUvBwspcevljE6tLfbpuaXOzuHmz9UoVQfKtsh99UdtjUd0FCXHLvE3epHz1yDMK2vMOfjqHHbYs3vSOa5OTs=@vger.kernel.org
X-Gm-Message-State: AFuF++mioKv49Bx/ewRqGUE03yAkKCGPWj2OBXMCPtdE+gkpAn36kAPw
	FEdW19K5kA2y2WMQBJJz2dKtwMnSenbeim1MNZ3jiiKYfwIP5VMrpIA8d2N+X0K+chY=
X-Gm-Gg: AYBFou3DVeOPhKiA6OOq0ohfOeBioWamAQrdMuz8y/1phGBBW0R8d+UeCjTDY8em4M/
	oBOJ5J/IxALm57vuP7AMPNwyl5wNRTbY8Db5rvJ8Zm1Pj8xoDzPHSP97Q3mSdG6NrHXaXAS/DN2
	C7dp9+94NCmmWH53NdISELOpXIbPSihswlEeYozqcbNym3kNQs6UYySgXMOCT9O6h5EqmjOb0B2
	G5Xivw+fAcI7CA6pBmnleZwMAmvkmBkPxEn8dowb4bNIIgnMudSaHy7pmqAvCHNKxJUzXH0EyJX
	hMw4bX5QzUMetIzdrDgjS9bLBWaGOfkANzt6WgIUtHVdJIH1gO1sPMX0XA/7XkrcDrhfXsqSQat
	vC15Tv57kRWi7vwvsORwQiVI2063RaDY+5ySQHUxdBMiNVTR1aBjTszYC8fsmUveWsZ57oihHBC
	KHStfxiqokSREaeQuM+6QpHO+P3cTuCdmaogY9Ct4ZNg5+hTeUWxrt3GPNW0x0X7HiNpF0jW2rE
	W00h/A2OmhJJDoPJQdJDUY4dfvNnalwKtJNSQJqttCtfiFNUjqEyTc=
X-Received: by 2002:a05:600c:358a:b0:49c:dada:30b7 with SMTP id 5b1f17b1804b1-49cf82070famr289134495e9.2.1788874776647;
        Tue, 08 Sep 2026 06:39:36 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:967d:afba:15af:27a2? ([2a01:e0a:106d:1080:967d:afba:15af:27a2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cee7fec25sm559730545e9.13.2026.09.08.06.39.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Sep 2026 06:39:36 -0700 (PDT)
Message-ID: <6cb0a7eb-469c-4cbc-8592-8365d1514c2c@linaro.org>
Date: Tue, 8 Sep 2026 15:39:35 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 1/2] drm/msm/a6xx: Add CX AO Counter registers used for
 a750 GPUs
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar
 <abhinav.kumar@linux.dev>, Jessica Zhang <jesszhan0024@gmail.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20260908-topic-sm8650-gmu-a750-timestamp-reg-v1-0-284880d6e68b@linaro.org>
 <20260908-topic-sm8650-gmu-a750-timestamp-reg-v1-1-284880d6e68b@linaro.org>
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
In-Reply-To: <20260908-topic-sm8650-gmu-a750-timestamp-reg-v1-1-284880d6e68b@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/8/26 15:24, Neil Armstrong wrote:
> The a750 uses the CX AO Counters instead of the GMU_ALWAYS_ON_COUNTER
> register on A6xx and other A7xx GPUs.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>   drivers/gpu/drm/msm/registers/adreno/a6xx_gmu.xml | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/registers/adreno/a6xx_gmu.xml b/drivers/gpu/drm/msm/registers/adreno/a6xx_gmu.xml
> index 33404eb18fd0..3fe7bc3ea93d 100644
> --- a/drivers/gpu/drm/msm/registers/adreno/a6xx_gmu.xml
> +++ b/drivers/gpu/drm/msm/registers/adreno/a6xx_gmu.xml
> @@ -141,6 +141,8 @@ xsi:schemaLocation="https://gitlab.freedesktop.org/freedreno/ rules-fd.xsd">
>   	<reg32 offset="0x1f9f0" name="GMU_BOOT_KMD_LM_HANDSHAKE"/>
>   	<reg32 offset="0x1f957" name="GMU_LLM_GLM_SLEEP_CTRL"/>
>   	<reg32 offset="0x1f958" name="GMU_LLM_GLM_SLEEP_STATUS"/>
> +	<reg32 offset="0x1f880" name="GMU_CX_AO_COUNTER_H" variants="A7XX"/>
> +	<reg32 offset="0x1f881" name="GMU_CX_AO_COUNTER_L" variants="A7XX"/>

It's swapped.... please ignore this patchset I'll send a v2 with the proper offsets

>   	<reg32 offset="0x1f888" name="GMU_ALWAYS_ON_COUNTER_L" variants="A6XX-A7XX"/>
>   	<reg32 offset="0x1f840" name="GMU_ALWAYS_ON_COUNTER_L" variants="A8XX-"/>
>   	<reg32 offset="0x1f889" name="GMU_ALWAYS_ON_COUNTER_H" variants="A6XX-A7XX"/>
> 

Neil

