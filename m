Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793615299;
	b=Go2WQ5Mu7SyITEKW/BxOYYHW7VfglRjhwh7hpQbXuxCwgSnjKug+B3uNcLeTA+/0T5g/
	 oIjmL46HrHfus7TQ/FvzEj7PPepkIij4X8zUDz8RnM/Nr4jMF+mKdj5wHxmCl3sOTeFx5
	 AdPqgpm79u3XGho/b6AaiICWzGlaqDE38U2cWToOQA1UjyoFZ/+Wmj+xsfCIC/UcNdZ1k
	 HBiLWQCGMvnYQDXLQlSeAVfcIqAugNQclSWGapDIKcUoqdFC9YTaSJWqH1eIIM0eiCN5p
	 NJ+ZZFdZLcgEVOnt1N2/a/YvntXQaVBGucCM2UI5IjVmExHC1eI/L5fi/LcBqRnBV8g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793615299;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=aeUXDPblcIqwhdqPiV3Uo8oWImfFiygj0BnOsQpFNb8=;
	b=l1rTmNkMUzfAPNS0xAZRTpsa9pfbI1aJTRESkzch4Eji6lzMO8ZR5roR33UGpb2confc
	 kJjzkTjTL9UCN73zIEGaGwyBGs4OPKnaOitfzwLCLBaRSXZ8z8a+NQwA3w4P6VBbN7PpR
	 vHec485D988PD187xWMx/My2z2TJDyzhcNHl+tLgpXJrcnFfFXCtnJDuoSEa+J7nJb7u9
	 Tb4nksHhQGd7F0Wo1DqsEBRktMjj9TNG58QxXMiCHcCRisR62+6KPGieMLs/FKEilwmxP
	 Xxb4sjqjb2aumu/jSTxsd1VVLqhNYcL58ZZmRqV3hIYH5U4V3AqtWNuWx4IEFA4ufKQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZIo1zEkC;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HaCor6Gl;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A03B606A324
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 10:28:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1A03B606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZIo1zEkC;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HaCor6Gl
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A29A3ju260571
	for <linux-kernel@vger.kernel.org>; Mon, 2 Nov 2026 10:28:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aeUXDPblcIqwhdqPiV3Uo8oWImfFiygj0BnOsQpFNb8=; b=ZIo1zEkCsDGNlgIY
	e1lMX32ec6bSl3Zd6XKcPwGwHS36fI4Zu1NsHdlte7sH6f3BXJ850YLwepje7NZX
	5aNU+NsPEwaZbsbCwrpsruzzi42oQjQsZ/5Ya4f2K4jAxcpegrLkvT3oRSfPHLrP
	/mIp5A1TaLlTLdK1Ozdu1c5txx6oPRBRHq4EsAJu4uqwDPVXrTysAYqyZ//TTi8H
	m1pY4ZuZL42a1ZNlGRgxgK1fAV5Sijo2WkrOJaMdyhzRJFeILd6Hd51g1AJilPyZ
	UpYahcbEu/S4/JVUZ9q6E1ic/mafticeoYNDj6u79isqzEmiKDHyQTNk6RNBofPk
	llbKtA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpqmvrar3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 10:28:18 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93edac5877bso15185585a.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 02:28:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793615297; x=1794220097; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aeUXDPblcIqwhdqPiV3Uo8oWImfFiygj0BnOsQpFNb8=;
        b=HaCor6GlqwnzxiG4UND7bgA2SoIAEUPJrMq8Xu362lgm8J/MlIReeooHn3AHTCcwyX
         UC2/nyUEfPsHIcjVmNAW559WnFCdN799L41m2oHnZb3P06/lG14OgVDqXr5lEvVaCA7V
         v+xE9opW3md8czQugfRLD6QfT/R1YnuxL80LGgfQV15vXgmm/8raSQkIvMQFkRUnNg2V
         gXXoU1F8ZSPd0Xt8fys3GB2ZtilvAuguFxZY0cJECb8ceVhxdmqA1u4pOC8oR0S8Lw6M
         WH41lL9mf/N54qn4uGmxJRR9jwtLRhXvI1cwaSeR9YCj1AaYPhZ19UFrdddM+BKp6bP5
         Nq6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793615297; x=1794220097;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aeUXDPblcIqwhdqPiV3Uo8oWImfFiygj0BnOsQpFNb8=;
        b=WNrwyFGnss2kjRzuyTM7wI23js7mKYtK5g8BY0twmz/JZry0nJw3KgMJLkjlg7VMZm
         g+cRiYdhq11HLk2OAhgPXXqxn3x6F7ywklS/FT+ygOgY/d2WRKe2zBqlOEElA52jAM6V
         D2fhS/cvRCx2WW5GcQgeSL6aJpds0ooIx2RJnkgQ9xuv6us5v1k0wieLHifnexJLPSHP
         lPKvqh9D3mmWypARTHEhhLhouNQTm+HRuWurr6S5Onjg4gXftVQBx0x5WF86vhmWbrcq
         cY2vI44uAs+OeAESjZHA/MumgRi70TDCI6/wwFgPTOW/pHHtcRfbqZMhgtov7Xmo2JRH
         f9pg==
