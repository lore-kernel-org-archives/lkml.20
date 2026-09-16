Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D92542E41D
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 21:16:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789593431; cv=none; b=TJgqlPzrdwPXR+kKb8oQWlZyqYzpGfGopJ+pEjJSnQPpATRraSIIRLtb2reM5f2BXDi3K+msa9q48jCDoIcCoakzDTwVGrUb9NTxWup4QVcpJ4qbsvWcevVpXcJm2wOlvdIrAwSLMpQr+uzhfpu06vkfQeI1uCDivwJoLyUL6lQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789593431; c=relaxed/simple;
	bh=NXDeynE+4VTMCJQ1nw8qyw1rHsMURFTSCpVFmSmMAes=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lVlFo+bUcuSn9FiKJYIo4gfq1whvhEmSfYfMdDNkesJfmHL92ZOeVp/aBNXjWTwkNYLiV8K735EM32OsAgtI2oP1TJ3Vn/e63Qnn3Y2yq6+zXDdQpQsaVGoCwJQZ763KIVJ47phyIzdeg3PmpNcspYHUxFmHgQXLiabt0KLEFqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GGyK/0zH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=URrFwEsu; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GGyK/0zH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="URrFwEsu"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68GH6YsI3559773
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 21:16:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bJ5ikrelPOxZxaf5C/PtGjFWO0wzJsRg+Use1Q/ipvM=; b=GGyK/0zHNxSER+y2
	LaQiDgbRKmox1nWm6jaUokUYLQp7Wle7RA2P9+sEAt0iAnLMR/5HNtMUZVIXqAC9
	gxpBU2pYo437aMdnbYROqvsqeFmXRBpcwYO9tKgCY4vwuYPDTEVLWvypG+CDihoz
	OQnrWld7Q9ZTRb8uiXz5DsDm61iz+vtuoi6Hcu3KUTBCBkEp00qO90XSl4YnHIah
	4cD0QOf86qmD3vibijpIY8nYM5wqP/9sEeCQ4UEtV+Ayqm7lvWv91/fCA9bSchKC
	r5VSz8aurAUmSVofu7dpEpGm6C04jj6YrSJldOGTNpcdkU8Dwq26FGPJ4u42rzZU
	zTd7tg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqy7h8yw9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 21:16:37 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-396901263b6so218201a91.2
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 14:16:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789593396; x=1790198196; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bJ5ikrelPOxZxaf5C/PtGjFWO0wzJsRg+Use1Q/ipvM=;
        b=URrFwEsulBdImvRI87pEAn3o8xUUZdidtIhIZ2nqph/IBEDXzjEqPZtYjwDJNjCcWh
         PPiVnWluxyT9rHVIuC9sivFsHr7XXoM7NjJwA4ck0ccqPENzxWNzzXcXTachC6ih4ohW
         IUazFpRktcxiMTInt2ktGH7UR7ngYgP8Ek7XMsm09y/MX5aZlNPGRILljjx5a/OSl53s
         y/dn4q+nx4Zjuw8m6VYZPI/6bnbMDtLOcz95Sx/b8UCULXP6xtRRIaYIVhEJfHyhTLhH
         umsqTyCf5f3/i14kViPVpwYt6D5wnTgVN4U09Lptk6LBqZA/A0ZQSaB+KSntAPxRmzfr
         8QnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789593396; x=1790198196;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bJ5ikrelPOxZxaf5C/PtGjFWO0wzJsRg+Use1Q/ipvM=;
        b=Y7ZsJFceS8fzTpj7fzxB1vEjXB5TgkDvF3tHopHwhtgPtuGFSnUFElo4lDey97KmMT
         CyBwliCuGzahzMFmtx41SEQxDCUh5z2E6/rCBX6uAzehLBwrtNFvzO3Gre1e4ttRCAWY
         qk3u0EgXKkkeOQpRfqn953Exa0bZlMooMao/btBwno1orAXDM9o/P51X8rilOzhDS1jB
         6tno1R9Sj/nfDfyg52viyaR0CyqkaPvwI8b1SCSkl42PC3UlVjkW242B4pW3xUI6VzAK
         lZX5RxkJ63kFkD6EF9Qnwr0hAwYEx7zvuVIqD1nUJXjO+RPfuoSewVCuROTKwjOA0+UX
         yNsg==
