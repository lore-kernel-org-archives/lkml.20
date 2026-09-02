Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD46538E8A2
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 08:51:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788339107; cv=none; b=j5Ypc3fGYo6P+haGmiepwNZLsZUQ/6E80EFS1890w6xr6z3I1WzQVOk4efFE0E6PJJpTjazul2u61dEDQ/amS++dytutCa9h81DYti+Tl6oNThxQrjrIc9+jl0omhuZEisnh7HlWyiTZjkwtJN7AUTXxICDSksztgFbBB/g82RM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788339107; c=relaxed/simple;
	bh=SfI7l0xdEyQtf769eHD+Hyb3vKC0KOiSch/jCl0cmkI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lspoVc5G87ZuGDxzuLuFaBxRWdvjq4PRdq9/3StNKTyB1x/dnNaj4Vvi76lws+J81CMDEosgtCzyBsGCLPkw+pvHVQm75oHT2YdmBOoX6r2BaOg6AkRhSgs23AFEuUIiW0TK+9mUQgBWAttLgv3YiXtMA3YqpkVJ/jjiTCrM4Js=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WQvYH12f; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AH4lU0L6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WQvYH12f";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AH4lU0L6"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6826WROL695467
	for <linux-kernel@vger.kernel.org>; Wed, 2 Sep 2026 08:51:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LBFg1pabf1pO113gxKvEtkZZTp0GV+XYusVmM24SSJM=; b=WQvYH12fQcc3EsZa
	lgr8TVOFnUWx3E70G1le0bn1hq6xSeA1V3269uvsRzR6cVrzW+rBL9J5ADgeqkLQ
	5Hw8Y8BdEarGVasVNDVffit8iNad9vSmLZAbRO56seNOOtlENcebx3Mxn4IIn156
	bjheJX9wDWP5DfkzdOE3UtiAnzn42RzC1aGDe3lUgHxdPJFkosI77LRZFWjaeNHy
	w4HFe5RU85Xd7WYjGxRJK4Q1L2S9YakQk8ZmVN4KmaHZ7RrEl0xh4FYX514lMk+F
	NT9g0o6Vd4h0/OnEFnUfqF65+xl+wv2zgkB2Bfc8bqbY/nTNc8p54HZ5CkxhanCp
	yE+TyQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4geb5619g4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 08:51:44 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c21be5bb4so1745511cf.0
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 01:51:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788339104; x=1788943904; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LBFg1pabf1pO113gxKvEtkZZTp0GV+XYusVmM24SSJM=;
        b=AH4lU0L6HPD73JL/cDIq92tsFRYGrE/A606DrnsxGLXKIK7vJ0O7TJta82deZtjphr
         WiLsydtXpW/rbHnogbd1NsCrHSfIcss3p3Vp773a3HHX7NPSwHIcpPJN5r5z4E9Vktov
         RN8SqNq0lt9cO8yLrBBAAhj9NR2B6w179UeTk9srPqmV+f043f1k+X50lKLIXQWdiBTU
         5K0Cai3mbgclWR7DF3olO5/DZ31I/vkuvBzgQ/FCrgQyiag6O+KRd3QFgJE50r7wqov0
         +BHn3HkDvwGU+yWYzvmPZJB6Bj6FrQ1MmrPWfGxeI6XEzxVjHvx2jnOhuXI7Fq7QMIzm
         mjXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788339104; x=1788943904;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LBFg1pabf1pO113gxKvEtkZZTp0GV+XYusVmM24SSJM=;
        b=gnu5dT+r6wP79KWupfXiXpvATwgf1KPNZRawZVh3nJJDmABCJTr+Utd/WAEsE/rL8T
         AfGLHAjwryoN+0DeRRLcDuwfGGHO7qfAHoRemzteSmK/ICen/tzZLZKps5JSu21bL6Jo
         B9/cGEYJRFsa8nyTBsz7twZK6CoJrCNDmlzqb+djJjmWQ/2D+Winr2RpEWO4xr0Zuqgy
         Rxp9Y4wQkAwRpJxmBmEFYnLSQQ4C5gdoKfzPtPggyPzYCQaBYK1YIRB4oD8YjPFKw+qO
         dSSQfYGe+x7v/8ot8bdrlN/GPKxkbTvbx4eozXCv3A/tw5uNcYZbHToF58Fx+UwCkoKm
         /hkA==
