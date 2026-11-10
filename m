Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794323530;
	b=wQ4LvCYcaA0RCDVvaverOw0C7Rx7v2TZuDf66sTXi5BLe9rucn5aePcke5Rnl0AHuu56
	 zLOsph6BJXdbaiP2gTOORc/Y4tB2pzvZtQnwRfisEoBemi5OOG4+eHZJTrWSUVE8p4dj7
	 7RkEGpDsdqUoqfubXKsTJplH+qPiP4xuLjSrzeQpkNar8cCvTkSzTyLgS6PRVMk9DAyFv
	 c3zlefEmhuHe3x9JxNnHU8hT6lfceyeILQwT62i5QY/oQcBCpudMek4fk/xroNH2YSqGd
	 HbQGjBgySjvCfeJq7IrXKO7iqiVa470sus9esx4ncYewNVFtU3rcK+CuYMdpvYv6yuA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794323530;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=sJhBd9A00CF51bJNi2AfMlK59AYx2EoWRCtJUHTymgo=;
	b=IdQRoM6DeSO8Tc5ZYcQ6s15ZOlEFg/Ck+/8OfXVSJ4+yrIYKPnm46mJpcjQE1p6FzwEX
	 Ruzu86rXlxR916Od33MgnveJMFP9xN0lOgpa/fJx98s5mv4M7gj9WF61NjYZk1Z8eaqdO
	 cozaWWHs8Gd1QdNqWBeKl6nf7bjhDQNRiH3gakiweN0bALLQbU9tMHs5kEo04EoN9WFYG
	 KQ5LXBfbfjzMg+h7OnShfNHyo9uCT2ImCL6K39OOv+CfmRXGFb1Vea32Zo/MJP1tItfE9
	 0SsN4BsqJ82RWv0JOtCGhL9QXTTkw8BU/4fvv+LYkHV92bW5hbKCJyxuyjh6OnnbXqw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=ITkO+ppe;
	arc=none smtp.remote-ip=209.85.221.54
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BDF4606A325
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 15:12:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1BDF4606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=ITkO+ppe
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-490d59c3f0aso1143483f8f.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 07:12:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794323528; x=1794928328; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sJhBd9A00CF51bJNi2AfMlK59AYx2EoWRCtJUHTymgo=;
        b=ITkO+ppeE3xJl184U+oUIoTFLQCpQKyQFddCLeNxSJ9/ygwyOldiM/kIDCgamreSK3
         4nkOpdfhKfZWbH6s3RGS+2TE22KeM2bTwzr+LMu63eW2j2ZoITbRIAsU0DDVJGhkieIt
         lu1qMPoqzZtfJQkDqTRbFPuxfsbDklBCBpRaH4gbULBqyINqfqPQbkkVbdkWoF6kSIgk
         G4v1BI0KPAbFVDitMS5n8XL9JNLj5HelOZ0BMw7QaSip+Uj+l2Lu5+gBigy5r9YstYoJ
         nYQh+Tm1BdSS8s1E8HMAgYTC363/hF/4ov7iryHrhxJcw+TaurlC7Atdmv9WkzTC/pQz
         ybiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794323528; x=1794928328;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sJhBd9A00CF51bJNi2AfMlK59AYx2EoWRCtJUHTymgo=;
        b=i+56JtbJ271BpYlxDqiGidBc5VzknVJyFFiwPIrussmPdfPOozo9T4VuYHw2fjLRGz
         pKqmzR0eJYZUCc6a8y+t+UPOcfbZsYDnvjjZ8zhlG+idEoJFLaYPUH/tlFBCAUyc3dhi
         VTbDj5vFeU2h0Duqj4HjY57YRTwkp/sOZ1qBpxbMVo7CNuW6KEyeX23oEr2Y4dvb1O1r
         3qFMG1nksWW4xwLoBQvqv5ZWcfCJhbiabQ8WIObknHyQGd6jcbETK+Ej+3e7Eqzywez5
         Qsob+APc4IjjW1Z0e6MKpJWYvXeb9IUsuagYEUtikDMHWuNPSWcbkxNlF85Uyun3BV/X
         WDHQ==
