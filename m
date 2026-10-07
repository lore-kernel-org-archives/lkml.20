Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF649472071
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 09:53:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791366843; cv=none; b=XRMHFNP5hjpSE/jpWkcGc8YfyrCdIsCwWhrCpKjzK7HQiSUf+/vc7BHwg1Hzs2ouPn/gTK2+OcxmW37q8EH1vN4VxWxjgK+J7yAyJKmDt2ODh9UHDJ/bwrw99dCYKk91jMM3mtL+5Bz3mWGR7Q2QGdhsfICIdwqAVcqlM2wGn/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791366843; c=relaxed/simple;
	bh=4FILHaW/m3meZucbQysgzno6ZsvSqgHmQpwE8RUeQtI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=O7V+uVy2rfX+D2W0Z8Vk5yiKpxiDTJ/Z9to6QgNGOF5OK7vAXhzXPLhmoNwnYcZTxQ78hCFlht6hSGb02HMS9da4D+ax+mIRE4xh2WQszi0rxRds41y3VjP2xtshDNPYDf1N9XDd065TYRSIiEJPehQuEz57Mune/XQHKu8Tg08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HGgXZTzC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=R1UYqLLl; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HGgXZTzC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="R1UYqLLl"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6977kGMg2711895
	for <linux-kernel@vger.kernel.org>; Wed, 7 Oct 2026 09:53:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	r18vIKWLagSPTg0F2/c9XC5wrThn4+aBw1//HDW0gK4=; b=HGgXZTzCuboNxPFw
	bcuT3p5jRntLG7BTEETbxu5WtY9NcGpN42p0GuekvoBuMUlUZZdrsJYdrjuJqjp6
	J8ydR92t48mDLFevYjgD6s1NlOsSuMcy0PFaOJMFZ5Q6zlM6ZLFSczN+akpOVqJq
	60PTuIGPj8+40xcJvkB1DlOM311TuRANBhyv4XhZ7JW5n/MiuCsqXfUA3aTfyIBH
	lEGCeUDQVvR4vwnmO+pz14z6S3S9kb+T7NbQN5xagbrv7Vb/+YLK3yDBLt1aXFyn
	QXmhuvbKm5/dfoeGUpjYEvU2MdQvJtLGuvS0aYHl5HD1W4HjMs8OApznn9exzPwC
	Nx6hww==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5c1s1jx9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 09:53:51 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93cc359d9easo621568785a.3
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 02:53:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791366831; x=1791971631; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=r18vIKWLagSPTg0F2/c9XC5wrThn4+aBw1//HDW0gK4=;
        b=R1UYqLLlngZp++RNxu/7C1U0KiLBHtEt/UABCmfLM1EZ4Sref9rpXa+WJLZBiwBLeO
         iEvsm+9mkhkLFRersCys4DL1ysoU95UByhb2kkkHpBp9P2gJf+2YKzZBlW5B9uk4LP56
         ADVpPy1LaujFc2auH38bAVlS0IvyFkwWBsAw5OmQkXsoxpdyPuwsJLDegQmS2qvLN+O5
         HPYBtgu8erb/uvAyeWUqMGTOkd9poOL4zv/9V1qsiogrsNQHKcL5RTcdRYHmI/A0sM5d
         GNayrik4Dxi62UVJsDvxYf2JWpu9HRJDGKjJJdASmBp45ULC+tnKQw4oGD8ynUHTk4c4
         zhHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791366831; x=1791971631;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=r18vIKWLagSPTg0F2/c9XC5wrThn4+aBw1//HDW0gK4=;
        b=2iTaZSxGwgh3JVOIbg1nwzpLsPx7cG8jkE0SvfBcNGjRKk5XYJWQb5LMVtohe1B5Ee
         UK7i2OSd17+8Y4auV8drF8ZDbbi1egkAi2ld5vqKoTDKWMhKlcvfs91HKJxueflS/GlU
         pdMnlxR/nL5koq/iOr5I8ICdP+5Mqq+TzrKnQXm2i1nw+FXpFLJYI1epimsHF6XqBcQ8
         TFUWSbMUnVJVS+wj7CgrZjmDDAXGncIrnLSsrRzV/sqGzTwpcudsrbT+G9X+QATiYT0n
         lUOzyohMOjq4nhQjxn6hrqm8P4hqYeCOo6/LhP7SVNQUHMv2zPJliZyTyRxuxiXAHYfK
         pJIw==
