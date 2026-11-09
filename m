Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794242405;
	b=MAA/1qXGEgWJWgrTwufc3ID9d9xa2UpjsRo5bcmihTz0RcDYkYtvK6/GjwHxMKRdBiGG
	 nWhbrH32fflIGk5ml808cgv1BY5/9JGYuLmDHLfJvmOZlBxXqDyXZUdUZgqxr+KGeuvvA
	 T+jgNDvBIlVhCSSX1YVmyXvWq47318d5KjlKOlNp0ecUoummW0y08DqhY6+oSn/1oQP31
	 kWPm1BSjZWROzrwUJggRUZBjTGmNHTUUB5l3yQj1cOkp32twYNeQCBg1KsObGCj764JuU
	 rWPKQgddOXFHGsc6AVEBa1fhL8j2+k9R4ImKlGIiPfS9kkZmd+u6zn4wlNDktNwAcwQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794242405;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=sx1g5ye6adgoDbOeyAiWR4bH+5HwaMNsR4cQud6nf1o=;
	b=JFBdIzWgrfRpexhUxMVweAHQDC7FAH1wYKXAA/gjzpuzpm/N3QsJMH1mrHtiCkHz6zl7
	 grb8eYxqGcKWjx+PdvsZlqNWWI6QAajhUvuycouxQ2D+bhdjCcujef0aIIKgFRncRo9N2
	 ntzJW7CGa9irXFcjwyH+LkAGd3CnuTBBYw3RS3OnjDeWAFPIgCmHRMAsaY0B1Y5+Uc/f4
	 bKDzYsftmuzfGPG78Q+HAzhUA/5XNC6mcmCaOiK7VbgMu8A2A6mp9vqYSlv087TuMPwHZ
	 jmtCr0qvCYLirvdI+HyZaMd+zGXqqYdbGq5umjESeiNehRonv3QNqx6rLelp7bIoGvQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=yjvPFWmp;
	arc=none smtp.remote-ip=209.85.221.42
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9960606AAE4
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 16:40:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A9960606AAE4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=yjvPFWmp
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-4919a880834so699634f8f.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 08:40:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794242403; x=1794847203; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sx1g5ye6adgoDbOeyAiWR4bH+5HwaMNsR4cQud6nf1o=;
        b=yjvPFWmptTmbe4nqP5DJRmin7mC8MYiMqcPkWbj+uvYMzdfX+8c7EmRswX3pmykMQk
         Y0gR0aFbjkofVwypvzIq4bHs98YQ2wsHURDNqzPE/Gv/noL4Um8h3hGvYaCZdeRaQDwI
         dk4ilNUE8oYtazNIDGMY5MVAFNhOQ6zU2KMwnefUmIrcfZqWU0pzbRPoSXXJaXzWArWL
         NzplsK6VNRCv+n+UuKQCmht0WRALAbH6f9nA1Q4xXFtv/9Qjy96lj4kNqShg9SIpBtO2
         hnlHNSQhIUDzvOnrVq9QzRs6oUHRm4oJGDVGuskwIFoioah8GhY5omww546tAq4DdWBP
         gxvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794242403; x=1794847203;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sx1g5ye6adgoDbOeyAiWR4bH+5HwaMNsR4cQud6nf1o=;
        b=EBu6gNFHBw7Sg+t1S+BcxkgQNiel9Hpn/eeSKSIMUl/qVeObbp/VJ5nTuHFt3O+8xh
         7dzqoYsRGD7zTtzicUas3ZD/CJKIbv3uVg188GUtqOV0k4rp/vJ2YpX4AYuVBSM/tdbz
         oAe4uY4/pFzZVhx5M9ZhH4BbkE/6AVffs4vKZTi7qYfoftAiwpgBwryAZfe9dqI5jhqz
         xdI96gJXLIN9lHd5I0NA87CmqFJ9rgTBxYzdAMlJnRQqS4nSQa1YBe6Nwlvz4Zwzc0lD
         kIOIvXOT22uVkxvIfuM8ZqVkR9K55wclJkq7ZOyMklHvgJd0roXa9ZkNvoHsRJXbOagZ
         7Ksg==
X-Forwarded-Encrypted: i=1; AL+hErFPxlZGgncBCeL2bDL2eJZ/KKnT1haGwd99MgP4n+okxvcjT1xXioYFFqI1I1Qomthc7IAvhrpZlDx5JCQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z95aGMC8UvKSqsT2D17iLVyJIVhD2oFfnCStEL4xKvvmWUrvyaf
	ysNyDWx40Rl2WLmBU243XT7zSYYccuURlerFnPRNu4lLF0Eo4rVa6E2z72rc15mYp4w=
