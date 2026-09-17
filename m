Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EBD44DE70D
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 12:19:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789647612; cv=none; b=SVQTdtDDhAzfCz3A9Ftxd6ND6vgHpyIqPBe56kuMO3KeTba8c1d4M/PRrZQ4Qo1UJgDhDS0H8ggaV6ewbht/cKEN6waaBjjSXLNfypHpUYb3xOEk3/mTKJWeEbDT276t5rtEbRf27eLcS/eu6/+Q/mD3SYNCPvOge5uNeqSkd4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789647612; c=relaxed/simple;
	bh=BUpmdv3yOABSaaCiExNiD0lkwdJRXVvydhQLoJCt0a4=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=NA3RSgK8Unho4uGzSRFm4lQdA8dGDLRT5c0TkFp8T9ZVxofsCw2VMZMArYE1AdxK+/Cz6rzCmIpv0+rY00J6WrEd4Clu2SCoF+xS7kKF3yiCliD2Enbkbl8NHBZ/qhqhOIEz4AvOdeVaTgo+821O8J99gpYXYOjTlOSv//UjVb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dWHpNKBh; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dWHpNKBh"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912e2406so4039805e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 05:19:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1789647584; x=1790252384; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YWz1IO4gEG1KiaogT+jmIsPzwVgEJdUuS/B+omVUn1A=;
        b=dWHpNKBhGHckTq266MbrnLtOaPJ5IbMlgozG3vwygezPqbPquI+7A1glG3evpIusPn
         RVff95mat7aTMKZwkLk/Q6t0TxwX3fFDIzl3ub+slNQmtJYZebKWp/K7LFGO7hE4k0EC
         77LGvx3mNkG2B/TJMinBEz2RHQkt9Dz14V2wehV5dbSa2wunQLX9MbBIjgoeYPq1ST5J
         jK+X+p/e/J/cJNIsRCZMWLFtQFlQEZvnGsf6iY1BFwRCbqbdCSMNiwSeSiVSZqhSowah
         gAbOZZT9PmJEKjzZvGaEdf5XX1JELrI5sZflX9nngWmDqXpHxyVx50F0eo4kOPZ16Quj
         /09Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789647584; x=1790252384;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=YWz1IO4gEG1KiaogT+jmIsPzwVgEJdUuS/B+omVUn1A=;
        b=OSbSOGoqcYF8ORGWwbbjSIxsS1xq59N3COxx3JuTVL2Tq+rnmh76uBieNikmKpUtXa
         0SVR2MnW9S7qJ5N+hnEYMSz7LiSUxiHWc/oYuBDYroKYfaAXdWxD7r3eQYX5OvI//DG9
         mG6spnESF8s+ag+WOSsBUeCdd4MGvpe4x9sS32+wHm0PO5034QKdPSQk8HfsnQ4b0p42
         Jgw4bkJHP2dDZtWVvaYVg0eDHQj0p9jGYhmn5o+Jv9ebBK095bL6ngM1meXjTSUWqv58
         iFuDNF0Zm5/NPgCLuVS76lipkdgqxf6lOuWxkrfQH7EunPxC3bbxcokBNHngXsNbJgXK
         86+w==
X-Forwarded-Encrypted: i=1; AKwUvBxaIkcol7GuBG6uw/lpU9G6GfWRYa1Pl0pvxjKgBFFTTdQhmQjxWFv4+kdCbzKqg0tvcAFN77aMrB9yaCU=@vger.kernel.org
X-Gm-Message-State: AFuF++l+xH73I8hrQE4G/aHyrxf+lG6iIRYDaCRShDYQGZfCZwSaYFvA
	VTYon2/VPqv4+rXkpbJIfxY/QMDzwEIyGI4uNCK73UdBwPNjEW9COX4D0me+4u6gwYo=
