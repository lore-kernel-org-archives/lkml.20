Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793861879;
	b=Y8fh7VHhdkXy4jgO3rFS/HlpEoV1wVX1iFsw1nW6lGFpndk+WZWdWL3XL0LlA0whYzfB
	 yt88UvgUis8Akqmt+LeKO3bZJzIWgoLS9LMHIivpSiiH3UuaicT43WIZN7I4kQYJuouxN
	 9aOaCjWPtN8ATPh88OqwcXN/jEluTJPU/G9A0IKoLrcdEeWCASWMVsGlAMdT+4rFqzNbp
	 kI8t8cEjzwY4mZhFGeNrLKuQBeL7H9DqYFHw1FsVP/8LOrpeLdm8DlHxaaV1ZeZBMyBPJ
	 9X0LQlw9l55oy7ISp5lGEdkEx3xtQY8NloZYT1zsV15Wd7DwXpJi3ALsYgccKFMDDTQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793861879;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:Organization:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=5BZi0ILo+b6FWXBhB/lYgeg36DZxQl6BshKo9X8ofw0=;
	b=aTF+geMxIYdtS7YmDM/0paafklHgiT0eIhbAe/T/7LiBZoDNQ93a0baDGm1AOiuAGd5i
	 wUXvmEVFvBAb6aDJLi8E5nShESQ4IwOCZh/6PhVUb1a4M7ak2DHJJ/SY77OOCR/nfjU8D
	 +GskLGccBb8DBIM9pTU4SOTCjOkwmwCNE74f0hhPt0JeI+BUI2eCIhW9C8pf/BGUyJbYF
	 fuSxx4WIPAGlE/Y3KYBGCEc7MArFolNFaZMK7fnVK2/H/1C6Y1ucpf+IyCWU70wt95zVG
	 lp0KUq02mhFIf95UPotlHo+1QvQ06PsaGaLEOQ61DjnJl0a4Oiw16CbtxLTIY3MFBQA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dLEJwiEA;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EN3o4u3Y;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E911F606A328
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 06:57:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E911F606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dLEJwiEA;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EN3o4u3Y
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A56USaC942456
	for <linux-kernel@vger.kernel.org>; Thu, 5 Nov 2026 06:57:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5BZi0ILo+b6FWXBhB/lYgeg36DZxQl6BshKo9X8ofw0=; b=dLEJwiEAWtXiOyOW
	WATmy9HqcwvykfKTiVhT8jDirAK0eciE1JCHYN7pYr33wblers2IZGemUctShEoM
	l9zxF7rXNGqCBCZBYcQ6povrfvrx3LWQfA+PPWtNVBeYOZzl/8VHHuaAjVCBT4xl
	SFPMw1+QkzD95Hy3W7WpZCKN1aI3WYHZ45xQl3rIk6WgTWc3KHmWCzcVYIanFjWm
	3XRGN+ZvsF9aMgZ+FelzwYrS/ycpV0cjLKuvLQ8sCl0gNX9GRk66Zmy7YdmMRHA7
	FCsJoy4HS3xbcpG36SW4tM2osN5zc+J7ZVKbl715Fb1NC2P/bWwB1CGpyeO8SpP9
	mHdl4w==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hr6bj3mq2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 06:57:57 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-36d1353fdcdso4568574eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 22:57:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793861877; x=1794466677; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :from:content-language:references:cc:to:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=5BZi0ILo+b6FWXBhB/lYgeg36DZxQl6BshKo9X8ofw0=;
        b=EN3o4u3YEOUPs1mawSa4WZRZey3IfK+V4LdnDA07pGL8s1xIqly6FzXbUNMF1QGAKx
         7iIvpGjIPwT0wEBd0P0tykjUwQH+JOpjPOoeTOKhTaYw5m7XnX+WVxlhb24fWLWfQX68
         eGsyx0teI6xs2H2K7EiDOb125JeJ5psNT+kR8YwYg+BAZ56Qk5/kWyklQJW93cTm6a3m
         oatySe4LfikVcm1KixW+RIu8OWqzYBrQKKYIVpQj68W1zX62iBteg6IPf8TgXG8jUzHI
         PRU/5aYcoFQld5chZBw1psqWqqKS+bKAj/ph0Tk6sayAAyoexR7j/USsIGAmOU8pfJYj
         WK4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793861877; x=1794466677;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :from:content-language:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=5BZi0ILo+b6FWXBhB/lYgeg36DZxQl6BshKo9X8ofw0=;
        b=bYgiuGdwQczsz3kBBgK0OQW0kRMqmtw/5MltwCV99tYjhvIdp8CTgUeO4D13G2UjTP
         y0R+KMRfq3ENPEacDNxssaY27wIOyHdBXFBLnLWDt4wETMrXsCUWI9R273a8nK5g9XzI
         uX6Yt2H74/U7KR5A/H3nb4qb7wL53Vfj+39+OV3rK5LclY67eMB5ub8A5yDRGQEmP24Q
         nT3wniP+wVU9kAAtNjBPLBvH0ofp4pp/YOORll5Qy4u0z8Lwj/9IfnY1hrKWhnL+nK6Z
         48QSw1PDQf9uWBFzSquD7Uoe9fadh7FFrFclinq3jttRsbw3o4m72JMwfEBau0PYfu41
         0LrA==