X-Forwarded-Encrypted: i=1; AKwUvBy2HGo9qBL83jWc3HbR/JEZ2T4LfUeJz3arC8FoTZux+BGQHgXF9zBfj95WWMcG++FIml5Wuxkklwway+Y=@vger.kernel.org
X-Gm-Message-State: AFuF++k5CG3uwPnREaSYwC/EGjfosfDf1A/oIXCLfp12GrU//kLE6kHq
	5hzDXv440IVahKqzPdH/r0PTBxTez65KUb8rSnieil1famUoxwdlOYKeYKHZxYA/s4kvIzsGsD9
	yISO80muKi22DnfCJMYAQvudzQbKyBPnqTr93BZfoHkmQDme19y0hsY60up+NxQr9puE=
X-Gm-Gg: AYBFou3C1fhevnxonoemFb79k4tMXfn7xmW4jLPTI8KR3Qt3qTOlrnriVCMbiXhj6T/
	x/83S6h7VA1CKw4sg5eX/n5K1Y48ixr+z/zGTaTcw9rb9d4vv7SJmlU3VXNSOXt7L3BMVCPY8U6
	uJMWTeL1BBk+VLuSNoid5OQLd6fTrpljVmU5X3k+AFnS2JHuBYjOhwm2XUvKIA6oMade5q3LZTw
	mFPqkVCxXN4LqKTSmBMorBNQLYBWgAEq0zIkkA2rQwi4hRhrVRoxtMuILeIHoBlFmIclLD0lalg
	xszSTfWZV0+gOOnMU6hfA5GLlb3QPmeOQ6zUU6eBUi+eQDsXw/GYl0jSzOnBXbJOBAh6laOlCVB
	BEDVHFon9Qrt6XE5iicRazfqqQjExYk4kiIa8+GE1
X-Received: by 2002:a05:620a:2790:b0:93e:7192:191c with SMTP id af79cd13be357-93e9b700bd5mr333151485a.17.1791366830882;
        Wed, 07 Oct 2026 02:53:50 -0700 (PDT)
X-Received: by 2002:a05:620a:2790:b0:93e:7192:191c with SMTP id af79cd13be357-93e9b700bd5mr333148085a.17.1791366830419;
        Wed, 07 Oct 2026 02:53:50 -0700 (PDT)
