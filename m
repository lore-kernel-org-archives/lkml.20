Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F85F4A8FF7
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 12:44:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790858691; cv=none; b=Z0pRmYMnMQYQxHGPQom7akBAiZ+C+6hd36ALkIHpyGjUE+RDSgiIXuF61Kzuc4BFEe2aKzeEZzeaSHBc21uSgffkJkP9KttOIH9AuTc8CJnsI9Dc+vy35SOTpbEbDtgyfkE0+iAEKrz9PrcMSgWyuvOhPQ5gbrlynZKRvb9ZDPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790858691; c=relaxed/simple;
	bh=BTtd272bU17jdABMUVjppAK5baR+BMfWUD/+b95sdFM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=l7QLVPszDDKzQP+bYoD57loEzjXEv5sjKdqEyr7YvaJYn64+zbgwabZob/p8h/GkT9BUnZTt+DRyn+3BkQGOlTXVcAlDZxeSPzv4x3ZliKh9saF/1HiiKmEjx70XOlm9nZ7X82k3B6Y2yQenY2KNr4gxkQysCLRPEQZeWBVGyVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CKHiBqo+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Mmpa+sht; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CKHiBqo+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Mmpa+sht"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 691CfaJq1062173
	for <linux-kernel@vger.kernel.org>; Thu, 1 Oct 2026 12:44:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GlitKy/nrCvAze1hM+Q/FIajbaUAfbBwxqbmkKAKWNM=; b=CKHiBqo+E42rOQ/m
	/VM5GEDEeJ/paIrpQQM/G85RB5CfV9mDCG9lKmef4gseR8XD56PB9fszQnngHkEM
	evYlLXNulycUSOkJNDht/5MLF7v/4fkMEibe2i5pWvp8NvSz2bvM0245fknJaKeF
	FEayiVKTT78pEB6i38DNtzqtTTllcSfBktfLsnwxGk8UgH8d1vTSoYJfG5AQhgXQ
	o/xK1K0zFE81N9EHh/K0pHFZPrJHd76NzfxE7ErKoKAYuJhQ+Vojp5V7vgyDgAV2
	oXTHGyLL726H7+Ifr9W7vVed8myA0ZiUnoJmRg780rYuANoeQy577QvHaMRrinB6
	S+DJpg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h17mvuv6b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 12:44:47 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3968bb86fb7so6499597a91.2
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 05:44:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790858687; x=1791463487; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GlitKy/nrCvAze1hM+Q/FIajbaUAfbBwxqbmkKAKWNM=;
        b=Mmpa+shtoNRzgPvzPAtR3tBbjjrL+/AxZ1C5H1HQ77RpkGK2Ti7bHY20YO4Gu/ZpOj
         FBNDPhcjmEGt7jbtcPayR1ek6VMHVagzMgBqslN+JZCMoeJxNZi0awiYTsvYrgYejLlw
         jshsL+0idLwq3MP8nl07wlkn6voL4tJ5yIkShjWpAXTkYx976YRdsFPsI8ExBvmWbOjr
         rbd5cW0LFhoQK92o6kwy6wFk6tVlCEE7e9UwOOogXgBcEB2Rskq/LxapMSKGLVBmECCX
         4CAZ1EQywavvAYfA45N59yprzKS0TDxdcjBx7tv6WwAWxZE5Wx+FEUC93SdEHhNs0kZv
         QTew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790858687; x=1791463487;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GlitKy/nrCvAze1hM+Q/FIajbaUAfbBwxqbmkKAKWNM=;
        b=HRGRUClsfCxOryoYtarDoOO1/BKzbLb+Fu6dzNB3Jp71YAwwGYuzYU8Fwwb4NnPJk2
         nWBd5NXPV5HwC4OwZs6gqYDwYHA0Mz+ZqZ1ATWU4TSXq9gVw+OlV35Yus4TxMExdbhwG
         kUuDY2Gng9uKy73EKJyxB/YArIEyUYC7QBACj5odei6BD7zAQGTci9yT8IrAAqqFPz1h
         XIs6cWgxuhBgpdGZgKFbICOJfP+gdJk5/0PEnSvC1ZbKE2RBoL9Es4T/7A8HYh2dR3IR
         HJcV6M1n/GxBNaGMqXsitdU+LMjyuYpkB3y9+f4kkt6J+mWq8tMKYlsDz/KY1RK23c7A
         ByqQ==
