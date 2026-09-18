Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80D06463B73
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 10:02:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789725729; cv=none; b=IzVaindjwdPCAk/JqqjB9qESRrZnD/S40AiI4vDe7oD5jZOOmFD7zWx95Ig+glYZ6T2oRctEzM3RAAA5Ngb2ZeZtjTRJ9xl1EFpEeVSkGNZUF/R8c5wHlK5dWD/vkDMw9KPgGjN94wUDlJlLnMT8H7gGOBY3f0KHRb97wyEfaIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789725729; c=relaxed/simple;
	bh=aWdUbLPfvC6wNjFP+17bs1Vn8BgG4/eM1GE3CrUak1Y=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=i0egkPELDOSgjozNvqFYVsFMDjbYi2nYYHmVRmm1LrWimUmg2MPT3CbAJSom05oLVI0A/Q3WEcHTZfC/X5guSIkkDdzmtFCRKx9LEI9DJcaR+Fv8kW8KIvSetsWkNB9r27GKU11aJzBa1oq/6tFE6cbZa8G6mR/jEj0eRJdFQts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AqKkK2Z+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dMBk9jBR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AqKkK2Z+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dMBk9jBR"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68I9eGPY522640
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 10:02:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qYA58SCxkPQpuxebyIQOtCSJePOccGQb1BNaM1QCZVY=; b=AqKkK2Z+nF+Z/dGt
	FWBPIBa9LfPCRuhIMDS79rzdtAonoYumPp1/erhcFZxnlhFx2qXcCfasS6QCaRzq
	PhJXaQ75jatiT5KGqZlOElNbKQgH7nwxVEuyHjgrEdJAwC8oJ9fGmXSwkOUx95Mv
	wL3HE7/XAeLp33/7aUlJ3RPC/daRq2zVZrKDWfeJvzou1Cun6Gsimf6vDEQxTfRv
	g62tVzKbpRzjhexa76EFC0MrEzbjEwUKX3WhiKKFSt87TGbCmTnqAMqa/o7sLVqA
	KK55FrH3OweXu3HkaexGQ6aJ9mMoYwLaVNuxbgDAhx3nwHn+sLQzHPBmcxsuL0YO
	CiAppw==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grnqebc2x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 10:02:06 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5c7a3b3c06bso133491e0c.2
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 03:02:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789725725; x=1790330525; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=qYA58SCxkPQpuxebyIQOtCSJePOccGQb1BNaM1QCZVY=;
        b=dMBk9jBReeP7gvLSWmFOolLAUV4UgNELIs6jVs0M86ZwMhysIFgiUQ8fvn5HA68pHK
         Vhz4tXesrV0TpsncuQCSmBszIh7/gPzcGgYRHr067/PEvOzy9ELwFY56foQQIQJE7vqu
         xfxv3sGzaf8HfzorXvCAwMDE74+BYfbP4gI+ntGF06Lmk2veqETx80TYtUszcP5H0hGu
         1rtxZ6CJy+d60iQyRLn0Ohm9lucFpPc+gdlMXI/7y2xvC+DaQR6AT/wY1P68fxPENIFM
         R0PDXJN8hJZb3ogZnWehT/q8p90/fCMgMOvpLv/Iqha1kbeiQh5mLTtR/zQ5Arpql2gS
         hVuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789725725; x=1790330525;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qYA58SCxkPQpuxebyIQOtCSJePOccGQb1BNaM1QCZVY=;
        b=fleLhWG/YyWIJa6gbL4GuvUvetWk5IGifOVmL1ZRafK/2nh6/Yv0DkU8Pk66TyNAHJ
         nDQRNPKX1xqwb7jCg2LLjrKVg+xOfUvFlJBeb6gKFMwCzIwaRhHNmNc3224HcScvlprL
         CIq+YRr3R4AKMRdjFMGhrAic0cZfysxiCeQYcBoodFh0PWqoOTtWZXyjzd9sG3hBAfNy
         PY9XD+DjJwHsv7RKyh7hEEAA73vh+JlcTx8VKUAdtyIAL+hM7BHTs0fc/yBJu8v3UHpf
         SGy0NGjauXSt0smCZWkScirNEtabKaZF1y3NadzboCs3utp30X4wwR/ybbQ4Fy6goGqc
         IznA==
