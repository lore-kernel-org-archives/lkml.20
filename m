Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3555347206C
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 08:19:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791965971; cv=none; b=C+DwUsnl4gJE/EYPQf0uKKsCnyd1wVyDLT+QTeDlg/S090rj72m+zQNVSmLUZna9RlQ7bTuoP1Q/ZPtbQXhwe55qQajy4bB8VFiwwPXbRH7/TA8mz4Q8MtsvJHgbF7ua1nivGvpXbcwENa9aH0fvxZafR5oxQ3bgfU3pX0/uV7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791965971; c=relaxed/simple;
	bh=AF/M2QUc3HS0zAXZvg7CLpXtwc/riRp7CNR+gaWg4ws=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UKCMo0yOxGgi55G/J2pb8ErToKqx/PkRHgobKLz1sHS/8Sk5Xg/T4stm1i/HCdIbwOKdy1iQIrVAYL6YiImsew74Y/49/9HO3rat7BPJ64bOV6BdP8tBqtgMJISI/CWferqDTTeWVryLR858c2Vzs2lOEPpXqdTbSGqZMpBrT6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WAng+t0F; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hdhG1dqY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WAng+t0F";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hdhG1dqY"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69E2RY2p3000901
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 08:19:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qF1hH5RPHrSegmpy/X2YYmZ6AEanlyV1H9Uz7n9WGuw=; b=WAng+t0FxI76CvQ/
	/DKpzWOnE7txhKKnM+yvoKkPopUPuztXagoq8GUOtOhweA8r4ADKMwYTYUiFeMrb
	G9H85mgZrcLfOr3jf6L2QRmJy5Laja2HbNk4OyyNewlM+7dFoRquqTZ4Qbt6wNDN
	Hy55gQQraKu4iDc60m0ZYpgBcoMp/1gOHGOOr1UKnBSPPtuhVESqKhdZ0QymHMmD
	SRqcLGqgLDZ61dYEHfBvKH1kFPyuFxz/F5kFxD53EvMZHQfbzZhBqa6vrwOO6OU4
	NQdN387amfZIfVybxNmFDRA+a74VT4QwFNSveM+296nbEHpWc1vUL7Rko+w8yFQf
	Qccx1w==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9sbety2p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 08:19:28 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3ac450b74b0so2067994a91.0
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 01:19:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791965968; x=1792570768; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qF1hH5RPHrSegmpy/X2YYmZ6AEanlyV1H9Uz7n9WGuw=;
        b=hdhG1dqYzle05R9LcQV+aRe0YTxjPEcxeC0tg43E0Bs71aJcAQzFkg6zKpr1l4Ns5K
         lhdI3Vwj9nAB+16WZgQLRhAL+6g72TqaM43StvGEsGe2QkyF423Wk+zleINwqrQucnDe
         ieUy7sNRDjRgF4bSQzg/X/SYaXY+6Q6mT22Ua4F5HjWb4+djG6KWxoJzrvlaizN9EXGT
         159+2McLA5Vyz8fnwvL5uYXFgL0lUMcSxC7xp25zVX0YnI1HEI5ZLTvMfGze7B37zd/d
         ACIK2dFP8qtb4LlB7dfGk7jCuef9nqIVOvzGL02N7Yi2tGropu50jDilQ3wASpwJalk1
         fRVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791965968; x=1792570768;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qF1hH5RPHrSegmpy/X2YYmZ6AEanlyV1H9Uz7n9WGuw=;
        b=LeamAW8SqhA/ZPnvRlzc+UIrQqJt/jBzCrGCVuJcsC++HwuI3OW+YtIShWLHeytknU
         aNVhWffB4/+2iimJ7ZsyFu+d/95zpjCMTbPtXm4pUb8UPWqccgHBEFR7F3ZhRVuIkELc
         nQOTRjJOYC1xzt1glE5x3zt/SYkyeHnQXiIItuiK5q4SZg92yyDWJ6T/H/+d6C/8b2v9
         O7kj4zLgYZMm/srWGcBEYGgEvpuZF9JBDr7VZgl+cmIguekFcarqOD64TUEOFQr880U2
         TF1ZpWEKQ+1l7LJGH0obYINDfvlWBIPb4C/jBlib3OT2oiTj6kybexgxXFqz6toQEYvP
         rScA==
X-Forwarded-Encrypted: i=1; AKwUvByusL3lirdPMnyGSNRyRK5BcPIoVMnQQ3bjqxhllJxDHlavhZANA6/RHbdDSshmWFAsodFmPc3BVBoPrkw=@vger.kernel.org
X-Gm-Message-State: AFq9FYIyxhGQzyVTaEir4ip9fhkJfSGtp5y0+c9tw2iiXhzsuP6LgDjp
	3J+D7SOEh9tSlPjvE2tzVogUQzhkHI2J7K3BjAUwpOzIZDftuf1DDmHdbKCe+VQ+OMekjJAk5Z2
	Dt6VuKqFyRTYO+/pc+HapVC0QdMaRtNeS8loJRnhpcHwpcMNn6xfffredWx/x//MYNn4=
