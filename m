Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792594057;
	b=1dlDKf5IbgTR34dU4Ess8L+T+nc6HKzST2zYT/zrsq3S+EfY8fgNtE1il+G6/6B4n9w8
	 vWNV38totTfmYSCNnpVb266KXditDHQ4Xfm5HobfOzYuWFGRHXgEmqkBUp5I2CvhrYlIo
	 hOm01bjWq66ZgtxkXShLsOs24lDi2uAOS53Ch9Jb29Zc7GWeLsXHKHr4BjsmhP8L6a+jf
	 vjTmfBX/VhJU6wGI8EMMIVWY6Dqi2C8u9lGEgWWj/ZjA1yiL7VnUQzcuY4Vmw5PK6oXTM
	 rNrBlo08K31KYsASlJC/kFqJEyHTgVCiQ5MUM/XttTTgC5F5tsvCzn8Q/smsfX6cC4A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792594057;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=AyeYzDYt4cAMFd1jhQBvi9BO1/zfrHrFy98deBZRgJk=;
	b=bK5R6vQd/F7b25+UMQXe49XuQQEWYF4tYocAksR0sdzekf59hg4gFk7dWSStPU8tmIeP
	 Mlrw+XDJ3obL8LG4zfonkMAVu9FIzz4Xo3eSC1j3vyE+dxJP7nruI9fAU6iSV+wnOGQzB
	 /xA0J1vHaQV4AQUGjf/Tsfvhvpq3EhZK8NzahgZGXpeao6Qyqm27tLhxJTZuxm8ZPh0x8
	 8SynLk63iRXwvz32f6CpMJ9BOXMsMk0NBsYAEg6W9t02pSXMLINIFdQ9+ooqstPPRU+yt
	 Iqln5QweFphNG4dE0YcVBhgoOAT0LuerkmP12PcgPw8NqnJvNq09iv2Q87SFEU577tA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WQjuwJ7m;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=O33eyoqK;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D73C606A31E
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 14:47:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8D73C606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WQjuwJ7m;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=O33eyoqK
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LEF3Hf1933555
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 14:47:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AyeYzDYt4cAMFd1jhQBvi9BO1/zfrHrFy98deBZRgJk=; b=WQjuwJ7mva7l4S0u
	1n6h5f1vWLqkLfPrN1jxiFO8cOcbeZNyfrs37ynpbHAbqI8jaMuwuSYKK9QL45hm
	NHLwikBNOpE9tu2ao4ji4SqZU4Ojt9m7aZm06zD3v2GUUrOzzeVpcYIrNbOlo4Et
	oDHBW64tRIgiBxH80KXBauGO9z8n18F/F71R0oFG09L/Q07fHct7on4BamJpjfyA
	ED2yba+o9UZ7nQgatiLUOgyF2gQJTxwrcm1/fPTsJKtW7GyteXqrDSIVPrY8VPnl
	pqenldnqATZdvx3HbnG7MNmMIXw6Ha6+5FsqcG1x/uen/V5Da3eThBbK/Y/SosnF
	zxBCAg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4heuhuh1ng-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 14:47:35 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-9308eafb465so250606485a.2
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 07:47:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792594055; x=1793198855; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AyeYzDYt4cAMFd1jhQBvi9BO1/zfrHrFy98deBZRgJk=;
        b=O33eyoqKxzUoNy/Dhjy5H+sbEDZsbHjQFNR9whkoh6+/ohu/4AwfzWv3C02owKHQHI
         IyxR3bb5idg4run51/MsJuXN1/mz0k4FmVgNxX1fh3OEXZ0LT0hRaz6EvuYzFz7wQMFR
         +0G6k+uI4/9tljX5TmLYtJvQctNt7arao/cH/iNMTq55iKTrUiz9rFfKRrr9EJvITkWi
         /aqlZJFdF00uhYdd4rRrFdw9beCovUsTevnF+tOBE66Uu8MNE/Qn31G35F0FaGb8n069
         56FNmfFLofdIjrCzbfahkbQoHCrpW0Ngv3tbGA/3yAE+yYshIGUv2JL0aL1rho01Z7Ew
         CVlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792594055; x=1793198855;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AyeYzDYt4cAMFd1jhQBvi9BO1/zfrHrFy98deBZRgJk=;
        b=Dwo0sLZBlou6Ev+qIsYO6nZ5L2Ao+jU6/eiNDr8xYMA0QEn7mPIOwkPL66PCo2VQfr
         e+5Vde46BTY0x6W3VAiJnwDup6IrMYVhpOBm4ln9V8U9g1DvBgsZZNP/tZjyq+NxH2mi
         DFo0QshIDb7G2EFWmx32ExFch4aut8LhNTkq1f1DJUKXECBOa++wWdPx6DZFORfWJ+Bu
         JDkUpDQODYD3JB6vxdIMiK93gYa6mDIe4O60X7P0JHTKUPaKM+q7vZUPbCMaVCaMXFmx
         IONBAberavP0PQVX3Z4l49aaSBaDnJUJJ+Geh9VmKNg2SzZ1pVp9aYPPIkm4HYPfDYth
         SVig==
X-Forwarded-Encrypted: i=1; AKwUvBzgmnNUwkSU0s7wyFHhZBSV6gfqLKIRs8C4zIxnT5b4LIBscWzT6eAeuN6fkPvtsdLTHxf0BMHFMXEgFEc=@vger.kernel.org
X-Gm-Message-State: AFq9FYIweV4a1oBkFCJwkz3pOuMo/x7wgIe9D7XwfpFtaAH1nU1KzOHR
	jHe+BPXPx/9AFms2nvIK8ygdQipKaDc0TrthcQSobUvvNTkEdsUwoBcdizOzvRICklC6B195geU
	3AQcwrTGHtfccTep1QtKEgJKI1qboLIMsLlZ55SQtr/xtFkUNoS4GT7YC8gs9TWsd8XU=
