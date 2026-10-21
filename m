Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792570018;
	b=YQG3RV1OpdhYi+Bi+2wvV8QqzooTdJSOx4KJHf6/aAkKgmKOvyyRqoR2WG8M/lO7LRU8
	 RuAcFwUmIEutHeJrESfGW9yD6xUIOIdFl+Sg6eu56XslaEt19Uj53ZLFybu8WbR4/QlVA
	 b7Sv5Y2spl38wJXWgccooTbQuvmMcV09auLQEjyZgox++LKVU/kHZ99G+R3Dkn+IUbcXS
	 eLye+c0Coy3qrheDTMWg/LaBwj8iEk/j6dG7jkoJUAgAwhRHfz4A7otQPBRo2Zr1dRqUX
	 tkip2+wG+L3Zls4q8Me6T6YwQuz/2VoQpj/Fe2m+aBlGpsWezSDO67hv1a/HyQ0+2yw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792570018;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=1+yqJSxYviGEzUWfX1sO70Vpcyk9lvgESMBpH30SQXs=;
	b=i1//wPRnUn6hrNgbYIb/IEq7Eq5tXFaK2zc4kEvngbEr0KBhL/kKPONwfN2XeKRDY6d3
	 8XvqLCnTGbq7KPG7L3wu/ckGRNsYakErV5KrfI+Vi+VNfnOC06UK9vM8ascIiOo4I/D/f
	 KxIIDozVNnJ09QHdUtXt+o2W49U/vsekO6xcpVllbB3LLwhp30gObhuXpRMbmdXecpLhc
	 eUL/P9GcHpKAE/SJAdHq5KUGtRxqRHVzRPPodXxnVLLqedOmvhNnHvjYEOxIgt5VJrwIn
	 euLrNpKLZFHu3JKiEsa0PjzSN/IdGamttZkint8cbfU8b1d1PhzSePDmhxJ4wZuNh5g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=X0qy86Zo;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=j+z51+vx;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47DE8606A31A
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 08:06:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 47DE8606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=X0qy86Zo;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=j+z51+vx
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69L5iqCY3018337
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 08:06:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1+yqJSxYviGEzUWfX1sO70Vpcyk9lvgESMBpH30SQXs=; b=X0qy86Zoug7WeEMf
	4iM7kVEBU81ejOppNBw2waNYs/4WQUFQbQ7s2V/gxbKeIBy5A/HKdeQ4DFnZYlF1
	K9/7H0PHrMWCpg//Zr5Ds0bufO/dtrygCglP2VsPbz5psJ9JZelWTJiwoTjKuGwS
	D0Lkb4umD8arhZSj0PH9nTTSpLRrvIK5ylxcI8ElXwmMAPwdKy3TCjW/UVECNZJ5
	UQhicYC7RIh3MIKC/+CNmBExLc5ZIpQTpdO+DKwbB5Nqbtb0RPW5IWCCQdAfI+eD
	VpMulglUDcVMKL7rCyfguzLMgVVPRz0PConfw2nGXKHK9mp/Q8vPr8nL0KEhttAH
	MK1ZGQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hebyd34cp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 08:06:57 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93cb1091fffso7834885a.3
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 01:06:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792570017; x=1793174817; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1+yqJSxYviGEzUWfX1sO70Vpcyk9lvgESMBpH30SQXs=;
        b=j+z51+vxuvGC5fm3EHghef8JBOuFqzrHDi1bsIpp5xttY3On1TmcK4W2g2M+rS3lta
         tx0L4jQxBv5V+PCz6c2Wp5V6DYkHjVkcGbxqSxZtGfKtAde1jHWQJyl5iaxMLa34UPZi
         LS4zwiNOp192ET16+NgcIePJwgJIlswu/Xqsil01kgXmvYKulPmQbvY4FMc0Nuhcm8Ns
         mPu3obKSfabw9rzDXBWJOvCzlD4MtQ06WYeXkxmGKXspoK63zLuP6pJ2qe7AvP4TA15l
         nI+PUgEgxrjsbK4wx5Hpd2P+N99HjFbJJ0m0QNg3/37yLGts6Uzb/Or3FwqneYMDkHAn
         Z+Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792570017; x=1793174817;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1+yqJSxYviGEzUWfX1sO70Vpcyk9lvgESMBpH30SQXs=;
        b=ldPIsNUQUxTyoO24/2pteMqiffVzwnOEgzsz4vYAmZYxz+mSk1LOwNLfRdkhnvpK4R
         IMGMl2tppJoJ4cZnAtUtXgKvLPwIIB4k00KtMRWtI0Pu2Q0zR321pExrpuZH01xWODXu
         VOI5mTkafSk5ofySSlZ55LZTPkdiZAFW17M7jOKaghhmnaBr6jDMLXc/E0M5UtxB1eAf
         jP2/4g568LjLL3MwyW6+rxgDI1e5rDe4WZ6YUrYFOWzrNrh27OaoMomSY8POnXQomSeF
         2vRCUhKE/NjTpBIbl/+yjPDCnUUxA7DC908/9XEZqHph/Hfx1eItKZTIhZAJ+qWawc3b
         hOIA==