X-Forwarded-Encrypted: i=1; AKwUvBzeIlgqretJNx8zebBecbrhCG/HhtPmONliUFbDXtcsqmIDxdv5Q8FmQuRlwEqLoh0ZFudnlHujkQ0T9Vk=@vger.kernel.org
X-Gm-Message-State: AFuF++mTy/vLE2xEUTWkYz+aVzlUQ0H+tSnKcN01VT1Vxa5xnZelmyPU
	W8n0qIPXESWzarAZBOY5Ncg0bHtld1Saql3R4DexpNnJRJPxwCXxEJJ0uP1DcXjZ4p3NEO1eIkf
	Lt4tNEpi5I24Otohn6Rm81IDjRCKT31R82EuImiomgqLCjlrGXs0jTF4dedgbAQYR6w==
X-Gm-Gg: AYBFou3g0BG10a3l8v+sAxSiOgwRH3sYxmmPxC5gwWx+vWGkxS6mnnOsOJA+JhftH0s
	CWTpsHaAMsg1k97u0pYgV8ESQ1R0T6l8hheElDSmgMeV2D7lf5DdvCkf/S7ZI8LqPy069N0tHE0
	UHugd/x6YAkh3HoOgfeYdwHlz6k51WP9+v5R3FZm5gYzlfmV733cz6sPq5QhRNIF6+JnpQWSFdc
	2IXczylMsh9MQvzCAuNghBk+UAb1nwxKEGZLqU50WHq2HNK6Qv8RHhczm0MdaEIZYfGEWFYxja2
	i+bsjK1HAbkaXygCfY7yajQfbecboVEU/wlC/FXIViscQTC41t6/vGHgsYKvp7hcSli1ZxfCnnW
	wM0eZtRsfoHv5uZf0Wmxtrfu6lZjGYGak
X-Received: by 2002:a17:90b:1811:b0:39d:e54c:8658 with SMTP id 98e67ed59e1d1-39e1e250230mr11033535a91.5.1789593396056;
        Wed, 16 Sep 2026 14:16:36 -0700 (PDT)
X-Received: by 2002:a17:90b:1811:b0:39d:e54c:8658 with SMTP id 98e67ed59e1d1-39e1e250230mr11033403a91.5.1789593395476;
        Wed, 16 Sep 2026 14:16:35 -0700 (PDT)
Received: from [192.168.1.86] ([65.181.15.100])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e35e532e4sm1147947a91.10.2026.09.16.14.16.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Sep 2026 14:16:34 -0700 (PDT)
Message-ID: <d7ba3e45-84fa-409d-bd43-23caa05587de@oss.qualcomm.com>
Date: Thu, 17 Sep 2026 07:16:27 +1000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 5/5] dt-bindings: tee: add RISC-V RPMI TEE transport
To: Anup Patel <anup@brainfault.org>
Cc: Jens Wiklander <jenswi@kernel.org>, Sumit Garg <sumit.garg@kernel.org>,
        Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
        Rahul Pathak <rahul@summations.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, op-tee@lists.trustedfirmware.org,
        linux-riscv@lists.infradead.org, devicetree@vger.kernel.org
References: <20260912-rpmi-tee-service-grp-dev-v1-0-1d1d35c2a859@oss.qualcomm.com>
 <20260912-rpmi-tee-service-grp-dev-v1-5-1d1d35c2a859@oss.qualcomm.com>
 <CAAhSdy3Or_uDWuQniUGguc9AwL8smF6XHhJ0kizFOJKJ0N+9OA@mail.gmail.com>
