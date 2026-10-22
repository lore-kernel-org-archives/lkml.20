Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792688331;
	b=iXhdhzND1YrfoobbPdo/lEjMN5WV7MfDndvg84E2e1AxpGUoEWLcyZLUAKy4sLS2C23n
	 A1oOGwjhCMb2ctxYGIHiJCq7CxrvG/F9nNtFAD+9HXqWbrqm263p/ll/9DZcjW6NzDWCc
	 1t7rbCPABZz/Tqg3rPf0WCsvCDWj892jU0SSd5wt6eSwglaoBwv+eW9tAzybHF3rwJtNP
	 +R4pJ5pV/dl5kHw7TSxD6JzVS1ZpN0hcab2PtwLBXKjrLlxhwpHugmkfjVmLDXRtkywiA
	 iVkOVf59+QP5bd3h4xrRAwGdoDEuvOwQ+p352vpR1RLofXAYA69UvZuGA02CjbseX3g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792688331;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=YiVig7SZ1LCNZalTMVQzyQL7vcBxu71OJRi/ySqVcbQ=;
	b=ol/nLejrg+4pFenpqi8HzoEUhRv2jrcPICJ7bNcx857K90/lxVgonIZxH59wdK/0bVYP
	 wEQp02xttP4BncuwD2w8MowLBbaYUWCHx3EgPqjVrNNOdUkKHzAO5ok6d7mILSiA98PjL
	 fwHL1nSjFFQPA6K+5jfqKxoMgIxrGBrSiXkX4HyqEqz4HGshw1RidP6nGOPE5P0QN7lKb
	 xRF/LZHKIMfNEXyDEhEsahgteK+DLflKODqn9d8CBwPOhkJWUy05Fq4THc1coJpr43mJV
	 KU4P+WNVAI05aYZxqqxRR37g6n6Ta1DU0HLI1AasyHvIIkn3j1uFf6yZsPcOFgi0sVg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=temperror header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=oPekVx9R;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XEhpsg7u;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70978606A327
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 16:58:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 70978606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=temperror header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=oPekVx9R;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XEhpsg7u
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69MG5PLh618692
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 16:58:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YiVig7SZ1LCNZalTMVQzyQL7vcBxu71OJRi/ySqVcbQ=; b=oPekVx9RGSzP/DJp
	MDeMyhK0kCG6i33rSJvwbiRJjIor+XfdtHbiVekJs93q5ZK7FoNUZtFVp6Y7MNFs
	GpNi+zhS2iTBb7e1wDsF7OxKEzEGlOXmmJTX+elyf54iXrTDEetlWZ24yFi76daL
	WaFTdBfXSR89kLQOuVF29gmGO4FUthClfbGXs2UJqPavCQUOGhs5P8YZZ9JXqUzu
	blJ0o+XbDCQNJT3AcxN4L402/px/xo8+SzEqW8wGHN4tfYxIyqsBHorNT88rtXei
	N39FOfhp4WY3KZupB1qIpt1++4/uqLGg/BKDAD5+P5v2Exf7Jj9MKkTc8aVX/nmQ
	oivbHg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfnq0g6sg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 16:58:50 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3ac0ae43900so55303a91.0
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 09:58:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792688329; x=1793293129; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YiVig7SZ1LCNZalTMVQzyQL7vcBxu71OJRi/ySqVcbQ=;
        b=XEhpsg7uGs/gqr46TilqqFBGotDw3kqAddhZ1LNB3BqjA9pgPpUhG2MOlMIDjHfwRe
         TiJIxosKMYylaFg4e8+oFEuf4TKqT/J20yqpZOgILvlphRHRshz8D60U3Iw6Nn+Lcrro
         tM4u4CSx58rCVV3V3ZKapXeBcHyXfsJb157oBs62LCOSoEhLPIQIv4FKKc4FRTaklHcL
         deRi0fmEazaQIEn22UOHzC9KtoQERunH3bQsF7DI1Li2JM80VjJPOHoXaVmZPce4X8Me
         IWkyL6hXjkDskQEBjRQNUsHsopCsAYe1OHBxZtJHM7mTBSX/s+HuiErnOOpp3Cn53zJo
         RoFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792688329; x=1793293129;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YiVig7SZ1LCNZalTMVQzyQL7vcBxu71OJRi/ySqVcbQ=;
        b=zlTq/cBJZ3epMIEEiblT/rEjT3caJB4qvUr0OjDjnOzFyzt5731hrVYyODK71fL+eo
         MPcpyRxibCYzFap7nrB7wOYHgEDwOllMjpRp9sWXvFbfbE74nECA1nWyvkjLeq0ZhN6y
         xTDTOCfN/ZlBIWVZNGyHzVbAMcpNUcN0wx1WQreRVecjSnfWAjZGzEVo84IGjbMER996
         +3/lS2/00eoRRtjd45O9IzCdj7ybQBxqt1eVEISAa804251xg1PusCggxdqEfcB+yh5g
         62MWlBmnoJP1r73zXoauD9JpbrQlfatp0CH0O3joxE9rhSUX2fRxhpzHwq317cLSdNFQ
         Qh0g==
