Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7E9F3AB5C7
	for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 16:48:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788022101; cv=none; b=Mg5tsF3QVZZ86ByuwI2z98h0S1V1+dT9cgR+OgTtMckDwRvFs2BkoRXbF/EarGtoIaasSADV6iHGdaBPuD61YC6+vQMlRgli+qZlm98z15vq6hvZh5VJZOwTfVUaHT7ICWy/gll8Utk8vDBZjM+mRoHvYUOkmRy6JI5Feyafz1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788022101; c=relaxed/simple;
	bh=jBpyxIKAfMKLZ4/3cCqUNTosNoFDYK14Zh5fd45UyDE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZYGvuYdrLvj5YCuoPrcPOg5aSwrOykIEVR6rnEQPRt0+angRx1/XQhdItdQGU3A7EgSoemjiT1S5DbnH3NOqRhVpNssZoaqEXhuGHq+9BezJEvseC8gBJGcnykQiX15+7CFoxG3L/OKoaO64V0VxVtndsQKONMyp8Cp07A80UmQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lRnfKq/h; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ekYuBq76; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lRnfKq/h";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ekYuBq76"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67TE2HBZ3093488
	for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 16:48:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DyNtz9xYx4S4Gb6wibJXt3RyN9cWyWzJC6meo/SzVnU=; b=lRnfKq/hg2GAG043
	iJejxvgJn3qe091W4+4Buzm/CiXoMigwnA0VQUxVgRfepycvYdVhluBgPjFRD5RJ
	6Uj2aQX7YVpQwAjNeBTZKWMqn6wIbx+NVBI4A5e9lFQm9hRHEYWmgFUmWwthRSpx
	7JRNev3At+DFBsJWNMgsr5NtK8PKYjIa9jNhDv83X57oY12uy3VeH9SWxmT/fxW1
	GUvPMvFwMQisL0Dci491TaMnmG7lREfF0vqXCqrHXQm9xFONJIojXycv0AehIp4b
	C0qxHW70wR6vYkEY0rc7/JnODaIt5mOMjL8Ul22E/43S+wzPTaWwRdRN4OnJCb9D
	s21Tkw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gbqhmscv0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 16:48:18 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3968bb86fb7so2952668a91.2
        for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 09:48:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788022098; x=1788626898; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DyNtz9xYx4S4Gb6wibJXt3RyN9cWyWzJC6meo/SzVnU=;
        b=ekYuBq76aEC83gpZYbNDghhy+DeBQQIqRd6gNfHuio7IGQLxNd91zP+uH16fONQOFj
         Xv83y7pz8iPO3uE+A202gbHuBx/iCsihBqDnyjDmQbfCigdbHgjAiB+5ZLNE/GghfbWa
         TawY99ZDjD7bWfL2Dangj199yS6/SZcdTBGcoASAP+qTcv/eLG7W7LL9nD3bS/KnX+St
         g/vomJESNE3hYbOAYnrVfU8IJu732SJYJyc1cmkstu/BXMPKDdXtg0Wwkm0Mgg1xEmq0
         cPyCYcG3jQkOAWLst/1FLId+wzhu9kO+z9Iau1q1u2O04/BjaDPd5IoXYyq4v5ZFWUsO
         bVPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788022098; x=1788626898;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DyNtz9xYx4S4Gb6wibJXt3RyN9cWyWzJC6meo/SzVnU=;
        b=JZYJi3+xKn0dqVw7T0fNisxwasq7ejDkSLoRNB9SkjAi6W8pJYS/IE2NgMeCOa+wHQ
         1+fwtnkiav7JY0Uk/T08t5sGSRUXGLaGz7LwGjdobr+Ji17rBWBLBRFTCn54qIh9fr/E
         penDmxsTAqWho6f6HiuntGtS6UxfQphVAQLj62GWOZ4LmZPI5O/KzVgh9ul3jaP839dx
         OJKUN/vA0/SD/11rXhMjvmchdX0ElgR1jAoj7/o2M7huUIiExqKZ4FhfEdY1lihUCtex
         nl9UmPCKSWvEcR1eiuCwLu/SKTE2R9c4ByqNlAj+jJ7YbWuS+m9Z/gOcLXbXX+j/piL9
         XrwA==
