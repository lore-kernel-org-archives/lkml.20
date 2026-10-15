Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BF96440628
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 09:43:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792057407; cv=none; b=nOHvy/yryXAyFyr+8oNI5m2Bje6r0JOZiJ/xw/iCNPFmIjaAXHWzLecpdGCj0Myk44VbSQuRm7jlGap5pFiqSbnnX21H2upEEuOr1k/a2UmrJPEhc0JnfFC03i8i9yPGXdaokQ5eC4iQ8eZ5X8WMXyzEBuBTNiYW851mGG1a3RI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792057407; c=relaxed/simple;
	bh=H8NaE9LzYbEl3BGqNL/O3QntEmXsHzAZ29BebUdMpTA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NwZFql3yoGsnK0enCcQ2w0gT7QM9BleiYYoGEyu4yAlDWvvY13hpEJFv12WF7IiW0UbqCaJVa2zdFarM9xIW5TP6tF/J7vopBl6+F0va8Rm6sAkhjiFni/u6oGslUd9OTlNYZHWMlaFaBcQWgREv0CkvVDUhMjFd3svskVeNyWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UgAysyLw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kZoW8k7y; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UgAysyLw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kZoW8k7y"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F71sxM2122209
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 09:43:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Tzf73yGEud0D74ONzoUYEsG5WGkzmMwPfPRaWzQs8VU=; b=UgAysyLwyHwK9pQb
	adctrMIYnE742HQ/AVojqu8LLGrWCdkYMWz1YzPSx++Xgd4LKbvOQXSRm25G57Pv
	cCDbeF0GltAMdXSyQMDqaCghE+P2cv7Lri+WyylDjUifmH/FwDw+OBRxDj96apss
	uHw3Li8P2SKzllKSusqyP4YXsl87o8T7Cc+adaUNWamezCiq206TZoBq6pzWmZh0
	9pjmlh6j7wjFtmTOc4wMhUJ10ESH8fjMONTkhTNgtIHG1DgZWb9zTGOMWrmyXdX5
	g27BrE9rApAKyy3maOeXu4wXBI/kYYZTa16iTSWJ1iR9WkzxYKxm79KZlxNvH1tO
	VY1Clw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hakwn23dg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 09:43:24 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5351b6bd8adso13206551cf.2
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 02:43:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792057404; x=1792662204; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Tzf73yGEud0D74ONzoUYEsG5WGkzmMwPfPRaWzQs8VU=;
        b=kZoW8k7yZfqtZTU3G0R7H9epTL4ZjCpV8gG/3cehVJ4QC7P8b4t9sThpF7T/mFIlrt
         SUF+4eJ7yVO4z8Dva5iHXfhEFE6Ge6Jf0HZ24N2nm8/jYTZ1DreYGDO3QMIcOaWopsef
         OrcxUhxZMOTckAbAqKoaNFAUkorujIkNyRmoy1UGPtYqnSDW0CYZa0D8n38mM3NYZmwp
         UxratF3kRGwWqunagMwF3fMRIbDQveIUI/Ecp3iS1jWbjMbEO9MNAUjM2MGgJZVlFE3Q
         9PQ1boQC1QJuZnQa+6cCnntqzF1nxboerptrKX0KNfnAJKYgOQXkTkI+xJYUe77Z/mnw
         QJEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792057404; x=1792662204;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Tzf73yGEud0D74ONzoUYEsG5WGkzmMwPfPRaWzQs8VU=;
        b=UP0gjzEp74OVxwBYjwtBRDH1UDxTx5xTjVgKxGIT2FYtx4lIK/RVIPaJd0lBhhQTlh
         FXhrglXu1xxH5+AlPK7u7o+qKYn9hvVLpoeSu2OzX3wZlI5ffsW6gC4uvCY/42MI59Hq
         EiZqQ4YOtGrTR1BWw6Z8yhFH/33/cqoUTV1h1zKQTIYRrShfygQJYvIOwXJQZcv1X3za
         6Bbyte3wV84qU9F2zrrE+eH4LxkRt5Tc1kRTre3fhHcxzF6wLcNgqAqJ+FbZ8Ffh7GJk
         wOf4GW6VMHaFuA04TmV6/i5Fl9R6CTeE6K7vReQJH/AxKJGnf3wpnqsP7vUP6YHcf5i5
         Mipg==
X-Forwarded-Encrypted: i=1; AKwUvBxhbVC5QggjlH1u/EwJcKBcg0Ij3rPOw0TJlDHhY4AOw0OQS1cJML6iGDTRIUNQsEf5TgtfopzTs7tDVas=@vger.kernel.org
X-Gm-Message-State: AFq9FYJP5lq1hdSV9MOWJyli3Pc5ID8BbONRQ2nbZceyIPtVwDbAzMuo
	sAKxOG+085nYoVIawOjBKxG7F6weBvWYwYtEXq1EsSwqxpgSLLi6o9u+icrBOj4MDFuYFLJ9M9A
	oYSEwB/r4MvoMyscc7bAL1AtZajb60QgoeoOakAwr2Tyean4nNtBD8n/HGpJnAlBQzVc=
