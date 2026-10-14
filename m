Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 217CC329E79
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 19:36:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792006608; cv=none; b=R3U3gUShJ4Fm6FHEPvbn/sAbcPZZSzOYgKIm1zhUlLIEPT+AppH+GtNXFIiNZ4EdicEm0bAseiMez9Qtg7jjee7g4eYMPAQgThzcc1WEyBlaifMjPa6bmtugZLliiup9O9oPgTiQnX8v1NSKpxB70lMLDsM+F63srQriiZwuN/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792006608; c=relaxed/simple;
	bh=i4sGmaUsQrWPzzh+NGsLESOuKrZv5hjj573ejtUNhck=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=TGEPi5yLyJJVCf42Yy03yCYZ+ntVHWewWWIvHpfl17dgFrBChg9D/bm6KasojdX9Mb+B6n5EYusaXhTHAaMm+lxOtdXsCxWtoUQZBDud8Pyyz/Me5oyO3Y6xMzCqYqOacrQ/0AG2x/4ft+Pdykgasi41hvgXzHRFQZ7rcap/Akw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=idUWt3b5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VauncNtw; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="idUWt3b5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VauncNtw"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69EFpb1P1672259
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 19:36:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Y1gZTQEx9ycgZaHgljZp4WD4sCW1ofNgSifstnE3H7Y=; b=idUWt3b54amvU0C2
	8gKcHOk4cbT0fV3ZRCIyyRpw8A8wc8aFVJIZpifrVyTVHGgp3xxZtYtiPXPGcilF
	MWL0fQsSUAt1Tesf+tIVR0WqqETV2gl08/UQGTfevpSvzcwMZ+2gElPShcqTQytu
	8iUQUJCf8W0Z0MfgvrCAKYaYxBRYY7T91oTMktVZPUpIgnRlWVTMxKFbjniCCo9B
	k2K0cgtEOJ9tF72Qv6IA9CdvpqAKL/8Vn6lEJgcRUFtUDAOp/x+QgTd2/VSZOwNY
	HF+Jt81MI9RhLwHDZM1l+SaiFVIWlfnYYKyYd2P8Vs6lUAc1YQW136X0iRru3aoZ
	R+dJsQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hacrh8usw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 19:36:46 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-91b7e7d5f56so78122846d6.3
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 12:36:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792006605; x=1792611405; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Y1gZTQEx9ycgZaHgljZp4WD4sCW1ofNgSifstnE3H7Y=;
        b=VauncNtw+ItDvA4G3uxHRMc0Ef5k6L7DUue9H+tvKQOq2A7nS/nRkfDiO4OSoCvpdH
         gRyfyDoXtJQu4jP//lVgZzPwq1eZoDyJek36ngJ1kdFibnAwv5jLB7egxbAZyOveDroS
         ZSQg4WajU1VzQgFGaQiiEw2hS4r1zDKCL9/ZrLtVKoL64SjJohTLLnkaGsMj+bEejfsQ
         SOJI5Mj8NjMkS2Tx+nVsG1/DTv8zCopk/Bc0uV1cX07wveop2UCzYJ3rXITprLCV5jV0
         76bPtCeezbUPMYbLXBIyk3UFoIcnNatZzE0r9a5aXAi/djtzd4D0twUb+UY3Z/qMDa9y
         T51w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792006605; x=1792611405;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Y1gZTQEx9ycgZaHgljZp4WD4sCW1ofNgSifstnE3H7Y=;
        b=P+Pd5MlIi7Kz+0gSEu5LYhHQvsTMwdRKNpQjsRYnKqrKOaZ4YzfBv4Cj8ZCyMnuMCS
         WnrLFVUieqQl/UO/Dlwy1BSzVWGvjQYP/XT1kdw1HEqAlulW5wRlEjpBkSTIYS31ytSi
         0ThyIOCBn9w50fc+zwZRm86qV4xyEOXtt0Yz8341qj0gPEC3olITsiP8J9dYD6Xyr8Tu
         dpjNT78/MLS2TtSvmrhAsF3ZBh9R0l7S/6z+c1lk+Sh5xLxcL0G2jeR8SOdgpvp4N6Cg
         GgPEJ4gpqJrij+DG7t/CbHiaxrXuMWhRfAyM4zztNy+ITN+e3d+KZtRMBlhO/dkoIPN8
         cNgw==
X-Forwarded-Encrypted: i=1; AKwUvBx/yocxOPmiMzlqq7EsMgITgIYmLyp6l7snN/SCm1OgxpS1uobKTwsXk4RUN5fQn1C1rLkq4vlfWUqwkyA=@vger.kernel.org
X-Gm-Message-State: AFq9FYLCchY14wEmEYPpiWmMb+CluESzYcwBdMJ29rtgNJZBAYR1AcqS
	H4cIXHdiqs/FNtRXfmyebq/1YgMKpC0ynMsQeHFOTHuxVmAFBGvPfHx2nT8wByo5WTnuLA5Kb0L
	SqzxtcHzYtJ6qgHsuRHTMEtI8P8V3vOpcp78hxEGuiL9sPjYohpTD6dvRaq6jL6R0YGk=
X-Gm-Gg: AYBFou1OqMi/bvCvLQpWJR4DhUvNM+n/eFZGmm8OIaPDOkfMyy1mG5gnIElrzbpJkoC
	t+nchiCxhqIpg3SyDG9dv5s/hoOgee8y5P02TyMo2gDjAgQc93KM+x6NPFqqjXZtwmqbLgRs3d9
	TcpLH1qSQ44jMHvT2EXgp1Ij2u9h8DFFsgMUglqtUWO1HBgM9eQwKsSZyFCHunAcJFUqS5DwVZa
	ou7OpYXlCWFQg6adt8sEVqKQjyLBuhQtGsep0oSHMZ8J2Ilcl6mNYm9uXx6TX7fEt/S1feLL8VF
	KGS/i4vqrWNCu+3Yw7mDPHRRpuetYgz/Sn1s7Vq54HUE3R0zLRtNKz3vlZtGoaB9L9UTqucSkEZ
	S28p/LZLdAmWna+0=
