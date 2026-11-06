Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793950886;
	b=pcLvpiRVb3KwY3G0vMmedkDkteZBvmfioWtik5Gi3vZzEiINBiDOa59Hh4wxuFmCy6TX
	 KIyXLDAmlZPd3rR3VW58RAClw+dnJNiqJeThOXF5yraIiOQ3G1RZFDhkqV2L2SAcPEozW
	 rB7P7BU2jtQN5sZGF+z6Ok2v32+J1fS/Xrlnf8sZtWcf/mJIK7x+XZSWbHygLdFBC9Hqk
	 ZFHFClRvhn1eomh4vYrz/fgC8QuVVo4pF3Semut191Q0nMo5S//60ikkXDeCJSlHk5AHd
	 K4EpwQYsU5ylQV8r9/RBJBdSmuRBqzsROGhK3XAnc5Ro/euW2bF580gJRIY9z6HtTGw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793950886;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=XB0wNn+t6i2InPvlVSlFT5qKnGprBCmTAMXHg+CqErE=;
	b=Cm2ojs50Wqy0lemUM1AjyIJQiQHAwzq5NNgegBcmttiQy1N67pj2FPC4YAIgHRK4JoYp
	 CX2fuDZ7ffrulwOyJBQxIotHv8N+2sap2yTwIY0szskkwbhghjLbBS+1UV/Ac51eMsQkK
	 9TeJy4LcZ+Z+m5qq5FFXCQ9dVSQFRCHawps0l3PJ7ZmR1uy8laSgk5WsLf7goGAjqxoxM
	 oVUdkc3Q2Vna8+cI5gYL9cd8vVRWcg7B/5sTj3lFz4x9nHHxeplK5PhPY8Budv0HKy4MX
	 FJC7CKwAkrxypDvXEvzp5Yiiq7VTM9vTw84uwfXL2Jch/9GVSTQaTKA9/ElZRvyHiqQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Ba8M4wHN;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=iOWJhz+w;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8937B606A32D
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 07:41:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8937B606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Ba8M4wHN;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=iOWJhz+w
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A67RA3i2334005
	for <linux-kernel@vger.kernel.org>; Fri, 6 Nov 2026 07:41:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XB0wNn+t6i2InPvlVSlFT5qKnGprBCmTAMXHg+CqErE=; b=Ba8M4wHN7+OzH9bv
	rVMesUmdPvNwR7vPfulYLXAkyB47ktA6U5qgVpuenAXiy2R8/UINyN8eOCT2ZWVN
	VBjZcqFxmG+3kwwahnr4HFp+PHwixz4qnvniHgRl+TS+hm3UTO2AG/iEJxvKNLnc
	0/A2Cm7LYzieT7d2qt2bowrbhfREX7tRJc2qa4oXqh1iUNbU+rdj3pYtLCJDB2CE
	UpC2qmGKpI7Tp1Ebw0tP5qyn9Owu+qbtyySzHsWT+cs8z/ULMLRdkp1fQzja5fCU
	ZBlHLfkZml/mXjVzPxq0SVeVIvtgQa74U8iybbsezC3B+mGnEOLzjqHwaVu5KWTx
	M5cG1g==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hs3p99raa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 07:41:24 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3b07b06027eso576025a91.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 23:41:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793950884; x=1794555684; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=XB0wNn+t6i2InPvlVSlFT5qKnGprBCmTAMXHg+CqErE=;
        b=iOWJhz+w0D1wAy9pvVPBoRiSZ4TuDp70ovA7BijlmlI6lPcW5tLlUVe8mkhqSm21DH
         bG14hGQ93tGX9tErEctCZQ4QDsexLQT04oyz3t7HuAwZTTh8npR/1n2MLM0UDKUaSmtk
         2gvskBlJ4VqRd0g4XMMdsuWHa+vcaPMJBPyOeb3QvN/wm3kh5EA3TWNDZQ4+OavNaOZC
         SJna4yXskjFTzZIhN3fXrg4eyh+iBbud+S6tr4xq7n4M3cmbjvmq6xSF1FyoeKKP9n1N
         6EKatJZhWn21uk1JK0DZHY+1KrwguI0VO3mhArUNeero0N02Gh7Ze3PShHd9KCT/Ttzn
         npjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793950884; x=1794555684;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XB0wNn+t6i2InPvlVSlFT5qKnGprBCmTAMXHg+CqErE=;
        b=pK0XdW7iKmbA/9kOucNdi5EYqzIafjSTmYz1Zadh2MkhvR4ezSPcUGZpyhFey2syBB
         OQzV+M+xXjFqwFm60IJT3oh/5bb/Y/Cqit0HbEJoFcVJTRWkknEVaY0WNSlWToz+sDcU
         ZVWGuNdyAqfc1fDG9VV1sd9cdUl5eKz7AtNkQO9zzwlLp41OEhxrQq++63WTiRdxIwY/
         J6J3w8baAJbRgqbGeO3g6Q0NaSfp6rjIkHE4dELHuiFJVppRBKmRLxfUPYUSxKPOxDlH
         qdX6prU8Jjm8wIPjxpmPVuKUqBjk5WO4cHDr0G8UXP3GvpVzQkUFXBdh3Kf5oMoqNhda
         DgnQ==