Content-Language: en-US
From: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
In-Reply-To: <CAAhSdy3Or_uDWuQniUGguc9AwL8smF6XHhJ0kizFOJKJ0N+9OA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDI5NiBTYWx0ZWRfXwQ43XIZ9yf5s
 OQZeynhuVm9uVUTlE3hJC+pyb6sDTZOfGo1xsCh0QN/P6OYwC2GLTS2JBG0CMt97pHKG88j6/7H
 To9hHRdASu6H88fxOOELTIotd1KSka52uFNEBCdK2A60jCVY6A6qQMdUmGqRQff4IQzSXtzS0gK
 11QXGs4UJrQM9V5f0EKASr6TjrWWbrJl//49R+87xBMOpuSvFtejiaItXM7h7mMqbfzkLECEQEG
 3RuyRR65CVxxoe4u5KL/skUdnX1jX2D7eRqHSDtbSj2Ot+zEXyp1X4YMzPjZOH9Q7LYXyN7WJvQ
 Emjfo9YwqinjlNzwE29gGX0xx0Rf6ZwevFdgxt/sbM53x4Fb8VYyL9rIEJIBXKnppmchU3Z7VpA
 XT90ftooUk2h963WqLBmBWi98wCoXJRnDJOKGiruhMAwjHnb8G7yGb/sFJVS9jeXxJF84QgL8J5
 nxEfjsJziHa5RE0NuuQ==
X-Authority-Analysis: v=2.4 cv=L8aI0OT8 c=1 sm=1 tr=0 ts=6aab0735 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=RYJI0oIToGyOemi2SthaJQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=gEfo2CItAAAA:8 a=V1jnuoLLAAAA:20 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8
 a=b45o4kL6AAAA:8 a=oSFF6Vc5-LCmsOG0wpkA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22 a=sptkURWiP4Gy88Gu7hUp:22 a=dhdsR-PFWuPJUldTnwXm:22
 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-GUID: IeKolzUbe3MeKD8sQyqqNwy4DZEVEAWV
X-Proofpoint-ORIG-GUID: IeKolzUbe3MeKD8sQyqqNwy4DZEVEAWV
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDI5NiBTYWx0ZWRfX7Iwe7ALLPgxP
 lXc30LDx+b06Xo6+qVNW48dDcw7+hjxXIW5c3YGoH2Px/IJQAjJUnl13YvxV1MqxfUC28NcDhcw
 KDyrRFZjwIKKTbGaU/+Pk0TKjnTZbOs=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-16_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 spamscore=0 phishscore=0 bulkscore=0
 clxscore=1015 suspectscore=0 adultscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609160296

Hi Anup,

