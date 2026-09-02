Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 590EB386567
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 06:09:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788329359; cv=none; b=bv5QSn6fA56XFfMdfcEmeSzg4nScXQruNRM06XXct4116n7TUSBrjLA/MvY7Po1D+pP1ZPVqJjtVpSC8NtM+TlKr4TZTg23kCDXlEMjof4iSGQ2O5mLVNQA4ZXQ1c+WVzQOpjo/j9dt5MHs5fBVMBxAJvBO/agHJf302WhipUiM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788329359; c=relaxed/simple;
	bh=2O2tLbCSCtHBMYey+e7A3uPt/HONNbOYonSDFLRuS6E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Q2Mpk2EbC6Hfe4hyPnbgIa0SS3z+trUC43vweDQywE7/Kx5vQ5rkK50T/F+pkg4jW3CV2UIOEURwDVef+zbkw/orDiG6dFa2cxDxUvnHDNNKQp9aMdfpG5j1kVLA/Lbzsb9oCle9zfcpfHJrttmPOFPwQ9px7boYQ7HG0Ae1noA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iY2IK87W; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aO2f6a0o; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iY2IK87W";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aO2f6a0o"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6825YQjm630998
	for <linux-kernel@vger.kernel.org>; Wed, 2 Sep 2026 06:09:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rekHoOCBWmiKDF8X232OJC4hGvW2Rl9Y34JGuZYLqzg=; b=iY2IK87Wvd1cPHXj
	BEIzJxzXQgF5YJUqKc+O0//4SjcTUqNeqWB4IZqatIxHAQUhcdkNe2HuxeGqkQDe
	AS+DXJdRpQDmiqEGLhR/SiAZ7Aa0iGD2nXTcGkSBcY5EEAv37Xg+YmlgItF8227m
	I2i7Zl0caFKUTYvLEQ3HsiA+xisvHR/1XNAnGzqoqj9wFWgMzDW/29O7s2Js/s8e
	3Mq6pKHr+EhWE5WyhB9JDvLKG9mOA13findwrYj8S/figRWE7Fci4zyxyThj9Kod
	xROgMtRfPZwRJ51q3dUbzh+XdSzSGOtelvkO1/7NQu/LLsI4FnOcRY46bVOzNJOS
	EBfB5A==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ge37j2d2u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 06:09:17 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-ca6bd8a190cso1049588a12.0
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 23:09:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788329357; x=1788934157; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rekHoOCBWmiKDF8X232OJC4hGvW2Rl9Y34JGuZYLqzg=;
        b=aO2f6a0oMeu/5b4v2er9puwoGM4kvphKFpAmoQQliEkf02mhNxFHqs7pRI3gWQyx3+
         Hoat+1BAR8tuJTpwh5AypjilVsTEolw+16odcce5nqK9FckNjij9uLaAgxSfpvPVZMVZ
         zZONqH0OlbFPgf3ET3gsq6xMp+9G7Ldhyg7xrxsH2r4CwjCXnc5MNVExLLYIEEZf8P1o
         AX7B2kXUqqyl04+jKImHvVGE0H+19mIOb4K1QbgNQoBw4/IkDheF4KupcXO1L7BvHuSI
         iLREw88Fau8HjGxiWz3YvGgBfhG0wPUf8aGaE6r99l41UrUCq9e1zzCC6df+kIUrXyiK
         VK2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788329357; x=1788934157;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rekHoOCBWmiKDF8X232OJC4hGvW2Rl9Y34JGuZYLqzg=;
        b=Xfvdj//duVUdklpcAKAjejz7B2ZHhB4qTBVz+HakSG06Z59EZzw1HYpipPwGVHvlRl
         5oN6LO4NSYfpSRylqgU1jPrL66QGt8VYyfDjjWSP8F/2mBmPljRUgBq2zGzeReucUE/v
         dHcYVK3GsEb9d7KqQQ8737r54oBSOnzxbPQtcIg4hRyQ1Fs9jRhci4BwetCDLQ/Lcb75
         PKr9X9kQ/lGaalwP1MID/PB0AjFH+OQEtCs/N5MSthR1hO3OjqmTSxbXsQ7Le/LEOO9U
         Y+JZHoTUpB5axWy1WGN2OdZJhF+mv5sLrHxAB1Ddf/N7CcHsp64PgydS/xFMXlrejHDH
         h2LA==
X-Forwarded-Encrypted: i=1; AHgh+RqACNnozymDl/EDgO+4jaAxoQ3xRA07w3halJsCQpswvVwPYOCavOgayOo8hFoVAB8haW2507uave1wHNI=@vger.kernel.org
X-Gm-Message-State: AFuF++lepr5XRqMn5kO2GZvISTYBh3bJjmzXr/x8uPFk1tPti2gRE2Sr
	mcJs8vRXGDmRCUh/03RgJWn3Byk48sYSdmJaHj+KyqnKlLflh8wM3oxXRby2QlaG0g2OX3B33Fp
	kslARthT6q9SO2+uRNzyF3oSJaTyisBqATWHTfe31KPPad23anq4GILxcRsuvDCNNz2U=
X-Gm-Gg: AR+sD12BLqnk/pwMIgQSawuJWuQESp+rpXivNq5DluBaqnRAyLIt4TKzQ6VTMAFMsJx
	hbDqot6lSf+vxTAUdVDvg3lU5KfnvoqVdzkuiLB9fY3WhfaFlcz2OrflRTtlKQHIB83/8km8wGS
	0S5NGqNPru8rjVwYvY+UsobZIQJHBodG+meajCdwmjxU7GHZUlRrEK83fBo0xcqiO7Q8ZD56vET
	cOyuXBTu9Yf9IW2PJnSIdcJoeicZl0JYg2Kk/R8uRmTJP4zbhNcJqzBjn8cjms7NaDpvD1ES3Gs
	rpJkMg3ljoO9xDcCurFOMarxmvZ0cjimVlDW7U5HfaA8sIistDgvURfydn8TbpOySz+BbSRonun
	dzrjDSqYv5u7uRf/uwx7qj0qSqpOT
