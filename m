Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1CA244604F
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 19:59:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790366353; cv=none; b=f3OjVJTxr5aO536ghJFyA900OED8g0g30TO01p8vicW0qJ6Wn9SbPUKR6lc5yfYnObLuYbydCxeaFyjFC+mQ9vxzK0ep7uGnUEtaSBLftx1klsS7MpZM5m7YPBnqMi4r9+1cL7xiobDokTT6Bu4AS6gwV27NdOl3KLgK70pK6Mw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790366353; c=relaxed/simple;
	bh=U0/G/Fxx/zWbRQys9d1ELPauWO10rzhE/ff62oKKMnU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fP3n/elZCcQR8QZpT2Cca/UJ4O2VoYxsCKDekzYW4++6vRhcjgf/azPpITdP9bXQ+nXquZrDRIZmO/fHZQpI0w9QtIgrcq2NpHMJtkVsSLBizV8/PbFr44/+Il6YOQiClqbUs/48F2YNzDBwzEnqlZJEM3+hhAA0nSAwDJlGZ3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=R9deWuCc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hmHOrQmt; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="R9deWuCc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hmHOrQmt"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68PIoXXf1863285
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 19:59:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BoGtlFMrTCZDnWzopkng0s/Kflr9jZ0FN5wZjUl38mw=; b=R9deWuCcVazo/u9o
	p8DlRF3ME8neof4XV7bS5GYW8MCsYiq8HqQBCLUe0eQTstEcpRcVh+BQGLvaCTcT
	KbyfCuXa/wCdO2SR+n6Rkwjrjhw2QuN/k3zbAsq5wpM+2hMHCBb1hKO1YZtyW6PV
	t5ZvwQQVkSh8CnZikDsOs5g5uVIjGXmKeGkWNSs6T03P2YYauG+eadvOzdQLoWEW
	6CIaS6vG4vu31mwkS14W3y3cAcTfLcXR6k4ItwjJ+3e/bKYlGSExF4EXG3BCG+Kw
	lDlGLw1/Pj+ZsGnxMBiYk6HQTb+5ulrrefltrm/44J9lHVcY+ixDx7ukwVqNxAFA
	z80R8g==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gwr101vd7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 19:59:08 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-30bcb065bfdso2052976eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 12:59:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790366348; x=1790971148; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BoGtlFMrTCZDnWzopkng0s/Kflr9jZ0FN5wZjUl38mw=;
        b=hmHOrQmts6yKo7A3gzr0KJ85Tl9hhamHM91LjjHRsREnDWC0y5kiPc0Kg6RHqZizjQ
         20bbmDuYS8F9F6oMjD8ONfEyskkrD+uvo52p03WMxRU9tcc3EKmRaLIkJUEMfT27bXOH
         e9QBRW57z04Wr3RmAPkBbHkDfd+02vGVAkL2QeH9Np7npYcfXpLqSk+o6d+TXpB8gftx
         2hbZfUiaJQM9U7xPaccvjtNTYIdFJthlKMVxkey1sdJ6mnUGRfR1LKgiIy9O22RM5Zbq
         DdxMi0A9eb7V1naGqAeHXtLTpXUk8cm9DrN4Od6CFeLlG92ui3ieeZcYKUQMOdGW74t2
         RROQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790366348; x=1790971148;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BoGtlFMrTCZDnWzopkng0s/Kflr9jZ0FN5wZjUl38mw=;
        b=z+/v5n1faycLYCCE6NYmaApSdpylfFWnP520u61VjBh0mZPL37Ebd4Ee1I7ZmtC+xX
         edvg1o2ek8v9XTaQizB9p57uq2QhUGaXH9iNy6B6yvNFuVwDVOkRPDQkZkD7a9JwUl6u
         q5RGNkRUgY/D1Vhr9MIUwolNZhjnm7yogl5UZaZmFDd5bDQH9ncbT39PLIJ+tC10E6/n
         sUW9w9PsGHB0dDEkniQS0w4jN08mkRTyNkZM5EuNKk5lqae1qRJq+AzJ7ZcEqA1Nvvu9
         7rbvehK9et1tE8v83/iW4lZK6jefDbNx1/exMxqn5A9QMtVgrsoy+L8Nyi9DZs9GVLoO
         obgg==
X-Forwarded-Encrypted: i=1; AKwUvBximrp5HW5H5y+LHtvP3wP0aM5IBU/V1bjou+sNjpqW8JkGf+XOZuL/gPQmbjWpGKEloTGDxUgosWalntE=@vger.kernel.org
X-Gm-Message-State: AFuF++lI4VeoFKUw9M3BUQkmcaMR6fgYkaiT83LzL3g4U0WNUvoIYjcl
	Yekyhk3ReweHy8IxVqHykxXo0a1lMx7oYwVXo4nv72cM4wR77oGlBkLSV9ISZ2erx+GMep3H8BS
	zVqc/eE6OPazGqiSbwoSexa3F+5SmK/c/rBFZQ/El6D6GUdFgbTkOZQ9DmRGrdy3uomk=
