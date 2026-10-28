Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793180055;
	b=mG+adLZrdJmdCAWkE7O/4iiH+4GfImDcUErXVjs2sPX60VRJq+YQ2sPDaEvFSMMrY2V8
	 iiT2J5C7S65mJYLClsvOygaOow/PQoj9nDY6eZn4VB26G0H8A540vOGtiPKJbUab3dyPA
	 8nmsnRJhhMg57YFlY5IImz24D9jPtZX4S9ZKgdD8FlCNhITq3ZmHTzvMoGbxyCcuCD9CX
	 TL8pPrNvnxR88AJ6Fka4gInJ6FBH6mrSx5o+FrWzNr0ppM4PvHqB/D+jsQJgIYiilam+0
	 MzOwfANOqmqMByUIa0SpnAKbjrzkA7rUMChB+iwvC0dfgo6C9njXKv6TT8yGLDRpsrQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793180055;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:References:
	 Content-Language:Cc:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=wzc/Ffo0vqG/MgUj08JNChf0oI7bYubi6RLcl90iG6M=;
	b=o/n/fHQHFS8okuulMkRsXkFUvepdEHJ8O7/LClgfCzwh2C+VGOx6v6wxwv33SG3tSy9U
	 uvZuBnS3qD+th0JUNFip8kzLhBowzsq5tJGOIJ9RvRPOmztdQ4ByWuMOrpU38mQ5tlo7j
	 1a+7buiViHAZLj2mGu+dKyf2IhVtaY3fQUwl2AOKJL59P68nu0gwaNPajQsEoPAij5Nec
	 ttwjOpWzEhcz/fSM47PBG8XyikyoS51yZDB/c0J6wRVlztnPhXlaPAQLNSfDrWKpNIWrF
	 MuiquxLHB6tbpIUv4uIJbvnbHyCjfaGRBodjUs1mKIDC7MBtg/uKUMLwM6420/54Qeg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=JFMi6Pew;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DD28606A334
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 09:34:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2DD28606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=JFMi6Pew
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a2153c8525so5432305e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 02:34:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793180053; x=1793784853; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:cc
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=wzc/Ffo0vqG/MgUj08JNChf0oI7bYubi6RLcl90iG6M=;
        b=JFMi6PewLs4m7EkPiGNa9NFLqMO+qkGvD6PonyxMzEM8Lg/kP2qaoBSSl8VaRNfsjU
         rumokr17dWGBjAiQMZnhSvsl0CRTb+wdatuJfZuvAlzYpu/n4vSgxORHs5LQmvlH1OvD
         wPCcyC4NLLAxLuxmQtrUiq5iwIdzP/5Aq8KCgooZMysQThNYvOw6QSRooFv4pavQhfak
         odYISejloTYjojBSEOoljgcwwpjXc3CxT3iFWHLgB81ynzQjOMvbNbUDuxGugrBbREvj
         UyvWHePdisQ3v4q6baIVqK2Nx4pTJfJp/7BwlUuAIjPM4ksHYEn/NDgZ4WccajACrwZM
         TP7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793180053; x=1793784853;
        h=content-transfer-encoding:content-type:in-reply-to:from:cc
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wzc/Ffo0vqG/MgUj08JNChf0oI7bYubi6RLcl90iG6M=;
        b=sb8P0jKtAG35DADThurqXEUHLRLq+DnohZZEpsQf7y88GaC7ydz7MKmsRcYS25VA1D
         JsKCVGvTScOBN+pL6py9lyjhMxHbAeQrfKa8jVBt9JVlztVdCB3rGibv8hocbuoFvHgm
         7jIpphnKjU06AFLLTQLs1q9HCoZsv7r4g1vmvA/h6wpFCXHdZknragHHCHJlgGTDHw+T
         2XZiIfO7D9AvidQNgX7vUwkOdKWedH1eSNqpf7716edqMmiD9ev8uyIij26oLj0xhhUy
         UuTaI2sODoRXrZnqbebpxFs4RvbGvvsSx59368TfU5MPaR0HCkP355+B4RSPVAHO5d3r
         9k+w==
X-Forwarded-Encrypted: i=1; AKwUvBzadYHP4uTk+iWAkVzROsTju/coUbl90G7D5H1PWujgJdpuXMlhoOoZfoFqz0W549fzAxtw1Rr4+RNcAxk=@vger.kernel.org
X-Gm-Message-State: AFq9FYJWvXwt+JnODzofMlAn4ct5i9TVlXtXX/BFARj6ATXjMjmUCv+w
	y13mEoEBA9eknzjaq0BT2P7ZcoYu7dVAtE8USutCxOzNMHZHFnXhVe0RTqFqef5/32E=
