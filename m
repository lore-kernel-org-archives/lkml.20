Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793003776;
	b=qF+CxK3KDjleqMpHIhxFPk6EjriAAg1PHaCcjbkdClyHY5sO3ZzuoXr1z6zf3/O+Bqeq
	 Yd8+HiMk9/y5N2oYCoYlcZwTh06sn//TdqPV8k3Ul7LCYQl49PsnIX/0ER7VU7mTa3Dcm
	 7ZMT3IH1coHJ2TvrM3PSMkzZ32TyH8yiPt0DrNeHR9c24ReHauk1qtxdG5G/L5hmG1wI+
	 bFX7eU0+TOVtu8r6KnUxkYB+6zniwJb6/lAibU7IuDzG0aoVZwHJ9FG4b7upVpi1Ld1Er
	 UyjYifUdvSjkEhdNoQEg0b5EOVnVcTV4Z5yuH9TIdbt7M5jOkWaXe2VFqo3o6DlDDLg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793003776;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=2IBldTT+B4MiEIGdaWBBVnElcnO8vPC3++c1Vr7JCyA=;
	b=1nV6FePq00u7w+BUKNZ4IGqRjf3nLkfxqAo+KXs6eR2x5PqvJWOx/J/7DQFukXAE4wTA
	 X9HL74q8C2PxTuPEVM4qD7zmYyj56TKI7SSZUOzE9iTWoNh9b+1qGJ0U1Z3O2uTkBR/V5
	 Lz9I8KxqGdLSDge1jfIexO9UTZrRdu9X185ISZuQjiu7kZi7J7dNYvoPBfkrcc16DBK5Y
	 C4dtfhiMLAX0VgWkduxCrJmbFYKyHgHYVOsRLLoon2yF4EB36z+8i7EQ84TTrYfHJY6OA
	 kaMYky2PitabeijtYyS17MDD+a8zHLECsKomXGoGRaWtc03MVomlnBTsbDaOGrC5zjA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Ux2TlE8z;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QL5vGX3h;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F362606A328
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 08:36:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7F362606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Ux2TlE8z;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QL5vGX3h
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69Q4b44x1340483
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 08:36:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=2IBldTT+B4MiEIGdaWBBVnEl
	cnO8vPC3++c1Vr7JCyA=; b=Ux2TlE8z+gn9CQPUQH7iMDWV3wRVIQWe9SWb4WE9
	dBSsI1tDytWIT/7OBt7qKcvynQ02TKQlx1duqUiZ6dlzQ+S4XWG2OMZHmTWXiPxD
	c4VZKpbS3sVZh5bl/DjDWpmmqyAxzOxgVCpLe029L+2lOS/Lh46/pM5MK9JKEACO
	91/lmaYzR64nc6iWTbcO1Pz2WwtcDR0FPZyDX6AoiGYGSzv+uTFE4Xuv3xFNwxeL
	+h/z8/2emxUseYxs0sm7ZXBnbhIAyaeKQ0a+Rxru6btArCce4ejB9Ge36aeU5VaE
	ZNRW5muNra1IE76qEhY/ye203+B/veS0m5aRqDyNuymRSA==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgny9wbvf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 08:36:14 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cd3b9e70f88so3684476a12.0
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 01:36:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793003774; x=1793608574; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2IBldTT+B4MiEIGdaWBBVnElcnO8vPC3++c1Vr7JCyA=;
        b=QL5vGX3hZ/MuMoSd9PwzfCMn7g0Mk8rWfsLNIvyB9itnhwRqlMgb5JxZDPm5Viv4WU
         TISe8BGjnu1dVYdeshGGAHtSXbbSVXdqSKKPGr/PbX0PEF6AWPIaBDTan1dLqwmiLTvn
         d7/ivRZ638FmPPDz+MefZCesVYl2VT6DfsAZrX22uhT8v0qZl7oPhzNnpT94MSGQqRl9
         s2qNQJGc2MTp3ejxBmtpY01IyDHTTYT+p/p06FMCK4/g1rDkTxjjuPSxJEComdLXtzOw
         yPFyFOGBWGi2GgB2U3bXN16F+PoaVJes6Y2j2EseJxHFkUP4tzrYSkRz21dGwnY+F7a1
         H54Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793003774; x=1793608574;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2IBldTT+B4MiEIGdaWBBVnElcnO8vPC3++c1Vr7JCyA=;
        b=JtAc/AT+yVNqeNvfmbWlx/3gBlhXo1fuVdefFMz8dOkd1AY14ose+Nbgc4XTN2VNUx
         c+wHjXCkTdYjY0QJPPY057DBtePyGrWq+z4A9FgwMVpI86es92BDRpgsh8TwVZhjBBxd
         7CXDiQcBmT2u3D1cPr9QJbfCC0EpNHohCb+GotRt78ZGVXepavkds8uVFkeag+dwSOFQ
         nibYpRHxX4MeStVl6n1UchgTUDvvUQUTWxXQlWSOiPVQjT+ALB+pziaztdFOAI+XHE8d
         iL61+oJz6PvYCOvRhGZMB9lDTNTOn1fHOme8cTgHuDGAB9WFhzB7Fx0DVijoCB29fyNv
         WISg==