X-Gm-Gg: AYBFou3juDFvEFV0aUo8ZKllxSr6dhipgxB/QlG/hfl4jN4omigdbnkvszFf+j/EkGz
	ZWOib0vtni6Y6yOQ1Sd9dHwAEW311bw8KWHdKsQcWmrbHaLDwufMlLywODtiuRvk9/3L8yHyglc
	wvdxuQK59vv3H3sR0Tq/3pTufdSvz5WE2Sle/v8pebF6Xq8jKHty9YV8vZGrmAco0Odjgq1VUtV
	Y0AwZVxRRNQ0V0bOp8StkNDFCidJalNX7QDnfu9b1JqTgv54CD+LVWuXRyONQfKQXzXbWSTyyuy
	0rZpkjWd+CD3nunGPOlzs+SO2KlyUCZ5q/OHcS1PujiIi/1FrMVozfnxK+3dy3Trnd6PYJoquxe
	qcBsLbZF0EaLatfyrWMeI+lWO
X-Received: by 2002:a05:7301:1442:b0:342:5966:7626 with SMTP id 5a478bee46e88-34271d8d2c2mr922081eec.25.1790366347558;
        Fri, 25 Sep 2026 12:59:07 -0700 (PDT)
X-Received: by 2002:a05:7301:1442:b0:342:5966:7626 with SMTP id 5a478bee46e88-34271d8d2c2mr922062eec.25.1790366346939;
        Fri, 25 Sep 2026 12:59:06 -0700 (PDT)
Received: from [10.204.104.211] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34145c17074sm7137779eec.26.2026.09.25.12.58.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Sep 2026 12:59:06 -0700 (PDT)
Message-ID: <761386ae-f1e5-4892-ac18-b450a803a433@oss.qualcomm.com>
Date: Sat, 26 Sep 2026 01:28:57 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/15] drm/msm: Support for Hawi & Maili GPU
To: Connor Abbott <cwabbott0@gmail.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jordan Crouse <jordan@cosmicpenguin.net>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bhaskar Reddy Valluru <bvalluru@qti.qualcomm.com>
References: <20260923-hawi-gpu-v1-0-0c3c79a1a470@oss.qualcomm.com>
 <CACu1E7GndBnSj75ZVqic9NxdSakZJL3ZJOuz7D+RbVWA4DUqTQ@mail.gmail.com>
 <692ff69a-330e-40db-bffc-a53987fa4bce@oss.qualcomm.com>
 <CACu1E7FuCVhu_0gKmVVeBL=e4=zghvXJT=mZVfg8UjUzRrv3Yw@mail.gmail.com>
Content-Language: en-US
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
In-Reply-To: <CACu1E7FuCVhu_0gKmVVeBL=e4=zghvXJT=mZVfg8UjUzRrv3Yw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDA3OSBTYWx0ZWRfX9ujXGDqm2X9B
 UZKQ5fJAUoDDBId4Cm2B5Frov1tUxuE5RDnWg3JpLaSWWaEonLWJ52z0xJMBmOnP+e+nkboMUGO
 mGKSZCPaHJ1lS0MZ9NclDLGAagjct0mAAam+6WkwzuAv0XgnbT950Nufva99qsq4c3jhobRijPy
 vNHIZ5zJ2A2qLVC5YJyLOYPlruGU5sKMS3aXHnr8bo5ErmL6WpehMulxIZJa9nyBHCCPg505FRp
 aQz6/R7P1CIOSoPiGbt+Tn7RuI926GCyGoO9Pck5GlG0WApeYYJbRFt2dtfCTJVtJ9n3Oa7zLuC
 5wN3JGMwjM2+bF5LinmJ29XoMBe+lBIR4uH+4SAFotN9UwC0nAhP7qb7QUV0jSi9zVycPyFdEZx
 LicC4SQx4foqo3TeUsM2ePTCseldjGDaI5Q+bg20e8jKhkX/Fvs/7yyaQSIBDlJlpYvn2XQaX6z
 WSIBhbycl5log7tFe9A==
X-Authority-Analysis: v=2.4 cv=ZfKIpcVA c=1 sm=1 tr=0 ts=6ab6d28c cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=qC_FGOx9AAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8
 a=tVI0ZWmoAAAA:8 a=MmXTpdYTAAAA:8 a=QyXUC8HyAAAA:8 a=e5mUnYsNAAAA:8
 a=HOaGrLfzmr4yaBHx-_YA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22 a=fsdK_YakeE02zTmptMdW:22 a=-BPWgnxRz2uhmvdm1NTO:22
 a=7hoCnnChfAR1N-e-f1W3:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-ORIG-GUID: l6J3jLeQLJWnr9c_87_jhmLPxGStLya0
