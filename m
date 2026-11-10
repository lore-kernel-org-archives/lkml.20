Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794324896;
	b=4OE3QKq3LOOYZ5ywtJc2V7Hh18LFcXa+/EWpUY8lQLwhrmAB1N7yHaP6vX8wcBXSQusf
	 rz8Z3mvZiPDH9+myN2dtg5p5LocRDpeWMgjhrW3xcRa7LBqBCuXVTqyEQA5zRjBu8Mdta
	 hR4i6JPkrdtbjt9mWV0FFNGo9ARDTrdm2JQcHYBsekPoxP5bwDd6s/mNNTiiiZBxxJom7
	 aqjFyaUJ8NTnoXj5NVAAjPUVOrCK2xqmrR0Ugj1Sq+7KtnWce4SPHy8ldCjxhA32Wf2ZG
	 Nj3roIRMoTA8dDJMp6R6i7y2iI6PJbWXPS1xcK5k0/11kXI3PQm7ktYptT1HUyxyNrw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794324896;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=f1LNHAFVlJ4bgCx5jvWZ9/1xooFZxhmenlQGy0ip0GE=;
	b=YjOif3XjFUwszu5l0qLjb5zybNXWL4vdXPqNsKlG0D24bzxi6EJHpWCPIwIdCf0GXS4e
	 ssH+GCPYdfjWcW9UTWFl3xzoZ3kd+CWFitY2bEWaAuVfw+oLgv8q4bNE/Dtv6pDBzux7b
	 vAtiODd77zHxwQ4N56Pb/KXsj07YkJL0ClHNIkebT7mcIUERGTShRhAitF9acOxfTQUQj
	 smD/75k+5StULI2fahtPKkfMfb7dUKxGYfLdJb94YA1cyL82dK9b6hYLiAWwb6PmGBb6G
	 DbVTOyAOTAIvcXYjcqvalaEtlC5i1AVSDS8hev0WMGYGvajz8MUaRAEUwIC3m3lhO0w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=m5VTLCZC;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36B3660A2617
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 15:34:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 36B3660A2617
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=m5VTLCZC
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a2167bd087so21766805e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 07:34:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794324895; x=1794929695; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=f1LNHAFVlJ4bgCx5jvWZ9/1xooFZxhmenlQGy0ip0GE=;
        b=m5VTLCZCpHvXZm4BGjLIoaNYQIceFYq4GPnaWWpngGEbYC5/2S4nYPxqKliIRHnj2X
         msZBytC9coNTXCzztMdkkSBZHV6SH82NysYgOqxmJ3IRM1FsSXFE6IeVXdxmrovkxUdm
         dlkRFb0IZ8LRwtGMdHsQdxKBFXwP3kSNlktgOlJTt5vj8vvKtcwsgo/2x2SnySMYJjv5
         oc7U4++ASWdkE8WzonCWOXzIebx6WuiGqMC4OGguouA9wOw3P84dJKIBPseOMW2JTNiR
         MobCajo8XffJEASVhe2RP3iKO59kzXUN/xNF31Db196yIF7xB4A427nRsG4jeuAzwnDv
         kqww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794324895; x=1794929695;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=f1LNHAFVlJ4bgCx5jvWZ9/1xooFZxhmenlQGy0ip0GE=;
        b=t+rHBIgsE2Rk+16Tso5TUtnAx7tRepiHcpYeeu2OvXG2enfigpt8oQjX60L5eSMbN5
         Hv4sJSu3kTEW0HV6wUiOFqbraZ1linuovZL0eVumRYz3cHsAD/SMxHKQ1hNv+lwsLI0s
         NvX8DURmpLU5JN65gwN0dnsz79yrdmsWyD01pI4W6ig68l8zing9NZvLTVK+r+/nHyii
         j2JR8NavMJqb1CJSxyRgQBDpwutGJgI2NsPOsW991H1j/nSzB8fZzrNulc3XlROVhjQH
         4iMt/cI5DTO2/e66qof2qQY98ug5VHPq01WlToVr6sH7GwTPP7+jVztvOl4kAhIzBR55
         UNtQ==
X-Forwarded-Encrypted: i=1; AL+hErFL/G2wjkL2q4SmpyJQprDiSTQYEcUiUyXP/FEpLXQWsQrocP3N4ZSF7HxU7rCqGV8gxxkGs9F6jvOF4n0=@vger.kernel.org
X-Gm-Message-State: APuU4Z/eA/mW5FuLEJ0u99pqCpIeobsSMjwX+i2XHyflJ3vvf4YhsthA
	sxohqw0wqPAAOJ5Q2F/hcZpwzYUuv6qlPvB5/VSdD+8R3sSWFTSYpjFNEwBWdVf/bv4=