X-Received: by 2002:a05:6a21:7a46:b0:3d0:ba81:79b1 with SMTP id adf61e73a8af0-3d9aa9e2184mr4428628637.0.1788329356445;
        Tue, 01 Sep 2026 23:09:16 -0700 (PDT)
X-Received: by 2002:a05:6a21:7a46:b0:3d0:ba81:79b1 with SMTP id adf61e73a8af0-3d9aa9e2184mr4428538637.0.1788329355930;
        Tue, 01 Sep 2026 23:09:15 -0700 (PDT)
Received: from [10.218.18.193] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1430ea31f1esm3257660c88.8.2026.09.01.23.09.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Sep 2026 23:09:15 -0700 (PDT)
Message-ID: <942f0a0a-461e-4794-a33a-9c820635eef0@oss.qualcomm.com>
Date: Wed, 2 Sep 2026 11:39:09 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] ASoC: qcom: q6apm-dai: add VMID-based SCM
 assignment for mDSP buffers
To: Mark Brown <broonie@kernel.org>
Cc: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Mohit Sharma <mohit.sharma@oss.qualcomm.com>
References: <20260826-a2a-shikra-vmid-v5-v2-0-c3dc62354eee@oss.qualcomm.com>
 <20260826-a2a-shikra-vmid-v5-v2-2-c3dc62354eee@oss.qualcomm.com>
 <948de620-a482-4624-8383-6b65eb28a5e9@sirena.org.uk>
Content-Language: en-US
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
In-Reply-To: <948de620-a482-4624-8383-6b65eb28a5e9@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 4JdQiXnT5yZDCTVS3jorEvu_MrB0Kqy7
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDA1MyBTYWx0ZWRfX2xmHuhms3F4h
 TyDcubNEwI+wMYMQxzP7yL759Q+nKtBJDZjsQzI6UZm6TXY4GVpD9KndT8kYpu6BgSH/eZWq4XI
 SOgAPd1cvH3Ri6RSidLYjLBqSS/N43E=
X-Proofpoint-ORIG-GUID: 4JdQiXnT5yZDCTVS3jorEvu_MrB0Kqy7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDA1MyBTYWx0ZWRfX7s96eaSLcH2b
 ESq/7YYVYkxR9jR2izoh2FihOQm0Sz/dcjjXUX+A6a/R8po01vnrkdb1nWDnxngtdCBjFjHPogD
 2TV9w6yiU/zS+9jkvX24cv0HS8eCF4I5Rp89o6h5nBmcTNjdqaawVmstRrkLt62pgqzGmJsYABW
 JLt3x3/liIlue0IjwJCcbrShnuNcPxCtF9UQM9t+Z5lyYk1W3oU6/7pXApugVKWdcTxOZVo76xL
 j/UB1uTYWVDTdLV4i8hSXJEbyitq3DL5IiKwvQW22IFR7JtDyUdDhRJ+4U4Dj3yZX4DdIy1TCL2
 9OxnKuHSLp6X9GiJBDlDKXo3jSW5wtnGv4EdsfjfGO6CjoawdseG0LcKzOMA8KodaWRFi9/Gj6D
 CS7h8BaTkx7nDll9Y2+Url5n9IJSJ1Ioge5FcB4tPB55xMq8yYm1XfvWe0D2WTZLRCHC5GCDdR6
 rgzeW7aW57/Ox8R5S8A==
X-Authority-Analysis: v=2.4 cv=PKg/P/qC c=1 sm=1 tr=0 ts=6a97bd8d cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=bKA_SWDmMBWY0RPQJBEA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_06,2026-09-01_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 impostorscore=0 phishscore=0 clxscore=1015
 lowpriorityscore=0 bulkscore=0 spamscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609020053



On 8/27/2026 4:22 AM, Mark Brown wrote:
> On Wed, Aug 26, 2026 at 12:10:13AM +0530, Ajay Kumar Nandam wrote:
>> On platforms such as Qualcomm Shikra, audio is served by the modem DSP
>> (mDSP) which runs in a stage-2 protected context. Unlike ADSP targets
>> where SMMU-mapped system RAM is directly accessible, the mDSP cannot
>> reach the PCM buffers unless they are explicitly SCM-assigned to the
>> appropriate Virtual Machine IDs (VMIDs). Without this assignment, audio
>> does not function on these platforms.
> 
>> -		ret = snd_pcm_set_fixed_buffer_all(pcm, SNDRV_DMA_TYPE_DEV, component->dev, size);
>> +		if (pdata->has_reserved_mem)
>> +			ret = snd_pcm_set_managed_buffer_all(pcm,
>> +							     SNDRV_DMA_TYPE_DEV, component->dev,
>> +							     pdata->reserved_buf_size,
>> +							     pdata->reserved_buf_size);
> 
> Does this do the right thing if the ALSA core preallocate_dma module
> param is set to 0 for some reason?  I'm not clear why you would...

Good catch.  With preallocate_dma=0 the managed-buffer path defers
allocation to stream open, but the reserved-memory carveout is a
fixed-size pool that must always be mapped upfront — lazy allocation
from the system page allocator would bypass the SCM-assigned region
entirely.

Will switch back to snd_pcm_set_fixed_buffer_all() for the
reserved-memory path in v3; the carveout is fixed by nature and
should not be subject to the preallocate knob.

Thanks & Regards
Ajay Kumar Nandam
