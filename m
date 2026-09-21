Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A77E35AC3E
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 05:39:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789969160; cv=none; b=c7ynbuZghdo933LwnbnO+OAH94/2Uws9ZOXwWVwV6AsaxWwx5cMJQbE6kdO492roDocTr67hxaZnWg35v1xjLmHZWJoLoj9zUGSrA59qRRSXwasp5akMTwuTFxAHUJuBNsThDchi6tSwFJnPsfgaaQvpTxw3MguY4qoeo5dMzS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789969160; c=relaxed/simple;
	bh=ckeDfoYtT4vc3d31zhRnXO/CuhZsJQ1KSIZNH/l5iR0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Nl44NVnXtZf5qBzQfE77BMAmYwpN3KQXq+/UFxJ3lzSJOCgmtDvhtc8cpkkzWWMgqUoaHQfugWbm7nn3nxrO1IoLXGPANTAxta5fl8h6En5RaF8iMF6dbhW68wvwQPZfVz9jJrW5TGsm0sCKTBFgj4WEdmQC4Q6UtyEpkyc9MTs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SaeyI56Z; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ib+CD1z0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SaeyI56Z";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ib+CD1z0"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68L3Z6Tl485241
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 05:39:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cKK9mBGwMUrFS5FxrBeZmlrM3xkPOhWD7kTfcgRRwcs=; b=SaeyI56ZnXg1Qn4H
	bZZRXOt0tW/fl3+aA7y2Cb57O3jMg6Gp9MC8RFv3ka68mbtMDAkyu1V6Vvr98k6k
	y2hzCvev+GoQSZolH+5peEdcrTLKqfrjZQVGfxqMehLoN2tfdvTNeKUpg6SlneVD
	2yXfct+aNMf9HM3NzP9XM3mAUov7HfITeFQyKBG68ME+43nU4CW3ajwfbNh7GNJn
	lQeJagUT/PO5RCMlLzw4cGE+24JemlIHYa2rKMn3o/THwjB0gjRI6/zzQTL2ArnR
	r850AEfPS7RI4C06OkzrEvihUmAeSY3UUa7KeHi+MGIxvOBYF5dkXQZbo0Klyp7R
	VziV/g==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gtq7j928t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 05:39:17 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8632fdf67dfso3061941b3a.1
        for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 22:39:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789969156; x=1790573956; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=cKK9mBGwMUrFS5FxrBeZmlrM3xkPOhWD7kTfcgRRwcs=;
        b=Ib+CD1z09FTGU8pqoi8kZltrniR2SkmKtQDdPuQRNElLJVr+rBR9Ac85zp0kVtRRQ3
         TJ/1/35E5zditVgLn7HzQPipZJPOdGWmBd8QgZSMcVKHXXos8QXp59sCDYF/cgnvcHcJ
         3jWXqvgtP6cEn9XDUWvqUKcl9f+S85GTHzh73Mvsq+S9tf8AnqwAP270ylCRjx3oTPs8
         7CUqJ7h3S8cY4o3hn6NX4Q+tt7WxQMbFqooMSrbDJ9AdwZV1jeEus1SRMc7u1ekUyJLM
         r3E+twgpEtmWan42GZ45csE6CiKshaxJW6sP4exx/h2mdnbcxlQhH4mHNGIdBZUxuflH
         NaVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789969156; x=1790573956;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cKK9mBGwMUrFS5FxrBeZmlrM3xkPOhWD7kTfcgRRwcs=;
        b=wQ7szIWHGX6Dmbob0il6TMFt2eGAFrvDTFupYHV8IOwgIgeMS8mBDmCCmhRGMM3Sxy
         iBKSxBd08glLEzDpZWIQ3MOyX+pDRMYK5/flOJlfpuTNFt4ZU9iB/LF3uqo4/e4Z9kH9
         cduzZdcM306wAdPrqjmGIiqU6LfqWD+ybvhzJYBYwipmxihHOIocZulBOaDP7+nGYA68
         7diBdHMFSTwweavXvmVBk3QtEURXEvx2ckQ0T206sXHvDSssbNNPUS4kk/1Z99+OicbQ
         m+0PrgHSQyXvOH/yN68M8S032gV0LlhOdGSAzXMgJTeXBGV5LyZkPR//NGLki9zMsSDX
         8yvQ==
