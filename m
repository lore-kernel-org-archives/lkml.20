Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794896534;
	b=Ls0UW2UFVg1zHfP/IAjm42xIViY9pgN1hVVIZkzj0ad+ATDBt79MXdFpD/ycWCV0ZNXB
	 S5SL2i4YDu37eb9ykykXiKKrOyLttQJaAn8gxdYawcRS5LSYdC6kaHY03Qa9xoOI5/z3v
	 B07gqfRaxnkOJqzKBU712HMrzF+dPJSdsClXetGxfq/G3LTjR4mtUtnGnFx/lh+Y+z6lX
	 9KMnrXNL/+uHBRYxCtYor3YaX4viy9aYp9vi5J08rK++r8IK1kRbCRpNKqKc6DOKINIcw
	 RMKN12yoOVsQI/UcfeBQjzs+cB40/7SJj40921s5ztUze25+g59Ack5eWPTPz49HflQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794896534;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=un94qjLPd69gCihb+f/tlZVshjSmODDedEDHnUli6kg=;
	b=sNOuwOT1zgps3wZ4e+fhocLvO6IIKyLwNF4NG25JB0WlFDP+AuUuM1BSA/iHBv05CMVp
	 7mbTJNzdOyuR7kr6pQzntMWBEti2IOkz//SluvU8UiPSlnXi6C3eTKTzJCzOZdrKgInoL
	 wgYTp+ALnG7rxAQcXuabhPYqOMexvYyEQTM/KnUppNlDmLHEYkAoINO0jRYXkyLfMK6w2
	 VVwVsnpGNH5PPJvyE81Ooif10IPdFBmRbPILWhYq+iXHbRsQA2kI8/+O3O2Uz2di3fn9E
	 zWVelClr0SU9gXEzYbt4IpPhvHUU5SKE5zOljaqS2L0diebWwkrMMo5Jop6s9wEwMEQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KIPuptyg;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BbDBws8y;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5641D606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 06:22:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5641D606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KIPuptyg;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BbDBws8y
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AH2aEV64146663
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 06:22:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	un94qjLPd69gCihb+f/tlZVshjSmODDedEDHnUli6kg=; b=KIPuptygNSc6cyrg
	8MXRzQMzJL4sjlpQq2CUwBP7oAf+zTniUj8QE/ogJFmisceueJb0/Fbt6QyfkXi2
	xRkhJD2r6WRK/SEAi4GlPZz8B6+sqMftDRNt1lqYnNQNttXhTozQ0GxCu2MKxPbN
	bHCqAsEahXpK0Wg4UqOTR0owUAomIUICDEFidiepJarRkx2S+R0yFpVtULsi+Oya
	hBYjYZK2Irx0fSP93Afvju29ESwiy5qUjunls2wqoReiGHM9IKavWGUhN5gLKYyM
	1eFPPPtTd+TKZJiIEeXGBGwhtAc0w86xwPweDnI0ULQW7G9s3OmUFC5yoZgyPU4S
	pRAXeA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j00nfm2bt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 06:22:11 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2efda3affc2so3942055ad.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 22:22:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794896530; x=1795501330; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=un94qjLPd69gCihb+f/tlZVshjSmODDedEDHnUli6kg=;
        b=BbDBws8yZrsMwmzI7nQtsls8t7NJAkXs7pmWAVEdNrgyEitBbkZVuZ/JTgJJRNkLcV
         TFkRJIa9dc6v4MVSrgfB/A9xjWGrIZaVWc3bz1XAi4pFwTBMwwg9ITYqZLMPWv15QNl7
         kecUfQ6tPavPFU5RZWw3OYTYo8mjI3bLYqmWOXUGRGEGoSXx6qabPIc6lIwGPhZLNIYT
         FnpwXHhh3RsSZmHj84RUdI1pWd9qMvNBmvhfPu1ifO2a2Q8x71RX7e2V99LuTpDqpsdL
         nA5pHS/iLbVZj0C40eYuW6YZye3ckkdW5oz12tW3/l8rwZcgmVADhCfY8+MYwegtMa74
         MwHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794896530; x=1795501330;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=un94qjLPd69gCihb+f/tlZVshjSmODDedEDHnUli6kg=;
        b=IYCKxDFF9CWe+CujlhUhkRPjRsNRzdjSAUkTFa4fPnP1FDSPMTtS6njhfeOSWl20At
         +IS+QTSDE/hV9flQDk9Y+9pNv4qDQJOMfIrDYPFY+1W2X+0NDLD4h78xiAU4lWWZuEKA
         vQtQEfVL268Cuo3Pfz1fd3RtrK9md8rqJIuZsE1kzZavtnnIlWNP+n91S+dddqp9/ocv
         5mlHxTekhMnr48t7LK1cvS6O4/kxfoo05PgO/ktKQ8e/gJj2fhUuHW9jQYL0nvybskzb
         AWHkW8PWO6HlrEyU89FchmUa+JFd0NCg/qx8abP2vf8C383P6nLI+cJFAW3AecjHDXIA
         MiyA==
