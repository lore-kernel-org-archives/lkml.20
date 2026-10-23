Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792758742;
	b=Hy2qjKPCEGGYFmJd9NMTRGupGwaqH+A4ArB0SM3WMN2ndZDjYvFSZMvWV0tYFmj6yhu5
	 Vhkn2AwH4Oxs40kIV763wnVnjZ3BsnsEf1Bf9TIa/yIHFzNYUimDCEFOQgQrzB0Dx4raO
	 3pkxVzo3IsJ2eKchYON4a9/Vjj8tiC/KYW0kYAFR2iPDz2vJDk0dloti0M6fTWFGNiY+s
	 0wV+3gAKDfyndBv9Qyw0bNCInaxk3pAHXFAgMFANOksEuKQy9jiR0ZikBNntyiZf2yCh3
	 DhfmtEe/OghWmSXLPGKkCC0JIprw+LMSBWqyIaGM7LJZmAK9DmH2rDeCVgKou5jSi5w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792758742;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=MJtIEZRHfL2+tKH4qspJ2nYCVYpqSi8PgJO1PWzFn14=;
	b=0Sr63Ift/dJYjAA6i6PCNGtCcRDu/zfiJsQ8NiqtzF1QOldWrTq/2En4Q2hNvm02tvmm
	 RyCoeEaebjLE5Lt05RAlbbmZMPcf/dYW4U6GcoH5NHkVUgi+0cbSUIog9tlHgNtXLyuNW
	 Y8e+7rmdwf1kuVi+Qc/aDgd7OPS7TpPZYphLdb0IY/WUw87ozvvHnAAzMAOi9nLFTArI3
	 tbF/mZSOSMR3WE2p6cAK2F+IzP4JlVjUhdL/bMLy7++MLY4IRZDFLpWV6kTVKsoW1YYai
	 InqUDVviHZ7p6fYby6zRAivQNRI9fOYjGeFzPrD5WE40jZ/dU1MXqO6vJr6wuv6mJ+g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mbJDyKUM;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UxIPaKvA;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01462606A31B
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 12:32:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 01462606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mbJDyKUM;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UxIPaKvA
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NAAVcD1948398
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 12:32:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MJtIEZRHfL2+tKH4qspJ2nYCVYpqSi8PgJO1PWzFn14=; b=mbJDyKUMbsKBTfpd
	VF8oUL6B3cbqcpONko5rLSZwiSypf+0PUBrTO4nFXhk33eYHiLHJf91mAN5NGP9/
	GaK6wo6T2ZYGK2XZR3r48ri9/cIHnqCcCspymTQJ5S8LEzxxkyNCm/1kcyRLO4tk
	2MKFiABwUAcj37rK5cP3+Z3TFPNw0SVlkJE7IQusX3/AhjlfZkOf5GfRz8lLNF9P
	8MjQPBINN0TchVngglUI4Yew4p10ig5GU1ysk/TuPqvF/JvIB/4vRh4syoDGiqis
	i/ux/RWC6TTU0N9FDlSxbRiVUnrvs2dlBw34F/DA3pO2zyRDkCULRUxuIj49pv9q
	f3iRMg==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfqmtunpb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 12:32:21 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-988b530df14so15508241.3
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 05:32:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792758740; x=1793363540; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MJtIEZRHfL2+tKH4qspJ2nYCVYpqSi8PgJO1PWzFn14=;
        b=UxIPaKvAEPb/sMLdf8Tq6WKEQIdqsrsNT0os5hPL4o9/aFNMl7FtuAlRey7fuenRsl
         +zaAN3Z6se16fIuAtkjm0n0noNXLsgKfC0mLTXyt+FH9Ylf+ysqGteh7jl4G08DdE7EP
         2v3GdwCSsHWorfysTDscin6EcG4Rj4rJKDleYQxgjNo2gEC+VEeJCGg5Ouahq8JexvkW
         dETKCHXL2f7pyAQ1gUqxVGUbaj+07EOWU+nHtcL35owaptkvifYX/mpNYwH3EUsc22gP
         e/6wd5VfSFiNURDK8RnWKLBTzQMYcg9356eB9vUhLDBGpyQiQ8WZElGGBGYr/Rsw9zON
         0p9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792758740; x=1793363540;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MJtIEZRHfL2+tKH4qspJ2nYCVYpqSi8PgJO1PWzFn14=;
        b=hWmmDHChjH1nV3vX53UN6e5KajIsCjBR91/B+K8LMnZdsP94N30Co9QdAUb8HHx++I
         e1IVvG81hPjl3sGIyZEUg4C13lCB5X6P3n4ObHod5LooGaUvOTILBl1O1q8hPPO5DWuV
         tYDBDm57s4oXjMwUjqwB17hAnmf6ggHWQCRKBL2mhKzl1Qb/7H1c1mjIxkzabvgIb5iZ
         DvraFdUn4FQ7LZ3iwMjYNEApFJoxwVj4klnKrKUU/bBBURaKha7cEudi7/ChQvZUxVv2
         qhZzDh8/NIDLebbzHlTLKFU1zh7LXpQLfdVnjAuU6lW2HFHmu33P9mmzWoXWbRGBomsM
         qd3Q==
