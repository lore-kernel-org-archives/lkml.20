Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794324591;
	b=e3mlPOGWqTb9rkZlSZs+F0qzfcZ8IFPr7aNGVpgRGQpvM7Y++pQxQoeG8Az92Fl36vN9
	 Uw54cPFP5zwlrTN6ibF+S9280RKHo55t/k+lFbro7OjRTC2ZCs9lOelYjqe7Blq06xDhL
	 qxhglSiBc6afk5Cszxf0LuYW1nJ/Tl2e/sInSY/V/ed/9UYNCuhu3R+lJMJwRWfd/uR5t
	 3GgvKmboAiLBuseLPTvF9sMOSfxE0U4MrQ4JwWaovKi2bxA2U5GGlkGQabcv35F0POykn
	 sKn4XSCc7sC3PiEnOXbMfewBzBmFVGuCeNOQDcVICt9wkiJKTf89cWdrFWpaAPsg+tw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794324591;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=UvMdqZqn+rvCnCGcA12xeOpgSR/QPZFsKeBK3g656x8=;
	b=YyRs0KEVjXsJAH7Uxpsw8H2WP+eWqHvvObuYcCoUiZLWynpU8kJ5fDNPjIe8i/Bjbb83
	 h2XWsqPRw/WK1/u8NSIn5jisExrqkVPSVP9QwVMWiBo634/Fipo3kDa4NFxztgMktNvmV
	 c65r+il38L5EiKGmvalgg8rc544ZICp4Jyw/W63hKObK3kEaUVGOhjACb9E2YO0qbrkW7
	 lXjCv8GV3dn5QZ2Typ+DBWffXOJB7LuaJphpV772vGoAHr3eIYSD3oPz0t0NwPSjGgknY
	 0R5xZlbt405apihCJ+lOvwwTsQ/EII6vD9+fdaiPoPxUpTjMpLmykQ4N9UjfUAK0EvQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=wPuNbTCv;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D127606A33B
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 15:29:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1D127606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=wPuNbTCv
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4afe2d546f9so28796235e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 07:29:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794324589; x=1794929389; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UvMdqZqn+rvCnCGcA12xeOpgSR/QPZFsKeBK3g656x8=;
        b=wPuNbTCv6eTM/BfFWCi5lzNZQ/2GXs28gH8R/TYSWgzw0uYHqIcfZG+7zgJNENIw3W
         /+CWrDZ6zkAzE39bL2HF3p34gS1TWLl6P57Br48/O88vh4r9o6i4Brx/F3aarBCelG2c
         vRQGLmtWFhzrnJIQeRFGX6Cp56QoDHl+F1DYzF07MW987pHFM9aJtHrGmDUzg7FIB/Op
         XvxEejFjcgzyV2CmfBuH1Omg3Fn6sVvBaHaAwsrFAHDzaGqCMhGRGNwRd7TpA9kM2xqr
         whT9Y0QBzoy+XDKBRAMNjWPm0TBsCzhutW3C0IJ4052JE8wTi7x8EAAW5tiHKtwlsSN9
         +KyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794324589; x=1794929389;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UvMdqZqn+rvCnCGcA12xeOpgSR/QPZFsKeBK3g656x8=;
        b=h/bu6PmkMeLAws03VKz32bXkeBrYqyKfYw4m4l0hCfkapIdTR87L3mnYIb/jokwzWy
         sv5Wi/M/zBLyAFQnyiNdxLa2Yh2D+wRkLXxnZ6NOT6M3T4w5F+/zpmrwijfvdcnBTR4X
         pH7r44we6z8XMbytt6nYW8wTkqxdBbC3MIBwEaO7TJApgLUk8HAws2WWNUqLI5qs1XxA
         2Z+oChUNM0Sl6yEp6/49eIYhRDzJLIxg7yyQJw+rcT5I+myBauKNDv3tSWqPWoWpaUOD
         qGRDOYpeOqhyQeBsvEVRM1UHwMLCuLDiMi6IfXV/ct4t20gqbspztsFpk2HnN2B5eW20
         1GAQ==
X-Forwarded-Encrypted: i=1; AL+hErHqnHQXlBq3dtgz2+v6Cvl17hoZACB4ATXoNE9f9PfqnLscWWdvSmo9VBWyq/HPUvg8cObOpgqeQOr0dls=@vger.kernel.org
X-Gm-Message-State: APuU4Z9KNtBBj2M8Se/Mz1xxngCYS/qAxp1yRc/kjn71thKv1Ul/uBh3
	+f+FgRaBeFF+tfcvjdQEAKx8LmX67Kb9vzzKF+imBl9L3hIUkbEUGO0zqohvrHajGd4=
