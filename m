Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5C463B71D0
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 10:51:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788173519; cv=none; b=OIJvOUfOknaMIVQwA8bkCZCOO4j/yK4PnSLbFv3rH8kpGSe7mmZFgd4qwJWEJ3rJoFZJXyayu2O0pnW6cuzVUrFFFmC3FivnpRutHJhYmcY9FwmZNxrOj8HnjG3oyfoWoRIKY8kzmuaIWJo1YkxTJQJladgPvOd9UoZWhSTteeg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788173519; c=relaxed/simple;
	bh=qk39u6giMz5HCixucodfTQ/SWhISR98GQnSlcZHqQw0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LfCugRJLkxoUHCeWsikcZqrG4VqcudeWv6TYzlbcar/mUZiItvQH+9t9SCBXwnRBsN0GYRSAnqJU/Q8BJmd8PwznMIAm9m2ZtJkdLmivGIxuJlph0xBDwdNgd92YHKIJ2VSXHOEIKbDdwNqFa/wgN67KSp/thTiAoXroA7dCNU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VERNy5uo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XIC8ZlJs; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VERNy5uo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XIC8ZlJs"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67V9IcH82026487
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 10:51:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kAN6CqVnAIqBWFw6JFSsaxau/8huoJf3sBdP1IluoIk=; b=VERNy5uoMOKvCQTb
	lBGSB4LgmPef3BnexlKohkidoWuvD18FZxmP2GY/shC8heASZSIe4GfsWTjUcwSC
	0SZ7wA1idBUM1InXb+SUDpD88ZReJXbw0PjOkbE4yiSPHkOX3DRoB6cccHBzk525
	HsJtkXgGj7xgJMrN9nyhyBQ0WIcRjp5JYTbFAIK9AyrSQsyj1QRga19dtF+y3ObA
	aI6EUT6cjrTcHNdque3yMGx0jiEwLkoI3ypr3eIj5kdRCPHxSG+r5pA1tdtz2i9C
	BxuJHxFeUaoHdsGIgiKyQ03Q/JEH9FQ0JPvYgxrFxJ46UyhbOBKVr+t7rOTBe52x
	360hcA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gd6vagayr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 10:51:56 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-398dc3d8f0fso947320a91.0
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 03:51:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788173516; x=1788778316; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kAN6CqVnAIqBWFw6JFSsaxau/8huoJf3sBdP1IluoIk=;
        b=XIC8ZlJsO2jZHaH0HfSdWJ+dpYe3bFshn0S2P+mD0mzAfRj4A4H+T3AbVawvfyn/x8
         plmFmj8Mesvo1goNlasXgFKn4bywCegMjdMKcb46LLLgAibiezM9xKwTnMYrVjxAEvAu
         mAs6Vgusmi0y0F9Tbq/BXjaQ/kqz6qfeO/7J8ZDx2lgdPHrXIjoY0ribcfOJqB60uMs6
         JgoTLU/7EuguXMEv+ZzK6qvbexEf2rZkZ4Bt5WlUBZNFQQi5YVO6s0aE3jBBawflUfH2
         XeyRj64oMkOFs5gDmzvSOF6OtzD4cIXL5MWLAOE9iLZ9Ky9mTQ0eL2rrJ+0MiH8JGFt5
         ZfXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788173516; x=1788778316;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kAN6CqVnAIqBWFw6JFSsaxau/8huoJf3sBdP1IluoIk=;
        b=AJ9prpjmul+E0Qe8eJVX+RXDAzwkDd5wq6r2jexZ5p9wX+vHmKHfln6feJ6Let8rQ2
         bOmEkTl9Bn6VLxx1fMuaYqwMkhnVeyLck5US219MSB36FVu0zfeo5muByyp3I8aKp423
         5e+5DUiOrp1NXEc/w1VC8QMV8Pqw4heHIKVGKdFMqmieKek1aJRzwg+ktzP+iAS703Hf
         hBSbLSTDSJdwtDgD4R3co/2w1cdHduGnX5Yh8nwpPKO+XmlL9JCjlB9CIRkkW+Q+ZEmq
         jswJP2KNcRTRApDiBfWnDp6U8GIXTa2B7ELOcCyICRE3bEW+HC83aN6uRRtGZZoWZZu+
         2lhw==