X-Forwarded-Encrypted: i=1; AL+hErHeMv9vn2kVseOIYQgqwjB8mEMTqXD2PL8ea/akrDvhMpXSNeJBYYc9Or9u72ChBPk2+6cJIVtxNnImVNs=@vger.kernel.org
X-Gm-Message-State: APuU4Z9wmYOWKhnrt707ntnoQRPGfkRsYzStNnYBQIz2silOZrHbd71M
	9/0iF8ONcTNjnnN1WECJ105cmirNcTSAUnp/eN0sk3qQjUV29HtKuHIrxaaXlXcP90AHTJbeSE4
	QPMXGxrFfcZvIagtp7fP4sbBZ0Bmi8OdyXsg510y7yDYJQl12TRWc9G5DTbPhA8RWn1y4c5LVU5
	w=
X-Gm-Gg: AYBFou1NP9BqPBEfYG2GIJeJuy8GcpU9/osaFN9ksFmagGRY3SAJmvwisa/e2ESwAwY
	af3DvtdKxllpAZRU/+fwb8bOpNkjQ4XCQ+n41dkl+KT19P3CIBS5rhJDh8QouSXt8J3SdFGTkuQ
	WL5WDadwsZ7R1hLb7O0/lrp2v2jbH8i9kpNqNrCOs7TT/FPUy7r3VnxEJ7oncALUcBeulguI9fx
	XjxcR3OzdQj23gv8EEXdUyM0sOB4Xuyc10gGlrbTHrBSm4QgYg+rWHAb/KL0jH4T4XMHUhddlyN
	5R+fkjXR84AXnyudV15DzzXNIzJECqaWNPYXH9gIncT+voy3qZwYAuf3nJicSnNXP9Vuvs6yxHU
	s/VaSGFp1fnPBLrZW1xtAa4iTxHYad+6TUeyPTPaUt/qVAOPkZ3XjB+y0kV3srmlb1dLnTpDfEJ
	QCGIQWncPQn6hEdLgIhoRqz7GUde3iAq8mRq6vUOr7AXiDQTHOEQIxwA2Xl/QlnJx2LcCL8g==
X-Received: by 2002:a17:90b:590f:b0:3ab:c80:9370 with SMTP id 98e67ed59e1d1-3b0db6a7e07mr1554775a91.20.1793950883887;
        Thu, 05 Nov 2026 23:41:23 -0800 (PST)
X-Received: by 2002:a17:90b:590f:b0:3ab:c80:9370 with SMTP id 98e67ed59e1d1-3b0db6a7e07mr1554761a91.20.1793950883340;
        Thu, 05 Nov 2026 23:41:23 -0800 (PST)
Received: from hu-sivagupt-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0b32baf86sm6594939a91.17.2026.11.05.23.41.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 23:41:22 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH] arm64: dts: qcom: glymur-qcb: Add PCIe3a support
From: Sivansh Gupta <sivansh.gupta@oss.qualcomm.com>
To: Qiang Yu <qiang.yu@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261105-pcie3a_x8_1105-v1-1-d09aa0601186@oss.qualcomm.com>
References: <20261105-pcie3a_x8_1105-v1-1-d09aa0601186@oss.qualcomm.com>
Date: Fri, 06 Nov 2026 13:11:18 +0530
Message-Id: <179395087872.3528382.15097588881376194474.b4-reply@b4>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793950879; l=4536;
 i=sivansh.gupta@oss.qualcomm.com; s=20261009; h=from:subject:message-id;
 bh=kytN93li4/fAfe9OgsE5zocrYuw7GT4tZQ15fWH6OtY=;
 b=xZvGlU5xyj2b1KnkhoDsZIuiSsep6NghIaPJo1tVWL+KxA7nvHzWYSTqi0CpkX3nCaYMsksbc
 eC5n5g43+wAAIoj+Y4doHivy52X3DP2WTvyeusHvIpfoMwjE+5mj048
