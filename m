Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 106DF3F1AC6
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 09:32:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788946358; cv=none; b=SsfdMBSBobbLQ+Y4chTpaIC0dzCKZA7h1ZuzGB3GXBwEel6I4hMX2/0i4LlGuL22Hso6YcxZPkznEa0XsjosBhY1DO6cLhyv+FNrSdWQnqdhEN6liRUgVTJT0Hls6PCx57g+NEgGKu+eeTlhuPQaZnKw+s15MBWXEFj7CsZ05oQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788946358; c=relaxed/simple;
	bh=90UuAAkLCdH21lgVdH/mZSVMe6f0qL49N1SsKkZ74vs=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=dW4ijnio9P4Z17jFy5LPP9S46a9D+QUJeSeNKrk7FFTLxOLoRRnr/jXmN5ruSZz0OyFfgtEIOMrw2e3kLcI+vBmg1LJ2bxrOJaHIWRqk+zbZ0kCR/vV3/YTJ54Tw6Qc/0aGtENjwbkJsE8cZKn/kaNhHkuYSLIzQKsV5Faxi6b4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mfaq+Ykb; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mfaq+Ykb"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-49cdc81f40eso40575435e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 02:32:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1788946338; x=1789551138; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qtG69rbhI5dj5FSdbtZU04DqnJ+za1Yd8VMlYpZeS9Q=;
        b=mfaq+YkbzlvAClwHLeIfQfRDDQr9LrFL8z+V0GoaDRzDKYYUdXjs12KQjnBUyqzFVc
         yloj51pEo5ljiiQ+Ue6GwUqt8GFHbvkdJ1PBGSSx2HJG4Q0XqhtRxU2oj7YXY7X9Kc8o
         BLBi+C0Vg0pMV2oK6FMkz1cAGkktH0muoDBaXRPUvcQi2XYxyJChhAgxZONZCuMmC5Ai
         FsjIxvuv/fgH8wDJn4J2mZbvR+vyBqEDR/OizfKlZCBKnC0l1d+RXoQWJhnSyMcskXZk
         zWRn/6wApHTgUs3NJtJ4h/QAbjSXblhEgQYIxXL6WHxUz4YXpSTgDLjCrOVvwKih9SFD
         CWJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788946338; x=1789551138;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=qtG69rbhI5dj5FSdbtZU04DqnJ+za1Yd8VMlYpZeS9Q=;
        b=VKt93Y9DGRCSms4NPkMA19yAl15gXR5itsNQMsuAQs+ufJKbRb2Kg5IlNeX/nRVh0y
         MAA46BUcOi02ufPRYQlC/pGuezjQw7CIibvDqIpQRTjAnF88A0MAf93n94vBDIFryjk0
         p2As+WikL9S7QpVxSjOUpJ1MAyeoliig+bPpdaSPe4niuvTvGcS1mgAo9Uro9zzpYxqG
         jB0dq7KW8WcgYkwY51p59c5+oOqSGG+R69g+nN0kJjWahVhUoDmvvASotjyIcdnIScng
         2RGOC1G94VsFva1KyYbKFcpvuWuLO7yLyQ6bSxvrCqoU65iydMpTijqKny2CnbAM68Z5
         6jvg==
X-Forwarded-Encrypted: i=1; AKwUvBzql03PPWyjKUA9b5Im1Vp6BZRXh2Zcm5iHpVvOIbUt3nw69UuZft6HHniFbTsZOTMbEzgT+aIdPrDl1/w=@vger.kernel.org
X-Gm-Message-State: AFuF++nDnhu5i1XkrIJ2BPWoU5a0StDbzaK8Mjo2V96vvfyWFI7zr8T6
	tWaKBNV5RO8C70hGuSKgKyCLWf2djdK0NiQ7i3wgPhqp+TrcMUrA9vdgtPJ2+aH3Ing=
