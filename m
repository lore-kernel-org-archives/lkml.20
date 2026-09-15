Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7514847F763
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 10:33:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789468415; cv=none; b=PB81TC7MIp6cNQO6wOdiU/J+Bz5mH2nsiPQmEXyAfwHwchlPWh0KWcgpB0PeCOGTgnFNbzbIvcjT72tGcDYga6B6jN0b/ccYohXEcgxQC3Alqt5KoOp4nO6JiyibPF8vfYgbjZiKI6MP+SfhGd6kRhRCXrjGDZSqYDo7u/oXy5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789468415; c=relaxed/simple;
	bh=HdVbv25549gC96kYbLnDlO3NtEiaAkeg1ptsK3D4fGs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=K4USz81EuWin1/Iqv4Iu/6aUTBFZBGh/utUlac1MWnBpXm02cbh2m288dip3cZlr0SRLLMp7OEnS8SAVVTpit277RRG/uVKTAw/NhCjBym77nPIwQb21h35eQ4a4Zmevb4MRim07rENWoJgMO1ZgrPioxIiJZ6po07lgrZA28pI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mrNPSel2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UX1JqKXM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mrNPSel2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UX1JqKXM"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68F9h7343415788
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 10:33:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+nhcbIo13/RQhS94ysjC9Pcq9pCsuzSG3P5Q3HgXTjg=; b=mrNPSel2KMjzeUyZ
	5wv2ollHGKv8nD1sH5YNFiZtJ0kFNDaasquSN9wBlPg8u+yqcPQFf741XGnTGUxf
	ZCYqB1bEk0H5oQIoTyRYDArjTJjC4gia5HQJmSXOxTQqyy3uZCpUZb10/awjlc3t
	fkf1IRST4xJUVJ7N21tQxKodIF0u4jXxG/Xns7DSoNeFddwhHjFznDoHeQLFAP02
	HwK1MnJZySuPjjtTaPTYpN0KKBppj+H+ZZhRTbb/ObHCdeAxnSHv2Ll638N2AuTX
	BEzeWlTPv9e33+MmaXDvk0QXP1WNNTkwrOt95AOqaPEKEmNKwBc26SgxcrvKx6wl
	7AqPTQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gq3hc09ft-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 10:33:31 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-39de4a68f7cso3326032a91.1
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 03:33:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789468411; x=1790073211; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+nhcbIo13/RQhS94ysjC9Pcq9pCsuzSG3P5Q3HgXTjg=;
        b=UX1JqKXMNFcxNtyYuId6vR/sqhGcNgE/1LxNQvc/Lf9tc0B3wCj8CKpbbT0dryxex7
         Aq7oBw9yjtsmUO6IHtChE33jmgiQB2SjtrY6RmUN3wYZMdOZGdWgDhQlBOy7GXSsN3RY
         szMjBOR0B9Slg0bXMdsLfmlUp8YMn84SM+/Zx/UpUC3BbI1wn42eyrOVWBMLaWs+F0Xm
         H4rveeCqkEzBBfln0G+n7ab5F4reI5Snc0M9SkIGAYt2u4M4HFDue+33H3m1gsiezwk0
         DiZF7//ntKIvIFQD8Hx8NwvY9OnZawWF1JlFgA5fvw0ZbrTjEtQNrZmtniv1mZJTmGfO
         BofQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789468411; x=1790073211;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+nhcbIo13/RQhS94ysjC9Pcq9pCsuzSG3P5Q3HgXTjg=;
        b=JuPkTPjwXUKz+ZezuaBGoRgP6Ifm4N/1stPXJ1g9eb3oW/fYsEVyBDx8zC3c9hYOHr
         VlReaixe9NZh/hxdi4ccvCeBSv/X3h8IpODBGwYvfen3Yqtvf9XHtfnDHOP1jfw0hMJu
         vm7GMS+co4kjK/IfSJLNJTtA9tQj+LZvSity2tlPAVbjmbPH9OsbXv0WpVZDagSej7WD
         rKU7cWgov+kp93zeerCjW7Ps95x2GTjtgOo/OjNU41LpvISJJu1e2HeCkh7mgRIJ+0cL
         HVniAFCqzkxOTJLRzwsIDVMHLiIttX7Mj71vI0qJmRI4lh8YsbtCTK/oWHnWQA0DYgcT
         NVCw==
