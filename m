Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE3B2606A334
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 13:39:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Be6NBfr9;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NVZCD/mu
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69MDFx2g3937101
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 13:39:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Iorya9CJVmbbeV06oongNxWV99dGCu9hixBeNSCACWI=; b=Be6NBfr9WxHlkwvF
	6nOUpLIAC3TICYgkTGSPqkQGmc9FrbjdwwbEoeyHY4x0F4/oPnHenlt1Ed9kc2Hu
	jhAiWVqtYm+bO4j5UPJaLOWq8OAL80XWTnv8l0j7n+APsNAuw1Gkh9KD61DwQQN+
	lOQzfqTo3WkpCSZsUjiNGvviNfyK4OYpTTxyAN9bqw4SU3yMczekcce5hfcfyR/3
	+3HeutSj7kN9AKcFVnLGpCtK9O+FkzZxnnw93IbTFBDw6Zpzd4dbv+fdIzqdqsza
	wNQARzANHSc0UN5oOnySx9p1vBNM/MU/XOqmgSq1rDh5xrXo4IsghUysItnogfRS
	szIYNA==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf93aus3e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 13:39:53 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-30bcb065bfdso3048210eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 06:39:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792676393; x=1793281193; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Iorya9CJVmbbeV06oongNxWV99dGCu9hixBeNSCACWI=;
        b=NVZCD/muE0lO60jqUZKKgtOyvNnOmvIHPHMpENRJ9MFesMq5HIM4e7aaNAT5m8FlzB
         i8wMySKrS2V1v+n2mOUtgeUXgG3yEMnnUhoFE+FfHwcoNN0z1jEdATXO9a0S3HrRwiSt
         VEbN1A3V6NoSGJnjw6H4XSL8SqEiddkKq04tOdpFtt5jlUu7eneVaGHxabIGUZJhIdXQ
         VGlIJdqcs1xzOyMXRH+T4oeUF4Kwb7OcvrBUCiimnxiSHCrbohwmAfKc9V7b19lB676b
         ThWpPSYgamnOap4DplpqCj5dU4P6USpYroA1Iw6Douqxuc7WR3xRE46EXop7F4YjyjF0
         VQSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792676393; x=1793281193;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Iorya9CJVmbbeV06oongNxWV99dGCu9hixBeNSCACWI=;
        b=F84nwwnfUwIDxeeReZPrjPGyjywqgBdegfAWr6lM0Ck5mFRjcwf+3sy9ljUcmiL45G
         BeS/kcLAsWMoHEd+PJrgwgwgUOcKVeuBRfK5zIAEQ1AkPrNtXfRMFqndpuduc9tnznqp
         BD5UPuwR5SZgCM3+GXFI4zrna0Scddrv+ZDji8fmg3uTZK6rcGptwKsUW3Cx6ozOF7jd
         2iAIzFON2k51CvlPoQcfB8MXU7Oq9YKX1v/jDjhaHuZFJU/7DCM2zF9KvPnwBw99jNI8
         oOqQQbLlZQPZ3WkkK1NfgKgp3Fbmo4Rc5AX16GHrHaAP3MIK9OgyQZNpdB61TbY/f9ls
         GVRQ==
X-Forwarded-Encrypted: i=1; AKwUvBw/5sw4Z5mRt6gOHtwLCd6sK4V4xnLNr1g0ytRfngKzUSE93CCdklExt6Jf3V7Z5rYa1ZeJbAmRoLAQyLc=@vger.kernel.org
X-Gm-Message-State: AFq9FYKFhQs/q9jYz6nM/lTQmH+7mZHbUHRX2g7lgt4KOaKdDsGe5VgT
	kcq0eDF+L4JDTFLulClWb0JwoF1YUlglGfeKBX7K4HvZ4c3g/zlnoRrIYiCKKx+3Og5WRBHwmrf
	Dn7Z0CQMy8xhVcJqSFx29AZXKGVOaVt5+MvT59V1KfTks6BH+DsGiscHGX2ADJWEP0b4=
X-Gm-Gg: AYBFou3K0C62dHtXSP+MkJAmAMHNPb1chhrP1nAmAuKKm/cy+lzmFDIATLtZrL/eEgz
	pRiilkgL58lhn8ewRJOi8kKLMfHXP4B7MUnF87mYNw3xK6Z7f89b0Jx7MQqbmy6mKPDHh7+3hsn
	gYSIweCcVbui9u/RuvY2x35td03nLTkQ5cP5UvAQgN1crVM+EKglmWSvf0DppDssibGNqKOiz2W
	/nnbANxD4yFn2chXMUUk3xuVs177VMwJm5pKh5e0o0t07rYyHCQbeI8tysArd95eUIljhzCNHKy
	fhQP4uTcJvCZtXOreCakgXx+dHvQ87kzvNnFkwU9f451ZiaUr3zYhLW++Kc6bP+AegXcYYKpTjl
	lYCRFM9D9y6YaNgy4Q5Q0UoaU7HSodw==
X-Received: by 2002:a05:693c:87d3:20b0:369:7c:bfce with SMTP id 5a478bee46e88-369008c220fmr2325121eec.14.1792676392900;
        Thu, 22 Oct 2026 06:39:52 -0700 (PDT)
X-Received: by 2002:a05:693c:87d3:20b0:369:7c:bfce with SMTP id 5a478bee46e88-369008c220fmr2325059eec.14.1792676392215;
        Thu, 22 Oct 2026 06:39:52 -0700 (PDT)