X-Forwarded-Encrypted: i=1; AKwUvByI40r8RuKlGQquNFt26WCbRdJatx+FENHifEs0iGV7hLH63TBP90T22W+hxml7xyOnpVKdzcAEjkVSWAY=@vger.kernel.org
X-Gm-Message-State: AFq9FYITNTAr8xpQZu69dH+Ixi48XAhKe0RpfY+tsEHgos7Qcb2mVHDv
	oJh2lnr4ZN2H0Apk8Q7DvoTl0R/Id8C6b5qdwZK2QrwfYuLzgLH/mpFspwaDnyKy3udbLO86Qh7
	wdj7v35QU6epcm7Tik+8ZfnMfzUqxrc24KiEziXzWTaKXtU7R4VXV8dxVm3i2btJS1P8=
X-Gm-Gg: AYBFou3kyODPOQm9sZfde/BD/0msmtz3tnZqBDJXDUMC5NeuMwAOKyaBnSYImnBurfU
	FT/PZ0pbrqSzCa5eJe4gzkJrtmb8ZuqTPb5r6Yqtdgn1uvyR0FS7bKBwbpNNmuE0Z2+mEkSLHGs
	ZKwbWLh4482WaJC1aZFeYXrpEP1Wnq3jRIUFQarud7ETxi/S6lFATzUXttz43Ts7Hqnqj5Pi5Yf
	DOWw9IhcIwcAQ8AG6LzAek7YwVgXGknAFFqRg+Pvms+GvrJxILN/Jg2SD9v0AcPxRFUXtiLjNjs
	h+DVbS/nyqyLqW5fy0Ah1MFzSwfzpjsSKN1TCpoKKL5V2HZocMQcw2nkNl6S07ayzQ8gnV47tjx
	PW/TTsfDc7EmF7eU8dYp5V8cFAsT0ZZlU
X-Received: by 2002:a17:90b:4b0e:b0:3a0:d75c:239f with SMTP id 98e67ed59e1d1-3a4d1505448mr4083694a91.11.1790858686785;
        Thu, 01 Oct 2026 05:44:46 -0700 (PDT)
X-Received: by 2002:a17:90b:4b0e:b0:3a0:d75c:239f with SMTP id 98e67ed59e1d1-3a4d1505448mr4083680a91.11.1790858686237;
        Thu, 01 Oct 2026 05:44:46 -0700 (PDT)
Received: from [10.219.49.187] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a50f01421asm2055122a91.3.2026.10.01.05.44.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Oct 2026 05:44:45 -0700 (PDT)
Message-ID: <2bf53c39-dc58-422d-b472-a7c95f445076@oss.qualcomm.com>
Date: Thu, 1 Oct 2026 18:14:40 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 8/8] ASoC: qcom: lpass: Add support for LPASS codec
 v4.0
To: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>,
        Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260922-add_shikra_support-v1-0-6c6cb6444caf@oss.qualcomm.com>
 <20260922-add_shikra_support-v1-8-6c6cb6444caf@oss.qualcomm.com>
 <6f2afa91-6355-45f8-b6be-6b556c679813@oss.qualcomm.com>
Content-Language: en-US
From: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
In-Reply-To: <6f2afa91-6355-45f8-b6be-6b556c679813@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: fppOyeUrcKwBDJmj8LTBtPh9Xp3tGg1l
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAxMDA1MCBTYWx0ZWRfX3feMioDm1Rl+
 RC63S1jmLOV3V5flwHcTGLcPGUeZocehgRr2VJiQmJ1rNxjL42ubcgvevsyT4Ay07/xLQ+kCLB9
 lSEFzlHKvWf212s6p/47YLjzNepEkfCmw+Eq3onP5d3OGexl52jnRVRKBlsHn6Fc9GB026aIuZM
 SpbLZVS/yYB+aj8gJqM41MGpYRh97Z2iD9PNvTnUWguhJhXeCz7+MfFv5LHERTQZwaJ0cB4bAz2
 QmtLLKu+XVV/4tWJ2jRgQ5ApVkVVYfF8AEvpnK0n/L6180SrxBYI2t1R0SGXNJLXmPlIE73RvR6
 3ZnQ7rRhEsZE017J3+TJQAq7+0dTTqyImH9tvLLbB2nlaGmhlSX/jUfOv1Izh+6KHyrPX5fmyyA
 phgLCVZ/VCpx2nTCSEeuI3Af9Wg631RJ9t6gvQWTUp2lVzZ09zhBILSt8wOO/fk6fuqqP6O7Jj8
 suJuHJM18ZwediGDRKg==
