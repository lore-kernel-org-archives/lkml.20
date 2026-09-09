Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23A4E38239B
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 18:31:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788978713; cv=none; b=kfA5eTGzzXYPzCthiYQr90sp67SExox8uptvvdmqSyPdgbMcXhZvYiJTSTWl+EZX/o79R6gQSpj7bzqrCTDPqqZ9QiPHE8FEhc3s3ti0s4PQfp+6PPAArkJ9YhnELakCACSWlaIRSdYtaDkkkdPnyWH0Qr4zHDwR5hOE5bVVl3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788978713; c=relaxed/simple;
	bh=vQ6QaBvh093yCWK6Tmxa06AQzPcC4W//98V+sdlJIKc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=J0/x/Y8tgie1MpW5ondPLI49qslOJcTxuu65PnmFQWeUjLmkrZzoJSEcSJM/mFnyqkx4mPnTcALNGWdcNU8FK6jyA5Ra9pogExyn0N9H19RG/uNOrJGIC5eC3jkT4iD04COTjO3A0NXYEUdvs25KkrVQKOacT7IlcvBuBAOUoIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pfj3G4Ib; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bBTHakF1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pfj3G4Ib";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bBTHakF1"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 689H7dvb3133901
	for <linux-kernel@vger.kernel.org>; Wed, 9 Sep 2026 18:31:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DYCA1Sf/sCKR4WUaiBuPo9s4vAkj0GrzntRClJ3GrEQ=; b=pfj3G4Ib/DbZ9Qdt
	fyg/ZtxFpqiewRzCKI9FxlewKlMs3QgmP1lwZ3KJCfzqUsbaCPkMsJ6LibVdvR2F
	7aTQrHaH8UjyafyiZMM7vpqkAuWvhdrZIdNJBsj3NHf20sSemLoyblHm0XHjJ3cL
	HhE1TkPn02GK+6MYNfkV82aonK7+DarfqhQb6slARvAKNwcKc0b81IvC3eW+GuYe
	nnVArfeuivql23+S1X9AlW2K7sKV3gEuiCzieuu9vqLRx+yqfcjUdk4R+rHo3Q7S
	8niYfAGeBv04hmxpv3jbFvoK4QurXGXH2xTzPkZAOXrG3B0sA1x8yzzXOby5J5em
	35wIVQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gk5ru29ax-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 18:31:50 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-395543dc382so1924956a91.0
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 11:31:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788978710; x=1789583510; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DYCA1Sf/sCKR4WUaiBuPo9s4vAkj0GrzntRClJ3GrEQ=;
        b=bBTHakF1aUiICK0mDs7Qygb61DzWbQKvs6FjIIW21z935mTvAwGBo/+SxOqufJCCTS
         Fhxw4n6gDAJ+WfA2ouV6rG4GCc5PCcLNUvZhuyb8axg8Z0wPNM6xQihkchMWaxVcZWdd
         px4GsK9Z/ctUUt0XPPDrJT+Q0iDFu9UzCKg7iJxfX78YL/oa7W+u2Vy72piilSDtkVqc
         Q4r+04mpfmzEPq8uy0tiqr5JK/ozmOI1rmygEBC9o9jfnuji6UoDruRRaK/RZ16Nd8rx
         6yj93j3WC6tHxnWQcpxyy9xRx3QD6hnmDpNM6ZBfVK+nrgkX0sEBA6u2OkIW3dKqxOP1
         pD/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788978710; x=1789583510;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DYCA1Sf/sCKR4WUaiBuPo9s4vAkj0GrzntRClJ3GrEQ=;
        b=cYBApHr2kwjF8agk+iHQ+5SBjMFagWlm7UYRC66IFDZ7g6H3K/iG5QoffOogfQJN7t
         aFzpZjFyU5aMlkyKetw9/wdWordmdcCPoFHZLDIHvL8k3u/sC6IPBVVxsdEerFtcSfWh
         u7Ul2AAvVV/NGssVDGJ6faxNmuY6pEhmTcSzVFxswWlf+nvt3ZWwsLQoOQpOelwH3+4p
         4eNGBaEmJc9D/J6gdfr4Mg6sjOLU/a7Lw+72xbs9JKkMRefjwraGJPdqWfMHmX1pbD3b
         r+0KgMynXVPixKddCDiKX+oDKbk/GOBVDZHeX62ZWf8sl1XoZ4xK+xAUZ9UaqOVyEx3t
         eVvw==
