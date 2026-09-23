Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5257A415F3B
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 19:43:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790192616; cv=none; b=hJBXh52eyBENs9WDozPcheJ0Mp/40u1hjMMypri6+YcEE9Od8JIlqcjmEOprqgXCUGkoHCr5Fx0P87+VHlfyrJkJEuDTzpPm+xrLZIGyaXOjgRoI31XEKcfPJ2NDfUCf6sw0ybMIqa7Ox/Y2/pjSJQ8ueygemVKHdonD0qDJJqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790192616; c=relaxed/simple;
	bh=wWKQuvyubDHU/IrhFMArkBmNX23h+O7QmsVELBq/Zqo=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=qDcI/JTfVHmLASZXUSBJ0NXdeeb6WgSRnDYwQINJu1aEd2nKAhK/JKdaB1VjtE+7i1imu3/CZgm5nA4J7Roixh8fvtEZ+eIu8J5M8LEdXHtWbwjmAvbplDqqTfV87rcqF4Ibr8gyhtKd6IN72C0/Bed7UDwNEHtnho4k3y5+UZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kpynfH6Y; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IWq4I4yW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kpynfH6Y";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IWq4I4yW"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68NGTp5j063762
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 19:43:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9tcK25AN87gEvJkSzvkoezzruWqFJIqdKKxQJr08+SQ=; b=kpynfH6YJ06P3Zj9
	8te25+csNfOqZozEPdNX3QqGDI21WuQjsukQ2nGWBIbw9KF5JkJwgN9UWNKDf+2Y
	bMx3bYF9ww/SW6xGsfbjgMC4fNN2RtCT6PQ3liPmwwGqZzDqG9W/5IBmUFSl3lSE
	SB/KbRMUuYnpLUrUcqn4gUUvBr8XZfxK8iFSFITSISfGiNxKIFSngAlhFJnZMdD7
	7cBOckrFe5wAjKw1fAMfHi5shKrdW53r4i8yFLGrdup17D73BD7x1ZPPUuDyL6na
	RZsgo0BSaiMUacNmLFLYc8CkAsUDBwBusSOB1g2gpNuC2jtluUI5QvXjc6okHgBA
	3foE5Q==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvfkbhmr0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 19:43:33 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-97e99615e0dso184785241.1
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 12:43:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790192613; x=1790797413; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=9tcK25AN87gEvJkSzvkoezzruWqFJIqdKKxQJr08+SQ=;
        b=IWq4I4yW/VOxRzKa4tB8miDmy6c0eO5Tui9SnA5n2+TX/D+zRNeDWiViQUnj/04rEW
         ek5RRbNvmn9TPNbyZOFyopjq7Z2LO1Ed1jM0y7Z1b03CO558waVa4S49mikZbYWrKVwj
         crBYBDZmmyRU+cGvHaUZWn7YBtTUdqnGUEAk9Hpwz+Pt/kLq6B1M4LlcXiKtP9fpCuu1
         /Rvl6DHEHkrmPGkpovG44Dsd96mwKmuA5THGPx9rsQ6LMP5FlQBGG1LcVzTW7mcZkKo0
         5Ml2EpPag0WhJ3pa6DdndYCegbKkAEMpb46dKJpyF44X67pAGgNnP1tgAUpf5Q0PmGxE
         bgyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790192613; x=1790797413;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9tcK25AN87gEvJkSzvkoezzruWqFJIqdKKxQJr08+SQ=;
        b=FDcisjQHHzlkh/XdLhf6LjGwxht00YkIAB4nZSSDVcROnHqU47NftXVir24szAOq+d
         ij+t5L8OHxPXB2c/FvNaWLWPtYVZ4rvihp06lgAqV9jeSbswcDIM0geoH8zIs/mIVcHy
         AfzkCWC70W8AUPxR7xPpYg8doSOHVvoVGTGntkNKCHY+ZpFQoqxFNGXKESOd+Qz7HtYg
         JbB8RSpWlcEAxGKZ6FzkdZm0uqGfIKaxCggpERafdmFByvBWak5HQD2W1h+rg4buqmn/
         VQ2lZ2hjoAISc+Z78ZkePALNtugEug+pIz9+5MfCLJwZWDozuuw6Nm4sGkr3CKjanKvf
         /nsg==