X-Forwarded-Encrypted: i=1; AKwUvBzEgFgl4fsX+ztuucweedDp9zaoumHnfv9PlDUBYY3V4E+Grti90dzre+I3Liw8ZKbkObI9WmzK+6raz2k=@vger.kernel.org
X-Gm-Message-State: AFq9FYI5M/TtEfs67ylF/xs8LKXw+f0IKcxHNDBBgUfCqtvU/k6peXv3
	v06JRmdbZYTdPA2Y8zdGbGdbYzPJ65ZO49/E0XeU9hXIiu4pfh4PaEeHCnfqW8ptT6NnJT3lbp2
	8jL2KeEjTDQh8JHTxsEgusDWobacYJzELE8VBeL/WfiIhK8QEe+TdFLM/aythQla80k8=
X-Gm-Gg: AYBFou1wyRj4mW65eApeqj09SX56y/rwrMVlDL10tXUdjSwGMm4agPGiyC9VZ0me5oI
	SD0g8lrv5kQzMHbaX2qtl6d3epKFrdu/UuLmUcUHvB9nRlnGcbWLNaDo/pzbffkAUtrO/RVSaJC
	VS9aJhPml5mTaIXWxUd4T8K+VtxxaP5bSHkFuOqg9AWVxjuzN0LBmzF7G+VgSNR1wLaK0XCyi9L
	FJvXSQEiTs2pD7jlLO0Wo5e/ZbNfWet3TaOO+bVNNRIGd0jvUsG46pgIntzzv1foX/BoO8AkfFo
	4wGpBk2aW6JZpACZPc1ATMyTzrzDqQAlG7fPLFGgJk0oMfc/pUMKfZc683Ss5s1UDinaMsmLpQ3
	9Wnue+vO6Wy/mx0nKjSDhZg==
X-Received: by 2002:a05:6102:8515:20b0:7cc:174b:f7b7 with SMTP id ada2fe7eead31-7ccc2d8f97emr775030137.0.1792758740380;
        Fri, 23 Oct 2026 05:32:20 -0700 (PDT)
X-Received: by 2002:a05:6102:8515:20b0:7cc:174b:f7b7 with SMTP id ada2fe7eead31-7ccc2d8f97emr774968137.0.1792758739637;
        Fri, 23 Oct 2026 05:32:19 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b432cc83d3sm993728a12.27.2026.10.23.05.32.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Oct 2026 05:32:18 -0700 (PDT)
