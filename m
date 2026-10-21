Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792572149;
	b=aYWRJYbsJNB2hA8nxE0YVS3FmeE89szKsn/JgsAUsU8nzozcCWdnT25ghMXaI1sH/Bbh
	 f804F7Ei9L56kDHUezoi9NwVB05EC0y642a1JjZkFKGIt6aKxYdTj4uaaCsif1dGhk0QV
	 dEStPFvbe2WF6qKgRJm9g97uCGUvQ3VmtHlozC7MB3UBDteCxPKOBeSxuGWzOWp4FAwJx
	 2DwO/Ye0+feDN4bWqJYkXrkpiQ2D5bynJ6j7z0WzOsnqgYjFy8Hz9t6VmWop8u2vmx3P8
	 GHGhjkJVpuQbSMBBvHEXUVM36Wa19TvGJ4drHb5OsvUp8sdikLkaU3CiJ1D6i/E7kbw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792572149;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=HEJ2SZbhPnf8rqO4ewN7/B8xVL2Gxv0m91IYI80k11k=;
	b=dAAhg7GmkNhhTL4KmOkK3Di8byHXQRdZmEXwMi+m1M1DQTkPfMvp/uy68G+jVQSIsppe
	 J0JsA+TpcIhphuknezZ9+qz03LiPOVUgNJN3sEY1uSg1MoDnxTdVxmlBiaptY3rPDHqWt
	 401CmzyULFnpmhoRC8lOjxEcdkVV1bNLYOkzkbaYrzF8Q1B0R35brR/rBsT/4fPkEVrzK
	 cjAXRcbt8WbJdivWRynM3wV1HPWmqDgpQ1tZg/Y8t1g7srGf/jUtvnuvLKX1j1x1PSht1
	 CnuLCMNS9KXRo+W7TNUnxslkfMvZijiwb/tqRteMiP1Nw2BDDPKQhn9Uj8sKuZYOmBg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=qstu8reJ;
	arc=none smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72D9E606A31E
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 08:42:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 72D9E606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=qstu8reJ
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-48e1d0e5dafso1060909f8f.1
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 01:42:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1792572147; x=1793176947; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HEJ2SZbhPnf8rqO4ewN7/B8xVL2Gxv0m91IYI80k11k=;
        b=qstu8reJKHTSaVi9NiBX/KezIIDRXPKooU5RpcjJYtIQWGGbcKFWq87wOzYtISRcYh
         IszopNvOPLbHX2DVnM8u/XomKxId2aCZB2qhO/C/NT6Lv4aW8ohYIHsHKgB+W+2HTiDl
         fGX3CluWjL0UGIno2xWEU71BtrYEKtE27xo5N6Tqcb7o2PkaQNfSx/bDHtYkTvmHx/XU
         6Z/gPeHxJ7GXns9QzO4WY+zBDAThpJL75dl9mtS6xrrrhlE4bH1USPagesSh2lScrO4i
         rm8y9QHsNuz7lvu8dengmgvt3KCi+WefDx+6fLsMqEpfmqiv0k4jRIWwSpoNqpiF7RoK
         Gbkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792572147; x=1793176947;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HEJ2SZbhPnf8rqO4ewN7/B8xVL2Gxv0m91IYI80k11k=;
        b=wDzahcjafwRv7+tUKEWjC0y8QiHnQDG1pFK4GhAie0wWVc1bMw83N3PkCpToAf/ggW
         XAg8kee28eSLy4mjoBWkgm7gG2w1hMFL+pX2SAHASYA5sVFsGtJmciNlPsDsE4uPs3Xx
         KFX97FRvWcvXwIeVOiVapNDEJUXbv8ojRX6vAXh/gGGFsm3y/g3sWr9ebzCkSMusFejp
         6H6jq+KkghWVapo997KuRiSx2KMURDkowH9SyE+pD7oE23diRpkCEsAtsQcgGv6xR+M0
         xj2CDLwHfnY0GRidKKYDxvKSCyeyg53atKqxHjn7MiIr6nN3YKzA9CVrdfL8gODzIG3+
         0MzQ==
X-Forwarded-Encrypted: i=1; AKwUvBxOT5IJIDIxCz+ccif+b4pYboJH7aP8Uh7V3JOP1FwXro/iSVGUhF/KPzEwgZlaCEjgog+23SHbzDlzhK8=@vger.kernel.org
X-Gm-Message-State: AFq9FYKiQUiXN8HeKe+gSzmYpE+qz1uTTj0gQtKvph41s0YYnygpR6WW
	4P5neBE5ja2DIjjjwpP3xjvZPu6Stg7r6+dwsrZVb9G4u2HPYrh6ap2EP/GGcixSQhw=
