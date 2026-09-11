Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7763B493D24
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 15:47:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789141649; cv=none; b=Rjyw2dz0NTKySrSRBnE1ifG1fA4uNQyqutJxXdh2oDV8ONxmteGH1QoJ7yexSw3mc7mYySch4bHjbEMgHQjmgk7lez2q7amIelX/96fkyUp1tED3iWu4WjY18JHZC8JsLQ7LhnKSafH64PKIIYQU51QLvj4DVa0NFQdpPVziBXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789141649; c=relaxed/simple;
	bh=jQOKo/0EcaLTKkAlP93GOK9T1NRbX2+OwvLKoZ940lg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kZhwBRumim4w4PEb3T4MGOspYt6xFAe5yDa3aOyxPOIB12Yzw9L8Ej87it/fVJoQ8V61QxAwq20WmUDtht5AV/wjWrhV8JNvLaHE6Mfp5ffLs4Ah0sJfB8PSSXiiYZLLz4J5QYApfGPYY2MDjFr0+qGnRMOub8dsWaMyXN10M1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nIxyRhZe; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gEEKgle0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nIxyRhZe";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gEEKgle0"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68BFfsmp921790
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 15:47:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tAP4G/5H0Hyu01kOmdgc+EaLrKXNW6ITWSH6r5rO1zQ=; b=nIxyRhZehWMkVrXR
	2GaPdMAHZP7A+k0lBwJrtHhG5VfwXwjxPDe3WJ2RtymndrVQSgeaQ/djVThV4h0A
	DEvBMiNqn7x9jY6lTt8G+u/kvyA/U1zG/X2J8kyGjf1f+wOVflZYvh2BPcKC0SGm
	9HMaXNYZURecS5Z0PXMHnGPQkiWbyHwmsNZ/QZ31Kw0GHBMzphG+fZMJnFcmWmTg
	rN4m96B6FO/fZ/5jAzxOms9UJ32YnzCYYW8WxUNuPL8BAOhYT2gZ4Lx70SrNuXkx
	rlz8hE1HWYftk6GDuKOnUY5FAOMwn6P1ZXhnMBAutEcPCQrrIlTMQYyouNRHLRM+
	jQ0qVg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmmgv00nn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 15:47:26 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-939eb754904so14583885a.0
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 08:47:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789141646; x=1789746446; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tAP4G/5H0Hyu01kOmdgc+EaLrKXNW6ITWSH6r5rO1zQ=;
        b=gEEKgle0cXSKBsIP708SLZbNf0pfs1Uyj9mUIdaItCk+uwSET4QhP1Kkxz/+TTaHQQ
         g6lOh7PeNBocP6CBh7/JTe6wi67reXB3opN0CyJiqN/jboJN85qa4Fr5I5RuuLh7tKVz
         AmX5CDzVreqYJpfym4lBbKTyhDxSinyO9Uig9bCYbG0lhBGe/1qH+jAFXVlLHeWH/LzG
         cplIEZO6zyqRlC5P/89k7TxBEXq3IepMD7kqMcp9Lrjqdc/dBIQ/uZZ6nSxeUsQNNiQ6
         moWCZhdDKaFoZCviwV/nN7AjPBA50Yir+gcy3NpIScM2RAIblvSQ461GEqS7VI0kPyYf
         wPKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789141646; x=1789746446;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tAP4G/5H0Hyu01kOmdgc+EaLrKXNW6ITWSH6r5rO1zQ=;
        b=Uk5/AmsnL3IgLaMW06w1uC7KBe8jKqU41t3SoLBG8lI3Dod9KeeDstf2Ayg0kHi1yu
         0iCuCNAUN+kOAn8r6vPrWQQpNN0OcmmUcwkHsroxMWw12z+Pmo68+Zc27fb0xxntou7F
         yItZnTA6epTMLdgQVL86PieAdXWuVElTb0paZDGFOCEONCEvh1BCp1G4DeVdQZGt73VE
         35DM87vuwOybv0fxjtMnKYvqWIDsCU3mz9V4jZRjPfWU2WKuc5xHZO/MhrsFljTdUOHE
         x4O9c1VtZ6bcoDmlLhGmz2IHYzHmhep+b5bss88/P8BjQQu52KQYIlEpkHXM8jD+WqeT
         79xQ==
X-Forwarded-Encrypted: i=1; AKwUvBzs3rMDT3CbA39QzOkHGyt9dnxiGy5IN2NjvKMu5tJTUtPoM42PO9GcHu8rndyToNf7F5Ahn/Gc4bZBLak=@vger.kernel.org
X-Gm-Message-State: AFuF++mAhnAFDXWwvPKOtreDFT7nT0EJNB7ELLa7jcUIink+IyUkUqAU
	tyQ9vbDC4Dp6e4+lcv3mwiYBPKPcXlJTjtMOMwMsHb1KWqQdCqvKNxupKHsHIgtcjcxSqek+wxa
	CEIZeaUWdyLq6CtaKN/RIKT/GMpbRNnJGFjGeHwnN2FO1peuzNL1B5rps0ls0zPAbGu0=
