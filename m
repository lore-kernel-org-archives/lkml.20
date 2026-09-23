Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53BCA41DEC8
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 19:07:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790190457; cv=none; b=Q3CYM2ZSS1r6JgrQCyVMDI8D7XodW5iwfrAjVSpfnGIAPeyMyencc6IU7zCVzHdg0p144xFyDvs/U5TkxOqUzrdDMoG+CZov2jWnRQEF6CsGRQMMYxz8Q9WbItxo/+ZhPue0birUahuQvCLuq1lkNI+0f2a72SJ23K3gxn3QCoU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790190457; c=relaxed/simple;
	bh=bgBQkW636C34wT/vO5zj5Lba7sC9+ggJ84ZQfBjOR8k=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=e9+FUTLTw+rhmMQ2rVFwWrn/Y3m+Q/aocqsffqFmr032Ns++gXmtGFTSb3qkRcKzpzkWd8sSHalFeTJTHNGHppAxehAAUXqFcCd0CjFb0yDo5ZKJZDJVbqyF+mlwL4LwteSjXonRsGj2LtELLSEjtUOr2j+b6eQoeEzTEwGIdJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TOgzguLj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CeYgLrU6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TOgzguLj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CeYgLrU6"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68NGU2sN3106203
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 19:07:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OwnRn6pWChLjIYwevYgOcO87j3c6wAj15+yU78oV+vo=; b=TOgzguLj0rADsKoU
	xiABModFMX9La9kK9DCBwb/fmeL/PBjsxOFVYLKSPGC7blRwJHbcVUhMOJpKJK76
	6KtOBs2E/LJfvd/IZ3Gh8Y+Z0I1Uc64jDsASMyYg2PvicJ//A8LCVa6rT4s/WysR
	7qGDaIGZLLbnxBsDCXkI+HxNdgsnU79cLmXVfMi756hWsoAzNPrdeXJuW8PQiaLm
	28rAtDPGCaTkW+ziP6xkh09wJS8yi+K8AlPvRMDZlu0a8zsU3KEhxICemeuJ1z58
	36rcFs9pSdaSEv6EeEPAqA8mSxSgWdFiJsaNeqj23TtdrhAHXRPyq7KikWhDnRSm
	CuQwcQ==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvfmwhgt9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 19:07:35 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-97cb0a317c4so218932241.1
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 12:07:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790190454; x=1790795254; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=OwnRn6pWChLjIYwevYgOcO87j3c6wAj15+yU78oV+vo=;
        b=CeYgLrU6pNoBxfYjJfTKiRtp1blHvEoiH/0FQbfVghVqxRK8ZdZGsBrqACnsN7SyAL
         rid0xPfbYnHz+RT6y2pf4JNnfbCvmrj0u2kRQKueR+4mugCUpUtOnFlF658uInYfwZyQ
         ZbiJbKmbhrHyd87E/fQaQ9h1PJ9mU1kHqZNST/4vx2dz9y8FV4sFUzZlSO2cguNvtzbd
         ITtYIs2blgPzNxBEntbZ7bAU9rlWR+BBWmLHiHs8/KL0hckZqYjkfQcwbGxQcUohnvXO
         +goJ5BPIZXf1qFQrCyLyAyL5a6lp64GSxhHqOrgOpBRyfAdUBuIrDVgRnf6OeP1JvSaZ
         JJkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790190454; x=1790795254;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OwnRn6pWChLjIYwevYgOcO87j3c6wAj15+yU78oV+vo=;
        b=PlyY6ptjRjlPqWsYCU9+gvzeBmiWmxx74S2OkMzDCQKY7wEUUGD80JYkoE2shM+eXk
         uc72Vfuvnc91hbGemYQ3d7p0s3f8tvZqdRvQnTgTOUrb6Nv1gs5jPpWC2PSpXlmWG4tf
         7eWNGR5E9uxYKwdiG5AXLI/WjTUzh2EetbI2smU4veyT8e3AcZISYWj8QRg+ndt277Be
         JrVBZLLs4rbD4VAkUyda9toMBl+Vo3utOH5clgzQzjGffOjsDcAjuUUe/eo1mvu480Tu
         oNcaZDR7mToR6SUgAwnHC3jPLtb9M5oD4XX1v6WdWtzayK+uGEJqqJ4hKLbiUILUY4lE
         8ewg==
