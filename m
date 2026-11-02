Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793633184;
	b=hzMQJdtCGTOucyfGQunhAFNTZyirAVfvyP9lShtKVVCQ26OTywKpiS/gc0eViLrujbO6
	 Fo8UnbHWG+1SndGLfXgsas8W1e0GtaISsJHFmv7aB1K6NDiKoYMvfJcFHJOePoXGCzm1f
	 VrgLGSFP5DwcQARtfNLQgcwkJ9IVVM/2D92afYCpsM5vAB++ovwK7BCk66VtDb/kI3xFt
	 9/UOtJstVIb5UnFthjZHTHGfE6XK2IhckJz2zugr2YRBBCjjUEibKj7AF5V5sn7UkNWpV
	 DwsFLUcGnB8LxzAbQ9cc4pOE4Y15dqHrcw5OrIE3OGoBmABDussT6LViPk2GXbKyS5Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793633184;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=NZ7uDGaJuz3784OD9oFLUOQAlulPmdnktGy1Lcp2kIQ=;
	b=2PQ+dDoHxjXypkCEhiV8I5l+fOfN6XXiY3nS7y9qGwSTI6YrwRcUug1tX0K+jW52yPql
	 4IFiXmBEMAO1rYXeEYE+zAKO81CYT64KeDFdk5vKI8wiseHiHgLhpoi0jUE9FGwR2XdSy
	 6ZiDOhCiSywCqe+PBluOxMX9xbHq3qWBH+GVkXPe6RAJigqTzYpbjxX7OcQhPR8rCuoVl
	 ZjPoRaN7Ks07XS9z3D/LqqHBbLum9tJTvcq9O0EOZUjyVseaOpH4jfcGEkCwCSXx2MJ7w
	 n6byCL/1YQeHMVKws5Jn+4ipf9zFvoyh6cWOZAvv05NYuQKErVZGgvsiwNBHMGceovw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="fVjPD5/2";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OL3eQZMl;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82221609A736
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 15:26:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 82221609A736
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fVjPD5/2;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OL3eQZMl
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A2DpRVn2449107
	for <linux-kernel@vger.kernel.org>; Mon, 2 Nov 2026 15:26:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NZ7uDGaJuz3784OD9oFLUOQAlulPmdnktGy1Lcp2kIQ=; b=fVjPD5/2rsrAeWny
	dY4kXttgQdcC8B2da4/JGFKlwB88zU2Wt+us18VB1OZwQ+AH7/UwypCGNuzM3nc3
	u8ZKNI3lps1ppameBkvboOCjTzKDvJsaNM2Fs9Y+I5WUxnRVPTGdCTLVJr8omCPd
	D38LG0xJBLYhh0+QZ89jL2tVARDXTPMlynaADDFK1bixIqZF3EeYyMC+9TiWlgNe
	dlBN53bF9lSLcHCNf90k+wucjcAbTG3V2V2IHUqirxUAdalbSJFoKT6zLGrafWpw
	UKeNrnd6WJcRHAT7WWuFGgb8Av267GPs51xoJ8o+nLMp4plyJtKWn5Sgl8UXvt4g
	+9EYEw==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpky4jcmf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 15:26:23 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5eabe7151daso109147e0c.2
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 07:26:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793633182; x=1794237982; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NZ7uDGaJuz3784OD9oFLUOQAlulPmdnktGy1Lcp2kIQ=;
        b=OL3eQZMltBoWi9CGbPiMIMuw1LRrS+wlf2WxDcLysdI11SXb3Mp9NirNxJTZMlJW6h
         OxwUTXQz8ab6IVv2X+yWSdAnx/hs3VezLIxbNzukRDc7ssFb/liRsb6wh8nYzL+Iy+sE
         mn6a8Ny9fNYvg+9kpbulC1RBGHHSHcOSgZFD86JrersLHgL+TDP9aauBPRBniIUwg+4Z
         s4qcu9vpYBw1AbpeL7h6jUvKXWmgmjzjp6P5TVWrayl2ncQoyRzQsf/VzU/BAiSlJTKk
         k2wyGHYLrkqkvFuswLOyMZNvcnFyF/2J9xhRrQ4PwIVjpP3bIj6eR9XvCHMvHq4DVmEl
         N8Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793633182; x=1794237982;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NZ7uDGaJuz3784OD9oFLUOQAlulPmdnktGy1Lcp2kIQ=;
        b=UU01PIPMzp37dS+EgpEqg/p8yR/I3mZEhNkW+qvZyU4K7XfFGaeV2h2MGZh6KgQmL4
         m0/FinkBm0QcSNP9OFSa+vIrFHn8UUi7dYm68JuM5oOwgAPSJXvQLYzT465mbAGZaxjX
         VaoLGGXyRwGcBR0WW5j6wMW9kwx4QsijoNd8uU03jF8NYoV0tdQaDq2SY+vx1z1igei1
         ej/l/ZVfLSL/YC5sLfJn523stV7UjQoYa98HE3jpa25m+PI5oNujj3unu21EIr1UUTKZ
         4Jl0WVP/8zwj5vBNYdRQxqFIdv9eREZIgJ8lUbjkFdlhjB0lsdDQWs8naOO5HAuvcc5c
         l04A==