X-Gm-Gg: AYBFou1wZ+uXK/WySOMGtRecMtXSYK7LyaI5oAygVerkd3U3uFOAxkxmJa4LMuRhYHd
	bZqYLRN8JSMCqMQRIY/CQr+9REkB4Nxdit/wP/UL+bbEPIbX9oX7LsRj6Q69rpuHMcf5ptPizus
	jVnNPMVkCvuhixo4zLfLcLpAfOzMjr2d9c5/t4y4qbuidcMMt1CaM+XlwBRs/ABg4tqaYpxKtqu
	mGZxZryMw64AerbpMPTfRoiUiW+PgDI5DkX6Krv4otWfo7GvlWpeZEg5ilnCFwJFgwZKGmYRazb
	chOPHcQJ/lRTlvIQNRIgvAi9eNvWHJohRlppeho03vScOY+5c+TnqvN3Mj7xvNaece8FNZO8nV1
	ZsKv2H85dZfoGiQk+k/99frnRIr7gWiCYx/Lm0yusimQPI6bQBKDuyWvkHjBqK/N8J8yq/RKvYt
	KG2BjtaYUCcf48+Eqmqo7UwxGJdvWyKL1iFkMK7jVVn2zqtQHgU14bD8LhKqyK7d/ANsMK3wZWD
	R1zMEXMCZ0O6vKqydGtEemOOZMEfe90hso2lidoh4y9e01MkQnVDa93sC4zJ8hR2A==
X-Received: by 2002:a05:600c:4712:b0:499:7a15:fcec with SMTP id 5b1f17b1804b1-49cf8248cd3mr570725515e9.13.1788946337959;
        Wed, 09 Sep 2026 02:32:17 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:14f1:e0b5:e1a0:a97c? ([2a01:e0a:106d:1080:14f1:e0b5:e1a0:a97c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cf75cd8d0sm431347165e9.2.2026.09.09.02.32.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Sep 2026 02:32:15 -0700 (PDT)
Message-ID: <5bd35343-1bd9-43c6-90f9-d57d67e6d416@linaro.org>
Date: Wed, 9 Sep 2026 11:32:13 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 2/2] drm/msm/a6xx: Use CX AO Counter register for
 timestamp on a750 GPUs
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar
 <abhinav.kumar@linux.dev>, Jessica Zhang <jesszhan0024@gmail.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20260908-topic-sm8650-gmu-a750-timestamp-reg-v1-0-284880d6e68b@linaro.org>
 <20260908-topic-sm8650-gmu-a750-timestamp-reg-v1-2-284880d6e68b@linaro.org>
 <47f0399d-bb31-48bc-b69d-4abd445727b4@oss.qualcomm.com>
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
In-Reply-To: <47f0399d-bb31-48bc-b69d-4abd445727b4@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/9/26 11:06, Konrad Dybcio wrote:
> On 9/8/26 3:24 PM, Neil Armstrong wrote:
>> The a750 uses the CX AO Counters instead of the GMU_ALWAYS_ON_COUNTER
>> register on A6xx and other A7xx GPUs, use it when running a A750 GPU.
>>
>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>> ---
>>   drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 12 +++++++++---
>>   1 file changed, 9 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>> index f9de9329dee3..081e79ea4652 100644
>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>> @@ -23,9 +23,15 @@ static u64 a6xx_gmu_get_timestamp(struct msm_gpu *gpu)
>>   	u64 count_hi, count_lo, temp;
>>   
>>   	do {
>> -		count_hi = gmu_read(&a6xx_gpu->gmu, REG_A6XX_GMU_ALWAYS_ON_COUNTER_H);
>> -		count_lo = gmu_read(&a6xx_gpu->gmu, REG_A6XX_GMU_ALWAYS_ON_COUNTER_L);
>> -		temp = gmu_read(&a6xx_gpu->gmu, REG_A6XX_GMU_ALWAYS_ON_COUNTER_H);
>> +		if (adreno_is_a750_family(adreno_gpu)) {
>> +			count_hi = gmu_read(&a6xx_gpu->gmu, REG_A7XX_GMU_CX_AO_COUNTER_H);
>> +			count_lo = gmu_read(&a6xx_gpu->gmu, REG_A7XX_GMU_CX_AO_COUNTER_L);
>> +			temp = gmu_read(&a6xx_gpu->gmu, REG_A7XX_GMU_CX_AO_COUNTER_H);
> 
> KGSL apparently *writes* the system time to these registers, is that
> an idiosyncrasy regarding how the vendor userland drivers then use
> this counter?

This is a GMU counter, no sure why & how KGSL or freedreno would write anything to it...

> 
> Konrad
> 
> P.S. looks like a8xx also has this counter
> 

