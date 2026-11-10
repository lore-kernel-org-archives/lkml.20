Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794324937;
	b=x9FR6raU6YgOCg0ceq1B3QJ/ZXtUxXI5SHTnfwHzCxyVtTgcAf+R5++GWqJOrZCBD7+o
	 xKCIJIcca/eqA/s7Pm1+rdt/btamoyEbwh+NvOShWX2LNTtewbX7Y434xRvo/eIJZ83Kr
	 FERx5/uYjG7MoABkFRw7tIAC8Qn6XuUOnbDPvvLt1hBVjczKvousQVEIWrZU8i1Rj8fsB
	 crIzAtYZE8AwOTPVHqdQ53FO3dHGL+kiLE4Tb/j1ITkXj/LoxKRWcQZEMcAJ8UmkT0HBk
	 LXwf2uYuGIaC1AWbn9acZf5fL5jtLC3Cy4Zxl0NX0vyikhmf/t3PYhk7Efk/VO2stfw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794324937;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=+Sc8+E7NzYjXnp+JW1pX3E6P5CdKsFyTsU2jebgSnJ8=;
	b=pbNSfuq9LPJ4Kc3du9TKKrUeYNow/AHpywD7JTOTDk0/g6deL0aiiajNSQsMoklAM0wP
	 6L9AqbHbuu2m8PdkyOSs9GH7Z5153DLu1KX71mjk+OBHLpsZQDUVjCivxNsFCi6JhSJPf
	 eyL6XtkPYSeVD7uLalwKNFeaUrvBNXaQETVE0+HOC40+Tj1CCDjvVUShW2KP3TU2KMquu
	 KgCcNP/VwkgQI9q045xzith9oE49pjqHvcdNNbDA5lpHC0Xui6cgUJWAh6YUIm8dKrpxN
	 G4jIvcLFuW9I7Q5hfqVP5OT8FbhjiY7f1KVbwjwbR0s+dbBUtRvbmw0Fu7/TSydnkzQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=k1OKKcB1;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 053CD606A330
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 15:35:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 053CD606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=k1OKKcB1
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a20bdaf39cso23346445e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 07:35:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794324935; x=1794929735; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+Sc8+E7NzYjXnp+JW1pX3E6P5CdKsFyTsU2jebgSnJ8=;
        b=k1OKKcB1omChioPEqSStN/fOkM0jIssQSBRfTpn57iC5UNisJwcb6BW/0/yeCadVqX
         7kx0r6+Z6WIcv5h+5dQZhKAMAB892XC1wyk1BxXfs/RRM8gVyXX9G9uYvnuNbks92wXR
         AB8Gzv4gYc9Bh3T/T0oLnvsHXumw7NJ54WhYzsi0Pp/X/+3xYcM0r1JR6YAvs1uRSsqY
         fHRaqExItI4peC7dNJGtUKvkmc/aOEwU0NTK0ToxHByCHg2K16xvjqnqq3IHw3NF6iXF
         u3ZrEFfhK8ZxD87vLYqNnnfu08HRvPNAJKlUkBdZHGh3WLhUgQhY6L7SQ7PttuHZpXfp
         E0PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794324935; x=1794929735;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+Sc8+E7NzYjXnp+JW1pX3E6P5CdKsFyTsU2jebgSnJ8=;
        b=KhF2elN/YF/NNa9ovGWtcDeMgsrfQ6m/xnCWkdfrKYdID3u2qBHFOczmnAlsvqP7a8
         X56QCxleB/nahCExd/bNDjqv2PeimkoKHuq7lbKWVcTLQBthh3jQZSf70dQyMqbsXJOK
         4+uAOlbMCI7UBLO+6iqqhD4P62r5xcpCcIrVVCPU2u7p8RZyy8oXKjQ4S8Q4YbMrPVku
         pvfW/zI9d/yh7gcy0IfMK32tTkYPT+zfofYZrOXgUGdgNi09zoFQqtkxQtyuByvugbOR
         jlu9KxMxTQHpg+ibd4EXtbwuwdQIioJHi9Omq3LwIfG9jzqiq1+GiLouUbCakHvU2uxe
         IprQ==
