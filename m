Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794324265;
	b=HhKEzzxXusPOO/DHkht3X+tu8VHxDAn8s8fx/M6cZ5ZZISuv7CsMwdrHIeBjEVJOMoq5
	 r0+YB837SLP1Lt1DeUiQnyW6XJIf/lSUW8ZuZwsd23DzpGDepmujExWFPsCT4u9P4JTtK
	 mZF/F/crIumRXEWnGrPZv5IyFbmevJ9Sp2JIY2MFZAZtAwKvltHMRHWfaFZVfkT7sPgXm
	 XmFTNwp6yU4Oa2eaFij1Dti3guaO8OCK5P9YDwYXD9qlw6+Hs84q7rPCBNc9nEkL1xhl/
	 IUuHj5AiJ3VXUrNwXKagi0CDwOKpOEaP3Jm9WtIZ1KClXeJZWsC872POSWHQpQxOJIw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794324265;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=Bmv319Hm5maWBVqso1uMI60b0Aj3ANtM1HB8/nsvsUc=;
	b=yv9kWC/Ysy6wpE8WTy2aDwFGVxTPJwCV7jSGiaqcBHKiO/fQdZXsKJI4Nq0YYN+aCndX
	 XQqzKNCB2u/3Av1xYLCTZvjt7t3da/FPC/R91TM4vgYvZf+6QehFGZ+abg9Ob7SmBUifS
	 UsbADF0/OWxoEJ/u8ChNVps3xqFjueWS11ziV8cYX0PVVk4DP4w74IHTr3LVloj6TnN8a
	 0W5UBR1p925eDQ/Pwu/uOsMaHH3U9Wl73zWWw1c6k45Ed1KaEBhIp/WE0XlM+SA+VGRmr
	 O0RjW6PGFmHetdsX2Mkk9hlta1Sr2MxAEmO/AwN2nyObjIJBbNAZICnWDsZMFJvug7w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b="W0X50u+/";
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37691606A320
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 15:24:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 37691606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=W0X50u+/
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a2000d5fb1so12460185e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 07:24:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794324263; x=1794929063; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Bmv319Hm5maWBVqso1uMI60b0Aj3ANtM1HB8/nsvsUc=;
        b=W0X50u+/arM4Rx8U3aUInwKtKVC1ITkjzFLoLaLQdzjqw9/Cr9qEdtcqWMe8f2u0vq
         4Qvncixaxi3jYJE4cFayXTmKE7kUWi1ltuG5M3TEo0MdgZxp9z8h55dD8/G87zeg4Jxn
         i2cLSYtIEF0aAXAFhuwfjPJ9BIoumgwXlAWXomNCecL9NwDUvonbwos/8dDuAQkZ+zvZ
         icXXABLjiZCd86VlAvILKZNKGghTVBbW/sqAKJhpKEUjiDBOG46R00wM77TLZv1DAnPb
         LOMiW5k2NV1jgWH2yaoZtpg9YUoLiLcwB5nAx9Cb17mBd2G+7uD/bpupTrtZXtWwQaWp
         fwpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794324263; x=1794929063;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Bmv319Hm5maWBVqso1uMI60b0Aj3ANtM1HB8/nsvsUc=;
        b=kPt/kqk7Hd0wtNuFJ3/u1Q7VitqiZlvdGRSibgqa34TfhIfhBXHZz5XeQz13lqm3x7
         c5xektgXY0iaixRUy+weQgfgyuvOdGxckRDrFeMEp892lPyrRomzRRiv9tb2m61s/yg4
         yhA7+OKnO20yflMaXIEFEkNyVSdR9DOCudnC6M14lbaqLtyCiJG2HaOpkug1iMoMk46b
         D5vs9lnJ3w5F4oXWtWHqAGP71FjNnHlvmauPYC3nhNqfdsyx2nyX4yEXYSkrP81nHYe/
         JT0mkWoY44jxwo1n63BbuMRsD+bCNxv4RIHZJn/UxVnqlXf/HQgQGm+IR7ERApZiYWlz
         wnuA==
