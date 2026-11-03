Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793704601;
	b=FtZPD5wtst2aR3Canc6Q0sgcOZFtqsEMfOOB5LVmTVCK9LAv7fD0Kw+FDoFU5XOtzGnF
	 k6bx7rB88Kxe5lmJWVwQOzAVISgYlvG3u82o+rJ/rmTPfeFB0FioZZDiP4uf3dgVDyfZ6
	 30/eMILJ48GhM82fJBqh0J3jOwr4skoLt/HOOWwUx5OzMcByUs4mLX2uiAL1q8HQZwQcn
	 1sua9TgV2/1EDaJHxlIGY4dDf+3brAmvCvOj4aPZllPjOcQnwTTt6DHCrUYWXE8QxUexn
	 Dy/mqk/6Laz85g2U6WosswBV2ea9y7jsyuwRJ9jUxEx6r7gUv5RWshPhtLtXxbBEJ7Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793704601;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=WZMc20YxNSA038XzxMIhDdXcMHQhgcr2sLs98yj0LGQ=;
	b=CSPI9p8wLTAsY5CKyCTksFjzMRvML7/VvsL8T2L1bO84lHXcXW8CcB6l1eyi6qLu2UCr
	 hogOjFRXvFfU+1TFXeyhlWtvOjBgtEHdzEAwKbQVB+nx3yD+Kqm2MPaNV1gUQVOawrBOk
	 aK863AehVkv6Nd26+wIxkzFdZNaTF/xEKXOJ9IJOETqTAyQWW4VEwb5eDrayxghl8mijs
	 /5ZL7T4NbcFAY3zG1I5gJJWASq0Mmue4qOfsv6eUPQPwyUKkrGkn9jjOu6+0qL4n38l5E
	 aTQ510qLiiSy3NSne0JYsC7JQKiBhwrljXFMzlimWQ27oUaslU8hGRAlOdXyKxZ9KWw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=B4JBSjZG;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XsOz7DvO;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE35A606BF8D
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 11:16:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AE35A606BF8D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=B4JBSjZG;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XsOz7DvO
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A3AAoB0928202
	for <linux-kernel@vger.kernel.org>; Tue, 3 Nov 2026 11:16:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WZMc20YxNSA038XzxMIhDdXcMHQhgcr2sLs98yj0LGQ=; b=B4JBSjZG0T8FX1L2
	oATmBTyT/weawRrq7g2radriuoyPOTZAqu4qE3pxRHKNbwvyJo8CoLVlMT3K/LAT
	5YUYt64rz+hZ6GyqLH91uUh7aZdR83cmCRSPl1WzVLjbetjKOQG0cbVA+J1KaGNq
	iUd0ywrL5rUV8DKBAtXktScDuTrZETSLw2b2wqsi8R3Uw4VSDzf7WB1x7Vxc0Ped
	gw5hKcFIbV40/N7tlJ3UA6Np1nH4vaSNXYoeIhARO3UM7iTFAeA90etuxKCXnFay
	km58XF1myvt2EzM9eNXKtfR7jbx9vto1oIu53MR+DekUc0ZMl5JT23yvOgU9qJm4
	zWPEJg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hq07ekes8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 11:16:39 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3ae72da2f57so5275599a91.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 03:16:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793704599; x=1794309399; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WZMc20YxNSA038XzxMIhDdXcMHQhgcr2sLs98yj0LGQ=;
        b=XsOz7DvOp5A5562khzfnVzU1lDeXw9QAFHaqb7Sv2xQ4qqmyduuXy7gq1IdShBMA4h
         fv8bJWS2TucemUTEu56u3uM7kiWZj8rNuyHujk6J5OnWZAd78JY3xFtkGXHCC39anCU+
         FfOx7KBF8LHTLYMl4a9f3DYMvwJTKdzXekU7j0Q9gMBhfoMmLVOPIIouxfhi1foca6ut
         82uY5y8Gs0yZUu1fmAsAiR+WY4KM48Q2w4qNu+kfc1tbigi4anm3rjwuShr1quwGl+yY
         l6p31fUmL3RoyMy20Uid49L/sND6L7Nox0z8hSIWYt376mwfaU1oTdVz1U+L1SenIQqo
         DEBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793704599; x=1794309399;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WZMc20YxNSA038XzxMIhDdXcMHQhgcr2sLs98yj0LGQ=;
        b=uSHa+KjQunpURT5pIa09cti9oxMh6yfNLe+FcXUKyFkql37MtJYgegumPbpaXbhlAh
         TyyFTOtx1hsO7trl7FhNc2xnriCTd5gUiXNzBTjHy3WoioccY9RRBdMgmSfwziA2uKxC
         I2ER3IumcCvMg04DunHLOpRbEDbLg32ibcnKKL/YPPUmFEjwkphkrdUaQRdudv5XcX1c
         0jbkfhNoyEsOHKEfRQcVBpC0TwnYQjA7VWBovG2QwX/pej27E80hdW0PPMW5frYkJNLS
         le8nT8q9U0GcDljGNXGE/VPQCepOnJqL8MHDfEwwcS7AepmieebfPlywOKhm6F2+PvRU
         UEbg==
