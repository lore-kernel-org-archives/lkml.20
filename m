Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792512541;
	b=TfriHInynJZpN3ABULCJ93tX6K1kjCkhkZphw55Lb9YYaL5fNIpcoWhlRN6ciUUwH6f+
	 nzX0uswtRT28+PSrmDv6+uNS9jTAP7aMaXGeq5ezV/RZnqR8EVPsfQc8Q2xrYrpCamlN5
	 L3gYDBMhyC1kwSDKGyGv6IqAjTvJxJs8MVbxTiRDV639uCm1tTgg5xF6YzBKboQcWIHD+
	 rD+ZbeJM9sYBcO8eqAEU5p+FubEqQDnrOFfWpY9WR/49QvXwEGbbh45Ja0jLYs3t6Dgrj
	 OcTQCReVIBfJ79eUdYSlNl+G9N3a0xxNXEUO1l3yRP38mVoLJk/zcUIh1cTahJl0b2g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792512541;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=dGBOooh6yznjMWE+A5X7fdt4uXbCVA3oHqWYs1djhQY=;
	b=Qq7wsrlfiZGVrUSkZxTfuuZUCaPfG8ybne/p/TTMac7wmz3cg/FbZlKzk0oBOfub0StP
	 z+NoKcJF0M3Ka7oFM1HwCOONIfMnGXjmuiFzk+qYLz5NlEScWX9581zQOU4euVeMB3Fzl
	 8W7+HY0IqAzU+Q0gn0wAtX6anUTbL9XmuRLNhOtv7Nz1yzOWmxAHk+OWz/yLuCdjHrYEV
	 uw2w46U4yZxPhiHSrvYmviIH/iwDp7cvB0OThpr+PvvwBUJ3i74ci5sKslVlwexOAoggL
	 TtPuopcIt+6PHrQTeocnsID7/6roMr05ALi+RxUi6YDaiF4FqCXy2rmvQTJ1vf/XfgQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WnI7EJLE;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AhD1ouOq;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACEE4606A322
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 16:09:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ACEE4606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WnI7EJLE;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AhD1ouOq
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69KDAOwA2214704
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 16:08:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dGBOooh6yznjMWE+A5X7fdt4uXbCVA3oHqWYs1djhQY=; b=WnI7EJLEhLpgenKR
	TSc5pJdCe7p7f6C49vSEMAegR4pqJemkIS/5FZ6I7FY7cjN/WsUjUCdmxw1EwY6a
	5ibpygdhlRjIkVOQZfntu789v5VsaNppxtQbJjrUoyDIPtmRbNZJjs8uPTwNNepQ
	ty6/ox738Ul/pUZ1uEd2KNRE99NxdlKMOgQfrmmziMG5Gc6eV58ELGoF9RFrzGtp
	9DVcN8Q1oWpBAYbAo2cI0hBhTZl/234ZtBdsWt0V7cC9S++EPODIyPkf69KxFUFi
	imXGO2yTCqnKyL7SA2WUcNRpMSuVBQK+Z98FkHhUZdrVxya4NecMwHwbnPOUPi6j
	jLNKTg==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5nu82g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 16:08:59 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-7c124d17880so715675137.1
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 09:08:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792512539; x=1793117339; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dGBOooh6yznjMWE+A5X7fdt4uXbCVA3oHqWYs1djhQY=;
        b=AhD1ouOqAyyz/xHSFKdKiise2ee3PssdUrpc99D05Yr9pUYtsHG6m58WDYwl2c7aXr
         qGBE87vGQZE/QFOZVUo5PgnCva/OXnpSIWiVUmzxpKwzI9SdFFXdYs8OFW3ouIkJBSe3
         if/rww19RfqWjKFnH3O/qWLOtPA6V+HB0gTYcLB46phD56X/7p5X7MSyn7oxnHkgGi3f
         ccnp0HQa2rnRdHiTyju5WAsHmTmjgaxk/aXA4VQo5M+Vr15ndV/azzY+H2i1AwcSLjv8
         vJXauOArJFzswj4MLWQkREFA+VXMAGIWWbVDWXr2aSGfP0FK2TNH5CXel7f7+fY+WlyM
         cTXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792512539; x=1793117339;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dGBOooh6yznjMWE+A5X7fdt4uXbCVA3oHqWYs1djhQY=;
        b=RV+heVSeN7UfwCwzZgWlaaPpTF+CqUpmz2/YA/as7X9ouxcwinjTpGYiSLNHJVMwjB
         Lh3vaKJXUEnIsh3D3NT0445JKQRkUFK6zF5/vuy3zOWOfQCYOM3zwGdt0EfEc0Kr/r0Q
         kcAI4yyXWafLFyN5bxK+jIxKpDMv4i2Ep1oKX3C8A038Q98EskEvVj/t2JcRnRYqkPdi
         UFf9wZl9RFG9MaDduoQwq/WWBQYiH9zpembuVG0Wdfnd92GdPjWxHnCiwIlbzMQf68oV
         4YKkLlxDS/i9yBL9C/H/FWpaGK3tNEQalnzjtVenPQ5EuSRu6I2Qh0Snayw+bYV5z6GI
         ZMQg==