X-Gm-Message-State: APuU4Z9WD1YPfZGnrIGmxcqWQtIahjynSptNV9UC3bBvjQyAmWV92L6O
	dEaTNFfF6yqOqwkNlxSKrYGNaAkOQTzkrzNjlcmFTjbGBw6IFXU6t7CasRm7WQmyjC674qGdFdq
	gn4o1csm4UK4qlpJ0qZhUF/SXy3sbajqcoYl50vI0RmOpFtXxI8i40ASque+4nkz6uUk=
X-Gm-Gg: AZFdTZfyq6LmQjjoFQFPjZqi6Mvkdh6y9pL3OweTolO5JhVqohGuYyRCjVLzuJcRnfD
	M0vjhB1BEGh/qHMhhEvZl+FBqU8hiZt8SrYRKh1GnQMONp86pCzuNMM9PRhgKKVJDhEcS/wr+0p
	Eld7WPFHjLgpN9JYCI+IqbtwzykVWEiBLFOxfaxViEOY9RGyiErYlrQftcAmJCCFGrSzG0m2tCi
	b1NPIIl6DqeMU7euzA0C7vVi9mg4rhruI0y63v/BTIon7eVq9+SZDPal6b5GHe65IdAHy6Y/XWC
	EaNFGLBw/oKKFvVaX5CcCc+8fsPDIWH8N9KfA42HjvfpMcC+DZTr5Nsiog2aO35dHNXlLXjnOce
	uh3HkxzdpJoCB/NjqiO/w12FhlwxtDad6T0x6/BlMDc4Qr9RYYkaEwNKYa475NkAj/I8delRIXy
	FVyqFs0fftRnQmYHBkYWz6Reqt+TIM2Z0MJ3DfDSayMpk=
X-Received: by 2002:a17:903:26c3:b0:2e9:4e83:1969 with SMTP id d9443c01a7336-2ee0dcd1143mr112813385ad.34.1794896529957;
        Mon, 16 Nov 2026 22:22:09 -0800 (PST)
X-Received: by 2002:a17:903:26c3:b0:2e9:4e83:1969 with SMTP id d9443c01a7336-2ee0dcd1143mr112813055ad.34.1794896529374;
        Mon, 16 Nov 2026 22:22:09 -0800 (PST)
Received: from [10.133.33.59] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2efd76db8acsm9019055ad.11.2026.11.16.22.22.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Nov 2026 22:22:08 -0800 (PST)
Message-ID: <b66bd620-e0a2-4869-9cfc-94364f772f64@oss.qualcomm.com>
Date: Tue, 17 Nov 2026 11:16:39 +0800
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
Subject: Re: [PATCH v18 4/8] qcom-tgu: Add signal priority support
To: Suzuki K Poulose <suzuki.poulose@arm.com>, andersson@kernel.org,
        alexander.shishkin@linux.intel.com, mike.leach@linaro.org,
        konrad.dybcio@oss.qualcomm.com, james.clark@arm.com,
        krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, coresight@lists.linaro.org,
        devicetree@vger.kernel.org, gregkh@linuxfoundation.org,
        songchai@qti.qualcomm.com, Jie Gan <jie.gan@oss.qualcomm.com>
