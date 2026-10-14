Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AD4C47DD50
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 08:33:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791966834; cv=none; b=QGxM1RPfyJvFzQTK7ewdAGQRHPEl1gn0w9+9Fvch3wx5Gi+mL0E50ICCzNFeTfs44+/Of9NQstpcH1+8BLempc5ZuMGdTUOCX6WnvphVFKHZ6q4OZyctcX1rCSuj1CPyCTXvXijKSmQxUldJon1fhRiXvVBxTvxUW8roALJ3V4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791966834; c=relaxed/simple;
	bh=6XixP0z1G9CMQv8ekstqyNS29bUTZB+3sD/GaUwTFlg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XZY7VsuE/FCgf7LnHV1TFvRWV0Z5rG+YfE1PuJjQzF4S+GBEUXZe7w/NO3QqchCEKjE0mTYwmpR6hHvAiJUOxIKuQy97VdGxQiZ7fXe8ZnV6Vem5uKAmc+S4wr60ybv2OHAVvTxA35zrkIn8V5gR0db2pahIOATogZmjXcHKerU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iSwXca40; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DEz9cEqy; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iSwXca40";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DEz9cEqy"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69E5wpie3951349
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 08:33:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PybHZgrIJI7iHE5wfvg6rW/UxWF/Umu+Ib5PZJNnMEU=; b=iSwXca40Y7/5zsiw
	hCFu5AefdIRXjjLp3TTr8xnW/ZkdQW+546q9zBl4ElqfOLLCbelfFyehcqA57br/
	Zzah2sQdJhyxpbC51s6k/rjLhbAZTCtqw9XX0TR3kw9OpPKeZs9fEp3eP4mNPj6s
	VjW3aZvbmwkWDIj2utt0jdN9E4pH/qq809Y7uSpVC+GZ+s26kR7rOmlq5HUVwxGD
	VUE3owj38zHOXyy5HyMCu2Jcot47zhqCvZjdXmLL+SQMGybCTAxiwdwhpcYpX+sV
	+xpq1cpdN2h4bdclezcbuGaTeXliSpfSg4e5Yayr7JdTLiT6cPbZh3ztcrB5KqJW
	/MImpQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ha42p0m1k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 08:33:50 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2dfb24dfedfso32715985ad.2
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 01:33:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791966830; x=1792571630; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PybHZgrIJI7iHE5wfvg6rW/UxWF/Umu+Ib5PZJNnMEU=;
        b=DEz9cEqyPCqHBNgmKrHvSv775zt6X4CrzWUjn/H6uJeqQYSOMaztCmL8LgDxwsgJJw
         wtOhc96QXN6lfqnepVwt8L2lbzkHWgCiusMGCwDwnMDUezWXVs+NAgAzS4ISjEmXlbDq
         7j082UiL4HHzml9Ot+vlTfybZNXJQHj+o6VykXQZgLzZZYjQ52pzw4KHpFjJr0hlhCjb
         8ZqcbL3aee53SgRhP4WsFEqQQpws8FgiernaTnLgwRWucRR3Ys499KeMcqz6kklZ1svN
         Z0tqNu6JkqbOAIwT19Ng1F4XXfoCXGug832uYl/x744bP85W2PSrxfZrA2t02n1+pZtT
         SBjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791966830; x=1792571630;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PybHZgrIJI7iHE5wfvg6rW/UxWF/Umu+Ib5PZJNnMEU=;
        b=IDo9DCnQg5f68hYNatf5zZ45872c5a7qCuLh0RqG2w7Yo8n4sk3PUjyiBi+h9XaZHJ
         Ty5NrYABFSP1IlQZGXcmdtU42YzBz14lwxNk1k4ylOLxfBxuVaWEyREKCwYn2CO90jnx
         De2NyGA6ITf/iIfV3+3v9b5V4qWwsycy7u8Ypu9dGWh0B22vs1rfeTl3yR59Zu3CTJj1
         ZHSsiOK8TCgUwpO2/4OKmP/25KlkhACMG0r8/q0JiopDqV9IGC98cNl050/V+/rRtc4g
         ERo5TT2x+s5p/MxJca83aWlVI8PmF9n1BX1Lr51udUXO18jr31YaUtIVLJnVnubhzVw+
         vNBA==