X-Forwarded-Encrypted: i=1; AKwUvBxAKx/5TdoUVhX0GaMDtiBQjY202AoIaKzBwfvBXPslZILQc5pzW4jNnzEo49YSX5giFyDMngXjAmS5EWw=@vger.kernel.org
X-Gm-Message-State: AFq9FYI4kVTO4NwITDAcikdo9a9W8VJpkJp7wXZyiH1axsbnm/RbqQ13
	XjHHMC4Tatbm4R5uOlwtP9hcy1rlEd/Tqhs6nK4+2mlKitJuA1oWnRlBwF4BNxNr/IGF72An0Zl
	xZc+1n1EgRlpy2cYOaeCkpfi2vPuvcQsBKN42YnjHlMBwWDtji0vGuBGlqnwHcancXm4=
X-Gm-Gg: AYBFou21mgGvvJt/He5x/GXRQqXkpLf7Gm6tjote3FEqNOaaJbQ6VQU2tro13QO66GH
	wYEbuDqguvADd4A/4lpu4p4wws9IeYQMboUeWnfWguLTJQvKEtYCM5gVBtX0C1PuE5TSlGjRodd
	13xqKHJHBJO5D2CEm0010d5SVHLoFj0z0UIglDmCrx7UdP4tULJ+Dte2vogDarNEYOMZwnPNdYy
	E/bGqdwis2UJU+aKudOM2sNocwoaQ9WJyAGHMUbSJZoIOM50IOAXMejJQEamTxXWpvWt0/Kf+Zk
	NiItJsF8aHQlR/8Tsg28Ijn1P/GO3sMrtypkyZoYzXRcIoRpyRRfBGn6vkbqGNqlMwk2TXhvKkK
	vI61GaDQBDzOYgZrVuJ5WU2aMrUVHR0FE8KqTppIHT9hPqaq+0dggFIx+2is=
X-Received: by 2002:a05:6102:f0c:b0:7cc:26e4:1943 with SMTP id ada2fe7eead31-7cc36acba14mr2586610137.28.1792512538783;
        Tue, 20 Oct 2026 09:08:58 -0700 (PDT)
X-Received: by 2002:a05:6102:f0c:b0:7cc:26e4:1943 with SMTP id ada2fe7eead31-7cc36acba14mr2586602137.28.1792512538216;
        Tue, 20 Oct 2026 09:08:58 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:8d9e:b00d:491:1503? ([2a05:6e02:1041:c10:8d9e:b00d:491:1503])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1fb859326sm7011895e9.10.2026.10.20.09.08.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 09:08:57 -0700 (PDT)
Message-ID: <aca2cd5d-18e1-406d-a062-e219478b243c@oss.qualcomm.com>
Date: Tue, 20 Oct 2026 18:08:56 +0200
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] arm64: dts: qcom: x1e78100-thinkpad-t14s: Add thermal
 zones for PMICs
To: Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, johannes.goede@oss.qualcomm.com,
        conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mark Pearson <mpearson-lenovo@squebb.ca>
References: <20261014193524.5590-1-daniel.lezcano@oss.qualcomm.com>
 <atH0oW5j9pxsTty4@linaro.org>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <atH0oW5j9pxsTty4@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDA2NCBTYWx0ZWRfX7VoBjWpzYVa8
 KiuLpMUKgyiw1uoOvehDe/pQ+3h869v26vGdJRwBwss/FcFXqeCzafr/rLdla8nNA5AuFWEKDah
 Weu5y2QSDNxccW6rCbq/BV+SUKBCt4E=
