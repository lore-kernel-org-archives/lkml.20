Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E371A3AC0FC
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 13:58:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791813495; cv=none; b=UeAhSPlrtENyzu8OaDCVtus/8D6CDl2vazvkF8owOOPJU/FJiggZItYqXG5BrClZzKrO8jlR0t+o+geEB9FxagmjPm+9Yuk1wOcnfcHsNnMuDdV0b/BxbRSEiPsRRt+90Yk5ZMWM8r5Srd6oxU6xsc199cgqxmQDFr/VIMCEXNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791813495; c=relaxed/simple;
	bh=CfYNbW4bF72moLoG80+MZvlQLhRZENNUhWa/04uO5oU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TtpSHfH4Vs9eDgHTjk+Rl3mr9N9Y5yZ6lh6BiNy08KTXCaDiK0UNUksZQOf8QxwoQ+EVZvf2iX0fx8EFryvR+RP4aLdkdZEyWWOTuwFhLihzcXnCeEemJim5O6dFfCMj+v/MQe+hN22C4ybvgObwgfVk0x35c8bjNl3MF/z68rc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=McQZBpnz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QClbwnbE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="McQZBpnz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QClbwnbE"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69CC0XHG2252795
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 13:58:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kAShzI9oYCosClXrlOpN4O/t5+JIqDoiZLXZsE7u0ko=; b=McQZBpnzZBZOJLF2
	+eK96wEs1aQHKd9dIt7CR1Dnw/kT9ZH6uo7yhTtstuQLNFq8MJrVE+XqeHJXFXKy
	j44flkhkP/zh0sgRSP30I9T8nLvdrEBYTPReqeXPtaMp5Y+nomoqs9X/cjqk4SQA
	jwnwlPWkoTYU6oHBA3iv32zXQo0prDSQXeUXYVJO4kglJzYiFZSeByfWRdWowx6Z
	v++WKWcnItNnHeE/n055KCw5DGRKvfyfjRBVHyhXNxxXZNqmDRTTk1qm97b1Ms0c
	z/GMgAx0Uxf6LdhsUNpnzbZI9KwOeu7UmHmo0MH7ke487ulUujK65KD0H/tSV3Av
	8dxVJg==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8j7139mg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 13:58:12 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-9179fb39cb4so5719886d6.2
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 06:58:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791813492; x=1792418292; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kAShzI9oYCosClXrlOpN4O/t5+JIqDoiZLXZsE7u0ko=;
        b=QClbwnbEGQBXiG8ynsc/Q2fmS2Pj7xcS3rIziEbEEp01Ey2XqvQ0Ro7WYxnr4l3iKa
         x6LzGzt9eMvBdFooHjguQ7z4MYVHwtGOmbZ5Ba6FwvoWrBS/L1fhttdB3klBoewaGZGX
         QJkRatCOiyTfXPl/lre7pUGpPExU/z2CcWf8KBnK/FZn+5DVusS+4uw3uZEbknIWsPs2
         Vy8GJXlF1cL0huLzS1HDjvHTV84br/jru9dr0H3gdrYCcbS40hwjiYdlR+MQWBo9VhTJ
         uIdecV2VEIRlYl9KQ0Fh0ulPS5mztef/kYw2HnDJ7UAyZVi7q8KEzAbDvFoEsVo06Ct+
         waIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791813492; x=1792418292;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kAShzI9oYCosClXrlOpN4O/t5+JIqDoiZLXZsE7u0ko=;
        b=fOknnPPsg79IMq/7ITHqdJSnL/VRUUBjuMiObfQbMrhQFxLsdieS1hXCqoQ9TQ/5zj
         gFbvD7Lzd6ZSqyBEu6fGiS5R7PjfRpPPHH/cWlD68AGdEOPR9231cBt7K0/0/2BzZ6P3
         /Mr8Vyu1CHH9NWYyirQKyK2PPYlz/F3i4Q40zCRtBhROmvTJhakyRYz/VYF3demQp1id
         mxngzAwXBqkuYgmhOUVzmwbzFfFmIabdF1gD9L0cTkN3/800ms7M0472FDB+ujqv45KW
         hn8WrU+T5B0CckdoT4WYyn2pjl39Nb7C8AJ+fubbEsF1JL4OdgxQY+p3yo0DB2/y+ch0
         9hSQ==
