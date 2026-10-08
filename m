Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BC823BFAFC
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 06:18:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791440338; cv=none; b=Xyy2NlFIbx991c/ZFuHxlLwqKaPfepFGSFwt0hEnXApswUvtlPG49Xoyd2PaeLA8LjdpJZFxwc5e1lf7EW8a3vB6VLDSxqjH3Hgevk2dqRI9gRCzBgxtcxwEMKfafjtHSByNmt/q4gfTw64OvGGqT5xvXvUasUb1w+SdgecoKQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791440338; c=relaxed/simple;
	bh=EAEruviiYG/N6nple+mn9NdhJEM/dZOzYksLjrNmyuU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=d54oVLeO3+Zjm/kauU3kCRnrr3UFAGCwkS9vUQxgkDick/WgFYHOBfk4rqk1o4CfMWLUARMhHMn9Xf6+CyXM55EoK4d+XbLYXVbt2WzYYaq2hQcMsp508DvInyjLDCH8xyEe8fUPaxFNHK/gp+AxvyjNvHC5H00f1JpUYEoGXpY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gW2v5S5e; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CfQ2lT/q; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gW2v5S5e";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CfQ2lT/q"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6984BZVe313853
	for <linux-kernel@vger.kernel.org>; Thu, 8 Oct 2026 06:18:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RLa/JHNXfr18gNmyy6T2VPCPOXnWuKMxuMPJcaRk978=; b=gW2v5S5e5sa5Yb41
	tkhYl/JefCzIgByxIoWKayWoEjlGs+o7BxGfrdi5I7/DQBHO9fG/857kGsp/r1YG
	3dcOPYIdnm9yYD2D+CYaipsNYW5Wd6uz3BsA1OyD8k4iR63P7/QXLahXZFslPUif
	njCLrDG6P92+PnIhXv5A12ld6WEU1WbDSOL6kpb024dAZWUVl/UCdIh3h6o58+bh
	xPVyr1w2O5hzt4QBVMektOkw201yAfcWMR0otA3TeQJv73CghMsXwfKgh+ZYMZJA
	X/2hKzAhZXUj728/QTUQzACXEP9sl3gQLK4qqHr/n8Qg025FhQ2/TO8PE86Vq4Y+
	sUrjgA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5xe31ckp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 06:18:56 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2e80f7acc67so2932605ad.2
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 23:18:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791440336; x=1792045136; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RLa/JHNXfr18gNmyy6T2VPCPOXnWuKMxuMPJcaRk978=;
        b=CfQ2lT/qRJXEsRSBlTGqsENb4z3T0g20gi+tIjvXMlVGYuZDiFjq8R/nwsxI6QnMpR
         zHKsVK6rg87r1diXpjgbl1Xyys1YFHfhYG/owpiCvheTdtXys1Gfkc3MATBqx9ZMD6Uf
         ySicMrP20PJ6/UB8O0fqcycVW7hL+8c/romKRFEaN6eXgqu5zA4imOvhW0uQ7P5ZBVhW
         Ev6FO8Ulkm9x2nKi25LBRwX2d8JPDdsX3+KzAklygNoE2qmGUagLAKNHBIqQjjuxaDO3
         UQzm2OxCf79BcJNczsDKiXzrMr538tE/EnT2kJJXZKxV6517MaP7qwZaUlR+2ysGBZ7c
         4krw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791440336; x=1792045136;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RLa/JHNXfr18gNmyy6T2VPCPOXnWuKMxuMPJcaRk978=;
        b=M0lNluozLUExCu4QRrBotHsA7qDt0sLC64CsW6rn4I6OXO4aadHRA0DnREALQ9jcRY
         dgQqt66qzQEXOKmpSQiWuyv7o+ge0bpdrmrKiZ/KTaGMLIMKmMaufij6hL6GCVG5uNxP
         aNnbHVsnHYUqGXM3oSZFlAuBrVEvz0B7Gh7RFSegkN7NUj+YRXh1K2Hld/sL4Kfs/qK1
         hfho0JJ7Ionz1TNlRtAImW3G1wIrpGBTfOrSDp+ZFxtvKI+BekRT25+ewCvnLxlQMIEv
         l79iI+dixM+lvFctG9OU5bmMxHWVwxEEqLqPtG1dn1ky/UHdNDwomW4mTp5lfKY5MKZi
         PaWA==
