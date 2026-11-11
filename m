Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794402900;
	b=1C2nsANSDHCeBJ2x3qvg/BrD6YB5Tl5Od1spRB+oYcVAAo2ZBTcJblrhepQNF9MQxVls
	 xIOG78rZK7Oeu5WFKiRF6RpKd8eHMALQI48LsI+JULdbMZkKRRZ0tOlFKUz4XVtdBAX5q
	 J/Ggyxu46astMMEMlm6qVLNifgGu2RCjaw5VsBXC/l97fHRBbZJ/dxC8LrcfBaJWNf32D
	 3iFQY4HKYyHPDBOBJdFw2uqbNG4dUZuZqvKYUjMA2YH1PAhDozingidXVc6SNRNYe8Q2z
	 FTjZvLEuaaaH8PBFkcLohXhCt436zF2UDR3xZrCLyAvfzWj+oDlcQsjaDM6h9GvGz6Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794402900;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=tLARcSRWSvevnIhYpFOUnFGS3qKDWwMnqMdZ7F5zyEw=;
	b=i9sXwuXfL5hZRDCc8IL+j2i9+z8q9btayZ086NytwvubiYQ0o3/Rg6onRy91VL3ZLj8N
	 Sh2YZ02n2sjneplm7NIXt/wWH0qJctZb/pCzeb4RLKgeeVBY5zsBVgx/2DaRqXFUScTjl
	 Ov7/HuZsoX3Bl/aawMw8pX2CtCqbjiI6dO/uWXoeyxTaEu18GACuFjwJWn3Mwjej2Bn3C
	 ZkfUYfwRFfRSjo2Pl7SkAxdkJY9JVDoZ6050zI6SQ/lQVv1hCl2EWzDipPOoVL87ooO75
	 XFdTlthBJ+X8zi0pdg7RsBVHKc7UFnoSvf1iI3L0X34lhw7S7AYv8Gvb/NN1mycHkZw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Wqvouyij;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="QtFjtj/c";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61A17606A33C
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 13:15:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 61A17606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Wqvouyij;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QtFjtj/c
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ABCZGQe2975634
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 13:14:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=tLARcSRWSvevnIhYpFOUnFGS
	3qKDWwMnqMdZ7F5zyEw=; b=WqvouyijUrOk1DUJ6M3CdlTnuxWmS4QaeFAd3EwD
	dhrvlSAfVfJL+z5egf+CST5PQpaf3ezbv8qWApbEdOCiYEv0YTIN0wK5p6+Epd7L
	rUhTle486WvNs/YrxHY8/814TV9WQ+ZdHJIZMPs5C1sFVskfoaP9UF1YSYHqbOpo
	vYn9332qpC3woGUO6uBUHMN4BmXgYYMr7YDMvouidZ1vmAor0PJ+C1+JVdzo82/k
	MSJ/tcIS0LLK64Mi4jTF8R7EVQnqOhWukdQjg0sdys23+VgGa3jO6EcKfLf/o+3v
	7S8CNY4iOGbHA1FOXAEe/mxCxqaoF2AWWMQAf0qt6HkrKA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hv97cbxbh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 13:14:59 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93cb98809caso533152985a.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 05:14:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794402898; x=1795007698; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tLARcSRWSvevnIhYpFOUnFGS3qKDWwMnqMdZ7F5zyEw=;
        b=QtFjtj/cT6ns48OQv0ldbES0V3eci9yd6s74s4vT90+AMOpbxE7kj3Y6u6/z6FrVCi
         Y+SK4r1G58dCbnIbUxYrfQY6aZ6p1anJNyFGAyk2tQHvbMVeebPSOmVGDV5vTJQAGjwg
         novxHnjGhRxipByX3PlkvP1lY2CjHT8DPb9yaQXEmbEQB3JgsWmH8FsnX4+FDYylWeps
         owR0QaJh2mEVLfYAHQS1vLf30YkjGRkiy9SzWZqduEuXC/zTawrKlAtqJNM/781eRaEa
         wzA0QxPBnM+GHyY5jNH2pyt8nmmlWbu/C+kwvlQbimmaKYiL0ENiZ/e2zIAZF3Mywnoi
         psyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794402898; x=1795007698;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tLARcSRWSvevnIhYpFOUnFGS3qKDWwMnqMdZ7F5zyEw=;
        b=MgOQKHHwLPLhaLPod1/yPaVoeYNekDOtaKgh1fJU33ONn7WjwXUfSlgWZ8JkjVi7tk
         ui6ae93lhI/DYLhI899LhuOXYIrxk90S+NuCCU17FncWtbAsLTEVPY0aSL3K2oBTcPHw
         YZwvA+c+1gmy16gDGaAkVGPmveyvgTWtelEWi1l5zwFd4LqmYKMno1NlODvyc8Ort40X
         I/Y63edz9dIz4a03h9UoxKBvOsXRMixNM/pvwN0ew9l7alxfpvdWf6TLSFO6WE2iWDy7
         O1GNRjsAF/WRnsy+UbcWc3g7VgREItFB8pY0gueieAJ97qIp6BoAEt6lNA7Fx+ASBxjz
         wA1A==
