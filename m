Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 898A348C405
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 13:58:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790171929; cv=none; b=SHV7napTrDm166RSl20P6no43AmYgOZu4qGQt0oDMjCSgu85v2OZ33rNqOZghNbBxaZI0jVX4RRvbWqrJssd7OyQnDXLIZ6DY4gKFU1a8YhpsGjQBUSl7LBm6N/lFLVv9CivOi4BEyeefaO7PTJ0bQCuuRRUMV1Eplmkd24dtOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790171929; c=relaxed/simple;
	bh=SSCOyeMGLoOi+frBpnh8Vq0F+zpfep7qYBdfGyuENUc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=elrjAWCTDcYYK/JX89mqMPZLXGa5flcMHYrn1LzrO9de+gyL+RiloNSBcvw41pmY96uZ1wJoXZcB3pKFGB37YVu0Cj1YtWNDiLIhAhKKBYMg0eTc7Zup/mEr5Oteuuwr2wMpltzeDaRcnDw3M50AwLhXJwndteLyN+FgwzhRyxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MaNio6zN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PejYQVIV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MaNio6zN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PejYQVIV"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68NBbU1M2637894
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 13:58:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EjrfaPylqXAOJPnSJUAjYtmXRTNzd/AuKuG3cCOn7Ao=; b=MaNio6zN3QLvS1Kh
	E0ztlOMWJSAvt7EnoifaVcNpgc1bLltYMMhXEbHf9rRis24fsupzTTvx49NgcNxs
	HhLiXUdjtj1NdpEmGv2paYyeEFT444XW2tqCKczA3tLVrUnK514zOAI2VTPoaVQw
	Jl1F18Tz9o4R4Q8c0+JGdHNMUPB2nt1F5y2PV8li2/4/I4Fle+7tnwR/HGdSpFlr
	/l/8jF+/d4V94KVRM8iVUh4ct0ryEru7sphNxA4bfSr5akLxCC5oCLUxkeYMSMMh
	lOZ3NSWCVbBjBOQBygeiTvA7WiVpTfmcKq2Jjl3g4mg0PFhc3PtsN2Ril4xgb2tv
	hfBAww==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gv9bqhwat-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 13:58:47 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-97cace0be95so52312241.1
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 06:58:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790171926; x=1790776726; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EjrfaPylqXAOJPnSJUAjYtmXRTNzd/AuKuG3cCOn7Ao=;
        b=PejYQVIVmorpTte6PLJzpb4VT6vKNdwO8/TiO27Vk5OS/SZD6O9juylk2yUL+2cV55
         HpC3oTWHj0gnayelmgvUmc7FffAAHIKFWoHTxqJtBOYMa+e9vnjARTZ4e+O/00IOZF+q
         QGOAMj8u0uClJPNqvKpBREg14Ca7gWsU8BR7IpY8h7sgXc6771rTjqg6JmLu7k9H3Z9o
         CpBV9IuuoZpjaCEmDi//QHqU8YT+IDALF9fL12KjzOMmF5heW7n/zIDh6jZzkxA7NUha
         nxgAjhNzC9pfv2m2KadIAThZPKZB1hu0jH4PB+1WA1nGdeOZ701LTJI4t+2kd27A/sEa
         Y11w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790171926; x=1790776726;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EjrfaPylqXAOJPnSJUAjYtmXRTNzd/AuKuG3cCOn7Ao=;
        b=SVvHGTmebcmEPcty71XkOb64bCSVHpKAVLcDr8U7JilIkJOTxepe0Dic+YyKcakQh5
         a6ADlrPZ8HOJJcEMha6WwIKfJcvdMwQoHdSJ7AAFOSgIeRHUOMXQChN5uj881as30bGt
         Ct63SAE/CCKpdp5ElN2mB+58007KHm4ehF6fQsupDCtYpjlh4tZ96a7SZVHCnrFqp1gg
         Jof1jam2JIXUo7QtdAtHpl94RXaFYWTZSnTVHoI25O8t8gUn+YpYnM4EeH28uuc6EBWC
         ryE4tF8fGRxVEKkfU1vKqm1ChRUzJlet4Z7T4QQO2zj6331Qhmnw7UWUOwPyL90/SFWn
         fbYw==
X-Forwarded-Encrypted: i=1; AKwUvBxSxHCzsnjroiKlPk4kUI/13uAoW+2kvcsKmcdUDMOYha3XzU8jYxtLDO0peberokdO73hFTXEyVUNZPh0=@vger.kernel.org
X-Gm-Message-State: AFuF++nj2fijZCstWsGOlMSJoGsTJVT1PGTk9YcnS6spvD7OhjTliKtf
	aIabIhOJgJTLPvVBYiwLu/bRPBnc5Ui0CGOEWYH+OzgaZR6bkyJzre3vgi7mGY6lQihUhQk2Zk2
	OmIv0dRWABUrIiU8Qzn5XanBeOyAhF8FqHNBRe9HgvApjEVhtNWGI/9/GOOoPxieYOJI=
X-Gm-Gg: AYBFou11T/hK6CwBp3hjINs6DsPhDOPTCWZbqJhsNiw98XTSz188SHJywiSlpEVIzzC
	r7ISOA4T3Mfg3iGOcUzkgeVBZdGUDgiH+yRbJNpgC+5gDonYqnCeJcrAemjwiGOw9CUE2rVV36E
	r/G+i0zDLswqGbLrPw/VkqvrDIn/FdGpO3kQ2b6dvvrP/HnfUVs2/ombRncEH9mIBuFpmQy9mY7
	8ltTiqNarYq2mDAksdpnr/6AAuvD1EpDKAq5S0EDWBMGED6VRd61p7uf+0bb0N3WlCR280diIpd
	LFfa/JEzYZ1Ot5c2B1bqACyiO2EMqf4nZSlMwEab2eqf2uw9BA3cM3PMuPAa3U8O5vGqcDI7gbl
	pqi1IkBOLj8vPhoY+Tb6ukUttqO8leT9A
