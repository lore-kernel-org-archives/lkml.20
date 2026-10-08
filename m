Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A0B14A4EE2
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 13:40:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791466824; cv=none; b=RsuXh8mwtNch9mdRAqKCafgldpdjmIFmO5DvpXrUj5q92jOvqpOCm72N32BZKVtcWJSLuvJKcJXCVJksYePcgubBaa0TFUcUkxBENwQuEI9+hjqevb7vmwUwzeazk6vs/VhjQJynFcw85p28M23OFmR3Iu0Giu5txTnb7Ta3FlI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791466824; c=relaxed/simple;
	bh=f2BMn5ioidRbzaI9E7/OdDgcAuxIkLaGENNPV91/nzA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ujtTUqlA+PBftG/Gq7XQdEpeWs9Iz0Odrr5pqpLqyQ4VP9at7SWYtOT5f6v0HjIcvPfpyjuazPiDSoY/uc0XGpEgbcs8LzTkXAmJFs5nIDeY7Ta3rxwmAFaBWSO5fkwdXpVB3TKsvV7VuO1LLQ0brdo0+7TP/Zh4zbJIOBARe8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SWO5fmKC; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SWO5fmKC"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c2e36c3478aso776607766b.0
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 06:40:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1791466821; x=1792071621; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=H80w9zSBz9R1ag4qx1WlJa+f5FQwYUpOAtTkVEPPBz8=;
        b=SWO5fmKCmSLDhFQF3sd/3422TlorOnWb9ykBI+z9dv2ig1oPq3sTWowNKRGppqTmNs
         O/7og0AlHUMbFZhZPqSbBfgj0z8dlfxFBYPftcND2SoD8ZAWGRtL3FUNZ0Fmme+xQO0Z
         gUDZ02501Z2I86NvjGzw2E8OTZLHAIb6aVTHMTCKeh1GQdYii6mHzbm1mCa/b/WyPBHh
         71EqwQgoXlw0ul2vzs19JWU176kCLTCfA6u98tVUYHsPNiznhyO8brB5gM8kNYurfGqE
         xi7oguad1hs8Bs/pGWG9uWq46kidx0DT7Fh2YuM+Gdy+3jduRqLv/iqcdpTOu1ZrZ8jR
         MXJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791466821; x=1792071621;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=H80w9zSBz9R1ag4qx1WlJa+f5FQwYUpOAtTkVEPPBz8=;
        b=nbX2tjEwOTfiDQBFL0gc3Gl745nsR6+Ns5ligTzj6ogyJ6Vd/QfKqlE52DRiul8wiw
         PrtMT91I05PwrShgRbCV/voSoYTfBH1C1eMOffY3WbbQ4TjsjPtMbQEXKZRsmiSztM+C
         NPAZiGS41biwHn6rTxYRlR21ovUzw1fhJqT261K6pTEHH7BCM6ZzYUYkag0ZvqGLLknh
         epSWnQd79rRdXORcTTul/uBidbHA4dE8rtMltRTY6MWmBqSWg1fUvJkzOnmtPVcmrsde
         jVmH8ZGNbA1eeRkE5yu9vAAZFrwm3foHE93U//gUY3W27EeFvTVOl984kjRXX9Puhxel
         s3KA==
X-Forwarded-Encrypted: i=1; AKwUvBzQfg0SW9wKttt1/JcQFGwvnidzplx1CxySfhZeDqi0KIJ6eVbOusptx5jdHKHwgbwEWQf0tDtbUpCh1VA=@vger.kernel.org
X-Gm-Message-State: AFuF++mOAya9gNvkfJLHhpWuj8gZydh0r8e7cwr+We/Js5see1y0lOrU
	fT46GAzJp9TdaVQhKwsjgSwEkl2m9zawq0P1u92xKp8uBMVGnR6gXgrQliEmd9hBvf4=
