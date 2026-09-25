Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D937E48E0FA
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 10:19:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790331584; cv=none; b=qXglz7EyOMbhWzufXqgc10i9oRxZswt1d4bbnjaCZe4z7MyGWQQp+bvMU5NZlmAbTsvrlLpxY3afUenqwwYsoexNG52YtU1DeXj0cr0JixyHn0yv0w+91WU5bhu1uIEkdtQ2MrsiLCuUYhb3+x2AtfTYw+iUW611EKMQvw9QV1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790331584; c=relaxed/simple;
	bh=4wQz6q/WvEKet5IUg/SEtqhktT4UMJ3/CbjwvROmgAY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IdEtr58nuCOuFWNBGnPftKJ7sn0wdmxs7H4y+Q7XteXWFuksg/FtdyBnPYUjrf8gbcTZlcCwHpDXAgxXOvE6cVrdBx7Hp0JqtdTS9mLr6kYyTXxzaJvBKvcuCXqz4QZfdNdd4aYV7fOWIvbpxyEdFJplRwbVZSX4tyi6wzahc+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=T7E0JYFA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FI9QhFEF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="T7E0JYFA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FI9QhFEF"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68P4YqBG1194213
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 10:19:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UKy4uRrDP1MEnH67izTbk5nL5p9jm1/EIV3ngV59HBg=; b=T7E0JYFA9ZEsW3NB
	r8i3NHnOoYNT+DaTyTzDHTa+z5SkzbhlHeX4vl2uVJ0b1IUwPZYBrLi2l939PMmH
	BubQuvmaUuRVQ3Y1kZOFoaHt2Wx/zTCggWfZ+6QzwEzrEiZ7pTtJoraZyWfMMJVE
	MfdaL1pV/RJJb8L36U71yPatOKO3jsAV3lp5uL7HBpVAHd5wNtwp0opG4ekWmdn4
	Hki4Az4YjO+aCFTeRXtqqCp7yGH3ZOjQG86HPcQOdxPEnNvLrhgl4nvjBzBvoU3p
	Al0NeN3wAALjPJIpD1AaSfDFhs4iZ+1qzjqt3PSZBPnMBHYIaaeNe3rP5z6kfLlh
	6WAvdQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gw874k10f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 10:19:41 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-9392788b3f8so4520985a.2
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 03:19:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790331581; x=1790936381; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UKy4uRrDP1MEnH67izTbk5nL5p9jm1/EIV3ngV59HBg=;
        b=FI9QhFEFimLnkxJb8PRoDp4dDCS15nLXRKM73l9hIJwOwCbLNS+BrJqTAmodXE4bZA
         ODNDmnzODpcrbgKQM8yX5H2JrInag5h/I4tamBOWKNzG37Dz+J4lTdadUMJY+fLOCdxG
         +eUfvd74HNCE1PfFTru2BEE7rmUGdNT8aAxgDTE4T7FF0xupBVm0SQbp3oj/K0MbJ66v
         S8isVA+9c1i3glSCd1j5D0SF95L41UITvV7/d9nESSuLJp6/M5RNfk1d2qTSqeJI6Cmz
         rGwZ/J9nvJP4aPcFq7Z8mURATyDfJLdwIc6bwLvMXLyWjkqq22E7wod9eQb7bcsAGlSq
         VIfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790331581; x=1790936381;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UKy4uRrDP1MEnH67izTbk5nL5p9jm1/EIV3ngV59HBg=;
        b=gg0afVkLW3jP06fZ39ZiZyOg7PlpL7e9JceR6oEZ7k3uj0dbXQmkeaDiptt++XW9kO
         eF8pXCznB9s0RVNpaXWM1J4Yoot26UJXRpoeQrCPmS6nC87ApbTQAKNje3PGVd8oYeKy
         luld8dx4bXJtnuLzqhIDfKL+pEtoasqsmhRK9rwdlqx9wG1hNAW9RDgCXTe6gtzo6CcE
         nKiUaTlcCO3tTvSHWMLFLTMhztEd1orIuNO1dCWh7SW72zL3+wFBtF9OaI3HQ9IA+LvR
         YOMiFYLY+nWJnVM1j3RJ8/YZbTKtgu9HFutmCQhiSQvFU5ifO5yfxkczuUB4tsAWPUJC
         qcMQ==
X-Forwarded-Encrypted: i=1; AKwUvBy4NxMxWxKy8Ojjm4EI6rDNF12Y8Ro4UMvNlRPxFBYbO8AzwWrQZy40EIpWGR2U3DdtJC/E671TUJwDE6E=@vger.kernel.org
X-Gm-Message-State: AFuF++lhpl/5KJYkfVEGu11hRLuwksPDmOmBvRwKWQvvTD/Nw7THe/R9
	0dhVPhibTQmVS94DdMG0WdjK2KzZNnYiNGv2zF0h0MN8kiOGtzjiXNg8pM13No+L7Bstes0q/7M
	dnrZbjDgFUDm+Gy1HdBO4jT4DGwqHmrNde1CxbSaJQr/6XXIJeoTtip+TZgujORl8QGw=
