Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CD803793B0
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 15:01:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789570867; cv=none; b=hhpx8880ltODZSs+9NzwuXY7GXDsHENq9Bthgk1xtQiP9ysRVQzvat9/P1ZmWzt9VlDeQCEnff4RlOUYDFHhQrPFRzx38MO9kcz/iwAcuCPtGtHGuACmT2A7WZVTemYRspckuR8PqI+yxbH743NrVUyGkcgpjyimNv10H3MNRiU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789570867; c=relaxed/simple;
	bh=bB/7vhXoE0ykCnHM97CE7sp1Ib7yxq2wNHywlTv0Aa4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Xv6ATMWlDKTJAe9q9YFk5mbzC2IM00C76fGO13SSrcxgNNc7qzOSdMNYCW+zLydsgEa8cE9nttBSez0wwLRLCzhYRWvBj52BH60ntFIZdly20fezIHLGphC6rkyBbK/D1xiX7mvwniJ8TVFYPw16r1UNuel8VaONYmqjR4ndT9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Vy/KB4PM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=I8Q/VyCk; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Vy/KB4PM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="I8Q/VyCk"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68GEZX7I2852410
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 15:01:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fJRqo4fa5r8K+BgNujQkH+UdzXPRZZmUzCKYh3BrEjM=; b=Vy/KB4PMrSnE4YBP
	uhs6xA+rnTaPv4eiMrIhJBSsNN4Eb7gDqLx56+cwHpnrYnFXKw4i4X50qfayKr+9
	GrcK/NoR56LaRU+jLnZNci+q28XlCssQUgo2umCirws3wKMinXfS3RtxGKXm8ab0
	QRQ+tKircg2puofY9y5V+G+On9bcEUnBoE42w4En1ywHl8Hfdr65kPdZwt3jLiTJ
	wl0BKn54B89Q9wJiNUJmwrve+8woMTmVLSN3tYvVZnxLUlEYRG8uavvGZNBZAd/4
	lQS3eHfkqMdMjI6Kdy//dQMEZ729UGXdhGg3LxlDyQAzlJSzB2TrU3TytJrbPbe0
	NPT5DQ==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqkv7jkwb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 15:01:03 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8632fdf67dfso3310196b3a.1
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 08:01:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789570862; x=1790175662; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fJRqo4fa5r8K+BgNujQkH+UdzXPRZZmUzCKYh3BrEjM=;
        b=I8Q/VyCkzxu0hSCuou/GHvMqPw/CjCsM0Yr1CKTlGtFYDYlKhI0SxrDLabuCp7y+wb
         j5HTheWcycYiPc0LPQQiFVznPO8zosggAB+G6uOId1y+2rK56ZccEj5GiDGZCCfg3ZRj
         YnfjI0Hwe/Gbiq6/1362iNFJqnFyMkTiahCwseoWJV8cYIlVV6A/VGJ/obwCgDp0a0uv
         t4HnhS9DE35GdzHlTepYgogPiozOd97JiRdqlzHzKco6rXtcNC4TnZHq5y9DMeIS+0DE
         G3RdwLPImmCmlyR+ecskY+9u/f36szvajaHV/0FkIAAsc/SrjIIT5qOb+7bhOTN2xlq2
         s/LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789570862; x=1790175662;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fJRqo4fa5r8K+BgNujQkH+UdzXPRZZmUzCKYh3BrEjM=;
        b=fNHJciGQqvOX5TN5Xn07EkQ4bFldZS1jZE88G6SjNq818inE/BNdKl1jRCjSB7IJrb
         95BCiEnEAE2wU9EBHSBr2TIp9vxikXj5v1dvzmd2yOefA9B+OsXoNt+AKZos5jsHuggt
         iHYFQ05+DkkNX+NC2fInWYMXnKQ/aVJ4SNv+95/qtHq5v8BpF4rExF4nT31g5or+h9+2
         JmPVnSJHbaMSniXXl4tGSXkk54a/3gVZGw0aXso2Q5fIIXYtvfck7DU+nXTdmabD7VMc
         KSSc2yKzlUQffp53C13ywPuO3H4h03Vuv2W6i+fxNHNqlp4/HkhRD95QU1trx7RMGFCC
         MG1A==
