Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76D1626A1AC
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 03:48:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788925695; cv=none; b=c/yA4Pos9CDBG/buDCqRecOHOtIyo2DaCyOpyu6d/MrVWn5OtkRPN+S4W+pLlSJNOf/OaG8UoZoieS0O/dmanGYjWVHI9HFmzd8gWEBFUTWakfnP2jPNevd7F/qVA/LKLEImdWIChs9jYvCooPvSa51OYpC0/2tY4q0y0IqpEB4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788925695; c=relaxed/simple;
	bh=G0iTns0LsLMAQ/ifrNgHjHzYuJnuNwfu7pD9COqNtuQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ze0c+MUKaFRa++WZ598DgA+5wXqdCgL143Q1XbMKryCEch24p/7MDQg/g//cv3N15uETa2e7KStwt0cB+minJ6YzdpIlWpv8MEU1JhxCKzMfbe4ymKWXp+87O3F7zEvPkMt5nMfmLZkH+Dof5mYjBJUdbOwCZNfMAE0yNH7HPJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=YT9woyAB; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="YT9woyAB"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 2041A40E01ED;
	Wed,  9 Sep 2026 03:48:06 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id Q1mvl6KC5k72; Wed,  9 Sep 2026 03:47:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1788925676; bh=qaQHbPFgCR9WU7fWfQzx5YipqSKR9fRpf5wuPGBGlu4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YT9woyABHBMg+T3aimbBr56t6OIZlNym0RZeLvVwVGFwKwn66iIanhxKG+YVCra1m
	 625HGjBz1IZ859KSOjfewimR7KSt5IlhetqoFfIBh11h5hR+DW1qhf52kuM6iQ8+mw
	 IwwS8Fk8LETO1krTrB1Y8O/aXOFkFjqObDCsJH4/eNXOttX2CHmtuwAJfw5ukh74dV
	 eb+yk1PDkI+6MniRdXZOK1URuwh917DiMNipN0KfCmhE8XGqvVwsKdWwpvfKBNZjHC
	 IP+uAbYic2/CJeTPoS91NH/nJ691xOi0LNy7J9pwij5nVVUzoxhOBXSf76310aw4my
	 29Us3RZpK8H4mf3JagqAPrfQXMx62ovcn6AC9FhfNvHQwRQUG3iYIYQm/+F9WE3gLr
	 dAJ3pwPnPYDUY03yvND8Jj9WXb/zWJitN/bMNATidT2BIjf8NY39u8NE+vatl8vY+o
	 1vOiRbzUvVcUj2YINjCpw+XWtbRjlxw2jfalfxVmyrlf9bEEUCCg91JhLmkbrJmkbD
	 3IRrsLo9Ma6+gnR7KI4JDPfV60gcV55q16HvUGfG6gWJhxo7QBb/bzewAwgwj05d24
	 htvb09B2Nx/NYwLhzJGvN6ncWoZRpk1HXRVVYLnGTLxiRupC1nXt89xXzNjrVixM7D
	 VHC7kW2veIMyQcPKti6xn0Fw=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::42])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 5499340E01DD;
	Wed,  9 Sep 2026 03:47:42 +0000 (UTC)
Date: Tue, 8 Sep 2026 20:47:38 -0700
From: Borislav Petkov <bp@alien8.de>
To: Hamza Mahfooz <hamzamahfooz@linux.microsoft.com>
Cc: x86@kernel.org, Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>, Andy Lutomirski <luto@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Ard Biesheuvel <ardb@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>, Rong Xu <xur@google.com>,
	Kees Cook <kees@kernel.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7] x86/mm/64: free the gap between BSS_MAIN and
 BSS_DECRYPTED
Message-ID: <20260909034738.GHaqDW2i19C87li2MC@fat_crate.local>
References: <20260829003245.2334947-1-hamzamahfooz@linux.microsoft.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260829003245.2334947-1-hamzamahfooz@linux.microsoft.com>

On Fri, Aug 28, 2026 at 08:32:45PM -0400, Hamza Mahfooz wrote:
> This region is unused after mark_rodata_ro() and takes up, up to 2 MiB
> of memory. So, free it in mark_rodata_ro().

So I can only guess why this patch even exists. How about some more
justification for the uglification?

> Tested on a CoCo VM running on an AMD EPYC 7763v which generated the

Testing text goes under the "---" below.

> following print:
> 
> Freeing unused kernel image (bss_decrypted gap) memory: 184K

So all that gymnastics to save 184K? Because, up to 2 MiB is not always 2 MiB.

> Signed-off-by: Hamza Mahfooz <hamzamahfooz@linux.microsoft.com>
> ---
>  arch/x86/include/asm/sections.h | 1 +
>  arch/x86/kernel/vmlinux.lds.S   | 8 +++++++-
>  arch/x86/mm/init_64.c           | 2 ++
>  3 files changed, 10 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/x86/include/asm/sections.h b/arch/x86/include/asm/sections.h
> index 30e8ee7006f9..49ef1428aa72 100644
> --- a/arch/x86/include/asm/sections.h
> +++ b/arch/x86/include/asm/sections.h
> @@ -8,6 +8,7 @@
>  extern char __relocate_kernel_start[], __relocate_kernel_end[];
>  extern char __brk_base[], __brk_limit[];
>  extern char __end_rodata_aligned[];
> +extern char __start_bss_decrypted_gap[], __end_bss_decrypted_gap[];
>  
>  #if defined(CONFIG_X86_64)
>  extern char __end_rodata_hpage_align[];
> diff --git a/arch/x86/kernel/vmlinux.lds.S b/arch/x86/kernel/vmlinux.lds.S
> index 2438b89a4620..825381b1ed33 100644
> --- a/arch/x86/kernel/vmlinux.lds.S
> +++ b/arch/x86/kernel/vmlinux.lds.S
> @@ -94,8 +94,11 @@ const_cpu_current_top_of_stack = cpu_current_top_of_stack;
>   * decrypted to avoid exposing more than we wish.
>   */
>  #define BSS_DECRYPTED						\
> +	. = ALIGN(PAGE_SIZE);					\
> +	__start_bss_decrypted_gap = .;				\

So, you have a linker var which is called __start_bss_decrypted_gap which
goes...

>  	. = ALIGN(PMD_SIZE);					\
>  	__start_bss_decrypted = .;				\

... before the actual start variable.

> +	__end_bss_decrypted_gap = .;				\
>  	__pi___start_bss_decrypted = .;				\

You have *three* variables now all pointing to the same location. The two from
before weren't enough?

But the end var is at a 2M page boundary, no?

Can you somehow compute it...?

>  	*(.bss..decrypted);					\
>  	. = ALIGN(PAGE_SIZE);					\
> @@ -105,7 +108,10 @@ const_cpu_current_top_of_stack = cpu_current_top_of_stack;
>  	__pi___end_bss_decrypted = .;				\
>  
>  #else
> -#define BSS_DECRYPTED
> +#define BSS_DECRYPTED						\
> +	. = ALIGN(PAGE_SIZE);					\
> +	__start_bss_decrypted_gap = .;				\
> +	__end_bss_decrypted_gap = .;

So now you have to add the 4K alignment so that you don't have the ifdeffery in
the .c file, as I suggested. But I'm not sure this is really better.

With a sparse commit message as yours, people will wonder in the future why
was that thing even done?

So I'm not convinced this justifies the ugly, tbh....

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
