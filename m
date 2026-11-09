Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794214742;
	b=yV+sb1G1Plu8xuBMvIfbsPSPwZlXSfy0IlAs78+aFsH3GQBAvoWzOzf1fiBBW6yQnJAI
	 CQdhRxRuIXq7jItR/OJqcCF6s6uE0bXRehtHGISHMv9Qmgn7z7K+oASFkAuxKVMwHD/jY
	 A/O/oGLZDWCnLHeT+mkSw3fuPbtcAWMXk5mN0OMs0QS7DcEu2ONOZxXRjvBRj3kwVGE37
	 SuXH+y6nFJPfXOjLWMYjmeEDv8TIPl8u1icdDTI2UpsQ6njOe90uh7fJHXVgKplijtrY/
	 knHx7z3FpeP/Kg3aEiXPSZklmHqzY2R/oE76zQ0eTr0x2X5YkNWD9GiswWOmjnGFO8Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794214742;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=etFEjpRgASws+OFNyyBIEm3kq9HcOc4USKqQ17f+JwQ=;
	b=J2DKdFBRxqpNeQxpSLjFusK0nu2j/u0pSVKB9tb8kXDd6pAaPSnDwRxLAzA/vomy3FdY
	 R6IlaPfT2lA97hQiacSJArY/Csbrg91A1kjNjst9e+Lr7okI9nAnEAOWEX40kpWjyQ1Jk
	 cN1G7t4hHgpFn9vqfpKigjOn8qGu3E9o390TGzTvtSD7bLqIc3STn/tjhzD2i0e0Exr6Z
	 29/31qvZJCC4PIMlXxGBvJweN7c9l5L5me2igeytzlSTZzM6Pc3zGuL6KQfs9nRSfvQd8
	 Eajv3OaZVlh2dUfr/5YJ1W/FFBEAv8MtYXY66L77Cm4neu1Nu73GiYo0gTyzSWwKQ+Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="Q/GbJ7IB";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZreuZUmF;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4304C606A323
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 08:59:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4304C606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Q/GbJ7IB;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZreuZUmF
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A97pJmc3325510
	for <linux-kernel@vger.kernel.org>; Mon, 9 Nov 2026 08:59:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	etFEjpRgASws+OFNyyBIEm3kq9HcOc4USKqQ17f+JwQ=; b=Q/GbJ7IBuyO9NSUY
	qholJe+I4QkO314Z+jygQQjYXohrMyit4yf745c3NT/Zo/YbaErIfO1zw9UPY914
	fWdCJvCG9PgdK/gjq3u/ROPV6p32EAEyU8+Nt9O7ezTLS95suOSTJlRSBdrvxTuY
	W0RGqJ3Y2kM7t8cqLgLDdTdQr+M7YQFx01GJy3iiYrdm8bs9G40gftAHV+1Byd8+
	y0LE78CwoVYI+9A5g+VTrZ7Fnwqh661ZaJT/LMZ4xMUxgwFBuWzu/F1w4tABEI8M
	FhUJvUuFolhDX1f6a9am9vGQdigYXMl7z/+1+KeP8li/ulcCl8MaSaofn7NauaxN
	OUFHeQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hua5887c9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 08:59:00 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3b09a466295so618924a91.2
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 00:59:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794214740; x=1794819540; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=etFEjpRgASws+OFNyyBIEm3kq9HcOc4USKqQ17f+JwQ=;
        b=ZreuZUmFytudPPY5a3aTmVe0YudpP7BMVR7RDNpNyekWHHETJbSIEppJjlqBb/D+Vo
         KHdWGuhiPtDsWegrkqMgkxxINH//efdcuu0d/hoy3YBltRpTLXyS2ZkxLq6zQq3AfAY4
         dGVMs6NvAndzmgxlrMkYSihr/4ieNtUbDTOYvN/WFGOyDMKQAP68XSqNC2ivsZQuWK+S
         wq6NXutq5f73FKMOv4+gIqB8yOSZG0z+GZaaEkVFA6SkOaSPpxmH7mxRdUWEsGkKKn5h
         ZXOwVNBBmb+JV9wKm2lpSLp13u1a7ZkLBzmlyOUDJ74CPdErCqCVrbMaqSzRVXGNYaAL
         +kZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794214740; x=1794819540;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=etFEjpRgASws+OFNyyBIEm3kq9HcOc4USKqQ17f+JwQ=;
        b=md3DAvKyl6qKag+Gj7ZgHD95hl+ImChdu6jc5lIxRCNn0ckvw6eFUDVmUuuOS4S99t
         Dp62sOB4kyBH8S5Q3BKSRaZOxZaMd3kHWznMTXkmQgvIpU0hI6cIqlaC4n9244h2tuzO
         wwqEGtKh7BJpAyUMBMGXRqPP6ODcCKhTZOwZ4cIA+bWow3H5Vx7SnTxm/V2n0b5OUnp8
         llqV3gh+YATPnXNPEfWLf4NeTrOpdAU+klSrmpEUGgNBAPaQoc3DIi93TCaB1TJsVOdS
         VcOgZuGSao2ZJLtmR2OfQlLIv5yJHSSSYf5aL6S0HyJcBT54ZzJ3QbzRx6kNbus1FfZV
         9aIQ==
