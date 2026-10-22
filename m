Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792661674;
	b=SOdYvRVTI/utcch04b/1vR7jofy2qr2irFjs0bb5RXjoD+bWOAUCKJcnD/rvlWJaciLH
	 3kqXC8Q4sQMGAhy3Bn7zI6TaCj+ru1QXaVd160pvdY8kxZzANlMAeEuEcpZNmGEcQtv/U
	 zofjzHt43v6AKOQK5uGB/x5u53WFg3ApI7rNAoEVcvvbMEHqHDWPGBMGvfUzWjCzgitWM
	 wN8iULhN0AMfL2Le7dtpTG/cTRBajugJfB7vQfaAa2rhwQVTYBF+JaJTP4Qr3fgA9RDXh
	 Mzn/ImcK86GSTeOSwr+MzwJAub3Wv2UoC/+Y542pyc7n6NA7FcgJpHqkwFyNgfCQlxQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792661674;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=1Rj1qoidH8EWT/n0srs42IuX9uVyDVj0QwR1LQZqHvM=;
	b=mgT7LDYo32Nn36vwTcmlnGwlt8jpLTnURLVWQ/vvxQXF3O3DqYuUuJLVPK3YAR7PvoRU
	 ijK05xDTaLQImsMsJGQgcs2t7BxE4R0sS74i8RBwWysWvjmN0ywmTaYSjyfyvBuB2mZD0
	 DJNSucnHG8eu5nxHDbUfZ9AUdoQuve5XuEX3fODfQ8TsA/zrFzcfPhZrOTxLMX4VMW5sx
	 5ihZ0PVhO+WX1UzedOWXOULd8+n5JKgY7IqT5c8zNeMQDdmmp8UmRrvlWwVAM+5Y5m3Cp
	 DqhNzeengX0lBE02uVWu5G4AmBbaimsJnM2bo/y+zkYxMno8oPmfCopVM5w9NPLZ18w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PwrcdF+D;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MgU08mWf;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C9AF606A31B
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 09:34:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5C9AF606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PwrcdF+D;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MgU08mWf
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69M6xsRl2172035
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 09:34:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1Rj1qoidH8EWT/n0srs42IuX9uVyDVj0QwR1LQZqHvM=; b=PwrcdF+DzUJmRnde
	hI8F1YEjOk3dDfEL5mPGuYlg5y0weZGfzUQvhEGuLehfcUPQnezsoOltce4qCb4a
	bmPBXs1OV01hZAOhn4bcnQWyIoJghdPK9LhVpFL5LaJGTb37Fm3u0Xlx2UnwiDXK
	jsl9tPr5zVPw8tidZPUcLjYo3IInZ/qeMxL2AOkpLF6m+xmqOrz+9gM58ZkNOqH6
	Ggkbama+CbUkq5ipxnbhKEBCjpb9Px3G45hfg7+A0eDpqgl6khjQCo6BC9sW6tPS
	6+wo3Bkk0dpz/4EzjVlGUpkCGhHZrqmqE4tPEJjtwGY+0fxaeDeEwDK0H7u4IlZB
	H721Gg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf93ahqpe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 09:34:33 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f2bdebfc5so46887685a.1
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 02:34:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792661672; x=1793266472; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1Rj1qoidH8EWT/n0srs42IuX9uVyDVj0QwR1LQZqHvM=;
        b=MgU08mWf86/eCmVEtWfCW81VxhUZA0IAFd+mldO2lpHBg7Rx0kyTwb76uZCi8BLjmQ
         BciNCxC6mVBsjtW65+k01x1OM0cI7ZEF26ibQxsM6Rl9qZNZgsTBIkDi/qJ05yBpy3nO
         y01b4QLbSaLBmFqplinVJLTEixRXK0M8nFA84+zNgA8F+/bVuTiFfchDBwcoDzZefkGQ
         XnIx9YZujEc4aAwtRvzH6GiWAFLmgiKL/x5I6ZkwKwfk68cE4gikbkdDEYpMTxcrEOQ5
         1EgkwDgSNqePUK4kEYYv3j7cEYz7K2PeBw5W5SYjsvJ860T3wZllodb8xI7/93pwpRLP
         FiMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792661672; x=1793266472;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1Rj1qoidH8EWT/n0srs42IuX9uVyDVj0QwR1LQZqHvM=;
        b=fZ70g8S4Mm3i7h9/MhKbBJeHY3Qc6efWfPi6+xlohhNIGjLYE1hLKL5LOEwTaZNn6I
         BB/T00gkkIrI0NNJ1YoQdIeZVOrEUkoK3xkC12Og2Oi/p81muzodBnrHFqJ5y38T2YNo
         e4kyxOW4JLgt/1Xy2SH2MVaN/LO+QfWJiSxd8rBved4T9qUNFD6IdvWtg0wgAGfpB1gy
         6/HTUiivD/l3jba0tvWYcOJ3qG52frqVo7ZVujzP9JMZJo3NxQoZuKLNpFuVARizeS1B
         Sk+w4m0hMIO9dM5sPMSRORMG7J4gzdHwvhxMN19cjUsFZ3a+YD8ICFU8XIVgy7Rq9sub
         D/9g==
