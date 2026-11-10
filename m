Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794324697;
	b=IUDx61hMSJMCUMOs+ldhMuga8QmPyKjxwoXIAOHsdDTSCHgZaud8FyDnB8BD9c0gqDSM
	 P7nvvVBZ7UdyqB4Z5I3EYN7NLUudZ069R/5fgmdnRNWSTRxQ3tr0RiiSxryGnI7TUyXFc
	 tvHe1FxJpOf30j+WatS4/e8ZI40+houRdDH9upo3wqZL5tCDqVN4257vn50pcsCrotTy/
	 373g/n7izajBZ7ig3EdmUzcDGlmvJuvZ4p2AJ/nJ0N/ZnIzfGfMW30zJOkXQlSclYNp9p
	 nPlQDT6b8N4kd+CXJTDC2xYqo+EirYdeEfIP//1aZgqD+RfJ727vO6k4sCkND4TpUsQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794324697;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=P9CCZPVFgS03WxJsvAf+y67MqFmcRV8SPG30b8JscMs=;
	b=aPqzVOdSGkN/6Zt/nhPoky0eo9Z/HNZTQpzGprCl39nmRPs40/8Nf7iKbulfFbufGtd0
	 Piwd8VJTm7/j9+jV4OG4OBKWfo5Aj6McOfKbq7y97RiR8HkKsy7Ouaxgzh49tzuTDH6Nv
	 pZXhi0nCdNL6mF4Ahe7027XS4ddoZX/8Ch1APS8qR3uEZmjLfUI4LRAKDACpvo3dCXikP
	 0eGr5hezI6A6+zzbKuefSU/o3engSIC2CME/r+wV6xvIVH2L5fWwkvlQRe4YIcF3fAmvp
	 PG5zu9dEimFkIEIbwLADooUGQtdEByDsItTfFgHdm4Bh9mqfcUl4OgYZukWM4ciliCQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=JVgMNZQn;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B1A2606A333
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 15:31:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9B1A2606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=JVgMNZQn
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4b467581b98so20219185e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 07:31:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794324695; x=1794929495; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=P9CCZPVFgS03WxJsvAf+y67MqFmcRV8SPG30b8JscMs=;
        b=JVgMNZQnda/esBJSbxZastldfZFtg2sN/fllpzn9JJhrBhTSoVal1oXjSGvQl6/XwP
         S5AfN/IIDvXHU0fkOjdbwNk3DPDhLETzeff9K4qZqnw6RmXPS8tQrkSgRIzGKJMOnr1i
         sBxZHE2Y4ZEpZBzaBSuqCkCfZEaiNL2JwvMOlag6O8pSyWyZgEPM35NkIkxmJgHpa/DV
         2xaXep2VGEZa7vbIcUlBQyll0qtufH8sHSsWCu2jqaaN6Lfur0eBFVazOoVQ0UglwLcT
         uG3SFYQp0sPoMKyrQMPP2mTcYZyhFnboKZt9DojznA446DJPg6wgt/bP+Nj2M0LiRAkF
         1U2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794324695; x=1794929495;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=P9CCZPVFgS03WxJsvAf+y67MqFmcRV8SPG30b8JscMs=;
        b=q6vzgRbAvnvdnbaXMA+5OavMHLyEJfdhIkplv6fpn1V60qMskuWr5mQi3CZFJzVH75
         f1LtUFN16+efA6urpZIFyqGWsUO3S1i4e0SMMJs65ltJI+mRlw258iiWAxrk+nYrR03Z
         DEDREtLzlCLFSxiB2rZYymxXJXp1YB3u2AdXUPw3nIhSVWkCcCDx5/9cJB8LM/lwza3X
         W9c/kXlzQt14jN3Lca3pZCUpLcE0A5ME4A2wbSLGsQj8wMQkIJYvYSrfNPHO+v+mA6N6
         VLNsPuhfdu+q7gdQQMorHVJuQHrFPM4ZOof710Ki/qYTPdD3I4/uvK3mEjyI9qS9bw9z
         xW0w==
X-Forwarded-Encrypted: i=1; AL+hErEtqtnSGvQXNFOJb+6w47Ufn4xk4DuYDwrUvsTG3DuMxPbjNu9s/ofaIFzmQbPGUgKqmXS5Fgufpo7b/Bc=@vger.kernel.org
X-Gm-Message-State: APuU4Z9kWN1qEv6XKBtWgJD/brsej+1XkK1VdwYY2iMAyAZHLr0Cd1vM
	CYhlD683JkfplUR9QihrFzrZkTE5K9kVjA+soo9qUmPErajPQUWshLJIrZDNIrC7mUM=
X-Gm-Gg: AYBFou1IVLEvhNiZBVFtTZGWCrDCUx717hD45LJT1mJp2ygQD6xJbXiUPWMDEQjoL3K
	diyBu6Cd9qfO5qxZQaNE7kS4UTdrHoSzcSKqmxywadSobAtIW2mCYkpQz9rlzMJRq6JnN+QzJOT
	38bhljL3nphys1Zaz5P5CeOzhB92pPc+f39PTGmSBxJBDPtvqRMaDnWnZEKeVBsgiJlZZDDXl6e
	wBi85LimE4Qsscvdd7PQbXNfNa1xcdgDK3sN+K6J4BA0glCciFiv+t/7th6SS1EujyDDjSCnk3j
	/usHMZBnxE6hszcCt1m746ygU95yFT/kI1fF/mReM+gK0crdCbxKerwxd1WIAFzbXi9C+nMqCwm
	MkobXACONjfwYTeGfZFHP4Y/P7ykSgaHYrV++mqCjh9AuOsvIBhoGwi47mVMQr2Gr5CPM8rSwsF
	/TZFyQu6xVA1RkLRaO1XQGmLkm/A2YfUGqEj3jotvHZGu/A7iPLtPTKc7q3dXYaVJ6UN/NF9AlR
	tWiOn7tVFa2fkz5Aykru457rlUM63+c8SGrL3N+GifQF6bge8wPUFO20Z3hNdVXq56IwwGGyKVh
	1auNfbSOTJL+qj9hizLVX1Rz+Li5qa8E5g==
