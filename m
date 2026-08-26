Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FCB43E2AB0
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 13:20:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787750412; cv=none; b=byMXfE6T3vkIqgdx6pq4BRpiu9rnIrKeFTuCeVZSYxWZh69NAAOvqCqFdjSG+Wxjn/aj1Anjy9PiloPUTGWPbitQyLM/Pyn6fLWXzpICSm6SCsRd7GsjIfUDw3zGAVjW9x9CtN2fSwxFAZDjCyM/zx12f7XvRfq4mlmn901SUIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787750412; c=relaxed/simple;
	bh=Is6pvF121XtSUY07IGzQAq0wL92JRGVCiWRMROTaG/o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RAw61cA3kPyjGl39PYegg5c8Lrxf4LXrp9eMKH0/EYjAeYRu9Z+SCJpYrADfUhdsBwfqtfrdWIPfWwPtIpwIMh0eyR3Warqfd/c2IzCmQq8vd7eYe1H1M3aZ2V/VonJZSnch/POtKfUjUTMCIvBqwYl+eq1t6qw2PQWMHPcHeOU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aMs+jxax; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZXrJopY9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aMs+jxax";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZXrJopY9"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67QCC3Cw3899151
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 13:20:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ELhK3Fdw98kZw2wfGL+DHumauqq7uUpJz9jAzGKztAE=; b=aMs+jxaxOaA28pFt
	LCipY1WVLPXxjplFYjxAFfm7P1lxB3TpXMgZo8csCEO9aHmo1xer9vpGl1V0nr9o
	ugtrkRPE//+mic8wgmvHgwK1+b+m4vyhHmCI5DUuYuPDOSrC4icmcwXmf93OF6bN
	rFwHKSqm4gPuuJ+OcQ+Rlb86yjlPhYhULAgNEPUOjT7uLNmoZmCTWoE7GC37vlK4
	21jLiKj57YCy5S0pbmfPPxLYIXHsoeQL+ssEBWbxvPMTA3hC7IwKaNl5DUK6tD9O
	inL95T5xej9Db8zz2Tij43UPd17kmWZO8jRLd+16xmBOfg4heCxv1PmvZVWsyy6R
	A7dprQ==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g9uthsa4s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 13:20:07 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-97cbaa9bef2so12078241.0
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 06:20:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787750407; x=1788355207; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ELhK3Fdw98kZw2wfGL+DHumauqq7uUpJz9jAzGKztAE=;
        b=ZXrJopY9v5h7BDzp1v49m/IKf9lwFBn8kyeiFVjclh/wMB3UFkz/uDAUHUPpl1gpUz
         RgYyDFjAqSeQbiM5TQ2TkkrJaRik3mkVgxZwKy/v3YCY02tH/gigbiY45a3OvWN+hl0d
         o/UGM2Xk3oCy98xKDe+k8B/+CrunbtysK+m97CQ1Vgtdwk+RUrXTnjWON9Mr03vMRJhN
         nb+EUMj7pB99sdoNV9lITMJLL3j4slHfZm9AoYrbR+H57gvrMOrxNcAvNyd+4cb4s8zv
         FlGtiHxkBppzgPc58me2sUiP0sRgk7hcMJBkjyUJtpSWk/hLiR/tc9kIT4tBdafEzgMs
         iMJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787750407; x=1788355207;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ELhK3Fdw98kZw2wfGL+DHumauqq7uUpJz9jAzGKztAE=;
        b=ovfnuuXGbOtExkucVgclnDMGY2E+M3GYZdH9rFWM2SllaY+xH+eny4kiOn7SMOFdSM
         dD6YA/PGhMN0YYEx71i3nn8kQ295g/q3KSx6i6lyDNfDEv7DyFviByykOAxmCQYuD4K5
         LXn2+47tOuWT6BzxhcjSzPMw/jLC9rwek4PMzfcKtdDQU9OeuijPOafJ9QXMAdGlWzHc
         8SkZj+EyKuVtxZH2rB8rufXLHw262rBWNllRwcm6BOrWJrvERqWM9h5/hSke+hX/kzgS
         XQe32K3AaDfq4bfco7WTTdxJPUffpZYgVMePxM5yWddbgS4NRrLn6Tty1fgf+AXzpF1e
         Ikng==
