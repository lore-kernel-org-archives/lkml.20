Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28025367B7B
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 17:25:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787765154; cv=none; b=MASum8tzES0Q4IQdf/3UqxI3GAwr9nyAYrBv9W0PkJj4uthWUkhQPTG89HcYDZw9Uy8XZvuthFFwu1NPBC9Wx3lZsXN8GkFIB7pNge9HJIm4lKboaWiuz5wrRJleyVxsuXP6BvuE1ArqNEtob/9LEfn7WHSWGWfz+280gHZGGww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787765154; c=relaxed/simple;
	bh=F40B1CJr5JKaHFX+ozPVK2LJWxsHkVneqqtO5ySXTco=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qkpkkphC40ZoQiJ+9LEtHhgxlRLzdQVYuUOjM3SmIjWQvnJ/KBv5uq3zgscTRYemyEaNIBumrb5dT1I3LKVLonyyydlhTnsJQWjx1IF9bfj2I1aqgeDnyrPPxq3k/kfKEYQR8nsjFl0IKbdesP2UzyT5v9RZJdHOIFF9/9zM534=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VUrmEJoO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ayektRtt; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VUrmEJoO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ayektRtt"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67QGuoRc1310598
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 17:25:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZxfcVkcbAg/2lXdtbqmlEoQmmr8AoyUiPdFliUFEW84=; b=VUrmEJoONUysjLc4
	eyQhw75NM5MRLBfDLZnJ3i8Z9/FjmVoIbcSU8uzFbgT31LBBsTYvKW8cU6ykSMsM
	7vo9vZEcG+LyOdSNijv0/mUrGc7FB4BCJmi0SmT7ZTcBgF6wc+LJJRfzeSLNj22k
	j5v5p/29g6p1XiAyhFsmlmvLxYwZwQQSCkwtf/gRl6Tkx1+d2pY5NPcEB9KCtAPK
	bNN8AT+D7f9lcSi3eq7q1qDF1OOMzpGZCgAKkwWFfU81x+4wuQ1XsJjqHLTGLqFA
	pA+F6BIHfoVVgAKdpPA4QsaXM3E6xZDHBBEx8+/fiAJlG4iTR19RtNzd+5byLF5V
	bfeFcQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ga03a97qf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 17:25:36 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38fa7b09921so1607694a91.1
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 10:25:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787765136; x=1788369936; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZxfcVkcbAg/2lXdtbqmlEoQmmr8AoyUiPdFliUFEW84=;
        b=ayektRtt8eltnzFxAHCr8spJQlBt+TUzp0fN2vl4okIMxNQifJM/Vq1nBWCVMzoqex
         RNMa8Cj86QFPgjAhkrySVaiAiF/GcTod16sB1BSc00mlzQrSSWxgmFAD4/P0oOOcPlSf
         CjADtr+I/PZ4M06SIMJxaOFBWseXg7nhoRMKUZ4vqfuU64uywdMH4ogqofp1B+Ct2sBC
         /V94v9V9uuDr+p0iIQEhdCm2TJt4MbwYL34gQ23W4FDrke1tlC7xmng/FaHns3WGZBQC
         +8b8qQBkRBTCa18dF5Cba7QwgqmcqIi/PvdkkT7xUeXgqb2Cj+9NWgUp2aTzs+vbkCIV
         /oKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787765136; x=1788369936;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZxfcVkcbAg/2lXdtbqmlEoQmmr8AoyUiPdFliUFEW84=;
        b=qpSZMP1oQVcWOzyIGJJhPCaF3Xx7Mw2sMM8Z74PlFg0e/MjRAX/MQNQc3oMtL5iYSR
         KAx/hPcIzPdQP80dwPgKkz3IJK0xJbUT3VeDIALXnqEhKS/pDOjhyhIyrgGSwo8mPjJA
         Fj0BL13er6SLH4TPYgNMuMXClFfwgLqnibMUL4k3oAVsGFdQY1y5kd5QHS0JhtVpsTnt
         jUTyDwT2cQuifeSKbRLc0Z14D5nQJRtVCgR40SODjvD+0t2kcvor7rPF9HN6OzQAAlpp
         m1nDEH+6Fl3VAcrdgSocawQEPpJEwkCr/+NvifTn4vSvRCxhc7skKIa9VZPQ3Q9hzkBg
         TZwQ==
X-Forwarded-Encrypted: i=1; AHgh+Rpxu/U8C4uXIZk/bkBHInyYNb4mrRiSzt6YdE1SpTjlsmgAL+1FCal+cmSn/Dy7sxF+HFgvmvI1gc8RzEQ=@vger.kernel.org
X-Gm-Message-State: AFuF++kEjUJOYKfprGcKj6jHJjbsC0J8QJCFbQJRnBZFG4IkFe+wf5D1
	UbP8Ye2VDHEfsmzd8X2FMUkASHX9FfOLN8+BI5iZuyeb+DzjB/F4RTHqNcWbgf9X0XUho4JRtQu
	gYeOonFzB/n0JdEevPKPevUR07xt+pQ5FAkorPEgvjfFQqqw/hxNIIH41iC2JaZavS7o=
X-Gm-Gg: AR+sD13n0OmHPniM17AsnAbGHusMreFlZbhbxMttu91jpgHEV4FZ4DKUkZpHJ08CTQ3
	H9mcqQpHTQpaCauAQbVpkDMUkIDLm6Eth+Q1/eT6tOTCgs5UB5bW9BP1bNZRevF3yTbrZNeBdap
	Q4UcjeCv5jIfbYCX/VtZKF7pLrB/I85ngtG7jYsshy3hKcp8Vs55yolZUF8YXyLZd9sGiBb83oV
	hGpdgHPH4S0DR9GP9m+jRX9xjg4358zMhvr8bpIi3s/AOsqTAr31HTY1t906GVO6P1FzuGiLAJq
	XJc5LUQQ1Pr+hLn7MYqoxfoA9MT3GZ0BQW1hHViAXAQUYr7tv20FthAeZhdk4hNnJqBtr+ULNT2
	x3rokcRo739VP1FG9e0X9mHvFz/P4sEhX
X-Received: by 2002:a17:90b:51d2:b0:381:6c5:3f63 with SMTP id 98e67ed59e1d1-3966d21833dmr18520726a91.6.1787765135928;
        Wed, 26 Aug 2026 10:25:35 -0700 (PDT)
X-Received: by 2002:a17:90b:51d2:b0:381:6c5:3f63 with SMTP id 98e67ed59e1d1-3966d21833dmr18520582a91.6.1787765135326;
        Wed, 26 Aug 2026 10:25:35 -0700 (PDT)
Received: from [192.168.0.6] ([49.204.111.175])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39668a57396sm5359403a91.13.2026.08.26.10.25.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Aug 2026 10:25:34 -0700 (PDT)
Message-ID: <ed6a10a5-e4dd-422f-a302-c199d810117a@oss.qualcomm.com>
Date: Wed, 26 Aug 2026 22:55:29 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] i2c: qcom-geni: add I2C frequency table for 32 MHz
 firmware-based SEs
To: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        Manikanta Mylavarapu <quic_mmanikan@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>,
        linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260812-ipq5424_i2c_scl_updates-v2-0-e09cd39d01d7@oss.qualcomm.com>
 <20260812-ipq5424_i2c_scl_updates-v2-2-e09cd39d01d7@oss.qualcomm.com>
 <fa199e71-537e-4bce-a0d8-ef59fe871bf6@oss.qualcomm.com>
 <8d747275-fe32-4fb4-9c57-ff9bfe13ad1f@oss.qualcomm.com>
Content-Language: en-US
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
In-Reply-To: <8d747275-fe32-4fb4-9c57-ff9bfe13ad1f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: Wtb8k7dzXRA7MsuSkdRg-SucgxQLhaL3
X-Authority-Analysis: v=2.4 cv=VdLH+lp9 c=1 sm=1 tr=0 ts=6a8f2191 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=MMW3c9rFXQuugNOjlkEUow==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=lhM4H5XKsiMz3D9YxmoA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: Wtb8k7dzXRA7MsuSkdRg-SucgxQLhaL3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDE0NSBTYWx0ZWRfX8JLfFoI2//i2
 h2aIgKPBL6MQ5Lbnp3WrQIH9aTiR9/viL2SQsvc7Hm5Aalk/ibboC2bCOcHDpJsoExauO+0weo6
 70tJENwpZUQ8+o6tf5zd4A49YH/fjaeB0grJOgnDPX3ZKp1iqCHcA/1JgJ4tPjO0FuTfe5KJ3Zo
 nz4P0jge49G4IN3wOD67uKbOhigStJruS9Jdd2S63ho/T5SjrxIiKLExk62vF2KlbaYBfZpBJb4
 zJIcVLV14cftaU/2FvFza5snfRTAb0FLQZzABl+GqXOcnQeZn4FgBzQywjbwu63MaV2XzgNxxDS
 ITpCrZ8kqZDTmf1qULV2WTkCwVXqb/EdfutiJg+DsVH8Mr7arMMBo3Sb1ZTxTPL8x7x9LycvMWl
 zg659j7Hnl8QdTEzWt0V2gK1uzeMRGq2voP0VEEY5dNsVTYclVfS2R1PKO7LRooGNAaunS96qfU
 8u8ITS5vcBXgSM+tagA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDE0NSBTYWx0ZWRfX1m/uO3FuVaz9
 /IC1/754y1NUXNraWX+KV0Z3fdcJPgiyGhE4LHAepwdGkgClgH0Y3tVZ1oqatt+e86suzSDZDxr
 3ZxZHaXIl44ox+hrZFhg5Vx/aikhwlE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-26_05,2026-08-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 suspectscore=0 malwarescore=0 spamscore=0 phishscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608260145

Hi Kanthiravan,

On 26-08-2026 22:29, Kathiravan Thirumoorthy wrote:
>
> On 8/25/2026 10:50 PM, Praveen Talari wrote:
>> Hi Kathiravan,
>>
>> On 12-08-2026 14:00, Kathiravan Thirumoorthy wrote:
>>> On IPQ5424, the I2C controller can operate on both RTL-hardened SEs
>>> and firmware-based SEs. As documented in commit 506bb2ab0075
>>> ("i2c: qcom-geni: Support systems with 32MHz serial engine clock"),
>>> in IPQ5424 SEs use a 32 MHz source clock.
>>>
>>> The existing frequency table does not provide the required SCL timing
>>> parameters for firmware-based SEs. Add a dedicated frequency table
>>> using the SCL counter values recommended by the hardware design team
>>> and select it for firmware-based SEs to achieve the target bus
>>> frequencies.
>>>
>>> Move geni_i2c_clk_map_idx() from geni_i2c_resources_init() to
>>> geni_i2c_init() to ensure SE_HW_PARAM_2 is accessed only after the
>>> required clocks have been enabled.
>>>
>>> Signed-off-by: Kathiravan Thirumoorthy 
>>> <kathiravan.thirumoorthy@oss.qualcomm.com>
>>> ---
>>>   drivers/i2c/busses/i2c-qcom-geni.c | 25 ++++++++++++++++++-------
>>>   include/linux/soc/qcom/geni-se.h   |  1 +
>>>   2 files changed, 19 insertions(+), 7 deletions(-)
>>>
>>> diff --git a/drivers/i2c/busses/i2c-qcom-geni.c 
>>> b/drivers/i2c/busses/i2c-qcom-geni.c
>>> index 00013b41a6f5..15835f10b062 100644
>>> --- a/drivers/i2c/busses/i2c-qcom-geni.c
>>> +++ b/drivers/i2c/busses/i2c-qcom-geni.c
>>> @@ -187,19 +187,28 @@ static const struct geni_i2c_clk_fld 
>>> geni_i2c_clk_map_19p2mhz[] = {
>>>   };
>>>     /* source_clock = 32 MHz */
>>> -static const struct geni_i2c_clk_fld geni_i2c_clk_map_32mhz[] = {
>>> +static const struct geni_i2c_clk_fld 
>>> geni_i2c_clk_map_32mhz_minicore[] = {
>>>       { I2C_MAX_STANDARD_MODE_FREQ, 12, 9, 10, 26 },
>>>       { I2C_MAX_FAST_MODE_FREQ, 4, 3, 9, 19 },
>>>       { I2C_MAX_FAST_MODE_PLUS_FREQ, 2, 3, 5, 15 },
>>>       {}
>>>   };
>>>   +static const struct geni_i2c_clk_fld 
>>> geni_i2c_clk_map_32mhz_fwcore[] = {
>>> +    { I2C_MAX_STANDARD_MODE_FREQ, 12, 9, 10, 25 },
>>> +    { I2C_MAX_FAST_MODE_FREQ, 4, 3, 9, 18 },
>>> +    { I2C_MAX_FAST_MODE_PLUS_FREQ, 1, 6, 15, 29 },
>>> +    {}
>>> +};
>>> +
>>>   static int geni_i2c_clk_map_idx(struct geni_i2c_dev *gi2c)
>>>   {
>>>       const struct geni_i2c_clk_fld *itr;
>>> +    bool is_minicore = FIELD_GET(GEN_USE_MINICORES,
>>> +                     readl_relaxed(gi2c->se.base + SE_HW_PARAM_2));
>>>         if (clk_get_rate(gi2c->se.clk) == 32 * HZ_PER_MHZ)
>>> -        itr = geni_i2c_clk_map_32mhz;
>>> +        itr = is_minicore ? geni_i2c_clk_map_32mhz_minicore : 
>>> geni_i2c_clk_map_32mhz_fwcore;
>> The source selection remains unchanged when using 32 MHz:
>> writel_relaxed(0, gi2c->se.base + SE_GENI_CLK_SEL);
>
> I have to check on this. But in downstream, we didn't change this 
> configuration.

You might not have encountered any issues because SPI and UART already 
request

the necessary performance vote when operating at higher source clock 
frequencies.

Without the corresponding vote from SPI and UART, we would expect 
failures or

timing issues when switching to those higher frequencies for I2C.

>
>>
>> However, what about the voltage requirements associated with the 
>> higher frequency?
>
> There are no such requirements in the IPQ SoC.

If there are no additional voltage requirements for I2C,

how are higher source clock frequencies handled for the SPI and UART 
GENI drivers?

They also operate at source frequencies above 19.2 MHz.

>
>>
>> Are they automatically managed by the underlying provider, or is 
>> additional handling needed in the driver?
>>
>> Reference of konrad change for CCI I2C driver for 37.5MHz with 
>> voltage requirement.
>>
>> https://lore.kernel.org/linux-arm-msm/20250904-topic-cci_updates-v1-4-d38559692703@oss.qualcomm.com/ 
>>
>>
>>
>> Thanks,
>>
>> Praveen Talari
