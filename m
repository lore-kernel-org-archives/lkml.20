Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71145348C76
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 06:33:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788935627; cv=pass; b=JVeoesV2J0Gjhpj2guYoK4kBcXUkixNjNQpzM59F3YTkuXZUeTJF9c9ZZntsEE3JEgIsTbgAzTBbGzgMJ8U3JD9N8uLsew21Z2JQSQ/lrFWzlSUw+i1rm4rmvh4AIeGJMAhUArONZSmQof9RxMY+f5SfV889ZZvwFc2OG7o4Lcw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788935627; c=relaxed/simple;
	bh=18Zr3UdkPL5YGneMwhBfVyFM5vzCFjokkjS/4aofckw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MnjxDZuEBNXmOUJIvQfd96V4AwmYYWB0EpenPgzdhe+GXntwIBmnlzzVv7vfM8QLZ1t+pwUc9S1EsHXY2lXPZxUS+Q3ylgb9xxtIMpfxO7Ubb+RJtsXuULQ0wbmzypVwEPVw4aXormBPkZOkM3Fe2kQl74VQkrMZvmbfRlz3b+g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Zb3O9jTD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=E+UmiBp5; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Zb3O9jTD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="E+UmiBp5"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6896MTlY129581
	for <linux-kernel@vger.kernel.org>; Wed, 9 Sep 2026 06:33:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=F6ybEqTWr7PTGYwKjzBDvKVQ
	3R5C9k69c4zwqDv/bw8=; b=Zb3O9jTDa7TD3YF5CyohMezRJnRYfRROVFjO9ENt
	a6+cMTTOzkJ1jdnqKiEf4Snc/tZb1VvPHpMi4wYl866F0UHYbF4YCyXeytCHz+OE
	5aRd8+iqX+8qoq9kQ+6FrjSWtZab/I0T9Eg6Ddvg+zt3xZHqjzLWqaSUqaLs+YB6
	rC7hSZxYkdmMFAnWj2FYW4hTuXobdP3fxpCvrNvos35xcqov05tUdrMVI7bxSW7q
	91G/1/N600LxVgYa8hf78A/77fHItvLIcIyv4EECHJhkeF4+ATf46nvVstzGOiYU
	cYanulIdjdx2rvpJDarP9ttc2t2DLJlgN9dwPk0EsBlJqA==
