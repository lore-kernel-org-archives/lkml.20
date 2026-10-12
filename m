Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D787C1C69D
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 11:59:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791806393; cv=none; b=sFeIz+2kObxFfGmnWzBFlbWG7iX30RGdqZw03PcUeMmLC+kMPx641LSjcg4NdGZsl2ywz/pBBLEyyjGV7wDoBEN4wLX1ced95xsxsmfQ8Ud+IFleCsoosnfM+WILba8yE7SQI4dQQQHBLC4Hb4uQUyotcxChBOsiHAM8gncg0po=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791806393; c=relaxed/simple;
	bh=a1NaIs0FbKCymY+qRR21w0VtU0S/KD2PxYW7haVWQO8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Fxdya4sxzZ8eIsJuT00hsBcYcoUHjVU6YFz1XgEWuty/GlM3smNhJrUNuka+YsEMBACj8X3OhEz6O0MG4YtUvWXQTQ/42C8WqvEMn/PCcXRmVfRSYjHZnwh//pOalCmBvffL71G2RYFZJpdjQVhbfeFjvmjad9OYGbusHreS/O0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jco0neAN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=J4q5TaMl; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jco0neAN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="J4q5TaMl"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69C8Kmv71439197
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 11:59:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=CYdcT5lzpD3Kf3DXa/aYqb74
	m1uIP3WyBhNmNbXn260=; b=jco0neANeWOZbpfIbBCWJRy12d35jsm7ERDPf8kP
	wwcy+0C/6tIkILAmF68p0DpYsXipFtmieNh6HOnoIhexS2frNhTktNp716Ptzapw
	4Quf5CxPoKCWlopDZqVZrmTUky9TQX8STRrsSF6fgDk/xeK+CiupSeun1Y2N9xh5
	8Glka/J+6cvNu2k3wtA6ldZV14DQufEUBEkVW/6VlJMTjvz8mx5bpVZFXiNzRh+G
	tzuwjMfSW09Wn6uSh/xk6uugnkqgNtiTrEiG1G7/nohr3yJsXCfmF+QT0c7QP1kg
	hShlVV4F/tcDYw5cm4lz1PArYNKuQkTt7qxuXWc9Rlyrkw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8qtkj20e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 11:59:50 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-936aa34873bso381915485a.3
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 04:59:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791806390; x=1792411190; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CYdcT5lzpD3Kf3DXa/aYqb74m1uIP3WyBhNmNbXn260=;
        b=J4q5TaMlKpAKy0t49+Aw6dAut5yV3G1XaBTMt9Wge2IWP35+K2A3UcBuQi9wRzqRSu
         5bKE6Gx+d9u0ApQXuHg8z1dVoy4nDDwgw/0hdKlfRcfqsSPMQBXbo5/baW0s+C78FZOa
         lAGfKTglfY8O/jbTdI2ejvWFDtJedAVIUbPWmtFhrvW9daBlFBeEQKYqIhFxSxZB3LAZ
         FTD1O56Seiw2f84Va0wG3mNM4VNIumz+xSbg4fhaYzI8Q2+KY1iUOvYiKPxEf2vwQxuB
         ApV/MlEDkU1zPVsoY7r1kaH9xCaU/qBKPDPDwRzemeHhq1S0IoX8/m+/KckEgUIhGqEL
         zthA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791806390; x=1792411190;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CYdcT5lzpD3Kf3DXa/aYqb74m1uIP3WyBhNmNbXn260=;
        b=vr+q7xO16teUB0nvdHUbxeepWTnYoHwGZey0jOIvvKYraVklSE8gzWnke4gIAc9pP0
         RRHS4TilO5axA0wSxAcwpyniAk2yaY0xDj0qaGcPOFKDZlIuGUWcojyEI2zTlwPNjMtI
         SsnE4pk+8Pb2DGjEP3ib1QrdUo/6XCTlMELA12LqPaiKdUfjr/39OBhXy9oRhPP2Sz2F
         8K/25HUfHS3Ii4wHTMeBL2OUQFyZv7z4XqpJPvhYVZytP5ySa6yt0ciL+tKZ5jAlvieY
         j8f2oqiGcPDu40ilaufIdV+Cai55nIroDu39YzNvegpRoZlalHaOxjxkw4s4UK7qtnft
         yB/w==
X-Forwarded-Encrypted: i=1; AKwUvBy2v6mODjqFFTaVAxdvJ5QD1QWI6i15FPRtlN1q4r8fUyjfd+IaREWF+u8u/tXC+amNs9PSLyo7akhWYj8=@vger.kernel.org
X-Gm-Message-State: AFq9FYLHllbXxHnAuOv9AoNk34y2ZeQIva1POPLgHuT36jp3HekbSKGw
	G70l9jnAXW0Q8aIqh6UkeRu1W2mGQz9Yt/ZMk7Df9+716oWdnnkaMNfc07fJ7/K+Nbw2wehhc2L
	qfemDpT8DK8bvNkDKGkA3DQEEYVJKBr8lnKLpCwgOMTif3/5p9EJyWSs0aArv3pwEe2TzITlTRl
	g=
