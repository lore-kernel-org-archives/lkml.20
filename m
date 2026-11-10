Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794324718;
	b=pzxH8D09/N9enqKgOt9Po5+u7SYSaMFVpexQ06alX+IOhPQmL9e0+5Rnw1BKf34RSzdN
	 bPG9x2TRzNGNMHtqgeXIWf1e9QDkMwE+FV5oTw0LemqK0odnLLTLy/Ybv/FZg0Wm0BB4l
	 lKHZHGGQfnsvj2IP0MDacR9WwyIHYRBarAJU8+6ZbYd8GyD4I4hESxHAY9tf+kMz2vfVc
	 aoWxPIQFg06Wsem3MaP5oL2hvW5rsGs7gtVVdAo63S+2lp7MSYybnuymlNfJ8xrKUmmEr
	 8NuIixAX3NKRSTBUetnn29/llOP0iHPe3fwYK3LYfG258ZZFv/kXMb+WamXZTQNnv8g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794324718;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=rJjgX6E2Iz7NtAxo/Ej78l7jtNhnUtuzxHSnkCpGCgw=;
	b=VWSH4jM72I+TrGsfGJwWUa3RMhcqIVQaAi9zo4DDK1gtdU1TMYQ1HT0zfM/WJVZEAuZp
	 wPEaU3yL4N2ai2mLPcQ5WzInjqc1+NG+aRDrI7niiFRu0oaRTAYPXHOv16ufwxAEu2US0
	 88a4k65X1cBu2yedXMQUCacvbK6QJiZPCTXmZsu6T26zC0uw+FYGmxCxUWVb2JItFX/hz
	 sJ7td9eQkBqiYCqeIQmWYHlS6iYqbbSjYUVlUsCKDPpDjVohFcq973mH2AA3zbAY5Hlya
	 sxJze36H9Het0Bw014i5u08CiZb2ngU5GkfhsV3+pttLaHF9D/QSeHsJmapE+oFHzTA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b="qdk1/GAg";
	arc=none smtp.remote-ip=209.85.218.50
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFC6360A2617
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 15:31:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BFC6360A2617
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=qdk1/GAg
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-c4d58c50743so140761866b.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 07:31:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794324716; x=1794929516; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rJjgX6E2Iz7NtAxo/Ej78l7jtNhnUtuzxHSnkCpGCgw=;
        b=qdk1/GAgnPdfBW0blGc59nzK/yavphqI/dYgYV5J4KwPKWYvIMN9mgMgzetooBKAo4
         /R16WXP0YW6Cjo2ZetiGP7SDRdPW2RX3bkQmtMBv0TAyLeOgfqe9C41cMlK38R2sFPpG
         qY4whmVLoei9RQTIKvdu0YIKpy5iNxkXE9lofjy/fN8XC2FgxCHqsnzN8U76hXe3AHFT
         NKnY3U/AmB/O1FC4sdHeVkjwkZmKzjSBiO6LstVFmMuB0+xiKEfJ9FOPOL9MafxcfPzL
         ZrSYXz9UNXNLoXR5Senra0OU3zlAZvh/dx3uiEC2kEsHD3LMSdbyzEzO3szoqMzYw7Q4
         p0AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794324716; x=1794929516;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rJjgX6E2Iz7NtAxo/Ej78l7jtNhnUtuzxHSnkCpGCgw=;
        b=EjsMBr05j4Nyb+kEf/DiuXpgBuQa6FOhwpv1eCN4E0Uw5AmNMJF7zXQr6PexohCfVu
         imyJzaam1NUjvx9KhcH4gUUzojqMl6n2w4pPaWzEiqQc3mEh/g17iQ3Y7B2SydEhuAyg
         QZTpHYFzS0nyihW1P19nB7REIZETsYrrzyxZOE4RQqlcZQqy7A4OqQEtYTWuq9p34jwh
         g80smRbyhKEmZh2Y/t4wxELduEqZ2FtQKc4IAioKM++B+Knqf3VQjeSXq0AvRdy9WN4Z
         coOMSPWfHpPBhwctIKlH9leRhQEm9W6a4z+xQV8RVHJ0Yz3MyY5mjPozFY4Qi1gdAK8C
         76sg==