X-Gm-Gg: AYBFou23sloil7ekCBpiAcXuLjEfHflIMjZ5roS56ckofNm5XJB4XPi6PfWe8JMJIN8
	S2G2VTQ33G27SVMCKK924WsF5gb7NXsfjeyYPMT3GYf1Gsq7yMK4ADMS1ikaAcatcIwbfNQl52K
	SydovdIobOhU9dPY2te4iXQcK/HMJv92NWsr91bKUA2NOTvIp0svfugg3Iv9hhcw9MuYXkLMSyj
	6U4b3jWyrw1/z8/mNgaZZoH1q3BCtKfBadn5Wwa/nY8qClzynaGiipjmLGqnO1VLWDWHW4PZuZy
	yy0IpUxUOErGHKtxDA0EJPfsc0f9PuKDIMpmQ0CchTu4bDEGcf1k57fu63KRYh9mjyPRAiRVuD9
	FWo1FfJamshkZyJ044M8A50LI7z8oQ+o3cj1NibAv3r5iyHqUXnRjEYQi32W9DLRiU0/p3yK2D8
	ZAxSOhG3Bm2IV8bJuMELow2ym2q8LY04+0/Tpw3wtF9wc0YUDu4/aU9cJYMwSetZ5MGOGWzexJ1
	GEFv8WYk724fEGKXtxe92kh/R2QtxSS/oUTSYt9fOW0JSiToqMvc+x3R35B
X-Received: by 2002:a05:6000:1182:b0:48a:f4d4:e1f3 with SMTP id ffacd0b85a97d-48e264b3eddmr1756774f8f.13.1792572146818;
        Wed, 21 Oct 2026 01:42:26 -0700 (PDT)
Received: from [192.168.1.3] ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e254eeef6sm4066564f8f.8.2026.10.21.01.42.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 01:42:26 -0700 (PDT)
Message-ID: <2bc4b058-3a5b-4a9c-a469-eb8c93215594@linaro.org>
Date: Wed, 21 Oct 2026 09:42:24 +0100
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
Subject: Re: [PATCH v3 0/4] perf: cs-etm: HW_ID improvements
To: Arnaldo Carvalho de Melo <acme@kernel.org>
Cc: Arnaldo Carvalho de Melo <acme@redhat.com>,
 linux-arm-kernel@lists.infradead.org, coresight@lists.linaro.org,
 linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org,
 Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
 Adrian Hunter <adrian.hunter@intel.com>, Leo Yan <leo.yan@arm.com>,
 Suyash Mahar <smahar@meta.com>, Amir Ayupov <aaupov@fb.com>,
 John Garry <john.g.garry@oracle.com>, Will Deacon <will@kernel.org>,
 Mike Leach <mike.leach@arm.com>, Leo Yan <leo.yan@linux.dev>,
 Suzuki K Poulose <suzuki.poulose@arm.com>,
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>
References: <20261002-james-cs-hw_id-output-failure-v3-0-1d8b6ef339c8@linaro.org>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20261002-james-cs-hw_id-output-failure-v3-0-1d8b6ef339c8@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 02/10/2026 12:15, James Clark wrote:
> The driver might not always be able to write HW_IDs, but we don't need
> them for unformatted mode anyway, so fix that in commit ("perf cs-etm:
> Synthesize missing HW_ID mappings for raw trace").
> 
> Include some other minor improvements encountered on the way to appease
> Sashiko, like properly freeing queues and ("perf: cs-etm: Respect
> --no-itrace option") makes debugging broken Coresight perf.data files
> easier.
> 
> Signed-off-by: James Clark <james.clark@linaro.org>
> ---
> Changes in v3:
> - Remove old b4 prerequisite metadata that's no longer relevant.
> - Link to v2: https://patch.msgid.link/20261002-james-cs-hw_id-output-failure-v2-0-7a194aa61173@linaro.org
> 
> Changes in v2:
> - Drop driver changes and move to https://lore.kernel.org/linux-perf-users/20261001-james-cs-retry-hw_id-v1-0-4d45ab46cde7@linaro.org/T/#t
> - Don't process any HW_IDs for unformatted queues, just create decoders
>    unconditionally with trace ID 1.
> - Use zfree() instead of etmq->decoder = NULL
> - Remove dependency on "[PATCH v2 00/14] perf cs-etm: Per-thread mode
>    fixes and snapshot wrap support", it wasn't functionally dependant,
>    just touching some of the same lines.
> - Link to v1: https://patch.msgid.link/20260821-james-cs-hw_id-output-failure-v1-0-9d532ddabcc3@linaro.org
> 
> ---
> James Clark (3):
>        perf: cs-etm: Don't add global v0 HW_IDs to unformatted queues
>        perf cs-etm: Free partially created queues
>        perf: cs-etm: Respect --no-itrace option
> 
> Leo Yan (1):
>        perf cs-etm: Synthesize missing HW_ID mappings for raw trace
> 
>   tools/perf/util/auxtrace.c                      |   2 +-
>   tools/perf/util/auxtrace.h                      |   1 +
>   tools/perf/util/cs-etm-decoder/cs-etm-decoder.c |  12 +-
>   tools/perf/util/cs-etm-decoder/cs-etm-decoder.h |   2 +-
>   tools/perf/util/cs-etm.c                        | 184 +++++++++++++++---------
>   5 files changed, 123 insertions(+), 78 deletions(-)
> ---
> base-commit: 705da5b15ab89ba97b11eedbe507c2fd83d31cb9
> change-id: 20260706-james-cs-hw_id-output-failure-1d06d042ef96
> 
> Best regards,
> --
> James Clark <james.clark@linaro.org>
> 

Hi Arnaldo,

Is it ok to take this one please, Leo has left his review tags.


Thanks
James

