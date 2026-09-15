Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDA56352022
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 08:04:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789459497; cv=none; b=Lebf8OIbXqTHbhAPIfl6MM6EKk7MrLuxKdrbaMQr/wNkgzZEaFHPFfTbxk/j1HVpgv4nlwwX/G7TUmNm1+Y7S8qn0DmqfzH36KkLayWI2/74rpS9AOI1JV6rEEm3i21SMKQQ0vnNgRgg9DXPuZXIFXq7I+3Kgn2plx8NR9zzrEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789459497; c=relaxed/simple;
	bh=0oTshtxPlnqGnJFpFlsNGtOZIMoAHkXNWQJYJcuMq1I=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=F29BeJO31YCYB0tlONKPdrhtuizuQcATP9HWk+WbyTl8n7J/GL7EYmza219InjB28ilExI1k7HkCdwEBPh7SHnC5J+WO6X/6l6/fChNV5ll7IUh3aqh0AvN4fpi24kAFEz9b5wMNXPOwnlxl+TdChbzH37H+9S5K0cmkCf6d9bk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IORpcRNg; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IORpcRNg"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-47ddf7b09e5so4178110f8f.1
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 01:04:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1789459494; x=1790064294; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2kATBR0QOSU9fXXjvSA3WJqKNnMFONEMjfJxwyv31kI=;
        b=IORpcRNgxtnx8AN+BUFfnJwue9pcSmrL/tb4w7ozvyJU5fFPp7MwzK8s+gUHOv7P4V
         s0UhyJqLDu3Yq+1LObcxq3ZgTE62DDHVqN5K59pFmlfNPh1hEgSRM2snCiDyCdLOBr2o
         81G040B1ZIXtuRizAm4Tb7sl50982ghI9Q7L9nYbe38gPVUlUY2IHwxZvFeKV1/GeiIl
         43AkJlgzjMlg/4Xo/RhDCPEbiDMlE5PbeaxBeQHafu8mmx/7LwBLgSFnglHVgn9HRt5L
         nEndo7rMMz4J8jeIejlDQrZi+8vBHljzZcRNm3PWEDOYP5t8EctR/CIncZSkPHF9QcSF
         oWwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789459494; x=1790064294;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=2kATBR0QOSU9fXXjvSA3WJqKNnMFONEMjfJxwyv31kI=;
        b=nXOGMsu1cuSHapI303/BBgynyV54xP3J+gZ5dTyWdbSe6NgCIWst+Bm7ArO5qU7mcQ
         wZWw2KYFYdR6uk1NBL11M8nEtTVny/tVyuQnjCJn8ihUV4kXS+4svJWfYb+QR89aQpsR
         rOGs0slSrhqSS1HI2tZpZ4F2YrN8l18mi+YrdmyaWc1G8WBpELQy+IOUKxMqGQM8+oqH
         nAGD9NH/yhHiMTInopkw2QjzYimNCV6+LopLpJogFlNb5foxBQUmLZ+aNwXo0uzd+JFX
         a1edzUlUqy+zYYKwQG322gWp37THyjaV2zjCwDdT7ol83Wd4itbJe78DSzuuQmqp7KG4
         xKPw==
X-Forwarded-Encrypted: i=1; AKwUvByrw477+dm0L0PDrsxu2uDhViUS1WJOGTX54r7n6S4erAGI+z8VFbsNFDKkwrxFrVA03zoMkTYpfsVuQEw=@vger.kernel.org
X-Gm-Message-State: AFuF++mKh0r+5Z0MEPEu8yVeDNYUo1HfDg4bVKUlm9npmykevCs57a1v
	2Y2uciP5y0tUX/khj2o6XfrHWJrVNa20icOeINaRJtex2GdUPvFkZpenOMkbTQMOYaI=
