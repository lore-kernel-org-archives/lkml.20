Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 081614EF154
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 20:38:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789677516; cv=none; b=rxxNtH7pbmmovwZylN4uPli/kk7mZn9t9BVgHzQzHUDwrgA3gTXB37bZ1N5H9u5FfaeKvvPfYawvgeyHbEknNWNsqhGhENz+AOp7O+UznFTFoFDKidCWcuANKbAT7iCxqlkjvLTYHr5N95qNbc7OMciVzeMPdXTpVdy0tQsgZrI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789677516; c=relaxed/simple;
	bh=Wi5x/Ouh/PeM1Z3PGzen1AuGIANL006sy5SnhuPr6aY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=P1Y0+y9Wgy7EF6ArTR8831qVLDz4sic0ErYgT/RvEecdaeyL7Y8ljEH15DXwQ2ggjMzwJTfWKDQtH3o2/ElgIP0leIGCK3l8oZen4AwGvog4MG+Z4DlTW89c4+tlA1O9cr4Iv+JqrWjrt1AsXYMx7aTqxbjSTMHrlDU/xGfuO2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bDMSa4iS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=a/1E+sad; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bDMSa4iS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="a/1E+sad"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68HH5ZbA3437483
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 20:38:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8YpNY/Bau2C9H4OXWV+XfoUZdnr4CV3FIhXIPLaLRpw=; b=bDMSa4iSiT8ItOZL
	qDlgE27bojSoam9G3l2wvgy1LHpWPkfn/+L27JL7XSP8tIMNBAM+VShnfQHvx7Sx
	HklycHyYEAS+3ywN8aA4DhZgIuPY9gcZiWa+ZsZWTxoYqwzkYWakBN/wBGvr3ExG
	UXvuMj/DMufQL1miacolNxE7jnHau+Fc4lsKaoVMm8hC1WEMYUL4bDNwOx/mmfIM
	WFqRC3Nxyqq5aUKNEqWDCMW9/M2bY8K7PCsh1b3z0cIefy6TcappZDautpQo2jPe
	GeupFN0+uoSdyO2Obeczcr4nrwTxCH7Z/yd85WiPhbNaIMSqp7chdUYyaDhQP7Yx
	j0JWsg==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grdd6k27v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 20:38:34 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cc4e496e5c3so1006914a12.0
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 13:38:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789677513; x=1790282313; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8YpNY/Bau2C9H4OXWV+XfoUZdnr4CV3FIhXIPLaLRpw=;
        b=a/1E+sadoxy9zywO9bH+nyv5JAK7j0m7ajPQ3EImaMKr0LhrWztcYBbpbaG6HvdCIa
         A5vtG55/vZXkv/BqwITrfkr/kLYvceIfpZpRLmsM7y4OXJ4qxrL5qnIF+VlID7hSErUV
         B9uzZ8omnrE7jznMkG6GhN4NxmqziGED95xZXPG7LMa7NLj2qJHKQZUSNFvNgxN5/Hwd
         FOhvsPN+QSLTujMhw+ar+bO6tP0/7yNjRrfhknKZ+UFr581WgzJ9UrUHg7xI7nHG+fLd
         AEXJLIB9BSlVdj28kfu6x3HqUGMm0PazZaOVAo4CyYiMn2Kg6MHHe68XG5WWJjKKCvcJ
         aRjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789677513; x=1790282313;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8YpNY/Bau2C9H4OXWV+XfoUZdnr4CV3FIhXIPLaLRpw=;
        b=opiGmfa5yWLf30Zh3ITxlzfYF5xi2TsPhjFQAe/84FxOcVpEvQod6Csk8AljCbXExQ
         beMXClUeJ/gXMNlVH7nahqSuRIf2g65i8LT4Mub+PCDDuOcNaASRXdAM67GqPntBkxpy
         3zX56KQnIRGhbF+Va5+AKpVQ4xrxcmtWFivElRROBEPUSJamT5Sd26858LDasi1JnUYq
         gLJAqdMRI07y37wDU9xXj0Dv/nFriu4Fseyw/q0nKDNgeazNVKMAIjd9Ww9ONjqsAc1n
         /qLXXm64KVrW0/MMeXc6lteTQ1T+l6U/AGHUiweK4E0xn6yJEC9AyHZp99rP9q+Dxuw+
         /E+A==
X-Forwarded-Encrypted: i=1; AKwUvByQKzlsFHdkrT8lUr1JvB6l4xx6Q3Y67yfCaWbB8gSSQqop/tf//gTSUd/U9g+A6w+6LCMbGnzBDDMpeZA=@vger.kernel.org
X-Gm-Message-State: AFuF++mdDd9oJvnz+7qki4KLJU8Qs1v3HJ9OYTK9QZFVkb8ZaPO82Rmn
	v/wShVPpUwrJobyktnAu0l7tCgCjtdfJhenM5f9gHAXVr0iEOMYPDseoWOcx16g/NKdK/nKn1tV
	JnUbKgtOPwodZqOvPadWQZT61vH4vsQ3ziuU0Ae7Qn7Xr26w0W+/ziFFValUDZ+NaGTZPl/j++1
	E=
