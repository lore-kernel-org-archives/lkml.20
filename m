Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11BD03CB8EF
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 09:20:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788945662; cv=none; b=jkzskWEt+zZ2Ojl1+VrwW7qW5K7Ai3iDjXHH6j/DhZMnONO5frYkZDapXCExp2h9WkkokMviAUlPeCopocqW8qK1dAqQdwfZUB8nlcoDS/ysYv21UXpwaoLgyuzaef1FZg0ObPUzAd+ezUijj4KKpqNR2n9iXyhHP3qvJVSOfJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788945662; c=relaxed/simple;
	bh=ukcWglz3b0XxiFuNMMjBoSzp+0cQUC+nI3t9GxS1yJc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=C2LLk4MpPtBLMk/DFHDUE+OhyIH9z5DcdHpFPGQqoY16JYJ/tD9lkL56WS7R7OfnexAmtAMs2Q1TIVswdGmBCW+EIymcPC8Krzi9zDDLqqxh3FCiP3tOCZISzg2jE7Eu+6hZszzjvWOGahX1SZrSG9sEUqDqP5heXKFeWVy+/zk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Gq9YLOcG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eqHS+lVq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Gq9YLOcG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eqHS+lVq"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6896Y15Y965221
	for <linux-kernel@vger.kernel.org>; Wed, 9 Sep 2026 09:20:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ukcWglz3b0XxiFuNMMjBoSzp+0cQUC+nI3t9GxS1yJc=; b=Gq9YLOcGElM9zYWo
	mKBl6U+Qv8aHzZtMkr341dg391VyqGtc7LZfSLY2/LCq8/tKUbFrDMT+Cuq7yj7F
	CpN1Y+XkwvV8FrNGU9xkGAXtc6dv9wyDSKo5DWBoto/hqQf6mPwmHtQRMk0S1Msj
	AcNMhzMwqtP0uEyozQg/v76sRVMur8pVhfWKk+NeNQpcjGFCDALmWDDfNTaB9ppG
	gsXCgLYhsICqNdhx99NT4yjH/Vl5aNxYJSHpU3xykmJdCA3SHnG1YU0zsVaOwq0u
	K0dJm7IaHJUnmn5iUICEIs6Dy15Jsv0MLAhXfKKwFp/dbHQfeaVwzYnmc4LIPt65
	2Cw1lg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gjqha39vt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 09:20:54 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-9392788b3f8so106203685a.2
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 02:20:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788945653; x=1789550453; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ukcWglz3b0XxiFuNMMjBoSzp+0cQUC+nI3t9GxS1yJc=;
        b=eqHS+lVqA66VjgRkmt6lgAjHZgeZQBzaLI+aXvdDWgM2FcKK8X/s1NLUSk8O+YMma3
         LC86HpcVClp2yYqMWFGHrkT+hbTrv8iV92QKDGymUFdq2H5h9YA30/pM3BqzI5zz5EWW
         WTVV1gIrZLlVkh96QvkIFI8T5MZONsooAbyF2GiMGIwJJGJtpNQIaCOyJcz/0Nkm1eks
         /DmQ6MrXpuZpocn0guE2BUyew7wIkp7ChIbVjLWk/reZhV5ItatnnTLze/lhAWTc3TH7
         Ywcgff9bpnVIlyWBtCttY6KowPpxv7GkBy2CRO9HHcEBYgjONJ8aw4Ib8u6e7QC0/FOS
         8rfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788945653; x=1789550453;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ukcWglz3b0XxiFuNMMjBoSzp+0cQUC+nI3t9GxS1yJc=;
        b=ijWugdY8S1iNHaVpR2ywo7bGDj3XzVzpyOWNOvBO6z2n2b1XOro5sVA8lghB+HGTjw
         HGDNJHenpoE2AGqjzSiZDvurT2T6P4UKhR4nxDHvDUQOFuCQIOGEeVdgcgbmRAcDJljN
         5atDEWmyZkIWGIWN2QlprbCp/4OvUVKtxd/l6HnUYmw8j4x8ojZ60pQB3RnRwnTZkDrF
         x7hCdctu3sw9SgJhddrif3ZNv3e7gZYtlDqD9oG/O6Ux7alF7LOK2Sr6/LOuXuVL4vJ2
         O8nYZsOe/fu2VHfLAoAxros2n1VnGxlJzDZFXGIqxqboRSZwuTAwL4MW0JZrNZo2rzTM
         JyVQ==
X-Forwarded-Encrypted: i=1; AKwUvBw0/iyHkkjgUIS70OElfJjRlKondejDMFTSEtbEv9QpqGAkbrYYmxoeJuePZdOiniZSygoboVv+sF5wKJY=@vger.kernel.org
X-Gm-Message-State: AFuF++lRgRTLpmoSJ+pTSugamGrWB4gHRHhHxmgxUXfVJIx8fsPyoNfX
	N0QGDB0U4g5fD8/hAKa/7K1w7h1Z70KEC173vKq3esaMYhNSGCvA9b2FUmneMTCjE8LMfBhKVJI
	GflR0gRE07zxUk3eDBn8s7Gz7gXnbfC2PQ9B1YEZTb/fHPq5FUy2O3HUc8nmzmq337iM=
