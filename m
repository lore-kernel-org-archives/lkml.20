Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793285507;
	b=UZpzsBdKuxMIoBwWMmD8tRc0o0UClDJ2BYxYgTZB9EgGQlqs8V1jX3qe3AJgJAUDBupg
	 so9lPDjz/gD9DIZD2KxpPXfVEU8alefsE32naLgFAqrvLuhvJtkw1MpKUUwPEvxGexb/P
	 2lJ2HdIE2FhowPbhOqmpdkk5AoCu8pHanl9MyegnbaeLnLE7ThzxjohIraTs1PLmHGZxE
	 ZTDoMfveM3TR0kvkgJq5ORKqO0khs3olHFM1zVxmul1ver2G9KXVzI61r2MdDtDSXN0+E
	 lHbZm/gHLygZhxnjr21mtVLpTJIwjUO6D7fJsgWkNtw4FZ+5Z5gAXc7QSIs71Q6aQoQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793285507;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=0srwOxBC0w75+XzAU+j2O9cViAS+CJV45HbLV2IBRY4=;
	b=vxwcJG96/gGjUMs3VDSVb6ldMezbRdfvekIq2kSIP22vdICD93J3EJydcvSPGXLRm+9t
	 iIAsC7m45S4OjG6tw8biaM1yVPGVCWMrDGT8MPxQIEsFeUt/FCEd+cJCzlJV+sFiNA1/n
	 pOIv+rUxt0ovOnedUhbxaneMs2RzGSogEoynKocRv4cjjDjs/xSV9BPiJx9PfreYOFk+J
	 vpw43qLlXkJR6IH0DbTdWHEen/Cbd6rRprKfpiRVGnb90z03rY6wmJRWjyoIL1/nNBBS3
	 jUzgEV3tp7Eg0WRY4jp7k+tLhKFYoWAiJ/fn/MyYekXPhbaEENipmFIACIySt4PwxqQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=a9ITikiB;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MXxQaxL0;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4104B606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 14:51:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4104B606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=a9ITikiB;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MXxQaxL0
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69TDawnF792246
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 14:51:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0srwOxBC0w75+XzAU+j2O9cViAS+CJV45HbLV2IBRY4=; b=a9ITikiBPCjkPmwp
	eBm/Fw+cyDD/KDj3Q8dQlAutk8xEuuQsSGJN3ft6Jh1MHKAa+hlsSEMf7fL9f9kj
	VAC4o/gIe+bO9YDAQcYnFprmcmZFGpWNZ0VlkRfmYWWXrDlBo94fWtiGWoTRkhFB
	G95+01nw3bDXWwL20I4qmDaI/asN5BPs3NXgKlNXsML+u2e8DK1d9nQajzaTzQQE
	rv1pM0zWyATn9uRG3lEk9tcZ0rNPjJy+jA/d3xThojaGxNMNR6fk8zE1ebpTW8DD
	gOdqyJs8DaJNmMC21vZc7GpDvMAcL+3cGr8nSve2oLfqDF54PcZ08CeNW2jyHaAc
	5+/gVg==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hm76cgane-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 14:51:45 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-7c10b8abe29so1683664137.0
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 07:51:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793285505; x=1793890305; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0srwOxBC0w75+XzAU+j2O9cViAS+CJV45HbLV2IBRY4=;
        b=MXxQaxL0Y4lVTuCZlsadMEiN1Zaf/Y4n3QUO/h560Ya5VHuHFQfaOJLKoJcwNut7e4
         168vyu0OoBsMTCfhoWZIELTJS70Oum5/CUHTezdjAufG2pEG7nIrKAsxI3cWZkKVJHOw
         z1Eve+drCckDKGTc5C8v1QPVGnAiEmp8PZXNDbRlmfRFIr8WEJboZwdBc9U7D+Etz4e4
         Ox4p/DuRkmBtYeHx3Pb8G9l05RkLiO+4NQ8sUSrSJ4nhYpgONSHLS27OM70OKBqwXSD+
         emlf4zLR2bMHIIfVijS3v6vDpzC28MoBOo2qrq7czl0QGdtouEXe7Z/vaMbn54FQi3ha
         F4iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793285505; x=1793890305;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0srwOxBC0w75+XzAU+j2O9cViAS+CJV45HbLV2IBRY4=;
        b=Ul1NPtVqhQ1tomvDlqLmq3wjVXSEO4U4rlKSbdVzUUrB8HMV2uEiOubWV6iduThgCm
         GYkINJUUHm0tJ24gH5/6UFWlkcVH03mMb8WqDgCKholulxO+h+MSRO45YbFGXThj9H12
         pGrL/AwMYsL4Giaen0tw/HpfEwrHsgP94MrKcoO34lhRh6jvs4mGKH9S2Lr05pZA9TI9
         F/TO25M9SylVab3Li2Pbl96r7Y702opm/sM4DQorBgFat5eBi9litf9Tm7YfM9JWpunr
         mtDwT7ONzmI7dO3AVZqBwUkNvQqltm4RgqY91F1ah5h2uftBfsc2+pqPTANjeaih3+HH
         MbPw==
