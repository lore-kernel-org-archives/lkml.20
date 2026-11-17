Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794898375;
	b=ArChxGjI5ww3kVpCcpWCUOLDAZe97g7yYjYha50JVXK3rcPXqOzxypMnlPyDrCTY3nbL
	 KT/tqy5eANxCGeLu+LGfzCCEOUIW/7/1COKwe0FVU4t8JpvBCKMwRtXhx96AF2OnCn/If
	 2WULVv1DcF1z2II0mYBAllW8KBKYrJw6AqITEMeo/rHww0JWelhYTiyd4qqobDVGFujej
	 v/0qXUY8kHs4afcRL2DI8NA9I5oR/RS0uu7WC0IQhN6LxxzAs6wknAY/tvpoIW4fiytuc
	 3fqqKRpVV94tKHbHI5IdfsMp79TDX8A6mZ4yUyOOnOvXA00ip5k2PhOSXyr5URGEgFQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794898375;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=7Gc1K6ilCvMVYzqcG5slTedvJ3YGR03Jfpu0LCvN3hE=;
	b=qEl8DSlFm89ihXVzPI8Go+NKiGuvZYj1VK1dsO1HxwjWIuzDHwudhEs9N6Nz6BsDarRf
	 gc6FBnXonQUE/kuWP8MVZ/iU2rWwOmamd/At7ZujBDWBuA1pJr2W8tHvEhZOrPfccPFoG
	 7gjz0sZx6wdQPmrPkB+MNfjsyPaYUCulnSJy275ar4+x1Xk151F6Kza7r6n9JUpc3g4wX
	 quI8bQLsHPfM6Zy+pD710ZMxTdJZrBXgRe+Jk87wF0umTnQFICUn6wyiIl2mtTO7k40cF
	 WukxUrtDCC4D+UMCtNvUKhgwAZcK5kE6sdHVz75MJ+3tTLVLy8uh2Vw+R4nr0heoxpQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FY6TukEg;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=T2X0tpNc;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B913606A32A
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 06:52:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7B913606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FY6TukEg;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=T2X0tpNc
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AH6exkv2998599
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 06:52:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7Gc1K6ilCvMVYzqcG5slTedvJ3YGR03Jfpu0LCvN3hE=; b=FY6TukEg4N87MmNX
	ltmoHDXoAdRNtrO+2hnqUxY5RIvEBYVUI7EsPa9LcjBFWWcIhGS+A1F4AwEgR5K3
	XdUvJDBpvSWLkLKf4OO5Us/ENe1Iya4iAQby4099nCsNoLOMSpo9Fq/ZGHxG941+
	5tQag7DZX/fL2iLpyHDyoGAec0/T2Ajy0YsJRkGMABf31+jcFSnssahAMoe2VuvI
	94IFm/utr/MYhXMFjjuoPCXVZHvDU26MTdQA7f1DZ6B3R63NZLbriSLdS+c6oy57
	LXTCCDLvcPO9Dpxr4HRq6qKXGaBZGi9nWkSLPl99ceKuyPjMYaRhSseXegCKycrz
	YlfbeQ==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0hve018p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 06:52:53 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8a01e2962a1so4552905b3a.2
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 22:52:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794898373; x=1795503173; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7Gc1K6ilCvMVYzqcG5slTedvJ3YGR03Jfpu0LCvN3hE=;
        b=T2X0tpNc74Ywqljtl/gR+GXxfLRNzTGmBo56anksIzEy9tFVDNGr8UkkGZUDeMs/yy
         ezSi7cbLWJ5czhpBhDKSqasbES1rI+4hGewv2UbDZCoflTM573iGQrxdxaRBnWA6bwuA
         L2kWv2pLvPV66En7NNC0HiJZ+QWtDjzC0WeyMa4AbadFP8vGhuDqJNVPeQeXyL95vUc0
         Vwd+T5JWVywhwKH8LghfkzqpZzoGcOnWPZ/lJNTaxd+i8BFVMAs80O6Z8Od6lxKDPQsG
         SShZt7o2DKLtbYPyH312wMTgwr6DWXqOC3Mb8/Qew9oOA3UIaFSBXbdRDQxKfPYq8ua3
         Y7kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794898373; x=1795503173;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7Gc1K6ilCvMVYzqcG5slTedvJ3YGR03Jfpu0LCvN3hE=;
        b=xpTrN658YvFMCAzwheIXzz7UIer+R26rF2VYKJpDjZI5HAjuxBn3jKV355Fcr42B3Z
         7l1YKeNz0uqpPlrOEOPn8aYaLJi7HNSRcbbRz9/ljvCdIa9TBhuk5BiW5O12Hr4lyUj9
         oT/fxvy1/yk777y1Bkh5IQ+pGovHIQC4YBjsMJkQS9i7SuLPfCHJE1BP90mvTf8fUK2t
         sW5Tjf78EvbMGTfzhhKqlzmPwe4a+Mvv1ttSbugQqLUxAmJ43VNGwCrtFWdAzoYLsrrx
         UgLd7LjlYRwKEFD91cftffosIAbxWtiLRuuQqy6on4Oip8PH2YOsCfn+1OCkAp2N+4Dh
         Mfxw==