X-Received: by 2002:a05:6214:4984:b0:91b:9496:6a18 with SMTP id 6a1803df08f44-91b949670aamr134233996d6.37.1792006605153;
        Wed, 14 Oct 2026 12:36:45 -0700 (PDT)
X-Received: by 2002:a05:6214:4984:b0:91b:9496:6a18 with SMTP id 6a1803df08f44-91b949670aamr134233566d6.37.1792006604636;
        Wed, 14 Oct 2026 12:36:44 -0700 (PDT)
Received: from [10.100.0.2] ([187.14.53.100])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91b97b3a310sm60429976d6.16.2026.10.14.12.36.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Oct 2026 12:36:44 -0700 (PDT)
Message-ID: <205907ce-69b9-48e0-b585-6100e35a8c22@oss.qualcomm.com>
Date: Wed, 14 Oct 2026 21:36:41 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: johannes.goede@oss.qualcomm.com
Subject: Re: [PATCH v3] arm64: dts: qcom: x1e78100-thinkpad-t14s: Add thermal
 zones for PMICs
To: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>, andersson@kernel.org,
        konradybcio@kernel.org
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        stephan.gerhold@linaro.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261014193524.5590-1-daniel.lezcano@oss.qualcomm.com>
Content-Language: en-US, nl
In-Reply-To: <20261014193524.5590-1-daniel.lezcano@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: zOWaw3BLTlbZuxsV895wPpof0zCX_5ju
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDA3OCBTYWx0ZWRfX3QWSFr9DLFnC
 m4AOlaJwm70XH7/lfdlFM4Xqcmxp2ePLJexuWMV38fOStlV4LN7+xGdcCfdQbObKJRlSiUMuLPS
 1eRcxnyAGp6VYSzos8ZNRSWY2LSzNJo=
X-Proofpoint-GUID: zOWaw3BLTlbZuxsV895wPpof0zCX_5ju
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDA3OCBTYWx0ZWRfXwfGZ0MnRrfqo
 BI1urE60o3snFpPd20tsURhxvm7S7Kpxl7Lu2Q7k1UdgLqLFWOjRYbOWbyhyOjKrjsawKUIedct
 xqQt9XhQTypTrpv8Q97UIYBg2hxQnh6GGiLjP7isGxOX6DLEy2MEe7zz/ugFVYBEvp9/2hCbwAp
 Ba1erwdR5Qv8w1zmhUNIfJuaHx+VzRCvAxVV2yFaUBTPI5FqRiGoO8Cv04R4rOGVLGTe8usAzWa
 0GUHZqSqowjyqpV4sjJLGgNtNMkvQWbnCI5PY35On9yP6CUIz7pcB2IvjgnLKaF6i2sXNHB5xOb
 En5b4KnwBaliizRTfeLgoG+Dyi2dauYTB06Dl6Ceo+qiwFIg2BxANSpiPWegUNUhU5p0nwPm+iY
 yjNK6l05Q1njVyu5pT3X+gB0T9WF+prPoyTgzTCLQaBwj/by91eidTMu4UBwyXJ9d3xGOlooT0A
 IhbZX7sZD3sFXkRCs1w==
X-Authority-Analysis: v=2.4 cv=SYZi5fRu c=1 sm=1 tr=0 ts=6acfd9ce cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=nR5e2CNZUcRYUIBrilOkzg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=ISy6eMC9JirD1J4fssoA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 phishscore=0 suspectscore=0 clxscore=1015
 spamscore=0 lowpriorityscore=0 impostorscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610140078

Hi,

On 14-Oct-26 21:35, Daniel Lezcano wrote:
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

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <johannes.goede@oss.qualcomm.com>

Regards,

Hans



> ---
>  .../qcom/x1e78100-lenovo-thinkpad-t14s.dtsi   | 105 ++++++++++++++++++
>  1 file changed, 105 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
> index 75ad74bcb042..2d0a434d2248 100644
> --- a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
> +++ b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
> @@ -502,6 +502,81 @@ platform {
>  			};
>  		};
>  	};
> +
> +	thermal-zones {
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
> +		east-thermal {
> +			thermal-sensors = <&pmk8550_vadc ADC5_GEN3_AMUX4_THM_100K_PU(1)>;
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
> +		sdx-thermal {
> +			thermal-sensors = <&pmk8550_vadc ADC5_GEN3_AMUX3_THM_100K_PU(1)>;
> +		};
> +
> +		smb-thermal {
> +			thermal-sensors = <&pmk8550_vadc ADC5_GEN3_AMUX2_THM_100K_PU(1)>;
> +		};
> +
> +		soc-thermal {
> +			thermal-sensors = <&pmk8550_vadc ADC5_GEN3_AMUX1_GPIO_100K_PU(1)>;
> +		};
> +
> +		west-thermal {
> +			thermal-sensors = <&pmk8550_vadc ADC5_GEN3_AMUX5_THM_100K_PU(1)>;
> +		};
> +	};
>  };
>  
>  &apps_rsc {
> @@ -1285,6 +1360,36 @@ usb0_pwr_1p15_reg_en: usb0-pwr-1p15-reg-en-state {
>  	};
>  };
>  
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
> +
>  &qupv3_0 {
>  	status = "okay";
>  };