X-Received: by 2002:a05:600c:190f:b0:4a6:30c3:1114 with SMTP id 5b1f17b1804b1-4ba0233c53fmr49950065e9.12.1794324694886;
        Tue, 10 Nov 2026 07:31:34 -0800 (PST)
Received: from [192.168.1.3] ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba0236f03esm55774305e9.3.2026.11.10.07.31.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Nov 2026 07:31:34 -0800 (PST)
Message-ID: <002dcf66-ace9-4973-b163-81e79315ce32@linaro.org>
Date: Tue, 10 Nov 2026 15:31:33 +0000
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
Subject: Re: [PATCH v2 10/23] coresight: trbe: Drop redundant disables
To: Leo Yan <leo.yan@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 coresight@lists.linaro.org, Suzuki K Poulose <suzuki.poulose@arm.com>,
 Mike Leach <mike.leach@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Tamas Petz <tamas.petz@arm.com>, Tamas Zsoldos <tamas.zsoldos@arm.com>,
 Suyash Mahar <smahar@meta.com>, Amir Ayupov <aaupov@fb.com>
References: <20261016-trbe_enable_disable_irq_handle_refactor-v2-0-3f57cf3199b1@arm.com>
 <20261016-trbe_enable_disable_irq_handle_refactor-v2-10-3f57cf3199b1@arm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20261016-trbe_enable_disable_irq_handle_refactor-v2-10-3f57cf3199b1@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 16/10/2026 17:55, Leo Yan wrote:
> The IRQ handler has a common point that disables TRBE before dispatching
> the fault action. Once execution reaches the overflow handling or
> truncate path, the trace buffer has already been stopped.
> 
> The __arm_trbe_enable() error path does not need a disable there either,
> as TRBE is already in disabled state.
> 
> Remove TRBE disable from the truncate helper and from the overflow
> failure path. The truncate helper only needs to mark and end the AUX
> output, so rename it to trbe_truncate_event() to reflect its remaining
> purpose.
> 
> Signed-off-by: Leo Yan <leo.yan@arm.com>
> ---
>   drivers/hwtracing/coresight/coresight-trbe.c | 15 +++------------
>   1 file changed, 3 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-trbe.c b/drivers/hwtracing/coresight/coresight-trbe.c
> index dd9c9330bb0c739795f300dafc6ce34e72fbf280..4a041bbc6e970d72a7d735e15f7221037cb091d6 100644
> --- a/drivers/hwtracing/coresight/coresight-trbe.c
> +++ b/drivers/hwtracing/coresight/coresight-trbe.c
> @@ -301,18 +301,10 @@ static void trbe_report_wrap_event(struct perf_output_handle *handle)
>   	perf_aux_output_flag(handle, PERF_AUX_FLAG_COLLISION);
>   }
>   
> -static void trbe_stop_and_truncate_event(struct perf_output_handle *handle)
> +static void trbe_truncate_event(struct perf_output_handle *handle)
>   {
>   	struct trbe_buf *buf = etm_perf_sink_config(handle);
>   
> -	/*
> -	 * We cannot proceed with the buffer collection and we
> -	 * do not have any data for the current session. The
> -	 * etm_perf driver expects to close out the aux_buffer
> -	 * at event_stop(). So disable the TRBE here and leave
> -	 * the update_buffer() to return a 0 size.
> -	 */
> -	trbe_drain_and_disable_local(buf->cpudata);
>   	perf_aux_output_flag(handle, PERF_AUX_FLAG_TRUNCATED);
>   	perf_aux_output_end(handle, 0);
>   	*this_cpu_ptr(buf->cpudata->drvdata->handle) = NULL;
> @@ -1024,7 +1016,7 @@ static int __arm_trbe_enable(struct trbe_buf *buf,
>   	trbe_enable_hw(buf);
>   	return 0;
>   err:
> -	trbe_stop_and_truncate_event(handle);
> +	trbe_truncate_event(handle);
>   	return ret;
>   }
>   
> @@ -1117,7 +1109,6 @@ static int trbe_handle_overflow(struct perf_output_handle *handle)
>   		 * is able to detect this with a disconnected handle
>   		 * (handle->event = NULL).
>   		 */
> -		trbe_drain_and_disable_local(buf->cpudata);
>   		*this_cpu_ptr(buf->cpudata->drvdata->handle) = NULL;
>   		return -EINVAL;
>   	}
> @@ -1208,7 +1199,7 @@ static irqreturn_t arm_trbe_irq_handler(int irq, void *dev)
>   		trbe_handle_spurious(handle);
>   		break;
>   	case TRBE_FAULT_ACT_FATAL:
> -		trbe_stop_and_truncate_event(handle);
> +		trbe_truncate_event(handle);
>   		truncated = true;
>   		break;
>   	}
> 

Reviewed-by: James Clark <james.clark@linaro.org>