X-Forwarded-Encrypted: i=1; AKwUvByNa9Yq6PwOX5K+dPAvowwXt6rSBaZlftSbJZHhChouVzBnHHwfeEnOQ5sIhtVwWNkY9Nkh375oQ6VrxN4=@vger.kernel.org
X-Gm-Message-State: AFuF++mrMYKCRuVRCplVVjUNbWVUdWdxbMnSy20yWBZPM8IUAin6nKcj
	q0BQ6eZ0RfmyBb8SYvWd6zf9j9Uqduie1kimpn0qroCWBBV5ffKZiHrlmYj274PqHPVGwKEiL1Z
	d76tINWkZoeacuFE+mJo0EDklsU0o0bQxCD5PgFye9x9uxoRwj8zfYOWFfjH8a9A5ino=
X-Gm-Gg: AYBFou2V9U6z02dSrtvpeXDhBIVM5PSdBD1ChS6KFrfuUS9KjmpjkntMZwKFaGqfvTy
	QcCSfmyDdc0IdH014HmUhIpVwi49H74mU68ed1aYYMbFsbsSdr453+G5qocgTkq8EbzDRWaUxwc
	DD/fk9gJ5vCvcCVYHMG4g+PojQDL/UNF20idAoqhAQM5mIkpzeLNoqmpyFGKBoAriyWIdcQDiIx
	TAd9X66dT1aJxx2V61s/SK9NSqyVNgtDak1/qVAput6/6vOtwpb+qU/hfRhG7FZvKKx8uZe9Rul
	meWQOi2o/fmG9ZosYQrBzMpDgsp+0QeVJFJ2F6y8I/oOb5qb0u6XL04LiKvn7Z2OGcHrfDCWnlM
	YUS5qRzqTj5INWADc0yCURXIM
X-Received: by 2002:a17:90a:d406:b0:395:4de5:1054 with SMTP id 98e67ed59e1d1-39d70b4e3bfmr3896738a91.16.1788978709769;
        Wed, 09 Sep 2026 11:31:49 -0700 (PDT)
X-Received: by 2002:a17:90a:d406:b0:395:4de5:1054 with SMTP id 98e67ed59e1d1-39d70b4e3bfmr3896632a91.16.1788978709223;
        Wed, 09 Sep 2026 11:31:49 -0700 (PDT)
Received: from [10.204.104.211] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14324410092sm42858991c88.14.2026.09.09.11.31.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Sep 2026 11:31:48 -0700 (PDT)
Message-ID: <33be46a9-207d-4f0d-b3e8-18adb8197a57@oss.qualcomm.com>
Date: Thu, 10 Sep 2026 00:01:41 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm/msm/a6xx: Use CX AO Counter register for
 timestamp on a750 GPUs
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
References: <20260908-topic-sm8650-gmu-a750-timestamp-reg-v1-0-284880d6e68b@linaro.org>
 <20260908-topic-sm8650-gmu-a750-timestamp-reg-v1-2-284880d6e68b@linaro.org>
