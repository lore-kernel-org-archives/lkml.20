Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794219844;
	b=pLihiGdMoEP8pgtSHzSoXntgtmHV5vQ81DVFWVkwdVmBus+DPRY/VcePRkp5eCZByYel
	 8i2lsoeT+8UZj5thisAkCDpjcgWwAftDiyzgbzOaWO56JlS8aHA7R/RoBTjn7QeozK+kj
	 3n1vrDgjah6IY9TojSIxwMXL14Jxjjd9gNJkCQqWvW80zvvEeznmVBKMLEqPPomcizVHH
	 8xzjogaVDGGrJ1g1yQAxHCK68FfQwTscl/YoNewS4DfSZHwx6b91bbzuA9mlVgIGx80Qo
	 +iwoK4lEqBqqkF5W25XEWs3ZN36bR5OJvuJ7TOL//A/HMgvyTucWd+H+c5ildiItlhw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794219844;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=LrHYhLri5ZS8HxQtgSMKMn2DV1tWM8X9x+L3DN75OE0=;
	b=WiQSmcJdVPowHxVgtzbqk0Ytq26qrZ4ZzX4fB2G6Zjfhymnx67Rq/jZbSPbxw5u7VRbo
	 NBv9dDH6eaJXSo5B0prz++ZZOemnFdi8VJVTuTqdGrVzvlNyCRyOIkLrvb6U1RS0iwbCB
	 22JjovfN7U1tzYfb2PErUhxRnPuNMr2CYHHlVuSCsGuoa8nCnh3vfEw9oL5ukUbG1MTsY
	 F+nkzvOTtG5KRfBjB/glaq94ClYHae1hL934q/hZPZxF5FgKLCSMxDOv2kunExs97iIte
	 HLO8QzMWA1FedSpAnw9T3Y9gCDXZJwDR8P0sRBqtv8xCdWeQaZ3rLqQG5zpTHlMyWdQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=nlj9epQT;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A710606A31C
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 10:24:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1A710606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=nlj9epQT
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a214c5c4c0so6847325e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 02:24:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794219842; x=1794824642; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LrHYhLri5ZS8HxQtgSMKMn2DV1tWM8X9x+L3DN75OE0=;
        b=nlj9epQT2z6HXVUfKx/96+teYLS0gsHU4Q126wQ+ycCDv1e0EFZ/IAcHbWKSpCckJW
         7b/tQV0B1zwMXX/DCdHAVXFRc+UJkrBnM9ACxgvHO0TsEBg+noR/O+LJOeoDjXayliSi
         AXXpc8GA8kTyUxBQ4dGW7p+w4IWZb7+5k2Ys0vipibDcKHeNUAIRCfklmxMhJMxtqeRY
         oQ9wiWxx44j0cI7aQ6Zsuz9xDMcGpOiEQbhFpSx9s/r5lzxSAcw6MYqmN3jR2WV0sUuB
         gDDvv94jll9603RI6xnhZ6wrnmtFYxeLCj2xcAIDkcNdWBDJIeExnlA6PlTr+ybRmalJ
         NSqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794219842; x=1794824642;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LrHYhLri5ZS8HxQtgSMKMn2DV1tWM8X9x+L3DN75OE0=;
        b=mMQ7gDIoG7Hnhdp3DAhPjNPMf71ED2qDAt7ipN6mBhUe9pRY1honT3/iJdyIhUxD2D
         rYPmEK9rZcnYUdi/coFItwksdlqbZFEbiVz+kA//ZTFBdt4OWODDhNvxFSzt2qWQhg1Z
         B3rUzaacqqzdYQ3jPMIO8HJUFuEe8lFH9uHHlGZ2BqWLxwNCF7GBShv8H3y5xlEKhmDq
         8n3oe3Id2xqbco1bvW/mj9w4oxI/9BYetQkmfsd22z8RzofpF1jDk4sUV3K5o/3Ad2wW
         ifMSqq/jQ2Bap6WHk8B1KmRy7chZcUElNNnySjWM+XoMMhD0v/DAK9uG70bs1qPlPThA
         x9tQ==