Message-ID: <5114bca8-91bf-4db0-ae12-442d21ebad84@oss.qualcomm.com>
Date: Fri, 23 Oct 2026 14:32:16 +0200
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: qcom: lemans-sa8255p: add ethernet nodes
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org
References: <20261023-sa8255p-emac-dts-v1-0-a34d778ce9ac@oss.qualcomm.com>
 <20261023-sa8255p-emac-dts-v1-3-a34d778ce9ac@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261023-sa8255p-emac-dts-v1-3-a34d778ce9ac@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Gt3XaU1C c=1 sm=1 tr=0 ts=6adb53d5 cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=TV7SFOc1Y2i57lEA1eIA:9 a=QEXdDO2ut3YA:10
 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-GUID: 03NQT0DsT7GVnJ1k4ksZELvv3SYM68EA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDA0OCBTYWx0ZWRfX1YXinp9TcsAM
 SAuyOaDpgt6GJD+4Q7fs24yucS0c6J2Vt7rveK2xGNfWJgJv7pRGcX3pfQDoEC9bNb56AhGHnGY
 1viWHyOq6yMfFmdT2YBgRTDJtGHa4VmaZxvBL6tyA6xUyBGUn5KNsgQu3k6KDwYQ77Sbwv6jx2L
 c9mLTQ4ax6DK8M/lJUFka9vR/7vNDuVPUX0XpJdAnDxSJreoYyWy6kbdjXeXXCI1uunUc1+IOka
 I3PaU2vgSNXQKG7jj1n0YcYG3m4oDteoz88PAF51tJjGTTS70FWDW++iJJvIom+eux+Eqd9Thc0
 jeVAGxIvKafjjrkoNpzc3BcJKMrpxpeELIsm0o/Jn+L65Nl3lq60bBbw3O/A43LFlk046dUic0h
 t5W8SaIfQ7y6J3R35Q4XIwTXlYWYyTOaAMIzHC6BLwEqxZMkvKyKnZvRePXyec5iy5kesx00vx1
 4fUu746031tyeqI/V+g==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDA0OCBTYWx0ZWRfXwXORPMWh66c+
 Ot//6wtne6i8gSBwhqm0BMvcdC32IuTPErtKfHMA2S7reZ7QxF3Gm8UolAnqelx7rKV1nq9t6yF
 B5Otmp6QfJeo72jnV2puiDM3hCa6e1g=
X-Proofpoint-ORIG-GUID: 03NQT0DsT7GVnJ1k4ksZELvv3SYM68EA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 suspectscore=0 malwarescore=0 adultscore=0
 clxscore=1015 priorityscore=1501 impostorscore=0 phishscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610230048

On 10/23/26 11:02 AM, Bartosz Golaszewski wrote:
> Add the ethernet nodes along with their serdes PHY nodes for the gearvm
> variant of the lemans ride board. Enable scmi7 and scmi8 to serve the
> EMACs.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/lemans-gearvm.dtsi      |  28 +++
>  arch/arm64/boot/dts/qcom/lemans-sa8255p-ride.dts | 213 +++++++++++++++++++++++
>  2 files changed, 241 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/lemans-gearvm.dtsi b/arch/arm64/boot/dts/qcom/lemans-gearvm.dtsi
> index 4c155cbc79754af632848cd55b738e3ef0511cb5..c64cfd279af458e24fb48083ae549c96cfc07485 100644
> --- a/arch/arm64/boot/dts/qcom/lemans-gearvm.dtsi
> +++ b/arch/arm64/boot/dts/qcom/lemans-gearvm.dtsi
> @@ -58,6 +58,14 @@ &cpufreq_hw {
>  	clock-names = "xo", "alternate";
>  };
>  
> +&ethernet1 {
> +	compatible = "qcom,sa8255p-ethqos";
> +};
> +
> +&ethernet0 {
> +	compatible = "qcom,sa8255p-ethqos";
> +};

'0' < '1'


> +
>  &firmware {
>  	scm {
>  		memory-region = <&tz_ffi_mem>;
> @@ -3226,6 +3234,26 @@ cma: linux,cma {
>  	};
>  };
>  
> +&soc {
> +	serdes0: phy@8901000 {
> +		compatible = "qcom,sa8255p-dwmac-sgmii-phy";

Hmm.. I was hoping Shawn's DT reshuffling would land first

Are the PHYs hardwired? If so, you can move the phys= reference
here

Konrad


