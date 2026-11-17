Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=67.231.145.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794921625;
	b=EX7/U7UagxieD+rVpAmEyNMgMQEOG47nbg3NA7q2bh0V9fNskf81iaAbSW+/ZvYSLp4N
	 mlzw8DRau7FP923JvC1Yr3ynjmDCpToKRDBq8dhHfmnSp3nldZ3tq6c2oKlZB++op5fyr
	 aIwRhcmGEoVafj6W9BlNSDFabH+mPvo4QDQ5linjr2KWzXkA5T9E6M095vecB9sG4+opU
	 XdZ8417pXzQ+Ja/FwN6nqftXSgOKhr3B2MPBRjz68gaFKL8yEKxCLQtjisBL3BcIXLpN6
	 JrSCdoWm5C5tJhaRnvEgt5MWECEP3U8gv8y/5Aoixo6xhGTKF2MT65WYULfaopMbGHg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794921625;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version;
	bh=hkiPQtDWTQmK+yT2ZeAiQij6vJvAYkyT+gJVfoUg3U4=;
	b=J00opXFtIL7Q0fKTUN2qQyNol+hcTPJWlJhpXeQCwIitsI8YFGwg7pnUxQKbOW983iLN
	 HtQhTQeskOqXqJ8DDxuKwlNPuYI04sggeHkiOH2AXmC+pGM+JezxPBnx4C6v2vAfSNhAg
	 MYwhTgAyg4rFeF0TWUIM50fcK7fMXEhWR6PERzhOd9WIQkFjtxvSh+z+ZmoFCI1Bgs98o
	 r0XbzBFqBkTNg8WEhsushT7mYWup0/NTBgopMnCVoE06c56dALkGLrlwplHayjHD0tkcn
	 P0/qpvj6p6nM2l//Ou8/AmwnBTzlFTEgc0HwhVKkdRg7bOcMdUIDbJ/kCUoqchD/Ppg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=meta.com;
	spf=pass smtp.mailfrom=meta.com;
	dkim=pass header.d=meta.com header.i=@meta.com header.a=rsa-sha256 header.s=pps82601-s2048-2026-q3 header.b="PlibT/J6";
	arc=none smtp.remote-ip=67.231.145.42
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com [67.231.145.42])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A2A4606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 13:20:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9A2A4606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=meta.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=meta.com header.i=@meta.com header.a=rsa-sha256 header.s=pps82601-s2048-2026-q3 header.b=PlibT/J6
Received: from pps.filterd (m0044012.ppops.net [127.0.0.1])
	by mx0a-00082601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AHBx55u2762817
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 05:20:24 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meta.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	pps82601-s2048-2026-q3; bh=hkiPQtDWTQmK+yT2ZeAiQij6vJvAYkyT+gJVf
	oUg3U4=; b=PlibT/J6z9erNdkYqb2ipa7vzXJDVya6m4J1GwdOg4XMEn93kHKli
	1nV/H83RAkTZXLeAcUPuNNCSxywNUbV827soM8NjfQEEWNhYfn/ewDbCxDPiGRaQ
	9XHBPxMwt/OJxdPgKv7CdUut7QArbgC9K9Y3nxNWH153G3udI2Z01sXlMd7mzRJI
	zbelm62apCzyooAE/tUerntU1bf2xbtvuxxiROAVm1SeQuGDZ91AJRXE5w/vm4lK
	Pkq4WD1DFaQot1SXiESq/tjsD93QGgD0WMZOkpOszNV9pLjYh4iE8n3qXHgOg9dM
	xhkNcon/d5h/7oYqowWzWOlkJgbod/0jw==
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com [209.85.221.71])
	by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 4hxp778yrg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 05:20:23 -0800 (PST)
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-48e2736ce83so171651f8f.2
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 05:20:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794921622; x=1795526422;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=drwtClem/ixRXVUJ+7hLDfDXifarjXGS/2diC05y1Es=;
        b=cIf8clB9AfOu7cKUSgqo9fe1qj17cr/dvOUnkdTHQw/kfmd4EPsCj7ofHl33NeGpPg
         Pj6sIXuoV16bop4J6C7Q4L8NASC7V3YZYUOWNPwO6dItU/Bi7m6bKhArcav4rUedcGPs
         mUpygOOAx1qSpaWaYzjK1qsJkce+hAAU57/zwXJuymQ67XxOpY1dPgrhwHbauNcoeNXu
         sxMsN+7MK1/OTb/2wvxaI377GPY6x9D9Y2qNDbZhNkBc/+w53sIXE+62KPDnq7ZXqgII
         9Fp2+H0/+b+DyEuX2WNymjtSHbsd0LxiJpjJBNyUo7/jw1ho9U0vnrpdKb666XAtteQy
         iVhQ==
