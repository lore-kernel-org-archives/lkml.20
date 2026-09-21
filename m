Received: from mail-wr2-f35.google.com (mail-wr2-f35.google.com [74.125.225.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8688146D0A6
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 09:53:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789984409; cv=none; b=iTY19s+ykp7eMxW3QGIhOABTNHifbqxz9BU/n7D7ybdBE98Q/hMBDubb3BptN4LujjAeimyXOOBVdx4fflg8EU+ZGau8rAoj9cYOHWZKQXXD2+7CT5zXG5h+PA70xpp3pUhf0W4YUROtccY+Ik5CmVuJmaFRB6b1Qu7wKAY5/Mg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789984409; c=relaxed/simple;
	bh=PXzXHl6/d5bVoFIIqYQt3bgNTnT7joVzBNSPO0qiPMc=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=Xa06tHMXjjdIaP+ckOXV0ET6Y2usnjhghaTF5xFduiIIA9fwOJf1tliUeFHsH6XOCWNIr3toUu/IktZ08BKP0jw95RWqUuvEJpJs9KOMOH56HWUDRxX3wiibVCgkwaB6mq7rUjSXZJMWmlxqpimY3XxdcSWKeKMKgsYbeObgJ78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MxVx3Tmt; arc=none smtp.client-ip=74.125.225.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MxVx3Tmt"
Received: by mail-wr2-f35.google.com with SMTP id ffacd0b85a97d-4858bc96fabso2207232f8f.3
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 02:53:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1789984406; x=1790589206; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HGGQwgupkqrpkHOpj6oDdQyUFG/UOtLeaAkYO1fiXP8=;
        b=MxVx3TmtDGGRNE7lkzLH5fU+xIgsJ6T59P8AlCrKCLNRtQFjEuEGs3UolDk6WDF3TK
         cOBYN58CK4GwO/PistMcjVyKe46oi6mvk96sbiW2xhUCM3FxbDFscw+SAj4zszRh2Hiw
         dcJaNFpollrzY7bVceJt43XYLrYK6rkAxBGwa56ghxicBE04IPfLYGOzCljy+SlIathi
         wV+g4yUGqL2JEgN7FyzTqtBRIdEeTp2jFD5g3SNdWvRnDCFM6TvwgPM+9h3qO9wSe9+H
         esww17Mrr4xhe6B2rk/X9F1QHO0egrx2Z6c9NVbR+u31XD4tDp2vpNz/v8W6Bh5/xTBK
         eU+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789984406; x=1790589206;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=HGGQwgupkqrpkHOpj6oDdQyUFG/UOtLeaAkYO1fiXP8=;
        b=MJV5GntaqwDNTpnaf26P7L0qfSvicqmiuGgBBR+u+xI0VbjempZUw9prJzK11FBTBh
         suHnH3u0pYEySi7pGi3ytWEDh9RMs2Y3AEfWtzfGxMl19cv/BJJ2T1cn07Hv4tN+XOui
         pJ1tX6e/4gdH16xFhfA6DhzJ6dvnlyvTpiN11Fwaj1HrnGHWIwTdY8TfXYWZ9h5L3fnO
         naX6/yZr0ZnGglj4d5fE9K5kQhY4n2CUPBogGHBWqPsIntfSi6/iEtNaGDf/4hL7U8F0
         wPDnWYQnUmrFLJ5cdIvq/0AS/o9zt9HGCAc1SCL4GJnmbHVp1RnODv2zW5dijFLAKnvo
         PFRA==
X-Forwarded-Encrypted: i=1; AKwUvByr6e8YusYpY1Ie4ptInzEYln1tOYlsNdp18amoH/IFUBm0pDjwELNiA6TZ7+XJuJ/hNUulrOyrRNXSBaE=@vger.kernel.org
X-Gm-Message-State: AFuF++lTdiXvI7TztUbPKMClutK45Pub/mi36clqrmmaJH3XgGCWJ2H5
	IrpqkCm92yPweUtzcZvdvaFmXtllx/RjdQYQMHhCAT8J0eRmx5d6E9NAo5cVXdVMuoc=
X-Gm-Gg: AYBFou2pB/ZBV+Iv2HsFPkOrgKwYmwCm0PqgSzcVZB0I+lhMrz0s+q5Afn7BlcNjUmt
	vlf081VFVz6mJYSeaviGzPa7u40cbzGpYONKD6wJuEzLaDnvIbMb2kvpfk7Qxyes4HuOUJGAelr
	yv+Km5PMD0EA3ciYYEnpxrD9e0T4Wa7r31FuGt5Mfux8iZPmMUTayQRHJJh/OG1kWp0H8SNxYyD
	53eesW9Cl7j4uOIIzuopMrXr4lYtJ/ZAgzPZhBJ0ANO8mAV/DjWugXMU8wlDMMfvkvfcsGkJncY
	yKsprrCo70ETDTaYWZ3dFuKy0mJ/aTk4LuklHX9b4Kj2aYUbefjfLvPBfbGgvj7RvzY8bwZc+lQ
	/jKJwI+GCDv/nfbCBOUvE10rY6UnH8IzfDQcvxXh6pQxb/iOSJVzRi50MgfiDjj03gHQXd6usAg
	IjrGze1IY1vXhrnmNrzJ2n6Y4O6GtbgEgWbHJhV1aHv+sD2aQuij9jLUVRxk1SL3+XQjO9aXE2Z
	WVAd66cfiMCzOjW6wkqosQ0O90HhCUks2GYFMWbKMXJ+0ClMUxxGEiab2OR26Nq
X-Received: by 2002:a05:6000:18a9:b0:486:fe41:804d with SMTP id ffacd0b85a97d-4871e3b6a68mr14522308f8f.47.1789984405602;
        Mon, 21 Sep 2026 02:53:25 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:ddd5:3880:40aa:e4f9? ([2a01:e0a:106d:1080:ddd5:3880:40aa:e4f9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4872459a5d2sm19600201f8f.31.2026.09.21.02.53.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Sep 2026 02:53:25 -0700 (PDT)
Message-ID: <5ce1688b-e903-4503-85a7-cc0432aa6103@linaro.org>
Date: Mon, 21 Sep 2026 11:53:24 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2 0/2] drm/msm/a6xx: use correct timestamp counter on
 A750 GPU
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20260909-topic-sm8650-gmu-a750-timestamp-reg-v2-0-091d74958951@linaro.org>
 <7128505e-c8c9-4d00-96f9-2576ea2a0fda@oss.qualcomm.com>
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
In-Reply-To: <7128505e-c8c9-4d00-96f9-2576ea2a0fda@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/15/26 23:20, Akhil P Oommen wrote:
> 
> 
> On 9/9/2026 6:37 PM, Neil Armstrong wrote:
>> The A750 uses a different counter register as used on the downstream
>> driver:
>>
>> static u64 gen7_9_0_read_alwayson(struct adreno_device *adreno_dev)
>> {
>> ...
>> 	/* Always use the GMU AO counter when doing a AHB read */
>> 	gmu_core_regread(device, GEN7_GMU_CX_AO_COUNTER_HI, &hi);
>> 	gmu_core_regread(device, GEN7_GMU_CX_AO_COUNTER_LO, &lo);
>> ...
>> }
>>
>> gen7_reg.h:#define GEN7_GMU_CX_AO_COUNTER_LO		0x1f880
>> gen7_reg.h:#define GEN7_GMU_CX_AO_COUNTER_HI		0x1f881
>>
>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> 
> Reviewed-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> 
> This is correct. There was a register shuffling in the gmu_cx block in a750 and another shuffling later in gen8 family.
> 
> It is a good idea to review other GMU_CX* register offsets with KGSL. Also, please consider including a fixes tag.

OK thanks,
Neil

> 
> -Akhil.
> 
> 
>> ---
>> Changes in v2:
>> - Fix swapped H/L registers in XML
>> - Link to v1: https://patch.msgid.link/20260908-topic-sm8650-gmu-a750-timestamp-reg-v1-0-284880d6e68b@linaro.org
>>
>> ---
>> Neil Armstrong (2):
>>        drm/msm/a6xx: Add CX AO Counter registers used for a750 GPUs
>>        drm/msm/a6xx: Use CX AO Counter register for timestamp on a750 GPUs
>>
>>   drivers/gpu/drm/msm/adreno/a6xx_gpu.c             | 12 +++++++++---
>>   drivers/gpu/drm/msm/registers/adreno/a6xx_gmu.xml |  2 ++
>>   2 files changed, 11 insertions(+), 3 deletions(-)
>> ---
>> base-commit: df2908090cda368b01ff43709f51890076c56157
>> change-id: 20260908-topic-sm8650-gmu-a750-timestamp-reg-2e7575e6279d
>>
>> Best regards,
>> --
>> Neil Armstrong <neil.armstrong@linaro.org>
> 

