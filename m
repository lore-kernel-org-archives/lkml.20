Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794211778;
	b=3/BlKfD9YybuPc8LfRY3Ad4KpNyUmBqUSAbkWVxRPQv4Xe5FKbMIxWMaysOS48FSImLv
	 pFrydZBU8AfhBX1EkEpfKDMSMFMuYU3E9ghJkqG2U319HWADKY4a2LiV233Ki38MZc4pG
	 tQG2jdBNSv1QfqFcr6q4EnDZBPYYFIpiRAAC3cyop/Q6HSWYpyw8OLU4LhQ2AHm+8OdBk
	 YHiklcKTQovKadMZNHW3xtoaKThUVHLOMr9HZLgGT9FGQhzzjNfzmcMsWCXCYZNUQrn2F
	 qJU58skhhEKRtGv6CORtd3N3h20I9NL1KkpaJk9vIj1aaeBxcVLPfZZ+jJxjpEB8H+Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794211778;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type;
	bh=7WgP2xkUAyLjKpFzwzFZYmyYY1jkU6o9DJTWgp1SX/A=;
	b=aub8kJZr6Nd5euVr0yHh8kQoBwCCKMEN51uMz5EecCUWiRQlVzTJ1XyiLsonRxwInSoM
	 vAbzkXNlxGdwcEd6rAUczUEbkkuQd79uu9e+/OYf5aZCjivEi5BgczOgSI8QnjLfBjdZV
	 6TB9dqR+KvObaOcy38gSbA31O/Ki8hfxkhUj4rqM6BwCHmJdnQerwydE3W20ZNA+CD0i9
	 Lvq4ZE4K4kcPQQEsrYG+ZlN7YK0/Hu8YHw4fgzaeFtUBRRoATFCWH1Jz/RPApXkW8IRM1
	 kBdr85f+cAEceBgakSivzAnl8hpR6Pxp5ZLrID8gXxtqtVp9I49wdUCKpdeFg3hc+Ug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=S8Tk0nNo;
	arc=none smtp.remote-ip=209.85.221.51
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3392F606A337
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 08:09:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3392F606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=S8Tk0nNo
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-48e1d0e5dafso333261f8f.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 00:09:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794211775; x=1794816575; darn=vger.kernel.org;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7WgP2xkUAyLjKpFzwzFZYmyYY1jkU6o9DJTWgp1SX/A=;
        b=S8Tk0nNoY0maepYWmlS7C2sFzi+1aC0IBEIvaWcskQHbTJpM7hyPwl1ZF7mkVp3veC
         OdVMuwzBQmRwg9N3Cu69n21v/xaAmbOwFyAl2wyht10VAOUa8XEGxDQty4gx1vvGGRB1
         bZPTJHgqRu53HnL6T6kAefTWdnHtWdMNK8CqDV1deR/SFghUzJE9rfhbGI+h1PxA/xaL
         Dizr1Zc6Ns1LhZstTyHRy5z/kHmnQJagcwu23jNbIBtWVtEH+guHHcfGApsHEgDz3Gen
         4PbzSLlnhrJaPjngxF3ucCCbvyreRU7DFXjlWuK6R+sBhihB1IjQF318nn0Gc022YwUo
         EyYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794211775; x=1794816575;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7WgP2xkUAyLjKpFzwzFZYmyYY1jkU6o9DJTWgp1SX/A=;
        b=2M8SZcZO1eg8sV/wMst+ELDmzuysG+8+7t6kMrhWf8PGdmVg5qmuhS4P3HP3TffZbj
         oaGGKp0m0iYBM/fkjWaK9/78/cTNeE38qr9P2lXs6Mp9HPTEbwmgR5aSwTBzY5vP54Ur
         9+NiI0HNg2on8lx9e/g+87MwG5Dr3P+D4Eev1voU/Sb7mBLZnM6x2DwMG2DCGCIHdl3m
         kvHV4Qt1ZpcGKGNE2SpFjdG9XO2rAkpL6Tl5A8GD9ixNAlBPZCQjfyM/YzbiRcrZeHq4
         38vHqX/9FKqUbF4MhAY/c7cXj3mFEMu/w0ORljdfE9aj5xVNPGkJANJwG9ooXki40JCT
         i9Qg==
X-Forwarded-Encrypted: i=1; AL+hErGCKeFzXFVXVI0OVtGaDe+Lo7zZwGfcdr7mcoMAlP05lSoAw7izpEe7dmykKCOhyU2cc3/2EzLrgt/WfQY=@vger.kernel.org
X-Gm-Message-State: APuU4Z8lq/GbwY0j2LNXU1j/mpLQy4DG5yzYvPa9E3FrF1PAmMQmxmvq
	l37uhHqSXb1P0dDec1ttEBvzSUGNmze6p/NtUcOUd+TZWgzZ66zUEM8K2dsLPNQS+UiU280vloz
	Nkp6y
