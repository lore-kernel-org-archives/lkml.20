Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793683372;
	b=oofUgNNeBaEstX0DV/+y41WKJ14y3qNpkp7LHCTsuL3AamqsjAi2GsIMz7VPhbqgLmhA
	 lcD93ECOfUDFMiAJVR7QVjWsS9tp3n59WyMg9lph66upgqyBBlPOgbvzH2+UrcnPfODCT
	 Af6bs5Cui8M0U+4oc7nYj3viG32lO2jjx8rz6m8BbYTlIoaZQkFcIIRgOV+cRmCdEPItt
	 WXkvCyhRTUE9kHhxyVQQw74j9N1VuPyo2UUJBMOQoHxH9G/CoZ8puL/Cfd686Nqsln2ZV
	 QtASl1HPYieTrOe2ecdwSmT5fbuhnWw00i5UTTAYWzfMwO/o41HiHHIQ29bi11576Mg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793683372;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=BR98tkQVks6AJwD3RBrsYEU/yAAvutTQVgyJLvDwq1c=;
	b=JpqXuKXPB2OnqFpv3bvxzfzxSBxYrr3jKgdWerG1AIxDAJgbt6QrdU1XiH2cGj1Bbqbx
	 NwuExy262wEZl4aPsZ9FcS6ZPbMd0+cGTiP+G5tF35eO0hUbM9xthIKtDP13mJkGgz/sz
	 HgMWiFLDnLTKCrzKAWO/Iu0SS9xCYKFriYFJ/eon0kBIXaS8AoYqzQG7yPwC6+c+t9ueR
	 j3eggxiCnnOkkZY5aFr0zLI8EoYmFF3MpYBsVZACmi/KQsa5PFqlCcGUpPuCLwFYeIqEb
	 JpEPjqjP8rnDuzwT2wS0/V4P9DtVuXa55ClXLwj9uf5fPWnQIRPC8WW4P2x5+QS9PRg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LkbyEAQI;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GiSQvBxc;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8527606A324
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 05:22:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B8527606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LkbyEAQI;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GiSQvBxc
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A32oYhq2608899
	for <linux-kernel@vger.kernel.org>; Tue, 3 Nov 2026 05:22:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BR98tkQVks6AJwD3RBrsYEU/yAAvutTQVgyJLvDwq1c=; b=LkbyEAQIuZ1FuxcC
	E+js3EmF9O8e6tCqEO7ccWe1jjgqM6gtp4s9G8kKbHnpO7DjwL3ejMcUy1a2BoH0
	pAvN4fvOVdiIkA4OQ5dsBF5YIs5IdeBwt1ScdgeuMsJaR+jGffOhFtm7MhoBPHZJ
	H9zMcQUdRrTfKGu9gWxR4sf7ybWUoHIBmQqlV6NcMafUOPxUuGZX+lyBdUVIDzJo
	oR7frJPUD8jpVHmCqT/tlM0OwmJ9cpPptwGcf9dU+nvyM2/ulcGSn/g5IN7zrtqk
	Io1+qFixD0t0WTE8U7LRM5KiqvTQkpJ1c9pwCh0DkDqFhp8cOdU/kazPsLMJ1Mr7
	1vKp/Q==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hq76d8fq6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 05:22:50 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3ade5b3ae97so240774a91.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 21:22:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793683370; x=1794288170; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BR98tkQVks6AJwD3RBrsYEU/yAAvutTQVgyJLvDwq1c=;
        b=GiSQvBxcB7BgUobbQdfi3JXdzCdxibGo988G86roq4WYUHSld3TZYLocamJ0rFl0TQ
         pgvnO8q7XpNs33VWAQCg3o+ELJeUYEKl5ttnvBIebcNngECNyYpJOjbPchAIjpRckQKc
         DIhL0+M13Liv1Gks4Imsf212iK4JVx+jhnhUj+Pc/Nz3lTd8E9/1hTZNZxWBAConRP11
         0u0xKaUc0hO4FBuM7mRErVV49QdiLJzNbV3kMu3Ogf8QJLe1Ks5b+VaDkAJLslqkQAC3
         r+7N2HBk9Th1d34CkMw7Uzx3+aW+0ervrvGd2PhA+ck4XIP1xhWjNp+vFLspVIKICOoH
         fi4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793683370; x=1794288170;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BR98tkQVks6AJwD3RBrsYEU/yAAvutTQVgyJLvDwq1c=;
        b=G9fR4QW/5we5K/P+wDAuzzHqwl0g+JW81yyuYKNWvWHOE9L65hNCiDdqcHkyIfNzFq
         DS/xgrxR2PzDUSx5Rnlj9kRYKdol2ycuVj/s3c3B0LuVswe8iQ8yADRavas4FS+ZlX9d
         vWlB5WJ0MZhx/JV3ZGFZC6Eax/7Tqlv+fVdADLCN4jNdXWzAZPh4BEx2xmbBsva8JkPM
         /zVI49m51TGzGQqZnZ+IzhEqzVK3c/cd9dHPnvxtyPIY3gujBKY53xfnLQJgVITJqqVv
         p+S0ugMQtjRE9vxfbpZtQkk7veevPv2T+Movnw3BbW0IwP9eNExnFuHE0gvnD56HW3F7
         yokg==
