Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DF2A39EF12
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 08:23:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792138988; cv=none; b=of0LmHoBOGuqHxvXD5+aFuh0IYcallKyGx6MJLgXm8055yrA8+lg5U/qI18uglH7a51ZhyCyLIVkqAsSDG9scBKVncRxO86qt1XCtBl4cidLniQM/OSRkBS90QEeD9dOQ33zix/4bGWPqgxg0Fpd7MlhJYIQGCDkvmjOX6DWiTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792138988; c=relaxed/simple;
	bh=81xJNwsV2hThx94m0mUACRa9V2TnijGNC/Fo/63ejY8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VHX+s1ttCgVq+1X3MWjTT8m4uGxahKgFr8Zw+hN+Y29wrJYEnPj43YI8Fn9Ftj2STvG6vdFrNY/Dp/+bkCOrABc7f8TC1dzZZD06XrDU/1Kb/aPtZkd3hnFRYbfuZSgqTJjPSLC17XaGsvoCioRFNuP3aY0uDBU/SX3lklDKyf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=m3AX/bVu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ROtgt2KW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="m3AX/bVu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ROtgt2KW"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69G7nrvS1890688
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 08:23:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zywhglPEDHWFnoWPY8Q8bVI8q6iKlypiLOq3HGmVQxE=; b=m3AX/bVuAi1WvgIB
	8oRWa4ZheHc1vlCx2zY3iiHEucBt3ot+ztEW1Lzx4P2U99okNXjE53Q+RuBPYv0a
	QW5OySUKcrVDLO9cz1l8zE9aB6HOCPWs+5ZZz8q7kZ1tVbdhivDRRzMnlRD8Gu9O
	l/L26lzH0J1qtSMW2SyE0UZXpiqn1qSv46ZArA+kgbyucMtvKnxq9UJCqNkCNgD5
	fXaZCHdh4R0/Kc/K94XNhVnAFqBikOJP552KYkU36SEJMYtk1RZ62wuMl7sbNMQP
	m/usO1R5WJftUFK+lbqP6gzjioxcrGY6amRnl9z3BIRkHXx0IS5NA7oTSZXzGZqg
	gFCqfQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hba261cq7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 08:23:06 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-53568f05f8bso17311191cf.3
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 01:23:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792138985; x=1792743785; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zywhglPEDHWFnoWPY8Q8bVI8q6iKlypiLOq3HGmVQxE=;
        b=ROtgt2KWb4A8fK/FiXohCbOgMA/FjsJ3kNyuNU5P7wCPXpkaFMw2wYBDkaemRvFRHO
         yNNlyCpXNHoDL7xBftf0UwsJB2D80MGaWaSOYLzSRJXsxv/Dc2y1LpB3BOuXnIB+lqcX
         esE0Y2X1mvsQtqfX26/8Vorg/uqmhyib93ytC2EsBDwp3TVZoPwTQWGRceMWyKlE/uYi
         ZlL4gX2zyhKRiDLvd+QSvQwMhiGZVPyU3eiiQnHBUcoRojAu8kwnC6UgKTGN+Ga9TSCp
         4QbrCFB5bsQjpJr0QBCN4GByATSAvi2QF3p5yfOGE7HIg2JCI2pv4KbZBgKpL0AzySuS
         F3Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792138985; x=1792743785;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zywhglPEDHWFnoWPY8Q8bVI8q6iKlypiLOq3HGmVQxE=;
        b=XS7dyFLMOJuCuEkA0fbzh84+WJzayVmVpBE+RxEzEr2QYYR9Md6LFixVylk5uiOIDW
         MFrDCP8Ey6qyBnGHVOlSgB3RSJXOGKGq29hFBTrt9faknY/pBlFESSv4/p2qb+ob7I8v
         Y2P+GZs6rFdIbzMfD+sj4qSx6uKqjKhxaeLxUj/r2xpQM/f6nrssxMAg0Svn7A2f5Q46
         NAKr+TltGgxB9XvFnqt2KcZpjHG7y/7zmQSpuAr/7YGIsnZwkT38iuYXPBPK8hiuR7p7
         WIpCWbqTzUxAhYb6/ze9ZYgkXPoXZOZNaSXeB/52TJTURurXW4TfEhEqrAxa3Wx6LZHq
         SN0g==