X-Forwarded-Encrypted: i=1; AKwUvBzs4Quxm7eu1VQnTK33Dx0FYfFL9Iq6rZI1s8akCyRInC/ZQv7Xrcx5yc2SxD1Ss4V8N5nV6gGobsGtcN0=@vger.kernel.org
X-Gm-Message-State: AFq9FYKdbMZJF6gn5VykLGvXnyCNzo6vv8SwNoZnRGJS1c+sPVskqFVF
	l+7TlZ+iug5KDpdjJQeXL2Xc6SMD9Aw22AL5uPMcWecLLfQ5bzAnM3WFCvrxubdHud3wBBhskjV
	8rEr+9NBomRd5KpXiEUKZ3qffBji38HSpQVjb41Hnnv5dsTXZqZmn5KBP0nkEXzVQEL0=
X-Gm-Gg: AYBFou1CkqDd8QOUe8f8KNK6CrQAJUWF0u7oAqiqzt8d6Cpld8b5WbAKq1LL0UYIses
	4/cjNv9t8VvIsm77EpigmgOULQyJlGJf9DV65zrfH4MDcm6hYUpWhpGApya0b40FyorNeGWx+cQ
	jt3bHs8xI0c/HtkRFcn9wyJZIvRIPjvUqDShgXqAYnrE1dFu+yyAx3rHmDZy1sTQNXe2mO8nGRy
	vLtL5iLjnZIfJICzd4jyJtooUjS8GLV0aaKcjc/wz/6Wpx3lr9SQ9NFZqBfxLSOw6fasBucNve7
	0GNXAmRmXlzvDBHq42kR7NXVk7qWKi3wI9tKwNi+qQ2hq9Kba8Oi/V7TmUKgjrsLT8tP1hSx1YS
	X1CCC+m1ldBmsSzEtpTjPjA==
X-Received: by 2002:a05:620a:8017:b0:93e:5a3f:ac13 with SMTP id af79cd13be357-93ebcd2bc8fmr1648079885a.0.1791813492161;
        Mon, 12 Oct 2026 06:58:12 -0700 (PDT)
X-Received: by 2002:a05:620a:8017:b0:93e:5a3f:ac13 with SMTP id af79cd13be357-93ebcd2bc8fmr1648076185a.0.1791813491552;
        Mon, 12 Oct 2026 06:58:11 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c355555f483sm94092766b.23.2026.10.12.06.58.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Oct 2026 06:58:10 -0700 (PDT)
Message-ID: <717d9cb2-d7e5-423b-9d0e-fad307385474@oss.qualcomm.com>
Date: Mon, 12 Oct 2026 15:58:08 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] i2c: qcom-cci: Detect capabilities from
 CCI_HW_VERSION at runtime
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261004-cci-imp-v1-0-227d12cb4829@oss.qualcomm.com>
 <20261004-cci-imp-v1-3-227d12cb4829@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261004-cci-imp-v1-3-227d12cb4829@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDA1NSBTYWx0ZWRfX9SFbQKA+7YnN
 1E5kEJ9FJhob68B7QsYQqMevyZZ4sx4ax+N8EZzkRBpDvnupg4lT5GCkzxcdgt7H84jQ2xq+oIU
 SERKYHk+cKwMbBqfSL/rS7jftOlVxNc=