Received: from [192.168.25.64] ([94.155.124.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48c71d3d44asm4845181f8f.54.2026.10.07.02.53.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Oct 2026 02:53:49 -0700 (PDT)
Message-ID: <2799181b-df9d-4d02-91a8-86b77f920da8@oss.qualcomm.com>
Date: Wed, 7 Oct 2026 12:53:47 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 17/45] media: qcom: camss: add common IFE subdevice core
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Gjorgji.Rosikopulos.gjorgji.rosikopulos@oss.qualcomm.com,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Atanas Filipov <atanas.filipov@oss.qualcomm.com>,
        Jigarkumar Zala <jigarkumar.zala@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        hariram.purushothaman@oss.qualcomm.com, pshrotri@qti.qualcomm.com,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        johannes.goede@oss.qualcomm.com, konradybcio@kernel.org
References: <20261006223953.3382273-1-gjorgji.rosikopulos@oss.qualcomm.com>
 <20261006223953.3382273-18-gjorgji.rosikopulos@oss.qualcomm.com>
 <c1cd9e24-b1a2-4c30-aa99-7c0cf6f19077@linaro.org>
Content-Language: en-US
From: "Gjorgji Rosikopulos (Consultant)"
 <gjorgji.rosikopulos@oss.qualcomm.com>
In-Reply-To: <c1cd9e24-b1a2-4c30-aa99-7c0cf6f19077@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: m3rMaEFm1z_qnGn41xNdBLLamdrrTA58
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA3MDAzOSBTYWx0ZWRfXyGRzHzgNITWq
 1mmCH+EeCyIScGGK/daJQBgP12AynCmOjlxqPq6ROCifQH3Y9ABL5IKu4Ai3NiBbpeUANTjVUZr
 hoC5cOJyp17RwmpDciP3Nd8hw/gA6hS4JCNS3qfmt1uDlWgF2aj+MXqkAK4SQr7nBqp2Ie8mG6i
 VpA/stYnjylMaRLKENB2c7S0in9EZl6+J7kUN3I5+/1e2KZOMOLQQ7HcoZ/b1j8VQZ1fz3UZRY6
 4w66gZTMbYc81DeHdWJ47q1GyIXsSyv9LfLMUJhZE41cY1nmXW00YLEbvNpTpme/776ywjqjVSM
 jn3Y/T5Q5M/etlbH9mQxzdH0JNfJkf62PT9U6c+l20a5MGMziIyZvHNP5MkpAJnXbE2R706H/rP
 dXpo8SbT1crOGLRigSJz/87KjyYaSBKDGWQWo+1eocWOkF/wTI2tdiXGRDS9Q+vdTsuxgGqkN8P
 /k4VimBDHlShOR6P7hA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA3MDAzOSBTYWx0ZWRfX2WV29riOuhsU
 XGStNrgfv+ZU/kmNTRnVcJTuJEejAnQBzBlpaiNJ3VytIkH2CxmwbjHt+26eRIdhVaTI7MXyr27
 AkwjkPoRV7urVLHMeHzUJXT9BBaP3xU=
X-Proofpoint-GUID: m3rMaEFm1z_qnGn41xNdBLLamdrrTA58
X-Authority-Analysis: v=2.4 cv=NatzRGD4 c=1 sm=1 tr=0 ts=6ac616af cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=eGCDHFSXubCXFTSSGhjuOA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=ddtxKsdqBGp8r1WauXcA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-07_03,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0 spamscore=0
 clxscore=1015 priorityscore=1501 impostorscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610070039

Hi Bryan,

On 10/7/2026 12:42 PM, Bryan O'Donoghue wrote:
> On 07/10/2026 00:39, 
> Gjorgji.Rosikopulos.gjorgji.rosikopulos@oss.qualcomm.com wrote:
>> From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
>>
>> Add the common IFE subdevice core. It manages routed streams and
>> formats. It also handles buffers, hardware pipelines, and media
>> entities.
>>
>> Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
>> ---
>>   drivers/media/platform/qcom/camss/Makefile    |    1 +
>>   drivers/media/platform/qcom/camss/camss-ife.c | 1617 +++++++++++++++++
>>   drivers/media/platform/qcom/camss/camss.h     |   46 +
>>   3 files changed, 1664 insertions(+)
>>   create mode 100644 drivers/media/platform/qcom/camss/camss-ife.c
> So, having a new IFE along side the existing IFE is not the right direction.
> 
> Please see my series on IFE for sm8650 Lanai - which rearchitects the 
> driver to stop pretending write-master index and RDI are the right thing 
> to be passing about - instead reformatting the existing code around 
> lines and outputs - which is what the hardware spec itself discusses.
> 
> I'm very enthusiastic about the hardware enablement piece of this drop 
> but having a whole new driver inside the existing driver is a workaround 
> for the technical debt.
> 
> In fact the first and most basic thing to do is address the technical 
> debt and _then_ add in hardware enablement.
> 
> I'll reup that series to V1 status - and lets look then about how to 
> stack your hardware stuff for 480 on top, should be 1-4 patches extra at 
> most.

Do you not think it is time to left vfe and move to new code, but perhaps that discussion
will not came to an end, because you dont even want to argue whether to have VFE as it is :-).
If we go with existing VFE i think will be good to have per pad
descriptors and abstraction for the internal modules. And i dont think is ready 
to have multiple pads and streams as of today but that can be fixed.

However i know your opinion from the beginning and you will not gone give up
from that. I will wait to enable the 480 and move forward.

I am reviewing the series you have posted lets see how will look like.

BTW maybe other reviewers will be interested to look at the code as it is.

~Gjorgji

> 
> ---
> bod

