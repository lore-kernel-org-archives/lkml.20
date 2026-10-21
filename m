Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792624849;
	b=yKPshtJQGBznIMXjL3+R/5OfQr2iNXfUEV+CpOEKFCivKlQpyhZlLiQfTGkK3DR+uUvw
	 WMCvne1JkXjxNCgQ7bqEVCl5mDsU79rJ+duDUcCpjoabsjZlTvwV5PZy9iZ+dzcMPBoKw
	 PXLUdGCoR3XPWMXfhBZlmvfVN3biIOz48Cr5ZwZE/wG+7MQ1UXnXpeOR+pqQAxK6egnw3
	 it1Ti8Kkr+5UQVN4ICjd3qTMOaB6vbygZduEiUp8ZnFdwJANDSC/QefBplogwn+VHp7f2
	 3kJVz7ZdhVRsV6Kh11KGYM33CPVN1gDoMVVT4cytufdkJkFOXHz71eKoo5ekJpVr5QQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792624849;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=3/PkX2wBAHz4wgjVQm491Wme4i4LqDRLzwrJqI7Q9ZU=;
	b=w7ygm9BFYxSFTLhko6MKqYuU6m4Ces7tiZnOlVApliKq2zd12lKxCqA9BsoPFGVUwfVt
	 aEzkJ6A1ctXUhHHqxM8O0ZhLNAgEj4DhQckkoXTgCuFgSBsuaNGfkyhPbtDBW9R9oeVzF
	 SuKgHCW9zKIk7lHNr1AiXFL7n01JsT7bGp5yC56+v8QIP+sH8F1f0H/11FLp1q0dEvdFV
	 bdI3WNWEQTpxAlN2ZMooI9CyvAzBPmMaHCN/4Y75aL7+pyUQNA3sh6RDeU0jOoPDifQwV
	 tvDmEyUEj7mOpE88UyV6mk0bIT5UrH2H02bdAenO63mld99yq0yxiX07pNZcES0JaZQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=aoG5jBUt;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fX9i7s3k;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51D6C606A31B
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 23:20:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 51D6C606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=aoG5jBUt;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fX9i7s3k
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LKe5Xv2748308
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 23:20:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=3/PkX2wBAHz4wgjVQm491Wme
	4i4LqDRLzwrJqI7Q9ZU=; b=aoG5jBUtNK8kERS93tcIiM5kXorD1DsfgPMOmqxD
	pw6PESFbT7AhDZy3SiSjzaKWVkEgP8LObCyg9l8vi3XTJvkwQ1Ai0NTfrY3i1uoT
	b6ybuz7DL9SoB2KiWNFyM98Qp6wzp7lE7v2sRfgQZkq3p3/UysYffU/ipvwUp6Vb
	N2zlaov2+Vjf2YKxK3GvfeT47bCzP6dCrhYaY3FQwUckiL87nEggLfdeS/HEsLwc
	uQ7OEShk1wzsjG+kMLkumnu1lVbHk0ptrpwZfohvD/F6kS3YsWKrjI7monttrBha
	BIhX9efcZO+zNIDbdQWCQWV/vemHrDoIpNWDeLTH+8EuBQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf0ke1hs7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 23:20:47 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93ce7a85f04so267260885a.0
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 16:20:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792624846; x=1793229646; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3/PkX2wBAHz4wgjVQm491Wme4i4LqDRLzwrJqI7Q9ZU=;
        b=fX9i7s3kG3g9Es1fckdmdPRGdgkvWuT8GGGsIm+YA4EgQzNRE7jkFrL5hGm3uISA++
         zD5Rwmz4b6LoAuMcA1p7oSi9OzovGfZoGpMDKDe2BPeU8bq0JsLJoBWmQZ2e7gePHFpd
         AkiRZd/8uID1uq1ZqAWybSOn10oh26XNpCR9XcicMbexvXELZq7sdD+o1UmMLpwB0t9U
         ggEDXVLaLCZoK0G76EVyExeNejX/FJ2/2qmLxJyPOvoZ095MDNT3wjuKnRT+GU/fFQpn
         NV0CoFpplkXTvDCYHbuBZ4F8QUgvemXuxGHb99PtC270xfLcND09hRXPv8FN5Mjx9aow
         KUzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792624846; x=1793229646;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3/PkX2wBAHz4wgjVQm491Wme4i4LqDRLzwrJqI7Q9ZU=;
        b=we44M7XgxtST5Nkyz4Mv69Iz920jlcjH+xS8D/hu0Rm26/yDQfKVH5Qljrue0o1Hbr
         4eiGRkNmtiOpcqsahFpUkrUK3mKE/oreOARTHP7ik5aWHUuhy13v66AfRZ/GlSctJ6rv
         OreEh2TgPDCfU5iKhhl0y4qA7E4MZ3DQEfpsq0AAio5oU+EU8Ke6vZPBT6Qfhy9T8Qwq
         Ozf+Hkicb76+bUtHqQ5bWJgYm3gOTt4429CJprJgtZOLnu6IO20JA+Euzh/InTedo16w
         dXU9v79Z3PJV6t6+jn1GORrDipoIheHroADKn8rivcqGIxywxwzQS54ceaEDQeR9sWCn
         cKpQ==
