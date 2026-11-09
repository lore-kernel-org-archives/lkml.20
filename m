Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794219628;
	b=xZYSOjhtd8Md6m6aTuul3PiMlzhAOJ3lbBrPEHspLquAI0Du8yZJjXsw2Oc+YwQY+4Sc
	 VlFS+WkUqR5tVocgfmHKopnkFkwRGsYSHIS1fAt+SxNJqviAFldJsh8EQaZB8+Se2jlyK
	 DyDzA4TBQxOuodElj6NrZYXl1CVJCCiQoQv3is5X7P/vz+jbquyOWU+uttVMbbECDoRgM
	 ko33qZv7E0fJxXVLQusUTfS1dYJem8ftu/uQe1vkE3b7hjSF8ZnJlv1Qt+xRUNAbzS+Ag
	 YtwtpY6GODWYNqDSEuOhJcRyKkOt1y7FDOhrYD8Pq8ArqxIldYYjuvjm6MZrHNRWxdw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794219628;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=GyubhaEOLN7D/19FkpOmekZzLJ5vhZuDJz1CV5g+qx4=;
	b=dkT+3TBa1JuleFv+3QJKhP1DLW7HeoBnLyCcPc9Zbl170LZtBVDefUjFL7Rp+/LpMjxC
	 +q6A5wVhaqwah6Ei8COlx2x4SAqPxFTJfZJ0joUyTnztWzyD8jwJ6q32coka110Fuf5NU
	 rhoVo60JcsSQS2OQuNH1mDEg60OHRqSHpFcyGh32Y9h6g7i/fRNiE4YyaG7RElSKiy5ej
	 sEiyMl0stSMkBEl3vv/KzCFOk7WLWRf3d/u8HO1MycsW92AH6Q0c1zv6hXeloTdCbjkjB
	 2fnQ/I2u7NcR+/FzlCGRpPz9HeyvkbPHebbmTqqmYX+zRV6qK3eZnLlH1hVv3DZ50Xg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=oUdqn1wr;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D977606A322
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 10:20:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6D977606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=oUdqn1wr
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a5177d78c7so5440695e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 02:20:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794219627; x=1794824427; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GyubhaEOLN7D/19FkpOmekZzLJ5vhZuDJz1CV5g+qx4=;
        b=oUdqn1wre8mVL4F1FKrBpaW2pDONFwTPsqAAEbdpGfnr6xV5ynF1og7mYCVWUWHijL
         BGvXrc6T2vYgKiPWzB5OmDhZevpcK0TChKgiaZbF8eY9U2nYtHdhDC1qUmOgj3OON34z
         +fYWuENG9lvsqpeSsda7PtsR0gdNzM2+NuGSa8vkpQd0fte45F7UTfh/N/BZK3kjs8z4
         3cH56A9eOS6o5J+YzuAC0vaY52ZjcAbkavCVdumFtz5MX16CybP+M4Vyx3pc+rC9Eo27
         ZesOKQO+FOIZZyh9NeVXEqeHSKg/RgSHCeHPEIuywhM3vC4McmyR3XhM/YSF0LRGRppV
         3Srw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794219627; x=1794824427;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GyubhaEOLN7D/19FkpOmekZzLJ5vhZuDJz1CV5g+qx4=;
        b=S8K65I/whkgYjR/GYAde0eADGK/eU4qYeImh6HbjpPlFDYUVnT8M+EATojM29qneIG
         Bl0nlFwmC2vflz6QYKNLR2lwNAcwNNb8RDHtA7cQCtUTY5MtFuNmFmlSaqjl/5zAiG15
         fkFeLkil7GCmgm5udrjo2AR1+NJvwpuJisFQhlUyTjD5wGJOkGt0i7DTQKygoJzGolPq
         gIPEiJGmTfHe+8GHj+DLYhH8kUnVHZUDIUn5t9TmZBtRXMIVxYC7z6Pkvh43lJFZ31v+
         Cwp+Z/O3tLa6497u94LfYO9XFTD4x6yC8CCBIvo9ft13YkLjBb0rFz5l4UGBXSTriSKA
         zt4Q==
