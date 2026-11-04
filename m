Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793809721;
	b=R7+r6nZxw7DmVRyPFsUT+ywsMy9h/RSBAXKVHR0iU7JqWmIuZSaforsE1QsH0K39YMYu
	 +zVnUyoJQI6vP5YMspRRgeaGBWHj/u9WHQ6Jehm6DRWQT03C0k/kV+VgAn+V7jEsy5y8Y
	 Zi5F87IXvj4pugevxe8tGXq/2oIlofuJz+d8fbsa9ISXSCFR9qZhQIbN3L3F6RzyCOI5/
	 TIF2BA+f8jMOcY0S+y07rlsc8Nr6/AkzM1TSPTnVlU5hjYv02ziP1FpBdisZgEbQS4gxG
	 JMg1/yQTK/2d5UnvqKV1f1dYAwkrAND1W2s0cNybJK2yBQ0gL96X+FbXy6d3IWTjtbA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793809721;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=FtBaAdmIcl95OCI3PFXt9e6DtfWzoCVoY5/FJheSnIw=;
	b=gMarinP7Bp/HwClWRwJWN7nx3nikAHy15EfkCK6NeYM5KshG9DHFcvqmLoB/JecuMhqv
	 xiw52KbwQg+/7REgPQiqx+F4JLxVldbP2S4WNjjgj+bPS1ae4vBHMSB9bsuiT4nrLI96e
	 aVcutArd5Wotr1SsTDDHqtRt75D1XAmO3zw/1RJxHO19Vv3yjl3H3eM5vBtZHCx7e+x2f
	 JWhTxaF3WyRfNJd9x7DphXa7JFkW1ZyR3k2T/rR4zzwtpTsJe6hdIr5BPFi2YsuhHLgwO
	 ZFGv9nJuILaBQqCgq1URZvXTOsTwqB6xPOjjsCsKU3f6nKNwU9K+INszRg1W+6Kwavw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=ghfbLetK;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78E4D606A332
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 16:28:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 78E4D606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=ghfbLetK
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A74C7169C;
	Wed,  4 Nov 2026 08:28:36 -0800 (PST)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 58AAE3F632;
	Wed,  4 Nov 2026 08:28:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793809719; bh=E7sjNFFUNI1GtoHAUd5d5/lxoWzQs1vxAL3CvzkvnH0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ghfbLetKc6OstxcypkskSZI73knMHuyXtkpaRyIDOd8EUn1Iws6a1iD/OG1oMQBze
	 RXo/zeILWU4pzTnUn2ql7Qj7c8+Fzi4794NQHbx6Rq5mz3A5M38s6xUYm08C3BRWxy
	 HRMdBYsmNPYMxduSTn6PmIM3BHIZBcJYZRmTLKz4=
Date: Wed, 4 Nov 2026 16:28:35 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Ard Biesheuvel <ardb+git@google.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	will@kernel.org, mark.rutland@arm.com,
	Ard Biesheuvel <ardb@kernel.org>, Mark Brown <broonie@kernel.org>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>
Subject: Re: [PATCH v2 1/2] arm64: module: Emit BTI veneers for cross-section
 calls
Message-ID: <autdMwEbDqF2u0Wr@arm.com>
References: <20261005110511.157016-4-ardb+git@google.com>
 <20261005110511.157016-5-ardb+git@google.com>
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
In-Reply-To: <20261005110511.157016-5-ardb+git@google.com>