X-Forwarded-Encrypted: i=1; AL+hErFxoqOQ5u6OHyjZjhlUpVSYTqPU9TK+S8ilRMqnbL0nSQMja+7PGr2tyhCepVZSVooa/k2VKFA9nFz9VJg=@vger.kernel.org
X-Gm-Message-State: APuU4Z9cX950qBo3Ey28ug8HVuOrtd5zLRvMJRSd28UNKUY/IDcaXZe5
	h6FDBZ582AbovksOnfVRnfWc2Jg0OvCpoMX+sFoxVw6JaLHTLvXMTBUo9CG+jcxS3oA=
X-Gm-Gg: AYBFou1StVUCYJP2pSZRG2HsboCyDiNkH4QPQMSbIZhDzxn8v88gPO6wlkcQeH3lQ3/
	eiHB/xncmEc2K57ua+yFUBV2ZX4Cm2+GWTZtTDZPME0hu98t7Lce+g9rjlEcrmUbI5LbfNJnWMm
	gj/LLzbuOO4X5lTMQk7kzBKKpiHYnwjFZabDeStcpmjjk5WWYQjfze5ZujkmSPNhZ+XZXWchJM9
	EEox2almihfBiIyz6CXSBqQlaL7B34dL9VdjMSwc9SCyx16rH7mRXVuegQTt5RU0JOWzUj16kAF
	eKBH/QuPNNQn5WdC2xGfD6CXsyTjAz1IjA3usHVy3DlAd2fCoU6eQmVp81aby4UQcxVRrOGxIGK
	0vXszR/CxVS0DZbdABx0RRTcCLlFh84bSEd1gEVpP+j2bf4eB3hlNPdq0mSs8nlg9ljeaHbV5xu
	72HrB4W2ESB/J4QFfPPXSHa8iIuA82UkMrh3FhvHElR72pMVZwIcNhPQt1JYOa96ImPtXe6IX3A
	tEzEfIo8LBaH9ggmYVJlJZCzwaylbyuvMdppTX4TrsXB6Z/CYIcGDThpRYKu8psPuu8EXEN4TpN
	TqrkdiVU+/eydX66bQW4bQ9JbmW9OMsNvQ==
X-Received: by 2002:a05:600c:c0d6:b0:4ba:7e6:53d6 with SMTP id 5b1f17b1804b1-4ba07e65578mr11293295e9.33.1794324263251;
        Tue, 10 Nov 2026 07:24:23 -0800 (PST)
Received: from [192.168.1.3] ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba0223c41csm71917165e9.14.2026.11.10.07.24.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Nov 2026 07:24:22 -0800 (PST)
Message-ID: <52f2c3c3-b67b-497f-9b21-1ed08842d9d4@linaro.org>
Date: Tue, 10 Nov 2026 15:24:21 +0000
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
Subject: Re: [PATCH v2 21/23] coresight: trbe: Read TRBSR after prohibiting
 and flushing trace
To: Leo Yan <leo.yan@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 coresight@lists.linaro.org, Suzuki K Poulose <suzuki.poulose@arm.com>,
 Mike Leach <mike.leach@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Tamas Petz <tamas.petz@arm.com>, Tamas Zsoldos <tamas.zsoldos@arm.com>,
 Suyash Mahar <smahar@meta.com>, Amir Ayupov <aaupov@fb.com>
References: <20261016-trbe_enable_disable_irq_handle_refactor-v2-0-3f57cf3199b1@arm.com>
 <20261016-trbe_enable_disable_irq_handle_refactor-v2-21-3f57cf3199b1@arm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20261016-trbe_enable_disable_irq_handle_refactor-v2-21-3f57cf3199b1@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 16/10/2026 17:55, Leo Yan wrote:
> The IRQ handler needs a stable TRBSR_EL1 value before classifying the
> interrupt. If the PE can still generate trace, or if pending trace has
> not been flushed, TRBSR can still change while the handler is sampling
> it. This is especially important for TRBSR.S bit, which is used to
> decide whether the TRBE has stopped.
> 
> Move the drain buffer into arm_trbe_prohibit_trace(), so the handler
> first prohibits trace and flushes trace before reading TRBSR_EL1. Once
> this has been done, the IRQ path no longer needs the unconditional
> trbe_drain_and_disable_local(); it only needs to disable TRBE before
> handling the stopped-buffer status.
> 
> Refactor the IRQ exit path accordingly: restore TRFCR on non-truncated
> exits, while the truncated path still runs the perf IRQ work to shut
> down the event.
> 
> Signed-off-by: Leo Yan <leo.yan@arm.com>
> ---
>   drivers/hwtracing/coresight/coresight-trbe.c | 40 +++++++++++++++++++---------
>   1 file changed, 28 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-trbe.c b/drivers/hwtracing/coresight/coresight-trbe.c
> index c83c440d4ac13c346bc2a7f9093951c186c90157..36f143a15e680b28aa6ca6a43ad7d3ee134693be 100644
> --- a/drivers/hwtracing/coresight/coresight-trbe.c
> +++ b/drivers/hwtracing/coresight/coresight-trbe.c
> @@ -1207,24 +1207,34 @@ static bool is_perf_trbe(struct perf_output_handle *handle)
>   	return true;
>   }
>   
> -static u64 cpu_prohibit_trace(void)
> +static u64 arm_trbe_prohibit_trace(void)
>   {
>   	u64 trfcr = read_trfcr();
>   
>   	/* Prohibit tracing at EL0 & the kernel EL */
>   	write_trfcr(trfcr & ~(TRFCR_EL1_ExTRE | TRFCR_EL1_E0TRE));
> +
> +	/* Ensure the program-flow trace is flushed */
> +	trbe_drain_buffer();
> +
>   	/* Return the original value of the TRFCR */
>   	return trfcr;
>   }
>   
> +static void arm_trbe_allow_trace(u64 trfcr)
> +{
> +	/* Allow tracing at EL0 & the kernel EL */
> +	write_trfcr(trfcr);
> +}
> +
>   static irqreturn_t arm_trbe_irq_handler(int irq, void *dev)
>   {
>   	struct trbe_cpudata *cpudata = dev;
>   	struct perf_output_handle *handle = cpudata->handle;
>   	enum trbe_fault_action act;
> -	u64 status;
>   	bool truncated = false;
> -	u64 trfcr;
> +	u64 status, trfcr;
> +	irqreturn_t ret;
>   
>   	if (!handle || !perf_get_aux(handle))
>   		return IRQ_NONE;
> @@ -1232,22 +1242,25 @@ static irqreturn_t arm_trbe_irq_handler(int irq, void *dev)
>   	if (!is_perf_trbe(handle))
>   		return IRQ_NONE;
>   
> +	/* Prohibit the CPU from tracing before we disable the TRBE */
> +	trfcr = arm_trbe_prohibit_trace();
> +
>   	/* Reads to TRBSR_EL1 is fine when TRBE is active */
>   	status = read_sysreg_s(SYS_TRBSR_EL1);

I think sashiko is right, you need an isb() between 
arm_trbe_prohibit_trace() and the status read, otherwise it can still be 
stale.

>   	/*
>   	 * If the pending IRQ was handled by update_buffer callback
>   	 * we have nothing to do here.
>   	 */
> -	if (!is_trbe_irq(status))
> -		return IRQ_NONE;
> +	if (!is_trbe_irq(status)) {
> +		ret = IRQ_NONE;
> +		goto out;
> +	}
>   
> -	/* Prohibit the CPU from tracing before we disable the TRBE */
> -	trfcr = cpu_prohibit_trace();
>   	/*
>   	 * Ensure the trace is visible to the CPUs and
>   	 * any external aborts have been resolved.
>   	 */
> -	trbe_drain_and_disable_local(cpudata);
> +	set_trbe_disabled(cpudata);
>   	clr_trbe_irq();
>   	isb();
>   
> @@ -1272,12 +1285,15 @@ static irqreturn_t arm_trbe_irq_handler(int irq, void *dev)
>   	 * Otherwise, restore the trace filter controls to
>   	 * allow the tracing.
>   	 */
> -	if (truncated)
> +	if (truncated) {
>   		irq_work_run();
> -	else
> -		write_trfcr(trfcr);
> +		return IRQ_HANDLED;
> +	}
>   
> -	return IRQ_HANDLED;
> +	ret = IRQ_HANDLED;
> +out:
> +	arm_trbe_allow_trace(trfcr);
> +	return ret;
>   }
>   
>   static int arm_trbe_save(struct coresight_device *csdev)
> 

