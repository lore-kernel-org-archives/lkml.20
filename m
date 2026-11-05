Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793858055;
	b=tjMLKhDh+LS89JdhqQxlJI/oupj+dNR7znkeiiJqWAS1y6x4/32OmfgHvIFXKIDkAGj2
	 G9Deg7jbdJUOLtWlSEaERJAeEmm8qiU/mpcpZ6GuDt6H5odFNpmNMZN0Ovpw1J8dcganK
	 ch4G2rWS2x4DOghEOyBa97zrSJ61gqutt/jyEonvoCeOBxDBc9brPOZmY9wpXCVaoixPc
	 BaqBZZx0xgiqsfxjzsE+51n0K6la3qddPEJYPSbwunSrv62uImaDZ3eQ2WPTwjHDduUy8
	 GbQOEOK6TeEpZhf71QxXvO2tcPe0g1EFx8Bs8WbDmz4nhRNGeS5y8FmS6Y5d8RjDRYQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793858055;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=mFQbcgFKyHQxDwKoqL+5+45Ik0obkbSGzmJolPoCFxo=;
	b=UTxFQueQYlzbnG9c8KhIDX6blkfJ5FMrzEWbiKuwdjhlk9jkaH4hEThPoli2fd9BHNnl
	 Nevunc2/uYRn+AiTJfz/BY3kj0wwmfL1qj9CpY4kD9GcYANpcAlc3p4O/PPiT9AL0ca7u
	 rNEcuFVYB9fOA6KwXBILh1lKaUGvBymcHz6Pd47Mr8hmGs8APxeX4Q9j0HXXHLWY5+67O
	 VCrf1fFBOlr2cLuwnDXzdfWKg13geBJHq6EPwe4f4uG4OrfHdRmYyfeThszLRFOGR6rD3
	 5k9M1uPuVIVUS5+TZDUZSFQrSvluVnACeQoFdAL50L/6BvMdX7n+ybf3xpAK61WgN+g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nFNQDgRe;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HGxOnvgA;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EB03606D805
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 05:54:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3EB03606D805
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nFNQDgRe;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HGxOnvgA
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A50oOOq1851118
	for <linux-kernel@vger.kernel.org>; Thu, 5 Nov 2026 05:54:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mFQbcgFKyHQxDwKoqL+5+45Ik0obkbSGzmJolPoCFxo=; b=nFNQDgReKrhHKVrZ
	ZpyGTmzvXf5qmbV+/CZchCVBUx4r00KOWXpOP9rSB6MsGJaeRPqBnBG51YJEz9N9
	gpysD4KnX33Fj4WVgtPGuQ5WaITBKaH4wAW0KShgrbs3uN5fNtgvMtx4bOhqOKrK
	5xxBOXcHXW9bE6Q/mc275afvleVP+mK2/go8VI9RwFHOW1Se975/+s6Gi5MZNcr5
	CMKnsQJ4L02s3Q8UYVtkwCZHMnAtb1wTmRns0Zc0G0TKKhLOK8V9DmXZ5ZfGs9Ee
	Wx5aHYDBlS7HITi/9EP5wmspV7OpBOeFSYWoZKDRnMhppxK9jr9i1/qRWN9hbNgD
	LTiDXA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hr89stw3t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 05:54:14 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3adeba76cadso1282979a91.1
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 21:54:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793858054; x=1794462854; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mFQbcgFKyHQxDwKoqL+5+45Ik0obkbSGzmJolPoCFxo=;
        b=HGxOnvgATvxiRvkrrbsx3zqc9hd1hmI4tf+NEDFDKac2VSDRNYfJaG2eyIF4byVqKM
         zij0yaAvmheZrg4v65Ilna4EmZWKaaceVbKGiZUSnPcJ/InZErYLto0FlTcM1SJYPnmW
         L+TLcdZf0PTbLirxFwB6Oph89OmaUswWHjOy852+t2E4kZG+Nu6atID+3QinM7LO2INA
         ZtnOR+souTelZO7LwXaFCKL1eF65+DdMU+uoS14UvC9YpDbLdlXnzowh5TSbOEHk6f4a
         uuKIFmGX5XMOgmVToiFUKgLYfJm/+YWPwtdJnrQx8IpYbvADwNSNc58XiHRF4x7BknZF
         Getw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793858054; x=1794462854;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mFQbcgFKyHQxDwKoqL+5+45Ik0obkbSGzmJolPoCFxo=;
        b=YOkDbSZsK0V1pN496c4buWxJYBzzJ6Z5LJBmgW0Sl8ctQGLIt2gmoL2pNMmdAt6GPZ
         oLQOmhw35oCOaKt+ESsXyyfHpRLSZ1HjwzFSZY+7Z3xcD3yJC4ljgb3fWd9fTwWwPQad
         GxzeqmghVj6PHZo+sv31eQ6ih6dcrFuKA9ZGQvkUqPbqsFJE4zjb2t+akDanr+H1nZt0
         PJvmdXLGzekrUKxrLmT0i+qJvejUhinhnX6wQaaZV6Z5IT3jyb/O8O0meGrJU8QFUkrG
         KhPbpD4D/yvdOQCnKh+6w5BfINt48FDmwtwuX6Y6pEX9D24H25La9tClFca446O9Jvkf
         EYQA==
