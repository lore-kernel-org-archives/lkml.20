Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 383584908C8
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 21:24:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789593864; cv=none; b=NZvbSFvbOXzmlr/i8pFUNJaoSqfygEeAfS7tjusB4JYu4UIxCZBVvEfUxzjhjdWOOlo+fLzunLSW7ggFKCO/spnm0Xk4vdN6LarPBbOm8oGz4jOIoOaIjPPA87CtGVjWnvJFzij5Owqe+hiDlo7XExA6R6K8m1An1eemhXKY8hc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789593864; c=relaxed/simple;
	bh=gJJWBQeFSX1YsrOWygD+rC9pHJoBZw2+qKeEeFs6RRo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SDKq+fZXgLB1geVzX+lRYd4GhGMUIHn82x17QwWlcDZe7rH/3PP3Is5i9pR//h7Mv153yCVkHlylNnGVRSWXgWmuLAEUrPxahe3BQb9vSRRc0J1ttdYIr0iTRCkmZ/DYVJiRt2tsWRNT3RNgk2DiSI+d0AZnQNBl6tayiG+k3KQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=B9zVUleq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RjUXA05P; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="B9zVUleq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RjUXA05P"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68GFeLp94056371
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 21:23:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	w/qTLVLi8JrEbZ5Wtjo59+5wUP++p74xd9zORAOvt3Q=; b=B9zVUleqVc0IwYvo
	2kVS9RooIb9ERrcP5PS6AJMR0gaiIevixWLq5qN/3aBKETxjM+rhRBUTzcok5Whb
	svM4ZTgwJPuPkCaNElgopGA52rcmgpqGQ7XVErtlmAIEq+GzVMbMCz6NH7EA7DIx
	JFvOfToWEO0K8/39zGLSg9eniwoyvlbxaElKoqjDbAnPej0Q6e50+et7aoofhuox
	XHRPcOIRMlbXXmowCW3mvxB+TDmnEzDZfJDrqhJKvE0PKJOxQYHIl9qkUCr6fnmg
	4vxlh7AoQbWeNSsdY4heO8bk0K6uRVpYox3qdPrQXH1kiaweWsoA9yWTsJkLltAR
	0ei0/Q==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqpu2uhg0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 21:23:50 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cc4e496e5c3so102568a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 14:23:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789593830; x=1790198630; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=w/qTLVLi8JrEbZ5Wtjo59+5wUP++p74xd9zORAOvt3Q=;
        b=RjUXA05PcrkLXiwLmHcIj1OkpOoedtm849jRtkyDsFjwn9FBHHDmurph5VcZOvzqnh
         xMtVa3H8ztx+CKXhKa1T9CaLm+73Y+d1FqYSTRxdmkZ22IZ4wGuhqOgH0N1jN1K3aImq
         mIJklUB2eTTVy/dt13TqNSyoVYQB60dWAEIBq7X7+4jgPxeSqoMSFp4cykPw9ZzyQMHv
         OOIr3ihTD+lbo+0Cyl6B6pjdjCK28u+RUMizBKTZ/y1Ks+5+ehYf+Z6V0rJc+iKLAsRq
         SXbC1Q3thNZc7/g9PdK02KjZwDbwUlXs5A2P6VZzId7tA9uYjaFX+mn7qlwZb3BWmtND
         KcKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789593830; x=1790198630;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=w/qTLVLi8JrEbZ5Wtjo59+5wUP++p74xd9zORAOvt3Q=;
        b=O/VlbNrxyaXcGbrrpbYypJvcmJZvX/WhwrJ7abUOO/aeciCExY9LyjjJgcKxpQfifr
         tEeIf5Pjf/fdbTdcbjsnl+SylNvwMdVQLidK/acZQY6lDCIu/2I0dE/4BBBcjwSD9pew
         MwJkiuw5cSgLLu/2rY2dilmp4map2+pO7cVEkevpaqS6g6FyshhswFwRQJTrbgtDzD9g
         5XDAZkICN4DG+36DCFyW4ukc4BG0+OYn+cyC4iCg94WmaOpsV1CTBphKEZ+yZGr2FoQm
         fWLYkQVQ3Yd+IUc44bEpi6zr0LOO5/vgQ6toFL5LPHcZ6IVxOImnEptA+zLpPR6bycyL
         98ZA==
X-Forwarded-Encrypted: i=1; AKwUvBzrn0ua1Fp7KdtrpWEMtfyIXaloRiEL9gG5XD3eQgoGkAcBYMT8pVNRp2wGVwQsyA/lV3KUTohwSNL62Ao=@vger.kernel.org
X-Gm-Message-State: AFuF++lOwpshyIL1TG6h328qrb4VEQJf7ErciWmMT0pprO5Qb0CRxp4b
	APKrulPBrX+jI7Y8pifrvdUY/DeRuMthGTop4mjHi8zbgB4mKkSp5YT7qhvuW7u3Z7Tgr2hyD/c
	HWzFiyZuxFK1hCH2H8aCd40qh57nF6bTcujkr6raxoLUtkF7fCwHyQD5g6IaAdOqo6g==
