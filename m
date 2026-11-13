Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794580831;
	b=WkEHiI9dwJl+YT63+350NLqYl7ea6NSOrzk38c/2VCsrtHxMLNYQSVgz46kVsCM9kuJ9
	 ggIXf/zCKEqkWw8Mc+B+UcPWLMRA4GGOghGFY1S/iDdclqI1iUOoYJAMTXYpiEdmzwkiD
	 DneBE3UCgafgbL6Wioy1+0OENjWXhmBNfU4KQ8xEA8jMnAXtSk16Jcp8XMQenoDj4f7so
	 ThA0PVARfX33UNPsvde0Zmg6bdxN+CpyHxRp6MQ41B1gyGF8zOGJVqea0U+51B3+5hj6V
	 WXxGGywx8rRZv4K3+aPN3B1lTc2fbD6RkxeHtYmfbnMg8iCflIqbmNK2+7vQT5pIIRQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794580831;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=8ollal9lC/jW3r3KXGudN37lOSY1Es9hEPHi5dbEpOQ=;
	b=gR99CiZbaOR+uB411bbEDD8tOG+9SDjpKUSnw+HQs/9+my6D/ttcziweTGxZUZj4OLqN
	 EY0RnpEXUvm9LpEgMk1+7NGmlBc9a9AbnN9EyJu8AqPxy6nxUyQHjg5DbXd63gvqtM4em
	 IWiZD1fNqoLIohCrn/Ouz2+U0H/Ab/oaagdpNxwNfjJM9u4N00nsp/OA17FE+Zkud68aH
	 gpJCU+SI20INh5nKDu4bqjxWcgzjH5kZ29oYIk0IZzM81+Fuy91rleBDs5ioK6+ba1cL8
	 +R5tHnbZYh3eTsuV229qhmykhQsxmpvLeiz+hvcFtE4zW9MvQ4BShMLdWvotk+mCq3g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WbhEI07d;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=J7qCx5Gh;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C95CC606A327
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 14:40:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C95CC606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WbhEI07d;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=J7qCx5Gh
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ADCJbch688697
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 14:40:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=8ollal9lC/jW3r3KXGudN37l
	OSY1Es9hEPHi5dbEpOQ=; b=WbhEI07dx7cZ1kAtfq8QwVG6XjXHLpK0pIGXf5RH
	rrq53Gdka8hceXufxBA1d2Xge9bI0e4s51ZQYxjc6Ma9zGe8dypH3TZ08JxhtWsx
	U0XB/b+OUdtCJNHjqxPXlPDnlCA+AirUEPRllFrJfgfCH0X1MmZhsEWjGuWbyXJy
	toBEjXTRYtpIzWLa0UT0P4Zg3943Z0e4H6ausfQMQhdMzVAWX9OEmPT94QM26Z0N
	4LfeSxRlPDIJ4Q6x2xxuvS1oyb0OvoClySnqRTbo16LBaiIMxV3ebccnlUkMI6wK
	SjuqQVXiC2x3deWGgSQbMTN3nrNbNg71oaEmKjUxReQxwg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwqufjsq1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 14:40:29 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f2005ce21so191588785a.3
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 06:40:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794580829; x=1795185629; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8ollal9lC/jW3r3KXGudN37lOSY1Es9hEPHi5dbEpOQ=;
        b=J7qCx5Ghhp905FgI7O9RpG9Pbb49GJ7Nel7q041CewyraUy54AqoUkYrZF0FGeHUxY
         UF5EAHLci/P8WCd6F7B5Ju6ZLOJJkzfziHdULagHIz9qw1PLpri/vQMy35HamOSTpnq3
         O1OY0X7hLpxT0aGavsm9h6W5F8YMb+C7Ihn2ANZG8tQc+p1JdaZmQn/gMwxsA/o0zj87
         PpqzD/ObRJwOIMwylTtRpQhEj4wQ25v6SF2z8toGdQZXN5J/RIP7IA/Nhq8gqo6qhSWZ
         Ar1m3uML5iTyadnXFnEfx7rSKLfjbeIaf1iHV0j3zuaCXIlAYqONo6msBFLuZeDH+mPY
         /eHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794580829; x=1795185629;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8ollal9lC/jW3r3KXGudN37lOSY1Es9hEPHi5dbEpOQ=;
        b=Jb+Ogn/ZSijqcD02v8sQ6EWh8An6Y9go174O/gnbtBLvYpGsSLjkWuPqO3BSrThEYN
         Vz/L8bM/ZR2Vw1amzGIq26ISly2ovrttGRzOKenbmycyWvDLPSaBnjAQVgOxfnAGJbAZ
         baUh1P6phBUP6tfSAGpJ57xeFqi/mT2HG/PUsrVb/sDCjABqSHiPyve/o+ySGe3OGRO3
         39XVIHl52Gc5CUeNu5EyRHT2Wnc4HuDjJxBXIYTMl4t2GP2P3FCzfdDpR1pQaFQx7UnI
         Tmb1viFPLP28wxTjiNccmBlO+HI2wJyorr/cIIdYPu9yrseQg4s1fT5ewJ/sGxh9PYFY
         k9AQ==