X-Gm-Gg: AYBFou1xWg+2yM3jsfKd4b8oaavWGeNqM6ilipdv+ZaCcIkW7hE7fbZY+anbZ3HCGSg
	vBykKzCyplZiW2vRycSp32Pnbb02kovcBPjI7gGsa+yMg8f6Ew3gY0Ku41BJw/ULdTspWuKI20Y
	Z1RifTJZ+Kl/T5JUcvVguTZJ6cnWENN6SalocbFs1xh/+EdDTjl5z/SkedrfFpM1ZwCDawi/f2E
	JeQ8NDVBAs/vTg40r0tJ/cj4qk4bEWfBsfQpbvGNPx4qYm4Q39EW1meEN+B13eJq3ZLjzZzbUi3
	pV1l52bSO96Lo9agOpkgWjnXQ6w847gNKw7UPLr9VJxBPX1zdvu8QYxK1xf3MxTeQBHCD3ZgGDE
	I46jyC2WnJlDMoGhuiwwHYA==
X-Received: by 2002:ac8:59c6:0:b0:51c:2324:666 with SMTP id d75a77b69052e-5359fa50f67mr353276501cf.3.1792057403626;
        Thu, 15 Oct 2026 02:43:23 -0700 (PDT)
X-Received: by 2002:ac8:59c6:0:b0:51c:2324:666 with SMTP id d75a77b69052e-5359fa50f67mr353276251cf.3.1792057403109;
        Thu, 15 Oct 2026 02:43:23 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c3ed6be6facsm106366566b.12.2026.10.15.02.43.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Oct 2026 02:43:22 -0700 (PDT)
Message-ID: <9ae0c4e2-35cd-402e-96d0-eccfe26e622b@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 11:43:19 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] media: iris: Skip SCM call for non-SCM PAS backend
To: Sumit Garg <sumit.garg@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Cc: Sumit Garg <sumit.garg@kernel.org>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org,
        Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
        Jorge Ramirez-Ortiz <jorge.ramirez.ortiz@gmail.com>
References: <20260911-video-optee-pas-v1-v1-0-7bbddaaac5ba@kernel.org>
 <20260911-video-optee-pas-v1-v1-2-7bbddaaac5ba@kernel.org>
 <38fa7602-f03a-4343-9999-0eda108332e3@oss.qualcomm.com>
 <CAGptzHNO02tQJypLjQD+nKWW76m5R2fo-s=bAJhN=Hmu_oVvng@mail.gmail.com>
 <d293c3a5-7318-4ef4-978e-2bf1c064d0fe@oss.qualcomm.com>
 <CAGptzHN5uTR8w2b3ODHoSTcys4woRBmAf0fa=93H34ZDV+=ymw@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CAGptzHN5uTR8w2b3ODHoSTcys4woRBmAf0fa=93H34ZDV+=ymw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDAzOCBTYWx0ZWRfX15XX9L756rgQ
 xYxGBqpdCO9Qd6rIKn1O9WJpS/+LJshhXbSthVDAwGwf7gqMk6tZi475Ck6mmAd2/SDwKwiFVVd
 1Xcobv8eTMnKN/0AhSAzHlVlP2Csr9AWotLIj9AemcUmRM7c3kZVx+sd4+9XdDc51hW42YoTJ51
 Qp6OIwKmswN8kZenZX7IAtbzIPbdx19parXddftBHrKt5WEuHsEmwlllxVwcfpfbBPElm55G4U7
 w/KZrpFdbSc6RWyiQ7g3lJTJIPbzvAslwn8B7AWQvXEDi2c9KKqTw3RuEHSSrulntD/sL/HaAWW
 gt2qYX5fmms/88p9kDwd8EM/q/14O9zZudAPJjeT51+6+yc/OMpjXr12/qmA4caTnjiZpS+4YDi
 odvnKxATDRwbr0EFisfof/3qNJ94U+9cEFUKDJYHfkeWDFs5XRiZl8VX395qaUqlCPdqrH0y2L4
 1xTXgu3bLWA9sY47P4A==
X-Proofpoint-GUID: sgHote9q_WtbUi0R41MUZhd4ztkMhf7a
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDAzOCBTYWx0ZWRfX2mmE4SFSdpjr
 Hdn1V4E6UYOIv4SmhNT8OuhEg0QeMP9SkE1S+uFmIbas1KMqe4fVHHP+j6XonMDezkGoDuLgrG0
 R4BhZWxf7Il+6v3PILKYs6ckemLHMsU=
X-Authority-Analysis: v=2.4 cv=BqUIUoX5 c=1 sm=1 tr=0 ts=6ad0a03c cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=XeEdsXCBUZsRL06xsssA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: sgHote9q_WtbUi0R41MUZhd4ztkMhf7a
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 spamscore=0 bulkscore=0 suspectscore=0
 clxscore=1015 malwarescore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610150038

On 9/18/26 1:10 PM, Sumit Garg wrote:
> Hey Vikash,
> 
> On Thu, Sep 17, 2026 at 5:11 PM Vikash Garodia
> <vikash.garodia@oss.qualcomm.com> wrote:
>>
>> Hi Sumit,
>>
>> On 9/14/2026 11:44 AM, Sumit Garg wrote:
>>> Hey Konrad,

[...]

> The main disadvantage is that we don't want to carry these custom SCM
> ABIs per kernel subsystem with the open source TF-A/OP-TEE boot stack.
> ABIs always come with maintenance burdens, especially the custom ones
> we have in this case.
> 
> Since we started from scratch for the open source boot stack, the
> motivation is to keep the TZ ABI minimal and that too with
> discoverable OP-TEE services like the PAS service.

Okay, I can symphatize with that.

Let's think of another solution though, as a strcmp over the provider
name is 10x worse.

What is the planned replacement on the open boot stack side? FF-A lend?

Konrad