X-Gm-Gg: AYBFou0TP0Ub1Md8xvNjt4WbbKHHOVRkYBM8/9w9D9A7IIp1GiYWmr+cF6k8Wyy8sv+
	R57odMlG4g9R2CZs5p0LwIuz+hIu6DQymGGmQEVZsAb/+l4j4w4rDznMc/dbyU/p3U2lxMsjCDY
	0a28AbYqZ76XIOqsR23kfWcXfAfmBVTqmp6Kt+hbH70etM9MI/Lq0daFjSibWIRYUaKcys+1cpd
	Sz/63D3l5Pk9SlDFJC9so8k2FrZJSZsKN9J/PBI0aSmfYz7n373JLDw2lALSdn4zTEzsFQbEEGh
	ChrOW3pLnVEyAQl/4Uibo0Hu9thz3wnl1YQ+tT3U2sPKLvLWr9OFR4s6fOXW5dWhEeM4SKadu13
	gbrtEKkVWS27OeCJ90A/ct6O7BF2wZuy6ftuijrPjuJjKh0CAC4O/Ri8t0e30wSBp8IRZtRa6uI
	0yyaUm+8Z9gnowkF3Enu+1lCn7MgqRI7kEGB5USxrB2jbko6nvIDV8kTAIwrcSWmIXfhBxBzwtF
	xlT/I513e9pbdGzOfm5NRo=
X-Received: by 2002:a17:907:9810:b0:c29:4513:f6fd with SMTP id a640c23a62f3a-c317c0bbdebmr565259066b.35.1791466821244;
        Thu, 08 Oct 2026 06:40:21 -0700 (PDT)
Received: from [192.168.0.167] ([109.77.203.235])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b00aa482e9sm1524264a12.31.2026.10.08.06.40.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Oct 2026 06:40:20 -0700 (PDT)
Message-ID: <c0d8ff20-ee5a-48b2-8cb4-3a837077e192@linaro.org>
Date: Thu, 8 Oct 2026 14:40:19 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 58/74] media: uapi: Add CAMSS ISP statistics definition
To: "Gjorgji Rosikopulos (Consultant)"
 <gjorgji.rosikopulos@oss.qualcomm.com>, bod@kernel.org,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
 Daniel Scally <dan.scally@ideasonboard.com>, Keke Li <keke.li@amlogic.com>,
 Richard Acayan <mailingradian@gmail.com>, Hans Verkuil
 <hverkuil@kernel.org>, Gjorgji Rosikopulos <quic_grosikop@quicinc.com>,
 Radoslav Tsvetkov <quic_rtsvetko@quicinc.com>, Robert Foss
 <rfoss@kernel.org>, Milen Mitkov <quic_mmitkov@quicinc.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261005-linux-mainline-7-2-sm8650-hdk-rfc-0-v1-0-ed985aefd611@kernel.org>
 <20261005-linux-mainline-7-2-sm8650-hdk-rfc-0-v1-58-ed985aefd611@kernel.org>
 <7cec7156-e85b-42e0-857a-e590b9e252b2@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <7cec7156-e85b-42e0-857a-e590b9e252b2@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 08/10/2026 12:23, Gjorgji Rosikopulos (Consultant) wrote:
>> +/* Number of bins in a Bayer histogram. */
>> +#define CAMSS_STATS_BHIST_BINS	1024
>> +
>> +/**
>> + * struct camss_stats_bhist - Bayer histogram
>> + *
>> + * Histogram of the luma of each 2x2 Bayer quad inside the histogram's region,
>> + * over CAMSS_STATS_BHIST_BINS equal bins spanning its input range. Quads
>> + * whose luma falls outside the input range are not counted.
>> + *
>> + * @header: block header; @header.type = CAMSS_STATS_AEC_BHIST
>> + * @bins:   number of quads per bin
>> + */
>> +struct camss_stats_bhist {
>> +	struct v4l2_isp_block_header header;
> I think that the whole format is not correct, having header is preventing address alignment
> of the buffer for the stats, as i have mentioned in the next patch copying the statistics
> on each frame is not correct, just to have generic statistics format in userspace.

Err no I'll disagree with you there.

Since we are introducing stats on the qcom side we get to be the first - 
or close to first - system to implement extensible self-describing stats 
which is the mirror to the params.

Extensible stats lands in 7.3 so IMO there's no reason not to use it.

Also I think its kind of a crap design to have extensible params but not 
extensible stats.

It should be all or nothing. I don't see a gigantic problem in copying 
in data and then looking at how to accommodate dma straight into the 
stats output with block alignments later.

The extensible header facilitates next-hopping anyway so userspace 
shouldn't have to change once we DMA to the aligned regions.

Also if that is not supported by extensible stats then it _should_ be 
supported by extensible stats - i.e. it should be possible to DMA 
directly into the output buffer and pad the blocks as much as you need.

---
bod
