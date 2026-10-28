Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793180094;
	b=NZA2A7gfgCyXyIlP8SXj4DB0cWMLU7rqjWgiYzw3GsgPxCnQfB77OxyoTMLZV5tvFaMx
	 bQCXcCT+WCXFkKMUDFpUIqFsJLkCZZOrztuyp0k8PSFNyv+LcKKj6axFtPgLtQDCVWzso
	 xW/kmGpFyChYAMsdagU01VygXpUGECow50UAWVdRtId4O+EzC+W2W8Ps/VrIH19wmXZcB
	 6X4sRYdsDjvoi5MIweBgE1ewVRabiP15OebrvLHnQh64FMjUVOK6oNExqKQIeM3zm7P2x
	 SI7ih44XG54sD1+4g3pukgaJmrCiFI9cThCP/myEw1pqIDqnwEQa0rsDVDsGjx51Xkw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793180094;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:References:
	 Content-Language:Cc:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=Uz7TxrCpEZWGCaZAK5ft/7H16VUw5+yLoLa8TVo/kwI=;
	b=0VmUvVQwk7bwKvHJprrLdqCfHI4zK+AtPk5dO73oD5EW04CmDjsISLNnpl80S+9f263g
	 ofwHnpMQF/juZ8LIWl/Qx/my17ecAX++WSFqtFDQ5xFIhduVElsGOJRytr5PBdOMEQNDp
	 fBUHiXmcBwJHmwaeTdgkafPA7fHSNui8hyJo4FAsSQKc5tjobhMkYrfIYa0YKiIcXnVFS
	 nw75f2mfD2aaA/8tS+W3II26ZfQUQIa9APLv2n/fuDICKnOJeVIuc2sLvLkhB9U4eqwFa
	 5vvx7ovb1NLm9oIkafxvSZul1RM+i/b/sh+d0L8u/i6kn6qhDMYNtZtvcRaHAfstCpg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=EQFEy+mu;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89670606A31F
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 09:34:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 89670606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=EQFEy+mu
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a3517554f7so6315005e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 02:34:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793180092; x=1793784892; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:cc
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Uz7TxrCpEZWGCaZAK5ft/7H16VUw5+yLoLa8TVo/kwI=;
        b=EQFEy+mu7iktLDiJj6AZRU6+0a+7CJtJoH/UAPBsJ+SxyK0zJhI2cupQq6MZqkMj8d
         pOPnoVs4Kp1Uaho4cQRcXHfktFN+kqHA4zX4qPL3aKTAzlLu3Pwrq5EBG/qC1tvLGkBp
         xr7F6mcFiRKfEtpPBMmptWSzS6Hq/U0vrfRIspn7KtWjVI1ZZ+sFDKsKalzuqbqEJn/1
         zA9f7YDgUoScUpF5l50wst2+q2an52Rn/GCF9MSMdDlVs4SF8f3XN3Ogm16YGmCEPEo0
         2IFqN2AW2UjGuI6FaB2gBpSaZzUaNw2+gw+5QlkV7UfKYB4ftrBchPLZYlCB4Qh8ce5K
         wAzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793180092; x=1793784892;
        h=content-transfer-encoding:content-type:in-reply-to:from:cc
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Uz7TxrCpEZWGCaZAK5ft/7H16VUw5+yLoLa8TVo/kwI=;
        b=Gc9oiB7PhARtZlRYhx4ze/KVxzyFIbhDJQ4bVO50fvuMb8f22m0vrDuhBSp5VBP4wL
         GVfmklUAP8g8VpFdoRQ9GoAL8qj145+PzE6njyyFMXVbxPjvCFVwb/j3ljRwdhfWem7K
         nB85RgD+xN48LWzgCypYVo+X6IcYhwefyLx4DThczrYAoIpCp3RLZmdg8jAM2GWw7xW+
         QWUAeDP+tEIHGf4PeP6y2/j5dQjivjkL/wx4HCjXbN8JZGat/zl7nESjrrzQa7kC3+we
         7S3eaUkFsDsAzIXXBLEFJM6uHA2kyzARu9nU/eynXXOqkNLNbDSLe4/qMEP6U3T15mjo
         plGg==
X-Forwarded-Encrypted: i=1; AKwUvBwblFTc3ZKzgooaFoOZF+psBdFIqwcMdOqv9eFdqsAREaq7316DKsxv8Hh9sNYy1MvLLQlWTvnV4XxsWM4=@vger.kernel.org
X-Gm-Message-State: AFq9FYKN21ylvCAmSb+3EspNl4jn667Inr+/erEfUznwjzR0kRYb8SGL
	+4Uu+qoZNdU0HHX9/3JVUO38+GfFrLLvMeQyfIcM/t6U/yZqXamTx/o8rLMPd7Vi6p0=
