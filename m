Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792502522;
	b=01bh5KJTeUeQoSpYIqWDA7IJJ39UKaXp+lqhemld1bchJIXsvLiMUEmG0RvyLuFYHrgu
	 LTPaAsxIcZle1+CxZ7B8wEWZuAzrXmOPKTImBPJfD9WTLQWFlIxc0aWp17BNVDTJQtxma
	 XPKhkGPO3lHx1z0frxHpy0YEKdsreBZO+390exjL2P1Qgbubl7SfHINpEae6oKiLjKOZX
	 ewla7fZtLvxWi33OazjptmP6KGN7N+t8xjNrqa+ApgQIMbkcUIJsPBSeojGMAh3+g+uJl
	 DXg37KisbxRpnWU2Tl/Ut5PvD+2oLKkZ00E6o6kwlyvdvvzQyiOvBHhfw9sDa8KubWg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792502522;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=s0zAvqlmsB3t3287vk58YCfF/XdciYklX6cmGUHob6Y=;
	b=2euIxXR0DZAEUXdKmow4DOKBxWf0qXfXQb2keyZzE5NvlN9T+ie/+/5ewUftlhM2LKYm
	 9G9jDI/GOt3deqQ5MG8L4JVqfyJulz6KKKzuUUB9aAF3dw0ttEeQcbYdlEErNKPxcFP/8
	 BaQg0YxW1/c9ArBdHV/WWDnKaknvG0moFOijoldVPvANaILZL+Ccq6io/Q1omQl7w6v9P
	 7K7D8rwegY4Al6AKvNtmfU6KslXTjDkn/cFTGc10S4UW5H8mlNFt0FS0m5ZTGgVfBF+dr
	 9l2uCKiVPo2DaS3aqaj4dvDKTnC3AnATjMnyporpOL8kU93eG+EGFcmkXaa10/bh9YA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Dz90nzOK;
	arc=none smtp.remote-ip=209.85.221.47
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F01BD606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 13:22:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F01BD606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Dz90nzOK
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-48c4649b35bso2685183f8f.3
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 06:22:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1792502520; x=1793107320; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=s0zAvqlmsB3t3287vk58YCfF/XdciYklX6cmGUHob6Y=;
        b=Dz90nzOKbiEOlwfKKlJaHRGcaWmgPWGgCnjEMv3IbSpXvbc6CP26OpKvlhfyO+zbpp
         +vIzrjzZJuVr62zTG0P7CGju+e+znIimuTuGyeXNV4k4l/fBFa3prp+rOaQA0eZ74W15
         H6our6ktLwrxG2P5q5aGckmGTZty/pgoQP8AjJte8UOW75ik9cP/jA8F+Lwkkr4qWdT7
         G2fxx6b60QIXQFs/snDGgqu5Br+ULUcj7XaISNbW9agA0HhUQ2MdMaBP5Jk6YN6LY99p
         NJVqToC7u3M1O6S5kbGXmKAG5AjAb0ZLiZE6IE+J5DBC5uDAMXFjKVd1Ny1uPRUq9D6k
         hhzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792502520; x=1793107320;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=s0zAvqlmsB3t3287vk58YCfF/XdciYklX6cmGUHob6Y=;
        b=a3SvLT8znfd1Ld0CKsC/yb2AkDnBXB3VdaNOGcQ/aP4uPPjLlZQIZdfbLP/N/OX5Ot
         NEer09IeeNNLxaWehGg9tb6kZK/LjnalNuv4U4c79vuNM6wmuGijmoOXYp+ofaDob9kn
         gvPb0F7e05Zf+iZwRRWzkb3llGtQkK1Se8pkUwHFw7KA8LjUpfTQxcynyBbd46CuALQV
         bShs3aGmak5es1FM4+DbSWRWXBv+kaUu85gKnrKmCr9S2AdsTnPWa9ZwFk1tdhI0oC5w
         z7JwN/lqtODCNqWc9z8InsdEBCegUDZN1OydUx6oqu2eyBTBh4b4NpR7Oa6wEBbEgAYf
         yjLg==
X-Forwarded-Encrypted: i=1; AKwUvBwUFW/Vi5sZ/4mzDnbv7nl4KcT0e7T2X0Q4mMD6MLDNWk7xHdgfi2nmULaZwrvKVwRmsrbqqZx7bia+cW0=@vger.kernel.org
X-Gm-Message-State: AFq9FYJrDovBL1d7otjVja89OAe0P1gt2ngSbz/Id9v5Kn/G8ybyq2Ey
	iIYG+wYwURvUvdzVMC8Ksid8Bo6CXa3x8+HxUmVleEePbVGcSt4+btiRV3hTbWY0VTo=
