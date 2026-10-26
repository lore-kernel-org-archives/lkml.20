Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793019449;
	b=lp//nZcKuRCrTQky3bfrIC6SJNVpyEZrEBvGtkcl9m2PXXmlL7YKxtTzdRJcdDE9hubC
	 YTX0rBfqrUX6MCByvjhI/STyceaUJ5eMTI3h7qpr3PAsDYaFdexeojaKi40GhH+gpVJCN
	 WdcJh7+Urz09liCSICmQpMWG6/86nxBpx0j3ySqKdAS3qcwXYCeY6zuU1aeZFVBw5BheK
	 zEMwIBaEFsMNHhZxBCmPqbsYMmBMxqDQC24H/cQp3OY74djka+O49dNs3oZnL8l2AFJiP
	 9R1PibezATcUZay8Bkv9M0TTzsExm8J/qhw6ZzgpjfFaJcOPKs2L/I1UL453av7fDzA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793019449;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=JJlwZv7Mylo4VPK4tdb9i0GZw90Uvr+DmjdGxjCMtLk=;
	b=uYmi2f4E7SybNswLNP8Atk/uDlT01FIH2++00EZm4oM/5P9u/Mkrkfrsi+hqC0xkdpjD
	 Mx9DVH11wmiB1/r4By/HgdEDofITOsrGRDdtR2E+JAFmSL1Q4Be7bbd0BYhHIxbz1n9Pt
	 zbhOvjhpsHCs/0UrHjz7RxInsHCtxfEcCfyk2Ppqc05gEiNf8WPUpd863evbtS2ZGdkNc
	 4Hbb3zXwD71TWMNGSjErBUAV2SMrUdinGa+EfqWAqRT5YB11lpLKulRm1bE/FbUN+Zj6E
	 2k49qVagy4WomF6iswKrai9IWAGoprMBGFzmvy2vdhCXnW7DondoAh+ixYIuP33i6/w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TbziUNIG;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DkfXNezO;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D88B606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 12:57:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1D88B606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TbziUNIG;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DkfXNezO
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69QAspWw2168616
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 12:57:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JJlwZv7Mylo4VPK4tdb9i0GZw90Uvr+DmjdGxjCMtLk=; b=TbziUNIGgiHvLESB
	ZPmHiiqdkTrLmmrIuf9C5GfcZFcnqXlW0MYtifFIntpmAk9D16anYzdRG3Sp5gPY
	+4INz5pMfmWmcVHc5w2JUCmEZiQxNNPX0yG8aFTrb0E1VAEIqy9B8EtvgIIG5/VU
	bjjfMP59ruXvDvQvHL+VCIvwjwcaSPKZE/O6tTXSir+tjKsgedBhUXf/Sc8BGB/q
	NkjtxVwCGEaypanIvL58FCIapgR+IQmgHTebSUIqEpJ7Q33Rnu/F3qaP0rcsbDgf
	3mMbFAklXJQGo04WMian3TiQkndbjYH4C7zU1c8zFV4AJ68a+pGLvWwtA3xDxSkB
	SsO7sg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hj3u60upg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 12:57:28 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93cc50fb0d2so48279585a.0
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 05:57:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793019447; x=1793624247; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JJlwZv7Mylo4VPK4tdb9i0GZw90Uvr+DmjdGxjCMtLk=;
        b=DkfXNezOeronfwK9PBsKPy0ioyXt87OnhP22qHrdAZIFM9xVFySgQRXFG8Sa2UofKh
         b2zMDssqSU/Cnw+7Qh0wmVi07mqfmaVsBSCh5p98/PBhJMTnu6M7CPL8idGv6qj4GglQ
         88I8n4yvUP8UO22ngLlUGmtX0jskcH+nEayhovmFo7jkJdvUwJBnXYwbbcAkT03CiA63
         HNgMx5r143Xz5IKnL8ltN7bS9IKq36ZHEd6dFTa8P6e6rnTrPfs0gu4vThStDPvjYoZb
         G4ugvh0WzXUBdnS7zS1+uWH5XIruTS29XQZSq5DGLxArOJPLzl9BgDfuBF2feBaKgU6/
         auEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793019447; x=1793624247;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JJlwZv7Mylo4VPK4tdb9i0GZw90Uvr+DmjdGxjCMtLk=;
        b=cvVaPoaLyEoWqdL4zTXtNhtI5bu6UdI+faUDp8YRCXoPtCD3VGVnGF5b+itb4wnU2w
         zBsmnpdcSZgOWPuR0XSz+Ez1868FrDuWzblHFd6I+7yPVhLnfSIhrxsiaGGMBQxrHP5U
         6yCltB/nScSGpgLqHr0qXT+qgSyknf0ZjBoi1qC8F3V+OAxXTuPMmH/RhzEChulLuWic
         dU56FC7Kf7HPNllg2q3ky4gaY3zzsWe0fUvermaOPStNVfNB8v8loZIG/QxBuYD9VCda
         Y9dSGSzYWla1WOWpzHulIUhLXAIxLhLDIO/tQvpxyfqtBg+SGdhPEzmre24Qjaoj9l6T
         IKBg==
X-Forwarded-Encrypted: i=1; AKwUvBxuYSrwsYXlaSalaXg2ldEJSGd7CdqoLctdIv9t+s0calXcv2ihR5s3zDO0QxOcAJVoB1tbXTScOSTPnGY=@vger.kernel.org
X-Gm-Message-State: AFq9FYJdMDQRItqsGS6DsnMz9Aj9Nxv6/7sHbyYvHys+5d57xN5RGoKM
	1ECaaMm+NLGsd2a7bzeJ+D4fZ8p63eD9qlAErayeL8ZHm+NQv4h4UQPE/qiwhZm+LguaMwfO501
	W52+2yMgjSIaH09BofkHWGkSdIr2r1ZgVAnyxxnDsD12Nr0nqGTPPddGRD7UC0zgdMNI=