X-Forwarded-Encrypted: i=1; AKwUvBwhuotUMNyePg3Drd2OeAlmbhTOMOsZ3mExQ033JphUd17qwxeuyuxPX3otezwm+zVsuEq6qTK7pMUTLRQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYKcWDjG6KX08+q9JoKoewAaarSZf97+WdqHGeSzD1/wmeL4Bdhq
	JBfSMZ2f6qrqjs8lneEPSQuw7Yy2hcl7uuyJ7jdYnTXCD5WiMtkzE0ouM/YFxkMUD9wLdx8dBPr
	xgVEFAL+EKQJ86RHGrLjihZMTng8dUZB0nm1UJk042p6AyubvlO+/YaabT3A9FWCcIB2vxXV6S7
	o=
X-Gm-Gg: AYBFou09SER9geoee7lgYfygLRv9wDVhDNbeSbXAKLI23V80OcaGBFrRf7QVl1D2q8Y
	BVTy73gW3STrc09HBVrO+fl2WzXZ7dHjS826MBWKmh5UDYUO9qWG/yhRyTRP2U5TWn+PuclBk+4
	gZbIsa8HeJqhmBvAQeFVNDSo8MQChwicBhqiFI7f3St3nKlh10tO0iOPqSo+17Vm+DixrAiDQc0
	mVJCBE2255ueQzXywaXcEJ8UDLNUyKtzWmmp4ERD2qJgJU/UwbYbsVFICAwujAjbZ27q2EHKgh9
	GFtvU1/wqK8NJC3Ay1KdsfMDFjrbtWoYhby7S7Z6EAZA6e4TPId/RWoFOd/7ruyixDH2IIJtbH5
	32kiKr6X+khMpSS25kgxcjdC/XISaJg==
X-Received: by 2002:a17:90b:4a47:b0:3ab:1af3:a0d with SMTP id 98e67ed59e1d1-3ad86d1e821mr4444449a91.33.1792688329159;
        Thu, 22 Oct 2026 09:58:49 -0700 (PDT)
X-Received: by 2002:a17:90b:4a47:b0:3ab:1af3:a0d with SMTP id 98e67ed59e1d1-3ad86d1e821mr4444437a91.33.1792688328657;
        Thu, 22 Oct 2026 09:58:48 -0700 (PDT)
Received: from [192.168.1.9] ([106.222.235.141])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ada48876ebsm5013445a91.1.2026.10.22.09.58.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Oct 2026 09:58:47 -0700 (PDT)
Message-ID: <d8dc2c6f-9b1e-4248-b81b-cbbd524233d7@oss.qualcomm.com>
Date: Thu, 22 Oct 2026 22:28:42 +0530
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
Subject: Re: [PATCH] arm64: dts: qcom: shikra: Drop CPU critical trips
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260924-shikra_crit_trip-v1-1-730c48fa998e@oss.qualcomm.com>
 <xa4gmzdccrububsmervkbtwqpddsbikubvgsqksypqmx5oih2q@q2hz6tadbmu5>
 <53c6b966-a6ff-4b91-a2b7-d7faee5a6605@oss.qualcomm.com>
 <3a87d077-8b8b-4bcb-9f5a-03920ef3d38b@oss.qualcomm.com>
 <e3de4383-f530-4968-a177-288162cd34c3@oss.qualcomm.com>
 <727ru4mlgn2bf7ta42ww7772mekk6bea7sni5b2h556pk3c6xw@4atjqo2ygylo>
 <194cdf44-059d-4d03-8cef-d674ba37006b@oss.qualcomm.com>
 <crcwoq7atn7pkwt7cryixquqydyxtqezphq4cpq3cokxuxmkcu@axzmbxzf2mwg>
Content-Language: en-US
From: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
In-Reply-To: <crcwoq7atn7pkwt7cryixquqydyxtqezphq4cpq3cokxuxmkcu@axzmbxzf2mwg>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: -GG6GgkAF9KCXp8XSdvsMcFZH_rQCAGR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDA2NyBTYWx0ZWRfX9ec5XfdFvkJB
 6hWh4bj16ZL+nzGX3Cdz5sZzGV/mmGbXjzZ3JOlMnPT/SP8qaAACtPlJ98g6Gs+RhYIBxJvJdRG
 JRa9xG2I4MMgJdZiJMcvJ3s45K/BNHy4H7PbAGKST+Fbu6TagQgcORU9zOBU9bnbA9TRrhRYxrQ
 CzSjvvNoxHsvUyNG30iB+HLvuhIHWcauldso8L5NpW1dAnZ3z2W3tam1FR/7jtP41XA1TVB1Ivu
 ohkPpNluhBKT3Dt8YunVsqun1OSX9kSu5pcWXGCfC85fpGdqt/krYHlVOb833OF3imb6adWbNsv
 DNvmigkXZn55SIxVo9wx3EAzMa+nVjxx4ZBJlRPUmfWb/8kpIsA9fv7mEibxyDxExN/6Ecs7Htp
 jogkEVYWF7JT1QLhTiTwTiQt3s4D2pPKQ3w8kNmoQkWLacRB3oTO+wqmLM5iiCLCXGc+8TrWugh
 12qQj0C+5DXWtsFQFzg==
