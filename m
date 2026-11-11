Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794403079;
	b=l/edBbp09mZwNIkvZ/DEYTEOyDHwAgkYr8yxFNttjLKYHPKIW8KAzV02wj+Rm9EiZR95
	 UQALyYRZeRn9vq2Ke/nbAaHTxsADT7uQFWwAmyX1S+oc2Ey9RhbaIhkoVw/QZmjInCSzQ
	 Umbs30lFDMemov2bTV+XyDBSvKgMwD8YRp/ouHramKvpr2Np5KlvOqTwUHXmMwg60WQhq
	 ghRihdNCij/V8oSZ7n10/itsxS/s7yi+ettN1n3GPuxKYUps6KstEXDsC0yOWWcdZoHYI
	 ZKAS3Y+VyGwx6u7QtUo48j8KRNStETyDdkzyQERfTkKQhBHWNyaD5Isn88+tuPfQlBQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794403079;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=rJPCHE8Tetc6T6Zx5wds0tJANIOD/gQ8/VVy3tOE6x0=;
	b=DPxvD3Q4wjzDzPZO7LY+6YXBAk81UVhiKx0QXVMlKUZjv0gzj2oEOMaYyxN88rBPKpcD
	 FHbQycL98jvtrMdjpLxEQbIuKOnHcLkW5ErPFoixbfeTbLtwV6lcHeHYbCSgoRsCpUCD6
	 BhYuS52oa2mhtkPTQvjDhio0ZrBrsmW6MeZG0ZxspA1e9vXKA0NLa+bvT8HXUXtH9CUK1
	 c6sgri2APDXzIZLIveWBsqf8pE5qKy51LVk9fLvvPsbDWxOIARNiKzV9xVJm1G7d2Lj7m
	 Pih6+oZ/ucuZ8Um+DYeaxWInc8jDzWSoqrbeEl6rKJDWFBlKgHQtIRVc3w9QN8GhvMA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LG7PUXik;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=aURViFfN;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 799A0606A327
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 13:17:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 799A0606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LG7PUXik;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=aURViFfN
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ABCZ3qu3292085
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 13:17:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=rJPCHE8Tetc6T6Zx5wds0tJA
	NIOD/gQ8/VVy3tOE6x0=; b=LG7PUXikLDPaAgezLLNNCNrPtW9zK3iCE1T8LagM
	7/oWUez+nMSLKYJmTZQ3FdCiE3ePS+DmXvuiGd3u6r0P8YbBRo4arqZJNZTEsBGl
	UUl5Fe5A4QAztxLviTgE4KNPdqI5sEi7uIo4uuw8hG0cI/Ohmtq6QGUl3H9wCGLx
	fF57U2cBuYVm2Mh2neOr7SChJFOYWZXVBx+eVkxplTHMvPei1FeLbYuoV9PT4Pma
	9xJdO3jmhhgKvevKQvDYoSwvz8KCl0kYk2zHzRgOEQybZ3uUX33VeLIOtJxlJWZ5
	TqQv2hwKv+TEm+zhmTPtsZgM7YypuzmwWyIGzC5wkRucQQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvdnp2mky-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 13:17:58 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-944101e6367so581372085a.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 05:17:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794403078; x=1795007878; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rJPCHE8Tetc6T6Zx5wds0tJANIOD/gQ8/VVy3tOE6x0=;
        b=aURViFfNAZtsojK4Qbwlbj9yjKG+uxQ1/mEDFfHrWjD1x30roFfnbCeH6p8lQXRT+V
         2OTYV76EPkLjrOiLt5F/uIs0biUy5ZHNzH4RPZOayvgzDKB9Nbb4SBRXtFxNUJyD61Y6
         rxRzdlONfFwFqGweDas4bR9SbkUmRRrNU9n4733FlYu09mig1H1d6yEmrlRiGUglrKJX
         vszvUg66TexC/rEegClhxYwSi/kjj7OaS9zStlPax3chbq78R7XYL5r3dxE31NgWILuZ
         GIduPZd3HXIMs7Du1UIcp0LwrYPxsK0wNKvMjAHnlt3XFOxvSCYqwKuTlN5tMpxQd3Sy
         C7JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794403078; x=1795007878;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rJPCHE8Tetc6T6Zx5wds0tJANIOD/gQ8/VVy3tOE6x0=;
        b=mQkqAHU+IZiOg1Qmz+96N3eQM8TGor0BBtng5zmGm7fQYQTCFLar7iz5yLMqsFsY7e
         T6izqHNn4YOXjbKXxaGDdATJkydy6JZP/FdiqAoTcw0dubwJUt4bTfUU4yoKXQUOCyer
         8VJMvsckhAoTanQNvT+Vm38/282NunBQiVgn83tvwYAF2DKC3NuwsQcRqWZtWml72fzC
         Y1NhwGMk82CUgnWthCsYSAKIO7ONgUOBX4ntNATtgI/F5YuCBh1tlDwldTegbsN272AZ
         VWN5X1htImr5Zy2GqUYD8S+b0qZ9oFxgGoqn98FSwiBpzQGZ6W4DpNw5XaLRdOX39fz7
         ytoQ==
