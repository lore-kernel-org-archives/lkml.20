Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFDCC4A2A66
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 08:42:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791967361; cv=none; b=dKNPJgSqKdffg3k3coESFcp7DlFfohPkAPGO65QWMCJvKWhNNZeSWo2jcyxRRWzp1/gyLYMxJOOeETn/sEzc4d90ZMKYwy1sgFWaOcEQSiXHlpXLaC/d/cNmvqv5Qgx+9wvU159LT9Je6DYDJS2GBfv+S+msL2MzSClSAXChEgY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791967361; c=relaxed/simple;
	bh=DZjiREOEPLWxaSXYcMVuRRT56WXD2E3nM+rovrf/GCM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OJ6h7MbgUHbDqd/SBwGrO0U986/10xxmmGO0Yc/bogZV6BxqeEV0mao6WomHAofsYeVxKpvxhvs9nDvSRn2HLl3mQRWf+86sjm2tT3/Vo7GhdZXnWEbV8qT9grxZfBsHLuxoZ7aCVxzzd+qP4qrvoyWmnFg9vc5jPL2s4X0Udv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DpbHQTWM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SLZDBPKW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DpbHQTWM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SLZDBPKW"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69E686qE2515949
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 08:42:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=qgRxWrIOTdH9QqccB8WERobO
	gjeOV/SCKx62FYHmlxs=; b=DpbHQTWMdjGAHfU43Qgy/+Y0HlvsudnMdw5/PgMl
	u10wgsfLAHtuKKr/8nB4bmhH/NmnkSEvOxNWKujWDVdwn7enDFNfUjQyaj0ZVfSQ
	lWd75CT2gBI/KsnQdmIqtzoWLFkEIPMCEWZWs8kHY1PzVZ53wvRfISx473XSXnHJ
	8PxzMi0dRT6KiE3lX2NuMKsvuTzgT70sE5zdalnfVl/I8EKiBBfayIUJ/gHISapu
	kyLdY9s8ZXitmQzNDwoI8s3RRCjJtIR6u+S2TtR8R1W2sy0N4HfRcCzpToMZJcce
	XSRNnsWn/ZyoX5FyMCfltOIp1853mM8He288aOHfVgoJ1w==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ha4708m48-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 08:42:38 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93cb98809caso676020285a.1
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 01:42:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791967358; x=1792572158; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qgRxWrIOTdH9QqccB8WERobOgjeOV/SCKx62FYHmlxs=;
        b=SLZDBPKWU2VZ06jWYDovlNiEeq1y5Num4jj8qW3j8GCU+DAXDChBLeO8ctJIDLuQCY
         jsJOSjgpAyyDXLXfvuDW9Wo70/ESLjsyylDhc5ZyyQiBCrhaiJonfCZWC5dZpESURUyC
         R+0pjZDno0bQ6Xp66DyxdmCKB6AhL2qJmhY0a57qYv0jZk78XZZukhRuWB41wPluFi6g
         /wwdICZY81GABPTLwe06Rwu6b7qINGRsf3LdI4HjHleTk9WeasLFVcRSrgh9JN+b89fd
         cr/szty3cw5I70sRsrhlnrQtnWGGtC/jOfttp3G1p+Rjkeo2maNTDg9j5RqhS6X70yuD
         CR/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791967358; x=1792572158;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qgRxWrIOTdH9QqccB8WERobOgjeOV/SCKx62FYHmlxs=;
        b=Vio/z3eqMWrT4/ivbSk1tAKSvWi5Emw6y4dZ5OLevMPQy64mq57xthBE0H4mWp8VDc
         10VuDjY0C2VDLz4PlItkMnS7Jr/e75jm1S7Qcrt0dnh7yS1C68WUIHLMcutgDLrLMagz
         vXNTgL31PbcRqm6mo2QBUtYdNti0KujxmCvqvh9Mc5trgbNurDDp2x7Rb1MO74L86y9+
         kbRg4LDfQOaP93uzrl81OCPxnfHRF+aSgpRyRNXANm2V+q253hXSaQcThBlPTF3PWXk3
         eG+jWBcaBwck35g3yUkgtDo/TevMV4q2HWJVg69z37kn5+6fLO+q21NBdB8Jdv+8SzHG
         sf4Q==
X-Forwarded-Encrypted: i=1; AKwUvBxTz8Z+ry/tfXtSQS9HEkEr+5lymbANN2RFCd1B2emjr2t556NzlIopcEKh763o+8jua/uIJiBxTOHIGcU=@vger.kernel.org
X-Gm-Message-State: AFq9FYIzOWSyfwdynlKs+xxIyBd4F17pLaNReaDAJCyV23cpza2Ag5+C
	WfbMznz6lABaLTO4dXpmnQe9CJE+PAFaUXx40D96KAJWN/r8kkD9Q/9APDYfoMC/oCiCt8UdtZ1
	h8vmzcKY1IyHy9LTm17Z3LFyNSDX43XLGsj1WsT4WZp6hAGXkH9BuJqb/Go3Tne+wzVk=
