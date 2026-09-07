Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73D243E49FE
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 07:28:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788766110; cv=none; b=X85Sf1xfeDq8QLWVb1rSm/fOvYzM/QN7FCh2ghr7EGUrzSESP4tO5/wLLB2tBWTNBqj5eJxSMAJ2CPpsX069aMnSmA8XDC60TviONZM+jM2Xw+ZMN087b2o/aW8FsVSzRczVWT0nTauqmBja3zU3ATb8RoMQ2uYnSRPXsAmpc7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788766110; c=relaxed/simple;
	bh=Nvkt7wX2n7M59sy4Jon/gvKKGnV+tkjUblreaxER35M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sDIAeSscaYDz59slIcsutsROiitWWc3g7UCJ3DpJnNK/KDNGgq7XLCctpsdog0eW0HbPEZS59tiPoHqPRgPVi9YUB/tn2j2w5AYps83jlF2uLBgDx0OqQHOM9gaUYks0n7SjndSkKe7bnTaipPLECz6/7emBUPJhJAoiRxIiPN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=p48mtdRc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eGN3R4qw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="p48mtdRc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eGN3R4qw"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68777Yqb2724190
	for <linux-kernel@vger.kernel.org>; Mon, 7 Sep 2026 07:28:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	K+wc09jClfRYyUGuhuMvo81/24b72YLfwMnqQxekFvM=; b=p48mtdRc2ckbvtAL
	ATMa2LOhlZenBDjStRC8VqiiYG5mLjBrfUvicycNodiT853Trv/rVp3ro4X4UjOI
	fvq69SbRN8Rq4mfqGftgYa5zsAFbKygQsTp43iw00njkiIhuCGW4kofL7Fnoe23Q
	HXboPuoVuP+9FjkZrdR5IZtrLM3yCWfJpz4+/7o3qB6OTC7wlog3c1s7eNtlD2Tg
	yKO0oge+8vgetcf4+b0l6+KBpxQsG5dOkPC9DDLi5Xxl1OdZZaGKwx/h+1cy3W3v
	/tXlzRrWcXycw/Nvs4wLTUr2yF+fmt2dVFbvxe8FFn2V7dV7xaj0B0fCerzckxvA
	YuO9QA==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghfxksfar-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 07:28:28 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-91045c83dbaso8176916d6.1
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 00:28:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788766108; x=1789370908; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=K+wc09jClfRYyUGuhuMvo81/24b72YLfwMnqQxekFvM=;
        b=eGN3R4qwsqJZnpVSjxkLQAntK9eY712xFj06aXeQEV3m//PyJJ8EwlQuXyHvRb1nL9
         BpCGhASZKLiW06LQX/sc1rmKHrdaEqWEBZ3fBbiGEOr0Uf0kWGy+y+XNVhtHLcaaHKT4
         k7hHyPt6kvtRUJBINVwOyqiS6JmZq6luWe36WLMh0Lj5m9vTUXzJekND2c5G71bqXNjr
         8N3y8k6deOu7r52HC7QvgHz6ZBna8sBeFjmBoQgNSlNjiquHhA9vNWlo8p0FUXvpUtvQ
         LyVtkbgRoXZZUoeWhjmYaX2KWOnifJAGA86WqZs2CVWIB+26EZOmXmL2RdpDz3yy048c
         qcWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788766108; x=1789370908;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=K+wc09jClfRYyUGuhuMvo81/24b72YLfwMnqQxekFvM=;
        b=LQPeaXIZoNfE3hXBvpdS8KzQQMpfCmbl+jWYANX3QKc0XCzmJKcU56Yx5e25FOTZbn
         bcKne9v+EvG6qbcCe3P8Kk1T73gzI/g7e5dpAJiQUX5UMAHvuUNV8w+AGK/KEeWegoBu
         UolLEDzzPpaKHU2KFhRIO9+F4ATzjABEB14N8dPogU5uSEqPkyhMcbHDaAdhT9BiOOv9
         3JoNvDzXXAfM+Ka3sFDVTFzQ1iXLaB+jC+vCqp+FEH0y8DmX3y4FIE3BgbEWHeq3gyth
         sa0b5MqbAO4tmg/9a3sg9yz3hi1FMA7idKJraTfu/PQZVOjQ0Jy2cltqQE1bNbyMeDmm
         yndA==
X-Forwarded-Encrypted: i=1; AKwUvByNNhwEG79K//8Mz23KPbDd1yha9YgGcrTl1xQXDLfnhw/wbehW3RAw2ewpcoji7UXx5br8f8JgmrxKvkA=@vger.kernel.org
X-Gm-Message-State: AFuF++npKIuKeUn7XISmE0q7uRo/YymlgKaZtXXlLcZ8tUub3WFK8l5G
	18hw/4IGqhKtuCdrbmtQva0TwDwBxUc7f1Bx5bSZW9ro7SvMUev4BOa1t3VD26FDXth5r34Jj5E
	ORyyrkfRPFzgti66cn3PKcml/0LL8ogw4wm3PZfB2c9N2fPkBTXH63F02sG5zwxHBpGM=