References: <20261116074118.822731-1-songwei.chai@oss.qualcomm.com>
 <20261116074118.822731-5-songwei.chai@oss.qualcomm.com>
 <c23c116b-063a-4658-a6da-b79146226d4a@arm.com>
Content-Language: en-US
From: "Songwei.Chai" <songwei.chai@oss.qualcomm.com>
In-Reply-To: <c23c116b-063a-4658-a6da-b79146226d4a@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=BrEIUoX5 c=1 sm=1 tr=0 ts=6afbf293 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=hjJ2taPkbwp8OrdV2tUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDAyNSBTYWx0ZWRfX8xC8jP46Idr0
 kPgjBcmLHXaSOxqITgQ8xR4gJmKtXIpX1TVrHrmEOjdt63gbEJ48oKs5cIH9NNqa00ELh9UDypX
 uHwXY8tRbstiSupmrREEbUNBR+6qooI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDAyNSBTYWx0ZWRfXx8w38Q9+xHlc
 zQTY055UG2VwUPau60+85ONPvefoDXDTmCYW2E5QWwwwhWZWhOB6MQ9NeBIoNvtpGNz585Mo/W0
 N23Xbop9MoKHIIHLdxBY4D3LDg42j15T0FlQook9Wajkr35sJiIaR2FfUmCrk3shQsSoQwGjA+U
 3+zO0FhSjwV5lGUxCdIO08GSAY+ojG5WLiP5Vj4k5ORHOMCZbeWr1VMqba9hsaQko/kzQ0G1EHX
 3PVWAuTq63HYSH7IRevEvLP2biWbvIL6MzMbv+hWjnHrCFHOZLZ+7C+XWgRfrXLYkY5++o1Mkph
 xQiMtlxX8E1XcFdm3eB4IRmip3bMgw1W/bQt23itpqDsXIin4VqgITp1Ia9yaIPb7Z5oQtGz+0U
 KVE3apeSnpi/KG/lAEIxM0J23KkibQK/nryPW2k17GU4OqPfuyqiI+skZzPLj/fnIumIfHx4W1s
 tliExZak6cRRsGGD9wg==
X-Proofpoint-ORIG-GUID: m3CqMn6ZRm-SMqMAhGZp0lz4mqKtmPLw
X-Proofpoint-GUID: m3CqMn6ZRm-SMqMAhGZp0lz4mqKtmPLw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 spamscore=0 phishscore=0 priorityscore=1501
 suspectscore=0 adultscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611170025