X-Forwarded-Encrypted: i=1; AKwUvBzU5EOY9+H5Wg92UAPCUOFD4zSLrjw3oQdPZzcv7g4OK9OYJhpYuTUNVHIltk2Ijlh6oW0n58jI/RdXw8w=@vger.kernel.org
X-Gm-Message-State: AFuF++laE7rOsw4MvA8kYMuXMo4YkSBGgNOZJPmwmFgwKNjq2VWa7WxK
	FkMnCRebNkiw+ACrIevxbOHoxBs6RpZPIEwFkwAQTCO1OGFjCxUgLe0K+spa9gnxUyOENjCTHrk
	tN8omz1zP14M0xbsjkyNa+vsK7AqkUMcsQqGNxlAdF3KVPZtsmlRjZDx5IJDEpTwm79M=
X-Gm-Gg: AYBFou26Zwnllz9jNaC3gsrfW62TkV8rVQjVhE7BG0llTfleHv7e0TzahWl9P0w0ged
	nz/3ipBlLy7bN5EgCVfOR1tv5ZVzL/VyS/eGUKaQdW9sLFxuklTcATK1lhyo3VpefECpV4xoJUC
	PpLEXoNkL88wvqzC0+cKd04+PEN6rIlnaIn0adHkM4fJ7Aw0C+QGdSvHkvQMAaXq/yKIjMJQcs0
	jNkufm4ZbzNB/abg3qlJSRhLpbTi/Cb/1D7lUrwtzuUvydNyHBo4PCKcHxrDhA1xxS+Pv5mdMxl
	dm/Er0j48QhX3UQ/CGOmdxoKR3l3Bnlcmt1g0sVVIzumnT3dB/IkP2KtxwKkTsnnF7qbaadFjAy
	wQGLMoY13D2VyO8kXD0gExURsMiQnz7VNILHbimUmoLSh9PYOKQOfXn9OMGkVUBkrnXw=
X-Received: by 2002:a17:90b:588f:b0:398:bf7e:b267 with SMTP id 98e67ed59e1d1-398bf7eb378mr3326105a91.2.1788022098225;
        Sat, 29 Aug 2026 09:48:18 -0700 (PDT)
X-Received: by 2002:a17:90b:588f:b0:398:bf7e:b267 with SMTP id 98e67ed59e1d1-398bf7eb378mr3326048a91.2.1788022097757;
        Sat, 29 Aug 2026 09:48:17 -0700 (PDT)
Received: from [192.168.1.5] ([122.177.241.61])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-396b186807bsm12915180a91.12.2026.08.29.09.48.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 29 Aug 2026 09:48:17 -0700 (PDT)
Message-ID: <bfb0d840-fc9c-41a2-9b05-959f2222a298@oss.qualcomm.com>
Date: Sat, 29 Aug 2026 22:18:11 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/9] arm64: dts: qcom: ipq6018: Flatten usb controller
 nodes
To: george.moussalem@outlook.com
Cc: linux-arm-msm@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
References: <20260825-ipq-flatten-usb-v1-0-5c1f3170bbe9@outlook.com>
 <20260825-ipq-flatten-usb-v1-7-5c1f3170bbe9@outlook.com>