X-Forwarded-Encrypted: i=1; AKwUvBzOvRdDJTVBgL6g93t/AjIX47A6NopM/RwunluVbxBrd42bBTJjK5pC9bv5afM3cRERxP2vGvJOioyLjQA=@vger.kernel.org
X-Gm-Message-State: AFuF++mRMZoroS/enqYCJnY+OtFT7O6GghZT3hueAQX7pKUhUd8Sp+uJ
	KTFdR/xwHyA9RgF/q8NmSml/l2vRNavXnKvBhSr6akTOpfv/sqyRq9ikxkRx2PejkHIKtj9j7Bq
	kksXIi7nk4h8EqVC123SGLRo3qzwxFwMOr5hH5X5VVuMhCoKIrsaYlCBeQ4JQPOUhCng=
X-Gm-Gg: AYBFou0fLtTYY6bEW19Tw2cWAtbfIxx9Uif7k75nbstx2/QKfCBB+njMzsG7OxWfPje
	4OBVW4wbNpdLxRNw+OwG//A4amxoxDttthyjPOmZ1bUfx6YgPu0objySjMzw4DMMp1WzOIXC4hr
	FiIBo86ExwS2mqCzHhpWT9gqynG23paPsPpY7QYz9a4ixZkKHUVD4S+ztCEYUKhXgcRwbgYrnQ3
	/5Li8g81x9ch39JxvFS0lnxEvGiFksFsccAVLY78QdzsARe5NEvZe45xA9U9fkz/so/uaHHmVlb
	NBoQkienQ7ZBzuK6pbRBNEd1H1EJqMKjOEWIvxYUm7ZR3W7eKvJaC/hlqspgf4eq3bLfMy3hzml
	ECyugtuPI+t73qNpXR2tH3/GJiBF2kuHjHQ==
X-Received: by 2002:a17:90b:3889:b0:398:c8f3:d076 with SMTP id 98e67ed59e1d1-398da8d5422mr6442416a91.31.1788173516033;
        Mon, 31 Aug 2026 03:51:56 -0700 (PDT)
X-Received: by 2002:a17:90b:3889:b0:398:c8f3:d076 with SMTP id 98e67ed59e1d1-398da8d5422mr6442374a91.31.1788173515514;
        Mon, 31 Aug 2026 03:51:55 -0700 (PDT)
Received: from [10.217.218.252] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-32b49c867f5sm15177273eec.2.2026.08.31.03.51.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Aug 2026 03:51:53 -0700 (PDT)
Message-ID: <2aaa53bf-54d5-48a7-b4d7-8aced3d93726@oss.qualcomm.com>
Date: Mon, 31 Aug 2026 16:21:48 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] serial: qcom-geni: Fix port_ida handling for console
 and probe errors
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-serial@vger.kernel.org
References: <20260828-master-v1-1-1f8afa5f82c2@oss.qualcomm.com>
 <e16478f8-6b56-4e7f-b4fc-7c434045ec96@oss.qualcomm.com>
