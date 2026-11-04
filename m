Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793784166;
	b=MwcPFdP/atZ4AjTil7wmH1+s+fqXRqgnOdJZ57NyzFx3Bk+ZFL2wUqIzN5WdV/gz5qmH
	 X5xMOcmkEwQB+iWjTirAOqAHA+6RTZnUxtujRd7IeH5D9zUhXDcg8F445Xjdjv+QDjN0e
	 LLCrWjY2xy2ESxZ8zbCgCU9ty9S5F6XZJAHGl6T0bo6LWICzZXrwDz4oLgCDiH8mZkO1C
	 SNMM6lTxQQjg2Ptq74PDf1Oswjekzn0azRny+YGUpzndNZr5uiG2z69zGfXNBSd8GFa5N
	 D4S1tGXGr+4cAo1xIF0EswAivEfJTh97KWc0EWW59SstRMtW3pxHBhINj9+zXO7W3iQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793784166;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=BDX9/YwW4F/DFICBRzzjsXdCNJ9F1302zx4p3uYHie4=;
	b=sXY/oycCx55Ekc9VAtxvRmYIq8f5fOEQcIMnaujqXMTqpjo952foS8qDhLPxdljXn7a5
	 ylOZ79bFXdWiQGfzdQlr24mPgih6jK9KfhKEII+BDNuyOlRa6GWL5+xbCoJNuK+g8Exkm
	 aQGDqb6MLIBLCwZprmcr0xreCMZiikw9UpTqlrSoxzVkc6XiqemfTEHIlCz7PAptvtvBB
	 PW4RSSRQFhA8cY+mwIGzb0th3KffBZoGg8d6zBrzpw1CfEyveG7FEqNzk6yMxTN0dBdio
	 bdEXBvNe8NN39DXDFpVjwoqwAqA6x9wKBUeOn4KceRPBLLtC/aNpkJntCHulouEZl+w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=yKx9xA1A;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7800B606A326
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 09:22:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7800B606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=yKx9xA1A
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a35ac4475dso2683045e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 01:22:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793784164; x=1794388964; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BDX9/YwW4F/DFICBRzzjsXdCNJ9F1302zx4p3uYHie4=;
        b=yKx9xA1A/OJJaG2Ga9Za6SnP0CEKqQ79l1zbcyS8UTJQX9WklzQ3Z7tBx5iDKFH9uC
         lsXNvmFvIEVsjp01VDegpZeZYD75JLDpgU323XY91t/o72zACl9ft/FIdR/uwkABI5r3
         nK0CLEiKcC1IQ7Gz148yucTtnP16VcbA0PDBb+7O5tAjlGIgWLUaaInuSqEbIGM/ieJo
         3mlW3RpgacoW/U0qkfdg9gSNlhFWBtjBDtal9wLvth0SBU1E3lmCs47xkZO7QLU7TMDX
         NHyiMxuljCYrlXA3gRvu5n2c9+H0H/Pq/y58x7M4pfd/ZFasXAPeTlOxU/JuPXrXg2zN
         5BVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793784164; x=1794388964;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BDX9/YwW4F/DFICBRzzjsXdCNJ9F1302zx4p3uYHie4=;
        b=pdrvFdJWcHdixb/0YLoY/sUHBWTVw4bt49UsAH7zOJQXF8xYh0FnPAu4PW+dyw2cO5
         m78dLAIKFMe1m51nf2ccCURyJVXAWk54oRhbUdiykcDxwsS0L1l1vlrzPPsBlGe7BMKT
         jxrMorhegMbBWn6xiTZQkKMzv72kGlI1G1Gt456/KA76ydM/pMnLIrkaGRQJ86Y1VK9a
         8bt6hOyy8PcjGeVf7zb53pLhIVth+0mdmkUk7r+PsbYbenViqf1DYK7vzw6PXgu67uzW
         Spq0YPrmWFJBiV1B9ITQ0pIpBqSgoeXCdCd2zcO6Ve7g46U6syww4JLH2zO30Laj0YPb
         3+3g==
X-Forwarded-Encrypted: i=1; AKwUvBzqqeTfm+dsET48SrfLkSb10GFLJLM7g3ocrWHwJNf7YiKOMaUgQ+fF6VnJRX6vgYIlPEWtgLUrDOML4p8=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Gp4MfRT1g4IuvoDF+dYcxjvNSmvPivtoLPX6kuvHGoDWLPjpX
	LfdGA/G/G/YCJwpcmOZEwl5PC/Vm4s+OczuMnZChRcOXauaNjhRcxoqT178kjkwhgBw=
