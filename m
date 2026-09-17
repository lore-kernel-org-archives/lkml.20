Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60DAD3DD86A
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 19:19:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789672769; cv=none; b=lN8E6GFJfQFWcxSv31BALsYZq216UuVR6lPYeWazLQZ5oFPGpmx/B8H80OIao14PTVm6MAEJhbnaT/0cEonSXTHILYalTIVRIGZDVO65aWbj1OA63zVXLATc4uHI5WoRImzOYQIJwKpyiWk+oi1a9nHFAjmiWEckWCfKAM9TtWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789672769; c=relaxed/simple;
	bh=ESL5IjDTuxlb2JiE94IUunPmakxj8cGwIC0Vr4t4QMA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tWFFlaS7/4Z9IJMifMnFNeJP6ui+hhFAqlVny+j3yN6OZ4i1+f/rBKvOjY4cdT58KiD8ab13zpmstdiljZZj1C9i3L7Hk3v3q1u5zDx9khLe/vEoFy8LzeSsCHAfD3e8t1EwUXhTsKZQy5b5+2WCAdSPDf4YJgYg6u3RZ2fTPYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Gg1dBU/U; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KdW7LWRl; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Gg1dBU/U";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KdW7LWRl"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68HH5kZJ2728664
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 19:19:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QuxVL5v35fCI4IDOIYjgw6aBb4lWvxLcOgjhSBm3cvQ=; b=Gg1dBU/UgIrQlyOk
	RB7mM6wl7+MRMoiyeZHFRhxqOHR4lVd3MH993bH4jjs5sP1iBLaO/H4lFbl6++WK
	JROglw1qFdhG597l18dJ1sKBwkIqLCRyvtuhk50AacgjuG9yT+0VRjYF8TwKFii8
	3Ty5qgOpRnDyUgQbwAm9t1m8lYoJESsFSWBZP85LM2fYfvJ9Ymxni31qlH/Y0nsQ
	qaUgDazSh1ioO1KNct6Vk0Fl2Sl7Z2eXsVq28OPr6yozaAgpszIpxGhgryw1TTZ8
	TQy17VblJH69UrKVeHrvVpcmIGjcvnr949TsF2f538kj0zEoveAG4I4YhYBjcSml
	voNgmw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grfppj4t3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 19:19:25 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2db8e9fe9c7so114505ad.0
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 12:19:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789672765; x=1790277565; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QuxVL5v35fCI4IDOIYjgw6aBb4lWvxLcOgjhSBm3cvQ=;
        b=KdW7LWRlLueZRcBwWqp9VfkkMHiB6PuNVXPhrdYj8jxGl6Ucsu9YdGZK5ac9UHP2JZ
         Eza/TJ2ILeTDVbIqomn+xsaC9fuH5TqboZY31s/T/+ZMgi1GyJ4wBukCXJqIUiFUARgY
         yAOfAcdm6nEk+WYYX1Ysi6GKyZTpE7aFzo7qwGy5vUe5ekh/c3xX84tzkkeM4s800BIe
         ++pURgEgxDp9STZSJTYy2Y4RrxXlYFoykH+Q5XvIujpjnvploPlXmdxYbXQc+yLaFy3r
         BHZBLoHYvC4mxiErdOD6IQvYVLg7fPHRPit7VhqoNV32VoFOqY5U+ZmlAvUCUty7/yYg
         +JTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789672765; x=1790277565;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QuxVL5v35fCI4IDOIYjgw6aBb4lWvxLcOgjhSBm3cvQ=;
        b=upkoAT1kzCGvooHFw3CBgirBctWTVwtMkSDDA8gUosrBIWsD8ncGXfnRFrsTXGaSnE
         VSYxfTBOcVypTnXyQvjgfAyn0tUhbfdglrqKEc2FICnNw64JEJbBVzejv3dQKTpPhoUR
         WKkNvQNRwuiJFfKi/KJHD7AHh3SvUjHa7MPpEwYaIreSQf/7kMXYcufZTHojHgh/u/eb
         d9fKGRzfNoqLdyJI3sNz9apdEeRTVTJJA6EEd3Qj1v6gltnB2CKUnCWMGVMpXvjLa31L
         FLJu0rdUBpZGJfjlpPUw5gcIJUWicK2UhnkiGGgsnxscMgDlrNJ7fYyeKNXw9WTG0juD
         AkAg==
X-Forwarded-Encrypted: i=1; AKwUvByoyScAkXPZ7y3d2C+abuM1YEDu2cwZuOBAxjREQjgVZrjKNxBSSoTLwbsjAc1JpEwkTcx+721tD8ix+vo=@vger.kernel.org
X-Gm-Message-State: AFuF++mVbHl9u2rQvqxL055rjvqmy9wsQmCS3IQVxha0mrS1NMzlTfOr
	i8Q4KvBfm77AJZxl8aSUigcDiUe2uXABPo7Wuj+4oZp5LJtGOO246n7bV74i2MpiLzsQN8b+j51
	qz4WIdJ2hT1Uv8gOBhQvtdyMMVzbqnG8PzYnXzlxqvoD9ItpnMwke2tQaSU7lexTtvQ==
