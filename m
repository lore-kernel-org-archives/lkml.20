Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 942C848822A
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 09:50:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790329822; cv=none; b=qe1WMb/XuzQB6dQnqlwwn2cJryymyCcvqFz0SrLHNvOAfP49Eo5bjZ5R2ccSXuFk6DtOPP0bJyfhYXvDyV1+GvKPRp32eZbUuRmtaovSZ7dsbJB00mHDOKx4DUr1FeLr9OPxRgBQJLasKma2mVRa4CmcKwXBu9PiExOND6eFl1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790329822; c=relaxed/simple;
	bh=Dke9mp13ZpcX4kPXedM9mKTUKIcxOeId2OOc/YcH3pQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JfFXSxxMPveBQZr1VJRkBUlrqTiPyrKXZprdEAIQ50kLGTUYZ05jmC375MsQrxBrag2bf8ugsssHyc8N3sehsENeFnLNZdmAQLZsAM5RkLhOCLhikKNKezvCzo90M0jdEftFW50EkiMZ9Zb33fsE0A1V5hf+k7V/FdF4fTDX5xE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ow9vXphI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Vt3gu7G9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ow9vXphI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Vt3gu7G9"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68P5Ijjj600036
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 09:50:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=yLHiwXQklmHg3BGQyexI717l
	yCNVJaLgg3xbK9n9cXo=; b=ow9vXphIS5Bk04s1Zxdr6kq+e9JGe+G3x+64k4qi
	I6G0Oz8rNoY3DpX62YJJ/pmMolcohoXmEn3stTOX8paKBZfxkkBUgOhdG58a61oe
	fxFdFrDUXGRSlklcYVqhpFGZY8tGEW9zRIa0NE4UyfdjYI/eeIBERLk/udv2nSe6
	7b5qeZr8YlpS+q0QTrK81b6QKQ31z4gI8iKgiAclXlFBbuM2gZIlMO0K906avSsk
	kAJ2Vrw9X1vuqgrvmP2giMl6VQyWxa61uGemmZj33yR7t7r5vLMZQogXdWVBx0dF
	EXOu8SNSFGJFDZEo3u2EfQ8cUU3XTjWO3ZaUbPhBTW5JYg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gwjpvrt7d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 09:50:20 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93c292c2fc1so172275785a.2
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 02:50:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790329820; x=1790934620; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yLHiwXQklmHg3BGQyexI717lyCNVJaLgg3xbK9n9cXo=;
        b=Vt3gu7G9jAOD8Y/h199VYNaBNd5XcIBaRIYTJHdCdQkoTDVGnUb6ALvU2rLSQ9TZAd
         C9xn7LIk7IfqApRxZFsR5c6MDpT6HXuEg5rZeGEHgsIN2+qQzPe7BVeEsBdVzjSsb6Wt
         8RhPXzK5f1HBdlbAct/64et+qaRKnU8aDqHEGJaFjF4UGJQwiVUqAvuX05YQxmW9m8//
         GYIiH1nAh9miGDkf0OSEVXXO8V3SVtgDNm0R9xjHryk66jFQt7DAaJ+5GZoMqlrmt7WJ
         Tjft4HHis4Y0pIKeX+ycVTZYfc/tRXGdAMlMf9ff4YckU6Nx3kdWw/kueV5LexSBYoOX
         1H6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790329820; x=1790934620;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yLHiwXQklmHg3BGQyexI717lyCNVJaLgg3xbK9n9cXo=;
        b=oQXvFqN58Bgk8JQy6JJNiAMTKfnbcX2gau8GM2Y32Ri2TdBDCCVMP6YK5AsaVLNGpT
         Ijm1nMzRCqxCjIdkyiO137Lh1fj1W6tB7Wziqr8YCEEm/mmBSEA12EBWNyg5M/vIk7m5
         9XjEo0qz3KpLLhonGhl+N5BpXE6HR+j2WtGfewq5VtLwm6w1vso3tqC9R8KqkAbCfIdD
         mCEBTaFvee36qbT12QdzIeU7IlffjMEYombBYA9LV23CycYAzYWiC75ZstkaPOYzF+6Z
         MZV2R4ge5zwqbGW9X8vk6xggChVRl6Rp/hxV2nsRoFJd0Vs8693Is+LK92+fkQUeUtkX
         n4Eg==
X-Forwarded-Encrypted: i=1; AKwUvByGmUfCwUeCI8XjYNi/Rnt34n4Kfj5HNLL+bQI3nEvSOFOuujV3xyyZgrD7d8qiP4s3HWLpkLuw9PQB770=@vger.kernel.org
X-Gm-Message-State: AFuF++notT911K4UEs/YccfmC5a9qpBf3rgx/Tr3TCvoWNDK+rRnLVvL
	cDWfKf1WSn70aw4F/qlj3hwFN3ghLJ7KqAbCC38Elz4S11aQ8zjhemzRME5/o0PqZlIwgNr4s7K
	7GqrJwV8z7x4Tc7IP6/1N6v4J1N7oy28FZIk2KWvmdNUGU/HWsWCPmioI8PqGK1ozFCY=
