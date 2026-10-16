Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B2044C9E1A
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 13:30:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792157460; cv=none; b=r42AThsyRydEqk5V/uTIM8yTZftRxaCLttqekFaXvEseHlzJyVTmSr54JZ58RCLT57HQwgJxPmlVzAa2vdsFYjVIqDy8ZaUrwtaARJbl4wuphoKFR+zvdczck56P6fpV+ukNOZ7CrDx5gNMXrDDspCXroarydVtwmChruq6N5e8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792157460; c=relaxed/simple;
	bh=FoawsJ+Jr3o0i73fWcswOJpI48/6PChdwPWdkyAtoTE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DuA6s+l8cGWmnyyhKP13qom/uO5Afm0ClwF7M75D8fXm1m9Xrr10iYBm7bSkErHhfbftujAPr90yEhIlf0cfBYRmy7GMNcmvcDv+dyi4V01p92GovCowuwyXSlY/KSJGCx/MqLlrQwW1D4k9zG5o1TViWG5frLUqKiI9tyTI/nU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CXvi4NOQ; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CXvi4NOQ"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a022fee0caso60336665e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 06:30:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1792157446; x=1792762246; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=apXFfUjY7v6M2DPDE8emOTN5c6EUenT2ynsNF+r1xeQ=;
        b=CXvi4NOQPbkI0A441IkHgixYw8DtfdD3oVtEmDWNY5VwjroGW6KU20B3bl9YcyBFZ8
         sHslnoeFyvwlwYPzHXtbwVltH/pEwA05V601w1NL/G5dRGeVJX7SUTk5rSKJ+o7iOPMI
         cJVWly4JOQjbNq2gLkY5hG7wNxXKsAn+Jss4B3h5mHQME3nH/ZZmV0b+6eW6mwVDpI26
         UL2kOSb/HZOamdcaehAaYNvKgr7H2qhk93pcI+90cTWjTweO1jhxwLBqZheL7n5TiSh9
         hOCGj24YjwB9Ksqw9xJwGAetNKbtmXV5NFvUjz+zMEH01UiLy1XGrUrnOTF4XNKOtNQ6
         TETw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792157446; x=1792762246;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=apXFfUjY7v6M2DPDE8emOTN5c6EUenT2ynsNF+r1xeQ=;
        b=cukH/dgsa24V2m8Bty+FUTGjVJUyb2CZXVYP+x7Ab67XX+82R7ZF7Qf5cH0n7BjlUH
         ila62aa3fWwuW2E42Jb6L1v9FN05yTvzaIFdlqSC4LIivtw2/Aljf+OxFX8Oazvzn+Rr
         sB5Cpddn5wA92sJLJcOXqTdJtho9Nxucp97AOaZ7LiVzYvHcz/jZGj0xa2NyP3CV6ui+
         kp6HnN6ErJWC7zXKD6Hp8UchQgPBiHRuwrzKlXLPNo13G7cWgOM5uH6HppGAdjsBRyQX
         N++OoVbzIHcmLUF9NuwxyCeETLKRzUwf/uxiIOjrM+8EMgQ4qA9li3ivCnrsn/ejyPVE
         SlCw==
X-Forwarded-Encrypted: i=1; AKwUvBzYUKvAt5txvll8k8ECG2CeFD7NU2cMczz0Jj6r5kHxu46mxZrrOzSYivXGsRfoWIl8SOdsjCsbPnIE9U0=@vger.kernel.org
X-Gm-Message-State: AFq9FYLUHUR+qAjJF2QWyFq3bBP/64ffcNtoB7iiIha7WZuMiHpF9ymE
	YbgH5US8XWah54XsO1YLIXv4PLMAtBhBdGuGLptI5Btn0nvsnY4aWsIZFtplEub25XM=