Content-Language: en-US
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
In-Reply-To: <20260908-topic-sm8650-gmu-a750-timestamp-reg-v1-2-284880d6e68b@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=M+997Sws c=1 sm=1 tr=0 ts=6aa1a616 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=KKAkSRfTAAAA:8 a=ubtBxe2QYwUAodWgXbcA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: PD9mpfRftFs93MW-c7BptlHKzWk9d6Zi
X-Proofpoint-ORIG-GUID: PD9mpfRftFs93MW-c7BptlHKzWk9d6Zi
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDIwNyBTYWx0ZWRfX4+4t49azPflP
 Gk4tMf2tmUIg9gT9S1z9Q7zfqwD/A5B8TTGsWd80PzoqH4fCaj/HFlJuLkAT0sm9Cg8D4+x67ry
 4qMonCjxrTvPhA502wNJBxQMMBld9Jg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDIwNyBTYWx0ZWRfX/IHeHs2+N7IK
 75y/mTe8L6UCdWfR48+/8NQdbniXPXtgl2rawPYaOW7Ju9U2ZbgOZqGw9DESqCfGkh0tkogA/FI
 k+X1U4h5AUABuB3sKQIHPrAudeFjDFvr06J0J5fAoUwijGx+gekDgxdY6Y0jVfvdxWH+G5G4BAu
 K2Bvx54kiAr3F/km5MmVgvpX7XmOwIuc7qb/2FOWVP6c/L2zwYEVXBm+qt0NxAZS8kgpGL8Zm+x
 0OoEyy9oBc4wn3hBICHfEyIkm07oEz1TXoQdlFo73c9G/OK59SjGq61tvWkFiFXa5iOLQ7Yl8b0
 cLD9GpZrlbeii5wmP7Tc8yxQst58bLKIC5YzZJgPMAlK4QWWOZ/smyZAbgP1m/n3vKfjpDroEB/
 HXoYbVMP9nuPX6u5nY5zPuRRbAxjcWWmG5zve6IcG+mNoa3lCnKpYJZg6XTE5nwmcE3j+NdSOvo
 iHZBjwrY5LV+mFYSOaQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 spamscore=0 phishscore=0 impostorscore=0
 lowpriorityscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609090207



On 9/8/2026 6:54 PM, Neil Armstrong wrote:
> The a750 uses the CX AO Counters instead of the GMU_ALWAYS_ON_COUNTER
> register on A6xx and other A7xx GPUs, use it when running a A750 GPU.

Do you see any difference in behavior? Both counters are synchronized.

-Akhil.

> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 12 +++++++++---
>  1 file changed, 9 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> index f9de9329dee3..081e79ea4652 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> @@ -23,9 +23,15 @@ static u64 a6xx_gmu_get_timestamp(struct msm_gpu *gpu)
>  	u64 count_hi, count_lo, temp;
>  
>  	do {
> -		count_hi = gmu_read(&a6xx_gpu->gmu, REG_A6XX_GMU_ALWAYS_ON_COUNTER_H);
> -		count_lo = gmu_read(&a6xx_gpu->gmu, REG_A6XX_GMU_ALWAYS_ON_COUNTER_L);
> -		temp = gmu_read(&a6xx_gpu->gmu, REG_A6XX_GMU_ALWAYS_ON_COUNTER_H);
> +		if (adreno_is_a750_family(adreno_gpu)) {
> +			count_hi = gmu_read(&a6xx_gpu->gmu, REG_A7XX_GMU_CX_AO_COUNTER_H);
> +			count_lo = gmu_read(&a6xx_gpu->gmu, REG_A7XX_GMU_CX_AO_COUNTER_L);
> +			temp = gmu_read(&a6xx_gpu->gmu, REG_A7XX_GMU_CX_AO_COUNTER_H);
> +		} else {
> +			count_hi = gmu_read(&a6xx_gpu->gmu, REG_A6XX_GMU_ALWAYS_ON_COUNTER_H);
> +			count_lo = gmu_read(&a6xx_gpu->gmu, REG_A6XX_GMU_ALWAYS_ON_COUNTER_L);
> +			temp = gmu_read(&a6xx_gpu->gmu, REG_A6XX_GMU_ALWAYS_ON_COUNTER_H);
> +		}
>  	} while (unlikely(count_hi != temp));
>  
>  	return (count_hi << 32) | count_lo;
> 

