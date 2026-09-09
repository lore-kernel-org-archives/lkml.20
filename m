Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6642353A82
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 11:20:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788952829; cv=none; b=OwlURTzbG14BzzNqyNZga9QIZotijcAfoRfEnvPu16qUoHu5JYqAtmISudZTFrDfQEMXO1gAg0SkxSUmPlPpZOp0TwazxnJFjldUtGVETSva3GWFqw2ny3ne77/Yc0MOJdsEfgRbGdovod35NhJUkgQF21FRRPIuYJvztMQJviw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788952829; c=relaxed/simple;
	bh=DUsYlKkvwKjjsSNqIoQQxP51Bvntujpq0lq4unmaNL0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XLQBfquCovZH0iFDhta7CT2SdGbDxg10Bt7ki1ONCKgUBeCbQjf2HwhGbmtCKy/0x4eKmINHkO5GNuL1ewqjQppmiCuj3OyaT4RSXaQJcrCNUCG0+P/r3HZRKnpUKL+3M3jnlwkj6uxbJkru8UPdqzBYDwEsg2PEsO3FfegNwoc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ECFrIsn8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fJPY1gFs; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ECFrIsn8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fJPY1gFs"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 689ApsFx1639513
	for <linux-kernel@vger.kernel.org>; Wed, 9 Sep 2026 11:20:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vQtQQqwToKFipRp5aPXLXVSkmG9dKnTQCGGbK9gORPM=; b=ECFrIsn8p5LdXh0B
	008jOPQ4K4CKWRWQsmOHYYxhJtvGIah/owRDrTJwK87nEDb/SIce+cTYI5anaw8u
	aJ/SKqbT0yDtH2sud1oI8hfSIS6rxTu7KGQcoNtTNO88Wn/urWLOi0XmoWD+PVZt
	inriZavsQwbnYzkwF68vxXVB9EGDdkJtjeXAT8mFXFzabLDXSoKvCUdSsAYPgIEB
	L1NSOpC9g6GMyeXpfBneNkvk+TXmBFB+DcbLLHolwRVkClvV3mGewqN+U0bEDpPq
	v9syV2Q8+p31PFSEnXTU8ew83iGW2hf4IETsh6mQ7qKWNnDTRvRj7gIV0/0g3QR1
	gCyItw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gk5cnr980-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 11:20:26 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93821883e26so112647185a.2
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 04:20:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788952826; x=1789557626; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vQtQQqwToKFipRp5aPXLXVSkmG9dKnTQCGGbK9gORPM=;
        b=fJPY1gFsYzv92lMXZJo9AHHohx3sBb4sFpqNMA2EIJo/Bo4o07dpk+ebvpxJwCBLL7
         QzDNEy+SpA6+1O4AXXfZ01aJV2xT3EgF7hQ+efxzX7PWg6MJI/LgrG6VvCBj7XvvbGtj
         LYO05mI2182q6Ua7G8hU3UjezxhisGQv4V5qBmjZ47CW9pFDG5S53haDiFjp2Ri1OiPe
         vJ77eqLa/ABQ5iSIgqullWeg79fVmck7HYp9wqNUtERTwZcBNit4g1CMYMuCXCse0lV8
         zUKSCKrwClNl1bcyXk1XMccbGRjRKc2mq9BDgm12BPUYmmp0coC9z1yMr/bJUsOJyWR7
         +X/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788952826; x=1789557626;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vQtQQqwToKFipRp5aPXLXVSkmG9dKnTQCGGbK9gORPM=;
        b=Jpjm/dESJ+bKwVFKI2lX0vn8BKzUpJ5a3i48ozaj27lz9NN3TfMPa0SLPOQiIe+7Nw
         mo1WCVIPAf/u2EeAzu310cTr5LHEKvL3g2jgb5BEWyGWVGLYx48A2YxjLM419c0INkL6
         KXchqsabKRAY2tBHKBUN6DCH0NeCH8J7b1zypSHj6joe9xKT8VNRDA2k3Lh+LscJzkF2
         +0izS3oYyD22ApOvt3h6NJ8YYMsvHDlF9Gxb7iulfG33vGQkkasZQHHrcBtp+NX1RjgD
         bvylrqrsWrGKHYXTAIqH48dKiyNpkTAoDea4xg2vtDslh/JzrBM3hNrVgFOhlOtJRL90
         1YTA==
X-Forwarded-Encrypted: i=1; AKwUvBxkqLrKajY3nuUpBAITYkVFEfbe/qDLpsl19cTUPJHdxyAuuGbKoYoVvdke7iR51YABlusfg9P2MG71X48=@vger.kernel.org
X-Gm-Message-State: AFuF++n31Om2wa64wzK9c20jZCdqS8VgpwHGBmlL4LzvpP3MfK/CI/RK
	sYvOO7SXHKNW7dYl63TMoDG93EVS0sPWkonIsarQGU7+3kn+oaCIZKXDVizMkWHcvsWA91tMQJJ
	YVVxajEh6US+f7XF2V+bE0ERddqjuCEQ0NQCgwmxHEAA7+ePbkwuGz7BHj2Ev3JlMx0U=