X-Proofpoint-GUID: fppOyeUrcKwBDJmj8LTBtPh9Xp3tGg1l
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAxMDA1MCBTYWx0ZWRfXwXheVKC2VL8e
 Arl7MElCUR48Vn7SA77N6T3g1RNj9hH0ucDEc2IX+56o0IYvfuZ0qTmfutF/NOc08qhEYmbGBWj
 LBL1K/lHQx3g5qwiSd/ArL1EcG0lu6w=
X-Authority-Analysis: v=2.4 cv=KuvYSmWN c=1 sm=1 tr=0 ts=6abe55bf cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=dVCGMdOWq-ePsS7X_OMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-01_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 spamscore=0 phishscore=0 impostorscore=0
 adultscore=0 suspectscore=0 priorityscore=1501 clxscore=1015
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610010050


On 9/25/2026 4:32 PM, Ajay Kumar Nandam wrote:
>
>>           rx->rxn_reg_stride = 0xc0;
>>           rx->rxn_reg_stride2 = 0x0;
>> @@ -3959,6 +3962,8 @@ static const struct of_device_id 
>> rx_macro_dt_match[] = {
>>           .data = (void *)LPASS_MACRO_FLAG_HAS_NPL_CLOCK,
>>       }, {
>>           .compatible = "qcom,sm8550-lpass-rx-macro",
>> +    }, {
>> +        .compatible = "qcom,hawi-lpass-rx-macro",
>>       }, {
>
> Patch 6 documents qcom,hawi-lpass-rx-macro with `clock-names` 
> containing `lpr` instead of `macro`:
>
>     clock-names = "mclk", "lpr", "dcodec", "fsgen"
>
> https://lore.kernel.org/all/20260922095522.193FC1F00893@smtp.kernel.org/
>
> However, this patch only adds the compatible string and reuses the 
> existing RX probe path, which still requests the clock as `macro`:
>
>     rx->macro = devm_clk_get_optional(dev, "macro");
>
> I do not see any Hawi-specific handling which requests or enables `lpr`.
> Should the driver be updated to request `lpr` for the Hawi compatible, 
> or should the binding continue to use `macro` if this is the same 
> clock from the driver's point of view?

Hi Ajay, Thanks for the review.

The Hawi LPR vote is already handled by the PM clock framework. 
of_pm_clk_add_clks() adds every clock from the DT clocks property by index,
and pm_clk_resume()/pm_clk_suspend() vote and unvote all of them. 
Therefore the LPASS_HW_LPR_VOTE entry does not require a separate
devm_clk_get_optional("lpr"); that call alone would not enable the clock 
anyway.

Thanks,
Prasad
>
>>           .compatible = "qcom,sc8280xp-lpass-rx-macro",
>>           .data = (void *)LPASS_MACRO_FLAG_HAS_NPL_CLOCK,
>> diff --git a/sound/soc/codecs/lpass-va-macro.c 
>> b/sound/soc/codecs/lpass-va-macro.c
>> index 79abbdd158b7..46ae627ca594 100644
>> --- a/sound/soc/codecs/lpass-va-macro.c
>> +++ b/sound/soc/codecs/lpass-va-macro.c
>> @@ -1896,6 +1896,9 @@ static int 
>> va_macro_set_lpass_codec_version(struct va_macro *va)
>>           }
>>       } else if (maj == 4) {
>>           switch (min) {
>> +        case 0:
>> +            version = LPASS_CODEC_VERSION_4_0;
>> +            break;
>>           case 1:
>>               version = LPASS_CODEC_VERSION_4_1;
>>               break;
>> @@ -2166,6 +2169,7 @@ static const struct of_device_id 
>> va_macro_dt_match[] = {
>>       { .compatible = "qcom,sm8250-lpass-va-macro", .data = 
>> &sm8250_va_data },
>>       { .compatible = "qcom,sm8450-lpass-va-macro", .data = 
>> &sm8450_va_data },
>>       { .compatible = "qcom,sm8550-lpass-va-macro", .data = 
>> &sm8550_va_data },
>> +    { .compatible = "qcom,hawi-lpass-va-macro", .data = 
>> &sm8550_va_data },
>>       { .compatible = "qcom,sc8280xp-lpass-va-macro", .data = 
>> &sm8450_va_data },
>>       { .compatible = "qcom,shikra-lpass-va-macro", .data = 
>> &shikra_va_data },
>>       {}
>>
>
