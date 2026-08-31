Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9DA83B9949
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 06:00:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788156042; cv=none; b=kqQ7vM1Nbv3MstVWEIAt3s2RcxRDpcwwxcd+tB0sHQoFhYpsJD1nnAmXALBGm0JLNCvZDlJWdUxFX7E+HK1cxCV6qADQdc4l24zh8LIEakH9y6ZxD9452xzF1UicdDA4l6+oFCR0mvV+pIz5mADf2oIkjNtnmWCtSWbsIfTAUEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788156042; c=relaxed/simple;
	bh=ajXJajPmgoM24esYnvl1jJ2aZyPSPcniyMhpLaJjXXY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jZ4NERp3wyG2AzjjdmMN5Wezw+n/4MFw9JVN8jArQ7PJAwGqQyB4Kl+XdPnkrlONMXIdQ9EKMNzjTIWhUV8wqA0nCSjxpcHV1lY8DDwweawFBsUge8qypd4LF1rFStrQGxSknA9n0a1QOC6HHIpz1L7KBSScOgHYMiK/N1Rg09s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=P80YZvD2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XCBG60td; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="P80YZvD2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XCBG60td"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67V52fEI2061156
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 06:00:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	niU6LprOtz1abqRWxAdbgVcbpUVnNtbMyz3RXpBA+6w=; b=P80YZvD2kLfpW/XY
	lVYX/nsTLNWjuYGaVvaCqhqpjjYr0+sxvGGQeHv/F3aymVWhlfBDfb/xnblMvPDA
	S5XnHVbONJiJSmkTH1dTTVQZeMPcvrmZPHs/F4F9xqyhpnNEDgLAcD0qjs7cK9Ee
	PurF1d6DpVjcN1Uc9kPotmjKUEUpxfvQ8rzOfhCqPzbd+aVgHdBO2O7hCA2qO7GC
	i2Fz8VVKl5xOq1FT8NVCjhTacHaM8etbIXdZZBubvFsWLQ4a683l7VJoPw+PUhDB
	5zAsUTG1Oj6oWsbWPWSANg3g00mk9xKarBwIgOvAdtyQUf++MmoE+OKRsz0tQ32w
	byTJng==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gbr6dvph4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 06:00:40 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2ce8a76df2dso60539255ad.2
        for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 23:00:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788156039; x=1788760839; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :from:content-language:references:cc:to:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=niU6LprOtz1abqRWxAdbgVcbpUVnNtbMyz3RXpBA+6w=;
        b=XCBG60td8bpV0sH2skao7w8Q37v/rp3fv0SRjTYkSwCk7WuETkCPhO5gaLIhNZ4B/Y
         nXH+s0m3GKLwivdSRPsg2T8b52J0R1xa6Zho/laDN15wYD5M1wFIHKRNbvk/1O033WSj
         yXdL2L3e7YGaOD/NV4TfDcZ1dcdOUI9GgQFzWeYaLM6hzboDSuc6gI1L7LydCfQJfyHn
         ET2fq+ejKI2yP11kX6rvu8ubJ9QUyDmmMu0Pf+X1OpsLmcaTySrA6zlCzQqvuEYrPAXF
         kmdf/SBv2Aew70HrYRATB1v8K1kSZMZ7mw5xz7Llrvmq9d/FOHYHx2j5mYoCXod4h684
         dhkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788156039; x=1788760839;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :from:content-language:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=niU6LprOtz1abqRWxAdbgVcbpUVnNtbMyz3RXpBA+6w=;
        b=AhOjjaTgW3b3LqDZxqcrt/YZaZooOdPUBwB1grju4IWON0SRKjSyO8FzcqgSX+uq69
         FJQIpIwX1Nx8nR64T493ApBPNem8Ey+Dn1DEZGP+MkV752g0F+LtU6LPpojhI7lvumNI
         l1Ccimt4nHEZ3aFpYvQ4FVbIeZvSHAl4c/mb4MUsUxXGnvedjrQf96isKmGQXTBATaox
         vQPjazgSeo92Oc/jIQLECObrjz/IEGdt2gnMgW32eC4QTcpqoffLsT2CllehhaMlDbFo
         oSf3iRPRCN/SSerxBN9Zyo8CEFTNR0G4i5BFWpXNk0yb7E4Jx2HxmGd6Qb+sWGkzpLPL
         oDcw==
X-Forwarded-Encrypted: i=1; AKwUvBwtvN+bx4XxxsVx3YlhHRqWU/3Abuh/yIdIjVBLm8KUuIUd9TXaLL5JNsKO0dEYH0PRm+3rY4o91Cy8ZEE=@vger.kernel.org
X-Gm-Message-State: AFuF++kvxOOtEwzY2mnNbASP/F7z+l+V7q+IAMFfRXBNjNsALE1+leOQ
	r20vjmnA58o2JE87DKimsq+s7bmhiarCdMVE5U+/hcSjGF9OTCHPlvCu5QA+Jyg3rHkQ3nt+j11
	B+urk4SNYZp77P1F2dFHAAZNU+YnxP4VCo73vPZ8f2vmWgihmO4nZtshQZ5CXMqFg5FU=
