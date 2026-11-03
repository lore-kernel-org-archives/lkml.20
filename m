Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793718648;
	b=hu0c4zAVSdt6YqfZuqBksuab3RR0Hm8KHFILTtFHZsUkH+zySyGBcYtsEnTgEjf8WFxt
	 WPqNM22wzcXhXIT9HQwE/Yur4PciCz9zxpF/0bnWd+VOrqkdnHdF75Ae3ZDNIVlOhmWOv
	 M0YMtGqHBv4T51jfDdYWIPNc6PafMdq7fmhluFDnGNoL3br7yz5jvEb6q4ThxrJyImaG4
	 PXFVnE7o89yi1j8+CDVrUFqUAsw6wB0E/eDhBtYCTY2o+8re0pWgr9tyYj+RJs+0j/vQw
	 vEweKkn2//oGcF3coV8lQTofyomLnjVy6b1muH143clQL3+/g1zdBhXWi2/Ztz/Acag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793718648;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=69LtF5LxsSyai3V1zpFQvGHNKgI/ivVQp0YDn5JQf9U=;
	b=ttJOMkDNQDt6Vfiq2DZ4CVGgF2t3qABVEhbVfPHdVcuobOlW3nCCraDt5qPSn/hxQbOj
	 qM1hssQDisKU7hQSmVwuApjv/R11kIiOIOdsfgSdQsaQ8AkyAKLVWEOId4RSyRcNHe7zF
	 Jzc2SZQjRqv17I7ZX6ciK+FL9BaUo33jZzwd3drLt/twMZzfqwcI6W3b8Tm03D/8HAIa6
	 heVkoGBoLl9AOLOpIReusjuDycxrcI2pWwQJCYCsI0Z3UwApbU+tfX9XbEi1prebcEwbE
	 +GwOZZLNXVamMgVVKmZoDFBy0z16Wi94AtIwZsSWJJ5bC8sg7Yuu0w9Te4KDxH+lPaA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=UbkPTj91;
	arc=none smtp.remote-ip=91.218.175.199