X-Gm-Gg: AYBFou2pTuyn3wqTUYIP5KmAbPh6sesgRVa1830jXvR87/Wcw4KT3b3T2MIiPShU9g0
	+s0jsTLy7BJWgyZqMTlNwZn8P1qR2agmLwePgNUwhd2cJOZVlsFjt505R5vbTWIHPGuBBm4rCRn
	tNSt1G/gmR+8vu3VhZ7PAKxJk3y2OC4nJ+CH7cd59xiAzczlzVNfu0+vSlanI4D9p8ACErr22ee
	ZOa0IPS7jIyqLdFfCGSov0+FRWGjFhA5gKyItwjZrnlTtkili5yQC1Ruv5sAgAheE9ZjJuZ7lOo
	j4PI3FwKhB2ic4OmWeNhgfUoheW3SdNl33Kgiga1oyTu3fnh5A7Ax5+In8OTpEvSHZel2uKg3PD
	I+9s1A/meCa3tl7177JG2EB2vvlAWJFiwvuD1hFaWz3+HQRI8VhQJdgYPbmX0uM4nZR3JmGwzCI
	nMRJvD4BE5mDtICIsgbPoKEqMShRvihvorlWKAIaodlwX0vUMY0v5LBA+oKudGxp4xRy5zGcWn9
	yG83qh9ZoAJ/2WoXndPDVmbDsYOq3Qhd3h9DB3r8OhHwh+xpFIa1XUAEwiDUYuwBupdid8ALiRF
	iojcBISuS/k0dpN3SvvUAJaGJfM/MHEZA7dkKNYiwx54XBlAYe2GCQ==
X-Received: by 2002:a05:600c:3547:b0:4a5:cfc:1e95 with SMTP id 5b1f17b1804b1-4ac182dbb5emr339576395e9.33.1793784163886;
        Wed, 04 Nov 2026 01:22:43 -0800 (PST)
Received: from [192.168.1.3] ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b2ab00ff3dsm230175975e9.14.2026.11.04.01.22.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2026 01:22:43 -0800 (PST)
Message-ID: <0f57d95c-fb84-4e70-8c86-e5314c0ca8f2@linaro.org>
Date: Wed, 4 Nov 2026 09:22:42 +0000
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
Subject: Re: [PATCH] perf hist: Fix branch_info index for sample weight
To: Gu Bin <gubin@cmss.chinamobile.com>
Cc: peterz@infradead.org, mingo@redhat.com, namhyung@kernel.org,
 mark.rutland@arm.com, alexander.shishkin@linux.intel.com, jolsa@kernel.org,
 irogers@google.com, adrian.hunter@intel.com,
 linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org,
 Arnaldo Carvalho de Melo <acme@kernel.org>
References: <20261104090229.1870-1-gubin@cmss.chinamobile.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20261104090229.1870-1-gubin@cmss.chinamobile.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 04/11/2026 09:02, Gu Bin wrote:
> iter_add_next_branch_entry() is called once per branch and uses &bi[i]
> for the hist entry, but reads the weight from bi->flags.cycles (i.e.
> bi[0]) for every branch, so every entry is weighted with the first
> branch's cycle count. This is incorrect when the branch stack contains
> more than one entry with different cycle counts, as the weight of each
> hist entry fails to reflect the cycles of its own branch.
> 
> Use bi[i].flags.cycles, as the surrounding code already does.
> 
> Fixes: 0e332f033a82 ("perf tools: Add support for cycles, weight branch_info field")
> Signed-off-by: Gu Bin <gubin@cmss.chinamobile.com>
> ---
>   tools/perf/util/hist.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tools/perf/util/hist.c b/tools/perf/util/hist.c
> index e75a4fcce975..364754e9d12a 100644
> --- a/tools/perf/util/hist.c
> +++ b/tools/perf/util/hist.c
> @@ -1055,7 +1055,7 @@ iter_add_next_branch_entry(struct hist_entry_iter *iter, struct addr_location *a
>   	 * and not events sampled. Thus we use a pseudo period of 1.
>   	 */
>   	sample->period = 1;
> -	sample->weight = bi->flags.cycles ? bi->flags.cycles : 1;
> +	sample->weight = bi[i].flags.cycles ? bi[i].flags.cycles : 1;
>   
>   	he = hists__add_entry(hists, al, iter->parent, &bi[i], NULL, NULL,
>   			      sample, true);

Reviewed-by: James Clark <james.clark@linaro.org>

