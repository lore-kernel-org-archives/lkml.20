Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794417589;
	b=0AnCB4wo4BjGaSW+ffo9hsuq0Ul7e+YMdOqjD3W3djbDeTj2pSe6ERW2kanYT+DmzeTg
	 er8QxvIVAwXgZt8+jgsA3/ILbW4zqvbTGvrLXIaHju7YtOAY41k/rZDoxt3cYZyYt16Af
	 WEt4ETvVPYRHnCpn7kXl8v5upcAryTAPqCf/ds+qTDf3zwkCFJfqDc++DTtGkVnEgk0PL
	 3lky/DQ5JEu72cIkNieROLiHqfiTiTmJPS83V8hSv5EnNTd87/OR6A7Vw7ysxdGYS4U0p
	 enPksHAYpgxdJx8ZzDQXXu7bKiHys8wA0mF4XDtmnMarkViC8Sn1Vi7abAm8VdPdKmw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794417589;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=iTol9OuOgGYXh26V9QvjAW3otBVqyc5sDP/r02tbP3M=;
	b=hXYpYnJJaQ9P/TYjg1VQ0eerjU+z2BuvkDO7QPg54W61n+hOzYBzQzOSmU4j8P331Fiv
	 Nre2bm3OxAZUo2b3UH9dTnuOlK9ztBz3mtMG35qJEQsDoo4aSEEHiSQi4WYaqXwu7qx09
	 enpt0R0YcM2wyz2lvrk8AyhDsXvM/H3QheuZCn6/r9fnnvOmrOOB/jaty0hXzACD08whJ
	 HkwA90vui5goWu5qmnP0zY6znOY/1hdfPI6nsacUxPnaozufLTcjuWi+hgBrzx/I/Twcc
	 /y2KIanZWJR3rhRSqGADskC4CPtm+6dU3OWqEWhHMoX/ZYNLNHHUZuo4ZoElR+VLXSQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=as1eS6by;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.46
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCF5F606A326
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 17:19:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CCF5F606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=as1eS6by
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6b47c1a3c74so4141069a12.3
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 09:19:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794417587; cv=none;
        d=google.com; s=arc-20260327;
        b=ArjAWQGKLthFOfKEC6KVsZ/Jzgta7Zfjz6cJ8b8OxZV3BY3vJ2NSKwZppq8hpwHpWX
         vJ1vJPRuluRjivz3Zwo0vL1Dnm6TYkSz2OAPRgefIPA2GuhiVJhvfOuM3qmviBW1zCVt
         IHTvX+cZeWl+rk5Zvto8ypaA+kG+exiNui/qQBFIiROsuDPBTYLBiqucg57sgSHdlEpM
         1WBWf/nZhoNtJfahqmEvP8LxV2ghuuD5Wlxo2MvAV0pHZ/mvfQlNvRnZk2/uVlMeXF/t
         apYTO4ja8D3wDohMuRB4vP0w2lZZ1ePFrQB3GAmrWRi42N2RHzYPtjs0qAQ93USbCJNV
         2KZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=iTol9OuOgGYXh26V9QvjAW3otBVqyc5sDP/r02tbP3M=;
        fh=m+AgbjRLub23NNSO+X3TN5dm0RVbXSINXFnWIurLjaE=;
        b=oqGKDzTR/7cx6mjVfvXLivnFkvgRG9l1rWVAB1eUu4Yq4hGqZx9dl3u9jIk8GlOJug
         1b9xJfA8qh0KE2j87iJwrPbrZCQIygMlBXD887pKv54xOCgj1QzgpytE/R6Aq65EsbIN
         dBbCKYe9px/IuW1by6z3krZMmRtvkzMdxkGkGuRnhWswY3LmzkmZEBR4Q1Emb1De6Umh
         ZUv1naObY0dR08B+lD6lw/lG1diAGN9cqy276Ci0vPSD7LNuRQ/O+LTSVzzYGmc7uTUF
         WKeanWCIXLIz+Zz6oeERRSt8ZImPRL+k8Sf09tFACb2sMPMlZi+nH9r0WOrU+Yl4m/Qd
         HtTg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794417587; x=1795022387; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iTol9OuOgGYXh26V9QvjAW3otBVqyc5sDP/r02tbP3M=;
        b=as1eS6bypCTE5b+92bv/ROzRgy8V3klxe4VWAMyoyyL66NF5Fyy3Z1UiZKTUi/v74V
         VAXDX1IavrKKO3i32uvsuHLolnjzXugfNMQdUBMbrmJ+Ix7mIJKfQh5IpOFMMCC4HQTk
         jGlIPZakc/2kd8Rojea82axums1XYqtmqqvqbVT3itlwu/zrv0j3Bjz0SaHrF6fuxZjr
         76o0sZbhtz5JeCzVBgDViK3ponHzPGY6Igy//d7n4sZJWr3ErAQehFC0lhs38iUEPMtf
         qV6acbOlEYpwhGiTPHXBGTNXf7TwbKOgcYXcTRvbrbQb8RSc4PhIYtqtz8yBo5A3l10x
         tAjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794417587; x=1795022387;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=iTol9OuOgGYXh26V9QvjAW3otBVqyc5sDP/r02tbP3M=;
        b=JhZGowdgEg9BgL3GOp1vsTTvtGVzK4H2YOnm2Iicxi7F0wEFS+DdyqFWTkOJNkLMzx
         EGUPAR6oBp2pVaATuTmTSHwfY300Hj9Z0xz8mUqbWX5WX6OiI+FPfmj3+KYy8YYzsCWz
         2up9OTjK0y4UdqMdYeOMksjThHDR4RhEC9QxbRfhINfLPRLoyUKwdbnFVXFPKEVMvZ7l
         TSaRwK3MyU38086IapXTALWc8f0jMpRbHCdISkXCRuR9SD8NXksy5KqmTYDnzF7zlskR
         2RdSY17JOQHX8k+Vr/V6s8s7J6Uh1rCVe3TB7RAmxubBISOSdLL84s89EK09OZqWa5PI
         vjDg==
