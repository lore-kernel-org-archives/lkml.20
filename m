Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D05B4AEEF
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 22:27:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791498461; cv=none; b=t0evZylidpmKCUbAuTZhoYVBHwyQpOmyq+KiFkXXtx3zrWNwYy/HuYQCEbJsLZU3GPzShOzAfpgL123ycUGQn8i9oEYPwFHO9t+pfjqPANY+/9Js5hkJVvZvAUNDdaT96o1LfWX0U8fGjR5O0S2u+iO9Ila422eWmKYcm8gsdPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791498461; c=relaxed/simple;
	bh=FalV0QDU+ITCBxxhfTGB2yrOut3Ok2pK5ps59I/7+r4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hsIeN3QyY6amNxa45t6THK0AWGGaKNabPRMZKxP5kN1vIyvbIfuOHHLSD+K9edHVDg/3x1yoOoozNLsc8XJSJ76OcRJY5lJlU5OHxVKc6CtQD5mSr2Yj2axmBdEre6qYXUHoEggOkQOIvi6a/h/1H9eXqvdow19Duqg9wFwzxv8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RjFGfN0C; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WwgsExfi; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RjFGfN0C";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WwgsExfi"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 698L0KkX3996453
	for <linux-kernel@vger.kernel.org>; Thu, 8 Oct 2026 22:27:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9cptbFCbOtS+Z8HTXmejizLvCsvhFO+F9BnaLCjju7s=; b=RjFGfN0C5qe9J/98
	d7SQCKXFEc0KMf9ndKFI9Bwq846I/h9dMj4ReRYZu1nm54/MAY8VZCOJQ6hoPEPl
	a5HWT5SAqDFL549Vy6COuOiMPGHpf4Vxq6Tjfbi/A6Ln84rpwRrjc/wEzc0XHSaQ
	pO44F5o/eIC4RHT956vyn+8xFxW1sGMdsafus0w27/gOppW2R64LDR+xG4CQHDxw
	HKy0xeAPOZ2p1l5OSpa3c3CFbcLE0Rp4laaO/Nwi9WYWtXlVPkfQGFqvY4P0FCJN
	KzicxrbOnF9nGHMnkYGzYXwqse2mui9X024XaMhlFFVRs+i6+UU5GbeGzc9F+muk
	DLMcYA==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h6baj22sk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 22:27:38 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cc42a07d04aso3906502a12.1
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 15:27:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791498458; x=1792103258; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9cptbFCbOtS+Z8HTXmejizLvCsvhFO+F9BnaLCjju7s=;
        b=WwgsExfiOCcJ9/jqB0f6dsmjaBViUuVYFUL+kGX+fdbp97wwApixo/CB3HPERhQIG4
         oHUckJdCnCtfXqPsHFZ4oeurwrVnbWLtI/89CWFknYwxsLnniGwv7wnsnK3MsVhC7E5T
         dj3ZpUnpe4ZotrdSCu5VNBvAhJcL1+n4IyOFE/QpW3a3Oe/1/ZuEkBsytZZbzUo/hDaY
         EZylDifhXWJmEAoleaiB0sTCTWgLmMJK3DAMCLFwxBdMIzw4hLlgwMMLYryhNR4mjO8N
         k7nIf8ESNIMc/Y7U1KUzkfMC+9DvoxMsca3euYM/ccZafKvCAGd4/qodq4PqAOzY5uXB
         KbEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791498458; x=1792103258;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9cptbFCbOtS+Z8HTXmejizLvCsvhFO+F9BnaLCjju7s=;
        b=SAgHa31CbozLlrnbenDs/5fFwRIhiEAnG9CkCUSHUq5As5iFE+hbW7TKrNz1VFH0gR
         /VvLQNCcQ2q80wdfcpHmgNR2G9wb8+Bslj+naQR44rtgvgCgj4KIVB8Btrvo61fePGqo
         /glIV7hrOhxYseFfPZXweiIJ1cAd2h4RQ1ZRlKBZzooQ1HKkRVgbUY6MjKBPLUir4rQZ
         lQOgrBS2dIcOUJf6nAfn69W14s56eUVJ0bVmtOtRmBVyNEmvj9gB7VxxaKCm7ZaT+Eml
         yD6iLxm+CLfHCqwBgqDWeCmJ6GNW6MTIZ4kKwwwOQIOY2fFolO4bl7evPjiBHh5G2rYn
         ctTQ==
