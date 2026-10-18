Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC9374D0CC3
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 15:27:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792337253; cv=none; b=Ay+fmOsixtG2N62XnlX+RnZD2mqs7yHkwrM8fac3dQ+717TeCUblSbGnOUZSQYcSD3rr1HwfJdxcx9yFfjx12xI1gO4pL7/YlkePiY77oKgULWUVHgfw06uk6PhviOR/yH/61Tb3o9czG+rT/o3SRrSSrytGgMq9FvecXTd8duY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792337253; c=relaxed/simple;
	bh=Tc7Slxp62tn7lMBuq2MMamCQYVGOw9llz5BUjwRrgmU=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=nWfnI9dunOt6F5GT7IOCaPfFFd8S3NT7/hDq40jufBZwlmjMRlzkt9uLH3ZVLxKEwzx9bj0K+zXbafz5ALck3qZ5CzmqQxRFxADBtZObTdEUdPma8zBoal3sOd7Riu+M2lN506ItJpZjy2PvEJe5MUVDqIEZ640a6VI0w+yRK38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eWU3XXLj; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eWU3XXLj"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-8520161fdb9so785063b3a.3
        for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 08:27:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792337249; x=1792942049; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=PLi9hVkCsH3YiZ+w7j8S3/cxhLWAMV2a1RCiWoqeuBU=;
        b=eWU3XXLj1apmWWABy+WJ62AjGgj8RaOGCfKViHbBK82fHbhDBRSgK326S3zh3D2xhQ
         IisfQdTU7oQsdCWMIx9HV9yNzFKRJhE2ngceFeqe4RxhLTd02J1N9yXBe5SLuETgdodU
         BjL4oEpzZD0qZT8br4rz/wIEI87FAix1Whp+3Fmgc3mtFdoC6QtTRe7JaD9leWLlefyy
         LpSZ1Uc4TrSgWZ3GT20MSTV0KTO4jIdoCu67X8jxOmB2Lpvcb7nHB9c4/zKGxSfvAxoO
         cU3mFNz7BXbSxFVuY0Xv7Xa3UcAfExLB62GFtC9aQd8GFkGTbtAVJkMmhI7Bg7TWzWH9
         kX2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792337249; x=1792942049;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PLi9hVkCsH3YiZ+w7j8S3/cxhLWAMV2a1RCiWoqeuBU=;
        b=wK/+WiCt7/ZZ/s8n7AiMvmwdQxdwtJWvTyVupQlMFMwMsk7ZX3Njmw26o/F/asLEE1
         5DnijcRjFQL4Z+OE9dOut1A9C1MLfzvA+D1qFsI9CBF9mfldLDiH/aF1gMjGCQn6Kg2y
         rBp2HpqYrJr52u07CPE5BdyGlyAzKCDI78jc5UQDvbSsWYr4WmU4iqUOg/AUwW0CZFJV
         n68FVoVxScHBQGW+jSWgA+vdESO7+PNOb02GKpMpkAMWdbCCNDf5zaRauphViJFkMQxk
         jCDh97OvqQ/eJFqUlUTWL84EEdhqwSgnZLBVSO+MeG2imTOKe0U3ban1RJuRhyMK9+kP
         lllw==
X-Forwarded-Encrypted: i=1; AKwUvBzQM0tjY57uOVuSUNkIDOPZWrxu8hgng0matJPhEiTpi1WjwzPZ05An4VVLFtoYrhzXnSnVNeM20EeBOms=@vger.kernel.org
X-Gm-Message-State: AFq9FYKmdEhsh9y/2+RS1ekmOUrM5goqqZowVprQqRxATJtu7ljFHLDw
	hulNhyO5hvs5nJleBQ6DuSQLTW/H6tM5F6rqKhgDYWZQu3vgEOnSxUpi
X-Gm-Gg: AYBFou2n7Dzm5OAdlmpMWHK3OVN6WcL6Y8Ys+IRT37tbVbA56EAN7RWJBpYtNED9j4Q
	79RkIhHT8Pe3glCdurkI/Sx23356JFbsVZNQKiYxgOdvlAzVODpBKWAP9nxSur5XepdrdQqyS8b
	w6dmFtD0oide4dL7GsB2+AOvKSjKKN2s2Z+RC+MALdGBbRdDEk74r86LABFNSPeZHlCvEfXXmV3
	BE7/HBy6WafsJ7Sbc0j1Zj4J23OgwTDBsNzubOwM0CbbFVCG0eFl7Yk+JD9tpQxMhDwZLD3hqOP
	L3kbQHLSpl4LFuNqTGmZWM+9US8wdKKZO/eK1SNK8sSujnatuaREZNyydRIxtVZ7eFTEOAqTKB7
	1kMqFCSrFEvT1CUK79vMItY88Yh8L2WVMU5QZHYh3x1gph1jwfBB9uXJR5lnte7M3jPE1oClWfO
	K2fRPFP9dbohjAGiAdzlWzEVQXaWY8DaAdaarXXL6yhVY7syt9LLpcphOpZ2MTGypkPz/pPrqOj
	wP+KMX1WCUlzJvjGqin2OwMqE+jrNaLCu8WF9FrGql50N5oz6i7c3tpSm2+AG6xQxWqtzMm0ut7
	aFzyDSDy0BAb/w==