X-Gm-Gg: AYBFou2WA+pzToaDDy2E8S4HYK15mzKXxjqxLH3cTUj88uILcfQYBTmCEyf0Ivb+hsF
	UwaJwbcKiRciXCOlZcaI7mO54BkPJioLFVX6tmqGCTVB5JtMqEw27gRi/4b03PaEMI4Eu0BfJQa
	dvFFP72U8h2me8wRQ568/Xdb4xNHQ6h4XvvwuTjY6tZuoDdH2IFXs8Uqj7LH/JWKF608EcvHtkI
	Bn4Z4Gb+RAd+kQr96vVmv4lATq8IQ1PpmZrqVVbYDVmIbTtKANEq19jeE4N3k2YFEmkZT05ulmv
	nAEH5mHCFVJNWWWPXxxtkf+mB83FDkdqZMv7J9/JxLFaB2fmwfkH/kk2KvrPM4mo+RUFwobASby
	ixNAgkISrWmt+Z0Kes3PY/QQ0lHg=
X-Received: by 2002:a17:903:1b67:b0:2d8:d4d1:313e with SMTP id d9443c01a7336-2d8d4d14b8amr226900625ad.21.1788156038916;
        Sun, 30 Aug 2026 23:00:38 -0700 (PDT)
X-Received: by 2002:a17:903:1b67:b0:2d8:d4d1:313e with SMTP id d9443c01a7336-2d8d4d14b8amr226894885ad.21.1788156035118;
        Sun, 30 Aug 2026 23:00:35 -0700 (PDT)
Received: from [10.218.26.96] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d75986aec6sm28746735ad.48.2026.08.30.23.00.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 30 Aug 2026 23:00:34 -0700 (PDT)
Message-ID: <311cf38a-1af5-46fe-b2a7-4ea32c17d59e@oss.qualcomm.com>
Date: Mon, 31 Aug 2026 11:30:28 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/11] arm64: dts: qcom: Disable Inline Crypto Engine by
 default accross all SoCs
To: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        cros-qcom-dts-watchers@chromium.org
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260828-b4-dts-qcom-disable-ice-by-default-v1-0-1d6e0c2f5a69@oss.qualcomm.com>
 <53a855e1-5d5e-46bf-86e9-d605c57312f8@oss.qualcomm.com>
Content-Language: en-US
From: Harshal Dev <harshal.dev@oss.qualcomm.com>
Organization: Qualcomm
In-Reply-To: <53a855e1-5d5e-46bf-86e9-d605c57312f8@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDA0OSBTYWx0ZWRfX+sJoO0Oipmcu
 /dnKIeH/2KqRULdA6qZa3v0bl+pzrjZyCuFcDWhqll4MJJEUhVmF1hxLASyqQ4xdAUEB8ulUX8T
 LBNQ9Ym3bVwdprSBkqpz+whBspaUQ4NIw8Mey3k1LekjrsomlmRaY3zEnfbkZRjH/U0t9WaK+TE
 Vg+2BWtvXMXyd8g7wF1fQMGSG8qnL/7ketKcAnjZr9IV88oFjgLskIv/hNWYHOq8kzhioHn5Q/I
 aNqGEZ4hjcknfzuPNuDP63tmZ7+fSYf7kes5O7gRA12mR/STgvvdpFryn4mT79H04XqYi4ONINX
 AIEEHmaUpbtpf+U6mEOZyMH0E60Fgnqm8fe916Zlb97jaUK4Z2yztyjDzPyL1N0oqOquPvGt2//
 c+07oShx+Q5op6qpGQuoJ0+EUU2rtj5aUcqp/jCqaRfTazZfjTc94dHUXDObYYuGGK+fdalHyKw
 suA3PEmUu1MT5UlEYuQ==
X-Proofpoint-GUID: obifmeEQCA-8Tt9_fFRgx5mKZ5sHcnul
X-Authority-Analysis: v=2.4 cv=Zakt8MVA c=1 sm=1 tr=0 ts=6a951888 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=ZHziGR1QICH9RQWzh8IA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDA0OSBTYWx0ZWRfX3pFUDjQNuJMk
 V2UvlP0KkT68DLu+royfdvGf6aQjyk3Rz+BSBLjqu+NMNyKBFd+VuDh0pt++E1LUCCxAU5A9YGL
 u9x46ozS5FUgAwA9HUF5bmFsc1fdN18=
X-Proofpoint-ORIG-GUID: obifmeEQCA-8Tt9_fFRgx5mKZ5sHcnul
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-31_02,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 suspectscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608310049

Hi Abel

On 28-08-2026 06:17 pm, Kuldeep Singh wrote:
> 
> 
> On 28-08-2026 18:07, Abel Vesa wrote:
>> Since UFS_PHY_GDSC was attached to the Inline Crypto Engine and the driver
>> does not currently do runtime PM, the GDSC remains enabled while the
>> device is idle, even on boards where there are no consumers.
>>
>> I'm working on getting runtime PM enabled in the ICE driver, but the
>> node should not be enabled on such boards anyways.
>>
>> So disable the Inline Crypto Engine by default in the SoC DTSI and enable
>> it only in board DTS files that use it.
>>
>> Do this accross the board, for all SoCs that have dedicated ICE DT node.
>>
>> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> 
> Kindly check discussion happenend before on adding such implementation.
> 
> https://lore.kernel.org/all/56ab63c3-4288-45f7-bfea-d40046437a9f@oss.qualcomm.com/
> 
> The idea is to enable ice as default and independent of storage media
> and enable runtime PM enabled.
> 

I agree with the discussion and Konrad's point on the referenced thread.
It makes more sense to put efforts into runtime PM for ICE instead of disabling it
by default on all SoCs.

This series brings the obvious overhead of having to send patches for every new board
added upstream that requires ICE. Also, once we have runtime PM enabled, we would not
needed these board-specific enablement changes anyways.

Regards,
Harshal