X-Forwarded-Encrypted: i=1; AKwUvBx8ex9smoXTEBVXY4+ynBJ5GVG7K2tLxt9IlZT7zmGmLVWWUqMm9p8ZjREiyPlcXEMhGl3Tpfz3UEYtIRM=@vger.kernel.org
X-Gm-Message-State: AFuF++mkTpPMsl4dC8e7ttdMSZqiYk6upNlEmLhXc96+jmIwTTfcsFZZ
	ETSdycgKZTMUz12MYe0pcQ9Yygq2DG1JDU5+Qf2f8Src7tDU9yk/mlrd5WLoQSMPHADrUZKo8mb
	29DgEMYozYxuhX+iVNluQJt+cF9TeDLq6Jrj9KvAN9Y18AxAJ24ClGHXcaM7dK0oqjg==
X-Gm-Gg: AYBFou2+/jNlkv57rtSg0R73mRLAQ8IzOL9tkuNmgYFz5rRcg2bLxk2EHE0m7Pddwrd
	ut6u2eMgz5cae9TC2qitA7rmF4Vu+IcZIOmXhxn9xcb1oJImVzd5lnQvpk2nXHuhBYR8w4zjlYC
	7v0lP39s1gY+mErop9EbqgOFgM1ZgwurhazbgS+DLUxwBOo5OE8ghLUaWmooMqbnCCygYE3ilp6
	cvpgxSABQwYdJ8Jnynap+Eym+LiiodA82pmlu006kkOP+S1csgxBpvLEkZF0Lg6Xdmm3E5sEip0
	yyt/FKKXUNjcJY2BF9KIL326KxVIIGpmzJSsy5sbzPLMcbFnhV4MyPYnAkg3al/d3Jt/Nl2kldc
	MhGNQjlrrEAmfK2zMC6b3rJ9pSAUi1ygJ
X-Received: by 2002:a05:6a20:a10a:b0:3da:80a1:f2f with SMTP id adf61e73a8af0-3e13401f00amr6762570637.14.1791498457510;
        Thu, 08 Oct 2026 15:27:37 -0700 (PDT)
X-Received: by 2002:a05:6a20:a10a:b0:3da:80a1:f2f with SMTP id adf61e73a8af0-3e13401f00amr6762543637.14.1791498456860;
        Thu, 08 Oct 2026 15:27:36 -0700 (PDT)
Received: from [192.168.1.86] ([65.181.12.250])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd3d9e0816csm129844a12.7.2026.10.08.15.27.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Oct 2026 15:27:36 -0700 (PDT)
Message-ID: <201e7530-7ff5-44c2-921b-e9e4ce177cf1@oss.qualcomm.com>
Date: Fri, 9 Oct 2026 09:27:26 +1100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v2 3/8] tee: optee: add RPMI shared-memory and
 parameter support
To: Jens Wiklander <jens.wiklander@oss.qualcomm.com>
Cc: Jens Wiklander <jenswi@kernel.org>, Sumit Garg <sumit.garg@kernel.org>,
        Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
        Rahul Pathak <rahul@summations.net>, Anup Patel <anup@brainfault.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Marouene Boubakri <marouene.boubakri@oss.nxp.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        op-tee@lists.trustedfirmware.org, linux-riscv@lists.infradead.org,
        devicetree@vger.kernel.org
References: <20261005-rpmi-tee-service-grp-dev-v2-0-72f222e23ec1@oss.qualcomm.com>
 <20261005-rpmi-tee-service-grp-dev-v2-3-72f222e23ec1@oss.qualcomm.com>
 <CAGgiveVHTjDPfRuXwMyQ0kxT7s5V+EgkC_hYgBCOvvvkb2bGvg@mail.gmail.com>
Content-Language: en-US
From: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
In-Reply-To: <CAGgiveVHTjDPfRuXwMyQ0kxT7s5V+EgkC_hYgBCOvvvkb2bGvg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDA4OSBTYWx0ZWRfX+IMapwJPoVVc
 kNAoMdzaYTDzaCpjU6svre8YTXgw4VU2Xsr7Nns/MTEPFBbstgMxjYZZI5InfinJzzVoWQsLcpj
 vcfKCj75KWuKcyR9gKhV7MHffIkqCvn2Ute44d1mlLnR60cNwtdN/GbNCx70qTlfzBg24mp8P52
 IAPRw1eguTkeDVWwOZ0OOe7Tu/ZmJ0jm5nBs9gzH+T8P7b3c7v+e1B61CiGG+LDh4cjeL7Ve94G
 TrKxOLuVbwadFB8c7zKN7vTW2EU+1wp01ct+Dtlikr3OBj+HyYWJAJv54Yv7cvsdZL/wOjS5G3/
 BdzUmnx6D5yPPekI+Ha3VeHoV4SmearLwQrS++qx6+g+VuXxwq+1DaizebLOZhhmUeGUGtrFm7B
 wSK86tbNu6dP8nwLHAePE9xw2Sqf5rlEJaXW63ZzgfkObyOA1mwzPKqIdDE78idjWAkOFruRVtq
 fogYF29ZQOnCQBHwNdQ==
