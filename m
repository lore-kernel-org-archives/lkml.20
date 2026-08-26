Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 901F53546ED
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 13:04:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787749481; cv=none; b=MolqBaem14YzDTBioHDG1XQKyhTX1cS9wd9uQl7BoMq26f2Q2W91AdI3R/tjtQ9xRLWuHpYXPqfEO8ZoPVUHXnnm9f4Ycxf+O+ZOiEzgJA/399Q8iH5M2etKl1wy42Fz93wvQaUI0yoIYvyKm2FwRW8y5IJWO/8/I/W/Qzz1c1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787749481; c=relaxed/simple;
	bh=B/QVNW8c9Yt+HEi6DqXYIndWDMwJZmax5BegMSf9VVE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Imzru6ZvfSjzuB9/KFbovEmi95Po3Xt/+Oa7dYM7p/d5N/rY4pFoHkf/7okTrKom/YQYKiTDvCA5kHSC8KKD4EKkBTemn3gzFa3N8WtxkcBanvIzARKoogrke7gEJqCf8VzgrzifoQAExzJXdtCxDzPq+b6BHWZsoIZ6/eKddRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=F5+EhYIC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PRjuWaCw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="F5+EhYIC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PRjuWaCw"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67QCC3Cr768365
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 13:04:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0C0iLaZ2vQND+BywaHWsCvdfSggpZz0Wz6j9aE4SHDE=; b=F5+EhYICABiU+9Ff
	NQX58fKSxGoQO+rAIB0Mjg/415Dqh4JVJ1XzCvYQ8HFCQNngp0vjZr0vkFmaE1bg
	HAq5yB4EbLfpI/8mXzPzvnTrSsFlrKXqs2kLqg5bSCvfjSJqcqerltVEVT3J/8l9
	M108TQ4JLyIQLG6h8Jj0nMhQUYZEEmE3SqIu8i7YSFynnqryuil5mn7f6xOniS/r
	X3fcRpCM15tVMbKhz+xJIemEuARlP1qvGIFg2Roam2VPX75ImfB7wc3Xk/3jRnOe
	MM2cx+52Z0uBR1hH3g6iRMWg3YYeTr3r5+vSw/TKk3afLe6P+80HQbXkR/5mkNEf
	0+n6Vg==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g9x2n0mts-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 13:04:39 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-97c3746cd0bso11468241.0
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 06:04:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787749479; x=1788354279; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0C0iLaZ2vQND+BywaHWsCvdfSggpZz0Wz6j9aE4SHDE=;
        b=PRjuWaCw699Z+MT5Q1C2FgYghUl4tVdkBkpGwyR78A58SEy3ObwY6GXThjZc4u5/jS
         yLMXCRGekex7eSOl530G49+uNeH0jWp6OxSSV57WOAmXlb42aVaYgsy0A4PjFLrlFv/1
         pufPhsGj04rC9ZYqQwQKfHbkCZLSg7QhQ9lEYvD/Fn8UUhGlVxemKDPtEQanuImnTu8/
         1GzKH18k3F5IieE1Mr2QfIfquiV7REz28z6i6nJQdAiRQUU3A4irg0g2+t3clvoEZrNy
         xfMaKPb1vgIBnaTqwdhpO9fnDDQrWWVovEyThLmrohfeRyRIsSXtBH4UWH45LH0L5phG
         uGzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787749479; x=1788354279;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0C0iLaZ2vQND+BywaHWsCvdfSggpZz0Wz6j9aE4SHDE=;
        b=ql/LXOVEa2jnvdYNF+oi8a6nJJUdcrexgNTIO05dbyvWj5VlLrhq1whKh0VTVXlTp4
         jeo4X9hhpjpyE4hHf/ySIPFE7uR2ry5PdfeeOukFfO3cpkghl+MLGNgMrqHejc394r5E
         QN8RQ5EiNJ5qCtlHGTtPVJF93Ytxqc1t+pCHq4NExeU7MEuSL/8RWIEOpnChAY9y8avD
         D/ic+I/cAoNijP77/x3H+QmL8X6tn97ewVzSxMdm9/4mdydtnddK/ikmYvbYoP4Hhtnj
         Cr8qWBMkgZlIRD/42chQcnl3PIhs0llxH5gnIESbOhNnVHxycC8v54CJ1RhCqjtPHJm3
         W1eQ==
X-Forwarded-Encrypted: i=1; AHgh+RqCX3copOg1qTvuXgM8UkjAL1uSy0SQINFQ6/4BsA6zR5kklKpjWgthoXhrEtriaw+vRaeORSVCn9e/n1Q=@vger.kernel.org
X-Gm-Message-State: AFuF++muiYh+Krgpugv1XYGWjv0KKfYfc2psRvDxx4W+dBrI/piMRqSG
	rqIn3R/QgRAs6zYmkNI5cLiR/Eyv8VXqiY05o/CZW4UaxPT5YOwqFlytYE4HxsvxD3ylZCaTc84
	mZu8fWwaIwbaTLT8ChUg7ngX+X7fSlzV3SanBeAn+WGfOjdcwch5yxe2nmSHrotfhCZY=
