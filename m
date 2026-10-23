Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792782474;
	b=rEK9STjy0mFNz1HA7wKncf1d9M/+ScVrCtX8l6IYqzVs224dKNCGK+u7/KGSQCbv8Iy7
	 Mi4iUBcQ5KYoeAOuxKBUaxrm919+jAsW4xmJnTTjDyUL1ynj5TZeXbPvHzxFdK3uaPCJx
	 AweHMZ3FI4az6DUH0ZVSyPzm2W+1FeqQpBz3YlCcW+kZrYnuXWCRi/QosRpmQoaOPYix1
	 Km3YM9sMdbqc9IYudhPFf65dzv2Qb7Ri2CIXnmk5n4//ka0e7cXTx9UU+9CGs4XvjwHnE
	 GT0c3KQrNHvYwHmkpUO8AaXXY55cDi1O7a4DRNzfGS1QEIjS+79NI74dn4ftQW+eblg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792782474;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=/BDsE7KYZUbeCjSRjXDmRvAJvYjOJm6pC727IV5UA0w=;
	b=de58VuAsjuO9AUOrgvUEaeqaf7dlEXCPvqoiOKfQcMw7L8NpkRBaQLJuMjST+s2lCCkb
	 3WLTg3b8VqoONTgym17ksH7gplK9eyRo4dP4g2OrZX1upZOYNZAN+Px+GzOHrnCqSjAmu
	 O0VhyPy9cuqRr0obcp/b+bn+CzyAIbzcZ1eW/HLoV6PsIB1nbUxs+xCPC/EwCnHIX9U6s
	 G8L+0o6It/1GsrC+O0fOisXzzQWEyMkADJJpVddpiNoLvjLUq1OgwPw1UQJgCZQUIZu95
	 yz4AtIsz5f3zSxTsl31hbbuCUsm+A7AHwnvhnqsldhYLUcGmjMDXtfS8z0Q1b2M9nng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=O6CsSf4h;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bZXc5h1S;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8AF6606A31B
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 19:07:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B8AF6606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=O6CsSf4h;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bZXc5h1S
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NIZJU13603433
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 19:07:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/BDsE7KYZUbeCjSRjXDmRvAJvYjOJm6pC727IV5UA0w=; b=O6CsSf4h0VM8cbRJ
	xJb4HXkxlxWe3aajA3C8W5033KaRZdEmntURB1fXkMix/w+ouxAXIbiLR3Vwfp4A
	u1MCxQhFNN+Qr5Zoo9EBieLi+KTdhCbRb3XZGbS8DuuDFoLGQ4P29lvBXxxpwhKr
	QKpwak5wQZ2YtZvEeBZblx+yrT3cBKNNTNgtF7fviUa+PdOgkyHIrxmrVLFN/Eca
	61yRzak3tryYrz5+JAv8noDIKBW+hoauKvnL0u5pGXgUy5MXuWHErgriu9PCu72Y
	uy2SL5BFSluJWmZn7B63km8VaGQKqZTu8XzRy215z8Fuf0psn5s1PiSCsXaTTkXf
	ztQNKw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgcs7g5kf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 19:07:52 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-9308eafb465so27644485a.2
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 12:07:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792782472; x=1793387272; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/BDsE7KYZUbeCjSRjXDmRvAJvYjOJm6pC727IV5UA0w=;
        b=bZXc5h1SUL8TtWIRo5+J0V+WcTGMvccxNzlUor6mLq0AjpwvDlAv5IgytDYHMsZT+g
         37rVOO5j0f7WbI9v4G8Upbb3w6AurS/kgfThZV2NgJ+E+vKjLM1V/1eAsuIpE6cm4uia
         cw2sVrEvcxtkfCOu758PHSFLvHE7fzw1Rx7WzsSEGW6MxZTEXU/7U1tWno4edSEHIGO2
         pw6C03wuYucinlyzn0qvtj/AQzVYr1eQDHX7T5Xel7K9QD8oXclZtvDQcxc6X0bT4J3h
         0l+MZPkzuADqmmUgeEnsh6RlVtmzHkjFnzpQqWRuEhHpo4Wmpkyqd3sDK80s2sWgjkuV
         P/WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792782472; x=1793387272;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/BDsE7KYZUbeCjSRjXDmRvAJvYjOJm6pC727IV5UA0w=;
        b=UCd31MfL9zsvJfJf1QGwEuVh8PyXdSYSz11AwY+wm5zu8LbHe0V24xCZzqqPY5KMSM
         4XBxjdIRvjP71DmfY7VUyCkrOhrJc3DVDZx/25yP0O2JKzTYKF1hY6qfGAryVeGZmqRa
         qTPeO51Eb8aTWphbGXWX96+jBjc9S6DQ9Ut0G654f8m6E6p93FxidEzVNkByGWb9jgwX
         pea2CdMTQQ6zNYXn8gqIvbSefdjhUANRRIgEe1zEThagPzBDp5f/AwzINbYsZgZExf8c
         LMA7KfZH2ogzuaZnzlnpBxMZbawKnhyS1+GQPiCSjYyCiPOnWMHWG1QrJ14kQ9B1c9lN
         xCeA==