X-Forwarded-Encrypted: i=1; AKwUvBx0fsdqkNz4zlvOBSvZQg1JMLnRuDJoXHFXPwNp5fXxGS2m9HEbaEfg23PF4paGQBzi5CrYiMUhLkvvDb8=@vger.kernel.org
X-Gm-Message-State: AFq9FYJbCgE5wz4bnWGAcBDOLvIViaTdKYjTqWk2OTzVcOyLqfKdT2dR
	ugJ0getP1NMgPKe3wOh7FYVnOoyEzvKkSMMGT45NiLFoR8XSIXHgMW7SlOJpFiGo4zM6qw0kxQG
	YNGtFr8QTGP3bhh9RgJSx5AOiJIaWUU0x3W4GHKBaFvQQZx8x24G9MWnKDl/kAQLgmVg=
X-Gm-Gg: AYBFou2UnyFlgtJ0KAJD1FVZ6a+ppvZXz2yZ2Asm9oRGJinwUHuYnswGCwaAcKQftBH
	9dhWUdvCdgh9yxGA3H9QIOFU+gyNB1kUb+VrKR5YkxLmd9QqvMt4nZRbs8p4okeIHR8DfSfNqyp
	IDHyMCNN81cw5EgduddBAuPjJ0yPs1HfJTLFqCpnsaEqnOh1WX4f4ajlILwKQ/99aEZnnJT5a1v
	QIhC3bhy9VvXu+eQpNBYsqCZA7yr1ySkKctG+F9aAlBlNqwGLYSOsUdx73TwxBm5BOcEUzX893/
	3a97lNABwYOsnkWvvDaFrOqzLAEBz04GwxpwmSWVnzmLWUBml4B94lIKtqM48y3pZb4AGrMM4UX
	HxeiPE1q7HEjSXdTnLsnptN2RZTUArqQmoFXAccyQ6A+RSm3uK20g8+ClzrGa/lB3q12J5HNdWq
	Y6G/fR5cGzYIkf
X-Received: by 2002:a05:620a:19a5:b0:93f:2d52:613a with SMTP id af79cd13be357-93f57fa0c36mr725661285a.29.1792624846360;
        Wed, 21 Oct 2026 16:20:46 -0700 (PDT)
X-Received: by 2002:a05:620a:19a5:b0:93f:2d52:613a with SMTP id af79cd13be357-93f57fa0c36mr725657585a.29.1792624845701;
        Wed, 21 Oct 2026 16:20:45 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfa45b4a93sm404364e87.20.2026.10.21.16.20.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 16:20:43 -0700 (PDT)
Date: Thu, 22 Oct 2026 02:20:41 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Linghui Wu <linghui.wu@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, kernel@oss.qualcomm.com,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>,
        Hangtian Zhu <hangtian.zhu@oss.qualcomm.com>,
        Cheng Jiang <cheng.jiang@oss.qualcomm.com>,
        Wei Deng <wei.deng@oss.qualcomm.com>
Subject: Re: [PATCH v3] arm64: dts: qcom: shikra-iqs: add M.2 Wi-Fi and
 Bluetooth overlay
