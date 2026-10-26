Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793007448;
	b=VY5jcTVIDJ2/+a8nPFCs5hGIYD2lXkQnxqteZ5lMo3jpoPHUChqG6lnVCseHN+NDP/jn
	 CyNaUJrhZnCoQEucXTLZqqMuqK5T7BHQTUiftRRrT7YiWj/026uDnGhS7chI6FEd/L70Z
	 TPIqh3cf+jkovdZyDUwNrT5I/HYQmeWuFIB+P0qtpeO+LE8HtLS78ZR9vbKmnTL0Xw0wu
	 cBEBIllK5z0MlB9CDpMTorSy6qdiLM1S5jo7xYTg8ftBEX/LAr3eQ4TMmTWwBwD+2NaqT
	 x7kUoVQuPkf+AGP46+UVjejsEo2Lrhb+dDnPhRlgcBHKqiJoyZf5PpGbHMWxtG+jc5w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793007448;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=V0PxtI+uEAhVBAWQKpyvj24AYTBUji0RB6U5PTo7niU=;
	b=NYw28WIl7YRHvzvy0jVqmL0p0gs8b6ekBq6n3LvSA4OJj6La4ZHAtoNFZCJEW1a4iGw3
	 n4z59ME3A9SdQDyRK/0G+hyQ3e5ef4PXQ3ynC2DfVQqUnNIyXPzuGtyww0foLTmjesKDY
	 DmxhnI47ngOUNfcKlzqmdCWfL6ju5cEzpI9rueeBl3Spg7hCipc0t+GaCq88jR7ZdVECb
	 RDZAUU5+CFzZvazOHOH86pCwPRDGCLOfkgMhaL9S3oKZfC3wTrNwvY80sDQ+5ZgjDM0Yj
	 kJr6zJazvEWqikY3c7L+T8wHEv8JxBRvbeNJjdMG3B3oSbY84Y8KQ9REZEmSblax+WQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=tLf+eDyC;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D55F3606A31B
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 09:37:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D55F3606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=tLf+eDyC
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a35d5d4a20so15162505e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 02:37:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793007446; x=1793612246; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=V0PxtI+uEAhVBAWQKpyvj24AYTBUji0RB6U5PTo7niU=;
        b=tLf+eDyCrqkusRn4LesJuB4DaDDh5/20b7Ue98qaLBaWiRTiOG0IbPjyJjMjTYiwLg
         dG08uCjck78bfH41rpV2uiyRlUzy2d5tv+1dehSR/g/AXAbVjTMOGtKej5MUjryp6PHO
         u8598BsZxuD0XuUcH+Gzv3Mc65o3jEZlmaDNhJbnM2vzwtb7cu3mPasSSql4UpYGJB9P
         hBR69WATa8I9YFSDMTLYtWkj06NsFAMep3lUE30OCPqLyZUc7r/JeCRXZZK7nRa5ypTK
         CcrNvxxovTAwTyHJqHq0DjWfwPKi+GhZBbnfsagbyd5p69+wW5WCVI5MHae6IxwsgaHj
         En+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793007446; x=1793612246;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=V0PxtI+uEAhVBAWQKpyvj24AYTBUji0RB6U5PTo7niU=;
        b=V6VvsGeBv5CgEIdtdAjI5/g7K9ioFg83caFVT8XQ6IHEV0vpOoAZe48xCGW+kp8hPD
         ro4ZNtgdV2sk4spmFClmBgkSD7OntRRraWAI8q879ont9CZ1L9wqQMK+QZBxGEgMjHmR
         0n68NgFE44JsQkOEmzBM1qPPE2ysJT7YylZIb0A561Zu0HpNSNaZas1krr6Qymm+T2ju
         eW87OQ/0gugm0I38Rpa4Gvv2ZJVD1zedh6LTE3IXVkcM+Wyi6PfbTpZWkhlVpMpvqBfd
         qB4oz9cVySC2DVjEcS72tA7WkLoyaPZm5NXq66u0Copi6nSWRsJqNWX91u2f6ocG7Db5
         VR7Q==
