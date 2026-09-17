Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B356308F32
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 03:46:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789616806; cv=none; b=Ey9LY3Bm+ELSSJR8c1akQMAA91y1HgpHnNg5IVd+31yUSdXguSb6nMJwhxdb3mZtWSQxQjPfqQHTRFLJbrZsIh4b0xiwDfqa/IDtbQXv0Dej2lOZwt/GnYTQdT2KKf+2VXiIhlFggQlWgbzR/phK8uvXiHRGhHZUiEvj1ucyuOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789616806; c=relaxed/simple;
	bh=FE98/EtCXzIk/H7+HR9JHG6q7GZbeAFfSGJyK7225/o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D6rmu680XN6cnTP3Av0Nfvs6IHy03zcM1btihWUwMBshyiKMeetNqUUOMv+ZCtsVKpa907pGj9JR2vZbX+pZtL2EX2I79eJSpQEb2ffdqz+rB80om6hdaVCFq1KmvYpvLpNYU/x14oGHgwgiIzOz7jGrAja/itirpxqCk9IRa6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Y4oXf0Kd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Xm1Alg2D; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Y4oXf0Kd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Xm1Alg2D"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68GMotH93107159
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 03:46:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=1uZ8b+rX18pa7Jr+IgH5/3e/
	j/5cU/mEwp1SgQSgluU=; b=Y4oXf0Kd+OHbSzMgSoi6yRXjafTbOWnWH8inVW46
	hxPYU6R3/HmSG7w2MBbCIyw6+6CFtyq9zBSxs0nHFarIuoaGV3jjnSGr2kyvIixe
	NcIZKD3KE6Pjzjb2TWkrZL94Tw4Vubn2d6Mmby7boFHFXh/iXAshGIequTZ3U3Xd
	sYNJJ4o6YhXLNCFNrajX+K1dU4ZIzUo2pu5YKZaA5XDp6ubE3qAlkZNpXy8m6fhh
	1BSQWIf5QR1tfC0Q3GMtHCV7iLy0zVxou1ikGydGlQ9ynpSG8OFwM8KgFQuPfTos
	PLUj/vRVENQ/T7ibrK6c9ORjKzxTipeV+R2i3z1mLLir5A==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gquw2u97g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 03:46:44 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2cfa4e4684bso9124525ad.2
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 20:46:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789616803; x=1790221603; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1uZ8b+rX18pa7Jr+IgH5/3e/j/5cU/mEwp1SgQSgluU=;
        b=Xm1Alg2DB+OKuM3OAxhsb5uTVWVpqtWe4u9gWoALByj4GdzgscxjTcJvE/RjJhM9S9
         PWOkof1cVK2HUhvtIX5BRkyTh5iZsU0Wjo/Rd+kUa2Ora8T3v+HrnL/u0NwPvCW5VV8n
         Xn2Nk3BvQA2pTKssCyhYLIO+tVHomKfjSPpGHr1ud76qep7DnePpC8pSEtyBfm5Cjogo
         Okbe+iJWNMONPzuVlSp3tfWAa7AF2hotKkmYV8Z+jsEWlTBLnNKlrGAOlxqintY+Q681
         7J0AgXMSTHRLg6pirlblbUo/y5Nmj0PavL1Lhb/MpIVvMMzwyjiQAalvg8C6ubY8v22g
         tl1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789616803; x=1790221603;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1uZ8b+rX18pa7Jr+IgH5/3e/j/5cU/mEwp1SgQSgluU=;
        b=gav5Vs6D0xdHQSaNviC2rb+pAnJVMLaaB9OOr285ALy5XVtWNIgm1lKJui1o9sKib9
         dcyax9bxA4cGfqIVg7yWjE5YwqNuEdsRwonTXjt4ndq53RitOnWw54+dak3dJBXHrlHL
         j1fbzOI/SlRMo3cWoZXA/TxqbIV65+GfVl2CBpHhdldsNWbt54wmYRs+Gcz2WeURG5xa
         SBcLtkFMq+bDs1PxPZXyEF1bSsoG+9ej+JTr/t0s0Hf2aCEkD0f76NydD5sSNzC3BDbY
         59qrMwZqgv7a+dicx8DtUs9L/xap/7xREMKT5JIjyqnLbHSkXpaSuRdmRAofPaqXWOGW
         fb1w==
