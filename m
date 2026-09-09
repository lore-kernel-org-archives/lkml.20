Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2123D552947
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 12:46:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788957984; cv=none; b=bClCdQ7n0f2ogaqko+iIgfnX31rjr9ARoO6xzDwxYE8Nn6WgeOL746ewvBMNxCSSttJtIq7/ikSHDcTgv69lqKsntCSreK7rJ6+i/GTajTCjI7Chx6c6oBrqce3OyNF0+l9tWvG/Y8/YPd6HfTFekTFry60uUqPcudI/2B+cX9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788957984; c=relaxed/simple;
	bh=yI0YtwwDoRq46cm6dlAsPClpp9C16ia2CjUjaVPn11M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pM7pvWxMA+FzPlvjPtqNAKBf98fvFBFxu4XWuFi26f77no7q/N99A/Htzql5J5w40zrv6njR5+TWg6zf96I7xZFILm0IiedMgBX0HN6c8yKr72ZaVaaOdD8p9jGdpR3hA7bLt9ENPCb9tjrY/IhgkfaSKGzoPieUMcxlCnsruGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dkkJeDvQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fn43Svxq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dkkJeDvQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fn43Svxq"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 689BUC112019456
	for <linux-kernel@vger.kernel.org>; Wed, 9 Sep 2026 12:46:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1Rx/vpo0zvv0ttoTKgs+GGM/ZJwxjq76fMb0r1Xbs2U=; b=dkkJeDvQdQ3LR3Mu
	2R2KM1Rqn9gxAo8WifsUlLYIdBz/yVuTja/aKb4DseodKUcbyr9FCsnAgcTw2rVE
	PdNnFEEdM3JXy713aNWi+Lz+jovQn9zxDcWUp2I8Zkslr1OoTU8K1vL9c6At/RGQ
	+j0HEZgsxELhJjlOOVqEuFPvLslwlrWNwmbJHCv2+/vSFV9DxIQVTSJtHXsk1b4t
	CnDjS9ccmHDX//Y91u9ZhhZj8P/hNbcKOsGJI9vETDw8bbhh0Cjox+CCkT2hJzbq
	d4DoRXwEcsf7b8dS6g8iaDN9odOPE7Au7hes4KNL6ZiXhm8yjqFP4HKrb73APElJ
	lm5Fhg==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gk62x8cq6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 12:46:16 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5c66ec39d8cso136201e0c.0
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 05:46:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788957976; x=1789562776; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1Rx/vpo0zvv0ttoTKgs+GGM/ZJwxjq76fMb0r1Xbs2U=;
        b=fn43SvxqC5a1IYePtyAibLj10CBQTvhMez2KPj0HGMnj4m/t5iO8v/o7zA9b2w717g
         zC4MiJ15X2J6zEldF/AMmkG2ggZP49lJhH8jb8WaQvIt4JYycf3Xi49nftdzh/3pkuDj
         bfmQNwO19uwDkEItEyd5gMm5t4Yv6xWBw4DjnneqB2891KwAvnptvryX8V5OC7EY13KO
         EynIuZ1T/ahkQUiVn6FeFD4yI3fg8+bofetSSynbL4WAq56hXT4V809kwd3UrwNyIpZf
         dVisZmU33lBghVKIF5UKWCx1FopIS+T+kzwJ6EZ84eo/s7tjJgh2BEb9IuA4FHwz0HTq
         6O5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788957976; x=1789562776;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1Rx/vpo0zvv0ttoTKgs+GGM/ZJwxjq76fMb0r1Xbs2U=;
        b=NZ8VtqKwtAJiU7Ambe9FfPoM99/IE7gcYzVXKGdGTiHY3gKXB4diNMbNZRbbfFBM49
         Qlc0zbcoMSmLpQHtgwTI2EK1MdZl98iqsdLI3qHq+JMvBaqzzKvlxtwu4jE9pJZlfvAV
         GyqkLrsz771Y8E9WfMHnzsk99CV4MAbvaQ8sdXit8BsvgPDlXTrCfv3bfnHMZI02//ki
         g/76vNsh2czperWoieMOtjM0YuKRbrYJnfR/a3nzCj53etBPntfTZzt5zFINyAM1oD01
         DPiJaCJ8a3hNGG1pGvDXUpqnee25nDDCaGOU1XVSauafbpb/6kjo/FdVHdC+F+SKH9jX
         3D1w==
X-Forwarded-Encrypted: i=1; AKwUvByiAA8m4dp7A8qdL1+QYrkRET2WmAz4hlCLGgtiCxxmRRQ7fd5y3jYEEmIQucwPFZ1gZWNgXaXMaF5duEU=@vger.kernel.org
X-Gm-Message-State: AFuF++nfveu2rXK5IVQ9QaX5QyBsL47UzwoMxW6e9OILVEKMaqkIjhDj
	gI00dT8mF9zW+WxMU/RVetvHCyAgK3cdRBCW37CtNVf2kE3UAVgF5DPF7NHZxMBHDNtlhcqeRv4
	fxah8gfdpJdq/ha5HCjmYBbqDV2VJj7HChO4buiZEOcPXiEgSYL/TlOSz5dmLB53YHyI=
X-Gm-Gg: AYBFou29RGnWrLwacgpE3jpI4P9I6iYNc1vcG2DEQ8C18l8ixmWUHhkbUISDukYhj0N
	Xth4DD7znj9aVAmj7woOwDbfXZ4+IEKXlBOh4as+bwcWrXOYgAhoRo8UOlXe4lkJeTVtGkpQFRf
	dnsp1IyMUpoR+kNSQ/rvSwCcEMXaFe74+q5hWUfPa73MB8QCYTJD0eyf8EzTRCa48v7pcK7X112
	bATn01H/ewFTaAkjlb9UVKOTSY3xZGAhM2zCmywUpDrEuzNRmrTT+Sm8cgZb8v9vhL7i6T83Thi
	oVPc4MGgvQtt+mk5f1cRcjp9EnPh131G1qjZqm9YyZCA2pLPJK+b22fmu7elxM0EX+qdwb75VxY
	Sw9LR+SzEKm0n3JPKZSQfSg==