X-Developer-Key: i=sivansh.gupta@oss.qualcomm.com; a=ed25519;
 pk=FlECOaX69DTzzKU8Gkt1zsAy0qNbAjbWuX+HULfCv/Q=
X-Proofpoint-ORIG-GUID: RBWcsOb2VaNUejqUtWgUIv9o_AcO6EKx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDAzMCBTYWx0ZWRfXwRILDrrwwq6J
 CtT7fIvoGEZALl8+arse8dzLg021N6Domaxh0QK8VyBRdy/Zh9UPxQDkOZCQ3IAgojCJOblLQtL
 /B+iey6cdLkiycLLKq3ORPQiiy0EoKDX2X6KaioVM2OREXwJk50cg36hSaYeIDrrdyLrfJJNDmW
 CWUXjYTroN78nSvzKNhCNTfb6V2rga8DASRHccWP21/VKJuTZk0Kg9lBnS0zXTXX2LBSZTIjLJB
 BItWJ25VtwgVHaWjVa1XRlMLpp/OIzeRjKeo8jCtdfDKoeHnlNm3ewLioF1YGMGsOGS8WvZyNAr
 v23V7Q5gY+ooPyIfEkni6mC+OjHUKjDsZaLKGjuBcGQtlou+X7UxaomrEA7ochO6xOcmxfhKZrZ
 +0igv1QkWqOYHDtyDwB6cBJsQ++6wqxDwcLGCDxcnQw6h07rEnhYHnrJjA/vZSdkr04W4SxjhmW
 ayW5s2CHnLB/JelFocA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDAzMCBTYWx0ZWRfXxg7sjSGpvhLU
 3rQ7WEDbbSdCz/bTje4VXJs0J74ziVHxy7QWeon4X32auSPUSgovyBzppePMNqbUY/2JduvOA4V
 +DIBEGCodIT5t9667yNJ3Mu5dNEVtS0=
X-Authority-Analysis: v=2.4 cv=WMzqzXsR c=1 sm=1 tr=0 ts=6aed84a4 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=19bGYbElEEXa3XtWIUUA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: RBWcsOb2VaNUejqUtWgUIv9o_AcO6EKx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_02,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015 bulkscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611060030