X-Forwarded-Encrypted: i=1; AKwUvBwl+hF6L/yL3w7JJ/GBQ1JbTgqaR05V4QYerE7kta6lkd4HCXzA+xdacnAZENDsrEiEs8bWu8thuP+7eSI=@vger.kernel.org
X-Gm-Message-State: AFuF++muHbvdxLELRZK+Iqqdh0b2mINqMLVNxhtkd0TWeNZiX7pgy8MP
	xF1ASY2/DcRU5l228FFRJezgsnNCIe9Xcss3l9gq+AQMnUqH9jQQLNtkVSAhN+qXT0ScpgOVELO
	i3AGEFnZ+7fQrsLhug6mpu6/tSpQc4DdihQcw8Tsmt2UUgbDs8Fcn6Pocx1jJr0/MNOQ=
X-Gm-Gg: AYBFou3ywyuWHvQUw1yPksyV5ZpAwLEOslVJIApxPoXuvuFs7I+Hu5/2mzK7b9zFJEd
	po8Xkv0ePY+JHXHdR7S/M+7aUepJP2MAJzRMuRGnVAUDOt0Bq1tpkyGPzrFbdrR7+7Dpev2oPpj
	kZ8XwUpaXCb1vjc7Ds6QFWXHu9gXB3XsaLYte+syk55qaSSuvICQtHuarj/XjQEWBEE+xqlpBGy
	eJJQGyX4UT0hF23ISoVHM/jwzwA4CJ6P89IqC3nkpyWSMadiBKriUcqgxVx9lBIQwuM6pzrgbDQ
	tthb8aW3pU+RUqIqOfx1jZVZJ1EY2Ze1aSaxcyYZIeFtepqDbvS2Hj0HTaC2m+78NOhyUP88fy3
	o576r6XpVvGT3SxKVFQtvnrgKezEBnWQhMw5jAA==
X-Received: by 2002:a05:6a00:8089:b0:84f:6f7e:493 with SMTP id d2e1a72fcca58-8723208dcb6mr4375230b3a.3.1789570862323;
        Wed, 16 Sep 2026 08:01:02 -0700 (PDT)
X-Received: by 2002:a05:6a00:8089:b0:84f:6f7e:493 with SMTP id d2e1a72fcca58-8723208dcb6mr4375119b3a.3.1789570861619;
        Wed, 16 Sep 2026 08:01:01 -0700 (PDT)
Received: from [192.168.0.116] ([124.123.146.251])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8720172b13esm1419604b3a.33.2026.09.16.08.00.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Sep 2026 08:01:01 -0700 (PDT)
Message-ID: <64fc0855-3dd5-4668-9d4d-bd82be246de8@oss.qualcomm.com>
Date: Wed, 16 Sep 2026 20:30:55 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND] dmaengine: qcom: bam_dma: Defer IRQ trigger type
 to device tree
To: Frank Li <Frank.li@oss.nxp.com>
Cc: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
        Andy Gross <agross@codeaurora.org>, linux-arm-msm@vger.kernel.org,
        dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org,
        Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>
References: <20260717-qcom-bam-dma-irq-trigger-v1-1-6405eac86f00@oss.qualcomm.com>
 <aqlQ_y-um0yqo6jj@SMW015318>
Content-Language: en-US
From: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
In-Reply-To: <aqlQ_y-um0yqo6jj@SMW015318>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 5OEnq1Fu9ndXZ80CIaHUpsmColrALoiY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDIwMyBTYWx0ZWRfX+V+UXYlqYiEG
 PvL+DZ9m1YdQUTJrv0MlWMw9V5zhfm6yaobBw0V/r10VOX9WuhghjROuNxlo+rfb7J1erk/7ZNS
 n7YDKx8eUVfV66to8GV/cG9SndxgmAkAvPkNeW788zdUTHS7tG7le8pPfZUPj+3bfXQBFYDkQQH
 dkPOH7293zhpvulkzfGrkj7P6U6+Lbwr2/MzPQ7KVjPZJNwXQjKU7Hd3gqFCdgMIGG2XHi/KmF6
 Vb3J1SToPu/X7kz7NoXrclhdeprojhoeftr6onaGCUY2xdYiAFyuKUa8Sp2whTJHfSm0GOoLmmK
 cCifTnyma34oPHZAFvfEINx6V6G3YQ52vdzvS16DQE/wDMA3ydMESBKOQumQ1Ji29W+aPafQiPZ
 ce1IySzK3JS5gKg+m/tPlC6h8c/AF56MblEBkMOTs/AbiGL6E5WbVUZktpDYOPkN8RUUHfugIV6
 933ces0rH3FL6Gi/ROw==
