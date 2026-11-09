Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794214193;
	b=CulsGOkx2U80oXNVForBnGrz3nSQXz5BS+WuKYUaVpV+KENkBbvXJshTjshTwXUakdGv
	 3oY3K4Tbe82mh+36PTBhy1qM4FfWpG8jD3fjlooZ83KoXOJGdbNPG7lbJI4/3susvEVUw
	 AZ+j2AwDm3s4N3ofI/xDUrEVvFCI0IyhRIjrOzl5UhhgmPofHcvBRoU9yfBoNLdkAJUBy
	 98N+tO1Fx44EejzsyszsctvddvmLi+8QF4ddvLEkrhWcAYudQzXGQuSzTwFZDL9K+xcW/
	 Dgm5fCEeTDYO3AtiIYsIWx1GEAWDbus7RIG7n7VtCFSqIq6SWUh5sWDa4Au0ipIC/fQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794214193;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=qzfe7s6DAyzNIsq811zwWBT24yMnoqTMkgQnb4HzgjI=;
	b=z2YBdTay8xm8+Geo/8VXToadxfMIoya+VSFf/vBtQkmFl27dpMHP1KAbcwvjbbjSiW8r
	 QvRujeutFZ2EWxu7pmZOTsPLxhIdNTX8B2Gj42hwOuGpi0DsbPlIKVy5TYiEHglR4YO8a
	 v0CitJS/oSoFtdkMzpunMjJbtr4a6vXBYB9aQyl0v1zXC3kAiB1uCmdN9X8OTsllBKfJR
	 JsJFoICe5mD+Zr3QKwqiW7e4kvRjM5ZS8Jg/S4dlhUaGKtAEovwrbS8RhOFaOc+nCEwBY
	 IyY4FWeIhffm5PaJ0gXnZvY4sJzRr8/Naroj1+Rn5x1QJTOj7IXXgJdDPWCYi1J8D3g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bMaCzYPp;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="c7I4B/TY";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68195606D817
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 08:49:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 68195606D817
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bMaCzYPp;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=c7I4B/TY
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A96ADkO3298644
	for <linux-kernel@vger.kernel.org>; Mon, 9 Nov 2026 08:49:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qzfe7s6DAyzNIsq811zwWBT24yMnoqTMkgQnb4HzgjI=; b=bMaCzYPpMpNVXf1S
	7+WyzE4sPjnuBFWGjXgoLoNYUX4/ZCOM0/bGHhEMV5LtnMVBVdQx6HrKhVHvmlzw
	Z2wByc0x6DbwTXzLv6rQ9ccMro+maUDqM84e8ejrVeB5DhyalPcKz0Bt2nLLEYl8
	SRXYKtt3ke9X8j05cXPZTpxL3zc0zMwPwiYR0BLZs+g1otL3OljoqSjSUECw09h0
	yMbWhvROjy8KsEhp/qm+o+GO3Cw4yvJybHKymHM4B3rdyR95L4PMyh8PM+ySxmBi
	1djmIdQrsn8lm9tFstmJe31V6XXpaYtg+bFIv8h5OBfuLt95wXTAMuSrg6j2pEnB
	RbG8mA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hsuagwkg8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 08:49:51 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3b10afdf947so658983a91.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 00:49:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794214190; x=1794818990; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qzfe7s6DAyzNIsq811zwWBT24yMnoqTMkgQnb4HzgjI=;
        b=c7I4B/TYOkSuxr/7iM/wITk3Vbsw/e2CBgy9OhfaR/fsC/HXIPKugqksEgTruAWsPp
         bQcBpo4E4Y6jJNPw9z2NE/szn42TUJefxw//8RO3ZdAFcL3UHuXXv18Auk+iFvD/XZtO
         y4FCCtYuQmI/P13gZjsvGyvCkQH/tAq7/RD9MdhBvNb7sfxDGZ5/culsIBbnJo4JV62+
         PLc9hB6oT8aQoZH67z2SWUrr+rPu9qI5J7Is0z5wMPVmNd/0TPIP6iSqTujPy/lXNjua
         3OcjI0bpWWQX0H0vUG1F13ZaRBLbnpnpL+Im5j+fyCXSaDnDTUlDsZsUD0LcS5w+6+gV
         LNug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794214190; x=1794818990;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qzfe7s6DAyzNIsq811zwWBT24yMnoqTMkgQnb4HzgjI=;
        b=C7PjNpCJNyu2dvMTm4faf/HQeO2ULYH2auvSMpxIQaDz+b7sWM4frzQpQ47wfcHzFy
         wE2/uzLUmt88/1BjwecqxdE3XYebT4VP8RMLxUMMdamWWO3Bj7g/NJV34KkodTH0PinZ
         d6Kq+EqtuYbsCbV5blc8FpuhRZdWEV0P8KJA5i1huE7KUmOwG9RrqMDD9UWKtbUroQ8A
         YXUh2oEWpVvr1DRsO+b51fBfrLvYOEJfr8L3g2AzNjgT3XDObkl8BFmzYhgCveOegrzs
         60WB8WvfH99U2wLBD2xzDYhQQA3q0rc4hVb4xaSxWESO+H1hPfW7phU43jHZuU+7mM1P
         faCg==
