Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C26F517BD2
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 16:16:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788797782; cv=none; b=tXoABVcCO9rFZpaNagxmjQ21p+EGsPLAWeKJMrWIP5BkwqBxqt0NyFtjhAzhT5lXg4O4btNBKJbEqGwPwr7jiD4xuBKshSmGrmByDpIc0M/YOaFsLs9iGJ+OOgfN03GqMEGN+neIqWgy0ADyPH29z2VWkYcCDLK+yC6CLPk9GEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788797782; c=relaxed/simple;
	bh=6CLBpkf8GFrMzfkx6bkVe2BvDETUS69xCIsQLTa2oAw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Kd2mizV+X4snepvJGmqjBfMdQSG8hETf68vGqYBGinWSQquLZotaY3Ux07xviMyEGjojvhAobOkEeu/KtQpZnYJhj50gl3sF+o8ItSVlJm5bvEQw/lnldFO68lc/oTJyTEyYadK3nUak9L9M7zbrGhfpAQBIZPKspfqc3NKK0F0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Rd84mooc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Gf1qDkEI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Rd84mooc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Gf1qDkEI"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 687DdVkS3025920
	for <linux-kernel@vger.kernel.org>; Mon, 7 Sep 2026 16:16:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ysMNEgPwkEdaj/0566we0E1YixK4XUp85+woTR8OZac=; b=Rd84moocoyVu/RV6
	qNJSAObVJtLxNlFeXrsq40sI1BnzHHja+xfmMqBWYNONQ5ew33XIWVfZ+ljXvSqe
	LzNWq0hDLQyiQb839AToKw5W0dGXLwPHE/h7FZ2ryOio3AWEnqMT6dPyFgGhqgu7
	5uEv4KOV3oyDss0R0gFW9UfDWcRTKRcjZwFLpDyxa1TgYorBo03WGMUKb+OlXkBq
	vxCqx7YS8YhDEEFgbdbMgICfxzGw0lNWc/P32a8X/iuwx57KYGvDyxAFzhesv3es
	8RflvaYQs+eZnb2wJLEB30RJK1SZ42Spv5y3o3s/iHcfYbLYzHPYLZhx8tGKLqo2
	NYwjHQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghtty1e5x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 16:16:12 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-398fe469aa0so5917478a91.2
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 09:16:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788797767; x=1789402567; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ysMNEgPwkEdaj/0566we0E1YixK4XUp85+woTR8OZac=;
        b=Gf1qDkEIAEk1T506ubLhxv3NnBWlCS/f/iK2nhKElYb+j+mhjQo1fB7wGvI25qvXyl
         257IXObhLv99GZb/65TVHOCFJSc+pQAEPPD1h8uN79FmwqpyC+9wxPoQzrtx8/LAae3x
         YnB1jgIMqz5QbxOiTrsUQQdtHJH3KdQg5hqoKsVQyz9Sb/9YhomF+k/TXii6iyoM1jlO
         U/pkL/3qvbrLjwP/Srpu2+Q38vBOIg/fkfoDDgllHIXGNnvxMzCozKTIBmgK3YoGILrl
         X1ZEv42R1qSZHPNWIWMBftE0udHnIwQAWvO6joCdWmxSf010VYuxHN7xzHEJauQ+wbyD
         AeRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788797767; x=1789402567;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ysMNEgPwkEdaj/0566we0E1YixK4XUp85+woTR8OZac=;
        b=JOr+8pYIgCQow7xdN2yBrL50oDGNciYVzLKv2y1AeFB3c5PAbhWdsWKRmwKLxbv1Da
         0qOpeei83JWFLMi7YzlKWwFCvoHKRYhDlRd4ueyvj6R09FpM/kwtrLdxo+rAD2XeWnvp
         Qvn+IRlSd3ZdDLM35ygLsu/XPUkJ1c1Eq7kdV0e+5ZjLEuZY6LPTyM0u1ED6VyDvoAMk
         wUQksmWaiF03FHWa5yHT1ZMe4/E+aisZ4s3+UH+cnpWA0iiLOWP/2haRj8m26sc1CBpg
         0djMUC/jJV3W2aP4jXb9hNKkyUra6rKtCNU+MBs0s+ii790Yt0T5o5hJByyXMf/zkhPq
         mMNA==
X-Forwarded-Encrypted: i=1; AKwUvBweATkNIaNr6GcHkYwjs5YyhnYeDHmuZ7oOXKpYn1kv5qc6MMR0DZG9VmO+eeT753X8OcCoHMjjPIaPxVA=@vger.kernel.org
X-Gm-Message-State: AFuF++mK2zEDGOCgoDuiWU5n8wa5Ic1BRSuRDimJHlJx2BGsvoIjd/W5
	TKptlhChuzwpaClSJ/XSQFcAFmtw13ErDbDAb1mh0lcbqvnnWsG0GyEXbf542xSpFCgZBmfP1B6
	BQR+rI3Akr9HMObrcNf0p7/YC5Gg5n/LMFjdzvNw0AkKknJT6L/NB187BaShVP+Op+Qw=
