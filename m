Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6949B31985C
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 05:05:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788930308; cv=none; b=TiVfyB/SI/MdgjzZvmJOzqHkGKloP6PXOPCn7PcwhfS8ZmJ+FPZylVpysJihterwwaZUOSUyVJfRtCetaDUq8nN9bxvBh7ZtiiY4l3oQ4lyk39r1tr5jj6CB+NU6ext9j1CuZrVBhCfFu3hf/1jr9PrxEW+dyOH+ggs5KDFLhcw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788930308; c=relaxed/simple;
	bh=CKdRM5fSMd2cujrUt2fuU6ccWuxsQFIGjUemrc2ZJmA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eRsCFoqfPOBA+RIQRjiZj/PwW/ZQ6VfuXPY8VuwfuhwYugc44T1yphh2T1EPi7jBsykZvoPzDDX+lPsY/RiyRGW0QNvPiNlCXJfZAakI9djaV+huaNfNGuHJC7n+JlVrMw1Tc1rI9v1AQ4PcwFdRJ66BirzMY3Jwxo1tf/yBHWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JJHeJM9s; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LeovFJLN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JJHeJM9s";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LeovFJLN"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 688MfulW3817272
	for <linux-kernel@vger.kernel.org>; Wed, 9 Sep 2026 05:05:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LZSTs+CvtHAB1mwHgOV7ZbDB5Nlf194yh6i3owJzkNU=; b=JJHeJM9sHMUTb7pk
	RFPVbOQSGGTNLCG3o4Kv5JEXpZ4f8C8yXpBNusZyTtBDRPlgI72h7aFMKu82m35l
	f0eXa55zJvF6wFvOj/qJ5mqoL/+TTiZdcAizujEyiztZhImzfDihW/F7LT5jh39K
	1CNcqTFQMhieT3r8zwt1ZwFVJxM3lb9+P5g0DYqAon+txLeWN/tUOsdsJ88wnniz
	S0riGdr0dUCysYLu/TJPNxeWMGVqEgwEDOwbhYk3wE4F+I9+zjjKi5DEAxF3U5eT
	RPUKXZWatZEFTdrGjlFohxKpQVkGpJOZ0qYW2jePB+Y8Ga30NRfI38hiH9O1k8gy
	jqeBEw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gjstu9fgn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 05:05:06 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3968dfff779so7448414a91.1
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 22:05:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788930306; x=1789535106; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LZSTs+CvtHAB1mwHgOV7ZbDB5Nlf194yh6i3owJzkNU=;
        b=LeovFJLNWBgAN6pWQNT7AElzWZ5YNiznDDlzkgKLpNG1uwr6RmuRXTAAbiXf01UxMS
         DenF5tnE81IwZXxM93rCTg06Co+FkY8t0D2pdjes71saEXjaH6Uh9ysu0sb1YFwMkPAx
         KjuhSgAdPpZOoJ+OCyU9zsEJFBrOaq9G6ESMgaXTHFtpRHnSL8tCzrNn7br804BrWdMv
         +KpyFP2vERzqCPlGOVe//9G2LyqnTdsDp/DTmuPBpxXkXS2VPdK7KPTxcrLPLu4mpj+J
         NT0E4qEd3yNAo5LXw1+D6IXGcUnRSu5cHV/2BBzcKV4Rtu66dXXTZlhwJkvdl37iCz8r
         OwRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788930306; x=1789535106;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LZSTs+CvtHAB1mwHgOV7ZbDB5Nlf194yh6i3owJzkNU=;
        b=VgXqugxeiMMEiMR8URmJazaNOB6dfGLhn+l18C4lTkDog/RfHy6oHyGJmfUTJT2eRo
         rZo2beGYxXeNHz8EwLOC7akzOanp4wSHndctt8OZX1AyYYBatphvvR3zFENL7qVCKcp4
         3eRrgmXBUBv6o8q27azd5TuJU2o6niFkMLjGSV/AxKuXFK592M6RvjWO/Q7gqxyy3qK7
         ViBFhoqCdFrP6CHmLBnnHfW5yOev2m3Sg6M0DcFGVngN8hTEws7j/odKiwH7sz0TqZ9k
         1iPCCbDxPXlG5yPG4pHr7AFPDu14IelasKn/hW72em9RpDHA7qO+dKIlRxxGxd6+eg7h
         4gpA==
X-Forwarded-Encrypted: i=1; AKwUvBzGq0EcvworLuGFuoEdsQskCH4kpukj0ZWWUw/4Mr9ZcPViRCx/puSjbUtSoh7iHKp1gRFO8F0/qGv73n8=@vger.kernel.org
X-Gm-Message-State: AFuF++lY2QBQDYMwjg2YZBKI14ojunEnHAqZLcvHE8jcHDnxvp0bqcPU
	PDbl046fy9nzp5Gr5ga5FkTHcdk+xuBRuWaKJSvkt1Xje7kDwKLonlHdipZe4cynLxlxd2CHWhK
	YA6XwmiTdmakJj8Bt09w/eGwCrsoxdXjUoXnnirqZxMHoIRpkcfIYNFUwAbgZfL7LObs=
