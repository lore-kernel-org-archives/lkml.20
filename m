Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 646723F7AAC
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 08:40:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792399222; cv=none; b=X90/TwOJNVJLg501XK9+cTDuoogxaZXGzcjxypYoegJb+OwL4sVes42/kpI1/J+igv8Pq+57PWo3dG84k+WVYmyVILDPm249iyRprd8uTagC7qosWayC0xTlpCMbVyDsaU2TDUPgsA3fahdrnmutzlBrTDI1ZcJhWIELHWLhuBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792399222; c=relaxed/simple;
	bh=lYx+T5XD5OlAFVs0jRZnw5rf3XVTMCq2oMgVO1ApDPg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AYTPV5lPYLizcC3XZ3c3cFVLLPOLETx3pJ8rv+okAg0EU7RV34PvbBuf+g73jaaAQQHjod3nUCgpqtg+avMjzsQ+2vodUink7Q68eBtYNZClt5VVb92248U+5QaaRZjLDvIfUYTuEUghIbA4FVhY3sK5tKPqS4VVGemzC2UaZMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UJjS4BwW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GQhoHtWh; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UJjS4BwW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GQhoHtWh"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69J8PEew2193438
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 08:40:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dLtFNo4cmirM2AMHrCIrwzllhvPjkaOAAbJ5Xt+0THU=; b=UJjS4BwWQKtZ+ZZT
	zdrItEsdxC/jfZLzBc9+oFOCXyfwLizJtrE1JGaNvFTqfQRxmSsoh3UDNH88WFnj
	r8ZFM95rjK64UKH7faMdbzHzpAqm8Hfbo0H+K0l179MLPmyninAZB6CJF4Ln5INB
	uZFQJofedTmTeRENhLiAsXBP/FF9c7GMu388L9tH7vvYOH9eoShALfEi3UQxUyyr
	6smWCddjm3o+1rvbRv9UqwBwC0Nw+0xHBzShdE4i17TlxG4+bboPy0SbO/06Ba2r
	VnGveTpW2VbOw45IlmZYSG/1ZdxyoZrlXNjQLItsQsRESqOCSVfTIuR1VT0hYteY
	SfZQIA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hd5w19udk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 08:40:20 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92eebb130dcso48003585a.1
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 01:40:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792399219; x=1793004019; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dLtFNo4cmirM2AMHrCIrwzllhvPjkaOAAbJ5Xt+0THU=;
        b=GQhoHtWhJyFrWQ7zByNUcr4/R8S+GxPXgVIgCMdXBvUX+CCSNC+AczVgYTx0MlTog0
         SDD1SI+0KLu6PPFeRoNH4VWMbmu73thJDOeareVCyV8xqvCyaWuCj8WwLm3RGDWzCWQk
         YwRyEOHA8Ku08kekbg+GQXDZW4Ee480FJB9y2T1kC3eewPXWp1LTmp8hwM2nQIQwyDlO
         8ldnVKZBI3jtFwg/DxY8MMV1nBOyRAj5ZiRLU72yyIiDU5x2Ty0QD+6zursC5zsHUReH
         tnwnxzwzDPM7YQ0Cr13h+n7ORi1QvSi3HBldRiRtDI3RqCJHC/GISMDB29I4udUf68WT
         RAIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792399219; x=1793004019;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dLtFNo4cmirM2AMHrCIrwzllhvPjkaOAAbJ5Xt+0THU=;
        b=v2kn5muhb6zQ/K4+zuBuupyxiHPqngQ07UdWxE3t2faSfaO0fhBun4HHrxHiyOtlmw
         SO5FYjQzgHn4kdXd21BMCx9DYn9faUTvfFC6FRGmvNjqV8UQxQXW4loNl1rBxDSmFcFL
         tUkDnFI4LWnqbe4DBCu9RLSMyBjg2y/6GMeZJQA2luBZ6VesFAcLuds9XxfTjU5FTgf1
         /bbVgiPSSGxow+RY6UVk4j+0iRA+i/PFsSXpSN/pcF2FyDthblAGNgm8n1FlwIPeOH8N
         mOthK6X7cHomOxa6HEfaItcCZNukx5RIWSKHSPYMj+Ek+7wBnAd0L5v3tnwue6cntsyC
         U7ug==
X-Forwarded-Encrypted: i=1; AKwUvBwUPVAUDjzeA6aoTpAKEomPtL3jYCd4IajdEiTYbDLrljo3osKyZqJANoK2rrHMssn/XCFfc8SgkdEqL0A=@vger.kernel.org
X-Gm-Message-State: AFq9FYIqMnn20sOqis70kVvF/uIU+uzkWAVXFdlBfSLuWDjcZ02+nClq
	DRdjyARkqPaITacl6vob3O/XyxVmmiDIEoQYYk9WOLuKKBZZI7tXqIIcK/1Pd3DHusH6YcBO0EL
	lGvUIHzJGV0D2s7ZDc1Sxkf+HNeWJL+BcY7trT++7zVH8bDK0u2GwJbNcLqQXqq6ZooU=