X-Gm-Gg: AYBFou3ybF9kpkNYE4i3nA3/nsAphR+THcRAARe+2HsOwL9bVEIRUVXYYOOkcRpysTa
	6mcPpv65TGVa1m5ITk8bMdwU8TPTQi906WM+qLAy8pOqPR2M6DL/vqwKLE0hZC0XjirVOgAWGM2
	Lhmhm+WG8H+AmAHZLFFuk7hU7kUlEOC5ypxktxViZ5AEfk6FNnMm4L7SAaBBLev60BdyO4UiQ8H
	pFENi63krNmXZDIxRB9AZTRQfs2JCB8XRrXvuhQB1u2IOCprvPvPfaimOwU87R02fHrvJqxFp8n
	Ydjyjsbw4Un16auvs0zzGgGjSHj73U89ZAwSj8Pi06UuW3WC0CnzTSnjqdhoydT7puuljDXfI3+
	fTtJ7n2Ev27xdI1uWxXrpjQ==
X-Received: by 2002:a05:620a:d93:b0:939:7e96:d296 with SMTP id af79cd13be357-93980964b18mr2960057585a.1.1788952821031;
        Wed, 09 Sep 2026 04:20:21 -0700 (PDT)
X-Received: by 2002:a05:620a:d93:b0:939:7e96:d296 with SMTP id af79cd13be357-93980964b18mr2960049485a.1.1788952820503;
        Wed, 09 Sep 2026 04:20:20 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c260d036469sm760422566b.1.2026.09.09.04.20.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Sep 2026 04:20:19 -0700 (PDT)
Message-ID: <d56e598d-e598-4b9a-a6b4-1d1965aca656@oss.qualcomm.com>
Date: Wed, 9 Sep 2026 13:20:17 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH PRELIMINARY 1/5] arm64: dts: qcom: shikra-iqs-som: fix
 GPIO138 reservation
To: Andrew Lunn <andrew@lunn.ch>,
        Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Anurag Pateriya <apateriy@qti.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Richard Cochran <richardcochran@gmail.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        Maxime Chevallier <maxime.chevallier@bootlin.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org
References: <20260908-shikra_ethernet_dts-v1-0-69c0c5c7c124@oss.qualcomm.com>
 <20260908-shikra_ethernet_dts-v1-1-69c0c5c7c124@oss.qualcomm.com>
 <169b2cd5-d0d8-4682-8756-bacf545a95a0@lunn.ch>
 <aqAQ+BxwJstTlnU3@oss.qualcomm.com>
 <6e5624f5-410e-4413-82de-84cf864fd654@lunn.ch>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <6e5624f5-410e-4413-82de-84cf864fd654@lunn.ch>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: iTu6Mbs60yJqDHN1y2tpfmWV-eM4mp6v
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDEyNiBTYWx0ZWRfX0/NPEjiGWH9s
 7wN1f3vgZzZJCTPMHteNyOOvxSs7SXa3ypxj2T1+hZCDb0cLo7xerGZe9PAvoK1hf87lIjU8764
 MnxR3YtwEOmipykCtwsVhTSOTU2nf/A=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDEyNiBTYWx0ZWRfXwPLD8NxDfXYq
 jzZSv6JiewgUGFOYegRTZ/J2YHWrjLvUVQJkiWUIl65Cfp/T2nrBWaG9aEy3kYj7+YJsJC69bvu
 YTvuWk15Ct7dZasuVaxEZq15xqJ+/px/kJ5qTIJbnOj/16LHAf017UHgYxqksr1M6TnBhFxmIaJ
 sup+TXqTWP8MMAntCn8u/vBg/oJGE9fIWkeS1ockrWJCK/HATCYB1VitWPgyepUmH6oz9KYoB1H
 tiSGSLNaA+HeXdW3TAx0fc+LfXQOrqzkH+xiEcXzqkTuElZ3aP5JSQ8tLVQf48ZkPfSPPjuLxd4
 gKKgSOPE2sc1TL2MZyj94AmDhNspx5nRnjHAqTwyDHpYCPV58JjcGp4dlvl6W6sHXS42PUsQpTq
 5zQMTCNeiDtyX3mRbnFPkJMpfk8AukC7fFD2yChe2RYIZWgN8fA0iIsyE6XMUHNN/6hst2BycEY
 w62OpiG8Lv1fIEQAImA==
X-Authority-Analysis: v=2.4 cv=S+jpBosP c=1 sm=1 tr=0 ts=6aa140fa cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=aGMi1ODkbYrmhBfOWAQA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: iTu6Mbs60yJqDHN1y2tpfmWV-eM4mp6v
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 impostorscore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 suspectscore=0 clxscore=1015 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609090126

On 9/8/26 3:57 PM, Andrew Lunn wrote:
>> You're right that it reads like a standalone fix, and that's on me for
>> the commit message. There's no functional impact on current users: the
>> reserved GPIO (138) is unused today, so applying this on a released
>> kernel produces no error and there's nothing to backport to stable.
>>
>> I'll reword the commit message so it reads as a prerequisite for
>> enabling Ethernet rather than implying a current break.
> 
> And drop the Fixes: tag. It is that which draws the eye and makes the
> Reviewer ask the question.

I noticed this subthread only after leaving my tag, it's still fine
to keep

Konrad