X-Gm-Gg: AYBFou3wpdKhCvFYG5TIA8bFHweHAczD4/mhLLrhL3F2SU3QHNH7fxN0rQX/YqLvmGo
	MEVUWylVbmMEa0Zj05rbxeTdG6eZOAXFKujSH8LqzBhqAOmY6JCkm6dJK0Tj//BGBD4Ij6Z1LMR
	iilqZpHBZkjLRnZdXgbi77zEmjrN3UNvbd5R3tM4gOQmzd/OrvF3T+zzrC/o4fiJLpPbrzCvFdK
	Ft+I9VnzEU7SGP+y+11bNcC1Fe+MCJiV8DIjKggglEoMhThgqbcdJwFPJOr4Rjh+dSuJkjUgJMX
	MNWykKmwhMTGjAm0kcNqKsWJFTFGexxkdWu8io9BOb6um0d7T3peOEa3CP5IHGl2rFqjnEvABxO
	HS60bjLSevJS8bqjYO1z8OmdTdzREKPwzbwryr3OWDWX9BdMMzOf9JxgQlHTjQUk0zblUC5NZC6
	Ne05+FG2EhoP70AKffoxgqzaPn14+tPkWuHZhZ+NZp7x0IZFRGZxarr300URgWkd+NuGmtTj4g/
	npwvr0c+CStMhRbuvzQ8Kv//SohzblQnIl9MaJXmy36yrpB4R0gSLL7h5e5npZlT4fuf3I4dWA7
	Rqw4E/EBohbBTLHzG72ShrXmyRB+PNYb1ZhSDvPxl7z2tETj
X-Received: by 2002:a05:6000:5c6:b0:490:5521:f24f with SMTP id ffacd0b85a97d-4941f667da5mr10718282f8f.3.1794211775492;
        Mon, 09 Nov 2026 00:09:35 -0800 (PST)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49597187162sm8595813f8f.34.2026.11.09.00.09.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 00:09:34 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Jude Gyimah <jude.gyimah87@gmail.com>, lgirdwood@gmail.com,
 broonie@kernel.org, perex@perex.cz, tiwai@suse.com
Cc: neil.armstrong@linaro.org, khilman@baylibre.com,
 martin.blumenstingl@googlemail.com, linux-sound@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Jude Gyimah <jude.gyimah87@gmail.com>
Subject: Re: [PATCH 0/4] ASoC: meson: fix missing REGMAP_MMIO dependencies
In-Reply-To: <20261107165527.576383-1-jude.gyimah87@gmail.com>
References: <20261107165527.576383-1-jude.gyimah87@gmail.com>
Date: Mon, 09 Nov 2026 09:09:33 +0100
Message-ID: <1jmrri1l4y.fsf@starbuckisacylon.baylibre.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain

On sam. 07 nov. 2026 at 17:55, Jude Gyimah <jude.gyimah87@gmail.com> wrote:

> Each of these drivers can be built into vmlinux while the code
> providing a symbol it calls is a module, which fails to link.  The
> same shape in 4 drivers, so they are here as one series.
>
> Affected: aiu, axg-pdm, axg-spdifin, axg-spdifout.
>
> The fix is a select rather than a depends on: the providers have no
> prompt of their own and are only ever enabled by a select, so a
> depends on would leave these drivers unselectable.
>
> Each was reproduced on v7.3, arm64 by a vmlinux link that failed on the
> named symbol, and each links once the select is added.
>
> Found with kreach, a static check that compares what Kconfig allows
> against the symbols the compiled objects actually reference.
>
> The checker is at https://github.com/JGyimah/kreach, and the
> reproducer configuration for each finding is published with it
> under results/.
>
> Jude Gyimah (4):
>   ASoC: meson: aiu: select REGMAP_MMIO
>   ASoC: meson: axg-pdm: select REGMAP_MMIO
>   ASoC: meson: axg-spdifin: select REGMAP_MMIO
>   ASoC: meson: axg-spdifout: select REGMAP_MMIO

With the change sashiko requested

Reviewed-by: Jerome Brunet <jbrunet@baylibre.com>

The re-spin is necessary because the description does not match the
change, even if the change is correct.

>
>  sound/soc/meson/Kconfig | 4 ++++
>  1 file changed, 4 insertions(+)
>
> -- 
> 2.43.0
>

-- 
Jerome