X-Gm-Gg: AYBFou0X3GqZKnjiPU/ZjxpEeroioxRCI61/mMWnYg93qBjKZUfkcvui2tHb3JvLzlH
	34pX6bfah73BoogKua+3I0UuFNlpjqceRW599ay3MWLldCkDQBs4ek+4+TDC3Haca0kW/BCCjZB
	VgCsT6OUs6HZ24F6OWKTi3meK/w7V8vEo4quOdZL6XcGKc4BCnCUOUQwxu6hdkJ+gqYdHOex97F
	OOBBUgzSbRWJ1IAjLvVayNO+nXeIMBud8gQa2BmSq2HCL4DE2bdFcSRgtt2qeUj0Q22JL8pGWN/
	VKERvpGooOYW8LMkfucxjcU56mEoavSk49lF9r/usJFOa829VyfXxnbWgOHdZsF3EGHoOQf4tS4
	gpYWmmwdQFU6qZgECX6E22YS4bWtxRO9swDawtyAkXVPRfeDgpGI/n7R8OOOH3Co58qTbxzcvfb
	yOf/6SqhRk2VYGeIsNAoeCyqxz4EtY5pGAMUVZFzFAMa/R73kY8Kieg3wOacFNxOQRlDZ+k+Igv
	jY738b554csFOgAaLL650oFrhFx918Gq4rW4ZYslcluXbv+wk2BlA==
X-Received: by 2002:a05:600c:4f14:b0:49c:f13e:e4d with SMTP id 5b1f17b1804b1-49fbd51fc62mr44068345e9.10.1789647583958;
        Thu, 17 Sep 2026 05:19:43 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:b5f0:971e:8fd2:f1c9? ([2a01:e0a:106d:1080:b5f0:971e:8fd2:f1c9])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fbd24a6basm75812395e9.12.2026.09.17.05.19.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Sep 2026 05:19:43 -0700 (PDT)
Message-ID: <95577e52-918d-4346-a5c2-f3e73e730959@linaro.org>
Date: Thu, 17 Sep 2026 14:19:43 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] soc: qcom: geni-se: ignore invalid PROG_RAM_DEPTH when
 checking for firmware size
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260917-topic-sm8x50-i2c-hub-fw-ram-v1-1-f49286d8c8db@linaro.org>
 <0c4ee857-d8b7-4bd1-a74b-6618b45d4be2@oss.qualcomm.com>
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
In-Reply-To: <0c4ee857-d8b7-4bd1-a74b-6618b45d4be2@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/17/26 11:21, Konrad Dybcio wrote:
> On 9/17/26 11:07 AM, Neil Armstrong wrote:
>> The I2C Hub serial elements lacks DMA, so the SE_HW_PARAM_2 register which
>> is in the DMA register space doesn't exist for those instances.
>>
>> Simply ignore the ram depth if it return 0.
>>
>> Fixes: 522bfb4f33c0 ("soc: qcom: geni-se: Use HW PROG_RAM_DEPTH to validate firmware size")
>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>> ---
>>   drivers/soc/qcom/qcom-geni-se.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/soc/qcom/qcom-geni-se.c b/drivers/soc/qcom/qcom-geni-se.c
>> index 873bfbd6b2b7..e75349f2c15d 100644
>> --- a/drivers/soc/qcom/qcom-geni-se.c
>> +++ b/drivers/soc/qcom/qcom-geni-se.c
>> @@ -1308,7 +1308,7 @@ static struct se_fw_hdr *geni_find_protocol_fw(struct geni_se *se, const struct
>>   
>>   		prog_ram_depth = FIELD_GET(PROG_RAM_DEPTH_MSK,
>>   					   readl_relaxed(se->base + SE_HW_PARAM_2));
>> -		if (fw_size >= prog_ram_depth) {
>> +		if (prog_ram_depth && fw_size >= prog_ram_depth) {
>>   			dev_err(dev, "Firmware size (%u) exceeds RAM size (%u)\n",
>>   				fw_size, prog_ram_depth);
> 
> The RAM size on 8650's i2c master hub SEs is 1020 registers (correct,
> not 1024) - Viken, would that be true for all implementations?

Seems to be right for 8650, if all HUB Ses have 1020 I'll prepare
a v2 with the prog_ram_depth in the se_desc

Thanks,
Neil

> 
> Konrad

