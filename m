Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792763761;
	b=1Uf28wTAX2H+U7irt6J/b+SOdT+6KhRYP1zJuSqT4urKsOvn3LnRR6Hg0cshpyT/kFPR
	 +TXx0L6y6t4Zv8S+woaPqwBH0+mooG4obvutjdlVV8rEgwfnK4K+0ybsMhVJVtZZrXjeN
	 pmEsh7gibA1DathTf1T0q3Gl01WY8k3BEAiasvG8kpMp7DUqn0mvA17ngMotH/VQ3gqqY
	 AcAa3088RhVTSTIfeX/9/wkl1RIrJZg5XiBQUkKbMJUwxBCO5YZkN36UPhKocyN9K+PQH
	 qPXRPIhichySpQ4s7Ysim1X4/ix1jM6MXQVYp+MmjLQ4Wp1T+LHH0a5Xdi3vSSFkDKQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792763761;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=UnZpFa86nCr1M8BImjz0Hpmt+fGiTnpfeQhENkxH/VE=;
	b=d3Pl6mOap5Rpc1X/0LDpXqhuc2CRi7lVdaQh5tffiF5od49xPP8oMVG0pSzoKxOZ2r13
	 lJxL+8L3h1pSZejInMw31qZKCqq9cGPSqI4fBajTbelbjrawf+S2QltGQEZS98jnMSSje
	 jItbCHREtDMwyJkybJ8bhS2UAgStbvxh0oDN/H4pQ/ziUY/69urglEnKu3CJI3AkUt4LI
	 WWze6+8LEosNdwLOg9VeM4Kn+lfe5RTrMG36wkBcMgkZp9y+dmlHz2tz/gh2JqAjL3TYP
	 AWtyG+QOqRKTSt9NENdYEyKLrgMG1FHfZCg5Ikoqs8IWjnXa0be/jiPxr98NgSEqUiw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="e/Q4b6cz";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RcUAb8gL;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A60F606A31D
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 13:56:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8A60F606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=e/Q4b6cz;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RcUAb8gL
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NAAYqU2509073
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 13:56:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UnZpFa86nCr1M8BImjz0Hpmt+fGiTnpfeQhENkxH/VE=; b=e/Q4b6cz/nvqDd1w
	fjCXcfgSF2EKGM5S6UwZ/dvsgoxzrLr5klVFwHaVKMRrDEBgiwYJyf5h7lZOtowv
	EWA6ggYc51bkhDA7FOf6vnyZ+KXicl9MX2dSwtMHzGDTryM1LGs7/0Lp1HNhIaot
	DAwW5BDR+3GA5psh66MD4/imdtqZVrBNMzSo/PtcEM0kOEXtAsmwCy1hRhMrDNB1
	6EDgfogK4ND4h2ERoId3VQJk2KQCV7RQXmFqceSoQRsMIWbsDwgATJGX5jv6jKnq
	annILs4IVhU8K/l6rEFsdmxkvlvf+vviprfj1F3s4mqP6+v2WKG5RLERLG4YoWNZ
	kppO4w==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfsykbcqm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 13:55:59 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-77f133855b9so50019137.1
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 06:55:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792763759; x=1793368559; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UnZpFa86nCr1M8BImjz0Hpmt+fGiTnpfeQhENkxH/VE=;
        b=RcUAb8gLAo/DVE6kwyP48U6JXZTmQNaqtJSIe4yyyjbwI+cao+Jq2VpA2xHEOEMMUG
         oh2cC9iG5Gx1tuiyGj45TeXP1yU4hA0lxmthWKnFpHk82ZTUil+6CWuKYXylV9E8+Wny
         zjSckd26nSLjeCLfnBQmau42/2ojD5sA3LmqXsHdWfcPgBN1x/lyuPLG68f/fYlZfPUW
         RSbvl2bP5w7X5SDArmisuJBhEiwoJl2yGYrHl3xMoRlNkS2i3sAmgephuxh7VoIb7tT9
         9uRv5W6RkQ+VFCOWuVs/dX9W+Noar4IBHlyxHfU2Bz3q5IfpxlrioqBjGtKlsAkqpp5J
         3mOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792763759; x=1793368559;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UnZpFa86nCr1M8BImjz0Hpmt+fGiTnpfeQhENkxH/VE=;
        b=qvwXWEOFE5EhqKZMmCu3dP74foiiRQSD1jUW8z4lQ+To5UTQHdakMvs9CE16gzPgNv
         3N3sDM81Fr15v4BXCgzqrX51b0uTDGGy08xqikJVn5aFLd0mIXnsQIzaBJp9hSiIR4/K
         WcYS453sGsay5UvbvlJJz5g0eqxSKXbpU56UL7EXARQqaUoO5Smse3Diq825bnV1BKj5
         oEUVGpN9MxkKTBBjQa7V1bt8SBqOzoJMpc1qm3541wextymh3aqIP3xFlhugTDKJnAVT
         U1t+tz/IU83cYZpjkCsCElMxYiYafXIjmxgfxHQMnAX91Gb1ggux41a4mHwxrumgmB5s
         ACVA==
