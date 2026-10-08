Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBBCC2FD69D
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 02:18:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791425900; cv=none; b=ONbR3acn0YvpDmpSmFZQumHULBALLZKwgAAHBAV2G9yJZRabQx73ygyqoVqsRlB+dhKXjsWBliD8Aea1ILGTyeYZW/ch6W+wx45hD+gzApEoI4EEqyxky9lbfQoYee6NZ1NQVhz1QhSUxfh5KmV0TzFWv1h5WVuBplORrlOXiH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791425900; c=relaxed/simple;
	bh=VWk9WeGBjL4oexSFj7eohZ0mayNbwcDqTiORAzA8jk4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bBfNCmd9oJmtjasn60Nc4FlyGVd8k2b2VUR3vsMw8VCXyjCwLjInxuTdxOucbgUJyzj9IjnI/ECEwm0VZT9rbaywsbwYW/MdzRrwfJyqtWj69w4+HDAiuZRGQTfpBrWmFfkA6OTrzWJKB/XlLKSqF5jvqAGq7LSdPSGYhc5H8io=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=a++sqwkW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dZZp//dA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="a++sqwkW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dZZp//dA"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6981hmRQ4186971
	for <linux-kernel@vger.kernel.org>; Thu, 8 Oct 2026 02:18:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=DJbs1lt66bvtM14c1pduCcyW
	TJNYR8sEf6W4RqOvqEs=; b=a++sqwkWQidii122XrnGmrNKEj8IFk2j2N+jVqju
	wohaNoo1009ns6KGZ5sDo0x68jb0ReDIUBxbRa8nytVGeEqz2X/oa70XadxOH5f9
	1Kl4Khih2QkGz4IrOHMNZH4TUPjD8WX9Ni9Bci4sF3V45Uf6FMOIMWd9JZTzcbm6
	aMF0i4iya3S9T6eblYyD/DqyKVUHf2UtyEQGdD+kBaFmpxKgyjx3LxxwhOgMEUbd
	yO8CJ07+Qlp5BXs4HWJ5GLgQra65MBwQneFWZh3TdrvNBK3w0iTeYYCYA2DmHHM7
	5mLe0xmFU08CMBe8cGyBkziHxxG/ytb4mlIQz264hfTxsA==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5xe30mmt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 02:18:18 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-30f1b904861so6240530eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 19:18:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791425897; x=1792030697; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DJbs1lt66bvtM14c1pduCcyWTJNYR8sEf6W4RqOvqEs=;
        b=dZZp//dAsuUdXloq/pT4OH1kXQV0VxIX1fHqks6GK5m05vLZ9btLuCFc/y7zQ4df57
         BAEzuSOTg4D5ankxnnTw+IEK+J+EMYlRGaLy+OvbkHx3KuYVjD71mgsp4yEtEXzueY7D
         f7nKi0J1m+tnVTrZRrVifk3wYSktRxT/Q3Na5jXMjwv/a2ybrnFM9AJZ/TKRGl6DxO2B
         QjAlRTynQQjhNG8LT55+bqLTatyizfBg1f0a0bWwHOLK4sgO6UtPGoxPjaVXccaaetgX
         Ha9Hh/OEy0J35IolKe63O9iFACyX1ggSMaLABovh7KGObBfKKxd0vET4olW+QGvfy5MP
         kz/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791425897; x=1792030697;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DJbs1lt66bvtM14c1pduCcyWTJNYR8sEf6W4RqOvqEs=;
        b=zalyTaNUrxiFtVSlml7ugXb0acxtU6aCPgx9dRiAJ7KZrijL+xiILxG+j1veHWXigB
         eq697hZT61Wf7ErPTILhqw23lPdxU7tBMGqxKQmfU1fE3VkXAyEfjxvxu6jYS483n+jH
         3q1iZUqozuKFvOfEJF9ewE1u01rwDPvVQ+nxCOGVqBg19csVOzd4foPqh3j73a4SMyee
         ADBs+HbZGO+QMDFlZIi0v7yjS19aKb1tYLUDpGzB2cJ1SLDmiHLXovWpaGuzCuJJE78k
         Z1unl92YL6MP3Znx80BvL8QPHPZ2bI6Fwo05Pg3P/SkLX0AtmeilJ1kKYgVf/JygmAeu
         aAaw==
