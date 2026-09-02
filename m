Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEEBB493632
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 13:26:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788355594; cv=none; b=tWiwrpk48vX2LWIhE/GcnmDj0ZdBRVd2ecby0qhwUT8kHLwI+gpxSF4MGrOLwHLsHsySJjxKesdlId8hUJ+3sXehd9241kKHygHcOt9FLU/UsHKnPFEQNLFFG1bNLmA6sgfjwv9+UfzETQwmzoKpsjdwRYfqpfE25Q7ho0QqYLc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788355594; c=relaxed/simple;
	bh=IOYGewLhDOFm4x0hRfNM4AYVD0ENzMjIIDCNxqGXlNA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a5YnZyYlj1DDqS60+Ui67eLtjSXAI7+luMTq2wwYzgICNJZ+/Rr0PK/dtBEaSKsDP0TyMO1bOHuXhi17Q4BPiZZfMYVslRtYje7yNSxJ0XZnzUFiXIlk2I/Ts2P2wqm0JCD6AZzxFTUQHrVk4dVzQYZ7QTowfn7xDplK1ShpWh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EqQzVKqv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RtFJZN2r; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EqQzVKqv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RtFJZN2r"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 682CRP302002273
	for <linux-kernel@vger.kernel.org>; Wed, 2 Sep 2026 13:26:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=+fr0qc4FAUTiDXfo042zfsBe
	8gb47pwHgpFgz0s03Xo=; b=EqQzVKqvMp977hnDfUJoKXWHcl0xIlPx7Sr+CeEi
	zjic/9f3xzMdGaaJWM7IlK1gG2BWNi7EpJ5+tVvGLhlnE/OsVRcoabhNQq40umMo
	35t2Nh/JsnmDO41Wk+TUj8NQn+t3IMibAjj6I9XTZv6hiQybJduUEQCrfZibMVPi
	o5uGj5Aint16kYgkEfYWSwQ3eCpUKff1XS1QjHf51m3LlsbZrisEjKa2aEkMTrYH
	29Z+o2KPdWgW7/2EHOzgjJ92Z7P0tmwyu1M/wA893S7vba0bjZ0mBnVtBvdFiDtR
	k6ctWy5xdnXuapB7I15nxd3cxwOXpwkrbropD1d3FZqq7g==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4geguy0yy7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 13:26:31 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-90e869793d3so20114096d6.0
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 06:26:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788355590; x=1788960390; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+fr0qc4FAUTiDXfo042zfsBe8gb47pwHgpFgz0s03Xo=;
        b=RtFJZN2rWq6e9eZc+Q/FeUy9sD4VJD00VxSwYj6HIham8vurkdIMBJpInXr7CwqGyA
         uII/IGrJsmMbGuUKsEJ08rJs9rpAaMf3XTvQzTWTXX2Mt3Hx8hmpMRHoO0hKrOBOyYVG
         snyZrHkymbIoTr36Q1Yglj6mKieUSNmXb3AxUg9+VkwD3CU/CoFdkdhU3E0o2UMjFgbS
         ifL9Sj3vha1JSpd9qFAdBd2s/ieX9mlMWNryAMuh6sLovx43CUG6PEWdrbx0Z8mayp5Y
         OYznsosqD6LkDVWvlZyI4udfEvpGS8y5VJyCGj+g6f2aIsUVjNVaG71xHRZZU48p8NdU
         Omwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788355590; x=1788960390;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+fr0qc4FAUTiDXfo042zfsBe8gb47pwHgpFgz0s03Xo=;
        b=RGFTLlsxP4WtZ07pVwbGhqgPlem0wLTwxoJ2jcC0eFoxZEAecriewWCnmIiw6m6slv
         03gEd78hZLS5T6Bdc8mHIPHEcNlEKKwka+Lsjxc0BsEtyA6mS4pgH0sSCuFbunV8pPAu
         l7MpB3/D42jCG9AD59UdVLvihDgU+jsJOZ3Tjco4ARrIzW6FWJF5RlmRGlRtBiFWheRM
         C1YGHbPAvazz+COT3jEN2Bv6TF1L1sxtwLuIKlRafXTIF+rBV/1BtTZbYO4sEXki586Y
         q3ed+H4z5Jt7RjVn2K2/r/Vm2tTtZJRme7hz/m3lNy7z4HqI73zoyqb0nm1HQq45yPOi
         etcw==
X-Forwarded-Encrypted: i=1; AHgh+RpU9lvpofHGXLtsLL/jcL4M/nXsdlFk1KYt4KLywk2vmr0eVbJKlEULEWHRoK7Ke7VgrXFnf72b69KjGbA=@vger.kernel.org
X-Gm-Message-State: AFuF++moYNdYFDNnAW6mQWvQyNHm5FwFVQWWWQaASrsWu4oBB4Q6HlgZ
	Ed0u1LwTEu0WtxEbPnEu1qyEMVviGZYsHSFBMQWp1dy/i4BrdJAFyWWOX1guYzoGUp8k1G12QC9
	C4a17HqzXwE5W4TCQ5MAE4EDKwXSEK1D8mMpZLutB+SYX9SPKihtY6OYSDJxFRjTOYco=