X-Gm-Message-State: APuU4Z9pyr3w+THXWrvx8kF/a0NkHuOzOyb54n2vere0wlnx9vwQ6VLd
	polbP0P0hT3cd5IxU3MaXS17/VxHdVyobA1CeoDdzIbo8hwyAneeF2DilgXFYfuhJnwjErVAbHX
	PBiVwnCaO0GcY5Nbh2ixGUyl5q1SNPz2QNlPtA/gBMpbAAYkrkxdnF5At48WDoobX+Qk=
X-Gm-Gg: AYBFou1zKKSWJNWoAkUq82Uajn0l7nPDxJzdYFRN6HhcmSn6urCZaJPoA7CPMM49WK9
	gNJsoEXXn1xRhp65g3ZqrbiXrU/9pEWw/KMc0ppvrXBtHBlGmVgXLat1ZMQQeE90SJR+3iyC44p
	dgnX1NPuI14jlA449OoFr9Rn31+EAc69HJkcAp3I21kJ4aI7/7uA6buSqYqd9kpdPRjbZIyjQGw
	F2B9+SRHG9xOySp33Bh78+o6dvkXwtQtwWJXBU5ADg8vPUIdK+pd5WjtPAiH75TNnJ072L6TAYU
	vDrniyU7ey8N9GuNOswxNv74XgXcSstEPZWlzhT+fkk/EnUsknrE1iE3vmr104ucnaRpRrjoJHu
	tWGh9YEf+KA5D1BIvlx0WVK1xaEEiEksZ7kyQ4cERWdicXN4ZskAv+lB3QRveyauWQpr+KtQV0N
	PwCEtpER99dIrsW7qdJNlarY1N6KCTbu2CE+sweJyWJ4EN
X-Received: by 2002:a05:6a00:1a92:b0:8a0:18bc:e01a with SMTP id d2e1a72fcca58-8beb1fd9a34mr12202634b3a.3.1794898372804;
        Mon, 16 Nov 2026 22:52:52 -0800 (PST)
X-Received: by 2002:a05:6a00:1a92:b0:8a0:18bc:e01a with SMTP id d2e1a72fcca58-8beb1fd9a34mr12202615b3a.3.1794898372225;
        Mon, 16 Nov 2026 22:52:52 -0800 (PST)
Received: from [10.133.33.59] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8bed1f5aef9sm4764381b3a.34.2026.11.16.22.52.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Nov 2026 22:52:51 -0800 (PST)
Message-ID: <4bdb2999-d8c9-400e-8a23-d950a95e43b4@oss.qualcomm.com>
Date: Tue, 17 Nov 2026 14:52:47 +0800
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
Subject: Re: [PATCH v18 5/8] qcom-tgu: Add TGU decode support
To: Suzuki K Poulose <suzuki.poulose@arm.com>, andersson@kernel.org,
        alexander.shishkin@linux.intel.com, mike.leach@linaro.org,
        konrad.dybcio@oss.qualcomm.com, james.clark@arm.com,
        krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, coresight@lists.linaro.org,
        devicetree@vger.kernel.org, gregkh@linuxfoundation.org,
        songchai@qti.qualcomm.com, Jie Gan <jie.gan@oss.qualcomm.com>