X-Forwarded-Encrypted: i=1; AHgh+RoaEPKKWya865Z/gTsGlOH371Jw7RPNQyMKN7NBN/XC6P4TZtRHER5TgdEMbGtwqKq5mIRDtX4BUkfvyTw=@vger.kernel.org
X-Gm-Message-State: AFuF++kk03ttcXNwR33EkwmAnP/5MeNpXfM0XMJnHpXbmyK/Mpq14DD1
	cFzfGFEmCG5CmFNqb5qsXYomFF7ibMCvLhgfIqmEPbgt7MVPvkLGdD3VgK9IHna/vKjcw/999mK
	a/5bdwNqUbtJJnjVpuYDCeITHfcZGuZE11/GDh0hQ+9vmSis9kQ5ChwxnWxo/WE0UZwI=
X-Gm-Gg: AR+sD11HHg7f+F2LNw+lCaMqqjhxs3q6rC5E2KFUODWVjiRsoanbVvutyBk3dkbhn2O
	DufSGO0vRKLVpPI3uluxv5DByrnlK4lR6kvkyUK+qf8iCevnA6K2MSDtR3ToFCremmfZHQ4kIL/
	8ZJwOjJ+7oWKhmOKEzHfXq0821kzI7mOhLDDeDE6hL+HGrU46yAc0etQw9q+j4eFVfvsZiEFlQp
	9bl5BkORwlzjeoz685Vyl6ImK5AcaR+fhxtKT7FG9e0PermSyGcr2c8tQbuqmoVRQCq0ul/giBP
	XN5oO6HgNEFYoalBjnTBTs3LP5vvezsqf6MsEEJtGXcMuoUnfH0SZmO9o2e3Pu+QNtoMxWHqgRp
	KO7QrnRjjItdGiVhinL6BrA==
X-Received: by 2002:ac8:5a09:0:b0:528:1ea6:eaee with SMTP id d75a77b69052e-53036b9ffd1mr19442941cf.1.1788339104089;
        Wed, 02 Sep 2026 01:51:44 -0700 (PDT)
X-Received: by 2002:ac8:5a09:0:b0:528:1ea6:eaee with SMTP id d75a77b69052e-53036b9ffd1mr19442071cf.1.1788339102698;
        Wed, 02 Sep 2026 01:51:42 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a67f94242csm709891a12.21.2026.09.02.01.51.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Sep 2026 01:51:41 -0700 (PDT)
Message-ID: <ef06178c-5c16-4cb4-8ef8-3a7e1ccbf260@oss.qualcomm.com>
Date: Wed, 2 Sep 2026 10:51:40 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] regulator: qcom-rpmh: Add missing regulators in
 PM6350
To: Luca Weiss <luca.weiss@fairphone.com>,
        Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20260901-fp4-regulator-supply-v1-0-68288ab70aee@fairphone.com>
 <20260901-fp4-regulator-supply-v1-3-68288ab70aee@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260901-fp4-regulator-supply-v1-3-68288ab70aee@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDA3OCBTYWx0ZWRfX8lh6BfI3vO+F
 JD4h177QrLGmZ84pDsmJ1anfHb/ctBO/Gdj+Tgs0Y198w/nt/3wxZghXH+8B1g17WaI+t9RBrg0
 6DYRmrPkTSLxxEbhmTnAE2iMhJINw++9d+yV8cZHT30QJSu6Y+M4rp4pI1Ljee0PQ2hONLvCno8
 5XIpqqxI5ZF6lMkvGymGZFJej8OpDoNrt1O0Cc1OY4H93FyshNzsjmnf/yYobMh1hGjIsreakY3
 cL8+WeVrmGfNFcK2wHcxFsPFWSwBwO5Jqe3h/P9QqCW/miAwyEAcnLchTWNe5vIaghioTRL6ufT
 YxYSkIkSJU2pZxFMtX8dfWcUqNIUZiyIV0Frcz2EVh/6HXenMaujzwOUI2BM9SCgRlV1BByztGt
 XTTAG8OqICECDo6z4D+YNB9JE1g9cYjeCXIIPx+UjrCXde4JxKKyWcCqVNNbHhvv4nD/FN11HFm
 QqHt+V8sFLfF8J6xM1w==