X-Forwarded-Encrypted: i=1; AKwUvBw2OOqBNBgj1SYp0JxQcwJ9Fj7yF2EJbE0+xNSVySxEYrV6RHCLWd5Fwf43dgq06LI0mS9VmuMaWCVQwRU=@vger.kernel.org
X-Gm-Message-State: APuU4Z+5N16lxGILnnkSfLYJZEVXB7F72AwDFSgo80rX3pEeVH2AujSZ
	owkimoSySrUkNC58TgzfkadT01BqDSLfAStH7mzDxAYq1KsbyYCLP2lF4I1k3RSCQGtwllR0c6e
	hv7+yOFBK9ttcvl6gYUi8gpGuPBCNhqL3fjuZODTzHTFTmhxwVx4EwAXtos41ouHQY7s4eIhiuw
	==
X-Gm-Gg: AYBFou1zDR1JBzVU3nrjfM5k2ndXaJBJkXbYbki7Xoonh3DD5TpJV/z80y0k7hq6OjR
	Gvi4fZ07HHPwpm7KPzx7rBqjb8tvVd6juH2ub+sK7J07u3Kcogpsp9IMtO9+X8shFXsBPBFkbbX
	Q5fV8dPxY3k4s0P7f5NzqTWR67odZIUvdvp238gGBYMxsxy8UrewusAcNJjRbYTS5if0KnBAyXJ
	bAhBmy1h+70C5pTLfQ6eY/rB21baVXyLDdB2KGjFIcBb6vIBBpTch9TuksUXUZJOyPVMCG/zRJO
	0mksgDWXp08OuTMs/vpKlkTvidQgu3lOg7SusL9xbiuNcbp2rpIw96um1hhJv07n5nVYNbtlGBY
	lJKYKiGH9kRn7/WUvbyWLQKOsEj0LbpVnobktskYmnxyWmrvHv9oqDw7MD9e+oLzrxvUV8aAaqf
	Me84BA
X-Received: by 2002:a17:90b:3e83:b0:3aa:f875:3385 with SMTP id 98e67ed59e1d1-3ae8973162emr16328543a91.26.1793858053461;
        Wed, 04 Nov 2026 21:54:13 -0800 (PST)
X-Received: by 2002:a17:90b:3e83:b0:3aa:f875:3385 with SMTP id 98e67ed59e1d1-3ae8973162emr16328526a91.26.1793858052891;
        Wed, 04 Nov 2026 21:54:12 -0800 (PST)
Received: from [192.168.1.86] ([65.181.14.223])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0b326add7sm2022848a91.8.2026.11.04.21.54.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2026 21:54:12 -0800 (PST)
Message-ID: <af92dbae-701c-480c-b7c7-7bc7bf2e6fc9@oss.qualcomm.com>
Date: Thu, 5 Nov 2026 16:54:05 +1100
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 6/7] firmware: qcom: Add support for TEE based EFI-var
 client driver