X-Forwarded-Encrypted: i=1; AL+hErHrH+ogn7MfYL6WV0pRQC0iwdiRQfAV7KYhrXyvj0Jm20HiK/ZS241Pe1BmcfhdWeK5N9MXDggeb5AsItI=@vger.kernel.org
X-Gm-Message-State: APuU4Z/MeusVfbCPNOw/9bokiOjcrbFpyCF+kmwjx3ggcv6qDAP+Jq5c
	kf81kBFaEBxniQAB23x3Y7/mC5HFba+LCkvwRLPTl8TXmeDQgGo6fF+Wz0cBnhQoDraJNCr/jNE
	Gey9StDdriYL/qADPraVhLY8XkDzX34+LgcXsyxXOdO8mrHKVQrHkOU3TrYu0RhhCARA=
X-Gm-Gg: AYBFou3LQeTmsN2hKZUrMpnOOFxXA4YVUSaqOJtKw1VxYbnJuBpaPIhKel0JQbik8ID
	Qby3ylS16YmDyOabDzdeoluN8Z01EaOvaN4Yiy/BJ91WtO45c81Kuh0CkWaSaU5gqpgM5XwDkHD
	GoT0ORdZbpF/3bRIPFSR4d1IqGKtL+xPgchMU3BJO7dcXZN/rtB96zdjP4Hw/8slqHhvA24hovn
	2wpCYovCRxEULMWFhBYrbgHFLa1JXkB6wF7fVmq0OWyvybj6wa2zHhYa0VdN9bSGCLjErxUmawG
	/KZ+oU/SJYT0SWQZbdJHgST+wm+tw4guic1lLk80pasY2Syl4jdMYLsxSpR8ME7dPEv8Ri+dgox
	A0eKjeXPELiudOEF1rwCh91mXrWyC7coiVDeQ7LIKQ7b4HnafptTOFo3rwuL2dgW1nfsSCpye1u
	GApTbMc5Xkjcpvm5ru07L9l7VGAf0h7wYUnch44z9QA/Jr0T/+113zsyVCo+GzJQ==
X-Received: by 2002:a05:620a:1712:b0:93c:635e:6f3e with SMTP id af79cd13be357-9494bbf3f82mr450047685a.35.1794580828566;
        Fri, 13 Nov 2026 06:40:28 -0800 (PST)
X-Received: by 2002:a05:620a:1712:b0:93c:635e:6f3e with SMTP id af79cd13be357-9494bbf3f82mr450041385a.35.1794580827847;
        Fri, 13 Nov 2026 06:40:27 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ae2b7d2318sm9229931fa.35.2026.11.13.06.40.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 06:40:26 -0800 (PST)
Date: Fri, 13 Nov 2026 16:40:25 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Akash Kumar <akash.kumar@oss.qualcomm.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v3] arm64: dts: qcom: shikra: Add CYPD6129/CYPD6229
 Type-C controller support