X-Proofpoint-GUID: cZqOMnqbD-5SdTt0xktJGetrKMmd81Ae
X-Authority-Analysis: v=2.4 cv=H/dOUOYi c=1 sm=1 tr=0 ts=6ac818da cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=9v5PfQ1E2GNzj2RibJmqVw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=5emPIdRD6lWrgzuRjpEA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-ORIG-GUID: cZqOMnqbD-5SdTt0xktJGetrKMmd81Ae
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDA4OSBTYWx0ZWRfX5O5ycRAsWliz
 bsTRfNJdr2EOBy7kYpf3qfeqmpefcBKcYc33tXePYTXRGLgyw2gOAgUahBZNBH9BScwQL+hYSLg
 aAcFt4qxAFvI2/3XDxuDfsS9hqQPKZU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_07,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 phishscore=0 bulkscore=0 suspectscore=0
 lowpriorityscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610020000
 definitions=main-2610080089

Hi Jens,

On 10/8/2026 6:10 PM, Jens Wiklander wrote:
> Hi Amir,
> 
> On Tue, Oct 6, 2026 at 2:40 AM Amirreza Zarrabi
> <amirreza.zarrabi@oss.qualcomm.com> wrote:
>>
>> OP-TEE commands and RPCs need shared memory that secure world can
>> identify through RPMI parcels.
>>
>> Register normal-world pages as read-write parcels shared with the
>> OP-TEE endpoint. Track each parcel ID and nonce in a hash table and
>> store the combined identity in tee_shm.sec_world_id. Use a fixed
>> nonzero nonce to distinguish registered memory from NULL references.
>>
>> Add conversions between TEE parameters and parcel memory references.
>>
>> On client memory unregistration, ask OP-TEE to release its mapping
>> before reclaiming the parcel. Supplicant memory has already been
>> released by OP-TEE through its SHM_FREE RPC and only needs reclaiming.
>>
>> Signed-off-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
>> ---
>>  drivers/tee/optee/Makefile        |   1 +
>>  drivers/tee/optee/optee_private.h |  27 +++
>>  drivers/tee/optee/rpmi_abi.c      | 417 ++++++++++++++++++++++++++++++++++++++
>>  3 files changed, 445 insertions(+)
>>
>> diff --git a/drivers/tee/optee/Makefile b/drivers/tee/optee/Makefile
>> index 183cdde1ac04..8576cc73a922 100644
>> --- a/drivers/tee/optee/Makefile
>> +++ b/drivers/tee/optee/Makefile
>> @@ -9,6 +9,7 @@ optee-objs += supp.o
>>  optee-objs += device.o
>>  optee-$(CONFIG_HAVE_ARM_SMCCC) += smc_abi.o
>>  optee-$(CONFIG_ARM_FFA_TRANSPORT) += ffa_abi.o
>> +optee-$(CONFIG_RISCV_RPMI_TEE_TRANSPORT) += rpmi_abi.o
>>
>>  # for tracing framework to find optee_trace.h
>>  CFLAGS_smc_abi.o := -I$(src)
>> diff --git a/drivers/tee/optee/optee_private.h b/drivers/tee/optee/optee_private.h
>> index 02d6f79df407..2422caf3c883 100644
>> --- a/drivers/tee/optee/optee_private.h
>> +++ b/drivers/tee/optee/optee_private.h
>> @@ -180,6 +180,28 @@ struct optee_ffa {
>>  };
>>  #endif
>>
>> +#if IS_REACHABLE(CONFIG_RISCV_RPMI_TEE_TRANSPORT)
>> +struct rpmi_tee_device;
>> +
>> +/**
>> + * struct optee_rpmi - RPMI shared-memory identity state
>> + * @rdev: owning RPMI service device
>> + * @shm_rht_lock: protects parcel lookup, insertion, removal and publication
>> + * @shm_rht: lookup by the host-endian parcel ID and nonce pair
>> + *
>> + * Callers keep their tee_shm alive while using its registration. Lookup
>> + * returns a raw pointer; the mutex does not protect its lifetime after
>> + * unlocking. Never hold @shm_rht_lock across a transport operation, RPC or
>> + * thread-availability wait.
>> + */
>> +struct optee_rpmi {
>> +       struct rpmi_tee_device *rdev;
>> +       /* Protects parcel lookup, insertion, removal and publication. */
>> +       struct mutex shm_rht_lock;
>> +       struct rhashtable shm_rht;
>> +};
>> +#endif
>> +
>>  struct optee;
>>
>>  /**
>> @@ -240,6 +262,7 @@ struct optee_ops {
>>   * @ctx:                       driver internal TEE context
>>   * @smc:                       specific to SMC ABI
>>   * @ffa:                       specific to FF-A ABI
>> + * @rpmi:                      specific to RPMI ABI
>>   * @shm_arg_cache:             shared memory cache argument
>>   * @call_queue:                        queue of threads waiting to call @invoke_fn
>>   * @notif:                     notification synchronization struct
>> @@ -271,6 +294,9 @@ struct optee {
>>  #endif
>>  #if IS_REACHABLE(CONFIG_ARM_FFA_TRANSPORT)
>>                 struct optee_ffa ffa;
>> +#endif
>> +#if IS_REACHABLE(CONFIG_RISCV_RPMI_TEE_TRANSPORT)
>> +               struct optee_rpmi rpmi;
>>  #endif
>>         };
>>         struct optee_shm_arg_cache shm_arg_cache;
>> @@ -464,4 +490,5 @@ static inline void optee_ffa_abi_unregister(void)
>>  }
>>  #endif
>>
>> +
>>  #endif /*OPTEE_PRIVATE_H*/
>> diff --git a/drivers/tee/optee/rpmi_abi.c b/drivers/tee/optee/rpmi_abi.c
>> new file mode 100644
>> index 000000000000..e7fc853cfb15
>> --- /dev/null
>> +++ b/drivers/tee/optee/rpmi_abi.c
>> @@ -0,0 +1,417 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +/*
>> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
>> + */
>> +
>> +#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
>> +
>> +#include <linux/cleanup.h>
>> +#include <linux/mailbox/riscv-rpmi-message.h>
>> +#include <linux/overflow.h>
>> +#include <linux/rpmi_tee.h>
>> +#include <linux/slab.h>
>> +#include <linux/unaligned.h>
>> +#include "optee_private.h"
>> +#include "optee_rpmi.h"
>> +
>> +/* Nonzero nonce keeps parcel ID zero distinct from a null reference. */
>> +#define OPTEE_RPMI_SHM_NONCE   1
> The spec describes this as:
> 
> A token nonce which receivers will need to present to the framework,
> together with MEM_PARCEL_ID, to accept the memory.
> It is intended as a way to reduce the likelihood of accidental
> collisions on MEM_PARCEL_ID values, which can be reused by the
> framework after they have been destroyed.
> 
> Why don't we change the nonce with each new parcel to live up to that?
> 

