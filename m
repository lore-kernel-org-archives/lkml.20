Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4789D36E489
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 07:06:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791183977; cv=none; b=ImnQRK+RG7lXrMqhiEyDr347+CtdhJIdR/S3Rtn4GaSTuzPB4Md48TM+hSB29KLFa7sHH8tBSc+qOVS+CtRmsxQ9x/yZ08CIf+N9fn+Zrf5hOxFW6BkpmgGzoBlhd2dxx/Pc+DWR348HjCSWU3zWq0oTVAyYmd13avKRzv1NsRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791183977; c=relaxed/simple;
	bh=atrjdIQ97trzdZpGjI+qemq9aj6Nd3thS1TUv+eArUM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LKcbhrGqaglnwvWVKlWDEDohDar5336HoxAyg1c9jll/kZSF2P21rkyv2q/NvAyJYqUfb0/sm4rqNCYz/Zmorvs1y1WbsNdzKOuoU271DkCe7MdHO1NwIzHhK9LWBr3BaaQ3fIitu0l+q1plIPhiDD+0YgzsJtjxJpFeFGz+Eko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lsvePr11; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HCUMw7YI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lsvePr11";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HCUMw7YI"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69510EI93838666
	for <linux-kernel@vger.kernel.org>; Mon, 5 Oct 2026 07:06:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yiEyYAeWYq28BCDpwkf47FyVsnh8JwoWDWQ3CJx+bfk=; b=lsvePr11+Lrh4Tng
	9YmBWlhU9+uaw1LjvwVApNPtLRgYBRWIij9FUVeZnjG/CSwBqIJFJXCZ3iyDetxl
	9lWeNni4xvKjX56JE8nY2udW4OsQBZjMjN5fVP3ldZEPFtYF/sN4ZuzcK/AeVqML
	cxs3Bd/C99H9d+lHX7/Zh14ATL0lULWNioSh66xKcfddtMAS13LRPikZZVTAV4hR
	cObDUUZviSTRVkmS2ldUsPaXBOqLIAkMaK+mn7isqZQwULFofmEosE+DdWrggbmr
	SOUGz4GxmsB4kzZDcwWGs3zOppw0BkNZ8jm+ATE2Dk11O0mzFYXrfnjk/vQOH6Zt
	+YeulA==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h2u08mqgu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 07:06:15 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-9179d9cde17so17073246d6.0
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 00:06:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791183975; x=1791788775; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=yiEyYAeWYq28BCDpwkf47FyVsnh8JwoWDWQ3CJx+bfk=;
        b=HCUMw7YIsIPGkLeQXAu1fxl4wBg8IkK/cIZyILedmDARsGyHuP9L8z7MLTJr/0ch65
         +gsW6V7M5oQsOgXTUsYsHdjD0ypqmilA5P8mQ+9qdNbJzvwe9y2Wr/0mfq6a8DQF2ftn
         bb4d0zetAsEwqbHu0WONlM0gQ10jXjzFHfkStbzZV/8Vdgm297GlZ9D8/QLjx5CfvhWu
         oo8qjXaAj2dA2U1FMBlICP1QZJmt+GtVBUDxD+hBCqvAFQg7S31OLyayyeTIvT98zqM1
         ki5Ek7qWO40otNV2zoSyQfPLX49scOcROqVunjSDAa5AqydXHfIqli6rlQMWwwb7hPVl
         g+VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791183975; x=1791788775;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=yiEyYAeWYq28BCDpwkf47FyVsnh8JwoWDWQ3CJx+bfk=;
        b=CWuwhrk5ITd0jmrOUImB7OILkrpk17aUuLN1SiHugDzti+d0nWpOEwEcfCKPA3cC4I
         xUg1CW3j9DsIzSG8f8M1KSNgVuWrSq6hUCUcvmFBYiqVwi+KTSGxND3683HEyuzkmJ7N
         BRnvsJaK7EECPyOgzg/SAp33ZlDWIIgHldc8QlS1mKQzeFrM0tce1scPxNAjsDCP85zU
         ubuF0KL7h/O57g5+Mk4v4FKI15zgC8NPmbUIoZblGSFuPcZgLObGuw/Ve3at5+8vs/HT
         ovjIUWBj+EEK19IuQdQAURA+pJdQb3MJCa/TpEqCEDJGtNr6/Zb95OOvDPXPjfvao+tT
         hnDg==