X-Forwarded-Encrypted: i=1; AKwUvBxfkr0Z4kB4CC5MYBv9dzYVUIp+KbjQqG/94BYSgkWWDCmS7SopF0/xM71lcQyAP/plqAMupwF40h+Ggbw=@vger.kernel.org
X-Gm-Message-State: AFq9FYLq0qmyzPY+97Vyh0zITcK8PImh9kbX/ifyb9OCh6VViFtQ1eCB
	Gjv5y0NXHCR49eTRm1zW46alKllnRtq8d0df4RwQPWVff4+V8HhT7d0cqY7Pxr1sK+fA+SQk/j/
	pek1dZeSqO1DfyiqzWIEoCsD3bcEGdqutpT3bYk/b+MvRfprORprQWgpxqIEzWhoreJI=
X-Gm-Gg: AYBFou2vKy35HQOEjCVXypFTfJ/k8b4WpKuRwz5VCeZMCzXr28atgZ95HjIO0hKj3cG
	vYWed9VJkNPMBF6AeRAnbNKVQffukjqKGJYaLSPvhRaxu8mTMpYcuRR1gaJb1GnC7CRDyEvDg/+
	qRvDeLoAVTo3idDqeDwBc69U8crXWtvWMWgKvsryNJtI+f9l35kb+rsB1Mr9ko3A7IBgg/cDSGg
	wbhsZpdHv9AiQ7yB3KDQWKmU+lyzetwEhJaE25ZeLRRt/M4s7ox0EIQeqSVXRUVURKgf5U6OTm6
	hwJXOj/+9OLo4SyFIbyj8kBoMrcskDodEsAWFLhkiBJ0IptJk1dog5gcEl7VeHEekTXhCsih+HG
	HwUi+UFRm+CabiTIY/aZeUCIls/CEW/NjecKrGRJaUhi+htj9IlcalgZGwrNX0AM=
X-Received: by 2002:a17:903:1ac3:b0:2e9:3ff7:b0ec with SMTP id d9443c01a7336-2e93ff7b26fmr10064805ad.1.1791966829839;
        Wed, 14 Oct 2026 01:33:49 -0700 (PDT)
X-Received: by 2002:a17:903:1ac3:b0:2e9:3ff7:b0ec with SMTP id d9443c01a7336-2e93ff7b26fmr10064565ad.1.1791966829323;
        Wed, 14 Oct 2026 01:33:49 -0700 (PDT)
Received: from [10.133.33.80] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e8422b8d9asm65203255ad.62.2026.10.14.01.33.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Oct 2026 01:33:48 -0700 (PDT)
Message-ID: <ef252ebf-ea61-41e8-b37f-ea3b1121746c@oss.qualcomm.com>
Date: Wed, 14 Oct 2026 16:33:43 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: shikra: Switch CPU ETMs to MMIO-based
 probing
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Jie Gan <jiegan@qti.qualcomm.com>
References: <20260922-fix-etm-probe-issue-on-shikra-v1-1-56d25e9bbe17@oss.qualcomm.com>
 <3fe1ac52-f69a-4288-88b6-edb5717dd315@oss.qualcomm.com>
 <2a6b9567-e07e-40ae-a214-2a4d6bcb29d1@oss.qualcomm.com>
 <1a8f0ef0-303d-4173-bfc2-ec8dd952f367@oss.qualcomm.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <1a8f0ef0-303d-4173-bfc2-ec8dd952f367@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDAzMyBTYWx0ZWRfXx72JufBocgQ4
 OkuZAbI3U4N4fuFvwjr5FUbJxLMlximIgxiq9H1VgGC/p/Cp8xlPnn93Jj00bCk455L8SPIDiJC
 PZb5t2kCCDdHF0ah1uZ74f7RT56ZE6M=