X-Gm-Gg: AYBFou0aWA5l/DMneu4IPemDvuB9jRnDeCw6F8arYHHCsvQC984n7GQVanx8CM6EKE6
	fnzz0Xatk2AHN1EpOgjVhspU0oXrLLaMjGlvo/7Dic/QxqtVvyfdti2aC4hJEDXEZLOLHYa5tYw
	3S539p1YGeS+tNTISRM0qKA21YYnU25js4ih6cU19YhyXaUGV/4KA15kcIyLeOVnizqerLl5fRX
	f47oECBIK23H8qnbioZ33KmjGIUSfmTs0yrwM5lixNxfLevjOCdRjWl/SokYRxLzZlcAAogtOyg
	VdPeMREPXcGu5Gu0R4viYPl3URMzHYbwwBUPbnk9hlkQbnH94iyBm74ru/cvk/M3RCWBUHX/Cbu
	n/EVHNJopChJReWfTiA4lu8ioKkRIP7+X
X-Received: by 2002:a17:90b:4484:b0:39d:f97c:bb2f with SMTP id 98e67ed59e1d1-39e54b66cf5mr429890a91.3.1789672764590;
        Thu, 17 Sep 2026 12:19:24 -0700 (PDT)
X-Received: by 2002:a17:90b:4484:b0:39d:f97c:bb2f with SMTP id 98e67ed59e1d1-39e54b66cf5mr429836a91.3.1789672764046;
        Thu, 17 Sep 2026 12:19:24 -0700 (PDT)
Received: from [192.168.1.86] ([206.83.114.48])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e5547a04dsm40272a91.3.2026.09.17.12.19.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Sep 2026 12:19:22 -0700 (PDT)
Message-ID: <4da526fc-f763-4f8b-8b33-362177aec889@oss.qualcomm.com>
Date: Fri, 18 Sep 2026 05:19:15 +1000
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
 <d7ba3e45-84fa-409d-bd43-23caa05587de@oss.qualcomm.com>
 <CAAhSdy1F1rASWA2Xht_LQF6ixBu1oQDBtdkW2YTiqVDqLczPsg@mail.gmail.com>
Content-Language: en-US
From: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
In-Reply-To: <CAAhSdy1F1rASWA2Xht_LQF6ixBu1oQDBtdkW2YTiqVDqLczPsg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: vDRqQSaTfZQiSC5Ya4Iw8SSyq3XSmVcp
X-Authority-Analysis: v=2.4 cv=YcYodARf c=1 sm=1 tr=0 ts=6aac3d3e cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=Sf69FToG0YAVI/MxTdzZwA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=gEfo2CItAAAA:8 a=V1jnuoLLAAAA:20 a=EUspDBNiAAAA:8 a=hNa552Fws9iX_tKzEZsA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
 a=sptkURWiP4Gy88Gu7hUp:22 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-ORIG-GUID: vDRqQSaTfZQiSC5Ya4Iw8SSyq3XSmVcp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDI3NyBTYWx0ZWRfX2prg8dX7a58O
 L6oD0/sV1KRdz+1nGlOyWdtH14Bkjlmn2YRyDx5/4OhHjCATEexfDkD+jHj7kI81hFt/CKfWpW3
 Ek1L20ICvIA7HnQEtniJ4Q43BjU6yKIicVh19ShS4cZFrwrjyRvUHrT58kai9A5mfUoADPf1Zg8
 7KMYBeYNh2bienI0YkaRSm0B22KPswN6IjIHuX86fI1BnbBb5fA+ytRc00L5PUCjz2SgEQVSwkC
 1r6M0U4aqF15ul5fLo0x6gt+bAZkUT4XwXbuE9A9kf4QzEoIQPfkR5GKYvYQQPW941lGIOtH0Ar
 3MzuoD7qxZ9yXHm05lfVxEJHogCIA8up53feyrEXBE9XhN/nNMTBu7riIHp+NHrL1xgKi/t8qMx
 y+uIAT5HVu3HeHM0QbyO5ehNwSGKlT8nZ/wjVzB6rJNOEmp1JA2mnFHf1cVq2DtuPKZs5nsQ8g8
 O40VgoPAa+Q8AqdzzNw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDI3NyBTYWx0ZWRfXyDrAwEdPBCNG
 i/Yuct64lNHbUcJK3BkNcQltLVw/7L5QVvoCmlKYbLhVEfREgtS6g4fPvSlMLZO5to7ncHIlk06
 p+43/kTAlIbkgYZPjzs3jMZHBIJo9Qs=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-17_04,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 spamscore=0 suspectscore=0 phishscore=0
 clxscore=1015 bulkscore=0 priorityscore=1501 lowpriorityscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609170277