X-Forwarded-Encrypted: i=1; AKwUvBxQnx8m/FVLNyXiXrCxC0kysLKrRLVQq0afDK8HaNz62LnzKUlj8HEucExw4ltRkIVR99v1QkBcV8Cs0lM=@vger.kernel.org
X-Gm-Message-State: AFq9FYIWcnDo7RgQVRklXovsaL4dwQT06bk3FdhSTZ6oYd99zvCzr8h2
	GgByFo0YTuwlXOg/B3HPZCHvvYeKXv6BmzfTIbIxvRC2QNs+3BK+IjujaTssUx/soy5xwvDBEDe
	sus9g0qieRnZ6FfQu4RT4/aM/ZRxgZCm5mS9XmNELiU/KDUjODz62nwHaQbdrJiChJhw/Jbs+0v
	M=
X-Gm-Gg: AYBFou3tzTkBaPKHFNX0TEpSl1c5ZLuuVvJX0AFCqgfCI+F+NM92r5ruC5gsUTgnPiu
	llTk8pl/EFZaRa+oZ+cQ8a6fi3wiKwrd6psYkrGBVF95HtbirKiSTXcYC1gvDhx6qnnSM5M0nS3
	74FhQF7U3rNWwyopzdRyzeaNoWNQU9MFdDKoWj+YzxIJdHYzkMDtfiP/MwKxJFFEn+UlCPX6uOA
	WW/xET75OrQd1tQIr31aQe9n0TUhp2vbQUtt+4bzom3066+0hZlac1/k0Abb9i65mW+Gp1Hxkrs
	vP26svZxtNOxP1q56i8wtt91+BE7CNq9VA+/bYAMFmXaWtcRJu0OMn3uRcK/zlRhkkavc5Ajs0W
	9ad/BBkFhMtZ7eN+YUK4Q6SqBa4bnxK+bWEGI+5uVclFBQXUaps7RAgGKS6rK1Qgd02mEF+MClD
	iR7kWpPbHb36gA
X-Received: by 2002:a05:6102:83d9:b0:7cb:70ed:ff90 with SMTP id ada2fe7eead31-7d03a5bdfd6mr2411694137.26.1793285505304;
        Thu, 29 Oct 2026 07:51:45 -0700 (PDT)
X-Received: by 2002:a05:6102:83d9:b0:7cb:70ed:ff90 with SMTP id ada2fe7eead31-7d03a5bdfd6mr2411677137.26.1793285504808;
        Thu, 29 Oct 2026 07:51:44 -0700 (PDT)
Received: from [192.168.1.31] ([85.196.172.179])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ecd3c32sm36256864f8f.47.2026.10.29.07.51.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Oct 2026 07:51:44 -0700 (PDT)
Message-ID: <a3aba02c-03fc-4386-952b-d53fccd65465@oss.qualcomm.com>
Date: Thu, 29 Oct 2026 16:51:42 +0200
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
Subject: Re: [PATCH 00/14] Add SOF/EOF sequence logic
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, Bryan O'Donoghue <bod@kernel.org>
References: <20261029-v4l2-frame-sync-v1-0-d37992559c58@kernel.org>
 <05313835-c868-45b1-b246-f98cfb8a1d6a@oss.qualcomm.com>
 <22d2cfcd-045d-48dd-bbde-c1ac2d958737@linaro.org>
Content-Language: en-US
From: "Gjorgji Rosikopulos (Consultant)"
 <gjorgji.rosikopulos@oss.qualcomm.com>
In-Reply-To: <22d2cfcd-045d-48dd-bbde-c1ac2d958737@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: dEqMV1NrJWujEAvd_7GnXH4dLSA7vsPk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDA1OCBTYWx0ZWRfX+J9sRRdmW1SF
 WGfv099zdXd4QfIhOKn+paDc1fQD1VTI6Rk32jLfMx3/MErNPZ+ra7nKSHNj9YIowuthAeyOyZ0
 RpsL4U2vKQUIt8YSRuLGYW5YyO03w1/nSbbwQzZZuiedZclVQcqvylPHIiHWZoLXKyz+Kfm6K92
 XDsh29HqpX3apAm5Mt7ADd18MpGHBbFmkvOj+lY58RzNTeMq5XOnnA7aIE10YKSTvzfBp+KIWfd
 s1fCPmy0M5eF/poEeO4sX0u3qAm/YDT8yJ38Te2THgK1egCwe/0BpW6cwhZC3AvJSe1x8OMBe4v
 X/pUicx5G8jyFS1il04VjVh64GoGvdPHRnjHs0d1boczE3+fVE7psiRwL4vuvMNc5oNQJl1uLpt
 sYxN6tU3Yh0FFQVDF9jByQ8U1PGxlwe8SgYf2KrarVRktRYCx7xqA5HmfJkwxknaENSDYs9EJf2
 1KBIbI5FaK0nAL7Eu3Q==