X-Forwarded-Encrypted: i=1; AL+hErGxnyes5RruUhszl3ovfqsH67YBoskpx80qHp3Veh5bK6zOiejGD8Mp8JKthVhfLYO3c90D08Pzc6Q2SeY=@vger.kernel.org
X-Gm-Message-State: APuU4Z/XtH2StKAegUb27RPDW7nN/oOTRtfPZimTsE+1JbaawKgbwLIS
	skJCr6NbtaA3JYHkwOpclHJfFD+fOukrpEx81LYSxOKTKcJD3r9Ul/YaJgBX5ZkNfz/Eu0v8I8J
	mJKxeV/+YTHmzv9R8xTdyPJuCOvqnKN8=
X-Gm-Gg: AYBFou0G5z5cAgmb2nLOomvUA/iamvkjdBtadFL2nqG3/sYUxStrDkAuDqkZAAiQSFy
	C2EDvozGyHJKX9bHasUGAzefLa1my4IPF/AfurggsOjj3IUEGTnrAQ9Nh1wUJdQCA2EIvc1tGHz
	cjXc8Tw+gJ/Q75wXcQ6hx69l6Wh3ssS1zovBWNNr8ExjD15CbuOhTXWseBEyhRGTrGhXIy7aYUA
	PZQintXAF70ybqJd+kGUC9pQTbsRqmUTERVJKZecvstTwFvNazxrFRpNmcbjavGhrbqFxE35XoT
	VgfhqYwVZ/YS7j1d5L/qcxYnCdASKNRLC0kGYQMmmOd4fMqmYdscmsLuGykfPmpQ1RHfwEzDDmA
	lYHyzqf7XSZzYp/nDyzCgreid8YMcW1ueLXEUMeg=
X-Received: by 2002:aa7:c4ed:0:b0:6b4:5d8c:95e2 with SMTP id
 4fb4d7f45d1cf-6b77733f5c6mr1625239a12.4.1794417586999; Wed, 11 Nov 2026
 09:19:46 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261110021622.122490-1-technoboy85@gmail.com>
 <20261109193925.8a127f2d0afd5429f1f551f1@linux-foundation.org> <20261110100116.5c435722@pumpkin>