X-Proofpoint-GUID: EZZk2kMRh0KxQKRWpZjzs9_6HZtf04sM
X-Proofpoint-ORIG-GUID: EZZk2kMRh0KxQKRWpZjzs9_6HZtf04sM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDA2NCBTYWx0ZWRfX4JeDNwu9HbZC
 s68xCUnbMFSMtpZaB38czk+VLOT/O693VG8NdNcUnX8pKlP6F6v4JEp6aWZKSE2YQsXqIBF/S2r
 HJD6b8S0E5HzjaCe/vlZsqfoiGFOI+G/HExF1bMQpxvOg6kRxbL2eKS4f5kK/NWsA2giH7/5bwf
 oyzGGqxttBBVOShOVpoypwYoyxjUqfVEHS6C8FYJAQitOv0t9V+7Q7uaAR3GcD57V293ade7Hb8
 GhCvRsLAgEyWdJlrtf3P8ua/9QjxqYPy0zTBjL1JQhhSEvPm6P0ekraRajlzJhyMQvoEfs4PirD
 H7waBMxmY3woFuhluAxjNW7gGdhtqm0V6e+W9oOHJWcV7zrtlAw5MyD7WtKlcIVnPQiSmZ5pYwL
 9+f0Rml5b2+6C0lGqRF4vg7EirPCHA4V22Y35YzE+MDF7XF7Od5DZIrKDdi+psiqsc0OwHBviIo
 olqkJh3h3AWVa5cQKsA==
X-Authority-Analysis: v=2.4 cv=TcsDJhQh c=1 sm=1 tr=0 ts=6ad7921b cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=yw9hh2pf6h8ebXW9gWMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_02,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 impostorscore=0 suspectscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610200064


Thanks Stephan for the additional information, that's very helpful.

We currently have an urgent thermal issue on this platform, and getting 
this thermal mitigation upstream is important to prevent overheating 
under sustained workloads.

Would it be acceptable to address the sensor naming and description 
improvements in a follow-up patch, so that we can get the thermal 
protection in place first?

Of course, if any of these changes are critical for the correctness of 
the thermal mitigation, we should address them now.



