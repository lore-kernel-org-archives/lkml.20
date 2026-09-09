Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0900356C63C
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 14:29:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788964190; cv=none; b=azDG1Jy2qf2iLX8vFI2JbNp35sw/OMh/KMVaRokd5rtgzS2LqFhcdB+8/BTajmtoDS9Eo3sehEL15FlvfaXjuSP/G/ecesHA0hvCglicRDF2LURFqsjmRccoMQvLXoaj6gKmkksHvjgdWmkGNfu3szp7DUfq5lNNsygkAPppz68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788964190; c=relaxed/simple;
	bh=7oXikdLoYlDEocrDGngKwfbNvhjHm5Q9fVI9S/w2rWI=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=VTbgioBy8iVI1Qhnds8xCp8Wm2R5plR2pHHi3Ymll/SpoHrLtcnVzYWbnkDah/CLwgebIpo6NoyNwFQa+Yt/2dc9hvO6pw2HzzC4wiriyFwhpW9XhRQj7G6L0VYpD50HfEy0MdT4vqiuAoZp57utsd+jjx0dzVy4p33irKFuWZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=G4zSPDLJ; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="G4zSPDLJ"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-49d05d51553so36118285e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 07:29:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1788964187; x=1789568987; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=C32jr23wKiKZjOBE83+EG34E/MZNvRUFhr+gw4T8scA=;
        b=G4zSPDLJv/gJBctwiVutd74HkifWtQF9Kdq3kuWKwh3UiZenxzyRPufikHX8VemFUT
         Fh1L/w9OOIdohr7SVHRD+0cG5PR+14rAsRlXdVbhCuaDvhniHvO8ynqO0wrCKAY5Xtae
         Mr2g5sOEQX8VDzFyzRau6qzts0syXPda87KmbI54KcuaNDGUfDW5wGS/wo5Zf8Tpv5H6
         UbImLRq8O0HMajkQM+9ythIScj+uTVe/ZMJ/DyxNTsoi9UXxFVcaG84yUr+ZyyFMMSIM
         MJ/p58KlXIUaZY5EUpRp9JNBxktt0fqtSwtI3Mph+6KDowL4m9IHGcbuFi1rlCr9DPyh
         GnUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788964187; x=1789568987;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=C32jr23wKiKZjOBE83+EG34E/MZNvRUFhr+gw4T8scA=;
        b=HfprBB6UwAZ6iDSD6yS/c6c5pt+54G6Vo6agZgw8/L6xpCVdJYFtQ/9W89cqN35UaL
         LY/F1I+uDoJbBbbWGvVR5P1JgKYz8Chwfnkj8CF7dCKoXEfcXnBPRUoGg63+0jrgFzQt
         XG7bG0FuECVhF9x4avf8WMLC7DACI88Loxvt0XFYMETsTRi47/jFBWmPXK1b1WCKnzFh
         2kTeQLPPO+SSE7ERbmEKCCmmt/bfY9o1HLf2x428DlXyNrBkL4flw5n+EnqpyTG9nBT+
         FOiRfOglkFEPNMN2hmg7As5s7zPI9q4SYG+PB6TUWFmQpmpcjF1s28CQ6/js6Fda51zH
         Fkqw==
X-Forwarded-Encrypted: i=1; AKwUvByE7Y/tAd4TfKGpq303KHf12RmJoz3Q3Zd1YEEtqUkyZ1oH04qGdYy4xoC3cp27MPS3APRQsJHe3VEVMxI=@vger.kernel.org
X-Gm-Message-State: AFuF++m9h7/jZyVXNWcX30pqL3GCBNCFpgesFT3l9tcS68Qz4AuiiRqk
	S9y/OJjO30c7Y78Rk8dAk2rBNRp/cFrE7phLk2fJTZmqL3x7JxphCShvsbfDTiFbn6w=
X-Gm-Gg: AYBFou1Vd9nG4QmJYYRLdFL5NvMv7tqktwezED7IW10IX/QihZpdmFYogbLOmEyT+tT
	EL8KsVgHm4Jfc/Qw0tX6LpZhSDRRBXJ/0e3EQkcuD3F2wxYx4FjXVbN/s/v55bwPurU0Ktn2xXj
	k9w4tvYRPUlJrATboyepZIci8xDfHBIP+MEzrBAGlFk1/nZpWICQfynugfMi5bK52fNo3PWApKm
	tvlBcHqa9PTWRpzC2yO3n0QPqW4859ug3Z/2TR+8Qbr6FNlIZHmxr6fZE0ufk0fNWg8epE+Ubq7
	BCSitJmBBwVpKk1kPXDi7qkR0m/CNqxjUadN7VxDxcjZIeveXj9agzKfLjofhtG6D8zh5OXvVYp
	Z/6ycs2Vo+V3+ApAgN4zvaOZWDTxwuOUH7U7U8gYDm23sLOCNeyGOw+YXxd2q2qKXJMIqlZnFBe
	UIWcSn0BwLyLlsqvrF1iM2QizeXNxNLwQJLaTTP/lFmCrMA2INm31t8lZbC+QC3zSTGjH0PBwkh
	45WlYsNYJ6CSFdEIA6opu8FNviLvLvNX16bQctNVG2DGpGeronrYg==