Received: from [192.168.1.9] ([106.222.235.141])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-367416a1fb9sm14556522eec.20.2026.10.22.06.39.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Oct 2026 06:39:50 -0700 (PDT)
Message-ID: <f83c366e-e3fe-4921-8407-ffa90b7f933f@oss.qualcomm.com>
Date: Thu, 22 Oct 2026 19:09:42 +0530
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
Subject: Re: [PATCH 5/6] arm64: dts: qcom: kodiak: use thermal hw-bin trips
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Randy Dunlap
 <rdunlap@infradead.org>,
        Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Amit Kucheria <amit.kucheria@oss.qualcomm.com>
References: <20261002-thermal_bin-v1-0-5a29be7e8ec5@oss.qualcomm.com>
 <20261002-thermal_bin-v1-5-5a29be7e8ec5@oss.qualcomm.com>
 <9800eb77-0188-4b16-a672-adb7ee1a603c@oss.qualcomm.com>
Content-Language: en-US
From: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
In-Reply-To: <9800eb77-0188-4b16-a672-adb7ee1a603c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDA1NCBTYWx0ZWRfXwrmGC54N0iNm
 Ch+/ld0V4Vn4P5I/tGogJYO0hQPwJ1GIGncYTBkA1JmpQG9d4gl3OSZaSqF4c9g2PiDn8jNgE11
 y/tu3jZItj9jQAITLbqrw8g0zTZBruq8RMHZZa9m+j6ZDD1I6Er69bNKHiUfDZjqpGe9hzSXMjD
 AYRyGCQyTKQNIGoSfcJNCnQ5awCpd+jz+A3pXGfV48wZpKympTe01AuhUJSJPyQcYA/olj51ggn
 ETXx/8bPKdUYVOYa7HKC7adHt4PCX81ZFZrl0uAV89VOPpT+AYcpcIqbdlFwW4HUFW/jifs1wNm
 ElUCdxrkBr6eAyHFQbCv/C62hxXIDYDilqSSHS/iV6z9gizmhMuqHu+9FKMX1odUlTk4PFFx0c+
 4fem0ktVrt7QJwj5TlZ4L0ZySLlVbA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDA1NCBTYWx0ZWRfX/Rx0zBx6511w
 NM4BVHHhVdnQOT9Je8AwwUpZ0UmP0wOVYeAjHmNhhcyRZFQ3gt/BPvrBY5H+Cae5eB442479dLE
 fScBUpAVmIJcyD7fgYa0ua4Vboci78E=
X-Authority-Analysis: v=2.4 cv=QPn91QLL c=1 sm=1 tr=0 ts=6ada1229 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=8wa5AUNoahJ04lRaSfAPWg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=2wNLjvyEnIyB1ESV7yEA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-GUID: CUT09fuIbBlmqwPnMdr4uLDdqNLPBbzm
X-Proofpoint-ORIG-GUID: CUT09fuIbBlmqwPnMdr4uLDdqNLPBbzm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0
 phishscore=0 malwarescore=0 classifier=typeunknown authscore=0 authtc=
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2610190000 definitions=main-2610220054



On 10/22/2026 2:39 PM, Konrad Dybcio wrote:
> On 10/2/26 12:47 PM, Gaurav Kohli wrote:
>> From: Amit Kucheria <amit.kucheria@oss.qualcomm.com>
>>
>> kodiak-based SoCs are binned at manufacturing time, with the bin
>> computed from the jtag-id and feat-id qfprom fuses.  The tsens driver
>> now reads these and feeds the resulting bin to the thermal core, which
>> selects per-bin trip temperatures.
>>
>> Add the jtag-id and feat-id nvmem cells to the tsens nodes and convert
>> the passive mitigation trip points from a fixed 95C to per-bin values
>> (95C for bin 0x1, 105C for bin 0x2) using the new
>> temperature-bin/thermal-hw-bin properties.
>>
>> Signed-off-by: Amit Kucheria <amit.kucheria@oss.qualcomm.com>
>> Co-developed-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
>> Signed-off-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
>> ---
>>   arch/arm64/boot/dts/qcom/kodiak.dtsi | 56 +++++++++++++++++++++++++++---------
>>   1 file changed, 42 insertions(+), 14 deletions(-)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/kodiak.dtsi b/arch/arm64/boot/dts/qcom/kodiak.dtsi
>> index 347815e5983e..f3bb9cd8f393 100644
>> --- a/arch/arm64/boot/dts/qcom/kodiak.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/kodiak.dtsi
>> @@ -1019,6 +1019,16 @@ gpu_speed_bin: gpu-speed-bin@1e9 {
>>   				reg = <0x1e9 0x2>;
>>   				bits = <5 8>;
>>   			};
>> +			jtag_id: jtag-id@180 {
>> +				reg = <0x180 0x4>;
>> +				/* bits = <offset width>: 20 bits at offset 0 */
>> +				bits = <0 20>;
>> +			};
>> +			feat_id: feat-id@180 {
>> +				reg = <0x180 0x4>;
>> +				/* bits = <offset width>: 8 bits at offset 20 */
>> +				bits = <20 8>;
>> +			};
> 
> Couple nits: please keep a \n between each subnode

thanks for review, will fix this in v2.

> 
> 
> [...]
> 
>>   				cpu0_alert1: trip-point1 {
>> -					temperature = <95000>;
>> +					temperature-bin = <95000 105000>;
> 
> Please do <foo>, <bar> instead of <foo bar>

Sure, will update.

> 
> Konrad