X-Gm-Gg: AYBFou0DwvmFg3uUJBBLq+0XoP715i/+BpyjfjXMYphzlho71+20EMV8PYwbKzrCzi6
	iGjleIF9KnPSCz8xGWVduS5lUrBSFRpCTQeZ6j+UUREf6Xwex16SvYyGlRZWxhYQxp6t+FsqHlv
	+ufnwx9dnF4YsP83UYK0IdtDRaAtIKLY85Jf8KdPfWCVTWMnx1L68CGquBFX1ry2+4xe+iJjjvw
	YGoI9oNEsN01aMWqy2i09dFuxi1MnhjvpopDHCAeBH8JntjOCq70mVOjqkAiGzehWN46xezYAKu
	FG+zbNJzvYGUdBfikIx+6IKeqfW5el3JLva1Z3vAQrtzedh6KR1qSpyQ8Gfs6n6Pbl5HEmzc6O9
	Et5wneOXMfXJsoNgKLCwhsEZegFkKmMyChPQFgDbePFGKg5OMJkyhDQqFvkIbXiYl7ygJyLeBac
	ZXvriS/a6W5XnK5s4y5I3YY1ahs+njd9GGG6BsWeO2RaxKHgA6TrUud0g3+jGtosf2knVWTokR6
	5g=
X-Received: by 2002:a5d:5f92:0:b0:488:7dc6:4e9 with SMTP id ffacd0b85a97d-48e07bb5a34mr23410881f8f.10.1792502520304;
        Tue, 20 Oct 2026 06:22:00 -0700 (PDT)
Received: from [192.168.1.3] ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e1d81035csm6480943f8f.15.2026.10.20.06.21.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 06:21:59 -0700 (PDT)
Message-ID: <89e50eff-5ebc-428a-978c-82ff1fbd3f8f@linaro.org>
Date: Tue, 20 Oct 2026 14:21:58 +0100
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
Subject: Re: [PATCH 16/25] coresight: perf: Support AUX sampling with per-CPU
 sinks
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
 <20260915-arm_cs_support_aux_sample-v1-16-35cf6f297d20@arm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20260915-arm_cs_support_aux_sample-v1-16-35cf6f297d20@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 15/09/2026 16:49, Leo Yan wrote:
> Add snapshot_aux() for per-CPU sinks with overwrite buffers. Shared
> sinks can mix trace from multiple CPUs, making them unsuitable for
> context-based profiling.
> 
> Pad missing trace with leading zeros, or zero-fill the requested AUX
> payload when a snapshot is unavailable. This ensures that the decoder
> can safely discard the zero-filled trace data.
> 
> Reuse the AUX action guard to defer concurrent stops until the snapshot
> finishes. Skip snapshots during sink interrupt handling. On copy or
> restart failure, mark the AUX output truncated so perf core disables
> the event.
> 
> Assisted-by: Codex:gpt-6
> Signed-off-by: Leo Yan <leo.yan@arm.com>

Reviewed-by: James Clark <james.clark@linaro.org>