X-Gm-Gg: AYBFou0tzWY5c0Ne9ffy1+B/gFbOmHhXFAL3PttW5sK/25wl+Kpg7YELbEZvqeFXxTp
	pfV1qi0eGnm9O9uPoVZcrYgItdCyIiUvptdSPWQY4cepd6ct0i5a+OYSzyjcPuuJL8oebxJFfod
	Gzp8YV5I5BMTmp34hgLN5RYDdx0CnrcUnFw4YLwuXdW4ULR139JsO5HxXs61xKnG+sIZj6rAKGy
	179faYy3NJI1tIlxgOxwn9uqWJwWKkfhUUokHoJ1zS+hDhvd0eXdWfn4TVX4o8BbKOFD+OdVIdH
	U3lf0Fp9wsdpLm1bmaAR8Jd5+DnNU7piNQTC1KZbrGlzRfNjVC8Vqih/Dj2tK5XV+8h10hdQTQU
	TMfH82Uz5uW8mtTCVGvK2Il93GFUpNPbd
X-Received: by 2002:a05:6a21:6b10:b0:3da:3bdb:b22a with SMTP id adf61e73a8af0-3dd5f71a912mr10826733637.20.1789593829857;
        Wed, 16 Sep 2026 14:23:49 -0700 (PDT)
X-Received: by 2002:a05:6a21:6b10:b0:3da:3bdb:b22a with SMTP id adf61e73a8af0-3dd5f71a912mr10826675637.20.1789593829396;
        Wed, 16 Sep 2026 14:23:49 -0700 (PDT)
Received: from [192.168.1.86] ([65.181.15.100])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc50a7a3526sm2253425a12.0.2026.09.16.14.23.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Sep 2026 14:23:48 -0700 (PDT)
Message-ID: <786a1460-c660-4de7-bb07-debdbd6a4661@oss.qualcomm.com>
Date: Thu, 17 Sep 2026 07:23:40 +1000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 1/5] optee: riscv: add RPMI TEE service group
 transport
To: Trilok Soni <trilokkumar.soni@oss.qualcomm.com>,
        Jens Wiklander <jenswi@kernel.org>, Sumit Garg <sumit.garg@kernel.org>,
        Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
        Rahul Pathak <rahul@summations.net>, Anup Patel <anup@brainfault.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        op-tee@lists.trustedfirmware.org, linux-riscv@lists.infradead.org,
        devicetree@vger.kernel.org
References: <20260912-rpmi-tee-service-grp-dev-v1-0-1d1d35c2a859@oss.qualcomm.com>
 <20260912-rpmi-tee-service-grp-dev-v1-1-1d1d35c2a859@oss.qualcomm.com>
 <a9d9aac7-cb2d-46fe-a220-40f61f615b89@oss.qualcomm.com>
Content-Language: en-US
From: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
In-Reply-To: <a9d9aac7-cb2d-46fe-a220-40f61f615b89@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: t3PRA182kSwl3VGEEudmZbbKATqnJb7z
X-Authority-Analysis: v=2.4 cv=NelzRGD4 c=1 sm=1 tr=0 ts=6aab08e6 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=RYJI0oIToGyOemi2SthaJQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=-u4usqK0Ikitso02ChQA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-GUID: t3PRA182kSwl3VGEEudmZbbKATqnJb7z
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDI5NyBTYWx0ZWRfXzLZUB7POEBWM
 TlszbOOKalIjVqwDBc2jb6EGkeFil3TM3ukU/jC9SWzYXSJaSEWvQQ5PMJg2/qLB8q3ALxTxw2j
 nzCsFrMsKSpXnRedskqEf0T1mlgo9RyOSjN0UIUxNOex6XesbzMP/ZtLy4Pf+/nP+WeeFU8R5QH
 TnYseeDXIVCBu+uUYYJ8BHhQ6p6VNKSwP9oWP4hVrLIRpSbkVHXkLx3lZ2hw9mXpXNd00SZHL5C
 D2EoTM5iN4dd04BU3Wi61p80svo1RsotdTlIMmjAW7Xhn7ecKHf5Ek6z2nkJLsYmuaG06TckMaB
 NnuBhEzD8ywO+IvK6VecRcs8YO8sqTosBDbUcnqPNx1UC0G9syBIDNTg6Qr+gqrBC35sewO0GtH
 sj74c1fPTc/r5ORlj2GXMyWBZ2mhExcvHlnQ6F+COealsZK+E7DJcs1pN1FLChWJm+tC1sYTdJ7
 2lrS4GvtVbM/oBXp+Sw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDI5NyBTYWx0ZWRfX3WJljHGnAUiW
 Og4YzblBwBgRFelY6sOqiPZZt4Q9nqVtL9zqrkjrdJAJFzMlSN9I0hYplZMJHszjnm0UdcG+/0I
 MNYtXjw79R1l/OkKqKSf1fEXojpKsXU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-16_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 impostorscore=0 spamscore=0 clxscore=1015
 bulkscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609160297