X-Forwarded-Encrypted: i=1; AKwUvBzg9S2+YFKkAlnn2/5D/XcR8+SwUBfBk4Dsr4Mu3zfKmmCEGX4SqNtS7RDuzp76R2y7wasgufbz8xJ8Eg4=@vger.kernel.org
X-Gm-Message-State: AFq9FYJs1aeWlV7womc5G9Ps0Kw+HKfZEdizHWu9+Hyn449Rb93mJOry
	/llKode2mLie74QeWYQKs76wuHltI5qZt/+7Re4PDeYTXLjBKGv1hs1kmtLEw0K4Lx2lF1iz0G1
	Tu72zIVFfZuSreeETEos7L/YaVon9uRqBGKxotk91QcMi+xf6xUi8iIM61NSquHfjnTI=
X-Gm-Gg: AYBFou27dDcppTaAqkYHl4RYgLzOuUuo/MUbedLg8g1XSImtvpQkndpsy26DFQOYewc
	dh3TeevDozOZkZsrFr7/MfLpPlGVYbrYfbvuLT9vPy1No8gDVtIa3AHGNDoAvKoz8nQdPnu2Z8m
	ehNK3Xd3Xeqnuw215cH3ZOgkzv05b3Qjw6RjznTV5okmSeZbR1JxddFPy+OMePslkd0yelrhpjg
	wemqJ+T4oGowlxiq0W6ty6pcs1ZcH1Tf3g2SAL5DkJB0/ZIyxlmPydcMGVKy81eQ2jQGJUW7v9T
	8/hOdu/YkJWL9mZj8U5qLAiB+GVYxz2fjUUpWqW8jnA5DvcmEW2g3rz82hBN6pMIGnCAhinpPx1
	W0wALAZjXbZRhyID6ftE/cA==
X-Received: by 2002:a05:620a:19a0:b0:93e:54fc:2c79 with SMTP id af79cd13be357-93f57f72681mr930305785a.5.1792661672503;
        Thu, 22 Oct 2026 02:34:32 -0700 (PDT)
X-Received: by 2002:a05:620a:19a0:b0:93e:54fc:2c79 with SMTP id af79cd13be357-93f57f72681mr930303085a.5.1792661672043;
        Thu, 22 Oct 2026 02:34:32 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c468a55c001sm84619866b.31.2026.10.22.02.34.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Oct 2026 02:34:31 -0700 (PDT)
Message-ID: <e26f0360-aaed-4e40-b1b2-956c92d34db5@oss.qualcomm.com>
Date: Thu, 22 Oct 2026 11:34:29 +0200
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
Subject: Re: [PATCH 2/2] arm64: dts: qcom: monaco-evk: Describe the PCIe M.2
 Key E connector
To: Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: Manivannan Sadhasivam <mani@kernel.org>,
        Wei Deng <wei.deng@oss.qualcomm.com>, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, linux-bluetooth@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, quic_chezhou@quicinc.com,
        cheng.jiang@oss.qualcomm.com, shuai.zhang@oss.qualcomm.com,
        jinwang.li@oss.qualcomm.com, xiuzhuo.shang@oss.qualcomm.com,
        mengshi.wu@oss.qualcomm.com