X-Forwarded-Encrypted: i=1; AKwUvBy8+ro4SjJFgugJNcTMdpKT9875sIWDPUeq3IuOYyzw2p5bLAWBSrirbZdvjrZHB4IuBXYdA3/RhEWmc0k=@vger.kernel.org
X-Gm-Message-State: APuU4Z/h/oo+9Ef728HnoL67gN6dopbcJrR1u7Du+VO3BU2fRIJfzhSl
	OsJQOyYB7CiM/9JkDQv7uxIry85xAf4tdFW23RmQe1UAWdUom3aSlZSB5PjHRKx4kEjFfqvsSJn
	pCqIuhG/GYqs2Tooy9koE6FWWqvf6nDkBDcjfGVp/cn2xBghhWuVTADCN5Rj1GalDVGc=
X-Gm-Gg: AYBFou09G/aCQwgQSSK1WRZU56J/i0/1G5G19e5Cw2AWV65de3sPbwbp4MqSjNIGlTC
	+j+wj5d33BKtwrHoCJlELvx/ynbo7P9i28VjiMrg7GGDRjSqvp98wG/HhAcOQ/XCfDkCNUhKiS1
	a07bdN8m0vWFpGA2sD3UyK6HckLgzgb+hIsTvRegpYK7tNAq0qpq8PWJ35kZhaWrcsrcChQbKDM
	tghIYTxZlX1L5F60wZwZ/5Af2CVtZxWSdLmcKoZyyCfMxifykRET0pDtdU2ET4kY0X+3aP8YR9U
	/Ftx767chB6H8nBsOPh5IL4uNstPXiMVhLxpb4hzF4/5rmkc2uZRxq8VNrVu2S4iwjp+M2aC6BO
	Avg5mmSphhOvTKauVThBDXLCjb8gcGL1ZEwSWIMdWuodY3xyrAWKFpe7xvHCKWLXgzdg2yw0B/x
	oiKLjJ
X-Received: by 2002:a17:90a:d887:b0:3ac:7a5f:2cee with SMTP id 98e67ed59e1d1-3ae6f015b72mr10962237a91.39.1793683370260;
        Mon, 02 Nov 2026 21:22:50 -0800 (PST)
X-Received: by 2002:a17:90a:d887:b0:3ac:7a5f:2cee with SMTP id 98e67ed59e1d1-3ae6f015b72mr10962216a91.39.1793683369533;
        Mon, 02 Nov 2026 21:22:49 -0800 (PST)
Received: from [10.218.31.237] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cdb363a62e3sm688502a12.4.2026.11.02.21.22.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 21:22:49 -0800 (PST)
Message-ID: <3a8bf3ff-bd02-47b7-98f8-e568d39cd086@oss.qualcomm.com>
Date: Tue, 3 Nov 2026 10:52:41 +0530
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
Subject: Re: [PATCH net-next v3 1/2] dt-bindings: net: qcom,bam-dmux: Add
 memory-region and qcom,vmid properties
To: netdev-bot+sashiko@kernel.org
Cc: stephan@gerhold.net, andrew+netdev@lunn.ch, davem@davemloft.net,
        kuba@kernel.org, pabeni@redhat.com, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, loic.poulain@oss.qualcomm.com,
        ryazanov.s.a@gmail.com, johannes@sipsolutions.net, edumazet@kernel.org,
        linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        deepak.singh@oss.qualcomm.com