X-Forwarded-Encrypted: i=1; AL+hErH67RaUft/6hSho7/N6K1grwEvuQAn+zLhmEzM/h0AN4LBePZ8Ozl6Pj9yPqPIlt8VMy8WzRtfDDmaZFGA=@vger.kernel.org
X-Gm-Message-State: APuU4Z8lzz73Z2prfESWQFl1sPBdY2smmq2DJaQUL/IxFlQ58ut8NgjX
	H6oCgtNB3c8G5GCvLfltA4QX0Cka1nJKQVgfrklblnwMeEBFoJ3K2rRP0UbMP3R+pAk=
X-Gm-Gg: AYBFou32wKfdHYfD3QgwlZe1Tfdd+hDB5yy1mouAEP7ADdGziIvB2wkxmHlr4gV4lnV
	lnbhZPDnt0WAmvy+UC7UV5wd/ftC4FKXAGDjqRtHAfObmJRUMPlK/pLg0xCHftjXWC656oH7ZZo
	W43zOle+4NWOmOJUSZWmGy3eI4jblgXU+lSWSQlVzRaejFT9VS93ZQzBzToygzRvYTHd9xFoUvQ
	YHE2Ot7qMrb+aCRm0R236BQQzeix4g2bbxPD9iJGPD8ZjC1QcCv90qCLLXUitJcxjFjB+K1J0nJ
	3Rp9rl4d47PiTxta8gBhF+es2AMv0kwVp27KyCJNG4Yp+X5m0kpeQ5gGursMoWNkWNrDJ9mvrvT
	yWZNfFx1dz06M5NPJMCkepU64MF5EsIIGW/sfr9+1gVMqXfS3poPH49BKx1Nb5Cj9d236eElLgU
	fqYynvlew4dYFPYX8ga4xZn929qG0IXvwJG2TZv1EafZm+dbLNcB6Fv0jBxn9sbQiJr7BLu4oYp
	J07PHAoWlS8APIoZqz7DepZoV18qC6zpT/3rHZbX4g3UGLZyxyRmGComrlqvYjLJcGefR/32vUx
	CZXsfNUxAU/BGMwOR++9u4jJ9fUfuRCB
X-Received: by 2002:a05:600c:3113:b0:4a1:f720:74cd with SMTP id 5b1f17b1804b1-4b963c91d7fmr67354805e9.24.1794219842343;
        Mon, 09 Nov 2026 02:24:02 -0800 (PST)
Received: from [192.168.1.3] ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b7efb1547fsm406780645e9.11.2026.11.09.02.24.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 02:24:01 -0800 (PST)
Message-ID: <bf6925f6-613f-4e20-8491-2a99183f34fb@linaro.org>
Date: Mon, 9 Nov 2026 10:24:01 +0000
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
Subject: Re: [PATCH] perf vendor events arm64 AmpereOneX: Fix misspelled
 PublicDescription keys
To: TAKANO Mitsuhiro <takano32@gmail.com>
Cc: Ian Rogers <irogers@google.com>, John Garry <john.garry@linux.dev>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Ilkka Koskinen <ilkka@os.amperecomputing.com>,
 linux-perf-users@vger.kernel.org, Arnaldo Carvalho de Melo
 <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>
References: <20261108183846.3804875-1-takano32@gmail.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20261108183846.3804875-1-takano32@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 08/11/2026 18:38, TAKANO Mitsuhiro wrote:
> Sixteen of the 28 entries in mmu.json spell PublicDescription as
> "PublicDescrition"; the other 12 spell it correctly.  jevents.py reads
> only the keys it asks for by name, so those 16 fields are dead.

Shouldn't jevents enforce some kind of schema? This seems like a bug in 
the generator that it's allowed. And we have all the json files in one 
repo, so we can fix everything when adding strict validation.