X-Forwarded-Encrypted: i=1; AKwUvByTAtedmc/0EFZFS0oPmiUwIdN2FoK4nS8oCSOzGwATfaQ7P2yimrEvIhwkz+YdGO9TiZMXNAXBVpetY0o=@vger.kernel.org
X-Gm-Message-State: AFuF++k6J0KoXwi2G0lhiZrPA6wlgCQwvCYLayjR/CbHvWz6pwEaVL/1
	TBJCpNcyRrncH298pwg2gIMKZ3sVv9+I85lp8WdPvO3R6n0H5EOVEqixS5qfUlD5d9Pb3ZgaCF4
	OJn9lbOt71SsfTkI53W/lgEaUR/Jfx8VF8NTX7cOI0Zjl6FAol+kYBc3a8/eYtUA1Zk8=
X-Gm-Gg: AYBFou3Cy8n+e1BXClquUAW+H2ArJTp8dKHNy3XhTpql+4SJPFgACmm7Ciy61ixEIbM
	pCdCulGYjGII2mo9q0DbjtQmBa02r199zweJYmIueU5bOkdaFJ9pxXhkOsYKjzitTtvD3UIKWjt
	k0CB4yxTrx8s4+fxQg1YQwdRj+WF7XAeSl2a4jH7A3crgTowpckJud8P/0bluem4wciIqgwih2T
	23PHz+w6YKiNUk454m5S0TwssxvTM4pXv9c3TuBbeqgf5+mOSYr1baPw1Nnrs72QIzrQe6lujES
	l+6vQK6AH3jjQzF6V84QIknklU7SENROOkVA3KRLROY+r5GWqJ79ciSYcDSXxnAE2Y/0SeSxCD2
	DToniKNRCP8ULUYXCJW2ZHJ3GCGomXQSkkvVXZsxAEdzV1WmYHVZ6XHrjOGrbN38YL7RDLn57vJ
	4QyEOrSUm95coU83jnp+ROCOHVsUsOcJLJ2qYmljh4IZTD+dPYE6dwNY00ypn8Wr+4XQ==
X-Received: by 2002:a05:6102:374a:b0:7a7:19aa:f0d7 with SMTP id ada2fe7eead31-7af1f619f06mr125874137.36.1790190453128;
        Wed, 23 Sep 2026 12:07:33 -0700 (PDT)
X-Received: by 2002:a05:6102:374a:b0:7a7:19aa:f0d7 with SMTP id ada2fe7eead31-7af1f619f06mr125833137.36.1790190452443;
        Wed, 23 Sep 2026 12:07:32 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2aae33d7e0sm176805866b.2.2026.09.23.12.07.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Sep 2026 12:07:31 -0700 (PDT)
Message-ID: <339deca4-8b35-4fb2-bc1d-adf471f94d06@oss.qualcomm.com>
Date: Wed, 23 Sep 2026 21:07:30 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: johannes.goede@oss.qualcomm.com
Subject: Re: [PATCH] arm64: dts: qcom: x1e78100-thinkpad-t14s: Add thermal
 zones for PMICs
To: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>, andersson@kernel.org,
        konradybcio@kernel.org, abelvesa@kernel.org
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260922181818.5503-1-daniel.lezcano@oss.qualcomm.com>
Content-Language: en-US, nl
In-Reply-To: <20260922181818.5503-1-daniel.lezcano@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDA3NiBTYWx0ZWRfXx8Hl+LB4Hndf
 CNGlharwA8nrDO0RP/IUFgUimFbsrgC+mygkxfVjalUUjvg2mxHVYsDAixbZV7blH1tm7ClRfK2
 EQizoejWw3pG9SvOllX8ZveF/IpPNgBYovi3N8+1MHEMvsJav59EINYcqJxmOnp1wbCjq0icaTm
 qQSQrGrxrkirihZYUhgB1jwrr1uXEkVGEdaWS8KVjyWpCAKPoIcnxA9msgXSTm6Is4+LOS6+WZG
 pWJDqFKnrpe3tSgOIF5U7RKPguEF/qtKPGrzpXwR2sHhDi+r8wcZnw4n0WBbQtiFSYU4tkwBMnh
 PS248/ak6K4/gWKr/f5mCoG2nVrS8MxbPUwjXzt1na+KFdRtq0eL1WyCsg/YI4g+x8sp77QYa9c
 zAEBDGZFEtGtBhUAUa/vGQncRLgae+BCiVKENaYpt1hd8O4YCvXNIy2T3FLz9Dqh0W9aNpw4dWx
 jL/ipvkJUm3LFteYMGw==