X-Forwarded-Encrypted: i=1; AKwUvBxd7twOTxzp4OqlO0gQ0V3ZZdmklYKfvVPbKjWUy4Tb+NLMRt/sbNCFd+FOAJVVf67qVeeW17QJ+zzVQ3M=@vger.kernel.org
X-Gm-Message-State: APuU4Z+lirVM1lK07z2C/kCfrB6ki2rv+UHydooHttnaxi36Zx9L6kQb
	l7kBZHFZXmOb1CW2E0joOykRN8xSoK5AqvVJfoEVFpk9aaTUX6J/n3n9ryETziTzkmKYUV85UfC
	cS/dlwWgcuujLUm6TlUu1ftiMRlyIv8pWAnCC0RsC1CTqC4DRBt3tehdhZ9YJcQbROuQ=
X-Gm-Gg: AYBFou39a2WXVcoJ70Fv4yfN0qLuV7iuFVLd1bd8RLTA0sXR8f9TVkQSlxqyk7ABgW6
	CTrlgKuggt9WakJTi8wKHOP3ycBIJ1JYCis0iHGpL28kI7BKMRImKgccg9278YfJZ7I57IwQ54U
	rKBpv4Vspepiwk5hpbUoAAf4rLkf/vv8bpT+Jj3cLOQvcqMeFAzxHOr1zLp9Y7Cu9JJ6MFd8vn8
	tjefr8PUcw4KRKwxkMiizgMkQJEInryO3V0ucW4Nk4y5C0czIwF6FoJXNJUma+V6N5ykE0PkifQ
	YR4RsyVqI0E6RE1Tl/U4BcGWRuMrwB4AkE4OFxSsDXaemvMik2Y0HiZycwDzj5m15sLXSbzfBUG
	cr25KWvhRIAAvdlz+fuiZICtW7syP+t/d9ukP9MlgmdObv3wDJ+LUrNTMqr2+xKhzqz9pISxTmC
	jleMiv
X-Received: by 2002:a17:90b:1f92:b0:3ad:6090:a183 with SMTP id 98e67ed59e1d1-3ae897c8014mr11155433a91.16.1793704599133;
        Tue, 03 Nov 2026 03:16:39 -0800 (PST)
X-Received: by 2002:a17:90b:1f92:b0:3ad:6090:a183 with SMTP id 98e67ed59e1d1-3ae897c8014mr11155402a91.16.1793704598639;
        Tue, 03 Nov 2026 03:16:38 -0800 (PST)
Received: from [10.217.218.73] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c903df5sm3978846a91.11.2026.11.03.03.16.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Nov 2026 03:16:37 -0800 (PST)
Message-ID: <c96a6c5e-45d8-47ba-83df-d956bd2e06fc@oss.qualcomm.com>
Date: Tue, 3 Nov 2026 16:46:33 +0530
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
Subject: Re: [PATCH v4 3/3] i2c: qcom-geni: Add bus recovery support for GPI
 DMA mode
To: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>
Cc: naresh.maramaina@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org
References: <20261103-20260826_aniket_randive_oss_qualcomm_com-v4-0-59b3ce96dc4b@oss.qualcomm.com>
 <20261103-20260826_aniket_randive_oss_qualcomm_com-v4-3-59b3ce96dc4b@oss.qualcomm.com>
 <2ed54730-75bf-4368-9391-5452d0a31fa9@oss.qualcomm.com>