X-Gm-Gg: AYBFou0hbD1zCZsxGAgTg7NQ4xFrhP/adHiZLuOvhWDybS6JhExybnvMzmwKCBBr4Sk
	aHuLTN1OqJNIJAfbf3xmOTba4lYja/k3NUgn0CEcVmk8c53QHeSbuE9Qe/U4hEdiRMA2uRTHMDV
	rc/J8aUpFEDj5YbpvU/O9ksiksAEnVi3SUQzucTMxa7KZBdMR6mdKKCx+93bmBXm8JoCzBMuzq1
	g+jl0blGgVe0XGp+8gkXbkKxc+2NM9IoZRB4bG3BC3qBVw+9gBlcVrggQqEKFVQnt+CnxfvGDTq
	1BNHsqwj03J9/xcUyAeWx/lwPlwDZoQsTccjA7vc41Zlv0MZ4p4in8iwOx2Uozb/UjaiR9xpTWf
	OzjMI6cscV5BZsOQykybi0KfTb14iIGSP7VX93j4BwelgajFwkNgoUVNRVtpq6dhpHvQ1WDKA8e
	a7EFBYS6ALAHNkETckx+ZrWscZ+NC+ZW7QE3GfxcgLBSV1NhBjVOjx6G0hJnlh/Z5VtPaprL1vY
	fBzUcfEdnrlyNWz1gTAf5E9EpMh9pBk2ELfibTxHyk3S5W7VDvHmhHNmUUoL3ppUeQmb9MJXsyw
	cV0kTJ86HzwGwO1wRwqdGcKhjoVYnrwX9A==
X-Received: by 2002:a05:600c:8588:b0:4a2:cbe:bebc with SMTP id 5b1f17b1804b1-4ba0234cf6cmr40952855e9.23.1794324589131;
        Tue, 10 Nov 2026 07:29:49 -0800 (PST)
Received: from [192.168.1.3] ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba02345d22sm81654185e9.1.2026.11.10.07.29.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Nov 2026 07:29:48 -0800 (PST)
Message-ID: <e616fa33-10d0-49f9-8299-a6ccdd5c1edb@linaro.org>
Date: Tue, 10 Nov 2026 15:29:47 +0000
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
Subject: Re: [PATCH v2 05/23] coresight: trbe: Validate perf handle before
 using sink data
To: Leo Yan <leo.yan@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 coresight@lists.linaro.org, Suzuki K Poulose <suzuki.poulose@arm.com>,
 Mike Leach <mike.leach@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Tamas Petz <tamas.petz@arm.com>, Tamas Zsoldos <tamas.zsoldos@arm.com>,
 Suyash Mahar <smahar@meta.com>, Amir Ayupov <aaupov@fb.com>
References: <20261016-trbe_enable_disable_irq_handle_refactor-v2-0-3f57cf3199b1@arm.com>
 <20261016-trbe_enable_disable_irq_handle_refactor-v2-5-3f57cf3199b1@arm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20261016-trbe_enable_disable_irq_handle_refactor-v2-5-3f57cf3199b1@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 16/10/2026 17:55, Leo Yan wrote:
> The TRBE IRQ handler calls etm_perf_sink_config(handle) before
> validating the per-CPU perf handle and its AUX transaction. This may
> dereference a NULL handle after disabling TRBE or access stale sink
> data after perf_aux_output_end().
> 
> Validate the handle and AUX transaction before accessing the sink
> configuration. Move the local buffer lookup closer to its use.
> Remove the warning for a NULL handle, which is expected after
> disabling TRBE.
> 
> Signed-off-by: Leo Yan <leo.yan@arm.com>
> ---
>   drivers/hwtracing/coresight/coresight-trbe.c | 15 ++++++++-------
>   1 file changed, 8 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-trbe.c b/drivers/hwtracing/coresight/coresight-trbe.c
> index 91fbdbad3676ffae399df0b4d4ddcd603a40e86c..a7c1037a048f5236598f8f3a7cc4f47bff9d329c 100644
> --- a/drivers/hwtracing/coresight/coresight-trbe.c
> +++ b/drivers/hwtracing/coresight/coresight-trbe.c
> @@ -1150,12 +1150,18 @@ static irqreturn_t arm_trbe_irq_handler(int irq, void *dev)
>   {
>   	struct perf_output_handle **handle_ptr = dev;
>   	struct perf_output_handle *handle = *handle_ptr;
> -	struct trbe_buf *buf = etm_perf_sink_config(handle);
> +	struct trbe_buf *buf;
>   	enum trbe_fault_action act;
>   	u64 status;
>   	bool truncated = false;
>   	u64 trfcr;
>   
> +	if (!handle || !perf_get_aux(handle))
> +		return IRQ_NONE;
> +
> +	if (!is_perf_trbe(handle))
> +		return IRQ_NONE;
> +
>   	/* Reads to TRBSR_EL1 is fine when TRBE is active */
>   	status = read_sysreg_s(SYS_TRBSR_EL1);
>   	/*
> @@ -1171,16 +1177,11 @@ static irqreturn_t arm_trbe_irq_handler(int irq, void *dev)
>   	 * Ensure the trace is visible to the CPUs and
>   	 * any external aborts have been resolved.
>   	 */
> +	buf = etm_perf_sink_config(handle);
>   	trbe_drain_and_disable_local(buf->cpudata);
>   	clr_trbe_irq();
>   	isb();
>   
> -	if (WARN_ON_ONCE(!handle) || !perf_get_aux(handle))
> -		return IRQ_NONE;
> -
> -	if (!is_perf_trbe(handle))
> -		return IRQ_NONE;
> -
>   	act = trbe_get_fault_act(handle, status);
>   	switch (act) {
>   	case TRBE_FAULT_ACT_WRAP:
> 

Reviewed-by: James Clark <james.clark@linaro.org>

