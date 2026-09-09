Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 988753E1228
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 12:43:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788957791; cv=none; b=mBdMYpXEcKrkrR1JVmIqUfVI8u4dzrKy7nNMm2rOAotrI75lhyGWunezTcV4egcejo82Y+dPDiF5vr4hpe2iexfBealRnKkwXsbj82fp43ZmBPbl12EX86WFeNc4QHH7VaePgpPQP4TogfX24UwRA7SAW+2L6Aq/hjhkeDfmjsY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788957791; c=relaxed/simple;
	bh=mzTZ/S7+IJMli97Pl3huO2xHKYlikMJEbLwPxRSRxlE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MPUPq9fzH8xM6WND4HvUABWT60dDtNZpSAx4UUvd1BWQoJnd0ETXBAyHu4BkoYTDhYK7ratPP8fJ39LBDfIQ0tOhRAIG7whCnZOaMERmAyh+8abm5NJ1+EO5nyGYYsLisOOUng4fzcj/vz6xDw5ABz+8I2nXAOZUUYrM8CUARVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=klN1P6bb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HHWdJTM2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="klN1P6bb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HHWdJTM2"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 689CAS381233040
	for <linux-kernel@vger.kernel.org>; Wed, 9 Sep 2026 12:43:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	I4h5BXcebG+P+PaqL01o6HAlbOlizJ6FcqLSIe5pdf4=; b=klN1P6bbHCPgPlve
	NnwHMq3xl3dQD5vMbBxlHuf2TFWL91G5renrlOXpc33xRUn+HtAXFRdVcLqCSWwh
	Z/MFSGwQF6nKrTjqTR6wBO4OUTeesnETVnqZWZ8ocsCG9OCLynhSHIZ5yYjC28SM
	UWi+Yo9Ye6HjBotQHrUb7TrBuH3hrkJhld5M0xy5dX7F6tNYcwVuuYsJxa5HJKFK
	fAZZPFTPBtXPojBkxIkCrVltGgEQjBjkxpofzSk6hbLA68KO4888N01/QGRmr3LD
	qqY1YPYBAYQGwBTfVbiRI3EIGPE+7NqsiZ4B+M2sYwPNkfOc9+lhd0qqCdhaFHot
	YfYWSg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gk77vg3bg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 12:43:09 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92e661ce1dcso74629285a.0
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 05:43:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788957789; x=1789562589; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=I4h5BXcebG+P+PaqL01o6HAlbOlizJ6FcqLSIe5pdf4=;
        b=HHWdJTM2CJn1Nv0Y9NL8maK+WEI/re3GZXWM1aSQ0MOPR47lrc+LSkmuybON+YnO8p
         6GsuTxsfd+ReKkMFBAGzb5/uvyRFvBnEEQNyss9CqamEkq7QXzbLusQfg23Q82qZmP6D
         QkajqAMYXWFT9gOo17vX67etXUPNQkXMnAAxRAlmRb35zupBidg9OC7c5OUcJ7TsvE+D
         bsQaV7o0KJu+JUuhB+zsrwYxRRLQYKkTWliAo0VAnJ2lasNGLwT1UTfwdM+RHouT12rF
         6ttEo0VPwLH2qqWYxOmIn00gqWIW3jQiiAQHdE2APIyN3aFtY8Rngpo/vVsmOQ/WGfq4
         w2Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788957789; x=1789562589;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=I4h5BXcebG+P+PaqL01o6HAlbOlizJ6FcqLSIe5pdf4=;
        b=P8+LF6+8T0eOF601nZShgdkOs9yF/VuJp6SgUqTvQyn8Ahx5ByoUtVIm5itEo+CGAy
         jKULyxSDOloCKi4ZV7495aw3eivLLf2MdxWPpDVySXb0vwrtxlFN00Ii0HiFrli2/wTN
         uMNSC2zCwOPVu5O4FRd0EIovv1gos8KjfU9Of7xXStiGvUZT1zQkN7jp9/Swomox87iY
         FlO4eJtq9LvcNyH0XiInZ3qcGZAfo9Zt7o+pnh60avJYf8ly5XDLltGwTDyRTnzT6AF2
         DnvU8o/MXBUr7kOkg5yMVPl+nPtvdplUmhyViUU7cCytyfGidGfjZONw670g+2VjAuyK
         nMJA==
