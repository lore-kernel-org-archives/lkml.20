Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793705063;
	b=AwnohnsJLZkS8rCFossS+FUrgZdvmLLyGmMK4mbcBgjzFs2k0e28E4h+Yf0zZC0GdX5q
	 wgzri0KkPvYRCQ/6AfnSPk3YzK6w1QpYLRPnBj1QvB5mIqlyaH8IQ5a6A4x3XWAz+9mSt
	 LbY6lD6/+KVXY8FhOMJ2GixB60r6ClDYNO8mDdXHDlZGf3dvL0+r4/gTJgmevflRU5Suv
	 j3jEWE+uNuH+xDDdeQcFcjUCQnENR8wQ2f6ICNwbqepbzmgqqq53cmFm/vD0pQ22ZMQMF
	 D/pdCxGjoSi9icwh/xa7koPsC7vTAqyoyuBSpuaNrfCotXded//tYq9JzS18OIjWGJQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793705063;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=8oAkjaXnaFfUyFpwVtYsA1E6QVQ2RETjVoO0Gm7QsyM=;
	b=hbB1FOKC3NS+FBrvb7+4Bjr0YfpJfxjvwdNX9dn6KKk7uWj8VYJvvEwRbkhPA1nVdRFW
	 q7BEUTKtO2/r26w5f3uH4TL9HCK6eN4BxCksAO1LfgHRIF92PhimyUey00FC59ev8Z5EQ
	 tqgSerHZKhoZZI8M+A6CDdkEiuTP2ajcoDaunlf5LPcT7kls7XTVmq7oiifIrLNsnasPg
	 q+KEGsr7/b2eWsLHOkX/f9PL5lpOoElo1Oc8hO/XS4pNaEfhcqHenuxExlkoCeE/F3YZy
	 oUCbSVDIRDCWmpPpSXZftScFiHr/e3SwGE2SfEr0VcO+Z86wtmp+9Zab5HccXG84uGw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CPmaW5ke;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=aFB13n1E;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABF93606D821
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 11:24:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ABF93606D821
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CPmaW5ke;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=aFB13n1E
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A3AASZw1594022
	for <linux-kernel@vger.kernel.org>; Tue, 3 Nov 2026 11:24:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8oAkjaXnaFfUyFpwVtYsA1E6QVQ2RETjVoO0Gm7QsyM=; b=CPmaW5ke1IkeKpYk
	VXbUK5oTUJ5F5O1457dkRyQlMpaMe0BfRafH2gGGbDKEmNs1n0L0rqqN6BZleU5s
	BSi/bJ5Po7151VgvWgojQP7PDpfF6wGD6qmm4YR8BQ+omSCCoyGSu24cyRzlLtWv
	IeeZNjbYQrL/EewqjIt30Q/TvCGRsplw/ZByFjFUHDE6qjhDc/rOIxNcxeOzZY5B
	Cg2ERHssx48UZHCY3XHPwWP7ELYc9glfZUlTE5d5VVbbHzKrCAccWpIT/rv2CgKr
	zMAWfeRWo/sYrbp5rN+0cFv3Wx8F1fgQdNXFBhnhOGadodCmCZmXd/XPPNHnSRgo
	xqa6Jg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hq081uf5a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 11:24:21 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3ad704d4760so3575456a91.3
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 03:24:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793705061; x=1794309861; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8oAkjaXnaFfUyFpwVtYsA1E6QVQ2RETjVoO0Gm7QsyM=;
        b=aFB13n1Ehtpq/w60bI11UFsymdM8pDW+9/8pFxWNiO4bSZeSqGVg4/yxOSfseupm/M
         ZXqh52TIcm/ApZtOrJC8pBZheKJ6Y9LzX0vUjzAj45zi5dvydpXcNkL7X4zqFRmQhUrV
         iuNwq5+OD3wh5Y5etUJ8yXZm8lh51+1XSc4qxkRJS3XKe9PddJmsZZyYbqAlAN1ZuFml
         TfPpxTlq2RVWJ+mWLRfb7v5r07KCqjAlTrqe8n8aBJaeJXsJwsyPvWPUsC0Dr5+HlF3k
         vdj7SxZ1zVPMFW26g2WyWuRLmIDTYoerhj9etkaeLiB7SMwcy1tYackyAcTPJ6yncvSl
         VfJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793705061; x=1794309861;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8oAkjaXnaFfUyFpwVtYsA1E6QVQ2RETjVoO0Gm7QsyM=;
        b=ZiSWzJhdITQ8FDr1dIfZHpjW1Qsd56qjB71pQ3K6XAIMYWLsWAjjLSlTysSTtFKG7H
         pUTFegaK7tkIRCmyTB97toqJCExgFRv9JMUSLZ7XaNgU5ocmizgUHbTmuhPtvQ+MZQQT
         gJy+3N0FNVDSEy42i/C5NagHb9ngT36UVm2breDfeiAltXe6arqA18pURydiQTixroY+
         hS4+2QrnVaAUGeSB44hdN07R3dfRuuhi5ugCRIu2BstPtQEEW7IvRMQoJMTpuWwjQHrf
         NNAWNkeTL/PT7oue6oAORNPexTe8wc68l4EjZGAavwMNzZjzPxW6AeDy6KKAh3ybdPlp
         3/Cw==