X-Forwarded-Encrypted: i=1; AL+hErEz6ETYjcR5rLlvVoOCVIVhzb7Hj261B+HE9TCCiQ5wL7bVw+jWIkBXSrt7azQ77BCTNwTvT96FFyHWrcY=@vger.kernel.org
X-Gm-Message-State: APuU4Z8kyCan2SEt2pXY/rnBnX+Nw0uaih8a8Dhm4CLqRki/arZtvcsk
	TWshVU9p7e6MX+w2phGLsY0z2rrSaaBU4dg2mm2fO8skjXTVGawyQqIr3Xww2im5/uY=
X-Gm-Gg: AYBFou165/4BKKuq5LljOGoaNJyOXBPVqeTaX8/CAvXYla7P//qH7SMk5uterqH0EzV
	dUqLlaqmxnWQffGAC8pvnU5YIOpp9Bz04NDnliSWxn6TlTKkkU+chCeqgpBy03yqm9LEhyrSgnW
	we9UqDze8JC10/E9dHWpdKPVRIu3Clxis8KHdHgW98gRlPYXypylmNVNQ2NHE6XDbLDaSKVv1GM
	kh+AZBuJg0a+KtDBpwlySlMdiGu/JCHRYz8oi2157aX43rlkGMcPOdcXejmAZ9iHo04fwM90Iii
	lu40ZsGY42y9FaDeVomQGan61oXLw8kWJ94C1QMkcAJZTxHfUop06BzEAOn5M9H89+ikFcg1EVI
	XUEjMnyzkJGj6dgrFK5dkfcmONYg2w0wpbXqLP8V1CfN/3RPbt71cRQ19P+H/jFlR08E8dnkzBf
	HYUpfRQTdOQCWBPBDf+33MXY7t+HnPfOXYaCRduODdSfzwlHn8UnAGfQBYneLbK3lU1skDMayVG
	RGJMNzJsLlsdfv+mo0YKPTq4rvD9UdrRY3hHeHYL4GNx2XAyMtYS9riaPxSKEAdsYXXVTI7U9tJ
	aWfHgh1rzPycDZIXZlin5aX486Krv6nhfhMkYQRsfeJwgqjsxbLE+Q==
X-Received: by 2002:a05:600c:8b45:b0:4a4:4d57:8462 with SMTP id 5b1f17b1804b1-4b963c8ea4emr61122485e9.24.1794219626867;
        Mon, 09 Nov 2026 02:20:26 -0800 (PST)
Received: from [192.168.1.3] ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-495974660cfsm9316703f8f.38.2026.11.09.02.20.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 02:20:26 -0800 (PST)
Message-ID: <5d77f0ed-e175-47f6-af0a-050e0bbc66c7@linaro.org>
Date: Mon, 9 Nov 2026 10:20:25 +0000
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
Subject: Re: [PATCH] perf vendor events arm64: Fix typos in event descriptions
To: TAKANO Mitsuhiro <takano32@gmail.com>
Cc: Ian Rogers <irogers@google.com>, linux-kernel@vger.kernel.org,
 Shunsuke Nakamura <nakamura.shun@fujitsu.com>,
 John Garry <john.garry@linux.dev>, linux-arm-kernel@lists.infradead.org,
 linux-perf-users@vger.kernel.org, Arnaldo Carvalho de Melo
 <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>