X-Forwarded-Encrypted: i=1; AHgh+RoV1JlCD6IFaQ+822M38N9X+tUFfiNjkDlfor2EYIjiHcQs3HrxkOYhl9PPWH5NbWpQMxXds6ZDmQbqi+A=@vger.kernel.org
X-Gm-Message-State: AFuF++k5MftGpHbABesgfZLC7o4s8HU1QQGv34vivqxUOJYo1TNG1Gto
	K7s+Aw+IUzjx5+YeUfyW/nqHW/HdvaGwrgpqba+1AL3gW62ooN0eLtOqfxYHz0niir3YTSHwzR8
	OqEmUF7M3xVy5l+8BbALD/8Gfst1S3c1JE1+ATr7HiSIGyVjdvSgFm5U4FWBy9z1sVBA=
X-Gm-Gg: AR+sD10iXBvQFncjL3hFaO7Hn0ITyZhJFl2uBQunZUqm9D7sLySL4IahGUKE4G3kdPD
	4gbXjQxdlT95kqplYdFndJF6MTsWcGW2G5yqU0eRKAZt9oCIcsbWZLXnG06p+AvlLGQhXQoOdEY
	xWHa1uAFmHSwzvDUcZ0OoOW51PvnYNt+8entOEPSJSA7tMK7Pap8273hbCy3ljYZmxniw1T89r0
	afOBLoGawPa6xHcuGsw+J6BjQpzg+h6FWeSejpRVo68Z3GEFJJGymOooxL7MeY210/6WpRTTj6L
	raEX8nIJfgkDwz3xul2IFDwvjeNC2XxozeFSLuX5TXKL9fHBPbjregemQk0F6d/gaNEILxUVIQu
	GaCEgnPJwMX40qLU1+3gZqBj4
X-Received: by 2002:a05:6102:1490:b0:783:a923:efac with SMTP id ada2fe7eead31-783f9034d7fmr55348137.0.1787750405587;
        Wed, 26 Aug 2026 06:20:05 -0700 (PDT)
X-Received: by 2002:a05:6102:1490:b0:783:a923:efac with SMTP id ada2fe7eead31-783f9034d7fmr55324137.0.1787750404893;
        Wed, 26 Aug 2026 06:20:04 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c251b7a9936sm337362766b.49.2026.08.26.06.20.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Aug 2026 06:20:03 -0700 (PDT)
Message-ID: <f36b9019-91c8-43bb-bfcc-5da06d2d122e@oss.qualcomm.com>
Date: Wed, 26 Aug 2026 15:19:59 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dt-bindings: display: msm: Allow two MDSS power
 domains
To: Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Yuanjie Yang
 <yuanjie.yang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260720-msm_gdsc2-v1-0-4687866d6cb0@oss.qualcomm.com>
 <20260720-msm_gdsc2-v1-1-4687866d6cb0@oss.qualcomm.com>
 <b36691d3-e996-4fc0-8955-25beeeecc385@oss.qualcomm.com>
 <ccab8aae-d980-423a-b39e-3ce2a7c82542@oss.qualcomm.com>
 <5341e732-0deb-4d00-9a7c-595e317bf1e8@oss.qualcomm.com>
 <db2a18aa-f5fb-4ee8-8747-05fcf740749f@oss.qualcomm.com>
 <f344a913-cc95-4fef-880b-f1fee200c108@oss.qualcomm.com>
 <b6d6b627-a38b-427a-9e62-ee883505b2ad@oss.qualcomm.com>
 <15826e27-514c-4aaf-b56e-b40ed0bd600b@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <15826e27-514c-4aaf-b56e-b40ed0bd600b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=EMA2FVZC c=1 sm=1 tr=0 ts=6a8ee807 cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=TDtJeqXoE0GuUOfqXLQA:9 a=QEXdDO2ut3YA:10 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-ORIG-GUID: JiQP2xZq18_TTGL5ynfUWpC8cjH-urWl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDExMCBTYWx0ZWRfX4V/kkYaL+I2e
 eo6QHlB3cK4UBRQePc/r1KreDQ3ObUY/iLhLdppcSd4RbbsHcr++6u23EK7SCjDfpJuY3us6vaQ
 6zGs+CeKjKSN39kJK6nRFMQAj1YA6OLxKpES/Zc9P89yW6/7PJYnNhvT345azVYN9ATneXAWxQ8
 d+NYOIQVrgERNPkGB/uaCJZvY2GiOgVGt4dy0fOl43XEBZFOfI7rNj2/q7pc1Gj70Kiy0kYIU9C
 +23yImgUoxCF1ohARMpw4b318iwXLNWGj/86ugJEVnDnXmY4efb0bKvEcgQ3xS8PHV+LY3uLWU/
 txJofOhZZGmSgabopMPq32RcCxdugeojl7AJ7pQkBRu3oV3ELoNZXlQUGQR7NnwC+QjEYP5t7Ec
 mC/UgHt8eqzi7fdpaHcnShsJGTuXiJ5bd84N2y74fCBROhSEeMgnGTKKW/sWJ6IfrQEfwug3Jg6
 2ifrQLPiCvK4RoPph4A==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDExMCBTYWx0ZWRfX8z2jQojMB/gK
 h6TienlDrgmD5wfv8PBcuDo/NKVn4UTDEw+3y3c5OrE4iNQBsNWyM79M8kGUXR5vAUH7wLuXvNi
 qNqxIMrxj3ZqnZLv9Z2lKmsLPRT6iWM=