On Mon, Oct 05, 2026 at 01:05:13PM +0200, Ard Biesheuvel wrote:
> From: Ard Biesheuvel <ardb@kernel.org>
> 
> The compiler is permitted to omit BTI landing pads from static functions
> that never have their address taken, but are only called directly, even
> if those calls originate from other code sections.
> 
> This means that calls into a module's .text section from .init.text,
> which may need to be routed via a PLT if .text is out of direct
> branching range, may result in BTI exceptions due to the indirect calls
> performed by the PLT veneers. (Note that calls to .init.text from .text
> are not allowed.)
> 
> The 'solution' is to emit yet another veneer - this is what the ELF
> psABI for AArch64 mandates in this case.
> 
> So derive an upper bound for the number of veneers that may be needed in
> the core module region to ensure that any call from init code that ends
> up needing a PLT can be directed at a veneer with a BTI landing pad, and
> allocate the additional space.
> 
> Then, emit these veneers as needed, i.e., only when emitting a PLT entry
> for a call from an init code section to a normal code section in the
> same module. In practice, this only occurs when a module's .init.text
> happens to be allocated far away from its .text section, which might
> happen when the initial 128M 'near' module region runs out of space
> between allocating the core module and allocating its init region.
> 
> Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
> ---
>  arch/arm64/Kconfig                  |   7 +-
>  arch/arm64/include/asm/module.h     |  12 ++
>  arch/arm64/include/asm/module.lds.h |   3 +
>  arch/arm64/kernel/module-plts.c     | 128 +++++++++++++++++++-
>  4 files changed, 140 insertions(+), 10 deletions(-)
> 
> diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
> index cab741a695f5..23879cb05d6b 100644
> --- a/arch/arm64/Kconfig
> +++ b/arch/arm64/Kconfig
> @@ -210,7 +210,8 @@ config ARM64
>  	select HAVE_HW_BREAKPOINT if PERF_EVENTS
>  	select HAVE_IOREMAP_PROT
>  	select HAVE_IRQ_TIME_ACCOUNTING
> -	select HAVE_LIVEPATCH
> +	# https://lore.kernel.org/all/20260812162058.612202-5-ardb@kernel.org/
> +	select HAVE_LIVEPATCH if !ARM64_BTI_KERNEL
>  	select HAVE_MOD_ARCH_SPECIFIC
>  	select HAVE_NMI
>  	select HAVE_PERF_EVENTS
> @@ -2198,10 +2199,6 @@ config ARM64_BTI_KERNEL
>  	depends on CC_HAS_BRANCH_PROT_PAC_RET_BTI
>  	# https://gcc.gnu.org/bugzilla/show_bug.cgi?id=94697
>  	depends on !CC_IS_GCC || GCC_VERSION >= 100100
> -	# https://gcc.gnu.org/bugzilla/show_bug.cgi?id=106671
> -	depends on !CC_IS_GCC
> -	# https://github.com/llvm/llvm-project/issues/215547
> -	depends on !CC_IS_CLANG || CLANG_VERSION < 210000
>  	depends on (!FUNCTION_GRAPH_TRACER || DYNAMIC_FTRACE_WITH_ARGS)
>  	help
>  	  Build the kernel with Branch Target Identification annotations

I think this should be the other way around (and keep HAVE_LIVEPATCH
unconditional):

config ARM64_BTI_KERNEL
	...
	depends on !LIVEPATCH || (CC_IS_CLANG && CLANG_VERSION < 210000)

I also wonder whether dropping the compiler dependency should come with
some sanity check/assert for (the unlikely case) of a large vmlinux,
similar to one of Josh's patches or a boot-time check that skips
enabling BTI. At least until we get some generic compiler/linker
workaround for large images:

https://lore.kernel.org/all/8932e59a4f6e8383f37078dada1f23639b85a035.1786768375.git.jpoimboe@kernel.org/

There are some Sashiko comments. I'd ignore the big-endian ones since we
removed it and it had been marked broken for some time anyway. But the
other points look valid.

https://sashiko.dev/#/patchset/20261005110511.157016-4-ardb+git@google.com

Apart from those, I don't have other technical objections to the patch
but I wonder whether we'll find alternative options going forward that
make this fix redundant. E.g. allocating .init.text and .text together
(you had an RFC) or a new execmem_alloc_near() to try to place them
nearby.

In the meantime, would something like the following work for us instead
of the veneers? We won't free the .init.text module section but this
should be small. There's the ppc64 precedent.

bool module_init_section(const char *name)
{
	if (system_supports_bti_kernel() && strstarts(name, ".init.text"))
		return false;

	return strstarts(name, ".init");
}

-- 
Catalin