X-Forwarded-Encrypted: i=1; AKwUvBzG8+l9NlQO165qZtG9BLmTZP5Ifn7dd9dP3ELP1clyf8fKSQSulmkhh0Ng0s0LodCNDUyeslbkrksZoMA=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ/dDLbetWgLXu9YPvNLXM8EIaAg2ehxZRqiFtS+u8F2BJAJjjM
	utUm+pXb5NbekBG89M0t/OKNP77NsGQs4yDxI+A67w9EPugWgrclC2vc3g3nM+aIbwx97CFo2+c
	URgJcXOQzDe7oe38tIN3L/08cveOGTVqfNrUQuI+6sfBmjGbyb6ZjSfbsaQU2+KtHiSs=
X-Gm-Gg: AYBFou1W/YtwM3GsUd/ZXM8OvJH9VfhsQm1UJ95tKImqDWJ6MIkVXqp5bbz2hOr0Thk
	Zv1DvdoJ01Sy97xyOUsuKqdCcxfTu3ohtLScvpmeDqyQwZTb3NBRhuSeK7RNIwR5NMcr77il7vC
	tmRbp1z5BwMk2L/y2NfzuM45DINpPEkGZ71AJ7G3N9OiRYnhTvaZUJ+Z813t8Y6WboD5K812Zv3
	RujiY6BopLoNilXlgJLfTJVWHTtmouHoa1FMxfCUqmun3PXDSn3c+FBGT8sJhQcRPidQgiJuAyy
	zoqDNYx06uGptEJyt8h+y1IJQyTbJjTQghXep+WxcueVSQdtUBUluoxarlI3H6S3+WR+7ynEfmO
	EF46sIdwA36O2PlmeVzldpw==
X-Received: by 2002:ac8:59c6:0:b0:51c:2324:666 with SMTP id d75a77b69052e-5359fa50f67mr411623341cf.3.1792138985279;
        Fri, 16 Oct 2026 01:23:05 -0700 (PDT)
X-Received: by 2002:ac8:59c6:0:b0:51c:2324:666 with SMTP id d75a77b69052e-5359fa50f67mr411623101cf.3.1792138984859;
        Fri, 16 Oct 2026 01:23:04 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c40919c0f2asm48509566b.62.2026.10.16.01.23.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Oct 2026 01:23:03 -0700 (PDT)
Message-ID: <ecaf38b5-a04f-4fab-a0d6-4f1d633264c0@oss.qualcomm.com>
Date: Fri, 16 Oct 2026 10:23:01 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: oneplus-kebab: new device
To: Frieder Hannenheim <git@fhannenheim.net>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Robert Oscilowski <drgitx@gmail.com>,
        =?UTF-8?Q?Jean-Fran=C3=A7ois_Bobier?= <jf.bobier@gmail.com>,
        phone-devel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261015-kebab_dts-v2-0-e783463bffd3@fhannenheim.net>
 <20261015-kebab_dts-v2-2-e783463bffd3@fhannenheim.net>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261015-kebab_dts-v2-2-e783463bffd3@fhannenheim.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=bsHZl0ai c=1 sm=1 tr=0 ts=6ad1deea cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=OQN141zOAAAA:20 a=WE8o4AYwAAAA:8 a=pGLkceISAAAA:8 a=RgHCbSjZinxpUVw5y3cA:9
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22 a=6aV5INxNnvWGCTbEtcBN:22
 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDAzMyBTYWx0ZWRfX8J7uxRyVIAy0
 3had/nnjK1/YrxXx2CpRPayxIS00WCm7XSoSoM7u5qTc2TBqL22X4jWM9oVN6i69Z/rLxAryTTz
 8KwjiP5tLVeUZopn0JUrkqcTA/ASJLmRWDgGcu2urkAypcq89GwqpGHWIdnv4DaRWb9GHjQJXEx
 Qr04HMGB0LvNiobeNOLCCxajRiDEgaW3Pi/jW94o2XAPboEx3sBvfvK4Dg5Jk9oI8aOJ0OaJfeh
 /nvjQidNDMspP28d2Uy28ZfDVthxYCKeSLf9K51hPXUNLNikyiKnp2CAc3pSICMy2DqTxqzlkRU
 CyiCAuhJzYiyNdSqB+6UfL1yKpvZEYAu8z6Ro90RkVzr6m4cCX8p1yV00GakhwX23Tjkx0y2DCP
 kRG83kBv9z47MA2PyI3qqbf2AIoR/vPzmyh4+M/ZzzHMSXmL9YEOf9XMtLzlSjHUhNCPnZypGPR
 HnkT3x7JQo6Z1xxahtw==
