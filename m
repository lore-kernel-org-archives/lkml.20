Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793180110;
	b=ow5an7bZVfnRXMWD5WpUlQRhdlBO8XZKxDDEov7DeFL+OOraqY8XDiF474EFhfNpwfD4
	 DFNk1gY5ENwF3u3wQaIStvcXjq+PoUFF+J2BNd3HdHYT1jA6QSZb2RFyOQBB5Rn9oR0Z8
	 b/0vbF9T+Ob78oM/bNBgKhMBlpTUmd9960uDBiXBMkgL+4RAhQLv/hC+ZeJfCHMdWDu+g
	 vwXskJnoR6G1+sX4/VfsP0zJVoramQmuzmHFoHbUia22ceBq36Sf0k52rPPxq+cnj3/hJ
	 J2DDXo0qLiHibNjdlA+W4p8RLt19LIADC1UKXh1id4bOCD86ZRjKCyX73nfGJNN0i0g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793180110;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:References:
	 Content-Language:Cc:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=A9WtHaR8QfonQLgULw4WHEldvGjq6xiOMZLZlTl9tks=;
	b=Ou3CQsif/DgYoZXeVdPh127IzcPWHJgsf5GQgfL63Ird9F0Gb/JnQ3sKrSVQAlinFqc7
	 mefiaGwQ6VLFcLhkwS5MGZHpWbYLlO9MxYtIkooSaVqslqghcS3AsZpmmpcPQqlFTeQjy
	 AZhAzvijA0CryCWk6yBgdTiqzBzag2o/cCiIPuHHItMx0RVGWjGz5xSSlIlZu7TwcVpmY
	 v1EYWnLgTEP1g/CvCZFtvES2NGO1lhiyov8fotz/EmDk3C79XxkXe2gMlcEyuGtrotSzD
	 bk2IgY21KrLR4UVAmMjreYcop12jHpPx3LtVw7sG5onDVOGanFfUfvKmBz+dIt6Y01g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=njQEsn09;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E197D606A31D
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 09:35:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E197D606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=njQEsn09
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a4d7ae1ae9so6229615e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 02:35:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793180108; x=1793784908; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:cc
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=A9WtHaR8QfonQLgULw4WHEldvGjq6xiOMZLZlTl9tks=;
        b=njQEsn09fvS2qLgUSPr7CUN6b0DhFo3LFa5YydyA2W619HsLxQg1aYjdqLqWiLJNF4
         fxd+H6ZHHNbk0JsP3/0Y3mUil9MLvr1gX4iru1ddsAqraMYLiqhGhfC3Ip7k7vJ9i/UK
         t6q8OJ9kJL+15Sx5JAZ9h6Y0/RWQ4O6dJ+4omrd97ywnE7l4AVjWdpMQvpdVckyMsaWz
         8gxFm2p3dAAnnYYahwx/C0tRKiErZh7PH2MqXG/GcPTiKRB16GLnaPrdTf9zwrNKvjGI
         MLXWwcrpvgOmnXC3rYXSG2AGKcYxagvRhBUN/L1TVy0ThgTJutG/OcgkZ97YIV+bt+kI
         qfRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793180108; x=1793784908;
        h=content-transfer-encoding:content-type:in-reply-to:from:cc
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=A9WtHaR8QfonQLgULw4WHEldvGjq6xiOMZLZlTl9tks=;
        b=rpleix3+YIjbo+c6V45qK7T2KeqDZXGDWFRq64N3Rqq5Fk4zIfY0vTXLskvq1wsnwF
         q8mTm+TwHw6ka14D8i/2C4DeqX5CnNRJ7AN5hQ0KlzY6iNrYO/N3+b2D/b3GTIxgHAcp
         NNMkFTbDCPe+tCilhCnuzl/Pelr2uYK2Y8t8KlYN53TwB7bIkaqxfBz87QZ7HE4m03dj
         64z/u53WA/gQxdubkmYNuQ4lVZTjqdH1Em6kvt8aDpHpAW40rP70VFY+bgYn+E1DXEEf
         ja+cNozLpyVW4idHVDfTnSPQ8fbMBzP6/wYJMNQ+YEs70CmRIWw08porMzBAIkoSKNVF
         KItg==
X-Forwarded-Encrypted: i=1; AKwUvBx4wZ2ZXD9AbNNp0A5C/47UPzAGfQ+y+9KrSUKfnyYZWWiWcxxk6cdBlCbeeyVNi1lsrxRZswEWm9O3hf8=@vger.kernel.org
X-Gm-Message-State: AFq9FYLMEQ9f3jrKB8JE5XDtDFHLyOpYWUunKVYsx4vLis5dr1eKxw1N
	emy/pb9xhPDpJSKxU8dVsDqkueIKg1XxrZ1sxzc7EFZP46HPbfECLLv5e5PEPglcvLM=
