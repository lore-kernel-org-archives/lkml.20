Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97DC2526AA2
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 13:21:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792070502; cv=none; b=d31W74bB/jRTO0Qd5GXZz3zcMbu/gCc0GPk4au95mHRWGzoph4MUiIvd4rzG3BMV7siY5pl2717/U0qdjy1VR3dC8vgot7SbSl9+PHQO97SwoSQrg+gKzOWDaVefHZrxPAvBok/2U+OpSKIxGnfZhW1vO3E5sVmDpAw0DuwQfJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792070502; c=relaxed/simple;
	bh=r1cDUK4n4vsOkir84Mzgh88NYpQXfnFBKPDVl4FY7Wo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sH/enhniC4Vl1p8kROlaHS3ky8obrlNloRP9D5CFlEhMRC5okiuUcgxokFB2rWbdgciKqH+rnxqukJ/RjmAcXtBJeT89w+BdfZgFHgyGsFwoUjVlsTcIRJ0QSye1epytHqXJ+8Nq3Sl5LQgV6ehC7PLM0Xdx4KdgFDK1zyLY4Q0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KjKxcA58; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NYeP1fhC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KjKxcA58";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NYeP1fhC"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F9kRXU2999386
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 13:21:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pB4Vm9muqHjsBGpjHRKxj8v/lRoKTmIfKwt7EToa49E=; b=KjKxcA58C7U60Ql5
	0ocYGUoqGG6KIGic2UcwFm5pe1gVXsfpBEw4kbbl33+zH+hafjwnY92JxhXRS/Vi
	XlqcVQ2SWs9JSKdNFz8yPRRELbuAoRTXoSVEa5MSyDLnmyc9j2c6GT6aG8L8Rj29
	8gdg1Tevy/LFTE62JO+T5hZDnNRe+enSVDHkHzCwIJeTu97gCYZCQzoGhnHl2Iok
	G51QSyHVq6BrUaS6Tx4IZVk323JFUsj2RXo6z9ImTGBaODMHWhDFhfgv4L53N8H6
	3aNHi51HP816TJp0phFB2StMeCW3DbGQtq2tX1AEJ3kbOmfyVJRolBFo0ZkN1SBP
	nYvhHw==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hausm13x7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 13:21:39 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5ea1a9e0f05so9725e0c.0
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 06:21:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792070499; x=1792675299; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pB4Vm9muqHjsBGpjHRKxj8v/lRoKTmIfKwt7EToa49E=;
        b=NYeP1fhCeiZ4SsC2IIJeQxZLW/hqD9ui3rh9BCWAdNsQfJsMPmME2lygYulr/QcRgo
         0xk5v6SAXk/jM0u8532jS4p6J6nz0BdQqjnyFYpgJYaiAE7lYXr8oGWBXfYKiADxhNP3
         smbtAqCoBMiDc0mNfpc7FQJjO89Ois8qU8FE+i3ZRnM1jce7a/7vuIJqsdXMi8lLvMwH
         fm1K1t4oNodUlrOEv+2e/6+gtOSImrYGTI6mCCmDPAfZhPEb3nsT+DqJ/zaeyx0s4Q5X
         YuHMKCVTanEIxy17UrdMnPpLvsYeOpA407/LHJRgmL0A9bKHr6alO2w1TbDMjWH92QW2
         QmIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792070499; x=1792675299;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pB4Vm9muqHjsBGpjHRKxj8v/lRoKTmIfKwt7EToa49E=;
        b=s10c2YJmZ1LXaaoxU4kcHTt9yn53jjRIZ/ho/ktCXVVxexN4XXNiQysLpbj7mMKUMf
         qD7X4eiMi+FoRlFUVq+iouPRWd67ZswbOQZBsMko9lhnC1hSQJClAcKRu9S2at8R9QmP
         aF9CQaMbKNaj/Kdx1gN2gjdm74QxfqGbqT9jeyYFHyDd/MkYGpHiKtG1FuYaCvM6w+Mu
         ry6zxK5cP1fn2srT+T+N3oPbQ993OvFNBTwv5GIN7lG64tMusCe9FXQaQGEm601EFnP8
         HcF4JZ6X/uiRgs1HWpPnhkhMUR6DtbjhydIAJBF3gv0HcqqMJodI62gCIPgQCw9Nmi1N
         SwBA==
X-Gm-Message-State: AFq9FYKSkb2RDvNz9YetrDtIxXKQT6XfepUapl/QQDQsIZ3O2ppd80xf
	qa74CHch7HJVosaeXL30npcJChSqtiPPzo7eyXgc+5Jeh2+I1WXAxBttLvc06jM8f0et98v+UNs
	cIbmFE/kYn0NYGv4wBTd69b5h+oHHVLRYsnbYjDLvPOrEQpTKg36UaUzd2K+dWkO4CzM=
X-Gm-Gg: AYBFou3lxAAUL5f5LplpMjpRrvIfQ4ODpMKj5jNaJOayJrGiM4AE3hsCyqL5xkN+DxX
	YR7tGYa3rTvYh7sitSpyfC85g/24yHqqW02TBK+PseWYu4kNnYQ6qADQ1IKh9FRZzgEhYbxrpjZ
	ha9pGEzzu2+0hK0MqvmdYL03YdJREK1HXOnHUzWfVpLF/yceSY54n+rL1QYZPp4LMYPu0T5CRtj
	Rv8fDCc/9BCmAY7dC1MOtV40/Wi9CtX+QD9d6F1NdgWLMjBv96Hyryfq5ULbpC5cYrpxxgZsabS
	n5HIvoZU2IJjzy3WzMZz1wmDmPhGXmyzzT0MC1tetOcLENXF+KsPcIOfptFJzIhoWNGe0Z1zwRR
	PwKbZCirMKorclT7OSXMGBg==
