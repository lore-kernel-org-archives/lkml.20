Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793690521;
	b=SS+ior1AAhhT1vA4fo0nRU8gs+4cNNNzyw/zkGcyMZWkyndJjypHd3EUnv2qmLkEY6Y6
	 XGx1U71Gc4IBz6MfTsT6VM7Xor9fWwy0LxncnVlkyX8TTWfTUYbMD1/D96pV86/2DD/n/
	 v6t1ZoI9LuqSrcOsa9eJJe+C03wqbzvs4sWoBxbmHzcQp/i15y1MK+ULdkD/qSKwDv48K
	 M0ECstYpXwFeAA72g06kvQa8PA3Tac9K46Rh6LkTqED9Ael0opa0id3R3NJx2aWd9ADH7
	 zj6UbNXnlJFrS/WeOWqJMuxVcH4UteT+bQ08L/8XApBcyzz96rhs8RuS91ePGFmameg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793690521;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=oNOQHJMVvx6lR/9lQldFO/azLOgEmsHBjYrpgr2OldY=;
	b=cdZhi0neq+mn0Sr7yd4jSvI199DPtwBx7ZOMJZ7mFekHQgKO5Y3UNvLxpP/fn6Hty8fJ
	 fiBldBrf/gkOTPvveBE6zGkhf+7SjikQ9sJd8TRnYYUxrrgV3Nwd3gs6/BZzZMwiMs+jF
	 cCDKR8f/syRnvFBBXfeGRWytPVSrw6EuIG4vWAJRe03Hw+7czyaR/qX/dp5gTvJCz40/e
	 cwv/HCHbLd1LnZFbqJR/6nw+EN1qyVkIhDRtn4hCTtxa10KOs++0lMZ5SZtIQJbP5rTvq
	 SpUsNSTPs5hmnlvNTJRJ7zrV4TzaSXLmD1v8keAG7+zVTnjvTOrw6PwAA9m2oGNYW+A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ezMF53wN;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BGtTIaBI;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72F56606A334
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 07:22:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 72F56606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ezMF53wN;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BGtTIaBI
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A34hRXK751268
	for <linux-kernel@vger.kernel.org>; Tue, 3 Nov 2026 07:22:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oNOQHJMVvx6lR/9lQldFO/azLOgEmsHBjYrpgr2OldY=; b=ezMF53wNN1hAlzpQ
	zPBeT7TC/xSZHNmjdsSl2GQ6BmRxXFvF3LseH/sFoC3xmeQqk/6NIN1TekJ4maEL
	KS788+hJBxvPILfskRTPGdZNmGuZ/KG8/5nB6EOj/VyBqQsqv6Vq47Dd5KkBPw6J
	RyyvbT9ow8iG0IElFc+hEonEiK9JZDRMZnZpxb/5mqfLLhP+FlGE0Psp51EGg05x
	9llxfvRzhZDSStQFRFcM1hFbbSTKEiF5xn1IyDsl81n/9c83XJneypRyZxizAylD
	eQk5XEj96drXanlrr/bl0u/Kmdk0z+1MU8SSMHr0nmEKEh3Xsw7jgrag5sF7FVjv
	2Bzhyw==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hq8u5gj5x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 07:22:00 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cbb92868263so2119443a12.2
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 23:22:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793690519; x=1794295319; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oNOQHJMVvx6lR/9lQldFO/azLOgEmsHBjYrpgr2OldY=;
        b=BGtTIaBIMrrKnFSxyT/4pFlXPo/SdPLLEMgB+zfOxCcp+KH1PDewGJhYGrZCybwz6Q
         KAIZTGGGgzJQmxjJQc0BMwYbfey1e7zdqA1vyR2nuNrAHwkWZDVG6NwuuZv4HryuNPao
         Xz2bqjEwD3eWALRv6JavURbxtGjxLm+BkFP3sF/79xOh2tf4KrSxjrB5Y5G1Lyfq9xUR
         4a5IboolIfp2BQrGugwpw/iNnznq3XiJd/6U7xWoPkkyC+YwmXQbLGZYbSNcQhYJJFG9
         WDDI1CLFmpm6ExoYae0gp4z9Wd4cmRaStotTYk/wyXRyEjJlPOk1HzrkCJF/rxHWrZqn
         2b0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793690519; x=1794295319;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oNOQHJMVvx6lR/9lQldFO/azLOgEmsHBjYrpgr2OldY=;
        b=znA+DRn1HuAzixp3u8DxZ+Ubdc2zrM84Bc0GUdS3Tm/13Ar0+WdIiOXHJMAmI3RlH9
         +UMw4wX9XPq4ENV8+UHP7HK2+VY7b0TNHpD1lmhO1ofrkax0J8de+MnGnwgwQG2lSQoS
         FPQMf1r8iGNQsqlL8fXlOeyh3NTudUZ3c6uxVhcaf1HlO8VlWncTlRsVehfdIiFdxvh1
         LZZRv4BJGq6Oi2cDoDpNBhkYH21Bf0QVHKegimwuDGqJulRVl4GXwP0JcuRcLLNRLMxU
         0twrsYHxG5TbD7GFXPcDqVeE2Hgu2jT1RpFA4ICILXjoJI/tZANASxuS7/pZCGJ2ePcy
         6/Sw==