> ---
>   drivers/hwtracing/coresight/coresight-etm-perf.c | 123 +++++++++++++++++++++++
>   drivers/hwtracing/coresight/coresight-etm-perf.h |   2 +
>   2 files changed, 125 insertions(+)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-etm-perf.c b/drivers/hwtracing/coresight/coresight-etm-perf.c
> index 8020a4d8af18bb669441824cfdb687f4fa299eb4..5e90ed49562c117879780f573072e6b522d9d048 100644
> --- a/drivers/hwtracing/coresight/coresight-etm-perf.c
> +++ b/drivers/hwtracing/coresight/coresight-etm-perf.c
> @@ -456,6 +456,7 @@ static void *etm_setup_aux(struct perf_event *event, void **pages,
>   	if (!event_data)
>   		return NULL;
>   	INIT_WORK(&event_data->work, free_event_data);
> +	event_data->overwrite = overwrite;
>   
>   	/* First get the selected sink from user space. */
>   	sink_hash = ATTR_CFG_GET_FLD(&event->attr, sinkid);
> @@ -863,6 +864,127 @@ static void etm_event_del(struct perf_event *event, int mode)
>   	etm_event_stop(event, PERF_EF_UPDATE);
>   }
>   
> +/* A zero trace size pads the sample without accessing the AUX handle. */
> +static long etm_event_snapshot_aux_copy_data(struct perf_output_handle *aux_handle,
> +					     struct perf_output_handle *handle,
> +					     unsigned long trace_size,
> +					     unsigned long size)
> +{
> +	unsigned long pad;
> +	long ret;
> +
> +	trace_size = min(size, trace_size);
> +
> +	/* Pad the front with zeros to keep the latest trace data at the end */
> +	pad = size - trace_size;
> +	while (pad) {
> +		unsigned long chunk = min(pad, PAGE_SIZE);
> +
> +		if (perf_output_copy(handle, page_address(ZERO_PAGE(0)), chunk))
> +			return -EFAULT;
> +		pad -= chunk;
> +	}
> +
> +	/*
> +	 * Skip an empty snapshot, as equal offsets would otherwise copy the
> +	 * entire AUX ring.
> +	 */
> +	if (trace_size) {
> +		unsigned long to = aux_handle->head;
> +
> +		ret = perf_output_copy_aux(aux_handle, handle, to - trace_size, to);
> +		if (ret < 0)
> +			return ret;
> +	}
> +
> +	return size;
> +}
> +
> +static long etm_event_snapshot_aux(struct perf_event *event,
> +				   struct perf_output_handle *handle,
> +				   unsigned long size)
> +{
> +	struct etm_ctxt *ctxt = this_cpu_ptr(&etm_ctxt);
> +	struct perf_output_handle *aux_handle = &ctxt->handle;
> +	struct etm_event_data *event_data;
> +	struct coresight_device *source, *sink;
> +	struct coresight_path *path;
> +	unsigned long trace_size;
> +	long ret = 0;
> +
> +	if (!etm_event_aux_begin(event, ctxt))
> +		goto padding;
> +
> +	if (READ_ONCE(event->hw.aux_paused))
> +		goto out;
> +
> +	event_data = perf_get_aux(aux_handle);
> +	if (!event_data || !event_data->overwrite)
> +		goto out;
> +
> +	path = etm_event_get_ctxt_path(ctxt);
> +	if (!path)
> +		goto out;
> +
> +	source = coresight_get_source(path);
> +	sink = coresight_get_sink(path);
> +	if (WARN_ON_ONCE(!source || !sink))
> +		goto out;
> +
> +	if (!coresight_is_percpu_sink(sink)) {
> +		dev_err_once(&sink->dev, "AUX sampling requires a per-CPU sink\n");
> +		goto out;
> +	}
> +
> +	/* Skip snapshots that preempt the sink's interrupt handler */
> +	if (READ_ONCE(sink->in_interrupt))
> +		goto out;
> +
> +	coresight_pause_source(source);
> +	trace_size = sink_ops(sink)->update_buffer(sink, aux_handle,
> +						   event_data->snk_config);
> +	coresight_disable_path(path);
> +
> +	/*
> +	 * If the AUX handle was closed or marked truncated, the sink is
> +	 * expected to have notified perf core to disable the AUX event.
> +	 */
> +	if (!perf_get_aux(aux_handle) ||
> +	    (aux_handle->aux_flags & PERF_AUX_FLAG_TRUNCATED))
> +		goto fail;
> +
> +	ret = etm_event_snapshot_aux_copy_data(aux_handle, handle, trace_size, size);
> +	if (ret < 0)
> +		goto fail;
> +
> +	if (coresight_enable_path(path, CS_MODE_PERF))
> +		goto fail;
> +
> +	if (coresight_resume_source(source)) {
> +		coresight_disable_path(path);
> +		goto fail;
> +	}
> +
> +	goto out;
> +
> +fail:
> +	/* Set the truncated AUX flag so perf core can disable the event */
> +	if (perf_get_aux(aux_handle)) {
> +		perf_aux_output_flag(aux_handle, PERF_AUX_FLAG_TRUNCATED);
> +		perf_aux_output_end(aux_handle, 0);
> +	}
> +
> +out:
> +	etm_event_aux_end(event, ctxt);
> +
> +padding:
> +	/* Pad the buffer with zeros on an early exit */
> +	if (!ret)
> +		ret = etm_event_snapshot_aux_copy_data(NULL, handle, 0, size);
> +
> +	return ret;
> +}
> +
>   static int etm_addr_filters_validate(struct list_head *filters)
>   {
>   	bool range = false, address = false;
> @@ -1109,6 +1231,7 @@ int __init etm_perf_init(void)
>   	etm_pmu.free_aux		= etm_free_aux;
>   	etm_pmu.start			= etm_event_start;
>   	etm_pmu.stop			= etm_event_stop;
> +	etm_pmu.snapshot_aux		= etm_event_snapshot_aux;
>   	etm_pmu.add			= etm_event_add;
>   	etm_pmu.del			= etm_event_del;
>   	etm_pmu.addr_filters_sync	= etm_addr_filters_sync;
> diff --git a/drivers/hwtracing/coresight/coresight-etm-perf.h b/drivers/hwtracing/coresight/coresight-etm-perf.h
> index 24d929428633f56f24a114d5bb93b8ac4799ca11..a69eb04a597efcfe630342a410cbf8fea3c4501e 100644
> --- a/drivers/hwtracing/coresight/coresight-etm-perf.h
> +++ b/drivers/hwtracing/coresight/coresight-etm-perf.h
> @@ -89,6 +89,7 @@ struct etm_filters {
>    * @aux_hwid_done:	Whether a CPU has emitted the TraceID packet or not.
>    * @snk_config:		The sink configuration.
>    * @cfg_hash:		The hash id of any coresight config selected.
> + * @overwrite:		Whether the AUX buffer uses overwrite mode.
>    * @path:		An array of path, each slot for one CPU.
>    */
>   struct etm_event_data {
> @@ -97,6 +98,7 @@ struct etm_event_data {
>   	cpumask_t aux_hwid_done;
>   	void *snk_config;
>   	u32 cfg_hash;
> +	bool overwrite;
>   	struct coresight_path * __percpu *path;
>   };
>   
> 

