Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793892774;
	b=UngXrkm1q2ifYDupu0ZdSKj/QZvlcq2EFxVvnLcKt/Gog3RXECgM8riWA2Rqwl1vT3RP
	 JzIkNTAVi6/FUbQ/WaC/5QrVRDhqlf7czpYoyikpzkz58X8xeBBuI3xjG+vRcbwfP4t/5
	 7Ucqn7KqLpgYFnv5qQMc2yhQ2/dKjp7AKpMBoRjUno20FklyaBaYyzIfgz/iUTXFGNX/j
	 GnMP99CWPclM2i52oTqTxWcPUQnCSOZ+NfPaAwouCLWs1AskQxA8SCWL87PTe9JvKlN1v
	 U+SwYRHj8+hyvFKGp7/tYT3xbMSuM9yYH1vn1GqIPPRZNI34XLoAN8Wn8KLvwc+F8xA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793892774;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=e3T5k0SQ3pw9Nex+iwov0/iwckU6tdcd+5LX6TaExWs=;
	b=MICHEjnuY4KwfHCV8+xmE6fDm2Ckr1yaLpy3u6fgAwXTsF+m9K2R0UXnRyEFqY0BYNTw
	 RC4wdoWvOuHjUoVvbyqIyfJrH8rx1SYlKxm7aR7UBVqtT+j7ENWF3EN+w1D0YZu8IF5Qn
	 HYR7OLEA7JQ2FGVNTOBK2xk6zJBN0FpG4KEvVBp+1gI7wc9d2NUnd68Ff6vMrNKyGCX6u
	 ykF1/4etSCgm4X2K35C3nYi6asi3medorP/F1ML4A0Oj2/pIQMSl+n3AkaYI/1Hg5jneZ
	 J1BO7es6LGZvadoHwRgkihIY27gMObIu23m3JkX8S9UrNMhcTD5tHbf/tWLEL8TXm2w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="PuL8Pg/J";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cItFvPM6;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 825F3606A32C
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 15:32:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 825F3606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PuL8Pg/J;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cItFvPM6
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A5EQLi91040256
	for <linux-kernel@vger.kernel.org>; Thu, 5 Nov 2026 15:32:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	e3T5k0SQ3pw9Nex+iwov0/iwckU6tdcd+5LX6TaExWs=; b=PuL8Pg/Jtw9+GRpt
	TCefO5vm1ZbG9PwmjWTfHYJH+mZbkZsHTZ8QB5AakK/7hmJOZAVF5hpxKswTOFP8
	2grUk8+dn9DJK48kfOXFXgFnsfeWLFWDBhqNMtZJ5liuGb+tzLlKRnJvmoQZZue3
	+ACIZRTIgBN8vJ/W1AlwtTOEc5exHtyDOubofYGQDTZfXQcQfp2fkLlHi9apKjoC
	b5aZu1scRuHPwStGmoi/ZHmJsWYu61Fu+4Qf4ot60pktfolStT7XRnnPmpVeKoqq
	MMIAD1vRhxDCwBGRiAeWMpK5scOPgwQH2VbOjY/+rhEbXiZOuQwPcImy7++j5uRR
	57EhqQ==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hrmcdaaaq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 15:32:52 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-7cc099197b9so1534370137.2
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 07:32:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793892772; x=1794497572; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=e3T5k0SQ3pw9Nex+iwov0/iwckU6tdcd+5LX6TaExWs=;
        b=cItFvPM6LpfQg3OeFMqZEDAlxsI+fYymc3zR4xY9jJWE9lz9LIOtT2Acu5C7qpJ2p+
         0zz3o/Ut5bpErKb+q8p2v6Sxg5Q5ZJjqYoxa1gZb5cm3vvCANRZrpfJGBBp4cC2S53de
         LTSLs8u4BNSzbdAD++2pWMlua9PNE1uDWGxVye4XVxmTmtQCjASFiiXBuATaBX6uIcaQ
         0vNHjy5/A5aEwKUiCcg4mqTFdnOxcEY379VEE7EaNuS6e1cFEjZv19w7ZcPqEYYTxxO9
         mB3f+Z9ED46JEIjS+GyccBvRBQ2qK/kG8OOpM5JiTZkCM/wWiAdtEP9qbVqQP9x1zjI1
         VKHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793892772; x=1794497572;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=e3T5k0SQ3pw9Nex+iwov0/iwckU6tdcd+5LX6TaExWs=;
        b=IM9lwuEerCj+CVKzD/G1LToN1dboE90JmlFpyRf8Fh8shz0+FmWh0th9viDModql9H
         iA3SdAcBj7cqn2agiaid7/9Y4EwiW+T2snLZhSVjQ2crDdjKStGD9f8Aqr4lbzCvnApS
         DfHxNfS3sBsI6jOtX8PhGKeAFoXHpMkRQOmJxbCFSwCzhmD/hg6Re8YWUE0tZkRdXtc1
         0CzPjogDAvfSDkGb3xAdKoutCjy6SbHKxsTaRA610IS9NOXC38/3GVwxVlbtweySgIlY
         bNykKBHXJNBXld+ib53+mprq0s96+u3iVzzS6I/IisHWBU4Ul+bWztQVf/vzV3Up5D3u
         ZaXA==