Hi Anup,

On 9/17/2026 6:38 PM, Anup Patel wrote:
> On Thu, Sep 17, 2026 at 2:46 AM Amirreza Zarrabi
> <amirreza.zarrabi@oss.qualcomm.com> wrote:
>>
>> Hi Anup,
>>
>> On 9/16/2026 8:12 PM, Anup Patel wrote:
>>> On Sat, Sep 12, 2026 at 3:45 PM Amirreza Zarrabi
>>> <amirreza.zarrabi@oss.qualcomm.com> wrote:
>>>>
>>>> Add a device-tree binding for the OP-TEE RISC-V transport using the RPMI
>>>> TEE service group over SBI MPXY.
>>>>
>>>> Describe one mailbox channel per hart and an optional interrupt used as
>>>> the availability doorbell for asynchronous notifications.
>>>>
>>>> Add the binding to the existing OP-TEE MAINTAINERS entry.
>>>>
>>>> Signed-off-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
>>>> ---
>>>>  .../bindings/tee/riscv,rpmi-mpxy-tee.yaml          | 65 ++++++++++++++++++++++
>>>>  MAINTAINERS                                        |  1 +
>>>>  2 files changed, 66 insertions(+)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/tee/riscv,rpmi-mpxy-tee.yaml b/Documentation/devicetree/bindings/tee/riscv,rpmi-mpxy-tee.yaml
>>>> new file mode 100644
>>>> index 000000000000..8f6ff313fd42
>>>> --- /dev/null
>>>> +++ b/Documentation/devicetree/bindings/tee/riscv,rpmi-mpxy-tee.yaml
>>>> @@ -0,0 +1,65 @@
>>>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>>>> +# Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
>>>> +%YAML 1.2
>>>> +---
>>>> +$id: http://devicetree.org/schemas/tee/riscv,rpmi-mpxy-tee.yaml#
>>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>>> +
>>>> +title: RISC-V RPMI TEE service group based message proxy
>>>> +
>>>> +maintainers:
>>>> +  - Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
>>>> +
>>>> +description: |
>>>> +  The RISC-V Platform Management Interface (RPMI) [1] defines a messaging
>>>> +  protocol which is modular and extensible. The supervisor software can
>>>> +  send/receive RPMI messages via the SBI MPXY extension [2] or some dedicated
>>>> +  supervisor-mode RPMI transport.
>>>> +
>>>> +  The RPMI specification [1] defines a TEE service group which is the RISC-V
>>>> +  analog of Arm FF-A: OP-TEE and the rich execution environment (REE, i.e.
>>>> +  Linux) are peer endpoints and the RPMI framework (machine mode firmware)
>>>> +  mediates every message. Entering OP-TEE on a hart runs it on that hart until
>>>> +  it responds, so the SBI implementation provides one SBI MPXY channel per
>>>> +  hart; all of them are listed, in hart order, on a single node.
>>>> +
>>>> +  ===========================================
>>>> +  References
>>>> +  ===========================================
>>>> +
>>>> +  [1] RISC-V Platform Management Interface (RPMI) v1.0 (or higher)
>>>> +      https://github.com/riscv-non-isa/riscv-rpmi/releases
>>>> +
>>>> +  [2] RISC-V Supervisor Binary Interface (SBI) v3.0 (or higher)
>>>> +      https://github.com/riscv-non-isa/riscv-sbi-doc/releases
>>>> +
>>>> +properties:
>>>> +  compatible:
>>>> +    const: riscv,rpmi-mpxy-tee
>>>> +
>>>> +  mboxes:
>>>> +    minItems: 1
>>>> +    description:
>>>> +      One SBI MPXY channel implementing the RPMI TEE service group per hart,
>>>> +      listed in the same order as the CPU nodes.
>>>
>>> I am not sure why you need separate MPXY channel per hart. The MPXY shared
>>> memory is already per-hart whereas the MPXY channel will be doman specific
>>> for TEE.
>>
>> True. My reasoning was that TEE_CALL, as I understand it, is expected to execute on
>> the same hart that issued it. Given that, the mailbox core holds the per-channel spinlock
>> across the call to `send_data()`, while the underlying `sbi_ecall()` is synchronous
>> and does not return until the TEE call completes.
>>
>> So, if two harts shared the same channel, a hart executing a long-running TEE operation
>> would hold that channel's lock for the duration of the call, and another hart
>> trying to enqueue on the same channel would spin waiting for it.
>>
>> Using per-hart channels avoids that cross-hart contention. I agree that this may
>> not be the right layer in which to address the issue. I did not pull it to the discussion in to this RFC.
>> I'm happy to use single channel for now and follow up on it separately if useful.
> 
> The per-channel spinlock serialization is not required for SBI MPXY based
> mailbox channels because the underlying SBI implementation will take care
> of the serialization where required.
> 
> In other words, we need to improve the Linux mailbox framework to allow
> SBI MPXY mailbox controller tell Linux mailbox framework to not use
> per-channel spinlock based serialization.
> 
> One possible approach to enhance Linux mailbox framework is show
> below. May be include this (or some other approach) as a separate
> patch in your series ?
> 
> diff --git a/drivers/mailbox/mailbox.c b/drivers/mailbox/mailbox.c
> index efacd24a085d..437e7e2e6ad5 100644
> --- a/drivers/mailbox/mailbox.c
> +++ b/drivers/mailbox/mailbox.c
> @@ -48,7 +48,7 @@ static int add_to_rbuf(struct mbox_chan *chan, void *mssg)
>  static void msg_submit(struct mbox_chan *chan)
>  {
>   unsigned count, idx;
> - void *data;
> + void *data = NULL;
>   int err = -EBUSY;
> 
>   scoped_guard(spinlock_irqsave, &chan->lock) {
> @@ -66,14 +66,22 @@ static void msg_submit(struct mbox_chan *chan)
> 
>   if (chan->cl->tx_prepare)
>   chan->cl->tx_prepare(chan->cl, data);
> - /* Try to submit a message to the MBOX controller */
> - err = chan->mbox->ops->send_data(chan, data);
> +
> + /* Try to submit a message to the MBOX controller in atomic context */
> + if (chan->mbox->ops->send_data)
> + err = chan->mbox->ops->send_data(chan, data);
> + else if (chan->mbox->ops->send_data_nonatomic)
> + err = 0;
>   if (!err) {
>   chan->active_req = data;
>   chan->msg_count--;
>   }
>   }
> 
> + /* Try to submit a message to the MBOX controller in non-atomic context */
> + if (!err && chan->mbox->ops->send_data_nonatomic)
> + err = chan->mbox->ops->send_data_nonatomic(chan, data);
> +
>   if (!err && (chan->txdone_method & MBOX_TXDONE_BY_POLL)) {
>   /* kick start the timer immediately to avoid delays */
>   scoped_guard(spinlock_irqsave, &chan->mbox->poll_hrt_lock)
> diff --git a/drivers/mailbox/riscv-sbi-mpxy-mbox.c
> b/drivers/mailbox/riscv-sbi-mpxy-mbox.c
> index b02c17c2c64e..9afa10c72bd7 100644
> --- a/drivers/mailbox/riscv-sbi-mpxy-mbox.c
> +++ b/drivers/mailbox/riscv-sbi-mpxy-mbox.c
> @@ -420,7 +420,7 @@ static void mpxy_mbox_shutdown(struct mbox_chan *chan)
>  }
> 
>  static const struct mbox_chan_ops mpxy_mbox_ops = {
> - .send_data = mpxy_mbox_send_data,
> + .send_data_nonatomic = mpxy_mbox_send_data,
>   .peek_data = mpxy_mbox_peek_data,
>   .startup = mpxy_mbox_startup,
>   .shutdown = mpxy_mbox_shutdown,
> diff --git a/include/linux/mailbox_controller.h
> b/include/linux/mailbox_controller.h
> index 26a238a6f941..4bc4798c4b1f 100644
> --- a/include/linux/mailbox_controller.h
> +++ b/include/linux/mailbox_controller.h
> @@ -28,6 +28,10 @@ struct mbox_chan;
>   * transmission of data is reported by the controller via
>   * mbox_chan_txdone (if it has some TX ACK irq). It must not
>   * sleep.
> + * @send_data_nonatomic: The API asks the MBOX controller driver, in non-atomic
> + * context try to transmit a message on the bus. Returns 0 if
> + * data is accepted for transmission, negative error while rejecting
> + * if the remote not acccepted.
>   * @flush: Called when a client requests transmissions to be blocking but
>   * the context doesn't allow sleeping. Typically the controller
>   * will implement a busy loop waiting for the data to flush out.
> @@ -53,6 +57,7 @@ struct mbox_chan;
>   */
>  struct mbox_chan_ops {
>   int (*send_data)(struct mbox_chan *chan, void *data);
> + int (*send_data_nonatomic)(struct mbox_chan *chan, void *data);
>   int (*flush)(struct mbox_chan *chan, unsigned long timeout);
>   int (*startup)(struct mbox_chan *chan);
>   void (*shutdown)(struct mbox_chan *chan);
> 
> Regards,
> Anup

You are right. I'll include it in a separate patch in the next series.

Thanks.
Amir