X-Forwarded-Encrypted: i=1; AKwUvBwQIAU1xZwi0Z27kXK9orH6+jar2w3ObrDcWhLpSi7AuktllJm6RKpoW3faocczaKjzgceBho7DzQP6Elg=@vger.kernel.org
X-Gm-Message-State: AFuF++l4czX2y959mvo0IWmtrlxJs1d8E5eCfZEVHifN15bL2ctleby4
	1wwa0+RR7UzPMvRPHQTnfmJ8XV5eYCoJBWkrtYeNYUk5NgFPu8q8Ekl3TI0L5nvF3SaNDSGBl5U
	bLPcv/UBOX0naGh7X0HOxY+9xNBS2/UusBIkh56IkJIlNTfakhrVMVk1Bchsn3Czp1Hg=
X-Gm-Gg: AYBFou3G94KsVtuozw3toGdrPPUdlvXqKYYzeswL/aoE9j2liigiRkX64pEOghJBdMq
	rvkDjwWMBhYPKDO/RKjP5bHdckQvGEcTMhD+DxpQ7/Dt+GuwKOImu4zBLcUyShanTvIIr8wDRvD
	C9d5B6V346l6BLpF/ICa+nFAPT8fA5KLR5n8EOp7w9vJv4MSGwr9f1pWtkeTYAAYA9yd9raBgPS
	Lqva6djTtFod0UgI6EHbJ1JV/KeQ9UE5ruGfrr43t3Q2O9ntyfuoDu//Wos8V+9Qi3DhEQVubq2
	R5NjCzEpYewUzRhbaz0M6oKjXJvVN4sjl+F4EKW6ijsLXixGXCG/vDcht8eohUNWHo8oHexNZqN
	GMEIMGeHh0NG6FFe5lO97qYL5LE7DKWe+2D6cVynKwiVuEQi9LC9h8pYtcO3JUvz5agUwKu+0+8
	NsEonMoVSVFPwJYTit6zarQAsEj6qkiUzuLjl5y6QMAPejLZ/57zFQhPjQtJsfI+XLXN0=
X-Received: by 2002:a05:6102:83ce:10b0:7a1:f2b5:6465 with SMTP id ada2fe7eead31-7af1f40bbddmr147530137.34.1790192613074;
        Wed, 23 Sep 2026 12:43:33 -0700 (PDT)
X-Received: by 2002:a05:6102:83ce:10b0:7a1:f2b5:6465 with SMTP id ada2fe7eead31-7af1f40bbddmr147521137.34.1790192612673;
        Wed, 23 Sep 2026 12:43:32 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6aab38a8fadsm2311498a12.24.2026.09.23.12.43.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Sep 2026 12:43:30 -0700 (PDT)
Message-ID: <067c2405-575d-44bb-8301-9c8dbd00febe@oss.qualcomm.com>
Date: Wed, 23 Sep 2026 21:43:28 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: x1e78100-thinkpad-t14s: Add thermal
 zones for PMICs
From: Hans de Goede <johannes.goede@oss.qualcomm.com>
To: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>, andersson@kernel.org,
        konradybcio@kernel.org, abelvesa@kernel.org
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260922181818.5503-1-daniel.lezcano@oss.qualcomm.com>
 <339deca4-8b35-4fb2-bc1d-adf471f94d06@oss.qualcomm.com>
Content-Language: en-US, nl
In-Reply-To: <339deca4-8b35-4fb2-bc1d-adf471f94d06@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDA3OCBTYWx0ZWRfXxhOf0a678bgW
 5824Q0UvjT6lIidIUbYYKXfTWuXGhDpMWmK7eqqD5Jh2RZ8TzNtl71QUdKcfQqBRjk1bmwlLD1P
 8tb0bZJ4QD7ctWKH1fjLRC/Nzv4IsJM=
X-Proofpoint-GUID: qd539FmB5138nWM_3pwgv8Di-P5nJ29V
X-Authority-Analysis: v=2.4 cv=RYMFmFtv c=1 sm=1 tr=0 ts=6ab42be5 cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=3JiuneIwTK63PGPfPcMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDA3OCBTYWx0ZWRfX2C2/EJ0/Jroa
 I1P5l0h8j7f5WhKefH5jWnj3BdUbakgOezYe82JrkH7iKoyweo7Er7h6+9pEHTDYRNa5cgz29Uw
 ALUnSD3kY1Q67CNkym8i8R2bPWdjfGdMuwOzaBpvT20n+kbljZDvRUsz5Bc4Td7ggt+GqLx7Kcb
 3nqgivdscnocP3CzltMrHWVHr0SDOntUJSAGEZKH/7qcR4o0Y4CbWix2+Moj1uIwAf4R/4HJ/6H
 xdYQV1nf5iPmHbIx8tcd60gU80D0vu+kr6//19TkpVIFESeChNUKmfxJ5Q1gghNvivlum8zxM/N
 GowK+UAAY7G8hsgBcUL08M5nNREWruwT6id3iwJwRuqdFhdXePxi739K7fT49QD8V4Vpkx8y20L
 pNwaFLb+veCc0vQNdcai1Ja4oqCG7qp5b0l60csI32wqAZg7532S8ZBwsVGtUaljuoZNyPD0MRf
 zThLfg+u9auGFKcyCCw==
