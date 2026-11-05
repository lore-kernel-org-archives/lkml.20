Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793846339;
	b=46NGaJ1yONPl9hE8VcqtNvY48rfeAomRlEFntVd4h8CWUHzv5iEr2LNT9kCxP0DG4hT6
	 PO6XFmkWJdH+q02XgeiNVTWa+vPW9zY2SSMgREOHAwOBFAGuLpxX7GzdjHTZ0ZNeVhhv1
	 t9VHyxEq4cKC13leQECfyrz/Y/OYOIlhsKKdNkem5KcOhOHoUjwIgsJ0LT1TVRi/SkcBK
	 6CPj+4IzkxnBWkX1/C8mRbxHvsbvlUvHSTcYbdDHaFdaL1rAe79iqgFtzOtOtnvMpKIOL
	 q5+AQHLA6o/wpwtvtDSGubaNiTrSVQKs3x0aNAdZJXSzlJvE4SHXHHKzInT+9B8hEeA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793846339;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Content-Type:Mime-Version:Subject:From:
	 In-Reply-To:Date:Cc:Content-Transfer-Encoding:Message-Id:References:
	 To:X-Mailer;
	bh=3l03Jx6ES0n3NXuG9mumrJ8xYBQNgZrk193Mf6WF3Q0=;
	b=aOR8FH3Y/FW0ZQR4kgpYaZ933adgu1dL9KpeQjcHR6iDlpqkILVBdDupl6mItJbiFrJk
	 IA2X1cfUQFEbleqISL2Ki6wpi/ZbqfvbkFEayQ7ITpxYh3/YCGZ5cAkuVEkbNyok28otf
	 7Y4jKpC06YvMjKP/NphIsfUYRr1VPMRZK1OWaWpbNWxT3Or7Lpjfy/6vVgAfgoIbINjeZ
	 nT9UKOgsuPBNbQrWh/LUQIhZPR0ZtCzTCCqxtLWbEVrlcRGOUNYsf+i5G+Muk4t0rj6Ou
	 bzUXDZ3aZ35rgZI5r0l2P4P+vj5upF/V+LHLhOov3NUEhp3EikBTbsR8OUspJAyootw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=cmViAYd5;
	arc=none smtp.remote-ip=91.218.175.181