X-Gm-Gg: AYBFou1oDnrG50RxowcTEWI3zWraJYM1+TuuPcstLKjaqZ5XtkgPTiAz+TYwSn5swu4
	+YZNnjWSBq6JOMAt/WUGGyQ1ptro/+41STJ/Muo94HpxZcTtPfZwCFORKn9D+T2PIRhtn801K17
	b/dKwMWkdbLo9TRw2miEeosCUGQU1lkzJbLqzV2P/hx03xLBIlmMSRuBNM1uakHG0XtLnG1Y/jo
	FTCYl5CVwisOh3BaeG1sbrgT73+ggJohlb7kvyFktiZnP/+SJsra2mbIsTgH7jo67OJ2kR8Yf8T
	Q5/DdDYOifhK+wNywqOLW7wRh50Z45LcKUU4A0ytppG3tBFc3RZpH+ZLjKLtTDf4iZpiP7Md3xu
	l876SvXMz/gYGbhfD
X-Received: by 2002:a05:620a:470b:b0:93c:29b3:3525 with SMTP id af79cd13be357-93ebd262b17mr2334031085a.36.1791967357860;
        Wed, 14 Oct 2026 01:42:37 -0700 (PDT)
X-Received: by 2002:a05:620a:470b:b0:93c:29b3:3525 with SMTP id af79cd13be357-93ebd262b17mr2334028385a.36.1791967357269;
        Wed, 14 Oct 2026 01:42:37 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.215])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de7273a0esm5635211f8f.29.2026.10.14.01.42.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 01:42:35 -0700 (PDT)
Date: Wed, 14 Oct 2026 11:42:34 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Xilin Wu <sophon@radxa.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dragon@radxa.com
Subject: Re: [PATCH] arm64: dts: qcom: sc8280xp: Fix GPU SMMU context fault
 interrupts
Message-ID: <isktrr4zb4wfucw5dxv37rocjoz3v3p3x6frvbz4k4pysqsmtn@h2kcalqncd26>
References: <20261013-sc8280xp-gpu-smmu-fix-v1-1-8a781e3f1554@radxa.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261013-sc8280xp-gpu-smmu-fix-v1-1-8a781e3f1554@radxa.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDAzNCBTYWx0ZWRfX1C5aTXEQjv37
 yCNw85EUdmD3U33XdLTjIR3i9T+YZJ91JZbchlhGpN+CTO0vu3ZOh3cXEaxJeSJyQdLt9E+Eg5i
 I7O5rnpCxctHhd+td26sVJ5qxG9GbwOXqcuHl0ZOu7tFN7ESuIAtJRFzS9cdiOOKzoRV0gMIhCu
 GBtilrY2SM1GnXIdkQlkk8bW1rit35KzIgxJz4Txmk8lkFTBRVLI8uR5bQ1LaX25XAqt0GK1oKS
 4lt+gFH0odT+MQTHkhU4hunaapb1nhCPd1s2z8pdBWd7X5O5JZ5JEiAgm1fQDUTlIFFzz+Qa7YL
 uiuvjWYNRIQP1kn9fBTu+idTDnT6z4BEVkj4mn0mC9kSZDpQuquTG8mTXO05jm1veVdYZxArLzX
 06vdNavS6wloCS/ZNU7XGGber9fGppZ6qFIi5wKc9Tbo+1FeNTwIVjqDZiVGuUs034HzYZF1Qc5
 nNUbM0go7Yf2ybjS08Q==
X-Proofpoint-GUID: M1tW2kht0s-xr7enYjdIzbypN4pI6rjn
X-Authority-Analysis: v=2.4 cv=P6avFSAu c=1 sm=1 tr=0 ts=6acf407e cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=Rt3kCFFBWhWisHNmluDamg==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=ksxQWNrZAAAA:8 a=EUspDBNiAAAA:8 a=OHRUEhKCVAIpKXg0jaAA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=l7WU34MJF0Z5EO9KEJC3:22
X-Proofpoint-ORIG-GUID: M1tW2kht0s-xr7enYjdIzbypN4pI6rjn
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDAzNCBTYWx0ZWRfXxnNeZOdCDBY5
 +7TLwoepU+590sUZBYpfyFpKScTXOamW8sTyzTWogK4vW0nTLCNebMCIyFYbUIIJjsEIa/+KB91
 OV9ft73y3k3GD02ze7GhJhLmHWFk9H8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 suspectscore=0 clxscore=1015 impostorscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610140034

On 26-10-13 17:59:19, Xilin Wu wrote:
> The GPU SMMU interrupt list includes PMU interrupts as the first two
> context fault interrupts. This makes the driver register the fault
> handlers for context banks 0 and 1 on SPIs 678 and 679 instead of 680
> and 681. Translation faults are consequently left unhandled, which
> can stall the GPU and prevent recovery.
> 
> List SPIs 680 through 686 in context bank order to match the seven
> context banks exposed to non-secure software.
> 
> Fixes: eec51ab2fd6f ("arm64: dts: qcom: sc8280xp: Add GPU related nodes")
> Signed-off-by: Xilin Wu <sophon@radxa.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
