Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.22
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794035218;
	b=SXnkNpei2pTD5NXf3JysnXdxCwnfQo4ol8Q8rew1p5tb/iW9Cxi+unNJ1XhGRub5L2PO
	 ftncgst6zXiBBQImdfS3WPOCxoIKq06Y+DcZ03hpvO5vPo9C6lz/kr9ZTtIEUbMBH3jEs
	 hQ+HLg8+oGeVKIMDpjnFMsK1vLLMer2qL/zrPzu/J2uHb6xAmDeEeX3I+jHXwXDkqCs0l
	 0k+8ZFJcACiJeXdHFamEVnMBM1jU++o+tz3+wrAU/pom8EMdhqRkdFaUUNryCXlXM2nS6
	 dIvwjB6mKUrmM6DWK6jIFRyJEPYLWJt28uQA9c+jGD6T74jCi9S3MjzIofQSDmmes6Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794035218;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Content-Type:Mime-Version:Subject:From:
	 In-Reply-To:Date:Cc:Content-Transfer-Encoding:Message-Id:References:
	 To:X-Mailer;
	bh=FQGgtDwWrS+TOjm+NTam7HXH9x/oZ1flKgXBC0MLbs8=;
	b=2VOXU4Ybt1ny1iDdk1JO4dHdZONNPQ3zTdoWMNVpD+slZwLQtcSSgcCjIdNUWXVm7lDL
	 vuYzcIvALWAdMis1wnEBCJFRnilTzF+mnIW/s3vRrJfelQhrFbLMWaL4gSHlE/bXccAcq
	 qGP7AUyLknNioNkPPASQdq/EeYsyizYNCY+K/jJiEkv4Tsup4E9Nv5PhSHR4vfmdruZKT
	 sgVXLCYdfLoGLZ8SlhRBlX87Y29dCUEJHj3EbD1sB0RBCnWuHXxTgLyVou4niH/EJBvry
	 E5gQjZAxZ+a/sre0NeXg4a8+bGuv7Bb/zMfm4QYIWT+5pKsybrUTe1XbsN36QVgjBrg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=laaaeGzM;
	arc=none smtp.remote-ip=95.215.58.22
Received: from mta1.migadu.com (out-22.mta1.migadu.com [95.215.58.22])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85D3B606A326
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 07:06:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 85D3B606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=laaaeGzM
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=WA6DBOazilQWA0YBctLuPJvG7AIFId4vVmL0J8Gvwrs=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794035215; v=1; x=1794640015;
 b=laaaeGzMGg4t+lecIujlnzQeisTE9nvbBDsCu1Bil5VTtbW36bfPUrnWhXHZFfEszpdp+CJW
 0aQ6ai2SyU4aMbwRCGD9pVbvG5evkYMwIO2BisdMx11yiEVQ/JqzOfspen8u75vuF93hCFEHE4A
 +xCCq96iQjLMHM9W9vC9cm5Q=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta12.migadu.com with ESMTPS id edb96401be2ea3ce;
	Sat, 07 Nov 2026 07:06:55 +0000
X-Mizu-Trace-ID: edb96401be2ea3ce
X-Migadu-Flow: FLOW_OUT
Content-Type: text/plain;
	charset=us-ascii
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3901.200.71.1.16\))
Subject: Re: [PATCH v2 08/20] hugetlb: Fully initialize tail struct pages of
 non-pre-HVOed bootmem folios
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <20261003002123.505555-9-jthoughton@google.com>
Date: Sat, 7 Nov 2026 15:06:31 +0800
Cc: Will Deacon <will@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Oscar Salvador <osalvador@suse.de>,
 Andrew Morton <akpm@linux-foundation.org>,
 Nikos Nikoleris <nikos.nikoleris@arm.com>,
 Linu Cherian <linu.cherian@arm.com>,
 Mark Rutland <mark.rutland@arm.com>,
 David Hildenbrand <david@kernel.org>,
 Ryan Roberts <ryan.roberts@arm.com>,
 Nanyong Sun <sunnanyong@huawei.com>,
 Yu Zhao <yuzhao@google.com>,
 Frank van der Linden <fvdl@google.com>,
 David Rientjes <rientjes@google.com>,
 linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-mm@kvack.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <30822F0C-88B8-4ACD-A0CD-F889F438EDB4@linux.dev>
References: <20261003002123.505555-1-jthoughton@google.com>
 <20261003002123.505555-9-jthoughton@google.com>
To: James Houghton <jthoughton@google.com>
X-Mailer: Apple Mail (2.3901.200.71.1.16)