X-Proofpoint-ORIG-GUID: DsWgUa0EU_r-C95j9J5fgkUmSaPfZg_v
X-Proofpoint-GUID: DsWgUa0EU_r-C95j9J5fgkUmSaPfZg_v
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDAzMyBTYWx0ZWRfX3h9cYW2I9a3k
 HPdyWm+ZetmgIK0hcffiLThfQdEIReVsHDnChqzsZdiVUsTYe9IXan9GZ4DX3kde1EpRxUggzoW
 7P5iwbNPclwWbY08339axxeVh2WzDL0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 bulkscore=0 malwarescore=0 impostorscore=0
 suspectscore=0 phishscore=0 spamscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610160033

On 10/15/26 2:32 PM, Frieder Hannenheim wrote:
> Add initial device-tree for the OnePlus 8T. Downstream reference is [1].
> 
> [1] https://github.com/LineageOS/android_kernel_oneplus_sm8250/blob/lineage-23.2/arch/arm64/boot/dts/vendor/oplus/kona-kebab-overlay.dts
> 
> Signed-off-by: Frieder Hannenheim <git@fhannenheim.net>
> Co-developed-by: Robert Oscilowski <drgitx@gmail.com>
> Signed-off-by: Robert Oscilowski <drgitx@gmail.com>
> ---
>  Documentation/devicetree/bindings/arm/qcom.yaml   |   1 +
>  arch/arm64/boot/dts/qcom/Makefile                 |   1 +
>  arch/arm64/boot/dts/qcom/sm8250-oneplus-kebab.dts | 129 ++++++++++++++++++++++

Better. Please split off the dt-bindings changes to a separate patch,
and put it first in the series.

[...]


> +&framebuffer {
> +	width = <1080>;
> +	height = <2400>;
> +	stride = <(1080 * 4)>;

Does the resolution differ between the two devices?

> +};
> +
> +&i2c2 {
> +	status = "okay";
> +
> +	pm8008: pmic@8 {
> +		compatible = "qcom,pm8008";

Is it not present on the other one?



> +		reg = <0x8>;
> +
> +		interrupt-parent = <&tlmm>;
> +		interrupts = <112 IRQ_TYPE_EDGE_RISING>;
> +
> +		reset-gpios = <&tlmm 93 GPIO_ACTIVE_LOW>;
> +
> +		vdd-l1-l2-supply = <&vreg_s8c_1p3>;
> +		vdd-l3-l4-supply = <&vreg_bob>;
> +		vdd-l5-supply = <&vreg_bob>;
> +		vdd-l6-supply = <&vreg_bob>;
> +		vdd-l7-supply = <&vreg_bob>;
> +
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&pm8008_default>, <&pm8008_interrupt>;

nit:

property-n
property-names

in this order, file-wide, please

[...]

> +&i2c16 {
> +	status = "okay";
> +
> +	fuel-gauge@55 {
> +		compatible = "ti,bq28z610";
> +		reg = <0x55>;
> +		monitored-battery = <&battery>;
> +	};

Likewise, is this absent on the other phone?

> +};
> +
> +&tlmm {
> +	pm8008_default: pm8008-default-state {
> +		pins = "gpio93";
> +		function = "gpio";
> +		bias-pull-up;
> +		output-high;

Drop the output-high, the driver will set it for you

Konrad