X-Forwarded-Encrypted: i=1; AL+hErFoFue6yPV/Ppu4PmlsltzY+qH7FkyVkVm6mm/wI9LBd4ypHf4zqAdMQUYbBoFc7n+UWkRU8jEWJepqGjs=@vger.kernel.org
X-Gm-Message-State: APuU4Z/z23mdnl6DRfzScGe6lhkZsXa+sAgE2Tnj82xCl1hhcbw0Bici
	6wDzG0AogKxjjWQ+p1vlpWHxtW4VHyJ29yfllOaWYkyacCM0wI6WTzwj8dB9A373hJ0=
X-Gm-Gg: AYBFou0GGMDq+/OhaFNEIy/P8ZRqBtAPwErjFz7gEnD4C7Fhw2BoKOYGeE8/4l/pg5y
	IKCZVElP2anN3/GWLvNrItjAQFmUGvObKet0aJQzwH8CzTt36IXOR9cE1USg/8VRGZrf4o4qZQ3
	86x65YdeqBeKbeauiBT+ChOqNOz4X8SmDZUJxkY5vkZIbjMh5OrXjKGkzslEej5LG0sJuyDbbmE
	bU/E/Z4/GKv7SYbDgQK2/jD4tq+3knf9DEmgfz0JQ2vGZ3LU/Q7hzOkGpAtd/XWZKQxDYHgR7l+
	qc78tVTtA5mn4TdD79oJ9Fr2thoZ3HozaHras0ok4K6ZL4msbNEVKiNVq/JlFVVRwTgEaCj4KSL
	F3u4hfK7wLqs/gLNe3FtsQZA8HWcmcN/US8o3eVjFjv1ssyofL08k82ntjpANuTqWhY6d+eSNcL
	67RZAYC5pYm8MqmXNCEztiMfBa6bGkNsH/gBUvuls+ki+dEePNRMa5T1UL08+y8pgbyL0MgW2R3
	Cvj8TcmXcPFCKPVdIRhITTJ7Qwr/lykWnz29sELhjIc5KlAlcV2zIgP78bOVjTcWO7OCPOmPQEd
	Dx3eydsfX/jbk2lzloOV240nlj1GaQcd1g==
X-Received: by 2002:a05:6000:2087:b0:48e:d27:bef2 with SMTP id ffacd0b85a97d-4982fd3e412mr5251630f8f.21.1794323528401;
        Tue, 10 Nov 2026 07:12:08 -0800 (PST)
Received: from [192.168.1.3] ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4988bdef64dsm4024165f8f.20.2026.11.10.07.12.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Nov 2026 07:12:07 -0800 (PST)
Message-ID: <d93b9120-197d-4b01-a9ab-8df01657716d@linaro.org>
Date: Tue, 10 Nov 2026 15:12:06 +0000
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
Subject: Re: [PATCH v2 19/23] coresight: trbe: Reload the AUX buffer on
 overflow restart
To: Leo Yan <leo.yan@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 coresight@lists.linaro.org, Suzuki K Poulose <suzuki.poulose@arm.com>,
 Mike Leach <mike.leach@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Tamas Petz <tamas.petz@arm.com>, Tamas Zsoldos <tamas.zsoldos@arm.com>,
 Suyash Mahar <smahar@meta.com>, Amir Ayupov <aaupov@fb.com>
References: <20261016-trbe_enable_disable_irq_handle_refactor-v2-0-3f57cf3199b1@arm.com>
 <20261016-trbe_enable_disable_irq_handle_refactor-v2-19-3f57cf3199b1@arm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20261016-trbe_enable_disable_irq_handle_refactor-v2-19-3f57cf3199b1@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 16/10/2026 17:55, Leo Yan wrote:
> PERF_EVENT_IOC_SET_OUTPUT lets events share another event's mapped output
> buffer. For AUX events, this also selects the associated AUX area and
> sink configuration. Perf normally establishes this sharing during setup.
> 
> Consider the following hypothetical live-redirection sequence, permitted
> by the inspected perf-core paths. P is a parent event and C is its
> inherited event, with C->parent = P. A and B are mapped AUX destination
> buffers owned by separate, disabled cs_etm events in different task
> contexts. All three are per-task events restricted to the same CPU, with
> compatible output settings. P has no mmap of its own, allowing its output
> to be redirected while A and B remain mapped through their owner events.
> 
> 1. P's output is redirected to A. C inherits from P and begins tracing
>     on the selected CPU, so its open AUX transaction and TRBE hardware
>     both use A. P can be inactive while C is running because their
>     events are scheduled with their respective tasks.
> 2. A userspace controller calls PERF_EVENT_IOC_SET_OUTPUT on P to select
>     B. ring_buffer_attach() calls perf_event_stop(P, 0), which returns for
>     inactive P without stopping C. P->rb now selects B, but C's existing
>     handle and hardware still use A.
> 3. C's next buffer overflow invokes trbe_handle_overflow() from the IRQ
>     handler. It saves buf for A, ends that AUX transaction, then calls
>     perf_aux_output_begin(handle, C). AUX begin follows C->parent and
>     reads P's current rb, rebinding the same handle to B.
> 
> This is a hypothetical API sequence, not a reproduced TRBE failure or
> an observed buffer switch in normal perf record operation.
> 
> Without reloading buf, __arm_trbe_enable() calculates the next buffer
> using B through the handle, but its workaround and hardware setup still
> receive A. If B has never been enabled, its missing CPU association can
> cause the normal-offset calculation to dereference NULL. With a snapshot
> buffer, hardware may instead keep using A while perf accounts output to B.
> 
> Reload the sink configuration after perf_aux_output_begin() so the buffer
> and handle refer to the same AUX transaction. If the buffer is missing or
> its CPU association does not match the interrupt's CPU data, truncate the
> new transaction and leave TRBE disabled. Truncation requests perf to stop
> the event; a subsequent normal restart installs the buffer and its CPU
> association through the sink enable path.
> 
> Stopping inherited writers during output redirection remains a separate
> perf-core fix.
> 

Shouldn't we do that instead of this? It seems much better to fix this 
in perf core rather than here which is hard to understand and appears to 
be a bit hacky, and doesn't apply to all users of aux buffers. I would 
expect that even when using PERF_EVENT_IOC_SET_OUTPUT, the buffer should 
be consistent between start and stops from the point of view of 
individual drivers. It makes sense to add a workaround in the driver if 
we can't control that behavior, but the code is in the same repo. Maybe 
we could even just leave this patch out and do the core fix later?

Unrelated to this, the sashiko report that says there is an out of 
bounds read if the output is switched to an ETF buffer seems to be 
pre-existing. But it's something worth thinking about.

> Signed-off-by: Leo Yan <leo.yan@arm.com>
> ---
>   drivers/hwtracing/coresight/coresight-trbe.c | 14 ++++++++++++++
>   1 file changed, 14 insertions(+)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-trbe.c b/drivers/hwtracing/coresight/coresight-trbe.c
> index 2328aab0a084a0ac123e950f846f404d120ec2c0..f1f102df6c387f53feaa12b89d3df89f734afcdb 100644
> --- a/drivers/hwtracing/coresight/coresight-trbe.c
> +++ b/drivers/hwtracing/coresight/coresight-trbe.c
> @@ -1161,6 +1161,20 @@ static int trbe_handle_overflow(struct trbe_cpudata *cpudata)
>   	if (!event_data)
>   		return -EINVAL;
>   
> +	/*
> +	 * Reload the buffer after perf_aux_output_begin() so it matches the
> +	 * handle. A race with PERF_EVENT_IOC_SET_OUTPUT may select a buffer
> +	 * that has not been installed on this CPU and has no valid cpudata.
> +	 * If the buffer is missing or its CPU association does not match,
> +	 * truncate the trace to stop the event. A subsequent normal restart
> +	 * installs the buffer and its CPU association through sink enable.
> +	 */
> +	buf = etm_perf_sink_config(handle);
> +	if (!buf || buf->cpudata != cpudata) {
> +		trbe_truncate_event(handle);
> +		return -EINVAL;
> +	}
> +
>   	return __arm_trbe_enable(buf, handle);
>   }
>   
> 