X-Received: by 2002:a05:6122:2c09:b0:5ea:8fce:8a45 with SMTP id 71dfb90a1353d-5ea8fce8d42mr259251e0c.5.1792070498699;
        Thu, 15 Oct 2026 06:21:38 -0700 (PDT)
X-Received: by 2002:a05:6122:2c09:b0:5ea:8fce:8a45 with SMTP id 71dfb90a1353d-5ea8fce8d42mr259228e0c.5.1792070498112;
        Thu, 15 Oct 2026 06:21:38 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b2038ac6c1sm2560431a12.35.2026.10.15.06.21.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Oct 2026 06:21:36 -0700 (PDT)
Message-ID: <44878919-4835-4790-ae85-f865d0522391@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 15:21:34 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: talos-lyra-evk: Add CYPD6129 Type-C
 support
To: Akash Kumar <akash.kumar@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20261012131518.858396-1-akash.kumar@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261012131518.858396-1-akash.kumar@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 0P89ceGT613WHgzpQQVaWCRryAlxvqYp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDA1MyBTYWx0ZWRfX1w0HE8zzkz+k
 JIidOc/ZF2z13ZWwJAlX3p/1n7WGtbe24ckOdi6C/S++d5qB11qzKfKJfNb3V4eaX6Nq96MoOI9
 KHEb8EC+/5haLgklu/UBdaj9kZ9LR6zA0S/nMzh90+1qfC3qxYF7lQHtXExwBT2N14mibUEF04o
 tJl1VWPrclK1EfbgVEhgPDxgNquL2wi2wbR8Bb6nN54wQ1a6FzkU9Q1hizmPLdsybxi/v0WtVex
 GAYB9cqKs3lVCvViiqDhjb16yoLRek1nZM2S/yIu/InmDaQv/Ms/n5xJaUatgnyITVn/nfaBhUN
 Nrhv9RW7hfpWDUIkje5AAq1rWExsHb/vwUQBy8Jh5cxUo8jCnAT1eesTpmunnTLHmWA+IhJSHFi
 tJ72UdMwhVEB3wD/Yu4UTO17m09ihQa/ROiQqha6BNNYIUrI3yGpYeaL/afPBW+rbNH3kHOo4/B
 +fj67/lN7XCM8uWwsDA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDA1MyBTYWx0ZWRfX7Gx8jkNVWOAy
 VhhHdDA84CfOXDKaro0PnvQFJ9lfOsyosDiTsfh2yJ+IYZ6dPaKrIdUAS9AFMiAc2cBhOW0H1Fz
 a7YnJjRd3zMQP+1pbJdrbDQZuvCVQc0=
X-Authority-Analysis: v=2.4 cv=Eb5d0/mC c=1 sm=1 tr=0 ts=6ad0d363 cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=nSxbz2b1ZoL0s5JVDngA:9 a=QEXdDO2ut3YA:10 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-ORIG-GUID: 0P89ceGT613WHgzpQQVaWCRryAlxvqYp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 phishscore=0 bulkscore=0 priorityscore=1501
 clxscore=1015 lowpriorityscore=0 adultscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150053

On 10/12/26 3:11 PM, Akash Kumar wrote:
> Add support for the Cypress CYPD6129 dual Type-C PD controller on the
> Talos Lyra EVK.

[...]

> +	regulator-usb1-vbus {
> +		compatible = "regulator-fixed";
> +		regulator-name = "USB1_VBUS";
> +		gpio = <&pm8150_gpios 10 GPIO_ACTIVE_HIGH>;
> +		pinctrl-0 = <&usb1_en>;
> +		pinctrl-names = "default";
> +		enable-active-high;
> +		regulator-always-on;
> +	};
> +
>  };

Stray \n

>  
>  &i2c5 {
> @@ -59,6 +73,68 @@ expander3: gpio@3c {
>  		#gpio-cells = <2>;
>  		gpio-controller;
>  	};
> +
> +	typec@40 {
> +		compatible = "cypress,cypd6129";
> +		reg = <0x40>;
> +		interrupt-parent = <&tlmm>;
> +		interrupts = <86 IRQ_TYPE_LEVEL_LOW>;

interrupts-extended = <&tlmm 86 IRQ..>;

> +		pinctrl-0 = <&usb0_intr_state>;
> +		pinctrl-names = "default";
> +		wakeup-source;
> +
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		status = "okay";

Nodes are enabled by deafult

> +
> +		/*
> +		 * connector@0 is the USB0 Type-C port with SuperSpeed support,
> +		 * routed to usb_1. connector@1 is the USB1 Type-C port with
> +		 * USB 2.0 HS-only support, routed to usb_2.
> +		 */

We can read this from the of_graph below, please drop this comment

[...]

>  &usb_1 {
> -	dr_mode = "peripheral";
> +	dr_mode = "otg";

This is the default

> +	usb-role-switch;

This belongs in the SoC DTSI

[...]

>  &usb_2 {
> -	dr_mode = "host";
> +	dr_mode = "otg";
> +	usb-role-switch;
>  
>  	status = "okay";
> +
> +	port {
> +		usb_2_dwc3_hs: endpoint {
> +			remote-endpoint = <&ucsi_ccg_port_1_hs>;
> +		};
> +	};

Likewise

Konrad