References: <20261108184654.3811267-1-takano32@gmail.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20261108184654.3811267-1-takano32@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 08/11/2026 18:46, TAKANO Mitsuhiro wrote:
> Six entries in common-and-microarch.json spell Statistical as "Statisical"
> (the SAMPLE_FEED_* events), and one entry in the Fujitsu a64fx table, the
> L2HWPF_STREAM_PF event, spells prefetcher as "prefecher" in both its
> BriefDescription and its PublicDescription.
> 
> The SAMPLE_FEED_* events are inherited through ArchStdEvent by the
> neoverse-n3, neoverse-v3 and t410 tables, so the misspelling reaches those
> three generated tables.  The a64fx pair appears once, because the long
> description is dropped when it equals the brief one.
> 
> Spell the words correctly.  Event names, codes and expressions are
> unchanged.
> 
> Written with Hermes Agent, an LLM assistant.  Running jevents.py for arm64
> before and after this change removes 12 occurrences of "Statisical" and the
> one "prefecher" from the generated string table; perf was not rebuilt.
> 
> Fixes: 994256a79867 ("perf vendor events arm64: Add N3 events/metrics")
> Fixes: 5497b23e870c ("perf vendor events arm64: Add Fujitsu A64FX pmu event")
> Signed-off-by: TAKANO Mitsuhiro <takano32@gmail.com>
> ---
>   .../pmu-events/arch/arm64/common-and-microarch.json  | 12 ++++++------
>   .../pmu-events/arch/arm64/fujitsu/a64fx/other.json   |  4 ++--
>   2 files changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/tools/perf/pmu-events/arch/arm64/common-and-microarch.json b/tools/perf/pmu-events/arch/arm64/common-and-microarch.json
> index 144325d87be4..c61d6c0ceb4f 100644
> --- a/tools/perf/pmu-events/arch/arm64/common-and-microarch.json
> +++ b/tools/perf/pmu-events/arch/arm64/common-and-microarch.json
> @@ -1340,32 +1340,32 @@
>       {
>           "EventCode": "0x812A",
>           "EventName": "SAMPLE_FEED_BR",
> -        "BriefDescription": "Statisical Profiling sample taken, branch"
> +        "BriefDescription": "Statistical Profiling sample taken, branch"
>       },
>       {
>           "EventCode": "0x812B",
>           "EventName": "SAMPLE_FEED_LD",
> -        "BriefDescription": "Statisical Profiling sample taken, load"
> +        "BriefDescription": "Statistical Profiling sample taken, load"
>       },
>       {
>           "EventCode": "0x812C",
>           "EventName": "SAMPLE_FEED_ST",
> -        "BriefDescription": "Statisical Profiling sample taken, store"
> +        "BriefDescription": "Statistical Profiling sample taken, store"
>       },
>       {
>           "EventCode": "0x812D",
>           "EventName": "SAMPLE_FEED_OP",
> -        "BriefDescription": "Statisical Profiling sample taken, matching operation type"
> +        "BriefDescription": "Statistical Profiling sample taken, matching operation type"
>       },
>       {
>           "EventCode": "0x812E",
>           "EventName": "SAMPLE_FEED_EVENT",
> -        "BriefDescription": "Statisical Profiling sample taken, matching events"
> +        "BriefDescription": "Statistical Profiling sample taken, matching events"
>       },
>       {
>           "EventCode": "0x812F",
>           "EventName": "SAMPLE_FEED_LAT",
> -        "BriefDescription": "Statisical Profiling sample taken, exceeding minimum latency"
> +        "BriefDescription": "Statistical Profiling sample taken, exceeding minimum latency"
>       },
>       {
>           "EventCode": "0x8130",
> diff --git a/tools/perf/pmu-events/arch/arm64/fujitsu/a64fx/other.json b/tools/perf/pmu-events/arch/arm64/fujitsu/a64fx/other.json
> index 10c823ac26cc..6fa2936e427d 100644
> --- a/tools/perf/pmu-events/arch/arm64/fujitsu/a64fx/other.json
> +++ b/tools/perf/pmu-events/arch/arm64/fujitsu/a64fx/other.json
> @@ -162,10 +162,10 @@
>       "BriefDescription": "This event counts non-allocation type prefetch injection requests to L1D cache generated by hardware prefetcher."
>     },
>     {
> -    "PublicDescription": "This event counts streaming prefetch requests to L2 cache generated by hardware prefecher.",
> +    "PublicDescription": "This event counts streaming prefetch requests to L2 cache generated by hardware prefetcher.",
>       "EventCode": "0x233",
>       "EventName": "L2HWPF_STREAM_PF",
> -    "BriefDescription": "This event counts streaming prefetch requests to L2 cache generated by hardware prefecher."
> +    "BriefDescription": "This event counts streaming prefetch requests to L2 cache generated by hardware prefetcher."
>     },
>     {
>       "PublicDescription": "This event counts allocation type prefetch injection requests to L2 cache generated by hardware prefetcher.",
> 
> base-commit: d48723711bae9b8cdc56719c448ba42fef28cbee

Reviewed-by: James Clark <james.clark@linaro.org>

