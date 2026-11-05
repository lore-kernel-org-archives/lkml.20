Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793870812;
	b=bIq5atEpJJPFXLFRLT6L859adwoCm0ATRq8KRqQ6HWZXQgIWEQ2w15vRv93NTM1QGaWn
	 TJ4vVyrlEfGhcesOoc/NIY4bLeVR2rds4o0Opsxm4vc5w5pUV9G3mm7mry+r5wZhp6wOm
	 JKCsnr21DnhCqItSFFy+6tlcc4QzFfu/6J1/VqH/weMauloZZfR3ty+faMYYi4WvwFRKQ
	 cUujDCXRB/lVKHhnCMCr2gZQaJXg3/2vJVVrwyBGuhxgHm0VdCEDM6wZonO0VadKdabFs
	 vbof7wOqj/Gpb9bo0m3btQYHOgkzmSvFGVMhfQYTLxO6rd7qSkSJOof0wDTalFXb4EA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793870812;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=uRkdO17Voxl0dXI2uG8wshwdNsr0g145kxXlot39KlA=;
	b=DF/a1bYt86uULm8SDQ4oUeO8NghX2HS3nxj2XAhCeN0dvOqwT+8w1rcUucLOOD4DeBsy
	 U1i/B5d8lC4kgE9VNij2C2gLBgBTTJCumOorK3PaOq3mxugCqM2Nu4RbWuexi4ds4N/kY
	 9c1VXa6nSRxivhglCD1Vqz10wFvhTqgV/BPzEAyuXm06N1t3tWGsYB/IMQCV+obRAQJR4
	 zc30WVtYULLsiYINOc8SSf2uHOOLL+TFk42ZWp+J3JfDkG0USYrwAsWDmwyXWLpLm1Gj0
	 QLEqXpg2i5kkpc8SKO+PEWSr2nkDele8365pjuKX/BbOtkJu8GHxvm3veR+aYajFW+g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=D3Ff3mLR;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 603E0606A31B
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 09:26:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=D3Ff3mLR
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5D9A1F000C1;
	Thu,  5 Nov 2026 09:26:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793870811;
	bh=uRkdO17Voxl0dXI2uG8wshwdNsr0g145kxXlot39KlA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=D3Ff3mLRu4OChP2iUFU4kKDEzNr1W2PkRr2N3WCoIANfV8eYMHtr1p+zNArTikMKv
	 sIeNox3CK7OeKmR0k/aKUCimJ0pteSN4s1zni++glIrXGPwO7cvGWhSq552JhrNX49
	 bGfQHQ8ydG09LI0e/Oql3VJY9nT9unfJeUw515TqftXpdlpc5ppVtOGIBv39kZS+zf
	 ZCQFDxCNDKlsk22SXXDV5wi8rC9W2zjgj4O37W5RZvhthRVV52dbEIhMn+XJlTPFqo
	 vQ6t0k65Vj7JsbJSQBIuTKGNtVNTBX2BYaNwnjSubsYvM+7XdWyIRrdNOPBSU+c56Z
	 3ghh+boYYNBdw==
Date: Thu, 5 Nov 2026 10:26:45 +0100
From: "Oscar Salvador (SUSE)" <osalvador@kernel.org>
To: Muchun Song <songmuchun@bytedance.com>
Cc: Oscar Salvador <osalvador@suse.de>,
	Andrew Morton <akpm@linux-foundation.org>,
	Mike Rapoport <rppt@kernel.org>, Qi Zheng <qi.zheng@linux.dev>,
	Lance Yang <lance.yang@linux.dev>,
	James Houghton <jthoughton@google.com>,
	David Hildenbrand <david@kernel.org>,
	Muchun Song <muchun.song@linux.dev>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 12/12] mm: hugetlb_vmemmap: make vmemmap PTE
 conversion folio-oriented
Message-ID: <auxL1Q4S9wllEn6B@localhost.localdomain>
References: <20261104023510.260766-1-songmuchun@bytedance.com>
 <20261104023510.260766-13-songmuchun@bytedance.com>
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
In-Reply-To: <20261104023510.260766-13-songmuchun@bytedance.com>

On Wed, Nov 04, 2026 at 10:35:10AM +0800, Muchun Song wrote:
> Converting a folio's vmemmap mappings from PMDs to PTEs is a per-folio
> operation, but the current interface exposes a raw address range and
> hardcodes deferred TLB flushing.  This splits the common mechanism
> across layers and couples it to the HugeTLB batching policy.
> 
> Make the folio the unit of PTE conversion and let callers select the TLB
> flush policy through the folio-oriented interface.  This keeps
> HugeTLB-specific eligibility and batching outside the common operation.
> 
> No functional change intended.
> 
> Signed-off-by: Muchun Song <songmuchun@bytedance.com>
> Reviewed-by: Lance Yang <lance.yang@linux.dev>
> Reviewed-by: Qi Zheng <qi.zheng@linux.dev>
> Reviewed-by: Mike Rapoport (Microsoft) <rppt@kernel.org>

Reviewed-by: Oscar Salvador <osalvador@suse.de>

But I have to say that I would put the vmemmap_optimizable_order() check
upfront in the caller, so by the time we call vmemmap_pteify_folio()
we now we can proceed.



-- 
Oscar Salvador
SUSE Labs
