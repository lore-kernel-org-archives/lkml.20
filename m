Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 760F4391517
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 08:38:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788424687; cv=none; b=jffQtdSCN6XBAOT0tlvVKFjPJ2HLpnuj7wFW817xfKS5pNlXDqU8oPUnteRqKOchhEpLiNMaOY/8rG7jAaLxPHC7uKBfBFgR3BpQtIpw4LPxXOGVH1JJNYmWRRETsc/DdNegSeInJmFbGAh/Ioj/vccJuhk2j/lswIV7MH6vcyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788424687; c=relaxed/simple;
	bh=kd86lPABYUrJ2jIXZLk3eCNkAgPOzCHoZEsmhQR1t/s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ziq+z7ERofkT5BsuXufha5O0R93u6Y3Wvh63DTxQrZE6joai9ZKjUUXo7aK8o47V8Yrl8xP9bY1bPhiH074lWfYf/xixqAL5jFgVAG9Ks+w9jGEr83NTNa9Xm1Hjfeo0g3hFhOqPrR+zRsMgb1ZHV4mWyCEuxxKlhboThXdipU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OQftr52o; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TUPjTd11; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OQftr52o";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TUPjTd11"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6835mNbS3643134
	for <linux-kernel@vger.kernel.org>; Thu, 3 Sep 2026 08:38:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	g6u7H5xBFCRTUQgMYXpbZseEbBuryIsCQSRuaipZfXc=; b=OQftr52o2pwDje5h
	WUSgzCIRpnF7ZczcOeXvdhGrbNJ506hVOibxNxRj2sn2FhgsbVevHPArRSH6vLeW
	QF7G2ntOASJuc78K4Dc88+nBzVpzXsQjO7XKBHCmBTyNDoBo5YXywwkIoDyVoECU
	ahJ7ammqJDYfxh3ZdUcYOp0QZ9uL6oJkU+zH+4IxFcmU6wqyfgsWkE/cjsb69Ax8
	kjaD/zk9S5BAFsB1lC/5W+I+NGHFHGRZEFDgV0ttIC+KYnxhtRWIWNMUluCoastm
	5dln6Zy2CT8z3FigaOHsuVnqPr/EKDFKzvSFFRj7sDkT1pJqDyamH0iSZD/vHPDf
	C+ReOw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4genrdv049-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 08:38:05 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93494b1e35cso44154985a.0
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 01:38:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788424684; x=1789029484; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=g6u7H5xBFCRTUQgMYXpbZseEbBuryIsCQSRuaipZfXc=;
        b=TUPjTd11aKnT/uBC69RZEVr65+3ESg6i4vS7dAoi7g8ui4DBvATh8eqVIokYruC1Kq
         1UW6IiKDVMYC4Mr1BeOJHnbd3/3bAVBSt9Yc+QfIudbmC2gyc08UjDw6m3NhWsKDDw++
         QJrbNpHVEHfsoTAA5CGNing1tbH1yDLmzpIuK46aoti3xz0cI+xpyYFqCYf5BVG7v1xi
         I33tDXDynN5q83gqU/vxfgg6l+FVgCoBNt8PekK9/CAldYmYeN7Idb1WPNO3wfuYaLQu
         sYVHG3CiuVi9bvDnjgYoWpPhAvAeTdOyK2bSZNx9+X8lzQ4lU2DDuym51FGNTvdb0c8n
         8ajg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788424684; x=1789029484;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=g6u7H5xBFCRTUQgMYXpbZseEbBuryIsCQSRuaipZfXc=;
        b=lID+wV3wyNcuspJiX1CNiqzjh7eFXoDEvcivwiJQWVh4VGzfmjcRLmPPLCe/+5cTYA
         dllPeqLecWeLRx4cYpvYdTV0bljvhz7zyv6hevFGeDFm1YgNqQoqlX2ZI6X5YJo1Bb99
         /XWENXcwsadJBS8TZRF6bL0wIUPJ1D3CaVa9t0YsPbre3th+we1G078vzs+fgQP69OKP
         DVBvEWScTNBS53clg57w9+q+9bUNU2vIzb9F9LLcJ1k7XfgUcqxW9T+wP525np8MUPSi
         X9JNMASmZ3mRC2PD1lUdflN8IaFOiH8gkEeKUMCb6QSyEtP0iPMqnpwO6zLuPR9woTHs
         NMoA==
X-Forwarded-Encrypted: i=1; AKwUvBxRcyrmta8BNFbzjH9jn1Bg+JxWNpGfnp2rNLQonXlUf8yzFxhj2WRSQWQ7f0eLP4H9O4avxhgEKrsxofo=@vger.kernel.org
X-Gm-Message-State: AFuF++kQc6yJUsSWS1JI32EJEocjrQew8JuWFEvRnhTwaywc6fIYYI3d
	2wDstNV9U/p6sAR/tIvRbK+P89Y1NKCq71dFgUV0uSzpTgfxFx7wHlRHFzNZ36u53ufDqIzCDb0
	sYItCWSSefJenowiH8MJKLPGBa3WI2kQ/cAKYnmzmATJvNvWrAOJL0QSLDuLYCnmxVHs=