X-Gm-Message-State: APuU4Z884sAgoA+uI7LFZIuzx7IMGajEuZ+0UFydBYHRL0ITZ1+XlhEZ
	zL1JRJCpAa1mQ8B5J8Y97/6rEF/K9ptWKDM359CnHKSyCRikuu+hHW0eRYLP9SjI8S56n1clQWg
	aVwQMsTCdURyicIyfgUoZ/GbXEbjdjP9XX4EPcmqlkdWMukHxvwUzJ8B7xBaMWO+YQ+k=
X-Gm-Gg: AYBFou09FCVVWlHOvJtP7lc23mcBHZ5LYSbDuQ86rHV0vCmSiBE57UOCBrNSQeFDWoQ
	C1vmPHDE0XqcbyxNUnBion7iW7WCSLRsQxnnu98KRLIJRxvt4p+RZYEKUaIqEQRUqCOhH3YdjrL
	FOjFe/+K2gUyF36D3S9u693Hieo+VXpRbi2GnD73MY1OgkhsL7C14nbYrswlNqinCs3LvyrV/Zj
	nN6fLCdEX+zmLSc/gzCzZllX8fG4J/X120K9rEQoYGDT3HZEzVIq7R5yV432uxlJm63MdAuhAxh
	2vT2jywdQxTJATICKyBKSfz9g2qNhE2Cr9o6gm9YuJZmjNBXakdROsEDoYiIH7DKKKB3mwPpVem
	8bqm0pIoTWYjDdlj2Lca/FUMOZP7czP9QcsZXmKY3pYKOZpk5GZ/arVH2X4ebT3pTZeEu+P+vCn
	yQIZ/QuDrNAN8DOafy0MEadNxZ6BtSQ7+gqj5jWVQvcsfM
X-Received: by 2002:a17:90b:2ec8:b0:3ad:a232:403f with SMTP id 98e67ed59e1d1-3b12d522baemr3258531a91.56.1794214740151;
        Mon, 09 Nov 2026 00:59:00 -0800 (PST)
X-Received: by 2002:a17:90b:2ec8:b0:3ad:a232:403f with SMTP id 98e67ed59e1d1-3b12d522baemr3258496a91.56.1794214738830;
        Mon, 09 Nov 2026 00:58:58 -0800 (PST)
Received: from [10.133.33.170] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0fc27e829sm5986367a91.0.2026.11.09.00.58.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 00:58:58 -0800 (PST)
Message-ID: <c016ac7b-43d7-41f4-9af6-3e389f1f6bd9@oss.qualcomm.com>
Date: Mon, 9 Nov 2026 16:58:53 +0800
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
 <f1e4f462-2aba-470d-84e4-87a12c2a13d3@arm.com>
Content-Language: en-US
From: "Songwei.Chai" <songwei.chai@oss.qualcomm.com>
In-Reply-To: <f1e4f462-2aba-470d-84e4-87a12c2a13d3@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDAzNSBTYWx0ZWRfX5sSryV7jA2FQ
 ZqD2opvIGJGVrEqJUshi+AjQbV8QSEB7p3kJEMD9u8c130PTY6/RXNWI2qpaEfaMySERlE0v3qg
 tGwVmNM5mLrcCCQflVJKAvnEeieK/JsbEgfg09TLbLMVfNTxbo2Opm2lJMTmujRKiz1bXoIMcy+
 nYJQzxEBv1S74CNRxabWCtXMJGKAN53dgdtC3LwBjAyQYHrclQe8O3SltqDlWEiWTPlkTGzQCpj
 OnJ473dfOsoEZUL3oxKO/h82MuLQTtkPP7KlP5WyHp0JVrbU8gaJKM+vTLnuS4zTL9IJi/WCGlj
 5SqrAqLqUkqAxZGOCf3A1hQmOmee20MB3oPqLen4rchIiM/EKBh56W3l/LF4Rg5IME7qCxePCP4
 /h2vCLfiWwqPX0zGOTyLehpuIrUsoQXxVEslcWCISv8QRaS2WXdSwtsnxuANAAkqAB3qNjEfttG
 Q7Im6wTHRQz4NFryrJQ==