X-Forwarded-Encrypted: i=1; AKwUvByscMJX9PQq2NGZ5KiSJPKFKJl3iI2EsSCzSE5icmQT+w55PwsnColUAqXcmpIcPhHQQ3oaSDya1ADrH7Y=@vger.kernel.org
X-Gm-Message-State: AFuF++lVSTVqqxER4rNeXCw12qE9GUUpQNqEzYz2V4BdIKLnesC9jt/V
	xHgfEDekPCbV+hpctRG3mANor56xmYLP7XYpRWub6UNm+7rjrCK5rP+n5b3bS6iZDYQMKjd18ZU
	idESxWx36nBo3EVQw0Y3HcYL1lbhogx4eeF2gDGzV8YqdLBzFlAgiao4hKZSR2vLFRtE=
X-Gm-Gg: AYBFou2tTNs+xQ2i/o4BG0wOftdwp3enKYlqM48AM3wxgo9z1nQfT3Uhdb1tv0ODyAQ
	KCHs0sJW8eaxl3B//ziqr1/AAaXc+0J6BPPQssq6OTu7E35cJru6hrra4c3cmBVSj8G33+A0Aji
	aHnRvgi5nLB09L4dTJKQg3p7K5sU33LU9jIpxDyDex1CVaP2jgiwocRRJUIJ+UpuhXK2/RuebWb
	eh3jEnk+8DBmYezC1xRWqOaceQFcf2QRhF3Zv/Q6Edxp29OvBkS0bWrYvft3VN5WRYvHdPXAiSk
	dltuR5cFrUihA6sOm9eXWXgWvmAl0b85Vv9A7Df9RJpzHtgb1EJNOM+bCgtbvDOXiZkEl7UtW1x
	7BK6Pw6t7QPThdftaz8rUSK7efdAt0G0=
X-Received: by 2002:a05:6a20:3d24:b0:3d3:aed2:6f22 with SMTP id adf61e73a8af0-3dd726822f1mr17337612637.22.1789969156296;
        Sun, 20 Sep 2026 22:39:16 -0700 (PDT)
X-Received: by 2002:a05:6a20:3d24:b0:3d3:aed2:6f22 with SMTP id adf61e73a8af0-3dd726822f1mr17337585637.22.1789969155807;
        Sun, 20 Sep 2026 22:39:15 -0700 (PDT)
Received: from [10.206.101.140] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144e14dd04dsm6567930c88.7.2026.09.20.22.39.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 20 Sep 2026 22:39:15 -0700 (PDT)
Message-ID: <421128fe-9062-13b2-17c5-d6f0e318471e@oss.qualcomm.com>
Date: Mon, 21 Sep 2026 11:09:07 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 1/4] dt-bindings: media: qcom,nord-iris: Add nord video
 codec
Content-Language: en-US
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260919-nord-iris-v1-0-94428761ec06@oss.qualcomm.com>
 <20260919-nord-iris-v1-1-94428761ec06@oss.qualcomm.com>
 <aq_ayLVdWc1Mt0Wu@QCOM-aGQu4IUr3Y>
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
In-Reply-To: <aq_ayLVdWc1Mt0Wu@QCOM-aGQu4IUr3Y>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=HIZWhYtv c=1 sm=1 tr=0 ts=6ab0c305 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=NEAV23lmAAAA:8 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=mJZKqDEgVX8tH-exFnsA:9
 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDA3OSBTYWx0ZWRfX0eRUe2H7Vazf
 iOKn/jBjpJbLdA6LJ5upS8ZJpkeZJVlYOGStid+bnBmoSxGzKLfHFG5WxIhRJc0tXMkhUx2cexu
 sZcoB77sTV+r4weFbrKy81H0a3wlysg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDA3OSBTYWx0ZWRfX/G5vFfsDL4YK
 TYlbTjU/Pe+UMgyov+J8iayiifCGL/KiDOOQGrSrvO9yJTiiQGirs22cbn7oNhpceab4VjVFSzw
 0/9rYHz4P4Bu8AoCLd6MqVVUOOHsDZodJRCAEr9zSD/aq45KdQZ0dMt9UZR7Y23EinzteYTJTWD
 SsPoLWOPZGcmAwTcQNX6aUmsRDigYj5X7PmZjD5/sMK0MJL46sFnwH5YjBjz1abOsJg5TALJzsd
 NRPVe4aH59e6Nhe52G6Tb9M3SFHaCMIn4ZaVPU5xwJ9uSJhrxMVHdykQ7Dgm4X21Y8yT2pWEB1C
 UAbv3eRdFtAcvZCaxWB7BLKpaz0iJj0fGarskfmtW7/rPIGhqF4q0d2kJ2A+ZGzraGJ/jTO7YPF
 5fHB3p2ax1jnokUoA82P6w9OLO199vwrLl4I8GbVEZZ9+62EqSEmhwzyzPYXO3lFDLJa6gSx0XQ
 nnqvdO8Cjo4X/5QftLA==