X-Forwarded-Encrypted: i=1; AKwUvBwb/GRYP4sYpzo3KYzWa6cVcS6b86SmVZRFuQuG+6CATmCDFFoG9OprnIiryKjMsxpskVnhaBtc9T3Xs1w=@vger.kernel.org
X-Gm-Message-State: AFuF++ndo/7A2+tr6/q4/41c6NmhhGL5h5G1uUxSPdk69NEztx6h2RB/
	Pemmou/AqQPObduOxHqWdpDmYtqLXc04XGbuv0old7J0R1rotNzs1wEEh/ejbnBc9kPGztydNWP
	J66drVVA8Xo6ONqUs754gH5bn/Ubp3FyDdKQ1cLBg/nvEyI4esgAp4eJ3hq874tut3x+rA60p8x
	Yo8Q==
X-Gm-Gg: AYBFou0Gi/Q5oDu4eoGLmfArFESt2mQluGwZtntoARnNz3mod0Q5WRiqxdyodoqHozB
	CZTp8E1AFHNm8wxwEn6y6w/2i9dncETebFeaUTXAGXZACpD0qJwDJNIeC2bGed4CJaNdO6PogO5
	G3Mc2POnDvXMOpPFOo00O2Ljf2OA6FD4UqoeABTZNAJ8kFHaVXHcMkEMTpPOVIVQ4bNqZR0vI4G
	a3BjdeFHY9UgjTQBC8oTPoIZebhRdttT4jsSR6sM4bpGrvLvOm80xDsRg1bGx9+S92lRPwDiQ0M
	5AuBNyFBICLOUGgZH9f/EB0nGgZFLyOZdYla9jwh0tmZvlFLhf/ihFfD1vsjzAaeuq+3Gj85mi0
	B78JidECisFYRHsLK02ibTTOL1B3Znstl10F0YcYYEA==
X-Received: by 2002:a05:701b:2806:b0:144:eaa7:2765 with SMTP id a92af1059eb24-162045b85ffmr4998026c88.18.1791425897353;
        Wed, 07 Oct 2026 19:18:17 -0700 (PDT)
X-Received: by 2002:a05:701b:2806:b0:144:eaa7:2765 with SMTP id a92af1059eb24-162045b85ffmr4997991c88.18.1791425896734;
        Wed, 07 Oct 2026 19:18:16 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-161680e191esm9658182c88.11.2026.10.07.19.18.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 19:18:16 -0700 (PDT)
Date: Thu, 8 Oct 2026 10:18:10 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, brgl@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
Subject: Re: [PATCH v2 2/4] arm64: dts: qcom: nord-embedded: Add USB
 resources and PHYs
Message-ID: <asb9YupPzr9RYV9R@QCOM-aGQu4IUr3Y>
References: <20260922-nord-usb-dwc-dts-v2-0-ba2b39f1a843@oss.qualcomm.com>
 <20260922-nord-usb-dwc-dts-v2-2-ba2b39f1a843@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260922-nord-usb-dwc-dts-v2-2-ba2b39f1a843@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDAwOCBTYWx0ZWRfXz+4DO075le0G
 j/OcAsvmQl75q3UUj0QbiG1at3nKDvEN9MQoy4fynZFTEgq2HR0Xqy915u36/BkcP3YnRNrYe9s
 QqsRpnDpmtw+8J63b2DJb3gFA4arwXIGlyXd5se0z9izWXhyq90ypCEdW/NfCaP82QBEkrKLc2B
 FXG6qQ4xrucvcorm94M//lSEgabm1r9MQhzYH6ix7UCe+YOF4Jv8sTphWYCmGG26eDea1cD/uYq
 A3r0n4UX721Swt4riuWf1AMPzACPATRcrrPHcIJIqbgHtP/wdSgVT61SEsfMHEejskX/SC5W+Bj
 Z3bTduSrO73LxBj2WDJNQphlqJCvJzfHQD5fgxqWhtj5tcvTWE/zMb6gNVVRF3uasmsqGTsb4Nh
 R8C+CS4UJy2PlldYuhzTL8g/b36Q2iUjakrKT9txYojTjWnq1brkEb2cTZBasgwrVLnO05CIB+N
 6TM151aycz3Xb8RWmXg==