X-Gm-Gg: AYBFou1CTPspCMUOK569s1iNN/2WHMEYXbfR5YbLMfxZopehD87Wv4E8JCLoZiksXEo
	LnrrcuvMN68UAIZYo3HdIQXuRMWd+WKKuaZ/eeF+G8aeH2Ob/gMirkBTyPcgVDy4ehqzcldyH/K
	WagZcgPeoBwJBuyJcaJtpvWacaZ66BpkEa38ayUYj56bJbMlARuL7XBqSEr2nsCcazHnO34UOog
	lIFquUXu8FyZ6FtJGluZFeJDN/23jz0rz0Rnqf52bCRoXAUsZqnRXk11b7WKzG5zWGh2LyNq1E0
	ff0/Ft73hvMHZb+fh8u+fTRPVm9AajfDDH9quA8fy50yAM1KfuuTJ0SxprhwC09I6tYF/nywss+
	mRBhJLHFwpOMVnR74uUM56i+sPrVQLZtb3OsvWP5ewN36jvYW2GFztiBE79ZBRIzQr2eHUlHgJp
	Y8Wj2pJO4SwWdra5w85rWIDAXQkBjOUctjB4eamjtNB4IthwW6GBjIb4CRs5/FR7356Pjktaoee
	pHn0nVERvp5hOCvpWT02UE+JBWLzGXbCIReteP1P28Q9YTDu6pqLJPwlG6ZL3oWEGsRsR1SypcQ
	xhWeDSwaHPB89D9zhw==
X-Received: by 2002:a05:6000:1848:b0:494:bf39:21a5 with SMTP id ffacd0b85a97d-4982e82bf9emr1102f8f.10.1794242402825;
        Mon, 09 Nov 2026 08:40:02 -0800 (PST)
Received: from [192.168.1.3] ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49596ea5008sm11062337f8f.26.2026.11.09.08.40.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 08:40:02 -0800 (PST)
Message-ID: <f8a2f477-2dc7-45a9-a2f0-f6e279ebf8f1@linaro.org>
Date: Mon, 9 Nov 2026 16:40:01 +0000
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
Subject: Re: [PATCH v2 09/23] coresight: trbe: Clear TRBSR status at stop
 sites
To: Leo Yan <leo.yan@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 coresight@lists.linaro.org, Suzuki K Poulose <suzuki.poulose@arm.com>,
 Mike Leach <mike.leach@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Tamas Petz <tamas.petz@arm.com>, Tamas Zsoldos <tamas.zsoldos@arm.com>,
 Suyash Mahar <smahar@meta.com>, Amir Ayupov <aaupov@fb.com>
References: <20261016-trbe_enable_disable_irq_handle_refactor-v2-0-3f57cf3199b1@arm.com>
 <20261016-trbe_enable_disable_irq_handle_refactor-v2-9-3f57cf3199b1@arm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20261016-trbe_enable_disable_irq_handle_refactor-v2-9-3f57cf3199b1@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 16/10/2026 17:55, Leo Yan wrote:
> TRBSR_EL1 records the status of the buffer that just stopped. Clearing
> it in trbe_enable_hw() postpones cleanup until another run starts. If
> AUX output cannot restart, for example when AUX space is exhausted,
> that clear never executes. Clear the status in arm_trbe_disable()
> after disabling TRBE instead.

Why is leaving it set a problem though? That's not mentioned. Maybe 
there is some later patch that requires it?

It seems like clearing on enable is cleaner because it only requires one 
call to clear, but this replaces it with two separate calls without 
really saying what the benefit of the extra complexity is.

> 
> trbe_handle_overflow() can start the next run without calling
> arm_trbe_disable(). Clear the stopped buffer's syndrome and status bits
> while TRBE is disabled, before attempting the AUX restart. This also
> leaves the status clean when the restart fails.
> 
> Signed-off-by: Leo Yan <leo.yan@arm.com>
> ---
>   drivers/hwtracing/coresight/coresight-trbe.c | 10 +++++++++-
>   1 file changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-trbe.c b/drivers/hwtracing/coresight/coresight-trbe.c
> index 26e7554d6bdd31f8a55a8bc3a7b6d4c49b984b9b..dd9c9330bb0c739795f300dafc6ce34e72fbf280 100644
> --- a/drivers/hwtracing/coresight/coresight-trbe.c
> +++ b/drivers/hwtracing/coresight/coresight-trbe.c
> @@ -655,7 +655,6 @@ static void trbe_enable_hw(struct trbe_buf *buf)
>   	WARN_ON(buf->trbe_hw_base < buf->trbe_base);
>   	WARN_ON(buf->trbe_write < buf->trbe_hw_base);
>   	WARN_ON(buf->trbe_write >= buf->trbe_limit);
> -	clr_trbe_status();
>   	set_trbe_base_pointer(buf->trbe_hw_base);
>   	set_trbe_write_pointer(buf->trbe_write);
>   
> @@ -1069,6 +1068,8 @@ static int arm_trbe_disable(struct coresight_device *csdev)
>   		return -EINVAL;
>   
>   	trbe_drain_and_disable_local(cpudata);
> +	clr_trbe_status();
> +
>   	buf->cpudata = NULL;
>   	cpudata->buf = NULL;
>   	cpudata->mode = CS_MODE_DISABLED;
> @@ -1095,6 +1096,13 @@ static int trbe_handle_overflow(struct perf_output_handle *handle)
>   	unsigned long size;
>   	struct etm_event_data *event_data;
>   
> +	/*
> +	 * Clear the status. No context synchronization is required here,
> +	 * since context synchronization will be performed before TRBE is
> +	 * re-enabled (see trbe_enable_hw()).
> +	 */
> +	clr_trbe_status();
> +
>   	size = trbe_get_trace_size(handle, buf, true);
>   	if (buf->snapshot)
>   		handle->head += size;
> 