Content-Language: en-US
From: Aniket RANDIVE <aniket.randive@oss.qualcomm.com>
In-Reply-To: <2ed54730-75bf-4368-9391-5452d0a31fa9@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDA0NCBTYWx0ZWRfX/rS4viR5QojV
 hf1KNppB1/0zleozxWhv432JPW+XohLYaWvJrw4jucJJDT3rIjPpeoBTnq7J9Uq4Q6ptZdiCzk0
 Bk+24ArrLckLB0bfRHlHG/LL12rDEv/6maO5KrdPtPEMmjRLn2HjZxCvtoklviyiTAvLTqTXdZL
 KvoENowb60D0pqSvo3vfeT1XhansRYbGPPH18bMPghVKUVMGeTnZp2Gili6sjgkZZyqv9oBplAZ
 2GTAEnfAdWTqGdZWRfO8orgDVdFl2bVXb+i/Qf36bmmnp32sPvuRMXZ8LnYj8OU72qj5Zbhv+wU
 l1eYbA8wCsquDgJXS1fPP0oCGB1tk5shUKSvAq5sY0aSj46cHwdJmSWpDvFjmHmfLckwNNRyYmr
 EPwgYsqoFV16WA+up8qHGakDJL1S+US/BWGiwaJ/KeOIg2pfr4RNEa+NMdCEalP9HVCdsWPLZfu
 OEDmL6TkNu0NezR22AA==
X-Proofpoint-ORIG-GUID: pH48_GTW_25pg-NnZhjM3dsVKSQ4ZOgh
X-Proofpoint-GUID: pH48_GTW_25pg-NnZhjM3dsVKSQ4ZOgh
X-Authority-Analysis: v=2.4 cv=B/wsQ+tM c=1 sm=1 tr=0 ts=6ae9c297 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=wUFJiXBcSWTcG4vZAq8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDA0NCBTYWx0ZWRfXxFxZW+EvlSu4
 dasSBSXowDc4mjhVlQ0o8adLp55KvEXsUAMAxUZXrw7CL43buUiCd9KRwoQxmj5PNhby+BbA6wA
 kN8K/BpnOfKoVu7vgJXQJduRPteQLD8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_02,2026-11-02_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 suspectscore=0 adultscore=0 clxscore=1015
 impostorscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611030044



On 11/3/2026 4:14 PM, Mukesh Savaliya wrote:
> 
> 
> On 11/3/2026 2:26 PM, Aniket Randive wrote:
>> I2C transfers in GPI DMA mode can fail with -EIO when a target holds
>> SDA low, leaving the bus stuck and preventing subsequent transactions.
>> The GPI completion callback reports a NACK and a genuine bus error
>> alike as -EIO, and the existing recovery path switches the SE to FIFO
>> mode which is not valid in GPI DMA mode.
>>
>> Add bus recovery support using the I2C_BUS_CLEAR and I2C_STOP_ON_BUS
>> opcodes issued via the GPI TX DMA channel. Guard the -EIO recovery
>> trigger with a SE_GENI_IOS I2C_BUS_FREE check to skip recovery when both
>> SDA and SCL are already released. Extend the recovery callback to 
>> dispatch
>> through the GPI DMA path when gi2c->gpi_mode is set.
>>
>> Use the adapter timeout for GPI recovery commands, and preserve the DMA
>> configuration error code when GPI setup fails.
>>
>> Stop recovery on a GPI command timeout and report DMA termination
>> failures. Do not issue another command or override the timeout with a
>> bus-idle result, since DMA cleanup may not have completed successfully.
>>
>> Signed-off-by: Aniket Randive <aniket.randive@oss.qualcomm.com>
>> ---
>>   drivers/i2c/busses/i2c-qcom-geni.c | 107 +++++++++++++++++++++++++++ 
>> +++++-----
>>   1 file changed, 94 insertions(+), 13 deletions(-)
>>
>> diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/ 
>> i2c-qcom-geni.c
> 
> [...]
> 
>> @@ -1356,10 +1439,8 @@ static int geni_i2c_probe(struct 
>> platform_device *pdev)
>>       if (ret < 0)
>>           return ret;
>> -    if (!gi2c->gpi_mode) {
>> -        gi2c->rinfo.recover_bus = geni_i2c_recover_bus;
>> -        gi2c->adap.bus_recovery_info = &gi2c->rinfo;
>> -    }
>> +    gi2c->rinfo.recover_bus = geni_i2c_recover_bus;
>> +    gi2c->adap.bus_recovery_info = &gi2c->rinfo;
> 
> I guess one more time this. Why patch 2 is adding and patch 3 is 
> removing the change ? keep it clean way.

This is intentional. In patch 2, bus recovery is supported only in FIFO 
mode, so we guard the registration with !gi2c->gpi_mode. Patch 3 adds 
the corresponding bus recovery support for GPI mode, after which the 
mode check is no longer needed and is removed.

>>       ret = i2c_add_adapter(&gi2c->adap);
>>       if (ret) {
>>
> 