X-Forwarded-Encrypted: i=1; AKwUvBwlthp10/Z52LtyBl3cdUNn90DFiATqAOIB/0HHyYwF/jdOIOIzfwYnJA0edsom2zKo5t4Y+rOc5iNBjwY=@vger.kernel.org
X-Gm-Message-State: AFuF++kw9ZS3zE4EBJ8IooWyodF/B0Vxt23aipEFOQHtLRSkTWmWy/Bk
	pvjwoQeivky4gADXrpCxfUdGURtgpb6Vn12/3EYBVzhjifRUTa/uK2Q3VUaB11Ac6A8szx/mU1b
	Hsj0Xai/QR1NAMzBbRLi7yV2ATYXuo5Ez95UQseaC0UM1WIj/f02nOFWNBXNhvASK+IM=
X-Gm-Gg: AYBFou3QTzvDTNTBQrByc5bCC6b818Z66VFwHTZN0lfnPRZo8/iY+OvBhJiGVgTYZ47
	3L7ADO3QuH13Z8shLUJwJ/vtXhvcPgAK5p+hIsM83ACIabW/EUTElR8knwuKm+dYSQjvepoKwUb
	QEYwHuBeOAjazTcuqo9M9KeKVHJexWW8Rw0ps5sbPwJ75jmceTOw78w+XHYp60iVtp4pm9p0yho
	SEbQu52zKI46wFUe4WN8B7je2rosod3DJJPlxjOvExZiwat2BMZM2QbCpUrlU214cuqvGJxoIwD
	d5gBo5kB2y5SLqhrYyE2BixS2Q3ug9NoH3t2+82Y+/zyn+X9GPHv1qMdNkOF/QyyCSVIhbLc81N
	tfufZVirJ9DYjwDcZvSjqv5ABgn12gLoc/aTWdbKWzlU=
X-Received: by 2002:a17:903:1ac7:b0:2dd:60d:8b7c with SMTP id d9443c01a7336-2dd8e3f57f8mr120010955ad.13.1789616803290;
        Wed, 16 Sep 2026 20:46:43 -0700 (PDT)
X-Received: by 2002:a17:903:1ac7:b0:2dd:60d:8b7c with SMTP id d9443c01a7336-2dd8e3f57f8mr120010385ad.13.1789616802900;
        Wed, 16 Sep 2026 20:46:42 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33bf5af4f0bsm13392763eec.24.2026.09.16.20.46.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 20:46:42 -0700 (PDT)
Date: Thu, 17 Sep 2026 11:46:36 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Shawn Guo <shawnguo@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, brgl@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] arm64: dts: qcom: nord: add GPI DMA controller nodes
Message-ID: <aqtinNk__Unu3zHi@QCOM-aGQu4IUr3Y>
References: <20260916-nord-gpi-dts-v1-0-073e3f9c19d0@oss.qualcomm.com>
 <20260916-nord-gpi-dts-v1-1-073e3f9c19d0@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260916-nord-gpi-dts-v1-1-073e3f9c19d0@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDA0NCBTYWx0ZWRfX3k4OX9Bfw+pb
 PHyOTfYb3MBZshoafLKofrtQTeGSBgJ4sG7LKK2WakAsa/bs3C1nkMrAv1e7X3LOqQCHzfVzyBH
 hPO4q90NLfZOuZORTmGTcJvgFH6TWcs=
X-Proofpoint-GUID: wyZfFAdlW9iR1Qai7ufe7x0XUQjmWIN3
X-Authority-Analysis: v=2.4 cv=N4m8hG9B c=1 sm=1 tr=0 ts=6aab62a4 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=RWIZ5eiTQN5k4lw2HGAA:9 a=CjuIK1q_8ugA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: wyZfFAdlW9iR1Qai7ufe7x0XUQjmWIN3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDA0NCBTYWx0ZWRfXwcTFPGzaM50R
 p5kbp/4OEQ94B+6ta1vxY9BFDiyIG1xfFZ9yQbZZJ4ZNbzFJH0meuEKcLWnRfKFW+jOmDjvBlAf
 d/OhzlF7FrvhrdbyjguK0DMTyXMa/LHSUFEyirpLocT9Kp9ttF/ddXw3MspHBEBdsfhref6l0Lv
 V0CJE24ZCTA46GSIV1Uiq9dYif0vSRsc8RyrRUE32RSx7vrWi46uqKVUt4vmHzuauvtr1Bbteha
 Tm6WVfh5NaKr1HoeBa2SVVEIKtLaY54aGssWX5CJFBQhrOtvriIemY9wDEW17Xf0BGKY0lwlFar
 +JbVkMxEY8knGJSInNdPiXp2YpTeW72Q5rumuuH1/2wRbzbTteg2bglA1GpFVIPd87X/C7SNYWh
 2U0QPflX2C32LhkhH2F7ID2BYPypMbbFUogKUxRDsuCqZTR0UHGZ4Iqe/RVGIbNbXOLd5VYnH6m
 kGtU2+jAPn59jlq4F3g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-16_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 impostorscore=0 suspectscore=0 malwarescore=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609170044