X-Gm-Gg: AYBFou04dZW7QQk3jwvga8k5WZ5ak/L8ukSnLo2+zEclchyU1lx+RXr+heq8cEskgiD
	Dg0PTIbnzK26vA3PM59GLA8SmreXOJmfFg9PYp00P1nuj83kteH5rdpClrbS8f6p2qdWESoeKC7
	EQ69ctKIhMm1m8QeRgD+h+ItPuQxRyVRo1He87TRDjSk5kNZGfEtvpLkw5HrWkL+zsoLEUvHunU
	U+tWmewPaMVGnT3G5p5mYuNlWgwivPVs6V5fc8u66CD+BALZ+l+oqFUzB9iUhr+13/krln99Can
	ADDss8VNl32qlAjPeJLLZOg/ZoBRV3nOSvasEB1KMYw+rAJhYatOV9cXJA1CYHeDUW56jIyRVzc
	W1ZdksLVyx2FTTFNTbyASjA==
X-Received: by 2002:a05:620a:8086:b0:939:b0cd:2c3c with SMTP id af79cd13be357-939b0cd2d81mr111502985a.3.1788766107716;
        Mon, 07 Sep 2026 00:28:27 -0700 (PDT)
X-Received: by 2002:a05:620a:8086:b0:939:b0cd:2c3c with SMTP id af79cd13be357-939b0cd2d81mr111500585a.3.1788766106990;
        Mon, 07 Sep 2026 00:28:26 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c260d55b306sm432124566b.36.2026.09.07.00.28.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Sep 2026 00:28:26 -0700 (PDT)
Message-ID: <c23ee6e9-6286-40a2-a504-1750f5baf078@oss.qualcomm.com>
Date: Mon, 7 Sep 2026 09:28:24 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] soc: qcom: fix typo "upto" in comment
To: Hemanth Selam <hemanth.selam@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260907061742.10954-1-hemanth.selam@gmail.com>
 <20260907061742.10954-3-hemanth.selam@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260907061742.10954-3-hemanth.selam@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDA3OSBTYWx0ZWRfX354oMedu4lO0
 I1RiY7+nFDzCaBAGf3pVwfZbZLnFf+njos5/QnTXqyml9ZviAsVoRoR/JAQlMVvqoVzsBxG3uIv
 LblTPF8mHcZUd9fRX8N2zAJEdL7RVfIuHmLN/F8Htd7YmujHjouTT0pRKShWt1J6oV3IuemGUdX
 og34bikaGlcqqhP9ApYOl+yIdfq+vE3gBGVC17M5zDg2NqOLOB+G3ew7eKa9w9ojQ96IfdlV5mq
 vC91V/FiVOV89Ft5V4RJY0Zcyckn/Bk0B8am1VOeaMzZBoE80Wz4SwjMojxPlq3MF9oWv8eAVat
 8txamdGi2joEFGDu64/4+laGexxOYPDM0b0UmYpXF5qUhHzPsLMxf+CvFuZ9d8Ll87kFrwX39pB
 Wjol4Z0Xwu+K/Rd0z2vmPl3QqsDdZRC01xs8zmXOEF+33Ub7FfgIGEEAHU0JzeACZvjoX2btrt/
 98Dok+k0zvUrRHk0Jag==
X-Proofpoint-GUID: MGsIF-Kb-UWk0NLUPq1K09RaLnSd4aGp
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDA3OSBTYWx0ZWRfX//F9clgoK4mB
 nMbgRTxNRpCbhvrjb8zGYEMsTjyOifDNtA0ICi9rh4P9Yhu/G+alu1K07Wl8ZygGlzRvTP3LORi
 mXsvmPzYNZqlUbjBhRgmlSPbMYNxSjI=
X-Authority-Analysis: v=2.4 cv=daOwG3Xe c=1 sm=1 tr=0 ts=6a9e679c cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=wbSmXUBKm7kmP3h1SjcA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-ORIG-GUID: MGsIF-Kb-UWk0NLUPq1K09RaLnSd4aGp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_02,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 bulkscore=0 spamscore=0 phishscore=0
 lowpriorityscore=0 adultscore=0 malwarescore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609070079

On 9/7/26 8:17 AM, Hemanth Selam wrote:
> Correct "upto" to "up to", reported by scripts/checkpatch.pl using the
> misspelling list in scripts/spelling.txt.  Only touches comments, no code
> changes.
> 
> Assisted-by: Cursor:claude-opus-5
> Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