X-Gm-Gg: AYBFou1oiTg7/XfBx8+7EtTEA7LJKU94lcvN5Kp9MggxNvlUCSnAEHM4Vs05gu+6kKz
	kKe0e6bTNagOFM502kHU9PJjQbimUe6cIKVKj9icD1BUEOh3P1PTYfS8W4GZx+pHcplirvwmJfK
	ysQAMHrcZ6emf/t5sgf29J/J8mZsSY3tq2Whcuy0dnw5+4v8jr4xBLm7LsfGmi2RBHIc6EqOnkp
	OOEOEc528vWFJN+Rvlg4Q7R0sTgZhlvTxdxNECj//3dno0ul80mV+FqCN7pEpKwwYfG2wgtE1wo
	tENJvDLw38FUxdzcGNIHVfC3C4wI2cpSz6BReBiXOysD19vJxmeGhi0aRLmDSCIJK7/+gLxXQGx
	QGlpuhlOJhY+Bhk31s9tuyoGyrg5F
X-Received: by 2002:a17:90b:538c:b0:398:9beb:a2b4 with SMTP id 98e67ed59e1d1-39b087992ddmr39690330a91.22.1788930305802;
        Tue, 08 Sep 2026 22:05:05 -0700 (PDT)
X-Received: by 2002:a17:90b:538c:b0:398:9beb:a2b4 with SMTP id 98e67ed59e1d1-39b087992ddmr39690273a91.22.1788930305342;
        Tue, 08 Sep 2026 22:05:05 -0700 (PDT)
Received: from [192.168.29.58] ([49.37.154.50])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-336c2571039sm20745950eec.25.2026.09.08.22.05.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Sep 2026 22:05:04 -0700 (PDT)
Message-ID: <50e348ef-2d9a-4197-84ca-99d3902cbc37@oss.qualcomm.com>
Date: Wed, 9 Sep 2026 10:34:58 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V1 1/2] scsi: ufs: ufs-qcom: Add specified gear support
 for multi gear scaling
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: krzk+dt@kernel.org, robh@kernel.org, conor+dt@kernel.org,
        andersson@kernel.org, konradybcio@kernel.org,
        James.Bottomley@hansenpartnership.com, mkp@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-scsi@vger.kernel.org,
        Ziqi Chen <ziqi.chen@oss.qualcomm.com>
References: <20260829074355.946543-1-nitin.rawat@oss.qualcomm.com>
 <20260829074355.946543-2-nitin.rawat@oss.qualcomm.com>
 <stik7u2o6ydje6ws7cyrltmdw4wz6iyximnxeyegw2f562b2bv@4m2sueuuzisb>
Content-Language: en-US
From: Nitin Rawat <nitin.rawat@oss.qualcomm.com>
In-Reply-To: <stik7u2o6ydje6ws7cyrltmdw4wz6iyximnxeyegw2f562b2bv@4m2sueuuzisb>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=ItAutr/g c=1 sm=1 tr=0 ts=6aa0e902 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=FrNG0DaaYUTAIW4lgu81OA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=hgvoHBFRqoCwco_ImLEA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDA1NSBTYWx0ZWRfX3ZVQPGITiH7e
 0jcg32IPdnJj7lrbKtO9WMpoHdWuvuSk4+LPewmc3BJDjiIcuqbjay2FEfLAF3bgOasr4+XTHN4
 C4Kj0fZR90MVp2zBsgPV2DbTNpHgjL4=
X-Proofpoint-ORIG-GUID: mOkm9xLZG1KcbAQjJQnPu7b7FMYsjf_w
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDA1NSBTYWx0ZWRfX99atJSexsAVs
 KDw2ZSMim3TCHwvvKfPjwBhshws3mPuNCAzSTlhF5aBcORnOT/xW9Cohdqj9fkvL2wssktM5FFa
 IAc1WgWkS3tDzpGjw/NKTMHDPIZbO9+PGpe62YhG+MKs62ESSFsu0XRs42Xrn0Hp0hQiFY5te+I
 kPps5UVNNCzab40+ytMxPiuyQhSbTfx9M4o+dR3T2K7w0fAdVAV73xnyVyhqZL2m+GfUGELxxhb
 eZUoUcxUIOhR26+QCQBWO7jOcEgi5YFLJbhI+hoWhABkJljNJHJ1SVcj0id77XuBZlSN9joBHLh
 GUxNrSuqiXuJ3+O7936UmV77t/ZMiArrsQm/yYhTX2o9Yi09g/tWEIwh8U4aIC7j7ARs+F6pmgG
 M+JPlV/lXVGaVGhHlGRA2MY6WIxk//a+Q1NADT8t05HbI8KbjRCbxxjOX6V2tEM8miHi1XP2wp4
 NtYiEcB/lhmyyBFOOqQ==
X-Proofpoint-GUID: mOkm9xLZG1KcbAQjJQnPu7b7FMYsjf_w
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-08_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 clxscore=1015 impostorscore=0 phishscore=0
 suspectscore=0 adultscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609090055