X-Forwarded-Encrypted: i=1; AKwUvBwq0/+C+uNA8bDsYudvqTKBouedj0LpWG1IrugoNs74Xksdy1/k+Rb8W9JqJYeddktkq1lyZm/S9b4CX6A=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ/gpatPNW5az8oNozD6aPcEEiTTjHprHavINLS2WqOrnjXn1LV
	ev2/SJe682Vh5yyioHSJm95UP3UoWpXKJ7ac/DKYxCsJrayxUsYw9MM6tIBuIwDjGEE7LCXpKtd
	LbYltjv4t0kqIzcvAFKpq5veYlwW49Y2GrbUsKxXfuC+32pOUhUOq5fvhMFcIFbFeVOQ=
X-Gm-Gg: AYBFou1gon8vnKr+pe4TMFlmxR1UNtigKxCjwxli6G5RvFs4U/AUY3SJph/+MTwgT3l
	uWbi8ytyx8wINe9zbuSjzWrA5vx+3VA0MlljHOOTJnTMoNytjQJcayMUxw6XicM6JHrB72OnK3d
	pt9DgCJRXjHqcYstYw9wR3oR8Q5jcqQv9aj7yQS+Alxu/tW3C9xsL0viqEkYvKDssfQ42Ljk6Wf
	H4UxBv7ToLfi94AMjXIsglxzub6HUStxSg5hZANKWvxDsSE+hAdXhPhGvCh2ZZ+EeviXiQkFQp2
	6Byw7es3vmHca+bmTorVI0/qE9+vGQpFtLEx5cmKSrS2ehQ7P6ZF6TTUptyPMEg5TkzVCyByDb8
	77CKxS1WLvwPOwYThvYqqKduHjbQk7O9SQ65XY4ESHs4qDria8aUIlIRYY7w6GoZbNKRWooI=
X-Received: by 2002:a05:620a:a29b:10b0:93f:1a1a:2974 with SMTP id af79cd13be357-9442173715dmr1545380685a.6.1793615297366;
        Mon, 02 Nov 2026 02:28:17 -0800 (PST)
X-Received: by 2002:a05:620a:a29b:10b0:93f:1a1a:2974 with SMTP id af79cd13be357-9442173715dmr1545378385a.6.1793615296942;
        Mon, 02 Nov 2026 02:28:16 -0800 (PST)
Received: from [192.168.226.248] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4cabe10055sm368851566b.43.2026.11.02.02.28.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 02:28:16 -0800 (PST)
Message-ID: <8f91b302-8cbe-4bf6-9558-041ac10f4696@oss.qualcomm.com>
Date: Mon, 2 Nov 2026 11:28:13 +0100
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
Subject: Re: [PATCH 1/3] soc: qcom: smp2p: Fix use-after-free of irq domain on
 removal
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Andy Gross <agross@codeaurora.org>,
        Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>,
        Chris Lew <chris.lew@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Sashiko <sashiko-bot@kernel.org>, stable@vger.kernel.org
References: <20261101202404.156522-4-krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261101202404.156522-4-krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=TMDQ2Fla c=1 sm=1 tr=0 ts=6ae865c2 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=iPxsRg-7CK3qk8vLE2gA:9 a=QEXdDO2ut3YA:10 a=ZXulRonScM0A:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: A9xhBTYiTxHkH8iDqrVdGLRszJrJmHIM
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA0MSBTYWx0ZWRfXyjMoi4D9E01/
 43st5CHf9LzxQxS+Husws+UiiKgPt2weYBxqciXY5BbMi8nS4F0qUI4+Mqb1dhfKwtL4e/mlj/5
 UlNzINRbnnzoQIHzQuXYncEN0zJHp9I=
X-Proofpoint-ORIG-GUID: A9xhBTYiTxHkH8iDqrVdGLRszJrJmHIM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA0MSBTYWx0ZWRfX1pUyulzHpy4v
 9V53g644FKQTyv7reyBNA13sGno+P7YgF2k9T980rCC3pfRpUtBQJ90paicqBCqPQuR2POdKaKx
 mkJVC+4vJ7ugZULD5WkqcLmGNpZrWwvE/3YhYIzKYXzj4Uck8b9aE28c8egguiZ5Dxy9xAs19yH
 0ynQUS6NZwZ3tM01tNoGVxTO67IbCM92At4wePILECmwR8nxlmZTTGrgibfT3IkbPFs+nPtuDFz
 6gpW9d53/YmjYH2W9T3FFAWBQe9hgPcg4ZHTFkqqDjqxeLCW2DYC5+oU/NSMXACEBH4N1t61PF1
 Kev+Ep4+s1qvqJJv5AQN/JMLV9q0dyYeRFx2dp+CNi68jjcWJDdjA+krRj7WW2YigXTMh1sn3JS
 PzIvFXyCdm5KyRsf0SxuIqTxMTGxqekLl/WnUnbiGm8zB683dMDOBiR2f1XCiiojP6lsR/usQvP
 gOoXFkJU2a7m+teMR5A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 bulkscore=0 priorityscore=1501 adultscore=0
 phishscore=0 malwarescore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020041

On 11/1/26 9:24 PM, Krzysztof Kozlowski wrote:
> The SMP2P interrupt is requested with devm_request_threaded_irq(), so it
> is freed only after qcom_smp2p_remove() returns or, in the probe error
> path, after probe returns.   Both paths, however, explicitly remove the
> inbound irq domains, unregister outbound SMEM states and free the
> mailbox channel before that.

Sashiko flags an issue with this one

Konrad