To: Harshal Dev <harshal.dev@oss.qualcomm.com>
Cc: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        Basant Kumar <basantk@qti.qualcomm.com>,
        Apurupa Pattapu <apurupa@qti.qualcomm.com>,
        Arun Kumar Neelakantam <aneelaka@qti.qualcomm.com>,
        op-tee@lists.trustedfirmware.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Jens Wiklander <jens.wiklander@oss.qualcomm.com>,
        Sumit Garg <sumit.garg@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
References: <20261015-qcom_uefisecapp_migrate_qcomtee-v5-0-1460691b35d3@oss.qualcomm.com>
 <20261015-qcom_uefisecapp_migrate_qcomtee-v5-6-1460691b35d3@oss.qualcomm.com>
 <4fed24d1-72a4-4314-a6e0-89ee7546240b@oss.qualcomm.com>
 <eddd891e-c23f-4977-9f40-9a41222f5bf2@oss.qualcomm.com>
Content-Language: en-US
From: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
In-Reply-To: <eddd891e-c23f-4977-9f40-9a41222f5bf2@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: qidMO31yzJsgLCDGxQUfqSAyelMXNv4r
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDAyMyBTYWx0ZWRfXw6XFVSIdZJKD
 4NnpW4jGVzGk0oyrcb3ssBlKa9dBvLuU/ISdYMynVCr271vt0R2RNpKPzT8oiGZNfWL5xfeosLv
 zqwfpm3sIK/432ei/KaUJc643otXk8a3OyKuP7vGQBjktllvjrAczl0wZktINQ4qHLRyjq2bmIw
 eO5WCzOCRnGs7CocPd8CE1QgjLh1wjXK/4HI/LXlxQL+gZVNcUFxQu281BofHVl30rK4028Z590
 kLKL2oK8KOORZqXbtu2I/Kfw92Pp1hwwPgY2frUupVt7gAbsvX0pBp5kLQtSNvVhfOGrpNmSuWU
 MW+6H1A7JsswBrsXfvBmjggKGZ70Z40gt6coMsM/n//BpyXKCGRsrnK/gdwngGR8KAiZ1yQ28mE
 xjqhFJVVNmo9uAQgawU1NzDMP7HVSpYMJi8b1F4Vv9tJX46rh2dCPGLe1AkaycmSIIjclyuc9/O
 4TuBUTclFJgo5YaOFvQ==
X-Authority-Analysis: v=2.4 cv=N628hG9B c=1 sm=1 tr=0 ts=6aec1a06 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=YVmDP9EW+FTsGeEl22X1ng==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=P-IC7800AAAA:8 a=EUspDBNiAAAA:8 a=nifu4ZWEVEi4-kztpOoA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-GUID: qidMO31yzJsgLCDGxQUfqSAyelMXNv4r
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDAyMyBTYWx0ZWRfX5KUZ4sruYjbT
 F0dw8CCrUASHpnjeJJCSSOgycUHW8ZdKzYAGhffXrF5kFdq8hBWlKk07+BPGzWZW1oedrN+biqp
 jwBjNnJYTu7fGcPh0dV/wQNhts2ykoM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_01,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 bulkscore=0 adultscore=0 clxscore=1015
 impostorscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611050023

Hi Harshal,

