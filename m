Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794324919;
	b=x37fWvcOkSkejORJ+VvyL76izcYiY52HyUNV+aQiSlGc3/AIRFkkeYysgEvDLsOL3ccf
	 xPFw7a770c46Ndx1MT4HX5HSdvFpovugY2KVCuZqwhBQuFLUK7cB3zw3DHs+o9LFJbM0L
	 MVkS9SxgIFkslHamUtZUTDN3Fznr3FYNnF+x2lCmnbz2Av5tJvdHJ3E1Cl+UAP98gw7UY
	 Cj6gRqrga6r1oCstlrPf/XP73U02mYtMtXA5Ov9pLLT3Gaj/WWkazadbusIwGqoFcMH3T
	 OSikhVFzA+ocvVAgDW/FAJLnSglJwYdFYMFgPGqWAmP5SxpyXbxGOOwcCUkchy2T5cA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794324919;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=NNEimUxoh8N9f7kKCUbQLMGpNQjJl22yyVS/gX08dYA=;
	b=RxegPnMxzolyo/2yU++gBzBH0ul1iIJ/elZboK6bDxQJkPx4RUaV5nkaNzGyHqHQiRbY
	 2iX+SsfTTiJrYZev/KWsuS2bvN37RzUlvM1cQHOt7F+Au4oYdVLwJQX8qZwZ1rgHWDQ5h
	 hQyumn4rSu0icvv2iNiK54R7IiaDuo3dK70D6Xnxe4seZtvtxEoBKFTx53x9rOW2X9Q3K
	 qT2PcrmCf9wwnjEQgRQICYilq+KgOF2v4P8NpEXlITAEnp3Qw1XwFM78oEnNg6ob/8Yyt
	 jn1OWi8qeAuX79NrJz5944QW1/b9hmZvODTlogAtMa7AAvZeNrfejkNZrYuJAkCb9Kg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=VCUqIkih;
	arc=none smtp.remote-ip=209.85.221.49
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D49860A2614
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 15:35:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0D49860A2614
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=VCUqIkih
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-492fcbfaa87so1432287f8f.3
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 07:35:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794324917; x=1794929717; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NNEimUxoh8N9f7kKCUbQLMGpNQjJl22yyVS/gX08dYA=;
        b=VCUqIkihC4tv4gwOPn2BZUClikoj18ItpBX3loWHFmUu5KQBx8AcB73R0HlLx61gfY
         2zzv8ltWwsuvu/+bg4HPmCO4LK8TKtTeBHwB6GbDkXsudxWph3HVqShoid/xjRhmPjOG
         l1OnWJL83V5IJMuoVcHOWewqfVEUVd8jY2srqAjEVl1+TeXMf7eUBEci+AZc2bLPtMRk
         BgMdE+1TJYwV+Iw1t5z1x5wCoPFT7m29vGIMhxLAMoCHsOjmYukOLZfYjriVCXrD/O6U
         7UcUC1hN9F4DOpShihbnhzHMDghrDtZeyKzbsRvW5Tl6TIPN2WNkK2rF02UzIyt1zZWf
         nREQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794324917; x=1794929717;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NNEimUxoh8N9f7kKCUbQLMGpNQjJl22yyVS/gX08dYA=;
        b=TG0oNpQ/5pHiGP6NrtL5oVGiT44u6c2xMTX4JVbUQUxFc7/zzwOT12Yy6qCu3P5SXj
         QA1NiyhCQ6FDes7SoAkz8HpmI3ir0CCjTFLEGahUbRbFx/LahsliIsGKSOI9d1xXk2fN
         qGFK40TlRjdoA/nighdVIDXa1Dr6qrahXTNSuWsJkTiGt8YeqCVjg5CzVr+aveNbvQUD
         5ZAHm/ESx+H6qh1pqUllY6HwwzyjBucjjXvgBI0je5MkwnqsgMmfFRP5APy6uAfLkQ9U
         +Z550cMDYOVNoB5mZqRmV/Eq2zwyR5jFd5Q9KD8c5+FZTiAEhUsRc8XN+yyi+7SomYVf
         5jBQ==
X-Forwarded-Encrypted: i=1; AL+hErFae6t2x/QrFt13Z80E38kRyHcNjRJWKECeUqOAJQE/T7oG5oLjL3sfaTD9kXAJ1bRAkaNkVvFsbz853ns=@vger.kernel.org
X-Gm-Message-State: APuU4Z/+Idmg96R5CLZ9wx09aaRxEoEg77yJANoCvc46eY7dJBJepLwr
	+Q3Yt3KDiBvj5geXm6ni/dPUh5ufab5wZJOe+nZSkBlqlLvefele8U1WGtlsjr7f/3g=
