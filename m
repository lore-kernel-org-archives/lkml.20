Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B1A0496D2C
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 09:25:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792401933; cv=none; b=m6ZdYoCds9ZzUG9OD7rVwUQOQlPlmqi1BXJFJw3jfj48aYZkAhu0xxZQFnWDozAg+LAbYyQxuxPtnY3X6sckp0cYzuPMymh4Wdk2G6ZQ/R5rb2wrswtuQowavAFc51QdwzKJ3ht09c1BJldpQ99qviytDQmjLmrSDI4EAYxgVq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792401933; c=relaxed/simple;
	bh=5QpX00F+cW0Oor63CyADvDjpW6mm4yVKdrs0dUpPj20=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NDZ1hwjVeZmu8abf9h/QuA7rE2sN805lnbpNrzEANVQi9mylsHrj7iaH8d1YaaQv229+w1YzWxwDeWODW/rUGVV6dQGSuHZuWBqAcbT3sGBQoVJBAi8ZhD453VO5vRH5D9bniKPzglv1cfGCGyPNcaUdscFY40Qp5f16X/iuR4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=N2UxCCKw; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="N2UxCCKw"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a1dfd49525so10356755e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 02:25:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1792401929; x=1793006729; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Rj7uwc+EKzyLJl2slhVkFCcJ8uKjGpCu+rX2woYwvYU=;
        b=N2UxCCKw7IkNja23ahPKgmLrz2ZoHuik4pPDuHjrZcbDanQM0f4CGdA8vjU4DN1N/g
         sH3qFXlu5EAMQLGTaPcUiOgRdjHiBCTTd8zm1PuXqfiWRjLX+T6Gy14Dw8j1otlz1CcL
         1oadgt0rUbFPh+pYN0dCmENtnsJ2kX93dExylov5bkfnt15c9wgAgQQ0xOImS0BnczRM
         UwJYel+yMIJsEOmZyQ5rnKVoO7jnR495MKjd8UdnvvL2y7mYd1f/8WnienzVl5aCN+mt
         msESwtG5qhPlfVcgXqe9aZMIkxkeCxStUWmP5r3Jz04GhxLO9eBZZ/kzZWAkvvXKubs2
         ecxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792401929; x=1793006729;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Rj7uwc+EKzyLJl2slhVkFCcJ8uKjGpCu+rX2woYwvYU=;
        b=ovy2f9K8ma4x7P3qUocyQgZZguy2lzrvaAGXyxZv6GiGhiCPKY4LF5H4YUk8blfMrx
         QU8KWgqIKiSzaLGGV/qUjpI+mD8sPSIJF4CPv1j6SnfJuvJnUX+SitYjLkVDx02wtFi2
         g398fAczaKZM1ru2VHskekvEGpagyuoFDWD/2au2wBBhIvd37WZ+h8LVe/TlBhfvyqzi
         vwd/EL4qoeJRBCAVE/VAH6zLcEphhmwZzlxGPYs+jmVqy4kYJwh3A3nhtxc+k+VfFVuM
         JKETZxAWjJNFwbVajQo06N/7cI+HS8B33WiJzf4YQWaN446M9d70L5T3lJqsyckJT4PU
         1CtQ==
X-Forwarded-Encrypted: i=1; AKwUvBykmO2FrpYBIDOl4+Bq16sE8/R7ceRUG+gWadgH+Epv1E5p/ZIfuIggAf4Hf9xClifMqJ9BuJtKfPTZS/U=@vger.kernel.org
X-Gm-Message-State: AFq9FYIDyyFe08lM2w9W/3i4CVKx3cztnOXZAtS8r58JO/hwH/qGKHez
	fNxo/iSGQc77khWnYfcWdf5LlNgpnFlxG353SiACSGPDoVdCw36wnbizobLLdyQd4qY=
X-Gm-Gg: AYBFou3nLNMJB3mhZ2Ts3iy8s+ZVWuckGTxPLcM9FP+RFuqtrTMKkpNvw0mY6UeWNE+
	G9RlCmtqoRNWicqQHQiA55K+qw6Hp8e8sGOXiE2AAFUQCdooXRq6r/bj8z7bhcjFUvRC1vmYJsW
	nfC5mtejTzuNqDyi/QbrM24yw5RQVmghnZO5y60fHwujBolTmIsG5rW9okH/UbUyVeoVujIhgIt
	GVZfxBpIE4brjGKeHG82TOlBlYP4Qwu8m9GE+nNL7hgEplG8IjUabOHYzpYM9DuQbDLj2MQPyhn
	qkIsqlg2wwrSGF4vUPhc6JZzb6izf5KXiNcmukwNZ+q5vs67E5XdanMFNUD/sHOp+SlaI/XHutT
	vJKoWT418wSU/8MuNx/Xv7yJnN+c5DimFdGo/1R1LEAtvCrwgA8uxYwvKq7DAgZeWC4KGa6Lorq
	7Fa5iYbHhODK5DKEnckvLA0jwt3nyWT3iZLIoN9G8yp5a0ScRUb5y04bnFlKYGZckxU/og5o1KP
	VU=