X-Forwarded-Encrypted: i=1; AKwUvBxP4lFTk6gQYXqC0XYOUDT2Ik6iGxGsDBvfXEEo48pwA1FYaWWuc1tz6jV3j/XZ4jIWwF5gYG5XxjoovMk=@vger.kernel.org
X-Gm-Message-State: APuU4Z9879g4bw7zDmWSvmiH7OXb8556DcJowkxPL5Nd8ceFhfGrDpEb
	7amxlYABLYaQjt8MVJtUOshLqMvnVUUPxaJNuAQfppeoPGS2y60GHgDyd0rkJInwmHoESJPKZIn
	tyrT2Sz6gCTUocZyLlyix+yIMEr9sqxPJxRXTqXOt0IyYs+LV2twiuryXRA7k5Gldd+Q=
X-Gm-Gg: AYBFou1OSltjE1ZrAA3As5qf2Dw0WfKjz5uHZ2sju21yTRdl13iZVUHaTrc5HQaYt2r
	Tm8QauEFjudyjNtBBmFv5EMX6T7TsBw6n47M9pKtDZZPJphqPPujs04pasCFJOF2K0QvEgHPCVD
	ZRLVy/jVuehcpLBsfj+IqpE6bj4MXuciZWsMTum2zcqGNL/iEuzm8pwKajeirlecnqCYT+AzX6o
	NS6CIIx7+4erLD66AuTxW7U+zU7XQTazoRW5jQMO/50p3IKKr6pRj52e4kq3HDVfbd3TMI7dQj8
	CRIFY4pfTDy6SV+hjt1aTQg2YV9zQVSZe8LLkjymMEtPtgKRYNjd7QYBY1qwssQZRrR/i4Z+Zdl
	oTR6zySdzHW1ZVnYiu2szS70NJMtoSm2OkduBEqQHNzDHgyMmENsuiKCQ8SmCrXYclEECpw==
X-Received: by 2002:ac5:cdb8:0:b0:5ce:23fe:84d8 with SMTP id 71dfb90a1353d-5ec7562c7c4mr2941416e0c.0.1793633182195;
        Mon, 02 Nov 2026 07:26:22 -0800 (PST)
X-Received: by 2002:ac5:cdb8:0:b0:5ce:23fe:84d8 with SMTP id 71dfb90a1353d-5ec7562c7c4mr2941372e0c.0.1793633181338;
        Mon, 02 Nov 2026 07:26:21 -0800 (PST)
Received: from [192.168.226.93] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4cebd3a2desm2237066b.10.2026.11.02.07.26.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 07:26:20 -0800 (PST)
Message-ID: <427972ac-130b-4e56-92b4-9d11d278d6af@oss.qualcomm.com>
Date: Mon, 2 Nov 2026 16:26:18 +0100
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
Subject: Re: [PATCH 1/2] drm/msm/gem: Fix VM_BIND range check
To: rob.clark@oss.qualcomm.com
Cc: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        open list <linux-kernel@vger.kernel.org>
References: <20261101174911.25184-1-robin.clark@oss.qualcomm.com>
 <20261101174911.25184-2-robin.clark@oss.qualcomm.com>
 <90ae1b4e-d83e-4209-9df1-7ebf778a881a@oss.qualcomm.com>
 <CACSVV012ncykN3PnXnuP+-tK51r4kJ4BUfiThcjV2JYvn_jXwQ@mail.gmail.com>
 <CACSVV01=19OWZ4i1Bc-j8m8u0+5jtfOgqPU-VfkLUQUQ_oVdmg@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CACSVV01=19OWZ4i1Bc-j8m8u0+5jtfOgqPU-VfkLUQUQ_oVdmg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: hEjUf-XmE4-zIOrXAvqWw6HINts9P5MR