X-Proofpoint-GUID: l6J3jLeQLJWnr9c_87_jhmLPxGStLya0
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDA3OSBTYWx0ZWRfXw2RPu504aUbL
 T9kcAjsP6dptp1xlugVweHyD4f349OCNK6I9cSO5aIOTrGFfr4g1koCwc99jxqa7bfUfR1WdCJm
 bKFGNmXLo1V+Mh5GMLBnXY9xxRbL0q8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-25_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 impostorscore=0 clxscore=1015 malwarescore=0
 priorityscore=1501 adultscore=0 bulkscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609250079



On 9/24/2026 7:36 PM, Connor Abbott wrote:
> On Thu, Sep 24, 2026 at 9:41 AM Akhil P Oommen <akhilpo@oss.qualcomm.com> wrote:
>>
>>
>>
>> On 9/24/2026 12:54 AM, Connor Abbott wrote:
>>> On Wed, Sep 23, 2026 at 6:26 AM Akhil P Oommen <akhilpo@oss.qualcomm.com> wrote:
>>>>
>>>> Adreno 850 is the next generation of A8x GPU present in Hawi SoC. It shares
>>>> the ADRENO_8XX_GEN2 family and slice architecture with A840, but has many
>>>> architectural improvements. There is a new block Matrix core (MALU) which
>>>> helps to accelerate certain compute workloads. Also, there is a new Bx rail
>>>> that powes a part of the GPU IP. GMU is now powered by a dedicated GDSC
>>>> powered by MxG rail.
>>>
>>> If there is a dedicated rail for GMU, then
>>> VK_KHR_calibrated_timestamps is likely broken, assuming that the GMU
>>> AO counter is on this rail. The AO offset logic in kgsl probably needs
>>> to be ported here. Has this been tested?
>>
>> Not sure how GMU core's power domain affect the AO timer. Could you please point
>> me to the AO offset related change in KGSL? I will check.
> 
> Previously the GMU AO counter was part of CX, which is kept on by
> other things in the system, so it continues to tick even if the GPU is
> suspended. However kgsl does not rely on that, and recalibrates the
> GMU AO timer whenever booting the GMU [1], which we currently don't

KGSL doesn't do that during every resume. KGSL recalibrates it only after a
system suspend. The AO counter is still in CX MISC which is under CX domain.
So it should not be affected in Hawi.

-Akhil.

> do. I don't know if the timer is still part of CX, but if not, then
> this part of kgsl could become load-bearing in a way it wasn't before.
> It seems possible that it isn't part of CX anymore, given your
> description that GMU and other things have been moved to new
> GPU-specific power domains.
> 
> Connor
> 
> [1] https://git.codelinaro.org/clo/la/platform/vendor/qcom/opensource/graphics-kernel/-/blob/gfx-kernel.lnx.16.0.r14-rel/adreno_gen8.c?ref_type=heads#L917