Message-ID: <xjmbkr55gwoxe47nkntzhct6dfvsqasft3ghhsgveqmkruzpme@3dkyryogacwd>
References: <20261012094835.647882-1-akash.kumar@oss.qualcomm.com>
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
In-Reply-To: <20261012094835.647882-1-akash.kumar@oss.qualcomm.com>
X-Proofpoint-GUID: tycoNopJF2LVNKRsgahxdOedFm0xRVLM
X-Proofpoint-ORIG-GUID: tycoNopJF2LVNKRsgahxdOedFm0xRVLM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDA1OCBTYWx0ZWRfX0Z8vIJwqWjRC
 Gl4EcsZ1dnGwnLbzCLjNq3nSv94pi6PX2HFg6YdgMWgd+1Omafi+dvEV883jDybOgZZYYOfbOF0
 sTNPBafSr4UKNijK26MuIQIv6vfk7gdYwKA9CCAyKzosc7raKSDtOp3H9oPuaCUlXAaMkPvPO3R
 1foUZXID5KIEV5pdplhsQonxxzEYhz51Kb4wcYjAPdemqbBc+g0MkVTalEOozkpIBxyoaBiwQyL
 z+oVu9eUhDrsDlhZ+Nl0XCdhLKVOq+2AWGw1NbuqEU4NFaJ9Cz/rNZuXSoCKIUKuaCGJqFmldLk
 soJ3619kcegWHPZRpfWib3EYvtF1R5Vlik4BamGf51cQYhWMrEqM4bcgfQRwPtt3K14aDPMiVMp
 9riAIPqG+/yJiV1di6rrikt2/oEXslLcMs5T4j1+CrO1E09VzRGaLOQkeuROwovlO38GCzJgNOt
 Sn0dufhkTG03WsQ6HvA==
X-Authority-Analysis: v=2.4 cv=XZocX455 c=1 sm=1 tr=0 ts=6af7215d cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=FRlco6f4c1jZEPcQdwcA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDA1OCBTYWx0ZWRfX7D3KjlmvJK+9
 QA1lROLL2I5aWww8t+GND57JY9NBZDMCPsgkQoFIffRIYNdRz2htIIgMd1+epFG98fpi7T2BEY2
 x91PZO9J/xBBoop3XUQwVqykyOLm4Mo=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_04,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 malwarescore=0 priorityscore=1501 spamscore=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130058

On Mon, Oct 12, 2026 at 03:15:00PM +0530, Akash Kumar wrote:
> This series adds support for the Cypress cypd6129/cypd6229 dual
> Type-C PD controllers used on the Shikra CQM/CQS/IQS platforms to
> handle usb-role-switch, and wires up the corresponding DT nodes.

Which series it's a single patch.? Write something useful, e.g. if the USB ports are HS or
SS.

> 
> Signed-off-by: Akash Kumar <akakum@qti.qualcomm.com>
> ---
> Patch v3 adds the Shikra board-specific Device Tree changes required to
> connect the CYPD6129/CYPD6229 Type-C PD controllers to the USB controllers.
> 
> On the CQM and CQS platforms, enable the CYPD6129 controller on I2C3,
> configure its GPIO136 interrupt, and connect its Type-C connector to USB2.
> Both USB controllers are configured in OTG mode to allow role switching.
> 
> On the IQS platform, enable the CYPD6229 controller with the CYPD6129
> fallback compatible, configure its GPIO50 interrupt, and describe both
> Type-C connectors. The first connector is connected to USB2, while the
> second connector is connected to USB1, including its SuperSpeed path.
> 
> The changes also add the required pinctrl configuration, wakeup-source

You haven't read Documentation/process/submitting-patches.rst