X-Proofpoint-GUID: -GG6GgkAF9KCXp8XSdvsMcFZH_rQCAGR
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDA2NyBTYWx0ZWRfX0jxAwSzjofKy
 gxcmJiFVrLBuSspkl+pGKZMn0p9d4l7hbbRjUdrFg5i6bO8zd2tuJaXE9HuaucDrMALXf5GA0++
 2Cylb6iA7G54zCRd2rBscl+3cTbrFkM=
X-Authority-Analysis: v=2.4 cv=UaHE26SN c=1 sm=1 tr=0 ts=6ada40ca cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=8wa5AUNoahJ04lRaSfAPWg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=NRCdo2LqAGfow365lYEA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 bulkscore=0 clxscore=1015 spamscore=0
 malwarescore=0 lowpriorityscore=0 suspectscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610220067



On 10/21/2026 5:36 PM, Abel Vesa wrote:
> On 26-10-21 17:12:11, Gaurav Kohli wrote:
>>
>>
>> On 10/20/2026 6:26 PM, Abel Vesa wrote:
>>> On 26-10-19 20:03:47, Gaurav Kohli wrote:
>>>>
>>>>
>>>> On 10/15/2026 4:43 PM, Konrad Dybcio wrote:
>>>>> On 9/25/26 12:24 PM, Gaurav Kohli wrote:
>>>>>>
>>>>>>
>>>>>> On 9/25/2026 3:13 PM, Abel Vesa wrote:
>>>>>>> On 26-09-24 19:52:32, Gaurav Kohli wrote:
>>>>>>>> Shikra firmware handles CPU thermal mitigation up to 117 C, while
>>>>>>>> Linux CPU critical trips trigger at 115 C. This can shut the system
>>>>>>>> down before firmware reaches the end of its mitigation range.
>>>>>>>>
>>>>>>>> Drop the critical trips from the CPU thermal zones and leave the hot
>>>>>>>> trips, non-CPU critical trips and GPUSS passive cooling map unchanged.
>>>>>>>
>>>>>>> I thought that was the whole point of having the critical trips set to
>>>>>>> 115 C, so that the kernel can gracefully shut down before firmware cuts
>>>>>>> it off.
>>>>>>>
>>>>>>> What happens if CPU gets to 117 C and the critical trips are removed?
>>>>>>> How will firmware thermal mitigation handle it?
>>>>>>
>>>>>> Thanks Abel for review.
>>>>>>
>>>>>> For the CPU thermal zones on this SoC, hardware-side mitigation is already available at 115 C and 117 C, and hardware shutdown is at 120 C. Because of that, a Linux critical trip at 115 C is not very useful. It overlaps with the hardware mitigation range and can trigger shutdown before the firmware thermal sequence has completed.
>>>>>
>>>>> Does the hardware mitigation just pull the plug, or does it signal
>>>>> to the OS that it's about to? We absolutely need the OS to be aware,
>>>>> so that e.g. the filesystem will be synced.
>>>>
>>>> Thanks Konrad for the review.
>>>>
>>>> The OS is not notified before the final HW shutdown at 120 C. There is also
>>>> no useful margin for a Linux critical trip here, firmware/HW mitigation
>>>> starts at 115/117 C and hw shutdown is at 120.
>>>>
>>>> So 115 C overlaps with firmware mitigation, while placing it higher is
>>>> too close to HW shutdown to be useful.
>>>
>>> But having the 115 C one will allow the kernel to take all the necessary
>>> steps to bring the system down gracefully, while relying solely on the
>>> firmware will just kill the system before kernel can do anything.
>>
>> Thanks Abel for the review.
>>
>> On this target, 115/117 C firmware mitigation is throttling/prevention, not
>> shutdown. The final HW shutdown threshold is 120 C.
>>
>> The 115 C Linux critical trip therefore starts shutdown exactly when
>> firmware mitigation begins. Moving it higher also leaves too little margin
>> before 120 C.
>>
>> So this patch drops only the CPU critical trips. Would you prefer keeping a
>> Linux critical trip at 118 C ?
> 
> Yes. Again, we don't want the firmware to crash the system before kernel
> has a chance to bring it down gracefully.

Sure, will add at 118.

> 
> But how does the firmware mitigation (throttling/prevention) is done?
> Shouldn't kernel be aware of such thing ?

LMH hardware handles the CPU frequency throttling. The kernel is aware 
of LMH events through the cpufreq driver’s interrupt/polling
path.


thanks
Gaurav