Content-Language: en-US
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
In-Reply-To: <20260825-ipq-flatten-usb-v1-7-5c1f3170bbe9@outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI5MDE0NSBTYWx0ZWRfX52Jj5fXrNZCv
 et2+9PSRj1T4hg0DQHrFdQCXLiquvQMfA9lrd4M86C2bXGUL/oRM8bT1UvXAwgMaD/aup0ILL0w
 INtFm6H6Ex7Bw3NN1QO0ZWUB81ibm9ugUfCSWjq+bJmKAK6kMtBJvn6+VCMui9BfwzzzQZHsSmI
 2O3h6MoSxLbFB2UVHJV/lBGmCWgz2leGOBFyayo3cmqG+7le+kZpG+E1kE9pogpGxV1IdNgiHVl
 HDtPWGtRJbVifEdCo1wOEVh3vlOvJKLB9SMK7t170SYSW0iHMvC/TX6GtrXqm4oXmGPaaB4XPjr
 aJwbZKWDDZB1joQwXwXTOMs20ix+LPGEsekcNCBGI3ai9qYS68P8DwGx2z1MC1w+z2cx0tK0nUq
 0Sx3bSjsEuGg8iPEFFEhYdwbGEHXAuIwwAw1n/JsetXPKPxRBOmzjgZkenT+fjMsH5ZRE96f7zI
 hL65vsPUkU3G6C9vsWQ==
X-Proofpoint-ORIG-GUID: jxIWYd_QCUEshED8MPNi4-RzS97qBzWL
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI5MDE0NSBTYWx0ZWRfX6yqNswI87DsF
 O6oFdFHEx6on7vBvO/+opRoucOI9WoOGMvo8QYng+gtpDa/2xeOC36tq3mnHizljyjub+smoHbG
 XQva/A6YFn5F5/6xNs3bZTkm81YcJzI=
X-Proofpoint-GUID: jxIWYd_QCUEshED8MPNi4-RzS97qBzWL
X-Authority-Analysis: v=2.4 cv=bpl8wkai c=1 sm=1 tr=0 ts=6a930d52 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=PZ14JaS8AzYbITig/tPzRA==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=UqCG9HQmAAAA:8 a=0nupcxNY4bLKEn-PqUgA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-29_04,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 suspectscore=0 bulkscore=0 impostorscore=0
 adultscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608290145



On 8/25/2026 4:12 PM, George Moussalem via B4 Relay wrote:
> From: George Moussalem <george.moussalem@outlook.com>
> 
> Flatten usb controller nodes and update to using latest bindings and
> flattened driver approach.
> 
> This SoC has two USB controllers of which the USB3 node had a ref clock
> populated in the DWC3 child node. Add property to the USB3 node only to
> select UTMI as reference clock for the DWC3 core to calculate the right
> values for the period and frame length adjustment.
> 
> Signed-off-by: George Moussalem <george.moussalem@outlook.com>

[...]

>   
> -			interrupts = <GIC_SPI 128 IRQ_TYPE_LEVEL_HIGH>,
> +			interrupts = <GIC_SPI 99 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 128 IRQ_TYPE_LEVEL_HIGH>,
>   				     <GIC_SPI 130 IRQ_TYPE_LEVEL_HIGH>;
> -			interrupt-names = "pwr_event",
> +			interrupt-names = "dwc_usb3",
> +					  "pwr_event",
>   					  "qusb2_phy";
>   

You are adding pwr_event irq here. Do mention that in the commit message 
or send this particular interrupt addition as a separate patch.

>   			resets = <&gcc GCC_USB1_BCR>;
> -			status = "disabled";
>   
> -			dwc_1: usb@7000000 {
> -				compatible = "snps,dwc3";
> -				reg = <0x0 0x07000000 0x0 0xcd00>;
> -				interrupts = <GIC_SPI 99 IRQ_TYPE_LEVEL_HIGH>;
> -				phys = <&qusb_phy_1>;
> -				phy-names = "usb2-phy";
> -				tx-fifo-resize;
> -				snps,is-utmi-l1-suspend;
> -				snps,hird-threshold = /bits/ 8 <0x0>;
> -				snps,dis_u2_susphy_quirk;
> -				snps,dis_u3_susphy_quirk;
> -				dr_mode = "host";
> -			};
> +			phys = <&qusb_phy_1>;
> +			phy-names = "usb2-phy";
> +
> +			tx-fifo-resize;
> +			snps,is-utmi-l1-suspend;
> +			snps,hird-threshold = /bits/ 8 <0x0>;
> +			snps,dis_u2_susphy_quirk;
> +			snps,dis_u3_susphy_quirk;
> +			dr_mode = "host";
> +

