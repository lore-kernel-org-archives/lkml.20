Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793634067;
	b=kw81uC49NdrCRxdMZaKmjK9m0VOn8ood0dH6rKR/ypN8MeqlSqHgxMTiP6dHktGKAUFo
	 n4k1t76MSkZ5bHF0ZTsKLksnnWkT0gtIhkUEhJBPWNNF2QruQcSR4Fg11VjOHAGKeod6I
	 tDv5kavqP01T8q7KcF2cmPwG9Vwx0sjJ5BfncjeddnBIJvVyagIj22c0YoSJOs+wnOOm0
	 /0QMz/cs8YZL+8FPtKDBH8/DlP4UQcOp/6rjf8gYNnhoPcWlaHFNctzji5nt/HIH/X5kd
	 LTRc4HAdzKZgu9yFBg2Boq67Op+P/4aOcwTfYAflOcaLa6b5Ci1LKw+wxh4n5a+hG6w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793634067;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=KSM0LPJ/twbzspCAfiN0Ld78WI3u57X0mIKF6RhiQ68=;
	b=XuW2m2qiDwxwoCB+XOflkPnvbofS0roR2NE5tPIvCgv+pDP0IMauiAUHNOXFSZiHIQgC
	 +QD4qAUwKIYdMaJSgAxJFMymDXjhjiq7JvlbKt2KUrfvpVs/PDf/GzyAUtRzPg4X3UzRj
	 VnmrdXI95HTBVAm0OnUepxDL0DGlFGQBuOpIfHJuUz2xKoUKpKtY3StXjRjPU7ohnHMIr
	 R5wR005RhaRdNylqtQ8/lNJJaM+91vrD2ygkKBGKEDO8vkzgaDBGyISs3Mh+uZapnj8zN
	 eHx1zXWP4ONsXa+69WjqCyKOC+T5eZF/LrpzuwAEBxmgmBtC4CAT/oz+QyBch4P1k3g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LMVBN3gn;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="Frz/jIoP";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B05746072C71
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 15:41:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B05746072C71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LMVBN3gn;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Frz/jIoP
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A2DpITO3102577
	for <linux-kernel@vger.kernel.org>; Mon, 2 Nov 2026 15:41:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KSM0LPJ/twbzspCAfiN0Ld78WI3u57X0mIKF6RhiQ68=; b=LMVBN3gniK+oKSaj
	8Xe12UZ6/m3EG2h7l3iypzlJP0ERKiJSCUZHi0Q9i5ohZwbTwuSlamv621hqQkEk
	vTM7JvYpY0z3jj82lIbfc07Lu6OXQBAKsb1+b74FLVCQMI1d8NEmimlDgq5lR+kM
	WPf9F/8Mgui5us3FLRxAK9QqyXJoaH1YsT/7ElNtX8zTfJ08/bRnRAcW724Ll/zx
	bNkRKQlzrUp71VtlWy1LFZNdPxyU58XnI5NiZ0ETa4JMnGGAg1SBH/oSJLfCi0vc
	eDziGlzs7F9x0yh75wHQisu35ZUb+6pyBWl6QGIbF6UGqqzCSoTHpLBJylLrocwz
	jgHIig==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpk9rjkq1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 15:41:05 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-36637676140so4358048eec.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 07:41:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793634065; x=1794238865; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=KSM0LPJ/twbzspCAfiN0Ld78WI3u57X0mIKF6RhiQ68=;
        b=Frz/jIoPcvowYrQr4gnVw8Pac2Q/a9vn0ZEW8ljO/2PO8b4+0LwDDE78vlYxp+TJCd
         fmXHaVGc/xVcdRyWg6ARtasiOtwn/bxtIXTZ1jFqf0RKk8d637C6cMpFhqHdbVyWdLu0
         +QYld7Nu7PUyRNdq24+TozSMIDL9WVb5XWdrGTlE05Xs0dqc0nsJ4ea2xTyLrDcILQUG
         aaGN85kqKolD4/kgD4hXwRNHBZV+O0tzF7ZnyCGi+1wngJ2lSe/fF3NUG3u46yKOq+/K
         9VI6zl6ukMD/UyEcU9/c9FBR12XG+BpX2XWfLiiNj5/F5cdznnsXeUintiTfgMgEsxHG
         aUJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793634065; x=1794238865;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KSM0LPJ/twbzspCAfiN0Ld78WI3u57X0mIKF6RhiQ68=;
        b=GIpLhrqysn28juEi1IpjfdenYSWf9ZywLqPvlZWhg1GqldHKtRe3aqEWYkcEJTasq8
         FGkFyicG5k09C47Yy7UiEZVlWXNBAbRB74y7R3GlD4tD05/5bR9rgxzPtXoTyFBGJfHZ
         5m1Mf/OZKpbSa0acyOBrNw93tScE1ykq8g1B5Oz0lgHocKFmkjRL+1GVUd+VOO1rJugV
         S6DglubfTATEfG3gMS32MTuHC9qbHaufkq+njTXxH//+wQDxR3APqnbRfKfrH2+OMqMJ
         eoCCRcNnV0kqky5oNrDgaW6DN8iOLgjKxgH+TJ+fktcrfh2MN+LMC8ABBicoiwJsqvy6
         JT9g==
