Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEF52489FA2
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 09:08:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790586503; cv=none; b=mn46JYfbdO9Ha9Ik2zuvwlcU6y9I4VsMiRbR9MmXYuT7RCcxbp3F8FOH5cf/9cnoPtoWFQ6TfS5daIcXQSJKtfy0wk1GQxmJPcgMNWIHiIduHwH+oVq1DBm3J84cEo4FINwaycsa51ubnyHCYc5Q2SNjr2vNALli7UXikeXr/+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790586503; c=relaxed/simple;
	bh=2xXGdaXDNnsrtVUnohY8qlxGqto2i/9dFMW5A3cmyJo=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=H7oH68gFWGY4RPgqOV4VlWQO7AJ7JRRH+0YfxuMMF7J6ElBIveSa5vBqnTGhqfc+vwk43w0UxAIzMunAqP3LZpUnYRRHEzjw0PgSVOX27/5Mpy4Kzs4ablc8PZoNcNEHAJbGe2f7Fn7rmLFkxmTEKSdos5E2/81OpV75wtEYzPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=d4yuEEs6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Exfz5Q/S; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="d4yuEEs6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Exfz5Q/S"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68S80L9p1263138
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 09:08:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uAQnFlW41/utnhQvyl0xrVgFZ/ymHHxEzRYC3WPRPvk=; b=d4yuEEs60P3xusuu
	kBWMJ2ARnjphaQH8ep8E9kRY0B0WHZpTGgVxneQF9pGMIxwfszMp/BT0ChrD0gUH
	lx8sm5KpST+x69W0ajEKL8u+ek6iDcihG+eQi1fKCBpYyY5rQYZOAn2PAIxzMQ96
	sX/KgA8Yvd67AFozbx5eVqXzYXZLnPKwMsHlFujkzvEVlReIZ7mzjAFAhn7WsZQH
	RT/IBN71/keZIjNJd5SGiNAnsCbt1wT8q6dyMoM/+YYh9eF4nHdykqKY9SYSaiC/
	FFnf37q2wARh8P7Qcu1UtvkeJF7hdAd5PgpQx9pqu0ITfTIY+7sYtOI2bgU/vEYk
	7TKkvg==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gx526ng3n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 09:08:20 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-880ed7bd0b5so820386b3a.2
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 02:08:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790586499; x=1791191299; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=uAQnFlW41/utnhQvyl0xrVgFZ/ymHHxEzRYC3WPRPvk=;
        b=Exfz5Q/S5dwryI3TvNbrFKQmDaAstd1cYiRPuWsZKJuLTuqU60soAoHJV8vzI/sK7B
         f+BHI9Q23PF7VU9aillrUiKrbQRx4klOauyz3Ztgvd9ug3dNYpD9NPCbQqaWuThItAS7
         e8H9RNyhw0c3t1neEz3Si9W6JSiVq0Ncs6PAQ518LS9eOMQVatRx5DoxK7BdoTamuw5G
         8qV9+ttdhW/FE3eveBjppZuK5sdmbrjf6appSmXYZfpZTv7/9x9I5lgcd6kV5/lqaC24
         R5V1lSxHqugtave58Vm6YTgg8522mp7Ih/bERYTxngernJlsTcsE/hgDnooKDkgOalug
         iyJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790586499; x=1791191299;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uAQnFlW41/utnhQvyl0xrVgFZ/ymHHxEzRYC3WPRPvk=;
        b=RmmEhuJ0HkKJ8mImId/nNok5fH5kHjpO2WVsTt8odkJjAZ1Ta2SsGvQxTDTLoGegtn
         1oR47Cy8Z+/3PBNquL6ulaCgaGroVAz+bhKXlPFaQN2BjILp5oZTaCJA5i4pu4fQecK3
         p9z/NpEWg9wkAHJbGkKWsV8bBd6StGpbUIgno10RAeziAgXyHIQabb5YNPEWllHq9Y+V
         h3iGzWMkUzeAaJ5fAorwo7qVstnKSG8xkj6fmyELRgFxZIG74NeiiGXJKxCKgYczl80J
         Gj3Njq44P0/Mvj8aIwjyrqpMlSxiuRyq3JFy9Bwzj3DljZ3YwVoCDga4oJjNuzC8THAE
         r65A==