X-Forwarded-Encrypted: i=1; AKwUvBzuX/pCXnAj4vCQu1I4PCZ4wWxCcfp8HxuYv13+FXvhn8DppTDtWlmbVHnPN8w4doyayu0aeZ5aywBiPCo=@vger.kernel.org
X-Gm-Message-State: AFuF++nL/hiIzeJFgcWloBckyTIlQPeNRez085RiIidSXwfIqH6OGB7Z
	DrTIhgIsUzYrHZk/SZr9iKX7o1y0+WVc5zz4mElZ44BTet4UA8qqFPZje/7ygMfjexvZTlCLtQs
	WMTF+UsaE/IoTs91Qs2XMetKSXhvap9BZ5ROp86TCLR28HXNj3cZ91Vg6+PObvENv5Ag=
X-Gm-Gg: AYBFou1WRVu2Mlvx1KzPZ22A1OkDOqR3E3bIjsm4rU1/07GO8Fo00b5Vaj8wn4R4nVJ
	tfhY0rw3yRXa+4wsW0xyS7GQU5GcVhfhuEARlvnvFfjt2h/4/IBzfPeE9YOaXWmLbQavq9ycAP9
	izkRku95XTMloq7N8hLoy9kziSVGe6sHrO40Lo8VHfcYsbexR7U3Qn+Sd4WYc8GKKFWy5SlrLxG
	ULIFse7i7ZZKbkGQ7TgOak+FZ/1UwcdHGQmGWWeSFNnO+HRw9X5W0Jlz5o3R1xlfbmiJt4uIFcS
	QVI7pGblVno5uYg6n4LsTzsLsTZyetkZC2gxxud4R4GO0Y3dUh88SfcNpj3ZwHCk++s5M2miTqF
	bT0Js9EBFH02HhWnQddYHgw==
X-Received: by 2002:a05:620a:43a3:b0:939:b8da:1242 with SMTP id af79cd13be357-939b8da136dmr1186916885a.0.1788957788130;
        Wed, 09 Sep 2026 05:43:08 -0700 (PDT)
X-Received: by 2002:a05:620a:43a3:b0:939:b8da:1242 with SMTP id af79cd13be357-939b8da136dmr1186912585a.0.1788957787673;
        Wed, 09 Sep 2026 05:43:07 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a7e68e9679sm6609508a12.20.2026.09.09.05.43.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Sep 2026 05:43:06 -0700 (PDT)
Message-ID: <2f950735-91ef-4e43-a5e3-1375585dc43d@oss.qualcomm.com>
Date: Wed, 9 Sep 2026 14:43:04 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 07/13] arm64: dts: qcom: x1e80100-crd: Add ov08x40 RGB
 sensor on CSIPHY4
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Bryan O'Donoghue <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
References: <20260906-x1e-camss-csi2-phy-dtsi-v6-0-067f2ecc4630@linaro.org>
 <20260906-x1e-camss-csi2-phy-dtsi-v6-7-067f2ecc4630@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260906-x1e-camss-csi2-phy-dtsi-v6-7-067f2ecc4630@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=GKk41ONK c=1 sm=1 tr=0 ts=6aa1545d cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=KKAkSRfTAAAA:8 a=cUeywdAnc2UWe6fb0OEA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: knJZ7q7UxVIimQm4VHEgFyPoXGZzB5cJ
