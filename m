Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792748983;
	b=vJxOZ4c/vOJDLb8003OIrnOLhVIVEwHwl2aafWDvDOqg06GP+CN45UOa8zJlm+ESkQwq
	 1eYAvDz1u6kfQ1CqOPvgBScvhoD38cEdc9CMCG1cWbS3UD5kLodAzUpUFRFIqLXQ6BS96
	 DiF2th6SwYXXpYsWZBRIXHzZfKuHigdLdJ0aZGPB30sdRfx4x8Qq5LIQ1KPu0+nwOnpdJ
	 lWh5p43BA73RgAT5WegKYmIjobrhgzYzuUQzbtg8uZxCb7deEJVdfIG3hF0ECZ54utyEe
	 F0ql2bjEsjbdtY1xH0IpZLJ0ciZ42Qab0etpxTeKxNrf4/vHkAICZMGloZ9kH2XExew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792748983;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=z78MqIHDK60vritw6uCBZEava4BYph884iz7OBBTNM8=;
	b=epdADIYJMfE7wLhf/0pir5TXU44tB9sLAj8lVj1SYSn+aBCzxSMSTq9Td6iE44ImGXI9
	 izqO7SbQVZUlwNi0rR2mDDntNAO071+Tb8jc116eZ+46LOXkY0p659N3g/q5WRbVjfdLy
	 HUw4dSrHxx6Q9R1oT5HV3njyVfQs+eOl9nj3LelKsGSzlrQoH8tP8TVzb4L5g5no91fjV
	 NR+V08OfJe2Y8s/cfJhTh9RfnxE6DaeCJTtfw29yHIaxH7uGnDWZvdxopuSZ5RH44YJld
	 BjQl3XDkcU1pEIKyTLZKCMUms/dzRcBKC0tn5kbsN6PSAnFVknOWK923/OFpIluXZtA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=QOT0oLAh;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65312606A31D
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 09:49:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 65312606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=QOT0oLAh
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a1fe9efc0eso7098475e9.2
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 02:49:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1792748982; x=1793353782; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=z78MqIHDK60vritw6uCBZEava4BYph884iz7OBBTNM8=;
        b=QOT0oLAh+FeYwcTkoAfVaGLY/v1gV4rsyp0CG7wb6tyeWo53uQsnK3CwAfICpxPr+T
         ZgMQlodOxZuqNFSMzPNDlakYZe+M0Xs6rIlVOd4uBZeODJJRu2Aj71IFlrY/fIVMH0C5
         qZd40lddHdmoPcNP7jJoTXwe4HbYteKKjTpZQDztK7XRuOdxkHWf1585ctxEns7iq8/3
         OObTGNf9j3xDjIMRvOGPMXu4S+lhFuxf/i4JsA93AGJH0J24oLs+2O2ptK6gaCppnYKt
         p0HtW0OtexsJS2REv4yIjlrjma0V2nwHiyo8wvZE0qRFam/QLgX7WE48/3Kbqb9v1WiD
         XFGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792748982; x=1793353782;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=z78MqIHDK60vritw6uCBZEava4BYph884iz7OBBTNM8=;
        b=cK8sOUi6bo5Xqs70e+wDud7n7jBXOrTleG4zTonzcAk+kq7y2V+vHG2AkL1+1kweDy
         UyeT/OMXnobMnaUe+qNftfJ6d/jGzXdbr9rIxXEpXCDhvT2SiM+EQSaf8DkeBlGNrWN8
         WLSTna3qBCdIzlSY9sWenA3yGo53H2zgOa3aR6GLHvu647vbDKHQoDZL4eaptalW3dw8
         ozqId19Pt5jiAVGQy7ioD6oBrQRFveqEq3ZV91rXKzx+BECVkZummC52VEayWeZC/Ssi
         g/MDCfqytRyLswWPd40xj6XUIuCNcFI2aWt+qrWMns8rRwDdLcp1nMHlGTpEy6xqG91x
         VSkA==