X-Forwarded-Encrypted: i=1; AKwUvBxnYzq4Q+xemRBxovlzidMJ7K9oW9RjWzUMd1jOE8M2JB3cwtZS5xDvFm6B3HSEcYkP2zsCpCplUW8WEXs=@vger.kernel.org
X-Gm-Message-State: AFuF++mrnsnNk1IQjifFl6xMDKk0WshBs0F0tx9xBUAJQ1sUi8SqmxSt
	rsILo+hep0RA1TZjLmBfOeiG7WKIC4ppOtnLuQYn21Ci5SyzbDlAL3+poKZkr/lLf02gzqBzLuD
	5rSB427nMrr/N/saiJsHo1z3VT+tc4+qQC683/hXVYX3Bo+391ZgYbnO3VgPtyA1ywgI=
X-Gm-Gg: AYBFou2Ijp/OLlHoTapZJomQ1iTMiw/EFwLV+9Cr39EM5V7HTpcc1wNvXiWp223KD6M
	wbMPPzF/Q6CyaCetlzbK0bc9dB/19PR/xE8bE/tfX7CBo9VCMq1z+69q5gN4USO5754XA6uxtBw
	CYb8wb+tyBluX3WXwvhiCSAQFFOjJRyCVg5vkxElGUBxitiXDoIa+B/dGTu5dfoJMTFWZzbTZIf
	lFKmhivDcdgo0vnfjfVsRiW+2YL3C11kRAY4n7cGAw7HBdZQfMZSKWel50vOJ0fNSZOt8GKp60f
	VTnmZTOLJD9e00SdXjR11xCdcOZsR0rE2dM37woCGIcl7WC5OdXUWnysRXrpSsEX57O/YdrTadx
	VX31FnG554Qnb3HGUyKooCq/lAeBK35YS
X-Received: by 2002:a05:6a00:1494:b0:880:f76a:baa9 with SMTP id d2e1a72fcca58-880f76acb72mr5442002b3a.14.1790586499372;
        Mon, 28 Sep 2026 02:08:19 -0700 (PDT)
X-Received: by 2002:a05:6a00:1494:b0:880:f76a:baa9 with SMTP id d2e1a72fcca58-880f76acb72mr5441983b3a.14.1790586498695;
        Mon, 28 Sep 2026 02:08:18 -0700 (PDT)
Received: from [10.218.31.237] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-883218be96bsm1273172b3a.52.2026.09.28.02.08.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Sep 2026 02:08:18 -0700 (PDT)
Message-ID: <b60b699e-7921-4a5c-b110-50448e660f44@oss.qualcomm.com>
Date: Mon, 28 Sep 2026 14:38:14 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND] dmaengine: qcom: bam_dma: Defer IRQ trigger type
 to device tree
From: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
To: Frank Li <Frank.li@oss.nxp.com>
Cc: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
        Andy Gross <agross@codeaurora.org>, linux-arm-msm@vger.kernel.org,
        dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org,
        Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>
References: <20260717-qcom-bam-dma-irq-trigger-v1-1-6405eac86f00@oss.qualcomm.com>
 <aqlQ_y-um0yqo6jj@SMW015318>
 <64fc0855-3dd5-4668-9d4d-bd82be246de8@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <64fc0855-3dd5-4668-9d4d-bd82be246de8@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=VvS2kO2n c=1 sm=1 tr=0 ts=6aba2e84 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=P-IC7800AAAA:8 a=EUspDBNiAAAA:8 a=-r3nWBXi7OZqocfuUhQA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-GUID: x-wu4MdSzJRDsNcL6mgRc1C3AWRr3Qyt
X-Proofpoint-ORIG-GUID: x-wu4MdSzJRDsNcL6mgRc1C3AWRr3Qyt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDAzNiBTYWx0ZWRfX41moFPJ3y8wP
 DCrzTCQlfi8gSWYOSuPmL66aRYpQArIDMunqvNnwaiQvHM6DWz9ZkQkP1oH5x7/FAaAEHhCHdjD
 bTt8RDB5qOBtrvSQu8xprFxu4i+w1ePGFe6/smQ433lsSglE+uX19InWMOoWcbC6UiMuecTUYXV
 6hU8BKSRC0PPNbZlN6lJcP8ZxySW9ToLYNdvwlYmTujWpJKsG1WG/5UJTAvsTwLyWj24HhLiYQC
 DHvZnfLiCKQzVqCM3T7RY3w6XLJCWWuTbPFqLJEjFpsh7HEWDAhXigd2Qv2KAQzWyKL2jYq806r
 pOu/aFu+ny6BQfj9OX8RjuPdufcs/fAHwV7p05EDmb6p5BHpxHXi3369YcDElRXSPVRGINstnFF
 ATSG02sNxYhlpaYBkpbeWZ2JPrFPftxXzO5MvwIsQiNHcfCT3c5DR/aEZ8mGwyqPkpvKPFxy5Ck
 7kveINx4xI6m45GuKeg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDAzNiBTYWx0ZWRfX6qsccSXz+LFr
 M8W+PqrHKeVn/3ih68Sfd5F5K+RdnERM4yRH9uuEQ81aKZBbbKyI0intEbb6XaTNkU+M8Q1qXmK
 zYyxnZOf05xczXHhh4NrQBsVUeL5iGM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-28_01,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0 clxscore=1015
 priorityscore=1501 spamscore=0 malwarescore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609280036

