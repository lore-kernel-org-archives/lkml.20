Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05B4953ED15
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 12:53:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788958434; cv=none; b=C3CH68HvFsbiw1NkjqlbVe4w52erP+PTyUnBASEwvevtmyIKovwwaZwSRRmMr2ILdXm8h2LbuWnUmnlzq83xwEvykZu0fOrdliKu9JASXT90ipCUr0dETPDtZKb3DqIuMA0KuJk9ipNvDyT+DOyABRqHRNf7g6mNg0Ix4AyhovQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788958434; c=relaxed/simple;
	bh=5zvDAD8QwncMycAOR4YG74kEojERgTGkeiqlgwBM8rc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=J53UhbvvSbI1ok1RW43JXKo3eQss6U2liRoYXbHuQ0uQD9GRmxtUq/DAEeIBIK+NyZyo9vdplJB+mMUYGPdrqdoqhWa8TPFNfNaeVPS2iXE+SpwWP1qzOiPzefsav1TCuPGzCXynuESYDW7wAybE/OiEC99o9QrNKFDJahBGs5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ATrI4199; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GZYcppyL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ATrI4199";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GZYcppyL"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 689CAVYO1233148
	for <linux-kernel@vger.kernel.org>; Wed, 9 Sep 2026 12:53:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	t2auFWGyThip31RO0xFU8IteqpiwOHTvj4F02gD3M7s=; b=ATrI4199W3WUP9cW
	av350UPnDQ00C6XSNySCwcyEi7QoCi8gWE4U8Y+7BFk6n71KPhXTo7UJGFOztNud
	kTLEgOC4qOchS29JFopenQmBi2EfemnvpXdgRMckU7GiscKQg4CRXsav9hHjPDzT
	YNr7Xboil1aeb8MPSvVFO9/cBbstbrYFXr/piuJccVMmR+IAYPbejV9vo0/M/yl4
	rTd+aF8yMLk6CliwQapI4NJW7DUzV4tGAJn/WN98QKPVvkvAb+Qbg4Ptn7ANiNeg
	zD8A7qjbIhccaQ8aLa0KvVtnjvS0nYqt/GPgbIv8tTIusgm7aaVAiyi82U4NA4hT
	wNX7IA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gk77vg4gj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 12:53:51 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92e661ce1dcso74860185a.0
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 05:53:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788958430; x=1789563230; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=t2auFWGyThip31RO0xFU8IteqpiwOHTvj4F02gD3M7s=;
        b=GZYcppyLXPyUcirWewdMB/2vZGpv1bGY96pzVhLtY0eYpOp4/i88UPzYECwKR18/Sz
         C3/BXQRPcfYKet6FN97OKVTYxCxqsY8tcYprV0sUNTffw+0VlerOfHeN9B8I5VGAq/b8
         OvQKxqZOfvkHyvsHnR7V4qcM2HYZatMNIPmXy6QDRFqjfgZlZ63+nmVKLqrEwtVm+6xW
         Mg74qfpukOFxokpVXfE0aYi6eiPrwJQBXUHYqreuyAVilMm+eaUwwQWmb8OG2DjJzxxm
         aFbeevJTJSilrTpOMjMKvBz29GiE8xwn22YETr70pYFVv/sCviOYcDjpUkB6s+i8f7t/
         psmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788958430; x=1789563230;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=t2auFWGyThip31RO0xFU8IteqpiwOHTvj4F02gD3M7s=;
        b=Yk0Ks/Lrb0DJ1ZfaSB1isLflwX3z45lowD6incKPeW/2uhMHXUo1UrX96Y8GygdeG7
         O2EJANJkPEPSgPHj5srfHqCFP5sNaeJPO/+gj8ixrZ7wxc3LPi0Pw1m7LO6fpfUjI54y
         vYAK0rIO9/QGL2wPdAXLY8U7S6+gwMcCkKm9ogu4rTHhz8BqHVsZEdgWERAj0N1adT/v
         45xSkBL7ezNm9/D5gK9tnPTvx28HydaE03FRmGt9AcyYFAXen8Igbu8e49XZml85sN/3
         Y88qCL2awxXCUe6hT9WU9155mLRrDe4aBILG3i35S0rhdxsXRZF7m94BQye4zDlrmqlv
         y60A==
X-Forwarded-Encrypted: i=1; AKwUvBxKOAM8pzEdr2AHfYwUQxKoDsaaCuBqL0HFLvWZINoqq1hMnwevPOqysxk6SwEetCVh+y3ArIprvnz/k+k=@vger.kernel.org
X-Gm-Message-State: AFuF++kgEkodq02cCPZ2UU6G8EIoGeHesHkxnt1iLDedQdyJBempA6h/
	QNONoZdvtNNdgW56dUtQgF9l1bqgOkl1fCHSWSGr5sboxHVsmive/iQkp9TCXWCceoeQL60Irgg
	apEtdELYyeu6xwLLrV+cxl9K88hxH2BUgNGCJRGvr4TdxnmgtndB3hPBn0dD6FMdbDLNyJSWyPe
	Y=
