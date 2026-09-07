Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50A4146C835
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 11:58:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788782294; cv=none; b=gB+MBLzu+lNcbjnMzU7UUiV80/S7DtiFxThONdGpBNYkgZNd5uIe60qypWVWiJ1Fr8bxa6h/903tSC+VIk/nT/dJqSQ8x/UuFJ4uukYfOFqoGtpUQbmxBiCaec8rFMYnLuY2b3wLNn/QVlmWBeB+AFUb7TlXyq4xhhVvcI0Pe9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788782294; c=relaxed/simple;
	bh=IQn9Lo6NDC69G/SKfImAg6Do51foG5sJRKiGAiAzsP4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XrTObQC8l1thoHq+qkG+t9PN+i81ysFBk4f4qGLBF87HqncEaOW52NE/1qmfdQvAK9bx4RPQ1ZLOMrF/+ctx9T4kIgdnPMoI/ylRK8usb1aeStB4VZYhMQmNS6qSOr7N6VVEYX2KiV1BoCmuNoqmwzLROa33shuNsZj7+d8J0Jw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Mk8LzuMm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=O8+Hc5C0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Mk8LzuMm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="O8+Hc5C0"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 687AnGbW4064460
	for <linux-kernel@vger.kernel.org>; Mon, 7 Sep 2026 11:58:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Tdm8BTLKZ9ikHb7V9OMkXJJkkiZ7urcEJl44QrGBl7w=; b=Mk8LzuMmP7TNJuNO
	iq6CD2fauFhV3AsA9VQaeb3SCUq4bIdO/4f5Y9sYBwYIBXofjM0/criCAMDj6uUC
	9TSDoDOlLR0nz9HxsXqgv9pAwD+AwX8ojQ4ngzW+J1Cg0Q/ZA9/ZUdKtJOBwqpbs
	kKjHmbMYAm6N/g+8MI4s6b6lzEkb27h3H4rqiIeN/w9kmmBWvatYoORvmtxzkegr
	e/nHYDhQdSDh1IPpG+y3edtWwilaKJ5Hy4UlKSkt8d3ckPYAD4LSMNHjHQ2/oFXU
	aQlab8E0fySg2CUgaFi9Toq3s13d5Fc5+1YQE4SCh2MgkE9punF+83qpJuKqrgyG
	11owog==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghs86s2fk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 11:58:12 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2db22383e8fso36508525ad.1
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 04:58:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788782291; x=1789387091; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Tdm8BTLKZ9ikHb7V9OMkXJJkkiZ7urcEJl44QrGBl7w=;
        b=O8+Hc5C0zPXsmZSyIXdCmFtbzhN+PuGQQjT1lMBfPwSl4LLI1W1bw407Af8NgUHL4n
         WMsazSvx7d9B7p06FPyJZunewkxQamuRjuzlKX7oxiz74dcKdCCtET8AW8cZEwoBq7hW
         2z88bq0ie1ACo3F+RAT21WAmi8u0ghsEWa8TBsmfOaLa9kGJZyIBtXSPYmhi09OSwn5X
         1jvVYmHu1f2br5u6uo6c3V5Umbc0vWh2t0oPmeXoV4ZxqGRU5mY+mEqgW06/poalKV1F
         NtH+UTjIaPOidHYU+cwb8AH7nSgOzCQQjJFjvArwauWBmUClDuG3Bgn8NgEJdEvBGz1q
         FiSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788782291; x=1789387091;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Tdm8BTLKZ9ikHb7V9OMkXJJkkiZ7urcEJl44QrGBl7w=;
        b=k8Ft1SeeubsCJIvW+k73mJYMFpcjvXMV9BgpuRPnrqdfvCh/SE9ION9SvH4e1bRT7U
         nSiapQEkliyDBkhCYHtGn2oeQBsCbc+k5/igpDd0jTzE/UHt58BVivUw5tiywnIuHD39
         0zZ33G+iTNk08ktxv70dqcZPShWJC1ApmcmG59MjIUmx1Dn2WWFyhsQJBYvqI2qMQvg6
         pHbEufRhj3Ju7kicj0f9qxfx2kwLr9W/ELJ1NYoLOQwtGgqSbuKmix+jVQuxj30TCP0c
         CelzttmPVJm64+5h7gk8M2I216SmZBrVaAQpUs02NecPBoUbDrY0kzNgZFDrJsu4BvUJ
         ajlA==
X-Forwarded-Encrypted: i=1; AKwUvBxFc6nozQ1tYCC78iS+v+K5U+vJqSY4jp3PWUFhgDgp/O8hySQiNymMipPAWUQzWAZfI6m+DwuDagZQNUg=@vger.kernel.org
X-Gm-Message-State: AFuF++lcpEzifzX3sdmxWG8uC/W8nVkamEn9EHzwkXEHkl0vvzXMZOLN
	vGnzo88XHi0lCf9PYn7Zi+GK5GXyhU0O+aTRuaO55aYngaR3wy8qGkyU2f9ld+u0lAS46ayw0dG
	YqHlMxq9tucrHb3lEtbGpaBLOhAZF88E0DgK1vkQyT1pyazWyz1p+9jBrpHgvd2m8GUU=
