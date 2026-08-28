Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8A6429E10B
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 12:43:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787920990; cv=none; b=OkRREdixwcz8FeraLEvRCo8V/WMiCITPmuXYeSD4xDVJcV1LHSkOUGPdQztOCL0+LP9yq/WaVzsn6+obvHUoTF0741UwAVavl8YO/FcZrTRXtszAvZUxq3U/9Lka/qeTFtU4vEyIJ1EqceSpa2gOQykxILYakVOcHSZC+9vgsmo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787920990; c=relaxed/simple;
	bh=xcKYBW/fzhoq3B/N4hMrGWjH26fUKgE4ehUFJv7khkY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=h+M4/SLPBYI+l102z0HI5LqaSAq6j8g+mwNGp6QcW29zVW93CgQLCNWcGnDMK2ZV+mhhWbtbuKDxFf6ZgAAT/oSgCzSunBwNClLYpzYHKwkXyUyf8eVOSI6Z/fH3h6bW6EanD+R3EdjZE9/hiQdEZ3B8tODh4RDtlCKA9zwDesk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KHxTnYhL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IHhlTAiU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KHxTnYhL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IHhlTAiU"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67SA7jrb3306358
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 12:42:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vafQ8CbVP264KdhCPbqi7uL9q+TNsqpYwNy+Mox5+1U=; b=KHxTnYhLQMs8U4zW
	dLmlKuGf9SJQA0OBsqlhZBm3lmBWBRJlTnETDPcmRWp1du+nby9jWmF1EEEXzEB+
	MRZFSn17ukfca4H1lgm0bpLU/NDkc9rWN/b85N397m6lO5MpSzPpmRr9MBWtLBNW
	bGR92USgqwEpEibt+iJ7shUFZP3DPdvLYXYXUwrAKOH25mGfysOvIkGf+kLBQHCl
	/djJLfNRnnmsLlgJk0lDrFRoFsWE0Rmc9J6oiRCZ3ZjTx+IYw4GJTp61/PaKUW4w
	fG3URrLhtd2zIasytjd3iC4ycLVmpDdsdyhFvx3cwLndRzcPEvwsFeCtSCsGCT8d
	2AP2qg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gb42p9mas-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 12:42:56 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-52faa0dd18bso22800771cf.0
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 05:42:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787920975; x=1788525775; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vafQ8CbVP264KdhCPbqi7uL9q+TNsqpYwNy+Mox5+1U=;
        b=IHhlTAiUfLThtNftluH5VzI2E02qIU+TxFeppwisnaPM24xqBhducvwmuEuZbtXFbA
         QAXxvypZVmeW+HiazwvkIbSheB7uNolMigNwh3oT7b8fEduzW+2AnxYu+ZjDHid1MGrC
         FJ22r4Px3kkvwif03oNv1wNnliarwYtMl5MYXufQSx7lUnQEihnZkkqR0YOQRyy3IdgC
         ZdvAT/z0RTJiOV+QuxWtUYEA5qB9QQrd6XP58Yj9o06Yoo7d0RFg9zdCs0N+gXkpZlXD
         Hg5ZSIClabuyKm2akWDURdrRITS0PpSNu/KSuW+43jGHxfuonRQnJRWPAyEKLinAxZIH
         xwhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787920975; x=1788525775;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vafQ8CbVP264KdhCPbqi7uL9q+TNsqpYwNy+Mox5+1U=;
        b=HRJDIQcn7ByyOOm/zAo6IdLF3nVdmn8t2eq/M7QQAiI1+3IiGZqD1Y/G6G0J+kEN9J
         zQlpD6+R0u8vYWet1RE9uh7nKL9HgfLe91RVQZltbIwfb2YVMafUrkhvgUjlaR4wQURU
         ZEJEIMwNvZQEV6aY4qONxiSqCc4FVH7vhHvHxDuiTTbzycEuALuG1B9r2nuCMMLV1mBt
         k8WUsMS3Cm5ig2ZCaogtOgOtVJ3IdJP+RTmQl0A430IMmSSwUfmw1BKpwHjb8Vq8psnF
         RdE2xMs/O2bECKWGF96ZmhDTMPHA/F7QnBdr3G79UtVoDUmquQ7HM7zKPcAjTFfuges+
         M3Lg==