X-Gm-Gg: AYBFou1Hfxs+0Ug3LVRGiYPZy+TR0LftvrmitaQ6snQxwrcxc4/IWh+GBBWiURlXDK5
	ge/L9tg3pIZjtdVoBobCfjOBgoWaGAQ6xKl3CsdDudfEqRs8mxX8sIxATDch8Ys0GQu0eMLW+bg
	Pob0a7FUis3dB1pZhWVEiWjdBBbhSuWrTavjkARxIf7Z6Xa5IMXnLAu8e1pR4gy4beMRqKI5IDl
	Wx3boeK8uqkI3kH8DIE8nnpt040qGAI1qnqj8ueTJ9CE44Me2o+RYOYJl1E+AA09d1RGrK+0g9C
	/9YmR7NWKC5tPYLQORz0uThe2wMmB6QVbM6Imoa6Q8W3hXZgEXTCY8b0uVpPwc7IhqcHgK6m0CX
	vEaly6QKUjQ7DAIh/Ggonh6b3zKg4JFPlcVue9Qic/a//VjlSlh5ksMPA8u4Og8zxa2oBzOXFnY
	zgLzFxl4xb2hZ88aTBJQLTwRkgh9QuudI3ck/8j/rErMBQI5DdyT9hv/g2eg7HSKpx4YQdW8/Tk
	JviIfpsMs422ytz2JXKMRopWcXR+z6DMEMjvGA3VASsMyRA5WotqEP8lZgqFqgrE2akF1cNESR+
	Zu8y5nLYSWiRT5OpB+A=
X-Received: by 2002:a05:6000:4709:b0:48d:e5c9:39a4 with SMTP id ffacd0b85a97d-498302fb5camr5282051f8f.33.1794324917314;
        Tue, 10 Nov 2026 07:35:17 -0800 (PST)
Received: from [192.168.1.3] ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49895f4e6ffsm4392423f8f.16.2026.11.10.07.35.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Nov 2026 07:35:16 -0800 (PST)
Message-ID: <71dd5516-495e-44e7-baa2-c38c544835ac@linaro.org>
Date: Tue, 10 Nov 2026 15:35:15 +0000
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
Subject: Re: [PATCH v2 22/23] coresight: trbe: Restart trace source for
 stopped buffers
To: Leo Yan <leo.yan@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 coresight@lists.linaro.org, Suzuki K Poulose <suzuki.poulose@arm.com>,
 Mike Leach <mike.leach@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Tamas Petz <tamas.petz@arm.com>, Tamas Zsoldos <tamas.zsoldos@arm.com>,
 Suyash Mahar <smahar@meta.com>, Amir Ayupov <aaupov@fb.com>
References: <20261016-trbe_enable_disable_irq_handle_refactor-v2-0-3f57cf3199b1@arm.com>
 <20261016-trbe_enable_disable_irq_handle_refactor-v2-22-3f57cf3199b1@arm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20261016-trbe_enable_disable_irq_handle_refactor-v2-22-3f57cf3199b1@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 16/10/2026 17:55, Leo Yan wrote:
> When TRBSR reports a stopped buffer, the IRQ handler closes the current
> AUX buffer and programs TRBE for the next run. This creates a trace
> discontinuity. User tool has to reset the decoder when moving to the
> next AUX data block, which can reduce decoded trace coverage.
> 
> Stop and restart the trace source around TRBE reprogramming for stopped
> buffers. This emits ASYNC packets, allowing the decoder to recognize
> discontinuity without a full reset.
> 
> This duplicates part of the trace source enable/disable code in the
> ETMv4 driver. Reusing that code would require splitting the ETMv4
> callbacks into finer-grained helpers that TRBE can call, which would
> make the change much larger. Keep the TRBE change self-contained for
> now.
> 
> Signed-off-by: Leo Yan <leo.yan@arm.com>
> ---
>   drivers/hwtracing/coresight/coresight-trbe.c | 121 +++++++++++++++++++++++++--
>   1 file changed, 116 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-trbe.c b/drivers/hwtracing/coresight/coresight-trbe.c
> index 36f143a15e680b28aa6ca6a43ad7d3ee134693be..6bc82d5b55539795059da37039d2929b4ea504e3 100644
> --- a/drivers/hwtracing/coresight/coresight-trbe.c
> +++ b/drivers/hwtracing/coresight/coresight-trbe.c
> @@ -17,9 +17,11 @@
>   
>   #include <asm/barrier.h>
>   #include <asm/cpufeature.h>
> +#include <linux/iopoll.h>
>   #include <linux/kvm_host.h>
>   #include <linux/vmalloc.h>
>   
> +#include "coresight-etm4x.h"
>   #include "coresight-self-hosted-trace.h"
>   #include "coresight-trbe.h"
>   
> @@ -1132,14 +1134,106 @@ static void trbe_handle_spurious(struct trbe_cpudata *cpudata)
>   	set_trbe_enabled(cpudata, trblimitr);
>   }
>   
> +static u64 read_sys_trcstatr(void)
> +{
> +	/* Context synchronization for each polling */
> +	isb();
> +	return read_sysreg_s(SYS_TRCSTATR);
> +}
> +
> +static int arm_trbe_start_tracer(u64 trcprgctlr)
> +{
> +	u64 val;
> +
> +	/* A pending IRQ after AUX pause? */
> +	if (!(trcprgctlr & BIT(0)))
> +		return 0;
> +
> +	/* Restore the saved tracer state */
> +	write_sysreg_s(trcprgctlr, SYS_TRCPRGCTLR);
> +
> +	/*
> +	 * Context synchronization between writing to the TRCPRGCTLR and
> +	 * reading the TRCSTATR.
> +	 */
> +	isb();
> +
> +	/* Wait for TRCSTATR.IDLE to go down to 0 */
> +	if (read_poll_timeout_atomic(read_sys_trcstatr, val,
> +				     !(val & BIT(TRCSTATR_IDLE_BIT)),
> +				     1,		/* delay_us */
> +				     TIMEOUT_US, /* timeout_us */
> +				     false)) {	/* delay_before_read */
> +		pr_err("TRBE: timeout for TRCSTATR IDLE\n");
> +		return -ETIME;
> +	}
> +
> +	/* Context synchronization after programming the tracer */
> +	isb();
> +
> +	return 0;
> +}
> +
> +static int arm_trbe_stop_tracer(u64 *trcprgctlr)
> +{
> +	u64 val;
> +
> +	/* Disable tracer and save trcprgctlr */
> +	*trcprgctlr = read_sysreg_s(SYS_TRCPRGCTLR);
> +
> +	/* No need to stop tracer again */
> +	if (!(*trcprgctlr & BIT(0)))
> +		return 0;
> +
> +	write_sysreg_s(*trcprgctlr & ~BIT(0), SYS_TRCPRGCTLR);
> +
> +	/*
> +	 * Context synchronization between writing to the TRCPRGCTLR and
> +	 * reading the TRCSTATR.
> +	 */
> +	isb();
> +
> +	/*
> +	 * PMSTABLE alone does not permit re-enabling the tracer.
> +	 * Wait for TRCSTATR.IDLE to go to 1.
> +	 */
> +	if (read_poll_timeout_atomic(read_sys_trcstatr, val,
> +				     val & BIT(TRCSTATR_IDLE_BIT),
> +				     1,
> +				     TIMEOUT_US,
> +				     false)) {
> +		pr_err("TRBE: timeout for TRCSTATR IDLE=1\n");
> +		return -ETIME;
> +	}
> +
> +	/* Context synchronization after programming the tracer */
> +	isb();
> +
> +	return 0;
> +}
> +
>   static int trbe_handle_overflow(struct trbe_cpudata *cpudata,
> -				enum trbe_fault_action act)
> +				enum trbe_fault_action act,
> +				bool is_buffer_stopped)
>   {
>   	struct perf_output_handle *handle = cpudata->handle;
>   	struct perf_event *event = handle->event;
>   	struct trbe_buf *buf = etm_perf_sink_config(handle);
>   	unsigned long size;
>   	struct etm_event_data *event_data;
> +	u64 trcprgctlr = 0;
> +	int ret = 0;
> +
> +	/*
> +	 * Since the trace buffer has stopped, disable and re-enable the
> +	 * tracer to generate ASYNC packets. This allows the decoder to
> +	 * recognize the discontinuity in the trace stream.
> +	 */
> +	if (is_buffer_stopped) {
> +		ret = arm_trbe_stop_tracer(&trcprgctlr);
> +		if (ret)
> +			goto truncate_event;
> +	}
>   
>   	/*
>   	 * Clear the status. No context synchronization is required here,
> @@ -1172,11 +1266,27 @@ static int trbe_handle_overflow(struct trbe_cpudata *cpudata,
>   	 */
>   	buf = etm_perf_sink_config(handle);
>   	if (!buf || buf->cpudata != cpudata) {
> -		trbe_truncate_event(handle);
> -		return -EINVAL;
> +		ret = -EINVAL;
> +		goto truncate_event;
> +	}
> +
> +	ret = __arm_trbe_enable(buf, handle);
> +	if (ret)
> +		return ret;
> +
> +	if (is_buffer_stopped) {
> +		ret = arm_trbe_start_tracer(trcprgctlr);
> +		if (ret) {
> +			trbe_drain_and_disable_local(cpudata);
> +			goto truncate_event;
> +		}
>   	}
>   
> -	return __arm_trbe_enable(buf, handle);
> +	return 0;
> +
> +truncate_event:
> +	trbe_truncate_event(handle);
> +	return ret;
>   }
>   
>   static bool is_perf_trbe(struct perf_output_handle *handle)
> @@ -1267,7 +1377,8 @@ static irqreturn_t arm_trbe_irq_handler(int irq, void *dev)
>   	act = trbe_get_fault_act(handle, status);
>   	switch (act) {
>   	case TRBE_FAULT_ACT_WRAP:
> -		truncated = !!trbe_handle_overflow(cpudata, act);
> +		truncated = !!trbe_handle_overflow(cpudata, act,
> +						   !is_trbe_running(status));
>   		break;
>   	case TRBE_FAULT_ACT_SPURIOUS:
>   		trbe_handle_spurious(cpudata);
> 
Reviewed-by: James Clark <james.clark@linaro.org>