X-Gm-Message-State: APuU4Z9miSUUyjcwPMesGQVVa4jF27LrZPnGDnrtODsP9dirkcvrlkg+
	FCEQhMYks6XEhHUb1JWheZsiOXN1blao+wWLI6uBMDNCOMUB9lr/HEUPS3n0c+X/FQpd0pzMBwg
	BQ7v2Bwhf7S9SUSjbiKGu9Hdw2YSAXhW7qC+yTA56fQ5I4ejUyPvyjd/nEL5eRW9uYKI=
X-Gm-Gg: AYBFou3hQNUhG5ROPtGbGY5j4R549138lQXGL8hBKfMtKzMlCFk0vordJnmxT+TgOsB
	ax3qaOgNOzRRqt1KHNrHMo0KjU1DHEPoBPxVQePz+1c/L9oYbDBdqt78e+aFWAw7zMloct8QNdP
	Q70xVaHDKRqLNYUXwhkIpQHldtYrchKToJoQ4kFfE27BV1rHrZwsXghTn6kS1VyPdjbLpDMZV1d
	vL4iXo0oBoOk41nbt74haMd85u8mUAxGqjnkmYg+jdZRy/eVFujQOI9nixCGYjop/sNyR63zODi
	MxBpqEyXzrmwx9MyMJ7gldbJ59hoFr/WOgTybPHqxTQRnE5zlPmiLVH5lHrG+dbAMkeWXPDFS8L
	Ur96XiZFa3ab/pPo5timqR0Ucz+28lVgitWbHS9x2EUT/PLjvdgn+KQIGQnNN5by/OJx6QmjNw5
	zOUvJ4W0XusvlDRWZgNGOrUAfLtpBxqOmUez8IcZtn4wvS
X-Received: by 2002:a17:90b:1c0d:b0:3ab:330d:6e47 with SMTP id 98e67ed59e1d1-3b12d3fd6d4mr2346575a91.10.1794214189869;
        Mon, 09 Nov 2026 00:49:49 -0800 (PST)
X-Received: by 2002:a17:90b:1c0d:b0:3ab:330d:6e47 with SMTP id 98e67ed59e1d1-3b12d3fd6d4mr2346559a91.10.1794214189215;
        Mon, 09 Nov 2026 00:49:49 -0800 (PST)
Received: from [10.133.33.170] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1057b1fa8sm10211580a91.2.2026.11.09.00.49.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 00:49:48 -0800 (PST)
Message-ID: <26ae8391-2a4e-464b-9ef9-fcd2845f18eb@oss.qualcomm.com>
Date: Mon, 9 Nov 2026 16:49:37 +0800
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
Subject: Re: [PATCH v16 3/7] qcom-tgu: Add signal priority support
To: Suzuki K Poulose <suzuki.poulose@arm.com>, andersson@kernel.org,
        alexander.shishkin@linux.intel.com, mike.leach@linaro.org,
        konrad.dybcio@oss.qualcomm.com, james.clark@arm.com,
        krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, coresight@lists.linaro.org,
        devicetree@vger.kernel.org, gregkh@linuxfoundation.org,
        Jie Gan <jie.gan@oss.qualcomm.com>
References: <20260730080704.2903540-1-songwei.chai@oss.qualcomm.com>
 <20260730080704.2903540-4-songwei.chai@oss.qualcomm.com>
 <9d450f18-2300-4ead-981b-94bd9eea9126@arm.com>