X-Gm-Gg: AYBFou3I4UIxLix1w+YLWmR7bcqF7t6HtrRWIbUpFncP5HkDkVEQzzxgtLFn1xdXcUS
	K0CjBt3ckiOtsqypZTRdKcrppNk/2989h6l9Y1TahSKQAsORLdwguAd3U8I19QGYvDNIGLwyGg4
	WrSQIjLakkLGNfRSxPW0l6XUGtckiuCwpLSIWNa4UiCUpZktfQJs09/hakq1mMz8j9A+TLWXVxt
	SpqSt0/UhzpNTY+Ecq2ru3X7mIqD5ZZ5zyvL7IbIy1nU9FI24Y7vb81bjm4GpeMCa0ERIF6pW+L
	Ej34OVllaXAFhPtC2YbGxdUEhrN/9PMR43V2JqwhRzy5FvGNrPb9fDXzsABl72yEfa9lvS5Zegl
	HVXYygpFe7dN5cO2MoZbZ438JsfYp1K86w1Xv2D2FQavTg042deteyOsBuN5FdV6Qhy6fASqLM5
	H7Yne7xj0/SwSIeFlXUHNxdHNQjsLHuEf7tngB98ITruQ39ZIKtWrLV9duQPvzbM2bmDrmpB8pY
	qHxnSSRpGV1MJTxnD1MYguP67JBsWKM0g2J16nuFW2Sfx8lbsmDgZ+9J2R3eCvEVuJOkWt/yhbp
	GF7jPA==
X-Received: by 2002:a05:600c:83c7:b0:4a1:d456:dda9 with SMTP id 5b1f17b1804b1-4a1d456e0a2mr15854635e9.9.1792157443112;
        Fri, 16 Oct 2026 06:30:43 -0700 (PDT)
Received: from [192.168.1.3] ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1c8ae6d2esm60109555e9.6.2026.10.16.06.30.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Oct 2026 06:30:42 -0700 (PDT)
Message-ID: <ad5f5981-7133-431e-ac8d-8ac064a97f02@linaro.org>
Date: Fri, 16 Oct 2026 14:30:41 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/25] perf/core: Export output copy helpers for CoreSight
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
 <20260915-arm_cs_support_aux_sample-v1-3-35cf6f297d20@arm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20260915-arm_cs_support_aux_sample-v1-3-35cf6f297d20@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 15/09/2026 16:48, Leo Yan wrote:
> CoreSight AUX sampling needs perf_output_copy_aux() to copy trace data
> into samples and perf_output_copy() to prepend zero bytes when the
> available trace is shorter than the requested snapshot.
> 
> Export both helpers so the CoreSight snapshot_aux() callback can use
> them when CONFIG_CORESIGHT=m.
> 
> Assisted-by: Codex:gpt-6
> Signed-off-by: Leo Yan <leo.yan@arm.com>
> ---
>   kernel/events/ring_buffer.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/kernel/events/ring_buffer.c b/kernel/events/ring_buffer.c
> index 1b1ffe0533e58a9d976d0eb0fc23e09d5936da2b..e69ea5b077a5e94b5b6bb1f4c6f0ca5b8a94a6cc 100644
> --- a/kernel/events/ring_buffer.c
> +++ b/kernel/events/ring_buffer.c
> @@ -298,6 +298,7 @@ unsigned int perf_output_copy(struct perf_output_handle *handle,
>   {
>   	return __output_copy(handle, buf, len);
>   }
> +EXPORT_SYMBOL_GPL(perf_output_copy);
>   
>   unsigned int perf_output_skip(struct perf_output_handle *handle,
>   			      unsigned int len)
> @@ -617,6 +618,7 @@ long perf_output_copy_aux(struct perf_output_handle *aux_handle,
>   
>   	return len;
>   }
> +EXPORT_SYMBOL_GPL(perf_output_copy_aux);
>   
>   #define PERF_AUX_GFP	(GFP_KERNEL | __GFP_ZERO | __GFP_NOWARN | __GFP_NORETRY)
>   
> 

Reviewed-by: James Clark <james.clark@linaro.org>