Hi Frank,

On 16-09-2026 08:30 pm, Vishnu Santhosh wrote:
>
> On 15-09-2026 07:36 pm, Frank Li wrote:
>> On Fri, Jul 17, 2026 at 10:30:28AM +0530, Vishnu Santhosh wrote:
>>> The driver hardcodes IRQF_TRIGGER_HIGH when registering the BAM
>>> interrupt, which overrides the trigger type specified in the device
>>> tree. On Qualcomm Shikra SoC, the A2 BAM signals an edge interrupt
>>> to the apps processor; registering it as level-high causes the
>>> interrupt to not fire, resulting in missed DMA completions.
>>>
>>> Use IRQF_TRIGGER_NONE instead, which causes the kernel to use the
>>> trigger type already configured by platform_get_irq() when it parsed
>>> the device tree interrupts property. This makes the driver
>>> platform-agnostic.
>> where show this? can you point me doc or code?
>>
>> Frank
>
> Hi Frank,
>
> The BAM driver obtains the IRQ through platform_get_irq():
>
> bdev->irq = platform_get_irq(pdev, 0);
>
> in 
> https://elixir.bootlin.com/linux/v7.3-rc3/source/drivers/dma/qcom/bam_dma.c#L1270
>
> It then registers the same IRQ with:
>
> ret = devm_request_irq(bdev->dev, bdev->irq, bam_dma_irq,
>                          IRQF_TRIGGER_HIGH, "bam_dma", bdev);
>
> in 
> https://elixir.bootlin.com/linux/v7.3-rc3/source/drivers/dma/qcom/bam_dma.c#L1335
>
> The comment above IRQF_TRIGGER_NONE in include/linux/interrupt.h
> states that when no trigger flag is specified, the interrupt uses the 
> trigger type already
> configured by the machine or firmware.
>
> https://elixir.bootlin.com/linux/v7.3-rc3/source/include/linux/interrupt.h#L25 
>
>
> Therefore, IRQF_TRIGGER_HIGH overrides the trigger type associated 
> with the IRQ during
> DT/IRQ-domain mapping, while IRQF_TRIGGER_NONE preserves it.
>
> The Shikra DTS which is still under review describes the BAM interrupt 
> as edge-triggered:
>
> interrupts = <GIC_SPI 74 IRQ_TYPE_EDGE_RISING 0>;
>
> This driver change is needed so that the DT-specified trigger type 
> remains effective once
> the Shikra DTS change is accepted.
>
>
> Thanks,
> Vishnu
>
Gentle ping on this patch. Please let me know if any other information to be shared
from my side.


Thanks,
Vishnu

>
>>
>>> Fixes: e7c0fe2a5c84 ("dmaengine: add Qualcomm BAM dma driver")
>>> Co-developed-by: Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>
>>> Signed-off-by: Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>
>>> Signed-off-by: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
>>> ---
>>>   drivers/dma/qcom/bam_dma.c | 2 +-
>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/dma/qcom/bam_dma.c b/drivers/dma/qcom/bam_dma.c
>>> index 
>>> 19116295f8325767a0d97a7848077885b118241c..6c3e2ca8a572fd04c925de0adbd5cc0616b361ef 
>>> 100644
>>> --- a/drivers/dma/qcom/bam_dma.c
>>> +++ b/drivers/dma/qcom/bam_dma.c
>>> @@ -1303,7 +1303,7 @@ static int bam_dma_probe(struct 
>>> platform_device *pdev)
>>>           bam_channel_init(bdev, &bdev->channels[i], i);
>>>
>>>       ret = devm_request_irq(bdev->dev, bdev->irq, bam_dma_irq,
>>> -            IRQF_TRIGGER_HIGH, "bam_dma", bdev);
>>> +            IRQF_TRIGGER_NONE, "bam_dma", bdev);
>>>       if (ret)
>>>           goto err_bam_channel_exit;
>>>
>>>
>>> ---
>>> base-commit: e43ffb69e0438cddd72aaa30898b4dc446f664f8
>>> change-id: 20260601-qcom-bam-dma-irq-trigger-0366e7e86f17
>>>
>>> Best regards,
>>> -- 
>>> Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
>>>
