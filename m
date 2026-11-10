Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794324733;
	b=LExAn+J5/XAGWnJ9tv2Kq4N9nhvc0h/PzLIWE1YMx0GT1UIcQNwaWZu71RLnB5I4mnoS
	 /BCzjYV0PyI8eIf7fnB/OgFHzOJluu0zYgNDqFnO7dzx5KRLz3WlWUNhuugSUskN4tDr/
	 2hy+ChRPnUU+9bNmcmaHuMwUDY6lz70ygDI0VXR3eRFW3fXgE5Au5tYQCipEgWsDsKvqM
	 C0w+TBLq+S9bJflIALCTt8/BHAT1dVgkoZynzTP364Z1VYNTa7T1FkyT3hyIDoe/SMzDc
	 xDM7R7OV1KWaGSYvn5EceOlS+1vv5wsU2t43/O1nW0LbFJN5C3CyPtL3IFTlQssGtVA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794324733;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=RVA7NkT+pOc7QldUcgD3Ut/OY6lkzgXsVYxQOxndJ94=;
	b=J8p7BqhO+tjM7/r+Bi1yAY9JDjcS3VKcBErMAjYVoedf4BS7bWBGLUkSHjZbQ3hJulCQ
	 3y7FKnVaf3Xc3Sf1Fjl6Y5OwDRUHoyTNROaOI6JMi2QihvqbDMRe6k32dLBOTqfr9F/0W
	 LxFOOVTMW9XJG0VpIkkzRxw4A6+prt1Eu8yrndLA9urx0edmAwjrAU7o8/lbNv/qlNBQj
	 TGku7fmaqzNWxgZYU1uDiCMOtq1YyVjJYaDkmDlejU8wdep7KUD04Y88tfjKEMe1w2x7C
	 WcBunSTi3fGX4NPwAeih+7iStWj0fl06UuY5OnVUpD4wRARNNyjU7hMaNfiSf4Y7XLg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=EOXu+KhC;
	arc=none smtp.remote-ip=209.85.221.47
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AAC4606A330
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 15:32:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8AAC4606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=EOXu+KhC
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-48e09aa5264so1261799f8f.2
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 07:32:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794324732; x=1794929532; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RVA7NkT+pOc7QldUcgD3Ut/OY6lkzgXsVYxQOxndJ94=;
        b=EOXu+KhCSHVRwG/0sTeqvfzBcpXnYji0qlo4myFiPJMHgaVKONf6cl0dX3rW8JB6m8
         AgL4lButMo0QBjCWnA+qcJORn7Z8RxaK6c1HrqCxPAJ/N4HSjGMB4xyP2tdWehgoDg5/
         oYKZ2aKDDFczs0Xd2CcpKi68F85RDdpYwXMnLSMvd+Al7ZdEmvRGE+sUZhl7A2PmUg24
         flYXD2ZFfzfcvjHocYOWnyf5M3iEHtVXB5dwdkhGBPSLy19rP97PAN8ri2zRmoqz7FwL
         vDeS8lYjGcY78P2frMrM/GWiaejkSARwUD0p8wzaUrXGYhTfoXVPmHQZat+rmDIweGFB
         BYxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794324732; x=1794929532;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RVA7NkT+pOc7QldUcgD3Ut/OY6lkzgXsVYxQOxndJ94=;
        b=seuOb8LBnWh/zyWnIsQdnuf8jngZ2hGZGVePVZITLAa3WjhjAOEe+Ga5WwECVZS8DZ
         Pom/GRGHqib//QMkfK0FmibaolxAxdNWe+1ZvbCUA3TrHHiCm7gQwfBnuYZlqXfNo1eq
         vIbvmDTul07BRHe4MxaXTHHBlErTk1rwvC+pg6CrEs49jd2DSDUyC54OvaDaUJDi0Gir
         ZyF/H7GzRCq4AifT56VH1VanPOSpT2CCyp/VZpAwiZQju00E+lgiqZ7lFrweyqZ0MKdU
         yldqZEK0GXayEMHGnc2BvmDUenhUPm/cz2FQSBC2byCt4qkMaVmqO59rKbNpiJQwpmKv
         YCLw==