On 9/2/2026 9:32 PM, Manivannan Sadhasivam wrote:
> On Sat, Aug 29, 2026 at 01:13:54PM +0530, Nitin Rawat wrote:
>> From: Ziqi Chen <ziqi.chen@oss.qualcomm.com>
>>
>> The UFS clock frequency and gear speed do not necessarily have a strict
>> one-to-one correspondence on all platforms. Introduce a device tree
>> based configuration interface that allows specifying the HS gear
>> speed for each supported operating frequency via the "opp-level"
>> property in the OPP table. When this property is not configured, the
>> driver falls back to the default frequency-to-gear mapping table.
>>
>> Signed-off-by: Ziqi Chen <ziqi.chen@oss.qualcomm.com>
>> Signed-off-by: Nitin Rawat <nitin.rawat@oss.qualcomm.com>
>> ---
>>   drivers/ufs/host/ufs-qcom.c | 30 ++++++++++++++++++++++++++----
>>   1 file changed, 26 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
>> index 0f2e083b04fd..aa2ac2cd2b69 100644
>> --- a/drivers/ufs/host/ufs-qcom.c
>> +++ b/drivers/ufs/host/ufs-qcom.c
>> @@ -2460,8 +2460,9 @@ static unsigned long ufs_qcom_opp_freq_to_clk_freq(struct ufs_hba *hba,
>>   	bool found = false;
>>
>>   	opp = dev_pm_opp_find_freq_exact_indexed(hba->dev, freq, 0, true);
>> -	if (IS_ERR(opp)) {
>> -		dev_err(hba->dev, "Failed to find OPP for exact frequency %lu\n", freq);
>> +	if (IS_ERR_OR_NULL(opp)) {
>> +		dev_err(hba->dev, "%s: Failed to find OPP for exact frequency %lu\n",
>> +			__func__, freq);
> 
> Don't bring back the '__func__' marking please...
Sure, will take in next patchset


> 
>>   		return 0;
>>   	}
>>
>> @@ -2489,12 +2490,32 @@ static unsigned long ufs_qcom_opp_freq_to_clk_freq(struct ufs_hba *hba,
>>
>>   static u32 ufs_qcom_freq_to_gear_speed(struct ufs_hba *hba, unsigned long freq)
>>   {
>> -	u32 gear = UFS_HS_DONT_CHANGE;
>> +	struct dev_pm_opp *opp;
>>   	unsigned long unipro_freq;
>> +	u32 gear = UFS_HS_DONT_CHANGE;
> 
> Nit: Preserve reverse Xmas order.
Sure, will take in next patchset

> 
>>
>>   	if (!hba->use_pm_opp)
>>   		return gear;
>>
>> +	opp = dev_pm_opp_find_freq_exact_indexed(hba->dev, freq, 0, true);
>> +	if (IS_ERR_OR_NULL(opp)) {
>> +		dev_err(hba->dev, "%s: Failed to find OPP for exact frequency %lu\n",
>> +			__func__, freq);
> 
> Drop '__func__' here and below.
Sure, will take in next patchset

> 
>> +		return gear;
>> +	}
>> +
>> +	/* Get HS gear speed from 'opp-level' */
>> +	gear = dev_pm_opp_get_level(opp);
>> +	dev_pm_opp_put(opp);
>> +
>> +	/*
>> +	 * Greater than max gear means that there is no specified gear configured in DT
>> +	 * or the specified gear is invalid.
>> +	 */
>> +	if (gear <= hba->max_pwr_info.info.gear_rx)
>> +		return gear;
> 
> Sashiko pointed out a valid concern with this check, please take a look.

I reviewed the bot's comment. The concern raised applies to the case 
where the gear value provided through the device tree is higher (for 
example, 5) than what a UFS 3.x device can support. After link startup 
and negotiation, hba->max_pwr_info.info.gear_rx would be 4. In this 
scenario, the condition below evaluates to false:


 > +	if (gear <= hba->max_pwr_info.info.gear_rx)
 > +		return gear;

Execution then falls back to the switch-case logic. If the current 
frequency does not match any of the predefined entries, the function 
returns UFS_HS_DONT_CHANGE, which effectively maps to the minimum gear. 
Shahiko's suggestion is to instead return the device's maximum 
negotiated gear using:

A couple of points to note:

1. If the current frequency does not match any of the expected frequency 
entries, that is already an existing issue. In such a case, simply 
returning the maximum negotiated gear may not be correct because we do 
not know the actual gear corresponding to the currently programmed 
frequency.

2. The patch under review does not change this existing behavior. It 
only addresses the handling of gear values that are within the 
negotiated device capabilities and does not alter the fallback path when 
the frequency lookup fails.


Considering the above points, I believe no changes are required for this 
patch at this time.
We can revisit this behavior separately and evaluate potential 
optimizations in a future patch if needed.

Please let me know your opinion.

Thanks,
Nitin






> 
> - Mani
> 