X-Proofpoint-GUID: 51-4Gah_urqcY9DEAYnChyNL-J_W338k
X-Authority-Analysis: v=2.4 cv=D8N37PRj c=1 sm=1 tr=0 ts=6a97e3a0 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8 a=nApsJwpBuUEKo6u2QBcA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-ORIG-GUID: 51-4Gah_urqcY9DEAYnChyNL-J_W338k
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDA3OCBTYWx0ZWRfX37lkPZJfjXlS
 SEtm+yhl/Ro5kY+2p27eFT22fQ/fT46Ri18P7Z4utO/boyaL0vbCRcmy4d3s9XFCe7ZgJ8I7+Yk
 m5iAuBogXMKbtQKyG99EkI4DXy0d+/c=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_01,2026-09-01_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 spamscore=0 phishscore=0 adultscore=0
 malwarescore=0 clxscore=1015 impostorscore=0 priorityscore=1501
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609020078

On 9/1/26 10:58 AM, Luca Weiss wrote:
> Add the missing smps3-6 and ldo17 definitions. While smps3/5 and ldo17
> are not used from the rpmh regulator driver on SM6350, the regulators do
> exist, so add them with the types based on the datasheet.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  drivers/regulator/qcom-rpmh-regulator.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/regulator/qcom-rpmh-regulator.c b/drivers/regulator/qcom-rpmh-regulator.c
> index dd2265961151..7d20f3e47760 100644
> --- a/drivers/regulator/qcom-rpmh-regulator.c
> +++ b/drivers/regulator/qcom-rpmh-regulator.c
> @@ -1591,7 +1591,10 @@ static const struct rpmh_vreg_init_data pm6150l_vreg_data[] = {
>  static const struct rpmh_vreg_init_data pm6350_vreg_data[] = {
>  	RPMH_VREG("smps1",  SMPS, 1,  &pmic5_ftsmps510, "vdd-s1"),
>  	RPMH_VREG("smps2",  SMPS, 2,  &pmic5_hfsmps510, "vdd-s2"),
> -	/* smps3 - smps5 not configured */
> +	RPMH_VREG("smps3",  SMPS, 3,  &pmic5_ftsmps510, "vdd-s3"),
> +	RPMH_VREG("smps4",  SMPS, 4,  &pmic5_ftsmps510, "vdd-s4"),
> +	RPMH_VREG("smps5",  SMPS, 5,  &pmic5_ftsmps510, "vdd-s5"),
> +	RPMH_VREG("smps6",  SMPS, 6,  &pmic5_hfsmps510, "vdd-s6"),
>  	RPMH_VREG("ldo1",   LDO,  1,  &pmic5_nldo,      "vdd-l1"),
>  	RPMH_VREG("ldo2",   LDO,  2,  &pmic5_pldo,      "vdd-l2-l5-l7"),
>  	RPMH_VREG("ldo3",   LDO,  3,  &pmic5_pldo,      "vdd-l3-l6-l8-l9-l10"),
> @@ -1608,7 +1611,7 @@ static const struct rpmh_vreg_init_data pm6350_vreg_data[] = {
>  	RPMH_VREG("ldo14",  LDO,  14, &pmic5_pldo,      "vdd-l12-l14"),
>  	RPMH_VREG("ldo15",  LDO,  15, &pmic5_nldo,      "vdd-l15-l19-l22"),
>  	RPMH_VREG("ldo16",  LDO,  16, &pmic5_nldo,      "vdd-l16"),
> -	/* ldo17 not configured */
> +	RPMH_VREG("ldo17",  LDO,  17, &pmic5_nldo,      "vdd-l17"),

L17 (and other NLDOs on this PMIC) can do 0.312 - 1.304 V, whereas
the pmic5_nldo config allows a range of 0.32 - 1.296 V. But I suppose
that is something to fix separately anyway

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
