Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EB5B4AD4C9
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 13:14:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792156477; cv=none; b=EbGfC2snng7wFNC/m/IDvo3KnkGnkM+3QjWfwVGwhMjc/mQR+d3m5AHAKnhdVBjSzbVYuvdxzefJ1sABmRY9nNkOKIBvS2pJwAWSmX0n9IP86LPoH7jQQo4ECxrSA29a/8UEhrffIw/AkBfb43GrLrGtwcV0/0mXkOxOzI+lDmI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792156477; c=relaxed/simple;
	bh=/NqlYCkwEDnx+3z9fm1ChPu+6B52abvScuA7rF51W+g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mdRu3VtMFqBww3tA6JTi+qhwzAgl/15UlkgbZFQl7TXJsMWOSacuv9fZmjp4xjLyj9cE7F3JpU8yWPiQYLBDJPe5yT+9k3Jhwh9X8edR1OStv532UJxW2i7m0MOKFWJvw6w/0M+DjZvZnWTlAZRe+hq8JWLPO8pFmkNS0JjzaEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bHp+X4Hj; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bHp+X4Hj"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a1cef0439aso6036735e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 06:14:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1792156474; x=1792761274; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tsX0Fx1Vu5oxDkz2SE9XCwKJJhLzTUajSbyoGIgpXkI=;
        b=bHp+X4HjM2aDZUEFiKJhGIOw2ggxHGI10dBWExn21NBPT++/Q9xNCdYULAwZiCtZbt
         vaPvYYnqEQQBHRsdO78/EJ3Wt7v+lgw7YTWgf+ue0Pf+USQ3rW8ZG4J92ePwR2N6BH+A
         GdVCFK4tJtC72SQ5ekTWNiKLiqwr6xQSQYhdS3BBeWLmfrFGtRbpa3X4XZItAWuBIRCi
         hv6bQGNa2SxJ4q0V/y97/I/yG3v6zbdYb+Ku1htuL6RHtX8MrNtWxdfUS/AKBqPB7vYq
         2IiEh9uxWNPc1f+eU9U05J6RCdzIlJclPQRx3QpqA3udvKWSPXdBkvH4m6/fD3D1T8Vx
         bFQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792156474; x=1792761274;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tsX0Fx1Vu5oxDkz2SE9XCwKJJhLzTUajSbyoGIgpXkI=;
        b=rfnCDM63bmj92AKYaPNF49ef0Tgv8Voyr7dlxubZskjhDMDGovR9MSPxmPe0xaRiZF
         KQNzfLfkVwbjJSPdHsllgOAI5GpBGU/Fi2dN8emaHLkld3D+uJcpMJHpTrjgsu34qbeM
         f1gu1bI1B0d0wneFWsVA/Db+5tdNbxbtvnkW6Ri5OdXsjV72FvChjh4lrHXrTVRiz1vc
         KYIMvNoGs/LrxAMK0sr06KHm1iK6LpQ5GSx7uE0FWeYPzQ3K6RkXs2FG62e3Poxrncj3
         7pFIyjomb8bJZ+qYBv2etDxUibzT2PQY3ZVCYb3y7Agh+VWKNZ+gRVwO/2oDkdJFXi7Z
         Mm5A==
X-Forwarded-Encrypted: i=1; AKwUvBy6smJJZ0/v40L4RwNDnD/FSYM8Lz3DUdHaZdnCbAUgOnTcAM1F81sCMi5OGChMFjqPs6x+yzdeloIY4Rg=@vger.kernel.org
X-Gm-Message-State: AFq9FYJkyKQeYO0RQPGRebg8aB0k/JzUiDv4WHzSQ4c9chIaxu30bwF9
	j8niRlkwhFA7XiKgHJ1+QsanTYOcJNR9i1nv+Mp6DRhw/geLMNIjhmrvcOFXJelF+7M=