X-Gm-Gg: AYBFou2Bhw9+4qOzHj+v/LdqjLZegDg2shnkyw9VaDXUFbLP0i4DxcsYjKWhasPl/Yt
	tblaISiGfFwrNE7VrvG7vRPh2NERwWfVPAvN+6FxwaR6tGYFXqekIV4ZXMQ64564ofPafXfmgbR
	lkzCQ+IwFxQ/JAS1pZX1xxsNlUpFPR9VKDOpnJzbferyUvhwmH62K9HHAe9TqYlT5QMEH3k2t1E
	YSuJyhnUK+gBjp0cZb8Dt8G0JnenRVUFpEkcW3TfGhiRzkPi0ZBdjmk+BjbuZI8pwvsKubD7su6
	8jsHS4tRe6CcBD29dKAvohmLc/W00CeZmgAcg1uPl5N0EImKKpIFedyHIr4t00y7sEVDt385ij9
	YcX8dIz3LbDZQm3sndQLa7QQ7JNezQv6bVg+iVCvlrVncThrunCnR56h4Rkk=
X-Received: by 2002:a05:620a:4505:b0:93e:c12c:fbc4 with SMTP id af79cd13be357-93f57f9f3c7mr426545385a.81.1792594054683;
        Wed, 21 Oct 2026 07:47:34 -0700 (PDT)
X-Received: by 2002:a05:620a:4505:b0:93e:c12c:fbc4 with SMTP id af79cd13be357-93f57f9f3c7mr426540885a.81.1792594054089;
        Wed, 21 Oct 2026 07:47:34 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:8d9e:b00d:491:1503? ([2a05:6e02:1041:c10:8d9e:b00d:491:1503])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e25828cd1sm5814797f8f.22.2026.10.21.07.47.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 07:47:32 -0700 (PDT)
Message-ID: <f223c867-fca5-44f2-9cc8-dd3ca99e1387@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 16:47:31 +0200
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
Subject: Re: [PATCH] thermal: Share THERMAL_NO_LIMIT between kernel and DT
 bindings
To: "Rafael J. Wysocki (Intel)" <rafael@kernel.org>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        rui.zhang@intel.com, lukasz.luba@arm.com, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261021134243.35103-1-daniel.lezcano@oss.qualcomm.com>
 <CAJZ5v0g5a+0eaULxGG=RFm=JN8Gh3_A=7mGUTmFUiXsxVKvpDQ@mail.gmail.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <CAJZ5v0g5a+0eaULxGG=RFm=JN8Gh3_A=7mGUTmFUiXsxVKvpDQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=d4JgWhjE c=1 sm=1 tr=0 ts=6ad8d087 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=1H47zwKHx6KseS8sNJwA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA1OCBTYWx0ZWRfXw9K94DfWGtzi
 s2k4IwJvSCaRepxsNdBjanirO21aDpziIVmbXGQPhm+mc040+CSaA6WaLU+ZJLbfoumfT8d2xF7
 lhaqkNZqaMedaHxTD6cABb+wNdtLvOk=
X-Proofpoint-GUID: CYlBJ4rPzesKLe9E0An15iXx1q3qq5t0
X-Proofpoint-ORIG-GUID: CYlBJ4rPzesKLe9E0An15iXx1q3qq5t0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA1OCBTYWx0ZWRfX78cVutPJOeoy
 TV6LXfubSdJLRSJuI+W2t2gqggx1z01oen6lVWl4cge1sqMPvmb+3y+rRDzEbs+JOghtpLqILKQ
 fkk51sLu8HNlC9I4ugum8ZjZiBA7WuPQNFdtJmPnF8XlmaUCdG+K6vWM3GxZ2ZG0tl/49WtmDkc
 ZDP3NdBHnCSSFWa/oSPO8GoaQErUI4UBUWUGtLCrqWWGE/rpI9OyuNkl0IGgjW22fMyXyEmYRfn
 ApcCEVJpJ8XWnIR0tRDL0SLcnrKNuxkySuz+xG2V9ayIR/+jPuWouAeWpDPbgO/lEp5fCqYcUxb
 Uz4S6xDtNC4RhRqRaSIc59jINbFW/uQEM6VjFpRCPRBPpaxw663eLiF6FgJnqyD0jycr3HNKeJL
 3yrb1B/nRV/Nmz4Dlb5H6wFk2ipMZ9/v4Kp/4OkYM8SyoAvC8B1EbfqDexRfKTWesLRodU49/jE
 2bypfZ+h9Z/+yKfnc/A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-21_04,2026-10-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 spamscore=0 malwarescore=0 priorityscore=1501
 adultscore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210058

On 10/21/26 15:48, Rafael J. Wysocki (Intel) wrote:
> On Wed, Oct 21, 2026 at 3:43 PM Daniel Lezcano
> <daniel.lezcano@oss.qualcomm.com> wrote:
>>
>> THERMAL_NO_LIMIT is defined separately in the thermal core and the DT
>> bindings, using different expressions for the same no-limit sentinel.
>>
>> Define it as 0xffffffff in the DT bindings header and include that
>> header from linux/thermal.h. Remove the duplicate kernel definition so
>> both interfaces use the same unsigned 32-bit value while preserving
>> the existing DT encoding.
>>
>> Signed-off-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
> 
> But THERMAL_NO_LIMIT is also used by the core on systems without DT,
> so why is defining it in DT bindings not confusing?

Yes, you are right. I missed ACPI relies on the THERMAL_NO_LIMIT default 
for the cooling spec
