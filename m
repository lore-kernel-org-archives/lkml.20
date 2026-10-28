Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793214615;
	b=NDL1IQsQ93+Z4NUlGmZZGA0OfNZOlvUuZIUff/hJ68UME8h9W+avhHYvwtnsUNSL2MY8
	 w1VLN0yEIEubqZCywHDF36QtdJVrteCFW9iWPHnzMdt4W5ZK+WXX/aru33zVXWYP8OlLl
	 Ui5RA6/+27VBTfxoTIkj7C5l99V6mJ5JsryMcxnkexi1Tnovgv2tfKIuMYBY9msHQG0n5
	 rLc3otUXMXBigkUmilT26UloaUiN69Z/O9QYCr0PYkRJbNqRbM+Dy71YY/SfdffBZOlqD
	 jIE93ouIHn/qW/lznD725YhYbEfGk1AM8gx5FdTtUWqeixktqkyOVk6tGYPPCmgZzIg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793214615;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=iBmi+kAP/eheALBJyOVEtHklZ+4XvVoLv5bzBw0n9d4=;
	b=v4VfTEhfzFcz5R+P9RnvIEM86hOGI3lJ6DhMieIvBB29ptH9bfoMbZ4L8/yMhO7K85k5
	 yFpySDE7EML3bFkuqlWFH+x562Ox2DUKpZ08dES/8V5tKoL2EYgMNjCBMi9mOif57J0iW
	 2fN6sCzH+8d6Zy0gfAugn2xphBLLXrWkfEz80Lkiogc0r5BDDvN0aMT+HQZiHQukpb7tE
	 7ztoHKAStohk+BjrWUrRJFCLqPnabucIBvwWAHMksAwMKCeiW9p0UpY2r7VYccPqpUBBI
	 0GBlL4OWSULg2rwZpB14wmRrC2aL0AeaUX7R85GDnAwkTk5xdAeJh3ougu0WCpubchg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=a1H07VQW;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FFbAzvNK;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B840606AB28
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 19:10:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5B840606AB28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=a1H07VQW;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FFbAzvNK
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SIPGpQ2994974
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 19:10:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iBmi+kAP/eheALBJyOVEtHklZ+4XvVoLv5bzBw0n9d4=; b=a1H07VQW6GpNeM+I
	Yd8/2FRz01mHhItum6JAE8ukCSWzwpcXlYjvJtOjFWOxmui3p/g+IiRWvI4NYiWu
	/kZ0Qx7R026mn2f2Xun/v67LHo0lHkaEMHtdgMT4KhYGM01CDZKczhVgXWHnxhFZ
	fLReHbQOsDJxG5YbYGA1MgqFYVHeZvi6kI5rnV71eWHPlpJb7PhbvdteXx5HFCVR
	mMwYEOgZ0pLSLEBh+ZhhQiS9wk3PK01IvE1Qz8suyL6K+dbw6HZBdgUmKm8sLlAP
	8KBbPUAfzdQeUXhBBZyguwyi8BGgSMFuqbX6gi4EobVZN5XHQMFBbG/BNUmLh2VY
	ZnzRMA==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkneure87-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 19:10:14 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-1663fb7e005so1592277c88.0
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 12:10:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793214613; x=1793819413; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iBmi+kAP/eheALBJyOVEtHklZ+4XvVoLv5bzBw0n9d4=;
        b=FFbAzvNKaFA6mM81hYDPhV5PZom/2WOphdDQ/K2zZmmg7M3Qb3ixBgbn8+94mnSeNJ
         QdMg+u7U2jfZcmShoLPh60ACXBQIijce6ni1nRN8Jt8Dp3prxSXUbQY/e4EGxolsUhkm
         BSyjmQEBLiJvKBTGUyGVVNGww4tww+fRL9nGIkTIoT4G7qTYJJXmVVKlxMCs8SA0RLDd
         7SonEx5MnY/MM25G9GCM3CkAMDt9AADZiapfLODstxIMlyPWvxZ2hE6UFNtUe/O5GK/Q
         t5/Ug3gnfN+oUReY/i994gcFvUU3Ps5Ek97LG+SRMDG8q3rk9imnkPSBV91rtxz2T+S3
         BHFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793214613; x=1793819413;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iBmi+kAP/eheALBJyOVEtHklZ+4XvVoLv5bzBw0n9d4=;
        b=T3St/jQRbB+jmiKESf1pYWIW8j71FTMPBYZl2b6vvMAPKCm1S3Ze0xqNNrvWtV+V6a
         ARR4Dcg35nmpMAA0gDXh4IsGHF2KvZs1xAI8jrRfQ2DegIw84gqCPbOgICQ87UPaGB8i
         ARngDwwgBAQYUqyo2hfxQcjcsnbX1X7X7kMzTfVzeFPuk575pIC5AxsxPd7ZMvbj6/p9
         MxajZ/lWRfDTv649GFp5xpTq2hO7pqYnUzIxDJerUHMyGIH7l0DFdatKGMRSz1ClgrkL
         Ti9/cIDOPHhsk0p92fEdGiPMIEGcTEi099kJGu6Qag/V0f7YIu8jZOUvFhxDEUKEWdc1
         52LA==