X-Forwarded-Encrypted: i=1; AL+hErG8u31PzcJzTjtAIeP0yjCATnYuVfOm9kLRdDq3zcJmJUZItJUfi2M5mUoF6POIgNXY/iyOpSoyTrSe0+4=@vger.kernel.org
X-Gm-Message-State: APuU4Z/V2aCBX0iqxHJ7MeuTfXs0a7hsR0Y8XD7xpCxC1vWYkXu2udLv
	cAsXBQ83kLNrw5yPNrAgGcFDHsq6dpN8448SSigw+a6yVbP9e7wN4oKY/ww0nEYcndGTD6XbZaj
	PV5cn2DshbqLdXIDQ8kTdp2p/l+VAldHDXVu2rmHgrXShNTn8obo3gp/miEjS8NDnpSk=
X-Gm-Gg: AYBFou1dyu2+Hq8Vsr052AxAOEIMpIQmiMUGAwyVQncaIis9YZy2told4FF2tPWDl67
	YwiL6zryAb6HRvsJux0zgoXFrIPstILtDWEAvuFEpz/m53+5XE3skbnW5RjdC0oxIsxERTdExmq
	rEtmdlw3+wQcqc+5sOYagFgaH7jmg6nC+WYW4yA6i5puUPVcviEenENsHKirmSdUiHYBDUknRtS
	LWmt3Ybrmj4WObpg4qBQKImkYNdQ5hSd4V+HRkSnBnW0TB7n8ZFgj5E6zmuS4BUFtq2kT/F0Acu
	wdI5RdYdQPSVz4KNMqOnN1O0WQ8Eu1XB4iyDn4TwAQ2eNv3g9xdSAmEpX5u48Y/IYaLeRiV+ytV
	ylBjb5z0zfBslX7l/CTay9aegwlxRm+2KAb+TeeDYoAMpApiogBRvnz9rQBgHs3mnr9SxoabdDr
	/xVjx8REc3d1cJB9eYVvC1u+gSth0xmfHjamwpQVWFjjPe90laYeV1mu6IRbvWnQ==
X-Received: by 2002:a05:620a:4054:b0:93f:2941:6b8d with SMTP id af79cd13be357-947afcca89emr372345485a.6.1794402898418;
        Wed, 11 Nov 2026 05:14:58 -0800 (PST)
X-Received: by 2002:a05:620a:4054:b0:93f:2941:6b8d with SMTP id af79cd13be357-947afcca89emr372340885a.6.1794402897888;
        Wed, 11 Nov 2026 05:14:57 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ae090ea59esm9929161fa.0.2026.11.11.05.14.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 05:14:56 -0800 (PST)
Date: Wed, 11 Nov 2026 15:14:54 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, bod@kernel.org, mchehab@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        andersson@kernel.org, konradybcio@kernel.org, loic.poulain@linaro.org,
        gjorgji.rosikopulos@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v8 5/8] arm64: dts: qcom: sm8250: Add JPEG encoder node
Message-ID: <3ti6ntq6ztczilnwv66ak7ohl63mgw4tv4mdbsiy2hrkqqqjow@rmkwrasthd5e>
References: <20261110163909.78085-1-atanas.filipov@oss.qualcomm.com>
 <20261110163909.78085-6-atanas.filipov@oss.qualcomm.com>
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
In-Reply-To: <20261110163909.78085-6-atanas.filipov@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA1MiBTYWx0ZWRfX7LezuX8R3tSM
 a6T06e7Am+jkzUCHq1UwLPzc2/xCEIOlAeGIUdypWEklEyiGsZ2VcTZFVkhSmaPLILsyUpuC2an
 WHbRwF79SvKUN06QmZbZQDWcNttd+Ls74LzNQuIS2GtvDqcQPSVsLAD3LNtKxbf0wDWxtIgMzmf
 yQDf28it51iFA8vLFYjoCfdTopl5+TArKx5+2Ew7R39cfXgU8vcUKdUuu+CdXENWKFQe6tx580m
 rukRqF886pmh42yo8S2YxrFLxzlxgzwEptEf47wU5Rg/hSoDp1irThovfePLQ+j65ayIFYnksxZ
 lMC4G4aFw/zXQv2hQrXc07a1QHrkAR1m2E2zq97WUKS35uJZ5R4+B0Tv0js4Wx6aMQ3iCRW9CWp
 UwgB1W5kOLUA5wgWw8zGtHk8YyelAOiT8E62yjSiv9qppPPAMNtb0NKZa46O4F1Ixs66e0k/1vJ
 GIPB1m8V3OU+Uqi3lxA==