On Wed, Sep 16, 2026 at 05:55:38PM +0200, Bartosz Golaszewski wrote:
> Add GPI DMA controller nodes for all three QUPv3 engines.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/nord.dtsi | 67 ++++++++++++++++++++++++++++++++++++++
>  1 file changed, 67 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/nord.dtsi b/arch/arm64/boot/dts/qcom/nord.dtsi
> index 22c026c32fb5..870033a106db 100644
> --- a/arch/arm64/boot/dts/qcom/nord.dtsi
> +++ b/arch/arm64/boot/dts/qcom/nord.dtsi
> @@ -3,6 +3,7 @@
>   * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
>   */
>  
> +#include <dt-bindings/dma/qcom-gpi.h>

Nit: this include should probably go with patch 2/2? Or could these two
patches be squashed?

Shawn

>  #include <dt-bindings/interrupt-controller/arm-gic.h>
>  #include <dt-bindings/mailbox/qcom-ipcc.h>
>  #include <dt-bindings/soc/qcom,gpr.h>
> @@ -1062,6 +1063,28 @@ soc: soc@0 {
>  		dma-ranges = <0 0 0 0 0x10 0>;
>  		ranges = <0 0 0 0 0x10 0>;
>  
> +		gpi_dma2: dma-controller@800000 {
> +			compatible = "qcom,nord-gpi-dma", "qcom,sm6350-gpi-dma";
> +			reg = <0x0 0x00800000 0x0 0x60000>;
> +			#dma-cells = <3>;
> +			interrupts = <GIC_SPI 588 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 589 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 590 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 591 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 592 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 593 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 594 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 595 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 596 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 597 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 359 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 360 IRQ_TYPE_LEVEL_HIGH>;
> +			dma-channels = <12>;
> +			dma-channel-mask = <0xfff>;
> +			iommus = <&apps_smmu_0 0x15b6 0x0>;
> +			status = "disabled";
> +		};
> +
>  		qupv3_2: geniqup@8c0000 {
>  			compatible = "qcom,geni-se-qup";
>  			reg = <0x0 0x008c0000 0x0 0x2000>;
> @@ -1260,6 +1283,28 @@ uart20: serial@898000 {
>  			};
>  		};
>  
> +		gpi_dma0: dma-controller@900000 {
> +			compatible = "qcom,nord-gpi-dma", "qcom,sm6350-gpi-dma";
> +			reg = <0x0 0x00900000 0x0 0x60000>;
> +			#dma-cells = <3>;
> +			interrupts = <GIC_SPI 116 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 205 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 121 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 207 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 119 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 219 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 220 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 222 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 223 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 117 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 118 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 120 IRQ_TYPE_LEVEL_HIGH>;
> +			dma-channels = <12>;
> +			dma-channel-mask = <0xfff>;
> +			iommus = <&apps_smmu_2 0x1016 0x0>;
> +			status = "disabled";
> +		};
> +
>  		qupv3_0: geniqup@9c0000 {
>  			compatible = "qcom,geni-se-qup";
>  			reg = <0x0 0x009c0000 0x0 0x2000>;
> @@ -1431,6 +1476,28 @@ uart5: serial@994000 {
>  			};
>  		};
>  
> +		gpi_dma1: dma-controller@a00000 {
> +			compatible = "qcom,nord-gpi-dma", "qcom,sm6350-gpi-dma";
> +			reg = <0x0 0x00a00000 0x0 0x60000>;
> +			#dma-cells = <3>;
> +			interrupts = <GIC_SPI 279 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 280 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 281 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 282 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 283 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 284 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 293 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 294 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 295 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 296 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 297 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 298 IRQ_TYPE_LEVEL_HIGH>;
> +			dma-channels = <12>;
> +			dma-channel-mask = <0xfff>;
> +			iommus = <&apps_smmu_2 0x1056 0x0>;
> +			status = "disabled";
> +		};
> +
>  		qupv3_1: geniqup@ac0000 {
>  			compatible = "qcom,geni-se-qup";
>  			reg = <0x0 0x00ac0000 0x0 0x2000>;
> 
> -- 
> 2.47.3
> 
> 