X-Proofpoint-GUID: JiQP2xZq18_TTGL5ynfUWpC8cjH-urWl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-26_03,2026-08-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 spamscore=0 adultscore=0 malwarescore=0
 clxscore=1015 phishscore=0 priorityscore=1501 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608260110

On 8/26/26 4:53 AM, Yongxing Mou wrote:
> 
> 
> On 8/25/2026 4:30 PM, Konrad Dybcio wrote:
>> On 8/25/26 8:28 AM, Yongxing Mou wrote:
>>>
>>>
>>> On 8/17/2026 10:14 PM, Konrad Dybcio wrote:
>>>> On 8/17/26 4:13 PM, Konrad Dybcio wrote:
>>>>> On 8/13/26 9:44 AM, Yongxing Mou wrote:
>>>>>>
>>>>>>
>>>>>> On 7/20/2026 4:49 PM, Konrad Dybcio wrote:
>>>>>>> On 7/20/26 10:43 AM, Yongxing Mou wrote:
>>>>>>>> Kaanapali (SM8750) and Glymur use two display power domains.
>>>>>>>> CORE_GDSC powers the main display hardware while INT2_GDSC
>>>>>>>> powers a subset of SSPP blocks.
>>>>>>>
>>>>>>> Can they operate independently? Does INT2_GDSC need to be
>>>>>>> powered on after CORE_GDSC?
>>>>>>>
>>>>>> On Kaanapali, my understanding is that CORE_GDSC and INT2_GDSC should generally track the same state, except that INT2_GDSC may be powered down when SSPP1 (VIG2/VIG3/DMA5) is unused.
>>>>>
>>>>> Is the MDSS any useful if *only* INT2_GDSC is enabled? Can the INT2_GDSC
>>>>> be enabled itself if CORE_GDSC is off?
>>>>
>>>> (I didn't quite know how to parse the list of states you provided in your
>>>> reply so I asked again)
>>>>
>>>> Konrad
>>> Hi, Konard. Would you recommend adding the parent clock in the clock driver, or handling 2 GDSC in the display driver? I'm preparing the next revision and would appreciate your feedback.
>>
>> Does disabling INT2 provide us with any power benefits and will the
> So far, I haven't found any documentation that explicitly describes a power-saving use case achieved by disabling the INT2 GDSC. The material I found instead describes it in the context of display tiering:
> "Goal for partial display is to tier down from premium tier to match low tier pipe configurations."
>> display driver do the accounting for what resources need the INT2
>> GDSC specifically?
> Not at the moment. Our current requirement is simply to enable and disable it together with the core GDSC.

So WDYT Dmitry, should we just wire it up as a child of the core gdsc on
the clk side and pass just one gdsc to mdss?

Konrad