X-Authority-Analysis: v=2.4 cv=WK/qzXsR c=1 sm=1 tr=0 ts=6ab42377 cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=J-UGAI4wwJR_4HVQs5kA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDA3NiBTYWx0ZWRfXxA+dJ8UgWffq
 gzKkFYyFMNzCc+IDWrX0Pf4fGI9i1cz8hJ6lsq0YCDMtetWMiKBm8LnIvxupFR6qgyVZ+kVQdjk
 m50vETUCgsEFJrLpUgK2x9aMkMcYfuo=
X-Proofpoint-ORIG-GUID: p_ZmGSfw8VSkCqWMarTenkRD-2JvJmp5
X-Proofpoint-GUID: p_ZmGSfw8VSkCqWMarTenkRD-2JvJmp5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_06,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 bulkscore=0 suspectscore=0 adultscore=0
 priorityscore=1501 malwarescore=0 lowpriorityscore=0 impostorscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609230076

Hi all,

On 22-Sep-26 20:18, Daniel Lezcano wrote:
> Add the thermal zones for the ThinkPad T14s and describe the board
> temperature sensors exposed through the PMK8550 VADC.
> 
> The keyboard area is the main thermal constraint under sustained CPU
> load. Add a passive thermal zone for it and progressively throttle the
> three CPU groups as the temperature approaches the 53°C limit. The
> groups are activated at 49°C, 51°C and 53°C respectively, with a
> 1000 m°C hysteresis and a 500 ms passive polling interval.
> 
> The cooling maps limit each CPU cooling device to state 6, which
> corresponds to approximately 1.9 GHz. Testing showed that the system can
> sustain the workload with all three CPU clusters capped at this
> frequency while maintaining the expected performance, making it a
> suitable upper cooling state for thermal regulation.
> 
> Several configurations were evaluated while tuning the keyboard zone.
> Using a single 53°C trip for all CPUs allowed the temperature to rise
> quickly but resulted in a stable operating point around 54.3°C, about
> 1.3°C above the intended limit. Introducing staged cooling before the
> target significantly reduced the thermal overshoot. A 49/51/53°C
> configuration kept the steady-state temperature close to 53°C, while a
> later 49.5/51.5/53°C configuration improved the heating response but
> shifted the equilibrium slightly above the target. Based on these
> results, keep the earlier 49/51/53°C staging.
> 
> Also add a passive back-cover thermal zone which uses the GPU as a
> cooling device at 64°C, together with a 73°C critical shutdown trip.
> 
> Describe the remaining SMB, SDX, east and west board temperature
> sensors as monitoring-only thermal zones, and enable ADC thermal
> monitoring on the corresponding PMK8550 VADC channels.
> 
> Signed-off-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
> ---
>  .../qcom/x1e78100-lenovo-thinkpad-t14s.dts    | 142 ++++++++++++++++++
>  1 file changed, 142 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dts b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dts
> index 5cc6a63d1ef6..9407868864ad 100644
> --- a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dts
> +++ b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dts

I just noticed that you're adding the thermal-zones here.

This should go to x1e78100-lenovo-thinkpad-t14s.dtsi note
the extra 'i' at the end, so that the thermal-zones will
also be used on the oled model.

Regards,

Hans




