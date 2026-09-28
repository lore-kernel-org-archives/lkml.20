Received: from mail-ed2-f13.google.com (mail-ed2-f13.google.com [74.125.228.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A71A548C3F5
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 09:13:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790586799; cv=none; b=OpCh2ImzNZwC0iA+vqoB4rNmypcym1th2lRod7If0lIK+pNQyHQ27f9veYt5qMT8v2hrXkv43IxUPZQDODaF0mm931tAubxAWS7fZZ6LOQ9j6cQPMTJ/W90UWlklY2FsteT4QA8GUBDLcnGUMUiz7pEEc30lFjd8M02CgOJkB+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790586799; c=relaxed/simple;
	bh=NGlPMXq2fpdcn6udWgt1oJexI34OVAzc82/X+lQc8BQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:Cc:From:
	 In-Reply-To:Content-Type; b=lBKpVCD5V1v2+N3SVd2ps9XMBPHHWIoTANzu050jz3o9yzlIin+F13lzfcUz1a/r2lISXkiu3Izw5WIRz+9LPF5cuP4UuyH0gUouSEv412tgq3RYMsOO2i/EKvWQy0ZBRV0RZ1ALpkPfUQ2STqKOylHsk6uDvddvLVuZVW7QKss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VEVPhgcK; arc=none smtp.client-ip=74.125.228.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VEVPhgcK"
Received: by mail-ed2-f13.google.com with SMTP id 4fb4d7f45d1cf-6ab0d9260baso1807092a12.0
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 02:13:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790586795; x=1791191595; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:cc
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=zrUZW93Kpo3duA4VkIX/sYF08Cc0xHufuLcywAkXwOQ=;
        b=VEVPhgcKv6bpkh1vyZZEPdhRUsJktISv3aArYLdChcgdbZE9D0kPV/3EucxndTfrDX
         umEdVsfu/L5yy83FC4GKchrXoQBAhbZti5idmFg8FHCAw3il+fFPIuQ15E0vKm7/DvZF
         /aHX3sPY114e62Wifp0tL7CQmxc8aOyKDw+MUq5TmIb6e5OJyH0VvQIxgEaXvlmDSMZ3
         PVAbvztFssgymA0thp887SkTGFL07CQ9SWUSDZ0bByC18nm9WA0lv+Kve/+TV6nX6d1V
         /EjRz2A8TfTT7q8fxKCzICgGnlEvmCz+OAJ9LmMKrg4PhzPg8XMQ/7Z6hGTCQVoeVXxS
         h6mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790586795; x=1791191595;
        h=content-transfer-encoding:content-type:in-reply-to:from:cc
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zrUZW93Kpo3duA4VkIX/sYF08Cc0xHufuLcywAkXwOQ=;
        b=GBJ6WCYclSvTHSpTCh0a4lzqdmur7i4+naXd4VgGbWUaiBqh+66mvLfm8bXAvD4ujD
         IsFAQxbq4cUe9WraUzjQ0Ck1gAEopa3EPufVlREYhaV38VgINPkuFOGrNIko+gGgJEz2
         nwLouwe3R+5IRD6mCJ43mCcMWxBOmfQSAtLahuA7fFhKbRExbJFzl8IwD+ujJdlvm+yE
         SF6nFpgP5AKQ8FX84iWb/JTTbtCPARDvZwdp4UnAnkj+Oeb5JQm2Z7sdYBOcWvN97tax
         SB36N8yyZo1J5qVzI8vng3RkzYQtNqFAHE0Eh/rQtOeTfhSKqa+0mOHbI8u8596PMsdW
         d5iQ==
X-Forwarded-Encrypted: i=1; AKwUvBw+oPwLdSs27Bsyj45H3nDsA45wgItdWQSEiUNNmKQs/zFypUL/342xHk1Uljk9pdzmRVoyuhqlRdT98z4=@vger.kernel.org
X-Gm-Message-State: AFq9FYK3amJD9i+PImmC3WYQwDGVrZraS1YqJXiUnuJSDCNpPeB4Ldw8
	QqJmrwNrHchiTF25yHkNJDwsZoOSA/i663BPpQL7Wa/h72xSq1RSexfjH5CncxdFb+M=
X-Gm-Gg: AYBFou2GxOdvRfa1EOYWRcgtZZR32+TvcvhSL7Vw8xzsnlyGVLK9P1V8WkeLo3ISVfp
	fA6jx9PExCW4zWBeEn5TiEHKboC3zj74wfbhkmiuHGyCTNjJsXiCmYejcWTVkYn7whjVMP5o6w3
	3i/mH5KX268+U+Nu5q0ZryJ/gxxzGpkxGhd26lU1ECWtbscs7XS2wqSJCxOXrB03fYSRp2D2mqv
	htTjYyikj1YFdEJ0w7Z5o5vhozQOoXOg1VZFl9xKvaQ0+7dWXt9ONHfrrezEQX14MNDnzbL137X
	tG6gea894K5QQ+V+rH83adqTZd2XaKyzTFWxkW4cWhZuaCnjsvLyz1Vr1bpfLP+psS/LU3lIwU8
	su+ssMe2HAh6Soh+zqPlwRMxQSvn6QdTjcav7EBbDORYEN4J2Xa37Okw5+VY3uXyqqSl9g1srcZ
	Nw+htlswtU0cufoi2qw88ekQhNRLbNe94oKFpwDj9zKoL55a1n6Bpt1wGhvaC4xlmSDQKP/ozWf
	GeK
X-Received: by 2002:a05:6402:2552:b0:6aa:f809:ef41 with SMTP id 4fb4d7f45d1cf-6aaf809f225mr5554167a12.3.1790586794617;
        Mon, 28 Sep 2026 02:13:14 -0700 (PDT)
Received: from [192.168.1.3] ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6aae5dc0cddsm3868145a12.14.2026.09.28.02.13.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Sep 2026 02:13:13 -0700 (PDT)
Message-ID: <efd21aac-4faf-46bc-b1ef-7791e7458cf0@linaro.org>
Date: Mon, 28 Sep 2026 10:13:11 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] perf test: Record kcore for the CoreSight callchain test
To: Leo Yan <leo.yan@arm.com>
References: <20260928090644.24346-1-leo.yan@arm.com>
Content-Language: en-US
Cc: Arnaldo Carvalho de Melo <acme@kernel.org>,
 Namhyung Kim <namhyung@kernel.org>, Jiri Olsa <jolsa@kernel.org>,
 Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@arm.com>,
 coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20260928090644.24346-1-leo.yan@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 28/09/2026 10:06, Leo Yan wrote:
> The CoreSight callchain test traces both userspace and kernel execution
> and checks the callchain across a syscall.
> 
> Add --kcore to perf record to save the running kernel image alongside
> the trace data so perf script can use it to decode the kernel trace.
> 
> Add a Fixes tag so the change can be backported to stable kernels and
> improve the test reliability.
> 
> Fixes: ca0e19074bd6 ("perf test: Add Arm CoreSight callchain test")
> Signed-off-by: Leo Yan <leo.yan@arm.com>
> ---
>   tools/perf/tests/shell/coresight/callchain.sh | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tools/perf/tests/shell/coresight/callchain.sh b/tools/perf/tests/shell/coresight/callchain.sh
> index 13cca7dc1118..b69187f1a37f 100755
> --- a/tools/perf/tests/shell/coresight/callchain.sh
> +++ b/tools/perf/tests/shell/coresight/callchain.sh
> @@ -43,7 +43,7 @@ record_trace()
>   
>   	mkfifo "$cf" "$af"
>   
> -	perf record -o "$data" -e cs_etm// --per-thread -D -1 --control fifo:"$cf","$af" -- \
> +	perf record --kcore -o "$data" -e cs_etm// --per-thread -D -1 --control fifo:"$cf","$af" -- \
>   		perf test --record-ctl fifo:"$cf","$af" -w callchain >/dev/null 2>&1 &&
>   
>   	# It is safe to use 'i3i' with a three-instruction interval, since the

Reviewed-by: James Clark <james.clark@linaro.org>