X-Forwarded-Encrypted: i=1; AKwUvBz+jQeK9+NEpUR74fKPDl0R7idSSi6PqoAcHgyEPzdqHp5RBo+CNHBVadsMZsbafNIK0Ffo41mZS3Vpvrw=@vger.kernel.org
X-Gm-Message-State: AFq9FYIeqXhRhUrMKR72vStlUbNTTzFuU8auGmxRzNr5WPWwsTPIOZJS
	2DatUiX359jw0Z7c05LLKD7cy+DYcNH+xedjkX7ZmyiVa4r87rje2JdxOiZi73jvSeM=
X-Gm-Gg: AYBFou22Uj/UMG0BRqEfoV65G1X8CrJzxICtnr79oZ96tz/Y1QkcxAf0+UGcX1D3Efu
	/ASyx4oku27SkgSkxdsFp0FfeR3eJSnSi7MW3DEShE/UIzA9DDt3vG+/ntPf9BTEQ6WYZsXJ9a5
	3bzL9LKsPyj5RXurGlesCyKp/6poAXX1AzByM2AmDj9RogY+MtxFk377e4wpZLyeCjd1m3oq2GA
	LqdFV+V0znA7bdczNxBK5UWWI5f+QZvrRzi6pySPmUKZMylAMWfip+VAyc8mHAggGCaCWPtr8zP
	1GqhtFkmnGqTasDkmKY/FRw03L9GaUY7KScJDYyI7yw1GrzUoI9UMjmHfI1HgQt51lNOIBMf+e8
	uL/d/nve/kIkp2dkbCzOmLMdXJPKJOiJQh+8oIJhdPwON7Zu4YHSLmam22rf+/d+v69uofieX5L
	Kp9kpnVuOFtXJ5if/x9yRL2TGyXywSvZU3U5Q+P5+k+2gIeb4lVgN53SOeM9KRclkiOh7lZxnO7
	IJ0j33WBuIM19MVuPGZ+pybtopdonb6AUjL7duZTvyZuuUJwjjXsL3KJEe4
X-Received: by 2002:a05:600c:3e0b:b0:4a2:150f:1601 with SMTP id 5b1f17b1804b1-4a2150f1703mr22409525e9.12.1792748981720;
        Fri, 23 Oct 2026 02:49:41 -0700 (PDT)
Received: from [192.168.1.3] ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a2103622f0sm64638015e9.6.2026.10.23.02.49.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Oct 2026 02:49:41 -0700 (PDT)
Message-ID: <024bc6f1-eb73-4f01-84f3-738bf68bdc93@linaro.org>
Date: Fri, 23 Oct 2026 10:49:40 +0100
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
Subject: Re: [PATCH v2 3/4] coresight: etm4x: Report the external outputs the
 PMU counts
To: Leo Yan <leo.yan@arm.com>, Amir Ayupov <aaupov@fb.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach
 <mike.leach@arm.com>, Alexander Shishkin
 <alexander.shishkin@linux.intel.com>, Jonathan Corbet <corbet@lwn.net>,
 Randy Dunlap <rdunlap@infradead.org>, Shuah Khan
 <skhan@linuxfoundation.org>, coresight@lists.linaro.org,
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261012230527.750567-1-aaupov@fb.com>
 <20261012230527.750567-4-aaupov@fb.com>
 <20261021164332.GI26205@e132581.arm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20261021164332.GI26205@e132581.arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 21/10/2026 17:43, Leo Yan wrote:
> On Mon, Oct 12, 2026 at 04:05:22PM -0700, Amir Ayupov wrote:
> 
> [...]
> 
>> --- a/drivers/hwtracing/coresight/coresight-config.h
>> +++ b/drivers/hwtracing/coresight/coresight-config.h
>> @@ -35,6 +35,10 @@
>>    * a device that matches one of its classes and has all of its capabilities.
>>    */
>>   #define CS_CFG_MATCH_CAP_MASK		0x0000ff00
>> +/* trace unit external output n is countable by the PMU as TRCEXTOUTn */
>> +#define CS_CFG_MATCH_CAP_PMU_EXTOUT_SHIFT	8
>> +#define CS_CFG_MATCH_CAP_PMU_EXTOUT_NR	4	/* TRCEXTOUT0-3 */
>> +#define CS_CFG_MATCH_CAP_PMU_EXTOUT(n)	BIT(CS_CFG_MATCH_CAP_PMU_EXTOUT_SHIFT + (n))