Hi Trilok,

On 9/16/2026 3:30 PM, Trilok Soni wrote:
> On 9/12/2026 3:15 AM, Amirreza Zarrabi wrote:
>> Add an OP-TEE transport for RISC-V using the RPMI TEE service group over
>> the SBI MPXY mailbox framework.
>>
>> Request one mailbox channel per hart and use the channel corresponding to
>> the current CPU when issuing a TEE request. Probe the RPMI TEE service
>> group and required memory-sharing capabilities before registering the
>> transport.
>>
>> This provides the basic transport and discovery support needed by the
>> following patches.
>>
>> Signed-off-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
>> ---
>>  drivers/tee/optee/Makefile                 |   1 +
>>  drivers/tee/optee/core.c                   |   8 +-
>>  drivers/tee/optee/optee_private.h          |  34 ++++
>>  drivers/tee/optee/optee_riscv.c            | 312 +++++++++++++++++++++++++++++
>>  drivers/tee/optee/optee_riscv.h            | 141 +++++++++++++
>>  include/linux/mailbox/riscv-rpmi-message.h |   1 +
>>  6 files changed, 495 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/tee/optee/Makefile b/drivers/tee/optee/Makefile
>> index ad7049c1c107..925b8ec7ef68 100644
>> --- a/drivers/tee/optee/Makefile
>> +++ b/drivers/tee/optee/Makefile
>> @@ -9,6 +9,7 @@ optee-objs += supp.o
>>  optee-objs += device.o
>>  optee-objs += smc_abi.o
>>  optee-objs += ffa_abi.o
>> +optee-$(CONFIG_RISCV_SBI_MPXY_MBOX) += optee_riscv.o
>>  
>>  # for tracing framework to find optee_trace.h
>>  CFLAGS_smc_abi.o := -I$(src)
>> diff --git a/drivers/tee/optee/core.c b/drivers/tee/optee/core.c
>> index a52c1f498b99..63f1725e646e 100644
>> --- a/drivers/tee/optee/core.c
>> +++ b/drivers/tee/optee/core.c
>> @@ -220,6 +220,7 @@ void optee_remove_common(struct optee *optee)
>>  
>>  static int smc_abi_rc;
>>  static int ffa_abi_rc;
>> +static int riscv_abi_rc;
>>  static bool intf_is_regged;
>>  
>>  static int __init optee_core_init(void)
>> @@ -245,9 +246,10 @@ static int __init optee_core_init(void)
>>  
>>  	smc_abi_rc = optee_smc_abi_register();
>>  	ffa_abi_rc = optee_ffa_abi_register();
>> +	riscv_abi_rc = optee_riscv_abi_register();
> 
> Isn't it growing rapidly now? We have two register calls for the ARM,
> one for the RISC-V. One more region specific ISA I am aware of and it
> may have op-tee support in future? It is time we fix this logic
> in the better way. 
>
> 
>>  
>> -	/* If both failed there's no point with this module */
>> -	if (smc_abi_rc && ffa_abi_rc) {
>> +	/* If all failed there's no point with this module */
>> +	if (smc_abi_rc && ffa_abi_rc && riscv_abi_rc) {
> 
> This is started looking ugly in my opinion. 
> 
>>  		if (IS_REACHABLE(CONFIG_RPMB)) {
>>  			rpmb_interface_unregister(&rpmb_class_intf);
>>  			intf_is_regged = false;
>> @@ -270,6 +272,8 @@ static void __exit optee_core_exit(void)
>>  		optee_smc_abi_unregister();
>>  	if (!ffa_abi_rc)
>>  		optee_ffa_abi_unregister();
>> +	if (!riscv_abi_rc)
>> +		optee_riscv_abi_unregister();
>>  }
>>  module_exit(optee_core_exit);
>>  
>> diff --git a/drivers/tee/optee/optee_private.h b/drivers/tee/optee/optee_private.h
>> index aefe1e6f5689..8d22d65e087b 100644
>> --- a/drivers/tee/optee/optee_private.h
>> +++ b/drivers/tee/optee/optee_private.h
>> @@ -171,6 +171,31 @@ struct optee_ffa {
>>  	struct work_struct notif_work;
>>  };
>>  
>> +/**
>> + * struct optee_riscv - RPMI TEE communication struct
> 
> do we need to name it optee_riscv? we don't use optee_arm anywhere in this
> code I believe. 
> 
> More later...
> 

The naming convention, and even the file structure, will change in v2.
This RFC currently mirrors the _internal_ FF-A implementation, which is neither
required nor ideal. We are moving away from that structure.

Best Regards,
Amir