X-Proofpoint-GUID: hEjUf-XmE4-zIOrXAvqWw6HINts9P5MR
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA2MSBTYWx0ZWRfX3+WO6g+smlqM
 vMysUsLxIbbLEGmy1iLwjWkUZ427sAwNV9mT5l3HJCq1KNiQWwXLnSFl9ZiuEnWkdai8G2uR7sN
 eWlCTreSIpcHYGoTYtSWDJpRZnyv3xY=
X-Authority-Analysis: v=2.4 cv=QoHLTlyd c=1 sm=1 tr=0 ts=6ae8ab9f cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=lvvAgqv1s9cMsEWjrR4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA2MSBTYWx0ZWRfX2ISug/zjEpjL
 dasldvmVeN7NK7mmE22BtZCSn+1dLMHd+xGoStJnxmh4wF/sMFNLv3EG2LvN4duCCWBrGJ6R2J2
 99NkJO/hlgmACeXyzqR3e+/4Q9TvWtH85lsOpEQpbthBJa8WlpRMT+K+9y2ElGK17RC5DoZXX7V
 MyXKJfQ9ue3bglJ9i71hK0AIhcTAz3623gUX44qB//LrVFUREib7L91nkuH4GspIRdaXJCIgi/o
 vKksyS26ToEE3w6GzdKzi6J8QrUa+73HlFedjjLRgBWEbKT6q1Bk/+TxTl+aZ32DNkqewEmDagI
 w94XBVJG5qoRaXgcaNNZRaE5nm/q4sqBYmu2f49FBnhszFtfcRAtjDFN7YYBv2fT3jPojO8fdZi
 OPAxsy+sWyiD7MopSt4svxGN+2oeEpc/qyCEd3elNZfhZIhCnIpdza6EeNV633LTLiAp/rtav/K
 rMuzI6kJQ5LXdZc0+TA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_04,2026-11-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 spamscore=0 bulkscore=0
 suspectscore=0 impostorscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020061

On 11/2/26 4:18 PM, Rob Clark wrote:
> On Mon, Nov 2, 2026 at 5:59 AM Rob Clark <rob.clark@oss.qualcomm.com> wrote:
>>
>> On Mon, Nov 2, 2026 at 1:40 AM Konrad Dybcio
>> <konrad.dybcio@oss.qualcomm.com> wrote:
>>>
>>> On 11/1/26 6:49 PM, Rob Clark wrote:
>>>> Use size_add() to guard against overflow.
>>>>
>>>> Reported-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>>> Fixes: 3a3bef68a6c1 ("drm/msm: Fix missing VM_BIND offset/range validation")
>>>> Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
>>>> ---
>>>>  drivers/gpu/drm/msm/msm_gem_vma.c | 2 +-
>>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/msm/msm_gem_vma.c b/drivers/gpu/drm/msm/msm_gem_vma.c
>>>> index f687a629629d..16b3870d5e90 100644
>>>> --- a/drivers/gpu/drm/msm/msm_gem_vma.c
>>>> +++ b/drivers/gpu/drm/msm/msm_gem_vma.c
>>>> @@ -1118,7 +1118,7 @@ vm_bind_job_lookup_ops(struct msm_vm_bind_job *job, struct drm_msm_vm_bind *args
>>>>               op->obj = obj;
>>>>               cnt++;
>>>>
>>>> -             if ((op->range + op->obj_offset) > obj->size) {
>>>> +             if (size_add(op->range, op->obj_offset) > obj->size) {
>>>
>>> GPT and Sashiko are unhappy about what this does on 32b
>>
>> Considering that we can't have >4gb BOs on 32b, I think the concerns
>> are probably unwarranted.  But yes, I do look at Sashiko's reports
> 
> Probably we should add checks that obj_offset/range are not more than SIZE_MAX?

Wouldn't hurt

Konrad
