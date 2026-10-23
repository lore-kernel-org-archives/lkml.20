Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792748510;
	b=XSLGHRg5oPVPTD5aJ+CGV9tJ+qFXQuDFPMfsLkSrgw4xsTlc+EXcJTJ122VKKEpCELYu
	 p5i8jiGX6PuByYW+O+fpPGL6RKzluBHgM9yOY4QU/LbT0G6GqQy4wfkNcG2b3nLW9Gcnt
	 9DA2gP8nJ2O6Ot13lxUgWWO8EEx3yLBuIWX8GZSfldEaqjeUQXwrK6H3OkbUZzilITTbw
	 zSeFNse9VahlFy37xtBVEqEJakjh1iDPDEhQkXT9FqD/yUwv0N+PYCT2qJtwmAnqnIzba
	 w1vvu4Zb2ZEBQb702m36xtjzFKPKBrrtVgTDYESr/8uPBceGzkR94Ni2G+/JhWjVVBA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792748510;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=fFF2D3oBqdNknTwvIUSmhanyWdoVvDAzBCNug1HGEEE=;
	b=sSz7xgALzTfHVjQp6PEzKeSo7dvPUinAZdOJuINVzeHf8WNW0cKTkJQ2XA9aJ58ZNm9k
	 ftzSmgzQxPKDpPT86qBDGgZDMRhgbQk4Lx+HEYLUqZNPBTLwbekMQO2XXry6ICkomLSoo
	 vTQSgEs0fay/GtB49Yzsr4aB7D6OVt4+w2azRzZS5c3MBkn1tc3Y86VJIhf0YXPCkYJ+d
	 S5iI3l401ZKJ58PxdjmbduPkqxgDxo1RH6w+fWIPtuzP0AH2T9HJxiF8NnWPy2oM4Q3tf
	 mxKFZaR6UnrzeXzs1bN0kfj3tPpCx49GeOAhN33V9XRktTCDivWOQIW7nRtcBI65DxQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=TkvX+h7X;
	arc=none smtp.remote-ip=209.85.221.49
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFBCA606A31B
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 09:41:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AFBCA606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=TkvX+h7X
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-48b042c0759so442280f8f.2
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 02:41:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1792748508; x=1793353308; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fFF2D3oBqdNknTwvIUSmhanyWdoVvDAzBCNug1HGEEE=;
        b=TkvX+h7Xkk2HUR49N4l/o6Ds0SyYryi2t1fJuBwjn/dTIhFnUsLkpc2kzkaFSQtYsK
         X6d8S1uL0t9v1u0q0f+V3NzoMi1jsdPpMUiWIpr1PVD15HG8bcCyZu+x1xjBB8qiT7gx
         xj5QJt7t+wUR0wbIGGAuwErl6j7kozJMIM0v+5+q+eahtvMTP5gh9mSFP/j45ERwiV3K
         F4gt6SQK84EuAiSkppXPIEUuFqIM6dVdMcmjcpMKj37BJ3fwlbvUUpZdDSrbw2Vnj7wO
         vt52xX1SF+Y+OPQPUOaR0O6FLrLDM9fhVYEAGTD2TcQbb88RSeVE0WoSM5EE2lC1B+0S
         NE+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792748508; x=1793353308;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fFF2D3oBqdNknTwvIUSmhanyWdoVvDAzBCNug1HGEEE=;
        b=mm6U/ET+gam1sovwvE9BBu3Rj00W6l5K7pcj6R5yJ9DGtO1AaPlB/M4D93jArd7aJo
         CUpUjVWQGixdhF8QgSFmu7VjWa0imBTeNVkDoXO2gYJ5rxQXjoyPZ+bz5mDlXS6MwxXP
         9E8xE9f0jw6fcKQiJg4hjJNuBUPlFdjiVZdOPXx/DdEq82KKg9Q0uvj+sxv0JTrY7Ii/
         59X6gOM8CO3/bsoU9Kdom7JP5WqfbQOyLu4aKZH2NmVE5jTNaR9YZGghZxlAfXmavUOO
         jMcVTKSUhDvQD5BE4zvA9Be4Bu5vaifWB7sS/FvHvZTPMHy6rbLuhQZaYqVYYDKStvHk
         StRQ==