True, That's the intention. I just set it to a constsnt to reduce the
code size so we can concentrate on the ABI. I'll include the nonce
allocation in the next version.

>> +
>> +struct optee_rpmi_parcel_key {
>> +       u32 parcel_id;
>> +       u32 nonce;
>> +};
>> +
>> +struct optee_rpmi_shm_rht_entry {
>> +       struct rhash_head node;
>> +       struct optee_rpmi_parcel_key key;
>> +       struct tee_shm *shm;
>> +};
>> +
>> +static const struct rhashtable_params optee_rpmi_shm_rht_params = {
>> +       .head_offset = offsetof(struct optee_rpmi_shm_rht_entry, node),
>> +       .key_offset = offsetof(struct optee_rpmi_shm_rht_entry, key),
>> +       .key_len = sizeof(struct optee_rpmi_parcel_key),
>> +       .automatic_shrinking = true,
>> +};
>> +
>> +/* Keep transport errors separate from the control status in a response. */
>> +static int optee_rpmi_call_with_status(struct optee *optee,
>> +                                      const void *req, size_t req_len,
>> +                                      void *resp, size_t resp_size,
>> +                                      s32 *status)
>> +{
>> +       struct rpmi_tee_device *rdev = optee->rpmi.rdev;
>> +       size_t received = resp_size;
>> +       int ret;
>> +
>> +       ret = rdev->ops->msg_ops->call(rdev, req, req_len, resp, &received);
>> +       if (ret)
>> +               return ret;
>> +
>> +       if (received != resp_size)
>> +               return -EPROTO;
>> +
>> +       *status = get_unaligned_le32(resp);
>> +
>> +       return 0;
>> +}
>> +
>> +/**
>> + * optee_rpmi_call - Send a control request and decode its RPMI status
>> + * @optee: OP-TEE instance.
>> + * @req: Control request, including the operation number.
>> + * @req_len: Request size in bytes.
>> + * @resp: Response buffer, beginning with a little-endian RPMI status.
>> + * @resp_size: Exact expected response size, including the status field.
>> + *
>> + * Return: 0 on success, a transport error, -EPROTO for an unexpected response
>> + * size, or the control status converted to a Linux error code.
>> + */
>> +static int optee_rpmi_call(struct optee *optee, const void *req, size_t req_len,
>> +                          void *resp, size_t resp_size)
>> +{
>> +       s32 status;
>> +       int ret;
>> +
>> +       ret = optee_rpmi_call_with_status(optee, req, req_len, resp, resp_size,
>> +                                         &status);
>> +       if (ret)
>> +               return ret;
>> +
>> +       return rpmi_to_linux_error(status);
>> +}
>> +
>> +static int optee_rpmi_shm_rht_init(struct optee *optee)
>> +{
>> +       int ret;
>> +
>> +       mutex_init(&optee->rpmi.shm_rht_lock);
>> +       ret = rhashtable_init(&optee->rpmi.shm_rht, &optee_rpmi_shm_rht_params);
>> +       if (ret)
>> +               mutex_destroy(&optee->rpmi.shm_rht_lock);
>> +
>> +       return ret;
>> +}
>> +
>> +static void optee_rpmi_shm_rht_free(void *ptr, void *arg)
>> +{
>> +       kfree(ptr);
>> +}
>> +
>> +static void optee_rpmi_shm_rht_uninit(struct optee *optee)
>> +{
>> +       rhashtable_free_and_destroy(&optee->rpmi.shm_rht,
>> +                                   optee_rpmi_shm_rht_free, NULL);
>> +       mutex_destroy(&optee->rpmi.shm_rht_lock);
>> +}
>> +
>> +/* Allocate and publish a parcel-to-SHM mapping. */
>> +static int optee_rpmi_shm_rht_add(struct optee *optee, struct tee_shm *shm,
>> +                                 u32 parcel_id, u32 nonce)
>> +{
>> +       struct optee_rpmi_shm_rht_entry *entry;
>> +       int ret;
>> +
>> +       entry = kzalloc_obj(*entry);
>> +       if (!entry)
>> +               return -ENOMEM;
>> +
>> +       entry->shm = shm;
>> +       entry->key.parcel_id = parcel_id;
>> +       entry->key.nonce = nonce;
>> +
>> +       scoped_guard(mutex, &optee->rpmi.shm_rht_lock)
>> +               ret = rhashtable_lookup_insert_fast(&optee->rpmi.shm_rht,
>> +                                                   &entry->node,
>> +                                                   optee_rpmi_shm_rht_params);
>> +       if (ret)
>> +               kfree(entry);
>> +
>> +       return ret;
>> +}
>> +
>> +/* Remove and free a parcel-to-SHM mapping. */
>> +static int optee_rpmi_shm_rht_rm(struct optee *optee, u32 parcel_id, u32 nonce)
>> +{
>> +       struct optee_rpmi_shm_rht_entry *entry;
>> +       struct optee_rpmi_parcel_key key = {
>> +               .parcel_id = parcel_id,
>> +               .nonce = nonce,
>> +       };
>> +       int ret = -ENOENT;
>> +
>> +       scoped_guard(mutex, &optee->rpmi.shm_rht_lock) {
>> +               entry = rhashtable_lookup_fast(&optee->rpmi.shm_rht, &key,
>> +                                              optee_rpmi_shm_rht_params);
>> +               if (entry)
>> +                       ret = rhashtable_remove_fast(&optee->rpmi.shm_rht,
>> +                                                    &entry->node,
>> +                                                    optee_rpmi_shm_rht_params);
>> +       }
>> +
>> +       if (!ret)
>> +               kfree(entry);
>> +
>> +       return ret;
>> +}
>> +
>> +/* Return a raw pointer; the surrounding call or RPC owns the SHM lifetime. */
>> +static struct tee_shm *
>> +optee_rpmi_get_shm_for_parcel(struct optee *optee, u32 parcel_id, u32 nonce)
>> +{
>> +       struct optee_rpmi_shm_rht_entry *entry;
>> +       struct optee_rpmi_parcel_key key = {
>> +               .parcel_id = parcel_id,
>> +               .nonce = nonce,
>> +       };
>> +
>> +       guard(mutex)(&optee->rpmi.shm_rht_lock);
>> +       entry = rhashtable_lookup_fast(&optee->rpmi.shm_rht, &key,
>> +                                      optee_rpmi_shm_rht_params);
>> +
>> +       return entry ? entry->shm : NULL;
> 
> Please use a full if statement instead of the ternary operator
> 

Ack.

>> +}
>> +
>> +/* Extract the parcel ID and nonce stored in the SHM identity. */
>> +static void optee_rpmi_shm_get_identity(const struct tee_shm *shm,
>> +                                       u32 *parcel_id, u32 *nonce)
>> +{
>> +       *parcel_id = lower_32_bits(shm->sec_world_id);
>> +       *nonce = upper_32_bits(shm->sec_world_id);
> 
> By keeping parcel_id and nonce in separate fields, we add quite a bit
> of code only to handle u64 -> u32 + u32 and vice versa. I wonder if it
> wouldn't be easier always to keep them in a u64 and say that the upper
> 32 bits are a nonce, or something. With that, we could make the
> optee_shm_rem_ffa_handle() function and friends common helpers in the
> optee driver.

Yes. I'll do that.
I'll also try to extract the sharable functions from FFA in the next version.

> 
>> +}
>> +
>> +static int optee_rpmi_shm_register(struct tee_context *ctx, struct tee_shm *shm,
>> +                                  struct page **pages, size_t num_pages,
>> +                                  unsigned long start)
>> +{
>> +       struct optee *optee = tee_get_drvdata(ctx->teedev);
>> +       struct rpmi_tee_device *rdev = optee->rpmi.rdev;
>> +       struct rpmi_tee_mem_receiver receiver = {
>> +               .endpoint_id = rdev->endpoint_id,
>> +               .access = RPMI_TEE_MEM_ACCESS_READ | RPMI_TEE_MEM_ACCESS_WRITE,
>> +       };
>> +       struct rpmi_tee_mem_args args = {
>> +               .nonce = OPTEE_RPMI_SHM_NONCE,
>> +               .receivers = &receiver,
>> +               .receiver_count = 1,
>> +               .creator_access = RPMI_TEE_MEM_ACCESS_READ |
>> +                                 RPMI_TEE_MEM_ACCESS_WRITE,
>> +       };
>> +       struct sg_table sgt;
>> +       int ret;
>> +
>> +       ret = optee_check_mem_type(start, num_pages);
>> +       if (ret)
>> +               return ret;
>> +
>> +       ret = sg_alloc_table_from_pages(&sgt, pages, num_pages, 0,
>> +                                       num_pages * PAGE_SIZE, GFP_KERNEL);
>> +       if (ret)
>> +               return ret;
>> +
>> +       args.sg = sgt.sgl;
>> +       ret = rdev->ops->mem_ops->memory_share(rdev, &args);
>> +       sg_free_table(&sgt);
>> +       if (ret)
>> +               return ret;
>> +
>> +       ret = optee_rpmi_shm_rht_add(optee, shm, args.parcel_id, args.nonce);
>> +       if (ret) {
>> +               int reclaim_ret;
>> +
>> +               reclaim_ret = rdev->ops->mem_ops->memory_reclaim(rdev, args.parcel_id);
>> +               if (reclaim_ret)
>> +                       dev_err(&rdev->dev, "reclaim parcel %#x failed: %d\n",
>> +                               args.parcel_id, reclaim_ret);
>> +               return ret;
>> +       }
>> +
>> +       shm->sec_world_id = ((u64)args.nonce << 32) | args.parcel_id;
>> +
>> +       return 0;
>> +}
>> +
>> +static int optee_rpmi_shm_unregister(struct tee_context *ctx,
>> +                                    struct tee_shm *shm)
>> +{
>> +       struct optee *optee = tee_get_drvdata(ctx->teedev);
>> +       struct rpmi_tee_device *rdev = optee->rpmi.rdev;
>> +       struct optee_rpmi_unregister_req req;
>> +       struct optee_rpmi_status_resp resp;
>> +       u32 parcel_id, nonce;
>> +       int ret;
>> +
>> +       optee_rpmi_shm_get_identity(shm, &parcel_id, &nonce);
>> +       optee_rpmi_shm_rht_rm(optee, parcel_id, nonce);
>> +       shm->sec_world_id = 0;
>> +
>> +       req.op = cpu_to_le32(OPTEE_RPMI_UNREGISTER_SHM);
>> +       req.parcel_id = cpu_to_le32(parcel_id);
>> +       req.nonce = cpu_to_le32(nonce);
>> +       ret = optee_rpmi_call(optee, &req, sizeof(req), &resp, sizeof(resp));
>> +       if (ret)
>> +               dev_err(&rdev->dev, "unregister parcel %#x failed: %d\n",
>> +                       parcel_id, ret);
>> +
>> +       ret = rdev->ops->mem_ops->memory_reclaim(rdev, parcel_id);
>> +       if (ret)
>> +               dev_err(&rdev->dev, "reclaim parcel %#x failed: %d\n",
>> +                       parcel_id, ret);
>> +
>> +       return ret;
>> +}
>> +
>> +static int optee_rpmi_shm_unregister_supp(struct tee_context *ctx,
>> +                                         struct tee_shm *shm)
>> +{
>> +       struct optee *optee = tee_get_drvdata(ctx->teedev);
>> +       struct rpmi_tee_device *rdev = optee->rpmi.rdev;
>> +       u32 parcel_id, nonce;
>> +       int ret;
>> +
>> +       optee_rpmi_shm_get_identity(shm, &parcel_id, &nonce);
>> +       optee_rpmi_shm_rht_rm(optee, parcel_id, nonce);
>> +       shm->sec_world_id = 0;
>> +       /* OP-TEE has already retired the parcel through SHM_FREE RPC. */
>> +       ret = rdev->ops->mem_ops->memory_reclaim(rdev, parcel_id);
>> +       if (ret)
>> +               dev_err(&rdev->dev, "reclaim parcel %#x failed: %d\n",
>> +                       parcel_id, ret);
>> +
>> +       return ret;
>> +}
>> +
>> +/* Convert a memory reference to an OP-TEE RPMI parcel reference. */
>> +static int to_msg_param_rpmi_mem(struct optee_msg_param *mp,
>> +                                const struct tee_param *p)
>> +{
>> +       struct tee_shm *shm = p->u.memref.shm;
>> +
>> +       mp->attr = OPTEE_MSG_ATTR_TYPE_PMEM_INPUT + p->attr -
>> +                  TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INPUT;
>> +       memset(&mp->u, 0, sizeof(mp->u));
>> +       /* For !shm, return parcel_id = 0 and nonce = 0 to represent NULL. */
>> +       if (shm) {
>> +               if (check_add_overflow((u64)shm->offset,
>> +                                      (u64)p->u.memref.shm_offs,
>> +                                      &mp->u.pmem.offs))
>> +                       return -EINVAL;
> 
> By combining the shm->offset with p->u.memref.shm_offs, OP-TEE
> requires an explicit call to register the shared memory so it knows
> the initial page offset. Compared with the FF-A ABI, which can tell
> the initial page offset from mp->u.fmem.internal_offs. See also the
> mobj_ffa_get_by_cookie() call in set_fmem_param() in
> core/tee/entry_std.c in optee_os.git
> 

I addressed this in my reply to the earlier commit. The intended
secure-side memory object covers the entire parcel, so the supplied
offset is parcel-relative. OP-TEE can retrieve the parcel lazily and
apply that offset directly, without a separate SHM registration call.

Is there a requirement for OP-TEE to know the initial page offset
separately that I am overlooking? I understand it helps with a
logical buffer representation and to match with Linux SHM.
The whole-parcel memory-object model appears to work without it.

But if you feel, having seperate offsets is better or may help
for some unification with FFA in future. I can do that :).

>> +
>> +               optee_rpmi_shm_get_identity(shm, &mp->u.pmem.parcel_id,
>> +                                           &mp->u.pmem.nonce);
>> +       }
>> +
>> +       mp->u.pmem.size = p->u.memref.size;
>> +
>> +       return 0;
>> +}
>> +
>> +static int optee_rpmi_to_msg_param(struct optee *optee,
>> +                                  struct optee_msg_param *msg_params,
>> +                                  size_t num_params,
>> +                                  const struct tee_param *params)
>> +{
>> +       size_t n;
>> +
>> +       for (n = 0; n < num_params; n++) {
>> +               const struct tee_param *p = params + n;
>> +               struct optee_msg_param *mp = msg_params + n;
> 
> Please add an empty line after the variables.
> 

Ack.

Thanks Jens for the review.

Best Regards,
Amir

> Cheers,
> Jens
> 
>> +               switch (p->attr) {
>> +               case TEE_IOCTL_PARAM_ATTR_TYPE_NONE:
>> +                       mp->attr = OPTEE_MSG_ATTR_TYPE_NONE;
>> +                       memset(&mp->u, 0, sizeof(mp->u));
>> +                       break;
>> +               case TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_INPUT:
>> +               case TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_OUTPUT:
>> +               case TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_INOUT:
>> +                       optee_to_msg_param_value(mp, p);
>> +                       break;
>> +               case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INPUT:
>> +               case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_OUTPUT:
>> +               case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INOUT:
>> +                       if (to_msg_param_rpmi_mem(mp, p))
>> +                               return -EINVAL;
>> +                       break;
>> +               default:
>> +                       return -EINVAL;
>> +               }
>> +       }
>> +
>> +       return 0;
>> +}
>> +
>> +/* Convert an RPMI parcel reference to a memref; callers own SHM lifetime. */
>> +static int from_msg_param_rpmi_mem(struct optee *optee, struct tee_param *p,
>> +                                  u32 attr, const struct optee_msg_param *mp)
>> +{
>> +       struct tee_shm *shm;
>> +       u64 offset;
>> +
>> +       p->attr = TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INPUT + attr -
>> +                 OPTEE_MSG_ATTR_TYPE_PMEM_INPUT;
>> +
>> +       if (mp->u.pmem.size > SIZE_MAX)
>> +               return -EOVERFLOW;
>> +       p->u.memref.size = mp->u.pmem.size;
>> +
>> +       if (!mp->u.pmem.nonce) {
>> +               /* Return NULL shm. */
>> +               if (mp->u.pmem.offs || mp->u.pmem.parcel_id)
>> +                       return -EINVAL;
>> +               p->u.memref.shm = NULL;
>> +               p->u.memref.shm_offs = 0;
>> +               return 0;
>> +       }
>> +
>> +       shm = optee_rpmi_get_shm_for_parcel(optee, mp->u.pmem.parcel_id,
>> +                                           mp->u.pmem.nonce);
>> +       if (!shm || mp->u.pmem.offs < shm->offset)
>> +               return -EINVAL;
>> +
>> +       offset = mp->u.pmem.offs - shm->offset;
>> +       if (offset > SIZE_MAX)
>> +               return -EOVERFLOW;
>> +
>> +       p->u.memref.shm = shm;
>> +       p->u.memref.shm_offs = offset;
>> +
>> +       return 0;
>> +}
>> +
>> +static int optee_rpmi_from_msg_param(struct optee *optee,
>> +                                    struct tee_param *params,
>> +                                    size_t num_params,
>> +                                    const struct optee_msg_param *msg_params)
>> +{
>> +       size_t n;
>> +
>> +       for (n = 0; n < num_params; n++) {
>> +               const struct optee_msg_param *mp = msg_params + n;
>> +               struct tee_param *p = params + n;
>> +               u32 attr = mp->attr & OPTEE_MSG_ATTR_TYPE_MASK;
>> +               int ret;
>> +
>> +               switch (attr) {
>> +               case OPTEE_MSG_ATTR_TYPE_NONE:
>> +                       p->attr = TEE_IOCTL_PARAM_ATTR_TYPE_NONE;
>> +                       memset(&p->u, 0, sizeof(p->u));
>> +                       break;
>> +               case OPTEE_MSG_ATTR_TYPE_VALUE_INPUT:
>> +               case OPTEE_MSG_ATTR_TYPE_VALUE_OUTPUT:
>> +               case OPTEE_MSG_ATTR_TYPE_VALUE_INOUT:
>> +                       optee_from_msg_param_value(p, attr, mp);
>> +                       break;
>> +               case OPTEE_MSG_ATTR_TYPE_PMEM_INPUT:
>> +               case OPTEE_MSG_ATTR_TYPE_PMEM_OUTPUT:
>> +               case OPTEE_MSG_ATTR_TYPE_PMEM_INOUT:
>> +                       ret = from_msg_param_rpmi_mem(optee, p, attr, mp);
>> +                       if (ret)
>> +                               return ret;
>> +                       break;
>> +               default:
>> +                       return -EINVAL;
>> +               }
>> +       }
>> +       return 0;
>> +}
>>
>> --
>> 2.34.1
>>