X-Gm-Gg: AYBFou0BAHVMNoLtAzvWM2y/Yuc7A0NpKj/eR2Ot4HuGdCw/07nopgBJUf+lPi6Ahuo
	iwJrd6gw2D4abZF+G6RO21M7OGe7mxl09v8tpvCXmN2w1t2bECzVqe4WYS5cY8QM8hgiLDZ1ukH
	BFRdJNXiEfnEOz+GNJxX8RhT86TiCXXTYpS3gZUQDV6en4CjKQDQk7izRRoNkJqoAm99IiffWCs
	EPjsEEDpS3TW8vp9fehdGso+9WihPHEE5HWPeICh19AdT2ljgg2Wo/XWDtv1iypOSupv3QsTLeL
	ebYuSCjYogd8qVhbN4wQ74IOfOgnQlDREVbCj5zPIwPphW6k6nrfCL6X2uDqeq0Ib4p09in4B2Y
	5NPUAqioUvBhVPdQ3Q+gejLy2Y1R61SZgBD7C/yb6umiZNwlJWrBU6p8i1XMKfJXRrdfAR6wV94
	XRorVCNrvb+qlZl59+XAQNb9StoYT/bqqvIzuIRCfLfG1o092CKbCCE47skiHRXmBGM59ICfi4N
	SRfhp0mn9tZPYh+nXmy9ye3OX9HtaRUBhwZLbES5o6PIosXgYh5dLTjwsAUYw1eEHhKqP9litBx
	T68ZVYfzjGmBMcZxZZOEv9/fCKGftTmk+g==
X-Received: by 2002:a05:600d:12:b0:4a1:d97e:cd60 with SMTP id 5b1f17b1804b1-4a9672f8166mr25922195e9.16.1793180107988;
        Wed, 28 Oct 2026 02:35:07 -0700 (PDT)
Received: from [192.168.1.3] ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a977edc20csm28371725e9.3.2026.10.28.02.35.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Oct 2026 02:35:07 -0700 (PDT)
Message-ID: <d3886efa-5be4-4cdc-8990-ed56b044a5b3@linaro.org>
Date: Wed, 28 Oct 2026 09:35:06 +0000
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
Subject: Re: [PATCH v1 4/4] libperf evlist: Recompute CPU map when an evsel
 goes system wide
To: Ian Rogers <irogers@google.com>
References: <20261027170415.2815859-1-irogers@google.com>
 <20261027170415.2815859-4-irogers@google.com>
Content-Language: en-US
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Arnaldo Carvalho de Melo <acme@kernel.org>,
 Namhyung Kim <namhyung@kernel.org>, Jiri Olsa <jolsa@kernel.org>,
 Adrian Hunter <adrian.hunter@intel.com>,
 Ankur Arora <ankur.a.arora@oracle.com>, Howard Chu <howardchu95@gmail.com>,
 Thomas Falcon <thomas.falcon@intel.com>, linux-perf-users@vger.kernel.org,
 linux-kernel@vger.kernel.org
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20261027170415.2815859-4-irogers@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 27/10/2026 17:04, Ian Rogers wrote:
> perf_evlist__go_system_wide() marks the evsel as system wide and then
> propagates the evlist's maps to it. __perf_evlist__propagate_maps()
> only assigns the PMU CPUs to evsel->cpus if the map is empty, but an
> evsel added after the evlist's maps were created already has the user
> requested CPUs propagated (e.g. the "any CPU" map of -1 in per-thread
> or workload mode). Going system wide then leaves the evsel opened on
> the wrong CPUs.
> 
> Drop the existing CPU map before propagating so the evsel is given all
> of its PMU's CPUs, as is expected for a system wide event.
> 
> Fixes: 811082e4b668 ("perf parse-events: Support user CPUs mixed with threads/processes")
> Signed-off-by: Ian Rogers <irogers@google.com>
> ---
>   tools/lib/perf/evlist.c | 5 ++++-
>   1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/tools/lib/perf/evlist.c b/tools/lib/perf/evlist.c
> index c1c5b0684eed..46de69aa5a86 100644
> --- a/tools/lib/perf/evlist.c
> +++ b/tools/lib/perf/evlist.c
> @@ -835,7 +835,10 @@ void perf_evlist__go_system_wide(struct perf_evlist *evlist, struct perf_evsel *
>   {
>   	if (!evsel->system_wide) {
>   		evsel->system_wide = true;
> -		if (evlist->needs_map_propagation)
> +		if (evlist->needs_map_propagation) {
> +			perf_cpu_map__put(evsel->cpus);
> +			evsel->cpus = NULL;
>   			__perf_evlist__propagate_maps(evlist, evsel);
> +		}
>   	}
>   }

Reviewed-by: James Clark <james.clark@linaro.org>

