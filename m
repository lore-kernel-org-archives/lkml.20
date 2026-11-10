Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794324876;
	b=iJz+zZXqxcJmguXWygniqNsFeCCmz89Hf9LRhS2VB0eg+7OIyoJxoicrl4pSIPQMpJdq
	 2yeJ+Wa6HgjUri5prChWn7gctQXUdLEkb67X6I1sjtEFEcbw32f4h6Hb5+x/+RBB75Cmj
	 hU9HmZ4B47kzkM9ACGtzwHr0Bqs4Iqx7SkIyyU3i6p5SpVjnplkXsR1nTzn61uHyTozPc
	 FmqwGusl+RddBZ9msUZ00QxHL8JqxujSHsXBSjXs4GxmGk2tIfyEXV3JN9FbslhpQ3khL
	 K6t40dl+qJzGPk/O0sUiHF+tBA0Md5aAo3RLOwISDgyURP54fNF71ALerv5oeyRjVzw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794324876;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=NJnOdF4olvZ0uC00aRDDzPjTyhqTiEVqBOnUPYxJ54A=;
	b=IpdVaDwT4vPfuPNtAyGc38LD1BPiJgussyRbE6A8EGAo35F+eAjczoCA77VNw2BX1vQj
	 QwEtHLsw1m2D4AVIF3a+kubIblGhqCNfX6vfxb3RsQtYRowhFbutBhgzmK1fZ9OY1mvVr
	 JnzjwMoP4gRqqe2wyfn4+p79TIS42F39ASvBSjlLxAYJ4lECpprb77aa8MId0joOY/HvB
	 TkFRP4pDghSqSdOikpvqlWlmuaRJfB4KOjpEUD5ftRRRwqm1YnqK8yPDBK5Dxe4qRaf4n
	 KOtNvlBE+7bi6OU3QVhrO//U3hf7O9L9AcuF0Vm6UAk5fqGxbHwnrX5gbSEHMP3cdzw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=RSlkryCs;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C658606A321
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 15:34:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7C658606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=RSlkryCs
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a35d5d4a20so25929865e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 07:34:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794324875; x=1794929675; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NJnOdF4olvZ0uC00aRDDzPjTyhqTiEVqBOnUPYxJ54A=;
        b=RSlkryCse/Sayo8wZIhLjtjeSZCETBfA/JAFtASxbIVYeNqo0qmGIJt2GNLK1JWkcc
         +CSHAYt0HhOq6yPgw/hWw1x4ysaKGGKNlcgNjX7dZEwfz/2GF0owdJ7yI5FFVN4cY4wW
         YWdvO5zFLKr1DxSR7uVl7YjbuOzZsML2O1glfZA9Nw4/ti+shXoIuYBUdlzWCsTDZNLz
         O02pRAf2/iQMmCR62s5Qlaw8/nebrfUN5okCtpIbCEf74atDnGribhuOKMP4nVEJhmtF
         cvFd9vTYUkSD93QCtsgGbAFFksesGDU5i8gsgXHTJww1+tE7FPBV+uEurGPsLcTakQ5b
         /LXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794324875; x=1794929675;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NJnOdF4olvZ0uC00aRDDzPjTyhqTiEVqBOnUPYxJ54A=;
        b=N3tzajcvC8QzkfICIjR0n/mzF5yFQNPYteruQDICHwglqGOLzxd6ZnHaiunYW9uPYx
         RL/Se+8KzSZsQp8QERtouvz9Hz5CrjX0Y9rrdKd7amvUcj9DD4p/7Ux+MjJMUlCef2bq
         HQX7OGw+0Ew39P5t6ZtWXwGUzjr5V9lJP9qrKL08sUtvIi8BkQ+GPLRdTR9IK0Tk9hHW
         wVCZmUy3G+C1xu4l9ctI7+YR9iOQCVMDnrIifYbba+Z8dWmRumKG+Z3azQDARKEIHxGQ
         +NnC+DhNdHd6xc8rfZruoDwCucw7ZFl9YGBNdxVJyG/bl59ZVE6Xgqo2Rx7NB1AvSAOA
         L/Vg==