X-Gm-Gg: AYBFou0+F3LAt5JstjPvMIv81/QPC9A2bmBmjxqTtV9a0Z7dAvKR5b+EqCOOsKQiaB3
	ZBKxSUVMgq1WCqlrcB/yJ8/GAHKsBY7K712jo8zvbbymLSsw2AYx2Sw4xfK7f6KuvIUm7/0RSPz
	7kHIwwgU8Oe6gwRTvM6J/oXE5GG77hN5LlmAVvpreFXRC7qdLq80umYGhsEtcgZhfmXmaJmThNo
	nlPnZlCeiVb9ZgYoN09H39oVuZ5sXeA6ovvcoeGvDiloLcnG2B/Dg9BqiDZGZM0n1FpHQCMN0m7
	WqUmbiBwe9oAxwS7t7eMClNALvM2Z6ho7Ca4YkIZ/raLJ1I+3ua/k9t5aLjaHslCGBUDtSCydba
	IsyeQbvQBBiDorAEBrwC0eJhbsRlAK9OHhyhce7GVahGD
X-Received: by 2002:a17:90a:164f:b0:39b:3510:49e7 with SMTP id 98e67ed59e1d1-39b35105b52mr18759796a91.0.1788797766931;
        Mon, 07 Sep 2026 09:16:06 -0700 (PDT)
X-Received: by 2002:a17:90a:164f:b0:39b:3510:49e7 with SMTP id 98e67ed59e1d1-39b35105b52mr18759750a91.0.1788797766459;
        Mon, 07 Sep 2026 09:16:06 -0700 (PDT)
Received: from [192.168.1.66] ([103.172.5.17])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33825669695sm7040510eec.3.2026.09.07.09.16.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Sep 2026 09:16:05 -0700 (PDT)
Message-ID: <e1898f82-1b90-4708-b397-f701d2b38b16@oss.qualcomm.com>
Date: Mon, 7 Sep 2026 21:46:00 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dmaengine: qcom-gpi: Add I2C High-Speed mode
 configuration support
To: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org
References: <20260824-i2c-hs-v1-0-8dd94e5c6113@oss.qualcomm.com>
 <20260824-i2c-hs-v1-1-8dd94e5c6113@oss.qualcomm.com>
 <f69d4f56-82c7-403e-98b9-f78b79ac5906@oss.qualcomm.com>
Content-Language: en-US
From: Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>
In-Reply-To: <f69d4f56-82c7-403e-98b9-f78b79ac5906@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=QNBYgALL c=1 sm=1 tr=0 ts=6a9ee34c cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=tPI8lZtLbYv5uT6OEmdSlg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=a-cvTIt2-1BptkQSrc4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: 9da5jjWqbQ2cmptdgjgfRktfomtR4qnr
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDE4MSBTYWx0ZWRfX0VJ8AujLc9sp
 6AC9d5GicoSJ5BDSiyRPm0cXHaEmamkPZ1nZvBhc5wFCQj17jBE4+18oYff877ltekBvmWxR5BB
 r7KWfPJsDgrQVOGuBtP2/DPUI9K07R0=
X-Proofpoint-GUID: 9da5jjWqbQ2cmptdgjgfRktfomtR4qnr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDE4MSBTYWx0ZWRfX1oakOkLqdhCz
 FHld4waRZpVUbmXbeSi4UzsIXn9SfgnaALR9cFOGJpI2vZJ4CI0zyXKvtijK5e7Q+RmYAVdt1Zx
 kIdMiXgsFA+bdhCwtUHEHOr1CWwErQJHkZkiLzZh3vgaE/Ln0V4Jm+sQp5JHUzI8hdUFUDGndsy
 29FVE8onOFq8H+w2lbpr0nvqDoeWSDhwEPl3O0QsCgbgDcXSkchPkqzzezjjyXW47nMgVgRx8m+
 fLpKZH2QeBGDIIUMGZb1mjqyGmZfmhzoJs9d18tRQ1Asfpzzh5J8KCnxWIZVmgNeLt7DzeLolch
 PZSF/PqwtEKYSL3nLRbZWCcgaFRrdyoaAwTvWbVyCNWHyo71yalCSLGWi6QoYjhHdIimRdTslIU
 E1wvKv3AaP07T4rVJAcTB0Zo8JKLP+zQh3Mjhkmq6ny2YLBVCfBPZKzrgaRqKuX9OpT3zjIkM2j
 eLGhci87cbJCMKeOYdg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_04,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 suspectscore=0 phishscore=0 priorityscore=1501
 lowpriorityscore=0 adultscore=0 clxscore=1015 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609070181