> property, I2C alias, VBUS boost GPIO hog, and USB endpoint
> remote-endpoint connections.
> 
> Link to v2: Link: https://lore.kernel.org/all/20260820145036.2035641-1-akash.kumar@oss.qualcomm.com/
> 
> Link to v1: https://lore.kernel.org/all/20260820145036.2035641-1-akash.kumar@oss.qualcomm.com/
> 
> Link to Driver and DT-binding change:
> https://lore.kernel.org/all/20261012091658.635441-1-akash.kumar@oss.qualcomm.com/
> 
> base commit Link: https://lore.kernel.org/all/20260912-usb-shikra-v7-v9-0-c7b507a0ec27@oss.qualcomm.com/
> commit e77b5e2b5816bfb8fab930156a320550ee5a0ffe
> 
> ---
>  arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts |  57 ++++++++++
>  arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts |  57 ++++++++++
>  arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts | 109 ++++++++++++++++++++
>  3 files changed, 223 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts b/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
> index 2d26435b257a..508c24a2ce99 100644
> --- a/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
> +++ b/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
> @@ -14,6 +14,7 @@ / {
>  	chassis-type = "embedded";
>  
>  	aliases {
> +		i2c3 = &i2c3;
>  		mmc0 = &sdhc_1;
>  		serial0 = &uart0;
>  	};
> @@ -23,6 +24,43 @@ chosen {
>  	};
>  };
>  
> +&i2c3 {
> +	status = "okay";
> +
> +	typec@40 {
> +		compatible = "cypress,cypd6129";
> +		reg = <0x40>;
> +		interrupts-extended = <&tlmm 136 IRQ_TYPE_LEVEL_LOW>;
> +		pinctrl-0 = <&usb0_intr_state>;
> +		pinctrl-names = "default";
> +		wakeup-source;
> +
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		ccg_typec_con0: connector@0 {

Unused label, drop.

> +			compatible = "usb-c-connector";
> +			reg = <0>;
> +			label = "USB-C";
> +			data-role = "dual";
> +			power-role = "dual";
> +
> +			ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				port@0 {
> +					reg = <0>;
> +
> +					ucsi_ccg_port: endpoint {
> +						remote-endpoint = <&usb_2_dwc3_hs>;

Are SS and SBU lines not wired?

> +					};
> +				};
> +			};
> +		};
> +	};
> +};
> +
>  &pm4125_hs_in {
>  	remote-endpoint = <&usb_1_dwc3_hs>;
>  };
> @@ -66,6 +104,15 @@ &sdhc_1 {
>  	status = "okay";
>  };
>  
> +&tlmm {
> +	usb0_intr_state: usb0-intr-state {
> +		pins = "gpio136";
> +		function = "gpio";
> +		drive-strength = <2>;
> +		bias-pull-up;
> +	};
> +};
> +
>  &usb_1 {
>  	dr_mode = "otg";
>  };
> @@ -82,6 +129,16 @@ &usb_1_hsphy {
>  	status = "okay";
>  };
>  
> +&usb_2 {
> +	dr_mode = "otg";

It's default and can be dropped.

> +
> +	port {
> +		usb_2_dwc3_hs: endpoint {

Move the endpoint definition to shikra.dtsi.

> +			remote-endpoint = <&ucsi_ccg_port>;
> +		};
> +	};
> +};
> +
>  &usb_2_hsphy {
>  	vdd-supply = <&pm4125_l12>;
>  	vdda-pll-supply = <&pm4125_l13>;
> diff --git a/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts b/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
> index fcafd8aa6384..eaa79b2960a9 100644
> --- a/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
> +++ b/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
> @@ -14,6 +14,7 @@ / {
>  	chassis-type = "embedded";
>  
>  	aliases {
> +		i2c3 = &i2c3;
>  		mmc0 = &sdhc_1;
>  		serial0 = &uart0;
>  	};
> @@ -23,6 +24,43 @@ chosen {
>  	};
>  };
>  
> +&i2c3 {
> +	status = "okay";
> +
> +	typec@40 {
> +		compatible = "cypress,cypd6129";
> +		reg = <0x40>;
> +		interrupts-extended = <&tlmm 136 IRQ_TYPE_LEVEL_LOW>;
> +		pinctrl-0 = <&usb0_intr_state>;
> +		pinctrl-names = "default";
> +		wakeup-source;
> +
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		ccg_typec_con0: connector@0 {

Drop the label.

> +			compatible = "usb-c-connector";
> +			reg = <0>;
> +			label = "USB-C";
> +			data-role = "dual";
> +			power-role = "dual";
> +
> +			ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				port@0 {
> +					reg = <0>;
> +
> +					ucsi_ccg_port: endpoint {
> +						remote-endpoint = <&usb_2_dwc3_hs>;

Are SS and SBU not wired?

> +					};
> +				};
> +			};
> +		};
> +	};
> +};
> +
>  &pm4125_hs_in {
>  	remote-endpoint = <&usb_1_dwc3_hs>;
>  };
> @@ -66,6 +104,15 @@ &sdhc_1 {
>  	status = "okay";
>  };
>  
> +&tlmm {
> +	usb0_intr_state: usb0-intr-state {
> +		pins = "gpio136";
> +		function = "gpio";
> +		drive-strength = <2>;
> +		bias-pull-up;
> +	};
> +};
> +
>  &usb_1 {
>  	dr_mode = "otg";
>  };
> @@ -82,6 +129,16 @@ &usb_1_hsphy {
>  	status = "okay";
>  };
>  
> +&usb_2 {
> +	dr_mode = "otg";

Drop

> +
> +	port {
> +		usb_2_dwc3_hs: endpoint {
> +			remote-endpoint = <&ucsi_ccg_port>;
> +		};
> +	};
> +};
> +
>  &usb_2_hsphy {
>  	vdd-supply = <&pm4125_l12>;
>  	vdda-pll-supply = <&pm4125_l13>;
> diff --git a/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts b/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts
> index 779b9582c011..f7dc3026d028 100644
> --- a/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts
> +++ b/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts
> @@ -14,6 +14,7 @@ / {
>  	chassis-type = "embedded";
>  
>  	aliases {
> +		i2c3 = &i2c3;
>  		mmc0 = &sdhc_1;
>  		serial0 = &uart0;
>  	};
> @@ -23,6 +24,72 @@ chosen {
>  	};
>  };
>  
> +&i2c3 {
> +	status = "okay";
> +
> +	typec@40 {
> +		compatible = "cypress,cypd6229", "cypress,cypd6129";
> +		reg = <0x40>;
> +		interrupts-extended = <&tlmm 50 IRQ_TYPE_LEVEL_LOW>;
> +		pinctrl-0 = <&usb0_intr_state>;
> +		pinctrl-names = "default";
> +		wakeup-source;
> +
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		ccg_typec_con0: connector@0 {

Drop the label

> +			compatible = "usb-c-connector";
> +			reg = <0>;
> +			label = "USB2-Type-C";
> +			data-role = "dual";
> +			power-role = "dual";
> +
> +			ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				port@0 {
> +					reg = <0>;
> +
> +					ucsi_ccg_port0_hs: endpoint {
> +						remote-endpoint = <&usb_2_dwc3_hs>;
> +					};
> +				};
> +			};
> +		};
> +
> +		ccg_typec_con1: connector@1 {
> +			compatible = "usb-c-connector";
> +			reg = <1>;
> +			label = "USB3-Type-C";
> +			data-role = "dual";
> +			power-role = "dual";
> +
> +			ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				port@0 {
> +					reg = <0>;
> +
> +					ucsi_ccg_port_1_hs: endpoint {
> +						remote-endpoint = <&usb_1_dwc3_hs>;
> +					};
> +				};
> +
> +				port@1 {
> +					reg = <1>;
> +
> +					ucsi_ccg_port_1_ss: endpoint {
> +						remote-endpoint = <&usb_qmpphy_out>;
> +					};
> +				};
> +			};
> +		};
> +	};
> +};
> +
>  &remoteproc_cdsp {
>  	firmware-name = "qcom/shikra/cdsp.mbn";
>  
> @@ -58,6 +125,32 @@ &sdhc_1 {
>  	status = "okay";
>  };
>  
> +&tlmm {
> +	vbus_boost_5v: vbus-boost-5v-hog {
> +		gpio-hog;
> +		gpios = <79 GPIO_ACTIVE_HIGH>;
> +		output-high;
> +		line-name = "vbus-boost-5v";
> +	};

Why is it a hog rather than a regulator?

> +
> +	usb0_intr_state: usb0-intr-state {
> +		pins = "gpio50";
> +		function = "gpio";
> +		drive-strength = <2>;
> +		bias-pull-up;
> +	};
> +};
> +
> +&usb_1 {
> +	dr_mode = "otg";
> +
> +	status = "okay";
> +};
> +
> +&usb_1_dwc3_hs {
> +	remote-endpoint = <&ucsi_ccg_port_1_hs>;
> +};
> +
>  &usb_1_hsphy {
>  	vdd-supply = <&pm8150_l4>;
>  	vdda-pll-supply = <&pm8150_l12>;
> @@ -66,6 +159,18 @@ &usb_1_hsphy {
>  	status = "okay";
>  };
>  
> +&usb_2 {
> +	dr_mode = "otg";
> +
> +	status = "okay";
> +
> +	port {
> +		usb_2_dwc3_hs: endpoint {
> +			remote-endpoint = <&ucsi_ccg_port0_hs>;
> +		};
> +	};
> +};
> +
>  &usb_2_hsphy {
>  	vdd-supply = <&pm8150_l4>;
>  	vdda-pll-supply = <&pm8150_l12>;
> @@ -80,3 +185,7 @@ &usb_qmpphy {
>  
>  	status = "okay";
>  };
> +
> +&usb_qmpphy_out {
> +	remote-endpoint = <&ucsi_ccg_port_1_ss>;
> +};
> -- 
> 2.43.0
> 

-- 
With best wishes
Dmitry