On 2026-11-05 01:07 -0800, Qiang Yu wrote:
> Add support for the PCIe3a x8 slot on the Glymur QCB board, wiring up its
> regulators, pinctrl states, and PHY/port power supplies.
> 
> Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/glymur-qcb.dts | 117 ++++++++++++++++++++++++++++++++
>  1 file changed, 117 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/glymur-qcb.dts b/arch/arm64/boot/dts/qcom/glymur-qcb.dts
> index 17d8ff3aed23..741a24454e80 100644
> --- a/arch/arm64/boot/dts/qcom/glymur-qcb.dts
> +++ b/arch/arm64/boot/dts/qcom/glymur-qcb.dts
> @@ -78,6 +78,48 @@ vreg_nvme: regulator-nvme {
>  		regulator-boot-on;
>  	};
>  
> +	vreg_pcie_12v: regulator-pcie-12v {
> +		compatible = "regulator-fixed";
> +
> +		regulator-name = "VREG_PCIE_12V";
> +		regulator-min-microvolt = <12000000>;
> +		regulator-max-microvolt = <12000000>;
> +
> +		gpio = <&tlmm 26 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +
> +		pinctrl-0 = <&pcie_x8_12v>;
> +		pinctrl-names = "default";
> +	};
> +
> +	vreg_pcie_3v3: regulator-pcie-3v3 {
> +		compatible = "regulator-fixed";
> +
> +		regulator-name = "VREG_PCIE_3P3";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +
> +		gpio = <&tlmm 135 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +
> +		pinctrl-0 = <&pm_main_3p3_en>;
> +		pinctrl-names = "default";
> +	};
> +
> +	vreg_pcie_3v3_aux: regulator-pcie-3v3-aux {
> +		compatible = "regulator-fixed";
> +
> +		regulator-name = "VREG_PCIE_3P3_AUX";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +
> +		gpio = <&tlmm 136 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +
> +		pinctrl-0 = <&pm_aux_3p3_en>;
> +		pinctrl-names = "default";
> +	};
> +
>  	vreg_wcn_0p95: regulator-wcn-0p95 {
>  		compatible = "regulator-fixed";
>  
> @@ -438,6 +480,31 @@ embedded-controller@76 {
>  	};
>  };
>  
> +&pcie3a {
> +	pinctrl-0 = <&pcie3a_default>;
> +	pinctrl-names = "default";
> +
> +	status = "okay";
> +};
> +
> +&pcie3_phy {
> +	vdda-phy-supply = <&vreg_l3c_e1_0p89>;
> +	vdda-pll-supply = <&vreg_l2c_e1_1p14>;
> +	vdda-refgen0p9-supply = <&vreg_l1c_e1_0p82>;
> +	vdda-refgen1p2-supply = <&vreg_l4f_e1_1p08>;
> +
> +	status = "okay";
> +};
> +
> +&pcie3a_port0 {
> +	vpcie12v-supply = <&vreg_pcie_12v>;
> +	vpcie3v3-supply = <&vreg_pcie_3v3>;
> +	vpcie3v3aux-supply = <&vreg_pcie_3v3_aux>;
> +
> +	reset-gpios = <&tlmm 143 GPIO_ACTIVE_LOW>;
> +	wake-gpios = <&tlmm 145 GPIO_ACTIVE_LOW>;
> +};
> +
>  &pcie4 {
>  	pinctrl-0 = <&pcie4_default>;
>  	pinctrl-names = "default";
> @@ -590,6 +657,29 @@ ec_int_n_default: ec-int-n-state {
>  		bias-disable;
>  	};
>  
> +	pcie3a_default: pcie3a-default-state {
> +		clkreq-n-pins {
> +			pins = "gpio144";
> +			function = "pcie3a_clk";
> +			drive-strength = <2>;
> +			bias-pull-up;
> +		};
> +
> +		perst-n-pins {
> +			pins = "gpio143";
> +			function = "gpio";
> +			drive-strength = <2>;
> +			bias-disable;
> +		};
> +
> +		wake-n-pins {
> +			pins = "gpio145";
> +			function = "gpio";
> +			drive-strength = <2>;
> +			bias-pull-up;
> +		};
> +	};
> +
>  	pcie4_default: pcie4-default-state {
>  		clkreq-n-pins {
>  			pins = "gpio147";
> @@ -659,6 +749,33 @@ wake-n-pins {
>  		};
>  	};
>  
> +	pcie_x8_12v: pcie-12v-default-state {
> +		pins = "gpio26";
> +		function = "gpio";
> +		output-enable;
> +		output-high;
> +		drive-strength = <16>;
> +		bias-disable;
> +	};
> +
> +	pm_aux_3p3_en: pcie-aux-3p3-default-state {
> +		pins = "gpio136";
> +		function = "gpio";
> +		output-enable;
> +		output-high;
> +		drive-strength = <16>;
> +		bias-disable;
> +	};
> +
> +	pm_main_3p3_en: pcie-main-3p3-default-state {
> +		pins = "gpio135";
> +		function = "gpio";
> +		output-enable;
> +		output-high;
> +		drive-strength = <16>;
> +		bias-disable;
> +	};
> +
>  	wcn_wlan_bt_en: wcn-wlan-bt-en-state {
>  		pins = "gpio116", "gpio117";
>  		function = "gpio";
> 

Hey Qiang, this series conflicts with my earlier series commonizing
Glymur QCB and Mahua QCB.
Please take a look at [1] and rebase!

Best,
Sivansh

[1]: https://lore.kernel.org/all/20261027114955.1266499-4-sivansh.gupta@oss.qualcomm.com/

> ---
> base-commit: 8b7179210b22f8e48a82c5ceacb9d56a9c4cfec4
> change-id: 20261105-pcie3a_x8_1105-72b9c8dc1ee3
> 
> Best regards,
> --  
> Qiang Yu <qiang.yu@oss.qualcomm.com>
> 
> 