X-Gm-Gg: AYBFou3sqP+L4tVAQEIPqWHb7QvSFHhtJuTiaTh04vlYIeUxuaINXFc30mrDKj7U1kq
	+Ig8VBrU3iN7P/VBqInQAxCrhjXnDmsjnvZCVm4GVTvTX4J56eEc5zup4tA03w9xiY7XgpUOSs3
	I7aRyzZD4dGSFqsceAu7buF7jj8aHE+08bDFgYqU9YDenDom8to3U4ve5pG80kCwSZohS3YZ3qm
	A1gHl5nmZ3vefokptcwsHO0A/kED/c7VkzafgqxTNmHeXgazrqfeIGlCmVvr0xYddg+zQ5Tsxfc
	2aeJwaOt/B8A8GXmZ39QKC9ILuvKeba2NUPA2gUtZjcRrDeJnvCshQJy+GGGiL2rK0pmksDa9o9
	xXUthTMmzUDS/x/A=
X-Received: by 2002:a05:620a:8808:b0:93b:c45f:9024 with SMTP id af79cd13be357-93c43cc2c98mr342980485a.7.1790329819845;
        Fri, 25 Sep 2026 02:50:19 -0700 (PDT)
X-Received: by 2002:a05:620a:8808:b0:93b:c45f:9024 with SMTP id af79cd13be357-93c43cc2c98mr342976785a.7.1790329819260;
        Fri, 25 Sep 2026 02:50:19 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a355826sm5830535f8f.18.2026.09.25.02.50.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 02:50:17 -0700 (PDT)
Date: Fri, 25 Sep 2026 12:50:14 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
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
        Abel Vesa <abelvesa@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Jie Zhang <jie.zhang@oss.qualcomm.com>
Subject: Re: [PATCH 2/5] arm64: dts: qcom: glymur: fix Adreno X2-90 GMU
 compatible
Message-ID: <ahdrlb7wvcr6aczgrhiwuyy7ahi4ahvvv26aweucfb54hmwszm@f5spdkm35xab>
References: <20260925-mahua-gpu-v1-0-0fa0bfd8d315@oss.qualcomm.com>
 <20260925-mahua-gpu-v1-2-0fa0bfd8d315@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260925-mahua-gpu-v1-2-0fa0bfd8d315@oss.qualcomm.com>
X-Proofpoint-GUID: Vro1gDiHwTdCNM03CLbfVg9FXiLXyi1c
X-Proofpoint-ORIG-GUID: Vro1gDiHwTdCNM03CLbfVg9FXiLXyi1c
X-Authority-Analysis: v=2.4 cv=aLBlOr9m c=1 sm=1 tr=0 ts=6ab643dc cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=Le0wDFEDRhIWofPBaA0A:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDAzOSBTYWx0ZWRfX3wqNgx7AqPbU
 TIwsBbVQRR2nmugyGk3mcPe63TKWmT9VV9Exj8LBoh8IOw1ExJOVkfp6Y9LVjFrJVBHUZEr3Tl0
 LhfF9lAg8MpUD+aLyMC+plMaSVJaKOA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDAzOSBTYWx0ZWRfX1ABS7yrCOdtS
 SjMGY04UG3SSUpEMfEPHEpUSSm+g4tGaxdDdNeGaE9+7UAu5vicY1/3Nh+MMcrwjRAiIY1kYnpe
 YyC1VkpS9MTqnClvm+yA2XhLKMxhyEjqGZI8N+Y8wZy8Cmz38cHz8NR6WUKEnVzNEFfG+F0ZpZq
 phL0gbPXo+y3nsimGHHuu8LfA097B0ba0oKMg8dLs7KHF9szsZ7xiJ1/Eg4Jk/y1NdVyn374kYf
 X9OUEtkHVAGHzKb+ESyl629RjulBEIPdui5wy7dmJMgvvNnPpiialMrdvu0iZ4hr21CQFjvcN09
 nrtSlB+05JQlvz8z7YT6bRyAMQoKAZDzfnIgMLlyMqCFLhpf0K7GDRsATT7VaMB0ERDShgW106E
 OfS/vb6mQI70ZaTQITuK0YQv6HYuQ9UUWyLftObzr5pcCi+MCRkg6JelIl7JuNrJjnuvVOUkPUG
 1XH3OKdwWjIoCuyBjyQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-25_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 malwarescore=0 priorityscore=1501
 clxscore=1015 phishscore=0 adultscore=0 impostorscore=0 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609250039

On 26-09-25 02:44:33, Akhil P Oommen wrote:
> From: Jie Zhang <jie.zhang@oss.qualcomm.com>
> 
> The Glymur's GMU compatible was set to the wrong string
> qcom,adreno-gmu-x285.1. Correct it to qcom,adreno-gmu-x290.1.
> 
> Fixes: b6ff8cec8aaa ("arm64: dts: qcom: Add GPU support for Glymur")
> Signed-off-by: Jie Zhang <jie.zhang@oss.qualcomm.com>
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