Received: from mta0.migadu.com (out-181.mta0.migadu.com [91.218.175.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A38A606A332
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 02:38:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5A38A606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=cmViAYd5
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=v45CDog2JRm1weUQFkof7B9qIVd7KYdFBRCOVPz0R4M=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793846334; v=1; x=1794451134;
 b=cmViAYd5fxtad0Psx17cMQM6ajV0lFYY/g5Cq1u1OYYEh52bUkynG+0Ob+2EDMDgjLKz7iY2
 OvHu6645ritYLx9Rnoq3XM46f23r9t831zBugtWnJK4z8YdOezBW5kL+otkGYWGof2qiaMX+8AG
 xqmFe7BnoAa3p1rLgcIkbu3o=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta11.migadu.com with ESMTPS id 2a7c54c2f09cafbe;
	Thu, 05 Nov 2026 02:38:54 +0000
X-Mizu-Trace-ID: 2a7c54c2f09cafbe
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
Subject: Re: [PATCH] mm/hugetlb: do not invoke the OOM killer when optimizing
 vmemmap
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <20261104133938.50974-1-zhangyili01@baidu.com>
Date: Thu, 5 Nov 2026 10:38:37 +0800
Cc: osalvador@suse.de,
 akpm@linux-foundation.org,
 David Hildenbrand <david@kernel.org>,
 kas@kernel.org,
 linux-mm@kvack.org,
 linux-kernel@vger.kernel.org,
 Mike Rapoport <rppt@kernel.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <6773CA2D-35EF-441D-A736-BBEA4A07B074@linux.dev>
References: <20261104133938.50974-1-zhangyili01@baidu.com>
To: Yili Zhang <zhangyili01@baidu.com>
X-Mailer: Apple Mail (2.3901.200.71.1.16)



> On Nov 4, 2026, at 21:39, Yili Zhang <zhangyili01@baidu.com> wrote:
>=20
> Boot-time hugepage allocation is designed to drain all free memory and
> let the vmemmap optimization reclaim vmemmap pages, so that more
> hugepages can be allocated afterwards:
> hugetlb_pages_alloc_boot_node() flushes the folios accumulated so far
> once si_mem_available() drops to zero, and hugetlb_pages_alloc_boot()
> keeps retrying as long as progress is being made.  The allocation is
> parallelized with padata and runs on many threads at once.
>=20
> The page that will back the new head struct page of a folio being
> optimized is allocated with a bare GFP_KERNEL mask in
> __hugetlb_vmemmap_optimize_folio():
>=20
> vmemmap_head =3D alloc_pages_node(nid, GFP_KERNEL, 0);
>=20
> Once the workers have consumed all free memory, this allocation enters
> the OOM path.  During boot-time allocation, at the do_one_initcall()
> stage, there are no user processes yet, so out_of_memory() finds
> nothing to kill and panics:
>=20
>  Out of memory and no killable processes...
>  Kernel panic - not syncing: System is deadlocked on memory
>  CPU: 74 UID: 0 PID: 1 Comm: swapper/0
>  Call Trace:
>    vpanic+0x32f/0x360
>    panic+0x57/0x60
>    out_of_memory+0x581/0x590
>    __alloc_pages_slowpath.constprop.115+0x97d/0xed0
>    __alloc_frozen_pages_noprof+0x303/0x330
>    __alloc_pages_noprof+0xa/0x20
>    __hugetlb_vmemmap_optimize_folio+0xa3/0x210
>    __hugetlb_vmemmap_optimize_folios+0x190/0x230
>    prep_and_add_allocated_folios+0x16/0x90
>    hugetlb_pages_alloc_boot_node+0x152/0x180
>    padata_mt_helper+0x5b/0xb0
>    padata_do_multithreaded+0x294/0x3a0
>    hugetlb_hstate_alloc_pages+0x2e1/0x3b0
>    hugetlb_init+0x3b5/0x640
>    do_one_initcall+0x49/0x200
>=20
> Optimizing the vmemmap is best-effort by design: on allocation =
failure,
> __hugetlb_vmemmap_optimize_folios() frees the vmemmap pages reclaimed
> from the folios it has processed so far and retries once, and folios
> that still cannot be optimized are put into the pool unoptimized by
> prep_and_add_allocated_folios().  The worst outcome of a failure is a
> higher vmemmap overhead and, as a consequence, fewer hugepages being
> allocated (along with a warning) - waking up the OOM killer is never
> the right thing to do here.  Note that the same code also runs for
> runtime hugepage allocations, where an OOM invocation may kill an
> unrelated process instead of failing the optimization gracefully.
>=20
> The head page is a vmemmap page, and every other vmemmap page
> allocation involved is prepared to fail gracefully:
> vmemmap_alloc_block() - which vmemmap_shared_tail_page() also uses
> to allocate the shared tail vmemmap pages - uses
> GFP_KERNEL|__GFP_RETRY_MAYFAIL|__GFP_NOWARN, and
> alloc_vmemmap_page_list() uses GFP_KERNEL|__GFP_RETRY_MAYFAIL.
>=20
> Align it with the other vmemmap page allocations by using the same =
mask
> that vmemmap_alloc_block() uses for vmemmap pages, so that a failure
> returns -ENOMEM to the caller instead of going through the OOM path.
>=20
> This was observed on a 384-CPU machine with ~1.5TiB of RAM booting
> with a hugepages=3D reservation close to the total memory size and
> CONFIG_HUGETLB_PAGE_OPTIMIZE_VMEMMAP_DEFAULT_ON=3Dy, where the boot
> panicked intermittently, depending on how the parallel allocation
> workers interleaved.

A really detailed analysis, but also lengthy (I think it's generated =
from
AI, It really should be trimmed before sending because the issue is very
obvious and easy to understand).

>=20
> Fixes: c0b495b91a47b ("mm/hugetlb: refactor code around vmemmap_walk")
> Signed-off-by: Yili Zhang <zhangyili01@baidu.com>
> ---
> mm/hugetlb_vmemmap.c | 3 ++-
> 1 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/mm/hugetlb_vmemmap.c b/mm/hugetlb_vmemmap.c
> index 0057fa2a16a8..3a759b930ed9 100644
> --- a/mm/hugetlb_vmemmap.c
> +++ b/mm/hugetlb_vmemmap.c
> @@ -499,6 +499,7 @@ static int __hugetlb_vmemmap_optimize_folio(const =
struct hstate *h,
> {
> 	unsigned long vmemmap_start, vmemmap_end;
> 	struct page *vmemmap_head, *vmemmap_tail;
> +	gfp_t gfp_mask =3D GFP_KERNEL | __GFP_NOWARN | =
__GFP_RETRY_MAYFAIL;

Thanks for fixing, but I realized that I've already fix it here [1], and =
I didn't
realize it's a real production issue. If you don't mind, I could add =
your Reported-by,
and make it a very small fix patch so that it can be backported more =
easily.

[1] =
https://lore.kernel.org/all/20261104023510.260766-5-songmuchun@bytedance.c=
om/

Thanks,
Muchun

> 	int nid, ret =3D 0;
>=20
> 	VM_WARN_ON_ONCE_FOLIO(!folio_test_hugetlb(folio), folio);
> @@ -525,7 +526,7 @@ static int __hugetlb_vmemmap_optimize_folio(const =
struct hstate *h,
> */
> 	folio_set_hugetlb_vmemmap_optimized(folio);
>=20
> -	vmemmap_head =3D alloc_pages_node(nid, GFP_KERNEL, 0);
> +	vmemmap_head =3D alloc_pages_node(nid, gfp_mask, 0);
> 	if (!vmemmap_head) {
> 		ret =3D -ENOMEM;
> 		goto out;
> --=20
> 2.27.0
>=20