X-Forwarded-Encrypted: i=1; AKwUvBwmWjpBwLQeluntuYr85l7JiBEgDTdnS9ioxlnbfvLZtk/sj3L09nDjT4J3phWqN7dZA4Vnr1o/yHtgj0M=@vger.kernel.org
X-Gm-Message-State: AFq9FYKyt94qe4nwvxAN9MEaxoIUopdAetk350m1COaya4mfhikJiIfe
	gQb+ZvIq9+HaN03Mbpw1UNmfWNfyNqu2um1ggve2aPjbGniBMt2U84urbfd0HRE6YPXsxrhaKeL
	WiPqcXuJTTGup9BG7OLIM/fUVKo5gtSIGH+QqcTHKbixdx4gUXc3W2z3ojBFAM8kpzKk=
X-Gm-Gg: AYBFou3LuWfj0zTgQQRnUYHnuZAE5Mw8DusVqXYOvQ0LUbD/ei1lb46XCyyMvtgPjg9
	cdpcVNg4yB4Jiu9YchSeOymeAl9a3OykuggAf3vt7ChoLqWhwkAHPeTq3zGdSGTQqQF27CKEW76
	o5pAL25DgaMjDkqDhHFpYE6sXyUTw/elv/QTW4GkPcOGlNFHRgCC1jZAdEEJQ3i0vLLi6zYyOUM
	lmizTDL8mQtsnwXf/PNXusEWADbeO9sdD382fdzxwXsOw3wdmohGPvI7NKvorNtgqB8vb2GVY6l
	4DRKOYqCPW2FOJ7cUIhpPxPe5LzPnbRvUJb5tIzpM4GJLGIat2v5q9Eq8tonjQBJDUCe00qzgou
	4A3j2DM/V77wp0kp/JCPk5Q==
X-Received: by 2002:a05:620a:414b:b0:93c:61e0:81ff with SMTP id af79cd13be357-93f57ed211cmr350770085a.1.1792570016604;
        Wed, 21 Oct 2026 01:06:56 -0700 (PDT)
X-Received: by 2002:a05:620a:414b:b0:93c:61e0:81ff with SMTP id af79cd13be357-93f57ed211cmr350767285a.1.1792570016222;
        Wed, 21 Oct 2026 01:06:56 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4679037aafsm50051466b.86.2026.10.21.01.06.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 01:06:55 -0700 (PDT)
Message-ID: <f3a88d95-b6ad-4ac8-8e09-e89338559760@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 10:06:53 +0200
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
Subject: Re: [PATCH v3 2/3] arm64: dts: qcom: ipq9574: add support to get
 watchdog bootstatus from IMEM
To: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20261019-imem_restart_reason-v3-0-e6b1ff5de841@oss.qualcomm.com>
 <20261019-imem_restart_reason-v3-2-e6b1ff5de841@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261019-imem_restart_reason-v3-2-e6b1ff5de841@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDAzMiBTYWx0ZWRfX7nUgrY2miI51
 sImHgTZ2T8sRLy7gMZvaOImszgPMO6WZ0OuZ7Tdx2bkOEa+ymfNzKJs538GSK+vQM947IuBPOSn
 KV9sgPVRBvxTh311/dnwZYIKvNdxJ9L0ZmD1NVkjR+AGbxs3kRYN8BLHlGt15TgE5wwN6/vlfoJ
 53KoMAe7NnWJwvkfyvnfUiAnjYQrxBKgWdaNzMFL2E0vQkrjVSjl4iT7Z4533npF8zVSLwdhaQs
 33KDyZMZh2EPwJRBVwe2Owrqy0vYIZPdbD5geZVshnx0CtNI7jZW4JeOP7IB6UXdT0eGDrw6LlH
 tXmwos/JDCmc7/zfK0ya5CrHJlmzIirg3Uhn+fECAcMqcxGeVSqAdjSmqeOZS3OQSwWMCRiAGq+
 U6fEbABPbe8sNvwTO1FQUaLnDzcDb1dt8XwSAnVImO7+cj7OZoqefHfxohXghnfnmo8riYhQBBO
 X0qgEt6tm+BQCaBZR/A==
X-Authority-Analysis: v=2.4 cv=TdsDJhQh c=1 sm=1 tr=0 ts=6ad872a1 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=V2dyZ2dXe6VeIo8NBxQA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: Tmhl4YWTgbhziwekleFYysBBqGs0SDEe
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDAzMiBTYWx0ZWRfX6KHtng7XrmwO
 KEL0mqRW1mTrKnfqJCSB+HT0wD+J+PHsERuGOFibus2ICStjLGpc7AAy7U7kCpMySvGJNnWuaDl
 +ptOWYmLPbhM9FcuNYGeTW6b2++usQI=
X-Proofpoint-GUID: Tmhl4YWTgbhziwekleFYysBBqGs0SDEe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_02,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 phishscore=0 impostorscore=0 spamscore=0
 clxscore=1015 malwarescore=0 priorityscore=1501 lowpriorityscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610210032

On 10/19/26 6:46 PM, Kathiravan Thirumoorthy wrote:
> Add the "sram" property to the watchdog device node to enable
> retrieval of the system restart reason from IMEM, populated by XBL.
> Parse this information in the watchdog driver and update the bootstatus
> sysFS if the restart was triggered by a watchdog timeout.
> 
> To achieve this, add the IMEM node. The overall IMEM region is 32KB but
> only initial 4KB is accessible by all masters in the SoC.
> 
> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