X-Gm-Gg: AYBFou3JTRMVDiInd1n38M6RAhWCKdrIsDz6uVFdvgqPrhK1lWteTJNaTewCfpX2pon
	nnB6xftMYJdT6Klhg22ZCAFiisNoJ4m4mD/wgtiuIUw27AZSOPZ7AK3doTIv6qUfjjfgW4QdbPf
	L9KPga8IVo/N+anDXMASjFvqsIT8p7RzXJCEVEbpO5uiCKsOh4mek7s/+UqR2gU9cVFaooPVSIY
	H3lj08h4U1VtRTuqW+5WefzRvXdoClcLIFImctomvkqVdMb1fv3UJ9ZqpkeQjX9dDz8nistS9XW
	h4e0lUiRItQu527JrQnhmUhr9NCvhEvKFrxpbTQ6UJLhMqUjCi5T2QX0ywfI977gxnaOC5lGkQ1
	N8iQ/B2I7+ul3e8sLqrOhCw==
X-Received: by 2002:a05:620a:4409:b0:939:8bc:8826 with SMTP id af79cd13be357-93991702d25mr2428458585a.2.1788945653317;
        Wed, 09 Sep 2026 02:20:53 -0700 (PDT)
X-Received: by 2002:a05:620a:4409:b0:939:8bc:8826 with SMTP id af79cd13be357-93991702d25mr2428454285a.2.1788945652851;
        Wed, 09 Sep 2026 02:20:52 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c260d53c37csm720711166b.32.2026.09.09.02.20.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Sep 2026 02:20:51 -0700 (PDT)
Message-ID: <42e0869d-cb28-4144-b5b7-f62bd26b7d08@oss.qualcomm.com>
Date: Wed, 9 Sep 2026 11:20:50 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: qcom: Fix CLK_GLYMUR_GPUCC default
To: Sivansh Gupta <sivansh.gupta@oss.qualcomm.com>, andersson@kernel.org
Cc: pankaj.patil@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
References: <5778ae29-9c86-418e-85f4-1bf48d674a31@oss.qualcomm.com>
 <20260908145605.1134841-1-sivansh.gupta@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260908145605.1134841-1-sivansh.gupta@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDEwMyBTYWx0ZWRfXytYGTod7vxGw
 Ectz86heuI1jPa6Eld4YB4ZD0LHk/RKSdbOsddAoF/+2gyofR3NSVvxVHsrPuveZtT67enkC2ME
 YRSZnH074EVt2cWGCD8KZ+qkp9DluLgFp3WvINrzTq+S+EJEAxVpyPrX4dOahOOMT4C0Uk3wQku
 FhGJ8LgxPy9CBVwJIdWWceVVnwJZ2vQPZVYLVWmw2SaPM9qZNGvIpHYtRSoZhJ7Mn3evH8i495u
 lK9Ud3cGptfrzPtrWw8RZDfhUvcSaadTAVjXlZHD80DmG6+fyyeaHIhL/zTPkuatny/NBMb/cY0
 Ys2zZlLGD/c64vYgoP1rLrcQH8cWUcuyEwLpGZ1IucM6gUJ6Eybeg5tdP/8jazEL/7/9IXERQBD
 lECyNNs82jZ7CvahwDft8VezlN01tE/JJQBWFO8fqwGyZQhhFBaMTYsiBSSg8CsRE7eIZflhebJ
 EMqNhaxLCTJsOQ4Pugw==
X-Authority-Analysis: v=2.4 cv=Z5Xc2nRA c=1 sm=1 tr=0 ts=6aa124f6 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=rlEOdTZNFpIyHtoTmy0A:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: Wgqm0xrO3VV4H-gDI1zqiSblb-wWnTO9
X-Proofpoint-ORIG-GUID: Wgqm0xrO3VV4H-gDI1zqiSblb-wWnTO9
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDEwMyBTYWx0ZWRfX1iSQxN79YEX4
 m3BCcHrLxjv6iHJ0D6Y+d8OcT8GrObSLNlCxoqqNUuRswiMcjdpSq5aneWj1a2GZotYo7q3P30Z
 L9TRBfdC0b50tiaRejFEnx4i4vV4EtE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-08_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 adultscore=0 phishscore=0 priorityscore=1501 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609090103

On 9/8/26 4:56 PM, Sivansh Gupta wrote:
> Hey, this patch has not received an ack, please let me know if
> anything is needed from my side.

You already received two, which is more than plenty for a
trivial 2-liner!

Konrad