X-Forwarded-Encrypted: i=1; AKwUvBzvuMd1ft9of08tzeyTqDCyg0gdojgE1EVP6rLKX7Q0LfqI2afZ/f6Yp02jwzS4CXz5R2uhNqgDdyg+T/g=@vger.kernel.org
X-Gm-Message-State: AFq9FYLPhqTAjHsqIeoMtHxi5w0Pr7BStIc71MEUwFeRgwOr/WqV2EX8
	9CS56MaexUq9EjB10aM+8rN0ChNwvF5X3CHsfr7/yTijq/HpoiwuTI/f7X3SwM5fjo3rvSJLgeW
	IjcKzgYBQ1U4WHcy4/EQLpIAvvbdHtUAlSYhLW8a5rqB4ce4CluiD833wk7oW9xy2kiE=
X-Gm-Gg: AYBFou0C6GSQBY5apR//2YV+W6HE/7U70wsmveFv5KM2Sa5sNF4NBatF3IWSXGiExJ8
	XpKt7PgWOaseUKwkrojwHAj77WERdJDi88HyC92LI5t2pdkzaXUR0B4EZA/RHYcKcVuXPXphGq8
	G9tRIVytMoDoHrP2DOaAizY5xGzvAVYUXdLCFt5j7jnqBxIal7v2kTP17StV81GMxSWqCYAhVSO
	OtzrpvoI1NCvql8iqXWJ8i9tMdnMVLvyKlqG8dGuUGees06lyyRhqVuojZNK3GCXSmNxmfMo/jZ
	pGE7miA5PIerwvzXInkm6KvK4FmTn+SzrxkgH5sU7L12fFN6si2i3Klfz8llPEWxm+j4dzNqQSr
	KP6HBwNWlEpMgkueI7UgSYMqcIjHoduowFkMbpsQ=
X-Received: by 2002:a05:620a:2a09:b0:93f:2def:5cd5 with SMTP id af79cd13be357-93f6f9b34e2mr577866085a.51.1792782471701;
        Fri, 23 Oct 2026 12:07:51 -0700 (PDT)
X-Received: by 2002:a05:620a:2a09:b0:93f:2def:5cd5 with SMTP id af79cd13be357-93f6f9b34e2mr577859685a.51.1792782471128;
        Fri, 23 Oct 2026 12:07:51 -0700 (PDT)
Received: from [192.168.1.31] ([85.196.172.179])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3d37c883sm1397603f8f.7.2026.10.23.12.07.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Oct 2026 12:07:50 -0700 (PDT)
Message-ID: <07f884f2-bf92-4264-a289-d40fda9508e3@oss.qualcomm.com>
Date: Fri, 23 Oct 2026 22:07:47 +0300
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
Subject: Re: [PATCH 1/4] media: qcom: camss: clamp VFE clock rates to the
 highest level
To: Atanas Filipov <atanas.filipov@oss.qualcomm.com>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261023152857.2859767-1-atanas.filipov@oss.qualcomm.com>
 <20261023152857.2859767-2-atanas.filipov@oss.qualcomm.com>
 <CAFEp6-2tC+uFJSG8xOhQdrhfCqoDuhm6q0rYc6cROoUG_r1vtQ@mail.gmail.com>
 <dc87be81-0fcb-46ea-b9cc-42866cca074e@oss.qualcomm.com>
Content-Language: en-US
From: "Gjorgji Rosikopulos (Consultant)"
 <gjorgji.rosikopulos@oss.qualcomm.com>
In-Reply-To: <dc87be81-0fcb-46ea-b9cc-42866cca074e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDA3NSBTYWx0ZWRfXyqN2D//NP5rj
 6YMq9KW2kIh3zKKXNT2v7x1qqNylnoSEN8PhgqYXKSo2xrXB5TYduGGPY0wbWchGcJLqoFEPNI6
 rcuBbI2xDYrmO5sD8cikhjhzQMJDdDo=
X-Authority-Analysis: v=2.4 cv=XJCl2ghE c=1 sm=1 tr=0 ts=6adbb088 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=Q/e3f29T3Hw2hnAEzBPF7w==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=j4AJ-kHJ1b0bUOn6I8UA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDA3NSBTYWx0ZWRfX/MU3A3YoW3IW
 dD+3cEXYYV/XoYDsadn+59AC9VGTYHAHA+7DsYp+5eCvsaN+jGPShZ7+YLiGmzLIWZ7BOSH5lIt
 Kyr3vYntzcSZXZhqqFeYX4mikk4OLOp9TjtTTqtVpPJRR1bvoqaPj/4NggRz0HqUgkStfoEszX6
 9e3sfnCG5hj1nuIQgUyEh73RfSoD6PizzVGIGi6oQ5f0O4G6rx/n21YrF5VfjJTQcAWn0zJ8Xy0
 M+kgPoTVHENnDCaYM80txWO5kQn8w3JvQMUWcMDY4UeTTCoOPt/ezU1YM0cT0yjty2ksvXrw5BF
 f0vPmOzBx+c9/QqriZgu9i5cPQJCJp+L1+4FXt5i8CMJ9+AQp5q4/RgnITz3sAlR5C0hgxu8Mwl
 cAoKjQY7VBKh8MJp/B36jvIsy428M0xXQR4QOia0T5P191p7UEmkW/hYwVtapkzWMtxUzAuYXck
 AeGKkcE2tx9TeP0OeQA==
