Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794324549;
	b=Rk3PZssUa7dvK8dOoGYhsjuqLQyCTFh0aFqRwSYha/bhlEVKSmu278r/f0UcdN6a+7ki
	 lKitO1u2FC2ChG4dW/O9hmgi74KUMY2bEKcp9LO/YOp5mryl+n2JnKrZDwNZ0FH0MRXCx
	 1YaOqaKaV7B94O2hOnN/gVuO7aHe5sr4+JYpf4VppXF71R8wNiByNPjb+CR6hzo6oQmaA
	 jYpxPfYnuDIoLU9KKVzBnrQRkEaDgCRJSHiVDZ76CMfTvyIs146Ofkz2mUacFKKhIKmJc
	 0mqwV7XBYEprjkGicHlbWULBcnNGlAk7fB2P5jcw/IFp8SRuEJjiqbIsr1txySEZSGA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794324549;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=PXJAvmxQXstxSOL+heMZGmv93yC12Dwzkd4AWXEIrR8=;
	b=p+yWAfTYseiFL0suv3ozwmuIGtYyj4TCe9nCh4851naMQXaVuqf7gK10ewKdcBAVT5Fy
	 8mnsmKa8Blekjkp0GMqA0vXrfdWzTUkUEI9Cg3deDVultxo6INA4iFXiBG6nv4xJ88ZQO
	 2JD4H9iBsxyuB1Xu/EO4/xuyMzXhUz0GBvM5r1eg1j67oan0cCWDHXzv95p4rbmIpDTOL
	 +uOsI8DTej4fHkrkePTZTwN5v3Ib2BhhN5vFfyhSTWUKQvFG0pLCQkjTylXw9C2P8xoV3
	 AfCj2uXhWbNudanGBXVS7PRc9LpnVEtCegJBeJQf7TKKw5SsHepkKMcz+CS98Hfme7g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=ZIFwhH+j;
	arc=none smtp.remote-ip=209.85.221.52
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42F1760A260E
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 15:29:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 42F1760A260E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=ZIFwhH+j
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-49412eb1474so1373613f8f.3
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 07:29:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794324548; x=1794929348; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PXJAvmxQXstxSOL+heMZGmv93yC12Dwzkd4AWXEIrR8=;
        b=ZIFwhH+jgXctsiQgMpcWXQ9bKkECiPJ7Ou8JN19syBTM4ixykaPzxGodXq1XOO1BDi
         6MPq/wehcuRYtFHXZOTHc9QmeebUYn7+5Sj0WBgsSOHsLlgiISNc3wd6cLLZV2xjPRCz
         sNOVmdHV6GsT1klIY7JcGojcf9c+rC/XoD6wysBGC0aYmBjTJ0WXFW7nI80jyM5a3uh3
         NtFGJpOcoZVzhb7jvmwZUsCcxuRMIjGHPNdoo4Em1p1oA8Y8kwrnPopSXEsrBA35CCZp
         FRnH05IUGe37BEH4uL9PQLL1ZamGC36qKtB62ccXmliBPI+uUpgVmm4N9QD89HKzsC9T
         igiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794324548; x=1794929348;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PXJAvmxQXstxSOL+heMZGmv93yC12Dwzkd4AWXEIrR8=;
        b=qj9vBPXxBOWEWUNyqDQ9lwvnQP/b+aSX4xgzGVHGc4jFyJURGRdbcZenlM/TkSjdQY
         eOWcg2hR6SqXOL4+f0ksTX3RQRSeQhjIVJMWsNOXx4x9USxYBJqLbxa16xx4xjd1fwJt
         p/I8DfMUzlzM6igmyTpeop87TPDx5TCFpQSoLJVpfyXD5/fdaAlm1G2nGacR1uRhncZ4
         bl5B+WTNFDHj1/IxicTGz3TG6iJ4iwSDJ0OFhQBXY5RR0Aw007d0SdpsidzR9IN4Ryiw
         9fy/683T6KqGXPeYAOcrdv12Xqfl1BqoMbmypd4kuqa0uG/Q2FT96y1+tFOQ4AnDOb24
         GDvA==
X-Forwarded-Encrypted: i=1; AL+hErFSNiLsa57iVh1HH246BF9rZe8fwIFa7xHBpsgnjPjA5KK/1ZvYnWZAsUrW1Py3eQzAZ8A6bD/oHLqnhmI=@vger.kernel.org
X-Gm-Message-State: APuU4Z8wJQIKIc5Ps5m6UWdQIRlEtRckjhZpu55A8ywt8OwW9IISBAog
	Ke9G75e2Ipnyaji2LGInJ+RB/IRC4DEt57q3r2SBJXp5JP/KiJ5f5NfVQ9XY6019Zw0=
