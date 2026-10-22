Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792665292;
	b=W+3Us2pS3dBEIF73PlfxqJUgz9Sayr0uPw7qHLvs6di5qGxZm1VIZZZpNJQakXKo+Alq
	 5FCuq5IUJSFz+SmM1nI7zErfKdKmBh9Adt2UDoL9/eiby1GlPU/q12/wi/UObMhaYSyE5
	 u7epuvqawnYpUrG8P8rrygxK9eD2h9fsssYxtMP7CFqUcvXZ+o5XQqkd/0jaHmFWfl6sR
	 hVBFC5DdS4uqk+0P74i/emy+rfF/nR3VLSHOQqUOMOIXHj0Y+8VnqeXofY34LuIm0Fbpg
	 EGsulQbUI+D8hVrSurdycHmTN100gq4RNyXNYwBuQegw9h14uyNiytGPKZlTFvuFsLA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792665292;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=G4Rc1GTj2IusimIXAzcUVeQX/GJI/v+2tt578pl/8w0=;
	b=YkFXP7RgatQUfaHPpyaB0cB4un69E4wySpCdONKqGrFcMq/fzHmkEq9TLlxtCdQH97Qn
	 8cLBJBll/po2EzREtq0zaNGCos+X48LOz9odAnJcFBWRo2c0lDuqCoCL79amqMq9e5UWA
	 b1WJp6rFOb8ZM/sFgKZD8n+0RjULWYCQkBz1e+OVaaGh8QQoxUdUQk82hxMFpcXNq6eFx
	 RmnbDdR9naQlwybg/cth8pVQfnolGpkRwDPoTrj+C04gVXYyqedTZQei9lLlSjVdV17mV
	 I96tpH1VSc2J9DjkXlCr7/6i8zGbLIMRuxAEzLRI4j0dwlcjcHZs6g0+JrrLM/UvjkQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CEkWc85G;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bRMkCPgG;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C62DF60A2606
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 10:34:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C62DF60A2606
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CEkWc85G;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bRMkCPgG
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69MA05be3427015
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 10:34:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	G4Rc1GTj2IusimIXAzcUVeQX/GJI/v+2tt578pl/8w0=; b=CEkWc85GvqBYH3U+
	ZaXM/nFTsY1gU4TRFvHL2269XbtrHmWnmaO5BqAf5evUBvxv6JhJijBp0Uvupoiv
	N7RPXYuP8hzeU89vESZSXy+HL7d+Ah4Li6odyHdGpsP8f9y5TwAobwDdyH7ul7VU
	6YKCPtMfqKTdfnru7F3b2fvsUbDDlQBOQyL7Efki3qTziGq6/ZQWcdqQhgvtuzet
	pZPLHOdJgzwaDIWdpVb0kxmgPykAw4LG233B28uRu5zW+/5SAkFxPUnt4otQUHDi
	GU70usn9UmWbW5zqzuhP6fbhTLlN5kyAP8k3LIW2VKBGgGmNnjAJmKqyziQGBdeZ
	wc1xTg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfewq0rf1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 10:34:50 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93df7a9466bso19063085a.2
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 03:34:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792665290; x=1793270090; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=G4Rc1GTj2IusimIXAzcUVeQX/GJI/v+2tt578pl/8w0=;
        b=bRMkCPgGnw4w4/7/naHaBB2N3sTx8YSuDGyJE1wbAcWQsjmz6YuT7prozP/fQ70tlk
         ra+QI1i6rSuRlyG5xSlcD39bQ9Vm0HGHML3ncw0b/yUwWD1GspsWpc1CgqlVg9tEOuS0
         RCD6Szzi0O/zcK7DbL4TtDGShqIKHcQqfE7p4R3eZtrMfV9ovtGFwCttNvyWVJk+VZxs
         kh89qoxbIrk4dXCCH6vdzD50SxSB9ZIi4cqsKEFUlqhVv8A+39n90Dz796eRjc95vxb8
         /A3YuLq6Q6DynAp2MhTausdGjjkUIF6E7b+owbo8DjnyU2xsQTDba3vyou4RXKMbUYr5
         OSdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792665290; x=1793270090;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=G4Rc1GTj2IusimIXAzcUVeQX/GJI/v+2tt578pl/8w0=;
        b=U0j0bovqEjYnzSV7dFVlloC3Zh5lVrEZ027eMjZpGBdAIvrOnsQdJoMzLF87RHX58X
         H6BAjTZwojiVaalH94MDdw9SBTWf/hzcZwbeA7ouYDF7sKviyF0EjMP7DwUO0q/Mvx5H
         hq+DL7RjbJFzzPp5MJ1MNVqKxusvOcFrgenAgBaC/x6g7N18IXRhc6EMJnxlqWKJkHpx
         Z0LUDzeAkz9TPttX8d78iBDsEZ+Dt8bfK5R/+KwMmw+BQIqU186Cz7jrrr6Smo6su8Pg
         oXnODtz2XIrf0huFQbweuqMGJcAvDKUiyKlCZJ5uNJp2uvgsdOOmDK8KPTlPosxKOPNf
         G8SQ==