Content-Language: en-US
From: "Songwei.Chai" <songwei.chai@oss.qualcomm.com>
In-Reply-To: <9d450f18-2300-4ead-981b-94bd9eea9126@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDAzNCBTYWx0ZWRfX5T4HL1gNhkbS
 4zus1WpVHolJnyahNi1pxTxW06Lwg5AFvAPs0X8+oX4uckBqdrOYDqQq7Fyh/KAZu1IcjvIjbaC
 WbgHkjC2lDTpjqx3FiIRBJyTMXVjGklChZM9z71XsDkt01NHN1kLAN57o0ESBYx/KODVoiuxSbf
 Z3ZVoMcFQRpdqX0/fq7JYmJI2z1eL0qY1H7O4ODoet/yhVGlsDAsXJIhR3NsAFpR4zNzxUd9r9B
 vc782BxQf+h4EfY0r2u3TZwNNn6khndBsbK/pnddnZzZWI5zMnU4XryhMByrePvYKO1KbNjNnKf
 fJRaIFWGgL3S1dCB3V3UopPI6Dns8fbFLDD134s/I9guhHKinRZAwgQ1UHmiQbKaOCdch5E55/c
 1vp/4oF3rvpCM4HXKAQ0ODB851F+3cCPjGyA8lQg9ZqHu8ajRFT5krsbrEbhYpxULN1gI8a5VaO
 fyqWJWYGuqtYiWq0QwQ==
X-Proofpoint-ORIG-GUID: 2RUsVOHnrvHuOkJpuLsbnu0b9Z_GAJyX
X-Proofpoint-GUID: 2RUsVOHnrvHuOkJpuLsbnu0b9Z_GAJyX
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDAzNCBTYWx0ZWRfXyofrSfavPNpu
 sXLceKnBLPsxWrsga36PItliRqXA6u4nsvX6XrEBdIYvrSTF+CrmumBq+oVS4cYNPvMQvcMxjYS
 fVd/mNOwVVYoeZLCtQXkcZ0IHXdWBwk=
X-Authority-Analysis: v=2.4 cv=V8LoQuni c=1 sm=1 tr=0 ts=6af1892f cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=ghw8QdvxafpMmiwnoqsA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_03,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 malwarescore=0 bulkscore=0 impostorscore=0
 phishscore=0 adultscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611090034