X-Gm-Gg: AYBFou3g99laGctrv3ew+iFxS0BB1w5q49dXsojLjk+1F8YG6l40O7oJLNBiEcaFYPx
	MKe9qzNOpUx0yFMD/ef0Cwti6Ow+WIVsY7bmJw5BBGD7smKX4wX1JOwuEuMZGO8lTvvNbB+Q7zl
	jJR39Rh9Fp8ARhAePmUBUgb33gwHXP0fsvhPYb7WQAjiHSJ9Buwxd7NKN3XbzhGH2eawFZPUizZ
	9djB4DDdJEhohyTyMUbmPt6+uq60NkQpW+rdv+w/kdxCiXbjjR0r8EZYCYYoV8LyqwD76rTyJ7u
	7InPnJF9rWLB9jcPKw88XRClz5JGwE6xYYg88viZypioVCaBPbO91RdhIcSlGtsyYJFcK9a95uT
	oC7qwTpaKGEvB0eHq+zdW0Wcqe7QJa3Z+eS0M8rLNmveboL9v2hvvBDcy97QqiWfRNTuYXDc6U/
	sLItLbCg4CSs81Lw5RL3i7vat7KfvMvTZVfTwo8OJnUE+l0tyEVye8Z1yt8u4VxM/l4Ow9nrv3C
	+FV6a/DJlOLJwT3yHvEbZO5YFFzX2xxck6bNPfqC59gKFuonpPi/xxxBZwRtFIXXb94x647VnbC
	G82kAZ88gW30SlGRXI75UDMIuLSIXvFSzw==
X-Received: by 2002:a05:600c:198d:b0:4a1:e6a9:4086 with SMTP id 5b1f17b1804b1-4a9616a2b27mr37340455e9.0.1793180053599;
        Wed, 28 Oct 2026 02:34:13 -0700 (PDT)
Received: from [192.168.1.3] ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a97c42b3c1sm34895995e9.6.2026.10.28.02.34.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Oct 2026 02:34:13 -0700 (PDT)
Message-ID: <51b9f3f6-e053-4d9e-886e-2c8929014a36@linaro.org>
Date: Wed, 28 Oct 2026 09:34:12 +0000
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
Subject: Re: [PATCH v1 1/4] perf off-cpu: Use the CPU map index for the
 bpf-output file descriptor
To: Ian Rogers <irogers@google.com>
References: <20261027170415.2815859-1-irogers@google.com>
Content-Language: en-US
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Arnaldo Carvalho de Melo <acme@kernel.org>,
 Namhyung Kim <namhyung@kernel.org>, Jiri Olsa <jolsa@kernel.org>,
 Adrian Hunter <adrian.hunter@intel.com>,
 Ankur Arora <ankur.a.arora@oracle.com>, Howard Chu <howardchu95@gmail.com>,
 Thomas Falcon <thomas.falcon@intel.com>, linux-perf-users@vger.kernel.org,
 linux-kernel@vger.kernel.org
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20261027170415.2815859-1-irogers@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 27/10/2026 17:04, Ian Rogers wrote:
> When populating the offcpu_output BPF perf event array, the file
> descriptor of the bpf-output event was looked up using the CPU number
> rather than the index within the evsel's CPU map. These differ when
> CPUs are offline or a subset of CPUs is used, leading to the wrong, or
> an out-of-bounds, file descriptor being used. Index the file
> descriptor array using the CPU map index.
> 
> Fixes: 282c195906c7 ("perf record --off-cpu: Preparation of off-cpu BPF program")
> Signed-off-by: Ian Rogers <irogers@google.com>
> ---
>   tools/perf/util/bpf_off_cpu.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tools/perf/util/bpf_off_cpu.c b/tools/perf/util/bpf_off_cpu.c
> index c4639f6a5776..ff8935688b43 100644
> --- a/tools/perf/util/bpf_off_cpu.c
> +++ b/tools/perf/util/bpf_off_cpu.c
> @@ -95,7 +95,7 @@ static void off_cpu_start(void *arg)
>   		int cpu_nr = pcpu.cpu;
>   
>   		err = bpf_map__update_elem(skel->maps.offcpu_output, &cpu_nr, sizeof(int),
> -					   xyarray__entry(evsel->core.fd, cpu_nr, 0),
> +					   xyarray__entry(evsel->core.fd, i, 0),
>   					   sizeof(int), BPF_ANY);
>   		if (err) {
>   			pr_err("Failed to update perf event map for direct off-cpu dumping\n");


Reviewed-by: James Clark <james.clark@linaro.org>