X-Forwarded-Encrypted: i=1; AKwUvByH5PdAflgJIn/1AnG33gr2QOwMk7zXnn8wYxcY1g3JKrBbYL72eo8JVxOEFTs7SMDqLM0AexY8IAH6AF4=@vger.kernel.org
X-Gm-Message-State: APuU4Z++mAO3pY6V+5RT6KRRRP3jRv3QzYItJhX26YdXKWC/HGBvDl+g
	3FZod7UD5sM1JFSMGa/HYU0mvrRzA1xIjaAqaqLKuJQiLMO44XF0d0jxq6+a3a5VStvPq52n70t
	99K4KNZGLPuGwIgIdfNexs3b2z0Nmrgv9A3HRH0nDwrSGLkFZs4ai3LHJ2rRrBEZThBY=
X-Gm-Gg: AYBFou2oLo9NLQIRwBJL1CcmmhzCy1wcKoqXgCvYIDFh45djJDUoYVaD+vu8lBqT/Et
	aD06rKB/90GufAGEhTE7S/h/l9ruLHaMe7/Z9dKq+tmPKfgtIdZ/bziEfEdMXeOyIfP9SD4zck6
	eLzA5cByp/kDPjdrtH9HA/uQNcdkXjOXckNqfklkP1buChbZmCI/SjmMPt8PI2iDn0jqDBurmlZ
	+Kyz7Kw/XDGfUwzZnxOKYmKPv8XjrSC4gSkERnouBdhwQb04/IfomThC2KLbb0QWhT0ZFIy33oM
	uxqEV/SKnBmcoaUCvxcqzTgoNehILcRGEt24YpGfNGlVrEfkg09WV+3K1YNIrE8+NtlKF3EqUhp
	0RpxXsJl7Jq+AEBBgW/93aEEa02pt581DD7yIYWYR7VlHhhDohCj7J1A/KrWy62QR/qZmJKVzzA
	==
X-Received: by 2002:a05:7301:6199:10b0:36c:a281:1bc with SMTP id 5a478bee46e88-36ca2810b86mr7310163eec.16.1793861876989;
        Wed, 04 Nov 2026 22:57:56 -0800 (PST)
X-Received: by 2002:a05:7301:6199:10b0:36c:a281:1bc with SMTP id 5a478bee46e88-36ca2810b86mr7310130eec.16.1793861876335;
        Wed, 04 Nov 2026 22:57:56 -0800 (PST)
Received: from [10.218.26.96] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca39972d4sm23912082eec.26.2026.11.04.22.57.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2026 22:57:55 -0800 (PST)
Message-ID: <114ddfe0-b593-4ba0-832d-67aba24d9b66@oss.qualcomm.com>
Date: Thu, 5 Nov 2026 12:27:50 +0530
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
To: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
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
 <af92dbae-701c-480c-b7c7-7bc7bf2e6fc9@oss.qualcomm.com>