On 8/28/2026 12:56 AM, Mukesh Savaliya wrote:
> 
> 
> On 8/24/2026 4:55 PM, Jyothi Kumar Seerapu wrote:
>> Add support in the Qualcomm GPI (Generic Packet Interface) DMA engine
>> to configure I2C High-Speed (HS) mode transfers.
>>
>> Introduce support for CONFIG1 Transfer Ring Element (TRE) to convey
>> HS-specific timing parameters to the hardware. Define a new
>> gpi_i2c_config1 structure containing tcycle_cnt and tlow_cnt fields,
>> with default values of 28 and 38 respectively, as required for 3.4 MHz
>> HS mode operation.
>>
> Little more enhanced -
> 
> dmaengine: qcom: gpi: Add I2C High-Speed mode frequency support
> 
> Introduce CONFIG1 Transfer Ring Element (TRE) support to program
> I2C High-Speed (HS) mode timing parameters through the Qualcomm
> GPI DMA engine.
> 
> Add a new gpi_i2c_config1 structure containing tcycle_cnt and
> tlow_cnt fields. The fields are initialized to the hardware
> recommended values of 28 and 38, enabling 3.4 MHz HS-mode I2C
> transfers.
> 
Sure will review and update in V2.>
>> Signed-off-by: Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>
>> ---
>>   drivers/dma/qcom/gpi.c           | 54 ++++++++++++++++++++++++++++++ 
>> +++++-----
>>   include/linux/dma/qcom-gpi-dma.h | 28 ++++++++++++++++++++-
>>   2 files changed, 75 insertions(+), 7 deletions(-)
>>
>> diff --git a/drivers/dma/qcom/gpi.c b/drivers/dma/qcom/gpi.c
>> index a5055a6273af..52a7800ed4f5 100644
>> --- a/drivers/dma/qcom/gpi.c
>> +++ b/drivers/dma/qcom/gpi.c
>> @@ -21,6 +21,7 @@
>>   #define TRE_TYPE_IMMEDIATE_DMA    0x11
>>   #define TRE_TYPE_GO        0x20
>>   #define TRE_TYPE_CONFIG0    0x22
>> +#define TRE_TYPE_CONFIG1    0x23
>>   /* TRE flags */
>>   #define TRE_FLAGS_CHAIN        BIT(0)
>> @@ -58,9 +59,14 @@
>>   #define TRE_I2C_C0_TX_PACK    BIT(24)
>>   #define TRE_I2C_C0_RX_PACK      BIT(25)
>> +/* I2C Config1 WD0 */
>> +#define TRE_I2C_C1_TLOW        GENMASK(9, 0)
>> +#define TRE_I2C_C1_TCYCLE    GENMASK(19, 10)
>> +
> 
> Not sure why above two not looking aligned by tab
> 
>>   /* I2C GO WD0 */
>>   #define TRE_I2C_GO_CMD          GENMASK(4, 0)
> 
> [...]
> 
>> -    /* create the GO tre for Tx */
>> -    if (i2c->op == I2C_WRITE) {
>> +    /* Create CONFIG1 TRE if requested */
>> +    if (i2c->set_config1) {
> can we move this set_config1 into else if part of set_config, above ?> 
>          tre = &desc->tre[tre_idx];
>>           tre_idx++;
>> +        /* CONFIG1 TRE with timing parameters */
>> +        tre->dword[0] = u32_encode_bits(i2c->config1.tlow_cnt, 
>> TRE_I2C_C1_TLOW);
>> +        tre->dword[0] |= u32_encode_bits(i2c->config1.tcycle_cnt, 
>> TRE_I2C_C1_TCYCLE);
>> +        tre->dword[1] = 0;
>> +        tre->dword[2] = 0;
>> +        tre->dword[3] = u32_encode_bits(TRE_TYPE_CONFIG1, 
>> TRE_FLAGS_TYPE);
>> +        tre->dword[3] |= u32_encode_bits(1, TRE_FLAGS_CHAIN);
>> +    }
>> +
>> +    /* create the GO tre for Tx */
>> +    if (i2c->op == I2C_WRITE || i2c->op == I2C_HS_WRITE) {
>> +        u8 master_code = 0; /* Default master code for Linux EE */
> why for Linux EE ? what else could be ?> +        u32 cmd_opcode;
>> +        bool is_hs_mode = false;
>> +
>> +        tre = &desc->tre[tre_idx];
>> +        tre_idx++;
>> +
>> +        is_hs_mode = (i2c->op == I2C_HS_WRITE || i2c->op == 
>> I2C_HS_READ);
>> +
>> +        /* Determine the command opcode based on HS mode and 
>> multi_msg flag */
> Comment is mostly restates the code, would write as -
> /* Select HS-mode or standard I2C opcode. */
>>           if (i2c->multi_msg)
>> -            tre->dword[0] = u32_encode_bits(I2C_READ, TRE_I2C_GO_CMD);
>> +            cmd_opcode = is_hs_mode ? I2C_HS_READ : I2C_READ;
> can you add explanation of cmd opcode into commit log too ? That would 
> make story describing changes.>           else
>> -            tre->dword[0] = u32_encode_bits(i2c->op, TRE_I2C_GO_CMD);
>> +            /* I2C HS write vs Regular I2C write */
>> +            cmd_opcode = is_hs_mode ? I2C_HS_WRITE : i2c->op;
>> +
> what if i write as below, will be simplified ?
> i2c->op = cmd_opcode ; //OR can store directly into i2c->op.
> tre->dword[0] = u32_encode_bits(i2c->op, TRE_I2C_GO_CMD);
> 
>> +        tre->dword[0] = u32_encode_bits(cmd_opcode, TRE_I2C_GO_CMD);
>> +
>> +        if (is_hs_mode)
>> +            tre->dword[0] |= u32_encode_bits(master_code, 
>> TRE_I2C_GO_MASTER_CODE);
>>           tre->dword[0] |= u32_encode_bits(i2c->addr, TRE_I2C_GO_ADDR);
>>           tre->dword[0] |= u32_encode_bits(i2c->stretch, 
>> TRE_I2C_GO_STRETCH);
>> @@ -1674,7 +1708,7 @@ static int gpi_create_i2c_tre(struct gchan 
>> *chan, struct gpi_desc *desc,
>>               tre->dword[3] |= u32_encode_bits(1, TRE_FLAGS_CHAIN);
>>       }
>> -    if (i2c->op == I2C_READ || i2c->multi_msg == false) {
>> +    if (i2c->op == I2C_READ || i2c->op == I2C_HS_READ || i2c- 
>> >multi_msg == false) {
>>           /* create the DMA TRE */
>>           tre = &desc->tre[tre_idx];
>>           tre_idx++;
>> @@ -1826,6 +1860,14 @@ gpi_prep_slave_sg(struct dma_chan *chan, struct 
>> scatterlist *sgl,
>>       if (direction == DMA_DEV_TO_MEM) /* rx */
>>           nr_tre = 1;
>> +    /* I2C High-Speed mode sends an extra CONFIG1 TRE ahead of the GO 
>> TRE */
>> +    if (gchan->protocol == QCOM_GPI_I2C) {
>> +        struct gpi_i2c_config *i2c = gchan->config;
>> +
>> +        if (i2c->set_config1)
>> +            nr_tre++;
>> +    }
>> +
>>       /* calculate # of elements required & available */
>>       nr = gpi_ring_num_elements_avail(ch_ring);
>>       if (nr < nr_tre) {
>> diff --git a/include/linux/dma/qcom-gpi-dma.h b/include/linux/dma/ 
>> qcom-gpi-dma.h
>> index 332be28427e4..6e9f09fc109a 100644
>> --- a/include/linux/dma/qcom-gpi-dma.h
>> +++ b/include/linux/dma/qcom-gpi-dma.h
> 
> [...]
> 
>>   /**
>> @@ -62,15 +82,19 @@ enum i2c_op {
>>    * @high_count: high period of clock
>>    * @low_count: low period of clock
>>    * @clk_div: source clock divider
>> + * @clk_src: serial clock
> source clock right ?
yes, its source clock.>    * @addr: i2c bus address
>>    * @stretch: stretch the clock at eot
>> - * @set_config: set peripheral config
>> + * @set_config: set peripheral config (CONFIG0)
>> + * @set_config1: set peripheral config1 (CONFIG1)
>> + * @config1: I2C HS mode timing configuration (CONFIG1 TRE parameters)
>>    * @rx_len: receive length for buffer
>>    * @op: i2c cmd
>>    * @multi_msg: is part of multi i2c r-w msgs
>>    */
>>   struct gpi_i2c_config {
>>       u8 set_config;
>> +    u8 set_config1;
>>       u8 pack_enable;
>>       u8 cycle_count;
>>       u8 high_count;
>> @@ -78,6 +102,8 @@ struct gpi_i2c_config {
>>       u8 addr;
>>       u8 stretch;
>>       u16 clk_div;
>> +    u32 clk_src;
>> +    struct gpi_i2c_config1 config1;
>>       u32 rx_len;
>>       enum i2c_op op;
>>       bool multi_msg;
>>
> 