X-Forwarded-Encrypted: i=1; AL+hErFCQd41Qm5BXeQGbV369YB6Odruq4K62axXTJUhZ5CCKCjJb0zk5S8anKsF6rAO8NcaFdlLRWGMcG79sNM=@vger.kernel.org
X-Gm-Message-State: APuU4Z+0INR8E56LkIxxDtbFA10FGiK5PILTM4bHorWerT3puK5AuNjQ
	wMlyP37P3F0+vFwsRZDDLUQHy5DR1P2S6huJa2ELkVGYmfZvQdhRw0hLsPlEt84yfnNqcLrg0rL
	dKHWmRHD3GFpsy1XvXkpR6vtpdAEm0KQo0TBbaH6ajsIobZeUvfskAS5EMZzrk1AKCTs=
X-Gm-Gg: AYBFou3kNqy0hu4bSeboec0FAO4wK8ux4rb5vt3DcMKuHFal3gNg71Z1bMsimqOD6Ur
	16Hn0X7aeWt+Awja+I5Og9cGkCKx/kbVDNJt9kL6cvkXdZJpBeLInvFrPLbCNtx/28ch/SDojpY
	VUB+a6LAZ0M5miztxdoR7qS3QHiEha82Zls3xN6DIKuWAoRxakVid4SIIuJnjOes8Qjnh6GmBkt
	D/cBtX1O0vp1oqxYKDvlwKKt/EeuFSWXiWG0+zrheZPdyYUYwlFgW59MFdrjE6UohjSSoT+eUIr
	Jj6II+ZpVNb0MKMGO2FccvrR1J9SjS8KGiWjUX9RYN0PRHoiJWnGigfzZTpRCMrXeHvXjTIact+
	HhKAYvLjtbDWJ7cwKs6apnmpgkoy53W3j884nTGEB4+kv0PLzNlwxBQ/vkmBMjME2l3Mm+pj9pv
	75Knuvk5Ycx7XMTwpRpi11Pm8ffky0qTEHgAuy6RLP5WgBfTmzAu8T0Md9vMsA1g==
X-Received: by 2002:a05:620a:198d:b0:93f:231:9ff with SMTP id af79cd13be357-947ae87a080mr421669485a.27.1794403077834;
        Wed, 11 Nov 2026 05:17:57 -0800 (PST)
X-Received: by 2002:a05:620a:198d:b0:93f:231:9ff with SMTP id af79cd13be357-947ae87a080mr421664885a.27.1794403077349;
        Wed, 11 Nov 2026 05:17:57 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c15b8890bfsm563193e87.15.2026.11.11.05.17.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 05:17:56 -0800 (PST)
Date: Wed, 11 Nov 2026 15:17:53 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, bod@kernel.org, mchehab@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        andersson@kernel.org, konradybcio@kernel.org, loic.poulain@linaro.org,
        gjorgji.rosikopulos@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v8 7/8] arm64: dts: qcom: kodiak: Add JPEG encoder node