X-Forwarded-Encrypted: i=1; AL+hErHuHgFWu6Bj8DXEuSYV166kp4IVIuz9sB/kn1Y2FNyaSA4sdbl3EtGqb58ySGfj0amnGLcAFpCYhzyR9po=@vger.kernel.org
X-Gm-Message-State: APuU4Z95p/BPt8KZw+UUVj5/V6aamZgHCcAnUhjWeApU+6a4oRNXzD1Q
	LR2F0fXn2SjkdTBFRjog0tO+sElYZyrn532wRbzh+0zlnL8p95yP+PDWnbjh54c2NAU=
X-Gm-Gg: AYBFou3c7Qnthsjc+q3EUjzeQhLek4XMnMFk5mjMWgUC1/4T/bBKqVnaAJAqjQzs8sx
	RrPmtvpiUG53Y7BCAJcoN0rEIEnokCr0ajr90ekPnvkJq/MypZnABzJz7fDFkt5+0RDNiBwh6FU
	m8TQtOCQBYcMjM83y+s+8FNRgF4xi093phg3OUBP4GYDJ8dJHTjIUt1v6Wgk1Pqw0gGGLa54UVQ
	ZewmFmCN1XFG77AirFlA+ktpQCcUSUKJRwMvJ3sLtXLLeGe1UKid0hVo87qOWLmZKceueQ/PoUr
	Cz/yafkSRRMx8Ui08pd129t9afrS4HRch1RtxHcXFpZpPlMHiRzUwvYoQ0azJav1zSuR5RqV0iC
	dL3MtPrsj7PlhzXEhxoCQMpJLBkYmHoxBQMI4Pmo9P8VObG3VkHgiOtWNY700LgVUS74PioNpzo
	BqYXq/gVJFwbP2cAp2abH2EpHGcAcX0Gnb79IEAIbWVMHRBsLjAy5gWAOaWvBii65eK4jkLzcrh
	XcOiJJbFlEhVynipm0/sY9WoZaoMkIni0hJJyXfQMZbcrXdJm4DhmhP7wUTqz+DPVxFepzBcBgl
	hxf/ps5+YJnvVv1IjzUaVqK9ORk/tLsmHCA=
X-Received: by 2002:a05:600c:3544:b0:4a2:a3b:7aa8 with SMTP id 5b1f17b1804b1-4ba023053d6mr59691535e9.3.1794324935300;
        Tue, 10 Nov 2026 07:35:35 -0800 (PST)
Received: from [192.168.1.3] ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-498363dffa1sm5521925f8f.39.2026.11.10.07.35.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Nov 2026 07:35:34 -0800 (PST)
Message-ID: <85fb9774-c61e-4811-a023-b3171a289e21@linaro.org>
Date: Tue, 10 Nov 2026 15:35:33 +0000
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
Subject: Re: [PATCH v2 23/23] coresight: trbe: Report trace gaps with PARTIAL
 instead of COLLISION
To: Leo Yan <leo.yan@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 coresight@lists.linaro.org, Suzuki K Poulose <suzuki.poulose@arm.com>,
 Mike Leach <mike.leach@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Tamas Petz <tamas.petz@arm.com>, Tamas Zsoldos <tamas.zsoldos@arm.com>,
 Suyash Mahar <smahar@meta.com>, Amir Ayupov <aaupov@fb.com>
References: <20261016-trbe_enable_disable_irq_handle_refactor-v2-0-3f57cf3199b1@arm.com>
 <20261016-trbe_enable_disable_irq_handle_refactor-v2-23-3f57cf3199b1@arm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20261016-trbe_enable_disable_irq_handle_refactor-v2-23-3f57cf3199b1@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 16/10/2026 17:55, Leo Yan wrote:
> When a fill-mode wrap stops TRBE, the trace source can continue running
> until software handles the stop. Trace generated during this interval
> may be lost.
> 
> The overflow path now stops and restarts the trace source around buffer
> reprogramming. This emits ASYNC packets so the decoder can synchronize
> with the next trace segment. Use PERF_AUX_FLAG_PARTIAL to report the
> possible gap instead of PERF_AUX_FLAG_COLLISION.
> 
> Set PARTIAL in both the overflow handler and the buffer update callback.
> This also preserves the gap indication when event shutdown handles a
> pending wrap, even if no further trace segment follows. Limit the flag
> to stopped buffers.
> 
> Signed-off-by: Leo Yan <leo.yan@arm.com>
> ---
>   drivers/hwtracing/coresight/coresight-trbe.c | 29 +++++++---------------------
>   1 file changed, 7 insertions(+), 22 deletions(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-trbe.c b/drivers/hwtracing/coresight/coresight-trbe.c
> index 6bc82d5b55539795059da37039d2929b4ea504e3..29a1882b1f3c2eb7166f71eeef37badece67039c 100644
> --- a/drivers/hwtracing/coresight/coresight-trbe.c
> +++ b/drivers/hwtracing/coresight/coresight-trbe.c
> @@ -285,25 +285,6 @@ static void trbe_reset_local(struct trbe_cpudata *cpudata)
>   	write_sysreg_s(0, SYS_TRBSR_EL1);
>   }
>   
> -static void trbe_report_wrap_event(struct perf_output_handle *handle)
> -{
> -	/*
> -	 * Mark the buffer to indicate that there was a WRAP event by
> -	 * setting the COLLISION flag. This indicates to the user that
> -	 * the TRBE trace collection was stopped without stopping the
> -	 * ETE and thus there might be some amount of trace that was
> -	 * lost between the time the WRAP was detected and the IRQ
> -	 * was consumed by the CPU.
> -	 *
> -	 * Setting the TRUNCATED flag would move the event to STOPPED
> -	 * state unnecessarily, even when there is space left in the
> -	 * ring buffer. Using the COLLISION flag doesn't have this side
> -	 * effect. We only set TRUNCATED flag when there is no space
> -	 * left in the ring buffer.
> -	 */
> -	perf_aux_output_flag(handle, PERF_AUX_FLAG_COLLISION);
> -}
> -
>   static void trbe_truncate_event(struct perf_output_handle *handle)
>   {
>   	perf_aux_output_flag(handle, PERF_AUX_FLAG_TRUNCATED);
> @@ -917,10 +898,12 @@ static unsigned long arm_trbe_update_buffer(struct coresight_device *csdev,
>   		perf_aux_output_flag(handle, PERF_AUX_FLAG_TRUNCATED);
>   		size = 0;
>   		goto done;
> -	} else if (act == TRBE_FAULT_ACT_WRAP) {
> -		trbe_report_wrap_event(handle);
>   	}
>   
> +	/* Trace may have been lost before the source was stopped. */
> +	if (act == TRBE_FAULT_ACT_WRAP && !is_trbe_running(status))
> +		perf_aux_output_flag(handle, PERF_AUX_FLAG_PARTIAL);
> +
>   	size = trbe_get_trace_size(handle, buf, act == TRBE_FAULT_ACT_WRAP);
>   
>   done:
> @@ -1246,7 +1229,9 @@ static int trbe_handle_overflow(struct trbe_cpudata *cpudata,
>   	if (buf->snapshot)
>   		handle->head += size;
>   
> -	trbe_report_wrap_event(handle);
> +	if (is_buffer_stopped)
> +		perf_aux_output_flag(handle, PERF_AUX_FLAG_PARTIAL);
> +
>   	perf_aux_output_end(handle, size);
>   	event_data = perf_aux_output_begin(handle, event);
>   	/*
> 
Reviewed-by: James Clark <james.clark@linaro.org>
