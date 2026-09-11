Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FDE74582F6
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 09:06:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789117613; cv=none; b=JdoF2M6QHi7i68ab/1PEej8TiM4Zo0PNJelcbMZb1Rwm4gEfFloBEpZgw73UTDdMrkgzjgnzy63SJAxIWHkql+Z4DzGtnXceEjXQtIs3pI2m2Yg73/NZU/WGDy78PEzgoy/NoSprhol0L1gRQDk0VCt2+Y7kmVMl2uCZVS69Xxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789117613; c=relaxed/simple;
	bh=6fq86bBfJotY3kdKrP/jl79ZjbO++6p2yGKmY5IeaZE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=E7Jmzf2U0jNfSN0E/SFJStNgpGXJQyO2dmrNy5DwEd/QsyinmF1TAwxyQt+DRter73abCng/QCKrTX0hJo/zDP7hE55/sLhTQ7GhkwsV9UzadCzrrIENfPA3gbTLn3RxYnbr3EeKnfXm39hlgQUliNv+m43Qv99Yvy4FBTfj8Ds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nkpMFX3+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TtulOOeT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nkpMFX3+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TtulOOeT"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68B7kwMD2311617
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 09:06:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qRwnidMTP0RkO2fmOb9fG6IUG/M/dKUtb5fnGWjMiJw=; b=nkpMFX3+GuTsCuls
	NcCtq7SzSDkqzwuY9r/AS3NtQDWyAn5LftuVp4yewmbSQlB72mEurPKG2Qmhybvx
	3pb9C6iIeoEIZIotYs3C+jrcc9Sid816T5iDaGZkQnPrq3LxwxweEpTuBwV6vP1k
	RnMlAU3opZ2znXdtkWzOzZbm2hL0YnO6ARrEEafUm534LL6FhQyN2cy25/8yTV6/
	uw3LWMKcd/6nvhbHd2dZATNJ+kDc5HDdF+SxKN5KO4/X6QhGwOAenJyLB4o29C44
	Z6gwbeqprKlplDae4Ab9QRn3+CpjckkTKuPJBrWnWlg6DJ2UUs7aBwVqb4f0fOKx
	fLcUvg==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gm7uchn12-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 09:06:51 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5bf9ff71075so24418e0c.0
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 02:06:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789117605; x=1789722405; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qRwnidMTP0RkO2fmOb9fG6IUG/M/dKUtb5fnGWjMiJw=;
        b=TtulOOeTHoNuBS0rauYRuRZvnflV0GZYjJsDCDNJTVq62hZWaI2TCgElcs7X3UZV2e
         LJpSxvnktB81oMZgCd0jnAmrO0Jgd++a7mQXqGUsDJ18GRoThDUVTrC4J1QG+kn95kl7
         H+wwFgVpBsN6qW4KePt1+elvZ8FmO5rMaEsOhB7WQsdT9bOC5MtX/O8nRcIFqZiYv2aD
         TJJwOuUtDtNPzE2QOgIHhj526ttVU0Oxa4wwx7BFPDkc47AB0ulwN7FJ6JmxgHJWXvO1
         Adz3MpANxT0mwnC866ks07+hdZDuaE3FlG0i7kYduSaT/hyV0u0Pv5ZLps03BGdSkPjc
         yi9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789117605; x=1789722405;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qRwnidMTP0RkO2fmOb9fG6IUG/M/dKUtb5fnGWjMiJw=;
        b=Wdj+BXpEQm6KtxZO5cR436fsiUwh9n9ORh3vLMddYcVVpSXdRuv+SKjoKBlVV/MAPK
         LPF+kw0tKIiCj3RIWfRsV/Gp7wjkDE7nqOPO145dO6Qn5zUMf+j10ERC9P2f76SucI+V
         oziFmdAGz8nItFbjXlHSZ6rStEUFqoFBhyiTimjY9aoKPDSjY86joKyOOSBtW4lSHAsb
         7oOWseTbYHYHJO9X6zB/Z7QxmUrzgWVgTntQD55c0l3qkruI1JllsCkEmGmeinEyBXNx
         rcFNp3MTCI6OgPE24rsbAQejLIbd+AeRJMQ3fTjj7hwbBwHwJ9H0obGqtTC4l3tIPc8z
         0TNw==
X-Forwarded-Encrypted: i=1; AKwUvBzYzsOWlQskUJEtie0ghaHeqtlNcTkcqIhApT+L0K/xdshE8gNFy46aX6bOg5XQILIuWz9d6XCwiqQbiQ4=@vger.kernel.org
X-Gm-Message-State: AFuF++n8ICh9GjTKkrtjGO23gVQIV9Jfp5nATAL5/xJAtrJovvtS9s7F
	M6FfFDToOj1OVFxRBTpG4DmFeNa9dcUHa1ETp8iITUgFoTwJRkZc2kdnU40S+2NXUxU/AxZuqqO
	fEj1C+au3DNd+2FczxYffOKgkmNjd4xwdUVtLOqophmISWKteD0UwrItO8oCM9YX7+Jk=
