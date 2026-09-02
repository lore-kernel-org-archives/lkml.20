Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD5D43C4575
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 15:33:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788363227; cv=none; b=gScXtxMy2xgTHwovziWadAzgdkNLt1PwjV9Op9pBzB13+zsBUFi8ha+VtUrNVsb0ph3uvTm0OLEIeHe7I0+ohLKXAfQfilNbwHnWzTs21bACZOfSKp+N+BHunOMeWyPm4EpUVf1ARlO99skFbYhL27Q4BoOmdPPOSiQ2luNpi7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788363227; c=relaxed/simple;
	bh=6lYF9KV2HEwLFq6+al6aDkTRtGMquGYtFJdFYnQXEN8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XNlDLEz7pd7k7BGblze+rkD8CvzHusx1ck749c3YhCbFnPabF6UL1ufHUZsVM4Lrf8HWwOwkTHUVkuEatpSxfg7rQ/1u2Y/jrHfSiURxtWUN3Cdl1V9MjttVb0xEMbObF0xXShyws5jpLKqRta8T++fHBloXOcpMfUVoD4TE9Mg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GE5dYC28; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ektIQOEE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GE5dYC28";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ektIQOEE"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 682DHKMu1046819
	for <linux-kernel@vger.kernel.org>; Wed, 2 Sep 2026 15:33:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rEUZ3PVE55ql740l9KlzWi1uLalDgnols2pTFF/fh60=; b=GE5dYC28o04T50C0
	MXh94TFSKPDeiSYrFJ1HggyWYY2E7z2bj12OGdQ9WZVTbNggrcxgO57Nb2usJh1o
	N/1ujNarxL4hmJeNoiMB1634vamDrENqIR30vnWvna+bPUUs4gKUVQr3Wjphgjpv
	+9ICOfwtZ4C7UREApQ0jio9n0N9EXHu/Q9Em9LqQKjIBun/kwmJv1vV1LjokUGjt
	uPtIX0yx9J35OEPpdfGMHgPybL7JNDjhVQlpX5wzKxOVMY7bV2bfY67irjMEt2xS
	2le7WpLIxdWm589t5rXlUrwQTiJF2g/qzPJUdrCIHZUnkR7kSg8fMNtg+wqdpws/
	0mNTUQ==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gemj4rhc3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 15:33:44 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cc2229450b4so1223760a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 08:33:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788363222; x=1788968022; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rEUZ3PVE55ql740l9KlzWi1uLalDgnols2pTFF/fh60=;
        b=ektIQOEExPBBQ8KqOSt0nLpKal2fSowYr+3KxPBDKTMXkWt/N8874yWx4a7gvhVrD3
         sjhQ8BDTTyxI0tpUs4HPvdmTxMCsBHh8NdEVUw9pGImUvTJy4+5PO/vF7nx3jAVlDW/l
         uq2gUXqC6+/dL9k2ZxrUq8ANVLV7GpzObOqmOTbHCXg0QH/AIeF8zf8NwHlGOnyDj/pE
         O59JtNShILPXlw270cBlBn33lxo8aK3hXDq2Zcs7B0PlxFarepIhkx2wgvPuWBSj4VeP
         2LPg/eHMGV+cOANNbMMYGat8/Qg7swHXv+rccXNvG3XeUyHf8JfRMBcHlnaPQcxZ2lon
         qvCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788363222; x=1788968022;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rEUZ3PVE55ql740l9KlzWi1uLalDgnols2pTFF/fh60=;
        b=Apb+aVGlBGFRZ1Xf4zt+jTTeQFGmKMM7qf5RfSO8T5jv6TJLdJonTfREMhZcDF0TpH
         O0pJF+faj1ewaTBCN16ZiZqzhbpmKX12RZJgQjDGed/OHBvXtfZWNG6rvq7VGsE9tmC2
         ulcCW2QbUL9bAG0NVC8WLyfLjaGSGMbAwY+RFZbXTCusX/11Fgk+GcmkefFfY3LcO8Km
         uNBlHaLeoZ/P46hnF0K+XD6wUrhIVZFMW73ZBj63tDJdNsY3XKz6nFuShI3Q7bJBmgRA
         C47YefCWlgAHW8dsTne5uhxBdI6SMIL/KK9FXc5INzmP6UNH88g0j+XTGCrEs0QfdgEL
         D4fg==
X-Forwarded-Encrypted: i=1; AKwUvByScUiiT35uWlXCofVuXnMLCYpe3SL1hLz2FlcFkcToxNrqe/p/JZpt6Uk6B+YeAfpZV+I9U+/5R3Uky4U=@vger.kernel.org
X-Gm-Message-State: AFuF++lT5rk7Q/cQjeFhQQPN5ZXu0h43nXuuuw62HfbFPlr/LZ/lasFh
	oy7iiElwgwZ7UhxwR3+TUdAugj8otbcES1XB/G5sq7awZqwC4WBep5YwTEkVR4jTXH4Zl29OfdX
	y2GuUW6iPYqu4jL2hFiQnf312q5iX4MEgZSlxQIq6WyRcSK7XUuUFahfG/zGNTDW641Q=