> @@ -10,6 +10,117 @@ / {
>  	compatible = "lenovo,thinkpad-t14s-lcd", "lenovo,thinkpad-t14s",
>  		     "qcom,x1e78100", "qcom,x1e80100";
>  
> +	thermal-zones {
> +		soc-thermal {
> +			thermal-sensors = <&pmk8550_vadc ADC5_GEN3_AMUX1_GPIO_100K_PU(1)>;
> +		};
> +
> +		keyboard-thermal {
> +			critical-action = "shutdown";
> +			polling-delay-passive = <500>;
> +
> +			thermal-sensors = <&pmk8550_vadc ADC5_GEN3_AMUX2_GPIO_100K_PU(1)>;
> +
> +			trips {
> +
> +				keyboard_alert0: trip-point0 {
> +					temperature = <49000>;
> +					hysteresis = <1000>;
> +					type = "passive";
> +				};
> +
> +				keyboard_alert1: trip-point1 {
> +					temperature = <51000>;
> +					hysteresis = <1000>;
> +					type = "passive";
> +				};
> +
> +				keyboard_alert2: trip-point2 {
> +					temperature = <53000>;
> +					hysteresis = <1000>;
> +					type = "passive";
> +				};
> +
> +				keyboard-critical {
> +					temperature = <73000>;
> +					hysteresis = <1000>;
> +					type = "critical";
> +				};
> +			};
> +
> +			cooling-maps {
> +				map0 {
> +					trip = <&keyboard_alert0>;
> +					cooling-device = <&cpu0 THERMAL_NO_LIMIT 6>,
> +							 <&cpu1 THERMAL_NO_LIMIT 6>,
> +							 <&cpu2 THERMAL_NO_LIMIT 6>,
> +							 <&cpu3 THERMAL_NO_LIMIT 6>;
> +				};
> +
> +				map1 {
> +					trip = <&keyboard_alert1>;
> +					cooling-device = <&cpu4 THERMAL_NO_LIMIT 6>,
> +							 <&cpu5 THERMAL_NO_LIMIT 6>,
> +							 <&cpu6 THERMAL_NO_LIMIT 6>,
> +							 <&cpu7 THERMAL_NO_LIMIT 6>;
> +				};
> +
> +				map2 {
> +					trip = <&keyboard_alert2>;
> +					cooling-device = <&cpu8 THERMAL_NO_LIMIT 6>,
> +							 <&cpu9 THERMAL_NO_LIMIT 6>,
> +							 <&cpu10 THERMAL_NO_LIMIT 6>,
> +							 <&cpu11 THERMAL_NO_LIMIT 6>;
> +
> +				};
> +			};
> +		};
> +
> +		backcover-thermal {
> +			critical-action = "shutdown";
> +			polling-delay-passive = <400>;
> +
> +			thermal-sensors = <&pmk8550_vadc ADC5_GEN3_AMUX1_THM_100K_PU(1)>;
> +
> +			trips {
> +				backcover_alert0: trip-point0 {
> +					temperature = <64000>;
> +					hysteresis = <1000>;
> +					type = "passive";
> +				};
> +
> +				backcover-critical {
> +					temperature = <73000>;
> +					hysteresis = <1000>;
> +					type = "critical";
> +				};
> +			};
> +
> +			cooling-maps {
> +				map0 {
> +					trip = <&backcover_alert0>;
> +					cooling-device = <&gpu THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
> +				};
> +			};
> +		};
> +
> +		smb-thermal {
> +			thermal-sensors = <&pmk8550_vadc ADC5_GEN3_AMUX2_THM_100K_PU(1)>;
> +		};
> +
> +		sdx-thermal {
> +			thermal-sensors = <&pmk8550_vadc ADC5_GEN3_AMUX3_THM_100K_PU(1)>;
> +		};
> +
> +		east-thermal {
> +			thermal-sensors = <&pmk8550_vadc ADC5_GEN3_AMUX4_THM_100K_PU(1)>;
> +		};
> +
> +		west-thermal {
> +			thermal-sensors = <&pmk8550_vadc ADC5_GEN3_AMUX5_THM_100K_PU(1)>;
> +		};
> +	};
> +
>  	backlight: backlight {
>  		compatible = "pwm-backlight";
>  		pwms = <&pmk8550_pwm 0 4266537>;
> @@ -35,6 +146,7 @@ vreg_edp_bl: regulator-edp-bl {
>  
>  		regulator-boot-on;
>  	};
> +
>  };
>  
>  &panel {
> @@ -58,3 +170,33 @@ edp_bl_pwm: edp-bl-pwm-state {
>  &pmk8550_pwm {
>  	status = "okay";
>  };
> +
> +&pmk8550_vadc {
> +	channel@144 {
> +		qcom,adc-tm;
> +	};
> +
> +	channel@145 {
> +		qcom,adc-tm;
> +	};
> +
> +	channel@146 {
> +		qcom,adc-tm;
> +	};
> +
> +	channel@147 {
> +		qcom,adc-tm;
> +	};
> +
> +	channel@148 {
> +		qcom,adc-tm;
> +	};
> +
> +	channel@14a {
> +		qcom,adc-tm;
> +	};
> +
> +	channel@14b {
> +		qcom,adc-tm;
> +	};
> +};