Message-ID: <3v7ya2xot7tjklzw2docgzt3vq2d2lwqxnaiux3ehjqg424rne@ealrgump25o6>
References: <20261012122934.3240030-1-linghui.wu@oss.qualcomm.com>
 <20261020020925.3915548-1-linghui.wu@oss.qualcomm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261020020925.3915548-1-linghui.wu@oss.qualcomm.com>
X-Proofpoint-GUID: -KJwBlCwrXglNYjUdXDjh-ODv_KGaK3q
X-Proofpoint-ORIG-GUID: -KJwBlCwrXglNYjUdXDjh-ODv_KGaK3q
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA5MyBTYWx0ZWRfX/RdC563eskEv
 jy/Hlsz7LNpq2fjd/fg1Zc3ucGiBSxYVA24H2mHX9+S59kdMtFEUzwUEQdoNONW4LSy8myZl2Ff
 X2O1IMSHbPbOgW8dkDDy/VMKz2rlNz4=
X-Authority-Analysis: v=2.4 cv=KOzPn1Fo c=1 sm=1 tr=0 ts=6ad948cf cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=Wc9Em7cJ86xyjQT5_ZUA:9 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA5MyBTYWx0ZWRfX4bRAW95E4xks
 PmLmu0bzVC/ESx8RwdLzb4ChM1JTBYUc1oNQa6zEaoxsYbsI5CP7kPQuU0C2gkadupAC9hGK+H0
 azN4iGn77PPdJP3KejbYe644Qhfb25lxzMM3N9dJGaGA9wVp6bfMlEY0xtnLOqOxDwbn8f+YLdU
 qTOPFa49qWMT0ADDY/vCGzgJyWs9wlb7yjhJwQWisLS9gml3CopBf2GcGgC90HeTK1XiJ/vzzpV
 MkDb9HPbu1WJBaIfdhdwM9pNFgXpSb5copclEiGNITsIx2cPpT0iYMA3QOtZtNWjAIPNM4imwH3
 J+gLdicjx73AXWq9TwgiASNUmdWAN9/TPjzobnvRWBsHBM6qJxvXMQw6sOqsZUzqN8aBX7KlM8C
 2e06EYgImHfBVvG3YbGG3PSAExAqaToX/qm9q08QHVzfhr8JJCqn5AeLh5hX39NQ8NcG3KKVpnh
 rsbAPRblOLlpJEDVE8A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-21_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 impostorscore=0 suspectscore=0 bulkscore=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 malwarescore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610210093

On Tue, Oct 20, 2026 at 10:09:25AM +0800, Linghui Wu wrote:
> Add an overlay for M.2 Key-E Wi-Fi and Bluetooth modules on the Qualcomm
> Shikra IQS EVK.
> 
> The M.2 variant uses the external module connected through the Key-E
> connector instead of the onboard WCN3988 devices. Disable the onboard
> Wi-Fi and Bluetooth nodes when the overlay is selected so the device tree
> matches the hardware variant and does not probe the unavailable onboard
> connectivity path.

You already got a question on GitHub and ignored it there. Why are you
disaling onboard WiFi/BT? What makes it unavailable?

> 
> Describe the PCIe and UART connections through the M.2 connector, the
> 3.3 V supply, the W_DISABLE signals and the PCIe reset signal.
> 
> The Wi-Fi PCIe path was tested on a Shikra IQS EVK with a QCC2072
> module. The overlay was applied, the link trained at Gen2 x1 and the
> endpoint enumerated. Bluetooth UART and HCI runtime validation is
> pending.

Please don't send unvalidated patches.

> 
> Co-developed-by: Wei Deng <wei.deng@oss.qualcomm.com>
> Signed-off-by: Wei Deng <wei.deng@oss.qualcomm.com>
> Signed-off-by: Linghui Wu <linghui.wu@oss.qualcomm.com>
> ---
> Changes in v2:
> - Drop regulator-boot-on and startup-delay-us from the 3.3 V regulator.
> 
> Changes in v3:
> - Drop the unused reg override from the disabled TC9563 node.
> 
>  arch/arm64/boot/dts/qcom/Makefile             |   1 +
>  .../dts/qcom/shikra-iqs-evk-m2-wifi-bt.dtso   | 105 +++++++++++++++++
>  2 files changed, 106 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/qcom/shikra-iqs-evk-m2-wifi-bt.dtso
> 
> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
> index 1c86e7e98f55..799faa32e2d9 100644
> --- a/arch/arm64/boot/dts/qcom/Makefile
> +++ b/arch/arm64/boot/dts/qcom/Makefile
> @@ -339,6 +339,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= sdx75-idp.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= shikra-cqm-evk.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= shikra-cqs-evk.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= shikra-iqs-evk.dtb
> +dtb-$(CONFIG_ARCH_QCOM)	+= shikra-iqs-evk-m2-wifi-bt.dtbo

