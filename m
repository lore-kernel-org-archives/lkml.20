Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0507C48D896
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 10:19:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790331589; cv=none; b=euFypBjY692CO9czMslD1q6s/DZhIi6hERfI1nnxeQ2DaW2ERbuGKcCLMDG+NAexuEe1LbziFISoaTgHK+vb+agz6KFj98gVFnuCc4t3DPtjcSR+PD33WGIzDYMOvkRwlYVm4iJvg5BwuN5Xmd9stm/fqA7f5TscyADNRx2gam4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790331589; c=relaxed/simple;
	bh=JRFfmUzA+SnkmvIL77q5lOVN8GiVOkN2e8RTdRhku24=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=URy337dX68a0ptB71/hgrs9y4G4uwFzFujmtczKM8vnUTkdOHHbk+6XX40xStsVYnKPjbVLEHsGlxKJfkuc9xs24qCSMdPvtZuvcKAB1slxdPw/Acnpb7CCLSbD5g0mZ2z5n9tZHn+MB1JSWKudasaXm09TLto7ghpK4W+eYKPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=c82dJQwg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Nk7rqHIw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="c82dJQwg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Nk7rqHIw"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68P4YaCR039682
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 10:19:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ClUZQgHA+YXoNCn8HMzXL9kMN9fbDxeAKcAHr9vfWms=; b=c82dJQwgJaxCKTLQ
	CGw5sM33mKWVibfXzRzB6bWaocYOcqSmaYcVUlPBOU0Pm94fs7khL3sxTkhvXJTV
	BLp3ZpXhyaBDqLwoBcrfHwsONrcOpzlP1kq7itJ9eSx/8ijg7DcXP/kg4s1h/SHe
	pZXE0uocI6UGEPncqyxIWEXqnBiT0QQDx08cO3DZ5JDttsikTgrY5z02mhWkz0Z4
	LcpFQwElqmek6P7cJGMDYcJv9YkyuA+5wCzof2FMhJp/3EtWavc5uu7McB3T04K4
	Komc0yVLl2UbC/QcPOjUa2hFt7pXOY+e2K0IugK/yfrJkgmc/rnKsZmuDFZH0kLM
	iZGhLA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gw4654878-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 10:19:46 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93bfab40895so15790785a.3
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 03:19:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790331586; x=1790936386; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ClUZQgHA+YXoNCn8HMzXL9kMN9fbDxeAKcAHr9vfWms=;
        b=Nk7rqHIwDlvcucwdMpV2Qlc8msXSyqmelk6hrWrg0KT1f6Iml4n4V36/pQERY5W7P0
         jBs1x0NoMj2dNv6DiHTBvJZD1CcE1Q61OdrdqYyA4HmYw5QjmgVi6PzuwE14VVrHranb
         n/DLp17+uu4w9E3R0T8Qg6h96xJX0uQXDc+3xaJx8IPcXNYfPf0M9uLbxld6tyszQ5O6
         arHTNwWxjfn7KQ39UkvCNaxbXJTucxiIh3MG6g+0OmY8rgzbZPn6oRvns8KOb4Ttjmgk
         ZS9YXvGmxlivTuANXBfLtXuVMW1PwiqyMhVf38qr4JXO/HKtNxzuuY3aaCieShtOnRa4
         j1FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790331586; x=1790936386;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ClUZQgHA+YXoNCn8HMzXL9kMN9fbDxeAKcAHr9vfWms=;
        b=DV2rsUvqf4YuDhjwWPGZE5xHt0k4QRlpq1TptbdpQ8o1uH4GNo/Td09Y1HmimTn4jX
         GW6EykXuAu9pVXcnPdXXLVKMO5QggUl2h04wsOuqnQmDDngvnAFnERI7tsouSTXptqes
         mheWa3A6Y243u0yM2Q3WgiOGNXLt5CG3ZVLARTI5Zy1PhSe2KDzj2n4NfGOlJ32OVsZm
         48JaMH2+esHkpMRTiGZnOI7m89MkAo4EIMxAuAH5Gy7YFDlHVpVxO69qRO9AWX7tzhOe
         VNv6SwMag2ACZAuy9Np3cp5EkJv9hlOpQw+QXRefCsDaVchuO5rg5U9XOKVBiQ7hUsuT
         2gbA==
X-Forwarded-Encrypted: i=1; AKwUvBz+dhye4JIQ7LH88dGgvhRolhTpwXrd4T8oXefA10qr5utbTHKkmZcpZKUVNQw0RrShCUimvSuhOoADBx8=@vger.kernel.org
X-Gm-Message-State: AFuF++kw2jWJeCftIusUwQ1FGkEZQd5w/FRNOF0pLC53ffuvM70bgnF0
	mtQyjNmxKTNbChufHBwegkSTAJs/c5oi03Xg4OctKT0RA+dq9Wo1j1mLYegS+n/ZuqPlqJ1Ow8q
	L4P0yt0xaRUeQG65E451tePm070YIFfWEidBwdUMydHuhJ1QFfxQ1hE6lPzOl0WOfWhM=
