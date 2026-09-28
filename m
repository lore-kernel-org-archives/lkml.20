Received: from mail-ej2-f42.google.com (mail-ej2-f42.google.com [74.125.228.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D9A2488DB2
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 09:38:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790588328; cv=none; b=MUOneaNwNwLbVfYmEba/PnboqzC/g+ntisKzeJQVgJ/glpWbjFBTmDTY5MSXyazU/QjMUIMDblfrNi4FIDY0/BWjLePdGrSXjSyeFrqrAErzTySelClho7y2jqbZzPtI83UfQ8t3gXamiQmRcU/o8LtF1grNFHC3+TRhELq/3eg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790588328; c=relaxed/simple;
	bh=luQ2bVFazKl9+YnhuhIyET4vG9Aq7mT9Ni2SXuEwwsA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nbpwvFG0cPCYkzI00JskRGvSWDsyZJtN6efYkXpZbHtpz/Ai/tafFczndaBFRViku6qfeGk8hciXULjbXgGya1yGXI9aj2xSJ2b7dgOFaoAcs7s8RvZLyUJCUyM+nuRcK1vb1+7J+tiSD7o7m8xqj4qbWEc+MX4kM5Ua0EyUW3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hxNIovbE; arc=none smtp.client-ip=74.125.228.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hxNIovbE"
Received: by mail-ej2-f42.google.com with SMTP id a640c23a62f3a-c2aff2c45efso206382966b.3
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 02:38:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790588324; x=1791193124; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Fb8BRFinCtpn7ZQeoERdORliYux0ApjJy8/g8+VQKzg=;
        b=hxNIovbEw841xLVcyKvhi/l04UCRcmqzk9j6XKN1E9wGFrbKfuoiuakKc1B6V7A/24
         F/AUcOsFekPyKcBIOSsahM9KZg3hZwvQEsWz1TBpc2X+b1szaOw/kl+kr0I1hveVtLSH
         Do0s5TEibiFdLfRDR+3STWcrxFzEgmf8G7/dmS6q5IBwN+9kZNEzlf1TMVe4t1M1Gyxt
         sXCWoObXbUXK671uogj9IOYAa0eVkmPUYbhUi7SoRD7iSwl2oytsABUJOcoLeckEMNeQ
         VkYux2J6bZC3rtc8LyhM6+CDVKl5Xvg0jpyTpZN5LTWGGgOtMpVuPF8CENR972PUsl6Q
         PGzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790588324; x=1791193124;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Fb8BRFinCtpn7ZQeoERdORliYux0ApjJy8/g8+VQKzg=;
        b=afEVJWMUgFseubIrM2R6EliFbnaeq9jHAp/2DaKtRtva916hRczPoshK0AvvXwpkh3
         FGPQ2bB/GlPazHiIuTDCKTqUiLIiHwjcdXifkw4fM9L29be1U2DueKxUCUHmzzaZgXhC
         FohccrkVyxn2nhNgX+T2Xvw2ZLb4d+8m89Bu/HqGTuodCPIjbexN3MuCztPbq4l61ZPX
         pSEyzZFFIREzflhcaP67tgbYBVHi/0F1TrSbpjVDyX+0E9SSnk3scJs+Gkc6v5spNcVn
         aK5rc9wecDJ6iGOLOrF6/RM5J0zkJ2fytdHHVizmu/fLShVbsNLbYAxagsG+k3Zt6dQH
         b4yw==
X-Forwarded-Encrypted: i=1; AKwUvBwrGu7bMkHX7W5Va/OS8SKmL5QtbwPjxkFlC2s1FSgenSJV10OXxMxBdvNKHQuYTVAegWBS8WlPOGdgu04=@vger.kernel.org
X-Gm-Message-State: AFuF++lgOZ2wL2NGT8VjJzvQ9vexU7tHJAc6IOQlkC/YRcz2xeqMwCr8
	TkDnftYQD5bVdUxDweAsIJyuUFtkm2EJCa7ZDEMbcSPLTzcqo9zfTsslPvy+1vFTTfA=
X-Gm-Gg: AYBFou3byuQOPuBOI3G+Ojyem1MfdYaOWqnSlEssoHwdMH7F3AC0fuarx7T3Twe8knz
	usBgXET50c/vvl7mEeHrJv4nZqpFizWciJz71UuzCQdqtPraAFCnAYzUCjdnKCtYt60Ae8s2Sit
	sz5m4lZKHL/JLej7BgpLGjuy2VODHaJC5qsTr+2pgTlwE2mGxcvuEKBaD0vrJsPLo5yloqjCvQM
	h/Cu/8/kyEypUW44wBG0yxl8tbVG5oC1cogjZnjsD2FFXkg5+hVE4nurbFMi/ojJVI58/OqAqvy
	8vpZXHcQLtLMVNrIVej9Bwh+R25QoHpZVZXnlZnHlZk2HER3nYY5l7j1xUsXnyctVXSDpyl41KZ
	ajI95Ii/wzCfV9rvsYG53XvUft8DWOLyw0BjGY1OEpji8AFH+bdWBGxsbY0fAXqI2LIkJG+E+Id
	G/8r3Mn2xcQFhXCsd4SNny1h12NoNd4M4xgmn6CcBd6gwOWNL3vhx2Aya1pkMaNJpKgbWrdezR6
	6A=
X-Received: by 2002:a17:907:b046:10b0:c2a:ce56:dc22 with SMTP id a640c23a62f3a-c2ace56e9d3mr637313266b.47.1790588324393;
        Mon, 28 Sep 2026 02:38:44 -0700 (PDT)
Received: from [192.168.1.3] ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2ae757b9c1sm440649866b.33.2026.09.28.02.38.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Sep 2026 02:38:43 -0700 (PDT)
Message-ID: <f0aa7195-9c79-4ac7-8bb0-d508927a01cf@linaro.org>
Date: Mon, 28 Sep 2026 10:38:42 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] perf/core: Fix ITRACE start suppression for inherited
 events
To: Leo Yan <leo.yan@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: Ingo Molnar <mingo@kernel.org>, linux-perf-users@vger.kernel.org,
 linux-kernel@vger.kernel.org, Sashiko AI <sashiko-bot@kernel.org>,
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
 Adrian Hunter <adrian.hunter@intel.com>,
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Arnaldo Carvalho de Melo <acme@kernel.org>,
 Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>
References: <20260903-perf_core_itrace_start_fix_inherit_event-v1-1-6bff7e675af5@arm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20260903-perf_core_itrace_start_fix_inherit_event-v1-1-6bff7e675af5@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 03/09/2026 10:35, Leo Yan wrote:
> PMU drivers call perf_event_itrace_started() for the event that has
> started tracing. This sets PERF_ATTACH_ITRACE in that event's
> attach_state.
> 
> For inherited events, however, perf_log_itrace_start() replaces the
> child event with its parent before checking PERF_ATTACH_ITRACE. The
> setter and checker therefore operate on different events. If the
> parent's flag is clear, the child continues to emit ITRACE_START
> records on subsequent schedule-ins. If the parent has already started,
> its flag can instead suppress the child's initial record.

This last part would need an earlier fixes: commit. The problem of 
suppressing child ITRACE_START records existed since the beginning on 
ec0d772 ("perf: Add ITRACE_START record to indicate that tracing has 
started").

Although the fixes: commit would be correct if the only problem was that 
setting and getting are on different events.

> 
> Remove the parent substitution so that perf_log_itrace_start() checks
> the same event that the PMU driver marks as started.
> 
> This is safe for tool consumers. Intel PT uses the ITRACE_START record
> to set the current thread context. CoreSight ETM uses the record only
> to find or create the corresponding thread. Neither decoder depends on
> the parent event.
> 

It's probably harmless to emit more ITRACE_STARTs, but it doesn't fit 
the original purpose of why it was added. It seems to be for when 
tracing first starts, which would be _after_ the corresponding sched 
event. Once tracing has started you can follow the subsequent sched 
events, so you don't need more ITRACE_START records for each child. 
Could we not fix it by changing the setter to follow the parent event to 
match, which would respect the original meaning?


> Reported-by: Sashiko AI <sashiko-bot@kernel.org>
> Closes: https://lore.kernel.org/linux-perf-users/20260901164705.042781F000E9@smtp.kernel.org/
> Fixes: 9a6694cfa239 ("perf/x86/intel/pt: Do not force sync packets on every schedule-in")
> Signed-off-by: Leo Yan <leo.yan@arm.com>
> ---
>   kernel/events/core.c | 3 ---
>   1 file changed, 3 deletions(-)
> 
> diff --git a/kernel/events/core.c b/kernel/events/core.c
> index a6c8e38a311042afab6b65814a84c67b87ba929b..991ae214d46ebe8b0d9de497255f25a4ad12397f 100644
> --- a/kernel/events/core.c
> +++ b/kernel/events/core.c
> @@ -10572,9 +10572,6 @@ static void perf_log_itrace_start(struct perf_event *event)
>   	} rec;
>   	int ret;
>   
> -	if (event->parent)
> -		event = event->parent;
> -
>   	if (!(event->pmu->capabilities & PERF_PMU_CAP_ITRACE) ||
>   	    event->attach_state & PERF_ATTACH_ITRACE)
>   		return;
> 
> ---
> base-commit: 940de590b839f71d6dc846160534bf202401b8b7
> change-id: 20260903-perf_core_itrace_start_fix_inherit_event-a8930d792899
> 
> Best regards,

