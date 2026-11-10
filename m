Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794324862;
	b=H8EoZfgGPec403oQ9YwePvFkx+REeYrz24XNOgQIYyW3mdH+pkAVhim10JdvzsJhfi+r
	 zHQmp8qxPltadwraBD5+HSbCHUHopqh3RpvNcxT0o0YH6Zj3W/3CKEUeDEBLLbWXimsYr
	 qM9UmMeWfMmcVCVGYATavhbMU8xuMrwVAhdN5n8FrKAYdO0DnwSFTqNmcfnQ8MA2LiMMR
	 2zN8x+ZfhZrLITlrcd0Xy5lSK0MAobgkTcSCnRaZrtIT0ydk9NvmlJnyCkKcSJoMFwaFS
	 CRB3JXK2OUAjp/hUfBWwz3RU44StG1Be6mmsPOEqya9oQaxaOVFx/eM3iIrVj9vf72w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794324862;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=iYb4BTtIT+3+iVfeGEaZVxZUER7UNE71+aSo0E/ZqUo=;
	b=YAZeRldtgydwdktC/IMxmh8cgZRkDe4/ipiKb9Kz12GO1oTgq6nlju4fedULRmn5xQlS
	 fsAg3sMqgrjud/QAcMFH2qd24OJLSAwvQG8DzpvJqXKOFKR1VaSEWvsYVj5OtBMRw9d7c
	 ao4tF+ivoZLKpNWW1cZwesbgsrmACEhvVjrexcTEmmSRISxVHAobN8FG9QKV7sfMEPaDO
	 vmixSiaBrL+xbXtWEOgLFBNcRy0ZHSgExDBgFuv2g4gzVKt7FYJ5+gtFI8mVLBd12J9g4
	 XhSZ0WeRlu30NcWPJhNfARscuv4Uzh0OYwszNxCY4r2KVY6MJl0mbC00NgwUm8fyvOA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=LkizgkKt;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A81A606A321
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 15:34:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5A81A606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=LkizgkKt
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a2072b9832so12722565e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 07:34:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794324861; x=1794929661; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iYb4BTtIT+3+iVfeGEaZVxZUER7UNE71+aSo0E/ZqUo=;
        b=LkizgkKtFlBZUZi5xqnIl/icrk3xy55snbhDdvn++m0r6PFGnt7f9XU2IAfAL0s/Bg
         XOXDB/B02NgX+4xY1QiXcUJwC+s9qtizQaL51sz6Hxp0x/9TlVl/eNITAnWgJX1xStX4
         aba78WUHaEzMRCQKz2Dg4zEHEKrBNMXk+I1m2at5xeEedtz086hk4lFTYw33vC6MP6Bu
         BWlbZiR0fqBT50BYaeMGJeKUHTEjTBK+C7bwSMaANYGtHHXNx4EkD9FRg/juRHll3R44
         1WtaJZemto1yQKlW9M1vxRjfU6PJb+BJF749loAN6yp0NcObQsaMSYjB31zXzdHFNlSh
         cxzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794324861; x=1794929661;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iYb4BTtIT+3+iVfeGEaZVxZUER7UNE71+aSo0E/ZqUo=;
        b=TN3NG+ZWo+tjbZW0QOugniEVaaTVIm4lXZIJdDc7wc4Cqb+t7hOM9kh7hagBB0kfSM
         gSwbfoRemv3eIHUPJx3gaF3T4kARHGRpWZ6sd3AFjWV87ZnLD9O/KmLP1eQVPThCFT4G
         j38vPaq2EFqONJieSggy76KdmcD5SYTwlEQ8UDEkO4Q+dhzJRu3GiLI65KFye9pRyy/X
         AJ4Wzb/4PR9bAVrm2mJmGWOVMmKrH0U/kTuKGWM3LwyrmKWStipfrJ9j4CPROoHKTUZ5
         OwhhSKb5EQeVVH6vgjXU6i/TWrOjakApIyICcLwhLySmhZu5TnAqt9SfDiGClDJbe1+P
         tNHg==
X-Forwarded-Encrypted: i=1; AL+hErF16gnk7zk2tF0x84sc27vVV+x7SosI7uqUrc14gAs8NDHoi7XUbZGmvF9/mfSG4GtC5P6MVpXEB/2dW78=@vger.kernel.org
X-Gm-Message-State: APuU4Z+vpvY/0n6HqLke+M5Eom2aqC5McePGPpQ3Sr1VwyI2F8dZsF1M
	iYRrv4m+h76PuS4lvPF0TaIZm65/dLY2tOlXEy4ZYje9VNWbhExXH+rpzb9jci6RIsM2FUwz+2Z
	lUbq99zg=