X-Received: by 2002:a05:6102:5e93:b0:7a7:ad9f:539c with SMTP id ada2fe7eead31-7ac1ca9015dmr2190196137.2.1790171926238;
        Wed, 23 Sep 2026 06:58:46 -0700 (PDT)
X-Received: by 2002:a05:6102:5e93:b0:7a7:ad9f:539c with SMTP id ada2fe7eead31-7ac1ca9015dmr2190179137.2.1790171925859;
        Wed, 23 Sep 2026 06:58:45 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2aae6c4ac7sm127283566b.54.2026.09.23.06.58.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Sep 2026 06:58:44 -0700 (PDT)
Message-ID: <b3ae48e9-c2fc-4d04-8926-503fa6192c1d@oss.qualcomm.com>
Date: Wed, 23 Sep 2026 15:58:42 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] soc: qcom: smem: add boundary checks for
 partitions
To: Albert Esteve <aesteve@redhat.com>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sarannya S <quic_sarannya@oss.qualcomm.com>,
        Pranav Mahesh Phansalkar <quic_pphansal@oss.qualcomm.com>,
        Sudeepgoud Patil <quic_sudeepgo@oss.qualcomm.com>
References: <20260904-port-smem-v2-0-bb497dd3c48b@redhat.com>
 <20260904-port-smem-v2-1-bb497dd3c48b@redhat.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260904-port-smem-v2-1-bb497dd3c48b@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: KhY00uEIEmZo_U26a6AWJpM0ISB_ujpQ
X-Proofpoint-ORIG-GUID: KhY00uEIEmZo_U26a6AWJpM0ISB_ujpQ
X-Authority-Analysis: v=2.4 cv=WZuZ+EhX c=1 sm=1 tr=0 ts=6ab3db17 cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=t8figXO1SbCixz8pRdgA:9 a=QEXdDO2ut3YA:10
 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDA1NSBTYWx0ZWRfX6XsI8NJUUCL8
 3nQeaoJxcEe876M0oS2btWGxtSjbsMAr0hMo7MnLo0k9n0vGUHZTUiuB8twKxejgJUZr4nhLn2S
 eYo8afFmkjXnqfWB7RKru185r8extmA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDA1NSBTYWx0ZWRfXz/8UV2n1TRx/
 l87Gtkl9lmnLrm0g0U71kZlKQrnZ0SXjMZgPFpPC84OxhajxtT3n/5rRBoTM8aD3C9owgV1nhCi
 G+zUTqvUHZ5mzVkV1WxPV+OS4hHE+ANRn1+23oi7TMpq7rgAcyHfOAp8Wr2o2iKepqAkj7uf2FF
 Q1tqPXdjw18wsB57qoNyqk789wCcackaghOzaQFxks639tQwF4lHqAqxcMyTeyreNzi0fBX23Hp
 pkzSwcxpgqd765hHPjEql1lmdKuEYwany17TrIElVUNmY+qvS3udMNH0KKOeeGGPHU0Iimf8Lqz
 r3kqlT8t9pxLbF0olu1c6fUomDk4BmfNEN+gQEbKFPAw2BcYGvsj2oP5ButbyXMs7Pd66/tqF8w
 WDRy4lKj2JaGO2nT3VM0t2qpJeIY1rLWa5UW5TcF/PeTyE6Me/thtNrskSoZqZbmnyg8y9MRfvs
 gG1s82UT/y2TJwQKwBA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501
 suspectscore=0 clxscore=1015 impostorscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230055

On 9/4/26 5:18 PM, Albert Esteve wrote:
> From: Sarannya S <quic_sarannya@oss.qualcomm.com>
> 
> Add condition check to make sure that the end address
> of private entry does not go out of partition.

[...]

> @@ -409,6 +421,7 @@ static int qcom_smem_alloc_private(struct qcom_smem *smem,
>  				   size_t size)
>  {
>  	struct smem_private_entry *hdr, *end;
> +	struct smem_private_entry *next_hdr;
>  	struct smem_partition_header *phdr;
>  	size_t alloc_size;
>  	void *cached;
> @@ -421,19 +434,25 @@ static int qcom_smem_alloc_private(struct qcom_smem *smem,
>  	end = phdr_to_last_uncached_entry(phdr);
>  	cached = phdr_to_last_cached_entry(phdr);
>  
> -	if (WARN_ON((void *)end > p_end || cached > p_end))
> +	if (WARN_ON(!IN_PARTITION_RANGE(end, 0, phdr, cached) ||
> +						cached > p_end))

strange indentation
>  		return -EINVAL;
>  
> -	while (hdr < end) {
> +	while ((hdr < end) && ((hdr + 1) < end)) {

I believe the latter implies the former

[...]

>  	e = phdr_to_first_uncached_entry(phdr);
> -	end = phdr_to_last_uncached_entry(phdr);
> +	uncached_end = phdr_to_last_uncached_entry(phdr);
> +	cached_end = phdr_to_last_cached_entry(phdr);
> +
> +	if (WARN_ON(!IN_PARTITION_RANGE(uncached_end, 0, phdr, cached_end)
> +					|| (void *)cached_end > p_end))

The || usually goes on the end of the line, please move it there

This patch changes a lot without much explanation, could you please
split it up so that the changes are more focused? I know the general
theme is overflow checks, but a lot of conditions change
simultaneously in its current form and it's hard to track, even GPT
is slightly confused

Konrad