X-Proofpoint-GUID: wvyV-acHjmoKop95p4K1dzOHBEYrivwe
X-Proofpoint-ORIG-GUID: wvyV-acHjmoKop95p4K1dzOHBEYrivwe
X-Authority-Analysis: v=2.4 cv=ePGGH3p1 c=1 sm=1 tr=0 ts=6acce774 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=DxevoQKOKOntZzvZR7cA:9 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDA1NSBTYWx0ZWRfX8XqsquNLAc+g
 EZ1Kvts8Ib8sIGlNRtAgBlMGBbncMbbNvw1KF7iWBDuWEN6JilmlOoH1Oxj7+Px7kocmQHrOcvG
 A3i6Hx4LHRDWpw50a1KizO3dL8etmdSZOu31Ba9oAsgUa4mRt6dbrmkcHw44PXlMbFbjFwGdonV
 KoCixHUQ6UXdcGAp86Lj7RJGy0DXlx5E7PVEcc4xoCK8AN+CksFksM4Xszeh0Bi6kbYiKlyniwB
 VKVGkFJVtc1bV/J+28qgxBA+/qNdps53IYiD0KPO9ijmOz46GDggZ6ZcuBSZemtr83piQoFrqoj
 2XL1xxQb/1ilmfgcaMTetxzG+g5fFcMbgw8oNB3xSwJBga0xtJMsMSA2UTxGmOJW96OFRx1+spv
 6DibPpVlmHY+DgDmenBXEk4M0sY/pMVQE9eFAEbXfB8/YeYlE4Rofy2o+jdbh1yrt8rY6sy4iS+
 P3++gOtzfNmhk6yT1uQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_04,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 impostorscore=0 malwarescore=0 adultscore=0
 bulkscore=0 phishscore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120055

On 10/4/26 9:09 PM, Loic Poulain wrote:
> In theory, every SoC integrating a CCI revision that differs from
> an existing one should introduce a dedicated compatible string.

[...]

> diff --git a/drivers/i2c/busses/i2c-qcom-cci.c b/drivers/i2c/busses/i2c-qcom-cci.c
> index 099da0069251681cc52e351fb656bd73e78a96c9..c0b39d419e296454a083d38ce302940875b8ad2b 100644
> --- a/drivers/i2c/busses/i2c-qcom-cci.c
> +++ b/drivers/i2c/busses/i2c-qcom-cci.c
> @@ -14,6 +14,10 @@
>  #include <linux/pm_opp.h>
>  
>  #define CCI_HW_VERSION				0x0
> +#define CCI_HW_VERSION_MAJOR(val)		(((val) >> 28) & 0xf)
> +#define CCI_HW_VERSION_MINOR(val)		(((val) >> 16) & 0xfff)
> +#define CCI_HW_VERSION_STEP(val)		((val) & 0xffff)

GENMASK/FIELD_GET(), please

[...]

>  static const struct of_device_id cci_dt_match[] = {
> -	{ .compatible = "qcom,msm8226-cci", .data = &cci_v1_data},
> -	{ .compatible = "qcom,msm8953-cci", .data = &cci_v2_data},
> -	{ .compatible = "qcom,msm8974-cci", .data = &cci_v1_5_data},
> -	{ .compatible = "qcom,msm8996-cci", .data = &cci_v2_data},
> +	{ .compatible = "qcom,msm8226-cci", .data = (void *)1 },
> +	{ .compatible = "qcom,msm8953-cci", .data = (void *)NUM_MASTERS },
> +	{ .compatible = "qcom,msm8974-cci", .data = (void *)NUM_MASTERS },
> +	{ .compatible = "qcom,msm8996-cci", .data = (void *)NUM_MASTERS },
>  
>  
>  	/*
>  	 * Legacy compatibles kept for backwards compatibility.
>  	 * Do not add any new ones unless they introduce a new config
>  	 */
> -	{ .compatible = "qcom,msm8916-cci", .data = &cci_v1_data},
> -	{ .compatible = "qcom,sdm845-cci", .data = &cci_v2_data},
> -	{ .compatible = "qcom,sm8250-cci", .data = &cci_v2_data},
> -	{ .compatible = "qcom,sm8450-cci", .data = &cci_v2_data},
> +	{ .compatible = "qcom,msm8916-cci", .data = (void *)1 },
> +	{ .compatible = "qcom,sdm845-cci", .data = (void *)NUM_MASTERS },
> +	{ .compatible = "qcom,sm8250-cci", .data = (void *)NUM_MASTERS },
> +	{ .compatible = "qcom,sm8450-cci", .data = (void *)NUM_MASTERS },

This looks a little sloppy - can we infer the number of masters at
runtime somehow?

Konrad