> On Oct 3, 2026, at 08:21, James Houghton <jthoughton@google.com> =
wrote:
>=20
> alloc_bootmem() marks all but the head struct page of a bootmem =
gigantic
> folio as noinit, and gather_bootmem_prealloc_node() then only
> initializes the first HUGETLB_VMEMMAP_RESERVE_PAGES struct pages. The
> remaining tail struct pages are initialized only if the folio ends up
> not being HVOed.
>=20
> This assumes that a bootmem folio is either pre-HVOed, or will not be
> HVOed at all. However, hugetlb_vmemmap_optimize_bootmem_page() may =
skip
> pre-HVO because arch_hugetlb_vmemmap_optimization_supported() does not
> yet return true that early in boot (e.g. on arm64, where support =
depends
> on a system-wide CPU capability), while it does return true by the =
time
> hugetlb_vmemmap_optimize_bootmem_folios() runs. Such folios are then
> HVOed through the regular remap path with uninitialized tail struct
> pages, which trips the PageTail() WARN in vmemmap_remap_pte().
>=20
> Avoid this by initializing all tail struct pages up front in
> gather_bootmem_prealloc_node() for folios that were not pre-HVOed. =
This
> makes the HVO-failure fallback in prep_and_add_bootmem_folios()
> unnecessary, as pre-HVOed folios are never passed through the regular
> remap path, and all other folios now already have initialized tail
> struct pages. A failed optimization either leaves the original vmemmap
> in place or restores the tail struct pages from the shared tail page.
> Remove the fallback.
>=20
> For folios that are not HVOed at all, this does not change the amount
> of initialization work, only where it is done.
>=20
> Signed-off-by: James Houghton <jthoughton@google.com>
> ---
> mm/hugetlb.c | 28 +++++++++++++++-------------
> 1 file changed, 15 insertions(+), 13 deletions(-)
>=20
> diff --git a/mm/hugetlb.c b/mm/hugetlb.c
> index 4dac7ed1df57..e971e2362412 100644
> --- a/mm/hugetlb.c
> +++ b/mm/hugetlb.c
> @@ -3303,17 +3303,6 @@ static void __init =
prep_and_add_bootmem_folios(struct hstate *h,
> 	hugetlb_vmemmap_optimize_bootmem_folios(h, folio_list);
>=20
> 	list_for_each_entry_safe(folio, tmp_f, folio_list, lru) {
> -		if (!folio_test_hugetlb_vmemmap_optimized(folio)) {
> -			/*
> -			 * If HVO fails, initialize all tail struct =
pages
> -			 * We do not worry about potential long lock =
hold
> -			 * time as this is early in boot and there =
should
> -			 * be no contention.
> -			 */
> -			hugetlb_folio_init_tail_vmemmap(folio, h,
> -					HUGETLB_VMEMMAP_RESERVE_PAGES,
> -					pages_per_huge_page(h));
> -		}

Just for your information, I also plan to remove those code, see here =
[1].
I need to push this patch along quickly. I'm confident it won't take =
long.

[1] =
https://lore.kernel.org/all/20260513132044.41690-15-songmuchun@bytedance.c=
om/

Thanks,
Muchun

> 		hugetlb_bootmem_init_migratetype(folio, h);
> 		/* Subdivide locks to achieve better parallel =
performance */
> 		spin_lock_irqsave(&hugetlb_lock, flags);
> @@ -3337,6 +3326,7 @@ static void __init =
gather_bootmem_prealloc_node(unsigned long nid)
> 		struct page *page =3D virt_to_page(m);
> 		struct folio *folio =3D (void *)page;
> 		const unsigned long pfn =3D folio_pfn(folio);
> +		bool pre_hvo;
>=20
> 		h =3D m->hstate;
> 		/*
> @@ -3350,11 +3340,23 @@ static void __init =
gather_bootmem_prealloc_node(unsigned long nid)
> 		VM_BUG_ON(!hstate_is_gigantic(h));
> 		WARN_ON(folio_ref_count(folio) !=3D 1);
>=20
> +		pre_hvo =3D =
vmemmap_optimizable_order(pfn_to_section_compound_order(pfn));
> +
> +		/*
> +		 * Pre-HVOed folios have their tail struct pages =
mirrored from
> +		 * the shared tail page, so only the first vmemmap page =
needs
> +		 * initializing. Otherwise, the tail struct pages =
(marked noinit
> +		 * in alloc_bootmem()) must all be initialized now: the =
folio
> +		 * may still be HVOed via the regular remap path (e.g. =
if the
> +		 * architecture could not determine HVO support at =
bootmem
> +		 * allocation time), which expects valid tail pages.
> +		 */
> 		hugetlb_folio_init_vmemmap(folio, h,
> -					   =
HUGETLB_VMEMMAP_RESERVE_PAGES);
> +					   pre_hvo ? =
HUGETLB_VMEMMAP_RESERVE_PAGES :
> +						     =
pages_per_huge_page(h));
> 		init_new_hugetlb_folio(folio);
>=20
> -		if =
(vmemmap_optimizable_order(pfn_to_section_compound_order(pfn)))
> +		if (pre_hvo)
> 			folio_set_hugetlb_vmemmap_optimized(folio);
> 		section_set_compound_order_range(pfn, =
folio_nr_pages(folio), 0);
>=20
> --=20
> 2.56.0.rc1.315.gc6ed9934b7-goog
>=20