X-Forwarded-Encrypted: i=1; AKwUvByq9evgdYkKz4X+N4Ybs47ZPSbescPrPW6IDrHjp8qng2qty1YTH1BPxxWeHKxU8pIEGvXgDyr7iYqhSfw=@vger.kernel.org
X-Gm-Message-State: APuU4Z8V/1FXKra1RbS4brE7HQiziPeQg3LsN7PygnA4Jdrasi9CQ4bQ
	RB8FAfwjW8B+plbFdagtxsNAowjVauRevceqsbq97/IRO2c1xIiIWN+MXJUGq6UUepJLSXXTTmZ
	Yyqvy1KxL7Cyubw4E6+LN7wOLLpakbsuR/52pi8zIG0FkyUNLQw5jrs7n5dPy6JczLvA=
X-Gm-Gg: AYBFou2fwjsqjN4JV2BoVS07+wOXi8Y/fo5/1qWASAduI1iK9bUL4mt5vpIFCiS7WtL
	3McNIpbg7IebANgIKV1RqWKnW0/G5/9aWg1UlFKc5+4WK3oy8Da7vGYGWRvpNny3QMT+CFMI80E
	k/DmT1LtsB4S3qO3l9PxPSsyhzKlPpWmLn5icda6ZdJaWsKUcpa27j2cgyMjMV5MOZgklkUbF5M
	/V93VXLlgdxe07brSpdEIZVvDN7xgQc9vXRJf/WQ0XG95bHzOyaCYZk2g+3CWj4QdY0qKf0s6XD
	Vi11xmrPez1DAx5XJVIbKL3QJJJ+ctcXrxjR6cqCyPBY7h+PC+1uzDDtwgnKe/mGsaQ1rvVJM/b
	Mgh49a8dgCN2oDe2CpspxIcfLZvMQL3UG8RfS4t52MZaSMH3I2BKQiorC/VP8Wt9+ofNeR9wAMx
	/Ct25amQ==
X-Received: by 2002:a17:90b:4483:b0:3ac:9259:1234 with SMTP id 98e67ed59e1d1-3ae8979ba8emr10442371a91.39.1793705061195;
        Tue, 03 Nov 2026 03:24:21 -0800 (PST)
X-Received: by 2002:a17:90b:4483:b0:3ac:9259:1234 with SMTP id 98e67ed59e1d1-3ae8979ba8emr10442352a91.39.1793705060753;
        Tue, 03 Nov 2026 03:24:20 -0800 (PST)
Received: from [10.217.219.98] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c8329afsm3974716a91.8.2026.11.03.03.24.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Nov 2026 03:24:20 -0800 (PST)
Message-ID: <62363ca8-366b-46d4-9287-674ced93ddfe@oss.qualcomm.com>
Date: Tue, 3 Nov 2026 16:54:15 +0530
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
To: Aniket RANDIVE <aniket.randive@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>
Cc: naresh.maramaina@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org
References: <20261103-20260826_aniket_randive_oss_qualcomm_com-v4-0-59b3ce96dc4b@oss.qualcomm.com>
 <20261103-20260826_aniket_randive_oss_qualcomm_com-v4-3-59b3ce96dc4b@oss.qualcomm.com>
 <2ed54730-75bf-4368-9391-5452d0a31fa9@oss.qualcomm.com>
 <c96a6c5e-45d8-47ba-83df-d956bd2e06fc@oss.qualcomm.com>
Content-Language: en-US
From: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
In-Reply-To: <c96a6c5e-45d8-47ba-83df-d956bd2e06fc@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDA0NSBTYWx0ZWRfX3+Ake6gvUAOW
 XTwF3dJVLM3tc6DCWuW72za8B+fMJGDRT06VkSCGFvXk6tUk/PgW2ElHirvy29u9y2qXOBH6sBX
 icu2CvTzttPJIPJkrRVcknbpcKK8uKY=
X-Proofpoint-ORIG-GUID: at88vQIl8bCbNs2xxzBIaQ3bQJlR9puW
X-Authority-Analysis: v=2.4 cv=F73C5ahN c=1 sm=1 tr=0 ts=6ae9c465 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=ymETMnJNZYboT2KzijcA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: at88vQIl8bCbNs2xxzBIaQ3bQJlR9puW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDA0NSBTYWx0ZWRfX2k+DaErIzx+B
 eqQ68HWqYYty9rWQjIAy9O87es/UwGdWt+9t0JSOjDasheeJYnK8rSMQazBjnuJQkZLgj9fX29u
 Yd1iCttq6jItmTiL7Y+B7UeO0xdqIlSLQ10OdC+BGu4FosGrswgIBUIvMVhW6d1FuaNc37vf7ZG
 a5iBYjEdA5NShpoMXK9UnFDHifk4pDPs4V/R7MohnR0Xo5qmpTnNicImxHx94HLgHzr1470QsF+
 uv9XdsShFQ0d2kbXn1vsILNTcx21RN2QVW8tqANf/WWs/kGfJ0RE+8FJxrer57xCg5MrC1kiEqc
 1ekQF7hjrsHuze4GgMg36mvxd0Lzjsu5ktTP83GIiNpD+WUdQLrZsdxC6NO/tAGBYQe/gsNPQQV
 lqYUNlQIbEsNH5Pmy1Q7W9OWQfwmg5Nskgx34LYB7q/jixyEhFGa7guhXMaSzsHZ8tBWQ+aWxPP
 lvYv2zuOLS0GPqqaS1g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_02,2026-11-02_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0
 clxscore=1015 impostorscore=0 adultscore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611030045



On 11/3/2026 4:46 PM, Aniket RANDIVE wrote:
> 
> 
> On 11/3/2026 4:14 PM, Mukesh Savaliya wrote:
>>
>>
>> On 11/3/2026 2:26 PM, Aniket Randive wrote:
>>> I2C transfers in GPI DMA mode can fail with -EIO when a target holds
>>> SDA low, leaving the bus stuck and preventing subsequent transactions.
>>> The GPI completion callback reports a NACK and a genuine bus error
>>> alike as -EIO, and the existing recovery path switches the SE to FIFO
>>> mode which is not valid in GPI DMA mode.
>>>
>>> Add bus recovery support using the I2C_BUS_CLEAR and I2C_STOP_ON_BUS
>>> opcodes issued via the GPI TX DMA channel. Guard the -EIO recovery
>>> trigger with a SE_GENI_IOS I2C_BUS_FREE check to skip recovery when both
>>> SDA and SCL are already released. Extend the recovery callback to 
>>> dispatch
>>> through the GPI DMA path when gi2c->gpi_mode is set.
>>>
>>> Use the adapter timeout for GPI recovery commands, and preserve the DMA
>>> configuration error code when GPI setup fails.
>>>
>>> Stop recovery on a GPI command timeout and report DMA termination
>>> failures. Do not issue another command or override the timeout with a
>>> bus-idle result, since DMA cleanup may not have completed successfully.
>>>
>>> Signed-off-by: Aniket Randive <aniket.randive@oss.qualcomm.com>
>>> ---
>>>   drivers/i2c/busses/i2c-qcom-geni.c | 107 ++++++++++++++++++++++++++ 
>>> + +++++-----
>>>   1 file changed, 94 insertions(+), 13 deletions(-)
>>>
>>> diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/ 
>>> i2c-qcom-geni.c
>>
>> [...]
>>
>>> @@ -1356,10 +1439,8 @@ static int geni_i2c_probe(struct 
>>> platform_device *pdev)
>>>       if (ret < 0)
>>>           return ret;
>>> -    if (!gi2c->gpi_mode) {
>>> -        gi2c->rinfo.recover_bus = geni_i2c_recover_bus;
>>> -        gi2c->adap.bus_recovery_info = &gi2c->rinfo;
>>> -    }
>>> +    gi2c->rinfo.recover_bus = geni_i2c_recover_bus;
>>> +    gi2c->adap.bus_recovery_info = &gi2c->rinfo;
>>
>> I guess one more time this. Why patch 2 is adding and patch 3 is 
>> removing the change ? keep it clean way.
> 
> This is intentional. In patch 2, bus recovery is supported only in FIFO 
> mode, so we guard the registration with !gi2c->gpi_mode. Patch 3 adds 
> the corresponding bus recovery support for GPI mode, after which the 
> mode check is no longer needed and is removed.
> 

You are right, i saw that as complete logical block removal.
>>>       ret = i2c_add_adapter(&gi2c->adap);
>>>       if (ret) {
>>>
>>
> 

