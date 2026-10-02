Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECD113451A7;
	Fri,  2 Oct 2026 05:20:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790918407; cv=none; b=Sw5olKgO/vxACCY3XuKZiA/EEUg4IxIl8MHj6C6O6Uvhha3q7owSPjgxUNGqBlydqly7XcmlUVmKzWdm4TYyIntp/Ys5HbIHe+GF7C1BFN8bdqxMpSYLJ3xk6XtwS7hmoLOEKwGrCgsr0mYgJwuUmartwjGLbE/E1RbQwveA1pI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790918407; c=relaxed/simple;
	bh=lBUFIBmtNPnA/7B0n+Z4pRXRpk+MT2mNw7TJkBlZwu4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cDOYw+TKbXWe7UtC25GOEsVWYFRu91l6lTt5Ishjf1do3dQLKfuAHShUGI64nXCwwUM4lNKOGzMG0ap615CH62G2AuJTaDyzMSXEk9SEOl9pjW5BgVBvqScynx68Urbdy38xt2D2O6Uanq9K9mQyn9rPWMHZ3SH8eZRk4ew6cN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=FPw+0+ko; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="FPw+0+ko"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 8AF9F40E03BE;
	Fri,  2 Oct 2026 05:20:02 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id PUIQFFFb73Mt; Fri,  2 Oct 2026 05:19:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1790918391; bh=iZGCiopQZoK9nMJNa8qGe84TuqiqoIvvk4HizNQi6Bs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FPw+0+ko6fht8ylkAIVObgKWuCcMRtKuBJ9N++A8hnDlF9+756cs0kliKSfoWPfvy
	 tKQWQfwvp8THdYbUInPpKgnjCJJ1mBza8GOim6Xv1dhNq3FvA4WCtwR4z1si+W9LcJ
	 IsLN3KEJS0du8mR0w1d/HWr6GZ6vwUi6JPyErhEwuex3C2J0BtKqpZxOg/6+xQyvc6
	 Swzr0uGfZwSWfLSzPKMkcWrgoehmtQNdcpcqUSuI6E9fHFYCSOqnFaK/w1iOXgIBFu
	 5jJBjvtlO1Wz8Bj0tH2FsKFApax/HusbJ0UeBNXZ/UQvtlZ859gQ/9R9Z4RNOi0d8f
	 JHTGJOlkSG3BSgTYgtEdPwRto06aTeosHeNy39aByLB05zJWMg4B3QzROaEaaZNMiV
	 LbpOnYOs5RgFMII9zaVcCbKf8hf+yc6TN5uw10hCttKQ9yW04T/jvL2k4IZGZYDpLL
	 oUSBcZnr4KQsqm9KntEGKvW01sB9fzBHeemY6N3zoBJ/vCWmUbhP3GEHiKVCKB/71H
	 ZaghANCcEBwxW9ENrnU9l9lNc6IvfK2qAHOUi8h85RZk7RNfXJtMvaSvwNtwNCLTqq
	 0hKM6QUgnfWDCZATKNAgSToGawXb7aBJ2MfUZeFe7q5iWMoTlYDmC78EGF3ALRgR43
	 6/xpDwhikmXbhaWVoctMvor8=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::3a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 230EB40E00B9;
	Fri,  2 Oct 2026 05:19:45 +0000 (UTC)
Date: Thu, 1 Oct 2026 22:19:42 -0700
From: Borislav Petkov <bp@alien8.de>
To: Yazen Ghannam <yazen.ghannam@amd.com>
Cc: linux-edac@vger.kernel.org, linux-kernel@vger.kernel.org,
	tony.luck@intel.com, x86@kernel.org
Subject: Re: [PATCH 1/3] x86/mce/amd: Fix bank lookup in
 amd_mce_usable_address()
Message-ID: <20261002051942.GIar8-7qT6l3mUhofX@fat_crate.local>
References: <20260903142049.4126599-1-yazen.ghannam@amd.com>
 <20260903142049.4126599-2-yazen.ghannam@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260903142049.4126599-2-yazen.ghannam@amd.com>

On Thu, Sep 03, 2026 at 09:20:47AM -0500, Yazen Ghannam wrote:
> amd_mce_usable_address() reads the per-CPU smca_banks array at index
> m->bank on the running CPU. The index is not checked, and the bank
> belongs to m->extcpu, not to whichever CPU is decoding.
> 
> m->bank is unbounded here. apei_mce_report_mem_error() sets it to -1,
> which is 255 in the u8 field, and apei_smca_report_x86_error() takes it
> from a firmware BERT record. Both reach this function through the
> decoder chain, which runs from a workqueue on any CPU. Bank counts
> differ per CPU on SMCA systems. So the read can land past the end of
> the array, or on a CPU where that bank means something else.
> 
> Use m->extcpu for both the bound and the lookup.
>
> Fixes: 821f5fe4dbcb ("x86/mce: Add support for physical address valid bit")
> Cc: stable@vger.kernel.org
> Assisted-by: Claude:claude-opus-5

...: LLM

For all three pls.

> Signed-off-by: Yazen Ghannam <yazen.ghannam@amd.com>
> ---
>  arch/x86/kernel/cpu/mce/amd.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/x86/kernel/cpu/mce/amd.c b/arch/x86/kernel/cpu/mce/amd.c
> index f916fb4c5d13..e6542e00dc5a 100644
> --- a/arch/x86/kernel/cpu/mce/amd.c
> +++ b/arch/x86/kernel/cpu/mce/amd.c
> @@ -837,7 +837,8 @@ bool amd_mce_usable_address(struct mce *m)
>  			return false;
>  	}
>  
> -	if (this_cpu_ptr(smca_banks)[m->bank].paddrv)
> +	if (m->bank < per_cpu(mce_num_banks, m->extcpu) &&
> +	    per_cpu(smca_banks, m->extcpu)[m->bank].paddrv)

Except that this conditional turns into an unreadable mess now. IOW, split it:

        if (m->bank >= per_cpu(mce_num_banks, m->extcpu)) 
                return false;

        if (per_cpu(smca_banks, m->extcpu)[m->bank].paddrv)
                return m->status & MCI_STATUS_PADDRV;

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