X-Proofpoint-GUID: dEqMV1NrJWujEAvd_7GnXH4dLSA7vsPk
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDA1OCBTYWx0ZWRfX+rvusL277wcl
 Vi4XZ4eBc2G/CVhIpqqD5pZ/3bvyp/6sVA6twQ3ih+BhBC6HZRYx5xF46ALkYrYi/J9Ck4Uf4Ss
 OzLXFkxokLMwc1KS90DLXUpWn2VHEvE=
X-Authority-Analysis: v=2.4 cv=NPtAaE6g c=1 sm=1 tr=0 ts=6ae35d82 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=Q/e3f29T3Hw2hnAEzBPF7w==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=KKAkSRfTAAAA:8 a=o5BTqMlMTsaSvJmBCIYA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=ODZdjJIeia2B_SHc_B0f:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0 bulkscore=0
 priorityscore=1501 impostorscore=0 spamscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610290058



On 10/29/2026 4:44 PM, Bryan O'Donoghue wrote:
> On 29/10/2026 13:28, Gjorgji Rosikopulos (Consultant) wrote:
>> Hi Bryan,
>>
>> On 10/29/2026 11:55 AM,bryan.odonoghue@linaro.org wrote:
>>> This series enables SOF AND EOF event tracking making use of both events.
>>> Whilst the code is actually very simple the functionality we want to build
>>> off of that simple code is not.
>>>
>>> - SOF
>>>    Serves two functions. Firstly. Informing user-space of CSID SOF events.
>>>    Standard Linux V4L2_EVENT_FRAME_SYNC is trigger from this event.
>>>    User-space wants to capture this trigger because it allows user-space to
>>>    better align the time a frame begins to events elsewhere such as IMU
>>>    event timestamps.
>>>
>>>    That functionality is directly applicable in this series.
>>>
>>>    However we will also build on the SOF event in later patches to allow us
>>>    to begin programming of shadow-registers for the next camera frame.
>>>
>>>    When the EOF event happens, we switch from one shadow bank to the next.
>>>    This is only possible if you have the SOF event.
>>>
>>>    So SOF serves the immediate purpose of timestamp alignment in user-space
>>>    as well as the 'evil plan' to trigger off of it programming camera
>>>    parameters for the next frame.
>>>
>>> - EOF
>>>    EOF even on its own is useful because it allows us to increment
>>>    vb.sequence for each frame as per the spec not just when we have
>>>    buffer-data.
>>>
>> It is great to finally have V4L2_EVENT_FRAME_SYNC support in CAMSS. 🙂
>>
>> I would like to share my opinion on tagging vb.sequence at EOF.
>>
>> The EOF event is received from the CSID decoder when the EOF short packet
>> is decoded. In contrast, buffer completion is reported when the write
>> master has finished writing the corresponding buffer.
>>
>> Because the processing pipeline includes buffering and line buffers,
>> buf_done on the pixel path may be received after the EOF.
>> Conversely, when cropping is enabled on an output, buf_done may be
>> received before EOF.
>>
>> That is why using EOF to assign the buffer sequence may result in inconsistent
>> sequence numbers across buffers.
>>
>> I would propose:
>>
>> SOF
>> Increment the frame sequence and generate the V4L2_EVENT_FRAME_SYNC event
>> for userspace.
>>
>> REG_UPDATE
>> Once REG_UPDATE occurs, we have a guarantee that the configuration for the
>> new frame has been latched. At this point, we can iterate over all active
>> buffers being processed and assign them the current sequence number.
>> The bus-write active-status register indicates which address is currently being
>> processed by the bus-write engine and could also be used to detect frame skips,
>> if necessary.
>>
>> BUSWR_DONE
>> Complete the corresponding buffer as usual. Optionally, we can verify whether its
>> sequence has already been updated. If it has not, we can determine how the buffer
>> should be handled.
>>
>> This approach ties the buffer sequence to the point at which the frame configuration
>> is latched, rather than to the arrival of EOF, which may not be ordered consistently
>> with buffer completion.
> 
> Come to think of it, I'm not entirely sure an EOF or reg-update 
> additional variable is required.
> 
> SOF.seq should do.
> 
> - Reading SOF.seq @ crop is fine because the SOF.seq always preceds
> - Reading SOF.seq @ buf_done is fine ditto
> - Reading SOF.seq for params return stamping is correct
> - Reading SOF.seq for stats frame correlation is also correct
> 
> We want the EOF signal but we don't need a second seqno to accompany. 
> And with one source of seq truth we don't need to change the point at 
> which we latch since pre-frame-drop SOF < everythign else.

I agree. REG_UPDATE is only necessary if we decide to use the bus-write active-status
register to determine which buffer is currently being processed. This can give real guarantee
that we are not missing something on heavily loaded systems when irq-s were disabled for some time,
in that case sequence may not be in sync anyway...

~Gjorgji