Content-Language: en-US
From: Harshal Dev <harshal.dev@oss.qualcomm.com>
Organization: Qualcomm
In-Reply-To: <af92dbae-701c-480c-b7c7-7bc7bf2e6fc9@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDAyNyBTYWx0ZWRfX29EuhMa6kaky
 gJwwbfyeJw0qk9SwH5KK4L55AT1Uq9flKLfJCGQ5thdfXBNasS5tKLAwfYEaVl/9OtuKQkHUNiG
 FUDxHwMHBCHFmCEv+hhcALJO86QGy4L3pELoyTw+RAfIfTgvvmlN3+uYn+ZVy9Jy219cP6BX/kv
 BFo27te30kR5rWaZGrsbbOTDMR2n5jeSv5UPtVp82uLPugS0u2XMW7eBLeT+JlvUnZZ3bubgxXN
 YNHd8dnorJhItp+txu7c6deI/XhDx5qED0hO/GIsnthrQ2O+I48Ys20+9CZQihy1Tz4Da2OAtDS
 788iXRoSjvyY6cR28FRHx8zx++K0G7YErNElUT7gzq7ZBlkqk/MVG9cjYPOTc26Cq80OmGtVUkz
 iym1QbzSKpTs6nHe9wxvJMzE4uHhbF6CtL/1tOlLboPqrrYPsOBZernBIoxnIDPg3/EUn5u4Y3c
 Xq/FoYJ4Z6vTYZOyBtA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDAyNyBTYWx0ZWRfXzLl9x1WyVtSi
 WHyG6Q75TpBw7A88+BNnTZnYVoYLelBmgYYgMdPD0I3ydAa944DbALUmpb86/FX2yHci9Lo4FHt
 ox6Kr7fiOQvfAU1wwCJ7oEDMceUhwcw=
X-Proofpoint-ORIG-GUID: JYLfGaTCXUG_lpEtFJYfBvY2XT4buYQV
X-Proofpoint-GUID: JYLfGaTCXUG_lpEtFJYfBvY2XT4buYQV
X-Authority-Analysis: v=2.4 cv=N/u8hG9B c=1 sm=1 tr=0 ts=6aec28f6 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=P-IC7800AAAA:8 a=dw0t6H4-AAAA:8 a=EUspDBNiAAAA:8 a=6SEQs-14KVBVJn2B1ksA:9
 a=QEXdDO2ut3YA:10 a=scEy_gLbYbu1JhEsrz4S:22 a=d3PnA9EDa4IxuAV0gXij:22
 a=wVJa4CU9-Z26yuRAZDil:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_02,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0
 malwarescore=0 priorityscore=1501 phishscore=0 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611050027

Hi Amir,

