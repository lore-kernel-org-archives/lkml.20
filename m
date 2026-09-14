Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30D8443BDD6
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 10:46:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789382802; cv=none; b=P6aTHWwS/+PRlPiZaZdrY2Mso715eCw6L7dtSSF3x5gp7LvjLNr+ZpQlZsC6Vnn00aGCM4CrXsoTFUB1EXzXHz9gHcY2mH/fI1xDwMLmlNoo4iJ0wurm7fX0o8n5e2UZTQKEr2Kh8cogpa0pKc0dHItZ2JIK/tLP7KmiNjTwLFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789382802; c=relaxed/simple;
	bh=EM5ubO1aixQb+FUZWi1Wp/YH8k8mBG61YahscZCrD1o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZEUXnSD+nLe5z9AeoK22QXo/XWBsWw99BGSPflmyvLjOs6uiYXrely4AUmskV5MYZAKTVqr3q1riHBKGiSp3bQT3copWAZKuqKMD/ZCCTTT88OUnG6vEOiMYRjs/N/BZqV1bqX07C+kqMWdVVfvEl88y/q8aWDTKaI2yefHtE9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dqyy4xTY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KYNyx07i; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dqyy4xTY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KYNyx07i"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68EA4GAT3938304
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 10:46:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nmRbbTFhta754R5/nqUbl89Ko2/yhTJcGsYbJIvf918=; b=dqyy4xTYt7/StkEq
	cuyn+618/x7cTTo39noc2AaVAAmX/iD8ye0YpgRE6RbtvcmgdwkA7VBeUUwSYTK1
	F0DeCWPuvJY1Y5Stpl1coMdOcPByMlgi6EDshrbOeYoWgwQ8a9mq9BDyPFMRnUqE
	asrNgOCueDyroZy4rfoCSKMCaxYoAMGSrtowV/T5erTuBzIlAqfVzPQywG1NrSh2
	1qSiywfO8OYInpRR5knspl5/1+GVF6h0N1QIaEabTOn68QnJ/KISDjG4vaOMc4Nx
	B4efhev3rzXfs3/JhmgGhOnL4pXg0YF0F4PeFP4kBRHIb0G7LmBgnWEQaRSOhWBr
	TM517w==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpeuq841y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 10:46:32 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-939f4002c1aso38296685a.1
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 03:46:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789382673; x=1789987473; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nmRbbTFhta754R5/nqUbl89Ko2/yhTJcGsYbJIvf918=;
        b=KYNyx07ipdhVhqHEWiqR8CLQgdPKLwv+oEuDwk6nYbWh0BsTm5DqpHi4YH21rZCzSf
         c2MEBLH0C/quS/Qml+/uT9iZmj0EPZmPkl7kgDfPpzg26ilh5oXaISDLTGEit9h+6O0t
         EqWUYbeDZveKDacMDLccGlSRVHB7o4jfZW5M0JGqBbn0qpGagTl1Un8F5tCy2LUSnyvA
         l34Tm0GbEJUrheERO5zt+CiiJDxSuluPMb6oC018NwuNjrgLsVJjV5UnrfxeBL1F76Dh
         6tGV6gLdN8V4zm2i+ECTch4Zy8T+TBZpd1Dh5iSk00320IF0Sn/Rc6Y7Fj7z69m2K1sM
         zF5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789382673; x=1789987473;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nmRbbTFhta754R5/nqUbl89Ko2/yhTJcGsYbJIvf918=;
        b=KSwwyPW8QXhWLQAk+ba261GvuR6lPIddc6b3d+2CuPXSUL8Uu2FPvw9VIHkGDHsHbR
         1skF/9bBYobO0tCWKncWqYREiX42jWp775OfyGf12tHDINo4UsokEIJ2Z4AVSinGn3VV
         TKea5iP8N/z318T3L/K+KFej2Y3KtBeK4lAKRWlLnDRBahnvIABeoTpm89EPwc8pidt3
         p5D1kBXXpbOGbaM1P1Gn41LIRTcL1IruwtU8RivT+1dKZKDHa17GSEYuuNlDJjm7/hls
         kvW+VxOOC8Lnjv868ZNK+2opdNNWXkMiQ9RP5aBX2G3l1tNCkx2aEQM///2v8iRwgICx
         BUUw==
X-Forwarded-Encrypted: i=1; AKwUvByRSNKNN+KRZ6qRvJzUVbRwYwyFRjzTo5CeSmUQUBuLhTX2Gn+qFr1kaJJaAwZMp4ugUu2nEmPg8BRw80s=@vger.kernel.org
X-Gm-Message-State: AFuF++kceRD/xuZ77MUuJB8fgb3BQ0OeRnhqkFkn4Kkvt07gz65hrreW
	2xqEwHAlftfz+/4aZOwGpHsx9EG1Nd8xJ+eJA6DtxQvJoYoJ382lwLiUw9yscQLVq6m4KBaeG1W
	jfIuOIMxG4D2+cYOxRjxHLQn2Jv6YMrSgd34cfPug0mWnLB/+ACrDoQ3HbXeW34e2IvE=