X-Forwarded-Encrypted: i=1; AKwUvBwkS1BPMzdalNudDP5+NYZW3PjBYbVT6Fk6GLi6mHJA8e3lpveIXWbaXvDE9eDAwoAWWoG75UFqqyVCTto=@vger.kernel.org
X-Gm-Message-State: AFuF++lMJ0nmPGO+qgFPilibf94C2wM0XQB0sLVIlbBeW8Tjo4/v0us6
	C6DzmSOAx8cBTxi9eeCsGSjqPDGsaqb7Y3Y6Cu/f8WzkclIn0GdjmpzwNVEmVnw7A/OGnkemJ/y
	Qw26F3/lJ9uCLSSrdZ+vyGXy7MBbVa3yms2N5NjeeO1ah6SQShURndT5yw5SCcEdm3f+Qr/nteE
	w=
X-Gm-Gg: AYBFou0eA0lcwFbhtj152h5inNikni6yyf599Yh3XDZ8VofAPQuCNGL+Ew1sikB+SUT
	DtJMPCHKPJAehw8OCtnRHcDT/KtC2kebofurayaEzpmP7sYja8AW53V67URb1XDWI6PfjgrXxk4
	JJ1YO7d7w/ieyb/+4OzFMeKsOuvOGXFkRMZHRZMM1rv/AX+eMPeNNY6xknrmeojH4YhIPlSFMjH
	k95CA7TaPikniOGUYP0Np5NgpZ6gCBxvwmjhgin4SiMKl52Og7jUCfzeOgVbDDbHcMX0h+dreJi
	Da6oDYJlZ7jduJeSVK0yeGJ7Jbv0fD6R94464Z5jgn1ywGQr23AoZWHimMDAE7H1Fvvkq5mSQNY
	J53eyKFKAhbwXe/EukQELwA5ECE3ppdsMlQ==
X-Received: by 2002:a17:90a:e188:b0:398:b88c:2b7b with SMTP id 98e67ed59e1d1-39debf93d89mr16403191a91.8.1789468410956;
        Tue, 15 Sep 2026 03:33:30 -0700 (PDT)
X-Received: by 2002:a17:90a:e188:b0:398:b88c:2b7b with SMTP id 98e67ed59e1d1-39debf93d89mr16403129a91.8.1789468410543;
        Tue, 15 Sep 2026 03:33:30 -0700 (PDT)
Received: from [10.217.222.20] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4ee07f2sm30101513eec.18.2026.09.15.03.33.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Sep 2026 03:33:30 -0700 (PDT)
Message-ID: <9b8ed8b6-4fa2-49f6-8164-6c705b8cf975@oss.qualcomm.com>
Date: Tue, 15 Sep 2026 16:03:25 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND] dmaengine: qcom: bam_dma: Defer IRQ trigger type
 to device tree
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
        Andy Gross <agross@codeaurora.org>
Cc: linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>,
        bjorn.andersson@oss.qualcomm.com,
        "chris.lew@oss.qualcomm.com" <chris.lew@oss.qualcomm.com>
References: <20260717-qcom-bam-dma-irq-trigger-v1-1-6405eac86f00@oss.qualcomm.com>
Content-Language: en-US
From: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
In-Reply-To: <20260717-qcom-bam-dma-irq-trigger-v1-1-6405eac86f00@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: wDy-rzUDXBEnGtuZ8IAjo3kvNhVdP6Zx
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDE1MSBTYWx0ZWRfX4+XCT9lNgFys
 Xf3Slj/hsDb02E2wn91BZeaoIp1pXr2a9xlOF3H6Sfdabj3s6WG0FFcmHJaytQ+Wh/aTs0jCkcB
 1IOqE6qbHC+kAbbbxjX9yYhh5VZcqlY=