Message-ID: <dvahgos7b47kdbv4wxec46lxvrfny5wounhxgnzdo3uxqlwkds@22fjhubli4tc>
References: <20261110163909.78085-1-atanas.filipov@oss.qualcomm.com>
 <20261110163909.78085-8-atanas.filipov@oss.qualcomm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261110163909.78085-8-atanas.filipov@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA1MiBTYWx0ZWRfX9ED87+9/T6dS
 adp7I0X/RDlR4xrxac5Q+IvkPBuTk+8FoRfsCXdBMQc7YVgU8qc1Nc9twUlVWJxtYtHD0z7u03K
 zssz8100HpeHG9adslnwKxPKDqnmiebOPQoN9H4excqBL6JsHtEYWxFSgVQmeZbf5HPXq8v2xWi
 TdrluE4u1YYLrz3/xxXYuXeaQy8EqS+3+74kjFhItYxeWYqy1FrKdF8XfjnPq2oZEdBp03PFxBV
 2KS8qz6HlJUWXs5rAc+651habghq8gkPEb3nhQzEefE8l8Ywtc1dgBNkviXC4E28goeyiHxzFfk
 JfbWRqD5ZD/JDRTardF8VxhbF5GUFCA+JC7fL23MLVPPnCconc6HbzCkeXhwbIKSZW6v4BrKcDd
 lLNjjXwLw04a7yq9lJoJwr23Q7XiuOwQaSXH7cj5Hzt1I6C+UruKURSipKZJE7myzqoBjWWp1is
 0cETLOXti9enWolV8cw==
X-Proofpoint-GUID: 9SKKqzr8qZr9acPoAXyP2H95RAJ7sqsu
X-Proofpoint-ORIG-GUID: 9SKKqzr8qZr9acPoAXyP2H95RAJ7sqsu
X-Authority-Analysis: v=2.4 cv=NK1AaE6g c=1 sm=1 tr=0 ts=6af46b06 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=iS208GUargVqoEZNhgwA:9 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA1MiBTYWx0ZWRfX/2IvtVczmVJG
 M9fSGguSkLMXShVZqi4WJdoXeqlvsPzIWnhrNXCSPjOMnrVqP0PV18Tc60i/GmhhsM1lhB35Pej
 73g4skWAj/GGN8MZEdgUcRjIkITvsII=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_02,2026-11-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0
 adultscore=0 malwarescore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110052

On Tue, Nov 10, 2026 at 06:39:08PM +0200, Atanas Filipov wrote:
> Add the JPEG encoder hardware node to the SC7280 (Kodiak) device tree
> so the qcom-jpeg V4L2 encoder driver can bind and operate on this
> platform. The node is disabled by default.
> 
> Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/kodiak.dtsi | 67 ++++++++++++++++++++++++++++
>  1 file changed, 67 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/kodiak.dtsi b/arch/arm64/boot/dts/qcom/kodiak.dtsi
> index 8c7523602d271..b46fbf5ebbeed 100644
> --- a/arch/arm64/boot/dts/qcom/kodiak.dtsi
> +++ b/arch/arm64/boot/dts/qcom/kodiak.dtsi
> @@ -5164,6 +5164,73 @@ cci1_i2c1: i2c-bus@1 {
>  			};
>  		};
>  
> +		jpeg_enc: jpeg-encoder@ac4e000 {
> +			compatible = "qcom,sc7280-jpeg-enc";
> +			status = "disabled";

Same comment. Enable it by default.

> +
> +			reg = <0x0 0x0ac4e000 0x0 0x1000>;
> +
> +			interrupts = <GIC_SPI 474 IRQ_TYPE_EDGE_RISING>;
> +
> +			power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>,
> +					<&rpmhpd SC7280_CX>;
> +			power-domain-names = "titan_top", "cx";

The same, drop cx. Also the PLLs on Kodiak are clocked by MX domain, so
MX should be listed here (and used to cast required votes on the MX
rail).

-- 
With best wishes
Dmitry