X-Received: by 2002:a05:6a00:b84:b0:89d:7f51:6492 with SMTP id d2e1a72fcca58-8a04cc24de8mr4216832b3a.32.1792337248874;
        Sun, 18 Oct 2026 08:27:28 -0700 (PDT)
Received: from localhost ([153.61.198.255])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-89f57b334e6sm2997008b3a.42.2026.10.18.08.27.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 18 Oct 2026 08:27:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 18 Oct 2026 15:27:26 +0000
Message-Id: <DM82J03M6JWF.39ILAQJO5Z6E2@gmail.com>
Cc: "Josef Bacik" <josef@toxicpanda.com>, "Eduard Zingerman"
 <eddyz87@gmail.com>, "Kumar Kartikeya Dwivedi" <memxor@gmail.com>, "Jonas
 Bonn" <jonas@southpole.se>, "Stefan Kristiansson"
 <stefan.kristiansson@saunalahti.fi>, "Peter Zijlstra"
 <peterz@infradead.org>, "Will Deacon" <will@kernel.org>, "Boqun Feng"
 <boqun@kernel.org>, "Mark Rutland" <mark.rutland@arm.com>, "Masami
 Hiramatsu" <mhiramat@kernel.org>, <bpf@vger.kernel.org>,
 <linux-snps-arc@lists.infradead.org>, <linux-hexagon@vger.kernel.org>,
 <linux-openrisc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 "kernelci.org bot" <bot@kernelci.org>, "kernel test robot" <lkp@intel.com>
Subject: Re: [PATCH bpf-next] locking/atomic: arc, hexagon, openrisc: Define
 arch_cmpxchg_local()
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: "Sasha Levin" <sashal@kernel.org>, "Alexei Starovoitov"
 <ast@kernel.org>, "Daniel Borkmann" <daniel@iogearbox.net>, "Andrii
 Nakryiko" <andrii@kernel.org>, "Vineet Gupta" <vgupta@kernel.org>, "Brian
 Cain" <bcain@kernel.org>, "Stafford Horne" <shorne@gmail.com>
X-Mailer: aerc 0.20.1-349-gb940a4174a3e-dirty
References: <20261018132907.3823160-1-sashal@kernel.org>
In-Reply-To: <20261018132907.3823160-1-sashal@kernel.org>

On Sun Oct 18, 2026 at 1:29 PM UTC, Sasha Levin wrote:
> Commit ccb88db8dac8 ("bpf: Don't hand out a linked element as extra
> element") made alloc_htab_elem() take the per-cpu spare element with
> try_cmpxchg_local(), the first caller of cmpxchg_local() outside of
> architecture code. It doesn't build on arc, hexagon and openrisc:
>
>   include/linux/atomic/atomic-arch-fallback.h:384:27: error: implicit dec=
laration of function 'arch_cmpxchg_local'; did you mean 'raw_cmpxchg_local'=
? [-Werror=3Dimplicit-function-declaration]
>
> raw_cmpxchg_local() maps to arch_cmpxchg_local() unconditionally, but
> these three architectures don't define it, and unlike nios2 and
> microblaze they don't get it from asm-generic/cmpxchg.h either.
>
> cmpxchg_local() only has to be atomic with respect to the local CPU, so
> an architecture's own arch_cmpxchg() can serve for the sizes it
> supports. arc uses its relaxed LLOCK/SCOND variant when ARC_HAS_LLSC is
> set and its atomic_ops_lock() variant otherwise, and openrisc uses its
> LL/SC arch_cmpxchg(), the way arm64, riscv and s390 alias theirs. The
> hexagon arch_cmpxchg() only handles 32-bit words, so hexagon uses the
> generic version that disables interrupts, like sh, sparc32 and xtensa
> do. Linux has no NMIs on hexagon, so that is sufficient there.
>
> Fixes: ccb88db8dac8 ("bpf: Don't hand out a linked element as extra eleme=
nt")
> Reported-by: kernelci.org bot <bot@kernelci.org>
> Closes: https://d.kernelci.org/i/maestro:78b65519ee4561df1fbf1e72f1dec9da=
7e5b153e
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202610181750.BoqAddaF-lkp@i=
ntel.com/
> Closes: https://lore.kernel.org/oe-kbuild-all/202610182048.aEaiBP8W-lkp@i=
ntel.com/
> Signed-off-by: Sasha Levin <sashal@kernel.org>
> ---
> The only user is in bpf-next, so it is probably easiest to take this
> through bpf-next with acks from the arc, hexagon and openrisc
> maintainers. A similar change was posted in 2023 for objpool and
> stalled once objpool stopped using try_cmpxchg_local():
> https://lore.kernel.org/all/20231121142347.241356-1-wuqiang.matt@bytedanc=
e.com/
>
> Build tested on arc with and without LLSC (including both KernelCI
> configs), hexagon (clang) and openrisc.

Thanks for the quick fix. Applied.