In-Reply-To: <20261110100116.5c435722@pumpkin>
From: Matteo Croce <technoboy85@gmail.com>
Date: Wed, 11 Nov 2026 18:19:10 +0100
X-Gm-Features: AclHuK8iwIUz_YGXZP5CajA0kq-b19YTFhGC7BAF4j9dRAM_y1FghCHa33mkCG4
Message-ID: <CAFnufp30PRLUaW-grdxuuM6vumgHBwWmf8FTm9WNfYU4BWYGNA@mail.gmail.com>
Subject: Re: [PATCH v7] kunit: memcpy: Add benchmark
To: David Laight <david.laight.linux@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Brendan Higgins <brendan.higgins@linux.dev>, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Kees Cook <kees@kernel.org>, linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 10 Nov 2026 10:01:16 +0000
David Laight <david.laight.linux@gmail.com> wrote:

> On Mon, 9 Nov 2026 19:39:25 -0800
> Andrew Morton <akpm@linux-foundation.org> wrote:
>
> > hm, sorry, I must ask "why".  Nowadays optimizing memcpy() is a
> > super-specialized thing undertaken by the bravest architecture
> > specialists who are unlikely to rely upon a generic kunit test for the
> > purpose!
>
> But kernel benchmarks are really the wrong place.
> The 'bravest architecture specialists' are going to test the code
> in userspace where multiple algorithms can be tested and quickly
> tweaked/dismissed.

Hi Andrew, David,

Fair question. I'm not one of the bravest, but I used this test to
develop and measure a fix for a real problem: the RISC-V memcpy()
falls back to a byte-by-byte copy whenever source and destination
have different alignment, and on a Milk-V Megrez that made unaligned
copies run at about a third of the aligned speed. The fix[1] does a
shifted word copy for that case:

  Before:
      memcpy: aligned copy of 400 MBytes in 429 msecs (931 MB/s)
      memcpy: unaligned copy of 400 MBytes in 1202 msecs (332 MB/s)
  After:
      memcpy: aligned copy of 400 MBytes in 428 msecs (933 MB/s)
      memcpy: unaligned copy of 400 MBytes in 519 msecs (770 MB/s)

and it's visible outside the benchmark too: UDP RX on the board's
stmmac NIC went from 672 to 827 Mbps with 512 byte frames.

That slow path had been in the kernel for years, and I think that's
the point: the specialists tune the hot path on the hardware they
care about, while a slow path on some other SoC can go unseen.

I don't see this as an alternative to userspace testing, I do both.
I develop the assembly in a standalone harness[2], which checks every
length and alignment combination, and times ns per call over a range
of sizes against glibc's memcpy() and a few other implementations
(a vector one, C-SKY's, a glibc shifted-copy patch). That's where
the variants get tried and dismissed.

But the harness runs a hand-copied memcpy.S as userspace code, which
can use things the kernel can't, like the vector unit. The KUnit test
checks the real thing: the kernel's own memcpy(), as built for the
running kernel and, on architectures that do so, patched at boot for
the running CPU. It also lets anyone else check their hardware with
a modprobe, and can run unattended in CI.

There is precedent in lib/: CONFIG_CRC_BENCHMARK and
CONFIG_CRYPTO_LIB_BENCHMARK add opt-in benchmarks to the CRC and
crypto library KUnit suites in the same way.

[1] https://lore.kernel.org/linux-riscv/20260311173138.1820-1-teknoraver@meta.com/
[2] https://github.com/teknoraver/riscv-memcpy

> You also want a comparison against the 'obvious loops' (which it can
> take some effort to generate because the compiler tends to convert them
> to memcpy()). Otherwise the numbers are pretty meaningless.
>
> I also (sometimes being one of the 'bravest architecture specialists')
> try to work out how many bytes/clock the a copy (or ipcsum) is doing
> and what the fixed costs are.

Agreed, and the sample output shows the problem: timing every call
with ktime_get_ns() means the small sizes mostly measure the clock
read. For v8 I'd:

- time the whole batch of copies instead of each call, as the
  harness already does
- print the per-call cost in ns next to the throughput, so the fixed
  cost is visible (and say MiB/s, which is what it actually computes)
- add a byte-at-a-time baseline, with OPTIMIZER_HIDE_VAR() on the
  pointers inside the loop so it can't be turned back into memcpy()

The baseline would have made the RISC-V case obvious at a glance:
the unaligned memcpy() would have matched it, since it was itself a
byte loop.

For bytes/clock I'd rather not use get_cycles(), as on several
architectures it doesn't tick at the core clock; ns per call at a known
size should let you derive it on a given machine.

Would that address your concerns?

Regards,
-- 
per aspera ad upstream