X-Proofpoint-GUID: knJZ7q7UxVIimQm4VHEgFyPoXGZzB5cJ
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDE0MSBTYWx0ZWRfX/SGVAFb1jtz/
 pPjgL83tAlD6FHa4/4zNSjdcxEeqAouDiBqFlYQJgpvnSEOwIKllErtF+XTAzuLqWuDCvTWcDvj
 4762+ZaXyxzED6hG9KIPTNn9KYMLExI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDE0MSBTYWx0ZWRfX9Xvj2D1/EreW
 owGIlMji164bPlfThuwBhyL/A+VTIKp4bhspbch392kxcx6Tm87zvmpDf5v9QG0HI7yCw7MQcrV
 6Ewwg3niCNfGeKQAkry3ft6hnYUqDgtetABCHYMiRlE+/8Dval8nZdDMpMk/2zb6vHErjdtZL2S
 OuHo0yNl4RqL77G02tqG4s6sT+wVJA9/vYPAYVM1bnBRbqI6bjspK2Fj3XLBc9vsVDIxpAaBPen
 oOi61gcFmvUw1rbDUo19dzacu5yH8JXkFnLTCuKVoSWYv/Zv83LUMvTNmVi1p5R9flk/xytqIoL
 tJ822b8oGK0rGwncH/pMBTOmAJDP0m/GGQYObXQFRCQcvCAT8uObuPjg6uDFVG6VZUzDjFxmvK8
 gqfsvsrdhqWiLomZOjxDgaITR9kGcrVX2wp6XkmT/nQDIqTVIYd9Qn1Ptd1bI/qW7eFlMC+2c6q
 AIu7/nhg6RJQBIa0e/w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 bulkscore=0 spamscore=0 clxscore=1015
 suspectscore=0 phishscore=0 priorityscore=1501 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609090141

On 9/6/26 4:20 PM, Bryan O'Donoghue wrote:
> Define ov08x40 on cci1_i2c1. The RGB sensor appears on the AON CCI pins
> connected to CSIPHY4 in four lane mode.
> 
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---


[...]

> +&camss {
> +	status = "okay";
> +
> +	ports {
> +		/*
> +		 * port0 => csiphy0
> +		 * port1 => csiphy1
> +		 * port2 => csiphy2
> +		 * port3 => csiphy4
> +		 */
> +		port@3 {
> +			camss_csiphy4_inep: endpoint {
> +				data-lanes = <1 2 3 4>;
> +				remote-endpoint = <&csiphy4_out_ep>;
> +			};
> +		};

This port should be defined in the SoC DTSI

[...]


> +&cci1_i2c1 {
> +	camera@36 {
> +		compatible = "ovti,ov08x40";
> +		reg = <0x36>;
> +
> +		reset-gpios = <&tlmm 237 GPIO_ACTIVE_LOW>;
> +		pinctrl-0 = <&cam_rgb_default>;
> +		pinctrl-names = "default";
> +
> +		clocks = <&camcc CAM_CC_MCLK4_CLK>;
> +		assigned-clocks = <&camcc CAM_CC_MCLK4_CLK>;
> +		assigned-clock-rates = <19200000>;
> +
> +		orientation = <0>; /* front facing */

include/dt-bindings/media/video-interface-devices.h
MEDIA_ORIENTATION_FRONT

[...]

> +&csiphy4 {
> +	vdda-0p9-supply = <&vreg_l2c_0p8>;
> +	vdda-1p2-supply = <&vreg_l1c_1p2>;
> +
> +	status = "okay";
> +
> +	ports {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		port@0 {
> +			reg = <0>;
> +			csiphy4_in_ep: endpoint {
> +				bus-type = <MEDIA_BUS_TYPE_CSI2_DPHY>;
> +				clock-lanes = <0>;
> +				data-lanes = <1 2 3 4>;
> +				remote-endpoint = <&ov08x40_out_ep>;
> +			};
> +		};
> +
> +		port@1 {
> +			reg = <1>;
> +			csiphy4_out_ep: endpoint {
> +				remote-endpoint = <&camss_csiphy4_inep>;
> +			};
> +		};

Likewise, define in SoC DTSI and only override necessary properties

Konrad