> 
>>
>> -Akhil.
>>>
>>> Connor
>>>
>>>>
>>>> Maili GPU (Adreno 845) is very similar to A850, except that it doesn't
>>>> have the MALU block.
>>>>
>>>> We will post the Mesa support and linux-firmware support soon. MALU support
>>>> will be brought in separately along with its support in Mesa.
>>>>
>>>> As there is no display support available for Hawi/Maili, validated offscreen
>>>> testcases that render basic triangles, glmark2-offscreen etc.
>>>>
>>>> The driver/dt-binding patches are for Rob to pickup and the DT patches
>>>> are for Bjorn.
>>>>
>>>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
>>>> ---
>>>> To: Rob Clark <robin.clark@oss.qualcomm.com>
>>>> To: Sean Paul <sean@poorly.run>
>>>> To: Konrad Dybcio <konradybcio@kernel.org>
>>>> To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
>>>> To: Dmitry Baryshkov <lumag@kernel.org>
>>>> To: Abhinav Kumar <abhinav.kumar@linux.dev>
>>>> To: Jessica Zhang <jesszhan0024@gmail.com>
>>>> To: Marijn Suijten <marijn.suijten@somainline.org>
>>>> To: David Airlie <airlied@gmail.com>
>>>> To: Simona Vetter <simona@ffwll.ch>
>>>> To: Jordan Crouse <jordan@cosmicpenguin.net>
>>>> To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>>>> To: Maxime Ripard <mripard@kernel.org>
>>>> To: Thomas Zimmermann <tzimmermann@suse.de>
>>>> To: Rob Herring <robh@kernel.org>
>>>> To: Krzysztof Kozlowski <krzk+dt@kernel.org>
>>>> To: Conor Dooley <conor+dt@kernel.org>
>>>> To: Bjorn Andersson <andersson@kernel.org>
>>>> Cc: linux-arm-msm@vger.kernel.org
>>>> Cc: dri-devel@lists.freedesktop.org
>>>> Cc: freedreno@lists.freedesktop.org
>>>> Cc: linux-kernel@vger.kernel.org
>>>> Cc: devicetree@vger.kernel.org
>>>>
>>>> ---
>>>> Akhil P Oommen (11):
>>>>       drm/msm/a6xx: Honor perfmode_bw threshold on A8x
>>>>       drm/msm/a6xx: Fix secondary rail vote in ARC votes
>>>>       drm/msm/a6xx: Fix RPMH dependency votes
>>>>       drm/msm/a6xx: Factor out RPMh arc-vote helpers
>>>>       drm/msm/a6xx: Add BX rail support to GMU dependency votes
>>>>       drm/msm/a6xx: Clamp MX dependency vote
>>>>       drm/msm/a8xx: Add Adreno 850 support
>>>>       drm/msm/a6xx: Send THINMEM config to GMU for A850
>>>>       dt-bindings: display/msm: Document A850 GPU and GMU
>>>>       arm64: dts: qcom: hawi: Add GPU support
>>>>       arm64: dts: qcom: hawi-mtp: Enable GPU
>>>>
>>>> Bhaskar Reddy Valluru (4):
>>>>       drm/msm/a8xx: Add Adreno 845 support
>>>>       dt-bindings: display/msm: Document A845 GPU and GMU
>>>>       arm64: dts: qcom: maili: Add GPU support
>>>>       arm64: dts: qcom: maili-mtp: Enable GPU
>>>>
>>>>  .../devicetree/bindings/display/msm/gmu.yaml       |  90 ++++-
>>>>  .../devicetree/bindings/display/msm/gpu.yaml       |   4 +
>>>>  arch/arm64/boot/dts/qcom/hawi-mtp.dts              |   8 +
>>>>  arch/arm64/boot/dts/qcom/hawi.dtsi                 | 336 ++++++++++++++++
>>>>  arch/arm64/boot/dts/qcom/maili-mtp.dts             |   8 +
>>>>  arch/arm64/boot/dts/qcom/maili.dtsi                | 309 ++++++++++++++
>>>>  drivers/gpu/drm/msm/adreno/a6xx_catalog.c          | 446 +++++++++++++++++++++
>>>>  drivers/gpu/drm/msm/adreno/a6xx_gmu.c              | 231 +++++++----
>>>>  drivers/gpu/drm/msm/adreno/a6xx_gmu.h              |   1 +
>>>>  drivers/gpu/drm/msm/adreno/a6xx_gpu.h              |   2 +
>>>>  drivers/gpu/drm/msm/adreno/a6xx_hfi.c              |  25 ++
>>>>  drivers/gpu/drm/msm/adreno/a6xx_hfi.h              |   1 +
>>>>  drivers/gpu/drm/msm/adreno/a8xx_gpu.c              |  16 +-
>>>>  drivers/gpu/drm/msm/adreno/adreno_gpu.h            |  21 +
>>>>  drivers/gpu/drm/msm/registers/adreno/a6xx.xml      |   8 +
>>>>  15 files changed, 1407 insertions(+), 99 deletions(-)
>>>> ---
>>>> base-commit: 1e9b8055458b92f9ebab6f39d97ade5265a0b012
>>>> change-id: 20260811-hawi-gpu-05b4ecfc3c4c
>>>> prerequisite-message-id: 20260923-hawi-dt-post-v1-0-e41473b6298b@oss.qualcomm.com
>>>> prerequisite-patch-id: 239c169e15da44519b2dad09ecd92f0052757929
>>>> prerequisite-patch-id: 6c586be864944bb1eed773e8c211b898bb1289fe
>>>> prerequisite-patch-id: f3d8748ccdb6760563f3e07f701a18388a9408ed
>>>> prerequisite-patch-id: b1639353868bed10fd3cbfcd01cfb88b7e737ead
>>>> prerequisite-message-id: 20260922-maili-dts-v1-0-ac2b1b76bfd9@oss.qualcomm.com
>>>> prerequisite-patch-id: 36f12c16bf9cb0411d8be2f396407c724162189d
>>>> prerequisite-patch-id: 28ede1ab83d4b5b56423ebb09bae74b6599b3bac
>>>> prerequisite-patch-id: 6b3e28c55c07bfcdca8bfa9219fa0c6c763c6f6e
>>>> prerequisite-patch-id: a2007fdaaeaf2981860c54ae5514f5a6f06c6bb3
>>>> prerequisite-patch-id: af8aa3c630647336bdaeffa9c88de3650f1e49e4
>>>>
>>>> Best regards,
>>>> --
>>>> Akhil P Oommen <akhilpo@oss.qualcomm.com>
>>>>
>>