How does the Makefile handle eother dtbos?

>  dtb-$(CONFIG_ARCH_QCOM)	+= sm4250-oneplus-billie2.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= sm4450-qrd.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= sm6115-fxtec-pro1x.dtb
> diff --git a/arch/arm64/boot/dts/qcom/shikra-iqs-evk-m2-wifi-bt.dtso b/arch/arm64/boot/dts/qcom/shikra-iqs-evk-m2-wifi-bt.dtso
> new file mode 100644
> index 000000000000..9496c6558eef
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/shikra-iqs-evk-m2-wifi-bt.dtso
> @@ -0,0 +1,105 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +/*
> + * Copyright (c) 2026 Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +
> +/dts-v1/;
> +/plugin/;
> +
> +#include <dt-bindings/gpio/gpio.h>
> +
> +&{/} {
> +	m2_keye_3p3: regulator-m2-keye-3p3 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "VREG_3P3_KEYE";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +		gpio = <&qps_gpio_expander 6 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +	};
> +
> +	wifi-bt-connector {
> +		compatible = "pcie-m2-e-connector";
> +
> +		vpcie3v3-supply = <&m2_keye_3p3>;
> +		w-disable1-gpios = <&tlmm 61 GPIO_ACTIVE_LOW>;
> +		w-disable2-gpios = <&tlmm 60 GPIO_ACTIVE_LOW>;
> +
> +		ports {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			port@0 {
> +				reg = <0>;
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				m2_e_pcie_ep: endpoint@0 {
> +					reg = <0>;
> +					remote-endpoint = <&pcie_port0_ep>;
> +				};
> +			};
> +
> +			port@3 {
> +				reg = <3>;
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				m2_e_uart_ep: endpoint@0 {
> +					reg = <0>;
> +					remote-endpoint = <&uart8_ep>;
> +				};
> +			};
> +		};
> +	};
> +};
> +
> +&{/wcn3988-pmu} {

Add a label to the PMU and update it by label rather than by the path.
If the path changes, this node, I think, will happily create a new one.
Using label will generate an error.

> +	status = "disabled";
> +};
> +
> +&i2c3 {
> +	qps_gpio_expander: gpio@3c {
> +		compatible = "nxp,pca9534";
> +		reg = <0x3c>;
> +		gpio-controller;
> +		#gpio-cells = <2>;
> +	};
> +};
> +
> +&pcie {
> +	iommu-map = <0x0 &apps_smmu 0x0800 0x0 0x1>,
> +		    <0x100 &apps_smmu 0x0801 0x0 0x1>;
> +	vddpe-3v3-supply = <&m2_keye_3p3>;
> +};
> +
> +&pcie_port0 {
> +	compatible = "pciclass,0604";
> +	reset-gpios = <&tlmm 118 GPIO_ACTIVE_LOW>;
> +
> +	port {
> +		pcie_port0_ep: endpoint {
> +			remote-endpoint = <&m2_e_pcie_ep>;
> +		};
> +	};
> +};
> +
> +&tc9563 {
> +	status = "disabled";
> +};
> +
> +&uart8 {
> +	bluetooth {
> +		status = "disabled";
> +	};
> +
> +	port {
> +		uart8_ep: endpoint {
> +			remote-endpoint = <&m2_e_uart_ep>;
> +		};
> +	};

How does the UART switch from the onboard WiFi/BT card to the M.2 slot?
Is ther an automatic switch?

> +};
> +
> +&wifi {
> +	status = "disabled";
> +};
> -- 
> 2.43.0

-- 
With best wishes
Dmitry