X-Forwarded-Encrypted: i=1; AL+hErEAm0X5+jg9FwOY18uhe+HWgjk3BTMra2RYHMHiDRll3PDXUPg5axO/s5WQk0AULQeDHDSinzqo9BWcoAQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z/BhHElMgewYvpW//L5aP7psNIacpeJMudd1wtWlsUocBn8fOJ6
	kMVFjcgWSAvOtfGu+yL44UICzVheQ2pmFgk9sfot2D3TA2LHFF69WXYhuPMnA3K3e04tsyybyyP
	z9KVh04yWRinhe4vIN+effEcJwC2E6Lhy1IG75I7H2L0h6tNOKcVRHGvOIYMbHXeRfEs2+7tU
X-Gm-Gg: AZFdTZfrILdG1hK+XRVyttT1C8mAb2f3UKpx3h7R2ff5rnOHDnd6VZ1lrnBbmDmPFv3
	rLhs7hdTYnmv+MM5o5r27EZ74j+/gPjcVGZ+4JAKbQlM8wSGKN+CmqTWvH4zUU+I4N/6+/r8zl9
	3I2cXrTvoFxD+2l0O+JfeJEv6CQQ04XCBSUSkeX4hGFEUMnDx7Uipnru9A2RFidAIN5/hzN+oGf
	5xNXOintWaYPmP4n3J57iWExEgzWIAL3nWakiEM4yBvPSKVamsCKh10Me9ZvPbokS52WcOZ2P3g
	6k3XE+z8B/Ijf+6gtEtAJ9zonAKNVG1FbDXVYGnnVDpEB0JIHYM5bl+UBFzWHENNmcnb/bTV08p
	buBonjPKmsUyQSWG3PInJC+B/ea1WN2s6tsiQwGvCFjV32LvlRN8h1WIXWIZPUofGxrkrwi0xf5
	v7b+YmxehSYrq0
X-Received: by 2002:a05:6000:2212:b0:48c:698b:502c with SMTP id ffacd0b85a97d-49c6d54973amr31394264f8f.1.1794921622049;
        Tue, 17 Nov 2026 05:20:22 -0800 (PST)
X-Received: by 2002:a05:6000:2212:b0:48c:698b:502c with SMTP id ffacd0b85a97d-49c6d54973amr31394217f8f.1.1794921621576;
        Tue, 17 Nov 2026 05:20:21 -0800 (PST)
Received: from ?IPV6:2a01:e0a:e17:9700:3f7b:7276:a343:d339? ([2a01:e0a:e17:9700:3f7b:7276:a343:d339])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c77393700sm28032388f8f.18.2026.11.17.05.20.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Nov 2026 05:20:20 -0800 (PST)
Message-ID: <adcaa022-50c5-4754-93a6-a4365ccd09c4@meta.com>
Date: Tue, 17 Nov 2026 14:20:17 +0100
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
Subject: Re: [PATCH 2/2] io_uring/net: Add bundle support for multishot
 recvmsg
To: Jens Axboe <axboe@kernel.dk>
Cc: io-uring@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261116111744.702159-1-cleger@meta.com>
 <20261116111744.702159-3-cleger@meta.com>
 <19c6db06-d63a-4dc8-9b0d-11fba039b714@kernel.dk>
 <e29f42de-64df-4c38-888c-64d7c89a81da@meta.com>
 <9e96afba-66cf-4812-b14c-faa2958caa06@kernel.dk>