X-Gm-Gg: AYBFou3yb5LAu5nqdKWBuYajIRaebgc2750YkVDgoehRd1NIQy2Rec4JnJpnZDwXsoa
	ASnkzA93QI03yVbZP1AeCN0uZBtw+MFCtPAyCtv8Y9/alTyq7YpbAJSC2nRXVq5TU9MggOHWxr1
	BkQlfLy0fOZ38kBE58D8chaG3B/oVWFNuQ+UJmIiw4T+ll5uqpDPfF/TEj0HP+YreYc4yDZFClw
	57bdnHNdIRWb5+Z5rKw4wHKwrt0lP3SauMqafBZPvuvtEgGT+Zd9ahdwHTbfCWIQXiahDL6h7V9
	LLOSMZnueWHL0UgETafWLYItYQjxzwOirF0CvQiPMcKmOsHlvDbJhzXsqF16iishLgJ0/jUzg37
	lM1UJdH1R2FhqA0DNhcRY+JEQus8e12KxMMCZcQJAReLFi8g8xDQ2gjHV+J8pbSmtjexcg56hbF
	++EAGDE7JGncQB26WydF9OutBT+PyTj0SJdra1F2j/srnYzfzStdXTjp56p1FNomaYpVgm4XPp4
	79xRoBW2KQ147XAn0Uu+JHoGuz2NBLxZJeuksSZXQ0WWV5j8mRQ3FS5AC3f7SuWawh0annEcV4J
	PiXFXoSDel6OVz5kZtRAbzMpB+GkvqjA3w==
X-Received: by 2002:a05:6000:2387:b0:48f:bcbf:26fc with SMTP id ffacd0b85a97d-49831ae8014mr5302993f8f.53.1794324547642;
        Tue, 10 Nov 2026 07:29:07 -0800 (PST)
Received: from [192.168.1.3] ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-498365ccbccsm5576095f8f.44.2026.11.10.07.29.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Nov 2026 07:29:07 -0800 (PST)
Message-ID: <ae1300fa-29c7-4ec2-811a-1c7ffd507983@linaro.org>
Date: Tue, 10 Nov 2026 15:29:06 +0000
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
Subject: Re: [PATCH v2 03/23] coresight: trbe: Use helpers for checking errata
To: Leo Yan <leo.yan@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 coresight@lists.linaro.org, Suzuki K Poulose <suzuki.poulose@arm.com>,
 Mike Leach <mike.leach@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Tamas Petz <tamas.petz@arm.com>, Tamas Zsoldos <tamas.zsoldos@arm.com>,
 Suyash Mahar <smahar@meta.com>, Amir Ayupov <aaupov@fb.com>
References: <20261016-trbe_enable_disable_irq_handle_refactor-v2-0-3f57cf3199b1@arm.com>
 <20261016-trbe_enable_disable_irq_handle_refactor-v2-3-3f57cf3199b1@arm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20261016-trbe_enable_disable_irq_handle_refactor-v2-3-3f57cf3199b1@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 16/10/2026 17:55, Leo Yan wrote:
> Use the existing helpers for checking errata instead of open coded
> equivalent.
> 
> Reviewed-by: Anshuman Khandual <anshuman.khandual@arm.com>
> Signed-off-by: Leo Yan <leo.yan@arm.com>
> ---
>   drivers/hwtracing/coresight/coresight-trbe.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-trbe.c b/drivers/hwtracing/coresight/coresight-trbe.c
> index 02d12445763a86d58c79bdf5143f761827456bc3..8ec0b4c4987f25d10ee0b2f80c27e10f76357387 100644
> --- a/drivers/hwtracing/coresight/coresight-trbe.c
> +++ b/drivers/hwtracing/coresight/coresight-trbe.c
> @@ -738,7 +738,7 @@ static unsigned long trbe_get_trace_size(struct perf_output_handle *handle,
>   	 * the space we skipped with IGNORE packets. And we are always
>   	 * guaranteed to have at least a PAGE_SIZE space in the buffer.
>   	 */
> -	if (trbe_has_erratum(buf->cpudata, TRBE_WORKAROUND_OVERWRITE_FILL_MODE) &&
> +	if (trbe_may_overwrite_in_fill_mode(buf->cpudata) &&
>   	    !WARN_ON(size < overwrite_skip))
>   		__trbe_pad_buf(buf, start_off, overwrite_skip);
>   
> @@ -961,7 +961,7 @@ static int trbe_apply_work_around_before_enable(struct trbe_buf *buf)
>   	 *  - At trace collection:
>   	 *     - Pad the 256bytes skipped above again with IGNORE packets.
>   	 */
> -	if (trbe_has_erratum(buf->cpudata, TRBE_WORKAROUND_OVERWRITE_FILL_MODE)) {
> +	if (trbe_may_overwrite_in_fill_mode(buf->cpudata)) {
>   		if (WARN_ON(!IS_ALIGNED(buf->trbe_write, PAGE_SIZE)))
>   			return -EINVAL;
>   		buf->trbe_hw_base = buf->trbe_write;
> @@ -985,7 +985,7 @@ static int trbe_apply_work_around_before_enable(struct trbe_buf *buf)
>   	 *     - Adjust the TRBLIMITR.LIMIT to leave the extra PAGE outside
>   	 *       the TRBE's range (i.e [TRBBASER, TRBLIMITR.LIMI] ).
>   	 */
> -	if (trbe_has_erratum(buf->cpudata, TRBE_WORKAROUND_WRITE_OUT_OF_RANGE)) {
> +	if (trbe_may_write_out_of_range(buf->cpudata)) {
>   		s64 space = buf->trbe_limit - buf->trbe_write;
>   		/*
>   		 * We must have more than a PAGE_SIZE worth space in the proposed
> 

Reviewed-by: James Clark <james.clark@linaro.org>