X-Forwarded-Encrypted: i=1; AKwUvBwkFc2FbjLBfe9rJHDxel95uKxLQPkVup7iRligBOA+FKJEv8W1CbRpvZJPAAR+hrFuWZ4pReZtuyi5t6g=@vger.kernel.org
X-Gm-Message-State: APuU4Z87P7rgrhcvM8vtJvgKH+THA8hW41QSFA3/M6tiy0/HbaG1cgJw
	bnnwKNZIKro2U9hq6zcVNbUOMLSbo3MN5xrQSysuWLY2eWL0A+++J4BE7CmNBgRSpMwnonet4A5
	zpssQVWnMYbPIQTuciqNTdYctg88qGG50U6TeOM5LlOi9v7jI2cWTwx+FIo53+tidDQ4=
X-Gm-Gg: AYBFou3A0USANi77O3jyvdQ/MD2pJHgb4TNYh25rFhoxil0xUD2HkuOjjELWM59yfVK
	2eawv7BIkO/pFhykmRSf5P9kqoHooHzZd4idXo8e7CuctIliPq6w/SuY0YB/cjpVoLgkME9QkWi
	izZNQD9PNB4Hv4VET0apzwPPknyEEoh1yFslmJ2d7DuhEd75TA7XxbvQwdFYheEuML+knun/Dz9
	N228EWisJ3mQ5jaWi1VYGiINsJp1IiCwtZA+DOiWXTb2o38dMNqC1YlnIJSVN+IlwVKiF1PaauW
	RoMqXkvTmyg5kCdWdfWRfQWRm1O4B97lUeFeviFx8nFAXmAyl6kKJYdfAXcyOWM2fRSiWCRkXpG
	qbAlSfn/MHqwlw4l/ZJI++v8HNvbWMASwOvk1qi/u2ulOu5753uIt5dFc9VUY3yWOYcgbBhYo8y
	0j/eKwP4J8VsmpaErj
X-Received: by 2002:a05:6102:3589:b0:7c3:f36:c7b with SMTP id ada2fe7eead31-7d072c2bafemr10657468137.14.1793892771758;
        Thu, 05 Nov 2026 07:32:51 -0800 (PST)
X-Received: by 2002:a05:6102:3589:b0:7c3:f36:c7b with SMTP id ada2fe7eead31-7d072c2bafemr10657452137.14.1793892771275;
        Thu, 05 Nov 2026 07:32:51 -0800 (PST)
Received: from [192.168.2.1] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48feda203b6sm10594945f8f.48.2026.11.05.07.32.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 07:32:50 -0800 (PST)
Message-ID: <65c4b925-598d-43d8-a6af-ce197d9b5c27@oss.qualcomm.com>
Date: Thu, 5 Nov 2026 16:32:46 +0100
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
Subject: Re: [PATCH] dt-bindings: thermal: Use signed integers for
 coefficients