X-Proofpoint-ORIG-GUID: qd539FmB5138nWM_3pwgv8Di-P5nJ29V
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_06,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 adultscore=0 impostorscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230078

Hi all,

On 23-Sep-26 21:07, johannes.goede@oss.qualcomm.com wrote:
> Hi all,
> 
> On 22-Sep-26 20:18, Daniel Lezcano wrote:
>> Add the thermal zones for the ThinkPad T14s and describe the board
>> temperature sensors exposed through the PMK8550 VADC.
>>
>> The keyboard area is the main thermal constraint under sustained CPU
>> load. Add a passive thermal zone for it and progressively throttle the
>> three CPU groups as the temperature approaches the 53°C limit. The
>> groups are activated at 49°C, 51°C and 53°C respectively, with a
>> 1000 m°C hysteresis and a 500 ms passive polling interval.
>>
>> The cooling maps limit each CPU cooling device to state 6, which
>> corresponds to approximately 1.9 GHz. Testing showed that the system can
>> sustain the workload with all three CPU clusters capped at this
>> frequency while maintaining the expected performance, making it a
>> suitable upper cooling state for thermal regulation.
>>
>> Several configurations were evaluated while tuning the keyboard zone.
>> Using a single 53°C trip for all CPUs allowed the temperature to rise
>> quickly but resulted in a stable operating point around 54.3°C, about
>> 1.3°C above the intended limit. Introducing staged cooling before the
>> target significantly reduced the thermal overshoot. A 49/51/53°C
>> configuration kept the steady-state temperature close to 53°C, while a
>> later 49.5/51.5/53°C configuration improved the heating response but
>> shifted the equilibrium slightly above the target. Based on these
>> results, keep the earlier 49/51/53°C staging.
>>
>> Also add a passive back-cover thermal zone which uses the GPU as a
>> cooling device at 64°C, together with a 73°C critical shutdown trip.
>>
>> Describe the remaining SMB, SDX, east and west board temperature
>> sensors as monitoring-only thermal zones, and enable ADC thermal
>> monitoring on the corresponding PMK8550 VADC channels.
>>
>> Signed-off-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
>> ---
>>  .../qcom/x1e78100-lenovo-thinkpad-t14s.dts    | 142 ++++++++++++++++++
>>  1 file changed, 142 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dts b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dts
>> index 5cc6a63d1ef6..9407868864ad 100644
>> --- a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dts
>> +++ b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dts
> 
> I just noticed that you're adding the thermal-zones here.
> 
> This should go to x1e78100-lenovo-thinkpad-t14s.dtsi note
> the extra 'i' at the end, so that the thermal-zones will
> also be used on the oled model.

And when building with this patch I get a bunch of DTC warnings
that the pmk8550_vadc node is missing a:

	#thermal-sensor-cells = <1>;

line.

Interestingly enough this line is there in pmk8550.dtsi and
parts of hamoa-pmics.dtsi seems to just be duplication of
pmk8550.dtsi, which we really should fix.

Regards,
 
Hans




