Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E12704CC29C
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 14:16:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791987417; cv=none; b=JnaI/Wsp96ROvr7zGiIGrTYjDuOwYMiHPX4ogHoM+kF5PdjffRG3wfSJO/LAMHFAvkTk3Agq017PrZDiVNnAJvuTezwS3kitQ92htD3SEWKdTebjdG3AZ7MldS9gkueb7a97rL6FsdmjyPar9DxSWjI2UmVbAuIoQ4psVlBxFIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791987417; c=relaxed/simple;
	bh=bgHFfuc6EdWx8rSax2do4tdHnzY0R4ikfH/Rh1vNpvQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BoHEwXcOmRZUf6F8ykhQC37J+zZNndKpRJHQQ0bQfMQ4SrEnqYBHo+2euUI5jCpPvCw4pZKIdQdmheMT93NPiZScdPk2fGfOweP43MxqgzzplGDMd6pqD5AC9S9l7Sj5hm+yvWt9JnzyTdtWJ4DvnoqDoeu+o6luBipbGOD8e9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jbunqgzc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Fntt/EY+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jbunqgzc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Fntt/EY+"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69EBIGsK3365999
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 14:16:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	c23MFofHP0klFIrGtzPvfehmbgdnuZ+gVK4BzbRbTsM=; b=jbunqgzc2+ZMmLGg
	qrJcujJBn4ImqbJeT7hSI5C+Wr2JE+nO3OoEothkkYkrghXs4apP/kczkvCoFrdC
	0LVtX6j5mOU8dBHIDrbiuKY0eMeBq0aTaF2BPTRAKzWcRjYiInvllL3tU+4aKelr
	D4P4QWoyyyllQEkrQ9IcAoC+KfPAbkZp186EGQ5AmtkjuVKIOVwjG52iVO6LbVzO
	uVJBfCcgWbA+bBAFyX8L/oUefCG8jSrtlM0ry0VA7V3pTjVYVSzFqWrRDrMai3re
	lpu0RjuJhhE26iQbsR/aZI2ts7JjS2z/yRF/C1bdfHDkBdsnP2WphcQ8T10TySge
	mGL3lw==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ha4621ymx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 14:16:54 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5e8078ac577so1244025e0c.3
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 07:16:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791987414; x=1792592214; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=c23MFofHP0klFIrGtzPvfehmbgdnuZ+gVK4BzbRbTsM=;
        b=Fntt/EY+D8wEERH72rC0V3QLwhLjn1vWCqDwOPT6n/BGYYUWFYxG45BEsDJtkKyIXJ
         UNvhuMVs5tnCqg8EHb88xbhy1tQvHWTZMwTmY/Y8d4Pn1ooZrVlsINAoku5gZcWhfNWu
         yyXFzts7PR/F65gAXygnLAIYm58GIsOyZ1QUxapXcf6OqAqIHefEwe2TYyBd+WvnENaw
         xqCiCf3BUAD0+//Z0N/uAIvmHkUcvKMi8FdgY/8s+kgs4FlerXGmN2wRxTtMu0KoXizu
         A5cmdkPrZrdf6UVA3a5w8TZr2XDAuX091qXx0t414Pw8seABnRo1GEbrfTUGIoc4pQdX
         2+vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791987414; x=1792592214;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=c23MFofHP0klFIrGtzPvfehmbgdnuZ+gVK4BzbRbTsM=;
        b=Yibw4vIbwbnbPUvfTReRpzKrENQQPxTCKTqBA0cq71KUVabqQvNSpjJXBNknpfLEm9
         HPbzNiAcLWeRJUnjWMI4wcmaFFZh5xDMO46gE9ic+a4IYTwZbtnku4I6l79JlQNrWVO/
         IphVq1IFGzp+Iz5JydBfOKULQwK5tiqNmVVajRK6Hd+umKwEf1kEKcfQaOC3qKy7Z0q7
         Ki6MBKWdOgdAphab3m1Q3dddnTf5kPjZiNO1WQl/NdW3POF9F2VsWq9u3SOXsyljG+Jr
         pf7fBl1ct58WfRGAHVdWRugElGJ/YBk15CHJ2NrrB6IR4hTg6tvOmMhwr6naysIg5R9K
         yglA==
X-Forwarded-Encrypted: i=1; AKwUvBw6d9eSY/4kW/m5XbmMW2OkUuKMxDkNYx6t1qdDYqS2yhGJezBbfRxkxWKggwh5S1TDZNg04xvxYscri/g=@vger.kernel.org
X-Gm-Message-State: AFq9FYLL/2I8kI47+of3W2sl4pvzSEG1NAfiJFX6DMYCwEZVggqQ/LaH
	umQ87zla2hqKGLick4WQ7SbLN/s+wKJOB4E/ynH3f8z/1oc7kxPnQkyJhC2P2hGeX0RT72MzN/2
	dNBOOVuyrgsLh4dRuf64xGVRM5ijhfL3vQOaOmH1DaEk97MOc1yWEiy73+Wal/ho07Qk=