To: Lukasz Luba <lukasz.luba@arm.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "open list:THERMAL" <linux-pm@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
References: <20261103214357.2700244-1-daniel.lezcano@oss.qualcomm.com>
 <a53ebde3-ca2b-46dc-b4bc-93379b05a1a8@arm.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <a53ebde3-ca2b-46dc-b4bc-93379b05a1a8@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=EOGTQFZC c=1 sm=1 tr=0 ts=6aeca1a4 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=uw/3876vWhRnNVL35W6mqQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=7CQSdrXTAAAA:8 a=8VQtTDxmKkvejqrRUPYA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=crWF4MFLhNY0qMRaF8an:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-GUID: IzV6w-D39c1DRrCHkOmjgzYUbNf7W-8p
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA2MSBTYWx0ZWRfX4JhP6XCSI8SL
 uSh/8PmYVgFjotr4ejllIRuMIQRZ21oR3C2DKWvDKOkKsAm2p0+P8h/6s8/oXM+1iVdRjHrS5Nq
 uar7On08F/erhV9tQvnu5FNndoEbGc8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA2MSBTYWx0ZWRfX7AwW3V7Mj6Af
 znCGCBaekXg81lOu5d49O85fhG/uvE+/2MQAx5T8g8x60qgL80unnN9BmFbB+KvEej1k4XCaL82
 hy7I9CrEIL9ZO7Nf8ehpByDTcbFPVZ0m/GewzNtf2G4xqYleI7+Fkl8jhIwqahA5UvNos7oQZm4
 gk0WpojYsKwoPg+tSJjlMynAsVdH1+J+6O/o03pJ6yDrVr6w2uhhug4Yb24bOw/VB2HMVMxnC7D
 VfmLhn0nMK6EY27Vww+MCqSXfqZ3AzrlSpv1M9hcK7yvgoPKUR4f+zTqx1R6rp8NZI+RQ0ogTXk
 rOB0fvKxc8qu6/RItu6PWGl/KDTNGv7+EV7JcED/dOPHnldGWdNNLKCBfzUIWC2DcqFxrPd6l/5
 I+gj2SsPjStbp+sc+8IgEYR8xmWr8aerBBqS3troqRdjPo0GMnyinrxtR0z8UMsRyDTgQ/Ld5wU
 4pyPC99MdPprDmKCHSg==
X-Proofpoint-ORIG-GUID: IzV6w-D39c1DRrCHkOmjgzYUbNf7W-8p
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_04,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 suspectscore=0 bulkscore=0 phishscore=0
 priorityscore=1501 impostorscore=0 malwarescore=0 spamscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611050061


Hi Lukasz,

On 11/5/26 11:45, Lukasz Luba wrote:
> Hi Daniel,
> 
> On 11/3/26 21:43, Daniel Lezcano wrote:
>> The coefficients property describes the coefficients of a linear
>> equation used to derive a thermal zone temperature. Both the slope
>> and the constant offset can be negative, and the thermal core stores
>> them as signed integers.
>>
>> Existing Device Trees already rely on signed values. OMAP4460 uses
>> an offset of -9301, while OMAP5 uses offsets of -1791 and -2992.
>> Broadcom platforms also use negative slopes. Declaring the property
>> as uint32-array does not represent these values correctly.
> 
> This looks like a good argument which was missed back then (that
> the negative values are possible).
> 
>>
>> Change the property type to int32-array so schema validation decodes
>> the cells as signed 32-bit integers, matching their intended meaning
>> and the thermal implementation. The cell width and binary encoding
>> remain unchanged, preserving compatibility with existing Device
>> Trees.
>>
>> Fixes: 1202a442a31f ("dt-bindings: thermal: Add yaml bindings for 
>> thermal zones")
>> Signed-off-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
>> ---
>>   Documentation/devicetree/bindings/thermal/thermal-zones.yaml | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/Documentation/devicetree/bindings/thermal/thermal- 
>> zones.yaml b/Documentation/devicetree/bindings/thermal/thermal-zones.yaml
>> index 999ad40a20d5..72e419124f98 100644
>> --- a/Documentation/devicetree/bindings/thermal/thermal-zones.yaml
>> +++ b/Documentation/devicetree/bindings/thermal/thermal-zones.yaml
>> @@ -101,7 +101,7 @@ patternProperties:
>>             thermal zone.
>>         coefficients:
>> -        $ref: /schemas/types.yaml#/definitions/uint32-array
>> +        $ref: /schemas/types.yaml#/definitions/int32-array
>>           description:
>>             An array of integers containing the coefficients of a 
>> linear equation
>>             that binds all the sensors listed in this thermal zone.
> 
> Reviewed-by: Lukasz Luba <lukasz.luba@arm.com>
Thanks for the review