X-Forwarded-Encrypted: i=1; AL+hErEhi990YHqkFWrVLdIiR4sTEFJ5vckD3jL4qCQwekygooeglVROlWYoZug2PGjBO8yIeUfz6CNBVElMcCw=@vger.kernel.org
X-Gm-Message-State: APuU4Z9guv/tz/NDzuK270aSiRa5dxYPp1CzjaKjZgQgh0D80IiyNupZ
	zb78u/p0G8/NYhejSGa3odJsFG9sqpEOTUTSDuTYLltvkCRIXp/227DNgMXRt+fqitM=
X-Gm-Gg: AYBFou07PThnNIE20KoFYQbCJ69fz2C5NuT75aaH654vL4HTtTfrIgEvO+fTbN53SUt
	e6oFYr/ICoyn05OykWeCntM8mdkaOkpw1Rjl/c2py8w9kQWju0TrYls+9LZSIe/U5BSeeAkqFIs
	276rSACC3AXSmETJT/rxZml2VS56WpX7A1X6soq9gBH18SuZS3+BGJoAiuSM5Rq6OoghNwpP7zt
	XlmQMahHN9VXXBxId/OvSRlVgbTndQGazgIYom+vTtN1qivS+Ish1Ua6gV7ii4iLim/un9C5aga
	y4yzksMfqLkr3wOxWOYI1DHOdfyUoYA+tNmWhmQU7isMSDIoA+MRK4BABSrKFvhzwBsM3IfyoKi
	CFhEYuOe+7d4iLRHua1iaMnsajmtmlUSUx3awKTymaJvfHp2F9fYNdBKrQmDlWY+8l3TFp55Vhy
	w/Y/GlX25Nu9C4x7Vj0pjpoVr2l6zmghSd3gkpSZT7LuTeG9pkfB7kahAevFeg+YB0XOOe/NRpK
	KQkJQDgnxRULclb9myZQdzV72jQYytEPnp+nfiv0mD9zsHp9FqDn+bKnl/igE8q7UTPQFmKpBCn
	jH7L/baPZBLmixRg/H1N5Q+Wi7dKVTlxDQ==
X-Received: by 2002:a05:6000:1862:b0:493:fdf6:14aa with SMTP id ffacd0b85a97d-49831cd1d94mr5937057f8f.56.1794324732002;
        Tue, 10 Nov 2026 07:32:12 -0800 (PST)
Received: from [192.168.1.3] ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-498367b99bcsm5881429f8f.51.2026.11.10.07.32.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Nov 2026 07:32:11 -0800 (PST)
Message-ID: <671491ba-388c-4817-bdae-7348d5220cce@linaro.org>
Date: Tue, 10 Nov 2026 15:32:10 +0000
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
Subject: Re: [PATCH v2 12/23] coresight: trbe: Decode TRBSR status codes
To: Leo Yan <leo.yan@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 coresight@lists.linaro.org, Suzuki K Poulose <suzuki.poulose@arm.com>,
 Mike Leach <mike.leach@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Tamas Petz <tamas.petz@arm.com>, Tamas Zsoldos <tamas.zsoldos@arm.com>,
 Suyash Mahar <smahar@meta.com>, Amir Ayupov <aaupov@fb.com>
References: <20261016-trbe_enable_disable_irq_handle_refactor-v2-0-3f57cf3199b1@arm.com>
 <20261016-trbe_enable_disable_irq_handle_refactor-v2-12-3f57cf3199b1@arm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20261016-trbe_enable_disable_irq_handle_refactor-v2-12-3f57cf3199b1@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 16/10/2026 17:55, Leo Yan wrote:
