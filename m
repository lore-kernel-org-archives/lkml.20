Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793370229;
	b=lCgxeAhsWZKuWPWhko1IPI9Lgdbg/hjb1qMe1RkvV6c64QMKEE304KWxfwt1dlQ/ghty
	 kHbpwrSan13LkDTAnRHLP66SkSjk2PVfp+biNEgNpQSCLPXuQOojXNMYi0FBKnWFA084S
	 7qm0ZVFQFYKyIvtT31bn0pWjpq2b1+gSnjzWjvzz6x/ClIE2Ym9Stsvwg6SnoMrk/oL8q
	 LQsKee9d7fiqew3hclbrhr1EYjt1NW9itN0jwXAKnA8a9eRGZaRAKDL1NP/2AzxuFIuZE
	 TcPXv9e1nPOa0i0A071U6DRfkbNaTqEGZom+ipLRP/Y0WiZMmNuLcJjMY4h+vjd7dCQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793370229;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=APrIEhnWH9LnO8CPtVtDOX49Jvv9x/JKZuq2TzDTo/Y=;
	b=A1QSut2HLhRaehwOhgY20Yt4dlxGfzkLXtH1Qoz9KxS0ZTY9wDmzL74FkKeijEj7aZ6e
	 gWnBhrYGxbGYZVBcSqyAJmVV9ptMG1tmLyRMJjmYjeiJURVxkp+lgNvlTLVG6Kd22GmOs
	 vCpjJSOdF9DCUESYoouv0Iwhh/K/2Agz7cbB9kh6EQiK/1pGiAksgpi59a5Xx9Way2JUc
	 9wkqMUC+UJtQLylMkJSuBKHDNb3OLSfYeJ/q9iaTgZ9YrpRPe8TwOOsZQ+nkUqzqNBGD7
	 4aEP0c8Cf9myyMfvkKmBQNN2CnSSLhV1BvmlUzjoUPodbz9oERUQMNVWF+PB1GslNmA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YPkA7JOM;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB103606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 14:23:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YPkA7JOM
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 025351F0093A;
	Fri, 30 Oct 2026 14:23:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793370228;
	bh=APrIEhnWH9LnO8CPtVtDOX49Jvv9x/JKZuq2TzDTo/Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=YPkA7JOMIe3qQtuBMIUjjdBkg6UNMCFchDEXtomQFvU68Yffv1SQpRpgrcw51B5zJ
	 qu+QH8x7TlzHg/jTVEU0Fso+ZxHE9QATecx3ZR3+ckCTK0FiG0yvYBNNLVwJxK618/
	 UajJ7LQXQ/AdGQY1bl5nsEbddFIZSD5Ie5wfeNEhV/fJ/UQ4KmvvNWFmEKNr8eX+yx
	 dbGQqYCzF7brkRsfNPmyNrMw4W156U54d+LRO0j2anYztnTFi/St+L6eXGWwIXbMAu
	 9b78kQhWGDqyuD3bf8pTBok91erUKCg+Ok9eYlueIb5TcVbZqUHc/G7UB9ik7V9UKC
	 4/gWc6shGgjRQ==
Date: Fri, 30 Oct 2026 14:23:43 +0000
From: Will Deacon <will@kernel.org>
To: Hongyan Xia <hongyan.xia@transsion.com>
Cc: Mark Rutland <mark.rutland@arm.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Jiazi Li <jiazi.li@transsion.com>, Pu Hu <hupu@transsion.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	ada.coupriediaz@arm.com
Subject: Re: [RFC PATCH v2 0/4] Mark Kprobe debug exception paths noinstr
Message-ID: <auSobyKxtfnn0geU@willie-the-truck>
References: <cover.1786603168.git.hongyan.xia@transsion.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1786603168.git.hongyan.xia@transsion.com>

[+Ada]

On Thu, Aug 13, 2026 at 06:47:31AM +0000, Hongyan Xia wrote:
> From: Hongyan Xia <hongyan.xia@transsion.com>
> 
> Commit 879a6754d3d1 ("arm64: kprobes: Only handle faults originating
> from XOL slot") and 23f851ac0078 ("arm64: kprobes: Allow reentering
> kprobes while single-stepping") band-aided two corner cases in the arm64
> kprobe path: Nested page faults inside Kprobe and nested Kprobe SS
> handling. Although the two patches were taken, Will asked whether we
> should keep patching things like this each time we find a corner case,
> and whether making Kprobe noinstr is the correct answer [1].
> 
> This series attempts to do exactly that: Making the Kprobe path noinstr.
> The kprobe handlers become noinstr end to end. Apart from marking
> functions noinstr, we also force-inline some static inline helper
> functions because certain compilers still outline them, breaking
> noinstr.
> 
> Note that arm64 has no objtool so at the moment noinstr is more of a
> contract that must be followed, instead of actually enforcing control
> flow. Instrumentation can still happen if someone with root privileges
> does something stupid, but now it is regarded as a bug rather than a
> legitimate use case that the kernel needs to cover.
> 
> [1] https://lore.kernel.org/all/alpuL10h7-OK2hFb@willie-the-truck/
> 
> Changed in v2:
> - Remove instrumentation_{begin/end}() markers as they do nothing
> - Fold __always_inline into the patches that actually need them
> - Remove the debug exception path changes unrelated to Kprobe. This
>   series is only about Kprobe for now 
> - Drop the kprobe_page_fault() patch for now. It's a question whether we
>   even need it at all. Will send a patch for it separately.
> 
> Hongyan Xia (4):
>   arm64/entry: Make debug_exception_enter/exit() noinstr
>   arm64/debug: Make the Kprobe functions noinstr
>   arm64/kprobes: Make the entire Kprobe noinstr
>   Revert "arm64: kprobes: Allow reentering kprobes while
>     single-stepping"
> 
>  arch/arm64/include/asm/esr.h       |  2 +-
>  arch/arm64/include/asm/kprobes.h   | 15 ++------
>  arch/arm64/include/asm/percpu.h    |  2 +-
>  arch/arm64/include/asm/preempt.h   |  4 +-
>  arch/arm64/include/asm/ptrace.h    |  4 +-
>  arch/arm64/kernel/debug-monitors.c |  6 +--
>  arch/arm64/kernel/entry-common.c   | 13 ++-----
>  arch/arm64/kernel/probes/kprobes.c | 59 ++++++++++--------------------
>  include/linux/kprobes.h            |  8 ++--

Given the lack of objtool enforcement (as you note above), I wonder
whether it would be more robust to do this on a per-compilation unit
basis? i.e. disable instrumentation for debug-monitors.c, entry-common.c
and kprobes.c?

Unfortunately, I couldn't find a way to do that in the Makefile :/ In
which case, perhaps this series is the best we can do, but I thought I'd
ask the question in case somebody has any bright ideas.

Will