X-Gm-Gg: AYBFou34Cne4NRsnwBLwq8vzu6U/i6Ud6zf69hm8cVWBkSEMzJak9VD6P1SFrOxm7Un
	8swW8Yd00ci1AVmPNrKqoTw77Eu7B2vlM5V44ijuk3M/xxlWZYJb7ieRnPYhLXNxMxpZi3lOVA2
	E3+PD3rV6JmJUmP5x3ZIz2u5Br5C4adwv0rpQOeZvsnS8c/MDl7mp8GnvE0ikDu1zObt1K42mqm
	t1EORz/DRBeHc2+hY2A3yDasS7Ds8NFOEIvcZIC/PXWi3MvJe0m7i0LylZPIQP8dxINmly3FFYW
	K/l0V779qPrhxV6LU+/LZ6kig3hP71/hdEIg/vGBgKP3E1TdDBMlCE+4o7Xv4iqbNYSRdfcIP4Y
	3knidpyhYJ9TXDzg2UCndVw==
X-Received: by 2002:a05:620a:6f06:b0:93a:19cc:107a with SMTP id af79cd13be357-93c43b941d0mr350438185a.1.1790331586121;
        Fri, 25 Sep 2026 03:19:46 -0700 (PDT)
X-Received: by 2002:a05:620a:6f06:b0:93a:19cc:107a with SMTP id af79cd13be357-93c43b941d0mr350436385a.1.1790331585697;
        Fri, 25 Sep 2026 03:19:45 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2ae74815easm93578766b.23.2026.09.25.03.19.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Sep 2026 03:19:44 -0700 (PDT)
Message-ID: <6c8c9823-4d22-49b2-9c50-476f61110def@oss.qualcomm.com>
Date: Fri, 25 Sep 2026 12:19:38 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] arm64: dts: qcom: glymur: fix Adreno X2-90 GMU
 compatible
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
 <20260925-mahua-gpu-v1-2-0fa0bfd8d315@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260925-mahua-gpu-v1-2-0fa0bfd8d315@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Wrq+otfv c=1 sm=1 tr=0 ts=6ab64ac2 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=QDjCMyA0A8yHJihhU1wA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: 4bbatvUP7Nz-oduqrDapyXQOcYFZjHnl
X-Proofpoint-GUID: 4bbatvUP7Nz-oduqrDapyXQOcYFZjHnl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDA0MSBTYWx0ZWRfX2qjCDpQJMxPg
 w6dRfuzZVCQJqJ1XF6uRbXrKS1ZDwdbNXZL9hQbwCrPgPJBu83Vuyls2tdfapo1iF2XIG4hh/6/
 d/P6GSh4mB3uQ/0OJ6oCF/oZO9w0nwZzL9H8TTiRcJUFX3lTsJLhKNUO9pOn/SBigmTCdzy2z9J
 4UgqkpCYeYBbFycmt9RoBRioMOTivGNSz33I1pTG6O7qhDEOQQLcgOTSOD8j+R2yCWthN5dF6+3
 MgXNlLSqYSZWur4HcEMm7rGSI4k+FcQDaW8xZTrsmimqKf8VB93ds+YhG65xXmeLTXKpkx6s5KF
 L0mVVXWT1VhlWqCh5o7+EH+zHe6DH9AIeotQhH3IF1ivMFXl5YtRx/BFWkZWNBq3MUht1K5TmAb
 zOH5J2gayw7BYugvX2w7f2Jg3uKlFpr+cUoLeWdCJy1qPHuMJe9/HE+d86O2+dK8M48tyYm76Z4
 fZI1Ty/Py9Cib9jmHPg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDA0MSBTYWx0ZWRfX5EtDainE0nvo
 d1389fRDuh+fd1JUNfPQU1ui6J1rXSWySEdAh11ZMCsLWQDINGyhAHWlhWk+jtSxTtRRVtP23pH
 So47LiMXlBkCLhfU5W4S40xDug3Yc/0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-25_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 adultscore=0 impostorscore=0 bulkscore=0
 suspectscore=0 priorityscore=1501 clxscore=1015 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609250041

On 9/24/26 11:14 PM, Akhil P Oommen wrote:
> From: Jie Zhang <jie.zhang@oss.qualcomm.com>
> 
> The Glymur's GMU compatible was set to the wrong string
> qcom,adreno-gmu-x285.1. Correct it to qcom,adreno-gmu-x290.1.
> 
> Fixes: b6ff8cec8aaa ("arm64: dts: qcom: Add GPU support for Glymur")
> Signed-off-by: Jie Zhang <jie.zhang@oss.qualcomm.com>
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
