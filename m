Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793198260;
	b=Opc4RdRT3Ajq7rv0AJy9wsgoZJbTJCaWa6xuYwgTqPnmi5WE4YY9HGwMKzqT46tOkzWL
	 0LAgcD0/L8oxMthVyM3Cdi/C6X+OBNIKMLxSM9he6RqMgq3lL2rFYG3kbvQVsE8haATOj
	 ganS+MFMXhf8htfQIBgDv2ODZCSr9iHbrKjJabpPr+uSLZeKAIqatpYocVpHr9rINwhB7
	 mORGQ8QinrYc5Az+3VUpoOPk94byVSuOWifrN1fevU5zJeH3WqNTkUAyXsTEBxCueJGMi
	 w7v0M+LIbzrd5mTtbYAKiZ5Fm86R+lP0IhtWYsCXSz58w6mDv1M2uNpCtK560jF0dGA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793198260;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=vlUL5txdhxREUhLW9UqljJ3TVJiPo++T56X6t/sEh0w=;
	b=T2yvswbGXEkfK7lkzPVYbgQDlgDZe605o4v0Z8uezZGY+K+f4/S3geYzfcQVY5LdhWwu
	 IijfkiSA9Huaa8mV6fjXOkMgQuzfT5v+YpwOnW/FsIncrxZCtcoReRB4ZX2gDl+zuqirV
	 pOKvcGdWDAwMNkR148Lniu8sms8rixEyIjffVMwz/+tkmAP8UQH6MooS1w4BH0E2FjvD2
	 8/2zsMaVcK6XzmQv+9GhaaiVoVqABIfsyXnRMSirMJJxKX8fUigl+wAWc5Dh5DlKZtm+M
	 4rr8nk36Id7abg22Jdbvtg7LcBgAXf751EwG3vLBouzLvdqgAcwIDeiygfhPX3kn9Sw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Mo8QKtvX;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YfFdk14c;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 535F8606A32F
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 14:37:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 535F8606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Mo8QKtvX;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YfFdk14c
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SBdxFr4154582
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 14:37:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vlUL5txdhxREUhLW9UqljJ3TVJiPo++T56X6t/sEh0w=; b=Mo8QKtvXUgWtezBo
	IWgLCX97eCdpRf5KvhLLQgXyUGqqhu4USHlsr9os0vzPZT4yazTxQkpCPbBXc3PL
	+IeVjF6rfpTjbph9MvQS6o2bFOp7JI9lmzmxuX2iCSdvFwKWpGSe02i7zpekDkUb
	Mr5/FkhfryENrc3GUBVX6Z0Zg3O5olNzQNB0YotlvbJSIoln9HY+icD+C6wMSrwn
	tuRz5oDtr8JqFoAM47eQPOycMCBHYVyhjYUfu5JEYV1uNAW/5nRGn1IcuUT2KgLD
	Zu1E3Jkty88q23e7qqqh+3tCyRtBNZcMASHztOD1vPT5lgJI69/wwZh16cA+VnrU
	xyVMMQ==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkdsp1ags-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 14:37:38 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-988bf286521so73248241.1
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 07:37:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793198257; x=1793803057; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vlUL5txdhxREUhLW9UqljJ3TVJiPo++T56X6t/sEh0w=;
        b=YfFdk14cvsQz12ZdreeQO8tDpXUS7UcaJT1ZJEK0LugExSDG7tkg27AAOdorJi4xLe
         u3Hj6TWHwzzpPYmwa7C/Cc8h09DqoVjyAEnYfTQ/Hj+lHPCTNQf71C9dxQlVU/jFXQYp
         oS5YJ1JVBPsyvNjBSG8+ncmFEEPPSmocj5YQP+7UrngU5mOiwSfN/yvPVEvdSAaaKDgT
         5/oVf8ia0Od2ssk6MRiu+3K4HZdedaR6CwEt9I7xbOt/DpMNoq8goyU1J1k4iSVpsAYe
         1Mdju8YQQekajMR5h68VGDHY71r6uIgm58NuZ83mBItZtxOkxXqGCPMlpMbnj1CyF1HV
         TTSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793198257; x=1793803057;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vlUL5txdhxREUhLW9UqljJ3TVJiPo++T56X6t/sEh0w=;
        b=0rfRsJJIIE0kX95kUW1m1aPFu0sqihRi4e+OlqdY7ZPf4jY5qlE3Vs9FmiI31qstrV
         3fnACEyyxrr9o1q/qIzdX5M6aErjrgs0VdvaszoaselzCy3gOjBdACW2t07ovlOVclkf
         kk94ICfRPqbSpyal3ByhMRB/qPVpKzg+9GZmKKnoKJ2/FQqlhsz6vdDGXE7BoMTYz3TW
         +zQtDlWO2WR77npskl8AW5f1aTg8yNWzHbrtfWS4jJq2gcP2sF3ELhQ+0U8Fa520uW2d
         ynVFhGaNCyySPO1B8EpFfVbw28+N04KLUBNT1y8DjgBogQNOaFURYpxKCTF8Xl/LiokK
         12QQ==