X-Forwarded-Encrypted: i=1; AKwUvBzHcz8ybNz5wmxYLmoIG+sW7j+va6i4tGCmaOrKaDOOaYohQsfmeCyV8anj/A8bl6BO5ilF/MqLkteY+ys=@vger.kernel.org
X-Gm-Message-State: AFuF++k8/SDQlX5aEgcpsFmAW7bSuJGbpp03PZHsF1Smu6orJXTV/tqr
	2HMBltfUFLKkAW33oEkgtf1skJbAprtZpYBpKtZVjkvvQFPnFlzZwLmO1ymsRTNd2XXAnntiw4s
	eLsrLj40xPD6yO21DXhJBj0JavDMpXUt5QCZSC0Ict+XM7yDjG9VnEYIXcb25LOONiHw=
X-Gm-Gg: AYBFou1R4UXRMUArOPk91vjgvPczRz84zNvF5NDdd1Kxzc6XWjAdqMNoiWieGF2snHY
	gQyH8z1tLpozuYNX3hN6oRX1nrBr4K14KnMmLp8YyOPwlgdyfclZw/WSPIsLHoVsNWQrbQnyjlV
	aqG/1t6grkykRpruaChDFgUF0gHxxyydfsVbDCS5eZNawH92UJFcjLqtxv3/YKMlKbQVV0dmFfU
	2Iy3SzOHROXuJSLPXr2jCxPGJlrT8yi3TlJH3EjjKiEyDP/vbO56DHPt1h1OCNTw6FzX6KKeMtD
	L9uNllAtxnuYhwHchPecb0jiXL7cgUYbl6gAPWYksGanceHm7DFu6q+ASqoE4cElmQxlxPBeh80
	eHlQ+5Mzive2KL1/9xm1dEh6/UesR/bdC/vRipSPnKEC37GQISN5+SW4FdwJmdyWKs3KDe+RoAB
	gAbGWgodeQlCACZ3i3zwefWhVGoFk++5o8I7JzVQ0UZPnCtoOl10K4gM22xQwcw9nLDw==
X-Received: by 2002:a05:6102:358d:b0:79f:e8ce:27f2 with SMTP id ada2fe7eead31-7a55af2df71mr615827137.4.1789725725456;
        Fri, 18 Sep 2026 03:02:05 -0700 (PDT)
X-Received: by 2002:a05:6102:358d:b0:79f:e8ce:27f2 with SMTP id ada2fe7eead31-7a55af2df71mr615773137.4.1789725724990;
        Fri, 18 Sep 2026 03:02:04 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2a1bbc6a88sm37992566b.54.2026.09.18.03.02.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Sep 2026 03:02:04 -0700 (PDT)
Message-ID: <82a72918-7bc7-4e2c-892c-0dcdd6dd5548@oss.qualcomm.com>
Date: Fri, 18 Sep 2026 12:02:03 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans de Goede <johannes.goede@oss.qualcomm.com>
Subject: Re: [PATCH v7 1/2] module: add SCMI device table alias support
To: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Cristian Marussi <cristian.marussi@arm.com>,
        Sudeep Holla <sudeep.holla@kernel.org>
Cc: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>, Frank.Li@kernel.org,
        arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, imx@lists.linux.dev,
        linux-kernel@vger.kernel.org
References: <20260918092951.5656-1-johannes.goede@oss.qualcomm.com>
 <20260918092951.5656-2-johannes.goede@oss.qualcomm.com>
 <2104f437-e960-4e55-b0e1-2b37126e8c2f@oss.qualcomm.com>