X-Gm-Gg: AYBFou22wkCToekj3YCB9eH8uufNv02kqwftSgLYbAP2KQmGK9A0jV7yN7NFwkbm+Rb
	EoeTeXTyGK2p5RuHWmZHJ4ujFUSAkc7rGJUqlEWOGG8PJuP7DgglMHlfDBN6Wo0eCQTDNABzKLJ
	KShmu/ynygZ2shONThLx2eHo2e69q7+MOodPlQ9sNFQd3ftwpvoytvBqkhMZlxK9TUIdBIZu0nP
	Nkn4ulL+dJj0hmjSZr76b2Mqpv6T5tPQfIXbZac/EBuUo7TyOPxkk1FldIyq0l15aoLu8suJoS5
	8AaNXpKkgjj/xIL0AmnxTB3PUvodfnGG8rS69Z4o57zV4JqReAoXNqVGDNja7RfFbq0G9juoS4u
	lO1bJATTPw2wQRSEN7XyZ9g==
X-Received: by 2002:a05:620a:8703:10b0:93a:14c:329c with SMTP id af79cd13be357-940ef7c179dmr1033547185a.1.1793019447124;
        Mon, 26 Oct 2026 05:57:27 -0700 (PDT)
X-Received: by 2002:a05:620a:8703:10b0:93a:14c:329c with SMTP id af79cd13be357-940ef7c179dmr1033542285a.1.1793019446570;
        Mon, 26 Oct 2026 05:57:26 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd6573dfsm316345866b.52.2026.10.26.05.57.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Oct 2026 05:57:24 -0700 (PDT)
Message-ID: <a272a425-0d1e-4409-bffe-19b77c0f2fc0@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 13:57:21 +0100
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: qcom: sm6115: Add missing MDSS AHB clock
To: Michael McAllister <me@michaelmcallister.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rob Clark
 <robin.clark@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Adam Skladowski <a39.skl@gmail.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <cover.1792852079.git.me@michaelmcallister.org>
 <7f99fda6f99d6053db240f2f1ba4d7b71da72261.1792852079.git.me@michaelmcallister.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <7f99fda6f99d6053db240f2f1ba4d7b71da72261.1792852079.git.me@michaelmcallister.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: qPwZZrrBhYyFuDTcxpBT4TwB8_AGafua
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA1MSBTYWx0ZWRfXwMqJ2Dm524X4
 1EYdOyYXBL1hOBREXJGSB9AUkjk6hrsfStA9l3fdJKCreiCT4hMmjNIwPuP/e4pEVA23x3ngq/d
 IG0/HmnYPdW0rzyXpkXQf+V4vkAsTWsL0hhYYte5jXk6KumT0SXu7R7f65fJvtLREdUuTiMydKS
 tvpoMuxfEKT90ZV76CHmi5OYsYQ3zYIW4EisKdT+V1acCnDh+pVZUiyE5/9WLzkzZXKepzSGerC
 B4q5Hq259QuePEycRVnFm0ENpfi/emF68uJ734NwsznqrE3d8hzBCK3ua9Qm2VpGEyKHBgg9PM2
 Du75PkQaMzoA4Lt+G2Et7pcGynI/dsPl8j+td1QcW0yA/mQabkUo9w4WARlrcq5+J1l1hOObZYL
 LBtG9PYFRb00Gti0udyJT9mWvpKJ8BLl3ULxgcZ13vL4xC/WYIGGVZn3XbTr9wvTlaDGrP0xYeQ
 NpcgjCBizXyobLJKc/w==
X-Proofpoint-ORIG-GUID: qPwZZrrBhYyFuDTcxpBT4TwB8_AGafua
X-Authority-Analysis: v=2.4 cv=K823jCWI c=1 sm=1 tr=0 ts=6adf4e38 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=JwJ85b4fAAAA:8 a=EUspDBNiAAAA:8 a=FTenTJsohk8IYGkfYDAA:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22 a=qg2vb7sgHZQYDKbllo_a:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA1MSBTYWx0ZWRfXwqbfRdrRjNIO
 2RzF12UveOD7PsBVQAlj56tJvljBzn+nK4asQjVettyzhHlGJuesI6Xa9ALL4zhJVNDjg0PaBYq
 tKE5Q/N854xHxtufbdaQAn51sQkonsE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 spamscore=0 clxscore=1015 impostorscore=0
 lowpriorityscore=0 malwarescore=0 suspectscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610260051

On 10/24/26 4:27 PM, Michael McAllister wrote:
> The MDSS node is missing DISP_CC_MDSS_AHB_CLK. Although the DPU child
> already requests this clock, MDSS resumes before the child enables it.
> The MDSS hardware-version register can then read as zero, causing
> msm_mdss_enable() to skip UBWC configuration.
> 
> On the Motorola Moto G10 (SM4250), this results in garbled compressed
> scanout after display power cycling. Adding the clock restores the
> UBWC configuration and makes compressed and linear scanout agree.
> 
> Include the DISPCC AHB clock in the MDSS clock list so that its existing
> bulk clock handling enables it before accessing the MDSS registers.
> 
> Fixes: 705e50427d81 ("arm64: dts: qcom: sm6115: Add mdss/dpu node")
> Cc: stable@vger.kernel.org
> 
> Signed-off-by: Michael McAllister <me@michaelmcallister.org>
> ---


Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