X-Received: by 2002:a05:600d:640e:20b0:49c:fc6e:a3e1 with SMTP id 5b1f17b1804b1-49cfc6ea77dmr239864175e9.32.1788964186838;
        Wed, 09 Sep 2026 07:29:46 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:14f1:e0b5:e1a0:a97c? ([2a01:e0a:106d:1080:14f1:e0b5:e1a0:a97c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cf755c22esm481191115e9.0.2026.09.09.07.29.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Sep 2026 07:29:46 -0700 (PDT)
Message-ID: <6763c530-ffb6-4480-9a56-2594bfe8a010@linaro.org>
Date: Wed, 9 Sep 2026 16:29:45 +0200
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
To: Connor Abbott <cwabbott0@gmail.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar
 <abhinav.kumar@linux.dev>, Jessica Zhang <jesszhan0024@gmail.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20260908-topic-sm8650-gmu-a750-timestamp-reg-v1-0-284880d6e68b@linaro.org>
 <20260908-topic-sm8650-gmu-a750-timestamp-reg-v1-2-284880d6e68b@linaro.org>
 <47f0399d-bb31-48bc-b69d-4abd445727b4@oss.qualcomm.com>
 <5bd35343-1bd9-43c6-90f9-d57d67e6d416@linaro.org>
 <CACu1E7Fs-=sKJ07Pcb_7BCTFaXLCMVGEu=yQ6+hfG3Vjc2Y_RQ@mail.gmail.com>
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
In-Reply-To: <CACu1E7Fs-=sKJ07Pcb_7BCTFaXLCMVGEu=yQ6+hfG3Vjc2Y_RQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 9/9/26 15:24, Connor Abbott wrote:
> On Wed, Sep 9, 2026 at 5:32 AM Neil Armstrong <neil.armstrong@linaro.org> wrote:
>>
>> On 9/9/26 11:06, Konrad Dybcio wrote:
>>> On 9/8/26 3:24 PM, Neil Armstrong wrote:
>>>> The a750 uses the CX AO Counters instead of the GMU_ALWAYS_ON_COUNTER
>>>> register on A6xx and other A7xx GPUs, use it when running a A750 GPU.
>>>>
>>>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>>>> ---
>>>>    drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 12 +++++++++---
>>>>    1 file changed, 9 insertions(+), 3 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>>>> index f9de9329dee3..081e79ea4652 100644
>>>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>>>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>>>> @@ -23,9 +23,15 @@ static u64 a6xx_gmu_get_timestamp(struct msm_gpu *gpu)
>>>>       u64 count_hi, count_lo, temp;
>>>>
>>>>       do {
>>>> -            count_hi = gmu_read(&a6xx_gpu->gmu, REG_A6XX_GMU_ALWAYS_ON_COUNTER_H);
>>>> -            count_lo = gmu_read(&a6xx_gpu->gmu, REG_A6XX_GMU_ALWAYS_ON_COUNTER_L);
>>>> -            temp = gmu_read(&a6xx_gpu->gmu, REG_A6XX_GMU_ALWAYS_ON_COUNTER_H);
>>>> +            if (adreno_is_a750_family(adreno_gpu)) {
>>>> +                    count_hi = gmu_read(&a6xx_gpu->gmu, REG_A7XX_GMU_CX_AO_COUNTER_H);
>>>> +                    count_lo = gmu_read(&a6xx_gpu->gmu, REG_A7XX_GMU_CX_AO_COUNTER_L);
>>>> +                    temp = gmu_read(&a6xx_gpu->gmu, REG_A7XX_GMU_CX_AO_COUNTER_H);
>>>
>>> KGSL apparently *writes* the system time to these registers, is that
>>> an idiosyncrasy regarding how the vendor userland drivers then use
>>> this counter?
>>
>> This is a GMU counter, no sure why & how KGSL or freedreno would write anything to it...
> 
> It is writeable. This is part of implementing
> VK_KHR_calibrated_timestamps. The idea is that when the GPU suspends
> and resumes, we keep track of how many ticks it would've taken and
> then pretend to advance the counter by writing the CX counter (after
> powering on CX but before powering on GX which initializes the normal
> GMU counter).
> 
> Note that VK_KHR_calibrated_timestamps worked initially on turnip but
> the tests started failing with v6.19. I haven't bisected yet but my
> guess is CX was never actually collapsing for whatever reason and we
> made it collapse hence breaking the tests. So we probably do need
> this.

OK thanks for the detail! Today it's only used for perfetto, but still
on A750 a different register is used for this purpose.

Neil

> 
> Connor
> 
>>
>>>
>>> Konrad
>>>
>>> P.S. looks like a8xx also has this counter
>>>
>>