If this is HS only, do we need to add "qcom,select-utmi-as-pipe-clk" ?

[...]

> +		usb3: usb@8a00000 {
> +			compatible = "qcom,ipq6018-dwc3", "qcom,snps-dwc3";
> +			reg = <0x0 0x08a00000 0x0 0xfc100>;
>   
>   			clocks = <&gcc GCC_SYS_NOC_USB0_AXI_CLK>,
> -				<&gcc GCC_USB0_MASTER_CLK>,
> -				<&gcc GCC_USB0_SLEEP_CLK>,
> -				<&gcc GCC_USB0_MOCK_UTMI_CLK>;
> +				 <&gcc GCC_USB0_MASTER_CLK>,
> +				 <&gcc GCC_USB0_SLEEP_CLK>,
> +				 <&gcc GCC_USB0_MOCK_UTMI_CLK>;
>   			clock-names = "cfg_noc",
> -				"core",
> -				"sleep",
> -				"mock_utmi";
> +				      "core",
> +				      "sleep",
> +				      "mock_utmi";
>   
>   			assigned-clocks = <&gcc GCC_SYS_NOC_USB0_AXI_CLK>,
>   					  <&gcc GCC_USB0_MASTER_CLK>,
> @@ -692,32 +686,31 @@ usb3: usb@8af8800 {
>   					       <133330000>,
>   					       <24000000>;
>   
> -			interrupts = <GIC_SPI 134 IRQ_TYPE_LEVEL_HIGH>,
> +			interrupts = <GIC_SPI 140 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 134 IRQ_TYPE_LEVEL_HIGH>,
>   				     <GIC_SPI 136 IRQ_TYPE_LEVEL_HIGH>,
>   				     <GIC_SPI 220 IRQ_TYPE_LEVEL_HIGH>;
> -			interrupt-names = "pwr_event",
> +			interrupt-names = "dwc_usb3",
> +					  "pwr_event",
>   					  "qusb2_phy",
>   					  "ss_phy_irq";

Same comment as above.

>   
>   			resets = <&gcc GCC_USB0_BCR>;
> -			status = "disabled";
>   
> -			dwc_0: usb@8a00000 {
> -				compatible = "snps,dwc3";
> -				reg = <0x0 0x08a00000 0x0 0xcd00>;
> -				interrupts = <GIC_SPI 140 IRQ_TYPE_LEVEL_HIGH>;
> -				phys = <&qusb_phy_0>, <&ssphy_0>;
> -				phy-names = "usb2-phy", "usb3-phy";
> -				clocks = <&xo>;
> -				clock-names = "ref";
> -				tx-fifo-resize;
> -				snps,parkmode-disable-ss-quirk;
> -				snps,is-utmi-l1-suspend;
> -				snps,hird-threshold = /bits/ 8 <0x0>;
> -				snps,dis_u2_susphy_quirk;
> -				snps,dis_u3_susphy_quirk;
> -				dr_mode = "host";
> -			};
> +			phys = <&qusb_phy_0>, <&ssphy_0>;
> +			phy-names = "usb2-phy", "usb3-phy";
> +
> +			qcom,select-utmi-as-ref-clk;
> +
> +			tx-fifo-resize;
> +			snps,parkmode-disable-ss-quirk;
> +			snps,is-utmi-l1-suspend;
> +			snps,hird-threshold = /bits/ 8 <0x0>;
> +			snps,dis_u2_susphy_quirk;
> +			snps,dis_u3_susphy_quirk;
> +			dr_mode = "host";

This controller is DRD capable. Please move this dr_mode property to DTS 
file.

Regards,
Krishna,