X-Proofpoint-ORIG-GUID: msM90x6NsUfWM6o2z-xFjU7Zs4TG2CSu
X-Proofpoint-GUID: msM90x6NsUfWM6o2z-xFjU7Zs4TG2CSu
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDAzNSBTYWx0ZWRfX2xu/xOQ6Zqk6
 HvO83mDeFI5jDIFkMWxONykJOs5IsWL72qApPg5QJUQC9ggLUkm0ZHhfvCQtWAZRmvHUckDGIzk
 R172oA0DDAtpB65i4cQdzoVjwB/Yv9k=
X-Authority-Analysis: v=2.4 cv=C9V8WgP+ c=1 sm=1 tr=0 ts=6af18b55 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=TV1P25pgAJBHq19FwxUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_03,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 bulkscore=0 suspectscore=0 adultscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611090035


On 11/5/2026 10:14 PM, Suzuki K Poulose wrote:
>
> On 05/11/2026 13:01, Suzuki K Poulose wrote:
>> On 30/07/2026 09:07, Songwei Chai wrote:
>>> Like circuit of a Logic analyzer, in TGU, the requirement could be
>>> configured in each step and the trigger will be created once the
>>> requirements are met. Add priority functionality here to sort the
>>> signals into different priorities. The signal which is wanted could
>>> be configured in each step's priority node, the larger number means
>>> the higher priority and the signal with higher priority will be sensed
>>> more preferentially.
>>>
>>> Reviewed-by: Jie Gan <jie.gan@oss.qualcomm.com>
>>> Signed-off-by: Songwei Chai <songwei.chai@oss.qualcomm.com>
>>> ---
>>>   .../ABI/testing/sysfs-bus-amba-devices-tgu    |   7 +
>>>   drivers/hwtracing/qcom/tgu.c                  | 189 
>>> +++++++++++++++++-
>>>   drivers/hwtracing/qcom/tgu.h                  | 133 ++++++++++++
>>>   3 files changed, 328 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu b/ 
>>> Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
>>> index 36ab64f1e301..7dd24314592d 100644
>>> --- a/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
>>> +++ b/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
>>> @@ -7,3 +7,10 @@ Description:
>>>           Accepts only one of the 2 values -  0 or 1.
>>>           0 : disable TGU.
>>>           1 : enable TGU.
>>> +
>>> +What:        /sys/bus/amba/devices/<tgu-name>/ 
>>> step[0:7]_priority[0:3]/reg[0:17]
>>> +Date:        August 2026
>>> +KernelVersion:    7.2
>>> +Contact:    Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Songwei 
>>> Chai <songwei.chai@oss.qualcomm.com>
>>> +Description:
>>> +        (RW) Set/Get the sensed signal with specific step and 
>>> priority for TGU.
>>> diff --git a/drivers/hwtracing/qcom/tgu.c 
>>> b/drivers/hwtracing/qcom/tgu.c
>>> index 9c7dd4a09f02..0e88b437f191 100644
>>> --- a/drivers/hwtracing/qcom/tgu.c
>>> +++ b/drivers/hwtracing/qcom/tgu.c
>>> @@ -15,14 +15,144 @@
>>>   #include "tgu.h"
>>> +static int calculate_array_location(struct tgu_drvdata *drvdata,
>>> +                    int step_index, int operation_index,
>>> +                    int reg_index)
>>> +{
>>> +    return operation_index * (drvdata->num_step) * 
>>> (drvdata->num_reg) +
>>> +        step_index * (drvdata->num_reg) + reg_index;
>>> +}
>>> +
>>> +static ssize_t tgu_dataset_show(struct device *dev,
>>> +                struct device_attribute *attr, char *buf)
>>> +{
>>> +    struct tgu_drvdata *drvdata = dev_get_drvdata(dev);
>>> +    struct tgu_attribute *tgu_attr =
>>> +            container_of(attr, struct tgu_attribute, attr);
>>> +    int index;
>>> +
>>> +    index = calculate_array_location(drvdata, tgu_attr->step_index,
>>> +                     tgu_attr->operation_index,
>>> +                     tgu_attr->reg_num);
>>> +
>>> +    /*
>>> +     * Serialise against tgu_dataset_store() and tgu_enable(), 
>>> which read
>>> +     * and write the same priority array, so the value is not observed
>>> +     * while being updated concurrently.
>>> +     */
>>> +    guard(mutex)(&drvdata->lock);
>>> +
>>> +    return sysfs_emit(buf, "0x%x\n",
>>> +              drvdata->value_table->priority[index]);
>>> +}
>>> +
>>> +static ssize_t tgu_dataset_store(struct device *dev,
>>> +                 struct device_attribute *attr,
>>> +                 const char *buf, size_t size)
>>> +{
>>> +    struct tgu_drvdata *tgu_drvdata = dev_get_drvdata(dev);
>>> +    struct tgu_attribute *tgu_attr =
>>> +        container_of(attr, struct tgu_attribute, attr);
>>> +    unsigned long val;
>>> +    int index;
>>> +    int ret;
>>> +
>>> +    ret = kstrtoul(buf, 0, &val);
>>> +    if (ret)
>>> +        return ret;
>>> +
>>> +    guard(mutex)(&tgu_drvdata->lock);
>>> +    index = calculate_array_location(tgu_drvdata, 
>>> tgu_attr->step_index,
>>> +                     tgu_attr->operation_index,
>>> +                     tgu_attr->reg_num);
>>> +
>>> +    tgu_drvdata->value_table->priority[index] = val;
>>> +
>>> +    return size;
>>> +}
>>> +
>>> +static umode_t tgu_node_visible(struct kobject *kobject,
>>> +                struct attribute *attr,
>>> +                int n)
>>> +{
>>> +    struct device *dev = kobj_to_dev(kobject);
>>> +    struct tgu_drvdata *drvdata = dev_get_drvdata(dev);
>>> +    struct device_attribute *dev_attr =
>>> +        container_of(attr, struct device_attribute, attr);
>>> +    struct tgu_attribute *tgu_attr =
>>> +        container_of(dev_attr, struct tgu_attribute, attr);
>>> +
>>> +    if (tgu_attr->step_index >= drvdata->num_step)
>>> +        return SYSFS_GROUP_INVISIBLE;
>>> +
>>> +    if (tgu_attr->reg_num >= drvdata->num_reg)
>>> +        return 0;
>>> +
>>> +    return attr->mode;
>>> +}
>>> +
>>>   static void tgu_write_all_hw_regs(struct tgu_drvdata *drvdata)
>>>   {
>>> +    int i, j, k, index;
>>> +
>>>       TGU_UNLOCK(drvdata->base);
>>> +    for (i = 0; i < drvdata->num_step; i++) {
>>> +        for (j = 0; j < MAX_PRIORITY; j++) {
>>> +            for (k = 0; k < drvdata->num_reg; k++) {
>>> +                index = calculate_array_location(
>>> +                            drvdata, i, j, k);
>>> +
>>> + writel(drvdata->value_table->priority[index],
>>> +                    drvdata->base +
>>> +                    PRIORITY_REG_STEP(i, j, k));
>>> +            }
>>> +        }
>>> +    }
>>>       /* Enable TGU to program the triggers */
>>>       writel(1, drvdata->base + TGU_CONTROL);
>>>       TGU_LOCK(drvdata->base);
>>>   }
>>> +static void tgu_set_reg_number(struct tgu_drvdata *drvdata)
>>> +{
>>> +    int num_sense_input;
>>> +    int num_reg;
>>> +    u32 devid;
>>> +
>>> +    devid = readl(drvdata->base + TGU_DEVID);
>>> +
>>> +    num_sense_input = TGU_DEVID_SENSE_INPUT(devid);
>>> +    num_reg = (num_sense_input * TGU_BITS_PER_SIGNAL) / 
>>> LENGTH_REGISTER;
>>> +
>>> +    if ((num_sense_input * TGU_BITS_PER_SIGNAL) % LENGTH_REGISTER)
>>> +        num_reg++;
>>> +
>>> +    if (num_reg > TGU_MAX_PRIORITY_REGS) {
>>> +        dev_warn(drvdata->dev,
>>> +            "DEVID reports %d priority regs, clamping to %d\n",
>>> +            num_reg, TGU_MAX_PRIORITY_REGS);
>>> +        num_reg = TGU_MAX_PRIORITY_REGS;
>>> +    }
>>> +
>>> +    drvdata->num_reg = num_reg;
>>> +}
>>> +
>>> +static void tgu_set_steps(struct tgu_drvdata *drvdata)
>>> +{
>>> +    u32 devid;
>>> +
>>> +    devid = readl(drvdata->base + TGU_DEVID);
>>> +
>>> +    drvdata->num_step = TGU_DEVID_STEPS(devid);
>>> +
>>> +    if (drvdata->num_step > TGU_MAX_STEPS) {
>>> +        dev_warn(drvdata->dev,
>>> +            "DEVID reports %d steps, clamping to %d\n",
>>> +            drvdata->num_step, TGU_MAX_STEPS);
>>> +        drvdata->num_step = TGU_MAX_STEPS;
>>> +    }
>>> +}
>>
>> Why not combine setting the num_step and num_regs in one go ? You are 
>> reading the DEVID anyways, and such macro level functional split is
>> useless.
>>
>>
>>> +
>>>   static void tgu_enable(struct tgu_drvdata *drvdata)
>>>   {
>>>       tgu_write_all_hw_regs(drvdata);
>>> @@ -104,6 +234,38 @@ static const struct attribute_group 
>>> tgu_common_grp = {
>>>   static const struct attribute_group *tgu_attr_groups[] = {
>>>       &tgu_common_grp,
>>> +    PRIORITY_ATTRIBUTE_GROUP_INIT(0, 0),
>>> +    PRIORITY_ATTRIBUTE_GROUP_INIT(0, 1),
>>> +    PRIORITY_ATTRIBUTE_GROUP_INIT(0, 2),
>>> +    PRIORITY_ATTRIBUTE_GROUP_INIT(0, 3),
>>> +    PRIORITY_ATTRIBUTE_GROUP_INIT(1, 0),
>>> +    PRIORITY_ATTRIBUTE_GROUP_INIT(1, 1),
>>> +    PRIORITY_ATTRIBUTE_GROUP_INIT(1, 2),
>>> +    PRIORITY_ATTRIBUTE_GROUP_INIT(1, 3),
>>> +    PRIORITY_ATTRIBUTE_GROUP_INIT(2, 0),
>>> +    PRIORITY_ATTRIBUTE_GROUP_INIT(2, 1),
>>> +    PRIORITY_ATTRIBUTE_GROUP_INIT(2, 2),
>>> +    PRIORITY_ATTRIBUTE_GROUP_INIT(2, 3),
>>> +    PRIORITY_ATTRIBUTE_GROUP_INIT(3, 0),
>>> +    PRIORITY_ATTRIBUTE_GROUP_INIT(3, 1),
>>> +    PRIORITY_ATTRIBUTE_GROUP_INIT(3, 2),
>>> +    PRIORITY_ATTRIBUTE_GROUP_INIT(3, 3),
>>> +    PRIORITY_ATTRIBUTE_GROUP_INIT(4, 0),
>>> +    PRIORITY_ATTRIBUTE_GROUP_INIT(4, 1),
>>> +    PRIORITY_ATTRIBUTE_GROUP_INIT(4, 2),
>>> +    PRIORITY_ATTRIBUTE_GROUP_INIT(4, 3),
>>> +    PRIORITY_ATTRIBUTE_GROUP_INIT(5, 0),
>>> +    PRIORITY_ATTRIBUTE_GROUP_INIT(5, 1),
>>> +    PRIORITY_ATTRIBUTE_GROUP_INIT(5, 2),
>>> +    PRIORITY_ATTRIBUTE_GROUP_INIT(5, 3),
>>> +    PRIORITY_ATTRIBUTE_GROUP_INIT(6, 0),
>>> +    PRIORITY_ATTRIBUTE_GROUP_INIT(6, 1),
>>> +    PRIORITY_ATTRIBUTE_GROUP_INIT(6, 2),
>>> +    PRIORITY_ATTRIBUTE_GROUP_INIT(6, 3),
>>> +    PRIORITY_ATTRIBUTE_GROUP_INIT(7, 0),
>>> +    PRIORITY_ATTRIBUTE_GROUP_INIT(7, 1),
>>> +    PRIORITY_ATTRIBUTE_GROUP_INIT(7, 2),
>>> +    PRIORITY_ATTRIBUTE_GROUP_INIT(7, 3),
>>>       NULL,
>>>   };
>>> @@ -111,6 +273,8 @@ static int tgu_probe(struct amba_device *adev, 
>>> const struct amba_id *id)
>>>   {
>>>       struct device *dev = &adev->dev;
>>>       struct tgu_drvdata *drvdata;
>>> +    unsigned int *priority;
>>> +    size_t priority_size;
>>>       int ret;
>>>       drvdata = devm_kzalloc(dev, sizeof(*drvdata), GFP_KERNEL);
>>> @@ -128,8 +292,31 @@ static int tgu_probe(struct amba_device *adev, 
>>> const struct amba_id *id)
>>>       if (ret)
>>>           return ret;
>>> -    drvdata->enabled = false;
>>
>>> +    tgu_set_reg_number(drvdata);
>>> +    tgu_set_steps(drvdata);
>>
>> As mentioned above, combine both ?
>>
>>> +
>>> +    drvdata->value_table =
>>> +        devm_kzalloc(dev, sizeof(*drvdata->value_table), GFP_KERNEL);
>>
>> Could we not embed this in the drvdata without dynamic allocation ?
>>> +    if (!drvdata->value_table)
>>> +        return -ENOMEM;
>>> +    priority_size = MAX_PRIORITY * drvdata->num_reg * 
>>> drvdata->num_step;
>>> +
>>> +    priority = devm_kcalloc(dev, priority_size,
>>> + sizeof(*drvdata->value_table->priority),
>>> +                GFP_KERNEL);
>>> +    if (!priority)
>>> +        return -ENOMEM;
>>> +
>>> +    drvdata->value_table->priority = priority;
>>> +
>>> +    drvdata->enabled = false;
>>> +    /*
>>> +     * Create the sysfs groups only after the backing storage is fully
>>> +     * allocated, otherwise userspace could open a priority 
>>> attribute and
>>> +     * have tgu_dataset_show() dereference an uninitialised 
>>> value_table.
>>> +     * This also keeps the error paths above free of sysfs teardown.
>>> +     */
>>>       ret = sysfs_create_groups(&dev->kobj, tgu_attr_groups);
>>>       if (ret) {
>>>           dev_err(dev, "failed to create sysfs groups: %d\n", ret);
>>> diff --git a/drivers/hwtracing/qcom/tgu.h 
>>> b/drivers/hwtracing/qcom/tgu.h
>>> index ebba49402a20..7a3e1161c4cf 100644
>>> --- a/drivers/hwtracing/qcom/tgu.h
>>> +++ b/drivers/hwtracing/qcom/tgu.h
>>> @@ -6,10 +6,137 @@
>>>   #ifndef _QCOM_TGU_H
>>>   #define _QCOM_TGU_H
>>> +#include <linux/bitfield.h>
>>> +#include <linux/bits.h>
>>> +
>>>   /* Register addresses */
>>>   #define TGU_CONTROL        0x0000
>>>   #define TGU_LAR        0xfb0
>>>   #define TGU_UNLOCK_OFFSET    0xc5acce55
>>> +#define TGU_DEVID        0xfc8
>>> +
>>> +#define TGU_DEVID_SENSE_INPUT(devid_val) \
>>> +    ((int)FIELD_GET(GENMASK(17, 10), devid_val))
>>> +#define TGU_DEVID_STEPS(devid_val) \
>>> +    ((int)FIELD_GET(GENMASK(6, 3), devid_val))
>>> +#define TGU_BITS_PER_SIGNAL 4
>>> +#define LENGTH_REGISTER 32
>>> +
>>> +/*
>>> + *  TGU configuration space                              Step 
>>> configuration
>>> + *  offset table space layout
>>> + * x-------------------------x$ x-------------x$
>>> + * |                         |$                          | 
>>>              |$
>>> + * |                         |                           | 
>>> reserve   |$
>>> + * |                         |                           | 
>>>              |$
>>> + * |coresight management     | |-------------|base+n*0x1D8+0x1F4$
>>> + * |     registers           |                     |---> | 
>>> priority[3]  |$
>>> + * |                         |                     | 
>>> |-------------|base+n*0x1D8+0x194$
>>> + * |                         |                     |     | 
>>> priority[2]  |$
>>> + * |-------------------------|                     | 
>>> |-------------|base+n*0x1D8+0x134$
>>> + * |                         |                     |     | 
>>> priority[1]  |$
>>> + * |         step[7]         |                     | 
>>> |-------------|base+n*0x1D8+0xD4$
>>> + * |-------------------------|->base+0x40+7*0x1D8  |     | 
>>> priority[0]  |$
>>> + * |                         |                     | 
>>> |-------------|base+n*0x1D8+0x74$
>>> + * |         ...             |                     |     | 
>>> condition  |$
>>> + * |                         |                     |     | 
>>> select    |$
>>> + * |-------------------------|->base+0x40+1*0x1D8  | 
>>> |-------------|base+n*0x1D8+0x60$
>>
>> minor nit:                       ^^^
>> s/base+0x40+1*0x1D8/step[0] + 0x1D8 and so on, for the above
>>
>>> + * | |                     |     |  condition  |$
>>> + * |         step[0]         |--------------------> |   decode    |$
>>> + * |-------------------------|-> base+0x40 
>>> |-------------|base+n*0x1D8+0x50$
>>> + * |                         |                           | 
>>>              |$
>>> + * | Control and status space| |Timer/ Counter|$
>>> + * |        space            |                           | 
>>>              |$
>>> + * x-------------------------x->base x-------------x 
>>> base+n*0x1D8+0x40$
>>
>> Also for each frame, you don't have to describe "base+n*..." that makes
>> it unnecessarily crowded and complicated to read.
>>
>>> + *
>>> + */
>>> +#define STEP_OFFSET 0x1D8
>
> Looking back at the patch 4, this is not really an offset, but size of 
> a STEP. This is true for all the _OFFSETs below.

It will be renamed with "_size".


>
>>> +#define PRIORITY_START_OFFSET 0x0074
>>> +#define PRIORITY_OFFSET 0x60
>>
>>  From the diagram, it is CONDITION_SELECT ? Having two offsets named 
>> after PRIORITY is confusing.
>>
>>
>>> +#define REG_OFFSET 0x4
>
> this one is more wierd, this rather, size of a REG not OFFSET of a REG.
>
> Please could you rename them as such ?


Confirmed, will update.


>
>
> Cheers
> Suzuki
>
>
>>> +
>>> +/*
>>> + * Upper bounds on the DEVID/DEVID2-derived per-region counts. The 
>>> TGU register
>>> + * layout is fixed by the offset macros above and mirrored by the 
>>> static sysfs
>>> + * attribute tables in tgu.c, so these are the largest counts the 
>>> driver can
>>> + * both address within the mapped window and expose to userspace:
>>> + *
>>> + *   TGU_MAX_STEPS            static tables define step0..step7
>>> + *   TGU_MAX_PRIORITY_REGS    STEP_PRIORITY_LIST defines reg0..reg17
>>
>> What are these ? PRIORITY regs is 0-3 ? Do you mean each priority has 
>> 0-17 registers ? (See, the description using base+n*.. for the "step" 
>> frame is making this worse). You may move it down as a separate figure.
>>
>>  From my maths:
>> For pritority[0] -> 0xD4-0x74 = 0x60 => 0x18 => 24 registers! not 18!
>>
>> What am I missing ?
>>
>>
>>> + *
>>> + * A device whose DEVID reports counts above these bounds is 
>>> clamped, so writes
>>> + * never fall outside the ioremap()'d window or spill into an 
>>> adjacent region.
>>> + */
>>> +
>>> +#define TGU_MAX_STEPS                  8
>>> +#define TGU_MAX_PRIORITY_REGS          18
>>> +
>>> +/* Calculate compare step addresses */
>>> +#define PRIORITY_REG_STEP(step, priority, reg)\
>>> +    (PRIORITY_START_OFFSET + PRIORITY_OFFSET * priority +\
>>> +     REG_OFFSET * reg + STEP_OFFSET * step)
>>> +
>>> +#define tgu_dataset_rw(name, step_index, type, 
>>> reg_num)                  \
>>> +    (&((struct tgu_attribute[]){ {                                   \
>>> +        __ATTR(name, 0644, tgu_dataset_show, tgu_dataset_store), \
>>> + step_index,                                              \
>>> + type,                                                    \
>>> + reg_num,                                                 \
>>> +    } })[0].attr.attr)
>>> +
>>> +#define STEP_PRIORITY(step_index, reg_num, 
>>> priority)                     \
>>> +    tgu_dataset_rw(reg##reg_num, step_index, TGU_PRIORITY##priority, \
>>> +            reg_num)
>>> +
>>> +#define STEP_PRIORITY_LIST(step_index, priority) \
>>> +    {STEP_PRIORITY(step_index, 0, priority), \
>>> +     STEP_PRIORITY(step_index, 1, priority),  \
>>> +     STEP_PRIORITY(step_index, 2, priority),     \
>>> +     STEP_PRIORITY(step_index, 3, priority),  \
>>> +     STEP_PRIORITY(step_index, 4, priority),  \
>>> +     STEP_PRIORITY(step_index, 5, priority),  \
>>> +     STEP_PRIORITY(step_index, 6, priority),  \
>>> +     STEP_PRIORITY(step_index, 7, priority),  \
>>> +     STEP_PRIORITY(step_index, 8, priority),  \
>>> +     STEP_PRIORITY(step_index, 9, priority),  \
>>> +     STEP_PRIORITY(step_index, 10, priority), \
>>> +     STEP_PRIORITY(step_index, 11, priority), \
>>> +     STEP_PRIORITY(step_index, 12, priority), \
>>> +     STEP_PRIORITY(step_index, 13, priority), \
>>> +     STEP_PRIORITY(step_index, 14, priority), \
>>> +     STEP_PRIORITY(step_index, 15, priority), \
>>> +     STEP_PRIORITY(step_index, 16, priority), \
>>> +     STEP_PRIORITY(step_index, 17, priority), \
>>> +     NULL                   \
>>> +    }
>>> +
>>> +#define PRIORITY_ATTRIBUTE_GROUP_INIT(step, priority)\
>>> +    (&(const struct attribute_group){\
>>> +        .attrs = (struct attribute*[])STEP_PRIORITY_LIST(step, 
>>> priority),\
>>> +        .is_visible = tgu_node_visible,\
>>> +        .name = "step" #step "_priority" #priority \
>>> +    })
>>
>> Please could you move these macro magic to the .c file ?
>> 1. Nobody else reuses them ?
>> 2. It is really difficult to go back and forth to check what each 
>> macro means, given how complex it is.
>>
>>> +
>>> +enum operation_index {
>>
>> why are we calling it operation_index ?
>>
>>> +    TGU_PRIORITY0,
>>> +    TGU_PRIORITY1,
>>> +    TGU_PRIORITY2,
>>> +    TGU_PRIORITY3,
>>> +};
>>> +
>>> +/* Maximum priority that TGU supports */
>>> +#define MAX_PRIORITY 4
>>> +
>>> +struct tgu_attribute {
>>> +    struct device_attribute attr;
>>> +    u32 step_index;
>>> +    enum operation_index operation_index;
>>
>> u8 priority ?
>>
>>> +    u32 reg_num;
>>
>> u8 reg_num ?
>>
>>> +};
>>> +
>>> +struct value_table {
>>> +    unsigned int *priority;
>>> +};
>>>   static inline void TGU_LOCK(void __iomem *addr)
>>>   {
>>> @@ -36,6 +163,9 @@ static inline void TGU_UNLOCK(void __iomem *addr)
>>>    * @lock: Mutex serialising enable/disable and the associated PM 
>>> runtime
>>>    *        reference counting against concurrent sysfs access
>>>    * @enabled: Flag indicating whether the TGU device is enabled
>>> + * @value_table: Store given value based on relevant parameters
>>> + * @num_reg: Maximum number of registers
>>> + * @num_step: Maximum step size
>>>    *
>>>    * This structure defines the data associated with a TGU device,
>>>    * including its base address, device pointer, the lock serialising
>>> @@ -46,6 +176,9 @@ struct tgu_drvdata {
>>>       struct device *dev;
>>>       struct mutex lock;
>>>       bool enabled;
>>> +    struct value_table *value_table;
>>
>> Why this ? why not
>>
>>      struct value_table value_table ?
>>
>> Surely, we seem to be dynamically allocating the priorities etc from 
>> there. But do we need dynamic allocation for value_table field as
>> such ?
>>
>> Suzuki
>>
>>> +    int num_reg;
>>> +    int num_step;
>>>   };
>>>   #endif
>>
>