X-Forwarded-Encrypted: i=1; AKwUvBy0gWlj/uB9A56tDBca96vyctaozhwTSAS05nVaWCXpt2NVc4EY6f8isP3YDX/18acHOif6Q1iXEDcx5DI=@vger.kernel.org
X-Gm-Message-State: AFq9FYKqCq0KxSI2IxPa4YozIfU8dZ4rcpU5i7h0ZWoTnmIWj2uT4Rp3
	7hu3T2piQ9FjWQThjoWSOhDo2qiwrV+hNH8gF+6qYFW3fpoAxNdUSCwCBsDBtjgHVA1ow4EhwLo
	Btj6P7M2TXuVKCOR4SDePAxvhHAkfoCV2jvSqkb0e5T2fzFG1Glo1k6zxynYx7Gr/0M7Vt5gRsv
	I=
X-Gm-Gg: AYBFou0RwnlZ1z/nDAXa5R9GEquOdYWemwrNE1G1S4H1hj5hYgwXcb0h+P4+J7NpmsF
	3v7vMKW+rQx2CZVn1uqqy2/A90NslIKFnL8TMzGHoerVOGRH7gadB3oFXe7ccyzupau5OA18hiU
	Fk8y8coXTN7KcTFyApV9Pr1YmFt0UYpAskiX4FPF8laomHMfrscXGUBROZI9R6TZl2UPAE/wMe6
	fZ/yYymimB7+Zd7RaDsvi4w5EZzYOBXXZflJlXgwoRuy0j+l84NMRiSna3Cn7e4O8mTh0j7vR3s
	A8JjY1NfVcXhzyxdVvtVyh8aY+g54cwJSJODzdOB9C+7JdeKnEPbN6p8vyHpS9lm9/+h+9I1chv
	RhA1IRsIS7q9r4uxTsl+O0g==
X-Received: by 2002:a05:6102:30d1:10b0:7cc:174b:f7ca with SMTP id ada2fe7eead31-7ccc2d92dedmr890638137.0.1792763758712;
        Fri, 23 Oct 2026 06:55:58 -0700 (PDT)
X-Received: by 2002:a05:6102:30d1:10b0:7cc:174b:f7ca with SMTP id ada2fe7eead31-7ccc2d92dedmr890631137.0.1792763758271;
        Fri, 23 Oct 2026 06:55:58 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b432c01274sm1156244a12.4.2026.10.23.06.55.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Oct 2026 06:55:56 -0700 (PDT)
Message-ID: <625f7af0-5977-41e3-a76d-fde8f998ed97@oss.qualcomm.com>
Date: Fri, 23 Oct 2026 15:55:55 +0200
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
Subject: Re: [PATCH] power: supply: qcom_battmgr: do not report power_now on
 SM8750