X-Forwarded-Encrypted: i=1; AL+hErFgJfbxvMVKcZ5Uivru0+iOjD1JSnp/mPEGFwww3sJywsWgt/4hggM1O9WbR6ogYFNUF5D7JqDQwysuC+4=@vger.kernel.org
X-Gm-Message-State: APuU4Z/UUd6AYOEKRPRVmuufD8jgI6B3v5j3/7+g0Bpabd8noTIDJ1ko
	NX1yWarCx2EOcvxd+btdQ2ClnZ37nc68irQR8HGlsGSY+Qn99AId2092LVHCSlgaLf4BtEwNxMC
	CyePBOl4=
X-Gm-Gg: AYBFou2ypP+j+JLmkJk/pazPBdZI/4JZP71paDpQ0CUnPWKwtIusiIBdd2oRZzZqEaw
	OCBM2xhHgn1M/yv5SXw13pdJ29vdLA8VnO85ZVvT4GyULNrAngh7+zUgLU0wpMWHNwnVdVJn4/H
	TWmI/cpAkxEaC6BNDjtKdpafEZ31zpw/oCPYrcBZmJoQPGElnNwuZ7f6w7PzW8xYY0YFaak889G
	0cXtw0UkCXYAg87U+7gT9F8z5nKHlBLKeaOVJMZqvDFx0Jg78nn5i84gzKWWHe8IqJp7X6zJcLG
	UZjruu9c3/RJqCOIf7+iVFP/zuetzVlMPFiIKSQwi3HhBM2MI6Bo9/ZCRC/mniv203Q5ra7pCjx
	9+eM9qRvtGUbWsOiRfDEby0foo8vdcN6GlUo5HgMl3CBobPgGjpcrHqSUFpROdUprr81KH31kkG
	pU4Gt2hwBq/3fuZOLe3/glCGAv9qwui4MMrDtaBhdmQwn9NaWz74mh9oS7WZ2grgAmbSW+f8Tlc
	5/JAIUMI3s+mUtNNUZHOh7upRY8u7FsIPUutwLQ8uVGicfDH/V2gRfvkB9NTLtEohBMg7bZzcnV
	pOBo8PA6/FdDGGnlmFQiIfRwZFCKe/VwIw==
X-Received: by 2002:a05:600c:3d05:b0:4a3:598e:e7a8 with SMTP id 5b1f17b1804b1-4ba0230519amr54309275e9.4.1794324874844;
        Tue, 10 Nov 2026 07:34:34 -0800 (PST)
Received: from [192.168.1.3] ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49835e20f91sm6187825f8f.27.2026.11.10.07.34.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Nov 2026 07:34:34 -0800 (PST)
Message-ID: <38e4f4dc-e2ea-4b7f-82d1-e7b298e88002@linaro.org>
Date: Tue, 10 Nov 2026 15:34:33 +0000
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
Subject: Re: [PATCH v2 18/23] coresight: trbe: Keep the perf handle in per-CPU
 data
To: Leo Yan <leo.yan@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 coresight@lists.linaro.org, Suzuki K Poulose <suzuki.poulose@arm.com>,
 Mike Leach <mike.leach@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Tamas Petz <tamas.petz@arm.com>, Tamas Zsoldos <tamas.zsoldos@arm.com>,
 Suyash Mahar <smahar@meta.com>, Amir Ayupov <aaupov@fb.com>
References: <20261016-trbe_enable_disable_irq_handle_refactor-v2-0-3f57cf3199b1@arm.com>
 <20261016-trbe_enable_disable_irq_handle_refactor-v2-18-3f57cf3199b1@arm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20261016-trbe_enable_disable_irq_handle_refactor-v2-18-3f57cf3199b1@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 16/10/2026 17:55, Leo Yan wrote:
> Arm SPE owns a per-CPU perf output handle for the PMU lifetime. TRBE
> instead receives a handle from CoreSight when enabling its sink.
> 
> Store that session handle in trbe_cpudata instead of a separate per-CPU
> pointer array, and pass the CPU data as the per-CPU IRQ context. Use this
> context directly for overflow and spurious interrupt handling so local
> hardware control does not depend on the current AUX buffer configuration.
> 
> Allocate the CPU data before registering the IRQ and free it after
> releasing the IRQ, keeping the IRQ context valid throughout registration.
> 
> Signed-off-by: Leo Yan <leo.yan@arm.com>
> ---
>   drivers/hwtracing/coresight/coresight-trbe.c | 44 ++++++++++++----------------
>   1 file changed, 19 insertions(+), 25 deletions(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-trbe.c b/drivers/hwtracing/coresight/coresight-trbe.c
> index 9a469c8009ce8a8a8b804c2b63a68e741f1dceaa..2328aab0a084a0ac123e950f846f404d120ec2c0 100644
> --- a/drivers/hwtracing/coresight/coresight-trbe.c
> +++ b/drivers/hwtracing/coresight/coresight-trbe.c
> @@ -139,6 +139,7 @@ struct trbe_save_state {
>    * @cpu			- CPU this TRBE belongs to.
>    * @mode		- Mode of current operation. (perf/disabled)
>    * @buf			- Buffer configuration retained for the enabled session.
> + * @handle		- Perf output handle from successful enable until disable.
>    * @drvdata		- TRBE specific drvdata
>    * @errata		- Bit map for the errata on this TRBE.
>    */
> @@ -149,6 +150,7 @@ struct trbe_cpudata {
>   	int cpu;
>   	enum cs_mode mode;
>   	struct trbe_buf *buf;
> +	struct perf_output_handle *handle;
>   	struct trbe_drvdata *drvdata;
>   	struct trbe_save_state save_state;
>   	DECLARE_BITMAP(errata, TRBE_ERRATA_MAX);
> @@ -156,7 +158,6 @@ struct trbe_cpudata {
>   
>   struct trbe_drvdata {
>   	struct trbe_cpudata __percpu *cpudata;
> -	struct perf_output_handle * __percpu *handle;
>   	struct hlist_node hotplug_node;
>   	int irq;
>   	cpumask_t supported_cpus;
> @@ -1091,7 +1092,7 @@ static int arm_trbe_enable(struct coresight_device *csdev, enum cs_mode mode,
>   		return ret;
>   	}
>   
> -	*this_cpu_ptr(drvdata->handle) = handle;
> +	cpudata->handle = handle;
>   	cpudata->buf = buf;
>   	cpudata->mode = mode;
>   	return 0;
> @@ -1112,16 +1113,15 @@ static int arm_trbe_disable(struct coresight_device *csdev)
>   	trbe_drain_and_disable_local(cpudata);
>   	clr_trbe_status();
>   
> -	*this_cpu_ptr(drvdata->handle) = NULL;
>   	buf->cpudata = NULL;
> +	cpudata->handle = NULL;
>   	cpudata->buf = NULL;
>   	cpudata->mode = CS_MODE_DISABLED;
>   	return 0;
>   }
>   
> -static void trbe_handle_spurious(struct perf_output_handle *handle)
> +static void trbe_handle_spurious(struct trbe_cpudata *cpudata)
>   {
> -	struct trbe_buf *buf = etm_perf_sink_config(handle);
>   	u64 trblimitr = read_sysreg_s(SYS_TRBLIMITR_EL1);
>   
>   	/*
> @@ -1129,11 +1129,12 @@ static void trbe_handle_spurious(struct perf_output_handle *handle)
>   	 * back without modifying the buffer parameters to
>   	 * retain the trace collected so far.
>   	 */
> -	set_trbe_enabled(buf->cpudata, trblimitr);
> +	set_trbe_enabled(cpudata, trblimitr);
>   }
>   
> -static int trbe_handle_overflow(struct perf_output_handle *handle)
> +static int trbe_handle_overflow(struct trbe_cpudata *cpudata)
>   {
> +	struct perf_output_handle *handle = cpudata->handle;
>   	struct perf_event *event = handle->event;
>   	struct trbe_buf *buf = etm_perf_sink_config(handle);
>   	unsigned long size;
> @@ -1203,9 +1204,8 @@ static u64 cpu_prohibit_trace(void)
>   
>   static irqreturn_t arm_trbe_irq_handler(int irq, void *dev)
>   {
> -	struct perf_output_handle **handle_ptr = dev;
> -	struct perf_output_handle *handle = *handle_ptr;
> -	struct trbe_buf *buf;
> +	struct trbe_cpudata *cpudata = dev;
> +	struct perf_output_handle *handle = cpudata->handle;
>   	enum trbe_fault_action act;
>   	u64 status;
>   	bool truncated = false;
> @@ -1232,18 +1232,17 @@ static irqreturn_t arm_trbe_irq_handler(int irq, void *dev)
>   	 * Ensure the trace is visible to the CPUs and
>   	 * any external aborts have been resolved.
>   	 */
> -	buf = etm_perf_sink_config(handle);
> -	trbe_drain_and_disable_local(buf->cpudata);
> +	trbe_drain_and_disable_local(cpudata);
>   	clr_trbe_irq();
>   	isb();
>   
>   	act = trbe_get_fault_act(handle, status);
>   	switch (act) {
>   	case TRBE_FAULT_ACT_WRAP:
> -		truncated = !!trbe_handle_overflow(handle);
> +		truncated = !!trbe_handle_overflow(cpudata);
>   		break;
>   	case TRBE_FAULT_ACT_SPURIOUS:
> -		trbe_handle_spurious(handle);
> +		trbe_handle_spurious(cpudata);
>   		break;
>   	case TRBE_FAULT_ACT_FATAL:
>   		trbe_truncate_event(handle);
> @@ -1507,10 +1506,6 @@ static int arm_trbe_probe_coresight(struct trbe_drvdata *drvdata)
>   {
>   	int cpu;
>   
> -	drvdata->cpudata = alloc_percpu(typeof(*drvdata->cpudata));
> -	if (!drvdata->cpudata)
> -		return -ENOMEM;
> -
>   	for_each_cpu(cpu, &drvdata->supported_cpus) {
>   		/* If we fail to probe the CPU, let us defer it to hotplug callbacks */
>   		if (smp_call_function_single(cpu, arm_trbe_probe_cpu, drvdata, 1))
> @@ -1531,7 +1526,6 @@ static int arm_trbe_remove_coresight(struct trbe_drvdata *drvdata)
>   		smp_call_function_single(cpu, arm_trbe_disable_cpu, drvdata, 1);
>   		arm_trbe_remove_coresight_cpu(drvdata, cpu);
>   	}
> -	free_percpu(drvdata->cpudata);
>   	return 0;
>   }
>   
> @@ -1618,14 +1612,14 @@ static int arm_trbe_probe_irq(struct platform_device *pdev,
>   
>   	cpumask_copy(&drvdata->supported_cpus, affinity);
>   
> -	drvdata->handle = alloc_percpu(struct perf_output_handle *);
> -	if (!drvdata->handle)
> +	drvdata->cpudata = alloc_percpu(typeof(*drvdata->cpudata));
> +	if (!drvdata->cpudata)
>   		return -ENOMEM;
>   
>   	ret = request_percpu_irq_affinity(drvdata->irq, arm_trbe_irq_handler, DRVNAME,
> -					  affinity, drvdata->handle);
> +					  affinity, drvdata->cpudata);
>   	if (ret) {
> -		free_percpu(drvdata->handle);
> +		free_percpu(drvdata->cpudata);
>   		return ret;
>   	}
>   	return 0;
> @@ -1633,8 +1627,8 @@ static int arm_trbe_probe_irq(struct platform_device *pdev,
>   
>   static void arm_trbe_remove_irq(struct trbe_drvdata *drvdata)
>   {
> -	free_percpu_irq(drvdata->irq, drvdata->handle);
> -	free_percpu(drvdata->handle);
> +	free_percpu_irq(drvdata->irq, drvdata->cpudata);
> +	free_percpu(drvdata->cpudata);
>   }
>   
>   static int arm_trbe_device_probe(struct platform_device *pdev)
> 
Reviewed-by: James Clark <james.clark@linaro.org>
