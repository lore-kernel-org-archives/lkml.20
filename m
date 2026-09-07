Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD76A46D0AC
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 10:57:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788778623; cv=none; b=b/97t1+Mt1loOX997UAH6PLJNcjGJejZVt/uqVwyjSm1Dn7tg2c0zHSRld5rnOadRQazUQVgZU7T/xBrJeppSn7K3p198Q1J3vRaxlK1vx+tpR/D+uAoFXEKHX1NMH8J5dMmCrl8iRxoBTZClyz46txMxr7DjJRyn91Zxtn5UPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788778623; c=relaxed/simple;
	bh=v1gOmgndgVwqDZV5PtIH26ja5YsrzDRqZskTemBCXng=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fej2d91c2qG7r568Vgufhk6+lO0h0drIwg0MRLOfE+HNabLcPZQfc+e3/KLzGuJo2JZqKG1j+RcoEh7s0fynOORfJyYm9pTmfQqoUI3k3sO8MelQeCgtJ2JBNcNP2ICHZ2i9y47jSUKyhYDLoCCxEo+cndqkh7vAnXwUHiMIbSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SMDs+HB5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hoMn4IyK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SMDs+HB5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hoMn4IyK"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 687AnDaK004211
	for <linux-kernel@vger.kernel.org>; Mon, 7 Sep 2026 10:56:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	S/u2aOnm7jMdJvz7fdHpTftANtj5i2bKRGQOMp2ZeKc=; b=SMDs+HB5G3BJ4Haf
	jEPFDlTrUrnXF7BWyrIGYFivDdaud7fvIL7+z8AlFDabEKQyYfBu4fSNhq4yl1nZ
	EIOtEI/8q3+7EZjsLZEF3j2Z03Ahc03OhfzaQ51c1UU3czOPrtrOdnj8ekouxUeC
	jPLaA62Vlyo1Nbg98zcUOiGEKCDXdxY94gfO/FxubMzhIZKCUbNWJRdYe3RmJzzI
	2TTJEgShVm9J5zEjKcCcjtb6jSA7lGelod47u9n9QHQB6mHPHM0x6urthO99O8oy
	YhC4FGmDDfOf7c1BqNP+efAqqqluBIu65b0AeBM+P8Me5n/AiHI0Py2+XWNiFWKp
	SgCE+Q==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghssg0ndy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 10:56:58 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cc132709c76so4827659a12.3
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 03:56:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788778618; x=1789383418; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=S/u2aOnm7jMdJvz7fdHpTftANtj5i2bKRGQOMp2ZeKc=;
        b=hoMn4IyKPpo+eSABUFLWrwTgFo++A9qsBjJH5kA3+thQUk094CgG1NMqXMCR79MVLp
         rLLexeSf/ZJlzQXUNBgo2yhoNVByfWh/n/MkKHExYIZFWQwfycb07Wz1ctmWhXVDzrxp
         LB0abEYzTDa/By1ETkKoKIYDH4k+RtViJE3eyQkUT+eMQIdNGGDGM0aKbMFe2lGY03ye
         u6E90yIAlJjiKuC5e0lKt1emia3+deWCSA9kNpgtVdXgkAGpRScnrLlpj9ITUREWqV1X
         7WCPGZ149PCzAhv+EjVTkWuYta2lWuzQdfc2gRv3djrafY43jE6RvBC4wYff89cMYnR+
         JPsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788778618; x=1789383418;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=S/u2aOnm7jMdJvz7fdHpTftANtj5i2bKRGQOMp2ZeKc=;
        b=J81+1dQ/7NYBqitZ3FkY8VcaEGqZ4y2sg5bRk5VDKCOF1UgMFBHqluSDfi8DD10jqX
         X41qONv4osPfRsgqhNgLtoFpA/GUOU68NWP2rD6CnvdJjsVjrxp4Rrn/wL9VqVdeWR8x
         LJcVk788SpSkkFThdhi+fUxvZmO8i5g+M/KO4BVFHuWloWUyzR4HZU8GqIkgsGpGvx3Z
         q3/2ZmmGO7CgbwfX/vR5RZrnMXzKcTxZTX5GxO193zHgMYnkvmvR35Wo+pnkQ/19VcIy
         CbKwFg4lUMEP/tsEOjSc58aT4KYMOXwS+I0PYqISVaQxHaj2fgPhTD8+XCsm3ElfBKS1
         YDhQ==
X-Forwarded-Encrypted: i=1; AKwUvBxNGggVfr6Z5vuQIGo8ZJJ6QVDVdA9G6rR+dJUHRbvj0WFBKOyYXnsSBK6rAkz86uFmfAv1qmbI/xDNYJ0=@vger.kernel.org
X-Gm-Message-State: AFuF++lrT3lcwvQgm9XLF/i25HnNAySMfWDggynqgqVzuSztKgZfNMAZ
	Iye9DwGI4nPZkLq0o9Ygufx0SXsDpuYx68YknPMnMWx3UcRwijQi/s5GLrstl8qfFpmRNXFYt+S
	DAKMtQg5t/+7UiCXEy9CgQsXsRlckIkmfcM/L8UnshOvZmwd+vZVAJIlvI5cAfo5WeOE=