Received: from mail-yx1-f71.google.com (mail-yx1-f71.google.com [74.125.224.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gjntpk3bg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 06:33:45 +0000 (GMT)
Received: by mail-yx1-f71.google.com with SMTP id 956f58d0204a3-66c73057f18so4108256d50.3
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 23:33:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788935625; cv=none;
        d=google.com; s=arc-20260327;
        b=We6+APayyEjZumWdJALloW3OscXMwdwYrExK0z+0pqCG0NPEPhxYfns7r6Pe6X8x55
         nyJWfQCnWESVbMiVTNuCat9ZGiZ9LbWWGC2Alarjm9IlQxBppgvYNpm0gmDWuIzKAzEi
         n5oxQVdLzZULQdr/+AGQ2tI7J/I+7kxunc9s0JsCtHXjgZt0KSbgaHUvhZ+NROx8Yd2c
         A3f7OjCsINKnj9E6b3dgW4Of96+C/KPSuxkuGoNP+T3avBwMXZyKH1y1RGvaTJkP2PEM
         daKFVdlJhlTfXfpg8kYNnR5QP5igY7z++s//RUjhfDl/rRpwj+UfxoPOH7gET/fXYp+H
         apSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=F6ybEqTWr7PTGYwKjzBDvKVQ3R5C9k69c4zwqDv/bw8=;
        fh=9+0wMXBSTSxKjPiLpKOkAdNCz4VyJiGvEcGPi4DOBEQ=;
        b=Oxzzqwe9953//FTKl2OUTmwxiz+DeqS4k0PUQ62vS2sIFfTwliViWJJ1Fk/Uq4riS3
         gQzXClpFcX4utjd+KEafqpMtFtZ6I7VSiUmMV/0G3glsJ9KoiezBefKVimgotNzROEEm
         u7DP/4W9YX2JV/xDiaFqTyWr/ursiUWHKYFi1iJRyfwsCN4GwFJCUk2o4u7dpkgK3a0D
         9ylpHI59oe0ODjyrpPBCexQjFEXY44V12N+/EBO6iZtuYoFysXsoCOysIhkravBP4jNH
         6lo88Uh85OHC+VCmrpupN5GC9zurGZQAr3LFDHJnLqn0cOgA57FxAF8hb1zAsbAnR6DM
         zvIw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788935625; x=1789540425; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=F6ybEqTWr7PTGYwKjzBDvKVQ3R5C9k69c4zwqDv/bw8=;
        b=E+UmiBp5BRAVIODiR25zkv7V9V5Fkeb8NFapeLUY5tC73bEleyocPmiNJZMIXuFxei
         OZlJXBScH63McmhsAsSZNbNbG3ImsgyoL2bfsJyp9tbvMX92K0trrOfT29krlsEmEuk8
         jG2OCcL0+yfWdBeYwIJBq16a//EeJmeOATum8ikS6zfJkID+yOzFXaZh2XiPs6rd68u5
         dG/BMtVAt5QJ4n3Eg/Sle2Xm78hq8JnfRghQ2Hojno5S02pcgDB2WIxu/pzPhBhOWOje
         CNL0Q8KOZ2GeWzfz9FhHdUis9+U1CIgRUc7a/F3iwrvUchtNvdmp2/jD2OLynU7DI0tK
         DveA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788935625; x=1789540425;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=F6ybEqTWr7PTGYwKjzBDvKVQ3R5C9k69c4zwqDv/bw8=;
        b=a/h/zTpBvM0D0pvrIW2AwWX/N8dM0ehtQOHx+e3mw/5dpRJW5cZjBUbTNFXTIIZyS4
         G6BprmOhn42Z3ECkJQktmF2LvoNZzD5jhqvfK0edrnkOEaAhKln3Y8WWupZf0wEjcSti
         WJAUg3nnuBxVkF6cGFpUzdyzoHVxM7snUpdQkAM728NP8/VTHmB8S5miBMoJL/1svYkV
         zWPgnKDl0aLX9wfdCYSk3uhLUlOfewlH97VNuSWPTsud/TyFIwQ2sskhL73CJ2k6Sqza
         mfGOWPn1dXOUe5Q4MmHZ+VPeRXrKXqlvWTOHCZf9nMH0uVgmhXiODpr0ssW1HysiRRq+
         pNjQ==
X-Forwarded-Encrypted: i=1; AKwUvBzHtXfhJ3rYROxYZYW0lyurSajgwUN4wZQf0Wxp7zpNpp9bsbHd/fb27LovzrcRJA0iJ1rIwmeeY++vtyY=@vger.kernel.org
X-Gm-Message-State: AFuF++n7oOwbAFaXWFxo0COK+xcxs/PJiffE3Rog9JiDbh0nrs5gIX8C
	Mi36NAWQhLTwANHVN15XpabdX/R+h6OqH0CJ/stAUgHuWRcKFpcXFCH8BfBt9ZPqSLjelZ9an1I
	tIjclBaHYswPzkfC1y/+zVxCda+qedgzSW/7bRFeRv3lzcRMb8/v9FpSn10mS/uVQ6s0NxdjJOT
	oPtaGF+vMTGAcClRFBwUI9X5areMaUXCkzG6u586Eh6w==
X-Gm-Gg: AYBFou0dg596vrQPSFna1ETceRGJpqukSEIUqSsaZ5jdc+u1eS6I7/X+KlHOfYDXq69
	kE+xZ82jMFhCKidgWGG7/ad3RYG0+fLZGam4rUy3/v44NOygY7Ck0VzRq20ReHAEWPnJw9l1M5M
	KBIEByDQMdejqeJ4pQGFLwlpnQAhz8VSSloB90G49M8WBMDPaq8G0J887EVg==
X-Received: by 2002:a53:b604:0:b0:66f:c1be:84c8 with SMTP id 956f58d0204a3-66fc1be8c6emr6652764d50.54.1788935624949;
        Tue, 08 Sep 2026 23:33:44 -0700 (PDT)
X-Received: by 2002:a53:b604:0:b0:66f:c1be:84c8 with SMTP id
 956f58d0204a3-66fc1be8c6emr6652744d50.54.1788935624539; Tue, 08 Sep 2026
 23:33:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260907-b4-qaif-shikra-audio-v5-0-6d8ad9ba5c9f@oss.qualcomm.com> <5e6d52cb-53f6-4af2-b1f6-d894d8dcca9e@sirena.org.uk>
In-Reply-To: <5e6d52cb-53f6-4af2-b1f6-d894d8dcca9e@sirena.org.uk>
From: Harendra Gautam <harendra.gautam@oss.qualcomm.com>
Date: Wed, 9 Sep 2026 12:03:33 +0530
X-Gm-Features: AcwNN1WQUsj5OMuHNikswDVbQA10l--Mx-WHy294kAjPi8kkiskKKrtmL0NvCDU
Message-ID: <CAC-tS8BnLzKrtz_rJ-ScQwbfcvFuj5ptOBzXgCSCgUaC_gUCVw@mail.gmail.com>
Subject: Re: [PATCH v5 00/10] ASoC: qcom: Add QAIF driver for Shikra audio platform
To: Mark Brown <broonie@kernel.org>
Cc: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Sarath Ganapathiraju <sarath.ganapathiraju@oss.qualcomm.com>,
        Kumar Anurag Singh <kumar.singh@oss.qualcomm.com>,
        Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDA3MiBTYWx0ZWRfXzzHlSNIrV4JC
 uZILWA9G9dtslGp+PC2jL7XuxZ+8EDDYetKoCX6+0fZHwHtnC0VoU/EJQK9RDXpX7TNLX2tTlci
 NnEQsN207Cnyh69zkohcak8BXMT1ntV7ec6hFW2Kg22m8FXukabqIhFvWlfHHO21jL6CGfVMFyE
 O1VCGEP52RFslXJa9/1p1aDY9hmlI+CopV28S+jkVRiLAxRAwuxPje1kVSfaM2zIrYXI2gs5/2h
 pcXaEHxpZkrOsIVUHjJCW1h7g/RvTJ1QArB8ZEfRVmAyypirnYsx1n6Lz7pdox2JLGRVtKoSC7a
 zA1mgEu46gquq9VR+ZbZlL6Gb9YNwP5mRyd9V//eaSJQ0YyAvBo3ASiU3fB0DGIL2qCSfM19OLq
 mKp0g5CBxekSITOUBnjpDMY5ulUDutCIwnrOnHaHn4hMxBIwlybz7qTOC2sL4dEBh6opp1RxjPy
 XBeDwOBhlSgq3B6YtAA==
X-Authority-Analysis: v=2.4 cv=N+AZ0W9B c=1 sm=1 tr=0 ts=6aa0fdc9 cx=c_pps
 a=ngMg22mHWrP7m7pwYf9JkA==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=rJkE3RaqiGZ5pbrm-msn:22 a=-dXBdVp_9Me3CGyqtu0A:9 a=QEXdDO2ut3YA:10
 a=yHXA93iunegOHmWoMUFd:22
X-Proofpoint-ORIG-GUID: -TtCMtKF4TSFVMhR-QioUK8SrX_iBG90
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDA3MiBTYWx0ZWRfX2ETZwOxu3dOc
 jhZpVn9y0g5AhI3rtq2UrevVlsHabfFV0ui0VixtBIx3oh8bG4l7XlA56KntdB/Fi5QPGJBY8Wm
 a7FhzWeHDcKDlKBP2UgDi+tRr42NeHk=
X-Proofpoint-GUID: -TtCMtKF4TSFVMhR-QioUK8SrX_iBG90
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-08_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 clxscore=1015 impostorscore=0 bulkscore=0 malwarescore=0 spamscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609090072

> >   qaif-platform.c: PCM platform component. Handles DMA buffer allocation
> >   (dma_alloc_pages()), PCM ops (open/close/hw_params/prepare/trigger/
> >   pointer/mmap/copy), table-driven two-level IRQ dispatch with
> >   period-elapsed notification, and component suspend/resume across power
> >   collapse.
>
> I didn't notice the suspend/resume support in the series?
You are right, the cover letter is misleading. The driver uses runtime
PM suspend/resume (pm_runtime_force_suspend/resume) for power
collapse, not PCM-level suspend/resume. Will correct the cover letter
description or any other misleading text in the next version.
-Harendra