X-Forwarded-Encrypted: i=1; AKwUvByjJuZ71vX2kRRJMQQKZjXmEcQnB97FYe5p6V2+lPZSls7hNaAmtj646GtdK4X+UOI3+MvTE/1nN2qNuSE=@vger.kernel.org
X-Gm-Message-State: APuU4Z+hZsTTc3XnD9giLqMXVvOhuLZbvLUHetkyqiZPteQ1KbCETdlJ
	wCRS8WMQzLMxfnkbqUINRTlXdhzAi985NTlhIQ9stjSD6dzNHF4ZXu6DoE0iX79my/+UVZm3l8C
	NT4LuOsegCUw7WE4qOf4B24Gn5yviRoHQKBqnWNg78hbosBnPjl5Db0JM/5qR7g06l/3N/goumf
	8=
X-Gm-Gg: AYBFou1kJaLXBuQJKoSam6OqUdbQb9zeRpl8rQ+umG1gXBtNzn1FF1nAOtfc6t8ve/8
	RETB/9HHaYNQdDiHhsjdXu9Se4rhXb2kvDmgNQSD/luoMgiBML9oYKxlAX+keWQ5R9s7E6lTkKr
	eRQZulRDhOga5ar4blV6QyMfvOhFUaGSVAQdw5OrPUvqC8ugK3scLLLIpXMCaCL3yn1LxBcq00y
	6bRNJECXioKCGsynki2dFAPnYBlNMIjqmKOMOpcSeA23f3yK1C41z1LFwtc94FgGQYuaNJ6SPJu
	JUjqiZeX/RK+10CT0gJM7/4dk62702smaZiulgRjO9xeNsU/6BraDhCsErndtg31Syk2aa5jGhw
	DbmaZ46WRE3i91CY1uOoP/FvLnblvWAZxXJM+AvhIHtzrcxVEwffzeVI4MBrF1kKbJmYN3McDyr
	bnOceAIQIlByV1Rl0Ls86qpxdnYBJfqg==
X-Received: by 2002:a05:7300:e9d3:20b0:369:fe81:a575 with SMTP id 5a478bee46e88-36a4243ab94mr18693235eec.35.1793634064906;
        Mon, 02 Nov 2026 07:41:04 -0800 (PST)
X-Received: by 2002:a05:7300:e9d3:20b0:369:fe81:a575 with SMTP id 5a478bee46e88-36a4243ab94mr18693184eec.35.1793634064211;
        Mon, 02 Nov 2026 07:41:04 -0800 (PST)