X-Forwarded-Encrypted: i=1; AL+hErEEm2YcYBA88HL9GUyBtSFenDGrc96+FNdPUsXbG/wZv8d8G2pw69X7IrGEK6OZWgX/00CRp2d5h+Hj+J8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+K9DnGLNWnrRyTmhfY9WoKMExiDilTVAlofEl7hAwihfQ/eUp5
	cc5ueE1Dor4uZ2ljqZKUYjR9Ub0zwv+Vv4PDquJVDRbPWXEEWjnfNFFa+txnlq7+lvAOD1Gy1bg
	aFcxgtVw=
X-Gm-Gg: AYBFou3HRSHXrqTM+uywYA0osQS5kyLvupP5b7wP2njxeXeVKqmSiOUPGddsPdkAbJQ
	NxX90Tp4tlHLryuL/IexfTYyBAn7pHk3Ky7FE3GfOPfr2qukrKG0zntJPmM8CJ2P1gOrAFhXAah
	javXmuuqc5+x192plM0Q/Sc4oObIYJJRrr0+3cpL4H22A4cCTF+jSAr3t7XjvZB3P8TnUQ5qsVw
	192HktIZqqkpZ5PjhSK+msDR141gAjhgT0tTbCpq6goSHpagPyMNQ2NXd7sg5ANKozLhaz7qAsp
	cnq8GP7ofrKT1SLMf+sxImVXkD8Z9kXD7GW8lMrPBFnBnWxUV0+GO9CE+FwbSRoCLPOvjX4CDB7
	IMyXkr3M4Ty5tAsj/qugo8fhNuqnRBTRRRgY6z+YBOazvJF+biHQtQhdSzZ3186BdJ33h29BcRd
	Sv3avyXfBK5vDU1YSJ2/5RVJGgut0IlK0meC0CQjsfXAOyt8mK0zVicB1xRz5pFmHb3rmlz6qDz
	05jyl0Ke3tQd+w9mhW6QW+esaQSUyVdnI+cglme80Gi9cGugwTcvnUG2VRzOZfSho4J0tJsr37M
	C4YVAsh+HXGzLf30rMlvoUxGJqG2RWhBml8=
X-Received: by 2002:a17:906:8a6f:b0:c48:ddac:7eb1 with SMTP id a640c23a62f3a-c50496e7f98mr179676266b.45.1794324716129;
        Tue, 10 Nov 2026 07:31:56 -0800 (PST)
Received: from [192.168.1.3] ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4984e26f8e3sm4917105f8f.1.2026.11.10.07.31.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Nov 2026 07:31:55 -0800 (PST)
Message-ID: <1b528cd9-eac0-43b3-8166-db9f78c9f044@linaro.org>
Date: Tue, 10 Nov 2026 15:31:54 +0000
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
Subject: Re: [PATCH v2 11/23] coresight: trbe: Assign the perf handle in
 enable and disable
To: Leo Yan <leo.yan@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 coresight@lists.linaro.org, Suzuki K Poulose <suzuki.poulose@arm.com>,
 Mike Leach <mike.leach@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Tamas Petz <tamas.petz@arm.com>, Tamas Zsoldos <tamas.zsoldos@arm.com>,
 Suyash Mahar <smahar@meta.com>, Amir Ayupov <aaupov@fb.com>
References: <20261016-trbe_enable_disable_irq_handle_refactor-v2-0-3f57cf3199b1@arm.com>
 <20261016-trbe_enable_disable_irq_handle_refactor-v2-11-3f57cf3199b1@arm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20261016-trbe_enable_disable_irq_handle_refactor-v2-11-3f57cf3199b1@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 16/10/2026 17:55, Leo Yan wrote:
> etm-perf owns the perf output handle embedded in its per-CPU etm_ctxt and
> passes it to TRBE through arm_trbe_enable(). TRBE binds that handle after
> successful sink enable and unbinds it in arm_trbe_disable(). The handle
> object remains valid throughout this interval, even if the current AUX
> transaction ends or a new transaction begins.
> 
> The inner enable helper currently publishes the handle, while truncation
> and failed rollover clear it. Sink disable leaves the handle installed
> after dropping the buffer association. These assignments track the AUX
> transaction rather than the enabled sink session.
> 
> Publish the handle only in arm_trbe_enable() after successful setup and
> clear it in arm_trbe_disable() before dropping the buffer association.
> Remove the assignments from the inner enable, overflow and truncation
> paths so the handle association follows the enabled sink session.
> 
> A valid handle object may have no active AUX transaction, so the IRQ
> handler continues to check perf_get_aux() before accessing the
> transaction's configuration.
> 
> Signed-off-by: Leo Yan <leo.yan@arm.com>
> ---
>   drivers/hwtracing/coresight/coresight-trbe.c | 20 +++++++-------------
>   1 file changed, 7 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-trbe.c b/drivers/hwtracing/coresight/coresight-trbe.c
> index 4a041bbc6e970d72a7d735e15f7221037cb091d6..1f51c33de83638479436683fd96e31d69c3b860f 100644
> --- a/drivers/hwtracing/coresight/coresight-trbe.c
> +++ b/drivers/hwtracing/coresight/coresight-trbe.c
> @@ -303,11 +303,8 @@ static void trbe_report_wrap_event(struct perf_output_handle *handle)
>   
>   static void trbe_truncate_event(struct perf_output_handle *handle)
>   {
> -	struct trbe_buf *buf = etm_perf_sink_config(handle);
> -
>   	perf_aux_output_flag(handle, PERF_AUX_FLAG_TRUNCATED);
>   	perf_aux_output_end(handle, 0);
> -	*this_cpu_ptr(buf->cpudata->drvdata->handle) = NULL;
>   }
>   
>   /*
> @@ -1012,7 +1009,6 @@ static int __arm_trbe_enable(struct trbe_buf *buf,
>   	if (ret)
>   		goto err;
>   
> -	*this_cpu_ptr(buf->cpudata->drvdata->handle) = handle;
>   	trbe_enable_hw(buf);
>   	return 0;
>   err:
> @@ -1042,6 +1038,7 @@ static int arm_trbe_enable(struct coresight_device *csdev, enum cs_mode mode,
>   		return ret;
>   	}
>   
> +	*this_cpu_ptr(drvdata->handle) = handle;
>   	cpudata->buf = buf;
>   	cpudata->mode = mode;
>   	return 0;
> @@ -1062,6 +1059,7 @@ static int arm_trbe_disable(struct coresight_device *csdev)
>   	trbe_drain_and_disable_local(cpudata);
>   	clr_trbe_status();
>   
> +	*this_cpu_ptr(drvdata->handle) = NULL;
>   	buf->cpudata = NULL;
>   	cpudata->buf = NULL;
>   	cpudata->mode = CS_MODE_DISABLED;
> @@ -1102,16 +1100,12 @@ static int trbe_handle_overflow(struct perf_output_handle *handle)
>   	trbe_report_wrap_event(handle);
>   	perf_aux_output_end(handle, size);
>   	event_data = perf_aux_output_begin(handle, event);
> -	if (!event_data) {
> -		/*
> -		 * We are unable to restart the trace collection,
> -		 * thus leave the TRBE disabled. The etm-perf driver
> -		 * is able to detect this with a disconnected handle
> -		 * (handle->event = NULL).
> -		 */
> -		*this_cpu_ptr(buf->cpudata->drvdata->handle) = NULL;
> +	/*
> +	 * If trace collection cannot be restarted, leave TRBE disabled.
> +	 * The etm-perf driver detects this through handle->event == NULL.
> +	 */
> +	if (!event_data)
>   		return -EINVAL;
> -	}
>   
>   	return __arm_trbe_enable(buf, handle);
>   }
> 
Reviewed-by: James Clark <james.clark@linaro.org>