X-Gm-Gg: AYBFou0hd1bHjMaorU02h7r7FnW4qmB8XMcQR0yYBfR3MwUlLJn8MrijRlIOFZa/P3F
	OhKrwFGyI61Cz73i/82oxDNgZlf6kfIErLsZKwEy/tVpK31P6sOP+/egzfpcCl1DzIhnouTuyOO
	56uaCNnfyQnYkx18Y/3Qe/iL+VOmrXN+plj+bjOM+p7OykIyYnSCv/y+P4y/9nQEoWC2bEkmVbj
	tAH63IqsYCK7jib8KuOcHjVAUurfGCyrdJtc12Epj724qGxHumcD2IFbhEyttBy2q9BA1eVyugC
	PzqKdFVL+KRutgqCLK6kRhxCN/aOuso65ALFO7IPB+A7eWn7YL5RkYbId7pOT/rJ7qqmSh6STcy
	2UpbXdMtKyjFxsdUslYVs4z89H0jZIdnIPFkruNQ8luJKxq1SJcm+eC0Ym1aqnPTTojfTnBJU21
	hFVv+GHnLbywcoKB7kqQE2pyp03IpHXw+ufefevXFBgB8v6IC8euHujnLY1raKlLJDY5s=
X-Received: by 2002:a05:6122:9001:b0:5ce:d56f:efac with SMTP id 71dfb90a1353d-5e91f54fab5mr5102243e0c.21.1791987413841;
        Wed, 14 Oct 2026 07:16:53 -0700 (PDT)
X-Received: by 2002:a05:6122:9001:b0:5ce:d56f:efac with SMTP id 71dfb90a1353d-5e91f54fab5mr5102224e0c.21.1791987413320;
        Wed, 14 Oct 2026 07:16:53 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c31a9ae46f0sm721182966b.79.2026.10.14.07.16.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Oct 2026 07:16:52 -0700 (PDT)
Message-ID: <46ba46c8-c84e-44d9-8729-9298867b19fd@oss.qualcomm.com>
Date: Wed, 14 Oct 2026 16:16:51 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: qcom: x1e78100-thinkpad-t14s: Add thermal
 zones for PMICs
To: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>, andersson@kernel.org,
        konradybcio@kernel.org
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, stephan.gerhold@linaro.org
References: <20261001181055.9149-1-daniel.lezcano@oss.qualcomm.com>
From: Hans de Goede <johannes.goede@oss.qualcomm.com>
Content-Language: en-US, nl
In-Reply-To: <20261001181055.9149-1-daniel.lezcano@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: m3fE4wqJy0coDemSe8Gbbw19icQwFmf-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDA1NiBTYWx0ZWRfX+3LDWadufhOH
 Z/6sUzoe3sH5nkonrYH/ORpMHVBfsVOHzJSOk6rAen3wJVupxKgPguPaTAtzq+D5ta2IZWT3yqc
 Zofk9GWOTG5X/We44rcBaODW6M/VtOpZZ6Yhi518Yi9Gl7sHLfS7uJ8as3EPg8U6tdcYM/6ztcz
 C3HjBs/Fwv06XSqS2DlTnedxwg9CrfzjT16kE9dppxsYE0MoxA2Vkh1WeEPdihNr1iu2VS72IKJ
 das0KpTMPLlpQh8SYtkv7ErTUbVMFb/DSUY3/jgQ9PRcx/wNCk5Y/bCsGX2WMSwszQg4aF8b4Do
 kkdVtdzrlz2qatmLtdk1p8EHftqG6fdfxEm3DvLvt/ztN1YUrxTItKqVxUuAD/XylW3nDkTrfEF
 6iERY3SnQj00z0i4QcwG2D8qUCTRhplccxh+svqdNDsvfMpU+WY7BIUGpnf7upBgQw6kAO95O9q
 9KoBBpbFWeYMeJJ8nNA==
X-Authority-Analysis: v=2.4 cv=ErZHPicA c=1 sm=1 tr=0 ts=6acf8ed6 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=ISy6eMC9JirD1J4fssoA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDA1NiBTYWx0ZWRfX9xAwfjC7RTQ1
 wYm9eH6BBcSJrAsSbgbZqSYVrNrXoQZK0TusOM0hBUumn8LIChQGHxWxPVqM8BCikaSRICvPG4p
 oVs7zlVJhqsmjKVyXWYpbvF0+mNoN0g=