X-Received: by 2002:a67:ebd5:0:b0:790:563:8d1b with SMTP id ada2fe7eead31-79005639f22mr328266137.0.1788957975511;
        Wed, 09 Sep 2026 05:46:15 -0700 (PDT)
X-Received: by 2002:a67:ebd5:0:b0:790:563:8d1b with SMTP id ada2fe7eead31-79005639f22mr328244137.0.1788957975073;
        Wed, 09 Sep 2026 05:46:15 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c260cb7a18dsm762361366b.0.2026.09.09.05.46.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Sep 2026 05:46:13 -0700 (PDT)
Message-ID: <ae3a76d2-9c46-43c1-8521-398ca23b36e0@oss.qualcomm.com>
Date: Wed, 9 Sep 2026 14:46:11 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 05/13] arm64: dts: qcom: x1e80100: Add CAMSS block
 definition
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
 <20260906-x1e-camss-csi2-phy-dtsi-v6-5-067f2ecc4630@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260906-x1e-camss-csi2-phy-dtsi-v6-5-067f2ecc4630@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDE0MiBTYWx0ZWRfX4tdxqOZBDLpz
 PTzc6DdY52yE0f9Qmc/wj3jH65T6fade5du4+89Z2S9j12xJpKcnaiLFEZTyWnh44A6e4iMcFte
 vWxylINFDtdKP6k4lYpinrQUPvFU1Gs=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDE0MiBTYWx0ZWRfX/BWOSr1FMiw/
 MyFVEt5afeHRiHveV0jdYJTD1siLikykNDwnQMrdFrhbbXbR7+AcK+4i6t3b9P1+bYfh3dALtPm
 IDZRDaalkxFUkXrxsT5WOSLEsmhvHV6MFW0sq9kZrxgdc7snVwMd7Ej50Lhxzhh+ujY7AJSQ3Jv
 WXKx0snaVQ7jfY9NQwN+Atum6MGEsdQocMant8wMDjbedQ6GHlohorgahHWtTS5u2ODZUDPqDV1
 p4AWYpRR2NAoTsDZG+xpigmBG2oKNGWgjyrjx9LH6KWWAi5Dnh80omCsAEUMnbtpcnTjzwnoCzp
 qaQXVmChwXQpk1Bfu68MvyCe1Jo2utlvsada7+4sDsYIHNWMdkyC/NiYMRzA92RqnVffc+hxvEm
 Yx/gNFEtPuJTASqFKjTzdFFgE1CN0gRMd9n6jnE7J9eyk0Rh5PKMdhzczXZ+q8kQ53+2EVASefN
 o2Fpa8XV1yEQCklNqHA==
X-Authority-Analysis: v=2.4 cv=UeFhjqSN c=1 sm=1 tr=0 ts=6aa15518 cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=BxjtONQi-ztXtwshH1IA:9 a=QEXdDO2ut3YA:10
 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-ORIG-GUID: uCrG-EFTDpPpGgiQW76tbUH-Zlz3VIS0
X-Proofpoint-GUID: uCrG-EFTDpPpGgiQW76tbUH-Zlz3VIS0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 malwarescore=0 adultscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609090142

On 9/6/26 4:20 PM, Bryan O'Donoghue wrote:
> Add dtsi to describe the xe180100 CAMSS block

"x1e80100"

[...]

> +		camss: isp@acb7000 {
> +			compatible = "qcom,x1e80100-camss";
> +
> +			reg = <0 0x0acb7000 0 0x2000>,
> +			      <0 0x0acb9000 0 0x2000>,
> +			      <0 0x0acbb000 0 0x2000>,
> +			      <0 0x0acc6000 0 0x1000>,
> +			      <0 0x0acca000 0 0x1000>,
> +			      <0 0x0acb6000 0 0x1000>,
> +			      <0 0x0ace4000 0 0x1000>,
> +			      <0 0x0ace6000 0 0x1000>,
> +			      <0 0x0ace8000 0 0x1000>,
> +			      <0 0x0acec000 0 0x4000>,
> +			      <0 0x0acf6000 0 0x1000>,
> +			      <0 0x0acf7000 0 0x1000>,
> +			      <0 0x0acf8000 0 0x1000>,
> +			      <0 0x0ac62000 0 0xf000>,
> +			      <0 0x0ac71000 0 0xf000>,
> +			      <0 0x0acc7000 0 0x2000>,
> +			      <0 0x0accb000 0 0x2000>;
> +
> +			reg-names = "csid0",

Stray \n above

[...]

> +				 <&camcc CAM_CC_IFE_LITE_AHB_CLK>,
> +				 <&camcc CAM_CC_IFE_LITE_CPHY_RX_CLK>,
> +				 <&camcc CAM_CC_IFE_LITE_CSID_CLK>;
> +
> +			clock-names = "camnoc_nrt_axi",

And here

[...]

> +				      "vfe_lite_ahb",
> +				      "vfe_lite_cphy_rx",
> +				      "vfe_lite_csid";
> +
> +			interrupts = <GIC_SPI 464 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 466 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 431 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 468 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 359 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 477 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 478 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 479 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 122 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 465 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 467 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 469 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 360 IRQ_TYPE_EDGE_RISING>;
> +
> +			interrupt-names = "csid0",

And here

otherwise I don't think this is going to get any better without
holding this hostage for another N years pending a rearchitecture
of the drivers so

Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