X-Forwarded-Encrypted: i=1; AKwUvBw9F/KY3LDjKChqHHiPPUemCAls1Qo5M+EjIxMlktnVsD6/2eXMkjHMqZ18h+WwzG0EEh5BHiR4pgeXC0w=@vger.kernel.org
X-Gm-Message-State: AFq9FYJg1x4UXzoIvOuAzzDbqsNi5CAKdMpvO+wyeA6Who/T0tr6ly5k
	5/QJFVRofZB8VEjJ50PZTBq9LgHLGw9My7TJX1D2zznXt1ikh0W/FUv9WarmUNcyDLflHOeqq7k
	EQn4TtdxdJdMedmfdX8h3QFGPOvOU3I5lXtTWqgdmOqw92K9H+/aqkzKwx7g+Mb5Qhd4=
X-Gm-Gg: AYBFou3t8SMD6BUeJ13jj1N1oePvEENA+L38iJcncq/c/uR4vY5KJc9E75VCE9BIxb2
	YT3mOW7pX+q1esR02iSOrKQCuV5I3RobYeMhGkhdNqD+8RXYpZWF/iiphSWcEONprZuGYRoVzvg
	VELNGzc9AXaZo4cTLG4sNIpE79Bq8fElyHtf4J3d2a4n/zV3nUV5+ChAQ/rOKlN4CRpEi0/s1pQ
	rbknHBLGGssr88jko2FiXguHlZH92tlq5mM+FOWvgPTQzKw9GWPOhVYiYI+bS2kxFinSoqwwgHL
	KP4zAmVisPnAsjNhqsgGSxxu8XfEaLyvYW50Pb5oFMDJ7Sbuw2VYZMzFh4TAj8NTp9EiUQQxYzc
	Hr5/m77XcjjT3zc4ii3BvLBPMkM6FpFhO1QH26MH30dOJ8PkE7Wq6IXfciHYZfdA/y60LjNU=
X-Received: by 2002:a05:6122:3b06:b0:5e0:2ba:5a06 with SMTP id 71dfb90a1353d-5ec4cca1106mr1415591e0c.4.1793198257500;
        Wed, 28 Oct 2026 07:37:37 -0700 (PDT)
X-Received: by 2002:a05:6122:3b06:b0:5e0:2ba:5a06 with SMTP id 71dfb90a1353d-5ec4cca1106mr1415554e0c.4.1793198257053;
        Wed, 28 Oct 2026 07:37:37 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd4e784esm601408766b.19.2026.10.28.07.37.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Oct 2026 07:37:36 -0700 (PDT)
Message-ID: <5b27776f-cef4-4963-85d4-6d2f970c8484@oss.qualcomm.com>
Date: Wed, 28 Oct 2026 15:37:33 +0100
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
Subject: Re: [PATCH v2 1/4] dt-bindings: phy: qcom,sc8280xp-qmp-pcie-phy: Add
 vdda-refgen and refgen supply properties