X-Gm-Gg: AYBFou0s5yYFrRamqBeNMnIWNxw9kkwURA5WVqMqucHMJgOI+2i3d3m8ja2ls03QWIX
	NlrFalcaDdP8Fn7oXu6i0tfNZtf2FuitOMX+wFkZWuTNeN5s3JVMrJyXKjtxbomUMpFIqz6ly9n
	A42zf4aCMpMeOvLbsAjkVau+nDnM96c96jy68lS9WjJEBNaR6kgKiA6oJHVuQK6BkGFQxAbS8Aw
	SYuxXvwD/7TdODoEuAY8GxrpN7jiFgTEagjbNDUBZ22SRCk1p0vX1Ov+Ba/0z3MNL2A60110Dqz
	9OLXMva+OyCQFIy1CpNMOWaEr2RKJ35ljpCF7FwssUhGKjdi8blEYEuOeZoPm9dPDUngmLxa4c7
	x7rC3OfPcCouvmxIONHPPdEIEdXHNwVrP5gipv1ZQNsQLEARNYT0Iz0wztBymTWPAkn8nPum4nW
	FzwU2+n7oivdUp
X-Received: by 2002:a05:620a:711b:b0:93a:2e8:5aff with SMTP id af79cd13be357-93ebd1ba700mr1675677785a.21.1791806389793;
        Mon, 12 Oct 2026 04:59:49 -0700 (PDT)
X-Received: by 2002:a05:620a:711b:b0:93a:2e8:5aff with SMTP id af79cd13be357-93ebd1ba700mr1675674685a.21.1791806389259;
        Mon, 12 Oct 2026 04:59:49 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bcddea7d87sm2914939e87.48.2026.10.12.04.59.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 04:59:48 -0700 (PDT)
Date: Mon, 12 Oct 2026 14:59:46 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ruchira Revdekar <ruchira.revdekar@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Avaneesh Kumar Dwivedi <avaneesh.dwivedi@oss.qualcomm.com>,
        Akash Kumar <akakum@qti.qualcomm.com>,
        Khalid Faisal Ansari <khalid.ansari@oss.qualcomm.com>,
        Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>,
        Vishnu Saini <vishsain@qti.qualcomm.com>,
        Nirmesh Kumar Singh <nirmesh.singh@oss.qualcomm.com>
Subject: Re: [PATCH v2 3/4] arm64: dts: qcom: talos: Add Talos Lyra EVK board
Message-ID: <ecuc74jw2pmgeijojvqayrnkntukzzyjlx7iq2iutovr7x2xkz@uvf2bd4o6pxi>
References: <20261012-talos-lyra-evk-v2-v2-0-dcc9316ebb59@oss.qualcomm.com>
 <20261012-talos-lyra-evk-v2-v2-3-dcc9316ebb59@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261012-talos-lyra-evk-v2-v2-3-dcc9316ebb59@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDA0NyBTYWx0ZWRfX73ZMgl4yaS3s
 vFlVzMuIKN8B77MQgGu1lIz/9zqzM5WOmXgo40iaLTX4d1CKEmaiRDt/cnL+Lfc6AfE3ThNO/QW
 T+PwbQ+83ZVQyCnfEMOBtNtCH/Ujp02s68IsFqsvgkw9lmGHa4LqYQUyOkXQuad2rKsCHwhC7EK
 ZYt4ObGdUBWEJg3SDwIMBHKhD9Bh4GK8JUNsxUGSfrvSAUOW1pSprSyv0wUIxhw+Yclhn1ZjikN
 oxot56My33QQMqJcw5vR8Gs9iELHaJPSZYCjdv8YCdrS/XstSVoRSaBeekPqGWHkxGesqzS+Xop
 5/pY5eVWZswlz31dc/eaYtWb707haY0Mhe6mcKojgUKGEPsy9thxiDqFpunpBXoiLZL0KuBPFJZ
 Jm2YfNszVmfu6XrR6pc6u8Att/8uNv41xP214R/xgN1OYRdjWtdCd3PRvShxyBGaSnZF0K83h5d
 UqNHwgEA1VFaUtTspfw==
X-Authority-Analysis: v=2.4 cv=c8U+0h9l c=1 sm=1 tr=0 ts=6acccbb6 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=aoQf5jgNuWhG6f2gEO0A:9 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDA0NyBTYWx0ZWRfX5HHEY+cYZr9a
 5PUuQLAP2uymeqip20l8cQQ4xttZuvcsf9ZPnlboTCn27GgJ6QWo4ue4YqCLwcksQwopKYjxl9l
 hlbNpo6xZHJc3mCxiUcwU6KyOr8Jo20=