X-Gm-Gg: AYBFou1ux3rgab18wRgNkXMs9g+GYGQzetqMMDTKNoyDA4PUQNLiDoOd9NpjM4mbxgo
	7qUn/GGn1gykq0tuz4f0254HiteJE0mAjXJClKYzUwpwoxKrV1qzWddw0K3jWxZbb4q3cNo8IxK
	Ct7/uWmbXyGNwZ1zbEFAuq0CAljJlH62ZCYvYj9YLTn0FkDujKzPWs22hA0M/be6X7qsbk+mR3E
	T0dBiA+fChS+2OMsj3WgDmm/+Q05PHPrVza8BbriMT0yWehw9uJNfaPNqdHhKpc8Xjro0UFfGdQ
	pwykmL/XwiY2IBxg1dv4rEGboV/uRSriG5fP5qsqlnxtsY7fZUf/hl6P2vakiTZ7Ig7R808pMST
	QaRHx2mFwN0bZjp6PKcKOtQ==
X-Received: by 2002:a05:620a:260f:b0:939:7e96:d296 with SMTP id af79cd13be357-939e9e707abmr563653585a.1.1789141645478;
        Fri, 11 Sep 2026 08:47:25 -0700 (PDT)
X-Received: by 2002:a05:620a:260f:b0:939:7e96:d296 with SMTP id af79cd13be357-939e9e707abmr563647685a.1.1789141644963;
        Fri, 11 Sep 2026 08:47:24 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a9b5912644sm984557a12.11.2026.09.11.08.47.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Sep 2026 08:47:24 -0700 (PDT)
Message-ID: <fa4c12eb-2b46-427d-bc47-a55e10e963c1@oss.qualcomm.com>
Date: Fri, 11 Sep 2026 17:47:21 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/7] drm/msm/hdmi_phy: Cleanup after
 msm_hdmi_phy_resource_enable() failure
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Archit Taneja <architt@codeaurora.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, stable@vger.kernel.org
References: <20260911-drm-msm-hdmi-fixes-before-eliza-v4-0-87bdb9f1987f@oss.qualcomm.com>
 <20260911-drm-msm-hdmi-fixes-before-eliza-v4-1-87bdb9f1987f@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260911-drm-msm-hdmi-fixes-before-eliza-v4-1-87bdb9f1987f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 4AkGEqdCRklDh-cAXiRyOPqM1fvkqCF6
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDIyMCBTYWx0ZWRfX/LgLSzMM90B6
 rYgD154lrfvCzLWTQwHg/p53LvxgCq3JMbrqJUlfvV/qX/T5zVhc6J/rUFS8rYtIwUoegu/QS9f
 lko+BlBdmz2YnkI4RbEmVWrvBucGvRs=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDIyMCBTYWx0ZWRfXzzQMQNiP9qqw
 zaqh9isddw5qJeeDyTH1shmDjmVCIpzcHcPQiAstjppXtibICDQP3GpPrx6vm4fZ0wSH77xjLUf
 6/OJSkmp4SWS0OFraXsUGo2YUfLH2DlAnfvoq++757lZE1j/KsUdtn2KZT2GG9i5AHv3xOjBdbn
 /dkyvkoMvAx8BstLazEjjep6Y/os9slZsb6n35r9JJrMdca0uqpXk5Gqe7+UiJIRaoQtHSt8wJN
 vOnXC7rWfIdyB28e6cq1kNiyxWV0nzqMj7ZCpd/UmKpGGmxLZE0iHA+32vRBLBPQdF6wEk8eV2T
 Z3W6CY0yiai83BWQeEEsI6qbDuRJggRAN0pUUS/ZCApkGhL8Zszqlo94FNRA0/YLU6B2hE+jQsz
 2//x99Hq4zfSriCDv2SAAZ15DbX1XCem1w7z5nZTmPqohwKmLXIBzvqedyDl5kBPlkcFj5to83d
 eGmCg4+1NUGdC52y5qg==
X-Proofpoint-ORIG-GUID: 4AkGEqdCRklDh-cAXiRyOPqM1fvkqCF6
X-Authority-Analysis: v=2.4 cv=EfFd0/mC c=1 sm=1 tr=0 ts=6aa4228e cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=5N7f0bWkOQp0pCbeU4sA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_05,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 phishscore=0 spamscore=0 clxscore=1015
 impostorscore=0 bulkscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609110220

On 9/11/26 12:29 PM, Krzysztof Kozlowski wrote:
> If msm_hdmi_phy_resource_enable() fails, e.g. when enabling regulators,
> it should reverse the state of things already changed.
> msm_hdmi_phy_resource_enable() is used also in probe path, thus such
> failure, which could be simple deferred probe, would leave these
> resources permanently enabled for the rest of the runtime.
> 
> Cc: <stable@vger.kernel.org>
> Fixes: 15b4a4523859 ("drm/msm/hdmi: Create a separate HDMI PHY driver")
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