X-Gm-Gg: AYBFou1ogWKzGEIZiiP51a/ZiqIGcTZnDy8J5PcMnnz7coEBCDD8VyaZdkH46uXWxUk
	HX1d3HsTiMCUTutbe0yWArQVxeRsNeQ3yD1CZ/8VXQWHY/QfPRlpHoQVQ/vexb2TYB3qwnIZsTQ
	fsWFOuv+I6pzRQyWiRHW8dUr0FJwdpm3iBgj0jrgJg/CZPC1f5IuPC4dUMHxapzew/rLPx0tRdG
	zMGs1EG6q3I/bu4LqpCswR+hafDV95Hpijhlof2m7iOiqPF/9W62M5beeKp3Gvou3jtBQCODU01
	j6F6m3yLWtlaENLrJ7UgKWLuqebiOsdLMx4z1Ygqm1PZBB8GV9kTW1/Rz2bZFa2k4pic3ntvY4c
	H9cYz+lbeaSZyOCMKsEBulxO3I72aoarCeg3Ro/tv+t4VRm9jSa4WQ9w0aFfSpxhv1RcZW+5dbG
	hb0HjjhAdOtnPpNJxZHLyGOLePSB3IysOPtqIMKAZrjAwwnbfwyP5S0RW4vFys8Hl1K+tPeLE7I
	6ssup5zIvoIKWb37m4gPZs9x/hCi1mACeiUfTz5D2oAAr7XCIc=
X-Received: by 2002:a05:6000:2c0b:b0:486:e77c:ba4 with SMTP id ffacd0b85a97d-48702b00eddmr6889231f8f.22.1789459493717;
        Tue, 15 Sep 2026 01:04:53 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:ff86:16e:fede:9407? ([2a01:e0a:106d:1080:ff86:16e:fede:9407])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb33ee5csm32961569f8f.20.2026.09.15.01.04.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Sep 2026 01:04:53 -0700 (PDT)
Message-ID: <ad089a64-5708-4ad9-ae82-924cecb23f85@linaro.org>
Date: Tue, 15 Sep 2026 10:04:52 +0200
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
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar
 <abhinav.kumar@linux.dev>, Jessica Zhang <jesszhan0024@gmail.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20260909-topic-sm8650-gmu-a750-timestamp-reg-v2-0-091d74958951@linaro.org>
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
In-Reply-To: <20260909-topic-sm8650-gmu-a750-timestamp-reg-v2-0-091d74958951@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Rob, Akhil,

On 9/9/26 15:07, Neil Armstrong wrote:
> The A750 uses a different counter register as used on the downstream
> driver:
> 
> static u64 gen7_9_0_read_alwayson(struct adreno_device *adreno_dev)
> {
> ...
> 	/* Always use the GMU AO counter when doing a AHB read */
> 	gmu_core_regread(device, GEN7_GMU_CX_AO_COUNTER_HI, &hi);
> 	gmu_core_regread(device, GEN7_GMU_CX_AO_COUNTER_LO, &lo);
> ...
> }
> 
> gen7_reg.h:#define GEN7_GMU_CX_AO_COUNTER_LO		0x1f880
> gen7_reg.h:#define GEN7_GMU_CX_AO_COUNTER_HI		0x1f881
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
> Changes in v2:
> - Fix swapped H/L registers in XML
> - Link to v1: https://patch.msgid.link/20260908-topic-sm8650-gmu-a750-timestamp-reg-v1-0-284880d6e68b@linaro.org

Gentle ping for review

Thanks,
Neil

> 
> ---
> Neil Armstrong (2):
>        drm/msm/a6xx: Add CX AO Counter registers used for a750 GPUs
>        drm/msm/a6xx: Use CX AO Counter register for timestamp on a750 GPUs
> 
>   drivers/gpu/drm/msm/adreno/a6xx_gpu.c             | 12 +++++++++---
>   drivers/gpu/drm/msm/registers/adreno/a6xx_gmu.xml |  2 ++
>   2 files changed, 11 insertions(+), 3 deletions(-)
> ---
> base-commit: df2908090cda368b01ff43709f51890076c56157
> change-id: 20260908-topic-sm8650-gmu-a750-timestamp-reg-2e7575e6279d
> 
> Best regards,
> --
> Neil Armstrong <neil.armstrong@linaro.org>
> 