X-Gm-Gg: AYBFou3SObLXQMITFbruOZAcfCTF/K18hJ0bzPavPZ+e+toY/kdrYl5fLUuX2fm2gT0
	QmpRYiXXEtLhWyIeEYvb4xTKdgO53Lmtfz28rq/prNr11HSscy5dQAdqml4KXHmze4ElFaPZKbK
	UGREntFZQ64/z+spSzipolJZ6/lAMIpkGTfwvUDpCwVnysyk/B70WT34eTRZXv4cZTZXxgPdoZm
	oqrDmkvYTI2aGvGaUf/4zKhUaTRR+oG0W10gMpB88Vb/HspgXUb2GTRHhMnhUjJYor6Yslx9vvm
	mJdIGHvq8H/bkOViGUoZcECGeRI3R4vUWdVjZvW9iM0+8tpbE3sMrjJTbQEJVTJSEhFQLAhm8rL
	++CZVrKiiA3KGJYJe6Fp+Kw==
X-Received: by 2002:a05:620a:a99a:20b0:93f:43a4:a48f with SMTP id af79cd13be357-93f43a4a566mr73832485a.5.1792399219383;
        Mon, 19 Oct 2026 01:40:19 -0700 (PDT)
X-Received: by 2002:a05:620a:a99a:20b0:93f:43a4:a48f with SMTP id af79cd13be357-93f43a4a566mr73829985a.5.1792399218887;
        Mon, 19 Oct 2026 01:40:18 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b38a1eb8dbsm3515694a12.37.2026.10.19.01.40.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 01:40:18 -0700 (PDT)
Message-ID: <73ab680a-ad47-4270-a7e9-48df70e86fed@oss.qualcomm.com>
Date: Mon, 19 Oct 2026 10:40:15 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] soc: qcom: icc-bwmon: drop the bandwidth vote across
 system suspend
To: =?UTF-8?B?UmFtw7NuIEplc8O6cyBNaXJhbmRh?= <ramonjesusmiranda@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261018155424.1299645-1-ramonjesusmiranda@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261018155424.1299645-1-ramonjesusmiranda@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDAzNCBTYWx0ZWRfXyzSM0BkrfyJB
 CZep5vVbzb7x+iKgn3SvfB27aldG9RrN1BtOmI/IXI8hhKNzmRSudpyqR65BqpcWl1ADG0BuRWM
 IHW5HOAWIrg50o0W6AwNEFSkbRYBLhE=
X-Authority-Analysis: v=2.4 cv=KuPYSmWN c=1 sm=1 tr=0 ts=6ad5d774 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=Y7Fq6njcUQsdDXMDV7gA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=ZXulRonScM0A:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDAzNCBTYWx0ZWRfXzZrcVdSuG2qI
 sSJy9N1qzunV4r8AROmFNdGbv5ktAwCmZXVHthpO4zIr4sbQ21aZnjw7uXn9uH60Kax+WCEdO6Q
 AgG9p+2EShFjNp6XtvqUUMM4iTqOYcTSHR0Bsh89TAtvR3cPxKXGzOBwYmUh/u+81VkA8MvpVe7
 D6I6EFyKou1rgAK08RzFVykd6vsrBnzLxzFXb6nLTb5YgYaFhW9gYhy0pzpH83aVhVg6hOdicDu
 Zdw/RIaoMNgx0HLIY2BaGCn/oIiPxbS2DOjzVFhjxX03jJtYyAFeM7jzCRLFLFGjVn1r17OWASX
 CPi62CJ2bLeI3h+ReT3PHMdPu5u50cOkI4YLW3F/iu+nHM2HJqxlAyMcsweTp2sk4mpzKvOVqhX
 M/Ew4J2LHeOlUumkpWDNwVh14b9wmTVYEPl5ne61sByWNxX/QN8UoR05sT1w8tyMoFjRl7JE9Yh
 Dj4czpq7uyA/VX1SdYg==
X-Proofpoint-ORIG-GUID: YTYNgJUpfJLgEff5CzF1AUaQwIOKK164
X-Proofpoint-GUID: YTYNgJUpfJLgEff5CzF1AUaQwIOKK164
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_03,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 spamscore=0 clxscore=1015 lowpriorityscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610190034

On 10/18/26 5:54 PM, Ramón Jesús Miranda wrote:
> icc-bwmon has no PM ops: the interconnect vote derived from the last
> sample stays in place while the system is suspended. On X1E80100 the CPU
> bwmon was left voting 800 MB/s peak on the DDR path during s2idle, which
> keeps DDR out of its low power modes (the qcom_stats "ddr" counter never
> advances).
> 
> Disable the monitor, drop the OPP vote on suspend and restart monitoring
> on resume. With this change DDR reaches its low power mode for >99% of
> s2idle on a Microsoft Surface Pro 11 (X1E80100).

Have you done a negative test (does reverting this patch alone break
ddr collapse for you)? The DT uses ACTIVE_ONLY icc votes for BWMON,
so as the CPU subsystem goes to sleep, these votes are removed in
hardware.

Konrad
