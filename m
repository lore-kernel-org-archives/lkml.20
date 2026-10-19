Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 534C24B9204
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 09:35:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792402513; cv=none; b=c+bg8c7GWzOusgZ+wgbROjpaMsNN3ZXiI0DuFGDjLoK3AAH49Y7ZVIReoXImZTjmOYoPcKv6lYpbkMdFt4NA2cxE8KJv4cHPWllyqi8cRhMXqnQ3LeDK81nxY96o1n2LeK9zvLDQqft9h7ou9K0yxEDtDFeVI4gb7FziwHFbAaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792402513; c=relaxed/simple;
	bh=4QAG6NlT/0nwL//USt0n95Bo3PHood1TAUditJeGxo0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=a6Lg3718s0uc3hLcTyMYsf7vpTD9erhNe9HXJ7X0LOJeF++5spGztk8PaopgYSxAmmw64vWnPpiYq60LKUni2UiF3uOXHx9DGB4d9tx2PWKupP+ouQUu1yEtanjnvv6SETZBCSwDYZaPfMxQHictK7dR2hwHY0bSS9RGScw1fbw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=edjQydIV; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="edjQydIV"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-48e09aa5264so1013320f8f.2
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 02:35:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1792402510; x=1793007310; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fTaWLyJQguuj+iwhlfuFOJfOVGeQt6aW3eAE90gC5/k=;
        b=edjQydIVroGocCiby5po1vFmjvDcWPtZAZPZVWWaAQ1jwmG39Y9jPKIQBl7/DQ3xlM
         n17Zhg+K67XwA7oS05ZDr3ks80jEhO8rHJWhmLQ3uQReOJKLqjhstfOroDhkT6kus0Dy
         lbTF8NgOVrI+Bb8kvPRQ+UZXRbCgbYxLInpKRidFoL77PUHiTdu8gLTZAmhMGPqfydtm
         N0aSuSa47TSzFPPqbgEC6eWYDtqorQ4yHtwAYKeD+IozijiDUBUFzNogMR6am5bcO87O
         N1vcvToVR8FiFpVbp0vxGxxq5//rHi/fDLxFmqgvISZH+SXHl4kpYfaWqFQWH7E/I7XY
         s9KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792402510; x=1793007310;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fTaWLyJQguuj+iwhlfuFOJfOVGeQt6aW3eAE90gC5/k=;
        b=NhtUIUUseMIqwOdwgx7av5LqYBO9swr9i0b86DAoWqASaD4Ol/fHS4HQ+sGaz2gm5j
         0NwsuKnPSc8CxT/fYRsBXBtfVB+rUaazdO+EjKw50YPO2YZsHXDeEoZSpv1fwCOUryo6
         8W8GdUiboOPx/FjglP0Jcf8tRNyYQC0S2qnRodB5BQzwy/kafaLPLUcjTmRHyangvR4D
         PTQY4lFqBcBSh18D8nHWIX3oHDOJw4VAERSfvNsgDZhDBR575+BmZy/2mcSD/d4eheME
         iJpb4kqVbH1zXgOhh3Dl1zUk5vhh3C5wB6I0XK6qixUwylg7A/OcPFyp0yShscOftaxB
         OpCQ==
X-Forwarded-Encrypted: i=1; AKwUvBxuUEsy6fwl97k4S0Y0MgzPxgjuG4u6A1O5CpoYMeX/En6pmui6GoQelMbnF8p3WntaRfZN/6dV2tFVCaI=@vger.kernel.org
X-Gm-Message-State: AFq9FYLnJur64bT6TYD+cXC8v50jFKcWPkxuB3Ox8laVkedZlf1Gpkp3
	ADBgIS6rZAHhv8ibGITFuSl31Fjv0sRBSwtZuPTe4hZoiQLAwGjvEAog7c1dgiaQsBs=
X-Gm-Gg: AYBFou0A/u0lQtcTbqvNBu9HwMO2sfZpqPbWYnEoXILX05LMHdXaiFb9me0hbwJCGc9
	R7pYvBYMVqGILgugeaOfbm78urKaCjAdQ74CwEe4LkYyORAsb7vIfr2sG7PQonejXbEjXtNJhPv
	t7lLF19xsK+YGv7i5H6qZqLLBywbD1ePTGMu+9Le9En+Ksj5Ab42qHNpHsGdQHjjvTFSbWqxTsh
	U22/6pRKwgv3hJtJ8lWyEJRnhw3lolgY2toqt5DvH26fT8FkvEQuW3DXGG4xe2WbDfPI1ytCLtE
	KaA2o3qnC4NLUD3zpwK5/t9rhABRYmkusOzKjQl0enXrdzDchZxl7Dolt20+INsIy0hDBPEa3ca
	oP0uRUKhaa09PMy+t9O/NTmhfFH6dnnYEVpD4Wo3h/1zi/hMz4l21to8Q+16WWSdVUhMvPAesdl
	CDyr489jvRiKppWD2L40aMbHSKF9ndSagxIAejLkmE5U/xKHa2T7MMUk58Twv/w+U+ZfyTtWPOr
	Fnr
X-Received: by 2002:a05:6000:4b1a:b0:48d:f034:7fcd with SMTP id ffacd0b85a97d-48e07fa2f48mr12167246f8f.51.1792402510355;
        Mon, 19 Oct 2026 02:35:10 -0700 (PDT)
Received: from [192.168.1.3] ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd471a1fsm18752727f8f.3.2026.10.19.02.35.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 02:35:09 -0700 (PDT)
Message-ID: <296f398a-a351-4290-80e5-d18427a88dac@linaro.org>
Date: Mon, 19 Oct 2026 10:35:08 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 09/25] coresight: perf: Improve hardware state transitions
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
 <20260915-arm_cs_support_aux_sample-v1-9-35cf6f297d20@arm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20260915-arm_cs_support_aux_sample-v1-9-35cf6f297d20@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 15/09/2026 16:48, Leo Yan wrote:
> Keep hw.state consistent with event activation and AUX buffer updates.
> Initialize events as stopped and up to date, clear both flags after a
> successful start, and set UPTODATE after committing an AUX buffer
> update. On resume, clear UPTODATE only on success. Preserve state on
> resume failure and ignore duplicate stops.
> 
> Add helpers for setting and clearing state bits. Use READ_ONCE() and
> WRITE_ONCE() to prevent compiler merging or refetching of state
> accesses.
> 
> Assisted-by: Codex:gpt-6
> Signed-off-by: Leo Yan <leo.yan@arm.com>
> ---
>   drivers/hwtracing/coresight/coresight-etm-perf.c | 58 ++++++++++++++++--------
>   1 file changed, 40 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-etm-perf.c b/drivers/hwtracing/coresight/coresight-etm-perf.c
> index e3c9d3cf84c502f357a430bc3bfa854a776618f1..f66c99b26e1862ab04105704276c901b21728207 100644
> --- a/drivers/hwtracing/coresight/coresight-etm-perf.c
> +++ b/drivers/hwtracing/coresight/coresight-etm-perf.c
> @@ -150,6 +150,20 @@ etm_event_cpu_path(struct etm_event_data *data, int cpu)
>   	return *etm_event_cpu_path_ptr(data, cpu);
>   }
>   
> +static inline void etm_event_set_hw_state(struct perf_event *event, int mask)

Extremely minor nit, but inline does nothing here.