> trbe_get_fault_act() currently handles only a small set of TRBE stop
> reasons: external aborts, trigger events and stage 1 and 2 aborts. Other
> TRBSR_EL1 EC/BSC values are reported as spurious events, which hides
> useful failure information and makes the status handling hard to extend.
> 
> Decode the EC and BSC fields explicitly. Keep the normal fill-mode
> handling unchanged, but treat unsupported or unexpected status values as
> fatal and report them with a ratelimited diagnostic containing TRBSR_EL1,
> TRBPTR_EL1 and TRBLIMITR_EL1. Use %p for the buffer pointers so the
> printk diagnostic hashes their address values by default.
> 
> Stop using is_trbe_trg(), instead, use TRBSR_EL1_BSC_TRIGGER_EVENT as
> the unsupported trigger case. This keeps the stop-reason handling in the
> EC/BSC decode path, the driver can validate the status fields safely.
> 
> Move the TRBSR_EL1 BSC definitions to the arm64 sysreg header, and use
> the common TRBSR_EL1 EC/BSC names in the TRBE driver.
> 
> Signed-off-by: Leo Yan <leo.yan@arm.com>
> ---
>   arch/arm64/include/asm/sysreg.h              |  6 +++
>   drivers/hwtracing/coresight/coresight-trbe.c | 57 +++++++++++++++++++++++++---
>   drivers/hwtracing/coresight/coresight-trbe.h |  8 ----
>   3 files changed, 58 insertions(+), 13 deletions(-)
> 
> diff --git a/arch/arm64/include/asm/sysreg.h b/arch/arm64/include/asm/sysreg.h
> index 7aa08d59d49448cfa3bb61f5cb42e0a6f1aa8a89..0e602f07625b3c4fe6cd3fd71a658ebae768d8fd 100644
> --- a/arch/arm64/include/asm/sysreg.h
> +++ b/arch/arm64/include/asm/sysreg.h
> @@ -357,6 +357,12 @@
>   #define TRBSR_EL1_BSC_MASK		GENMASK(5, 0)
>   #define TRBSR_EL1_BSC_SHIFT		0
>   
> +#define TRBSR_EL1_BSC_NOT_STOPPED	UL(0)
> +#define TRBSR_EL1_BSC_FILLED		UL(1)
> +#define TRBSR_EL1_BSC_TRIGGER_EVENT	UL(2)
> +#define TRBSR_EL1_BSC_MANUAL_STOP	UL(3)
> +#define TRBSR_EL1_BSC_BUF_SIZE		UL(4)
> +
>   #define SYS_PMINTENSET_EL1		sys_reg(3, 0, 9, 14, 1)
>   #define SYS_PMINTENCLR_EL1		sys_reg(3, 0, 9, 14, 2)
>   
> diff --git a/drivers/hwtracing/coresight/coresight-trbe.c b/drivers/hwtracing/coresight/coresight-trbe.c
> index 1f51c33de83638479436683fd96e31d69c3b860f..a851f09d806a6b6a6386d6f7547b01a17f61b88e 100644
> --- a/drivers/hwtracing/coresight/coresight-trbe.c
> +++ b/drivers/hwtracing/coresight/coresight-trbe.c
> @@ -658,29 +658,76 @@ static void trbe_enable_hw(struct trbe_buf *buf)
>   static enum trbe_fault_action trbe_get_fault_act(struct perf_output_handle *handle,
>   						 u64 trbsr)
>   {
> +	const char *err_str;
>   	int ec = get_trbe_ec(trbsr);
>   	int bsc = get_trbe_bsc(trbsr);
>   	struct trbe_buf *buf = etm_perf_sink_config(handle);
>   	struct trbe_cpudata *cpudata = buf->cpudata;
>   
>   	WARN_ON(is_trbe_running(trbsr));
> -	if (is_trbe_trg(trbsr) || is_trbe_abort(trbsr))
> -		return TRBE_FAULT_ACT_FATAL;
>   
> -	if ((ec == TRBE_EC_STAGE1_ABORT) || (ec == TRBE_EC_STAGE2_ABORT))
> -		return TRBE_FAULT_ACT_FATAL;
> +	if (is_trbe_abort(trbsr)) {
> +		err_str = "External abort";
> +		goto out_fatal;
> +	}
> +
> +	switch (ec) {
> +	case TRBSR_EL1_EC_OTHER:
> +		break;
> +	case TRBSR_EL1_EC_IMP_DEF:
> +		err_str = "Unexpected IMPDEF buffer management event";
> +		goto out_fatal;
> +	case TRBSR_EL1_EC_FAULT_GPC:
> +		err_str = "Granule Protection Check fault";
> +		goto out_fatal;
> +	case TRBSR_EL1_EC_FAULT_WRITE_S1:
> +		err_str = "Stage 1 data abort";
> +		goto out_fatal;
> +	case TRBSR_EL1_EC_FAULT_WRITE_S2:
> +		err_str = "Stage 2 data abort";
> +		goto out_fatal;
> +	default:
> +		err_str = "Unknown error code";
> +		goto out_fatal;
> +	}
> +
> +	switch (bsc) {
> +	case TRBSR_EL1_BSC_NOT_STOPPED:
> +		break;
> +	case TRBSR_EL1_BSC_FILLED:
> +		break;
> +	case TRBSR_EL1_BSC_TRIGGER_EVENT:
> +		err_str = "Unsupported trigger event";
> +		goto out_fatal;
> +	case TRBSR_EL1_BSC_MANUAL_STOP:
> +		err_str = "Unsupported manual stop";
> +		goto out_fatal;
> +	case TRBSR_EL1_BSC_BUF_SIZE:
> +		err_str = "Buffer size was too large";
> +		goto out_fatal;
> +	default:
> +		err_str = "Unexpected buffer status code";
> +		goto out_fatal;
> +	}
>   
>   	/*
>   	 * If the trbe is affected by TRBE_WORKAROUND_OVERWRITE_FILL_MODE,
>   	 * it might write data after a WRAP event in the fill mode.
>   	 * Thus the check TRBPTR == TRBBASER will not be honored.
>   	 */
> -	if ((is_trbe_wrap(trbsr) && (ec == TRBE_EC_OTHERS) && (bsc == TRBE_BSC_FILLED)) &&
> +	if ((is_trbe_wrap(trbsr) && (ec == TRBSR_EL1_EC_OTHER) && (bsc == TRBSR_EL1_BSC_FILLED)) &&
>   	    (trbe_may_overwrite_in_fill_mode(cpudata) ||
>   	     get_trbe_write_pointer() == get_trbe_base_pointer()))
>   		return TRBE_FAULT_ACT_WRAP;
>   
>   	return TRBE_FAULT_ACT_SPURIOUS;
> +
> +out_fatal:
> +	pr_err_ratelimited("%s on CPU %d [TRBSR=0x%016llx, TRBPTR=%p, TRBLIMITR=%p]\n",
> +			   err_str, smp_processor_id(), trbsr,
> +			   (void *)read_sysreg_s(SYS_TRBPTR_EL1),
> +			   (void *)read_sysreg_s(SYS_TRBLIMITR_EL1));
> +	return TRBE_FAULT_ACT_FATAL;
>   }
>   
>   static unsigned long trbe_get_trace_size(struct perf_output_handle *handle,
> diff --git a/drivers/hwtracing/coresight/coresight-trbe.h b/drivers/hwtracing/coresight/coresight-trbe.h
> index 45202c48accec7c86ba56130e2737bc2d1830fae..8ba9ef4056e4dc3968816c6a7cbf2859f2bbed36 100644
> --- a/drivers/hwtracing/coresight/coresight-trbe.h
> +++ b/drivers/hwtracing/coresight/coresight-trbe.h
> @@ -35,19 +35,11 @@ static inline bool is_trbe_enabled(void)
>   	return trblimitr & TRBLIMITR_EL1_E;
>   }
>   
> -#define TRBE_EC_OTHERS		0
> -#define TRBE_EC_STAGE1_ABORT	36
> -#define TRBE_EC_STAGE2_ABORT	37
> -
>   static inline int get_trbe_ec(u64 trbsr)
>   {
>   	return (trbsr & TRBSR_EL1_EC_MASK) >> TRBSR_EL1_EC_SHIFT;
>   }
>   
> -#define TRBE_BSC_NOT_STOPPED 0
> -#define TRBE_BSC_FILLED      1
> -#define TRBE_BSC_TRIGGERED   2
> -
>   static inline int get_trbe_bsc(u64 trbsr)
>   {
>   	return (trbsr & TRBSR_EL1_BSC_MASK) >> TRBSR_EL1_BSC_SHIFT;
> 

Reviewed-by: James Clark <james.clark@linaro.org>