X-Gm-Gg: AYBFou22GMdHp+mAMSIJTlzF2XbNeLDOq3JxuvZDqS4fjLLJthq4XV/C0lXND1LjndG
	wBO62AZTZLfKUEOo5j2oC87vhMQtNS5ZcCj3rC37q8fM3471hZxLofIGKtVtl25hVKjn4T8wTrw
	G5myWJaqDUTCMD5M/xuIdGwJFgabqw5hOKvBB22b1+MFSvQPM1x/0EVstF+EplpPsDloqEpdtON
	4WfvigmuAXEJRky90pe8DFdaVnp1q2iQBcipOmVrImV6IqAOQ9WCMVkkbdv0/lyfghu1GbPWcNB
	+bavfo5BDupjb1NK9gGdJJ/F5ZLmH4fMDSp6RJOIgHR2CZgq70o/j/RS65hnfLrrCiBkl+OUFTI
	rIcB946LS2m+N1Liynhv3NA==
X-Received: by 2002:a05:620a:2b8e:b0:936:2f59:dfe4 with SMTP id af79cd13be357-93c439dbd0dmr314998485a.0.1790331580857;
        Fri, 25 Sep 2026 03:19:40 -0700 (PDT)
X-Received: by 2002:a05:620a:2b8e:b0:936:2f59:dfe4 with SMTP id af79cd13be357-93c439dbd0dmr314994785a.0.1790331580324;
        Fri, 25 Sep 2026 03:19:40 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2ae74815easm93578766b.23.2026.09.25.03.19.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Sep 2026 03:19:39 -0700 (PDT)
Message-ID: <1736066d-b50e-4b3c-9db7-5752927978a5@oss.qualcomm.com>
Date: Fri, 25 Sep 2026 12:19:36 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] arm64: dts: qcom: mahua: Support GPU and GMU
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jie Zhang <jie.zhang@oss.qualcomm.com>
References: <20260925-mahua-gpu-v1-0-0fa0bfd8d315@oss.qualcomm.com>
 <20260925-mahua-gpu-v1-5-0fa0bfd8d315@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260925-mahua-gpu-v1-5-0fa0bfd8d315@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 3sc_F2KGDY92soXrEE_p7sVpGN2gL-UF
X-Authority-Analysis: v=2.4 cv=MI71C8Zl c=1 sm=1 tr=0 ts=6ab64abd cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=QDjCMyA0A8yHJihhU1wA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDA0MSBTYWx0ZWRfX7g07c9uO3N/8
 mZlOx8dwyRkW2rHvTJcfbsQvsBxPgpYimWi6R46MEvOTg+bpkkbkpc+D2+y/eBljw4uUMqHbFb0
 iwDwvfAMJgaQLEAMoowLsHmqeOvBh7smQEtneHQ5VAmRn1SyupLYVrpDeFrI5GHkcUUaPyi7FHu
 eR9gzdE9aXS8FWbwAy4KZEJSTfgQyxtfmaJeTyGikQcFcLKOPcOlhiWrB1HqkIDaNdgVeVCdXse
 d3GG43UZorxQMQ3QnnqVppvKuwPlK75A70QOfvtJ0/MR2TtIev2FhvqDZwo0C694Wnx2EAWdLP3
 1OdCaG3uHZ3U7ogg7gVVFjr2RI3B2DfPLWottMR9Y9OusruYD2oqM30V7wBP0WW2SbTGh9YcXEm
 2OEoSZI4YiqTHT2tFISmGuFxc3p/qkciAObMvCBiRqKzCDdh8o4BiCPfGbYN9CVUQYbqdC3pMRR
 elMbwq3fWPoaRfyweiA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDA0MSBTYWx0ZWRfX+x7u/7215PEa
 yihh+xQgJrNwAv7x7MfUioJUiMVRHncaYJuy+uZ6zQHCfhZiX/muG8NXlmhO9GLarx2edYZV36H
 OYWunfeyIXId7OYVFci9qIA3xEjbk6Y=
X-Proofpoint-GUID: 3sc_F2KGDY92soXrEE_p7sVpGN2gL-UF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-25_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 clxscore=1015 spamscore=0 priorityscore=1501
 impostorscore=0 phishscore=0 lowpriorityscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609250041

On 9/24/26 11:14 PM, Akhil P Oommen wrote:
> From: Jie Zhang <jie.zhang@oss.qualcomm.com>
> 
> Mahua SoC has a new GPU called Adreno X2-85, a slightly smaller variant
> of the Adreno X2-90 found on glymur. Override the compatible strings to
> correctly support it's GPU and GMU.
> 
> Signed-off-by: Jie Zhang <jie.zhang@oss.qualcomm.com>
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