X-Forwarded-Encrypted: i=1; AKwUvBxpOmcv0y0NT1pwON0XicoHpoY8KaqD+85SMWCvg2/XpwB3dbv3oDE36Ua2IW2eqkSqtWje00Aead/2/x0=@vger.kernel.org
X-Gm-Message-State: APuU4Z9/bR2Gbg31PXK7qB+vWOBNH54XDf4xst2ZcZgBDsREVTw0UCdj
	44dJe70cZVc4EuPKJquu4tqq9ahKpmsVqcEGGwONPsEiaOjeZ4JmhuQmEQJzFraQzbKXYJBdF7z
	eQHquAai1NfAm1dSNxs+WhoAsHZgQ1nsX5DoZjQX+hngLqxOsvFY2qbSaW/9deB+hRyo=
X-Gm-Gg: AYBFou1UeMxBpzoqXrw9zKnB9c+VjK99tdNXQE5IR/KP7pdPHp7Bt+d3cQ7wd+yhQHT
	CrNegidfK0WQCfKh728s2qVxFpPC2mv4pmWcXS5zYtu4tuu2Yf8T0lYOlXqHDM245QZKdo0Moqf
	QQOOZ3DNJkGUPDlhujJK5PUZOg4r8EP9kXdWDxFXwrJD9Tjl8MjqAh259oai33sjC1BuZGqseGk
	BMp28+h9BorCXbyIysK1n6HPLgbaRC8+UD5Wmbst6BH63CB89C6Pzuzc16VffXRMpbq3YOECVoX
	5wHDwm4Uiqjo7rtVtK5eEYXWzd0LycuFdlUYbqib4j/AZ2UPivAz1QIROhI0DiNQ6mVplubDEwp
	uKHEFUEoQYjsHm7RRqyTJcOmMt3bj902ysbsEXOub9Tw4CJkoSZj9Dh6T09k3XvwDegKbjf3t13
	/RTY4=
X-Received: by 2002:a17:90a:c2cc:b0:3a8:f70f:2437 with SMTP id 98e67ed59e1d1-3ae8980bd04mr8855424a91.50.1793690519169;
        Mon, 02 Nov 2026 23:21:59 -0800 (PST)
X-Received: by 2002:a17:90a:c2cc:b0:3a8:f70f:2437 with SMTP id 98e67ed59e1d1-3ae8980bd04mr8855410a91.50.1793690518518;
        Mon, 02 Nov 2026 23:21:58 -0800 (PST)
Received: from [10.217.218.73] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c666cdcsm2799014a91.11.2026.11.02.23.21.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 23:21:57 -0800 (PST)
Message-ID: <cb63c8ad-abf2-41f3-a2c2-0b21196fe46e@oss.qualcomm.com>
Date: Tue, 3 Nov 2026 12:51:52 +0530
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
Subject: Re: [PATCH v3 1/3] dmaengine: qcom: gpi: Add I2C bus recovery opcode
 support
To: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>
Cc: naresh.maramaina@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org
References: <20261027-20260826_aniket_randive_oss_qualcomm_com-v3-0-7f2a6e572de9@oss.qualcomm.com>
 <20261027-20260826_aniket_randive_oss_qualcomm_com-v3-1-7f2a6e572de9@oss.qualcomm.com>
 <197ed473-d259-4f1f-ace0-ce98ac0fd127@oss.qualcomm.com>
Content-Language: en-US
From: Aniket RANDIVE <aniket.randive@oss.qualcomm.com>
In-Reply-To: <197ed473-d259-4f1f-ace0-ce98ac0fd127@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 6e1WxMvPxxljJVezCNBvN7om0aIEo7Io
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDAyOSBTYWx0ZWRfX5S24vebSEpsC
 AT70ty4SFLPHvc7VteL0YWdz0IXWiKjMcMHXP8G5t0SHRJHNYs7ClaFu+xxmaB7dgbnPytmVsPm
 e034C5zZwxqoBHen/bh9dgAj11/vNr0=