X-Gm-Gg: AR+sD10BpixDEmblr5UgS7NipPLpDLb0yNP7KnR1BDmz59VbVNEiNAUDhhP5PmQIpaa
	aHOiezUbaUYORS3FoX389rTJGMoYyxeNyegPB1zQt2CGkk41+3qVHb7qd9esQj2s1rjFdJhuw8p
	4pN7Izzhlfefll3UKvF7eNpebJbnkZblUYqG5NdgOdCarruZJ8HBwp19x5DefvHJ/oNR/N4e0aZ
	jzUfGDZ5ksSAw2gP7g7bgSLFayVdckPI36+xIGvgN+z4hW/4znG8k+Tzhaw6QNjnkLn6abrWmjm
	6gFXDsnckKD716nT4cd+jLVJNCOnCxeec0CCRcGWgGTlDrdyo7r9RZ/SW7WRU9P6Gr4mvc110+m
	5s779Csr8mg1ohXVkPleATNqUH4oWMVik35yvxhSSA2bv929U5QA9Fp52vw==
X-Received: by 2002:a05:6a20:9f43:b0:3d3:adbf:777c with SMTP id adf61e73a8af0-3d9aecf72e3mr9896572637.24.1788363222087;
        Wed, 02 Sep 2026 08:33:42 -0700 (PDT)
X-Received: by 2002:a05:6a20:9f43:b0:3d3:adbf:777c with SMTP id adf61e73a8af0-3d9aecf72e3mr9896470637.24.1788363221571;
        Wed, 02 Sep 2026 08:33:41 -0700 (PDT)
Received: from [10.110.114.54] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-32f079ee369sm7964033eec.7.2026.09.02.08.33.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Sep 2026 08:33:41 -0700 (PDT)
Message-ID: <418e2285-bb95-42cc-8543-bd540df9d0b5@oss.qualcomm.com>
Date: Wed, 2 Sep 2026 23:33:33 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 03/11] soc: qcom: crypto_virt: add support for create,
 prepare and import keys
To: Krzysztof Kozlowski <krzk@kernel.org>, ebiggers@kernel.org,
        axboe@kernel.dk, mst@redhat.com, jasowangio@gmail.com,
        James.Bottomley@HansenPartnership.com, martin.petersen@oracle.com,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        linux-block@vger.kernel.org, linux-crypto@vger.kernel.org,
        linux-scsi@vger.kernel.org, virtualization@lists.linux.dev,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org
Cc: neeraj.soni@oss.qualcomm.com, gaurav.kashyap@oss.qualcomm.com,
        mani@kernel.org, andersson@kernel.org, konradybcio@kernel.org,
        bvanassche@acm.org, alim.akhtar@samsung.com, avri.altman@sandisk.com,
        stefanha@redhat.com, pbonzini@redhat.com, eperezma@redhat.com,
        xuanzhuo@linux.alibaba.com, linux-kernel@vger.kernel.org
References: <20260827160806.1295313-1-linlin.zhang@oss.qualcomm.com>
 <20260827160806.1295313-4-linlin.zhang@oss.qualcomm.com>
 <4594e3db-a8e3-4f8d-95c2-a4edcbc8ca7c@kernel.org>
 <40156974-6637-49b7-8629-11e7d0d4e55d@oss.qualcomm.com>
 <650ac172-312f-43a3-ab5f-82318796472d@kernel.org>
Content-Language: en-US
From: Linlin Zhang <linlin.zhang@oss.qualcomm.com>
In-Reply-To: <650ac172-312f-43a3-ab5f-82318796472d@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDEzNiBTYWx0ZWRfX7LOI5yPN2Db3
 HU4YnRyjhFsEA0NPWUDiE7SIFskMDsguoWWf6fKltRrXp/2USIobpwTJUYJ92QcgDb9GK++A/hy
 Xqv2NvszGSsGRt0T8djs7fCDuO5xeuEsj9w2RjjLqdLvhCvDxKRKMIgNxAqm4x71UY31fWdvffZ
 qy6OltO37s32zCrRcA8wQXMrDPeTTU7E2TU36rUFZyeLFijusDQYU+XWIjviiLd+4eE9MKPkxyb
 PUS1+hMqV/242Yze5mKewGd9rnWB2FNCQSYqrZOnhIwGrdui98VHEgnX9zo6SnvRr9zPEA/T6sn
 1FdnJ88Fyr2idrEG+9AqqCNPLtgE1H/f9cF3vTcd2eqwrwZayE/hnpkZ4SkLshW0duZnYy/3voh
 eOkIdjo0cpw99HLxVP1EmGChbfgkX4GEIHi5c6eRbD3nlej5HBecb87kqTMNz323+SpjOOIXJsY
 bMyfkN0n+ZacYzng7Ow==