X-Gm-Gg: AYBFou0uZRjTBQcuIUaRLMg6aJvoKSWVOixEmEU3xQxmlW5uNw6a5+xgcy5hk0HSV/4
	+xnUX8rkTmdDlTICOxpXuDWKKQMURppELvbpSYCPBA4MHuR3/+ryRLQy4qYvKkalF/fdLod62wE
	R5ptbN4bishGvYTCbgy4bTXG0PrUlwnc8twj+wTGW4QCJfMc3nCDn/1B20Vja568vxGbhplDX/C
	beeFeWhBblWI+RQ48b0MHHP3NH2pACkvXaGM5cLjBxOHb/gi+fHLEjgxfd8+d6DT/V1BeOtehbx
	b8kiNjGScKEzwyfhLiYjC1Q5j3mJOFEUmLvP8EWdXfEGR9UhAvtC1t0L/l9y6I4LnUb9FxGHvDZ
	0NYHtJ9WAx52Lq1qKSYr7u9616PiwIp/zWRbm/nCdofIy4vp0vmNbFvjLOKqUgU9p6W2J+DMlcH
	afAzvfq3dJ9/Nh4o8I5w==
X-Received: by 2002:a17:90a:1189:b0:39b:61f1:8032 with SMTP id 98e67ed59e1d1-39b61f18060mr6977277a91.16.1788778617624;
        Mon, 07 Sep 2026 03:56:57 -0700 (PDT)
X-Received: by 2002:a17:90a:1189:b0:39b:61f1:8032 with SMTP id 98e67ed59e1d1-39b61f18060mr6977214a91.16.1788778617136;
        Mon, 07 Sep 2026 03:56:57 -0700 (PDT)
Received: from [10.79.116.160] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339885d29esm30014762eec.2.2026.09.07.03.56.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Sep 2026 03:56:56 -0700 (PDT)
Message-ID: <97360c1c-f573-48c5-9917-4bbc34ad394d@oss.qualcomm.com>
Date: Mon, 7 Sep 2026 16:26:48 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/6] dt-bindings: phy: qcom,x1e80100-csi2-phy: Add
 Glymur compatible
To: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>, Lee Jones <lee@kernel.org>,
        Guru Das Srinagesh <linux@gurudas.dev>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, mfd@lists.linux.dev,
        Suresh Vankadara <svankada@qti.qualcomm.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>
References: <20260907-glymur_camss-v2-0-75f7982dc983@oss.qualcomm.com>
 <20260907-glymur_camss-v2-1-75f7982dc983@oss.qualcomm.com>
Content-Language: en-US
From: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
In-Reply-To: <20260907-glymur_camss-v2-1-75f7982dc983@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDEyMCBTYWx0ZWRfXxSaT3dqa3u6n
 xtmKG0ol9Ep16Ay4rehxpILQn1E2nOq4k6wRGYc44t4EOgLpBWBvfKrWkjmkOVtNuu4JEFgu+Bc
 mBV6oyNiha9P25OMdIW778Cq0PS0bmO3+nnHHizTM8ZomG3PlWgiVoocuFvwu5hDXJMWeMv/EEv
 A58oaxycucupyFK+JoFfw95EOxvjp+hrxlmkIH8De8QNYQL0U17gNfhPXZlnbXyeup4Z2rtDWtm
 MwtD5RR8T9Nf21xX1xXZdHgCm63NlESbqaOXmjAeaWoACZ3k7Ers8NcVBFJ+fRpkWngo2QpWIWi
 vDL+rW3nH4Ym8KRWgSOYMNjCCLayIebOO0JdWBfliqnuPn9/3I59zPGObmRQBY5s8ooqbsBrHnB
 f01e8vgkiJebrP1NabxbxJ2N6syr6fxo/q5/V1n0iq+PVHqeaWFAG6CH8MfI7K2ZZHaw9aNamKj
 XxxgFL9mpNaWW7pCc6w==
X-Authority-Analysis: v=2.4 cv=MrJiLWae c=1 sm=1 tr=0 ts=6a9e987a cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=FCQm1kSmxEXMnWVgeMgA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-ORIG-GUID: OtYjmeqWK3VfsNiuyttwyIl9r0JiFWCu
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDEyMCBTYWx0ZWRfX8jfb/8yW2a8F
 EyZ/Hj1jOWyMzc66qtNyonfCUiMZrzzSXeC2PbrZx7xDjtopvuc0OBm/WzXuYjsDMXxVtNGgWD0
 gRZHM5s81OF3Oj7XfI+EGQ0vDCA3kHc=
X-Proofpoint-GUID: OtYjmeqWK3VfsNiuyttwyIl9r0JiFWCu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_03,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 suspectscore=0 adultscore=0 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609070120

On 9/7/2026 1:43 PM, Nihal Kumar Gupta wrote:
> Glymur integrates the same CSI2 PHY IP as X1E80100. Add
> qcom,glymur-csi2-phy falling back to qcom,x1e80100-csi2-phy.
> 
> Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
> index 993271c42fa063a82cb0f6edd41e87b30bc8e109..7ac944974849b99abd982b1544ef39fc32e1f21b 100644
> --- a/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
> +++ b/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml

There is no such file as qcom,x1e80100-csi2-phy.yaml,
Same was pointed out earlier on another patch,
https://lore.kernel.org/all/20260722-literate-nondescript-seagull-cbdfaa@quoll/

> @@ -16,7 +16,11 @@ description:
>  
>  properties:
>    compatible:
> -    const: qcom,x1e80100-csi2-phy
> +    oneOf:
> +      - const: qcom,x1e80100-csi2-phy
> +      - items:
> +          - const: qcom,glymur-csi2-phy
> +          - const: qcom,x1e80100-csi2-phy
>  
>    reg:
>      maxItems: 1
> 