X-Gm-Gg: AYBFou26e7DUoaRkdiJk+S1+IxGFXxFmPuo5iLvXV/myrRcQj0S0aWrngQkrratyqST
	Ad+8z5V7MhiV/tXB98oplWFj0I/UOIauaySgHTogmhIK5ERACi4eagnxY9GVCjcYmSl40VEW+dL
	TwSwGcBaSsvrTZv5UujXNi3cUrMfvYMiff1O4l22oOnz04lvTp2trDRMlgg0sa3/M/JR3tCQb4j
	/Lu+DqLWf3p85QzRcMLbhJ0BaAFhU2QXaJsJZUI9Wd7LupdaeF7FecDS5g9YgyREL5OQkSnJd1E
	oyCmzkjPG/5gwmeEzDHLTFQPO6aF0HJFz7sg0N93wqY92JUEyQmGJTZ7FO/Re7Hai2BTerDfaQE
	M6PN3QWe0gcBfnlb4pt6MHOgPoco=
X-Received: by 2002:a17:903:2ac6:b0:2d7:1858:1d96 with SMTP id d9443c01a7336-2dafaf5f50dmr265918735ad.7.1788782291143;
        Mon, 07 Sep 2026 04:58:11 -0700 (PDT)
X-Received: by 2002:a17:903:2ac6:b0:2d7:1858:1d96 with SMTP id d9443c01a7336-2dafaf5f50dmr265918395ad.7.1788782290731;
        Mon, 07 Sep 2026 04:58:10 -0700 (PDT)
Received: from [10.218.2.197] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339ac24d7esm43995613eec.15.2026.09.07.04.58.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Sep 2026 04:58:10 -0700 (PDT)
Message-ID: <73411be1-7b7c-4b06-ad1c-f98af338c5ae@oss.qualcomm.com>
Date: Mon, 7 Sep 2026 17:28:04 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/3] arm64: dts: qcom: shikra: Update rpm-stats
 compatible to SoC specific
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Maulik Shah <quic_mkshah@quicinc.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20260713-shikra_stats-v3-0-4be17121729d@oss.qualcomm.com>
 <20260713-shikra_stats-v3-3-4be17121729d@oss.qualcomm.com>
 <apl-vKnwHWFJ8Kru@baldur>
Content-Language: en-US
From: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
In-Reply-To: <apl-vKnwHWFJ8Kru@baldur>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: fejE0lOE8aU_RU-Of9VduwxUNkayE0nm
X-Proofpoint-ORIG-GUID: fejE0lOE8aU_RU-Of9VduwxUNkayE0nm
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDEzMiBTYWx0ZWRfX9N2kTL/FCOhf
 1O50dD7R1tWHR0BXmN96kzd4esg5j6/1z8Yk6chE4bk44o9Swif1aMOFHt733k0EXIC3PRs4SdW
 SzQ6kjdg4mLlnIfaa7rK3KCXt6of+yM=
X-Authority-Analysis: v=2.4 cv=LseiDHdc c=1 sm=1 tr=0 ts=6a9ea6d4 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=qtFx27__m5ifiE6ZfAYA:9 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDEzMiBTYWx0ZWRfXybd9ixB7BnWM
 XC5xqWHHfWKDDeWi3nqxVVDozeuwAnqZibECKEzM2ROVd4MN/8e6bSqs2+WliyrfC0CLJUjadKy
 ya9TlJlBkeVkLqPqV7fSdvvNHNNnZbxu0zNUjMwN0Tw/uwvwxDYnjaBQRxkShHLkI8qveinUV0a
 l7AwvEgJuQHz8I4P12eM/PnZ7OwL7HTX2lMAbmHggnhhDwcajaqMbeRteTHc93uTeRisJgNJDb8
 dT964eKI+QrH1GshyiSTVFmvRrf2pVH85Afp74a+GE6/2aRwwckfpJnsZTmdmc2Yj+OnXDdawOC
 hRQ6rT32Umi5jryGkxfK/EHl0nV5tkrKDimuqZPGzOM1tYvNjQdkiPEYhyEgIF1Z7b3kYxVnPST
 Bo6lMjtx/o0IkOEzldvAxn7TSr7DMsUC9OFApEG1opPmcFdwKwvzP0N0s7wmhvoyPHLiqWPjR6s
 0piT6ZRaV1buZAOOFww==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_03,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 adultscore=0 bulkscore=0 malwarescore=0 priorityscore=1501 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609070132



On 03-09-2026 19:36, Bjorn Andersson wrote:
> On Mon, Jul 13, 2026 at 01:46:56PM +0530, Sneh Mankad wrote:
>> A generic "qcom,rpm-stats" compatible only reads stats for SoC level LPM
>> stats like vmin and vlow.
>>
>> Shikra SoC specific compatible allows reading individual subsystem level
>> LPM stats along with SoC level LPM stats. Change it.
>>
>> Keep "qcom,rpm-stats" as fallback compatible.
> 
> So the fallback compatible works, but the more specific compatible gives
> you additional stats?
> 
> If that interpretation is correct then this patch is correct.
> 
> But then you need to fix the binding.

I have already raised v4 with the option to keep fallback compatible
in stats bindings.

Thanks,
Sneh