X-Gm-Gg: AR+sD13w8n4RoEU/US7H0JMpSj/NOWsU4wOBItsPfOUHMJKPS0jK27+k8H/aJbZ1V8Y
	V8HyBg4X2q/IVIIez2bvZ7icbiWxnAXdPosRTPDtW5KwrG8jtwmMAlpWTKPffyFxQFxUuHuQAR0
	J4Bn+F9bxqfLnc8lvMFg0oycjAhH4qh56ubrf73hXYwXFxhjqTh85is7wBkaTt1saxSGHch7kg5
	ucKETz06+eYItv9FS9xsL/g+Cj/AArqVEniGU8wrbr7tQ2MbjSsD2z+A3MTxLFRLKTgxGizWlTy
	YpupLX/xXfkfTWmCVeM9khbjNAxa9cuyyPtszFFMjj6hAacUVxjck3R8GbIBdl6vtBVa2Ck1O67
	Bu64p/YAYNBsMR/7fpyVq6Xas
X-Received: by 2002:a05:6122:2c2e:b0:5c1:24b6:a1e0 with SMTP id 71dfb90a1353d-5c66c6e06b4mr47952e0c.3.1787749478888;
        Wed, 26 Aug 2026 06:04:38 -0700 (PDT)
X-Received: by 2002:a05:6122:2c2e:b0:5c1:24b6:a1e0 with SMTP id 71dfb90a1353d-5c66c6e06b4mr47844e0c.3.1787749477474;
        Wed, 26 Aug 2026 06:04:37 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c250a5d671csm450856166b.3.2026.08.26.06.04.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Aug 2026 06:04:36 -0700 (PDT)
Message-ID: <6b2f4411-9c38-4b82-b605-6b9a047ab973@oss.qualcomm.com>
Date: Wed, 26 Aug 2026 15:04:33 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] pmdomain: qcom: rpmhpd: Add NMXC power domain for
 Nord
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>, Ulf Hansson
 <ulfh@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Bartosz Golaszewski
 <brgl@kernel.org>,
        Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260826102746.633076-1-shengchao.guo@oss.qualcomm.com>
 <20260826102746.633076-3-shengchao.guo@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260826102746.633076-3-shengchao.guo@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: DuVnHROYihqNkiff5yKxqRwLOOSKOpt8
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDEwOCBTYWx0ZWRfX3ZRp8P9u5z6p
 TPlWJe3zuRW2NzYT18cGJpbZI744LZH/If80BsEfOSWR5rH0fB6rBbiqpUlzn3ji4tHcs6RJMnb
 npIc03lRcc9FTVCQbYCvdO6VpOm/kTo=
X-Proofpoint-GUID: DuVnHROYihqNkiff5yKxqRwLOOSKOpt8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDEwOCBTYWx0ZWRfXymnbpxxtLJjD
 YNsExN4QOgNoiqPlHpBDnU0VfFLkcZIox/Ju2NTh3ubRKE46cNztPtAox0NL5diOUn/cCkZBvxE
 SnZW0IWCCvCCQFLnVZ1jzUk1SrWJ3BLQsPqUduXBEvhZO+9fe8sRqu46lfBzrfeFJAWw/0SwdP/
 LdkfTBtPSJll1NQ/nU4oI9KnDi8fZH3hT6pbKDisE3QkZRVS5prrS9IOs3zs2WQMpqJdrGSFqVQ
 1myhhYzVqgm/h3zko6U6fxidP9H68n264eNwSLQ+53nOVjjMo0dz41qilfNDwMC/iMygvmcOjuX
 uzQi5KSxWZhR2CAc+WdIo9nqNwbFzmgOL5dc+tmPTOXlGxQyfD8gon14vZfoBZGCfMBTqFOPjH8
 lKy8HxKI1yHyhciDq1VpQCXwfxPGu19a4fpl/7DcSOMI6ID1CdgR3lNI4qsbvZ+RxgGvIcrQAkf
 XKfpqqlUunKa5rWDwtA==
X-Authority-Analysis: v=2.4 cv=PPQ/P/qC c=1 sm=1 tr=0 ts=6a8ee467 cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=oFIQYVkMYUJ5M4t5nqgA:9 a=QEXdDO2ut3YA:10
 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-26_03,2026-08-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 clxscore=1015 suspectscore=0 impostorscore=0 spamscore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608260108

On 8/26/26 12:27 PM, Shawn Guo wrote:
> From: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
> 
> Add the nmxc.lvl RPMh resource and register it in the Nord power domain
> table. Nord supplies the NSP memory rail from this dedicated resource
> rather than from the shared MX rail, so consumers need it exposed as its
> own power domain.
> 
> Signed-off-by: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> ---
>  drivers/pmdomain/qcom/rpmhpd.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/pmdomain/qcom/rpmhpd.c b/drivers/pmdomain/qcom/rpmhpd.c
> index 96e4bd2f5a14..717c44d1c39a 100644
> --- a/drivers/pmdomain/qcom/rpmhpd.c
> +++ b/drivers/pmdomain/qcom/rpmhpd.c
> @@ -198,6 +198,11 @@ static struct rpmhpd mxc_ao = {
>  	.res_name = "mxc.lvl",
>  };
>  
> +static struct rpmhpd nmxc = {
> +	.pd = { .name = "nmxc", },
> +	.res_name = "nmxc.lvl",

The commandDB sources suggest this shouls be nspmxc.lvl instead..

Can you dump /sys/kernel/debug/cmd-db?

Konrad