X-Forwarded-Encrypted: i=1; AKwUvBxhVEvfyIGbgMzSPV9a8LanDPlGl/7K2VgxYkZ8oyiyDox8bDjyCs/90P5m1oiE8a+u01ymO7wAPyEo/Vs=@vger.kernel.org
X-Gm-Message-State: AFq9FYILapue1l/4eT5hLWha7XQV7Aa/OnVku/hhJhiFs+bM9W4ViOGi
	xSaccKsv2ZCX00vBfUgcYlCtu6KSO44TkG8W1Q/dbaz4XDWmoLfg51BYh9B2NH5n3jHkHpC6X1Q
	5Lqgf9JVYTDZPLq2OJm2h5v8hBIPmI13kia8XGDmc/2RYaLVyFuiiAcSbtbfZlsrkJckL103OEM
	eWrQ==
X-Gm-Gg: AYBFou30qKmjdCZtNQYhoayU1pCabMhqhQVvBw74oHmuf2W5St557kIEsfYoJjcNGwT
	xO2bvviylmNPFKy2tSw8ei8/C54kp2ZBNJlzrQCClC9G+oLFZXeBb1P/HnZ8+jBOY5vpFX3WA9Y
	r+NJQIIYan8Hu0y3tcBs0js9CajfcoAQU7YyQTQdKt/bscGMVYlh+zQGf3l5VOKT4157XPo0Yfl
	RxoJ6r+roLiMwdRnQTn8rv0Xlc2mi1oGVsZ85jdOXsuVcFEbsxkwC46qgrb8a8in1JI7ecOasQM
	Fv6CuDLbLmvYMJj9mt01uuq6U2EL4c2IwXo2yOt7AYqRFsBxN7QQqGjJAYVpiRJ3yoO4wLTP58d
	dAqSRVQXYuSC/vhANlTKrm8SziIf42FiEv80EKQ1eXw==
X-Received: by 2002:a17:90a:e7d1:b0:3ab:1b19:78f4 with SMTP id 98e67ed59e1d1-3ade9b2ed8bmr5784765a91.6.1793003773972;
        Mon, 26 Oct 2026 01:36:13 -0700 (PDT)
X-Received: by 2002:a17:90a:e7d1:b0:3ab:1b19:78f4 with SMTP id 98e67ed59e1d1-3ade9b2ed8bmr5784737a91.6.1793003773334;
        Mon, 26 Oct 2026 01:36:13 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adebaddd45sm5344362a91.2.2026.10.26.01.36.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 01:36:12 -0700 (PDT)
Date: Mon, 26 Oct 2026 16:36:06 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        netdev@vger.kernel.org
Subject: Re: [PATCH 2/3] arm64: dts: qcom: lemans: make the emac compatible
 specific to the embedded variant
Message-ID: <at8Q9umfE2AP24lI@QCOM-aGQu4IUr3Y>
References: <20261023-sa8255p-emac-dts-v1-0-a34d778ce9ac@oss.qualcomm.com>
 <20261023-sa8255p-emac-dts-v1-2-a34d778ce9ac@oss.qualcomm.com>
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
In-Reply-To: <20261023-sa8255p-emac-dts-v1-2-a34d778ce9ac@oss.qualcomm.com>
X-Proofpoint-GUID: eXS989K8oAnIyQx_Vn_3tTHKizovdUUQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDAzNCBTYWx0ZWRfXx+oudD3Zhifd
 +9KEVuMk8oxkFaHutwoKgF5i58LFmxYWdgyvSnb/xk3l/Y8Z7bg9ORiIVwNKNi2MVQIYm3AjVgA
 Ppmu3bJFIGlZh4ln8Eev9p8nwEWfW5Yc6JgKLoDZu5iKawSPofwir1upmIFHINNJiHLGN9F/DTE
 FwpnIGIOjEJceo34gHR3qIumudXES6RqyoClvN8fygV+wGLiayGAVs3scjSlckAwFNcnhUg7lde
 WFZ/subq2zFgeBrKelxMPydOX0TbyAbMVAgjwVIbfHUAVg0yLIai6KdZn+JNFQtlTvRphBFSgle
 CXovAgS7+ByXGou9lOel2n2hPGsripnbpV7InnklAuG4LZSkEAwBUMo6kpGUzz/aEE33jcc/88M
 EZdjRgAkLQAQdxkoTJQSU5Tn49PxE5tMWApQ1KRIH4aRwAM/L0u74d3PwSOeD3a/vjoZnx3ckC0
 vTzAw53HCvwhCVrHzug==