> 
> Fixing them does not change the perf list output: every one of the 16
> entries has a BriefDescription with the same text, and jevents.py drops
> the long description when it equals the brief one (jevents.py:405).
> Running jevents.py for arm64 before and after this change gives a
> byte-identical generated string table.  This is a cleanup, not a fix for
> anything a user can see.
> 
> The file becomes self-consistent again, and the field works if the brief
> text is ever changed on its own.  No text, name, code or expression
> changes.
> 
> Written with Hermes Agent, an LLM assistant; the tables were regenerated
> with jevents.py on top of this change, perf was not rebuilt.
> 
> Signed-off-by: TAKANO Mitsuhiro <takano32@gmail.com>
> ---
>   .../arch/arm64/ampere/ampereonex/mmu.json     | 32 +++++++++----------
>   1 file changed, 16 insertions(+), 16 deletions(-)
> 
> diff --git a/tools/perf/pmu-events/arch/arm64/ampere/ampereonex/mmu.json b/tools/perf/pmu-events/arch/arm64/ampere/ampereonex/mmu.json
> index 66d83b680651..9457f9be4ecc 100644
> --- a/tools/perf/pmu-events/arch/arm64/ampere/ampereonex/mmu.json
> +++ b/tools/perf/pmu-events/arch/arm64/ampere/ampereonex/mmu.json
> @@ -30,37 +30,37 @@
>           "BriefDescription": "Data TLB translation cache hit on S2L2 walk cache entry"
>       },
>       {
> -        "PublicDescrition": "Data TLB translation cache hit on S2L1 walk cache entry",
> +        "PublicDescription": "Data TLB translation cache hit on S2L1 walk cache entry",
>           "EventCode": "0xd805",
>           "EventName": "MMU_D_TRANS_CACHE_HIT_S2L1_WALK",
>           "BriefDescription": "Data TLB translation cache hit on S2L1 walk cache entry"
>       },
>       {
> -        "PublicDescrition": "Data TLB translation cache hit on S2L0 walk cache entry",
> +        "PublicDescription": "Data TLB translation cache hit on S2L0 walk cache entry",
>           "EventCode": "0xd806",
>           "EventName": "MMU_D_TRANS_CACHE_HIT_S2L0_WALK",
>           "BriefDescription": "Data TLB translation cache hit on S2L0 walk cache entry"
>       },
>       {
> -        "PublicDescrition": "Data-side S1 page walk cache lookup",
> +        "PublicDescription": "Data-side S1 page walk cache lookup",
>           "EventCode": "0xd807",
>           "EventName": "MMU_D_S1_WALK_CACHE_LOOKUP",
>           "BriefDescription": "Data-side S1 page walk cache lookup"
>       },
>       {
> -        "PublicDescrition": "Data-side S1 page walk cache refill",
> +        "PublicDescription": "Data-side S1 page walk cache refill",
>           "EventCode": "0xd808",
>           "EventName": "MMU_D_S1_WALK_CACHE_REFILL",
>           "BriefDescription": "Data-side S1 page walk cache refill"
>       },
>       {
> -        "PublicDescrition": "Data-side S2 page walk cache lookup",
> +        "PublicDescription": "Data-side S2 page walk cache lookup",
>           "EventCode": "0xd809",
>           "EventName": "MMU_D_S2_WALK_CACHE_LOOKUP",
>           "BriefDescription": "Data-side S2 page walk cache lookup"
>       },
>       {
> -        "PublicDescrition": "Data-side S2 page walk cache refill",
> +        "PublicDescription": "Data-side S2 page walk cache refill",
>           "EventCode": "0xd80a",
>           "EventName": "MMU_D_S2_WALK_CACHE_REFILL",
>           "BriefDescription": "Data-side S2 page walk cache refill"
> @@ -90,61 +90,61 @@
>           "BriefDescription": "Level 2 instruction translation buffer allocation"
>       },
>       {
> -        "PublicDescrition": "Instruction TLB translation cache hit on S1L2 walk cache entry",
> +        "PublicDescription": "Instruction TLB translation cache hit on S1L2 walk cache entry",
>           "EventCode": "0xd901",
>           "EventName": "MMU_I_TRANS_CACHE_HIT_S1L2_WALK",
>           "BriefDescription": "Instruction TLB translation cache hit on S1L2 walk cache entry"
>       },
>       {
> -        "PublicDescrition": "Instruction TLB translation cache hit on S1L1 walk cache entry",
> +        "PublicDescription": "Instruction TLB translation cache hit on S1L1 walk cache entry",
>           "EventCode": "0xd902",
>           "EventName": "MMU_I_TRANS_CACHE_HIT_S1L1_WALK",
>           "BriefDescription": "Instruction TLB translation cache hit on S1L1 walk cache entry"
>       },
>       {
> -        "PublicDescrition": "Instruction TLB translation cache hit on S1L0 walk cache entry",
> +        "PublicDescription": "Instruction TLB translation cache hit on S1L0 walk cache entry",
>           "EventCode": "0xd903",
>           "EventName": "MMU_I_TRANS_CACHE_HIT_S1L0_WALK",
>           "BriefDescription": "Instruction TLB translation cache hit on S1L0 walk cache entry"
>       },
>       {
> -        "PublicDescrition": "Instruction TLB translation cache hit on S2L2 walk cache entry",
> +        "PublicDescription": "Instruction TLB translation cache hit on S2L2 walk cache entry",
>           "EventCode": "0xd904",
>           "EventName": "MMU_I_TRANS_CACHE_HIT_S2L2_WALK",
>           "BriefDescription": "Instruction TLB translation cache hit on S2L2 walk cache entry"
>       },
>       {
> -        "PublicDescrition": "Instruction TLB translation cache hit on S2L1 walk cache entry",
> +        "PublicDescription": "Instruction TLB translation cache hit on S2L1 walk cache entry",
>           "EventCode": "0xd905",
>           "EventName": "MMU_I_TRANS_CACHE_HIT_S2L1_WALK",
>           "BriefDescription": "Instruction TLB translation cache hit on S2L1 walk cache entry"
>       },
>       {
> -        "PublicDescrition": "Instruction TLB translation cache hit on S2L0 walk cache entry",
> +        "PublicDescription": "Instruction TLB translation cache hit on S2L0 walk cache entry",
>           "EventCode": "0xd906",
>           "EventName": "MMU_I_TRANS_CACHE_HIT_S2L0_WALK",
>           "BriefDescription": "Instruction TLB translation cache hit on S2L0 walk cache entry"
>       },
>       {
> -        "PublicDescrition": "Instruction-side S1 page walk cache lookup",
> +        "PublicDescription": "Instruction-side S1 page walk cache lookup",
>           "EventCode": "0xd907",
>           "EventName": "MMU_I_S1_WALK_CACHE_LOOKUP",
>           "BriefDescription": "Instruction-side S1 page walk cache lookup"
>       },
>       {
> -        "PublicDescrition": "Instruction-side S1 page walk cache refill",
> +        "PublicDescription": "Instruction-side S1 page walk cache refill",
>           "EventCode": "0xd908",
>           "EventName": "MMU_I_S1_WALK_CACHE_REFILL",
>           "BriefDescription": "Instruction-side S1 page walk cache refill"
>       },
>       {
> -        "PublicDescrition": "Instruction-side S2 page walk cache lookup",
> +        "PublicDescription": "Instruction-side S2 page walk cache lookup",
>           "EventCode": "0xd909",
>           "EventName": "MMU_I_S2_WALK_CACHE_LOOKUP",
>           "BriefDescription": "Instruction-side S2 page walk cache lookup"
>       },
>       {
> -        "PublicDescrition": "Instruction-side S2 page walk cache refill",
> +        "PublicDescription": "Instruction-side S2 page walk cache refill",
>           "EventCode": "0xd90a",
>           "EventName": "MMU_I_S2_WALK_CACHE_REFILL",
>           "BriefDescription": "Instruction-side S2 page walk cache refill"
> 
> base-commit: fa4ad798f6f681031775266044ba1b0cf3c670bd