X-Gm-Gg: AYBFou3G4KHrBCXwjYst9fbmQnAW3TEBEDIccfttEHBoFnLivDcgApMa1tOE1rLm5ZC
	9qxVYSA5Z9Aq97fhefGelKXN+AKXWPJbv7YX5cgwUJaSrs2PgXia41OsVBC7tWcyWQTUyJLh8lt
	OMd1EdORd/qGQiwn8AfGfia2xAizbBR3j0ZBhd8KyYiQ//WrCW80MrtLNClGxFJhmtYCpZJ7Qze
	sWnsR3KmkIc7Rm7jmnmWTrF1+syvX7lbTDLjRXrh8HBXrurqKsmvIa11msMxD7glphlQzP9t2D4
	J2CZgjgIUljpNCFWupJ7qKo0bLjIkVVumQ98dDFy+lJce0vBY/yFtjscICPiEHmhLwc56nvKcVK
	IT4RBKI6ElaLIgWggC0ZLcQ==
X-Received: by 2002:a05:6122:6c16:b0:5c8:39c7:ba55 with SMTP id 71dfb90a1353d-5c845d87bd9mr1381795e0c.0.1789117605269;
        Fri, 11 Sep 2026 02:06:45 -0700 (PDT)
X-Received: by 2002:a05:6122:6c16:b0:5c8:39c7:ba55 with SMTP id 71dfb90a1353d-5c845d87bd9mr1381789e0c.0.1789117604909;
        Fri, 11 Sep 2026 02:06:44 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8a047d1d1sm446603e87.80.2026.09.11.02.06.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Sep 2026 02:06:44 -0700 (PDT)
Message-ID: <dab99b27-ebc2-477e-b56a-26250aceee23@oss.qualcomm.com>
Date: Fri, 11 Sep 2026 11:06:40 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: qcom: smd-rpm: Skip proxy votes on clocks for
 QCM2290
To: Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>, Georgi Djakov <djakov@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Stephen Boyd <sboyd@codeaurora.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260910-clk-smd-rpm-skip-proxy-v1-1-1cb5694a99d9@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260910-clk-smd-rpm-skip-proxy-v1-1-1cb5694a99d9@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=O4asLx9W c=1 sm=1 tr=0 ts=6aa3c4ab cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=WZiSlqQC4IXfQuhb2KwA:9 a=QEXdDO2ut3YA:10
 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDEyNyBTYWx0ZWRfXw440Fgv1UBsC
 Zbicxh0nfcd2iydeLTlWlWFcsMvC/8O3NfUtgiJMp/YSEf/dRCfx75XzfcfSNxo1GtYr1EE2CMC
 6jpBupHY2DVvboUagfyiByV2+ldDFG2k42N5ktmdJKqzkc4tCqGuDLe3mkXzd3XHmuTn300FqEk
 OvQbQKXiYKRIipoviHY+mnB1UTkTKnqjyn0jW8lDpUB+C924gUBiz4uA+sVhWNqOdd8LuV+rBDy
 fwO9bm4Q62bvypk5pX518s4tqjByoQhCPPN74SaCCAsmtVQH5tWUv8cyuBeMElRkpmzU6Y9IlmI
 Qh1kbfLGXxyHJqMfdJojdu/5Gk0QbadM2W0rT8ThNFgda0OAw/mMKRF/qo8in0sKxFxIZpSMzMJ
 JOJD4uaSX9Ki2Ly0zkAVg/s1haS7YTxaS/52jCQ5eQmSMdvwtyg/YLUdKAQ1w+AL9CU3JAhhiTO
 Ulyd+IS9c5yv/gvSWhg==
X-Proofpoint-GUID: LXqvIqaEvpHen7rf6HQJ_D9FDsa6hRJQ
X-Proofpoint-ORIG-GUID: LXqvIqaEvpHen7rf6HQJ_D9FDsa6hRJQ
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDEyNyBTYWx0ZWRfXy6hFyDNc678A
 KJr5DOkcwON4cdbUOgdBkGCSj2AKrIJs6DfE7x1/1kc06Z0xeD5jG8QH2tBGYV8ZEme1n824KpX
 Tmh64cZ9ft3sCbxWaWrtI0h+z+gzUlM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_03,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 priorityscore=1501 suspectscore=0 impostorscore=0
 lowpriorityscore=0 spamscore=0 adultscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609110127

On 9/10/26 3:44 PM, Imran Shaik wrote:
> clk_smd_rpm_handoff() votes both active and sleep RPM resource states for
> every clock, keeping them non-zero until a consumer takes over. If there
> is no consumer, those clocks will remain active in the idle scenario as
> well, and the sleep vote is never cleared, blocking XO shutdown.
> 
> Introduce the skip_clks_handoff flag to handle this on QCM2290 clocks,
> keeping other targets unaffected.
> 
> Fixes: 00f64b58874e ("clk: qcom: Add support for SMD-RPM Clocks")
> Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
> ---

Are you booting with clk_ignore_unused?

Konrad