Received: from [192.168.1.20] (33.sub-75-218-193.myvzw.com. [75.218.193.33])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42a5fb97sm42243509eec.23.2026.11.02.07.41.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 07:41:03 -0800 (PST)
Message-ID: <936d7fdc-fd79-4869-b39a-7219d2ce4979@oss.qualcomm.com>
Date: Mon, 2 Nov 2026 07:41:02 -0800
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
Subject: Re: [PATCH 1/2] mac80211: move static function from header to
 referenced file
To: Omer El Idrissi <omer.e.idrissi@gmail.com>, johannes@sipsolutions.net
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261017155509.128114-1-omer.e.idrissi@gmail.com>
 <20261017155509.128114-2-omer.e.idrissi@gmail.com>
 <b60d12eb-dad1-4482-89ca-155dfcb410b9@oss.qualcomm.com>
 <2070cf87-bc38-4237-a58b-6554572a8842@gmail.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <2070cf87-bc38-4237-a58b-6554572a8842@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: MbT2x9ocfmD1MG24lRF9I9npx7K6-JA2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA2MiBTYWx0ZWRfX4cfdkNWsEaOI
 p/kAEaX3jX2zuJ4GBiCh9ZBgGf34EEHSiR0bIRGeHfdpHySyjAaLV7UdBrqCTvmKiYJo2RGH8bx
 6AderaQjB+i1sC+EaBdL7x0OuOE8to0QMzi+wdxT2Be8wGYCcuIqhG7FDNMLHX5VYjnvUUtZR+1
 0WC5sfh+SoBY7fsoanmC90Hm3NaQd0uBANfHXgiIe4Tb+KsWtCgDI3cLNl+TfTCAVhkmIuP4t4S
 aCRaYOAjt2Yl030lJiR0sQDddLQqtwsGHkvNlHw/R47+7lhkYAK/hB6nwGDm5E9sOFSQv2lWr1l
 eCTDsEV5rzWT9QGw6ecSWdpH3xg6s1AK0WRvxHSWUNugrRRIyb8Si7MXrtGSzMf6ny9+3qH4FJF
 /SBc8sOm8ERcKzU93WkgLbPpuO3/vyoUSWGj+6ryG6J7AH/5xdwuleoZYjeBiFUvZllsksZvQOu
 esLUBSunQu87GOGBoQg==
X-Proofpoint-GUID: MbT2x9ocfmD1MG24lRF9I9npx7K6-JA2
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA2MiBTYWx0ZWRfX08cTLGgCTuuf
 u+7B8ozsbQkP+gcdPhCaMhVDcjpN5dSUwunWiPb5tTUrMmImZH7kRgNVrs4eF/ZfU+Sbi+S5/n2
 bl0yzuS5ajgx71F+sGubw6mM5uJmegg=
X-Authority-Analysis: v=2.4 cv=LvwHWXdc c=1 sm=1 tr=0 ts=6ae8af11 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=AnolQpdaNwb4XK4FG+QP+g==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=Jp9NQ60Tfon72AT0SvoA:9 a=QEXdDO2ut3YA:10 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_04,2026-11-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0
 phishscore=0 priorityscore=1501 adultscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020062

On 10/30/2026 6:21 AM, Omer El Idrissi wrote:
>>> Move static function from header file to only c file it's used in.
>> why? all the drv_ inlines are in driver-ops.h
>>
>> first rule of commit text is to describe the problem you are tying to solve.
>>
>> don't add unnecessary churn to the wireless code.
> 
> i moved it because multiple files include the header and when those are 
> compiled they don't see the tracepoint definition because the next patch 
> ifdef guards it under the same config that enables the only file the 
> static function that uses the tracepoint is called from.
> 
> this static function was only used in that file and i didn't see any 
> obvious reason for it's existance in that header so i moved it to the 
> file where it's used.
> 
> commit messages are kept in the git history. should i send a v2 with a 
> better commit message? or is the patch series problematic otherwise?

I can't speak for Johannes (wireless maintainer) but I would not accept these
patches. There are thousands of patches active in wireless, many of which
solve real problems, so the maintainers usually don't have time for "noise"
patches. I have over 400 patches in my ath.git queue alone.

/jeff
