Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794749773;
	b=Ra8wpFiKw4EsHbm7fNk2qWrc+dcKvWAr0G4JQFqYf05+NYu/Ycxw2l/mkCIZYCUVIbJ+
	 FGperRymT1A1XcSufLrZdt2Uf3Z5B8FOeDOXujLc/sLxLk9W2lXul3eHqqAg4lweIFiM+
	 oG/FtHJO9yWr8hoKpWMfw5TO9jYL/n5l2JZXMMvjvNTNu1+RTp6r4RFC9ncwZev2cD8go
	 gs4aydPtHMT10TgywBMlMG9y4ro3t6MgPtPJsTIfLOUSskSWiteKRi2w5I+xDtT72BXcC
	 YqX2B+lOHUkZlvgDHhywNlIVluIONPaLKYGqqlrsWko0exwAQR5pmr4hG6sEVFfoiEQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794749773;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=9e6OmEAnqWbjzLHCKKsv84JklwVJ8NC6NYkY8/hHdTo=;
	b=JvFVOdNTQtpbRmuNUFwOEKfenofgzXiNrQ/QpcX1b69KPhNddsHDcUFCqhihjyiUyQtn
	 pD/B5wl6wUd4/hXCb40Iq/EIkcJmwls1lmTmS4cD1x8og4owxOTkBee+7+QFf1Q34AHHN
	 eZ1CSYlQKUji8PVkV0lxxju2Cn3AN6IhT8292NJndJB6T0IvKPrVX4iBwHL4EShSjYKdv
	 dKSoFQaJILZOjz9C4A0iEejBQKN4H+Xd/Rmx0WTP5/8eWlxRA7BPsSXWg+7WvFMBK9A4O
	 pfHy+qy/Hel4az16iIzmn8niCCjt4DHsdnJfsdDvqhcHSLDprYP93ZghTdEUesqPwSw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Snqw70sr;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6AF9606A32C
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 13:36:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Snqw70sr
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24EF01F000C4;
	Sun, 15 Nov 2026 13:36:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794749773;
	bh=9e6OmEAnqWbjzLHCKKsv84JklwVJ8NC6NYkY8/hHdTo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Snqw70srUBsDiPj0zDExRjLpznGGJOqGIBDMhIL+rlIy0RTHPt0RW0gen1S1uIXzD
	 QTnCD4JXzQJh1r1+PPrgca3KW4gKyRYXQ+UAwLtnECG3ghBmfQLGrIf7RKGSI935gp
	 EP4t0w7M8b/KEfLi5aITguxi416bR7NN4F84g+C3b89VMOI4IbHT/C2uhrE2r/W3H9
	 KwC7JnxPU8fdL/2ToRZlQsRkRHYQOj3vHa/D9sZu5311NqD1rRb5kPqFTWuTSRVfXW
	 I7pAycrtkBGTnD2Ez9QpD+ZHMtOt3ohpsiJBVdyRUV1RXDC8lXPTtb4u4NMEPqfHFl
	 W76a4v1WZmgrA==
Date: Sun, 15 Nov 2026 21:15:54 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
Cc: Albert Ou <aou@eecs.berkeley.edu>, Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <pjw@kernel.org>, Alexandre Ghiti <alex@ghiti.fr>,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH 2/2] riscv: mm: check the valid bit in
 kernel_page_present()
Message-ID: <avmwinvQyS_X0G7o@xhacker>
References: <20261112-fixes-riscv-v1-0-1caac19897b5@kernel.org>
 <20261112-fixes-riscv-v1-2-1caac19897b5@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261112-fixes-riscv-v1-2-1caac19897b5@kernel.org>

On Thu, Nov 12, 2026 at 03:42:19PM +0200, Mike Rapoport (Microsoft) wrote:
> set_direct_map_invalid_noflush() clears _PAGE_PRESENT, but the kernel
> mappings keep _PAGE_PROT_NONE set: it used to be _PAGE_READ and now it is
> the same bit as _PAGE_GLOBAL. pte_present() and pmd_present() still
> return true for the invalidated entry. kernel_page_present() then reports
> that an unmapped page is mapped, and hibernation copies it without
> remapping it first.
> 
> Test _PAGE_PRESENT directly for PMD and PTE leaves.
> 
> Fixes: 32a0de886eb3 ("arch, mm: make kernel_page_present() always available")
> Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> ---
>  arch/riscv/mm/pageattr.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/riscv/mm/pageattr.c b/arch/riscv/mm/pageattr.c
> index b138113755359..62fbcf7cf36b6 100644
> --- a/arch/riscv/mm/pageattr.c
> +++ b/arch/riscv/mm/pageattr.c
> @@ -453,8 +453,9 @@ bool kernel_page_present(struct page *page)
>  	if (!pmd_present(pmdp_get(pmd)))
>  		return false;
>  	if (pmd_leaf(pmdp_get(pmd)))
> -		return true;
> +		return pmd_val(pmdp_get(pmd)) & _PAGE_PRESENT;

so we call pmdp_get() up to 3 times, could we save its result
and reuse it?

>  
> +	/* pte_present() is true for PAGE_KERNEL with _PAGE_PRESENT cleared */
>  	pte = pte_offset_kernel(pmd, addr);
> -	return pte_present(ptep_get(pte));
> +	return pte_val(ptep_get(pte)) & _PAGE_PRESENT;
>  }
> 
> -- 
> 2.53.0
> 
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv
