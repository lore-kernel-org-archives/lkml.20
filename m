Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DE2D45DF58
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 09:02:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788426143; cv=none; b=DCEk0/zolm68knA/JAG0XJUQIOLU1PAmu2ZL9jX0hpQucVRglyRtlBS2OSE62bugTwLEpwStkRV6xRYS0T/yG5y4I4Q0dkgZRzKee6/M8VusQC6xsp+CjFelrVUTw/zquSQdZMQFIWF2O1aGHkSu4zqa34PCyse3xx6OhKyrf/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788426143; c=relaxed/simple;
	bh=xy8aNWgnRdRY1DlWK/SxqljKRpkWft1mvEFWwBjDRBQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rD0EamUh14ZLlbRJh6zPXm+Hj+Ir2hBUAiNLyChr0vkP97ZVqwmUCdip3jYkV0B8mPKgEoI5RB+l8Z4y6mPCVcCd0Xe71ST6KRsPPHXz8iXWYcDc/k4y06XGisdl91irq8FlSPGnRMopuBamCcJX0QEDZISiIDTORf5+mBz3sd0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=C8cWCKc6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=A0jwzaIW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="C8cWCKc6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="A0jwzaIW"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6835leSG079891
	for <linux-kernel@vger.kernel.org>; Thu, 3 Sep 2026 09:02:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8KYmof0zRRoEvEt1jE0okMuXN2Lk9B5rQ+5AqdwNXGI=; b=C8cWCKc61Ft9Yhem
	nFhK6b4/VPHl5oGbuLcKXnF0W6iaJ+x43knEjYXdaxs/SpMVThuyXiNxsp9D/DMh
	xYsqAJfWsu3G/DB8QshstYvP6aQcCJv+TciEfNug3G3L3iX3lhZM+1Z+fgA6ITd+
	wHhtGZhdJ7Nu9wdhjrMV3caY0kfgdBwl8AdpJpILdN8bCM04ro/8xexSDM2iH+iu
	df9nLhHVfJ+G6H5Jt6B4W3LuWWIHRCYA2R/iy427iRvMv8sx6hsfS7ZaWv0d74Ke
	RsuGofUSV3N8VnL7em/TLSCRjJiNQhuFdwwbRo9wxErUtBucVRWPqFwYyXME8gnQ
	71MstQ==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gf1j4h32w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 09:02:20 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-789eb1bdd79so84158137.2
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 02:02:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788426140; x=1789030940; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8KYmof0zRRoEvEt1jE0okMuXN2Lk9B5rQ+5AqdwNXGI=;
        b=A0jwzaIWEbI915hxik49VWLmjv1L0hh9Xc2Ca6tV/D0gVyILoaO/AMGb3bAC+2LmH2
         doPI/NiKcZt8uLyZUz5qf5NyCG6IPt+pofuKgGta3H2zcvpdg/uQfk60v5nct05mFExP
         FVkL9FpFleTut9ASDswtk52f/MhrX27TQaG9cZMLawLzExDCZNMysL6//K0XgclyQVDa
         ritImXsRx+EE8Tt6KiqFfMt4n+eVKUQUEFVX2xleAhXm3pOaFI05foXIhnOwwaPnpR85
         qVlducE6h4mVK/HYYjxUOmnYx3GEf/hU7HVqXpcdcMXPjTDej3pWS5JLATpmlWTCVZML
         xS1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788426140; x=1789030940;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8KYmof0zRRoEvEt1jE0okMuXN2Lk9B5rQ+5AqdwNXGI=;
        b=rnHp7HleKceLtafT87QpxCBHjSTuLtWKTe9hUI+/F43xT9NDMcgZ3MpNFfxzvuSXwP
         rqktQ0PeVjhv/iFxPXITx7Tn5ZJO43z/UuE113tv9FLLwpglsCYoeaQ00+W6ce7iAsNC
         WeV2DQ/E3WycZfPQh7ZZQpJsSJr/tx9XYbbd7mInhqSbDOugOLSGKXfuADaS33cLuAta
         cM1UjFv7N5I9x5N8uMpU4yompmGZncqKFs1lRDQ+n9EBZZfWC0wrZufuoobItpIBYGKa
         snUKhKKdQnAtjKHspIHCnGs3SFr/yQyi72ykhK/Zrqu8rHKKCiEqnMr7ogX9rS70X0b+
         OAbw==
X-Forwarded-Encrypted: i=1; AKwUvBzKaRsm3Mty6ptRaEGwF+cleQLznMKBDz+KqPYoXPaLQk/Hc/ZFfiEG19z+V3rJJxROQ0ovpRtTpv2K6nk=@vger.kernel.org
X-Gm-Message-State: AFuF++mIsPx5G66jPC4zsCAY8C571wFqqZMZgSJAC1JEKWBRGPTwhtxY
	FekPWM9Yab8vilwPGfldOITsu/U3u74aydOcno8fy2GpaIeBxK46kcyr3F9CdcxWAyLrsHqZf8B
	BmOVokGnyNr5kNM5Z2e7vkaLfjwlfPlvubuXvrpfWhgW6y7MeAGOiv3yYKq2brFMlPfgthT0uc0
	M=
X-Gm-Gg: AYBFou3xJIl3NYzsEp3e6JHEVtePgGMFTn4tArkeR5vuC6HgOq7pf0YPmCtj6aBw39m
	wJJ339X0aBBMSyj/5as0WIX+oEJwyeRoHIupvwbBw7MJGWIqTmIxnkYiQEO5YDTHedOy5kO43B7
	+U+Ul+uQNo+xe0FpjzSB3zSpNW5hMCX+auu4f4ezJpFHIq46T9Dga/gOA9UJpm3fm4eH5zCZPzT
	R1GuvK8xM+7b4wU4ndR6ckWJLtmTgbxC3Sai7A0VGaav9T6+KwNyOJFZVy61UgEj3I8d8aU5T/9
	MOQ+mOLTvZX4/Jlzs5q9x34CFp5CW6xHB+Fpj3Yc7cKnHmbl5vTtkTp9Z0DJPGwLJqdSLX22vuq
	PgyRYG5Ysgqi17Iqq4cSFYg==
X-Received: by 2002:a05:6102:510d:b0:780:6fc7:2181 with SMTP id ada2fe7eead31-78a1f68e0d8mr1655442137.2.1788426140047;
        Thu, 03 Sep 2026 02:02:20 -0700 (PDT)
X-Received: by 2002:a05:6102:510d:b0:780:6fc7:2181 with SMTP id ada2fe7eead31-78a1f68e0d8mr1655435137.2.1788426139512;
        Thu, 03 Sep 2026 02:02:19 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c25f4172032sm67248466b.22.2026.09.03.02.02.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Sep 2026 02:02:18 -0700 (PDT)
Message-ID: <9612eec3-dd70-4ad0-ab4e-d90c921a94b0@oss.qualcomm.com>
Date: Thu, 3 Sep 2026 11:02:16 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: Add PMIC thermal support for Agatti
 QRB2210-RB1 platform
To: Raj Aryan <raj.aryan@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260824-pm4125-adc-thermal-v1-1-3b67ef2eccb2@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260824-pm4125-adc-thermal-v1-1-3b67ef2eccb2@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=dufrzVg4 c=1 sm=1 tr=0 ts=6a99379c cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=qI3sZz0o0dxpMlL5iVwA:9 a=QEXdDO2ut3YA:10
 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-GUID: iq7l4_tfnQWYku9neROS33ljGpt1AsbJ
X-Proofpoint-ORIG-GUID: iq7l4_tfnQWYku9neROS33ljGpt1AsbJ
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDA3NyBTYWx0ZWRfXwySTTBg00sLQ
 SMr9Abs2BP2Elb0Za9BVXoc+eLnjTTrMpF8DCy5Whw0drpMUHaDTipBOE9hZChr/ImvOjKxqIxK
 xJaQsGfUYwLR5nTmjboEQva5kauqaOk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDA3NyBTYWx0ZWRfXwd30lCFe3LsD
 qyNGGhv31d1YxOozpbTkrSmCLxVfMY1HQcMjBiy8ss8Xl4tGDboQ/b4etSBiodTKsn/gkv5z9/Q
 z45Op9d8W7y2EQ85pd3tWk1491RJsS0WgKgxBOE8KtaOohy7Hxt6dADPDxChOsLQH5VzT6oRvtg
 ynFlq2X/uKy62/bZtVozhjGgObUvxw5AEDdwTcXTZzY+UXO28jhmT/3E1fQoPkbNUddv11yEoOB
 eyIeOHBaDaT09XRpqTL5VCyjgpMPLg18H1ZMjXmT//LroKvKf9wed9XR2g3nyoXIbwPUsTxwF5d
 Sc69xl2q0/c0lCulVnqqID51Mf1B2xPlcRuNqQONDHkvWGycKjNLrxmbqS6TUBIWhitIBwohPmy
 peO1WUPoPYzlsXojIskKVFDIpKMDBpCooNYxtRd8BtN4JbweqzdC5OZvABtGijt3+HrI8K2qLMI
 J5bZusKZnMZ1FFGcL3w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_02,2026-09-02_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 malwarescore=0 bulkscore=0 suspectscore=0
 clxscore=1015 spamscore=0 lowpriorityscore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609030077

On 8/24/26 4:49 PM, Raj Aryan wrote:
> Add ADC channels for msm, quiet and xo thermistors along with
> their ADC thermal bridge nodes and thermal zones for PMIC
> thermal mitigation.
> 
> Signed-off-by: Raj Aryan <raj.aryan@oss.qualcomm.com>
> ---

[...]

> +	msm_therm_bridge: msm-therm-bridge {
> +		compatible = "generic-adc-thermal";
> +		io-channels = <&pm4125_adc ADC5_AMUX_THM3_100K_PU>;
> +		io-channel-names = "sensor-channel";
> +		#thermal-sensor-cells = <0>;
> +	};
> +
> +	quiet_therm_bridge: quiet-therm-bridge {
> +		compatible = "generic-adc-thermal";
> +		io-channels = <&pm4125_adc ADC5_AMUX_THM2_100K_PU>;
> +		io-channel-names = "sensor-channel";
> +		#thermal-sensor-cells = <0>;
> +	};
> +
> +	xo_therm_bridge: xo-therm-bridge {
> +		compatible = "generic-adc-thermal";
> +		io-channels = <&pm4125_adc ADC5_XO_THERM_100K_PU>;
> +		io-channel-names = "sensor-channel";
> +		#thermal-sensor-cells = <0>;
> +	};

I see the SoM also has a PA_THERM0 thermistor at AMUX1


> +
> +	thermal-zones {
> +		sys-1-thermal {

Please give these meaningful names

Also, the XO one can go to the PMIC DTSI since it's always there

Konrad