X-Forwarded-Encrypted: i=1; AKwUvBxi90+XCgzMpD2yZSTnkc7YfKeyQ0htT0ZFHeqOaSg4y0tBzB8bWCPbYPwhiY/zSAEF/hA/xIzBBNgKhUU=@vger.kernel.org
X-Gm-Message-State: AFq9FYK9DefsZm2mxWNxbyJKOfkEZd4V650gDKwE4Vm7hZDsHkrYlHrw
	at8jzT7pp4twGaygdpEIydUULXEb1eqe9UYL0rOIMhC2GcBQ3CxFqG0szK/THMFAwYKe7YXPdpm
	COSafXCkwLYCaW+R94kSy/DnNwFYZ4JkLvzZ6CeU2a8MkUP1tx4mIOz5+hbh8KHp61j0=
X-Gm-Gg: AYBFou3uAghpeP7M5KIIhu8iAIrXw9GK7LPr3Y9ugeuk3/sk0LGgO+VTZ0vVCbI1/+5
	ztvpWOf8ZlMamkHCmhtJFfau6t6M0w3xLl2T833RXOqCF7mkMoXnGLVIMSclJzjSgKj3fUmHNmQ
	2QYkxEPoR72pRfvuCXEkHZvH3uxgHYX7uY6LQw/HS4ySUYz92g6reSbsv2pruPcHmTZKj8Z1BdW
	D/1u/U4lqf0T84+gooLj5cSpex+gBWtGsC2+zA690ktk4eiKdjEW3BdPC174THxWYCwZqcvWTF2
	5RLlCRoSmnST7FvR1xzoGjYvjM8bLTGm7i6fZF0EKSHSOPwT3sQikz6xmafNgZooB2moN+jCSeI
	FQhUYTHtxYm9LXHQLZzxA6HemE3E=
X-Received: by 2002:a17:903:2445:b0:2e3:1bb4:6121 with SMTP id d9443c01a7336-2e600510556mr38285615ad.49.1791440335486;
        Wed, 07 Oct 2026 23:18:55 -0700 (PDT)
X-Received: by 2002:a17:903:2445:b0:2e3:1bb4:6121 with SMTP id d9443c01a7336-2e600510556mr38285425ad.49.1791440335008;
        Wed, 07 Oct 2026 23:18:55 -0700 (PDT)
Received: from [10.218.18.193] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e606da8fc6sm19674205ad.58.2026.10.07.23.18.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Oct 2026 23:18:54 -0700 (PDT)
Message-ID: <41c5a595-7f40-4505-99a3-5041641fb025@oss.qualcomm.com>
Date: Thu, 8 Oct 2026 11:48:43 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 13/21] arm64: dts: apple: t8103-j45x: Add headset jack
 nodes
To: James Calligeros <jcalligeros99@gmail.com>,
        David Rhodes <david.rhodes@cirrus.com>,
        Richard Fitzgerald <rf@opensource.cirrus.com>,
        =?UTF-8?Q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
        Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>,
        Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>,
        Neal Gompa <neal@gompa.dev>, ajay.nandam@oss.qualcomm.com
Cc: asahi@lists.linux.dev, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org
References: <20261004-macaudio-v2-0-7b47ed6335a8@gmail.com>
 <20261004-macaudio-v2-13-7b47ed6335a8@gmail.com>
Content-Language: en-US
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
In-Reply-To: <20261004-macaudio-v2-13-7b47ed6335a8@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDAyNCBTYWx0ZWRfX1LAsoV1iFPO4
 PUJSC+3yelXatvtR235UhS9BtHceY0bm4+b27jNKzzjQpnScAsU3aZ9MEmHHYQ0Eqa/yl3T4jTi
 +zLNxt7TlF1RdDh7YfljQ23cEkgD3hGk1L48TRIDLW039ML+eyJvtr49ybeWR5suOPpyIzGKgmD
 3v44AHGDEU/kEWv13I0kuhTYuQ6NdQ8zxdqSct7/TYO/79cvg+++/nrspUivXJQD2oSKi6EyQ4o
 hde1u3v/iNuCVIgA3bvffVZc0YJt69/ZrSpvmS7dq2PzzXsSwLDDt9FqTa6KT10RDGkkC50nxen
 HVNObY3aPo/UhH+ezYlySg0OUo22eCeYOE7WTXs+WnFdyIMEnV8i+Lvs8PZPu4HaTHt7wst+MKR
 AiMbgfffkOA7Dpu9BqVD/CjumtTmVuOgG3BC7yLpK9FB1uZVrz0gYCrbqzrwz8JvWcjPy3A6o3I
 hTnyhyZK+Nb0OG5f6LQ==