X-Proofpoint-ORIG-GUID: Ggda1r8d_PEODP84V9tKT74AVBu-wIXo
X-Proofpoint-GUID: Ggda1r8d_PEODP84V9tKT74AVBu-wIXo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_03,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 priorityscore=1501 spamscore=0 impostorscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120047

On Mon, Oct 12, 2026 at 11:46:28AM +0530, Ruchira Revdekar wrote:
> From: Avaneesh Kumar Dwivedi <avaneesh.dwivedi@oss.qualcomm.com>
> 
> Add the device tree for the Talos Lyra EVK platform which combines
> the Talos Lyra EVK SoM and Lyra carrier board.
> 
> This device tree adds board-specific peripheral configuration on top
> of the SoM, including:
> 
> - Native DisplayPort output
> - GPIO expanders on i2c5
> - SPI-attached TPM (ST33)
> - USB host and peripheral controllers
> - Power and reset keys
> 
> Co-developed-by: Akash Kumar <akakum@qti.qualcomm.com>
> Signed-off-by: Akash Kumar <akakum@qti.qualcomm.com>
> Co-developed-by: Khalid Faisal Ansari <khalid.ansari@oss.qualcomm.com>
> Signed-off-by: Khalid Faisal Ansari <khalid.ansari@oss.qualcomm.com>
> Co-developed-by: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
> Signed-off-by: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
> Co-developed-by: Vishnu Saini <vishsain@qti.qualcomm.com>
> Signed-off-by: Vishnu Saini <vishsain@qti.qualcomm.com>
> Tested-by: Nirmesh Kumar Singh <nirmesh.singh@oss.qualcomm.com>
> Signed-off-by: Avaneesh Kumar Dwivedi <avaneesh.dwivedi@oss.qualcomm.com>
> Signed-off-by: Ruchira Revdekar <ruchira.revdekar@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/Makefile           |   1 +
>  arch/arm64/boot/dts/qcom/talos-lyra-evk.dts | 137 ++++++++++++++++++++++++++++
>  2 files changed, 138 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
> index 88230c4e00ea..2f25575e6efe 100644
> --- a/arch/arm64/boot/dts/qcom/Makefile
> +++ b/arch/arm64/boot/dts/qcom/Makefile
> @@ -456,6 +456,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= sm8650-valve-deckard.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= sm8750-mtp.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= sm8750-qrd.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= talos-evk.dtb
> +dtb-$(CONFIG_ARCH_QCOM)	+= talos-lyra-evk.dtb
>  
>  talos-evk-el2-dtbs	:= talos-evk.dtb talos-el2.dtbo
>  
> diff --git a/arch/arm64/boot/dts/qcom/talos-lyra-evk.dts b/arch/arm64/boot/dts/qcom/talos-lyra-evk.dts
> new file mode 100644
> index 000000000000..cfb563658fe0
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/talos-lyra-evk.dts
> @@ -0,0 +1,137 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +/dts-v1/;
> +
> +#include "talos-lyra-evk-som.dtsi"
> +
> +/ {
> +	model = "Qualcomm Technologies, Inc. QCS615 Talos lyra EVK";

Is it 'lyra' or 'Lyra'?

> +	compatible = "qcom,talos-lyra-evk", "qcom,qcs615", "qcom,sm6150";
> +	chassis-type = "embedded";
> +
> +	dp0-connector {
> +		compatible = "dp-connector";
> +		label = "DP0";
> +		type = "full-size";
> +
> +		hpd-gpios = <&tlmm 104 GPIO_ACTIVE_HIGH>;

Why is it being declared here rather than in the DP controller?
Declaring it here would bypass DP controller state machine.

> +
> +		port {
> +			dp0_connector_in: endpoint {
> +				remote-endpoint = <&mdss_dp0_out>;
> +			};
> +		};
> +	};
> +
> +};
> +

[..]

> +
> +&usb_1 {
> +	dr_mode = "peripheral";

Is it going to only support peripheral mode or is OTG going to be added
later?

> +
> +	status = "okay";
> +};
> +
> +&usb_1_hsphy {
> +	vdd-supply = <&vreg_l5a>;
> +	vdda-pll-supply = <&vreg_l12a>;
> +	vdda-phy-dpdm-supply = <&vreg_l13a>;
> +
> +	status = "okay";
> +};
> +
> +&usb_2 {
> +	dr_mode = "host";

Same question. Is it host-only or will OTG be added later?

Is there a separate VBUS supply if it's the host mode controller?

> +
> +	status = "okay";
> +};
> +

-- 
With best wishes
Dmitry