X-Forwarded-Encrypted: i=1; AHgh+Rr8n+v9iLeJRM7+on1LAblLy/uAcokX9Dh3/9HHiBQYcc1EZC0RS2ab6FCjismj+Yg0F7d6EB6IQDEOGpg=@vger.kernel.org
X-Gm-Message-State: AFuF++lViXWzlhYYCCPVATDqaXEtjjazmRwobP9IY+pDpVpeNEeWRhEm
	J//CVDffe5DfhvZ7TKH2Zt7r8PZ9IhbNTE7cR6Dh6DvZU1q3sxco/oA0wpS6ObJbbZa3RQWoPw/
	5JaE2B/5pP1glax9kyT1LHPquA6040hKCU8qd4Uoj6TCuAxPABzllmwp+FAse/Ch/u+o=
X-Gm-Gg: AR+sD11he7MUE7CuxhR5Wqwk92HerxdkhhiUHlgTEtS8woGnGdz6RsdaCcUj3B4AOOr
	M9fkQ61ZqWD0e23NAppVCQt6hORnbnjbgH3CHVGlG94ysx47ktDyliLNLiVt+t7XeQ26UoKW/aU
	EWcXL3xaAgDBabYn9gukl3dX4KhJwbCOgoULjOdUFn7pb/ZjXuqEAQtglHz9RPbyz7WezzvDdFv
	RINkv00UNdpb7c7GB1a6KtmKDcQ0XbvnkgBaT9NoVpGA+MRtHdLirp0+E3wRunMHQRkrq8DhNEc
	DmGuI5FpsH7qf1INIccaCMngNIvCb3FFPee6sssHuCzifPpG6WPkumqPe2/dGHwOEUmNMWfzhDd
	tFubDN9e5zv+v7nYNJRYGdW5u6jE=
X-Received: by 2002:a05:622a:1105:b0:52d:7b2a:93b with SMTP id d75a77b69052e-52fb9404fffmr67526471cf.9.1787920974893;
        Fri, 28 Aug 2026 05:42:54 -0700 (PDT)
X-Received: by 2002:a05:622a:1105:b0:52d:7b2a:93b with SMTP id d75a77b69052e-52fb9404fffmr67523581cf.9.1787920972331;
        Fri, 28 Aug 2026 05:42:52 -0700 (PDT)
Received: from [192.168.68.119] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-49b4c321184sm163839105e9.11.2026.08.28.05.42.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Aug 2026 05:42:51 -0700 (PDT)
Message-ID: <36b61b1a-1b5a-4946-96d5-576baf707af9@oss.qualcomm.com>
Date: Fri, 28 Aug 2026 13:42:50 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/9] ASoC: dt-bindings: qcom,qaif-cpu: Add binding
To: Harendra Gautam <harendra.gautam@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>
Cc: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Sarath Ganapathiraju <sarath.ganapathiraju@oss.qualcomm.com>,
        Kumar Anurag Singh <kumar.singh@oss.qualcomm.com>
References: <20260824063627.3595610-1-harendra.gautam@oss.qualcomm.com>
 <20260824063627.3595610-2-harendra.gautam@oss.qualcomm.com>
 <bf6e42b4-ff21-4b6c-a7d5-024e5b9a7da4@oss.qualcomm.com>
 <CAC-tS8CaVN8YgkUHJVvLcU1xWB3V5dOgS07CHVOBUnPtMjNxTg@mail.gmail.com>
 <08b6fd88-84b3-4b3f-a8c5-dd6bfd39403f@oss.qualcomm.com>
 <CAC-tS8CtA+wRuucDskRXSc=AHgNdbuq+khj85pFmCG8dGS3Njw@mail.gmail.com>
 <137d4a06-4542-488d-91e2-d338ffb9d47d@kernel.org>
 <CAC-tS8DbJq_hAcOA3x+mRAihYdPeCDMYJOBng5kqtBN-TaBM=g@mail.gmail.com>
 <375dfd48-4351-445b-890f-cbf3a835f65a@oss.qualcomm.com>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <375dfd48-4351-445b-890f-cbf3a835f65a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: gBgOl1wf7shy6FAx0LVb3EBtyVw68JXt