References: <20261021-qcom-bam-dmux-vmid-ext-v3-1-cedd1f681102@oss.qualcomm.com>
 <179292379798.3134.3640182983987741764@kernel.org>
Content-Language: en-US
From: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
In-Reply-To: <179292379798.3134.3640182983987741764@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=KJTPn1Fo c=1 sm=1 tr=0 ts=6ae96fab cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=0nVg4KMEP9fHxcKd-jEA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDAyMSBTYWx0ZWRfXytj67rcNhOFB
 tIzRjj3G4P5A7qQreWS++G0o6YWZpzYdE3uvpt72M42tOxjv2ZJUrkPYNIk8WDJ/y2CdOPqY7Gb
 cIuQSz8P7tJB1jiyq5vCDiuplC7ZgUs=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDAyMSBTYWx0ZWRfXwuYZ6xWjT3gN
 z720INvYvnT8rp9+cJ9EEmPoBccnMVqD4J4lnn+AZhSYYpzcir7fagxjDc4F302Iwl0icNgoEX3
 Mq5epughAfwZAZNrULiX3l5t9l4Hk7UG75nBqBChdeHmoKxxgeXLLKmsA6MEE88Q6Z/LZIFT5Ht
 PFjnAsVitoaOzYquRWC6gAR9ZD/NBHD9v6hgApSJQPne9Ju2/M0pwbWeScavQaC3Q+VX94xwkZ6
 enXHgnKcZ7kHMcieqoPgKOd0LvlSjkFA/rzhSVckSXU3Rrslpj2/VQI0DwLc5oO1mVCe5dkwPtw
 8i3yoZp5NR/lL2s60YGXInckVgmNDOdLjWOZes9eAbbBdGzY0TUd2FiLE1FaQfbKhA3peJoS66g
 mRgbL8e5lfxivKw+azVfxRh9841Bg1F6VDkLflF29tTFTGYKdGD3BpwEVAfc3rL7CqfiR5ZgikV
 gfjkGUpy5nv7iRVhehg==
X-Proofpoint-GUID: alrOBcqWj3Sag7KYG3xVl3FJXqKQJIwi
X-Proofpoint-ORIG-GUID: alrOBcqWj3Sag7KYG3xVl3FJXqKQJIwi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_01,2026-11-02_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 priorityscore=1501 bulkscore=0
 lowpriorityscore=0 adultscore=0 malwarescore=0 phishscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611030021


On 25-10-2026 03:53 pm, netdev-bot+sashiko@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 3 potential
> issue(s) to consider.
>
> Critical: 0 · High: 0 · Medium: 1 · Low: 2
>
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwork
> know by including "pw-bot: cr" as a separate line at the end of your reply
> (one such reply per series is enough).
>
> - [Medium] The new memory-region/qcom,vmid properties only cover the bam-
>    dmux client node.
> - [Low] Documentation/devicetree/bindings/net/qcom,bam-dmux.yaml still
>    says (lines 18-21): "Note that this schema does not directly describe…
> - [Low] Baseline decision: false (resolved later in the series).
>
> --
>
> dt-bindings: net: qcom,bam-dmux: Add memory-region and qcom,vmid properties
>
> This adds two optional properties to the qcom,bam-dmux binding,
> memory-region and qcom,vmid. They confine BAM-DMUX DMA mappings to a
> restricted DMA pool that is shared with the modem through SCM. It also
> adds a qcom,shikra-bam-dmux compatible, with qcom,bam-dmux as fallback,
> which requires both properties.
>
>> diff --git a/Documentation/devicetree/bindings/net/qcom,bam-dmux.yaml b/Documentation/devicetree/bindings/net/qcom,bam-dmux.yaml
>> index 33746c238513d..f7388d24c8612 100644
>> --- a/Documentation/devicetree/bindings/net/qcom,bam-dmux.yaml
>> +++ b/Documentation/devicetree/bindings/net/qcom,bam-dmux.yaml
>> @@ -22,7 +22,11 @@ description: |
>>   
>>   properties:
>>     compatible:
>> -    const: qcom,bam-dmux
>> +    oneOf:
>> +      - const: qcom,bam-dmux
>> +      - items:
>> +          - const: qcom,shikra-bam-dmux
>> +          - const: qcom,bam-dmux
> [Severity: Low]
> The description at the top of this binding still says:
>
>    Note that this schema does not directly describe a hardware block but rather
>    a firmware convention that combines several other hardware blocks (such as the
>    DMA engine). As such it is specific to a firmware version, not a particular
>    SoC or hardware version.
>
> This patch adds the first SoC-specific compatible. Should that text be
> updated too?
>
> The commit message also doesn't explain why the no-SoC-compatible design
> is being dropped. The only effect of qcom,shikra-bam-dmux is the allOf/if
> block that makes memory-region and qcom,vmid required. The driver's
> of_match table only lists the generic "qcom,bam-dmux".
>
> Separately, the subject line only says "Add memory-region and qcom,vmid
> properties". Could it also mention the new compatible, since that adds to
> the DT ABI?