X-Forwarded-Encrypted: i=1; AKwUvBwLNH6vMl5C3BMFC77tKoPCEJBhg8VPfz8LNwmsv0eyx01THYIHvGTsfop/95Szb3jl75vKCDxAQY58kMI=@vger.kernel.org
X-Gm-Message-State: AFuF++l+ptf4R0BTh4gw12zAZ26HfhOORSgkWYQjachISQ0XGDcM0UT3
	bla0fIlPwHsyCFi/y8uZNOVmZjpYBr3GtaWJdhcYbBYMa+P5C53S6Vu7nVM2MZaSxhrtpAO6OO2
	ZqhM5ZfXsv9UR5dGl/DOgykTeAlSBFo4mts989pOw6a1rpyXSwRfWf9VeCiCDYPhDjvg=
X-Gm-Gg: AYBFou0DdHpFTZqo/TAvQFmc3+WnYfetyhEjx2gT64KUKquMQJIzqJO6bVgBL55efQ0
	fvHJE951QpaVWXgi1CZqy4IOfDvUDj92K8ZzcB017G+GK4CibRbUM1uVDy+mu+h3M+HX4jUJTXB
	7e5gR6yrDPgsg7DECJ0EF+vHNzbvpmkrotXRYl+u914j2QWYrQYx5G8DO0HSHa2iBQSEQbRDaDt
	kVKfBWjG0+Z4kpdxm9YD3j3pNZ7DQBeL6+VDDdmQo2XbAvNEbaoK+gSw2/kF8u5bhTrMHc0cimL
	fG4KzT6/s2Iv1TpRIU+liDDgdBW42ZlHPyCDLk2XccjUqElUR2zis8AyS+ja8VSZ9DLTDwEMxpS
	s62WTV70Ag/eUADiK3FQS5NZVEdaV+HgBVYvBjzY0p3HxecJqdz8OfMOOcoRK21kvCW4RWuuD6n
	Tgo3A75qWxXJnD
X-Received: by 2002:a05:620a:404c:b0:93c:b7f3:9f5b with SMTP id af79cd13be357-93e51081bbcmr1036871385a.45.1791183974414;
        Mon, 05 Oct 2026 00:06:14 -0700 (PDT)
X-Received: by 2002:a05:620a:404c:b0:93c:b7f3:9f5b with SMTP id af79cd13be357-93e51081bbcmr1036867185a.45.1791183973821;
        Mon, 05 Oct 2026 00:06:13 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bb7c79d725sm2957189e87.46.2026.10.05.00.06.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 00:06:12 -0700 (PDT)
Date: Mon, 5 Oct 2026 10:06:10 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: =?utf-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Stephan Gerhold <stephan@gerhold.net>, Ulf Hansson <ulfh@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH v3 4/7] remoteproc: qcom_q6v5_mss: Use mss as regulator
 for MSM8953
Message-ID: <7smt722arn43gwpfhbgagevi3ut6gdxalgfre3mzm4rb25fkkq@ftsucipakelm>
References: <20261002-sdm632-rpmpd-v3-0-95c47d0f26cf@mainlining.org>
 <20261002-sdm632-rpmpd-v3-4-95c47d0f26cf@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261002-sdm632-rpmpd-v3-4-95c47d0f26cf@mainlining.org>