X-Forwarded-Encrypted: i=1; AKwUvByUQ9tbwyAD+GxRhTZsCxRD8GmVdvAcK2IuFT/Eadl9HUWyiVNX9lOar5k/BISZPUjeHc6TRJwS1NyPuHA=@vger.kernel.org
X-Gm-Message-State: AFq9FYISpw3mh0Tvdr3pmMk9yO9hjav4g2NThZgn7p7bR4yD0F+031of
	jf+6EcdjGOhCBR7jz+673wRP+/waeQ5U+3h4+Gps+++WZxs1Zm0P5dNzp42JMhxwKhI=
X-Gm-Gg: AYBFou1lpairTZscXXv//SMadU1xC3V/QBaS7QCJbyZcRzVrz6c7hjVsmKvr7nbQVYg
	gJepuZFQPXZeYpg2PT1dXCkUUQRVTE8ekEqSL+mnlN3ugqLh9fbO6MHQr7Gu3Xv1EjTDdii8jWm
	hNAo7UnQIS68d49MtDFQP8XyOSKHY78Aym6K9iumwuM7PWmWVVl1W0WhL19Fm4DauFDwgx4mqW2
	zpUIp7GWlxfqhl3qQPxO4fmrUgseGn2TObsAoQx3ft/NyjJfNWF3Ar/YO0hSQe7QTseA4I6+Z0Z
	AqoVLw/OEambbrD36cgVQmtP8gY5MvwPsHbLuifTT8XS3KPjwFUwdIgxLWbb9mu/o17Knz17LrB
	/9a3Be9qekAbKOUFnaft3tS9TOh3tFh0HTTsrurSc692i3dt+x4wO4n4VWSaHWJlaNM8g9EWVQZ
	zssZHMJDyPUBBm6e/b84CBBRakdLSpSnLxUccMo5PCYG4AqxsmCRbBVnP29L/MQIQJeUDRY9Sqb
	6UjrhpVW4ilvo95oYaW6fA4asEkWgvMNKbJnjoX04hFdJKh9r6XZfQkSpoR
X-Received: by 2002:a5d:5d10:0:b0:48e:21f7:79ff with SMTP id ffacd0b85a97d-48e3859d173mr2609746f8f.33.1792748508060;
        Fri, 23 Oct 2026 02:41:48 -0700 (PDT)
Received: from [192.168.1.3] ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e37eded3fsm3913978f8f.7.2026.10.23.02.41.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Oct 2026 02:41:47 -0700 (PDT)
Message-ID: <8ae9c5fb-a481-4437-baf0-6610d8131b3f@linaro.org>
Date: Fri, 23 Oct 2026 10:41:46 +0100
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
Subject: Re: [PATCH] coresight: etm4x: Fix event count decoding
To: Leo Yan <leo.yan@arm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Suzuki K Poulose <suzuki.poulose@arm.com>,
 Mike Leach <mike.leach@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Amir Ayupov <aaupov@fb.com>
References: <20261022-arm_cs_fix_etm4_event_count-v1-1-588b2922a546@arm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20261022-arm_cs_fix_etm4_event_count-v1-1-588b2922a546@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 22/10/2026 09:11, Leo Yan wrote:
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
>   drivers/hwtracing/coresight/coresight-etm4x-core.c | 15 +++++++++--
>   .../hwtracing/coresight/coresight-etm4x-sysfs.c    | 29 ++++++++++++----------
>   2 files changed, 29 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
> index e21be6468e9544fe6e22f524de4fef9f89d7484f..b0e286f487017a4155595f14cbb9c9c33b17dc6b 100644
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
> @@ -1519,6 +1517,19 @@ static void etm4_init_arch_data(void *info)
>   	caps->nr_resource = FIELD_GET(TRCIDR4_NUMRSPAIR_MASK, etmidr4);
>   	if ((drvdata->arch < ETM_ARCH_V4_3) || (caps->nr_resource > 0))
>   		caps->nr_resource += 1;
> +
> +	/*
> +	 * See ARM IHI0064H.b, sections 7.3.32 (TRCIDR0) and 7.3.36 (TRCIDR4).
> +	 *
> +	 * Before ETMv4.3, one event is always implemented. For ETM v4.3 and
> +	 * later, NUMRSPAIR == 0 indicates that no events are implemented.
> +	 * Otherwise, NUMEVENT encodes the number of events minus one.
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
> index db9e603f97ba82cd608d3d61881fe8153db020ff..fb38f0102290a53a681934c827abf107c141a740 100644
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
> 
> ---
> base-commit: 343cfcbb3ecfdb80aa576a428cfa3b65ad783842
> change-id: 20261022-arm_cs_fix_etm4_event_count-49f384a2f6a7
> 
> Best regards,

Reviewed-by: James Clark <james.clark@linaro.org>