References: <20261116074118.822731-1-songwei.chai@oss.qualcomm.com>
 <20261116074118.822731-6-songwei.chai@oss.qualcomm.com>
 <e621c3a7-5633-4d03-9494-a6fa45daea02@arm.com>
Content-Language: en-US
From: "Songwei.Chai" <songwei.chai@oss.qualcomm.com>
In-Reply-To: <e621c3a7-5633-4d03-9494-a6fa45daea02@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDAyNyBTYWx0ZWRfX9rbkaXGQbaid
 HY/DJn9YO6A/gZZ8E4bRkMBCCf4GyLTbQMzRXTBm/K3iIpc2fdsgljM1Ods38Ru4d+w5PP/6OgS
 LPXPQbqCrDFbqt9NW6Er+DBfecC7P7I=
X-Proofpoint-GUID: qp4bhrSY3XVPjrPkU77Avrgeu9VudvuF
X-Proofpoint-ORIG-GUID: qp4bhrSY3XVPjrPkU77Avrgeu9VudvuF
X-Authority-Analysis: v=2.4 cv=dqhOmFg4 c=1 sm=1 tr=0 ts=6afbf9c5 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=W-u9qbw9fePND_ABPHcA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDAyNyBTYWx0ZWRfXx6Ilg3k+2kq5
 Nv6GEbWL8CzAtuluIcjRUgfbSE8iCwWHmxQRhG+LO5Acc/tmZ/12Ux7jup8z3w7SMTbeXkrCDdu
 ffGOZWkK7lGj7a9olpSMGHO5XrAIZlnZ4+YY35/DUpJkPJS7BqMJzjCiUiPjwoJsrYJfzZpI//z
 EmIADKYqGZuqwE4LEB8KtwAlat8QZ7ztd/WUWpceoyh8o052g4Uuh3Ri/SIUD7yQEIlAouUhhEV
 J0GmjxZzoW3UXwWuk8/worD2Ox7zBK5cer5F7zvTYMdQRGsnhSHhLeNv/lqZacwXTZPUDZFZY9q
 ugaIFzaKcUABPN6hYOs5gsKivt0dHNA1YJWrpCnKlWbU3mPxBMRLrE+qwmcG7hpqiRaAzFiQamN
 ETEv1xuSJoJWTTJxVEgjRttaojmmuRs+uayZ2C9+RRHxE4jlaj4GGPbYdKr198Fx/MTy9PcPW9O
 Nbdx46V13/NidygaVNQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 lowpriorityscore=0 clxscore=1015 phishscore=0
 bulkscore=0 malwarescore=0 adultscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611170027