Received: from mta0.migadu.com (out-199.mta0.migadu.com [91.218.175.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08536606D2ED
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 15:10:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 08536606D2ED
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=UbkPTj91
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=5l77t2qq3L5LuFBcuy2fj7Ly2dABkuzVGXgG0cH9dIQ=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793718644; v=1; x=1794323444;
 b=UbkPTj91uQeoBrTXtlO8oXMNemeWpw7UR3sGwP9qbCTHVpBJQuHtAZWT1LYODEQHlshd3I1E
 Zj3mQrGeIp71s7MwA7g4UxWFiEDhkPv5JxsZNKIXcF222h2m4nJb7J6ROYxh1/AK7VXtS05FFgJ
 PLdg+BCSwItMmMvEdO3j67Fs=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta11.migadu.com with ESMTPS id 5936257d9543480e;
	Tue, 03 Nov 2026 15:10:44 +0000
X-Mizu-Trace-ID: 5936257d9543480e
X-Migadu-Flow: FLOW_OUT
From: Usama Arif <usama.arif@linux.dev>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: Usama Arif <usama.arif@linux.dev>,
	Andrew Morton <akpm@linux-foundation.org>,
	david@kernel.org,
	chrisl@kernel.org,
	kasong@tencent.com,
	ljs@kernel.org,
	ziy@nvidia.com,
	linux-mm@kvack.org,
	ying.huang@linux.alibaba.com,
	Baoquan He <baoquan.he@linux.dev>,
	willy@infradead.org,
	youngjun.park@lge.com,
	hannes@cmpxchg.org,
	riel@surriel.com,
	shakeel.butt@linux.dev,
	alex@ghiti.fr,
	kas@kernel.org,
	baohua@kernel.org,
	dev.jain@arm.com,
	baolin.wang@linux.alibaba.com,
	Nico Pache <nico.pache@linux.dev>,
	"Liam R. Howlett" <liam@infradead.org>,
	ryan.roberts@arm.com,
	Vlastimil Babka <vbabka@kernel.org>,
	lance.yang@linux.dev,
	linux-kernel@vger.kernel.org,
	nphamcs@gmail.com,
	shikemeng@huaweicloud.com,
	yosry@kernel.org,
	qi.zheng@linux.dev,
	luizcap@redhat.com,
	kernel-team@meta.com
Subject: Re: [PATCH v8 03/30] loongarch: mm: add PMD swap-exclusive helpers
Date: Tue,  3 Nov 2026 07:10:35 -0800
Message-ID: <20261103151037.1621401-1-usama.arif@linux.dev>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <CAAhV-H5yr0xqAUUKftz_RL-SCp02RdFB=aK0sP+uDDwXZPUmxA@mail.gmail.com>
References: 
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Fri, 2 Oct 2026 22:17:51 +0800 Huacai Chen <chenhuacai@kernel.org> wrote:

> Hi, Usama,
> 
> On Fri, Oct 2, 2026 at 5:55 PM Usama Arif <usama.arif@linux.dev> wrote:
> >
> > Prepare for keeping a PMD-mapped anonymous THP mapped by a PMD across the
> > swap round-trip, which makes PG_anon_exclusive have to survive in a swap
> > PMD and not just in a swap PTE.
> >
> > A LoongArch swap PMD is the swap PTE value plus _PAGE_HUGE, and
> > _PAGE_SWP_EXCLUSIVE sits outside both the type and the offset field, so the
> > PMD helpers can use the same bit.
> >
> > Cc: Huacai Chen <chenhuacai@kernel.org>
> > Signed-off-by: Usama Arif <usama.arif@linux.dev>
> > Reviewed-by: David Hildenbrand (Arm) <david@kernel.org>
> > ---
> >  arch/loongarch/include/asm/pgtable.h | 19 +++++++++++++++++++
> >  1 file changed, 19 insertions(+)
> >
> > diff --git a/arch/loongarch/include/asm/pgtable.h b/arch/loongarch/include/asm/pgtable.h
> > index cf29a4c8ac593..87fecc3a51001 100644
> > --- a/arch/loongarch/include/asm/pgtable.h
> > +++ b/arch/loongarch/include/asm/pgtable.h
> > @@ -351,6 +351,25 @@ static inline pte_t pte_swp_clear_exclusive(pte_t pte)
> >         return pte;
> >  }
> >
> > +#ifdef CONFIG_ARCH_HAS_PMD_SOFTLEAVES
> > +static inline pmd_t pmd_swp_mkexclusive(pmd_t pmd)
> > +{
> > +       pmd_val(pmd) |= _PAGE_SWP_EXCLUSIVE;
> > +       return pmd;
> > +}
> > +
> > +static inline bool pmd_swp_exclusive(pmd_t pmd)
> > +{
> > +       return pmd_val(pmd) & _PAGE_SWP_EXCLUSIVE;
> > +}
> > +
> > +static inline pmd_t pmd_swp_clear_exclusive(pmd_t pmd)
> > +{
> > +       pmd_val(pmd) &= ~_PAGE_SWP_EXCLUSIVE;
> > +       return pmd;
> > +}
> I think the order should be pmd_swp_exclusive, pmd_swp_mkexclusive and
> pmd_swp_clear_exclusive. That looks more natural.
> 
> The riscv version is already like this, but others are not.

Done. The LoongArch helpers now use test/mk/clear. I also reordered
s390's PMD helpers to match its adjacent PTE helpers. RISC-V and arm64
already use test/mk/clear for their PMD helpers. Powerpc and x86 retain
the order used by their adjacent PTE helpers.

> 
> 
> Huacai
> 
> > +#endif
> > +
> >  #define pte_none(pte)          (!(pte_val(pte) & ~_PAGE_GLOBAL))
> >  #define pte_present(pte)       (pte_val(pte) & (_PAGE_PRESENT | _PAGE_PROTNONE))
> >  #define pte_no_exec(pte)       (pte_val(pte) & _PAGE_NO_EXEC)
> > --
> > 2.53.0-Meta
> >
> 