X-Gm-Gg: AYBFou0V2xsk6Mt9KwJ6D2UvHZTR+HRsxgD2XDU8l4HIp3E1cQ0iB7cboBHfSc2GkBj
	vrmDX+32tj9+dUBZoz4Hnt2CJx6WpFOkte3AlKEeKRuQ9EBwwNj2FQX5q1ryuthcPwYYgxc+rk7
	PJwu9DvM2fu2Y7C9iRdCIp3eeNY8HsQBiQEQMqYLrJ6IWovq1iwjSLyytj9LR5SJHedga0KJaij
	W0Jx1Lyh3yiyJ+yV8/1IU/r1o8YagCt6GFOUHmkjZDVVrLbTaWiH02XzSow8XbQglnmLmsSS5nE
	7wYOZiHkUYRukshCWZz7YvTw/xVnzZ8NI11RKm3dKp6KmpBs0S+WZ2W6eMh3CVzjOaipS3D8kF1
	B/a9DV5M1cjAziWNr4hS0MAscML+AETtBgbyvbfRMz7+2bxC4D7agv1hIbRwupBQBVNPF0dk7oM
	Q+Dx/abdEBoWil6uMiMRnaPCH8XRcmkGxKEuHlRHZ/25xiFQl7eMxXEqv0x5ZFCuTqBFfL5xDV+
	m5U+ct2PbpGMRo/eEW2p+LritJ3bDyCALo9jjcTmRDkNlSioyhqomFqR4qAbIgY72144+hPaVNj
	WLPCAfSR0aiyraMNlxFY8xrfD7FNoks4qA==
X-Received: by 2002:a05:600c:34c7:b0:4a4:f48e:78fa with SMTP id 5b1f17b1804b1-4ba02344f3fmr47924145e9.12.1794324894569;
        Tue, 10 Nov 2026 07:34:54 -0800 (PST)
Received: from [192.168.1.3] ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba0234a5dcsm72076655e9.2.2026.11.10.07.34.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Nov 2026 07:34:54 -0800 (PST)
Message-ID: <9c366f17-8fb7-43b5-99ac-092f14d4b4a7@linaro.org>
Date: Tue, 10 Nov 2026 15:34:53 +0000
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
Subject: Re: [PATCH v2 20/23] coresight: trbe: Add fault action argument to
 trbe_handle_overflow()
To: Leo Yan <leo.yan@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 coresight@lists.linaro.org, Suzuki K Poulose <suzuki.poulose@arm.com>,
 Mike Leach <mike.leach@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Tamas Petz <tamas.petz@arm.com>, Tamas Zsoldos <tamas.zsoldos@arm.com>,
 Suyash Mahar <smahar@meta.com>, Amir Ayupov <aaupov@fb.com>
References: <20261016-trbe_enable_disable_irq_handle_refactor-v2-0-3f57cf3199b1@arm.com>
 <20261016-trbe_enable_disable_irq_handle_refactor-v2-20-3f57cf3199b1@arm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20261016-trbe_enable_disable_irq_handle_refactor-v2-20-3f57cf3199b1@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 16/10/2026 17:55, Leo Yan wrote:
> Add a new argument to trbe_handle_overflow() for the fault action, which
> is used to compare the wrap event for trace size calculation.
> 
> No functional change intended; this is preparation for a later update.
> 
> Signed-off-by: Leo Yan <leo.yan@arm.com>
> ---
>   drivers/hwtracing/coresight/coresight-trbe.c | 7 ++++---
>   1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-trbe.c b/drivers/hwtracing/coresight/coresight-trbe.c
> index f1f102df6c387f53feaa12b89d3df89f734afcdb..c83c440d4ac13c346bc2a7f9093951c186c90157 100644
> --- a/drivers/hwtracing/coresight/coresight-trbe.c
> +++ b/drivers/hwtracing/coresight/coresight-trbe.c
> @@ -1132,7 +1132,8 @@ static void trbe_handle_spurious(struct trbe_cpudata *cpudata)
>   	set_trbe_enabled(cpudata, trblimitr);
>   }
>   
> -static int trbe_handle_overflow(struct trbe_cpudata *cpudata)
> +static int trbe_handle_overflow(struct trbe_cpudata *cpudata,
> +				enum trbe_fault_action act)
>   {
>   	struct perf_output_handle *handle = cpudata->handle;
>   	struct perf_event *event = handle->event;
> @@ -1147,7 +1148,7 @@ static int trbe_handle_overflow(struct trbe_cpudata *cpudata)
>   	 */
>   	clr_trbe_status();
>   
> -	size = trbe_get_trace_size(handle, buf, true);
> +	size = trbe_get_trace_size(handle, buf, act == TRBE_FAULT_ACT_WRAP);
>   	if (buf->snapshot)
>   		handle->head += size;
>   
> @@ -1253,7 +1254,7 @@ static irqreturn_t arm_trbe_irq_handler(int irq, void *dev)
>   	act = trbe_get_fault_act(handle, status);
>   	switch (act) {
>   	case TRBE_FAULT_ACT_WRAP:
> -		truncated = !!trbe_handle_overflow(cpudata);
> +		truncated = !!trbe_handle_overflow(cpudata, act);
>   		break;
>   	case TRBE_FAULT_ACT_SPURIOUS:
>   		trbe_handle_spurious(cpudata);
> 
Reviewed-by: James Clark <james.clark@linaro.org>