X-Gm-Gg: AR+sD12F8OSlKLSlLrHfLJJu7nw5rVsEY6bSAEWqTTfXHCLqUYZh9uFdFDzytgHSK3o
	edAYtaAfJZOJ24kMMxq3dmtR/RrCioFd0Oc5FlCWjL8Z8zKck4YKMBp5AfplKaw1dmFO0sv7pKC
	rGKkrOW4xFhxoNr8FIJbSruQhQcgMd/zoGK5ji+p5uz+lodn+QUyfs4qwGcwxA09MCQ33gJt1pA
	qPM52Tw38njmgAx/OnZ5Swg1YA8iRNYr9WqZMbslzeXaGAK9/FQGNkQVwuTTMXzAPPJe1zXvjpD
	vp11NA5+EC5pSAOK0aPt7KnJuYw3pN/84I4W6gPJmj2Wunjlp97Ol8rw4Lf1aZSauS0ZyT7w95O
	DP3I80sugSICV5g==
X-Received: by 2002:a05:620a:a191:10b0:939:2812:8bda with SMTP id af79cd13be357-93960e1dcd2mr457339685a.16.1788355589780;
        Wed, 02 Sep 2026 06:26:29 -0700 (PDT)
X-Received: by 2002:a05:620a:a191:10b0:939:2812:8bda with SMTP id af79cd13be357-93960e1dcd2mr457325385a.16.1788355589014;
        Wed, 02 Sep 2026 06:26:29 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.178])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48448ed30c0sm6630997f8f.24.2026.09.02.06.26.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 06:26:27 -0700 (PDT)
Date: Wed, 2 Sep 2026 16:26:26 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Dale Whinham <daleyo@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        =?utf-8?B?SsOpcsO0bWU=?= de Bretagne <jerome.debretagne@gmail.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v2] arm64: dts: qcom: x1-denali: Add volume up/down GPIO
 keys
Message-ID: <whnzjy22lzm6ln7qzzqx5jinmaxaronsafm33cej5ox2aeo2p3@ctegjf3sdmw6>
References: <20260902-surface-pro-11-volume-buttons-v2-1-1d893c7b5440@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260902-surface-pro-11-volume-buttons-v2-1-1d893c7b5440@gmail.com>
X-Authority-Analysis: v=2.4 cv=UZthjqSN c=1 sm=1 tr=0 ts=6a982407 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=G5ilVN+faPP2Ze1SHB4iFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=RsaAdo6knjiJn5qj3ScA:9 a=CjuIK1q_8ugA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-GUID: iaOgnCrIXshARYYcjU24RMqJ4xpEutUY
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDExOSBTYWx0ZWRfX1PhLVmcuN56Z
 2IRdUL6ZTI1FC/MfWlxXpoBV0mbu37hcJCAqcTM2M6jszmLrv4xEea+4e4s+X1Mf8YzW6euiyu9
 qnczaKx+o7D0Bftcn1OZnZDTaQWohTs=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDExOSBTYWx0ZWRfX1fCDncV41cEt
 ZH9+iCse/JCIdjfLto9rvy/zikgIARQb+6jAjjDj7D3W0wRL9YdTM2gBc+z7QKzR5OGZWKUQqZV
 S88F/iyLSM3FHOPGlNILe65wYsGzT7IEwtfTPvA9vQ1VnZoCiErJY+ClFMGofxtwYl/m/qDHjAA
 J3riuhUM8etnnVd4sYAXsoHG70oT2vu25UwGtKVsYiwzlU2CXx4EpjCoUlHBYTTtZJFc5hh0vg9
 WIlAh1eL9jdHi4+6JXGsEUG5HYmIR4+kKJsxvt2DxXf+7mS0i2O4PLigFXy2pUnHFs0MablPr/o
 AslTocemy9zzZAvJfw83Wr98GZafm2tUtBEFWjy0Gc3Ne3fPbNLDN/ryFABT8pPngc9Byh4lbAZ
 cc6+Oljb3wtkiyqA10/Wo7STB2Jer/mbHBvAuduQKDLbLClHfAjqZjndccHWZHHo/AOY3nEvday
 Nf0jx89mE+uG/WfdYLQ==
X-Proofpoint-ORIG-GUID: iaOgnCrIXshARYYcjU24RMqJ4xpEutUY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_03,2026-09-01_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 impostorscore=0 adultscore=0 malwarescore=0
 lowpriorityscore=0 spamscore=0 clxscore=1015 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609020119

On 26-09-02 13:52:36, Dale Whinham wrote:
> Configure gpio6 and gpio8 as volume up and volume down respectively, to
> enable the volume rocker located at the top of the screen.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Dale Whinham <daleyo@gmail.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