X-Gm-Gg: AYBFou022tw3pjTjPBdMx3DnJaEgqND4pAqMDEy8MNAtN8aToU+Zc+0IGdoD7oIz8qo
	DCVGT7wpWYjWvOYVT/KRDmR8A6gac4m3OzlZdaRjhAeBphpiwvaUWc5ZUj5SkRRmqyihKwK7dzf
	jN9tjdxd5aq79MHsIBLKkcO+t4DNNep/ue4JivJ4qu4qvf77Es46bWrHq9G++w0hxLOmnKSxOzn
	gI0YClUP1N+S7EtIlULY15/8uM6kppO6CgC3b/4MME5irkzHqnWPua/5xE9+jqWqNft/7RzuB1F
	/KA7jspmgclixhcytrrjSi29ukJaYe+4V59VEHP15ohDTVfvODcUrqjc8yCjwpYvE11TyFpTyhs
	xscw08cXLArcPt/G93s4AQ6NKsERajR70OJh6Gb2vB74fm3USf+EtFA==
X-Received: by 2002:a05:6a20:4306:b0:3d3:adbf:777d with SMTP id adf61e73a8af0-3dd8c4cc8b8mr304651637.25.1789677513389;
        Thu, 17 Sep 2026 13:38:33 -0700 (PDT)
X-Received: by 2002:a05:6a20:4306:b0:3d3:adbf:777d with SMTP id adf61e73a8af0-3dd8c4cc8b8mr304613637.25.1789677512941;
        Thu, 17 Sep 2026 13:38:32 -0700 (PDT)
Received: from [10.73.236.146] (pat_11.qualcomm.com. [192.35.156.11])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33c00ede586sm14590388eec.10.2026.09.17.13.38.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Sep 2026 13:38:32 -0700 (PDT)
Message-ID: <71568eb6-8123-4ed3-a2d3-4e33e4880bf4@oss.qualcomm.com>
Date: Thu, 17 Sep 2026 13:38:31 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 1/5] optee: riscv: add RPMI TEE service group
 transport
To: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>,
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
 <786a1460-c660-4de7-bb07-debdbd6a4661@oss.qualcomm.com>
Content-Language: en-US
From: Trilok Soni <trilokkumar.soni@oss.qualcomm.com>
In-Reply-To: <786a1460-c660-4de7-bb07-debdbd6a4661@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: EPOymWQAUXsdSe-8Boi5TS7DCWfHuJ_F
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDI5NSBTYWx0ZWRfX2k8YqRM/iCsL
 0gBxqjUwpgyyWIJ0GtcvJ8OENvIyvCbFES8yUv/cwEpfBp4pKU4TuW9Gi0HvWlwhUZkqazJ/pvg
 FDGUw0fKlbjJeQaXsK+KmWyjkShJcx7CbgZ64kE3i4+GhrX6MM+ky5Gz9vEgi2Lte02rzGTcguj
 EM95oBMarzGcJzn8VLlnyHUIQ44b3PTIzUUOaUFxi9va7gsDdiBxcUk5tskLtvwyzNjVmsuAwqm
 fat8ZPBjUK1uHsB4sun4OXHiu8Hg6ofUPjqLybP6MH7b7oEsoDBi4ptiMWq9UPLgfiqKA5SaWY0
 pZePJKvxp9WZBxd2+7R0q2Rer4GMZNMBKWgITNn5iqi89tGKW8luUD/kYnAD9xzYlcEF8O5nyfP
 vdWkpFOnsO7KokBtS3VCk0wk5hhnlPjhViVpdHJBG3sGbA3NqTxYwPGd8hz4geDv7wDt02Wf+3e
 0MqVOd3Z7+T6ySk5afA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDI5NSBTYWx0ZWRfX1qITBZ6HNlP3
 m5Op8QMNHff6QH52iz2Liy0KBnAvSGa3YFlkHWq2MscOMw95c6gFIGGA1r+z+GkUNmC7CHFn+OL
 HcnvTaQ07z+KxvDweOEu3WnFbEiEOeo=
X-Authority-Analysis: v=2.4 cv=GeOCDgXL c=1 sm=1 tr=0 ts=6aac4fca cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZdW6uxA9NKXbfdqeeS2OGA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=5Hg3Q6Ij0jR0fJQLcq8A:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-ORIG-GUID: EPOymWQAUXsdSe-8Boi5TS7DCWfHuJ_F
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-17_04,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 lowpriorityscore=0 clxscore=1015
 phishscore=0 bulkscore=0 spamscore=0 suspectscore=0 adultscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609170295

