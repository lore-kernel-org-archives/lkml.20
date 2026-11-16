Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794826424;
	b=bw7XRdxWLKiME5T5I8erXigHH8XgZMBiBNUZhlwYdzVAAtbuoWWH+AVsP9SmvLEL6X6B
	 E7k+uFawwC8Uhvws3mh7/OSIkD6MzNR8HIk00ZQTCNbGKd0igDXFO4+1RfzC+36Y+I5I/
	 e936BpZEn28NiHpYm9d0t409clwoetpq5udzeruqPFgNWowl342bz4ImA88Ov0KMIsZlT
	 I9x0U2W260UQJeeJgSWNzIwFAb7SZThgI51w+p7xdH+NRUH+O1WViDXqAB9H1Xhk6PVpH
	 OneeVZF3ovoQMxvnUT6PnLUcPQy4QHVLA/FtusT1g184KejuOXM+aJ0cXFovyRz86WQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794826424;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=PZ5JaOv6D2yqeEsrwU2njyIsA8z3XW92qsnk/Jsc8eU=;
	b=IVPus7lDmW18d1eKXrNbP0KX/XmCvwBagaQOZtafJxidCX6pW9i6UhTC9Tg89WIF6sxI
	 OAjvGc1K8l9ymHhHs6tHwQMUWjAQg9JjbPYQM/DvjrjD9rzDoM/JWqix8LC1D3Rd/HQwN
	 McUYouF55lL+FVnp8nVrAlqhFIF0rdJ0YRyptY7/8q7CRDf7shT4mmWWb2N3sQlsFx3oD
	 EjEU64iFnTKvd1VuQoW9FyzIJ/znMQVOeRzi5VUWojq0QXJine028Fbx+wbnLl3n24j78
	 XA2jX2u6mp3k24vc85D3T0+TzF1Fx3HZVFMTWz+/tenwspqHScSc2eIXoZLpFzML0zg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DDhFq6FH;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65973606A32F
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 10:53:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DDhFq6FH
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9BFE61F000C4;
	Mon, 16 Nov 2026 10:53:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794826423;
	bh=PZ5JaOv6D2yqeEsrwU2njyIsA8z3XW92qsnk/Jsc8eU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=DDhFq6FHGJz7/FaNMoRAq43rPdsP2zidPHb7HvLm8vTlp4tgfl+7VyR2IqWSHrLnV
	 15Eb8vnLs1OacTo448up6jZViOgw+3NmHdT251WtIuC0CbdWSxFxbtNHKIZM4WaOPR
	 ys0Z2kO2cZjjj7k4juFNDkAwEYAaN3EIaZHgtKszLMsv1KJtZedejJRqqq+AuK37OK
	 EBtyHaKPH3udJIqb+UUkzmxbJUXFhxlVJ58bD4lsvJHZp1t5VAkIdTFUrFASkA+ntu
	 jc4Q8todrLVjtzeJJ6MURf/e21uua64hfYMEI1M34I66PmuVuauEaAj57QpwI7wnwF
	 UxecWNNpNC9Lw==
Date: Mon, 16 Nov 2026 12:53:37 +0200
From: Mike Rapoport <rppt@kernel.org>
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Albert Ou <aou@eecs.berkeley.edu>, Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <pjw@kernel.org>, Alexandre Ghiti <alex@ghiti.fr>,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH 2/2] riscv: mm: check the valid bit in
 kernel_page_present()
Message-ID: <avrgsUPgxuTwmXFB@kernel.org>
References: <20261112-fixes-riscv-v1-0-1caac19897b5@kernel.org>
 <20261112-fixes-riscv-v1-2-1caac19897b5@kernel.org>
 <avmwinvQyS_X0G7o@xhacker>
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
In-Reply-To: <avmwinvQyS_X0G7o@xhacker>

On Sun, Nov 15, 2026 at 09:15:54PM +0800, Jisheng Zhang wrote:
> On Thu, Nov 12, 2026 at 03:42:19PM +0200, Mike Rapoport (Microsoft) wrote:
> > set_direct_map_invalid_noflush() clears _PAGE_PRESENT, but the kernel
> > mappings keep _PAGE_PROT_NONE set: it used to be _PAGE_READ and now it is
> > the same bit as _PAGE_GLOBAL. pte_present() and pmd_present() still
> > return true for the invalidated entry. kernel_page_present() then reports
> > that an unmapped page is mapped, and hibernation copies it without
> > remapping it first.
> > 
> > Test _PAGE_PRESENT directly for PMD and PTE leaves.
> > 
> > Fixes: 32a0de886eb3 ("arch, mm: make kernel_page_present() always available")
> > Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> > ---
> >  arch/riscv/mm/pageattr.c | 5 +++--
> >  1 file changed, 3 insertions(+), 2 deletions(-)
> > 
> > diff --git a/arch/riscv/mm/pageattr.c b/arch/riscv/mm/pageattr.c
> > index b138113755359..62fbcf7cf36b6 100644
> > --- a/arch/riscv/mm/pageattr.c
> > +++ b/arch/riscv/mm/pageattr.c
> > @@ -453,8 +453,9 @@ bool kernel_page_present(struct page *page)
> >  	if (!pmd_present(pmdp_get(pmd)))
> >  		return false;
> >  	if (pmd_leaf(pmdp_get(pmd)))
> > -		return true;
> > +		return pmd_val(pmdp_get(pmd)) & _PAGE_PRESENT;
> 
> so we call pmdp_get() up to 3 times, could we save its result
> and reuse it?

Yep, will change in v2. 
  
> > +	/* pte_present() is true for PAGE_KERNEL with _PAGE_PRESENT cleared */
> >  	pte = pte_offset_kernel(pmd, addr);
> > -	return pte_present(ptep_get(pte));
> > +	return pte_val(ptep_get(pte)) & _PAGE_PRESENT;
> >  }
> > 
> > -- 
> > 2.53.0
> > 
> > 
> > _______________________________________________
> > linux-riscv mailing list
> > linux-riscv@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/linux-riscv

-- 
Sincerely yours,
Mike.