On 11/16/2026 7:43 PM, Suzuki K Poulose wrote:
> On 16/11/2026 07:41, Songwei Chai wrote:
>> Decoding is when all the potential pieces for creating a trigger
>> are brought together for a given step. Example - there may be a
>> counter keeping track of some occurrences and a priority-group that
>> is being used to detect a pattern on the sense inputs. These 2
>> inputs to condition_decode must be programmed, for a given step,
>> to establish the condition for the trigger, or movement to another
>> steps.
>>
>> Reviewed-by: Jie Gan <jie.gan@oss.qualcomm.com>
>> Signed-off-by: Songwei Chai <songwei.chai@oss.qualcomm.com>
>> ---
>>   .../ABI/testing/sysfs-bus-amba-devices-tgu    |   7 +
>>   drivers/hwtracing/qcom/tgu.c                  | 200 +++++++++++++++---
>>   drivers/hwtracing/qcom/tgu.h                  |  35 ++-
>>   3 files changed, 214 insertions(+), 28 deletions(-)
>>
>> diff --git a/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu 
>> b/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
>> index 3be0b912c937..c7e6f13da83d 100644
>> --- a/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
>> +++ b/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
>> @@ -14,3 +14,10 @@ KernelVersion:    7.5
>>   Contact:    Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Songwei 
>> Chai <songwei.chai@oss.qualcomm.com>
>>   Description:
>>           (RW) Set/Get the sensed signal with specific step and 
>> priority for TGU.
>> +
>> +What: 
>> /sys/bus/amba/devices/<tgu-name>/step[0:7]_condition_decode/reg[0:3]
>> +Date:        November 2026
>> +KernelVersion:    7.5
>> +Contact:    Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Songwei Chai 
>> <songwei.chai@oss.qualcomm.com>
>> +Description:
>> +        (RW) Set/Get the decode mode with specific step for TGU.
>> diff --git a/drivers/hwtracing/qcom/tgu.c b/drivers/hwtracing/qcom/tgu.c
>> index 917d506cddf9..1809cca4a94f 100644
>> --- a/drivers/hwtracing/qcom/tgu.c
>> +++ b/drivers/hwtracing/qcom/tgu.c
>> @@ -18,8 +18,8 @@
>>     struct tgu_attribute {
>>       struct device_attribute attr;
>> +    enum operation_index operation_index;
>>       u8 step_index;
>> -    u8 priority;
>>       u8 reg_num;
>>   };
>>   @@ -27,11 +27,36 @@ struct tgu_attribute {
>>    * drvdata->priority is a flat [priority][step][reg] array.
>>    */
>>   static int calculate_array_location(struct tgu_drvdata *drvdata,
>> -                    int step_index, int priority,
>> +                    int step_index, int operation_index,
>>                       int reg_index)
>>   {
>> -    return priority * (drvdata->num_step) * (drvdata->num_reg) +
>> -        step_index * (drvdata->num_reg) + reg_index;
>> +    switch (operation_index) {
>> +    case TGU_PRIORITY0:
>> +    case TGU_PRIORITY1:
>> +    case TGU_PRIORITY2:
>> +    case TGU_PRIORITY3:
>> +        return operation_index * (drvdata->num_step) *
>> +            (drvdata->num_reg) +
>> +            step_index * (drvdata->num_reg) + reg_index;
>> +    case TGU_CONDITION_DECODE:
>> +        return step_index * (drvdata->num_condition_decode) +
>> +            reg_index;
>> +    default:
>> +        break;
>> +    }
>
> > +
> > +    if (result == -EINVAL)
> > +        dev_err(drvdata->dev, "check array location - Fail\n");
>
> see more below
confirmed.
>
>> +
>> +    return -EINVAL;
>> +}
>> +
>> +static int check_array_location(struct tgu_drvdata *drvdata, int step,
>> +                int ops, int reg)
>> +{
>> +    int result = calculate_array_location(drvdata, step, ops, reg);
>> +
>> +    if (result == -EINVAL)
>> +        dev_err(drvdata->dev, "check array location - Fail\n");
>> +
>> +    return result;
>
> Could we not fold this check in to calculate_array_location as shown
> above ?
>
confirmed.
>
>
> ...
>
>
>> index d769379b8421..7d88ad8e730f 100644
>> --- a/drivers/hwtracing/qcom/tgu.h
>> +++ b/drivers/hwtracing/qcom/tgu.h
>> @@ -16,7 +16,8 @@
>>       ((int)FIELD_GET(GENMASK(17, 10), devid_val))
>>   #define TGU_DEVID_STEPS(devid_val) \
>>       ((int)FIELD_GET(GENMASK(6, 3), devid_val))
>> -
>> +#define TGU_DEVID_CONDITIONS(devid_val) \
>> +    ((int)FIELD_GET(GENMASK(2, 0), devid_val))
>>   #define TGU_BITS_PER_SIGNAL    4
>>   #define LENGTH_REGISTER        32
>>   @@ -44,6 +45,7 @@
>>    */
>>   #define STEP_SIZE        0x1D8
>>   #define PRIORITY0_OFFSET    0x0074
>> +#define CONDITION_DECODE_OFFSET    0x0050
>
> nit: s/CONDITION_DECODE_BASE    0x50

confirmed,

use "#define CONDITION_DECODE_BASE 0x0010" as offset is relative to the 
start of the step's block.

>
>>   #define PRIORITY_STRIDE        0x0060
>>   #define REG_SIZE        0x4
>>   @@ -54,6 +56,7 @@
>>    *
>>    *   TGU_MAX_STEPS         matches the static step0..step7 sysfs 
>> tables.
>>    *   TGU_MAX_PRIORITY_REGS matches the static reg0..reg23 sysfs 
>> tables.
>> + *   TGU_MAX_CONDITION_DECODE decode region 0x50..0x5F holds 4 u32 
>> registers
>>    *
>>    * Each priority level's block spans a full PRIORITY_STRIDE (0x60 
>> bytes),
>>    * i.e. PRIORITY_STRIDE / REG_SIZE = 24 registers, all of them 
>> implemented.
>> @@ -61,15 +64,40 @@
>>     #define TGU_MAX_STEPS                  8
>>   #define TGU_MAX_PRIORITY_REGS          24
>> +#define TGU_MAX_CONDITION_DECODE       4
>>     /* Maximum priority that TGU supports */
>>   #define MAX_PRIORITY                   4
>>   +/*
>> + * Values for struct tgu_attribute.operation_index: TGU_PRIORITY0..
>> + * TGU_PRIORITY3 select a priority level, TGU_CONDITION_DECODE 
>> selects the
>> + * condition decode registers instead.
>> + */
>> +enum operation_index {
>> +    TGU_PRIORITY0,
>> +    TGU_PRIORITY1,
>> +    TGU_PRIORITY2,
>> +    TGU_PRIORITY3,
>> +    TGU_CONDITION_DECODE,
>> +};
>> +
>>   /* Calculate compare step addresses */
>>   #define PRIORITY_REG_STEP(step, priority, reg)\
>>       (PRIORITY0_OFFSET + PRIORITY_STRIDE * priority +\
>>        REG_SIZE * reg + STEP_SIZE * step)
>>   +#define CONDITION_DECODE_STEP(step, decode) \
>> +    (CONDITION_DECODE_OFFSET + REG_SIZE * decode + STEP_SIZE * step)
>
> Please
>
> #define CONDITION_DECODE_OFFSET(step, reg)        \
>     (STEP_OFFSET(step) + CONDITIION_DECODE_BASE + REG_SIZE * reg)
confirmed.
>
>
>> +
>> +/*
>> + * Neutral ('NOT') value for the condition decode registers. This is 
>> the
>> + * driver's default so that, before userspace programs a real 
>> decode, an
>> + * enabled step does not spuriously match. Used both when seeding 
>> the shadow
>> + * table at probe and when clearing it via reset_tgu.
>> + */
>> +#define TGU_CONDITION_DECODE_NOT 0x1000000
>
> minor nit: TGU_CONDITION_DECODE_DEFAULT 0x1000000 ?
I think |NOT| reflects the hardware-defined decode operation rather than 
an arbitrary driver default,
so I’d lean towards keeping the current name. But I’m happy to change it 
to |_DEFAULT| if you prefer.

>
>
>
>> +
>>   /**
>>    * struct tgu_drvdata - Data structure for a TGU (Trigger 
>> Generation Unit)
>>    * @base: Memory-mapped base address of the TGU device
>> @@ -79,8 +107,11 @@
>>    * @enabled: Flag indicating whether the TGU device is enabled
>>    * @priority: Per-step, per-priority-level, per-register values 
>> staged by
>>    *            sysfs writes and flushed to hardware by tgu_enable()
>> + * @condition_decode: Per-step, per-register decode values staged by 
>> sysfs
>> + *                     writes and flushed to hardware by tgu_enable()
>
>
>>    * @num_reg: Number of priority registers implemented per priority 
>> level
>
> This now looks awkwardly generic with other registers coming in. Should
> we name it num_prio_regs from the beginning ?
confirmed.
>
> Suzuki
>
>>    * @num_step: Number of steps implemented
>> + * @num_condition_decode: Maximum number of condition_decode
>>    *
>>    * This structure defines the data associated with a TGU device,
>>    * including its base address, device pointer, the lock serialising
>> @@ -92,8 +123,10 @@ struct tgu_drvdata {
>>       struct mutex lock;
>>       bool enabled;
>>       unsigned int priority[TGU_MAX_STEPS * MAX_PRIORITY * 
>> TGU_MAX_PRIORITY_REGS];
>> +    unsigned int condition_decode[TGU_MAX_STEPS * 
>> TGU_MAX_CONDITION_DECODE];
>>       int num_reg;
>>       int num_step;
>> +    int num_condition_decode;
>>   };
>>     #endif
>