X-Forwarded-Encrypted: i=1; AKwUvBzh3wTX/8ZrnxQ02qezNEdUkh5O3YMBpglLrEi95BtnlVIboevy/qOqrhlvdT7G7vVOFP2dAHi3Zjjsj1M=@vger.kernel.org
X-Gm-Message-State: AFq9FYKfRX7+3tBkZ3bLn7hwLSa62RX22oxXVlhcexr8N/R+rlNqUFRL
	IXMTGl4lL5VkSzXdIo968T1XQ6Tw5dxyyySt2AiKbiBNbUHyizG3Sfwy1/0CtudvohZ1btrqN0w
	eHfaGdL5bJRLK1PBD8Mb3iZ51bUnsmViCE2n0NtoMKGBBD0C+8nm52O1y+6YCWQPJIis=
X-Gm-Gg: AYBFou0j1rEBttQUExD0h9br9mG9ahGHS6ciTHWNk8/hcMhdvhgXCXu6opu792vmBG9
	Hbe0D/URdP8EsVM7/fWszR9XQEuAT29n0iBVNuwSoipaCQ0rEHPJr0tqL3IZSmBKu11dD2AxbC0
	13teDYNZNXQQ0udSdeK3iNtEWXVx1y1z6n7kWhb+YUol3gvMt+NdpboDluMIBXJMQ4mDnb/z895
	9KtR2AtgR5E8p9GSv05HMOQ5hiC1VvmnPLHdlbTCrOgFQGRJMC8UdLIn6yMDVQyJDEjcTdQiWrE
	Zx97JEa2kak24r4uG2ImAvS5s7QRG88KtdDC+diCpouW1dRhgXbLIhi2Ep8VhaL4MmEfgL5Is8T
	K77WnGIWJRwkW4ezf2fJhMVf7uVxeUZS8uIs3SL1GHzZvCpaDwtAs7dhk5VZ3AuC3zA==
X-Received: by 2002:a05:7022:28c:b0:196:c1ca:3489 with SMTP id a92af1059eb24-1a6c2a861e2mr4403325c88.0.1793214613224;
        Wed, 28 Oct 2026 12:10:13 -0700 (PDT)
X-Received: by 2002:a05:7022:28c:b0:196:c1ca:3489 with SMTP id a92af1059eb24-1a6c2a861e2mr4403211c88.0.1793214611893;
        Wed, 28 Oct 2026 12:10:11 -0700 (PDT)
Received: from [10.216.11.72] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1a75a5594efsm10146195c88.2.2026.10.28.12.10.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Oct 2026 12:10:11 -0700 (PDT)
Message-ID: <485f76be-cd91-413c-afda-2f7ec37f2d29@oss.qualcomm.com>
Date: Thu, 29 Oct 2026 00:40:06 +0530
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
Subject: Re: [PATCH v2] usb: dwc3: gadget: linearize SG requests that exceed
 the TRB cache
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Felipe Balbi <balbi@ti.com>, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261004031445.1450196-1-faisal.hassan@oss.qualcomm.com>
 <20261006172254.1058992-1-faisal.hassan@oss.qualcomm.com>
Content-Language: en-US
From: Faisal Hassan <faisal.hassan@oss.qualcomm.com>
In-Reply-To: <20261006172254.1058992-1-faisal.hassan@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA3NiBTYWx0ZWRfX1Lh4vWZGyC7k
 lQK+VjICf4JraE2tRV5yegJR8xmRcMapmkgVhPcUJYNS+DS/3upBipSZcKdb9MVrodRizO77Tas
 1NOpPP3G4B0InB8pgghKt0kUebRcJQoO6jfhdUkZYciRyO29EXT0YeSo1/+YMr9TOlrHKIOopuN
 tIKcHnKhWO9mwzjUDb0nfpvFoQzHTw0GTpaj2sNPnF4yFJAV1K6VfdKWosjDjcf85pNp5S1wMM6
 A79ePcu5GPEVldXbfsll3GBF64r26F/DxxV960mPx2NrD91iNt6DYdumMvIMcULVlzf2s0q88hH
 z1ESIT+qdJWZnW1FBxzFSe94Qa640MgxSygWChl+zneI4fiyYHboSbzDa6i+5LuNbuRdrvUQZWz
 p1dX3mHMOHXbj75ujYOfzsGUgctvMm9ldCe+ynn8gBYhtO9soVcn8Ko9HQgVR8mx0/g1VtrFR8W
 kpVIzU2jYltkNgDvghw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA3NiBTYWx0ZWRfX1ER+7zVhdLoi
 cBM/oYWJio6W4Sft3BEPAeQk/iYGC3Xjqmv8SVtuo/AP/SEYYPI3iiFcCgtjFbwPXCdPkhLwOK1
 I5mk2AjqJjbMLHd/tMfnwEjsz2miv90=
X-Authority-Analysis: v=2.4 cv=LoAHWXdc c=1 sm=1 tr=0 ts=6ae24896 cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=UBcfgiodwL1-yEKGSwoA:9 a=QEXdDO2ut3YA:10 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-GUID: LX4w1Zd9-_2XkhUWVFLJ--4z_PsWfhGO
X-Proofpoint-ORIG-GUID: LX4w1Zd9-_2XkhUWVFLJ--4z_PsWfhGO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 phishscore=0 suspectscore=0
 bulkscore=0 priorityscore=1501 spamscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280076

Hi all,

A gentle ping on this v2 when you get a chance.

It addresses the sashiko review comments on v1: a linearized request is
now unmapped before its bounce buffer is freed, and an allocation
failure or a short SG list is returned from usb_ep_queue() instead of
leaving the request stuck on pending_list.

Please let me know if you have any comments, or if you'd like me to
change anything.

Thanks,
Faisal

On 06-10-2026 10:52 pm, Faisal Hassan wrote:
> [PATCH v2] usb: dwc3: gadget: linearize SG requests that exceed the
TRB cache