X-Proofpoint-ORIG-GUID: 4Lpx30vn5oAVYyRbKF6djIOZYYDRcLtt
X-Authority-Analysis: v=2.4 cv=aeb0Dhot c=1 sm=1 tr=0 ts=6acf3e6e cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=ESQR0jG560GBcKQeWBMA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDAzMyBTYWx0ZWRfXw0fAsI83AEwy
 1BOZzbOJUZGjdIKUgbmhK0Og7JLmiP5ZSPB8rk+RfBZnjbMpsfGdXlxBt3dbLsZsXLTxawln9VB
 pj0gwmwN3QY/FoDWUUJFdAP17F2YAAgYEc3Uq5J5UsQkc3SQOCkvyAIFWe1o9zz6InCpTnEUEGn
 a+ZTgew1WBjSbh/K6KOh8bUnJbZ91SeBm3l+8xIxZ7ykQiLKRn6GsR5vwy9B4vbPcBj2J4vFQyd
 sByatb52AXP1s2tf/pvN96ukeECMhqFppSLtwPTtIMFL1x3V0bLwVoYho2HrLzXxQ44U9EEEKn/
 bsG2XHvBO3hIvkO5hw8CchqhwqjZn/QzRFag+QpP6i6GzYhqYnnngbwZA/D7M2jifyaGq0xY3Xi
 o8ZoFeUCgGtqCtJ4u/i9LcS4ehll6eZSAYIh9Pizw3McP72AcB0xIYkglawDz82i68MU8tqCMKQ
 ii9IumYZvmovKWDE5/A==
X-Proofpoint-GUID: 4Lpx30vn5oAVYyRbKF6djIOZYYDRcLtt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0
 spamscore=0 priorityscore=1501 malwarescore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610140033



On 10/14/2026 4:31 PM, Konrad Dybcio wrote:
> On 10/14/26 10:19 AM, Jie Gan wrote:
>>
>>
>> On 10/13/2026 8:38 PM, Konrad Dybcio wrote:
>>> On 9/22/26 5:09 AM, Jie Gan wrote:
>>>> The etm0-etm3 nodes are declared with "arm,coresight-etm4x-sysreg"
>>>> but do not implement self-hosted system-register trace access on
>>>> this SoC: ID_AA64DFR0_EL1.TraceVer reads as 0 on the affected CPUs,
>>>> so etm4_init_sysreg_access() correctly reports the access mechanism
>>>> as unavailable and the ETMv4 driver fails to probe with -EINVAL.
>>>>
>>>> The CPU ETMs have a memory-mapped aperture, so switch each node to
>>>> the standard "arm,coresight-etm4x", "arm,primecell" compatible with
>>>> its MMIO reg range.
>>>>
>>>> Fixes: eed738c6dd0c ("arm64: dts: qcom: shikra: Add coresight nodes")
>>>> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
>>>> ---
>>>
>>> Do we still need qcom,skip-power-up on new SoCs *with* MMIO access?
>>>
>>
>> Yes, we need qcom,skip-power-up for all ETM device with or w/o MMIO access.
>>
>>> GPT has concerns regarding whether we need to add
>>> arm,coresight-loses-context-with-cpu>
>>
>> This logic to be handled by HYP on Shikra SoC, so I didnt enable it in kernel.
> 
> https://lore.kernel.org/linux-arm-msm/20261005-shikra-el2-v3-0-618f7343695c@oss.qualcomm.com/
> 
> We're going to, in parallel, ship Shikra without the Qualcomm
> hypervisor so please keep that in mind. Should the submitters of the
> non-Gunyah overlay add these properties there as they respin? Does
> that concern all Coresight components?

Making sense.

I will add the property.

Thanks,
Jie

> 
> Konrad