X-Gm-Gg: AYBFou0CndlmpSROJDCHlh+dXNvTSnDTYzgPMmHHz8hAfFzvRPupjiBVjp5KyJczJCB
	Fd/18lRqgZ4To9FoXd5/rPAG4h4D/DEJZd1R92SvuCXNtsQ+Aqc4ykBqXj1MkBRiEyjtGsU6jfb
	fy+d/k4caGcChLqGlicByxmsLyp0HgpJY6Z64bZCzYD1l8ceOGQFIJz2dFrM49UH3pYD2bJIDTd
	RyccFUsXWVwVsr6+/f4T2pHx/Wsf56asXZZSYYrYGe3nSr3jZzJEHjlnmcEbcyoTy9AVVZvV/Px
	ZgzTGAa7xz4BLyVRZiLFwHD6uY6Firdt6hrNqYN5EA+n2YxIGa51mmKeFxK5yUs6sSVCpGeC7R2
	x4bW1bdE1q+Cflh7i4xoml82Jcx8Unk2RBlosXcp6dEsXzhnCEN9ORZdE1Hf42ro=
X-Received: by 2002:a17:90b:2d86:b0:39d:f4fd:8075 with SMTP id 98e67ed59e1d1-3ab3a60eb9bmr12305271a91.19.1791965967540;
        Wed, 14 Oct 2026 01:19:27 -0700 (PDT)
X-Received: by 2002:a17:90b:2d86:b0:39d:f4fd:8075 with SMTP id 98e67ed59e1d1-3ab3a60eb9bmr12305251a91.19.1791965967038;
        Wed, 14 Oct 2026 01:19:27 -0700 (PDT)
Received: from [10.133.33.80] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac61171feesm3310846a91.17.2026.10.14.01.19.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Oct 2026 01:19:26 -0700 (PDT)
Message-ID: <2a6b9567-e07e-40ae-a214-2a4d6bcb29d1@oss.qualcomm.com>
Date: Wed, 14 Oct 2026 16:19:18 +0800
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
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <3fe1ac52-f69a-4288-88b6-edb5717dd315@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: yvB2N6NY6qT3z1F35d8sUQDMY577NTbG
X-Proofpoint-GUID: yvB2N6NY6qT3z1F35d8sUQDMY577NTbG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDAzMiBTYWx0ZWRfX67eWtUg8Yp2t
 e1r+P5H918DRB5J5OXA4Hr21d8YsY6aCJWEy1E6gyJdStkhGtFp67UnvEqfgDajSq5/Q322OaXb
 GkrxP92biVBA3/DlDvA6wDnphopi4IvUE5nIzU7sr/+IBjKeKsA6+2mvc+QCHze5SeGee8Hyiqe
 YS9gudcpmkwBqzArWYAZ5DoENsru5vvBTf47hLQVI+x/PyFo5EtwuKgL7Dv0odpS057gtsfMxBs
 e/qPEGG+xghOAYj5zd5BGYyIVdT86HCDI8GQ1YmM4AbgglM+vENIimwPTSrGyGPJKAJqtzu4M42
 ED1EX2KOHigOhDVLbLu5YbhwJraqteQYwuiDtYUcFVseIL+IoL+BHHWgTGhtJO+yR7p7+pLLBCa
 NGetPbcVeau27YnnrWLlMu9MGFQ/OwYk03TZC1vb2n9/s4D1Og53ONs80W5WdHbPk+gBIiskzm7
 hKoKHP9vu4r4FYsYXXA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDAzMiBTYWx0ZWRfX66Sbd1JsT1zk
 pDjwIOjAKDq6qrqMumBn5JSnnQ2yrOBW8uWg3FngsC3mEg8Bn5pMc3FBr0ePuD1qT5hm2ykTtnb
 kAov0L4fbu3y/XjNn/aGh8scXNrbQ/U=
X-Authority-Analysis: v=2.4 cv=U7AHnuru c=1 sm=1 tr=0 ts=6acf3b10 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=Udf1bCXIbt1WAqPULBEA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 adultscore=0 impostorscore=0 bulkscore=0 phishscore=0 suspectscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610140032



On 10/13/2026 8:38 PM, Konrad Dybcio wrote:
> On 9/22/26 5:09 AM, Jie Gan wrote:
>> The etm0-etm3 nodes are declared with "arm,coresight-etm4x-sysreg"
>> but do not implement self-hosted system-register trace access on
>> this SoC: ID_AA64DFR0_EL1.TraceVer reads as 0 on the affected CPUs,
>> so etm4_init_sysreg_access() correctly reports the access mechanism
>> as unavailable and the ETMv4 driver fails to probe with -EINVAL.
>>
>> The CPU ETMs have a memory-mapped aperture, so switch each node to
>> the standard "arm,coresight-etm4x", "arm,primecell" compatible with
>> its MMIO reg range.
>>
>> Fixes: eed738c6dd0c ("arm64: dts: qcom: shikra: Add coresight nodes")
>> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
>> ---
> 
> Do we still need qcom,skip-power-up on new SoCs *with* MMIO access?
> 

Yes, we need qcom,skip-power-up for all ETM device with or w/o MMIO access.

> GPT has concerns regarding whether we need to add
> arm,coresight-loses-context-with-cpu>

This logic to be handled by HYP on Shikra SoC, so I didnt enable it in 
kernel.

This property related to etm register save and restore during pm_notify.

Thanks,
Jie
> otherwise lgtm
> 
> Konrad