On 11/5/2026 9:01 PM, Suzuki K Poulose wrote:
> On 30/07/2026 09:07, Songwei Chai wrote:
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
>>   drivers/hwtracing/qcom/tgu.c                  | 189 +++++++++++++++++-
>>   drivers/hwtracing/qcom/tgu.h                  | 133 ++++++++++++
>>   3 files changed, 328 insertions(+), 1 deletion(-)
>>
>> diff --git a/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu 
>> b/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
>> index 36ab64f1e301..7dd24314592d 100644
>> --- a/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
>> +++ b/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
>> @@ -7,3 +7,10 @@ Description:
>>           Accepts only one of the 2 values -  0 or 1.
>>           0 : disable TGU.
>>           1 : enable TGU.
>> +
>> +What: 
>> /sys/bus/amba/devices/<tgu-name>/step[0:7]_priority[0:3]/reg[0:17]
>> +Date:        August 2026
>> +KernelVersion:    7.2
>> +Contact:    Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Songwei Chai 
>> <songwei.chai@oss.qualcomm.com>
>> +Description:
>> +        (RW) Set/Get the sensed signal with specific step and 
>> priority for TGU.
>> diff --git a/drivers/hwtracing/qcom/tgu.c b/drivers/hwtracing/qcom/tgu.c
>> index 9c7dd4a09f02..0e88b437f191 100644
>> --- a/drivers/hwtracing/qcom/tgu.c
>> +++ b/drivers/hwtracing/qcom/tgu.c
>> @@ -15,14 +15,144 @@
>>     #include "tgu.h"
>>   +static int calculate_array_location(struct tgu_drvdata *drvdata,
>> +                    int step_index, int operation_index,
>> +                    int reg_index)
>> +{
>> +    return operation_index * (drvdata->num_step) * (drvdata->num_reg) +
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
>> +                     tgu_attr->operation_index,
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
>> +    return sysfs_emit(buf, "0x%x\n",
>> +              drvdata->value_table->priority[index]);
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
>> +                     tgu_attr->operation_index,
>> +                     tgu_attr->reg_num);
>> +
>> +    tgu_drvdata->value_table->priority[index] = val;
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
>>       TGU_UNLOCK(drvdata->base);
>> +    for (i = 0; i < drvdata->num_step; i++) {
>> +        for (j = 0; j < MAX_PRIORITY; j++) {
>> +            for (k = 0; k < drvdata->num_reg; k++) {
>> +                index = calculate_array_location(
>> +                            drvdata, i, j, k);
>> +
>> + writel(drvdata->value_table->priority[index],
>> +                    drvdata->base +
>> +                    PRIORITY_REG_STEP(i, j, k));
>> +            }
>> +        }
>> +    }
>>       /* Enable TGU to program the triggers */
>>       writel(1, drvdata->base + TGU_CONTROL);
>>       TGU_LOCK(drvdata->base);
>>   }
>>   +static void tgu_set_reg_number(struct tgu_drvdata *drvdata)
>> +{
>> +    int num_sense_input;
>> +    int num_reg;
>> +    u32 devid;
>> +
>> +    devid = readl(drvdata->base + TGU_DEVID);
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
>> +
>> +    drvdata->num_reg = num_reg;
>> +}
>> +
>> +static void tgu_set_steps(struct tgu_drvdata *drvdata)
>> +{
>> +    u32 devid;
>> +
>> +    devid = readl(drvdata->base + TGU_DEVID);
>> +
>> +    drvdata->num_step = TGU_DEVID_STEPS(devid);
>> +
>> +    if (drvdata->num_step > TGU_MAX_STEPS) {
>> +        dev_warn(drvdata->dev,
>> +            "DEVID reports %d steps, clamping to %d\n",
>> +            drvdata->num_step, TGU_MAX_STEPS);
>> +        drvdata->num_step = TGU_MAX_STEPS;
>> +    }
>> +}
>
> Why not combine setting the num_step and num_regs in one go ? You are 
> reading the DEVID anyways, and such macro level functional split is
> useless.
confirmed, will update.
>
>
>> +
>>   static void tgu_enable(struct tgu_drvdata *drvdata)
>>   {
>>       tgu_write_all_hw_regs(drvdata);
>> @@ -104,6 +234,38 @@ static const struct attribute_group 
>> tgu_common_grp = {
>>     static const struct attribute_group *tgu_attr_groups[] = {
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
>>   @@ -111,6 +273,8 @@ static int tgu_probe(struct amba_device *adev, 
>> const struct amba_id *id)
>>   {
>>       struct device *dev = &adev->dev;
>>       struct tgu_drvdata *drvdata;
>> +    unsigned int *priority;
>> +    size_t priority_size;
>>       int ret;
>>         drvdata = devm_kzalloc(dev, sizeof(*drvdata), GFP_KERNEL);
>> @@ -128,8 +292,31 @@ static int tgu_probe(struct amba_device *adev, 
>> const struct amba_id *id)
>>       if (ret)
>>           return ret;
>>   -    drvdata->enabled = false;
>
>> +    tgu_set_reg_number(drvdata);
>> +    tgu_set_steps(drvdata);
>
> As mentioned above, combine both ?

confirmed.


>
>> +
>> +    drvdata->value_table =
>> +        devm_kzalloc(dev, sizeof(*drvdata->value_table), GFP_KERNEL);
>
> Could we not embed this in the drvdata without dynamic allocation ?

confirmed. The priority and following array will be embedded directly in 
drvdata.


>> +    if (!drvdata->value_table)
>> +        return -ENOMEM;
>>   +    priority_size = MAX_PRIORITY * drvdata->num_reg * 
>> drvdata->num_step;
>> +
>> +    priority = devm_kcalloc(dev, priority_size,
>> +                sizeof(*drvdata->value_table->priority),
>> +                GFP_KERNEL);
>> +    if (!priority)
>> +        return -ENOMEM;
>> +
>> +    drvdata->value_table->priority = priority;
>> +
>> +    drvdata->enabled = false;
>> +    /*
>> +     * Create the sysfs groups only after the backing storage is fully
>> +     * allocated, otherwise userspace could open a priority 
>> attribute and
>> +     * have tgu_dataset_show() dereference an uninitialised 
>> value_table.
>> +     * This also keeps the error paths above free of sysfs teardown.
>> +     */
>>       ret = sysfs_create_groups(&dev->kobj, tgu_attr_groups);
>>       if (ret) {
>>           dev_err(dev, "failed to create sysfs groups: %d\n", ret);
>> diff --git a/drivers/hwtracing/qcom/tgu.h b/drivers/hwtracing/qcom/tgu.h
>> index ebba49402a20..7a3e1161c4cf 100644
>> --- a/drivers/hwtracing/qcom/tgu.h
>> +++ b/drivers/hwtracing/qcom/tgu.h
>> @@ -6,10 +6,137 @@
>>   #ifndef _QCOM_TGU_H
>>   #define _QCOM_TGU_H
>>   +#include <linux/bitfield.h>
>> +#include <linux/bits.h>
>> +
>>   /* Register addresses */
>>   #define TGU_CONTROL        0x0000
>>   #define TGU_LAR        0xfb0
>>   #define TGU_UNLOCK_OFFSET    0xc5acce55
>> +#define TGU_DEVID        0xfc8
>> +
>> +#define TGU_DEVID_SENSE_INPUT(devid_val) \
>> +    ((int)FIELD_GET(GENMASK(17, 10), devid_val))
>> +#define TGU_DEVID_STEPS(devid_val) \
>> +    ((int)FIELD_GET(GENMASK(6, 3), devid_val))
>> +#define TGU_BITS_PER_SIGNAL 4
>> +#define LENGTH_REGISTER 32
>> +
>> +/*
>> + *  TGU configuration space                              Step 
>> configuration
>> + *  offset table                                         space layout
>> + * x-------------------------x$ x-------------x$
>> + * |                         |$ |             |$
>> + * |                         |                           | reserve   |$
>> + * |                         | |             |$
>> + * |coresight management     | |-------------|base+n*0x1D8+0x1F4$
>> + * |     registers           |                     |---> 
>> |priority[3]  |$
>> + * |                         |                     | 
>> |-------------|base+n*0x1D8+0x194$
>> + * |                         |                     | |priority[2]  |$
>> + * |-------------------------|                     | 
>> |-------------|base+n*0x1D8+0x134$
>> + * |                         |                     | |priority[1]  |$
>> + * |         step[7]         |                     | 
>> |-------------|base+n*0x1D8+0xD4$
>> + * |-------------------------|->base+0x40+7*0x1D8  | |priority[0]  |$
>> + * |                         |                     | 
>> |-------------|base+n*0x1D8+0x74$
>> + * |         ...             |                     |     | 
>> condition  |$
>> + * |                         |                     |     | select    |$
>> + * |-------------------------|->base+0x40+1*0x1D8  | 
>> |-------------|base+n*0x1D8+0x60$
>
> minor nit:                       ^^^
> s/base+0x40+1*0x1D8/step[0] + 0x1D8 and so on, for the above

confirmed.


>
>> + * | |                     |     |  condition  |$
>> + * |         step[0]         |-------------------->      | decode    |$
>> + * |-------------------------|-> base+0x40 
>> |-------------|base+n*0x1D8+0x50$
>> + * |                         | |             |$
>> + * | Control and status space| |Timer/Counter|$
>> + * |        space            | |             |$
>> + * x-------------------------x->base x-------------x base+n*0x1D8+0x40$
>
> Also for each frame, you don't have to describe "base+n*..." that makes
> it unnecessarily crowded and complicated to read.

confirmed.


>
>> + *
>> + */
>> +#define STEP_OFFSET 0x1D8
>> +#define PRIORITY_START_OFFSET 0x0074
>> +#define PRIORITY_OFFSET 0x60
>
> From the diagram, it is CONDITION_SELECT ? Having two offsets named 
> after PRIORITY is confusing.
confirmed.

Renamed |PRIORITY_OFFSET| (|0x60|) to |PRIORITY_STRIDE| to avoid confusion.

>
>
>> +#define REG_OFFSET 0x4
>> +
>> +/*
>> + * Upper bounds on the DEVID/DEVID2-derived per-region counts. The 
>> TGU register
>> + * layout is fixed by the offset macros above and mirrored by the 
>> static sysfs
>> + * attribute tables in tgu.c, so these are the largest counts the 
>> driver can
>> + * both address within the mapped window and expose to userspace:
>> + *
>> + *   TGU_MAX_STEPS            static tables define step0..step7
>> + *   TGU_MAX_PRIORITY_REGS    STEP_PRIORITY_LIST defines reg0..reg17
>
> What are these ? PRIORITY regs is 0-3 ? Do you mean each priority has 
> 0-17 registers ? (See, the description using base+n*.. for the "step" 
> frame is making this worse). You may move it down as a separate figure.
>
> From my maths:
> For pritority[0] -> 0xD4-0x74 = 0x60 => 0x18 => 24 registers! not 18!
>
> What am I missing ?

You're right. I mistakenly treated the hexadecimal value as decimal.

Sorry about that. I'll fix it in the next revision.

>
>
>> + *
>> + * A device whose DEVID reports counts above these bounds is 
>> clamped, so writes
>> + * never fall outside the ioremap()'d window or spill into an 
>> adjacent region.
>> + */
>> +
>> +#define TGU_MAX_STEPS                  8
>> +#define TGU_MAX_PRIORITY_REGS          18
>> +
>> +/* Calculate compare step addresses */
>> +#define PRIORITY_REG_STEP(step, priority, reg)\
>> +    (PRIORITY_START_OFFSET + PRIORITY_OFFSET * priority +\
>> +     REG_OFFSET * reg + STEP_OFFSET * step)
>> +
>> +#define tgu_dataset_rw(name, step_index, type, 
>> reg_num)                  \
>> +    (&((struct tgu_attribute[]){ {                                   \
>> +        __ATTR(name, 0644, tgu_dataset_show, tgu_dataset_store), \
>> + step_index,                                              \
>> + type,                                                    \
>> + reg_num,                                                 \
>> +    } })[0].attr.attr)
>> +
>> +#define STEP_PRIORITY(step_index, reg_num, 
>> priority)                     \
>> +    tgu_dataset_rw(reg##reg_num, step_index, TGU_PRIORITY##priority, \
>> +            reg_num)
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
>
> Please could you move these macro magic to the .c file ?
> 1. Nobody else reuses them ?
> 2. It is really difficult to go back and forth to check what each 
> macro means, given how complex it is.
>
Confirmed.
>> +
>> +enum operation_index {
>
> why are we calling it operation_index ?

It is called |operation_index| because it is not limited to priority 
indices.

Other operations, such as |TGU_CONDITION_DECODE|, will be introduced in 
following patches and represented by the same enum.

>
>> +    TGU_PRIORITY0,
>> +    TGU_PRIORITY1,
>> +    TGU_PRIORITY2,
>> +    TGU_PRIORITY3,
>> +};
>> +
>> +/* Maximum priority that TGU supports */
>> +#define MAX_PRIORITY 4
>> +
>> +struct tgu_attribute {
>> +    struct device_attribute attr;
>> +    u32 step_index;
>> +    enum operation_index operation_index;
>
> u8 priority ?
confirmed.
>
>> +    u32 reg_num;
>
> u8 reg_num ?
confirmed.
>
>> +};
>> +
>> +struct value_table {
>> +    unsigned int *priority;
>> +};
>>     static inline void TGU_LOCK(void __iomem *addr)
>>   {
>> @@ -36,6 +163,9 @@ static inline void TGU_UNLOCK(void __iomem *addr)
>>    * @lock: Mutex serialising enable/disable and the associated PM 
>> runtime
>>    *        reference counting against concurrent sysfs access
>>    * @enabled: Flag indicating whether the TGU device is enabled
>> + * @value_table: Store given value based on relevant parameters
>> + * @num_reg: Maximum number of registers
>> + * @num_step: Maximum step size
>>    *
>>    * This structure defines the data associated with a TGU device,
>>    * including its base address, device pointer, the lock serialising
>> @@ -46,6 +176,9 @@ struct tgu_drvdata {
>>       struct device *dev;
>>       struct mutex lock;
>>       bool enabled;
>> +    struct value_table *value_table;
>
> Why this ? why not
>
>     struct value_table value_table ?
>
> Surely, we seem to be dynamically allocating the priorities etc from 
> there. But do we need dynamic allocation for value_table field as
> such ?

I'll use a statically allocated array here.

With the existing compile-time limits, the maximum size is 8 * 4 * 24 = 
768 |unsigned int|s, or about 3 KB.

I think this small and bounded memory overhead is a reasonable trade-off 
for simplifying the implementation and avoiding dynamic allocation, 
extra indirection, and the associated |-ENOMEM| handling.

>
> Suzuki
>
>> +    int num_reg;
>> +    int num_step;
>>   };
>>     #endif
>
