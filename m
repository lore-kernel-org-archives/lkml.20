Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A5473AB27B
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 17:52:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790963547; cv=none; b=e5awl9OXuqbP4ZEzi5tc/ipW0JYFtNVtfd7FoWS4LfeesGg5Kmxn3qNmQSPtVwBPqJI7MC4Ad4n9GvRwvzh+ZZzzbdmxtvuZGfSbu1rFHVLolgS6rTNy454/lKlp/hWiQIbNrZU82C6CzrNJh8QRfDHVASIfocieh6d1r+30WR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790963547; c=relaxed/simple;
	bh=7xlAvhWKKeXIGHBo6ItY8pXhW5p3W4GrfdeBDSg5xZE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=go6ye5Y1zvgC//72f90jcnTHFG5WUSCx87iP1qU2Gm7QCHJF4XNQIPCxP33VBTqnfPbs33WO8L8f/tyg0EtL2h1b49wcx1w/avYO7bs/1erExsKcs8/7Rue3DRWoaar8MeCYV5bxqx0PcwE/73jAXrWIb71vp88Aff8NLss9GFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MY36kTGk; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MY36kTGk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 370031F000FF;
	Fri,  2 Oct 2026 17:52:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790963537;
	bh=/JMuaEMyEDaPD5l0lMuNeLAzzCQciCoHbZmWMPdAdTc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=MY36kTGkgdixbubYM+UGzERXEbdanLR7JWw0jb2v8RjIz41NikhH+81BYUWW3NMyL
	 ViroPFQUQGWZcJ6PwfhUZGicYRCXI1dnPw8FpMRUEG1SoNlVf9xtPAt4Q3uyqX2+IF
	 DloPH7OKgmefO9OpDdzormPDT0rb6dEXRhYD3JYugLvZr+22g64OlBDe474/01xMrY
	 uT7GbLfvs2eXG+SBANN4/UC0PKhqifB1rgpbJnJAyxRryhRmNMAqoWdj2ije2v9HNs
	 L0r0QWzOuVmwz1NX6THV87gA6jlPZhHUYiIxuGD8P9szw8JH2BtyZMmRFOX3KmUUI5
	 S7ph6E/4oRkcA==
Date: Fri, 2 Oct 2026 19:52:12 +0200
From: Mike Rapoport <rppt@kernel.org>
To: Dave Hansen <dave.hansen@intel.com>
Cc: =?iso-8859-1?Q?Fr=E9d=E9ric?= MARIE-JOSEPH <fredericmariejoseph@gmail.com>,
	x86@kernel.org, Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Peter Zijlstra <peterz@infradead.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] x86/its: Make ITS thunk pages read-only without the ROX
 execmem cache
Message-ID: <ar_vTG0WQY8rEJSS@kernel.org>
References: <CAHD2OOfP=h=qS6nP4dtn7RTQqMEqOvXD+iURXJ7Rgc5KFjgi5A@mail.gmail.com>
 <93716ff0-e693-4056-b6e7-9d221a3c58ac@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <93716ff0-e693-4056-b6e7-9d221a3c58ac@intel.com>

On Thu, Oct 01, 2026 at 08:24:50AM -0700, Dave Hansen wrote:
> On 10/1/26 06:22, Frédéric MARIE-JOSEPH wrote:
> > That's my first post so I hope I do things right. I found what seems to
> > me like a bug, and worked with Claude to find a patch. Hope it will be
> > usefull.
> 
> Your mailer is sending out HTML, but there was a plain-text version too,
> so the message at least made it to the archives. Using git-send-email is
> the most foolproof way to send these things, fwiw.
> 
> > With CONFIG_MODULES=n there is no STRICT_MODULE_RWX, so x86 does not
> > select ARCH_HAS_EXECMEM_ROX and execmem_restore_rox() is the stub that
> > returns 0.
> 
> Ugh. The origin of this seems to be:
> 
>          select ARCH_HAS_EXECMEM_ROX             if X86_64 &&
> STRICT_MODULE_RWX
> from:
> 
> > commit 47410d839fcda6890cb82828f874f97710982f24
> > Author: Mike Rapoport (Microsoft) <rppt@kernel.org>
> > Date:   Tue Jun 3 14:14:42 2025 +0300
> > 
> >     x86/Kconfig: only enable ROX cache in execmem when STRICT_MODULE_RWX is set
> 
> That commit is trying to change execmem internal details via an
> arch-specific Kconfig tweak. It's also logically a bit silly that what
> an arch supports:
> 
> 	ARCH_HAS_EXECMEM_ROX
> 
> depends on a module-specific option:
> 
> 	STRICT_MODULE_RWX
> 
> If execmem is being too aggressive on for modules on !STRICT_MODULE_RWX
> configs, shouldn't the fix be in execmem *module* code?

I think we can only have !STRICT_MODULE_RWX when MODULES=n, so it's not
because we are lax with modules code, but because there are no modules.

And since STRICT_KERNEL_RWX is always enabled on x86, I think we we want
ROX caches everywhere except Xen PV.

A while ago Richard send a patch that added STRICT_KERNEL_RWX to that
Kconfig dependency 

https://lore.kernel.org/all/20260625090627.1501095-1-richard@nod.at/

but apparently it fell between the cracks.

Since STRICT_MODULE_RWX || STRICT_KERNEL_RWX is always true, I'd say that
we can just revert 47410d839fcda, especially as I have hard time
remembering why I did it in the first place :)
 
> Maybe something along the line of the lightly-tested attached patch? I
> see the "11 W+X pages found" message without it, and the message goes
> away when it is applied.

> 
> 
> ---
> 
>  b/arch/x86/Kconfig     |    2 +-
>  b/kernel/module/main.c |    3 ++-
>  2 files changed, 3 insertions(+), 2 deletions(-)
> 
> diff -puN arch/x86/Kconfig~x86-STRICT_MODULE_RWX arch/x86/Kconfig
> --- a/arch/x86/Kconfig~x86-STRICT_MODULE_RWX	2026-10-01 06:31:14.379577124 -0700
> +++ b/arch/x86/Kconfig	2026-10-01 06:31:39.777436090 -0700
> @@ -85,7 +85,7 @@ config X86
>  	select ARCH_HAS_DMA_OPS			if GART_IOMMU || XEN
>  	select ARCH_HAS_EARLY_DEBUG		if KGDB
>  	select ARCH_HAS_ELF_RANDOMIZE
> -	select ARCH_HAS_EXECMEM_ROX		if X86_64 && STRICT_MODULE_RWX
> +	select ARCH_HAS_EXECMEM_ROX		if X86_64
>  	select ARCH_HAS_FAST_MULTIPLIER
>  	select ARCH_HAS_FORTIFY_SOURCE
>  	select ARCH_HAS_GCOV_PROFILE_ALL
> diff -puN kernel/module/main.c~x86-STRICT_MODULE_RWX kernel/module/main.c
> --- a/kernel/module/main.c~x86-STRICT_MODULE_RWX	2026-10-01 06:44:42.417795788 -0700
> +++ b/kernel/module/main.c	2026-10-01 06:51:28.048722976 -0700
> @@ -1355,7 +1355,8 @@ static int module_memory_alloc(struct mo
>  	if (!ptr)
>  		return -ENOMEM;
>  
> -	mod->mem[type].is_rox = execmem_is_rox(execmem_type);
> +	if (IS_ENABLED(STRICT_MODULE_RWX))
> +		mod->mem[type].is_rox = execmem_is_rox(execmem_type);
>  
>  	/*
>  	 * The pointer to these blocks of memory are stored on the module
> _


-- 
Sincerely yours,
Mike.