On 05-11-2026 11:24 am, Amirreza Zarrabi wrote:
> Hi Harshal,
> 
> On 11/3/2026 7:35 PM, Harshal Dev wrote:
>> Hi Amir,
>>
>> On 26-10-2026 10:14 am, Amirreza Zarrabi wrote:
>>> Hi Harshal,
>>>
>>> On 10/15/2026 10:39 PM, Harshal Dev wrote:
>>>> On Qualcomm SoC based platforms, UEFI stores EFI variables within the
>>>> Replay Protected Memory Block (RPMB) located within either the UFS,
>>>> eMMC or SPI-NOR storage. The RPMB key which is one-time programmed into
>>>> the storage controller to allow authentication of the RPMB frames is
>>>> generated by and only available to the Qualcomm Trusted Execution
>>>> Environment (QTEE).
>>>>
>>>> The legacy QSEECOM protocol used for communicating with the QTEE is
>>>> deprecated and replaced with the use-case agnostic SMCInvoke protocol
>>>> starting with the Qualcomm SM8x50 series. On platforms where the QSEECOM
>>>> driver still probes, it does not support a listener interface with QTEE
>>>> to enable writing of non-volatile EFI variables to the RPMB for UFS and
>>>> eMMC storage.
>>>> Therefore on such platforms, a TEE client driver which communicates with
>>>> QTEE via the SMCInvoke protocol implemented by the QCOMTEE driver (and
>>>> registered with the TEE subsystem) must be used to update such EFI
>>>> variables.
>>>>
>>>> Add support for a TEE based uefisecapp client driver which installs efivar
>>>> operations after obtaining an object reference to the uefisecapp service.
>>>> This enables the kernel/user-space to access or modify both volatile EFI
>>>> variables stored by the Secure Application (in-memory) and non-volatile
>>>> ones stored within RPMB.
>>>>
>>>> Signed-off-by: Harshal Dev <harshal.dev@oss.qualcomm.com>
>>>> ---
>>>>  MAINTAINERS                                 |   6 +
>>>>  drivers/firmware/qcom/Kconfig               |  31 ++
>>>>  drivers/firmware/qcom/Makefile              |   1 +
>>>>  drivers/firmware/qcom/qcom_tee_uefisecapp.c | 644 ++++++++++++++++++++++++++++
>>>>  4 files changed, 682 insertions(+)
>>>>
>>
>> [...]
>>
>>>> diff --git a/drivers/firmware/qcom/qcom_tee_uefisecapp.c b/drivers/firmware/qcom/qcom_tee_uefisecapp.c
>>>> new file mode 100644
>>>> index 000000000000..bcd025f929fc
>>>> --- /dev/null
>>>> +++ b/drivers/firmware/qcom/qcom_tee_uefisecapp.c
>>>> @@ -0,0 +1,644 @@
>>>> +// SPDX-License-Identifier: GPL-2.0-only
>>>> +/*
>>>> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
>>>> + */
>>>> +
>>>> +#include <linux/efi.h>
>>>> +#include <linux/tee.h>
>>>> +#include <linux/tee_drv.h>
>>>> +#include <linux/ucs2_string.h>
>>
>> [...]
>>
>>>> +
>>>> +static efi_status_t qcomtee_uefi_get_variable(efi_char16_t *name, efi_guid_t *guid,
>>>> +					      u32 *attr, unsigned long *data_size,
>>>> +					      void *data)
>>>> +{
>>>> +	int ret;
>>>> +	u32 in_attr, out_attributes, out_errno;
>>>> +	struct tee_param_ubuf in_data, in_var, in_attributes;
>>>> +
>>>> +	if (!name || !guid)
>>>> +		return EFI_INVALID_PARAMETER;
>>>> +
>>>> +	/*
>>>> +	 * 'attr' can be NULL, however an input attribute is always expected
>>>> +	 * by UefiSecApp TA
>>>> +	 */
>>>
>>> You are enforceing a poliy on the arguments of a cb which is called publicly, are you
>>> sure all callers understand that this output value is optional? it is not specified
>>> anywhere as far as I can see. This seesm to be a TA thing.
>>>
>>
>> I think the way this comment is written is a bit misleading. The comment is not about
>> the output value of attr, it is about the input value passed to this callback.
>>
>> The callers of this callback either pass a NULL value for attribute or a valid value.
>> When they pass NULL, they ignore the output since it's expected to not be set by the
>> implementation: https://elixir.bootlin.com/linux/v7.3/source/fs/efivarfs/vars.c#L505
>>
>> When they pass a valid value, they expect a valid output in return and operate on it:
>> https://elixir.bootlin.com/linux/v7.3/source/fs/efivarfs/file.c#L108
>> https://elixir.bootlin.com/linux/v7.3/source/fs/efivarfs/vars.c#L531
>> So the value is not optional, it is set or not set as per the expectation of the
>> caller. 
>>  
>>>> +	in_attr = 0;
>>
>> However, the SMCInvoke transport here needs this to not be NULL, and so we force
>> set a 0 here which is interpreted corrected by the TA as attribute not set.
>>
>> I will re-phrase this comment to avoid ambiguity.
>>
> 
> I do not believe it is comment issue. I understand attr is an optional output value
> which could be NULL. However, this implementation also uses attr as input. 
> 
> In your provided link:
> https://elixir.bootlin.com/linux/v7.3/source/fs/efivarfs/file.c#L108
> attr that passed to this function is from stack and uninitialized, so the
> TA will get garbage in in_attr based on bellow code. It this acceptable?
>

Yes, this is acceptable. As per the specification the implementation of this API does
not care whether the pointer points to a valid value or garbage because the pointer
is used to populated the output and any garbage pointed by the pointer is ignored.
If the pointer is not NULL, then as per the spec an output value must be returned 
which populates the pointed memory with an attr bitmask, please see:
https://uefi.org/specs/UEFI/2.10/08_Services_Runtime_Services.html#getvariable

The TA implementation also aligns with this expectation. 

Theoretically, if the TA were to consume the value passed here, it should anyway
sanitize and check the input. 
> 
>>>> +	if (attr)
>>>> +		in_attr = *attr;
>>>> +
>>>> +	in_data = (struct tee_param_ubuf){ .addr = data, *data_size };
>>>> +	in_var = (struct tee_param_ubuf){ .addr = name,
>>>> +					  (ucs2_strlen(name) + 1) * sizeof(*name) };
>>>> +	in_attributes = (struct tee_param_ubuf){ .addr = &in_attr, sizeof(u32) };
>>>> +
>>>> +	/* On SUCCESS, 'data' member of 'in_data' has already been updated. */
>>>> +	ret = qcuefi_get_variable(in_var, guid, in_attributes, &in_data,
>>>> +				  &out_attributes, &out_errno);
>>>> +
>>>> +	if (ret)
>>>> +		return EFI_DEVICE_ERROR;
>>>> +
>>>> +	if (!out_errno || out_errno == QCOMTEE_UEFI_SEC_ERROR_SIZE_OUT) {
>>>> +		/* If 'attr' is NULL 'out_attributes' is not updated. */
>>>> +		if (attr)
>>>> +			*attr = out_attributes;
>>>> +
>>>> +		*data_size = in_data.size;
>>>> +	}
>>>> +
>>>> +	return uefisecapp_err_to_efi_status(out_errno);
>>>> +}
>>>> +
>>
>> [...]
>>
>>>> +
>>>> +static const struct efivar_operations qcom_efivar_ops = {
>>>> +	.get_variable = qcomtee_uefi_get_variable,
>>>> +	.set_variable = qcomtee_uefi_set_variable,
>>>
>>> Not sure how much it is relevant, but I was looking into the efi and in
>>> efivar_set_variable_locked, saw this comment "If no _nonblocking variant exists,
>>> the ordinary one is assumed to be non-blocking." which in not the case fo us.
>>>
>>> Does it make sense to introduce something like
>>> qcomtee_uefi_set_variable_nonblocking and return UNSUPPORTED!?
>>>
>>
>> Ack, this ensures that if a caller expects the set_variable() to land in a
>> non-blocking call, they get returned -ENOTSUPPORTED instead of being misled.
>> As far as I can see only the x86 pstore implementation explicitly requests
>> a call into a non-blocking variant:
>> https://elixir.bootlin.com/linux/v7.3/source/drivers/firmware/efi/efi-pstore.c#L227
>>  
>>>> +	.get_next_variable = qcomtee_uefi_get_next_variable,
>>>> +	.query_variable_info = qcomtee_uefi_query_variable_info,
>>>> +};
>>>> +
>>>> +static int qcomtee_ctx_match(struct tee_ioctl_version_data *ver,
>>>> +			     const void *data)
>>>> +{
>>>> +	return (ver->impl_id == TEE_IMPL_ID_QTEE);
>>>> +}
>>>> +
>>>> +static int qcomtee_uefisecapp_probe(struct tee_client_device *tee_dev)
>>>> +{
>>>> +	int ret, err;
>>>> +	struct tee_param_objref client_env_obj;
>>>> +	struct tee_param_objref uefisec_svc_obj;
>>>> +
>>>> +	uefisec_app.dev = &tee_dev->dev;
>>>> +	/* Open context with QCOMTEE driver */
>>>> +	uefisec_app.ctx = tee_client_open_context(NULL, qcomtee_ctx_match, NULL,
>>>> +						  NULL);
>>>> +	if (IS_ERR(uefisec_app.ctx))
>>>> +		return -ENODEV;
>>>> +
>>>> +	ret = qcomtee_get_client_env_obj(uefisec_app.ctx, &client_env_obj);
>>>> +	if (ret) {
>>>> +		err = -EINVAL;
>>>> +		goto err_get_client_env;
>>>> +	}
>>>> +
>>>> +	ret = qcomtee_get_uefisec_svc_obj(uefisec_app.ctx, client_env_obj,
>>>> +					  &uefisec_svc_obj);
>>>> +	if (ret) {
>>>> +		err = -EINVAL;
>>>> +		goto err_get_uefisec_svc;
>>>> +	}
>>>> +	uefisec_app.uefisec_svc_obj = uefisec_svc_obj;
>>>> +
>>>> +	ret = efivars_register(&uefisec_app.efivars, &qcom_efivar_ops);
>>>> +	if (ret) {
>>>> +		err = ret;
>>>> +		goto err_efi_vars_reg;
>>>> +	}
>>>> +
>>>> +	/*
>>>> +	 * We don't need to keep a reference to this object anymore, we only
>>>> +	 * needed it to obtain the uefisec_svc object.
>>>> +	 */
>>>> +	qcomtee_release_object(uefisec_app.ctx, client_env_obj);
>>>> +	return 0;
>>>> +
>>>> +err_efi_vars_reg:
>>>> +	qcomtee_release_object(uefisec_app.ctx, uefisec_svc_obj);
>>>> +err_get_uefisec_svc:
>>>> +	qcomtee_release_object(uefisec_app.ctx, client_env_obj);
>>>> +err_get_client_env:
>>>> +	tee_client_close_context(uefisec_app.ctx);
>>>> +
>>>> +	return err;
>>>> +}
>>>> +
>>>> +static void qcomtee_uefisecapp_remove(struct tee_client_device *tee_dev)
>>>> +{
>>>> +	efivars_unregister(&uefisec_app.efivars);
>>>
>>> I still have concerns about the removal path. efivars_unregister() acquires the
>>> semaphore interruptibly and can return -EINTR, for example when a signal arrives while
>>> it waits for an active EFI operation. Its return value is ignored here, so removal can
>>> release the service object and close the TEE context while the EFI provider remains registered.
>>>
>>
>> This is a valid point. But it seems like no easy solution exists here. The driver core
>> doesn't check the value being returned from remove(), so it will always detach the driver from
>> the device.
>>
>> Currently when -EINTR is returned, the driver is removed but __efivar->ops remain set, so a
>> subsequent call to __efivars->ops would cause a kernel panic/crash. If we check for error here
>> and return without releasing the service object/TEE context, we still have the same issues but
>> now also a leak; QTEE's object table still has the service object and the TEE context remains
>> allocated (while the driver is removed and __efivars->ops remain set to a random pointers).
>>
>> Everyone else is also suffering the same race:
>> https://elixir.bootlin.com/linux/v7.3/source/drivers/firmware/efi/stmm/tee_stmm_efi.c#L518
>> https://elixir.bootlin.com/linux/v7.3/source/drivers/firmware/qcom/qcom_qseecom_uefisecapp.c#L842
>> https://elixir.bootlin.com/linux/v7.3/source/drivers/firmware/google/gsmi.c#L1075
>>
>> This is a framework level issue, where a fail-safe fix is to use down() instead of down_interruptible()
>> in efivar_unregister() and pray that whoever is invoking the callback comes out soon. But at
>> least it replaces a sure-shot kernel panic with a low probability deadlock which can be
>> diagnosed.
>>
>> I thought about other ways, like using try_module_get() from either the callbacks or the
>> efivar_register/unregister(), but neither solve this.
>> I can try initiating a discussion on this separately on the efivar mailing list, unless there
>> are any other innovative suggestions for solving it from within the driver. :)
>>
>> Let me know your thoughts.
>>
>>> Separately, efivar_lock() appears to have an existing bug: it checks __efivars->ops
>>> without first checking whether __efivars is NULL. Successful unregister sets that pointer to NULL,
>>> so subsequent access through an existing efivarfs can dereference NULL.
>>> I Feel, that needs an EFI-core fix as well. what do you think?
>>>
>>
>> Ack, this is true and a fix is straightforward. I will send a patch separately if someone hasn't
>> already sent one.
>>
>> Regards,
>> Harshal
>>  
> 
> Yeah, you are right. Let's ignore it for now.
>

Ack, I will respond here with the sent fixes along with v6 of this series.

Regards,
Harshal 
> Best Regards,
> Amir
> 
>>>
>>> - Amir
>>>
> 