X-Authority-Analysis: v=2.4 cv=eKmGH3p1 c=1 sm=1 tr=0 ts=6aaaaf2f cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=K/78aEDNEn2Q/Yuv7mVN5Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=P-IC7800AAAA:8 a=EUspDBNiAAAA:8 a=8k-RipbJOExq7qeMm_4A:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDIwMyBTYWx0ZWRfXyOmDUJw8JxK2
 eq1iE7mmWKaOtKoFGWBCjkYuYaSznr7EBq9AOGjzORCVPulLdm9nchtkK+Zkn3ObZLz5UG4nqI4
 FyPGJn1tmYw4veLplvZj/0d+CWFIctg=
X-Proofpoint-GUID: 5OEnq1Fu9ndXZ80CIaHUpsmColrALoiY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-16_02,2026-09-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 bulkscore=0 clxscore=1015
 phishscore=0 spamscore=0 priorityscore=1501 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609160203


On 15-09-2026 07:36 pm, Frank Li wrote:
> On Fri, Jul 17, 2026 at 10:30:28AM +0530, Vishnu Santhosh wrote:
>> The driver hardcodes IRQF_TRIGGER_HIGH when registering the BAM
>> interrupt, which overrides the trigger type specified in the device
>> tree. On Qualcomm Shikra SoC, the A2 BAM signals an edge interrupt
>> to the apps processor; registering it as level-high causes the
>> interrupt to not fire, resulting in missed DMA completions.
>>
>> Use IRQF_TRIGGER_NONE instead, which causes the kernel to use the
>> trigger type already configured by platform_get_irq() when it parsed
>> the device tree interrupts property. This makes the driver
>> platform-agnostic.
> where show this? can you point me doc or code?
>
> Frank

Hi Frank,

The BAM driver obtains the IRQ through platform_get_irq():

bdev->irq = platform_get_irq(pdev, 0);

in https://elixir.bootlin.com/linux/v7.3-rc3/source/drivers/dma/qcom/bam_dma.c#L1270

It then registers the same IRQ with:

ret = devm_request_irq(bdev->dev, bdev->irq, bam_dma_irq,
                          IRQF_TRIGGER_HIGH, "bam_dma", bdev);

in https://elixir.bootlin.com/linux/v7.3-rc3/source/drivers/dma/qcom/bam_dma.c#L1335

The comment above IRQF_TRIGGER_NONE in include/linux/interrupt.h
states that when no trigger flag is specified, the interrupt uses the trigger type already
configured by the machine or firmware.

https://elixir.bootlin.com/linux/v7.3-rc3/source/include/linux/interrupt.h#L25

Therefore, IRQF_TRIGGER_HIGH overrides the trigger type associated with the IRQ during
DT/IRQ-domain mapping, while IRQF_TRIGGER_NONE preserves it.

The Shikra DTS which is still under review describes the BAM interrupt as edge-triggered:

interrupts = <GIC_SPI 74 IRQ_TYPE_EDGE_RISING 0>;

This driver change is needed so that the DT-specified trigger type remains effective once
the Shikra DTS change is accepted.


Thanks,
Vishnu


>
>> Fixes: e7c0fe2a5c84 ("dmaengine: add Qualcomm BAM dma driver")
>> Co-developed-by: Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>
>> Signed-off-by: Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>
>> Signed-off-by: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
>> ---
>>   drivers/dma/qcom/bam_dma.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/dma/qcom/bam_dma.c b/drivers/dma/qcom/bam_dma.c
>> index 19116295f8325767a0d97a7848077885b118241c..6c3e2ca8a572fd04c925de0adbd5cc0616b361ef 100644
>> --- a/drivers/dma/qcom/bam_dma.c
>> +++ b/drivers/dma/qcom/bam_dma.c
>> @@ -1303,7 +1303,7 @@ static int bam_dma_probe(struct platform_device *pdev)
>>   		bam_channel_init(bdev, &bdev->channels[i], i);
>>
>>   	ret = devm_request_irq(bdev->dev, bdev->irq, bam_dma_irq,
>> -			IRQF_TRIGGER_HIGH, "bam_dma", bdev);
>> +			IRQF_TRIGGER_NONE, "bam_dma", bdev);
>>   	if (ret)
>>   		goto err_bam_channel_exit;
>>
>>
>> ---
>> base-commit: e43ffb69e0438cddd72aaa30898b4dc446f664f8
>> change-id: 20260601-qcom-bam-dma-irq-trigger-0366e7e86f17
>>
>> Best regards,
>> --
>> Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
>>