X-Proofpoint-ORIG-GUID: c6pq5WAIPtCXiQGdGHPxLBaIQlSNgei6
X-Proofpoint-GUID: c6pq5WAIPtCXiQGdGHPxLBaIQlSNgei6
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDAwOCBTYWx0ZWRfXyFnPJ+lybnYX
 g0JkAEDAxlStdQdm2epQgrVCAcnp6xa4us/CZ9Qj8rsKe4p5Nwe5CDfedaPrA5QnrO7dmQwOBG0
 myx7JtypEBaQt/gRvl750KJaB3Hhbus=
X-Authority-Analysis: v=2.4 cv=KcdHIgYD c=1 sm=1 tr=0 ts=6ac6fd6a cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=BekHPOajtWbrKas4g3gA:9 a=CjuIK1q_8ugA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_01,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0
 phishscore=0 priorityscore=1501 clxscore=1015 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080008

On Tue, Sep 22, 2026 at 05:01:08PM +0200, Bartosz Golaszewski wrote:
> Add the platform resources for the three USB controllers on the embedded
> Nord variant: clocks, resets, power domains and interconnect paths.
> 
> Add the eUSB2 PHY for each of the three controllers, plus the QMP combo
> PHYs for USB_0 and USB_1, and feed the two QMP USB3 pipe clocks back
> into negcc, which so far carried placeholder zeros in their place.
> 
> The eUSB2 PHY of instance 2 gets no 'resets': the SoC provides only two
> QUSB2PHY block resets, belonging to instances 0 and 1. Instance 2 comes
> out of reset with the rest of the USB20 tile, driven by the controller.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/nord-embedded.dtsi | 311 +++++++++++++++++++++++++++-
>  1 file changed, 309 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/nord-embedded.dtsi b/arch/arm64/boot/dts/qcom/nord-embedded.dtsi
> index c7ac2e66632e57852f6dd88d8070d5c28cf70d2f..e7ff8c420300f34a2ad4063ecad8a31f08b8d80b 100644
> --- a/arch/arm64/boot/dts/qcom/nord-embedded.dtsi
> +++ b/arch/arm64/boot/dts/qcom/nord-embedded.dtsi
> @@ -11,6 +11,7 @@
>  #include <dt-bindings/clock/qcom,rpmh.h>
>  #include <dt-bindings/interconnect/qcom,icc.h>
>  #include <dt-bindings/interconnect/qcom,nord-rpmh.h>
> +#include <dt-bindings/phy/phy-qcom-qmp.h>
>  #include <dt-bindings/power/qcom,rpmhpd.h>
>  #include <dt-bindings/soc/qcom,rpmh-rsc.h>
>  
> @@ -842,6 +843,161 @@ hpass_ag_noc: interconnect@5fc0000 {
>  		qcom,bcm-voters = <&apps_bcm_voter>;
>  	};
>  
> +	usb_2_hsphy: phy@88e0000 {
> +		compatible = "qcom,nord-snps-eusb2-phy",
> +			     "qcom,sm8550-snps-eusb2-phy";
> +		reg = <0x0 0x088e0000 0x0 0x154>;
> +
> +		clocks = <&tcsrcc TCSR_USB2_2_CLKREF_EN>;
> +		clock-names = "ref";

Bartosz,

I just sent out a series to add missing AHB2PHY bridge clock for Nord
USB PHY bindings/drivers [1]. Could you update this patch to include
this clock when you send v3, so that we can get USB work without
clk_ignore_unused kernel parameter?

Shawn

[1] https://lore.kernel.org/all/20261008015017.3359804-1-shengchao.guo@oss.qualcomm.com/