On 9/16/2026 8:12 PM, Anup Patel wrote:
> On Sat, Sep 12, 2026 at 3:45 PM Amirreza Zarrabi
> <amirreza.zarrabi@oss.qualcomm.com> wrote:
>>
>> Add a device-tree binding for the OP-TEE RISC-V transport using the RPMI
>> TEE service group over SBI MPXY.
>>
>> Describe one mailbox channel per hart and an optional interrupt used as
>> the availability doorbell for asynchronous notifications.
>>
>> Add the binding to the existing OP-TEE MAINTAINERS entry.
>>
>> Signed-off-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
>> ---
>>  .../bindings/tee/riscv,rpmi-mpxy-tee.yaml          | 65 ++++++++++++++++++++++
>>  MAINTAINERS                                        |  1 +
>>  2 files changed, 66 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/tee/riscv,rpmi-mpxy-tee.yaml b/Documentation/devicetree/bindings/tee/riscv,rpmi-mpxy-tee.yaml
>> new file mode 100644
>> index 000000000000..8f6ff313fd42
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/tee/riscv,rpmi-mpxy-tee.yaml
>> @@ -0,0 +1,65 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +# Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/tee/riscv,rpmi-mpxy-tee.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: RISC-V RPMI TEE service group based message proxy
>> +
>> +maintainers:
>> +  - Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
>> +
>> +description: |
>> +  The RISC-V Platform Management Interface (RPMI) [1] defines a messaging
>> +  protocol which is modular and extensible. The supervisor software can
>> +  send/receive RPMI messages via the SBI MPXY extension [2] or some dedicated
>> +  supervisor-mode RPMI transport.
>> +
>> +  The RPMI specification [1] defines a TEE service group which is the RISC-V
>> +  analog of Arm FF-A: OP-TEE and the rich execution environment (REE, i.e.
>> +  Linux) are peer endpoints and the RPMI framework (machine mode firmware)
>> +  mediates every message. Entering OP-TEE on a hart runs it on that hart until
>> +  it responds, so the SBI implementation provides one SBI MPXY channel per
>> +  hart; all of them are listed, in hart order, on a single node.
>> +
>> +  ===========================================
>> +  References
>> +  ===========================================
>> +
>> +  [1] RISC-V Platform Management Interface (RPMI) v1.0 (or higher)
>> +      https://github.com/riscv-non-isa/riscv-rpmi/releases
>> +
>> +  [2] RISC-V Supervisor Binary Interface (SBI) v3.0 (or higher)
>> +      https://github.com/riscv-non-isa/riscv-sbi-doc/releases
>> +
>> +properties:
>> +  compatible:
>> +    const: riscv,rpmi-mpxy-tee
>> +
>> +  mboxes:
>> +    minItems: 1
>> +    description:
>> +      One SBI MPXY channel implementing the RPMI TEE service group per hart,
>> +      listed in the same order as the CPU nodes.
> 
> I am not sure why you need separate MPXY channel per hart. The MPXY shared
> memory is already per-hart whereas the MPXY channel will be doman specific
> for TEE.

True. My reasoning was that TEE_CALL, as I understand it, is expected to execute on
the same hart that issued it. Given that, the mailbox core holds the per-channel spinlock
across the call to `send_data()`, while the underlying `sbi_ecall()` is synchronous
and does not return until the TEE call completes.

So, if two harts shared the same channel, a hart executing a long-running TEE operation
would hold that channel's lock for the duration of the call, and another hart
trying to enqueue on the same channel would spin waiting for it.

Using per-hart channels avoids that cross-hart contention. I agree that this may
not be the right layer in which to address the issue. I did not pull it to the discussion in to this RFC.
I'm happy to use single channel for now and follow up on it separately if useful.

> 
> Also, for this binding refererring to only mailbox channel is
> sufficient. The underlying
> mechanism to send RPMI messages is abstracted away by the mailbox controller
> driver.

Ack.

Best regards,
Amir

> 
>> +
>> +  interrupts:
>> +    maxItems: 1
>> +    description:
>> +      Availability doorbell raised by OP-TEE to signal asynchronous
>> +      notifications over the RPMI TEE signal bus. Optional; when absent
>> +      asynchronous notification is disabled.
>> +
>> +required:
>> +  - compatible
>> +  - mboxes
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    tee {
>> +        compatible = "riscv,rpmi-mpxy-tee";
> 
> This must be "riscv,rpmi-tee" based on above comments.
> 
>> +        mboxes = <&mpxy_mbox 0x10 0x0>, <&mpxy_mbox 0x11 0x0>;
> 
> Like mentioned above, only one mailbox channel is sufficient.
> 
>> +    };
>> +...
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index 207a6e2db70c..7d0e550085b2 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -20577,6 +20577,7 @@ M:      Jens Wiklander <jenswi@kernel.org>
>>  L:     op-tee@lists.trustedfirmware.org (moderated for non-subscribers)
>>  S:     Maintained
>>  F:     Documentation/ABI/testing/sysfs-bus-optee-devices
>> +F:     Documentation/devicetree/bindings/tee/riscv,rpmi-mpxy-tee.yaml
>>  F:     drivers/tee/optee/
>>
>>  OP-TEE RANDOM NUMBER GENERATOR (RNG) DRIVER
>>
>> --
>> 2.34.1
>>
> 
> Regards,
> Anup