X-Gm-Gg: AYBFou1RT/Otb59wZllGf1IF+FDves81WI/956Qj5ONa+7PLFePejsgpSsTDLvxYvvw
	x+FCFRcwXGjsXzctPyxtSq2zYg4wXxSRb9YVMvGkMLZCu/1Pq8MjsrMsY0F0lz2cohj9KCRIZWS
	yP7cE16MKcMFEiOpAQePmvW05e0E/hLU01OVpIravX1Pz+jVJJrhw5GnN0Y1k3n8WznOrnHhktY
	pZkuYX8oBo9IznVdSlA1ZKlZZAS4odH7nQIJB489k+lHuUULQysSZ/82pArWnygu7IRt5V62OPr
	UUSmlAyJFRuUtJXagkts4/gZvXoQYp8MnDPYdeaHo8FpgyPRv++P1k7aFLJsUkxOtbhr1NPy4wQ
	i1EY45+f3nHl0/IuOt1mw+g==
X-Received: by 2002:a05:620a:8086:b0:939:b0cd:2c3c with SMTP id af79cd13be357-939b0cd2d81mr1456660585a.3.1788958430292;
        Wed, 09 Sep 2026 05:53:50 -0700 (PDT)
X-Received: by 2002:a05:620a:8086:b0:939:b0cd:2c3c with SMTP id af79cd13be357-939b0cd2d81mr1456654885a.3.1788958429723;
        Wed, 09 Sep 2026 05:53:49 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c260d5cdf7asm788860766b.58.2026.09.09.05.53.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Sep 2026 05:53:48 -0700 (PDT)
Message-ID: <e4615794-843b-4351-9a1c-c69da5d36044@oss.qualcomm.com>
Date: Wed, 9 Sep 2026 14:53:46 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] arm64: dts: qcom: sc8280xp: Mark FastRPC context banks
 as dma-coherent
To: Xilin Wu <sophon@radxa.com>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260909-sc8280xp-fastrpc-dma-coherent-v3-1-d38184e8cf9d@radxa.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260909-sc8280xp-fastrpc-dma-coherent-v3-1-d38184e8cf9d@radxa.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=GKk41ONK c=1 sm=1 tr=0 ts=6aa156df cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=ksxQWNrZAAAA:8 a=EUspDBNiAAAA:8 a=bns6x2SeDOD8hvPZ-0UA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=l7WU34MJF0Z5EO9KEJC3:22
X-Proofpoint-ORIG-GUID: hUiCzNaXix3ZPoHJNFh9QMqvDf3mb55-
X-Proofpoint-GUID: hUiCzNaXix3ZPoHJNFh9QMqvDf3mb55-
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDE0NCBTYWx0ZWRfX8gWRAvK6TCP6
 LsH0DkQ1HjHAq82F0AJAe15NgszhmqoweWb5TXe6L+CXFz+4AofSyQIvgVMJyQsT11Emc0cd/7E
 pogrCq7mu1vONKiBnqREgOmdNm9tBgM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDE0NCBTYWx0ZWRfX5QvyYaLMZcHx
 TSGMfRB/zsiKMtFxyborrWJngFzAWp8x48bZXs8LJC7ZPh5KBZd928oZwK4aZ2GW5MmO5RFCq5R
 TSQZzGxrLrlf2kW5twgh557cMH8RadC3hqvmD4X2WeUW6T+7rbWcYncABjXZqZJnMGGsdqRUORM
 2Rl2SrdAw96QpjUmfzlMbUrSYdUh89DruiQ12pAWNrJw+r8L/Dg0hKAfpoMrQ6c8VuN9un38aRn
 ameFwjixD7WOe6IctHPrP46s5glXCZ5g0xwE6A7/8n/uubIHrrNdJQRyiMLHRGqSSgJCXMgCA2A
 lKjtTtOluPUgQo7UWEpm/v9kHFdm7XzTJam4vqm0LyQkuOIY3emroTr+2aHKhiQ2wNDL5by0QxL
 B93dtDYdtRobkof1lGhnsYC7h321/k51Z9xlXo+yr5ZxjKz4CGnK6bUitEX5eGgbXzJihIoAmEa
 PeWNTmXDh2YOWaUhOiQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 bulkscore=0 spamscore=0 clxscore=1015
 suspectscore=0 phishscore=0 priorityscore=1501 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609090144

On 9/9/26 10:08 AM, Xilin Wu wrote:
> The FastRPC context banks are DMA-coherent on SC8280XP. Describe this in
> the device tree so that the DMA API uses the appropriate coherency
> attributes for their mappings.
> 
> When FastRPC allocates shared buffers from the system DMA heap, the
> missing property can cause intermittent failures while loading DSP
> libraries. Both fastrpc_test and the QAIRT platform validator can fail
> with DSP loader errors such as "mmap hdrs failed" and "bad address".
> 
> Mark the ADSP, CDSP and SLPI FastRPC context banks as dma-coherent to fix
> these failures and allow QAIRT applications to run on the CDSP. It also
> matches the behavior of the Windows driver.
> 
> Signed-off-by: Xilin Wu <sophon@radxa.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