X-Proofpoint-ORIG-GUID: 0U5dxiNRQkOO6VDfs8J8NK5tXbu1UulW
X-Proofpoint-GUID: 0U5dxiNRQkOO6VDfs8J8NK5tXbu1UulW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_02,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 adultscore=0 lowpriorityscore=0 bulkscore=0
 spamscore=0 priorityscore=1501 suspectscore=0 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609210079

On 9/20/2026 6:38 PM, Shawn Guo wrote:
> On Sat, Sep 19, 2026 at 10:14:55AM +0530, Vishnu Reddy wrote:
>> The nord platform uses the same dual-core iris video codec hardware as
>> glymur, with matching clocks and power domains. Add a qcom,nord-iris
>> compatible string that falls back to qcom,glymur-iris, allowing nord to
>> reuse the existing glymur iris devicetree schema.
>>
>> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
>> ---
>>  Documentation/devicetree/bindings/media/qcom,glymur-iris.yaml | 6 +++++-
>>  1 file changed, 5 insertions(+), 1 deletion(-)
>>
>> diff --git a/Documentation/devicetree/bindings/media/qcom,glymur-iris.yaml b/Documentation/devicetree/bindings/media/qcom,glymur-iris.yaml
>> index de4792f3b658..558b85ef9ea0 100644
>> --- a/Documentation/devicetree/bindings/media/qcom,glymur-iris.yaml
>> +++ b/Documentation/devicetree/bindings/media/qcom,glymur-iris.yaml
>> @@ -15,7 +15,11 @@ description:
>>  
>>  properties:
>>    compatible:
>> -    const: qcom,glymur-iris
>> +    oneOf:
>> +      - items:
>> +          - const: qcom,nord-iris
>> +          - const: qcom,glymur-iris
>> +      - const: qcom,glymur-iris
> It might be a problem of prerequisite change instead of this patch
> itself. But I'm seeing a CHECK_DTBS issue here.

iommu-ranges was merged last week. Please try with the latest dt-schema.
https://github.com/devicetree-org/dt-schema/pull/207

> Documentation/devicetree/bindings/media/qcom,venus-common.yaml: iommu-ranges: missing type definition
>   DTC [C] arch/arm64/boot/dts/qcom/nord-ride-embedded.dtb
> out/arch/arm64/boot/dts/qcom/nord-ride-embedded.dtb: video-codec@aa00000 (qcom,nord-iris): non-pixel:iommu-ranges: [629145600, 3663724544] is too long
>         from schema $id: http://devicetree.org/schemas/media/qcom,glymur-iris.yaml
> out/arch/arm64/boot/dts/qcom/nord-ride-embedded.dtb: video-codec@aa00000 (qcom,nord-iris): Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'dma-ranges', 'firmware-name', 'interrupts', 'memory-region', 'pixel', 'reg' were unexpected)
>         from schema $id: http://devicetree.org/schemas/media/qcom,glymur-iris.yaml

These schemas are defined as references. When validating a specific YAML file,
please use -p Documentation/devicetree/bindings/media option so the references
can be resolved correctly and the warning/error can be avoided.

> Shawn
>
>>  
>>    clocks:
>>      maxItems: 9
>>
>> -- 
>> 2.34.1
>>
>>