X-Authority-Analysis: v=2.4 cv=RZ0FmFtv c=1 sm=1 tr=0 ts=6ae98b98 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=Dft2pwwzc1VQXl6WdfMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-ORIG-GUID: 6e1WxMvPxxljJVezCNBvN7om0aIEo7Io
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDAyOSBTYWx0ZWRfX7E/HY0QOI0bD
 BlWpVQYCAVZPAHsE46sjJ+/zO39ADWOVeMZU8ShV9qS0AIoGCJ7GboSAZaC1+mks6VDIiGinnVg
 L85PA/2DULewsQxuIA9egCc9O9+wjDN4tmcw4PZmlRtFJtMYuSNPBY5H8no+OtLC+n0FBiEr/sq
 +x8uZmaMpUSXZ0OJhXQZjYkrqD+sotQx53KaK/QZZcFa88E7GX2pOKZK7fiABbV7tjwLJ1CKAbC
 b1GP9gNYMUwnmrZBrAaDBXBXBXZbDJ5Gvj2uQno93QZfNyM7PLgDdG2Ht8VJZXYXadgvI7ed3mi
 L7SDv1p1aypcF9RpNrC953RrbJJvL2RVTor41m12+T2CzdLsRhNNkU2Eozto0UCsDxGHaRUsOaV
 OaX2xKzwdBe3gMPmBGX147bwhEJl4jim9RklPz0JpVD7tAPUoHuKLOfxBXc5h5fWkbc9ODuTqQG
 J23vkxQPChqMKDmYiBA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_01,2026-11-02_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 impostorscore=0 phishscore=0 suspectscore=0
 adultscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611030029



On 10/27/2026 7:04 PM, Mukesh Savaliya wrote:
> 
> 
> On 10/27/2026 10:43 AM, Aniket Randive wrote:
> [...]
>> diff --git a/drivers/dma/qcom/gpi.c b/drivers/dma/qcom/gpi.c
>> index c41bfac65ddf..394e7287f6e9 100644
>> --- a/drivers/dma/qcom/gpi.c
>> +++ b/drivers/dma/qcom/gpi.c
> 
> [...]
> 
>> @@ -1692,6 +1709,7 @@ static int gpi_create_i2c_tre(struct gchan 
>> *chan, struct gpi_desc *desc,
>>               tre->dword[3] |= u32_encode_bits(1, TRE_FLAGS_BEI);
>>       }
>> +log_tre:
>>       for (i = 0; i < tre_idx; i++)
>>           dev_dbg(dev, "TRE:%d %x:%x:%x:%x\n", i, desc->tre[i].dword[0],
>>               desc->tre[i].dword[1], desc->tre[i].dword[2], desc- 
>> >tre[i].dword[3]);
>> @@ -1825,6 +1843,18 @@ gpi_prep_slave_sg(struct dma_chan *chan, struct 
>> scatterlist *sgl,
>>           nr_tre = 2;
>>       if (direction == DMA_DEV_TO_MEM) /* rx */
>>           nr_tre = 1;
>> +    /*
>> +     * Recovery opcodes do not require DMA data TREs, only CONFIG
>> +     * (for set_config) and GO TREs. Since gpi_prep_slave_sg() is
>> +     * shared with SPI, verify the channel is I2C before accessing
>> +     * the configuration data.
> I think i have mentioned earlier also. gpi_prep_slave_sg() Not only 
> shared with spi but rather say, is a common function for all protocols.> 
> +     */

Currently, the GPI driver has only I2C and SPI clients, so I mentioned 
SPI specifically. However, UART may also use GSI mode in the future. 
I’ll update the comment to state that gpi_prep_slave_sg() is common to 
all protocols.

>> +    if (gchan->protocol == QCOM_GPI_I2C) {
>> +        struct gpi_i2c_config *i2c = gchan->config;
>> +
>> +        if (i2c->op == I2C_BUS_CLEAR || i2c->op == I2C_STOP_ON_BUS)
>> +            nr_tre = set_config ? 2 : 1;
>> +    }
>>       /* calculate # of elements required & available */
>>       nr = gpi_ring_num_elements_avail(ch_ring);
>> diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/ 
>> i2c-qcom-geni.c
> [...]