On 9/16/2026 2:23 PM, Amirreza Zarrabi wrote:
> Hi Trilok,
> 
> On 9/16/2026 3:30 PM, Trilok Soni wrote:
>> On 9/12/2026 3:15 AM, Amirreza Zarrabi wrote:
>>> Add an OP-TEE transport for RISC-V using the RPMI TEE service group over
>>> the SBI MPXY mailbox framework.
>>>
>>> Request one mailbox channel per hart and use the channel corresponding to
>>> the current CPU when issuing a TEE request. Probe the RPMI TEE service
>>> group and required memory-sharing capabilities before registering the
>>> transport.
>>>
>>> This provides the basic transport and discovery support needed by the
>>> following patches.
>>>
>>> Signed-off-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
>>> ---
>>>  drivers/tee/optee/Makefile                 |   1 +
>>>  drivers/tee/optee/core.c                   |   8 +-
>>>  drivers/tee/optee/optee_private.h          |  34 ++++
>>>  drivers/tee/optee/optee_riscv.c            | 312 +++++++++++++++++++++++++++++
>>>  drivers/tee/optee/optee_riscv.h            | 141 +++++++++++++
>>>  include/linux/mailbox/riscv-rpmi-message.h |   1 +
>>>  6 files changed, 495 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/tee/optee/Makefile b/drivers/tee/optee/Makefile
>>> index ad7049c1c107..925b8ec7ef68 100644
>>> --- a/drivers/tee/optee/Makefile
>>> +++ b/drivers/tee/optee/Makefile
>>> @@ -9,6 +9,7 @@ optee-objs += supp.o
>>>  optee-objs += device.o
>>>  optee-objs += smc_abi.o
>>>  optee-objs += ffa_abi.o
>>> +optee-$(CONFIG_RISCV_SBI_MPXY_MBOX) += optee_riscv.o
>>>  
>>>  # for tracing framework to find optee_trace.h
>>>  CFLAGS_smc_abi.o := -I$(src)
>>> diff --git a/drivers/tee/optee/core.c b/drivers/tee/optee/core.c
>>> index a52c1f498b99..63f1725e646e 100644
>>> --- a/drivers/tee/optee/core.c
>>> +++ b/drivers/tee/optee/core.c
>>> @@ -220,6 +220,7 @@ void optee_remove_common(struct optee *optee)
>>>  
>>>  static int smc_abi_rc;
>>>  static int ffa_abi_rc;
>>> +static int riscv_abi_rc;
>>>  static bool intf_is_regged;
>>>  
>>>  static int __init optee_core_init(void)
>>> @@ -245,9 +246,10 @@ static int __init optee_core_init(void)
>>>  
>>>  	smc_abi_rc = optee_smc_abi_register();
>>>  	ffa_abi_rc = optee_ffa_abi_register();
>>> +	riscv_abi_rc = optee_riscv_abi_register();
>>
>> Isn't it growing rapidly now? We have two register calls for the ARM,
>> one for the RISC-V. One more region specific ISA I am aware of and it
>> may have op-tee support in future? It is time we fix this logic
>> in the better way. 
>>
>>
>>>  
>>> -	/* If both failed there's no point with this module */
>>> -	if (smc_abi_rc && ffa_abi_rc) {
>>> +	/* If all failed there's no point with this module */
>>> +	if (smc_abi_rc && ffa_abi_rc && riscv_abi_rc) {
>>
>> This is started looking ugly in my opinion. 
>>
>>>  		if (IS_REACHABLE(CONFIG_RPMB)) {
>>>  			rpmb_interface_unregister(&rpmb_class_intf);
>>>  			intf_is_regged = false;
>>> @@ -270,6 +272,8 @@ static void __exit optee_core_exit(void)
>>>  		optee_smc_abi_unregister();
>>>  	if (!ffa_abi_rc)
>>>  		optee_ffa_abi_unregister();
>>> +	if (!riscv_abi_rc)
>>> +		optee_riscv_abi_unregister();
>>>  }
>>>  module_exit(optee_core_exit);
>>>  
>>> diff --git a/drivers/tee/optee/optee_private.h b/drivers/tee/optee/optee_private.h
>>> index aefe1e6f5689..8d22d65e087b 100644
>>> --- a/drivers/tee/optee/optee_private.h
>>> +++ b/drivers/tee/optee/optee_private.h
>>> @@ -171,6 +171,31 @@ struct optee_ffa {
>>>  	struct work_struct notif_work;
>>>  };
>>>  
>>> +/**
>>> + * struct optee_riscv - RPMI TEE communication struct
>>
>> do we need to name it optee_riscv? we don't use optee_arm anywhere in this
>> code I believe. 
>>
>> More later...
>>
> 
> The naming convention, and even the file structure, will change in v2.
> This RFC currently mirrors the _internal_ FF-A implementation, which is neither
> required nor ideal. We are moving away from that structure.

Thanks. 

I also don't like the growing registration calls and complicated "&&" checks
above. 

---Trilok Soni