X-Gm-Gg: AYBFou2TCOLs4A7+KdFOOX70ql35qUup5+eF7pv9tDDOCwwOTOeACp+WGlmZjtcV6br
	1bv61584VI6esd2Mwvn5U1Yrl+o6zU1YIPtb6X01bTYipTeqTcY9Cb0rxdfRlwaYYQzb4zdqNgP
	JRF35BNstj9l2Vvi3RK8E3WwsD6DSWnRlFc/ElWj5DKE40tZSHY5epT/2D51bdZ/vB4yUbq7gDB
	RAWQyppVzg8A0H/0ccwwtAZFZvXFSM3I2AReTQYZe+Wl0hCmwahER6ks8MB62OXOe39wUJVV0BO
	0hBQINWf4abbUAYlT87sOkKrWw0DxlRfAbdSmx4QC5yaj6PJj7IBVOS1GDV6sDMu9Kv5rhif/tG
	Ap4GffuHr1ZR3QJZlBrhbcjnxJ+L3dIIifd2QjwGulo9/aTzmuGH0p0+CD+8nj8lSksaKzRwiWj
	r8tmUf7S8Zl7PvzDTxeBhjO0u+KB6tZXO99UJMXko4+oLJFPMhVoCRUJaaRXgkCQZ9CiavttCdZ
	Hk=
X-Received: by 2002:a05:600c:3144:b0:4a1:70b2:8dbb with SMTP id 5b1f17b1804b1-4a18e4b0347mr432306165e9.19.1792156474596;
        Fri, 16 Oct 2026 06:14:34 -0700 (PDT)
Received: from [192.168.1.3] ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1c8ac4c70sm45400235e9.2.2026.10.16.06.14.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Oct 2026 06:14:34 -0700 (PDT)
Message-ID: <13ac34bc-fc8e-43b8-8976-05e91ae46e71@linaro.org>
Date: Fri, 16 Oct 2026 14:14:32 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/25] perf/core: Reject non-positive AUX snapshot sizes
To: Leo Yan <leo.yan@arm.com>
Cc: Ingo Molnar <mingo@kernel.org>, linux-perf-users@vger.kernel.org,
 linux-kernel@vger.kernel.org, coresight@lists.linaro.org,
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Arnaldo Carvalho de Melo <acme@kernel.org>,
 Namhyung Kim <namhyung@kernel.org>, Ian Rogers <irogers@google.com>,
 Adrian Hunter <adrian.hunter@intel.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@arm.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Yeoreum Yun <yeoreum.yun@arm.com>, Jonathan Corbet <corbet@lwn.net>,
 Suyash Mahar <smahar@meta.com>, Amir Ayupov <aaupov@fb.com>
References: <20260915-arm_cs_support_aux_sample-v1-0-35cf6f297d20@arm.com>
 <20260915-arm_cs_support_aux_sample-v1-1-35cf6f297d20@arm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20260915-arm_cs_support_aux_sample-v1-1-35cf6f297d20@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 15/09/2026 16:48, Leo Yan wrote:
> The existing validation rejects negative copy errors but allows a zero
> return. In that case no AUX data was copied, but it is incorrectly
> passed to the alignment-padding check.
> 
> Reject zero together with negative errors before calculating the padding.
> This reports the invalid snapshot result and avoids treating a missing
> AUX payload as alignment padding.
> 
> Fixes: a4faf00d994c ("perf/aux: Allow using AUX data in perf samples")
> Assisted-by: Codex:gpt-6
> Signed-off-by: Leo Yan <leo.yan@arm.com>
> ---
>   kernel/events/core.c | 9 ++++-----
>   1 file changed, 4 insertions(+), 5 deletions(-)
> 
> diff --git a/kernel/events/core.c b/kernel/events/core.c
> index fe33fe15689d077e7f445c0b17d9c2e638c884a1..17355e4b8b7c6c106117153c9eb8509e6f9a41e3 100644
> --- a/kernel/events/core.c
> +++ b/kernel/events/core.c
> @@ -8058,12 +8058,11 @@ static void perf_aux_sample_output(struct perf_event *event,
>   	size = perf_pmu_snapshot_aux(rb, sampler, handle, data->aux_size);
>   
>   	/*
> -	 * An error here means that perf_output_copy() failed (returned a
> -	 * non-zero surplus that it didn't copy), which in its current
> -	 * enlightened implementation is not possible. If that changes, we'd
> -	 * like to know.
> +	 * A negative return means that perf_output_copy() failed, while zero
> +	 * means that no AUX data was copied despite a non-zero request. Neither
> +	 * can be treated as alignment padding below.
>   	 */
> -	if (WARN_ON_ONCE(size < 0))
> +	if (WARN_ON_ONCE(size <= 0))
>   		goto out_put;
>   
>   	/*
> 

Reviewed-by: James Clark <james.clark@linaro.org>