X-Authority-Analysis: v=2.4 cv=ToDWQjXh c=1 sm=1 tr=0 ts=6a918250 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=P-IC7800AAAA:8 a=YEwIN1lEEnS1Bx47E9YA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-GUID: gBgOl1wf7shy6FAx0LVb3EBtyVw68JXt
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI4MDEwOSBTYWx0ZWRfX939xlkY173ZS
 k4zWKkVpii/Gp9To/URAr1eCtuV7k0/AJz0z+LlopE5iaDCvRbpB/cCa42UrDcIy3UBwqU5Zoaj
 D3CC8wvdywkpUUHzZybdBnwgd6gu9Xw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI4MDEwOSBTYWx0ZWRfX7tFNSn9aGh0w
 coPtuKQ1n6DdLWBmOxsIKYJEs8D2XF3wBtuudx/PNHxdwukTZreQND/KAD6+R7dIlOmzMwt+AQb
 T24MmIY5Xs/5g4AaAOOyLlhcm8qerfw74cTpMKK5ZA5TAO5DWlfr+z0uVHF3ozxsLV0Mhz0tJvE
 /CA3GqBEpOSnG0JlRUVJxIqPeHvXzTTKIwnqB25UxpeuduxXwd0H5hAQ7Z7yql7rEcqk3ZwJUbo
 Xr2KhYYAFtFJ8tmJf1Op+3vEIWYEpq43HqNGjBM181zbsegDPd/PiyqIj/L1CrRqI+JhCyQWC2R
 jfGfrWQDsAi6VpqsQqvb8Je/6j8GQS4wKtPFV8PB9YaFgUWtBoRoMW68NX9gH5HYQnbYkjwqeVc
 O7xMR0GbQEWhlQXnMouWLuopBAIrUmVso8OA3cS0GZjW+S4avdqtUTCWHV0IW8XYn/K2sJaYbeR
 cwb4ugmJnTAf30qvrIg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-28_03,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 adultscore=0 impostorscore=0 bulkscore=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608280109

On 8/28/26 1:37 PM, Srinivas Kandagatla wrote:
> On 8/28/26 9:58 AM, Harendra Gautam wrote:
>>>>>>>> +#define QAIF_CDC_DMA_VA_TX8  254
>>>>>>>> +#define QAIF_CDC_DMA_VA_TX9  255
>>>>>>>> +
>>>>>>> These DAI IDs exceed the LPASS_MAX_PORT limit, which will cause sound
>>>>>>> card registration to fail.
>>>>>>>
>>>>>>> Check sound/soc/qcom/common.c, as the current indices (246-255) are
>>>>>>> beyond the supported LPASS port range.
>>>>>>>
>>>>>>> Best Regards,
>>>>>>> Rafi.
>>>>>> Thanks for pointing this out. We can either add the range check for
>>>>>> min/max QAIF DAI IDs in qcom/common.c or introduce a common helper in
>>>>>> qcom/common.h to validate the supported DAI IDs across Qualcomm
>>>>>> platforms.
>>>>>
>>>>> You should add these ids to
>>>>> include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h instead to avoid
>>>>> conflicts with common code.
>>>>>
>>>>> --srini
>>>> Thanks for the suggestion. qcom,q6dsp-lpass-ports.h is specific to Q6
>>>> DSP/AFE virtual port IDs. Since QAIF is a direct MMIO driver with no
>>>> Q6 DSP involvement, would adding QAIF IDs there not be misleading?
>>>
>>> These are IDs that will be reused across both dsp and non-dsp solution.
>>> So it makes more sense to keep it in one single place to allow the
>>> hardware description (DT) unchanged across different software solutions.
>>>
>>>
>>>> would it be better to update the range check in common.c/common.h to
>>>> accommodate both LPASS and QAIF DAI ID ranges instead?
>>> No, that does not make sense because these numbering might conflicting
>>> with other ports in future.
>>>
>>> --srini
>> Srini, could you please confirm if adding QAIF DAIs to
>> qcom,q6dsp-lpass-ports.h is acceptable given that it increases
>> LPASS_MAX_PORT by 56 (from 149 to 205), which indirectly grows
>> multiple arrays sized by AFE_PORT_MAX and APM_PORT_MAX in other
> 
> BTW, the dai ids are already added by Prasad
> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h?h=next-20260827#n240
> 
> 
> You should use them.

Correction, he only added QAIF clk ids, not the dai ids, Not sure why
dai ids are missing.

That also raises question on how did Prasad test it without the QAIF dai
ids.


--srini
> 
> to your question about increase in size, yes, this is know issue, i have
> some changes to send which will remove the need of this static array
> which should fix the concerns.
> 
> But for now all the hardware dai ids for qualcomm SoCs should be in a
> single place irrespective of dsp or non dsp solution.
> 
> 
> --srini
>> drivers eg below
>> https://elixir.bootlin.com/linux/v7.2/source/sound/soc/qcom/qdsp6/q6afe-dai.c#L30
>> https://elixir.bootlin.com/linux/v7.2/source/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c#L21
>> -Harendra
> 