On 11/16/2026 7:16 PM, Suzuki K Poulose wrote:
> On 16/11/2026 07:41, Songwei Chai wrote:
>> Like circuit of a Logic analyzer, in TGU, the requirement could be
>> configured in each step and the trigger will be created once the
>> requirements are met. Add priority functionality here to sort the
>> signals into different priorities. The signal which is wanted could
>> be configured in each step's priority node, the larger number means
>> the higher priority and the signal with higher priority will be sensed
>> more preferentially.
>>
>> Reviewed-by: Jie Gan <jie.gan@oss.qualcomm.com>
>> Signed-off-by: Songwei Chai <songwei.chai@oss.qualcomm.com>
>> ---
>>   .../ABI/testing/sysfs-bus-amba-devices-tgu    |   7 +
>>   drivers/hwtracing/qcom/tgu.c                  | 211 ++++++++++++++++++
>>   drivers/hwtracing/qcom/tgu.h                  |  68 ++++++
>>   3 files changed, 286 insertions(+)
>>
>> diff --git a/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu 
>> b/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
>> index 798a0e51e27a..3be0b912c937 100644
>> --- a/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
>> +++ b/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
>> @@ -7,3 +7,10 @@ Description:
>>           Accepts only one of the 2 values -  0 or 1.
>>           0 : disable TGU.
>>           1 : enable TGU.
>> +
>> +What: 
>> /sys/bus/amba/devices/<tgu-name>/step[0:7]_priority[0:3]/reg[0:23]
>> +Date:        November 2026
>> +KernelVersion:    7.5
>> +Contact:    Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Songwei Chai 
>> <songwei.chai@oss.qualcomm.com>
>> +Description:
>> +        (RW) Set/Get the sensed signal with specific step and 
>> priority for TGU.
>> diff --git a/drivers/hwtracing/qcom/tgu.c b/drivers/hwtracing/qcom/tgu.c
>> index 5bae46db4f8c..917d506cddf9 100644
>> --- a/drivers/hwtracing/qcom/tgu.c
>> +++ b/drivers/hwtracing/qcom/tgu.c
>> @@ -16,14 +16,145 @@
>>     #include "tgu.h"
>>   +struct tgu_attribute {
>> +    struct device_attribute attr;
>> +    u8 step_index;
>> +    u8 priority;
>> +    u8 reg_num;
>> +};
>> +
>> +/*
>> + * drvdata->priority is a flat [priority][step][reg] array.
>> + */
>> +static int calculate_array_location(struct tgu_drvdata *drvdata,
>> +                    int step_index, int priority,
>> +                    int reg_index)
>> +{
>> +    return priority * (drvdata->num_step) * (drvdata->num_reg) +
>> +        step_index * (drvdata->num_reg) + reg_index;
>> +}
>> +
>> +static ssize_t tgu_dataset_show(struct device *dev,
>> +                struct device_attribute *attr, char *buf)
>> +{
>> +    struct tgu_drvdata *drvdata = dev_get_drvdata(dev);
>> +    struct tgu_attribute *tgu_attr =
>> +            container_of(attr, struct tgu_attribute, attr);
>> +    int index;
>> +
>> +    index = calculate_array_location(drvdata, tgu_attr->step_index,
>> +                     tgu_attr->priority,
>> +                     tgu_attr->reg_num);
>> +
>> +    /*
>> +     * Serialise against tgu_dataset_store() and tgu_enable(), which 
>> read
>> +     * and write the same priority array, so the value is not observed
>> +     * while being updated concurrently.
>> +     */
>> +    guard(mutex)(&drvdata->lock);
>> +
>> +    return sysfs_emit(buf, "0x%x\n", drvdata->priority[index]);
>> +}
>> +
>> +static ssize_t tgu_dataset_store(struct device *dev,
>> +                 struct device_attribute *attr,
>> +                 const char *buf, size_t size)
>> +{
>> +    struct tgu_drvdata *tgu_drvdata = dev_get_drvdata(dev);
>> +    struct tgu_attribute *tgu_attr =
>> +        container_of(attr, struct tgu_attribute, attr);
>> +    unsigned long val;
>> +    int index;
>> +    int ret;
>> +
>> +    ret = kstrtoul(buf, 0, &val);
>> +    if (ret)
>> +        return ret;
>> +
>> +    guard(mutex)(&tgu_drvdata->lock);
>> +    index = calculate_array_location(tgu_drvdata, tgu_attr->step_index,
>> +                     tgu_attr->priority,
>> +                     tgu_attr->reg_num);
>> +
>> +    tgu_drvdata->priority[index] = val;
>> +
>> +    return size;
>> +}
>> +
>> +static umode_t tgu_node_visible(struct kobject *kobject,
>> +                struct attribute *attr,
>> +                int n)
>> +{
>> +    struct device *dev = kobj_to_dev(kobject);
>> +    struct tgu_drvdata *drvdata = dev_get_drvdata(dev);
>> +    struct device_attribute *dev_attr =
>> +        container_of(attr, struct device_attribute, attr);
>> +    struct tgu_attribute *tgu_attr =
>> +        container_of(dev_attr, struct tgu_attribute, attr);
>> +
>> +    if (tgu_attr->step_index >= drvdata->num_step)
>> +        return SYSFS_GROUP_INVISIBLE;
>> +
>> +    if (tgu_attr->reg_num >= drvdata->num_reg)
>> +        return 0;
>> +
>> +    return attr->mode;
>> +}
>> +
>>   static void tgu_write_all_hw_regs(struct tgu_drvdata *drvdata)
>>   {
>> +    int i, j, k, index;
>> +
>>       CS_UNLOCK(drvdata->base);
>> +    for (i = 0; i < drvdata->num_step; i++) {
>> +        for (j = 0; j < MAX_PRIORITY; j++) {
>> +            for (k = 0; k < drvdata->num_reg; k++) {
>> +                index = calculate_array_location(
>> +                            drvdata, i, j, k);
>> +
>> +                writel(drvdata->priority[index],
>> +                    drvdata->base +
>> +                    PRIORITY_REG_STEP(i, j, k));
>> +            }
>> +        }
>> +    }
>>       /* Enable TGU to program the triggers */
>>       writel(1, drvdata->base + TGU_CONTROL);
>>       CS_LOCK(drvdata->base);
>>   }
>>   +static void tgu_set_dev_caps(struct tgu_drvdata *drvdata)
>> +{
>> +    int num_sense_input, num_reg, num_step;
>> +    u32 devid;
>> +
>> +    devid = readl(drvdata->base + CORESIGHT_DEVID);
>> +
>> +    num_sense_input = TGU_DEVID_SENSE_INPUT(devid);
>> +    num_reg = (num_sense_input * TGU_BITS_PER_SIGNAL) / 
>> LENGTH_REGISTER;
>> +
>> +    if ((num_sense_input * TGU_BITS_PER_SIGNAL) % LENGTH_REGISTER)
>> +        num_reg++;
>> +
>> +    if (num_reg > TGU_MAX_PRIORITY_REGS) {
>> +        dev_warn(drvdata->dev,
>> +            "DEVID reports %d priority regs, clamping to %d\n",
>> +            num_reg, TGU_MAX_PRIORITY_REGS);
>> +        num_reg = TGU_MAX_PRIORITY_REGS;
>> +    }
>> +    drvdata->num_reg = num_reg;
>> +
>> +    num_step = TGU_DEVID_STEPS(devid);
>> +
>> +    if (num_step > TGU_MAX_STEPS) {
>> +        dev_warn(drvdata->dev,
>> +            "DEVID reports %d steps, clamping to %d\n",
>> +            num_step, TGU_MAX_STEPS);
>> +        num_step = TGU_MAX_STEPS;
>> +    }
>> +    drvdata->num_step = num_step;
>> +}
>> +
>>   static void tgu_enable(struct tgu_drvdata *drvdata)
>>   {
>>       tgu_write_all_hw_regs(drvdata);
>> @@ -103,8 +234,86 @@ static const struct attribute_group 
>> tgu_common_grp = {
>>       .attrs = tgu_common_attrs,
>>   };
>>   +#define tgu_dataset_rw(name, step_index, priority, 
>> reg_num)              \
>> +    (&((struct tgu_attribute[]){ {                                   \
>> +        __ATTR(name, 0644, tgu_dataset_show, tgu_dataset_store), \
>> + step_index,                                              \
>> + priority,                                                \
>> + reg_num,                                                 \
>> +    } })[0].attr.attr)
>> +
>> +#define STEP_PRIORITY(step_index, reg_num, priority)              \
>> +    tgu_dataset_rw(reg##reg_num, step_index, priority, reg_num)
>> +
>> +#define STEP_PRIORITY_LIST(step_index, priority) \
>> +    {STEP_PRIORITY(step_index, 0, priority), \
>> +     STEP_PRIORITY(step_index, 1, priority),  \
>> +     STEP_PRIORITY(step_index, 2, priority),     \
>> +     STEP_PRIORITY(step_index, 3, priority),  \
>> +     STEP_PRIORITY(step_index, 4, priority),  \
>> +     STEP_PRIORITY(step_index, 5, priority),  \
>> +     STEP_PRIORITY(step_index, 6, priority),  \
>> +     STEP_PRIORITY(step_index, 7, priority),  \
>> +     STEP_PRIORITY(step_index, 8, priority),  \
>> +     STEP_PRIORITY(step_index, 9, priority),  \
>> +     STEP_PRIORITY(step_index, 10, priority), \
>> +     STEP_PRIORITY(step_index, 11, priority), \
>> +     STEP_PRIORITY(step_index, 12, priority), \
>> +     STEP_PRIORITY(step_index, 13, priority), \
>> +     STEP_PRIORITY(step_index, 14, priority), \
>> +     STEP_PRIORITY(step_index, 15, priority), \
>> +     STEP_PRIORITY(step_index, 16, priority), \
>> +     STEP_PRIORITY(step_index, 17, priority), \
>> +     STEP_PRIORITY(step_index, 18, priority), \
>> +     STEP_PRIORITY(step_index, 19, priority), \
>> +     STEP_PRIORITY(step_index, 20, priority), \
>> +     STEP_PRIORITY(step_index, 21, priority), \
>> +     STEP_PRIORITY(step_index, 22, priority), \
>> +     STEP_PRIORITY(step_index, 23, priority), \
>> +     NULL                   \
>> +    }
>> +
>> +#define PRIORITY_ATTRIBUTE_GROUP_INIT(step, priority)\
>> +    (&(const struct attribute_group){\
>> +        .attrs = (struct attribute*[])STEP_PRIORITY_LIST(step, 
>> priority),\
>> +        .is_visible = tgu_node_visible,\
>> +        .name = "step" #step "_priority" #priority \
>> +    })
>> +
>>   static const struct attribute_group *tgu_attr_groups[] = {
>>       &tgu_common_grp,
>> +    PRIORITY_ATTRIBUTE_GROUP_INIT(0, 0),
>> +    PRIORITY_ATTRIBUTE_GROUP_INIT(0, 1),
>> +    PRIORITY_ATTRIBUTE_GROUP_INIT(0, 2),
>> +    PRIORITY_ATTRIBUTE_GROUP_INIT(0, 3),
>> +    PRIORITY_ATTRIBUTE_GROUP_INIT(1, 0),
>> +    PRIORITY_ATTRIBUTE_GROUP_INIT(1, 1),
>> +    PRIORITY_ATTRIBUTE_GROUP_INIT(1, 2),
>> +    PRIORITY_ATTRIBUTE_GROUP_INIT(1, 3),
>> +    PRIORITY_ATTRIBUTE_GROUP_INIT(2, 0),
>> +    PRIORITY_ATTRIBUTE_GROUP_INIT(2, 1),
>> +    PRIORITY_ATTRIBUTE_GROUP_INIT(2, 2),
>> +    PRIORITY_ATTRIBUTE_GROUP_INIT(2, 3),
>> +    PRIORITY_ATTRIBUTE_GROUP_INIT(3, 0),
>> +    PRIORITY_ATTRIBUTE_GROUP_INIT(3, 1),
>> +    PRIORITY_ATTRIBUTE_GROUP_INIT(3, 2),
>> +    PRIORITY_ATTRIBUTE_GROUP_INIT(3, 3),
>> +    PRIORITY_ATTRIBUTE_GROUP_INIT(4, 0),
>> +    PRIORITY_ATTRIBUTE_GROUP_INIT(4, 1),
>> +    PRIORITY_ATTRIBUTE_GROUP_INIT(4, 2),
>> +    PRIORITY_ATTRIBUTE_GROUP_INIT(4, 3),
>> +    PRIORITY_ATTRIBUTE_GROUP_INIT(5, 0),
>> +    PRIORITY_ATTRIBUTE_GROUP_INIT(5, 1),
>> +    PRIORITY_ATTRIBUTE_GROUP_INIT(5, 2),
>> +    PRIORITY_ATTRIBUTE_GROUP_INIT(5, 3),
>> +    PRIORITY_ATTRIBUTE_GROUP_INIT(6, 0),
>> +    PRIORITY_ATTRIBUTE_GROUP_INIT(6, 1),
>> +    PRIORITY_ATTRIBUTE_GROUP_INIT(6, 2),
>> +    PRIORITY_ATTRIBUTE_GROUP_INIT(6, 3),
>> +    PRIORITY_ATTRIBUTE_GROUP_INIT(7, 0),
>> +    PRIORITY_ATTRIBUTE_GROUP_INIT(7, 1),
>> +    PRIORITY_ATTRIBUTE_GROUP_INIT(7, 2),
>> +    PRIORITY_ATTRIBUTE_GROUP_INIT(7, 3),
>>       NULL,
>>   };
>>   @@ -129,6 +338,8 @@ static int tgu_probe(struct amba_device *adev, 
>> const struct amba_id *id)
>>       if (ret)
>>           return ret;
>>   +    tgu_set_dev_caps(drvdata);
>> +
>>       drvdata->enabled = false;
>>         ret = sysfs_create_groups(&dev->kobj, tgu_attr_groups);
>> diff --git a/drivers/hwtracing/qcom/tgu.h b/drivers/hwtracing/qcom/tgu.h
>> index c6426b4e3617..d769379b8421 100644
>> --- a/drivers/hwtracing/qcom/tgu.h
>> +++ b/drivers/hwtracing/qcom/tgu.h
>> @@ -6,9 +6,70 @@
>>   #ifndef _QCOM_TGU_H
>>   #define _QCOM_TGU_H
>>   +#include <linux/bitfield.h>
>> +#include <linux/bits.h>
>> +
>>   /* Register addresses */
>>   #define TGU_CONTROL        0x0000
>>   +#define TGU_DEVID_SENSE_INPUT(devid_val) \
>> +    ((int)FIELD_GET(GENMASK(17, 10), devid_val))
>> +#define TGU_DEVID_STEPS(devid_val) \
>> +    ((int)FIELD_GET(GENMASK(6, 3), devid_val))
>> +
>> +#define TGU_BITS_PER_SIGNAL    4
>> +#define LENGTH_REGISTER        32
>> +
>> +/*
>> + * TGU configuration space Per-step register layout.
>> + * (one step occupies STEP_SIZE bytes) Offsets below are relative to
>> + *                                                         the start 
>> of that step's block.
>> + * x-------------------------x x-----------------x
>> + * |   coresight management  | |     reserved    |
>> + * |        registers        | |-----------------| +0x1F4
>> + * |                         |                       ---> |   
>> priority[3]   |
>> + * |-------------------------|                       | 
>> |-----------------| +0x194
>> + * |         step[7]         |                       |     | 
>> priority[2]   |
>> + * |-------------------------| step[0] + 7*STEP_SIZE | 
>> |-----------------| +0x134
>> + * |           ...           |                       |     | 
>> priority[1]   |
>> + * |-------------------------| step[0] + 1*STEP_SIZE | 
>> |-----------------| +0xD4
>> + * |         step[0]         |-----------------------|     | 
>> priority[0]   |
>> + * |-------------------------| step[0] (base+0x40) 
>> |-----------------| +0x74
>> + * |    Control and status   |                             | 
>> condition select|
>> + * |          space          | |-----------------| +0x60
>> + * x-------------------------x base                        | 
>> condition decode|
>> + * |-----------------| +0x50
>> + *                                                         | 
>> Timer/Counter  |
>> + * x-----------------x +0x40
>> + */
>> +#define STEP_SIZE        0x1D8
>
> Something is really weird. STEP_SIZE is 0x1D8, but the diagram above
> shows the "reserved" is at 0x1F4 ? is it because you have added 0x40
> (of the Control and Status space) to the offsets for the step0 ?
>
> Please could we simply define the fields for a step with offset 0 as
> the base for each step ?
>
> i.e., Timer/Counter -> 0x0
>       Priority[0]-> 0x34
>
>
confirmed.
> Also, please could you keep the naming consistent.
> STEP_SIZE vs PRIORITY_STRIDE ? I prefer SIZE
>
>
> #define STEP0_BASE        0x40
> #define STEP_SIZE        0x1D8
>
> #define PRIORITY0_BASE        0x34
> #define PRIORITY_SIZE        0x60
>
>
> and
>
> #define STEP_OFFSET(s)        (STEP0_BASE + STEP_SIZE * (s))
> #define PRIORITY_OFFSET(p)    (PRIORITY0_BASE + PRIORITY_SIZE *(p))
>
> with that we could replace
>
> > +/* Calculate compare step addresses */
> > +#define PRIORITY_REG_STEP(step, priority, reg)\
> > +    (PRIORITY0_OFFSET + PRIORITY_STRIDE * priority +\
> > +     REG_SIZE * reg + STEP_SIZE * step)
>
> with :
>
> #define PRIORITY_REG_OFFSET(step, prio, reg)        \
>     (STEP_OFFSET(step) + PRIORITY_OFFSET(prio) + (reg) * REG_SIZE)
>
confirmed.
>
>
>
>> +#define PRIORITY0_OFFSET    0x0074
>> +#define PRIORITY_STRIDE        0x0060
>> +#define REG_SIZE        0x4
>> +
>> +/*
>> + * Upper bounds on the DEVID-derived per-region counts, used to clamp
>> + * whatever the hardware reports so writes never fall outside the
>> + * ioremap()'d window or spill into an adjacent region.
>> + *
>> + *   TGU_MAX_STEPS         matches the static step0..step7 sysfs 
>> tables.
>> + *   TGU_MAX_PRIORITY_REGS matches the static reg0..reg23 sysfs tables.
>> + *
>> + * Each priority level's block spans a full PRIORITY_STRIDE (0x60 
>> bytes),
>> + * i.e. PRIORITY_STRIDE / REG_SIZE = 24 registers, all of them 
>> implemented.
>> + */
>> +
>> +#define TGU_MAX_STEPS                  8
>> +#define TGU_MAX_PRIORITY_REGS          24
>> +
>> +/* Maximum priority that TGU supports */
>> +#define MAX_PRIORITY                   4
>
> nit: TGU_MAX_PRIORITY for consistency
confirmed.
>> +
>
>> +
>>   /**
>>    * struct tgu_drvdata - Data structure for a TGU (Trigger 
>> Generation Unit)
>>    * @base: Memory-mapped base address of the TGU device
>> @@ -16,6 +77,10 @@
>>    * @lock: Mutex serialising enable/disable and the associated PM 
>> runtime
>>    *        reference counting against concurrent sysfs access
>>    * @enabled: Flag indicating whether the TGU device is enabled
>> + * @priority: Per-step, per-priority-level, per-register values 
>> staged by
>> + *            sysfs writes and flushed to hardware by tgu_enable()
>> + * @num_reg: Number of priority registers implemented per priority 
>> level
>> + * @num_step: Number of steps implemented
>>    *
>>    * This structure defines the data associated with a TGU device,
>>    * including its base address, device pointer, the lock serialising
>> @@ -26,6 +91,9 @@ struct tgu_drvdata {
>>       struct device *dev;
>>       struct mutex lock;
>>       bool enabled;
>> +    unsigned int priority[TGU_MAX_STEPS * MAX_PRIORITY * 
>> TGU_MAX_PRIORITY_REGS];
>
> Please add a symbol for this
>
> #define TGU_MAX_PRIORITY_REG_SIZE
>     (TGU_MAX_STEPS * TGU_MAX_PRIORITY * TGU_MAX_PRIORITY_REGS)
confirmed.
>
> Suzuki