References: <0303224f-4c2c-46ec-9866-5ea1fd0fb4a3@oss.qualcomm.com>
 <20260825092715.5794-1-wei.deng@oss.qualcomm.com>
 <isbrpaztfrgwfcleujrn4w26cshbi2mgn57tbh5bubvsegn6lc@jh3ab6htvd24>
 <83b67ab2-ab68-427a-94aa-881454f457ba@oss.qualcomm.com>
 <CAFEp6-2KDxDrfTZLN7KPRg=aavj8nqQr7ftna23n9C1Cpbwwbg@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CAFEp6-2KDxDrfTZLN7KPRg=aavj8nqQr7ftna23n9C1Cpbwwbg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: SziVhWOvtq0LJCqWL55ZnI9dkmnRIfQm
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDAzNyBTYWx0ZWRfXw3g+5zI+G4Lr
 gyLRjVjgUdQrf0P2XZ8MoizAWw8hzBIvFzFHySz1ptSM42HJ1pI8HFZk2cm6TaJTdJDMRtF9LYC
 Ma82/11+/DTwt+qV5kqfoY/E+aIHmDc=
X-Proofpoint-ORIG-GUID: SziVhWOvtq0LJCqWL55ZnI9dkmnRIfQm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDAzNyBTYWx0ZWRfXzaCrwrI7UHDH
 ywQfpCWSk/gX/aMum31gyNpsQeU1/Zm+/lLsd79jo3vTR6nxVhWBcWGTmEqDEY8BLKvC4Ajs92M
 u4IcIh1po7kwxWjpb/ckrg5N+aUzaPvHByK22exBy6ix4GM+WKLg/UqyL88luDQloxrBogKyUEz
 xGgVrtMhzfKRyZll2mMw6XIefgs/GmLAV61SYBIj0UroIG1Fr5NowG/IR6orNnOgbPduXJwH2H1
 Grp5prkL2Ywkzz63wdXo3y43BPg75/oaAgeDSDjbjrp6R6kzCqZ49YINytBttjbCIP+F3GyWOug
 MInjDgxaaXCCCxJOmmUoQ5FJlUhBrIholS9P9S1ZHUrRLF7zaNug+cbXh/3yfCNAvnDMWUijCZX
 CTS8W8ec0DO1oX7RtmA+jfTlhUqfDAm+px+QWAqfPjHWcs3/JLZVZXqTUCoQ4g/0CDE0NEWFKVz
 +Jvsaz2LvNgLTroCFSg==
X-Authority-Analysis: v=2.4 cv=dOszC+Zb c=1 sm=1 tr=0 ts=6ad9d8a9 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=9AbZo8Gtoo8lc68VITMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 malwarescore=0 priorityscore=1501
 suspectscore=0 spamscore=0 adultscore=0 phishscore=0 bulkscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610220037

On 10/13/26 10:13 AM, Loic Poulain wrote:
> Hi Folks,
> 
> On Mon, Sep 21, 2026 at 2:38 PM Konrad Dybcio
> <konrad.dybcio@oss.qualcomm.com> wrote:

[...]

>>>> We are adding M.2 Key E connector support for monaco-evk [2]. Konrad
>>>> suggested moving the port/endpoint anchor nodes to the SoC DTSI
>>>> (monaco.dtsi) for clean DTS layering, so that board files only need to
>>>> fill in remote-endpoint for boards that actually have an M.2 connector.
>>>>
>>>
>>> This means, the dummy port/endpoint node will always be present even when the
>>> M.2 connector is not used. I don't see a compelling reason to do so.
>>
>> I don't really see a compelling reason to defer re-defining them to each
>> device DT either..
> 
> Adding an empty port/endpoint at the SoC level is problematic for
> uart, port is not always expected, this depends if the uart is exposed
> through a connector or to an onboard device. So we may end with an
> unconnected endpoint but still have a bluetooth subnode, which can be
> a bit confusing... Also why adding a port/endpoint only for a specific
> uart in the dts, and not for the others? This is a board/SoC level
> choice to use a specific uart for M2 or not.

From my perspective it's removing boilerplate. Currently all USB and
PCIe hosts already define their ports and endpoints in the SoC DTSI
and if they're unconnected, then simply nothing happens.

Both 'ports' and 'endpoints' are an abstract property that signify
'X can be related to Y' and I don't see how that's a problem here given
UART is very much expected to be connected "somewhere" (with the
"somewhere" perhaps being external/a pin header)

Konrad