Content-Language: en-US
From: Aniket RANDIVE <aniket.randive@oss.qualcomm.com>
In-Reply-To: <e16478f8-6b56-4e7f-b4fc-7c434045ec96@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDA5MyBTYWx0ZWRfX4LAGfPNL4ipg
 BkRvzAeNnL/K9+v8R6QursVwU1aviLuHPzR4Djvw/gNtgW0yR76VlbcJFf3vQN/PVvuwKZ68XCo
 zTAjTNxujTzAYXnmPnbpVlwyRUsx+WDuwcp38nX/Csaf6gVNtVj9+fUjvPIw6JgDqO0/hVCUHRh
 i3hntW+zDB1raobR31A+1rCQnax/6Wk1fBZYrFjuIjdmirwTMubnjUXOI5oWqVRTvt4WthgPaVR
 pHaIJq1KznCp5GOkVXjgFimGTlctdiV7gcgYoFfdevU7+c4Wy1GVq9+U0CYy0x/v5jMTkfOuwaQ
 uiAxz1+r1KMeZtHARCADSt8hL5j3bGb/SG7/7t+oAyJxZK6JcBUXtp744wjunIwG35i7R9x0Zql
 2GF2NOS3Ncpk4dyUVez9E9G59fFbcvRvM8JCnNGffrZjMrD3m4trI/zqAd9ME9W+iF1dxIFfZqt
 5LHVolKcfQKUJVBQX9w==
X-Authority-Analysis: v=2.4 cv=YYmNIQRf c=1 sm=1 tr=0 ts=6a955ccc cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=jtoOUyuUrL730116TwsA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDA5MyBTYWx0ZWRfX3MX2DTtOjmLy
 ytxrkjFmFqFgaZug8TzoAB0n8czb6V2ecaaoFsHxJwAgl3tfB+xyWgLUViSE0uIs1sP9Uo8WhUE
 kZtcA/vVLYdD0XuD3JQGOHSACYRChHs=
X-Proofpoint-GUID: T_n0esZJp6PSOFCLXruaPoZUtr7Kxi9A
X-Proofpoint-ORIG-GUID: T_n0esZJp6PSOFCLXruaPoZUtr7Kxi9A
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-31_03,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0
 bulkscore=0 impostorscore=0 malwarescore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608310093

Thanks Konrad for the review.

On 8/31/2026 12:58 PM, Konrad Dybcio wrote:
> On 8/28/26 1:14 PM, Aniket Randive wrote:
>> The console port uses a fixed line number and is not allocated from
>> port_ida. However, qcom_geni_serial_remove() unconditionally frees the
>> line number for all ports, including the console port.
>>
>> Skip ida_free() for console ports so that only IDs allocated from
>> port_ida are returned.
>>
>> Also release allocated IDs from the common probe error path. Currently,
>> IDs are freed only on the wake-IRQ failure path, causing leaks when
>> probe fails after a successful allocation. Move the ida_free() call to
>> the common error path and guard it for console ports.
>>
>> Signed-off-by: Aniket Randive <aniket.randive@oss.qualcomm.com>
>> ---
>>   drivers/tty/serial/qcom_geni_serial.c | 6 ++++--
>>   1 file changed, 4 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/tty/serial/qcom_geni_serial.c b/drivers/tty/serial/qcom_geni_serial.c
>> index 3633723acef8..3bfe597d2c83 100644
>> --- a/drivers/tty/serial/qcom_geni_serial.c
>> +++ b/drivers/tty/serial/qcom_geni_serial.c
>> @@ -1979,7 +1979,6 @@ static int qcom_geni_serial_probe(struct platform_device *pdev)
>>   						port->wakeup_irq);
>>   		if (ret) {
>>   			device_init_wakeup(&pdev->dev, false);
>> -			ida_free(&port_ida, uport->line);
>>   			goto error;
>>   		}
>>   	}
> 
> GPT suggested that the failure of
> 
> ret = port->dev_data->resources_init(&port->se);
> 
> should also be updated to have a 'goto error' rather than a direct
> return

Good catch. I will fix in next V2 patch. I will route through "error" 
now so it goes through the same ida_free() as every other failure path 
instead of skipping it.

> 
> 
> also that in get_port_from_line(), reordering the devm_kzalloc before
> ida_alloc_range() would prevent another leak

Agree. I will reorder it.

> 
> Konrad