>> @@ -10,6 +10,117 @@ / {
>>  	compatible = "lenovo,thinkpad-t14s-lcd", "lenovo,thinkpad-t14s",
>>  		     "qcom,x1e78100", "qcom,x1e80100";
>>  
>> +	thermal-zones {
>> +		soc-thermal {
>> +			thermal-sensors = <&pmk8550_vadc ADC5_GEN3_AMUX1_GPIO_100K_PU(1)>;
>> +		};
>> +
>> +		keyboard-thermal {
>> +			critical-action = "shutdown";
>> +			polling-delay-passive = <500>;
>> +
>> +			thermal-sensors = <&pmk8550_vadc ADC5_GEN3_AMUX2_GPIO_100K_PU(1)>;
>> +
>> +			trips {
>> +
>> +				keyboard_alert0: trip-point0 {
>> +					temperature = <49000>;
>> +					hysteresis = <1000>;
>> +					type = "passive";
>> +				};
>> +
>> +				keyboard_alert1: trip-point1 {
>> +					temperature = <51000>;
>> +					hysteresis = <1000>;
>> +					type = "passive";
>> +				};
>> +
>> +				keyboard_alert2: trip-point2 {
>> +					temperature = <53000>;
>> +					hysteresis = <1000>;
>> +					type = "passive";
>> +				};
>> +
>> +				keyboard-critical {
>> +					temperature = <73000>;
>> +					hysteresis = <1000>;
>> +					type = "critical";
>> +				};
>> +			};
>> +
>> +			cooling-maps {
>> +				map0 {
>> +					trip = <&keyboard_alert0>;
>> +					cooling-device = <&cpu0 THERMAL_NO_LIMIT 6>,
>> +							 <&cpu1 THERMAL_NO_LIMIT 6>,
>> +							 <&cpu2 THERMAL_NO_LIMIT 6>,
>> +							 <&cpu3 THERMAL_NO_LIMIT 6>;
>> +				};
>> +
>> +				map1 {
>> +					trip = <&keyboard_alert1>;
>> +					cooling-device = <&cpu4 THERMAL_NO_LIMIT 6>,
>> +							 <&cpu5 THERMAL_NO_LIMIT 6>,
>> +							 <&cpu6 THERMAL_NO_LIMIT 6>,
>> +							 <&cpu7 THERMAL_NO_LIMIT 6>;
>> +				};
>> +
>> +				map2 {
>> +					trip = <&keyboard_alert2>;
>> +					cooling-device = <&cpu8 THERMAL_NO_LIMIT 6>,
>> +							 <&cpu9 THERMAL_NO_LIMIT 6>,
>> +							 <&cpu10 THERMAL_NO_LIMIT 6>,
>> +							 <&cpu11 THERMAL_NO_LIMIT 6>;
>> +
>> +				};
>> +			};
>> +		};
>> +
>> +		backcover-thermal {
>> +			critical-action = "shutdown";
>> +			polling-delay-passive = <400>;
>> +
>> +			thermal-sensors = <&pmk8550_vadc ADC5_GEN3_AMUX1_THM_100K_PU(1)>;
>> +
>> +			trips {
>> +				backcover_alert0: trip-point0 {
>> +					temperature = <64000>;
>> +					hysteresis = <1000>;
>> +					type = "passive";
>> +				};
>> +
>> +				backcover-critical {
>> +					temperature = <73000>;
>> +					hysteresis = <1000>;
>> +					type = "critical";
>> +				};
>> +			};
>> +
>> +			cooling-maps {
>> +				map0 {
>> +					trip = <&backcover_alert0>;
>> +					cooling-device = <&gpu THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
>> +				};
>> +			};
>> +		};
>> +
>> +		smb-thermal {
>> +			thermal-sensors = <&pmk8550_vadc ADC5_GEN3_AMUX2_THM_100K_PU(1)>;
>> +		};
>> +
>> +		sdx-thermal {
>> +			thermal-sensors = <&pmk8550_vadc ADC5_GEN3_AMUX3_THM_100K_PU(1)>;
>> +		};
>> +
>> +		east-thermal {
>> +			thermal-sensors = <&pmk8550_vadc ADC5_GEN3_AMUX4_THM_100K_PU(1)>;
>> +		};
>> +
>> +		west-thermal {
>> +			thermal-sensors = <&pmk8550_vadc ADC5_GEN3_AMUX5_THM_100K_PU(1)>;
>> +		};
>> +	};
>> +
>>  	backlight: backlight {
>>  		compatible = "pwm-backlight";
>>  		pwms = <&pmk8550_pwm 0 4266537>;
>> @@ -35,6 +146,7 @@ vreg_edp_bl: regulator-edp-bl {
>>  
>>  		regulator-boot-on;
>>  	};
>> +
>>  };
>>  
>>  &panel {
>> @@ -58,3 +170,33 @@ edp_bl_pwm: edp-bl-pwm-state {
>>  &pmk8550_pwm {
>>  	status = "okay";
>>  };
>> +
>> +&pmk8550_vadc {
>> +	channel@144 {
>> +		qcom,adc-tm;
>> +	};
>> +
>> +	channel@145 {
>> +		qcom,adc-tm;
>> +	};
>> +
>> +	channel@146 {
>> +		qcom,adc-tm;
>> +	};
>> +
>> +	channel@147 {
>> +		qcom,adc-tm;
>> +	};
>> +
>> +	channel@148 {
>> +		qcom,adc-tm;
>> +	};
>> +
>> +	channel@14a {
>> +		qcom,adc-tm;
>> +	};
>> +
>> +	channel@14b {
>> +		qcom,adc-tm;
>> +	};
>> +};
> 