X-Proofpoint-ORIG-GUID: glCgPGYgPq7Crr35lprjlVFqvUWFbDnX
X-Authority-Analysis: v=2.4 cv=MdhcfZ/f c=1 sm=1 tr=0 ts=6a9841d8 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=7gRScLy_F1O9BZcavHAA:9 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-GUID: glCgPGYgPq7Crr35lprjlVFqvUWFbDnX
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDEzNiBTYWx0ZWRfXzFY7em3YqpvO
 O0ZQzTF4GupR0QO5LbDvRiEe1K5oTDLKtSG+qfKuaSxP3QpbYKtxRssJlLmq3V2PDPrSv/WKONA
 oakgXirlM7oW7/vTBskwaTtxKMZ3wZQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_03,2026-09-01_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 adultscore=0 suspectscore=0 malwarescore=0
 phishscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609020136



On 9/1/2026 10:01 PM, Krzysztof Kozlowski wrote:
> On 01/09/2026 12:31, Linlin Zhang wrote:
>>
>>
>> On 8/31/2026 2:58 PM, Krzysztof Kozlowski wrote:
>>> On 27/08/2026 18:07, Linlin Zhang wrote:
>>>> +static void crypto_virt_remove(struct platform_device *pdev)
>>>> +{
>>>> +	virtblk_set_crypto_ops(NULL);
>>>> +}
>>>> +
>>>> +static const struct of_device_id crypto_virt_of_match[] = {
>>>> +	{ .compatible = "qcom,crypto-virt" },
>>>
>>> Undocumented ABI, also not really allowed. We don't take bindings for
>>> drivers.
>>>
>>
>> The dt-binding document is included in another patch in this series.
> 
> And what does the submitting patches document ask you?
> 
> 
>> The concern about introducing a DT binding for a software-only driver.
>> The underlying problem I am trying to solve is how to communicate the
>> wrapped-key size to the guest.
> 
> I am not asking about your problem. Can you please stop answering to
> actual problems with irrelevant other aspects?
> 
> You cannot have DT for a driver.

ACK

I'll drop the DT binding and this patch, and look for an alternative
mechanism to convey the wrapped-key size and key relevant requests.

> 
> That's it, please read DTS101 slides.
> 
> 
>>
>> Because the guest has no access to the ICE hardware, it cannot get
>> the key size by reading the ICE hardware directly. In the other hand,
>> the wrapped key size may vary across ICE versions, it's infeasible
>> to have a fixed wrapped key size in the code. Additionally, wrapped
>> key size is vendor-specific, it's nor proper to pass it via virtio.
>>
>> As an experiment, I used a DT property to set this wrapped key and
>> wanted to get feedback on whether this is a reasonable approach.
>>
>> Is there a preferred mechanism for handling this kind of vendor-specific
>> configuration, or are there similar examples elsewhere in the kernel
>> that I should follow?
> 
> Not DT. Use whatever other mechanism kernel provides.
> 
> 
>>
>>>> +	{ }
>>>> +};
>>>> +MODULE_DEVICE_TABLE(of, crypto_virt_of_match);
>>>> +
>>>> +static struct platform_driver crypto_virt_driver = {
>>>> +	.probe = crypto_virt_probe,
>>>> +	.remove = crypto_virt_remove,
>>>> +	.driver = {
>>>> +		.name = "crypto_virt",
>>>> +		.of_match_table = crypto_virt_of_match,
>>>> +	},
>>>> +};
>>>> +
>>>> +static int __init crypto_virt_init(void)
>>>> +{
>>>> +	return platform_driver_register(&crypto_virt_driver);
>>>> +}
>>>>  module_init(crypto_virt_init);
>>>>  
>>>>  #if IS_MODULE(CONFIG_QCOM_CRYPTO_VIRT)
>>>>  static void __exit crypto_virt_exit(void)
>>>>  {
>>>> -	virtblk_set_crypto_ops(NULL);
>>>> +	platform_driver_unregister(&crypto_virt_driver);
>>>
>>> You just added this line, so previous code was simply wrong?
>> No. In previous patch, virtblk_set_crypto_ops is called in
>> crypto_virt_init and crypto_virt_exit. This patch moves the caller
>> to the driver probe and remove APIs.
> 
> Heh?
> 
> Let's look at your previous patch:
> 
> +#if IS_MODULE(CONFIG_QCOM_CRYPTO_VIRT)
> +static void __exit crypto_virt_exit(void)
> +{
> +	virtblk_set_crypto_ops(NULL);
> +}
> +module_exit(crypto_virt_exit);
> +#endif
> 
> And you claim that you did not add this line?
> 
> Do you understand how diff format works?
> 
> Best regards,
> Krzysztof