X-Received: by 2002:a05:600c:5488:b0:4a1:992f:d0e7 with SMTP id 5b1f17b1804b1-4a1d75fd4d0mr152515455e9.16.1792401928632;
        Mon, 19 Oct 2026 02:25:28 -0700 (PDT)
Received: from [192.168.1.3] ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1cf983b88sm258881895e9.7.2026.10.19.02.25.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 02:25:28 -0700 (PDT)
Message-ID: <76c6cc56-08bd-455e-bd32-63cb024924dc@linaro.org>
Date: Mon, 19 Oct 2026 10:25:26 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/25] coresight: perf: Validate the live context through
 its path
To: Leo Yan <leo.yan@arm.com>
Cc: Ingo Molnar <mingo@kernel.org>, linux-perf-users@vger.kernel.org,
 linux-kernel@vger.kernel.org, coresight@lists.linaro.org,
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Arnaldo Carvalho de Melo <acme@kernel.org>,
 Namhyung Kim <namhyung@kernel.org>, Ian Rogers <irogers@google.com>,
 Adrian Hunter <adrian.hunter@intel.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@arm.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Yeoreum Yun <yeoreum.yun@arm.com>, Jonathan Corbet <corbet@lwn.net>,
 Suyash Mahar <smahar@meta.com>, Amir Ayupov <aaupov@fb.com>
References: <20260915-arm_cs_support_aux_sample-v1-0-35cf6f297d20@arm.com>
 <20260915-arm_cs_support_aux_sample-v1-7-35cf6f297d20@arm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20260915-arm_cs_support_aux_sample-v1-7-35cf6f297d20@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 15/09/2026 16:48, Leo Yan wrote:
> etm_event_get_ctxt_path() returns a path only when the per-CPU
> context has published event data and that data contains a path for the
> current CPU. Perf PMU callbacks run on the same CPU in atomic context,
> and only the normal stop clears the event data. A returned path therefore
> establishes that the pause and stop callbacks have a live ETM context.
> 
> The AUX handle has a separate lifetime. It can be absent after an AUX
> transaction could not be restarted while the CoreSight path still needs
> to be paused or disabled. The handle is acquired for the callback event
> before event data is published, and another ETM event cannot replace it
> while the published context remains live. Thus any active handle belongs
> to that context, and etm_event_update_buffer() uses perf_get_aux() to
> determine whether it remains valid.
> 
> Remove the redundant comparisons of the handle with the event and event
> data, together with the redundant event_data check. Use the path to
> validate the ETM context lifetime and perf_get_aux() to validate the AUX
> handle lifetime.
> 
> Assisted-by: Codex:gpt-6
> Signed-off-by: Leo Yan <leo.yan@arm.com>
> ---
>   drivers/hwtracing/coresight/coresight-etm-perf.c | 15 ---------------
>   1 file changed, 15 deletions(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-etm-perf.c b/drivers/hwtracing/coresight/coresight-etm-perf.c
> index afd22fd4a851e600ab69fd5b6883e6f8518b2cab..c7454da5c881c4a8eea5cc77902c9113c297096e 100644
> --- a/drivers/hwtracing/coresight/coresight-etm-perf.c
> +++ b/drivers/hwtracing/coresight/coresight-etm-perf.c
> @@ -698,9 +698,6 @@ static void etm_event_pause(struct coresight_path *path,
>   	if (coresight_is_percpu_sink(sink))
>   		return;
>   
> -	if (WARN_ON_ONCE(handle->event != event))
> -		return;
> -
>   	event_data = READ_ONCE(ctxt->event_data);
>   	etm_event_update_buffer(handle, event_data, sink, PERF_EF_UPDATE);
>   
> @@ -728,14 +725,6 @@ static void etm_event_stop(struct perf_event *event, int mode)
>   		return;
>   	}
>   
> -	/*
> -	 * If we still have access to the event_data via handle,
> -	 * confirm that we haven't messed up the tracking.
> -	 */
> -	if (handle->event &&
> -	    WARN_ON(perf_get_aux(handle) != ctxt->event_data))
> -		return;
> -
>   	event_data = READ_ONCE(ctxt->event_data);
>   	/* Clear the event_data as this ETM is stopping the trace. */
>   	WRITE_ONCE(ctxt->event_data, NULL);
> @@ -743,10 +732,6 @@ static void etm_event_stop(struct perf_event *event, int mode)
>   	if (event->hw.state == PERF_HES_STOPPED)
>   		return;
>   
> -	/* We must have a valid event_data for a running event */
> -	if (WARN_ON(!event_data))
> -		return;
> -
>   	source = coresight_get_source(path);
>   	sink = coresight_get_sink(path);
>   	if (!source || !sink)
> 
Reviewed-by: James Clark <james.clark@linaro.org>