The compatible was requested by the DT maintainers so the schema can
enforce the properties required by the Shikra firmware configuration.
The note about a firmware convention therefore still holds.

>
> [ ... ]
>
>> @@ -72,6 +76,22 @@ properties:
>>         - const: tx
>>         - const: rx
>>   
>> +  memory-region:
>> +    maxItems: 1
>> +    description:
>> +      Phandle to a reserved-memory node compatible with restricted-dma-pool.
>> +      The BAM-DMUX device uses the pool for DMA mappings.
> [Severity: Medium]
> Does a pool on the bam-dmux node cover everything the BAM accesses on
> Shikra?
>
> The pool only affects dma_map_single(dmux->dev, ...) in
> bam_dmux_skb_dma_map(). The BAM descriptor FIFOs are allocated on the BAM
> controller's own device in drivers/dma/qcom/bam_dma.c:
>
> bam_alloc_chan() {
>      ...
> 	bchan->fifo_virt = dma_alloc_wc(bdev->dev, BAM_DESC_FIFO_SIZE,
> 					&bchan->fifo_phys, GFP_KERNEL);
>      ...
> }
>
> bam_chan_init_hw() then programs that address into the hardware:
>
> 	writel_relaxed(ALIGN(bchan->fifo_phys, sizeof(struct bam_desc_hw)),
> 			bam_addr(bdev, bchan->id, BAM_P_DESC_FIFO_ADDR));
>
> The companion patch "net: wwan: qcom_bam_dmux: Assign restricted DMA pool
> to remote processor" says that "BAM-DMUX DMA mappings and BAM descriptor
> FIFOs must therefore be constrained to a designated memory region", and
> that accesses outside that region "can trigger an XPU violation". It also
> says the FIFOs are covered only "When the BAM DMA controller references
> the same pool".
>
> However, Documentation/devicetree/bindings/dma/qcom,bam-dma.yaml defines
> no memory-region property and has additionalProperties: false. Nothing in
> the series changes that.
>
> So a schema-valid Shikra DT would leave the descriptor FIFOs outside the
> shared pool, and a DT that works would fail dtbs_check. Should
> qcom,bam-dma.yaml get a memory-region property as part of this series?

This is covered by a separate binding change for the BAM DMA controller,
which goes through the dmaengine tree:
https://lore.kernel.org/all/20261021-qcom-bam-dma-vmid-ext-v3-1-299355e8dd3b@oss.qualcomm.com/

Vishnu

>
>> +
>> +  qcom,vmid:
>> +    $ref: /schemas/types.yaml#/definitions/uint32-array
>> +    maxItems: 1
>> +    items:
>> +      minimum: 1
>> +      maximum: 63
>> +    description:
>> +      VMID of the remote execution environment that is granted access to the
>> +      restricted DMA pool through SCM.
> [Severity: Low]
> Nothing reads qcom,vmid or does the SCM assignment at this point in the
> series. A Shikra DT that binds through the qcom,bam-dmux fallback would
> bounce buffers into a pool the modem has not been given access to. Is
> that gap between this patch and the next one acceptable?
>
> The next patch in the series, "net: wwan: qcom_bam_dmux: Assign
> restricted DMA pool to remote processor", appears to resolve it. It adds
> bam_dmux_assign_dma_pool() to bam_dmux_probe(). That function reads
> qcom,vmid and calls qcom_scm_assign_mem() with HLOS and the remote VMID
> before the DMA channels are requested. The patch also adds
> bam_dmux_reclaim_dma_pool(), which runs on remove and on probe error.
>
> The driver matches the fallback compatible and handles the property
> whenever it is present. So the fallback semantics look correct by the
> end of the series, and this is noted only for completeness.
>