X-Authority-Analysis: v=2.4 cv=PqcG/AM3 c=1 sm=1 tr=0 ts=6adf10fe cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=OYXKdzKcgdxe2yQkhO4A:9 a=CjuIK1q_8ugA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-ORIG-GUID: eXS989K8oAnIyQx_Vn_3tTHKizovdUUQ
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDAzNCBTYWx0ZWRfX7IdQUM0ZElDL
 qEvOD6TaR6edCGl12dPnr0WQYoga1P+jrLwq7DvxbVfuNvWtqh+qiQERCDqbdjKKAGi6avGZgkG
 JNXz6D+enyx9iL5D5PeYsImnnHySt4M=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 spamscore=0 priorityscore=1501 bulkscore=0
 impostorscore=0 phishscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610260034

On Fri, Oct 23, 2026 at 11:02:23AM +0200, Bartosz Golaszewski wrote:
> The embedded and gearvm variants of the ethernet MAC use different
> compatibles so move the one for sa8775p into lemans-embedded.dtsi and
> make place for the gearvm variant to be placed in lemans-gearvm.dtsi.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

Do we run into any problem if lemans-gearvm.dtsi simply overwrites
the compatible without this patch?

Shawn

> ---
>  arch/arm64/boot/dts/qcom/lemans-embedded.dtsi | 2 ++
>  arch/arm64/boot/dts/qcom/lemans.dtsi          | 2 --
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/lemans-embedded.dtsi b/arch/arm64/boot/dts/qcom/lemans-embedded.dtsi
> index 3733c0b7bace10cad656144b31d02bd8b4dbf3ed..630c40d21ecdab40ec59135cc667e4eccfd23554 100644
> --- a/arch/arm64/boot/dts/qcom/lemans-embedded.dtsi
> +++ b/arch/arm64/boot/dts/qcom/lemans-embedded.dtsi
> @@ -458,6 +458,7 @@ &cpufreq_hw {
>  };
>  
>  &ethernet1 {
> +	compatible = "qcom,sa8775p-ethqos";
>  	clocks = <&gcc GCC_EMAC1_AXI_CLK>,
>  		 <&gcc GCC_EMAC1_SLV_AHB_CLK>,
>  		 <&gcc GCC_EMAC1_PTP_CLK>,
> @@ -481,6 +482,7 @@ &config_noc SLAVE_EMAC1_CFG QCOM_ICC_TAG_ALWAYS>,
>  };
>  
>  &ethernet0 {
> +	compatible = "qcom,sa8775p-ethqos";
>  	clocks = <&gcc GCC_EMAC0_AXI_CLK>,
>  		 <&gcc GCC_EMAC0_SLV_AHB_CLK>,
>  		 <&gcc GCC_EMAC0_PTP_CLK>,
> diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
> index da740a0876d4adcff0bb9458564c868a6f406b0d..77e4f57778fd54e414c86a32f5b068239bee6d24 100644
> --- a/arch/arm64/boot/dts/qcom/lemans.dtsi
> +++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
> @@ -4386,7 +4386,6 @@ port@1 {
>  		};
>  
>  		ethernet1: ethernet@23000000 {
> -			compatible = "qcom,sa8775p-ethqos";
>  			reg = <0x0 0x23000000 0x0 0x10000>,
>  			      <0x0 0x23016000 0x0 0x100>;
>  			reg-names = "stmmaceth", "rgmii";
> @@ -4407,7 +4406,6 @@ ethernet1: ethernet@23000000 {
>  		};
>  
>  		ethernet0: ethernet@23040000 {
> -			compatible = "qcom,sa8775p-ethqos";
>  			reg = <0x0 0x23040000 0x0 0x10000>,
>  			      <0x0 0x23056000 0x0 0x100>;
>  			reg-names = "stmmaceth", "rgmii";
> 
> -- 
> 2.47.3
> 