X-Gm-Gg: AYBFou0vEl67N3TZs+GW3+UdE+9uaR8Lc0wfOTsE0CXmBK42yGErroZK0tV6KX8kbD8
	uev9sEUEVXFx5uIGwIJqixhpS85xU7FB1UMdNXRv7sXG7mjNfs1JkhFvGjWIkvAc9S2bhLZDx5k
	NEION4XJrZk7WxYb7WdQN2EqvwrmTAFB1FJokc4yQYZFbNK6rhZzW3lQW1f6589uymh7bKi/+10
	NqR8TW3GkuXyP56VQItziOFnvmQtept+1RjhLTKGu4f9QfiQHDTW4FY/Nhr3KZwJwa5I5E8iJdq
	O2lIWYcb5DcBwktvaCJRc+dVQ7xXtfDs/T3Ds74g9hZhIawEaPEDr/miWUm62QDFb6rv8ssyp0M
	hq34vXEF+gMosQoE6B0c/mA==
X-Received: by 2002:a05:620a:640f:b0:939:17ec:8a81 with SMTP id af79cd13be357-93960f8a9afmr776712585a.3.1788424684625;
        Thu, 03 Sep 2026 01:38:04 -0700 (PDT)
X-Received: by 2002:a05:620a:640f:b0:939:17ec:8a81 with SMTP id af79cd13be357-93960f8a9afmr776708685a.3.1788424684116;
        Thu, 03 Sep 2026 01:38:04 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c25f41735ecsm64908166b.19.2026.09.03.01.38.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Sep 2026 01:38:03 -0700 (PDT)
Message-ID: <4cd975ee-6d63-46dd-93ef-7c6ac1931837@oss.qualcomm.com>
Date: Thu, 3 Sep 2026 10:38:00 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/7] arm64: dts: qcom: pmk8850: Add ADC5 Gen4 peripheral
To: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
        Jonathan Cameron <jic23@kernel.org>,
        David Lechner <dlechner@baylibre.com>,
        =?UTF-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
        Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org, Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>,
        Priyansh Jain <priyansh.jain@oss.qualcomm.com>
References: <20260731-pmic5_gen4_adc-v1-0-9c49b2eea6f9@oss.qualcomm.com>
 <20260731-pmic5_gen4_adc-v1-5-9c49b2eea6f9@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260731-pmic5_gen4_adc-v1-5-9c49b2eea6f9@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=H4/rBeYi c=1 sm=1 tr=0 ts=6a9931ed cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=eQlnLCDwCofjbIFrPS4A:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: HURJifUxAO6uQZ_GT59PE85W32MaXiVD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDA3NCBTYWx0ZWRfX9bV+7IXlkOT5
 6zcy0M2biWf4ddTLfyfQ7vIoUFxDZ3cu1QIoD5orWQ5lxxlVgkNXbxL9096RhBF+fpnvN7UqpNy
 /gnX5N51m771JT8SymcTXmqpkIbnTxp4nTZb3PUydfHSkouZA+388i4GbTP/gYsRzlp2nA4L1gK
 2Wz8hLtIm1CrACcuO4f3r6k3RAuRaEO6m/aAtaKhIu9P0tDi869iAbgRLfGhJG4u939Ghp72rFl
 nZpbTxGQ/8jSQCl12xPrPTSX3o7lvLFWpGbIZps2wN1y9xlDYZlT5CBCJXE8MAOtlpvzGOjxy7f
 KvVIhn3/isvJu/4IDCcjS5u8QzlCuHYVUD/weT8syQL7cIh6gwYf579Alot0Lj2+gw6Hf3406yE
 W1z8doFAB1JIRuf9nBGishEcGeCJ6Q6Brsvx9HbTZ3ZzzN6odWoGF4p6X6ekYloEuFP26R/HU5K
 pZeCXZe6/ikEm2+yphw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDA3NCBTYWx0ZWRfX7b73R4LVGUa5
 D7PIUm/Yq1Q3l4K1r09t6DORPIxXnsT+DbjmauDaYc03yT0fL45cxV3QZa/M9XD/rc1FiyKx+iY
 OpfFsG2BSLmDaMzgQ34TIVQkY9aqC9o=
X-Proofpoint-ORIG-GUID: HURJifUxAO6uQZ_GT59PE85W32MaXiVD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_02,2026-09-02_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 adultscore=0 bulkscore=0 clxscore=1015
 malwarescore=0 spamscore=0 phishscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609030074

On 7/31/26 8:06 PM, Jishnu Prakash wrote:
> PMK8850 has an ADC5 Gen4 peripheral that acts as the master ADC for
> the platform, communicating with ADC peripherals on other PMICs on the
> system. Add the ADC peripheral node with PMK8850 die_temp and
> xo_therm channel nodes under it initially.
> 
> Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/pmk8850.dtsi | 25 +++++++++++++++++++++++++
>  1 file changed, 25 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/pmk8850.dtsi b/arch/arm64/boot/dts/qcom/pmk8850.dtsi
> index c7ba72fd48bc..44d1d1957f8a 100644
> --- a/arch/arm64/boot/dts/qcom/pmk8850.dtsi
> +++ b/arch/arm64/boot/dts/qcom/pmk8850.dtsi
> @@ -7,6 +7,7 @@
>  #include <dt-bindings/input/linux-event-codes.h>
>  #include <dt-bindings/interrupt-controller/irq.h>
>  #include <dt-bindings/spmi/spmi.h>
> +#include "qcom-adc5-gen4.h"
>  
>  &spmi_bus0 {
>  	pmic@0 {
> @@ -45,6 +46,30 @@ pmk8850_gpios: gpio@b800 {
>  			#interrupt-cells = <2>;
>  		};
>  
> +		pmk8850_vadc: adc@9000 {
> +			compatible = "qcom,spmi-adc5-gen4";
> +			reg = <0x9000>, <0x9100>;

nit: one a line would be perfect

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

P.S. can we also add some more channels that look like they would
be present on all 8850 installations, e.g. offset-ref, vref-1.25
etc.?

Konrad