Content-Language: en-US
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@meta.com>
In-Reply-To: <9e96afba-66cf-4812-b14c-faa2958caa06@kernel.dk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDA1MiBTYWx0ZWRfX/y1BdcL2pG+/
 4n6liOrAK7ErYkd9oY+38ZgjYtyQpIJRki3Bavk+mTRS/GFqOeAJbX2I6576NknR1ccLOUHQ5td
 KgImrsg2kvw5oKgjsKzx6U1MTD/kCnU=
X-Authority-Analysis: v=2.4 cv=f+3dl+yM c=1 sm=1 tr=0 ts=6afc5497 cx=c_pps
 a=pX1sPZUoWPGeQgUnKQNIgA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=M51BFTxLslgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=7x6HtfJdh03M6CCDgxCd:22 a=PAz_-FQ8hEVmOPYdF0yf:22 a=71RdJvaTft_VJkO67YsA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=XGGHjNwGSpTZ5T66x7Ix:22
X-Proofpoint-GUID: i1Zui7doFRQSfzT9TYrYDRgJ29VEiNyD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDA1MiBTYWx0ZWRfXyKpDBpXCg3BO
 W8aGw3cG647yxYf/M/pFw1dOqtdQNbYYvv/qkgktgVYCGVU3MEwDNNO75LNcBumCiuiWh6e5S/l
 6xHaMCMTRBiSltCovkBUoGXQ4tqjYNPasfCintcMor8HW58/XNg2gRkPoy3mjB0VzIPKB4T5O/g
 RBlSCbqGxqV4JP6qSj1H72F9MvqramyAfoO6GjYGahV+KeJMfQu+3kiX85wxCsqwrvSOgFcGKd0
 8GJCq+VDHiqmZfGcOAQV4h/RRFHlxIbklGhdj8a073JbiAoQgXdhlTWFLTRjRNc+1uAIB3Hi5bb
 1p5V6NKv3pvEvVYn860HHhJ9dWxtsP0J5uuNYySBRSQPugTAfSb/mBSUPjdsqMFNVBlPejPp4pc
 ZHq0V52SByvL2SVwtrPech5Qu9QAq+b4guk8yR81M42cjQAV2W5yNvSz5JIlwObBRh3RMrGY1Gb
 YkqjEoRujAW32A3RCnw==
X-Proofpoint-ORIG-GUID: i1Zui7doFRQSfzT9TYrYDRgJ29VEiNyD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_02,2026-11-16_01,2025-10-01_01

On 11/17/26 13:26, Jens Axboe wrote:
> >=20
> On 11/17/26 5:06 AM, Cl?ment L?ger wrote:
>> On 11/17/26 03:45, Jens Axboe wrote:
>>>> On 11/16/26 4:17 AM, Cl?ment L?ger wrote:
>>>> IORING_RECVSEND_BUNDLE was disabled for IORING_OP_RECVMSG because the
>>>> envelope and control-message sizing was not implemented. Enable
>>>> bundled multishot recvmsg by reserving its metadata in the first buffer
>>>> and accounting for payload spread across the selected buffer run.
>>>
>>> Patch 1 is fine (though both need rebasing against for-7.5/io_uring),
>>> but a few notes on this one:
>>>
>>
>>> 2) Why not support incremental buffer rings?
>>
>> I deliberately left it since it required more wiring/modifications. I
>> can add it in the next version though.
>=20
> I think it's much better if it's complete. As a user, there's nothing
> more annoying than having random features only work with a subset of
> others. It's confusing!

Yeah, make sense, it is not actually that much work !

>=20
>>> And the usual, do you have a liburing test and man page updates as
>>> well?
>>
>> Yes indeed, I have liburing tests, just didn't to send them right
>> away. I'm missing the man page update though. I'll add it for V2
>=20
> Great!
>=20
>>> A minor note is that the commenting is a bit excessive... I'd prune
>>> that for v2.
>>
>> I'd usually remove them but they mostly seemed useful to me. I'll
>> prune that.
>=20
> They seem a bit LLM excessive to me. Just something to keep an eye on. I
> like them to be shorter and concise, leave the bigger explanations for
> the commit messages, if required.

Acked, thanks for the advice !

Cl=C3=A9ment