X-Gm-Gg: AYBFou238OW+0bK2bNqE76I63x2m7pjXhz8noZsI/LqrGqdv6AI3zeb3spKy1Miij5j
	4gcfXeN9W/nhS3ksjtcFVHPRJEMZOJwN4HumvQXF0lPKz9zG0Vj5JP3UK1NDYdB6cwBt3RhBfgy
	Xzb4E0BGu/523120N4co1xyPFgGhqBBd4RNOzD4LVtchBipPKrXCoFhGeiODMKRGbHheuFx2TVA
	cnNZaxdxBl1+/IjzSbWrdgJNLAd/DYNapRwtjTyaRwIlMM8wVNQYEmj5X74yrtL+jLDDQ3fWLB5
	1VH2Ux6KkunBtsOlLm/IkPX1g1OtLBqZBhlapBcwfwZtHVIrVcFEDMRfNLOZR4byUv1Mx8Fw2Fi
	iLqZvwtEbgEWsFo7q8VPW1Q==
X-Received: by 2002:a05:620a:3704:b0:939:9ef4:79eb with SMTP id af79cd13be357-93a29d48104mr211107585a.6.1789382673264;
        Mon, 14 Sep 2026 03:44:33 -0700 (PDT)
X-Received: by 2002:a05:620a:3704:b0:939:9ef4:79eb with SMTP id af79cd13be357-93a29d48104mr211102985a.6.1789382672631;
        Mon, 14 Sep 2026 03:44:32 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a9ba8f3ab9sm3782485a12.15.2026.09.14.03.44.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2026 03:44:31 -0700 (PDT)
Message-ID: <0503b151-dc60-479d-8e31-4c2d75f4d639@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 12:44:29 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] arm64: dts: qcom: nord-rrd: Enable PCIe controllers
 and PHY
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Yu Zhang <yu.zhang@oss.qualcomm.com>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260914071944.164217-1-shengchao.guo@oss.qualcomm.com>
 <20260914071944.164217-3-shengchao.guo@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260914071944.164217-3-shengchao.guo@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDE1NCBTYWx0ZWRfX28oN0LTBjCdX
 8BJQ8Yj/s8f5iUOeD5lDK5q/sapNTiUh/SKgj0pe+rGB8kiu/bRiU+U+FcjbwisSMwHO92KIyPf
 jKBEJ2qb/EACLQv5jo4ZC0ohb6uquflqCNqtPakCEOxo6Zcd972/lXSg6Q8GHKToHvlwBZsuSlv
 k8Utg7QNnQNzziPOiS2ngD14j5HN/aqjcTWJrEGixlYi4RHZcdf/ZNA9Y2/TVnGg2h0NDwhIoxO
 /Vh+TlpY0jeqZaQX7BxUCFQZslJSeDXtN3v1aChxiAXLQFKV0hOxEaGjZ7lPj0GhGFq0Nmrh6Um
 sZyK6icRQQk5ovAVdlbnEW8sphwoCi02S1i/3zO4LXAD76d9HlIjRRtnIXLY9PUykhj1qmHpmrt
 ZrGn0Yc0Utn4BHl5nvSEwOWHUxj+5ZGXFzF+5v+v98Ox4oerchP238R5LWDGJZhD9/bFe2z9RID
 DQXoe/accX/QVImYDKg==
X-Authority-Analysis: v=2.4 cv=TrFzFzXh c=1 sm=1 tr=0 ts=6aa7d088 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=MrLAvLjqEOgBX2ddU8YA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: me6aeX7aK1ZTmU2R4n3gpJ8npCmDvu0r
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDE1NCBTYWx0ZWRfX3+5UrO387h22
 PG+VlJiDUPSvQ/CWK8Mq12yClp+7YwfjFuEJAX4qMT0nsrVuyTGFz20qZqp8+EPRaFd+eYV2v79
 wqUentiObta1gteJYy3dvBMbmWE6mf4=
X-Proofpoint-GUID: me6aeX7aK1ZTmU2R4n3gpJ8npCmDvu0r
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 clxscore=1015 suspectscore=0 impostorscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140154

On 9/14/26 9:19 AM, Shawn Guo wrote:
> From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> 
> The Nord Robotics Reference Design board routes all four PCIe links, so
> enable pcie0-pcie3 and the QMP PHY, supply the per-port PHY and PLL
> rails, and describe the PERST# and WAKE# lines of each root port.
> 
> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
