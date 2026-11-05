Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793865599;
	b=Tmj1S8u0YXtODOvVma53F2RxgMl131nntlpdEgpEp24D1GN1OmuXd6aWnX0JQPkbzlni
	 T4nGc6Etcv37u7Pn1ZUoeuiTCyMH7mxCos1LBSrY+0l5fyQSJB8Ju/ZatlIHsIOuWN5GN
	 5dMBGDOFY3KDy50telyFd50xQskgLBJ0QOviipDZNgH9fatc4umT0rXcTh00xtgSs6ZvH
	 BQDexZsJrHtIN+6LNY3vj3NcLfau6R2pQNgMftfGUPH1BsvzVwBY4cJ5gGP4KLQS8JVGE
	 ZDw6hVhC8EWrIigSgrNDI5WZHDIvusJN4JICpX1QQswCveMQ9uL3mqOY9ANnlBiovgw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793865599;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=b3t/AZZXgpUUBPoN/8EcWLM6aSitZao8sMvkUu7sQcw=;
	b=ofMwwxsRdQtNZr3yIw3Z4Zv/IKQfxZPgrRXHUdpUpbwdaEhsxOc+wjtQHtkcRcshwpN4
	 q6MzLI2vhPCz5E8TE/EB8nTsgkLbS2vXeqZAl3xO8EFfoYOmP7J4XN3AmBkoU8V5S7f8f
	 K4q7gA5Jl7LejzxTP7IPmtqnyx+K81Q8LwfK+9DJHg8IPx0eOj0i9UVV5FQ9KSNR4RMqi
	 UlmBIb8l2SPLRKNq04QtEthqvz1JHaxRR4UJanvqVjkaIRC5qxqxi8e9M6znFG5vS/lay
	 HvlfLJbvuxdyPABFweneEwnVAkudeQg43bpD35OC/4q2fJw4He0C407pCZ+zDLyV7rA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=guQbtF2j;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7D5C606A328
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 07:59:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=guQbtF2j
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 425191F0093A;
	Thu,  5 Nov 2026 07:59:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793865598;
	bh=b3t/AZZXgpUUBPoN/8EcWLM6aSitZao8sMvkUu7sQcw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=guQbtF2jldVKgx4ac787ghXRGdDM4Ye6jRjYUwcllIkG+O5epTzarqTG/si+Dq7cd
	 8SAQXX3JwughkvqUx9Ef6WOTuPu9qLF3Qyqyf+MPL0zMS+bKGmlqJ8zmyzBmZqD3vF
	 dEt4/oPS7+PqkIpO9cQ2jJSEsfB3Kp4ifdiqTxmcNuNuT1pIexCUI/Ft441pXEgt4s
	 ltwwL3cFcpsnoAa45emlUhoxiDyKEHWddO+SR1XkpvsE8z9U9ysIjcLz9ege4L4IUV
	 ZGHcgwYNvLUFYWrREJXvQ3Ph63X2uBayjKz3okeaKiP2/QLBfaDLvop+6MMV6CpbQr
	 hdR+Mx+Mq+T3w==
Date: Thu, 5 Nov 2026 09:59:50 +0200
From: Mike Rapoport <rppt@kernel.org>
To: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Kees Cook <kees@kernel.org>,
	Changyuan Lyu <changyuanl@google.com>,
	Alexander Graf <graf@amazon.com>, Tony Luck <tony.luck@intel.com>,
	"Guilherme G. Piccoli" <gpiccoli@igalia.com>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, Pratyush Yadav <pratyush@kernel.org>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	kexec@lists.infradead.org
Subject: Re: [PATCH v2] memblock: don't allocate new reserve_mem regions on a
 KHO boot
Message-ID: <auw3dtAMp4CjNwY2@kernel.org>
References: <20261104204235.9066-1-azpijr@gmail.com>
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
In-Reply-To: <20261104204235.9066-1-azpijr@gmail.com>

On Wed, Nov 04, 2026 at 09:42:17PM +0100, Jose A. Perez de Azpillaga wrote:
> On a KHO boot, a reserve_mem region that can't be revived is allocated
> from KHO_NOPRSRV memory, which includes the bootmem the next kernel
> boots out of. With CONFIG_KEXEC_HANDOVER_DEBUG, preserving the region
> then fails:
> 
>   WARNING: kernel/liveupdate/kexec_handover.c:1245 at kho_preserve_pages+0x168/0x180
>   failed to prepare memblock FDT for KHO: -22
> 
> Without it, the next kernel puts its memmap on top of the region and
> the ramoops records in it are lost.
> 
> There is no use case for adding regions across a live update, so fail
> instead of allocating, and drop the TODO.
> 
> Fixes: f99230780211 ("memblock: add KHO support for reserve_mem")
> Signed-off-by: Jose A. Perez de Azpillaga <azpijr@gmail.com>
> ---
> Changes in v2:
> - fail on a KHO boot instead of allocating outside bootmem, as agreed
>   with Pratyush [1]. this drops v1's patch 1.
> - not an RFC anymore.
> - based on v7.4-rc1.
> 
> v1: https://lore.kernel.org/all/20261021211058.83483-3-azpijr@gmail.com/
> 
> [1] https://lore.kernel.org/all/2vxzfqxglrg6.fsf@kernel.org/
> 
>  mm/memblock.c | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)
> 
> diff --git a/mm/memblock.c b/mm/memblock.c
> index a450092a80fb..e325e0542c9a 100644
> --- a/mm/memblock.c
> +++ b/mm/memblock.c
> @@ -2827,7 +2827,16 @@ static int __init reserve_mem(char *p)
>  	if (reserve_mem_kho_revive(name, size, align))
>  		return 1;
>  
> -	/* TODO: Allocation must be outside of KHO_NOPRSRV region */
> +	/*
> +	 * On a KHO boot memblock only allocates from KHO_NOPRSRV memory here,
> +	 * which includes the bootmem the next kernel boots out of. Only regions
> +	 * handed over by the previous kernel are supported.
> +	 */
> +	if (is_kho_boot()) {

This breaks memblock tests, please add a stub there.

> +		pr_err("reserve_mem: can't allocate \"%s\" on a KHO boot\n", name);
> +		return -EOPNOTSUPP;
> +	}
> +
>  	start = memblock_phys_alloc(size, align);
>  	if (!start) {
>  		pr_err("reserve_mem: memblock allocation failed\n");
> 
> base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
> -- 
> 2.56.0
> 

-- 
Sincerely yours,
Mike.