X-Authority-Analysis: v=2.4 cv=cJl1IVeN c=1 sm=1 tr=0 ts=6af46a53 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=ad0ScDXB7ZbbMzgY0o8A:9 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: KnYgiBP94jPq1s4NxqMTK-xUDGOsie3B
X-Proofpoint-ORIG-GUID: KnYgiBP94jPq1s4NxqMTK-xUDGOsie3B
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA1MiBTYWx0ZWRfX79OJTB3NDHyF
 CihMMeJSDTJ6spEqLDD9+YVBiBBo0NIjPRLiDSHVpkWhnNDb9reELkAI2vVdWtlfTrptemvFjcP
 eg+ghD5Y74U0Zp7NvTP8jGKBV/hNcL8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_02,2026-11-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 malwarescore=0 phishscore=0 suspectscore=0
 priorityscore=1501 spamscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110052

On Tue, Nov 10, 2026 at 06:39:06PM +0200, Atanas Filipov wrote:
> Add the JPEG encoder hardware node to the SM8250 device tree so the
> qcom-jpeg V4L2 encoder driver can bind and operate on this platform.
> 
> Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/sm8250.dtsi | 72 ++++++++++++++++++++++++++++
>  1 file changed, 72 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
> index f975c2183269a..7e8447df40188 100644
> --- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
> @@ -4480,6 +4480,78 @@ cci1_i2c1: i2c-bus@1 {
>  			};
>  		};
>  
> +		jpeg_enc: jpeg-encoder@ac53000 {
> +			compatible = "qcom,sm8250-jpeg-enc";
> +			status = "disabled";

Drop, there is no point in keeping it disabled. (And the status is
expected to be the last property anyway).

> +
> +			reg = <0x0 0x0ac53000 0x0 0x1000>;
> +
> +			interrupts = <GIC_SPI 474 IRQ_TYPE_EDGE_RISING>;
> +
> +			power-domains = <&camcc TITAN_TOP_GDSC>,

TITAN_TOP_GDSC is a child of MMCX. You shouldn't need to declare mmcx
separately. Instead cast the votes on TITAN and they will propagate to
the MMCX rail.

> +					<&rpmhpd RPMHPD_MX>,
> +					<&rpmhpd RPMHPD_MMCX>;
> +			power-domain-names = "titan_top", "mx", "mmcx";
> +
> +
> +			interconnects = <&mmss_noc MASTER_CAMNOC_SF 0 &mc_virt SLAVE_EBI_CH0 0>;

Use tags instead of 0.  I guess it's QCOM_ICC_TAG_ALWAYS.

> +			interconnect-names = "camnoc";
> +
> +			iommus = <&apps_smmu 0x2040 0x400>;
> +
> +			operating-points-v2 = <&jpeg_opp_table>;
> +
> +			jpeg_opp_table: opp-table {
> +				compatible = "operating-points-v2";
> +
> +				opp-100000000 {
> +					opp-hz = /bits/ 64 <100000000>;
> +					opp-peak-kBps = <262560>;
> +					required-opps = <&rpmhpd_opp_svs_l1>,
> +							<&rpmhpd_opp_low_svs>;
> +				};
> +
> +				opp-200000000 {
> +					opp-hz = /bits/ 64 <200000000>;
> +					opp-peak-kBps = <524760>;
> +					required-opps = <&rpmhpd_opp_svs_l1>,
> +							<&rpmhpd_opp_svs>;
> +				};
> +
> +				opp-400000000 {
> +					opp-hz = /bits/ 64 <400000000>;
> +					opp-peak-kBps = <978600>;
> +					required-opps = <&rpmhpd_opp_svs_l1>,
> +							<&rpmhpd_opp_svs_l1>;
> +				};
> +
> +				opp-480000000 {
> +					opp-hz = /bits/ 64 <480000000>;
> +					opp-peak-kBps = <1095600>;
> +					required-opps = <&rpmhpd_opp_svs_l1>,
> +							<&rpmhpd_opp_nom>;
> +				};
> +
> +				opp-600000000 {
> +					opp-hz = /bits/ 64 <600000000>;
> +					opp-peak-kBps = <1095600>;
> +					required-opps = <&rpmhpd_opp_svs_l1>,
> +							<&rpmhpd_opp_turbo>;
> +				};
> +			};
> +		};
> +
>  		camss: camss@ac6a000 {
>  			compatible = "qcom,sm8250-camss";
>  			status = "disabled";
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