Content-Language: en-US, nl
In-Reply-To: <2104f437-e960-4e55-b0e1-2b37126e8c2f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: bqMX6Y_b5UcKNmdTaQNqLoNKwzq-3Es9
X-Authority-Analysis: v=2.4 cv=FfiiV5+6 c=1 sm=1 tr=0 ts=6aad0c1e cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=9vOhfBaG-gSLgbD7qJAA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-GUID: bqMX6Y_b5UcKNmdTaQNqLoNKwzq-3Es9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE4MDEzOSBTYWx0ZWRfXz7GLVLa8rZ0u
 bjQLdH6BwcAumtPEql/etmcXXl47c88yJUB2+JJC+pYQlBt/7OeNczTMyY8XorGGLw0rl6H+Tw3
 3GWmKrb6Xme28ubLq9u6pGehWFUqWNKS3uAG80dSg7UwKR4g5Zh7YnLcwoPvkfOAQXuupJFNl6k
 Z7fbsZKrlNjm8JnbifEQR8Q7QtZg8DZG0GYGIDq4orCYngELpVFh2mLVEzpK068glzv8vN1AkZH
 TR71liJrO2oBuvaxdR+Q6QIBxJAj7gam6JI5p3vMHkNpzvy8oFS+8N5tDf0o9bj/eyhOaa6lsqK
 qNY3lKevzhS9yjIYBBZH4cQyvhzcpUN5FtMXFdfGys6jYbiJlqJT8zgHn2ZLi88xGke3gPaxSK1
 VYk6uBbA6nlTMZDWoF1YV+b7B5dDuKIEGmKXgam0nMGrF98fEdiW+PWGDEYZ2qfLuqYFBI8zl3i
 WI9r4yLMEqarFm5T38w==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE4MDEzOSBTYWx0ZWRfX3ylHMhMS1j9R
 f3vp7wcpg/ORf3iUHaVn17xT4HdeZaP5m6y3M2aDjvi8BSBycKMC+ZueD0A+YOuOQ6yIZGuFGsG
 hhqTEPDMVdH3usdsJVjqfkf16jwJ3vw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-18_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 clxscore=1015 priorityscore=1501 spamscore=0
 bulkscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609180139

Hi Daniel,

On 18-Sep-26 11:53, Daniel Lezcano wrote:
> 
> Hi Hans,
> 
> thanks for taking care of that
> 
> 
> On 9/18/26 11:29, Hans de Goede wrote:
>> From: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
>>
>> SCMI client drivers already describe their bus match data with
>> MODULE_DEVICE_TABLE(scmi, ...), but modpost does not know how to consume
>> SCMI device tables. As a result, SCMI modules do not get generated module
>> aliases from their id tables.
>>
>> Move struct scmi_device_id to mod_devicetable.h so it has a fixed layout
>> visible to modpost, add the corresponding generated offsets and teach
>> file2alias to emit scmi:<protocol>:<name> aliases.
>>
>> Use the same stable alias format for SCMI device uevents and sysfs
>> modaliases. The previous string included the instance-specific device
>> name, which is not useful for matching modules.
>>
>> Assisted-by: Codex:GPT-5.5
>> Reviewed-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
>> Tested-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
>> Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
>> Signed-off-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
>> ---
> 
> [ ... ]
> 
>>   -#define SCMI_UEVENT_MODALIAS_FMT    "%s:%02x:%s"
>> +#define SCMI_UEVENT_MODALIAS_FMT    SCMI_MODULE_PREFIX "%02x:%s"
>>     BLOCKING_NOTIFIER_HEAD(scmi_requested_devices_nh);
>>   EXPORT_SYMBOL_GPL(scmi_requested_devices_nh);
>> @@ -185,7 +186,7 @@ static int scmi_protocol_table_register(const struct scmi_device_id *id_table)
>>       const struct scmi_device_id *entry;
>>       int ret;
>>   -    for (entry = id_table; entry->name; entry++) {
>> +    for (entry = id_table; entry->name[0]; entry++) {
> 
> Is it possible to rely on a NULL sentinel?
> 
> Here if the id_table is NULL, entry->name | entry->name[0] dereference the NULL pointer

The NULL deref on id_table is NULL already happened with
the old code, which would deref entry to check the name pointer,

This just adjusts the check to check for name being an empty
string since it now is a fixed-size string / char array.

>     for (entry = id_table; entry != NULL; entry++)
> 
>>           ret = scmi_protocol_device_request(entry);
> 
> [ ... ]
> 
>>   #include <linux/bitfield.h>
>> +#include <linux/device-id/scmi.h>
>>   #include <linux/device.h>
>>   #include <linux/notifier.h>
>>   #include <linux/types.h>
>> @@ -951,11 +952,6 @@ struct scmi_device {
>>     #define to_scmi_dev(d) container_of_const(d, struct scmi_device, dev)
>>   -struct scmi_device_id {
>> -    u8 protocol_id;
>> -    const char *name;
>> -};
>> -
> 
> What is the reason of converting the char * to a fixed array? That limits the name and may result in truncation and potentially name collision, no ?

Because of how modpost works to generate modaliases inside the .ko
any string buffers in device_id structs need to have a fixed length.

So the truncation / name collision issue pretty much applies to all
foo_device_id structs in the kernel. People should now to make sure
that any strings used will fit inside the fixed string. And I would
expect the compiler to warn for overly long strings.

Regards,

Hans