On 10/16/26 11:56, Stephan Gerhold wrote:
> On Wed, Oct 14, 2026 at 09:35:24PM +0200, Daniel Lezcano wrote:
>> Add thermal zones for the ThinkPad T14s and describe the board
>> temperature sensors exposed through the PMK8550 VADC.
>>
>> Add a passive thermal zone for the keyboard area, which is the main
>> thermal constraint under sustained load. The EC reports a thermal alert
>> at 57.85°C, so use this value as the passive trip point and allow the
>> thermal framework to throttle all CPUs and the GPU when the threshold is
>> reached. Use a 1000 m°C hysteresis and a 500 ms passive polling interval.
>>
>> An earlier approach used staged CPU cluster throttling in an attempt to
>> start thermal mitigation before reaching the target temperature. Testing
>> did not show a significant improvement compared to throttling all CPUs at
>> the EC thermal alert threshold. It also introduced a latency imbalance
>> between the different CPU clusters, which could negatively affect
>> workloads depending on where tasks are scheduled.
>>
>> A more optimal solution would require a significantly more complex,
>> system-wide approach, accounting for the workload distribution and the
>> available power and thermal headroom across the CPU clusters and other
>> devices. Such an approach would also require kernel mechanisms which are
>> not currently available. Keep the thermal policy simple here and use a
>> single passive trip, which at least ensures that the system is actively
>> mitigated before reaching temperatures that could ultimately lead to a
>> thermal shutdown.
>>
>> The mitigation temperature is derived from the platform behaviour when
>> using the balanced power profile available under Windows. A separate
>> change will adjust this trip point dynamically according to events
>> reported by the embedded controller. Name the trip
>> "keyboard-ec-alert" so that the EC driver can identify the corresponding
>> trip point in the device tree.
>>
>> Also add a 73°C critical trip to shut the system down if the keyboard
>> temperature reaches an unsafe level.
>>
>> Add a thermal zone for the back cover with a 73°C critical shutdown
>> trip.
>>
>> Describe the SoC, SMB, SDX, east and west board temperature sensors as
>> monitoring-only thermal zones.
>>
>> Thermal camera measurements were also used to compare the reported
>> temperatures with the physical temperature of the chassis. The measured
>> values appear to primarily represent temperatures inside the enclosure
>> rather than the user-contact surface temperature. No unsafe external
>> surface temperature was observed during these tests, although this should
>> not be considered a substitute for formal platform thermal qualification.
>>
> Thanks to Mark, I was able to get some info on the location/purpose of
> the thermal sensors in the T14s. As you noted already here, the sensors
> are primarily focused on specific components inside the enclosure rather
> than user-contact surface temperatures. Below I added some suggestions
> for more accurate names for the thermal zones. Perhaps that helps to
> optimize the thermal control further.
> 
>> Finally, enable ADC thermal monitoring on the corresponding PMK8550 VADC
>> channels used by these thermal zones.
>>
>> Signed-off-by: Daniel Lezcano<daniel.lezcano@oss.qualcomm.com>
>> ---
>>   .../qcom/x1e78100-lenovo-thinkpad-t14s.dtsi   | 105 ++++++++++++++++++
>>   1 file changed, 105 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
>> index 75ad74bcb042..2d0a434d2248 100644
>> --- a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
>> @@ -502,6 +502,81 @@ platform {
>>   			};
>>   		};
>>   	};
>> +
>> +	thermal-zones {
>> +		backcover-thermal {
>> +			critical-action = "shutdown";
>> +			thermal-sensors = <&pmk8550_vadc ADC5_GEN3_AMUX1_THM_100K_PU(1)>;
> dram-thermal or memory-thermal (or maybe keyboard-thermal if you want to
> give it a user-surface name, although that purpose seems to be
> secondary).
> 
> Next to DRAM memory, on the top part of the mainboard, facing upwards to
> the keyboard. Unrelated to the backcover.
> 
>> +
>> +			trips {
>> +				backcover-critical {
>> +					temperature = <73000>;
>> +					hysteresis = <1000>;
>> +					type = "critical";
>> +				};
> Is this critical temperature is appropriate for the DRAM temperature?
> Windows seems to have 115°C here as critical trip point which is maybe a
> bit too high.
> 
>> +			};
>> +		};
>> +
>> +		east-thermal {
>> +			thermal-sensors = <&pmk8550_vadc ADC5_GEN3_AMUX4_THM_100K_PU(1)>;
> gpu-pmic-thermal (next to GPU-related PMICs close to the SoC)
> 
>> +		};
>> +
>> +		keyboard-thermal {
>> +			critical-action = "shutdown";
>> +			polling-delay-passive = <500>;
>> +
>> +			thermal-sensors = <&pmk8550_vadc ADC5_GEN3_AMUX2_GPIO_100K_PU(1)>;
> fan-thermal or heatpipe-thermal (or maybe backcover-thermal if you want
> to give it a user-surface name, although that purpose seems to be
> secondary).
> 
> Next to fan/heat pipe, on the bottom part of the mainboard, facing
> downwards to the back cover. Unrelated to the keyboard.
> 
>> +
>> +			trips {
>> +				keyboard_ec_alert: keyboard-ec-alert {
>> +					temperature = <57850>;
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
>> +					trip = <&keyboard_ec_alert>;
>> +					cooling-device = <&cpu0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
>> +							 <&cpu1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
>> +							 <&cpu2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
>> +							 <&cpu3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
>> +							 <&cpu4 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
>> +							 <&cpu5 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
>> +							 <&cpu6 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
>> +							 <&cpu7 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
>> +							 <&cpu8 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
>> +							 <&cpu9 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
>> +							 <&cpu10 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
>> +							 <&cpu11 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
>> +							 <&gpu THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
>> +				};
>> +			};
>> +		};
>> +
>> +		sdx-thermal {
>> +			thermal-sensors = <&pmk8550_vadc ADC5_GEN3_AMUX3_THM_100K_PU(1)>;
> wwan-thermal
> 
>> +		};
>> +
>> +		smb-thermal {
>> +			thermal-sensors = <&pmk8550_vadc ADC5_GEN3_AMUX2_THM_100K_PU(1)>;
> charger-thermal
> 
>> +		};
>> +
>> +		soc-thermal {
>> +			thermal-sensors = <&pmk8550_vadc ADC5_GEN3_AMUX1_GPIO_100K_PU(1)>;
> cpu-pmic-thermal (next to CPU-related PMICs close to SoC)
> 
>> +		};
>> +
>> +		west-thermal {
>> +			thermal-sensors = <&pmk8550_vadc ADC5_GEN3_AMUX5_THM_100K_PU(1)>;
> typec-thermal or usbc-thermal
> 
> Next to USB-C ports, bottom part of mainboard, facing towards the back
> cover.
> 
>> +		};
>> +	};
> There is also ssd-thermal @ SYS_THERM7
> thermal-sensors = <&pmk8550_adc_tm ADC5_GEN3_AMUX6_THM_100K_PU(1)>;
> as I mentioned before.
> 
> Windows uses the EC sensors for throttling, although given that we don't
> have interrupt support for the EC yet, I think it is fine to initially
> use the PMIC sensors.
> 
> Thanks,
> Stephan
> 