On 11/3/2026 7:35 PM, Harshal Dev wrote:
> Hi Amir,
> 
> On 26-10-2026 10:14 am, Amirreza Zarrabi wrote:
>> Hi Harshal,
>>
>> On 10/15/2026 10:39 PM, Harshal Dev wrote:
>>> On Qualcomm SoC based platforms, UEFI stores EFI variables within the
>>> Replay Protected Memory Block (RPMB) located within either the UFS,
>>> eMMC or SPI-NOR storage. The RPMB key which is one-time programmed into
>>> the storage controller to allow authentication of the RPMB frames is
>>> generated by and only available to the Qualcomm Trusted Execution
>>> Environment (QTEE).
>>>
>>> The legacy QSEECOM protocol used for communicating with the QTEE is
>>> deprecated and replaced with the use-case agnostic SMCInvoke protocol
>>> starting with the Qualcomm SM8x50 series. On platforms where the QSEECOM
>>> driver still probes, it does not support a listener interface with QTEE
>>> to enable writing of non-volatile EFI variables to the RPMB for UFS and
>>> eMMC storage.
>>> Therefore on such platforms, a TEE client driver which communicates with
>>> QTEE via the SMCInvoke protocol implemented by the QCOMTEE driver (and
>>> registered with the TEE subsystem) must be used to update such EFI
>>> variables.
>>>
>>> Add support for a TEE based uefisecapp client driver which installs efivar
>>> operations after obtaining an object reference to the uefisecapp service.
>>> This enables the kernel/user-space to access or modify both volatile EFI
>>> variables stored by the Secure Application (in-memory) and non-volatile
>>> ones stored within RPMB.
>>>
>>> Signed-off-by: Harshal Dev <harshal.dev@oss.qualcomm.com>
>>> ---
>>>  MAINTAINERS                                 |   6 +
>>>  drivers/firmware/qcom/Kconfig               |  31 ++
>>>  drivers/firmware/qcom/Makefile              |   1 +
>>>  drivers/firmware/qcom/qcom_tee_uefisecapp.c | 644 ++++++++++++++++++++++++++++
>>>  4 files changed, 682 insertions(+)
>>>
> 
> [...]
> 
>>> diff --git a/drivers/firmware/qcom/qcom_tee_uefisecapp.c b/drivers/firmware/qcom/qcom_tee_uefisecapp.c
>>> new file mode 100644
>>> index 000000000000..bcd025f929fc
>>> --- /dev/null
>>> +++ b/drivers/firmware/qcom/qcom_tee_uefisecapp.c
>>> @@ -0,0 +1,644 @@
>>> +// SPDX-License-Identifier: GPL-2.0-only
>>> +/*
>>> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
>>> + */
>>> +
>>> +#include <linux/efi.h>
>>> +#include <linux/tee.h>
>>> +#include <linux/tee_drv.h>
>>> +#include <linux/ucs2_string.h>
> 
> [...]
> 
>>> +
>>> +static efi_status_t qcomtee_uefi_get_variable(efi_char16_t *name, efi_guid_t *guid,
>>> +					      u32 *attr, unsigned long *data_size,
>>> +					      void *data)
>>> +{
>>> +	int ret;
>>> +	u32 in_attr, out_attributes, out_errno;
>>> +	struct tee_param_ubuf in_data, in_var, in_attributes;
>>> +
>>> +	if (!name || !guid)
>>> +		return EFI_INVALID_PARAMETER;
>>> +
>>> +	/*
>>> +	 * 'attr' can be NULL, however an input attribute is always expected
>>> +	 * by UefiSecApp TA
>>> +	 */
>>
>> You are enforceing a poliy on the arguments of a cb which is called publicly, are you
>> sure all callers understand that this output value is optional? it is not specified
>> anywhere as far as I can see. This seesm to be a TA thing.
>>
> 
> I think the way this comment is written is a bit misleading. The comment is not about
> the output value of attr, it is about the input value passed to this callback.
> 
> The callers of this callback either pass a NULL value for attribute or a valid value.
> When they pass NULL, they ignore the output since it's expected to not be set by the
> implementation: https://elixir.bootlin.com/linux/v7.3/source/fs/efivarfs/vars.c#L505
> 
> When they pass a valid value, they expect a valid output in return and operate on it:
> https://elixir.bootlin.com/linux/v7.3/source/fs/efivarfs/file.c#L108
> https://elixir.bootlin.com/linux/v7.3/source/fs/efivarfs/vars.c#L531
> So the value is not optional, it is set or not set as per the expectation of the
> caller. 
>  
>>> +	in_attr = 0;
> 
> However, the SMCInvoke transport here needs this to not be NULL, and so we force
> set a 0 here which is interpreted corrected by the TA as attribute not set.
> 
> I will re-phrase this comment to avoid ambiguity.
> 

I do not believe it is comment issue. I understand attr is an optional output value
which could be NULL. However, this implementation also uses attr as input. 

In your provided link:
https://elixir.bootlin.com/linux/v7.3/source/fs/efivarfs/file.c#L108
attr that passed to this function is from stack and uninitialized, so the
TA will get garbage in in_attr based on bellow code. It this acceptable?


>>> +	if (attr)
>>> +		in_attr = *attr;
>>> +
>>> +	in_data = (struct tee_param_ubuf){ .addr = data, *data_size };
>>> +	in_var = (struct tee_param_ubuf){ .addr = name,
>>> +					  (ucs2_strlen(name) + 1) * sizeof(*name) };
>>> +	in_attributes = (struct tee_param_ubuf){ .addr = &in_attr, sizeof(u32) };
>>> +
>>> +	/* On SUCCESS, 'data' member of 'in_data' has already been updated. */
>>> +	ret = qcuefi_get_variable(in_var, guid, in_attributes, &in_data,
>>> +				  &out_attributes, &out_errno);
>>> +
>>> +	if (ret)
>>> +		return EFI_DEVICE_ERROR;
>>> +
>>> +	if (!out_errno || out_errno == QCOMTEE_UEFI_SEC_ERROR_SIZE_OUT) {
>>> +		/* If 'attr' is NULL 'out_attributes' is not updated. */
>>> +		if (attr)
>>> +			*attr = out_attributes;
>>> +
>>> +		*data_size = in_data.size;
>>> +	}
>>> +
>>> +	return uefisecapp_err_to_efi_status(out_errno);
>>> +}
>>> +
> 
> [...]
> 
>>> +
>>> +static const struct efivar_operations qcom_efivar_ops = {
>>> +	.get_variable = qcomtee_uefi_get_variable,
>>> +	.set_variable = qcomtee_uefi_set_variable,
>>
>> Not sure how much it is relevant, but I was looking into the efi and in
>> efivar_set_variable_locked, saw this comment "If no _nonblocking variant exists,
>> the ordinary one is assumed to be non-blocking." which in not the case fo us.
>>
>> Does it make sense to introduce something like
>> qcomtee_uefi_set_variable_nonblocking and return UNSUPPORTED!?
>>
> 
> Ack, this ensures that if a caller expects the set_variable() to land in a
> non-blocking call, they get returned -ENOTSUPPORTED instead of being misled.
> As far as I can see only the x86 pstore implementation explicitly requests
> a call into a non-blocking variant:
> https://elixir.bootlin.com/linux/v7.3/source/drivers/firmware/efi/efi-pstore.c#L227
>  
>>> +	.get_next_variable = qcomtee_uefi_get_next_variable,
>>> +	.query_variable_info = qcomtee_uefi_query_variable_info,
>>> +};
>>> +
>>> +static int qcomtee_ctx_match(struct tee_ioctl_version_data *ver,
>>> +			     const void *data)
>>> +{
>>> +	return (ver->impl_id == TEE_IMPL_ID_QTEE);
>>> +}
>>> +
>>> +static int qcomtee_uefisecapp_probe(struct tee_client_device *tee_dev)
>>> +{
>>> +	int ret, err;
>>> +	struct tee_param_objref client_env_obj;
>>> +	struct tee_param_objref uefisec_svc_obj;
>>> +
>>> +	uefisec_app.dev = &tee_dev->dev;
>>> +	/* Open context with QCOMTEE driver */
>>> +	uefisec_app.ctx = tee_client_open_context(NULL, qcomtee_ctx_match, NULL,
>>> +						  NULL);
>>> +	if (IS_ERR(uefisec_app.ctx))
>>> +		return -ENODEV;
>>> +
>>> +	ret = qcomtee_get_client_env_obj(uefisec_app.ctx, &client_env_obj);
>>> +	if (ret) {
>>> +		err = -EINVAL;
>>> +		goto err_get_client_env;
>>> +	}
>>> +
>>> +	ret = qcomtee_get_uefisec_svc_obj(uefisec_app.ctx, client_env_obj,
>>> +					  &uefisec_svc_obj);
>>> +	if (ret) {
>>> +		err = -EINVAL;
>>> +		goto err_get_uefisec_svc;
>>> +	}
>>> +	uefisec_app.uefisec_svc_obj = uefisec_svc_obj;
>>> +
>>> +	ret = efivars_register(&uefisec_app.efivars, &qcom_efivar_ops);
>>> +	if (ret) {
>>> +		err = ret;
>>> +		goto err_efi_vars_reg;
>>> +	}
>>> +
>>> +	/*
>>> +	 * We don't need to keep a reference to this object anymore, we only
>>> +	 * needed it to obtain the uefisec_svc object.
>>> +	 */
>>> +	qcomtee_release_object(uefisec_app.ctx, client_env_obj);
>>> +	return 0;
>>> +
>>> +err_efi_vars_reg:
>>> +	qcomtee_release_object(uefisec_app.ctx, uefisec_svc_obj);
>>> +err_get_uefisec_svc:
>>> +	qcomtee_release_object(uefisec_app.ctx, client_env_obj);
>>> +err_get_client_env:
>>> +	tee_client_close_context(uefisec_app.ctx);
>>> +
>>> +	return err;
>>> +}
>>> +
>>> +static void qcomtee_uefisecapp_remove(struct tee_client_device *tee_dev)
>>> +{
>>> +	efivars_unregister(&uefisec_app.efivars);
>>
>> I still have concerns about the removal path. efivars_unregister() acquires the
>> semaphore interruptibly and can return -EINTR, for example when a signal arrives while
>> it waits for an active EFI operation. Its return value is ignored here, so removal can
>> release the service object and close the TEE context while the EFI provider remains registered.
>>
> 
> This is a valid point. But it seems like no easy solution exists here. The driver core
> doesn't check the value being returned from remove(), so it will always detach the driver from
> the device.
> 
> Currently when -EINTR is returned, the driver is removed but __efivar->ops remain set, so a
> subsequent call to __efivars->ops would cause a kernel panic/crash. If we check for error here
> and return without releasing the service object/TEE context, we still have the same issues but
> now also a leak; QTEE's object table still has the service object and the TEE context remains
> allocated (while the driver is removed and __efivars->ops remain set to a random pointers).
> 
> Everyone else is also suffering the same race:
> https://elixir.bootlin.com/linux/v7.3/source/drivers/firmware/efi/stmm/tee_stmm_efi.c#L518
> https://elixir.bootlin.com/linux/v7.3/source/drivers/firmware/qcom/qcom_qseecom_uefisecapp.c#L842
> https://elixir.bootlin.com/linux/v7.3/source/drivers/firmware/google/gsmi.c#L1075
> 
> This is a framework level issue, where a fail-safe fix is to use down() instead of down_interruptible()
> in efivar_unregister() and pray that whoever is invoking the callback comes out soon. But at
> least it replaces a sure-shot kernel panic with a low probability deadlock which can be
> diagnosed.
> 
> I thought about other ways, like using try_module_get() from either the callbacks or the
> efivar_register/unregister(), but neither solve this.
> I can try initiating a discussion on this separately on the efivar mailing list, unless there
> are any other innovative suggestions for solving it from within the driver. :)
> 
> Let me know your thoughts.
> 
>> Separately, efivar_lock() appears to have an existing bug: it checks __efivars->ops
>> without first checking whether __efivars is NULL. Successful unregister sets that pointer to NULL,
>> so subsequent access through an existing efivarfs can dereference NULL.
>> I Feel, that needs an EFI-core fix as well. what do you think?
>>
> 
> Ack, this is true and a fix is straightforward. I will send a patch separately if someone hasn't
> already sent one.
> 
> Regards,
> Harshal
>  

Yeah, you are right. Let's ignore it for now.

Best Regards,
Amir

>>
>> - Amir
>>