X-Authority-Analysis: v=2.4 cv=dcUVTnXe c=1 sm=1 tr=0 ts=6aa91efb cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=iP_vca1yj_mBCQa1ra0A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDE1MSBTYWx0ZWRfX5Yh5h4z87Qkw
 6YJc2a5mLFmZzldDJ8i01qoahmK47DqxOb/rZKQZkzK6yNi4PG1/1Tc/lDXbIczzEfZgy7aLbrX
 SpwsEmiDdgfSNo5D/gwkfw/Xp7fbeLVx8Vnm4HPdliIZ71lDtFU0GB26nXBvCbKylGUSMiNdKpB
 rC8F4oxRUc//lV+Ykkuk2XVf03R9tu91R2fkfRqUIdkPXil24HE6VMvNlEu54fadMy0R4xEQKS5
 FTOlpl9MWGJi2/bBd0SsJLIH9EMSLqexzizk9z1xhjXR5KgWO55Otiqx8zIZC5YpMnxOXqz+dN9
 3hAiwj0ysuzVNDOuKcC3mtMo0WKqucwiXmAl+j6PTEPGwggl8gCC3cIp2L9qESiyj9WTux++Rci
 Ct/qh5hqtaaMFg3V21JBAvmleAX9gKDoPHWr0JxX16Xe2VHsWA/1pzjq5qzbOr04qsvnX4yQZUQ
 WBL1YKQEkgAkr7w7g/A==
X-Proofpoint-GUID: wDy-rzUDXBEnGtuZ8IAjo3kvNhVdP6Zx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_03,2026-09-14_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 impostorscore=0 malwarescore=0 phishscore=0
 suspectscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609150151


On 17-07-2026 10:30 am, Vishnu Santhosh wrote:
> The driver hardcodes IRQF_TRIGGER_HIGH when registering the BAM
> interrupt, which overrides the trigger type specified in the device
> tree. On Qualcomm Shikra SoC, the A2 BAM signals an edge interrupt
> to the apps processor; registering it as level-high causes the
> interrupt to not fire, resulting in missed DMA completions.
>
> Use IRQF_TRIGGER_NONE instead, which causes the kernel to use the
> trigger type already configured by platform_get_irq() when it parsed
> the device tree interrupts property. This makes the driver
> platform-agnostic.
>
> Fixes: e7c0fe2a5c84 ("dmaengine: add Qualcomm BAM dma driver")
> Co-developed-by: Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>
> Signed-off-by: Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>
> Signed-off-by: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
> ---
>   drivers/dma/qcom/bam_dma.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/dma/qcom/bam_dma.c b/drivers/dma/qcom/bam_dma.c
> index 19116295f8325767a0d97a7848077885b118241c..6c3e2ca8a572fd04c925de0adbd5cc0616b361ef 100644
> --- a/drivers/dma/qcom/bam_dma.c
> +++ b/drivers/dma/qcom/bam_dma.c
> @@ -1303,7 +1303,7 @@ static int bam_dma_probe(struct platform_device *pdev)
>   		bam_channel_init(bdev, &bdev->channels[i], i);
>   
>   	ret = devm_request_irq(bdev->dev, bdev->irq, bam_dma_irq,
> -			IRQF_TRIGGER_HIGH, "bam_dma", bdev);
> +			IRQF_TRIGGER_NONE, "bam_dma", bdev);
>   	if (ret)
>   		goto err_bam_channel_exit;
>   
>
> ---
> base-commit: e43ffb69e0438cddd72aaa30898b4dc446f664f8
> change-id: 20260601-qcom-bam-dma-irq-trigger-0366e7e86f17
>
> Best regards,

Gentle ping on this patch. Could you please review it and let me know if
there are any concerns with the approach?


Thanks,
Vishnu