X-Forwarded-Encrypted: i=1; AKwUvBwprcvjCuvTABAnwmPHshJVW1869yBM1T3GR9BAxO6FxyoY777ooUE3UZJBoPbCCicdZDWf2TmihXAoK0U=@vger.kernel.org
X-Gm-Message-State: AFq9FYKZn/rXeHuK+NMZY7NpGYIBSm5R46sScUJO5YRufKi/vXYDHSDV
	CQjfYVSzav8lBadbux+A/8MC8XrP66YWA7HsVeTjy+CTCHi89ZPamolILGBRQTsLntJwlxbCJ/M
	7+Xe/133Bl4xeakEj9gN/0zqKwtDqytH4AndZq+2ZmTky++Fb7UFEOUnxb6C5z+K6kHI=
X-Gm-Gg: AYBFou38Nzgq0GXjcXnTA2Ms+MVRAy1xtaRa9+JBCQ6bVu8MTYkfcOwOdkmFYj1VYsz
	948qdEVm9bvXyLxV+ytD3C790qd9Yla2doLslUFdFeIoxY3AwDhqmVF3VIDeaCJe3HiOZ1hPKyn
	Gl+SPsCa4UgA/l1x0hqrFhQIDR33GnZtE2369XQp/zxUf5eYb6137K+nTwAlBOKEbXyb6E1qazH
	3CJeexggenRGQebYuNkW9W4hQlFKaTfTlcP/I9vLkZJkJehUJELcYtCjyjUitXlXA966ec2kjil
	UrfWmDb0/oJPcqPWAMVpe1T+daNKs9Sj2s734hy6VnnXrPMVUCT3RH3QZvPjCuWKx+4zF6Pz/PS
	ONBCXSxp7EL2fOngLbffVtg==
X-Received: by 2002:a05:620a:172b:b0:939:8bc:8826 with SMTP id af79cd13be357-93f57e897a9mr995953685a.2.1792665289934;
        Thu, 22 Oct 2026 03:34:49 -0700 (PDT)
X-Received: by 2002:a05:620a:172b:b0:939:8bc:8826 with SMTP id af79cd13be357-93f57e897a9mr995948685a.2.1792665289410;
        Thu, 22 Oct 2026 03:34:49 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c468a57491dsm91417366b.45.2026.10.22.03.34.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Oct 2026 03:34:48 -0700 (PDT)
Message-ID: <e3a8d06e-5f7f-4743-a332-b2a8ef30e781@oss.qualcomm.com>
Date: Thu, 22 Oct 2026 12:34:46 +0200
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
Subject: Re: [PATCH v5 05/11] phy: qualcomm: qmp-combo: Add hardware-specific
 dp_aux_cfg2 and dp_phy_cfg1 fields
To: Nabige Aala <nabige.aala@oss.qualcomm.com>, Vinod Koul
 <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>,
        Abel Vesa
 <abelvesa@kernel.org>,
        Johan Hovold <johan+linaro@kernel.org>,
        Bjorn Andersson <quic_bjorande@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>
