Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AC194349BC
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 13:52:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790603529; cv=none; b=e5isgResDwk+csIjt1frs/RMWI/5gvGLyR2CCmtbuJzHHwfzNcvcaDX1Mhxh8HaI5/v50EiaY0jXAZ/91O3dfMFWpGsXZ0KUFZQ/svm+1ivQnbfznaQ4zmBRE6zsMFNpW7Q3t8194C1+3SyijBWX8qyZqrie26jJUgKpnK05Wmw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790603529; c=relaxed/simple;
	bh=h9nhueiW90n/PQeZv1y1n3cikpJCagd1jp/6ZlWFcBA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UtEGpF+d1PulmBzpLiClZRlPLenWAr/8b60qhIAG+JaTbUOeIp5Xka5yU0ct3DR5a3Jw+i14r3YEnrUycSb9RWTmb1elSgwfn4ovsPzVwJ9bUaVdrfYhFnCtKqEwfszaBRg6k3n3MzXswx6PhDQP/Dl1HVDutSnkVsZKhQENiw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=A150Iwbo; arc=none smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="A150Iwbo"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c293c683202so436926666b.3
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 06:52:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790603525; x=1791208325; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=l4Wj4baECg7d15XvpDd5zrHb67qSLbXRWYAn4x6e368=;
        b=A150Iwbo2tFLqNR91CwrGuMs1Txsm0dgch3PlDvZXlMKCaUp7hGMkBGp2whOXTbPOW
         r7ZXgwBg1Z14dOJu4EFgPRmmbnRpzirtiu6vr1jy40V6pOcvWRSFqHNKl+C9LpxFhK1O
         HGhKkEx4lLZTAEMl71bKfppNZSrSCQorjk+P85Hz1OrdhvQ0iphaPhta02DGIgQH6wiX
         xV3sczBExnpvdOpIx/JQSeh3VQuCvLGKsJ9V/ILvyrhKvuSAZdsBGXkojjfqwNCTAcru
         2PByzPs/dfVPm35N5Cy3hy1XFVuaQrPYEgq32x1TB/WSVjLsI9VkhqHgaQkAifgepRsT
         bMog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790603525; x=1791208325;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=l4Wj4baECg7d15XvpDd5zrHb67qSLbXRWYAn4x6e368=;
        b=FcqrdcX85GF6uf7qSpYnAyrV6KJm5eFUGwekB6z7sm9RVEBwV8p1Af28ikuQCQAAjZ
         SmlcbjdQg00TywWqfCpu7/xet/PPGOxsslxz3Xtgzfopmuc5xSjkgt46HhzFnaCgqRq2
         9x2QkkKnaJwi1xe+ydawLClVPPlrDUgxpZcTxSwt5EE67rOppSUFN07sBe3JDJkx7WGO
         FWcIisZG/rMVfSuivr/a78LS37vku5JjTrP5dyopHU4Nc1ynU8beJKTI042WNS+8Yv5i
         fhH6/ZFMh6HYpv5BS5yxsgLOlTLacf+wHddUq20x6x1aQ6beaHGe1/Gj/mEnQcoYm0LP
         Zu7w==
X-Forwarded-Encrypted: i=1; AKwUvBwAVYlUB6dF/cks8ptWnaznmdoC7liywtczV5ATl4sHnfWsjx2jBUyDcxfhR6PxlEOQ/MsKybeuktAbWqA=@vger.kernel.org
X-Gm-Message-State: AFq9FYLOKyv7Jp8vNxl4nkOFjSqDJWsdz39xt6ODCUwJ4QUG9ijCM337
	HfvMi/sQLE3XdyFIZRbB3ZpADJJf3kZlkyw3t0QY5Z576he1jmK0VGLpx5F3Qum2qCk=
X-Gm-Gg: AYBFou1RQK0Unc2afE/8Ds4NFmsWYNzslHe6YzQH6syUNGzBGK7duZDOvXPLmzyFSMA
	JtxoTQe+VQCQ6/NazxTUvJyJVJ/JP88XMx7oNuxIm58zBWjur2DwNqye23RUvj1o1eB0HUah1G9
	K9fQBebsXy0jquS4ETH+QEslw9Xpiqpd/czfou4b6NPrwqzLPZrQefKYB51lhcjH632v08UDvgO
	G4TykAviStHptq4MYrJaSRV58JGsh/Z0l5GZc4hSxMoX9LAp3oFpEb2Ng5lEbBUC3D4KmGfFWmq
	bU3HZKNZwikQWfR091e431lQDRYcWpBCB5RWEEXIZLWXP525TjmfZUn5VjEWZODVRX5STcd+dtc
	bjPfcddkm56e0ziGO9QVxh/lO8pGdgph5Q/DhBSZXl3RbDWeW5ldQJWYoB2L+dYFbxxW6e9LSt2
	RizHJHXWiiTwKKVHy6FarrpU8wR/1zLlPIoh1H2NkJSaGlYdal3lLw0f5REFgWPf6lhQutgeQ4E
	8Q=
X-Received: by 2002:a17:907:d14:b0:c29:c07f:c0c8 with SMTP id a640c23a62f3a-c2ae979eef6mr776208966b.3.1790603525476;
        Mon, 28 Sep 2026 06:52:05 -0700 (PDT)
Received: from [192.168.1.3] ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2dbd3bcadbsm285069566b.72.2026.09.28.06.52.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Sep 2026 06:52:05 -0700 (PDT)
Message-ID: <79e7cb39-b4af-4ac9-b72b-b01872603cff@linaro.org>
Date: Mon, 28 Sep 2026 14:52:04 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] perf python: Fix arm-cs-trace-disasm type error
To: Leo Yan <leo.yan@arm.com>
Cc: Arnaldo Carvalho de Melo <acme@kernel.org>,
 Namhyung Kim <namhyung@kernel.org>, Ian Rogers <irogers@google.com>,
 linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260928-james-perf-mypy-cs-disasm-v1-1-1bda909475ce@linaro.org>
 <20260928134642.GE14479@e132581.arm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20260928134642.GE14479@e132581.arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 28/09/2026 14:46, Leo Yan wrote:
> On Mon, Sep 28, 2026 at 01:58:09PM +0100, James Clark wrote:
>> The perf sample dso_bid getter returns a string or None, matching its
>> Optional[str] annotation. Attempting to decode it as bytes causes mypy
>> to report union-attr errors, even though this was behind a conditional
>> that checked for bytes type.
>>
>> Use the string directly, retaining the fallback for an unknown build ID.
>>
>> This fixes the following build error:
>>
>>    python/arm-cs-trace-disasm.py:266: error: Item "None" of "str | None" has no attribute "decode"  [union-attr]
>>
>> Fixes: 279b402e5143 ("perf python: Port arm-cs-trace-disasm to perf module")
>> Assisted-by: Codex:GPT-6-Astra
>> Signed-off-by: James Clark <james.clark@linaro.org>
> 
> Thanks for the fix:
> 
> Reviewed-by: Leo Yan <leo.yan@arm.com>
> 
> Just curious, have you run this script and compare the result with old
> one? Seems to me, the build pass is insufficient, we should run a small
> test to ensure the result to keep same.
> 
> Thanks,
> Leo

Yep the test still passes. I assume the "if isinstance(sample.dso_bid, 
bytes)" part was just dead code.