X-Gm-Gg: AYBFou3zKdvebujegq3aciWRwXm2cGBvRn+AJ8X3NDamPhiR0bHQkb0OsLnRM2lK308
	EU0bZyHxjBQTRX27Q+zOtQTHHDZcQCGir/9fILtAJ1mclLdcM/ffy2ixnlNDofHv2sEAGU1IC/L
	C1t1zRlzRrmBRl7gwkdoNhb4tI3oE2ceMk9VhQB1CB2j6DsMNH9WbKMuxcitjOWXelbG0GVmrkl
	hNRS20aVKUABGvONvCWgVm+azsb+lDYPT4f1VjIpeeC4ZgviL5D6CA1r6kzIHnfxeiyclV5VFdw
	Toy9l335f07bHPzbE+5iHgv29bLxiIzGSzTj7isMttv/QXGa8g7FdOjNJP4ahWe4NXQncba6kB+
	dOXaaPoDKGxaY6hdonB5uwl1w4F7ZY7LvGLvDinD+MrfSO8PtnVKX1kRzA+ZN+f/fNNfIJhfnAK
	752GSs3Z+Mt1qReLBk1wFtmZwIfdnWROoh81armyRkuAr4CyFsCw8dobjpoUt2JI/wCtL+oCFCL
	cWIzNjA0Kpo+54T10OgSVxADdaqndbFEDSqTjfQQ7O25oi2rzdW03lDhdVw1NEh0/Pgabw2Jjsm
	AbkG/GfDI/Ae1WcOk3oDd2/rxGOhUWwiCGY=
X-Received: by 2002:a05:600c:348a:b0:4a1:efbe:529c with SMTP id 5b1f17b1804b1-4ba0234d97amr53166635e9.12.1794324860684;
        Tue, 10 Nov 2026 07:34:20 -0800 (PST)
Received: from [192.168.1.3] ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba02242bd9sm65434465e9.15.2026.11.10.07.34.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Nov 2026 07:34:20 -0800 (PST)
Message-ID: <617d1821-ddbf-42fb-bb02-75aaacda21eb@linaro.org>
Date: Tue, 10 Nov 2026 15:34:19 +0000
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
Subject: Re: [PATCH v2 17/23] coresight: trbe: Calculate trace size across
 buffer wrap
To: Leo Yan <leo.yan@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 coresight@lists.linaro.org, Suzuki K Poulose <suzuki.poulose@arm.com>,
 Mike Leach <mike.leach@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Tamas Petz <tamas.petz@arm.com>, Tamas Zsoldos <tamas.zsoldos@arm.com>,
 Suyash Mahar <smahar@meta.com>, Amir Ayupov <aaupov@fb.com>
References: <20261016-trbe_enable_disable_irq_handle_refactor-v2-0-3f57cf3199b1@arm.com>
 <20261016-trbe_enable_disable_irq_handle_refactor-v2-17-3f57cf3199b1@arm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20261016-trbe_enable_disable_irq_handle_refactor-v2-17-3f57cf3199b1@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 16/10/2026 17:55, Leo Yan wrote:
> trbe_get_trace_size() assumes that the TRBE write pointer is always ahead
> of the perf AUX head. That is not true after a WRAP event, where the write
> pointer can move back to the start of the programmed TRBE span.
> 
> Calculate the size in two parts for WRAP: the bytes from the current AUX
> head to TRBLIMITR_EL1, plus any bytes from TRBBASER_EL1 to the current
> TRBPTR_EL1. Keep the non-WRAP path strict and reject an unexpected write
> pointer below the AUX head.
> 
> For CPUs affected by the overwrite-fill-mode or write-out-of-range errata,
> continue to ignore TRBPTR_EL1 on WRAP and account data only up to
> TRBLIMITR_EL1, since bytes beyond the programmed limit are uncertain.
> 
> Apply this fallback before validating the write pointer so a WRAP report
> with a pointer outside the programmed range still publishes the trace
> from the AUX head to the programmed limit.
> 
> Signed-off-by: Leo Yan <leo.yan@arm.com>
> ---
>   drivers/hwtracing/coresight/coresight-trbe.c | 62 +++++++++++++++++-----------
>   1 file changed, 37 insertions(+), 25 deletions(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-trbe.c b/drivers/hwtracing/coresight/coresight-trbe.c
> index 661f4a78e67c30652de8c834e4773819fa67b5ac..9a469c8009ce8a8a8b804c2b63a68e741f1dceaa 100644
> --- a/drivers/hwtracing/coresight/coresight-trbe.c
> +++ b/drivers/hwtracing/coresight/coresight-trbe.c
> @@ -730,43 +730,55 @@ static enum trbe_fault_action trbe_get_fault_act(struct perf_output_handle *hand
>   static unsigned long trbe_get_trace_size(struct perf_output_handle *handle,
>   					 struct trbe_buf *buf, bool wrap)
>   {
> -	u64 write;
> -	u64 start_off, end_off;
> -	u64 size;
>   	u64 overwrite_skip = TRBE_WORKAROUND_OVERWRITE_FILL_MODE_SKIP_BYTES;
> +	u64 base = buf->trbe_base;
> +	u64 start_off = PERF_IDX2OFF(handle->head, buf);
> +	u64 write = get_trbe_write_pointer();
> +	u64 limit = get_trbe_limit_pointer();
> +	u64 limit_off, write_off, size;
>   
>   	/*
> -	 * If the TRBE has wrapped around the write pointer has
> -	 * wrapped and should be treated as limit.
> -	 *
>   	 * When the TRBE is affected by TRBE_WORKAROUND_WRITE_OUT_OF_RANGE,
> -	 * it may write upto 64bytes beyond the "LIMIT". The driver already
> +	 * it may write up to 64bytes beyond the "LIMIT". The driver already
>   	 * keeps a valid page next to the LIMIT and we could potentially
>   	 * consume the trace data that may have been collected there. But we
>   	 * cannot be really sure it is available, and the TRBPTR may not
> -	 * indicate the same. Also, affected cores are also affected by another
> -	 * erratum which forces the PAGE_SIZE alignment on the TRBPTR, and thus
> -	 * could potentially pad an entire PAGE_SIZE - 64bytes, to get those
> -	 * 64bytes. Thus we ignore the potential triggering of the erratum
> -	 * on WRAP and limit the data to LIMIT.
> +	 * indicate the same.
> +	 *
> +	 * Also, affected cores are also affected by another erratum
> +	 * TRBE_WORKAROUND_OVERWRITE_FILL_MODE, which forces the PAGE_SIZE
> +	 * alignment on the TRBPTR, and thus could potentially pad an entire
> +	 * PAGE_SIZE - 64bytes, to get those 64bytes. Thus we ignore the
> +	 * potential effects of the erratum on WRAP and limit the data to
> +	 * LIMIT.
>   	 */
> -	if (wrap)
> -		write = get_trbe_limit_pointer();
> -	else
> -		write = get_trbe_write_pointer();
> +	if (wrap &&
> +	    (trbe_may_overwrite_in_fill_mode(buf->cpudata) ||
> +	     trbe_may_write_out_of_range(buf->cpudata)))
> +		write = limit;
>   
> -	/*
> -	 * TRBE may use a different base address than the base
> -	 * of the ring buffer. Thus use the beginning of the ring
> -	 * buffer to compute the offsets.
> -	 */
> -	end_off = write - buf->trbe_base;
> -	start_off = PERF_IDX2OFF(handle->head, buf);
> +	/* Should never happen ... */
> +	if (WARN_ON_ONCE(write < base || write > limit))
> +		return 0;
>   
> -	if (WARN_ON_ONCE(end_off < start_off))
> +	limit_off = limit - base;
> +	write_off = write - base;
> +
> +	if (WARN_ON_ONCE(start_off >= limit_off))
>   		return 0;
>   
> -	size = end_off - start_off;
> +	if (!wrap) {
> +		if (WARN_ON_ONCE(write_off < start_off))
> +			return 0;
> +
> +		size = write_off - start_off;
> +	} else {
> +		size = limit_off - start_off;
> +
> +		if (write != limit)
> +			size += write_off;
> +	}
> +
>   	/*
>   	 * If the TRBE is affected by the following erratum, we must fill
>   	 * the space we skipped with IGNORE packets. And we are always
> 
Reviewed-by: James Clark <james.clark@linaro.org>