To: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>
Cc: linux-pm@vger.kernel.org, sre@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261013002124.332111-1-xiaqinghuan@mail.ustc.edu.cn>
 <5bf3636d-be7a-4800-9914-808d2fc5ebd9@oss.qualcomm.com>
 <179259054168.209323.8102186130128474174@mail.ustc.edu.cn>
 <52fc4222-508d-4acf-b38a-7b4e5aeff3cb@oss.qualcomm.com>
 <179274197125.1374502.18211548118625978753@mail.ustc.edu.cn>
 <63cf18bc-5c89-4a55-aa15-2550dc47c155@oss.qualcomm.com>
 <179276336012.97124.9436748752781883311@mail.ustc.edu.cn>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <179276336012.97124.9436748752781883311@mail.ustc.edu.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDA1NCBTYWx0ZWRfX4M1yKfBQeLnq
 P6jWfRMqahcdvAzu8y2vJW4Y+lhHvbL5skVvCwcw3mzMgwfDzTiHriP1OLUHhEUEaFXK0aCtvfU
 TTh2DqCdpdVaQbm5uQeBfoSUWgnwXLv7lSDYL3Ay0yHSzH04NmZehlSUE8pRISXE/eQWX5E2dbe
 wS5DPuPMukfQo1RPq3MHAE7cbjH2vobdPqR35RUZYSeEkwG1wvygiKBtJjkkJlLDyB23tRkbTs1
 fOEA+oFLVQybZ90IBLMaLZhFzNhPcJwtDfz2VLZ1GIn2gpxH14lEEPq6111Mz3aNN9h56PLpKuy
 /vFKp95ZwSCV9xmVIQrjGO8WHbxE3nRMcyr4mMmidfK0ic/6RapZpuJvk18xoSEvk/Djrqw2vHM
 jMWeGwSFiWWZwniInHnJ9zb7hzze0HiZqUJxbPkStHs512Orz3sPXNJJzUNdjtGkx7tG4G7T1TT
 tFTt1cZbSLY9fscVEWA==
X-Proofpoint-ORIG-GUID: O0lQEOGQfXyCqPmEu304T1S2Ha2oPgKG
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDA1NCBTYWx0ZWRfX4PkZj5jOw8Qo
 rYPtKIo+Zg6iSw84cIDWmdhH76KjCNVDbL5/KatFzDimKCwHyVzepSRzcnmyolhAC71+FglKcdk
 +TQMY5NvteWGWf4rz7Z0ScFMOiuQIJM=
X-Proofpoint-GUID: O0lQEOGQfXyCqPmEu304T1S2Ha2oPgKG
X-Authority-Analysis: v=2.4 cv=GLKdgeNK c=1 sm=1 tr=0 ts=6adb676f cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=IP5-ssDr8azhespfttEA:9 a=QEXdDO2ut3YA:10 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0
 clxscore=1015 priorityscore=1501 suspectscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230054

On 10/23/26 3:49 PM, Qianhui Xu wrote:
> Hi Konrad,
> 
>> Did you try reaching out to the vendor?
> 
> No, and I want to be precise about why rather than hand-wave it:
> 
>   - This tablet (Lenovo Legion Y700 Gen4, TB322FC) has no vendor channel for
>     kernel sources. The public support surface is consumer warranty, not
>     engineering. We are an independent bring-up, not a customer of theirs.
>   - I also asked the person who is upstreaming the mainline DT for this same
>     board (separate thread, private) whether a downstream tree exists publicly.
>     There are partial downstream trees for sibling Lenovo tablets, but none that
>     covers this unit's QBG/battery path.
> 
> So "ask the vendor" is not available to us. What I could do instead, I did:
> boot the unit's own stock Android and compare it against mainline on the same
> battery.

I know you're independent. Vendors generally have an obligation to
release GPL2 source code and have channels to request it. Calling
customer support will probably get you nowhere though, as it's not
the correct place.

Konrad