References: <20261001-glymur-phy-v3-v5-0-3848c2615d5a@oss.qualcomm.com>
 <20261001-glymur-phy-v3-v5-5-3848c2615d5a@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261001-glymur-phy-v3-v5-5-3848c2615d5a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: Mj8fKbHSs90m7hZ2fSgJrGWwuD05MrXK
X-Proofpoint-ORIG-GUID: Mj8fKbHSs90m7hZ2fSgJrGWwuD05MrXK
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDA0MiBTYWx0ZWRfXzKXNzr8x2Cu1
 vd2Jd3PDVihHt/HtVV2BLBihGTQN4TMkpks1Rz3w9QOt/vOM9WWSmI8KAohaZkiW8JstkUCRr3k
 fJWazi8DCF6QFggDGmXKgCWfqPWttMw=
X-Authority-Analysis: v=2.4 cv=G4OJgNk5 c=1 sm=1 tr=0 ts=6ad9e6ca cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=LtPWTzbXSToZAMoP2AEA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDA0MiBTYWx0ZWRfX/LkFPvKERWYm
 5mDpfl+383493NwFiyjQn7oT5gc5GhSv+KfEnh9utyprZ7cE9o9H6Z/ogua9HpRrKeGRHd9C4qH
 JKLYQalVf13fwFq9yJIiDOkwM0C5kyi+pPieaph2jT6+salnzH6h6YUcT7pYcd+XvtrMPpe6dhC
 AF2yFf481pzL2cTspPXfzGdcdh/jpY1r7Q4Tfwswj4OBYWuymVqL/cQfsJ/5xFodatM2HtdlBVk
 Tb8rMDj2DKTOEA2I+o64i1fogafwZJfjqcDR4/UfIbhsQbkD498hYhqEBHgIyh9Qe69iC9hRCnv
 JJhk6xntRaAVvObIWmUIsJGz5f+nswQXU9XxaGmEbxgARkB/PdQxW6QWfBpntMaPwAC0pbDrkAR
 5H72HsOItEeYkzbPg7uzYyYzC9g30pwtZsxYOXN74/rNCet+9nj6t9PaxK72fi0yWZQdzu5JXsa
 VmCqm8ltayqo1pfqTrQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0 bulkscore=0
 impostorscore=0 adultscore=0 malwarescore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610220042

On 10/1/26 11:34 AM, Nabige Aala wrote:
> From: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>
> 
> Add dp_aux_cfg2 and dp_phy_cfg1 fields to qmp_phy_cfg to allow
> hardware-specific DP PHY register values to be specified per-platform
> rather than hardcoded in the configure functions.
> 
> Define named constants QSERDES_DP_PHY_AUX_CFG2_V456/V8 and
> QSERDES_DP_PHY_CFG1_V456/V8 for better readability and maintainability.
> 
> Populate the new fields in all existing DP PHY cfg structures:
> - V456-based platforms (sar2130p, sc8180x, sc8280xp, x1e80100, sm8250,
>   sm8350, sm8475, sm8550, sm8650, sm8750) use V456 constants
> - Glymur (V8) uses V8 constants
> 
> Signed-off-by: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>
> Signed-off-by: Mahadevan P <mahadevan.p@oss.qualcomm.com>
> Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
> ---
>  drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 37 ++++++++++++++++++++++++++++++-
>  1 file changed, 36 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
> index 646e97a52886..ebe2e6136f7a 100644
> --- a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
> @@ -2486,6 +2486,14 @@ static const struct qmp_combo_lane_mapping dp_data_lanes[] = {
>  
>  struct qmp_combo;
>  
> +/* DP PHY AUX_CFG2 register values for different hardware versions */
> +#define QSERDES_DP_PHY_AUX_CFG2_V456		0xa4
> +#define QSERDES_DP_PHY_AUX_CFG2_V8		0x06

The doc says this should be 0x16 for flipped typec

> +/* DP PHY CFG_1 register values for different hardware versions */
> +#define QSERDES_DP_PHY_CFG1_V456		0x0f
> +#define QSERDES_DP_PHY_CFG1_V8			0x2f

And this should reportedly be 0x13/0x53 for normal/flipped

Konrad