Isn't this recreating what GENMASK() and FIELD_PREP() does? Can we use 
that instead?

> 
> We can just use a single capacity for all output singals. It would be
> good to follow the naming convention in the Arm ARM:
> 
>    #define CS_CFG_MATCH_CAP_TRCEXTOUT            BIT(8)
> 
>>   int etm4_cscfg_register(struct coresight_device *csdev)
>>   {
>> +	struct etmv4_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
>>   	struct cscfg_csdev_feat_ops ops;
>> +	u32 match_flags = CS_CFG_ETM4_MATCH_FLAGS;
>>   
>>   	ops.load_feat = &etm4_cfg_load_feature;
>> +	match_flags |= (u32)drvdata->pmu_extout << CS_CFG_MATCH_CAP_PMU_EXTOUT_SHIFT;
>>   
>> -	return cscfg_register_csdev(csdev, CS_CFG_ETM4_MATCH_FLAGS, &ops);
>> +	return cscfg_register_csdev(csdev, match_flags, &ops);
> 
> I would suggest to enable the capability bit base on drvdata->caps:
> 
>    if (etm4x_is_ete(drvdata) && drvdata->caps.nr_events)
> 	match_flags |= CS_CFG_MATCH_CAP_TRCEXTOUT;
> 
> For now, we can enable TRCEXTOUT for ETE only, as this should be
> sufficient to detect the feature safely. I'd like to leave this to
> James and Mike as I got suggestions from them.

ETE only makes sense to me.

> 
> Please also rebase onto the latest CoreSight next branch [1], which
> moves the capability fields into drvdata->caps. I found an issue in the
> decoding of caps.nr_event; the attached patch fixes it and makes the
> field hold the actual event count.
> 
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/coresight/linux.git branch: next
> 
> ---8<---
> 
>  From 95307fa0574b1e0b3922ffa23fe98144b2688496 Mon Sep 17 00:00:00 2001
> From: Leo Yan <leo.yan@arm.com>
> Date: Wed, 21 Oct 2026 17:05:18 +0100
> Subject: [PATCH] coresight: etm4x: Fix event count decoding
> 
> TRCIDR0.NUMEVENT normally encodes the number of events minus one.
>  From ETMv4.3 onwards, including ETE, a zero TRCIDR4.NUMRSPAIR instead
> means that no events are implemented and NUMEVENT is zero. The sysfs
> event controls currently interpret this combination as one event and
> allow writes to unsupported event fields.
> 
> Decode NUMEVENT after NUMRSPAIR and store the actual number of events
> in nr_event. Use the decoded resource count so that older ETM versions,
> where a zero NUMRSPAIR represents one resource pair, still report at
> least one event. Update both sysfs event controls to use the actual
> count and clear their event fields when no events are implemented.
> 
> Also correct the instruction event enable mask for the single-event
> case to use INSTEN[0]. The existing mask uses INSTEN[1], preventing
> event 0 from being enabled.
> 
> This change depends on the recent driver refactoring. With no reported
> failures, it is not intended for stable backporting.
> 
> Signed-off-by: Leo Yan <leo.yan@arm.com>
> ---
>   .../coresight/coresight-etm4x-core.c          | 13 +++++++--
>   .../coresight/coresight-etm4x-sysfs.c         | 29 ++++++++++---------
>   2 files changed, 27 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
> index e21be6468e954..af017bd8a5477 100644
> --- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
> +++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
> @@ -1451,8 +1451,6 @@ static void etm4_init_arch_data(void *info)
>   	caps->trccci = !!(etmidr0 & TRCIDR0_TRCCCI);
>   	/* RETSTACK, bit[9] Return stack bit */
>   	caps->retstack = !!(etmidr0 & TRCIDR0_RETSTACK);
> -	/* NUMEVENT, bits[11:10] Number of events field */
> -	caps->nr_event = FIELD_GET(TRCIDR0_NUMEVENT_MASK, etmidr0);
>   	/* QSUPP, bits[16:15] Q element support field */
>   	caps->q_support = FIELD_GET(TRCIDR0_QSUPP_MASK, etmidr0);
>   	if (caps->q_support)
> @@ -1519,6 +1517,17 @@ static void etm4_init_arch_data(void *info)
>   	caps->nr_resource = FIELD_GET(TRCIDR4_NUMRSPAIR_MASK, etmidr4);
>   	if ((drvdata->arch < ETM_ARCH_V4_3) || (caps->nr_resource > 0))
>   		caps->nr_resource += 1;
> +
> +	/*
> +	 * NUMEVENT encodes the number of events minus one. From ETMv4.3,
> +	 * including ETE, NUMRSPAIR == 0 means no events are implemented.
> +	 * nr_resource already accounts for the pre-ETMv4.3 encoding.
> +	 */
> +	if (caps->nr_resource)
> +		caps->nr_event = FIELD_GET(TRCIDR0_NUMEVENT_MASK, etmidr0) + 1;
> +	else
> +		caps->nr_event = 0;
> +
>   	/*
>   	 * NUMSSCC, bits[23:20] the number of single-shot
>   	 * comparator control for tracing. Read any status regs as these
> diff --git a/drivers/hwtracing/coresight/coresight-etm4x-sysfs.c b/drivers/hwtracing/coresight/coresight-etm4x-sysfs.c
> index db9e603f97ba8..fb38f0102290a 100644
> --- a/drivers/hwtracing/coresight/coresight-etm4x-sysfs.c
> +++ b/drivers/hwtracing/coresight/coresight-etm4x-sysfs.c
> @@ -513,19 +513,22 @@ static ssize_t event_store(struct device *dev,
>   
>   	raw_spin_lock(&drvdata->spinlock);
>   	switch (caps->nr_event) {
> -	case 0x0:
> +	case 0:
> +		sysfs_config->eventctrl0 = 0;
> +		break;
> +	case 1:
>   		/* EVENT0, bits[7:0] */
>   		sysfs_config->eventctrl0 = val & 0xFF;
>   		break;
> -	case 0x1:
> -		 /* EVENT1, bits[15:8] */
> +	case 2:
> +		/* EVENT1, bits[15:8] */
>   		sysfs_config->eventctrl0 = val & 0xFFFF;
>   		break;
> -	case 0x2:
> +	case 3:
>   		/* EVENT2, bits[23:16] */
>   		sysfs_config->eventctrl0 = val & 0xFFFFFF;
>   		break;
> -	case 0x3:
> +	case 4:
>   		/* EVENT3, bits[31:24] */
>   		sysfs_config->eventctrl0 = val;
>   		break;
> @@ -565,22 +568,22 @@ static ssize_t event_instren_store(struct device *dev,
>   	/* start by clearing all instruction event enable bits */
>   	sysfs_config->eventctrl1 &= ~TRCEVENTCTL1R_INSTEN_MASK;
>   	switch (caps->nr_event) {
> -	case 0x0:
> -		/* generate Event element for event 1 */
> -		sysfs_config->eventctrl1 |= val & TRCEVENTCTL1R_INSTEN_1;
> +	case 1:
> +		/* generate Event element for event 0 */
> +		sysfs_config->eventctrl1 |= val & TRCEVENTCTL1R_INSTEN_0;
>   		break;
> -	case 0x1:
> -		/* generate Event element for event 1 and 2 */
> +	case 2:
> +		/* generate Event element for events 0 and 1 */
>   		sysfs_config->eventctrl1 |= val & (TRCEVENTCTL1R_INSTEN_0 |
>   						   TRCEVENTCTL1R_INSTEN_1);
>   		break;
> -	case 0x2:
> -		/* generate Event element for event 1, 2 and 3 */
> +	case 3:
> +		/* generate Event element for events 0, 1 and 2 */
>   		sysfs_config->eventctrl1 |= val & (TRCEVENTCTL1R_INSTEN_0 |
>   					     TRCEVENTCTL1R_INSTEN_1 |
>   					     TRCEVENTCTL1R_INSTEN_2);
>   		break;
> -	case 0x3:
> +	case 4:
>   		/* generate Event element for all 4 events */
>   		sysfs_config->eventctrl1 |= val & (TRCEVENTCTL1R_INSTEN_0 |
>   					     TRCEVENTCTL1R_INSTEN_1 |