X-Proofpoint-GUID: iBeZqvyEnvbRDuns0FBjycJOkH9pcVxz
X-Proofpoint-ORIG-GUID: iBeZqvyEnvbRDuns0FBjycJOkH9pcVxz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 adultscore=0 priorityscore=1501
 lowpriorityscore=0 phishscore=0 bulkscore=0 clxscore=1015 spamscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610230075

Hi Atanas, Loic, All,

On 10/23/2026 6:50 PM, Atanas Filipov wrote:
> On 10/23/2026 6:45 PM, Loic Poulain wrote:
>> On Fri, Oct 23, 2026 at 5:29 PM Atanas Filipov
>> <atanas.filipov@oss.qualcomm.com> wrote:
>>>
>>> The VFE fails to power on when the pixel rate exceeds the highest rate
>>> listed for any of its clocks. The rate tables of the VFE clocks are
>>> independent and need not have the same number of levels, so a clock
>>> with a lower top rate than the VFE core clock, such as the SC7280
>>> camnoc_axi clock, makes the VFE reject pixel rates the core clock
>>> still supports.
>>>
>>> Clamp each clock to its highest listed rate instead, and warn that the
>>> pixel rate exceeds it when the clock lists more than one rate. Take the
>>> clamp into account when another line powers on an already running VFE,
>>> so that a clock running at its highest rate does not reject the
>>> request.
>>
>> IMO, this function has become a bit messy. We should split the core
>> clock selection into a dedicated helper, as it is directly tied to the
>> pixel rate. The AXI clock scaling/selection should be handled
>> separately, potentially through the interconnect (ICC) framework (when
>> available).
>>
>> Regards,
>> Loic
>>
> 
> I completely agree. I just don't want to mix the two issues, as 
> requested by the reviewers. IMO, if we can reach an agreement on the ICC 
> migration, that would be great.
> 
> Regards,
> Atanas
> 

There have been several discussions about this topic. 
I would like to summarize the background here and reopen the discussion
about the direction proposed by Atanas.

The issue initially came up with the JPEG encoder driver, which is
represented as a separate device. Dmitry identified that changing the
camnoc_ax clock from the JPEG driver conflicts with CAMSS.
I will not revisit the discussion about why JPEG is not part of CAMSS, 
as this has already been discussed extensively.

Currently, CAMSS is represented as a single device and drives the front-end
blocks that write data to memory, such as VFE, IFE, and TFE.

Depending on the hardware architecture, CAMSS may contain different number
of front-end blocks. Some camera subsystems also contain offline engines
like JPEG and OPE.
All these engines write data to memory through the internal CAMNOC and
share the camnoc_axi clock.

The relevant topology can be summarized as follows:

CAMSS device: Front end -> CAMNOC -> MNOC
OPE device: OPE -> CAMNOC -> MNOC
JPEG device: JPEG -> CAMNOC -> MNOC

An ICC path is already available for MNOC, and each device can vote on it.

CAMSS currently has two issues on this topic that need to be addressed.

1. Clock aggregation for concurrent streaming, As described in the cover
letter, CAMSS currently does not aggregate the clock requirements when
multiple front-end engines are streaming concurrently.

2. ICC bandwidth voting
The currently available MNOC ICC voting is implemented using max bandwidth
values. This can increase power consumption in single-camera use cases.
This is not included in this patchset.

Addressing the first issue depends, to some extent, on the direction we
choose for CAMNOC ICC support. Atanas has proposed two possible approaches.

1. [PATCH v2 0/3] Add Qualcomm CAMNOC ICC provider

The patchset adds an initial CAMNOC ICC provider with multiple ports, where
each port represents an engine client of the CAMNOC.

This allows a device such as CAMSS, which is represented as a single device,
to vote independently through different CAMNOC ports. The CAMNOC ICC provider
can then aggregate the votes and calculate the appropriate camnoc_axi clock
rate.

1. [PATCH v3 0/3] Use icc-clk for the SM8250 camera NoC AXI clock

The ICC framework, together with CAMCC support, can represent a clock as an
ICC provider. The implementation is relatively simple because it reuses the
existing infrastructure, the camnoc_axi clock only needs to be exposed as an
ICC provider.

The limitation of this approach is that a device such as CAMSS cannot vote for
each engine independently.

I think the patchset should be updated based on the approach we agree to use.
If there are other possible solutions, please share them here as well.

Apologies if this message is not perfectly structured. But i think is
understandable. 

~Gjorgji