To: Ziyue Zhang <ziyue.zhang@oss.qualcomm.com>, Vinod Koul
 <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        peter.chen@oss.qualcomm.com, qiang.yu@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
References: <20260916102023.2054761-1-ziyue.zhang@oss.qualcomm.com>
 <20260916102023.2054761-2-ziyue.zhang@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260916102023.2054761-2-ziyue.zhang@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: nK7trEcXyjlWSIdNht3OQmHu0aeYvOVj
X-Proofpoint-ORIG-GUID: nK7trEcXyjlWSIdNht3OQmHu0aeYvOVj
X-Authority-Analysis: v=2.4 cv=Cssq4X4D c=1 sm=1 tr=0 ts=6ae208b2 cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=PuOz1RSaosiZ807nmPEA:9 a=QEXdDO2ut3YA:10
 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA1OCBTYWx0ZWRfX2gkUfzZ2q6iu
 2EnB5qvtsbxvixvWvm0XE0x5oxoKtnvKZL2o1ckT7yXVSMyg9kBMjrs0zLe/op/ofp8UCjPxkHc
 7G2ex/SoWMYDUv7NWDU8ImK1t7B1zh6TINDQ2I6rNuH6B9Z3qbQ/qDwUbXc39QsuxwgoxjQzcg6
 PPW/QTYnWPz3QcoMziyLuXqakATht5vmLRj7vTf0TIJei5n1llbdwkdcryhZ6fSacuGlJz5c8+l
 kb+TjwECNzh54ZI0RbMGfk8+f6la6E2UdhOQT4d8/hsD9ElBiQGgtDeW4a20eNYCG9zAb1f0p7f
 UgxVVOIqhO3Q+wg+1P03vGMKsumCuBg9E1pE8R/zvJVpxG6I6BeL8GUz8y1I0pJyczXLb4Ch9lY
 IHlsd6Cd6jZT0s6J9rdVIlmySdCArk8MKcLoMvPnI0VaAZjhJR4qH1EyzqdBP21wsU8XaATR7iM
 jrzPlwYJshjIceEPVxw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA1OCBTYWx0ZWRfX9j22jQIHN4hK
 38TpDjyJgUSwxUvr1rhQMyMl/bsNrfhM4WDeaeJVstJJISVLPY3EQf3wK3FnsnipZJrDTztEh8w
 6oqnO5riGTU5KnMdyZNp5kSuxXCBAmY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 impostorscore=0 malwarescore=0 bulkscore=0 phishscore=0 clxscore=1015
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610280058

On 9/16/26 12:20 PM, Ziyue Zhang wrote:
> QCS8300 and SA8775p PCIe PHYs require dedicated vdda-refgen and refgen
> LDO supplies for QREF to provide a stable reference clock. Without these
> supplies, the PCIe PHYs cannot work properly. Mark them as required for
> the affected compatibles even though it breaks ABI.
> 
> vdda-refgen-supply is required for all three QCS8300 and SA8775p PHY
> compatibles. refgen-supply is required for QCS8300 only, as a workaround
> for a hardware issue where QREF actually depends on refgen3 rather than
> refgen2 as documented, so the PHY driver votes for refgen3 directly via
> this supply.
> 
> Signed-off-by: Ziyue Zhang <ziyue.zhang@oss.qualcomm.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  .../phy/qcom,sc8280xp-qmp-pcie-phy.yaml       | 27 +++++++++++++++++++
>  1 file changed, 27 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml
> index b353b7bfb839..bd4c98784142 100644
> --- a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml
> +++ b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml
> @@ -94,6 +94,11 @@ properties:
>  
>    vdda-qref-supply: true
>  
> +  vdda-refgen-supply: true

There's 2 REFGEN supplies (0p9, 1p2) and the sister Glymur patchset
defines both.

Konrad