X-Proofpoint-ORIG-GUID: aBFe_NCp1ady_9MglTuXCvkdaUTX7B_c
X-Proofpoint-GUID: aBFe_NCp1ady_9MglTuXCvkdaUTX7B_c
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDAyNCBTYWx0ZWRfX8OM3BExaHB8Y
 XLLHxyZ4VqK0owvLrCNm1MfdETTeBZplqghccv7TpJsCJk6gkTSn+uR8yCjVvNDV5jogmTNzAHA
 D7A6qMqmcSvsRRsz5Ga/C4UXwaGJlkQ=
X-Authority-Analysis: v=2.4 cv=KcdHIgYD c=1 sm=1 tr=0 ts=6ac735d0 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=pGLkceISAAAA:8 a=UesLP-FnXeQSrw_j-0AA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_02,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0
 phishscore=0 priorityscore=1501 clxscore=1015 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080024



On 10/4/2026 11:33 AM, James Calligeros wrote:
> The M1 iMacs integrate Apple-specific variants of the TI TAS2770
> and Cirrus CS42L42. Since it is not yet safe to expose the speakers
> on these machines, add the headset jack nodes and advertise them
> to the machine driver via the sound node.
> 
> Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
> ---
>   arch/arm64/boot/dts/apple/t8103-j456.dts | 38 +++++++++++++++++++++++++
>   arch/arm64/boot/dts/apple/t8103-j457.dts | 38 +++++++++++++++++++++++++
>   2 files changed, 76 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/apple/t8103-j456.dts b/arch/arm64/boot/dts/apple/t8103-j456.dts
> index 090c97bb781b..1fc74ebf9ab2 100644
> --- a/arch/arm64/boot/dts/apple/t8103-j456.dts
> +++ b/arch/arm64/boot/dts/apple/t8103-j456.dts
> @@ -88,3 +88,41 @@ &pcie0_dart_1 {
>   &pcie0_dart_2 {
>   	status = "okay";
>   };
> +
> +&i2c1 {
> +	status = "okay";
> +
> +	jack_codec: codec@48 {
> +		compatible = "cirrus,cs42l83";
> +		reg = <0x48>;
> +		interrupts-extended = <&pinctrl_ap 183 IRQ_TYPE_LEVEL_LOW>;
> +		reset-gpios = <&pinctrl_nub 11 GPIO_ACTIVE_HIGH>;
> +		#sound-dai-cells = <0>;
> +		sound-name-prefix = "Jack";
> +		cirrus,ts-inv = <1>;
> +	};
> +};
> +
> +/ {
> +	sound: sound {
> +		compatible = "apple,j456-macaudio";
> +		model = "iMac J456";
> +
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		dai-link@1 {
> +			reg = <1>;
> +
> +			link-name = "Headphone Jack";
> +
> +			codec {
> +				sound-dai = <&jack_codec>;
> +			};
> +
> +			cpu {
> +				sound-dai = <&mca 2>;
> +			};
> +		};
> +	};
> +};
> diff --git a/arch/arm64/boot/dts/apple/t8103-j457.dts b/arch/arm64/boot/dts/apple/t8103-j457.dts
> index ebddde75455c..d8ea6bb53b3f 100644
> --- a/arch/arm64/boot/dts/apple/t8103-j457.dts
> +++ b/arch/arm64/boot/dts/apple/t8103-j457.dts
> @@ -69,3 +69,41 @@ ethernet0: ethernet@0,0 {
>   &pcie0_dart_2 {
>   	status = "okay";
>   };
> +
> +&i2c1 {
> +	status = "okay";
> +
> +	jack_codec: codec@48 {
> +		compatible = "cirrus,cs42l83";
> +		reg = <0x48>;
> +		interrupts-extended = <&pinctrl_ap 183 IRQ_TYPE_LEVEL_LOW>;
> +		reset-gpios = <&pinctrl_nub 11 GPIO_ACTIVE_HIGH>;
> +		#sound-dai-cells = <0>;
> +		sound-name-prefix = "Jack";
> +		cirrus,ts-inv = <1>;
> +	};
> +};
> +
> +/ {
> +	sound: sound {
> +		compatible = "apple,j457-macaudio";
> +		model = "iMac J457";
> +

I don't see 'apple,j457-macaudio' in the macaudio driver's OF match 
table.The driver comment instead says J457 is compatible with
'apple,j456-macaudio'.

Should this node use a fallback compatible,

e.g.
   compatible = "apple,j457-macaudio", "apple,j456-macaudio";

or should the driver add an explicit `apple,j457-macaudio` match entry?


Thanks
Ajay Kumar Nandam

> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		dai-link@1 {
> +			reg = <1>;
> +
> +			link-name = "Headphone Jack";
> +
> +			codec {
> +				sound-dai = <&jack_codec>;
> +			};
> +
> +			cpu {
> +				sound-dai = <&mca 2>;
> +			};
> +		};
> +	};
> +};
> 