X-Proofpoint-GUID: m3fE4wqJy0coDemSe8Gbbw19icQwFmf-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 bulkscore=0 impostorscore=0 adultscore=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 priorityscore=1501
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610140056

Hi,

On 1-Oct-26 20:10, Daniel Lezcano wrote:
> Add thermal zones for the ThinkPad T14s and describe the board
> temperature sensors exposed through the PMK8550 VADC.
> 
> Add a passive thermal zone for the keyboard area, which is the main
> thermal constraint under sustained load. The EC reports a thermal alert
> at 57.85°C, so use this value as the passive trip point and allow the
> thermal framework to throttle all CPUs and the GPU when the threshold is
> reached. Use a 1000 m°C hysteresis and a 500 ms passive polling interval.
> 
> An earlier approach used staged CPU cluster throttling in an attempt to
> start thermal mitigation before reaching the target temperature. Testing
> did not show a significant improvement compared to throttling all CPUs at
> the EC thermal alert threshold. It also introduced a latency imbalance
> between the different CPU clusters, which could negatively affect
> workloads depending on where tasks are scheduled.
> 
> A more optimal solution would require a significantly more complex,
> system-wide approach, accounting for the workload distribution and the
> available power and thermal headroom across the CPU clusters and other
> devices. Such an approach would also require kernel mechanisms which are
> not currently available. Keep the thermal policy simple here and use a
> single passive trip, which at least ensures that the system is actively
> mitigated before reaching temperatures that could ultimately lead to a
> thermal shutdown.
> 
> The mitigation temperature is derived from the platform behaviour when
> using the balanced power profile available under Windows. A separate
> change will adjust this trip point dynamically according to events
> reported by the embedded controller. Name the trip
> "keyboard-ec-alert" so that the EC driver can identify the corresponding
> trip point in the device tree.
> 
> Also add a 73°C critical trip to shut the system down if the keyboard
> temperature reaches an unsafe level.
> 
> Add a thermal zone for the back cover with a 73°C critical shutdown
> trip.
> 
> Describe the SoC, SMB, SDX, east and west board temperature sensors as
> monitoring-only thermal zones.
> 
> Thermal camera measurements were also used to compare the reported
> temperatures with the physical temperature of the chassis. The measured
> values appear to primarily represent temperatures inside the enclosure
> rather than the user-contact surface temperature. No unsafe external
> surface temperature was observed during these tests, although this should
> not be considered a substitute for formal platform thermal qualification.
> 
> Finally, enable ADC thermal monitoring on the corresponding PMK8550 VADC
> channels used by these thermal zones.
> 
> Signed-off-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>

Thank you for your work in this.

> ---
>  .../qcom/x1e78100-lenovo-thinkpad-t14s.dtsi   | 105 ++++++++++++++++++
>  1 file changed, 105 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
> index 75ad74bcb042..5d3a0a5ead68 100644
> --- a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
> +++ b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
> @@ -20,6 +20,81 @@ / {
>  	compatible = "lenovo,thinkpad-t14s", "qcom,x1e78100", "qcom,x1e80100";
>  	chassis-type = "laptop";
>  
> +	thermal-zones {

I believe all nodes should be shorted by label, then name which is why
the first node before this was "wcd938x: audio-codec" since "audio-codec"
starts with an a.

So this should be at the end of the global nodes.


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
> +				keyboard_ec_alert: keyboard-ec-alert {
> +					temperature = <57850>;
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
> +					trip = <&keyboard_ec_alert>;
> +					cooling-device = <&cpu0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +							 <&cpu1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +							 <&cpu2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +							 <&cpu3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +							 <&cpu4 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +							 <&cpu5 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +							 <&cpu6 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +							 <&cpu7 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +							 <&cpu8 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +							 <&cpu9 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +							 <&cpu10 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +							 <&cpu11 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +							 <&gpu THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
> +				};
> +			};
> +		};
> +
> +		backcover-thermal {
> +			critical-action = "shutdown";
> +			thermal-sensors = <&pmk8550_vadc ADC5_GEN3_AMUX1_THM_100K_PU(1)>;
> +
> +			trips {
> +				backcover-critical {
> +					temperature = <73000>;
> +					hysteresis = <1000>;
> +					type = "critical";
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
>  	wcd938x: audio-codec {
>  		compatible = "qcom,wcd9385-codec";
>  
> @@ -1612,6 +1687,36 @@ wwan_sw_en: wwan-sw-en-state {
>  	};
>  };
>  
> +&pmk8550_vadc {

Idem, referenced existing nodes should also be sorted
alphabetically, so this should be the first node after
the existing &pmc8380_5_gpios reference.

Regards,

Hans



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
> +
>  &usb_1_ss0_hsphy {
>  	vdd-supply = <&vreg_l3j_0p8>;
>  	vdda12-supply = <&vreg_l2j_1p2>;