X-Gm-Gg: AYBFou1PMLSq7FY28v5may7VTtg9KHjbktzhLRkrpmJsrUsNnk5jQ9K6+URX4CUmAR7
	HHQfZ7KCpVMmWdkimfnS8W37ZtYBhwtBTST40WaM3R0YrjTWd/HguGoZxsmCmigajX/snl78LKC
	IgHE5hNlhh2q1y62Or8WmK0DA3fsHlN2QfXSauiJizASfjw+oEIIGEZE76R6PyQI8o+DvZd5/rt
	vBfmc+cf9OQZMoGvzvNzJjaKVbDWklHTFBydY5cgwbsngf/3zse3MauVWfDdgsl2HhJLceWxN1e
	RbQziZCcansUwd+LE1EDQivnPttIFoPDMTZcE0r+LmqwVTnlpO+QiToxsw9R8lKmcRa2jo9TWsI
	4RLAY7s8tMGUteDBwePPEiFIivOPFXq806TII90XDKOiHtZZYFmzl4hfxiQO0gb+zHqLwnTGUo0
	VA+4eQcOwQcynIz1x5pVTr5Rlh5S7va3CMcl+A5f2h1FfecuW04nzXevZAZKXPXdgxtQNvFb66P
	XSQ8sgiy14RsNAHPL6OkMLsbrsXDQZ3lfjycbrStKGkkfhVN1aArsymoNq3E98lg0R6tYV3xEeL
	iuf4ojhcyldtPz9RxRTe1JfWPEsflzBMQbesgXH4jpJmbkvSP1wY0SI=
X-Received: by 2002:a05:600c:848c:b0:4a1:fe26:24f0 with SMTP id 5b1f17b1804b1-4a966b4afc5mr39506605e9.20.1793180091431;
        Wed, 28 Oct 2026 02:34:51 -0700 (PDT)
Received: from [192.168.1.3] ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a978795f4dsm28997165e9.9.2026.10.28.02.34.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Oct 2026 02:34:51 -0700 (PDT)
Message-ID: <e93cac91-8fce-4c07-8632-fe37d53a18f6@linaro.org>
Date: Wed, 28 Oct 2026 09:34:50 +0000
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
Subject: Re: [PATCH v1 3/4] perf off-cpu: Fix cgroup_filter map sizing
To: Ian Rogers <irogers@google.com>
References: <20261027170415.2815859-1-irogers@google.com>
 <20261027170415.2815859-3-irogers@google.com>
Content-Language: en-US
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Arnaldo Carvalho de Melo <acme@kernel.org>,
 Namhyung Kim <namhyung@kernel.org>, Jiri Olsa <jolsa@kernel.org>,
 Adrian Hunter <adrian.hunter@intel.com>,
 Ankur Arora <ankur.a.arora@oracle.com>, Howard Chu <howardchu95@gmail.com>,
 Thomas Falcon <thomas.falcon@intel.com>, linux-perf-users@vger.kernel.org,
 linux-kernel@vger.kernel.org
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20261027170415.2815859-3-irogers@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 27/10/2026 17:04, Ian Rogers wrote:
> off_cpu_prepare() assumed that if evlist__first(evlist)->cgrp is set,
> the number of cgroups is evlist__nr_entries(evlist) - 1 (excluding the
> dummy bpf-output event). This can under-size cgroup_filter when
> non-cgroup events precede cgroup events or when no dummy bpf-output
> event is added.
> 
> Count the number of evsels in evlist that have a cgroup set and use that
> count to size and populate cgroup_filter.
> 
> Fixes: 685439a7a037 ("perf record: Add cgroup support for off-cpu profiling")
> Signed-off-by: Ian Rogers <irogers@google.com>
> ---
>   tools/perf/util/bpf_off_cpu.c | 14 +++++++++-----
>   1 file changed, 9 insertions(+), 5 deletions(-)
> 
> diff --git a/tools/perf/util/bpf_off_cpu.c b/tools/perf/util/bpf_off_cpu.c
> index 16948761cc45..71933a71c8d1 100644
> --- a/tools/perf/util/bpf_off_cpu.c
> +++ b/tools/perf/util/bpf_off_cpu.c
> @@ -151,9 +151,10 @@ int off_cpu_prepare(struct evlist *evlist, struct target *target,
>   		    struct record_opts *opts)
>   {
>   	int err, fd, i;
> -	int ncpus = 1, ntasks = 1, ncgrps = 1;
> +	int ncpus = 1, ntasks = 1, ncgrps = 0;
>   	struct strlist *pid_slist = NULL;
>   	struct str_node *pos;
> +	struct evsel *evsel;
>   
>   	if (off_cpu_config(evlist) < 0) {
>   		pr_err("Failed to config off-cpu BPF event\n");
> @@ -208,8 +209,12 @@ int off_cpu_prepare(struct evlist *evlist, struct target *target,
>   		skel->rodata->uses_tgid = 1;
>   	}
>   
> -	if (evlist__first(evlist)->cgrp) {
> -		ncgrps = evlist__nr_entries(evlist) - 1; /* excluding a dummy */
> +	evlist__for_each_entry(evlist, evsel) {
> +		if (evsel->cgrp)
> +			ncgrps++;
> +	}
> +
> +	if (ncgrps > 0) {
>   		bpf_map__set_max_entries(skel->maps.cgroup_filter, ncgrps);
>   
>   		if (!cgroup_is_v2("perf_event"))
> @@ -274,8 +279,7 @@ int off_cpu_prepare(struct evlist *evlist, struct target *target,
>   		}
>   	}
>   
> -	if (evlist__first(evlist)->cgrp) {
> -		struct evsel *evsel;
> +	if (ncgrps > 0) {
>   		u8 val = 1;
>   
>   		fd = bpf_map__fd(skel->maps.cgroup_filter);

Reviewed-by: James Clark <james.clark@linaro.org>