X-Proofpoint-ORIG-GUID: 9HQBz_0vYmpunC36NzUFTtDDQn0-MYZn
X-Proofpoint-GUID: 9HQBz_0vYmpunC36NzUFTtDDQn0-MYZn
X-Authority-Analysis: v=2.4 cv=JqlkP84C c=1 sm=1 tr=0 ts=6ac34c67 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=OuZLqq7tAAAA:8
 a=BJAjVMLeuKdTMRx92iYA:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
 a=OIgjcC2v60KrkQgK7BGD:22 a=AKGiAy9iJ-JzxKVHQNES:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA1MDAyOCBTYWx0ZWRfX1QzfiwWXJsOF
 baYohzD6dsd5zOYVdYjCIm3q6z8kNFUsJOIjlMpoFnM3etefzMyFpvBTaEhKpzyLBO4dUTNq1Rs
 fsFtBNBN8Grgpu9raGo2RLR73sUhO80=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA1MDAyOCBTYWx0ZWRfX5hDT+ruUdo3U
 NkZTrSYe1U/+6GssBbP4gWx3RJVcKMfmxl4bz/FASA+dYJO3upmc3l/ZdrGihcHovkjnBtOWV6X
 8C06BV0ON/X+HqRJVY6zGF6xhdqwrj44neCTiHFtVszCVy1AhZNJBew4ebOaPPi1AeWtB5b5Kuw
 aHsk5316AtBh61oqWOis/vVF6DspMmU5FFoReFe43kb26xSrRv8ZuUtpxa6sxGCO/Z5xlQiJ/f6
 v4Ly5tjEIsRsYttQSP9t9IbhUG9Gj65vMH+mwvKAsAdPXUeYB+eApE3wLlXtknbXfoqgPwQMQgm
 6hqrVTHLmavwAo5teBS8Kcn7KD34W3kbthh8rG3zpguq9FSU+yi47/erWJWHLbXqOFi5p2ehvcX
 2pTorNecmkpGBMAkUAMDlcU5WMDe52onxHhasDEcYNEPFvw4BW/YWT30YibXixsxVOD6gSH1jQi
 BhvasUVZRrtzlnJn8qA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-05_01,2026-10-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 phishscore=0 suspectscore=0 lowpriorityscore=0
 impostorscore=0 priorityscore=1501 adultscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610050028

On Fri, Oct 02, 2026 at 12:38:32AM +0200, Barnabás Czémán wrote:
> On MSM8953 MSS regulators is controlled using the voltages rather than
> performance levels. Correct DT definition and model the MSS as a
> regulator rather than a power domain
> 
> Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
> ---
>  arch/arm64/boot/dts/qcom/msm8953.dtsi | 5 ++---
>  drivers/remoteproc/qcom_q6v5_mss.c    | 9 ++++++++-

Two separate patches. Yes, one will be broken without another. Write
this in the commit message and explain why you can't provide backwards
compatibility. Don't forget Fixes tags (or explain the lack of them).
But I think it applies to the rest of the series too.

>  2 files changed, 10 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/msm8953.dtsi b/arch/arm64/boot/dts/qcom/msm8953.dtsi
> index 753167c3f861..c7dc08858d54 100644
> --- a/arch/arm64/boot/dts/qcom/msm8953.dtsi
> +++ b/arch/arm64/boot/dts/qcom/msm8953.dtsi
> @@ -1451,9 +1451,8 @@ mpss: remoteproc@4080000 {
>  					  "handover", "stop-ack";
>  
>  			power-domains = <&rpmpd MSM8953_VDDCX>,
> -					<&rpmpd MSM8953_VDDMX>,
> -					<&rpmpd MSM8953_VDDMD>;
> -			power-domain-names = "cx", "mx","mss";
> +					<&rpmpd MSM8953_VDDMX>;
> +			power-domain-names = "cx", "mx";
>  
>  			clocks = <&gcc GCC_MSS_CFG_AHB_CLK>,
>  				 <&gcc GCC_MSS_Q6_BIMC_AXI_CLK>,
> diff --git a/drivers/remoteproc/qcom_q6v5_mss.c b/drivers/remoteproc/qcom_q6v5_mss.c
> index 2f71ed2feff6..8f6312213e1a 100644
> --- a/drivers/remoteproc/qcom_q6v5_mss.c
> +++ b/drivers/remoteproc/qcom_q6v5_mss.c
> @@ -2728,6 +2728,14 @@ static const struct rproc_hexagon_res msm8953_mss = {
>  		},
>  		{}
>  	},
> +	.active_supply = (struct qcom_mss_reg_res[]) {
> +		{
> +			.supply = "mss",
> +			.uV = 1050000,
> +			.uA = 100000,
> +		},
> +		{}
> +	},
>  	.proxy_clk_names = (char*[]){
>  		"xo",
>  		NULL
> @@ -2741,7 +2749,6 @@ static const struct rproc_hexagon_res msm8953_mss = {
>  	.proxy_pd_names = (char*[]) {
>  		"cx",
>  		"mx",
> -		"mss",
>  		NULL
>  	},
>  	.need_mem_protection = false,
> 
> -- 
> 2.56.0
> 

-- 
With best wishes
Dmitry