X-Forwarded-Encrypted: i=1; AKwUvBy+u4SZ3HDmSpZ3J4Hl9sKVZy88xWmaMh32fpX2n+i68CZdjx8h82/YgsXyfWKY5fl3DXlKOPuf+PrFzzA=@vger.kernel.org
X-Gm-Message-State: AFq9FYKtzNbMtU/pIXetHZCh2IO7r9CRyKsxnqHn0CdRCn3/dFVk1fvb
	/SIkcZ6KWmOWQZo83/vBiJKe3lpKexroScIZzqM6eW/Q0OglDEAKnqL3JzrLtTr2PU4=
X-Gm-Gg: AYBFou3+81geoTXAThfKTqk7ybuL2HbGLouzye7hSClwj9uzKNaZE5J44a8j5FddmmT
	qGFgtWJOtJmAt4TA6yxYoQ3xcs6yroX9fwYE/Pq86fLmv8AiS5pj9gnYhWC8S1sUm6z4xbGvIqW
	mQX6F+VCcuZssz4lAM39O0f1SRwRyudrormb1zjQcG9K1vJ1N92/fNDPN4Rlza1aNiXy/A/7pi/
	cmuDuXdZ+JQjZm3Bqzoi7gts5S+TkwFQumjoDTUJyhBvAVuGX4CyS6mHeR002jGIq2WTQVE9PsO
	UN/4Zigolgt1fiiDJqoDkV/zI3mw943wubi7ytOHPpqkU1u+21MoecckM/FBO7a9acBA2uf3lYU
	/RHvAj1zc29LPO+PlXOHoX52rtvfOfk020OubNK2wL6scB/lX6DvyNytHkcnyeesEPbJXN3oLkw
	zKIDqG2mqbV1LmdLK+c5R7jG2UvuIbHDNbIi41UcGtd2yhnuGbDEQ5GbR/DlZHXXA0Lg+NITP97
	qoKtag2hgJKADnFMerhXHJ10VVMh5KhwMMcMSGDulxFvjJSSumILfcAp5pX
X-Received: by 2002:a05:600c:4704:b0:4a2:1612:637a with SMTP id 5b1f17b1804b1-4a35acbd575mr121663115e9.16.1793007446278;
        Mon, 26 Oct 2026 02:37:26 -0700 (PDT)
Received: from [192.168.1.3] ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebcb958sm15638434f8f.21.2026.10.26.02.37.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Oct 2026 02:37:25 -0700 (PDT)
Message-ID: <84e1c5ed-cb93-45b6-8cf1-6c6778efe412@linaro.org>
Date: Mon, 26 Oct 2026 09:37:24 +0000
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
Subject: Re: [PATCH v4 1/7] coresight: etm4x: Fix event count decoding
To: Amir Ayupov <aaupov@fb.com>, Leo Yan <leo.yan@arm.com>
Cc: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jonathan Corbet <corbet@lwn.net>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Randy Dunlap <rdunlap@infradead.org>, Shuah Khan
 <skhan@linuxfoundation.org>, Daniel Pereira <danielmaraboo@gmail.com>,
 coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-perf-users@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Suzuki K Poulose <suzuki.poulose@arm.com>,
 Mike Leach <mike.leach@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>
References: <cover.1792907332.git.aaupov@fb.com>
 <cover.1792989860.git.aaupov@fb.com>
 <4d45171946cf41751215e8c1cd9a8b14d38d3159.1792989860.git.aaupov@fb.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <4d45171946cf41751215e8c1cd9a8b14d38d3159.1792989860.git.aaupov@fb.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 26/10/2026 05:48, Amir Ayupov wrote:
> From: Leo Yan <leo.yan@arm.com>
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

Reviewed-by: James Clark <james.clark@linaro.org>

